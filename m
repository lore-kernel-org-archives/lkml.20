Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DD43002A0;
	Fri,  4 Sep 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512023; cv=fail; b=ohh+4/adHJai7ZW5RTlBscVgwpgNUuVSyY+d0HVoJ2IFSIahIQxW7R6o43a8fxAPOas87OGx/pvoKewR7+vrgG/SE8waWekQWxWmXwwQCMlMaSd6ibVsfhsCVYVwn3BoJA6HE8uZuteznDcPYilxnvDUpG89wyNK2Tq1HFKyFAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512023; c=relaxed/simple;
	bh=H9CY1GNb/L7OUTtls/OS1/s2YcH7YS2eRQotcQMp45g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rrahtfCRUBDcbXkBMwwAFhluxWKs0fMjgzKMWkF87vrp7y7STu2gvz2U7BN0xl3+HG/f9Q7qzWh1sxLIwty0MWglbR3a0hozTfbeE4+mtyVBqwToFt/407JF1LGqlSVuRJAhFgft2stKm8Cya+Sl8sEpVLiq9oKl+m9bjlhRXAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=FT0R8PbH; arc=fail smtp.client-ip=52.101.85.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="FT0R8PbH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW4ZvbF3xv4esGnMtQoNqzQurTupf05XHKl1Foh8+dCzwhk5Xs0rA0QmCTyZwqKQ2x/sALN/FdpsHLInMqlKfBCNhT2nxNxGByXcAfUZhWfIT7CtFAKTrrcfLiMso4OW7k8NcPgl06GuH29BOLBKaNzJajOTgg/d2NG9wDxwZkop5+Iyo4r5DqxZM0EgA3Qz7xHApxLcc5fBqVCAEmDcmopAhnp8le5c1OhIMJufbelADhS/sLsY7D3GWuPC65jo7iNGrba6eAXhieRo+qf512pC55orL7TRnwb6Kma1BMGFxUCEEG/vIigvQi7xgjZ2PshT+IKfbboJkdZjfui//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXnz/Ass51Rh16gWTeqXy7Mn5Q/ea2gDCJpwbYBZzDs=;
 b=BdTP4gk3pmZvvW+mqlBpK59LgGpoxCqX992bqmJU/8nfdevNK2tgZ0fqGUp/M30LjZ3AHSeRkhQGLSJFgeCW0oYTXdqMFo3ObFcpJ6PvlYAzFCbAVDtpK2kfuhvexP4h0TN1q4Kh4b2RzY689VyhVddMHjMQlgVo1Bu4/Kzz3tOgoTPYOLWcMqavaj+5T3H+WS0Z9YnJMz8zaEgPdvI9MDoZ3EQN4VHzpqYPaBiRNDau+6wPej4lqS/LUUVirVFts2rIalRmEJOrvl9ZFquOVG3I7mDf7G849bsEVawqwLJuZUvSmIOIn4vedpla1z9piqXNczgQblOOKOV2UubH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXnz/Ass51Rh16gWTeqXy7Mn5Q/ea2gDCJpwbYBZzDs=;
 b=FT0R8PbHWzSeY+e2S5jO8eg9x7HGKv4mG8UoEXyGvkksP4rxGmG13O3BVks7xT9cPdbjgNBYwSAfSXfAVXw6m/RGEFRBTFgy+ELxzeJLlI+oF82sqnuryIP7Y9c39ivvI2uVjK0oLtEW8uqvy8nrxN9K5xcxZ/EQZuTjWxhGSZMdBWBy1jvj9wuRAxQEFfzloXFqIbNAVWFxPgAgBzklW8Y7izah3H2n+bNwA4uFfM+zscGeV5eJcr+N//uWVszn+DgyGWK+zEVTkzXZ9vA/1kpEU7IhvmHp5y+6LCLN1JXdo+EglTdiAjyQZCAkY1a2opw5Y123PwPKWlFOuHGEHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 08:53:39 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:53:39 +0000
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
Subject: [PATCH v4 2/4] arm64: dts: intel: agilex5: add USB3.1 controller node
Date: Fri,  4 Sep 2026 16:46:11 +0800
Message-ID: <f479477d21c3f8a3eeecd24cd34ce936c52a9201.1788503540.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM4PR03MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9438e1-8b66-485c-48a3-08df0a6203b2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IbkdtjbNJDgfi4xtbMA6OZhYGoooCimm/6efie/7ndVYoyyleJNtCbUm84kzI7La+z/lOUARq4TxdYQn7exPzzp15nCZ6yirXDoQmYptpTsOn9ixDts8UURW2B6j95S6nTSibYyNDl6c3yErOqMXeKgzfDAi6VWoTX3YPQAEkxmweALLOaDhJ5FeyVZ6oDC03TjcKHbnxHuneo1zuyMh2Q9q4JQlgJrUk/ezNNBuo4KYubcmH5tCVV44VYmJtsB3pbPXOUKV4XlPj+WHpGNfduugHDgbcp4FbFBZle8H99y0TC38eoJ2WpIbj4mhhXEHl7TwctKgZstY8VqKXL6Xid02evqhKwDrNTdktwaF56qzWIOf4PQVEhWbUYxadg0/E5vXxt25Lgo/y630nZlKUWEJQV/BIrIinEGpqVrQ3oj9dCjKqMrteGag/UY/3QYO8F1YH0V5VtAKj2hJvfBIkywhg2lmsEfnsXcANlAsde+IeEQPtB2CJ+zNw+ZZQBZJbRWOtNczzGzPLFQpo2T71DueIvhFzn0VesYQcHhUxrmnVV4j4/810V5Ti4weBPaRokS/Xi1h+XWD2nJSsRUrrYjLvjHy6P4/4VPf9ibO+BT4UPyVY0DPwasTLgHRVaGEOK8x3IIExJ8OSCBCU0ygkUKmATliAT2ChJX/UpP/AkM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ESVs1Rji0lGEdH6P3zzS5tfVKJS5MptG4lkL+lWnGcclFvMqmGrqk8MFLH1K?=
 =?us-ascii?Q?pYx6xZK/iaQH122RplUDdPxwEKSioLpqGUhANnQvCy0zUxVzgOwST/Ys9NGi?=
 =?us-ascii?Q?jPgTJv2QGYTN1M/94mZXBEWGhyjl06HiLld8panKym9NSw8jTe06E9AV02c3?=
 =?us-ascii?Q?V1m+W5nAO6YEDFMNpgcxrODAl/ExUGhj53TD8DU7X/Cgah2KOp4WHB3k7sSC?=
 =?us-ascii?Q?LVRQD4IzCmrC+z25Qc5f82Cqu9eqn6yCmrX09XJX1L3HX3yNVkEJDD7uXZD8?=
 =?us-ascii?Q?xSK9tsC1D5SDERu4V+zm5DKVHdqB9K1in+J3g8SjnT0wtbZqWZX7jxmL1H37?=
 =?us-ascii?Q?MHHi+OJMxjGiSSskdQtJJn3dpPNy5C/j8UZdpf/EJNgEYUMfvb72nR4n9zm5?=
 =?us-ascii?Q?WkBppAqx6wGyXV5H+lIlq+OLf6eLWxT39Ma5rCfc97zV591G4YTLP+x6aSFp?=
 =?us-ascii?Q?EUWPcVIw3uYEJvph9FI3W9ZZfqQLl/isxVL95+zTE8i0tcBkU6nlVH1k835e?=
 =?us-ascii?Q?VOdtjGY0x40JIJ/b0OohOP982jRG/gxIcVsV95/AWM+rhzxtqxwg531TItGP?=
 =?us-ascii?Q?EtF3NhRl1diqrNC8hecPDdavZsymGkX2C78bDJNcEizBtODYW4SCnKLQBKPC?=
 =?us-ascii?Q?NgL/Hx+MOQUr9IMknrHni/KAhtGVyo797TpZYSVyiiHl9CwhVGcU5/OPjWSE?=
 =?us-ascii?Q?bMVGnJ3BqRUs4Hgw02ShcRldBI4EtIZvYxNvrLRlmgaQhXH+5q0Bfn5R4GMD?=
 =?us-ascii?Q?tpjMYIHEjCTfjiqgc+eVNFafbtkHT6/DI+5qG7Gq2rvhPp3A1OOa//+DmlXK?=
 =?us-ascii?Q?PFaPmp4Kl3m2aB7CuNWGkcr9FHtnB5Uro4fnYjBO7KLPmPHd8jxDS3Df31mJ?=
 =?us-ascii?Q?kZHDE5NbDvNSwm5YEamLbd3DeiLnwVpBaQkaM9eCe5M+L4lqNzCncW8Apa8j?=
 =?us-ascii?Q?5SU8OzbislQwyuhsxuXNogadNnN9BHB/ypVL2K9N9nDiitTFUHbobxT60GRL?=
 =?us-ascii?Q?BQjqzPpgwCkuTW7i5duIF77D9m5rWc2gH63voSbEwQkUMaCOMD0o1JqqQBX2?=
 =?us-ascii?Q?O/lK6PadDR13Lh4/X0WCvx7Wc9EiYPLTN6t6WCXcVmacoCSsaqLnehrj2yo0?=
 =?us-ascii?Q?U7NfMxMPS8iVESmlwqLTPi/sf2IfSvl0c8aceV895ogesq6wQbIYShSfuH++?=
 =?us-ascii?Q?Zut0T95nYaz5Xzl2kKsKNS95XjlX0DN37BFBd4BPFAIKqqa+vjqs5hKj2p93?=
 =?us-ascii?Q?JcXJZTm+27MWZoHIhf+XZUho2w1MIW/Srl3E3e0Mc1lMnwfbU5w3/S7nwgl8?=
 =?us-ascii?Q?Ou5OyhjtVoP1SCckYPty+WIyfj88O4BPutltMiZ/Cj361BY9gKzMYW7lxaU+?=
 =?us-ascii?Q?WfXXESNz9nE3pcTn8nhmdo8nJ9YD6VGFanapKXs0+3jwRFcmS1Lt7VktjZHy?=
 =?us-ascii?Q?if89Go02dEc+CH6Z+3/pHciPpZbci7fxXzBr0b8bEOJCNwkWZ5G3OCgSzZ6B?=
 =?us-ascii?Q?Dyh2EIquaLIpy/38Q+u4KXWQLTgAzeensv8BMfROeP30OHbDwgMjJoBqIujs?=
 =?us-ascii?Q?3VqKxyhnLal35S7WblCokN0QAYNSeE6rUKg63QguQNjy/ixPX+cIGMrHgRxu?=
 =?us-ascii?Q?j/SLqRnHU1HMMy4I7EbfDZdOp74OB63yOTOYW3Z8H0L6XRWvPFRCbsW9E1t4?=
 =?us-ascii?Q?E9Jwc3e9ZgaGqQ4N60Cq409+rfdCSNM/duzbI3Bm+WCBCT5VT3KWOD1SI9PR?=
 =?us-ascii?Q?fikRmq40s73ykhDgtjBabjKz0uWr/UY=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9438e1-8b66-485c-48a3-08df0a6203b2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:53:39.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62FPzB1r6mXPfmZ7QsRGRworYRCCMA5N+eg6wZzOWn9YDlwZqZhfJm4deTaYhygsRe04hA1wvs1PWJUv7ePJG16MDbZXGPMzs9w5KoGAWdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5981

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

