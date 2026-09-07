Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126244065D;
	Mon,  7 Sep 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769760; cv=fail; b=p2mgED85IA+R/ifpyHuUxBbANVBA9N0vM8Gofl1BbbXSEfnSdI1Y9IgsnEHJsoe+7YZOGrlsLEYubICT2fM1BkOuZHhcag9P7GkaAfu1hm8rMjVAucmHRj0DOkqsuXFsbYLE5Y82VfwshVITZwDYqxBwmAuiH79SrJZ+naOr5Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769760; c=relaxed/simple;
	bh=H9CY1GNb/L7OUTtls/OS1/s2YcH7YS2eRQotcQMp45g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nVxWYInAKK3gf/fMMSFFUq7Q+MgJq6VdhCto2BdMi6+h27EhzYSSjlgtZrujvihZpiQhkoKd8PxiWqkFXYcw6Y0xzDCJSONFbdxs9rj0aOugMbAKL+khfazJsqjCrhOsYTcMwebqMGNACiLb9F2Knm71fS57s28Kye2DGBJVEgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=KsPHDJP0; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="KsPHDJP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbsAI0JlvJQqCBTK85l4TxInBHTmOz5CWfma6KRIaXT9uWQ1DedbKx/7hUTCinsfD7KDpBG1PRHPorfngIOxLxyVWHdqog3vT7H9c7rgdcfJtA8bWYNsC2bSzPwyevUvOox1Ym6HaO22wvWmG7s6TG+MwiGfXOE0JApsbelSWlnZZTZ27DTPuYDgX9WB5eTjsu/AmwXiPw0KAKnEfpX4ssw8sg7DHOgFuXbUJEdmpxIl/2uWamsCQq1A4Xml2b6jNNSv+lOZEeophtMlAYovrc3+B1k1HgFr2R9ErTQ4GaOOZBdNtNEVxn0rgn7/MCE0riDYyriuy46tpvbDCAvb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXnz/Ass51Rh16gWTeqXy7Mn5Q/ea2gDCJpwbYBZzDs=;
 b=eFVCmwvoOVCA4JL3/QXr8naYqs1PNyqP+GisfkY1lrN/QhyolJqojLGqOu4jbLshwBUzYw8spl9XycxZsMFzPQQYglQ7i9/bjm4sud3GqcFf4H4OP0lfAf+f3UHCIbp0aauQkvVJsUJ7kvB/iuMKK5mq7uBd35YdbuvZFtx1dv1QgVRqhzukXxXOhlnxdgHtVzDq+/cVVZmLC404CvnX6M0zN/iIcMkJr00HuK86uY0JjsBEGkQnep03NK1EP2//xWxKdowO+1DVJ9N5Hz3pPw9BIVF5hWXcL1IFK84GGntmZ9jYvI08OwiOhKqJkGvRkPyIHsVOXqsZZgIrAVyqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXnz/Ass51Rh16gWTeqXy7Mn5Q/ea2gDCJpwbYBZzDs=;
 b=KsPHDJP0yMmUWB7/Xja+3XigC2fRc+P7k6aQLYYJNdtoX5JQ9PA3iw8ShY+nLs68mwKLFMvFCWXzyd9NLnOIAw+ToZE449h3rRP8ZrvJLxRS/kWVeP2Rn75ZM8WAo4tpZPGpEQe61ylOZPRdln3oBn/zLX2Bqq20MRUSvtH4n2rV1a0cVsGgpDGqGuXSLUed3bdCVCcHk2Ia7uXiLkXbEZLwDXDaWv+LSLcupSOvqDiAe5yIbqK7xcraufY7hxWeKZ+y8CWav3opEL/MmBGjFY26NyiwvrnOSpFV9MJKqySJB2z/sm34dl7pHZn6cuhUyvPk6ZFUWfuBKcj8xoFycQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5777.namprd03.prod.outlook.com (2603:10b6:303:9c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:29:16 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:29:16 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v5 2/4] arm64: dts: intel: agilex5: add USB3.1 controller node
Date: Mon,  7 Sep 2026 16:21:39 +0800
Message-ID: <5c33bd732d48b280d6a45783c7c84d57ea778b4a.1788757821.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788757821.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee681f5-c23d-42d6-46b6-08df0cba1a71
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	1mi47He57Bq6iq8mjSS1dV2mS0Z17oO6GvoejzJxXZKHB/0uI1ppambUEet61/bM/E5I6nwm49zbaP8tuHIvWE3fpPv5egKYddBAgyAc3anPO48oNZhhYX5y9C27uBcjdFpW/WXs7kjKWjHc/vTTmXw0O60GA2RdfWKCBKfDuWRV6YW/M4/pFrWQ6xFhFjciBYLhrb7YwJfgwl5sLIAZIjYa9B0eakMm3MuVcu6UXHt/BbITyR5YGvBWhiPbTboxwoYTVGjpFS4zJLb3BTNPy3UrF8QAJ18X2B4p2pFzdXbBEpOVK28Ldc7zOi03ryrxiyQUhB8SqSE/lMVtKrpcDGxz04fkerE1PGfZE6WDfAfZq2Td2p7g8LgboW7eoY8GCLtZeoejzwUa/TM4y97rMvRoJEqDa2CaEJYuVof0fGFmDjHH3chBtcq1AQtbHx/4jjkHcnFH8H2GWaf1pFtyK49iH06yDH8TTJdnBLkpjejE1jWG3i9RxJCW/1Pd9JGVzpbmcy3G5y+FVpSaQpo9kyoQ9kkk3OoHURDeJ2cF6bBjL7PTKgtUimOGKDwqi+4rmDPe+xUpE8Dw6mr4S/B8UQndlIt4I27ZGtnQl13a4QWJvud2ogDR2W6R8Ot4JbFUYaxSqKkyEzDgdhrDx9McEHCN/w7tVzNK/RiZNf+MH1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qli+Ra1r3p5KB5Pe5ZF18CiuTivD7XX3n5ZGN/KM9QYA2oQuWLa7IoYrrYV/?=
 =?us-ascii?Q?YiRCoxt8xU+ATKMJKdOIcFAmUkLP+b2/xyhTRGCIP6GxabQy+5aO8rnJW0yA?=
 =?us-ascii?Q?oMrwH6f2pKBAvQVeXQGAS8exb2+FrsPlZ3fazphO6g5tQ2k+7eUP2DDnl/kW?=
 =?us-ascii?Q?OX7kwxTWjMtkvmQiXzzDhzN7d3aHSdubw8t9SJDQ6PhBDmUHwsYZ5T52W/pq?=
 =?us-ascii?Q?KxrFJ1HK3UtGPMOnrFprkEQi3pWKcHUW3ToTpn/ze4UCjSGMzateKlCA1xKj?=
 =?us-ascii?Q?Bq6obLveKFsZ9/cp4UPEA4u2RzkMeUF/TiC1Ax87N/FcwTQb4DfaL8BR+DhU?=
 =?us-ascii?Q?ujAuFC6HQqRtzZhim80Qk6w7zS5uDnWXasn/EHu8lEvt9i2+TcIzDQ9FIVGi?=
 =?us-ascii?Q?CaJ3/5DnzTx6KrF++qJK8eKnyWv8WqRbfKPMjhevhdhkagadG2br5NsDOOR2?=
 =?us-ascii?Q?w2XE8dqk2xyAuZa0FWn4FbVxkS4a1tqEBFItNVGVS86t2SkrVhm45LTZElrC?=
 =?us-ascii?Q?KDl1Ah5lJTy5OXziswNVBRIV5ScggXg2X0nopUM1ApCB43ajNcMDBLqBcVNz?=
 =?us-ascii?Q?YWDJDCzc0OIVOudWLqHCgjXQLpfh+Q2NdEzPYFmGwMTbknmEqganXneaOFLu?=
 =?us-ascii?Q?lvSm4Ga9Zx5sPiSw+tcTIoM6rse8jVBdNhHTkGz7LtYNU20F0t+Ea26YFKCt?=
 =?us-ascii?Q?rKrBSXzfb+mTJwPwtXQB8lAheC175WK9xSpvEbSjJ1cxDiPZ0Y6tcX0CrPd6?=
 =?us-ascii?Q?qfM/wIpVOc3VO+8n5N1fiDezPVEsx96oB0B27PmJr/TyuIuPUqbkZtkV4uGe?=
 =?us-ascii?Q?qXD+lLmoZI6JRtoq0XfVmQ6NauCLyOv7tqyYzE1QA20F7ieI5OvU8v486EuO?=
 =?us-ascii?Q?DkyXhcNB1uOCWMXQYLLu1F4ediVnZTq/uezKeuE6Cfe/rR3IDaJ3DKzh+VWC?=
 =?us-ascii?Q?zhowgDX0Vbs1dunten/ceMG2qu9lecM6qnbWlxNZXe8GNMqtwlRRSE1mpeeY?=
 =?us-ascii?Q?GVjZkafxgL+RsPRtGFcjKl3gu+Sa5hO0cGAAorti03W36h0ZNIZNNlyFDORt?=
 =?us-ascii?Q?0TFmVAkT3vFZkq6YXFwOtxemrh3eA3mSTqEbQlPeXk6IsIlIohKxQuEZxT9x?=
 =?us-ascii?Q?2/QlI7O8LA+fntB/B213eZzQz1mttRxz0/Dhn/Y/KPGyfDvp2xOHqgkbcxn0?=
 =?us-ascii?Q?zqKtUxBwDyxABGW/MtiCJoV3rQkYLfgZ8fCnBP1bsPTGmnw4kwqTiH8aM0vU?=
 =?us-ascii?Q?VjSUjfVuKY7gSSgdWFhO5V+K4AcS54AgrSIQnzkWVB9osY4Du+RcF/ym2UeU?=
 =?us-ascii?Q?j50vtpZmg3FIeUp+sxOZSTwkSqdaPIQqoIFJ+8veKZlS33GdGD2kRDbZD/CT?=
 =?us-ascii?Q?q/DpYpJqwm/J55tDFeHgUFspV2LPOslFKBsAs8geoCJ7jA22qydXHcAIYqB1?=
 =?us-ascii?Q?0STyNNbn/bmW/X1tIhFfGeWsMMtgpmRRbxYwaJBQsfghSfunHmPyX1DcU9kV?=
 =?us-ascii?Q?guTTcCGx6xvYrAqOUiRv0WDf/LR3U2YVVJGmaWzrl3NqiVBED/kZo9QYX4n7?=
 =?us-ascii?Q?zDkR5cg+tgqCBYNSPFqIM6xnHa/Y1NJJ3OpqTQvQQnuQBHyscbXzn2Itve5N?=
 =?us-ascii?Q?W8+s/R5X40hwGYnQY1evdMW/J37aa7Nv+f3/lGa0BNjjhEVBEzThdGumHslU?=
 =?us-ascii?Q?qQqSNfZPAvLo1JqY3NGJZtFK2buG0lFYtl4q0Almih8tH1ilYQP6lrHqcx7G?=
 =?us-ascii?Q?4hPujgXOIMSJL90ZqGGKLZocWXtwwBQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee681f5-c23d-42d6-46b6-08df0cba1a71
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:29:16.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMl+RRjNFzPsWmB3PzHMbFwQznPm4eKZqOUijxLX/2VSLa2X1EOitGHpiWQVZbwkA2JfTa4ZtADaMkVKHuuJCgn/9dWEWbzsd0HSEZmd36c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5777

Add a DTS node for the Synopsys DWC3 USB3.1 controller on the Agilex5 SoC.
Place it under a simple-bus with a 40-bit dma-ranges window (#address-cells
= 2) to match the USB DMA address width of the interconnect. Enable it in
host mode on the SoCDK board.

ref and suspend both use AGILEX5_USB31_SUSPEND_CLK because they share the
same hardware clock source on this SoC.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 35 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  5 +++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index f54767d1526e..523f722a2a64 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -493,6 +493,41 @@ usb0: usb@10b00000 {
 			status = "disabled";
 		};
 
+		usb31_bus: usb-bus@11000000 {
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

