Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DCF471274;
	Wed, 23 Sep 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151757; cv=fail; b=OxxdPoN90yrvgXlAErOeZJkRfCmddCd4+tgh5NVaKZP3LtUXvb+0sUgxDWUpHGojX01A6DrU1tVI3uoHhb/4qaVjaqF7oIv/tG26H/00gh3P9X6hK+IaQe4eMDA/yEC8b7bII+O+0+eCJls0mC+rvWQeh1755Rua8tjWPUFak48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151757; c=relaxed/simple;
	bh=UFtZCFKFAnE2stBBtVIry0ksYxq5w7Ef/B+vnbwW2Io=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tN2yWBuweluISZ1YqmtuQPcJxZ2wLjkOBZhVG31myY3HSBjaYjS9YGApYgNogdGagxZwdkRYOUPmLexPcUbSbheT4leaavOTUlx6FtAsGrtISldxSGfmc1DAq0UXfv6ghhVS9WTIW20wpnMnpSDKMiMLcxqJ0v7aVvBiCj1f3uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=MJBLvEhF; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="MJBLvEhF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0BAFJDd38JsNpaZp4NZSyutIEEN4VsmpTwoDbr355E1sgdlCUt7IrCYSLFWVFaFs2X/KmOn9Os3PCYRdLJ0wxidd9LuUMnfLdWfRfcl7vmIyIPyv51DEBHpdd+hDO+Er9Nw5wF56CiuCDfak+5ib9hbOLNkDt6mNatMzdpcJlQs4iIgx7hCMG9zaLEW0UEUYbKKYPRWJ+NMIWrl8HMUdRCLEwKLTEEztL0TnP0ZVYJcQeX/zuNug944hhX+nVD3nECPNYV6t8rS+5+9hr18HVg3X6KEE+faRXS52oBjdE+RA6jajuMJBQ7MxouJfzZP65OeN+gClrfJ2ueQ5XWt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajBS24689F6SkEbUreN3LFPENttAy0l/DJspyOFoSZM=;
 b=svvOG8hwqYW1A7g4MOtnO70BQVmWICsne66RH+cA+G8ULlF78js6CT+vP4CB1i2S+xmtYHhPvSYOQlpHifWw1HmXsKMmcsdCmztNyrV5SU2o+OerN/mLuHaDcuci5pFZauJCvqZt8olwUWyEt4AIbwa8FTcN/OLUhRlJTgXIYkGwTt2B3MsVoh53oA948Rxpf1dFOS/QMHTiKBfqDrvQw+X3bJPj7bm1zqy1BIKeeOnascYWim1mIVsywkDVOeISiwao0C/FzrgOshnsmF3bvhaxSjoy/9Ox+ONnfp2lqPN7s8NujJpld18/YipAxM7BWp0/lwN0NgaTS8/sJtaGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajBS24689F6SkEbUreN3LFPENttAy0l/DJspyOFoSZM=;
 b=MJBLvEhFCcU0uc/d/rGC4xl1rvccBny8neFz/ALOlWwJ1kb0HP+sBEXZ5s6DulmAR7L4EcqxDQ82mEklG0Len4VZTiFOGYgVFQ31NFrlTj/4JNBDqummdkbVywpHgCS7gTQZ4glcXB1Eoz6pKdBrf2A62eGTPZGFTVKJ06xtwZ/k1RGlOLU7xTB0F+trM38Xfqi0SHzmytvRli//IfMGAHwdzXwTwSfx7xEOwwCckepXgL5JiCbWUmfCdptqU0Al/OXmOMFyIZ3pjA9ikR6fiVHUZ2wg6IavMsi0Yzeb23AGzYSC04GX+MmNRoi4L/E/Moy3SFWLlKnNDw6S9Q9+JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:22:31 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:22:31 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: socfpga: agilex5: enable SD card on SoCDK 013B
Date: Wed, 23 Sep 2026 16:22:10 +0800
Message-ID: <6658c14187859ea96a6e4c809e7195f8e3e129e2.1790151203.git.tze.yee.ng@altera.com>
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
X-MS-Office365-Filtering-Correlation-Id: 37e930f1-b6f8-4c2d-668d-08df194bcfeb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Fj8YbVB8yvPtJSSks//68YHQh08fhETxgdJHdSo1ujG7jSVIZ7T1iF9MICZw5+jv/+81IG7Yy+TMPOT6SzGnaM6q9krAYN7/VGr+6dwNIHpYv9zqL55ybaMkopBhWCbB+eb21S9kIYvQAtHS22OQmGJBkcHOhYxNKAk2YGfemi+ERpmKYftzZfM0ZSiVKlp/6kaSRf3xQ5VJAPhWHsOuYbPuDw9GL1N237zbpcemUFJsaPFxTB1aT1hMr6gwIAjr+mvmtGZAkXjkJSxzeWnF2G8QjeuuCe7U7JrFKp34h1JjQgb0uHW1IHl8vSspxWndL7aBvZ5xJInVmEi7BajFdllBLer+sj4IkAnkPspT6/n/Ipoi8X8hnCJXtM5uPgUk289fQJad9DIL/aPyjS9l3IgUijuTFuyPgMoWV3odReF6WWFZ8jJzxzCu9rKv1qTSW9kvpl2n3fSP1IfMZfu7+1B0ziw2NyY7SlZ7oF/4BGh/BLp8Nm9cf6qMS3a6QfbQVxu4Cjb6Eu6rSnQ5nauN9RCZcSvpz2ixL2XsdeK+rrPH/5P0Bk2rHw1d98LcldJCiDSdid+rsr34zfE4ystkhOkai365x6YIbpir9wDWpKO1qzWhTLwRu1goTBE5p79AKA4YUbH5BBczrho+UIP190/Okjo7uPhzzTZOXWmvOtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TSJ01NKGYJ5jokYENbYNTJQBwgtg3ys3qerJrgsN+v8pnfxsMUMJLOe5rlfZ?=
 =?us-ascii?Q?B2nvj5pZJaG8I2fN2P9zhhiiOl5zbJ8U22ceYIe+QIkuFlteN4MkMbw0sOMk?=
 =?us-ascii?Q?jHT6DBxzjyZYPbNELEBhi9YzOr66q4MmWZi3BFv3Zl3gg8W6A3HllQ1bKfcH?=
 =?us-ascii?Q?VVUNtwQ1a7vpfQlxBfM8JFWIIygtiCEEgbfu4LJv6m32ViYFqK0x+kzMZZXz?=
 =?us-ascii?Q?p0TuznPkYlawUNzRlL+D1DVRVMClbZeMpOXoCvzZeeuMENkTOPFWN8NocNaY?=
 =?us-ascii?Q?TQbpvUz0YA3MkgQKPdHHraWndNZQ53tN5ximhmlFtZKhDGuUKCegx7H0JFpB?=
 =?us-ascii?Q?yfv2tZF/nB//oi/v1l0XPdAzQ5DOtd+re44GNngADYVgW1JGYlAt0qSymFvm?=
 =?us-ascii?Q?p++U9GxpKq9skFgBwZi25+4KsvKc6pB5QeAPbT0KXtqYN9EoAetnEsw3+QLL?=
 =?us-ascii?Q?S5ZEsANmNag1R+pFF+gbe67sgLDSkBMOHNVCQfpfpPoOj/AX2hUlho3+NbPZ?=
 =?us-ascii?Q?Z0dsu+moBHpQ7Rum32qZKD1YNRTPQojrD38ck5e95dXiH5RH6RWxAIKY+Ijx?=
 =?us-ascii?Q?H1uk11fIwHv1Yqs9LY1KHTYzsvePel2nypPD6xfnvVhxkZ5FdP2RuRqIl0nk?=
 =?us-ascii?Q?Gml4V7QNG0MxFKX2P7Y16fYL6Em0sNr0I4/8COcQypa7wBZlvojZ1pHginYm?=
 =?us-ascii?Q?qiARtlTh1TvoQ9dBb6C7oElQoa8sJ9JwPRQjahHsWTPSxYCIoWpn3liotJl7?=
 =?us-ascii?Q?IdzBFmq5Vx/PHXh76K9UkkOsytG2ZrSSZ6ZqxGLbyOEMnkQ34IuBFFQDkrva?=
 =?us-ascii?Q?ts/9f0IKel/O59qnN4PPogBMRgSPCGHp/eVSQslt12A7xx3MsAQ+xMh1j1+F?=
 =?us-ascii?Q?A55jsIRj64OOb7ehfFNOBNpDbZNLd0c0Tw40D8l6LUThyKSFbYSvzJVdof2b?=
 =?us-ascii?Q?5ywdZrLkwlek+jPRuOX8n+oFVafKbsgYMp4U+Kmu7uovWvj5LtaKtUkQ45b6?=
 =?us-ascii?Q?nzS9kTI65E+WOFX548stlS/GC4xfQ4aJ7QeBEtV9j4Yb4OJzwQstaUJBfFp2?=
 =?us-ascii?Q?eyGrlB09cXqKV6D23rqD3agpPYNI0VoxOkq0QKfFZYPSiyC7U0yw+VdPXIh4?=
 =?us-ascii?Q?W9oWtXcdzB+HEnoocLk8C4DJiVHINYMT9fB7aNq2A4vEztEF2aVLbQfcjPU/?=
 =?us-ascii?Q?T6oLIDnRBSyDglDOBRpQ8PW1uBXNXhwPO19JAMIhQucTYNW2FWvduLL1ifKC?=
 =?us-ascii?Q?6+J+2qrvwRowhOtM7mch5I67tGg2mpZ8lOH/RjXysD7wgrnT/2cDKMZujchS?=
 =?us-ascii?Q?y1cFRR9vP9mU5cueWu04+2I/0oJhiHkv8R+r4gQYqVQYGxXrCf99BnDCp1XA?=
 =?us-ascii?Q?Zf5U/cnCvuiJzvYsrwTKtd8QoSyidOLJ/zzoqgtaO4bvTz+IRlOuHFqOwCHb?=
 =?us-ascii?Q?i7/GH6CKxmoNawylBEftVDCqbOFWXUvgoR12nezlM1Cb5Ki/g/+uX09eo+M2?=
 =?us-ascii?Q?N2FRTPbGHGk/3Sp7n93jOrLE9g1vsUreKyTArN73IEjwaITs8iy6iJfSfwi+?=
 =?us-ascii?Q?HiaaSkLBhOm+KBL01htLRomIVORQSBVcee+AyW8W0fvx6odhkN/M9Rtz1wOo?=
 =?us-ascii?Q?392gtbfwo8GYlgQL9a6CusLinTlQ9hMiPv45HpYoOOiWrA/Xny9MyFrGTTy+?=
 =?us-ascii?Q?IzKe/Y2uiJ71gU4ylc2lcKV6vIlkJmBb1JRuigbZaOuwS37cxklj7x8JWGil?=
 =?us-ascii?Q?tf8KKN7zSg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e930f1-b6f8-4c2d-668d-08df194bcfeb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:22:31.6223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRn6KZFQydNC9l7smTMVDJ4EXtt95iMcKI3b+n+lvdjmtp2yxvnEzc5xaiGhdlK7OfqdMS0/ebyP6O3wUAoG1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

From: Tze Yee Ng <tze.yee.ng@altera.com>

Enable the micro-SD slot on the Agilex5 SoCDK 013B board:

  - Add the fixed 3.3V card supply and the GPIO-controlled 1.8V/3.3V
    VQMMC I/O regulator.
  - Enable the sdmmc node in 4-bit mode with SDR104 and DDR50 UHS-I
    support and wire up the vmmc/vqmmc supplies.

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 .../dts/intel/socfpga_agilex5_socdk_013b.dts  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
index 1e946d5765e0..6b927b35a9dc 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
@@ -39,6 +39,25 @@ memory@80000000 {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
+
+	vqmmc_io_reg: regulator-1p8v {
+		compatible = "regulator-gpio";
+		gpios = <&portb 3 GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "vqmmc-io";
+		states = <1800000 0x1>,
+			 <3300000 0x0>;
+	};
+
+	vmmc_reg: regulator-fixed-3p3v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc-sd";
+	};
 };
 
 &gmac2 {
@@ -115,6 +134,20 @@ root: partition@c00000 {
 	};
 };
 
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
+
+	status = "okay";
+};
+
 &smmu {
 	status = "okay";
 };
-- 
2.43.7

