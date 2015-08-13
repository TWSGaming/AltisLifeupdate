class Life_atm_management 
{
	idd = 2700;
	name= "life_atm_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[""kontostand""] spawn life_fnc_atmUpdate";
	
	class controlsBackground 
	{
		/*
		class Life_RscTitleBackground:Life_RscText 
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.7};
			x = safezoneX + 0.2 * safezoneW;
			y = (safezoneY + 0.2 * safezoneH) - (1 / 25);
			w = safezoneW * 0.6;
			h = (1 / 25);
		};
		*/
		class MainBackground:life_RscPicture 
		{
			idc = -1;
			text = "images\atmBackg.paa";
			x = safezoneX + 0.2 * safezoneW;
			y = safezoneY + 0.2 * safezoneH;
			w = safezoneW * 0.6;
			h = safezoneH * 0.6;
		};
		
		class MainBackground_2:Life_RscText 
		{
			idc = -1;
			colorBackground[] = {0.5, 0.5, 0.5, 0.3};
			x = safezoneX + 0.25 * safezoneW;
			y = safezoneY + 0.275 * safezoneH;
			w = safezoneW * 0.5;
			h = safezoneH * 0.45;
		};
		
		class MainBackground_3:Life_RscText 
		{
			idc = -1;
			colorBackground[] = {1, 1, 1, 0.5};
			x = safezoneX + 0.315 * safezoneW;
			y = safezoneY + 0.275 * safezoneH;
			w = safezoneW * 0.37;
			h = safezoneH * 0.45;
		};
	};
	
	class controls 
	{
		
		class MainText:Life_RscStructuredText 
		{
			idc = 2799;
			text = "";
			//colorBackground[] = {0, 0, 0, 0.5};
			x = 0.17;
			y = 0.12;
			w = 0.64;
			h = 0.15;
		};
		class Button_1 : life_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			onButtonClick = "[""kontostand""] call life_fnc_atmUpdate";
			
			x = safezoneX + 0.2 * safezoneW + 0.02;
			y = safezoneY + 0.2 * safezoneH + 0.2;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_1:Life_RscStructuredText 
		{
			idc = -1;
			text = "<t align='center'>Kontostand</t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (2.5 / 25) + 0.001;
			y = safezoneY + 0.2 * safezoneH + 0.2 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		class Button_2 : life_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			onButtonClick = "[""einzahlen""] call life_fnc_atmUpdate";
			
			x = safezoneX + 0.2 * safezoneW + 0.02;
			y = safezoneY + 0.2 * safezoneH + 0.4;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_2:Life_RscStructuredText 
		{
			idc = -1;
			text = "<t align='center'>Einzahlung</t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (2.5 / 25) + 0.001;
			y = safezoneY + 0.2 * safezoneH + 0.4 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		class Button_3 : life_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			onButtonClick = "[""auszahlen""] call life_fnc_atmUpdate";
			
			x = safezoneX + 0.2 * safezoneW + 0.02;
			y = safezoneY + 0.2 * safezoneH + 0.6;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_3:Life_RscStructuredText 
		{
			idc = -1;
			text = "<t align='center'>Auszahlung</t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (2.5 / 25) + 0.001;
			y = safezoneY + 0.2 * safezoneH + 0.6 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		class Button_4 : life_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			onButtonClick = "[""uberweisen""] call life_fnc_atmUpdate";
			
			x = safezoneX + 0.2 * safezoneW + 0.02;
			y = safezoneY + 0.2 * safezoneH + 0.8;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_4:Life_RscStructuredText 
		{
			idc = -1;
			text = "<t align='center'>Überweisung</t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (2.5 / 25) + 0.001;
			y = safezoneY + 0.2 * safezoneH + 0.8 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		class Button_5 : life_RscButtonMenu 
		{
			idc = 2710;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			//onButtonClick = "";
			
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55);
			y = safezoneY + 0.2 * safezoneH + 0.2;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_5:Life_RscStructuredText 
		{
			idc = 2711;
			text = "<t align='center'></t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55) - (0.5 / 25) - (4 / 25) + 0.002;
			y = safezoneY + 0.2 * safezoneH + 0.2 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		class Button_6 : life_RscButtonMenu 
		{
			idc = 27201;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			//onButtonClick = "";
			
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55);
			y = safezoneY + 0.2 * safezoneH + 0.4;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_6:Life_RscStructuredText 
		{
			idc = 27211;
			text = "<t align='center'></t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55) - (0.5 / 25) - (4 / 25) + 0.002;
			y = safezoneY + 0.2 * safezoneH + 0.4 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		class Button_7 : life_RscButtonMenu 
		{
			idc = 27301;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			//onButtonClick = "";
			
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55);
			y = safezoneY + 0.2 * safezoneH + 0.6;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_7:Life_RscStructuredText 
		{
			idc = 27311;
			text = "<t align='center'></t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55) - (0.5 / 25) - (4 / 25) + 0.002;
			y = safezoneY + 0.2 * safezoneH + 0.6 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		class Button_8 : life_RscButtonMenu 
		{
			idc = -1;
			text = "";
			colorBackground[] = {0.4, 0.4, 0.4, 1};
			colorBackgroundFocused[] = {0.4,0.4,0.4,1};
			colorBackground2[] = {0.4,0.4,0.4,1};
			color[] = {0.5,0.5,0.5,1};
			colorFocused[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,1};
			onButtonClick = "closeDialog 0;";
			
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55);
			y = safezoneY + 0.2 * safezoneH + 0.8;
			w = (2 / 25);
			h = (2 / 25);
		};
		class ButtonText_8:Life_RscStructuredText 
		{
			idc = -1;
			text = "<t align='center'>BEENDEN</t>";
			colorBackground[] = {1, 1, 1, 0.5};
			//colorBackground[] = {0.2, 0.2, 0.2, 0.5};
			x = safezoneX + 0.2 * safezoneW + 0.02 + (safezoneW * 0.55) - (0.5 / 25) - (4 / 25) + 0.002;
			y = safezoneY + 0.2 * safezoneH + 0.8 + (0.5 / 25);
			w = (4 / 25) - 0.002;
			h = (1 / 25);
		};
		
		class CashTitle : Life_RscStructuredText
		{
			idc = 2701;
			text = "";
			//colorBackground[] = {0, 0, 0, 0.5};
			
			x = 0.19;
			y = 0.2 + 0.12;
			w = 0.6;
			h = 0.42;
		};
		/*
		class Title : Life_RscTitle 
		{
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "$STR_ATM_Title";
			x = safezoneX + 0.2 * safezoneW;
			y = (safezoneY + 0.2 * safezoneH) - (1 / 25);
			w = safezoneW * 0.6;
			h = (1 / 25);
		};
		*/
		/*
		class WithdrawButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bankWithdraw";
			
			x = 0.432;
			y = 0.46;
			w = (6 / 40);
			h = (1 / 25);
		};
		
		class DepositButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Deposit";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bankDeposit";
			
			x = 0.432;
			y = 0.512;
			w = (6 / 40);
			h = (1 / 25);
		};
		*/
		class moneyEdit : Life_RscEdit 
		{
		
			idc = 2702;
			
			text = "1";
			colorBackground[] = {0, 0, 0, 0.5};
			sizeEx = 0.09;
			x = 0.19;
			y = 0.2 + 0.3 + 0.12 + 0.15;
			w = 0.6;
			h = 0.1;
		
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 2703;
			sizeEx = 0.06;
			
			x = 0.19;
			y = 0.15 + 0.1;
			w = 0.6;
			h = 0.06;
		};
		/*
		class TransferButton : life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_ATM_Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_bankTransfer";
			
			x = 0.432;
			y = 0.63;
			w = (5.30 / 40);
			h = (1 / 25);
		};
		
		class GangDeposit : TransferButton
		{
			idc = 2705;
			text = "$STR_pInAct_DepositToGang";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_gangDeposit_bank";
			y = .7; x = 0.365;
			w = 0.275;
		};
		*/
		/*
		class CloseButtonKey : Life_RscButtonMenu 
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.35;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		*/
	};
};