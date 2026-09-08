Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D6459220D;
	Tue,  8 Sep 2026 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887538; cv=fail; b=t9fdXtT2EQbxDdqcBcelleGZDRefKJOOlHba6rQMLC0M99suVUDLGEcRJHJCAtNw8T4+WPgxzg+K5KTf9YRGwx5lff47eJKzKJjp3V4CrkGUs3uYs6dbUp4ZwvEB3xL27kvnZZo5WL7aZ5fUp2VJhJX1+RfqsV0S0O/Xog5RkYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887538; c=relaxed/simple;
	bh=H9CY1GNb/L7OUTtls/OS1/s2YcH7YS2eRQotcQMp45g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mHEw85gVum7+yZAGKdcRJV1JUMSrNlaCQTw8h4W//H23tnTEVOr4mcuHmRdxsD3PE6B1/OWYf7cq8voow5swngblsBK8ZtwCUuYqDV6Nvf1tgTwGf8f+WPOqpx5zF+Wu8/LRsYBGD67oeibjOSST4DQOpAHxoet4zFHRcoJU3g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Licx6qSq; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Licx6qSq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCiEwZElYL87gx3RMgpe7UzcosVz+HhAdpgCmzZbN7tAnGLCJi3A+7XKddSCXyFYsYvW4Id1QPaIHE3NzQcPiBfN76IORf/3+HAU0sLrp8YUiiMPs3hNZ/sb2GZryiJrToo0g+s1qoxagrfgem70tfm5LvKK5ZJR87tr70XNwOx8k19IcVwsWG0n1NDkmJ5CrHU7PbVZW5KpKcsTrEjHmyw7lEjPcF69QO/mODfyD+OIDW3UHtoSHHWxSENqus8s70Y+4x0p9KS9qbu6li7ciW46ctg3e9O1srtwJXjuZkn2vcsIh8sVUxfl5alhbwvXMdGuJThGyEIlEQvFi4/gIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXnz/Ass51Rh16gWTeqXy7Mn5Q/ea2gDCJpwbYBZzDs=;
 b=m62ZbdUGOJcZcU6aTwxU8kyczdn4GCC5NiQCxk/iGZD15e5s/Suo79GQtM9u7SIOpJEA/710B7oleDgX4IefZJOypPcEcnDExkWX9aIk08l6r3HfAF/o0rnjRhTZbUpLcdWDE7YMm/2n5RHnzfBiIzTH9KlFKBz9NSfzXOEkg6BeInEj6/anmDZeMb031896ww6dQT5NtoIY29eohrAZ5bcHbq4X6ZhMTm3JSl6e0hNfpzK1Xg830GAmzk3khXsEZrtK0MF+If3IJCHAE5mBx0iPAXuD1PCP+WhJGpxqKVZnewa2AKZq0Y6lWbn5ZPHoDa00sxXinWybvNtcVMiRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXnz/Ass51Rh16gWTeqXy7Mn5Q/ea2gDCJpwbYBZzDs=;
 b=Licx6qSqmsc4mqcqmos1hzG+A8CaT2LCFuct25GP5x3VJfP+0Z5P6P2kFE2ZVP+tVntgSQPL59tbCbJP/W+c5OmOMoQLUNjFP4Q3wLZekYP4w7oMkzNgFXwOawsYaRshD9eXGr1EZPPdyBxS8yB6LtFGnxsqr4IBF3mzwQrNWoUFf4ZP17ebd9tfdReXTvld/1gBVqXHs+2nHt+BbvPcbidl1j7X7cuwCN4KwLZpns8jsOwZU10s9w2FiSe5PKqp1Cb7eh9WiFAZJ67yMYJCFkcRd8ybHCe1ONLemvKP/CQpZ4sCf/lVpUPo7eCueuh6+N9w4OSdzdpwscA4FEkn6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 17:12:13 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 17:12:13 +0000
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
Subject: [PATCH v6 2/4] arm64: dts: intel: agilex5: add USB3.1 controller node
Date: Wed,  9 Sep 2026 01:04:38 +0800
Message-ID: <17405f3736bb2fb20456d00b7bb75ffa8c1311b9.1788886615.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:295::11) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH0PR03MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 6289c7bf-e509-4dd3-3186-08df0dcc535a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	PrkYwpT2YlfNbbEw2n7ToNdQh01soTN3T9qLCii/glQWuKid3l7Sr2+SFE0chln3Dr4jqvFlHpAl8Y04AhiwqnkfX+7706IGA2x7nNaHoh7ZiCb3p8UPqSDCOAyi3yKUM5iP0OUW5tJSLXC5H0ecYN3DaUeRLoiBvFqTr/gn6CmPxIsLLAqou9lgkjJeJ0lxl2rdxEaIxb+EtOIz0GKKEmIkDAEFI3dzxMrerwt3fdUjcayZU/Nv9FEMU5cqJuQFAGW/sS73aWCJPEALicno2dUVJIFU+4LhPhFeXP9ug5XjsC8EI2+peuzxpM57v0sNpmnEcAYo2pmZEiBez1k4XEaI6K2BkLokn3rqg5OmOdBc6DrfL/2OJrmY8NH6Q1ZS/C330zK0GFtFO/z5KtOAtlzp8axtcDX7IcDIIzRqVo1OLXV47K4lDXqfq+I20PKfo8VfWc24MvM1gwRgfB+ZPSkrzP2kH0t5QzcowTO8kE06M/UU3eFZEh3k0mRK34KYYO7x9bt4qqRIMSTW3fHVPLVedPCmR8zxh/ihhsW7dv337mpb1mOZzeUEpZfEIDn21jopXhDnm+tLaAZ5ldQ/PvDRaqczNtg+N4x4t2o2T99viGSAXlssUTdEp0YBV4nyajOo9PgWu1q4C0ElASP+QRQ2eyUaB5ENDrEo7MhOLCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?amZSMZTwam7iSYOyap/yfxF88k1HMIJ4mjHKmvj5oxulEqNnhnJYpTG0JTsC?=
 =?us-ascii?Q?7gY2fxYijRYOrwLdh1ZflknQNE0ZvW984yGPAuM1jTxYOQxiyDkJIyTw+yVD?=
 =?us-ascii?Q?uCB0ljpVIAv/5zJS47OTcgzKpt7M9RLjWt2kdKWaGLCGW9v71s7C+AYgZ/JZ?=
 =?us-ascii?Q?8ldAvCiBD93RWw744QBIlGD/27ylrp99QyrU+Ipxr/qFoXefwoBfozZL7LXj?=
 =?us-ascii?Q?wOZRshkzyfJBkQ1HqVI3NSCysOMHKLUuAhBHlmujb8FzWPNnirlxwzenk7Pj?=
 =?us-ascii?Q?7KIMzr+jpOG4X63jDJ71TJUTnyyx5p4lOvpZSbuoRvB0F7gcH7vssg1de3V8?=
 =?us-ascii?Q?mKCicK+DJ/FhddIw+ieRGrV7+s2knJmOPAoHjTVUTzbWXn+G8WjK/RoxlFu4?=
 =?us-ascii?Q?yERUApi3gjvE7Wded82BfUEcbjcObtScHpeuCEqiQJiOai3qQ3+oGpzH3768?=
 =?us-ascii?Q?m1J0TyjnDpR089r9xGUI4V8Y8+jLIA3B1Og6tbiN8pI6g5/EQr+FSmOgBavL?=
 =?us-ascii?Q?U/O859tJ/xu8J4YppEbsuIqHCyQw1yqSfWGaYbyf/75F71EPxztRqf9fy1Tw?=
 =?us-ascii?Q?pwgPUwnZN5eVWNyKHTZMJOfmnCUvvYeHdsgY0312ODeNfGFX6Wdp+qtv8Vuk?=
 =?us-ascii?Q?EfSVQuHzI8+aeZxanA3ZqF00cs6mUay5S4MYAGVGNPt1qEubVq3iNkas2LMj?=
 =?us-ascii?Q?xzTLBZDTyClXpluSYqL4EIVDDAD3tEaeueg//FMGanGJatX0LP19zpyvYb7D?=
 =?us-ascii?Q?IbHguPIO/PwZiS9kS0EbHigP+p+XpHFexCA4mOLItbgcAUMcDQS353sfeQBN?=
 =?us-ascii?Q?wGa5rTNTpl/FoPcUH9m0Zvub0nxIY9vTo1ps9mfwsEye4SKHrefkjgXQ5rln?=
 =?us-ascii?Q?fpkBKJS4evV1Z/V+Tca+hTBZVAG/ziHoluxTOmC14JZD/Pe/C0OCvuPkNEry?=
 =?us-ascii?Q?8zLrQz/VSN2t3HAF01eENAdSnJuwbg3y9xA8OcIAx2rIyNrERxg30+JF2vuA?=
 =?us-ascii?Q?uxQZU/ERG6SBm81EJGE0QllFid3zUirGh6BlaLkVCFLvGd5WMQZ+nnYHrIqD?=
 =?us-ascii?Q?SyzA5yzz3zciDn3UBB4TZ6T4J7U7Ab2i7AkbDBiX4CyMhicMK2RVO9Wfb/KP?=
 =?us-ascii?Q?6m0wHj9QWODMS/k7Vm4kjxv3x6eeQYLj0OYS3vbIuRorEpRDj7v3+YfX89q8?=
 =?us-ascii?Q?JqJeC5gt+z6jtgNZZcdnr/d5laQIuIpFbQzYh+bTUeEbH0ccT6oOST+YQpeE?=
 =?us-ascii?Q?yXFLOi+gbOzJjAmYp8Ns18+rxq9SQfJWSCbT4M5j0+UIourIijTgr+MSNrCo?=
 =?us-ascii?Q?Fxc9pE8DLVggf7c3sVKMotr/ckTeeXa7QrSPj7KvaGvOB/tGq2lA0EN9z/EE?=
 =?us-ascii?Q?aTLXQCbHFaorysLeUe0MfXMWmqk/dBxq7OHazRs3CBrF5RzX/HFZqozic2zu?=
 =?us-ascii?Q?SvFVKu31NMAzfx5CWPxIGF9FIL31NtoRdDoZUgHKsVecHJRU2u0uw5AEsHsR?=
 =?us-ascii?Q?qblt42bEnK5upFWiQUSJ9uDfEh/wREblSOai51LPTtywGUJ2cLEisRlGdZeC?=
 =?us-ascii?Q?FwtFInpALlKgHjvAa1/ZK53X5A3MY2F8n2NNqMmGhbZRNSqkJ/u2k9188vp9?=
 =?us-ascii?Q?DHGR5eO9/Kdwg2i9QKv/lo/52JTgpheaA441Wsd/jk2BbUHKz7v9jwz9RCkC?=
 =?us-ascii?Q?90m++rcyUAixA9Hv53bp4YNp5Xmk1Au5InrcKWewlfYSL0mp4El7OiWy9SwF?=
 =?us-ascii?Q?6jXnVMjuGa7rZBvIyWCx2nwW83DDm+w=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6289c7bf-e509-4dd3-3186-08df0dcc535a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:12:13.3698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKPinm2LhoCuyyZuiejYKaQO5WM74nhnPAOwRNmePy0ZxxnmY5T52pmSgtpbPzVO0Xj1WWT/RDXeMDQEu5mCjgplB6H+8hGGRn/xaVg2JiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6560

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

