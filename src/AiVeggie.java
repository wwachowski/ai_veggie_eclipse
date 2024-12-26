import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.text.BreakIterator;

import java.util.ResourceBundle;
import java.util.Locale;
import java.util.MissingResourceException;

import CLIPSJNI.*;

class AiVeggie implements ActionListener
{
    JLabel displayLabel;
    JButton nextButton;
    JPanel choicesPanel;
    ButtonGroup choicesButtons;
    ResourceBundle resources;
    String textField;
    boolean lastScreen = false;
    Environment clips;
    boolean isExecuting = false;
    Thread executionThread;

    AiVeggie()
    {
        try
        {
        	resources = ResourceBundle.getBundle("resources.Resources");
        }
        catch (MissingResourceException mre)
        {
            mre.printStackTrace();
            return;
        }

        JFrame jfrm = new JFrame(resources.getString("Title"));

        jfrm.getContentPane().setLayout(new BoxLayout(jfrm.getContentPane(), BoxLayout.Y_AXIS));

        jfrm.setSize(400,200);

        jfrm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel displayPanel = new JPanel();
        displayLabel = new JLabel();
        displayPanel.add(displayLabel);

        choicesPanel = new JPanel();
        choicesButtons = new ButtonGroup();

        JPanel buttonPanel = new JPanel();

        nextButton = new JButton(resources.getString("Next"));
        nextButton.setActionCommand("Next");
        buttonPanel.add(nextButton);
        nextButton.addActionListener(this);

        jfrm.getContentPane().add(displayPanel);
        jfrm.getContentPane().add(choicesPanel);
        jfrm.getContentPane().add(buttonPanel);

        clips = new Environment();

        clips.load("src\\clips\\what_should_i_eat.clp");

        clips.reset();

        runAiVeggie();

        jfrm.setVisible(true);
    }


    private void nextUIState() throws Exception
    {
        String evalStr = "(find-all-facts ((?f ui-template)) TRUE)";

        PrimitiveValue fv = clips.eval(evalStr).get(0);

        choicesPanel.removeAll();
        choicesButtons = new ButtonGroup();

        PrimitiveValue resultValue = fv.getFactSlot("result");

        String result = resultValue.toString();

        if(!result.equals("\"\""))
        {
            lastScreen = true;
        }


        if(!lastScreen)
        {
        	PrimitiveValue pv = fv.getFactSlot("options");

        	for (int i = 0; i < pv.size(); i++)
        	{
        		PrimitiveValue bv = pv.get(i);
        		String options = bv.toString().replace("\"", "");
        		JRadioButton rButton;

        		rButton = new JRadioButton(resources.getString(options),false);

        		rButton.setActionCommand(options);
        		choicesPanel.add(rButton);
        		choicesButtons.add(rButton);
        	}
        }
        choicesPanel.repaint();

        String textFieldResource = resources.getString("Result");
        if (!lastScreen)
        {
        	textField = fv.getFactSlot("question").toString().replace("\"", "");
        	textFieldResource = resources.getString(textField);
        }
        else
        {
        	nextButton.setText(resources.getString("Restart"));
           textField = fv.getFactSlot("result").toString().replace("\"", "");
            textFieldResource = resources.getString(textField);

        }

        wrapLabelText(displayLabel, textFieldResource);

        executionThread = null;

        isExecuting = false;
        
        clips.assertString("(clean)");
        clips.run();
    }

    
    public void actionPerformed(ActionEvent ae)
    {
        try
        { 
        	onActionPerformed(ae); 
        }
        catch (Exception e)
        { 
        	e.printStackTrace(); 
        }
    }
    

    public void runAiVeggie()
    {
        Runnable runThread =
                new Runnable()
                {
                    public void run()
                    {
                        clips.run();

                        SwingUtilities.invokeLater(
                                new Runnable()
                                {
                                    public void run()
                                    {
                                        try
                                        {
                                        	nextUIState(); 
                                        }
                                        catch (Exception e)
                                        { 
                                        	e.printStackTrace();
                                        }
                                    }
                                });
                    }
                };

        isExecuting = true;

        executionThread = new Thread(runThread);

        executionThread.start();
    }

    public void onActionPerformed(ActionEvent ae) throws Exception
    {
        if (isExecuting) return;
        
        if (lastScreen)
        {
        	lastScreen = false;
        	clips.reset();
        	nextButton.setText(resources.getString("Next"));
        }
        else
        {
        	if(choicesButtons.getSelection() == null)
        	{
        		return;
        	}
            String assertion = "(" + textField + choicesButtons.getSelection().getActionCommand() + ")";
            clips.assertString(assertion);
        }
        runAiVeggie();

    }

    private void wrapLabelText(
            JLabel label,
            String text)
    {
        FontMetrics fm = label.getFontMetrics(label.getFont());
        Container container = label.getParent();
        int containerWidth = container.getWidth();
        int textWidth = SwingUtilities.computeStringWidth(fm,text);
        int desiredWidth;

        if (textWidth <= containerWidth)
        {
        	desiredWidth = containerWidth;
        }
        else
        {
            int lines = (int) ((textWidth + containerWidth) / containerWidth);

            desiredWidth = (int) (textWidth / lines);
        }

        BreakIterator boundary = BreakIterator.getWordInstance();
        boundary.setText(text);

        StringBuffer trial = new StringBuffer();
        StringBuffer real = new StringBuffer("<html><center>");

        int start = boundary.first();
        for (int end = boundary.next(); end != BreakIterator.DONE;
             start = end, end = boundary.next())
        {
            String word = text.substring(start,end);
            trial.append(word);
            int trialWidth = SwingUtilities.computeStringWidth(fm,trial.toString());
            if (trialWidth > containerWidth)
            {
                trial = new StringBuffer(word);
                real.append("<br>");
                real.append(word);
            }
            else if (trialWidth > desiredWidth)
            {
                trial = new StringBuffer("");
                real.append(word);
                real.append("<br>");
            }
            else
            {
            	real.append(word); 
            	}
        }

        real.append("</html>");

        label.setText(real.toString());
    }

}
