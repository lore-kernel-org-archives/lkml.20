Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827CA459AED;
	Thu, 10 Sep 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040714; cv=fail; b=qtLavUUJxkGsH7Ok86M735Q5dlHSkqF9KONhQiEiXJSd0X6WHBDr5bFqI79JyJLhdzpU3ceUfOqDtbGBT/XxbyVOazozXdS3mWJIdwQv7Gczaee8h+eM+fcNdD84W8P3xqeEPwCTDQG5dyxkksM9uaVvMWLy1wiHGmx3SjbV1aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040714; c=relaxed/simple;
	bh=L7ozkqi3dgU5n47eUKucBBIMX/Tvw01SF8sYplnoHRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjYWzy8pU3uDU9q+qFIVtqbr9mSyBHk8XKV0TIQ5xL9qfSjymw/FPrxarSctJ1upr7P3AbvEv2Vf7R/4ca8kAivHQWmNSoXtqy19R7d4dB5vkSJH1iOiK6r54PrEFCiLSxPJw4HEMTKvzQC1tjyM4johDpyLjHuB4No6bdvO55Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZEfviTHR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=0F8XN70L; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZEfviTHR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="0F8XN70L"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgkGo2106863;
	Thu, 10 Sep 2026 06:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=RN4XQ8jcBx0tvqDNMTKatutCqBJrQjmiaVWtQD/7upw=; b=
	ZEfviTHR7TdqtX5zN7p5PmEuYBnGl9bz3D2TOVVKWQZemgHwdSkRpqBrhFvY+4TF
	kA+AfYXlTDjEyrLncDMzUhAuvh6Ra1RBRzTUQYX/B3N8GntmDLin2xzyz+KIChUz
	lp8LXpn3TaVLAXHC1AYBVzWVbW0d9Zt06RkWc0scn/DIe+6NrxKDFiXIFJ9YVZ9a
	n0/2WMSfjNgNqK+1U5UV8tG7cxLFBU+zMB5fsWO5+axsFwL+SE2zCygqLk+3D6pg
	tfEHevch/cia1Fzk4I68w127u8u8FFrr8rsp2YgUW38CHijcqL152wdc4Q+mJLOM
	FRdUDwlQrmkTi7KwdVBanA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023104.outbound.protection.outlook.com [40.93.201.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyms0ke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 06:45:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEXipSqB7Ql1/gVAfD5y3x+2w3tOfBuZ8kzYloUAgo4zAtfqg6DGb3DEBajpnQc6uafPPN1FCMT5xbxM68jdXkPvee1EOUXg0/SZYakqbyMwo2C/tM6Zr7PC+UF5BJD0MUJx96wS1qcqaveSPn4JcvtkLHs2sQ0jajIAxVX8xnXGI17iVAAFedhq+d1oPjxOLWkoB1/oTeHKc39XrL+Cs+R+mREBmhepI6nAj9OCLxK/K3BPLUfPTo4Jtke5Si3FGat+8OFCQcvkffjSF1DpZDLp2JjzR+jDetjYo508EwqSFbqx6TZzo+xyRSDpashmUeo6ugfwrXp5wJlhaEHtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN4XQ8jcBx0tvqDNMTKatutCqBJrQjmiaVWtQD/7upw=;
 b=r8S8DQTkKyUmDkFMje2ILz0n+vPLgydKnkcDojG5sgOcPDc8QKEDmvWnRVgCmlAmDqC7W6YmIp156ML0sbneViRKHOaxCdAEjeWjv9XrBd/Bw8YF56wBLqJcYnmzr0cbkoFkon7wDtyPNXxS1DVipoXN4gl2h6RlruEaWi168+WIJrTWI1fHNBzpLeFvOi+hRYUTah1zfeLuO1GGHXTZhn1GiVdJCqekAuIFMZXM9DmBth0raU4C7VANzFeHAcOOW5UmCCiN7RAIS88dwyYXT+UugdryCvs21i6kTES6IpBb/XrQQw/FYtVr/YhSEeg78OgauD35xsw8tZpcbp+NWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN4XQ8jcBx0tvqDNMTKatutCqBJrQjmiaVWtQD/7upw=;
 b=0F8XN70L18Z47unnC1o55oAQLZ2zejDczU0a3gL0dEuM3357ieBX7wKLRwcYBwEM0bZ8ucWCjsmfUPnjEsTZU6p9Jy22asFHGpF9qpyqdpQQeH6xSPgSS7o01bEptPZ9H/r3NFTB7yYe+Z5UWX8sqOndnoDK1KGjqE42V4vSsz4=
Received: from SJ0PR03CA0299.namprd03.prod.outlook.com (2603:10b6:a03:39e::34)
 by EA3PR19MB9567.namprd19.prod.outlook.com (2603:10b6:303:2b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 11:45:03 +0000
Received: from CO1PEPF00012E83.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::9e) by SJ0PR03CA0299.outlook.office365.com
 (2603:10b6:a03:39e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 11:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E83.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 11:45:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 46F8240655D;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 20A0C822563;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/5] ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
Date: Thu, 10 Sep 2026 12:44:56 +0100
Message-ID: <20260910114500.1586637-2-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E83:EE_|EA3PR19MB9567:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 291468f6-feee-48dd-b0f5-08df0f30f398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|61400799027|10067099003|11063799006|56012099006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5JedYuoKQyLb8l797z89P2sfRirhe8lljTIEP838Xv5u2YtNESSflLD7xLwXoLT5c17VNS64HX5r3m16wMyF4XRIZtq9NTNz1Bt3J2rqRJ31rv/c8ZIwY8xkcZrxgmnsb5AKDuiyroUWTNin7xrJD4LqOte65TTF06BEfsyjJ4ggQcJPmMd23yfIfWJ4xAAG25yMzL66nvvoSB/33IehJ7GPp711XFVcRzUk+RvVkdnp1aRXdd2ZueVOoWMMQ0KgZozmztBEnj1miQ3HFpjzj2YbG2znRfH3g/9Q9TIIyZz/lu/H114qXtH2ZLPO2wn8s4w1HddXnC2ChMOFxEoWQt+/yXL2FEJOZpATs8PpYlgwZqf4xYGlbfw95upxjwh/av7LGXlG/rlVnxPdyIzLe8ctF4QTm5X/HZwgbvIaOZntH57PIl8p9QnyFiJxkWFdVXFwP8ycqq2Qz2nSx0uynzxApgQrIB4oweHa6v46e1d2nrgtyrj7/TUcM+CSCJAv+SiO063IIjTUqlIDhfvseLmoddVtd8rNd3cGnOnDnV0rgtR1GxGYJG/z2aefEvvgANO9SoaNekpRQocBhboJT2y4KEtdxP8Mx7UyVu8psDSAFRlR0MObfq/Hr4OTWocCwItUnDg9O2KUWLTrHqRTTlu5hj42ehyfppylfeA1EgTOpP10bmy2/1+fVdYhmWuPej9Zg6ILnXeWL6xnmidQRA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(61400799027)(10067099003)(11063799006)(56012099006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LKaHicZ8rI3Kadh2WbDwezeTxjCfre6YZUMAVDcS8URzu06FTe9ntXSwU5zzRmAhGWdJ2IAnr3bkwDn9kDC0Kw7L+JEux2SxJ7jN6ExDOg0Lpi7nEDHYWUvTbkEF4i/P/ckYhGu2R97iULsOIta2te6wRr+8E4UKg6M5jGxISHw2QU+O0Gma0f5W9gUlNFD8+h4rP39/vJG5CoDCv9HiQsCXJM6nXgObdsQBHoGVoHOoTMA8MQaKZvNu6hq6JGxP98h4RET61P3bF++13g2mMY+rCQ+7IjaV63WWPwdpHwb8bTUN5PESmyGmwchazyDn0Ksrg1JyRBft+rN2dstor+cfP2W/rqln8Te0vCVeXyu/HXXBDdt2xtz4IEM1Uf8DzxD6GN/BNyriCC241AWmgK13HVoAMoarSCaMgnu0/IooEmQzdWsZaj9BBuEyQfma
X-Exchange-RoutingPolicyChecked:
	tJlt4yqPezF+xsW2W6ap6wmp/ZQ2Pfdti/YLpc5ODXSCoaFZNJAHouBQKx45XqnfuPY/sILXyE9KmSGgYiUu9iL5HmGirjD5RLS4X6lMmTBDxyZIplHidKWaKvHXG6TXU3eXUhEB1Um+FuYnqsNgfIzsBXgdda5TUMa+IRh9zkc1EOx+8x+5j2HeuuvsOan+Kh/JcZjCSuoufGZQRzbYWg16FsGxKIJHXr2A389pAxJO7CmzOb9vjl/U580Gv+YojSgWMjTzbHZpgQaSMDJCNPIE6eJHNguo0uwbL65CE4/GMY9Q/hIVivMs4aLALLFqe19BPJUWz+mGirrPvIioFA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:45:02.6268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291468f6-feee-48dd-b0f5-08df0f30f398
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E83.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9567
X-Proofpoint-ORIG-GUID: 1ndfweWE3GGUSU-ZNLExd4OWcwyr6792
X-Proofpoint-GUID: 1ndfweWE3GGUSU-ZNLExd4OWcwyr6792
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX3zxOari8yGvb
 igcA1CFF4rBaACtQ8bJ5j+Oh7UJubAL7pb3zeA5jahKyATAnm0CHNOH2DcveVSkZtKWlDMf5wzx
 UgCkjTD36VFglJbQR1/UXMGLAk7eF3w=
X-Authority-Analysis: v=2.4 cv=OKiyTiaB c=1 sm=1 tr=0 ts=6aa29842 cx=c_pps
 a=0zbhqlog1HYD7RdPDvTXcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=vyt6Wrf2iDEc68905z4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX69G4fNKaZWyb
 nBGA8EqSb/+ELS4Hr7zYAilkPk29Ei8NeNyown9G1vcIjoej7nEQpAKSyQZQm+3zH4NXp9gU/ui
 EDn1shLxuk+9Ev5UGOuMCxbl/6aZVccsL97k0gYfLsU6ZXMtn8b4OPyoWaY4Xc7NZHE4GOhpOvp
 kGlVrqqw+QHGN1fso+8JgsGxkNnz9486e3SsybAdvr5DEIGvZYjMNLY2z9zAhSpA10u1iTy6LfC
 Wrb0AlS1RjPXrZ9e+90d+3z12uhQS+jdgVKtLKg2NrcMmNvdkF+hBgKSqYY9LFQFYrgjJx4V5GY
 uVuymSLJisasdFJlURZVN/VlRZFNf/cs3rhaLFrg9JIdxXIktHjNXZqY+qulSAnK5ghZID//3bt
 aaaE3P8YxT04l1xSD7IClEbYaJWHP/tRHxhUVn67Cm9IedYN5nQeMRe1js7gGy5yDpKQ/S9jBte
 6QIkYs51KjXNRKCcP3w==
X-Proofpoint-Spam-Reason: safe

Rename the ch_mask member of snd_soc_dai_link_ch_map to cpu_ch_mask,
as that is what it is used for.

The CPU and codec channel masks are not necessarily the same, and are
quite likely different. SoundWire and I2S/TDM both support assigning
different sample slots to each codec, so for example channel 0 on each
codec could map to different channels at the CPU. So it's quite normal
that the channel mask at the CPU end is different for each codec, but
the codec channel masks are the same for each codec.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc.h                 | 2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 +-
 sound/soc/soc-pcm.c                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f46b2bc2a022..94c9b75e27e3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -699,7 +699,7 @@ struct snd_soc_dai_link_component {
 struct snd_soc_dai_link_ch_map {
 	unsigned int cpu;
 	unsigned int codec;
-	unsigned int ch_mask;
+	unsigned int cpu_ch_mask;
 };
 
 struct snd_soc_dai_link {
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 88031238c04e..cab1578b893d 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1762,7 +1762,7 @@ int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 	 * ASoC will set the corresponding channel numbers for each cpu dai.
 	 */
 	for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
-		ch_maps->ch_mask = ch_mask << (i * step);
+		ch_maps->cpu_ch_mask = ch_mask << (i * step);
 
 	return 0;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0e49290a8c90..cb64ced21149 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1264,7 +1264,7 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		 */
 		for_each_rtd_ch_maps(rtd, j, ch_maps)
 			if (ch_maps->cpu == i)
-				ch_mask |= ch_maps->ch_mask;
+				ch_mask |= ch_maps->cpu_ch_mask;
 
 		/* fixup cpu channel number */
 		if (ch_mask)
-- 
2.47.3

