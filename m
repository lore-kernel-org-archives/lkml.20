Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794905883;
	b=v132i8n0poiJHHaxKIGhs0yeRiQCAopN9/bv+eBA5V409gWHy8S+jCJaFMr08XF8n13T
	 R9s3zMU+YqvbrJwPucTkpf99LrEsXWIv3ASSVzjEgKtKQxS+fod5hZe4kyoWImoG/oKaC
	 BinLORJq+B9c7+32cY0KBIVJcbT5iv+1iX/vCr868FY2nyBe7rmW24lv0nGlh+SelAg23
	 L5wAXGYVsllTtSKljloJGdRomXcNXWVaeYvp0E38vfpWZepFMy0H3D7uzyPq7NY21ALfe
	 Rr5Sek8kSWjGcNcRnEPZderK1sf440CqEPND5LC10wl+Km74SGlWE8GXDECvOGBjFzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905883;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9GzC5lTGIvvDwOchqUuCKilrQJfLwuT71rks0jfr538=;
	b=KJoCRFQ+r4lWh0362njcOuTDVJowzEOYQPq3utePPXn5cl904dnt7bWl0B3D8sknOKCR
	 mbEKK1O23PB/b4k0jc0twz3PCUw66I/DZH7uWuUr7yme7SSUwDJGt63pgNcn/BHG/hgIM
	 wioQ4Of5xMfvGpoj1Goks9c1w9R/az8QlwoBDAZzaUI2h4qexgBQvClCGGNTKrE4B1hkp
	 NJspaJEpTFX26P9lGph93kGWU91LXQ3bI+U0G3JP0594/slcQ/Zu79T9i8Z+bOETbbvZc
	 lA/krNEQ/2g3rwc/9dFWE8eB/kkvF4Bj3aBwXbnt33vxKS4K3QbAJPkCP0BrDGucROw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rdqz31Kv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.46
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF20F606A895;
	Tue, 17 Nov 2026 08:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF20F606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rdqz31Kv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDqu9G+AtlzDpyaqf9R8UEG+P+vNm9c8DzV6zQB/ZnM75CV9dAnN45jHCH2yX5pYiAoDmkUaUvKoa3S0z+mXuH2Nj53RkKqYLICsDtbm4a43XXDGoUnjtBC/Q0KUBeYjHR4XWE4wr0vjXDM0l4Vktaa/euROcm4P8DvZ3/VIj3t23HdVVPfEugE+xR7g13osChvuEWVSuducdjV72HDvDkv0ocqU2KlQ8RxbW48Yes23PjvcuSt79k9GUgiOBv8XU2qRIvITeyovxrD57yCqZk7mt16IzeNe6iJANX0ZzQsSZ8mDFOwOvr2GKkFids8jSkAMCaL1ul2FmBpLp7zWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GzC5lTGIvvDwOchqUuCKilrQJfLwuT71rks0jfr538=;
 b=Pc1JCQRHtf0bRFqnNvHyl1tmWZ1IMmjB1eZTDy1T8X9tTrYZedjyHnyF/X1IXA0lj3P0rNXrKQDgg7YK/z2dRD4+yOphiAseYbRWj1ZnmDxkUCKrnLpgZ9ZgFv3B4mwk4AHIfYDXOZhjCOXe6/5Jmd445i4H9F9KFT/OQ8o8zne4F01fPNg8bEx56gzKb4pNNa87OdVW2TDOcEwPQ9j24u5sFkN42njGdivh4koyaI/aHCJzPpLtGsLci4juvXzD4oUE4NScjtEnqkc27Lwc3r3PjVFjUORaOwXkYS2uM1+AkVnlhWesb/SEkOBwB8hCKuI23IGEIURsLNOy1/Kp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GzC5lTGIvvDwOchqUuCKilrQJfLwuT71rks0jfr538=;
 b=rdqz31Kv1jeyYisz73kUWPutwLJ2wNb3HEEl1DLv4TFdFZIQwD9CndEQOgEhJd30fcTTVEnWe/o3ec+s3OtQtSQOV56V5exGl01vsgyUc2KRhlbOJoETIrAf1Cvf23wTMH5hcXx35BnvXbfMC8gfVn9JSkZrs0GJPhOmOj8YtUQ=
Received: from BL1PR13CA0381.namprd13.prod.outlook.com (2603:10b6:208:2c0::26)
 by CY8PR12MB7169.namprd12.prod.outlook.com (2603:10b6:930:5e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:57:58 +0000
Received: from IA0PEPF00000039.namprd03.prod.outlook.com
 (2603:10b6:208:2c0:cafe::7) by BL1PR13CA0381.outlook.office365.com
 (2603:10b6:208:2c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Tue, 17
 Nov 2026 08:57:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000039.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:57:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:57 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:57:56 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 02:57:52 -0600
From: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>
CC: Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Michal Simek <michal.simek@amd.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Dhanunjanrao Katta
	<katta.dhanunjanrao@amd.com>
Subject: [PATCH 2/3] ASoC: xlnx: spdif: namespace register macros and use a divider enum
Date: Tue, 17 Nov 2026 14:27:38 +0530
Message-ID: <20261117085739.3807943-3-katta.dhanunjanrao@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
References: <20261117085739.3807943-1-katta.dhanunjanrao@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000039:EE_|CY8PR12MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c28c0c9-9137-406c-207f-08df4488e025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700016|23010399003|82310400026|261022105027099003|261021121427099003|11063799006|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261102123227099003|261021123027099003|261009221227099003|261009223027099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NHnzdGcKsVnz/1JcxKiZ2frlbtyXG7Tlw4S3xug+egSiyWpEr0vGiJi61ZtTrU1eOigfxXMDlext/l3O3SrXj5KhzKcaNG92+cOimfiONJ+hisYkloN0GMmp2Zw8WWOrz1H9w2EB/+NfTLemoVx3L2tsAsA96nQsoXKK+LFGAgls0RRFqrXSGkCLypdcz+Jry9pqoXa0sBs5bb/lPGDFeTP73L1eecpjq39GiJ/h6gAcEwDAM6UPf0lqxScoYLEvH4pP5s4AoW6Bf+tbFZ6b1F83f/1+tQWVdmgBXoguc9+EbelbYMNgSPToBTN6LZPTxFXZ8WMWZd/UMycoJP1J5YXFiFYMUuwz8IeSvJ4sqDCY3CtiHOw5451DGtDNCoI5jzcvp2H1r57Y6+yQ0Hu2LKvhaNpuqGlsKziKNXbJBvVVRe5zpB4ubT9TZ52et6YxpS3yJO2Ow00SKhS2RwWd7lUC0aQJ2z0uRLQXV5M2RBatji5m/7LZYX/PKSYAz1949011/2JGpkJ2ynasxDti1e2MuVnfdUcqGyl5FkuC0WRgTrFcbxy69tS4D7EPcQ1TjayPQF8JaBY/yxhah9MznHW6N2Q2CVvzhm8J4uVeqqluxEamcyF93BSYux39YnP0nnuCK8+9Gk4ovts+scM4iBMXsT6iIxF9LSujfyXKE1JG2BznW2CXILnw4jbuANMx5xTKXihQPKMIRHxJYl/U+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(261022105027099003)(261021121427099003)(11063799006)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261102123227099003)(261021123027099003)(261009221227099003)(261009223027099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	63QF3fvI2jVnLQDpH4OOwytgCOcv5JkIx4MPxT8ewNKUAwK5uN+g8fHd2mzk+oFVCvdHeSsLgD99ro7/yGenUaf7G9oW3e8Apea21TrhI5lUJYLktSnABJoh9HIjns2FtKjVG3/wPyg5rJYvLa/5dR9bo94oPExpuS4FvULlXe8fgP7KYgfdQ94Fh/40RmkX6ZEU/jBX3tkJ8Ezl5LvZQwxDZa1yCmx3Or+RPzdW7ZwrY1k56dA1w92y7t03UITk7zc6N+qj00/8LtBwOF/4cYvLer4Cmjp6wQUEAj1EMg565cguiRAVNDb+yRHShdrp2loeVaqHLp4XhTsNvlS1HYWVsdQkVahVPXFXgfUE1IIKR0jhD7kLEXpCuE2FJyhoplMr+mzvv5WlEKRlmyqxGfKuhfvqN7i3kuF2uBIX668g3Aap2ILcFcNeVQoHQsJx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:57:57.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c28c0c9-9137-406c-207f-08df4488e025
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000039.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7169

The field defines were not named after the registers they belong to and
were listed apart from them, three driver constants carried no prefix at
all, and the clock-divider configuration values were written as bare
numbers at the assignment sites.

Name each field define after its register and group the field defines
under it, prefix the remaining driver constants with "XSPDIF_", and
replace the bare clock-divider values with the "xspdif_clk_div" enum,
giving clk_cfg that type.

The channel-status interrupt mask is written to both the status and the
enable register, so it is named for the field rather than for one of the
two registers.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 sound/soc/xilinx/xlnx_spdif.c | 81 ++++++++++++++++++++---------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index 9fdafd45c381..a9d1fe9cc610 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -22,25 +22,34 @@
 
 #define XLNX_SPDIF_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
+#define XSPDIF_GLOBAL_IRQ_REG		0x1C
+#define XSPDIF_GLOBAL_IRQ_ENABLE_MASK	BIT(31)
 #define XSPDIF_IRQ_STS_REG		0x20
+#define XSPDIF_IRQ_CH_STS_MASK		BIT(5)
 #define XSPDIF_IRQ_ENABLE_REG		0x28
 #define XSPDIF_SOFT_RESET_REG		0x40
+#define XSPDIF_SOFT_RESET_VAL		0xA
 #define XSPDIF_CONTROL_REG		0x44
+#define XSPDIF_CONTROL_ENABLE_MASK	BIT(0)
+#define XSPDIF_CONTROL_FIFO_FLUSH_MASK	BIT(1)
+#define XSPDIF_CONTROL_CLK_CFG_MASK	GENMASK(5, 2)
+#define XSPDIF_CONTROL_CLK_CFG_SHIFT	2
 #define XSPDIF_CHAN_0_STS_REG		0x4C
-#define XSPDIF_GLOBAL_IRQ_ENABLE_REG	0x1C
 #define XSPDIF_CH_A_USER_DATA_REG_0	0x64
 
-#define XSPDIF_CORE_ENABLE_MASK		BIT(0)
-#define XSPDIF_FIFO_FLUSH_MASK		BIT(1)
-#define XSPDIF_CH_STS_MASK		BIT(5)
-#define XSPDIF_GLOBAL_IRQ_ENABLE	BIT(31)
-#define XSPDIF_CLOCK_CONFIG_BITS_MASK	GENMASK(5, 2)
-#define XSPDIF_CLOCK_CONFIG_BITS_SHIFT	2
-#define XSPDIF_SOFT_RESET_VALUE		0xA
-
-#define MAX_CHANNELS			2
-#define AES_SAMPLE_WIDTH		32
-#define CH_STATUS_UPDATE_TIMEOUT	40
+#define XSPDIF_MAX_CHANNELS		2
+#define XSPDIF_AES_SAMPLE_WIDTH		32
+#define XSPDIF_CH_STS_UPDATE_TIMEOUT	40
+
+enum xspdif_clk_div {
+	XSPDIF_CLK_DIV_BY_4,
+	XSPDIF_CLK_DIV_BY_8,
+	XSPDIF_CLK_DIV_BY_16,
+	XSPDIF_CLK_DIV_BY_24,
+	XSPDIF_CLK_DIV_BY_32,
+	XSPDIF_CLK_DIV_BY_48,
+	XSPDIF_CLK_DIV_BY_64,
+};
 
 struct spdif_dev_data {
 	u32 mode;
@@ -57,12 +66,12 @@ static irqreturn_t xlnx_spdifrx_irq_handler(int irq, void *arg)
 	struct spdif_dev_data *ctx = arg;
 
 	val = readl(ctx->base + XSPDIF_IRQ_STS_REG);
-	if (val & XSPDIF_CH_STS_MASK) {
-		writel(val & XSPDIF_CH_STS_MASK,
+	if (val & XSPDIF_IRQ_CH_STS_MASK) {
+		writel(val & XSPDIF_IRQ_CH_STS_MASK,
 		       ctx->base + XSPDIF_IRQ_STS_REG);
 		val = readl(ctx->base +
 			    XSPDIF_IRQ_ENABLE_REG);
-		writel(val & ~XSPDIF_CH_STS_MASK,
+		writel(val & ~XSPDIF_IRQ_CH_STS_MASK,
 		       ctx->base + XSPDIF_IRQ_ENABLE_REG);
 
 		ctx->rx_chsts_updated = true;
@@ -80,14 +89,14 @@ static int xlnx_spdif_startup(struct snd_pcm_substream *substream,
 	struct spdif_dev_data *ctx = dev_get_drvdata(dai->dev);
 
 	val = readl(ctx->base + XSPDIF_CONTROL_REG);
-	val |= XSPDIF_FIFO_FLUSH_MASK;
+	val |= XSPDIF_CONTROL_FIFO_FLUSH_MASK;
 	writel(val, ctx->base + XSPDIF_CONTROL_REG);
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		writel(XSPDIF_CH_STS_MASK,
+		writel(XSPDIF_IRQ_CH_STS_MASK,
 		       ctx->base + XSPDIF_IRQ_ENABLE_REG);
-		writel(XSPDIF_GLOBAL_IRQ_ENABLE,
-		       ctx->base + XSPDIF_GLOBAL_IRQ_ENABLE_REG);
+		writel(XSPDIF_GLOBAL_IRQ_ENABLE_MASK,
+		       ctx->base + XSPDIF_GLOBAL_IRQ_REG);
 	}
 
 	return 0;
@@ -98,48 +107,50 @@ static void xlnx_spdif_shutdown(struct snd_pcm_substream *substream,
 {
 	struct spdif_dev_data *ctx = dev_get_drvdata(dai->dev);
 
-	writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
+	writel(XSPDIF_SOFT_RESET_VAL, ctx->base + XSPDIF_SOFT_RESET_REG);
 }
 
 static int xlnx_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
 {
-	u32 val, clk_div, clk_cfg;
+	enum xspdif_clk_div clk_cfg;
+	u32 val, clk_div;
 	struct spdif_dev_data *ctx = dev_get_drvdata(dai->dev);
 
-	clk_div = DIV_ROUND_CLOSEST(ctx->aclk, MAX_CHANNELS * AES_SAMPLE_WIDTH *
+	clk_div = DIV_ROUND_CLOSEST(ctx->aclk, XSPDIF_MAX_CHANNELS *
+				    XSPDIF_AES_SAMPLE_WIDTH *
 				    params_rate(params));
 
 	switch (clk_div) {
 	case 4:
-		clk_cfg = 0;
+		clk_cfg = XSPDIF_CLK_DIV_BY_4;
 		break;
 	case 8:
-		clk_cfg = 1;
+		clk_cfg = XSPDIF_CLK_DIV_BY_8;
 		break;
 	case 16:
-		clk_cfg = 2;
+		clk_cfg = XSPDIF_CLK_DIV_BY_16;
 		break;
 	case 24:
-		clk_cfg = 3;
+		clk_cfg = XSPDIF_CLK_DIV_BY_24;
 		break;
 	case 32:
-		clk_cfg = 4;
+		clk_cfg = XSPDIF_CLK_DIV_BY_32;
 		break;
 	case 48:
-		clk_cfg = 5;
+		clk_cfg = XSPDIF_CLK_DIV_BY_48;
 		break;
 	case 64:
-		clk_cfg = 6;
+		clk_cfg = XSPDIF_CLK_DIV_BY_64;
 		break;
 	default:
 		return -EINVAL;
 	}
 
 	val = readl(ctx->base + XSPDIF_CONTROL_REG);
-	val &= ~XSPDIF_CLOCK_CONFIG_BITS_MASK;
-	val |= clk_cfg << XSPDIF_CLOCK_CONFIG_BITS_SHIFT;
+	val &= ~XSPDIF_CONTROL_CLK_CFG_MASK;
+	val |= clk_cfg << XSPDIF_CONTROL_CLK_CFG_SHIFT;
 	writel(val, ctx->base + XSPDIF_CONTROL_REG);
 
 	return 0;
@@ -149,7 +160,7 @@ static int rx_stream_detect(struct snd_soc_dai *dai)
 {
 	int err;
 	struct spdif_dev_data *ctx = dev_get_drvdata(dai->dev);
-	unsigned long jiffies = msecs_to_jiffies(CH_STATUS_UPDATE_TIMEOUT);
+	unsigned long jiffies = msecs_to_jiffies(XSPDIF_CH_STS_UPDATE_TIMEOUT);
 
 	/* start capture only if stream is detected within 40ms timeout */
 	err = wait_event_interruptible_timeout(ctx->chsts_q,
@@ -176,7 +187,7 @@ static int xlnx_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		val |= XSPDIF_CORE_ENABLE_MASK;
+		val |= XSPDIF_CONTROL_ENABLE_MASK;
 		writel(val, ctx->base + XSPDIF_CONTROL_REG);
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 			ret = rx_stream_detect(dai);
@@ -184,7 +195,7 @@ static int xlnx_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		val &= ~XSPDIF_CORE_ENABLE_MASK;
+		val &= ~XSPDIF_CONTROL_ENABLE_MASK;
 		writel(val, ctx->base + XSPDIF_CONTROL_REG);
 		break;
 	default:
@@ -287,7 +298,7 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
+	writel(XSPDIF_SOFT_RESET_VAL, ctx->base + XSPDIF_SOFT_RESET_REG);
 	dev_info(dev, "%s DAI registered\n", dai_drv->name);
 
 	return 0;
-- 
2.34.1

