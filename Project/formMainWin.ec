import "ecere"
import "Regex"
class FormMainWin : Window
{
   caption = $"Regular Expression Tester of eCere";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 640, 480 };

   EditBox editRegex { this, caption = $"editBox1", size = { 486, 19 }, position = { 24, 40 } };
   EditBox editRegOut { this, caption = $"editBox2", size = { 486, 75 }, position = { 24, 96 }, readOnly = true, true };
   Label label1 { this, caption = $"Regular Expression:", position = { 24, 16 } };
   Label label2 { this, caption = $"Regular Out:", position = { 24, 72 } };
   Label label3 { this, caption = $"Text:", position = { 24, 184 } };
   EditBox editText { this, size = { 486, 147 }, position = { 24, 208 }, multiLine = true };
   Button butCreate
   {
      this, caption = $"Create", position = { 456, 72 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         char* result;
         Regex regex { editRegex.contents, true };
         if((result = regex.Match(editText.contents)))editRegOut.contents = result;
         //delete result;
         return true;
      }
   };
}

FormMainWin formMainWin {};
