Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794905886;
	b=oEXXqb8DVSIbeONyi4bF3QoLhVKRrExVpPppGCs0cEOzYErB0rwq6VHuC16Lo7bGDuZ+
	 yBb/HTBcHL0SPBN+yU2znIvWvPFB3KOaT75jnHMgrR3HgB2Pc6UjtGOgi+d5Ek+fcW826
	 hzZ1pgpXXX4YW/aEjAJmGiQaumwWidT9eG5xB7TVYN6fa5Wqu/Lay6hBtV0CGSlGzQcns
	 ryEN5G6/n9Wm2d/fVRdGN4RmdAOxyP7v26+6C4FKdNXj1oNP+llY4JyNAVyMSfjWXYqeX
	 HFYenIXmCdm6pf90ni+NJBs06Qb2WH4kks4lK8/KWl1eL0U7qgCoA39P53LXTozhMug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905886;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=N68KbO525tUv9R3oqNM2uG3doDDd5gv1KbV0A96De3M=;
	b=e5NFwruttkPljT0khk+vTYUKB5MTdeDTZsnFHAzrFZ1FNASQmI/fnmwNj2vbd91VBbbe
	 emZEuY2gp2sDW6Dut+S9PAFYzDHMB/R6thNCHUUrGNBZelqPCSTAh67zvDcMaKv8dOuY3
	 IW+8mo1zzHYQfZRmREyIvpt1G7jniFvZNywlU7bqhXkKFqk3FvlwEzn+zrCmF9a1Qv41a
	 u2lDqPkM5nN2kMo0s28Jy7q6V9k5R5cG0OMuUpq3WzVwa9vccmwSGoYImxrhrm2aidZtF
	 KoGDyj28LP6asJyQUheZopSpzQsGGTHp4BUvGTCEMQJIJzA/x+4jXxOrbK+25iDiOVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Dzwt6YfY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.10
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31355606A880;
	Tue, 17 Nov 2026 08:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31355606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Dzwt6YfY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oza3LD5146XXpadhrLSb8erTRktAFOCZdYbycNOdJF3g+OqKGFZsX/BI/FqzmAkSqPWlIO1fEf3jF6Zvp2TdBZ7vqYqcrXaKVSJJ/DYS1N0NSA+6WYiqZ6GDAna2dYoEskVKVuAUIQgq1FDcWFVpyzdFx4uzg2V5vvHeqFQSo+35OyOkWDSHkOOcYICkpFhu2Q14pZCykK0XLSm4P/CEfp/Th8N/CUP4keUOS3SF54vR/Zu1v2KbD0xQJDzri5Vbl1vfhW7EiOMyRUlNIYMH9oUt4PDXfjH0JDS8hDp/NGtHPrWJEe4QDC2+MIKvB/queRhO0GGLaSjgygG8dRvo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N68KbO525tUv9R3oqNM2uG3doDDd5gv1KbV0A96De3M=;
 b=bL74mDUkEudOLTDfuBJH9dk5mpzi3Eeb4xZRmn9iXGdUrZjeSgYGaL2JjQjGMVLFHFgBd0yq2ZFQfswrgjnq0zbKF95bFwb2GAwhrnSVmgLDE2K+zLtTXrRF61s7oZ8FquoXLKlciPSd2IDHC+c4zWQ7SSLc6Jl47DAUPveZy05LgryKKQk9iEYoj+2oLW0dJxuL6yrfuMlRZDcQhP6zOjzD3xAHvCoIbw3VNTFslPPyrZNtLUMRTu0fjkQjbiCdt7+ud6Z6kbRXHCXr6Q2P1tKHMQcLNnP8WARFGLOk4XUoBY2iCdoor5wA6F4CRV4Eh58MyMgDCbDQuTw+Sbjw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N68KbO525tUv9R3oqNM2uG3doDDd5gv1KbV0A96De3M=;
 b=Dzwt6YfY9TP++PHDKukPXZHfOH5lPXypNsRS90VRzW0Ve4sKW5nX19WvY7MPLlyTwpwvCYEtnAjBTeMym1zF3Rvuhb32/if+Qa1/IYoP6jNoVSg3yFGeEPaJTrg40sFnh/SKb/JjcJnrznmLhJcC3AIKW0UIk5fAgG+DnmoQ61Y=
Received: from CH0P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::12)
 by IA4PR12MB743615.namprd12.prod.outlook.com (2603:10b6:207:150::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:58:03 +0000
Received: from MN1PEPF000793FD.namprd05.prod.outlook.com
 (2603:10b6:610:11d:cafe::a2) by CH0P221CA0037.outlook.office365.com
 (2603:10b6:610:11d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 08:58:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FD.mail.protection.outlook.com (10.167.249.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:58:02 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:58:01 -0600
Received: from xhdrdevl202.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 02:57:56 -0600
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
Subject: [PATCH 3/3] ASoC: xlnx: spdif: get clocks through the common clock framework
Date: Tue, 17 Nov 2026 14:27:39 +0530
Message-ID: <20261117085739.3807943-4-katta.dhanunjanrao@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FD:EE_|IA4PR12MB743615:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e80bdc-0818-4d0b-98c4-08df4488e33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e+/fU9zL8bqWGsxfg4dfUfCThwOBO5X5CwMLVXNcD1IPIaW4wiejV70EySuz7bDSwV9IBkv80UIpEd6aiwtHLETGZB3gFJtoko57Mw7xCS1OtIoa1wmvrtphTB8Zhyu1u8wlsqdb4pOa7amaoTjsAT+exqkThF7UtF3/oQ4n42vZ4KrcFO0SKFiUhtmGGl2FaYLL1uFtjCeIhgKGrgiszlXAlZmEw8dUkdXetSqYHL3FjdawEqH4rfhAFxHPozpAs/EhUEuUSUjQZ44VV4njDNytAkzdn5TxWDUa/nPNM04VkD2Y2z551cWYkyDeNd6bl5m5bo0Y7ZeRtTTbQ8C5Vpuf09pLI3+N+GPBAvjq0lx9d+291nBAx5gmoN1FjHAScfHR61oJ56XEX23RHaLIKpfr8p5uwOw5tBUYrx+r40YDuN45jqvRcPaniYVWLcPJfkfZlXuEn0szNaE7J+UpqpuORbe7N9Pf45ZIYpe4jatbmbTYS8FmjvY2EnL1XXm9UIHGVyjP+cSRtzj334SbFa1ughKJMxHPBikvDf+YerFJYChbW1KAwd9ri+2BIKs1FQZHcf2hpq80UP6+PMQyioOmq9rf8JMCctD+xSrlbJ4sV3JHtAr//dpUEa/8ATQWubuk1lvo80CNmkc+crn1O/mjSp0QHg/xojT/K0w6k/nrJagtXOVrnAYSZeO0jyVWIGm4qg9gdX0GlYMxEzRQtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XVt/RJcC/TGbMkztpkAmgoIO5cPcUo3sZAoycutekAghoXHfnLBKvkt8GCjdwcyECQcU2+bmhmD0Ev4KoPc4I//OoXG8Mt6XW8QplR3YcwSrXhrKcrPBZLXNVU5/keZPDd/j6BFFZ2O/LKovtV1xkW5j6wb7vp9vpC0BUIwLhT2agRvCixvJjG1faGGJjOIl3QKrbijXoHeFSLN3Vmqq8xVCca9suCsd/qQoUTzCqB0f+BTuzMMMnZn2PEpX9sfzFVhcPKLnZfo4TZDBJOISRQr9vI+mF0KieyIjRDJXx7Bb/mhok5dp//9q3fHYG1RWy10vUq21DJHMoSI20XP5h6dzg36dx3R49kZ9gWq/DfkwPL3TuPLsMpAyPUxEkhEiXxCtxstmCgcJmHM3RoqBea+4J9m1QF9eHfMuAYnDQneugda6RXNT1P+YsN0kqxRj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:58:02.7981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e80bdc-0818-4d0b-98c4-08df4488e33a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB743615

The driver requested only the AXI4-Lite clock and relied on the firmware
to leave the AXI4-Stream and audio clocks enabled, and it took the audio
clock rate from the "xlnx,aud_clk_i" device-tree property.

Request and enable the audio clock, and the AXI4-Stream clock matching
the IP mode, through the common clock framework. The AXI4-Stream clock
is requested with devm_clk_get_optional_enabled() because device trees
written against the earlier binding describe only two clocks.

Read the audio rate with clk_get_rate() in hw_params so that the SPDIF
clock divider follows the rate actually in effect, and reject a zero
rate with a diagnostic rather than letting it reach the divider switch
and return a bare -EINVAL.

"xlnx,aud_clk_i" is no longer read and is marked deprecated in the
binding.

Signed-off-by: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
---
 sound/soc/xilinx/xlnx_spdif.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index a9d1fe9cc610..b233ab1a92dc 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -53,10 +53,11 @@ enum xspdif_clk_div {
 
 struct spdif_dev_data {
 	u32 mode;
-	u32 aclk;
 	bool rx_chsts_updated;
 	void __iomem *base;
 	struct clk *axi_clk;
+	struct clk *axis_clk;
+	struct clk *aud_clk;
 	wait_queue_head_t chsts_q;
 };
 
@@ -117,8 +118,15 @@ static int xlnx_spdif_hw_params(struct snd_pcm_substream *substream,
 	enum xspdif_clk_div clk_cfg;
 	u32 val, clk_div;
 	struct spdif_dev_data *ctx = dev_get_drvdata(dai->dev);
+	unsigned long rate;
 
-	clk_div = DIV_ROUND_CLOSEST(ctx->aclk, XSPDIF_MAX_CHANNELS *
+	rate = clk_get_rate(ctx->aud_clk);
+	if (!rate) {
+		dev_err(dai->dev, "aud_clk_i rate is not available\n");
+		return -EINVAL;
+	}
+
+	clk_div = DIV_ROUND_CLOSEST(rate, XSPDIF_MAX_CHANNELS *
 				    XSPDIF_AES_SAMPLE_WIDTH *
 				    params_rate(params));
 
@@ -271,8 +279,18 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "cannot get SPDIF mode\n");
 
 	if (ctx->mode) {
+		ctx->axis_clk = devm_clk_get_optional_enabled(dev, "s_axis_aclk");
+		if (IS_ERR(ctx->axis_clk))
+			return dev_err_probe(dev, PTR_ERR(ctx->axis_clk),
+					     "failed to get s_axis_aclk\n");
+
 		dai_drv = &xlnx_spdif_tx_dai;
 	} else {
+		ctx->axis_clk = devm_clk_get_optional_enabled(dev, "m_axis_aclk");
+		if (IS_ERR(ctx->axis_clk))
+			return dev_err_probe(dev, PTR_ERR(ctx->axis_clk),
+					     "failed to get m_axis_aclk\n");
+
 		ret = platform_get_irq(pdev, 0);
 		if (ret < 0)
 			return ret;
@@ -287,9 +305,10 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		dai_drv = &xlnx_spdif_rx_dai;
 	}
 
-	ret = device_property_read_u32(dev, "xlnx,aud_clk_i", &ctx->aclk);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "cannot get aud_clk_i value\n");
+	ctx->aud_clk = devm_clk_get_enabled(dev, "aud_clk_i");
+	if (IS_ERR(ctx->aud_clk))
+		return dev_err_probe(dev, PTR_ERR(ctx->aud_clk),
+				     "failed to get aud_clk_i\n");
 
 	dev_set_drvdata(dev, ctx);
 
-- 
2.34.1

