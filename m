Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF547125F;
	Wed, 23 Sep 2026 08:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151755; cv=fail; b=fLLjwDmEDawQ2oqJQ04ZPtLshufsERxBmEvMugdis+ogd0b8yV8/+tW7i4ZUoppSwDAlXCKuCR7JtRjzHOlS8jMILQTFr1efOPXIlbDvMLjl/28XqgEkLi5cZxxuPLOLlzMdi/Lylb9mZRlEwgx3vZH5Dj8wLOjIwru/bAwV9Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151755; c=relaxed/simple;
	bh=FAR1+/kh0hZT89GPeoqPPe9hHWVnrk6hC5TfGMhIv4c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y+0btfoMfEj8Y0vpjxkQGfjep70QN8JmLmsa7u+ZbnrKuDJNHPHQYnysLYXU22EZBqhDQ3+Jy6DcmfwIF9PQb+73ruaLCtei4o0cjvk7iT8N/roWxOHun7pMisbbJfXWGKPp/y23gaM5DePFKAUSYh4O5nr2wczkdfJZ4+wbEgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=JR4I+VA+; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="JR4I+VA+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrCicBxAj4fSRTes9JZ9gvJxWHix0VVhmtuVqMDJwxTCbm/9R0GR6y53wawrzCyPek47eH7hGPakZ5+VrW+GCjMWOhKO+fqx5gEMuekHqo8xQ5pa25A/5X2lKjqsTY58lV6e4cXFxcL1g8plhNCt51gV4Owg3DM9j7Crgr8Gu2itL8fHJhFeRL0Ne/CYY78EcvEDQUcqx+1MUXESKFObHvFtFxe5irXd9pjx3Mi/zP+yjB6Mp5FMyACKeFYUSUGh4NRAfD8qnlOYdUCeJsrfvL1cyeQ/R3tTre/z1NblUwp4Mr72Px2O1D27sxKjmagbxYjiAmXoe4ix0mEK+XkPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVoVhMvFavLNidP4VmJBaRXKajsvFBv6tfLlMwvMU/w=;
 b=yuvjBoclN9Wo/KBLvEzMeurMZrVvMtDoEImYw/KnVIOcsPIJ88sEKniVWvYVc1lsdyBVgxsGcPI2HWcy1T9Vi4WWpDOHXaNT+wC4nXLzlXamtVO4KMBe82udK5VrVgD7D2oisXe1xGfa6Cwqit7kiXqArJCDP/SqhvTxygiUG6oTh5ZCcPNZZe9u+ywIHKekjJFrsJwxo4ZH8tRF22Gy/3RpuBR52L95YN6B6tfEBaTAmgi7cLhNPEhGF0aSPQgaEjV4cdwOrr4uWLL3LfT3T6BKWb0DDF9/1tIYuFshHpIp01cBGHs3xS3SW3n3ORAdFdJ2Iju+wagO6fHgk6Pyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVoVhMvFavLNidP4VmJBaRXKajsvFBv6tfLlMwvMU/w=;
 b=JR4I+VA+xyLwI1Y63J55L68St0rFiJGz1RMszZ3QndMjLSB/8vP+uj6ZB0NP68c30ew06YGoQqrkdwpeQgOaXa4bN3Fr+U1DfhLeVChy17++TFg3M1z2IOfNX+sZ7H2uLpl28gVQxkmDlojpQA6kTnxKi6L2n3chNaZkqRtD+0+WXo543BSq1uYyqRXBizf+NFzYZUrmpL4YJS/RQH5wgVMCw0UnT79du+BH3g67MQ8YjdYLw6DQse+87+KbMGLD62qkoV76kuAWc4aUHz9QelLJNEbdvkQIYXxrkppevJedZtg2QNdUo/Rctn4o/V4HuKwsXyG+SbFb59BEKv8oHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:22:29 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:22:29 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: socfpga: agilex5: enable SD card on SoCDK modular
Date: Wed, 23 Sep 2026 16:22:09 +0800
Message-ID: <8a7cb87c7afbe8e1d6d0801658bfa6615c030c66.1790151203.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790151203.git.tze.yee.ng@altera.com>
References: <cover.1790151203.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY1PR03MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 2927bad5-6152-4b34-c5aa-08df194bce6c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lkxwcqNSpD+zWGsFE+IamzSXtt1dL+5crwciIqmMD6D6Eju2elugBatnYCyPWAHnduTEZAazQ5ZYrQ0fPjtwF3s6PXBWjSfmDFhpK3SNuzoJr12ULpJNyq4+2yMkeQtQ8mhovR1XUC+YnKRXofng5lRi8T3rn2gN+lz7oabFs3HNWjx+S9m792GSZGJxWJisMURe0f3+DzUYGKPG38J1PvpmgD5ztOf0KZjQCyIdqlqsuOOOtFTakGT2PI3mZ6nbvUHg9fz0u2TNSt2jFXfBsVg2f6gTWqThcjQNwpRxyzbLAVuCDnzmSBx7vjXgmvt3oWTiilVJ1kKb1y7bXBlxwWSM74y/UhDU1Syu+9O7HHuxWuouftLo94m7Rop+Wen9YsdChaAC4AVhASbuiyaxUMs/BwVZUlX4Kp06upFrxVPfHywC8DDAamu/gw/jYE2U0CUevgDQXRdeWbUTkTepyi8Qk4tKCp2XWqOlY9t5BsJEHCD0fIdfFbnQ/mVZiYliyWkdBQdnjOIejloJdUG7Ct3XGKeZyDmk4EG+f9iwp7P118u3Z+NUkpaoDn+sNDeb20YDXJRMiUyqlej22adm/Pf0ay6T+gZN29A1xLkywCvCRwJNPMk/0bsv4VUKy0tJo791Rs06HTzC0aMTY18NkUyhmkQ83d6VarbLPf226O0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DhbvgUF8h+Y29IsNDBCSoMIK7ErbOS/Z1sgB9wdLiOris97rB5muLtNHshlX?=
 =?us-ascii?Q?5/7m/xkV3hK9FB4r1DIn2AO+BY8Pm7gTrHmmUhVf0OOHJq6kYE1bbw3Xc07W?=
 =?us-ascii?Q?wcq4qG9ndOQ+Kt3yEVaVxbXetPBJoHbBcorDaKWGCiIOqWQpmTd1tyGYLEx6?=
 =?us-ascii?Q?g8Wb6Z1wmUwv4NSP9VF/tl2SuAngMohZIURBzW55UaoEQ+6XYpQltSzBmFra?=
 =?us-ascii?Q?kUP6cKEvx69aeW3I7qMJmX0VFjcgDQ6f6tYHRaxY2pN+T4zoUI0YWHJypJjc?=
 =?us-ascii?Q?DFcGM7LGFJmS6ep8u25X1jnOLK6TtzKkoq2/TxCL+K4NQjiPD5xeR14P1DWS?=
 =?us-ascii?Q?mpGFXzgC1Q1SiuYJoqOd++GxZv3/EgylcaK92l6zmDM/OZPV0hGwtKbkVf0A?=
 =?us-ascii?Q?Cpa52KCzWhbDipem9p7UCd0Bh9ZwATJT/CWzljSYoVdtPzVq139QJGw1DaED?=
 =?us-ascii?Q?m0RwOgkbngjtaYXZFDmVKUivnHoJhfAdJ4A5rD7dr2180HC/mpV0vO+j3U0s?=
 =?us-ascii?Q?FwqTqSf9wR1XeaEIKFLkqE77GbgidYiCOM3vcOGBm4W++c/fVO95GYFuhxtP?=
 =?us-ascii?Q?R8u5WT7CDWpX4UhIXhku9cIiTJ6GnDlltS3g2cr/sIN80+BNAaLwUykwJp2I?=
 =?us-ascii?Q?oH7/KBIEwDshhIml5nAnSmq9kdPlrCfLTnMLe3XMVRo+Sjm1MFpy2rt6/kKh?=
 =?us-ascii?Q?qhqvRHsp83kroRp60JEiiWufJ4jb6Y6elvOiY5SP7iNVkbilJpGvayc792pK?=
 =?us-ascii?Q?TL5QiKB+WE/Eyj70h7r0rJssAIhgHqqO7uos+4pr95CitMZl1nDAigtLfhRh?=
 =?us-ascii?Q?BzKTWtgTbgFmezpRLtikmjSrrSO3rncBAk3g/SmSQoovZE36YzHgXR6KP9Cj?=
 =?us-ascii?Q?rZc7IyD3HfFdeHvlnR0Ot7vuZc0Jl2yrhJwvKOmXtq+Ve0Oirto1Q8Jj43jy?=
 =?us-ascii?Q?5VIXcI9x9x7LS1v2svpTvnMIYy69PlPbxGR/4GFKRMU/iNtBb6Fm0A8shGp6?=
 =?us-ascii?Q?KwGyyfFbfQLhXX9C3+8nrdhsgMFxmH2DcQp6yIn34pb1gKyjLAO6cm3GwzGC?=
 =?us-ascii?Q?lWwVGthJY6KORJsAUgmEHtXI5mxGcZnkglMRvSAFqcj+2aIzNpBtTE+cuout?=
 =?us-ascii?Q?9pzAa5WhuBuyNDs2wwD6J2Nra7C2NbgqYWR6WA/rIHbFOuydwd0raBCSEKjh?=
 =?us-ascii?Q?NHN3/Y9hOIE/J2Ehh9T/g7dBGSVUKxDkf+a278CzVkIL1KaxfbjVdMsVhHTR?=
 =?us-ascii?Q?LL8S3tdN0vsUEwbnEudp+1+ho1AMSD0IOE2FVDS3Ob0e516GNe4miXALaXju?=
 =?us-ascii?Q?i5aUCuPXSlfSltwyM9UTq/NTRVs4Y7hx9YrfMoMTuNSMlmaK093Nxi8Y6YWw?=
 =?us-ascii?Q?DFixgFOrgyisxalYmkmuTfE0wkhNW2BYzEgYuLb+zSy3YC+Wgu6cmTOfciMa?=
 =?us-ascii?Q?Yf7P4/mMIzUqfwjdU78XE7AHtkmM2boyNxTsOw1gRcv6SxpyR0Iv8Hz/IFGi?=
 =?us-ascii?Q?kxKHZJpwe9PmplNKbBRx4nb7zJ5gv6Zh2HZ9OXCNCC8wNI9bsd7ddyk96+ce?=
 =?us-ascii?Q?QO/dKWXOUxaBgOqHuOCf2D2ax9hhT7vdfETiSc8fdcgtz5zvA/bPsyLw+Sku?=
 =?us-ascii?Q?6dZ9oxNfHo+Jb2e1RQl4RYw+QnVbKsHh9+ViKhXUJntJFLOYg46vs8uy6tGx?=
 =?us-ascii?Q?cr9YbIOTBUNUjteFIpbvzvhoaBNHOpaPnvrUTh6FfojBD3tfAzx86RbMUwuI?=
 =?us-ascii?Q?XOoXdARGQQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2927bad5-6152-4b34-c5aa-08df194bce6c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:22:29.1525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5p7BsC8P5lzrZ2akhBiiumvvwG5DxHg7zkgQGEV9TLpL3fHniV6o1XuwwhLTF8HdbRX4IJtuDwI30biSuWP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

From: Tze Yee Ng <tze.yee.ng@altera.com>

Enable the micro-SD slot on the Agilex5 SoCDK modular board:

  - Add the fixed 3.3V card supply and the GPIO-controlled 1.8V/3.3V
    VQMMC I/O regulator driven by the on-SoM PCA9535 expander.
  - Enable the I2C3 bus and describe the PCA9535 expander that gates
    the SD I/O voltage switch.
  - Enable the sdmmc node in 4-bit mode with SDR104 and DDR50 UHS-I
    support, wire up the vmmc/vqmmc supplies, and set the board's
    DDR50 phony DQS timing.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../intel/socfpga_agilex5_socdk_modular.dts   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
index a2b707ae6e9e..7b44c24412c2 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
@@ -34,6 +34,24 @@ memory@80000000 {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
+
+	vqmmc_io_reg: regulator-1p8v {
+		compatible = "regulator-gpio";
+		regulator-name = "sd-bus-io-power";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&expander1 1 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+	};
+
+	vmmc_reg: regulator-fixed-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "card-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &gpio0 {
@@ -61,6 +79,32 @@ emac2_phy0: ethernet-phy@0 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	expander1: gpio@27 {
+		compatible = "nxp,pca9535";
+		reg = <0x27>;			/* SoM expander address */
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	disable-wp;
+	max-frequency = <200000000>;
+	no-mmc;
+	sd-uhs-ddr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vmmc_reg>;
+	vqmmc-supply = <&vqmmc_io_reg>;
+	cdns,ddr50-phony-dqs-timing = <0>;
+
+	status = "okay";
+};
+
 &osc1 {
 	clock-frequency = <25000000>;
 };
-- 
2.43.7

