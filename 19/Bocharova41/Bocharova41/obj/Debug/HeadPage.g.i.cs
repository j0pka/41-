﻿#pragma checksum "..\..\HeadPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "744375C5E1A4EA0B4F673976AF069F937A0226BCBB91EF2A411BB6FF25F08ABD"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using Bocharova41;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace Bocharova41 {
    
    
    /// <summary>
    /// HeadPage
    /// </summary>
    public partial class HeadPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 21 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock FIOTB;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock RoleTB;
        
        #line default
        #line hidden
        
        
        #line 34 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ProductsCount;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ProductsAmount;
        
        #line default
        #line hidden
        
        
        #line 41 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxSearch;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton RButtinUp;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.RadioButton RButtonDown;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ComboType;
        
        #line default
        #line hidden
        
        
        #line 61 "..\..\HeadPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView RazmerListView;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Bocharova41;component/headpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\HeadPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.FIOTB = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 2:
            this.RoleTB = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 3:
            this.ProductsCount = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 4:
            this.ProductsAmount = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 5:
            this.TBoxSearch = ((System.Windows.Controls.TextBox)(target));
            
            #line 41 "..\..\HeadPage.xaml"
            this.TBoxSearch.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBoxSearch_TextChanged);
            
            #line default
            #line hidden
            return;
            case 6:
            this.RButtinUp = ((System.Windows.Controls.RadioButton)(target));
            
            #line 45 "..\..\HeadPage.xaml"
            this.RButtinUp.Checked += new System.Windows.RoutedEventHandler(this.RButtinUp_Checked);
            
            #line default
            #line hidden
            return;
            case 7:
            this.RButtonDown = ((System.Windows.Controls.RadioButton)(target));
            
            #line 46 "..\..\HeadPage.xaml"
            this.RButtonDown.Checked += new System.Windows.RoutedEventHandler(this.RButtonDown_Checked);
            
            #line default
            #line hidden
            return;
            case 8:
            this.ComboType = ((System.Windows.Controls.ComboBox)(target));
            
            #line 51 "..\..\HeadPage.xaml"
            this.ComboType.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.ComboType_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 9:
            this.RazmerListView = ((System.Windows.Controls.ListView)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

