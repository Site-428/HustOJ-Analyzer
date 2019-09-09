using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using System.Windows.Interop;
using System.Windows;

namespace WindowSystemMenuManager
{
    public static class SystemMenuManager
    {
        [DllImport("user32.dll", EntryPoint = "GetSystemMenu")]
        private static extern IntPtr GetSystemMenu(IntPtr hwnd, int revert);

        [DllImport("user32.dll", EntryPoint = "GetMenuItemCount")]
        private static extern int GetMenuItemCount(IntPtr hmenu);

        [DllImport("user32.dll", EntryPoint = "RemoveMenu")]
        private static extern int RemoveMenu(IntPtr hmenu, int npos, int wflags);

        [DllImport("user32.dll", EntryPoint = "DrawMenuBar")]
        private static extern int DrawMenuBar(IntPtr hwnd);

        private const int MF_BYPOSITION = 0x0400;
        private const int MF_DISABLED = 0x0002;

        public static int RemoveWindowSystemMenu(Window window)
        {
            if (window == null)
            {
                return 32;
            }

            window.SourceInitialized += window_SourceInitialized;
            return 0;

        }

        static void window_SourceInitialized(object sender, EventArgs e)
        {
            var window = (Window)sender;

            var helper = new WindowInteropHelper(window);
            IntPtr windowHandle = helper.Handle; //Get the handle of this window
            IntPtr hmenu = GetSystemMenu(windowHandle, 0);
            int cnt = GetMenuItemCount(hmenu);

            for (int i = cnt - 1; i >= 0; i--)
            {
                RemoveMenu(hmenu, i, MF_DISABLED | MF_BYPOSITION);
            }
        }

        public static int RemoveWindowSystemMenuItem(Window window, int itemIndex)
        {
            if (window == null)
            {
                return 32;
            }

            window.SourceInitialized += delegate
            {
                var helper = new WindowInteropHelper(window);
                IntPtr windowHandle = helper.Handle; //Get the handle of this window
                IntPtr hmenu = GetSystemMenu(windowHandle, 0);

                //remove the menu item
                RemoveMenu(hmenu, itemIndex, MF_DISABLED | MF_BYPOSITION);

                DrawMenuBar(windowHandle); //Redraw the menu bar
            };

            return 0;

        }
    } 
}
