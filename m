Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020140.outbound.protection.outlook.com [52.101.156.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02C42C50D;
	Fri,  4 Sep 2026 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504439; cv=fail; b=iTW1BitV0jNHS39U+duq2mmrpBHSPo1z3z3vFPw5YRf3TelOg8lCPPcy1nOYjC7srHQVBZPhQa+HMgbxadkIiHKR9bmZvMJ9+M+k7+LWiJzNKT+tNkPRQ570jex8l6vzj86UqQ8Lt0x19ftQyKYJYeevUUP5zH22eQKyp+7ABXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504439; c=relaxed/simple;
	bh=RnNuGjSd9/tX3TmHDzPOvsIrLSW8/jq7+bnm99KX+to=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IcLzxrD+Hpk/kUEXqtsfXBD2+Ohcihy/gKgZiUpD/BiRcLysRQUOvUUCXd6si2KbyCJpWc8eTnLNI/6iXF5b26BTyvyTgq8Ba7MehIne3EvcWzzh5ARgjSa9qIEBrjJpWbjLlqDGZVcqiDu+5HaS/LVT1COM6+tWef21Beq6ZRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=TWCwPfcs; arc=fail smtp.client-ip=52.101.156.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="TWCwPfcs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuM7CkXAPJHvzMvIIdX4rrIhYZL5d/cryU3h3o6RvM1R1Za1jbc5c2R5tEYNdgE8FvJskl4LEQAQe1r3DvL7MjKQDbiYcbXQl3G3K5siZB8N36ac5PoSBLaNzzxLWlEfipy9qZmDRrc05w0VHjuOmgya4PkbIfaOggmqLN4UV6qiXmiI00OROxfVoeNy0l+HsmO4e2XgwlYP5CTQ/D9iqeCsKOgVkJdCTwK1n0IqvaiQuwm4+kSCv+8xER0sfQtkg1uWc60aWH0670l/5/j9PadKT37EDl0FuMW6PEmIawvBaa+1rzJF4jJA9kp1GCK4y/929aGT+BO2ZH6G8UE4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVuZDBQK3YJG4Qa7J/3Jj+UumsBgC4P26y6SvQNJf/M=;
 b=Q3aDEgCOx8CAV93vceDxFbDLAZCqbp5rrhUiFEfmA5nKbuJzzUNGYjoGxkfwi0hYVu3r8DNVrS6okujDePd2P8/fFpGAZrdw/BWVwHtmKEuYBiFVHUWAoj1T39L+WLeE0/xnBflBtLXm+c+Cp86rWto9GC6Gab7HsiV4KLBXOH9KEXUxb1RLQ6z75G6iBVJ98JsRNJPoA+1uVnr5iqL3MJHPaoSvfuITWyqzK6pZvxw0Bg0D56MU3kXYKz8VaW6Mdt8rMOORKT3sLWYFN6VG9sDCgYsAIm58HhvAqMa9lHEhAjeSh6ZPz1UCMdxiGGdgJlYJMg60+isOG4A0eOjZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVuZDBQK3YJG4Qa7J/3Jj+UumsBgC4P26y6SvQNJf/M=;
 b=TWCwPfcs/HbKCL7k7egFic9252YOvYHDLEuWun7osdC/n+CNL0beUsUQKecB6hUWyxYWkwmEZL1IC/Cu4nOWKXzg0C98DdPxsqdOHbh3zFUcfcw6KT4HaLWz3LaaRmwN9Dq567cCwjUO5AqC5zlf6Zo2A/X5BAochykFNjiSEg+XLNm8BS1DoPunHjHuRq6EDLB1g8D2/00vEIJmjVsZ1Bz631GQULXMCXLc0kS3kABU33Gobb+lioa6iIYNA5TF6OJrWzoW8JaA9MLJCBOPF0Q/xPTHFem05qHYI2jD1RcltSRwSqXUIle0aSy+Bwl4u6on75dTHOyBexvO0yIueg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2979.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:46:57 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:46:57 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v7 9/9] arm64: dts: freescale: imx95: Add video codec node
Date: Fri,  4 Sep 2026 15:46:35 +0900
Message-Id: <f4fed3a2ca162c1fe0bcc8c5b6d3d8141c61ed7f.1788496816.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1788496816.git.nas.chung@chipsnmedia.com>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SEWP216MB2979:EE_
X-MS-Office365-Filtering-Correlation-Id: 079c4692-db99-45d5-60ac-08df0a50505a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|52116014|366016|38350700014|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	iwG/+juiwwnq6iwF6dTMI8vUC4y9n+nZUtN0s57Dgk0CcJlkasE0fcQA+oVFGMiHNL48C3Ar4dyDv3A3SrE3XVxnWNoEPislDlnti83J+yGA9j+KALL+rsH4INdLIUlhyv8FePN7UPU3D67STmn+W+IncCVczRg+zybVsFp5zuXXVohsKwAcL1XDIuvjPrYFi1VDlIX/ZqHIhPej1e5zcZWqNWF44nHkoDsrUReTHhEmYxgcdAJHeMSCx5JrzFR0YOz/2ctRL9X3S52tNmk0mvh+yw/7ki9gMRozKaNATXhuFrSHVf2Oof/7w/vxfmSy3z5+Bk7UvBw0m/mHLMBVSrX+f/ilxQRs8QybM8Wdp+6urjcFikW5FQxduB7zM5u/vJ/7qOOgObmPEcQpqOYi+3byVAe7sK/FD/quXcumv/xC4jczZFyYbT3lrvAkifEFSPEfIqzRx8k5dL2RGRxLlmwukZz/beAklbfekwDa5QbsKbpkX3cwjOaf14UTiXjBAD1HJpBal5pH9oGkvaBsM8GwjIuCh+fFKtxgp4q0A8EGENUbfGPxQml2+Jdo1l+ud2u9xeR+lZUrw1E7R4A81rqSk0+QSonkmnifIZXOUyudy6ZyL2QCaD7GUHJTnBrI+a1C9cp5NobWuCk7Q9RHZCB07TuEWz5VpPgRGL6zcU9wPpHTF9fEVK5u612hEjpqyhv9UCgXAcdmbr04uodVgCmUJgX4iF0m1KilhGBDza0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(52116014)(366016)(38350700014)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q2PsrG3a5lh6EsoyEOTx/JuT/9/NjbvgIZV+gRopZrgCDO94KDqhT5YmMIDT?=
 =?us-ascii?Q?QGk8uI8esYc6gHtcS1/GZ0RuaisTah77CYugO7ZMQCcAKBLBCitY69/Pkc4y?=
 =?us-ascii?Q?2mKJHp5nCWAiSOqPRrx+bULSkfVGJboZDEeCHM44wVIvPuRuWKBm33e0Cmzk?=
 =?us-ascii?Q?P/b9B0uylOl/5ELM8vkJr7rr3qWhtBR6tksKeis65+xiJ/avCuccwa/CaPpQ?=
 =?us-ascii?Q?9tHg29IRF/TA164X+vrXZrZxiWfqXwpaEhCm9eQpfmiF/KyLgoOiBra3v6K/?=
 =?us-ascii?Q?hNKgeSeDlaO+VmJ7GtgQNZs9hf/D/0671eVKyPQZrTDryXNiNA3DDEQV6XoY?=
 =?us-ascii?Q?FMVeBgi24eaT/bd6Om/CCgrYQdMebGEKmTUDa3kCEs/qY8dtsJv0WadFYVDV?=
 =?us-ascii?Q?zHHxw2bhIqHEP7gYPFIeerv1k8ntQfnCCPBOvIn/Rc9C+AX5cX+QBi6m5sp6?=
 =?us-ascii?Q?qnlrDX1HEE5BbPAgnzv8VIB+Debd2r7mT++fqRkN5qNKEC54BktyXGJVDxuE?=
 =?us-ascii?Q?lMEv/GWtepk+Zo5LQPZ3pqBL3LXbVlz2+kRmvQpNsN+HSpShBMafIguhPiYN?=
 =?us-ascii?Q?onCwjQEesChUBh3LV2VbYKQCV27mSPG5S/AgzAd2OKNbJomIiH350YzhfcL9?=
 =?us-ascii?Q?6cj5WVV5nwZzE3/XdWsBBKvRUJusilXzglXUZjP+HbIXesWbomO7umCjCr9M?=
 =?us-ascii?Q?rNCVrE3VSF4FPOi3bv3Ym+n4NgQYDxoFMFhJMFiVwVeBNsZyFT2sTf64bJE4?=
 =?us-ascii?Q?ibFS1E3fJClArrLgDH33nPw15AhvaaGk98hZcLFjwyMD7Cks4HMgB3tOnJbi?=
 =?us-ascii?Q?cdknFPob+5nBiZcxzqVnEPLRgMzuvbqx+EYyIyj8N652618fI3vI7/GMKkuE?=
 =?us-ascii?Q?9kXq1/OHKawR37tuQK3KwS5weixI4KgNWRo2N6KZmu319qaa9jNNRB/mO4Ih?=
 =?us-ascii?Q?j/FvbZs9XIzj76UNydtQbbF88rW+hJkEhDIakTh984/zaZ/LMh4D9floxOmN?=
 =?us-ascii?Q?qNBa7V2EKN7DiYsNR5rRkFvEz8149rzdjdHjDQf2Z64ZuMGN4G3X8R+5AjZz?=
 =?us-ascii?Q?kef/MGPAdnlbS+c+xt3wxca5iL5PSiM797k6z4swhYTsdQlgE7O+P0lsPcMk?=
 =?us-ascii?Q?Xki/023WzWJtOGL2BMj0gCQNRem3pzHo/AhpzwynJBUqMNCoSbhyf1YPt+vz?=
 =?us-ascii?Q?fNp7NaaYrnIh2jALHUUMzd9lgxCw8QvWiP/rwENV8BAQI9IZ+dQWwrtPlxkN?=
 =?us-ascii?Q?IhoGQhCpJQRGcs2n30cmiBhj+dDa8XqtbbVd5de04sQFDTPBwiaUa35oCjyj?=
 =?us-ascii?Q?tgaUQNxiPW7PoUzHrGJR4LqIdrdthJv8ewCSBy3RIoVsLRnqWctuh8bnelXa?=
 =?us-ascii?Q?uCTefTsAgZzEp+dA1dlLGh3MgWpLc44ZtRKYR33fplndEaLHUpKc8YTlHVJs?=
 =?us-ascii?Q?09xxtcBZ1NxnzQan20xTKnfDvDwRyJSevCxDx10AlfIHS7tmNqwTJZSx+YKq?=
 =?us-ascii?Q?YpV7hdBehXoQYDB3cEboArr6zuzeaG0qv96TXy3oA65NgiNDak7Dj4V1/SFf?=
 =?us-ascii?Q?eaDSKLf7bxBeworgFzRmOkD6jHVWNx5tVH1qVo+AlTWjFkhAiTSoW0RmFtyO?=
 =?us-ascii?Q?HoIVLSjzzk6okC+jyU/EFXzilL9+uNaHYv2pMNsP/5dHlgiej4NushtQI8ZS?=
 =?us-ascii?Q?5y3dNI5mOei8NwWfPLcYFUNDi6wo3mHWz4u+vRTAyY8hpXaHzFqoo3wIGbga?=
 =?us-ascii?Q?xJHgzHyDNqptaGEOB0DYnTKhqRja8qc=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079c4692-db99-45d5-60ac-08df0a50505a
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:46:57.2973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBbDq8LppJXRweciiYA3TNF5mMVbkVShH6ZckVGwUPKGfab6zb8Wh2vgS0zRCDQP6vJsdF4FfyHGwxPE5UBvT1w/qhClYyafO8pMHkfBDq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2979

Add the Chips and Media wave633 video codec node on IMX95 SoCs.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 10 +++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 37 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 814da90243b2..7e90a63f0341 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -112,6 +112,11 @@ vdev0buffer: vdev0buffer@88020000 {
 			reg = <0 0x88020000 0 0x100000>;
 			no-map;
 		};
+
+		vpu_boot: memory@a0000000 {
+			reg = <0 0xa0000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	flexcan1_phy: can-phy0 {
@@ -1198,3 +1203,8 @@ &tpm6 {
 	pinctrl-0 = <&pinctrl_tpm6>;
 	status = "okay";
 };
+
+&vpu {
+	memory-region = <&vpu_boot>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 38fc47024841..35b24f8c8742 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -2139,6 +2139,43 @@ vpu_blk_ctrl: clock-controller@4c410000 {
 			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
 		};
 
+		vpu: video-codec@4c4c0000 {
+			compatible = "nxp,imx95-vpu";
+			reg = <0x0 0x4c4c0000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
+			clock-names = "core", "vpublk";
+			power-domains = <&scmi_devpd IMX95_PD_VPU>,
+					<&scmi_perf IMX95_PERF_VPU>;
+			power-domain-names = "vpu", "perf";
+			sram = <&sram1>;
+			#cooling-cells = <2>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			interface@4c480000 {
+				reg = <0x0 0x4c480000 0x0 0x10000>;
+				interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c490000 {
+				reg = <0x0 0x4c490000 0x0 0x10000>;
+				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4a0000 {
+				reg = <0x0 0x4c4a0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			interface@4c4b0000 {
+				reg = <0x0 0x4c4b0000 0x0 0x10000>;
+				interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		jpegdec: jpegdec@4c500000 {
 			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
 			reg = <0x0 0x4C500000 0x0 0x00050000>;
-- 
2.31.1

