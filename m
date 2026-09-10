Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8FA478E2C;
	Thu, 10 Sep 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040726; cv=fail; b=VxPOG5mpAw3IciNo8FXR6CyannlMhbKykBfOYXI7MNYMmjVPKTL0+pbAkZj3FMvv2JtW/WkLjrCfb4nrjWYXd53ebeeuYVQPmuu/ZZ8RVLnmGcpXrsonk2Rmd7jAEW7pXgfnoiZdP0CUdcPDUbLxtE8KQV0FzCcEBx6XkIsweqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040726; c=relaxed/simple;
	bh=0MqeHErgVEoDMDdp7VHIphYok8nZ0scix/BrR2Gghhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IA3ZtwHgpnhNtb2eHWHaLgYbLTmzQBX0ghOrDTk7LaCEFjYdyjIl7D5WKyOXY3cV8/8q3chPIJQF9+txWS8YZG+4cM216nrVznSfrgVjGiN+OE2XkqBXDIo6tf0KVF6us9PwU5ukGTVwhqqSVNfJpBBoktMya0ddsExN2/gjl98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=e8z4zsoD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GiCtjbHh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="e8z4zsoD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GiCtjbHh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IggaS3050653;
	Thu, 10 Sep 2026 06:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=wCjDeeTkEjVW+SraqehDVzpJpU3LyCgq0i1/veU+jcs=; b=
	e8z4zsoDxO/o9c1/zWCU7XXT2C4oFX2a0Q0ajyAsFnA64Yy+NCuYUSHpHKy2JK1D
	SUKqnmZPllL5CLIAXGoLt0SmhiOY391sk+lUB3E070/FxpaA95VHB5Z4lxnNhNoJ
	Gz+yRoCds7is8aqSAirbRYGqCxTOfJzOs+5kOGW3/Jdhk5sTatX/5gdl+irAGC/K
	OiAcLeZHZFsGV40+IwI4JDwiac5YngOJ0QMpdSizVh+ZqViEb3tV42Mt0sg1+m89
	Cc3xy5fr0WSpgc+9wTX2IGq4/qRcurIJGiwynG2dXWvYH1Az+P0ZPqeZEYbvjU7e
	s99uvJpUa/vLqrm67TAQfg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022079.outbound.protection.outlook.com [52.101.53.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyp92fu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 06:45:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQjJ4LwQmHSY5TmcLxJ6bXtproRRRF945JyhniZ+iAdRiZAQ2UAWP1Rci/9NKplh/ekgnDJyM9o5mfO2O5nDheAnoVhCd9FGW2tbTGAmfzcxC36ejigZSOxq1HwcnQs8XeTwpMKiJbdPHbbukAF4YPXZ+mQlaoXQfBbfZ/o8ws6fmjOL8pVmqwSY36zosR6EDYPuH+Lsy5wTF/h/6diNq9qcxEAEqZ9PCoFj8X2bk6H0BFHfnf2Ui/AKyQ2J78wRPEI8dWw/UQEi1j587tIxWIb44jw4CZlT9IvlFztn55YpKobaz18wJ1DG2ftw+Rl8To9434YEdPwpjNvytsr79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCjDeeTkEjVW+SraqehDVzpJpU3LyCgq0i1/veU+jcs=;
 b=KDOw3JVlwHFhIxtrZMrts8U+k2z7RquSzaiXx0Q5UXqSy/AJc/LkpDnQYaBJfIWSkrAein48H3vRDLpIxE1D47DrvytMnnyf68fmSQQ8OTZQhL4nQuob/XatgnTDMomgsUSEKOUsNPmxuWj7CK0Yt5HYlQI8GepfS+yvhWG3U+pr/suoUsmzx3sBTmdT6JArdv6NJLvPHvybeNqFBCndif9EsQZ6FdlBGJHh/K4ioLy9+xPGHnUuGIJ+4+1cyKCUbW2uVlmMAJgnltuCVXCyiDIaSXGOAQY30aTLtTEs6VAOIIg88Hg8kzs93Vig3VUCJY3CUFa8Dcn2hozqohhXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCjDeeTkEjVW+SraqehDVzpJpU3LyCgq0i1/veU+jcs=;
 b=GiCtjbHhVUS3HQcpWisCvJa3mSjVY9RLF3tC5OCQ6FswkQbnftLPNXvuRVz491wFd+vTyG0BIjYXQ5NVS+s94URFdnFA9eoCYMkgpo2GxfJ/s8aqsqaFmB99viV1gdo+ZdDOTjtNv+y8sTa5jgao+/6e8qLlEwK2Q/9U/feEskI=
Received: from BL1PR13CA0292.namprd13.prod.outlook.com (2603:10b6:208:2bc::27)
 by CO1PR19MB5078.namprd19.prod.outlook.com (2603:10b6:303:d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:45:02 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::a2) by BL1PR13CA0292.outlook.office365.com
 (2603:10b6:208:2bc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Thu, 10
 Sep 2026 11:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 11:45:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4CDBC40655E;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 306EE822565;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/5] ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec params
Date: Thu, 10 Sep 2026 12:44:58 +0100
Message-ID: <20260910114500.1586637-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910114500.1586637-1-rf@opensource.cirrus.com>
References: <20260910114500.1586637-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|CO1PR19MB5078:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72e58c08-afa2-4991-5017-08df0f30f33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|376014|10067099003|22082099003|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SJyD+ZyuaZBUyDGmgRlTkYEPHlhzYsSly2ZFzEczguoFRpKtil0RAzKc/Kc9x49pYHe3BKkL1wuobDspcso3zeQu59VQRgHv1pTbVwz6odfe4q7nk039npUBCkvbXpSozRLzoISVDFztbh1p2L1zNy1zs9yLRrf2WhYTU+JJoJ40RAeflJFztWwFcHklk7avgJPcF1fA+aB6LqyNSmjHjs5SEfCvUJGPimmabTevqBPyZL4sWOAS9izsGKVKfV1uCReFXkgzFRGitXeUVH/6w6lJrSJa0FUfItG+v7GhtRyUbpq68qlq8CU7KUOyPnoc9E256G9ttQZgyPIZfsqe+YX5CECwakznQlY36CfIizwtZmCLrpJsI6FLBNHFAwDEHVgYazBoNjS/S2dtCXWC8/KzTdRgpL+Nhwd0s22QWHBb4g6vghJgp2tE0N3GyMrPEV+8iuUVclLZJ/M3sSpaZR/SaJ2GetmNl3SyMm6cSdH5+QMTLUU/NLfy3LoLMco3+44+eZ0sCHeSQd/go6AOBpIzrN6Xvzw93E+scDTZNAApNuS1TsCxeqK4lTDsp4YVuE6xnRqvFjVqtL0OWjgsPOQd7H4K1WvWnnUcBfoLT2kBowoUfauN5ArBXcU7Idxyvtws1mgluPADesv9lYioWhOk71us+2hZOFVZNdJVaG9b2DVw8LTni12oULeHBVt44bKnoAflJ7A8PeWQbe6OxQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(376014)(10067099003)(22082099003)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h0MR9y57gHjny3MncH6oj1d1LfBwkTXBOQ7es+LdqYrY/y0DMbZ4vJ9omhG+WWhIT9KahHB6+xX8F0Q4Pwa+E1IN97dUOo/v4nD4+Y27LRn44F9P2uYthopqkWTVzMC6j+3tzKEpp5H3U2eiilfBzcgPwExecsi66A8GSs4KOuGmaI+wBF33uxOMDqvPy/JtOwmiaznsu8kl5pc7vjjqPnBy4ouolzoPHm6EvkHXPjwNenu/TlFGIR/yWz11Bwv+v5Y9gbzcNazwzICl8V0rmfxOPRP0Z1jO1BHpbH47wDqEpKEPF0jQdzYsbU2dpUSCjk4NhG9INBGCsP9vQUnXEvZ4g+r1glS22xbdNX9qUQGY+KIqnKmrBQtR1Zba58sZy0BomL/mbhnjmcE19IEpg78c0X3Pkq5j8657Ct0VHaVJlxytwLyIeIt/espOO7Em
X-Exchange-RoutingPolicyChecked:
	hINMKrSysBbk7FO252QOG1el9++epNbdb/hXInUqzCeZGoMm3pGnFeA42NXhPFp8B2SzX2Op887m6YvISONjPoqDQ5Dnn9FKNvfak4tzACtQsJntZ60rH3NqVlnQ9Co68ZR4YFDyLnwOm1cbY2wQXwGqWhWw/1Q7KLBvjUc5CV1agLVUdaFVESkX/Evr1yi58yxFwSLUusiV8fvBgGvBjno2fNYaPQlcIUhJ8eCyJS/oXj94xhMpyLbFMg2Laoe76P7kCCvGsT7Qgd7yQsk5WF9Mqh6mUFi6+4TlrrbroHIxYiKvHhiFU8a+TpNMpJ9vdgr9bptsngQhLGxMM65Y2g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:45:02.1260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e58c08-afa2-4991-5017-08df0f30f33a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5078
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa29844 cx=c_pps
 a=Y1/fp9MKcFODYkh4PiV91Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=nxyldsqHaxXUjoYXuOwA:9
X-Proofpoint-ORIG-GUID: CiFG5fAvnRaI6Hf2-1sehA-j9SeeddbD
X-Proofpoint-GUID: CiFG5fAvnRaI6Hf2-1sehA-j9SeeddbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX9msFAnSOL9Rx
 +NJ6NmJOs8H5LFXe3JIoAvUuVx4Z6lNNPyHxgYo8HQ0ziNARvGWshTquBUAQ/rFW0FlC7MbEdET
 jdEMy0Og3rPHgJuc4t7UteKYfMVR7SAxzsDzMa6KkgmPoWD9F7l2N9SXT0lG0gRGbI5a4W6gog9
 bqxwygt7bLuq7O3sUVlc3XIK1wes9qgVZ4JFowttQ1S7KwSTsEcjwkU0Qsyx/C5tI34Jy144p5V
 gl3/mNObySaM44QApAh8IBq4MaReU1jhg80UqXH+5ZukL1P7Xmo7eTHDg0TE8EkFLwgHZEPjzTo
 9vJb+KOQCVhe28BqDRnp9O5Xxoej2Hv4H0J3CldQ3981jTkrqu0Vs7d2zPmE/3KItCEt3rg2+mY
 SQde69Zjc9NtGXViOwbeUpu2yCpaHMWjySDnpxE9CxlLwbbGBvvzztdxCVolyytsyyxsnUwFSNq
 brSEMv79pdmv+NpXAKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX2Wm+Egu8eYsv
 6BBlfMzGW1X1FopdISUaEY37Oa177CD3+4hZM3h3zwiP0KGabccafR1+8fK3luQwZVSrJUk2w3/
 OXa/+oV6QHY9gJ7V0ICjsKoaXTTHAaQ=
X-Proofpoint-Spam-Reason: safe

In __soc_pcm_hw_params() if there is a snd_soc_dai_link_ch_map with
non-zero codec_ch_mask, use that channel mask to restrict which channels
are enabled on the codec. But only if there isn't a TDM mask.

It is possible that a snd_soc_dai_link_ch_map could include the same codec
multiple times on different CPUs so the for_each_rtd_ch_maps() loop
accumulates the channel masks for all entries of that codec.

If a TDM mask was also set, it takes priority and is used instead of any
possible snd_soc_dai_link_ch_map entries. (They cannot be ANDed together
because the bit positions are indicating different things: TDM is a bit
for each TDM slot, codec_ch_mask is a bit for each codec channel.)

This fixes a problem of incorrect TX channels enabled on the codec when
multiple codecs are aggregated on a single capture link. For example:

- Two CPUs with six 4-channel codecs.
- The machine driver chooses to assign one channel from each codec to
  one channel on the CPU
- But the codec hw_params() would be passed a channel count of 6, which
  (a) is more channels than the codec has and (b) allows enabling channels
  that should not be driving the audio bus.

Fixes: ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/soc-pcm.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index cb64ced21149..3137c091bdb8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1206,7 +1206,9 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		unsigned int tdm_mask = snd_soc_dai_tdm_mask_get(codec_dai, substream->stream);
+		unsigned int ch_mask = snd_soc_dai_tdm_mask_get(codec_dai, substream->stream);
+		struct snd_soc_dai_link_ch_map *ch_maps;
+		int j;
 
 		/*
 		 * Skip CODECs which don't support the current stream type,
@@ -1228,9 +1230,15 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		/* copy params for each codec */
 		tmp_params = *params;
 
-		/* fixup params based on TDM slot masks */
-		if (tdm_mask)
-			soc_pcm_codec_params_fixup(&tmp_params, tdm_mask);
+		/* fixup params based on TDM or ch_map masks */
+		if (!ch_mask) {
+			for_each_rtd_ch_maps(rtd, j, ch_maps)
+				if (ch_maps->codec == i)
+					ch_mask |= ch_maps->codec_ch_mask;
+		}
+
+		if (ch_mask)
+			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
 		ret = snd_soc_dai_hw_params(codec_dai, substream,
 					    &tmp_params);
-- 
2.47.3

