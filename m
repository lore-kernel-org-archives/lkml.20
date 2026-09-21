Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237054A6881;
	Mon, 21 Sep 2026 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999268; cv=fail; b=D/AjfhCtKDQeddclF1JSxtxjjNsEF7MCsWFj7Ew0VmtQM+i+SQMsH7r32eDOse02ELobJBm0zFK4EpdNeBn1YMHSq3IGid9IDqMAozqqZJzJ5k59CjEpIDJJIUJyBeB4WxbOiOtvamAv9Ho3M8sx0G85yvSZARlzSWuk1rTSHRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999268; c=relaxed/simple;
	bh=McLqglvk6GSlHn/HRnz5k5CAW7gd8NUsuzgD7pJfAF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mUDCQpwu4Dt/1nGdAebKscff04WPwVFWc6lSm/T6bVAmkMwC0vks+a6ID05Xl8necLHnKbvY4oavdNEU87wJC+jWvR94UwFKA5LWtYuqD3kGZDvwYNEnqKge5QDpXhYZSP1cGqZGNXvjWo0/kYAVsRRYFle5KlWq4K1Rj6IfRpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=SzbprEY7; arc=fail smtp.client-ip=40.93.194.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="SzbprEY7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZUnpc9WWf+bEvVDPVofVaclN4BYAWlZYi1zipzQoCGbByrkzCFLdjuPZJFLuttJRsFAqSII36qXd/mVZonI5NPdjFWTN5NsrGf5RKa3gOBV5u5H7v9yku5uHgJjrXQ0EKr258e1CiVS5heszUpX4vLy13IELywu0SWnovAiDbrX8fstUH3iP0lHAPLKyWtsw5sLP0unFXc8wuKr9KS43CuVzHU8WSoq3/90/B/Q4aqxpz1aPp4rfwUUYKTs8JNMkMW8/y378d32wTI+LJYD/D+wDohL2mjBkI6Fk9FWsUj+Z+Q0DOAQquPcKiVSMVvoqbyt4HYeRupoAyMCaBoiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53xn14TP7xCb3BFVnH+3iAKDhtfYPYMyxu4m/2j58n8=;
 b=LIVhajhEeNqVL6wUL5XJR8DlJRLEw1+wJETO1v3ouWbm3SGiNvlcmfHO5ZrWb/1xFSUZo/ANMy8wmWupKU5HVcoExBzmcqRnVkfMpzGCIpz5RDMG4EHdI1PNR01FsdXnlsOxwk2OkAh7PbSpm5p+AaWp5EBQ9veVoClMokQBc33mLS5eo9csL5kXWrdMZ/e6OROl36cUZQ989VYHFXUP7uLKOssQPCpd1qldi4afdgSjXaIAApOzc0j1t3gyN2Ml2gyZskzyXnITYxdMdUun8nnJzMB0LgBElWDVK0oZG13LPIZWUSbAEzpv0agp5i28LJ72YC3/re3ymjlSu7yxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53xn14TP7xCb3BFVnH+3iAKDhtfYPYMyxu4m/2j58n8=;
 b=SzbprEY7oJGYU+WCKwEkTQlRYYLGRQa+7a31c/FLb2MP3i7OEvdO8F5CweThBCi7kFidxe6BZOTwajxfuHydiXOGijfhvss2Sa3h7kv0aevBtOHJh7StsDQylfpOJJEKVmh9fr0EKZxvWsxPIouLvQBVr5kDsUsEynzhueRbS4aHugn1ASxcDnwjPWg6FqxnZbhPDthfQJP35Vu5CSUNKaMx6ODE/+iRQJqDggELfjn2/UdNsWbtukmDh426YmXQ4W/gdfzThLo6zFjDehId3IMNKyPc+7LN7AO4Dvi/tcJfXfZuNDVIrY/K2AO4+VGq6lJXelWhKuG+9SIwsrq2ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by MN2PR03MB4973.namprd03.prod.outlook.com (2603:10b6:208:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 14:00:59 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 14:00:59 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v8 1/2] arm64: dts: intel: agilex5: add USB3.1 controller node
Date: Mon, 21 Sep 2026 22:00:34 +0800
Message-ID: <b8c38fcad7dfd17b23d1de630184ed614a2e6191.1789998962.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1789998962.git.adrian.ho.yin.ng@altera.com>
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com> <cover.1789998962.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|MN2PR03MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b02dfc-df15-4eb5-e273-08df17e8c3a9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|10067099003|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JSnnvBa+kEexTzAnoyfAwxI+RXhPioVRot2clMh3nNUKh0qcyrbZJ5QIOqMIgb3CBrOHbnRCLU8ow/Xl0t/rLzzEHOD2CJT/cJP0xsdUdGuaOe9ixSASwW3ymyUOTNBWnn2oMSDs12PJHbvy8knQrGxsZEOKRNjBbmuIY6Q68MIR/k6ClZdE+5bAtO4yCMFntmPWaT/UfN7+7pkAH1zlIkIpEPJgFlKtFYYJrdUaPaF20K31cGmGFOYjyZHXMHEjV5rsGPLV5TdcqTtUNZQWsABwwksurGbba9APHxM7QNqErt4Rv8oeUtRYs/b2fICBPoFcYRKefkP7SOlV6Ga+uMGuieN6UO2WcNM6w0St0Yz2xJa7J/8B4A5vQG8LKTdD1ccUpn1ytxmHBIHB19l+qYK+vOhVm7pXdgB1SkbGTnofL3X9lrpHDCPxU0in0kv5LzvDZja7jwFliT9aaDxUtBDEogZ+hCMHAnLrb2mzjhV665tAO+2yV1+0gNsmfSId+aswB0XgepuJf/3yIZbVMFPgorC33slqTJbH8qrP5tzUNHBfSRTTK/Yfq4AP0Ws2rLsIXF0NHkM7aLuNPhsmThBoKXoHn4QIMG8hv65rTwDVQpiK9BHGmvlQ4tgS9bDOkA4R9Ag4Hm755QWkQAdT5erBqDyiqs51yoB6zJqZzWg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YhdRXXP342xlNWsklXMZVHbnMTbfevL7tely4fIl64JV4JoVsTCxRlGpJG5v?=
 =?us-ascii?Q?9yXyb2NzA9iaDgslhi/wuSUG1k/BYLwT207W58yeI09mG0xjGrmtrBASH8YH?=
 =?us-ascii?Q?QUjIx4uPghvRLmmaPjtsQ7uf2N+lCMM80svnNKT5NFK5DG0bEXwMkR24Q/PH?=
 =?us-ascii?Q?GVkZ7u1PDhIAARnDO19iSh9vjVnSmSkeSBpw63T+RuN79nFVkSuWdv/GPMaV?=
 =?us-ascii?Q?M3QygRqE/CCG7ijfxLOUs3Mgs2ZvURiJ0X4xdtkAo4MrZWmHqArDXuxvFLTl?=
 =?us-ascii?Q?1j/eE70QfJpECZBwyv2Dy2UOj/x+D1Fbs8dZZYylNnn1uiC5DB5McRNwIQ2u?=
 =?us-ascii?Q?UpcxuyyDwp8rFZhkHSQYsXOviySt9L+wJa6odnPW6GR/FSz0jwWPK/QLeeQH?=
 =?us-ascii?Q?d17bRVxs7Mi/JA9sh/l+r+Hj1M3T/emPFlLk/9Job+ISlekc85R6wRhDoGSv?=
 =?us-ascii?Q?ORJkI5ygKkvfsuCQRcgSwcDeaOgfqhHIbE6EGebjJzfgvFoiQf+NU8gMJh2z?=
 =?us-ascii?Q?2xMfTe5rtPk4TEipxDyQG8jush8QHpZj9rIvFxy/UBUFVXfWkkr35KPJnsn2?=
 =?us-ascii?Q?0jBYbuqoyxKVg3TBbXL3vQe2g4HlpOqt9iUIBy6ipo8XyZ3YWSgqdj5/1KVk?=
 =?us-ascii?Q?TIeNJ//MxTXMMh5muaOpfpDzLpT4eeJyjagPKJSCGsV3uYt6uvHuSyYbm6Ls?=
 =?us-ascii?Q?fGYVIItdhxBHb+KD6PqbExGuwYsn6+MFzd8tOQllE3/2h5ue/1alP9dksOyi?=
 =?us-ascii?Q?a6iXkpHGGUIWiqmsxygLeFt/OU/PeiXxlzPmjIgfybGxCi6DslP0fSyPjWMt?=
 =?us-ascii?Q?mVrMlQUQda6GQ5jyliJhlsq4aDBG5T//YwoJVinbJAVnvx6GoyhvRtTirU4H?=
 =?us-ascii?Q?/R08fFg0TMxmQied9yWmOjLj0DCDCmQT39SWLZrrFqTBJ9rZUZXk21Y4Mgaf?=
 =?us-ascii?Q?vCd1mNBhIZfZ8+FAndE7CZ/CoI3le6NAoi/obNNW2ccmkXOVfo/IUjGOoeRc?=
 =?us-ascii?Q?InzJeHTD3ttcogdDVedsmcwuaJ6v0HMA1A4TKCCz8IKhZfcHWZmNrjUjK5ZK?=
 =?us-ascii?Q?bnQIXgcPmnf85HMZh9+MV3e9fO7Efdwztj7jUNPISVZ4rVYXEy4JqlK9UQSX?=
 =?us-ascii?Q?3gSM+25WYifSIbLDYs2uuPRvXplsXNtj8zrJX9cYFTeCohummVfe2StLrGgM?=
 =?us-ascii?Q?Vxzf9vljQkWukA5FyHXuRWxYgVHySMxNZB3R8/UiFuc/3hxgsevKCV3BGiK6?=
 =?us-ascii?Q?R/2/lA1CZPHMb7AkD3hodsR39sa0iTl2BjggDU5nclYIwnCD0E64EVdutA7r?=
 =?us-ascii?Q?D+mOkr0Gw+Xts4XXLqoS/6/hNdLQ0QKypsenHNDa/0hFcj9z2/yZCTFCqjmo?=
 =?us-ascii?Q?9tBcIut8k3NlxeDQ36y4GHZnEac7ScMGdAdo4k1kfaRvDVCoRsXVS4LNX1hd?=
 =?us-ascii?Q?th34eiwGP/f3FoZ1Ug1D408fm3KVA508C27+sIRn47dSxjng+j/mVonT6xxN?=
 =?us-ascii?Q?MrGyxt0rSSMsIihzmXf5w8ZXwaC34bV56QZlLc7UvPtmeIcKuIKIqGhM9Cz0?=
 =?us-ascii?Q?0go7DDX24Bjl+AXGdKucTGEOQEQUrXeRJ26CsgrtFSfWrUxwtqOqgqA4xhw3?=
 =?us-ascii?Q?ABEoRyqdyZ2BOftylSnbYTJL6C3PoHuX+k2+sLx8XbQetiG/h7OcxWElxvJk?=
 =?us-ascii?Q?gvXUNzlcWTDLUwr6IdDhUqAcPOQ0xmwTPLr2jSGvLo7HdOnEAq4lXAU687Rx?=
 =?us-ascii?Q?/Y9eH1uIYRdX2u4XtgiNVrP54hdmyKo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b02dfc-df15-4eb5-e273-08df17e8c3a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 14:00:59.4808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxEFiiEXt1Ox961LqSFNXAMkpYFYdVXagh7vkrvPt1+OjIkDU/vYEyKsOnQ/5xJR9OWPCWV0AdoMwiNIipoAa3QxaLnuVM1lSOGIxUb5oEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4973

Add a DTS node for the Synopsys DWC3 USB3.1 controller on the Agilex5 SoC.
Place it under a simple-bus with a 40-bit dma-ranges window (#address-cells
= 2) to match the USB DMA address width of the interconnect. Enable it in
host mode on the SoCDK board.

ref and suspend both use AGILEX5_USB31_SUSPEND_CLK because they share the
same hardware clock source on this SoC.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
changelog:
v7->v8:
* Rename simple-bus wrapper node from usb-bus@11000000 to bus@11000000
  per Krzysztof Kozlowski review (use approved simple-bus node name).

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 35 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  5 +++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index f54767d1526e..63a8f8f0c5c3 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -493,6 +493,41 @@ usb0: usb@10b00000 {
 			status = "disabled";
 		};
 
+		usb31_bus: bus@11000000 {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x11000000 0x0 0x100000>;
+			/*
+			 * USB interconnect DMA is limited to 40-bit addresses
+			 * (1 TiB window from 0).
+			 */
+			dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
+
+			usb31: usb@0 {
+				compatible = "altr,agilex5-dwc3";
+				reg = <0x0 0x0 0x0 0x100000>;
+				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				/*
+				 * ref and suspend share the same hardware
+				 * source; reuse the published suspend clock ID.
+				 */
+				clocks = <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
+					 <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+					 <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
+				clock-names = "bus_early", "ref", "suspend";
+				resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+				reset-names = "core", "ecc";
+				iommus = <&smmu 7>;
+				phys = <&usbphy0>, <&usbphy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				maximum-speed = "super-speed";
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				status = "disabled";
+			};
+		};
+
 		watchdog0: watchdog@10d00200 {
 			compatible = "snps,dw-wdt";
 			reg = <0x10d00200 0x100>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 1e9b87d96765..aa9294494421 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -109,6 +109,11 @@ &usb0 {
 	disable-over-current;
 };
 
+&usb31 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &watchdog0 {
 	status = "okay";
 };
-- 
2.49.GIT

