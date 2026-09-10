Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAADF478E47;
	Thu, 10 Sep 2026 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040725; cv=fail; b=U8e6XjWA5OT6CTdnu5gM2gPs0hMc7dAOMso8qaIZ7qxzmf7VvFlvZs6KSsMfbFD4nqsLeAj0b43X9ohgTOPBEZ8UoopI+yg9lVMemDxsnRR6VtjBEOKkPqCKA5c6LsL9OwdVg/kLE8wTHH9Ss28+DovW51JlEaZ5gsIqm1NSuVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040725; c=relaxed/simple;
	bh=Fl9555w5lfyajuhv41SYiW4r6Sv1jgvBOuLKdpPKiOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sD++7SrK1VrU0e40I5AKD3G6OFWlOCvdquaQyezj60YlITOt1a6iqMPpjrTO9cWEBimzt+PQ50qPs84iXN6Z3mn3zTvDf61dihfGh0KtBv6Y2YVIDpgUwslNeuRR7iCb+xadgdbYCZ5vIEa3vGztDul+Uap8tWWUw4WF8b4Cfek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W3ruycW4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sK/Bs7/+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W3ruycW4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sK/Bs7/+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IggaT3050653;
	Thu, 10 Sep 2026 06:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=u6jDVkRkXECk3afFzkGXdlzgZAq/sc3mODfZq+KcORo=; b=
	W3ruycW4hcqqbp/MH89ljT4d/eeRL1ovoJ+WPuY+VJzkFAgSAYCOp8Z4KAKrKLbe
	Z0grLh7OTbQ3bD9JN2mth9opNBEeGhe35yqH1J9qYMgEcnPa5cq1puIr50MBpFCE
	53ENgVtwGhIak0OPQ0vjNbZkuNq+gvc2QwzBrBjP4Uhazz7AXdjvFWls2Yc3eiRb
	DitZtu45tiNNcsVfJglKOMii0+jtW9seQe6NZceulfTPHMC8/4RjtCzYlawK7eMn
	7+5I9WmQVX78GtTgsQpH3t9v4zYKpbk8juZeTRoT5c/RnD/HPyT3Ea5xDxOWz7j3
	lyYyjVEYSh+JJYLbbFCh9A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020093.outbound.protection.outlook.com [52.101.193.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyp92g2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 06:45:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg9dwt6++2jm3TiYqBoBBTL3K0ILYo8B2EEMryxT/luVKHBu0cBT1kSm9WCvWRTEKlIvwer2uSYAkwB9x23TXogn8BZ08xRE9GF0/FB+ZqQnbWdyRMiaMW82eaXDf2oogQ3gCxlenD+lFVNvYKVZ3+JrM7YgIBYGAIIUcOpcgFGA9JOpAq9z1POuuwEJw2sewtm1hzRjdp9EU9ce3Qhgor5Zq2vyIHvm6ldD3Gl9xhUPG5NfUSdB5gauS+7eanq1Kt2x0gSGEoH9dqowGWvp1RKFUvcaLgiJtNTE5epe9Qg7Y5PNkb7Cb4OUTlc6ihCg+sZBF5snhDnWIhginGSrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6jDVkRkXECk3afFzkGXdlzgZAq/sc3mODfZq+KcORo=;
 b=ch8g71f5CkRIos5UHCUB2mQzidDwrV8aYDpN3hSzpNZUpGVyShknNrJnPBAb7LXjoqk3c5LbMEqx639vU+OdPIOgKAZc82strRnOPsaoyt6eURiZOFbgOf8joOagWEgpoPnW7blyRe378VQG9SDEZ78TrgHmSr4VxuHhdwInVzf1c7ZzTm31VHgxCbqAckDAtLfBMhuwPwr4zQ+devzug7Ym+mSOZN7Gh+njbC5JuTaqqdz06jeFrrhsDnl57Or/8/YEEqHviMmRM+C0wflHH1Fy1aQl3XTCzhGWtnLQX9DkId6i+RRbEjAV3fFtONwunOil+5WK2xpaQl3wU5pUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6jDVkRkXECk3afFzkGXdlzgZAq/sc3mODfZq+KcORo=;
 b=sK/Bs7/+rOmPH/ZKo4ufnXsrT1cbHLt/lRNvs5Zqcs0K3LnOa93PIu+WuzVOxsZn7mKV11yxm686jReLkt1lbuCpKXk4R5ocnRar81bw47ON+wIMR+Nh/IIrcwTkw5fCAq6YKlBS1o0xfXRbDAxOpg1teQly2YobQmHbaEguR5c=
Received: from SJ0PR03CA0150.namprd03.prod.outlook.com (2603:10b6:a03:33c::35)
 by BLAPR19MB4516.namprd19.prod.outlook.com (2603:10b6:208:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:45:04 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::16) by SJ0PR03CA0150.outlook.office365.com
 (2603:10b6:a03:33c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.14 via Frontend Transport; Thu,
 10 Sep 2026 11:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 11:45:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51C83406561;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 324C0822566;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 4/5] ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for capture
Date: Thu, 10 Sep 2026 12:44:59 +0100
Message-ID: <20260910114500.1586637-5-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|BLAPR19MB4516:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f554f8e7-706f-4d86-431c-08df0f30f3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|376014|10067099003|18002099003|16102099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	6Xi1OAFlbEsGQEQOU61MsAK9roSJjbHBmaY3K0Z4XzLL/HVyEIEYpsHdjc5FpNFp24yvx/YR1gdzwB7bZ1G7k/9qa48STEkuWJ5i+OL9htsOByUXyYAPKeOfHqyHSxyNkdohAGz0OlSo8jfH/LGEco11Xi/ZWGtn/bwwO34AqD+FlV5DlBndS4Ej2APUe5vukM5GrrArFo8dLGO6cUBWGZATpCOBQORE7DXU9pp3ZxY1gZZQ0oxUbmqUK3aFpS+UnELo6E6Xoc2qeOVEMtIk3yx0a30tsT/VQngZXJEL27QRZgCCEVYt1wnevg2m/3cl6hdF98/ljyK2Yyp8Qsml/SuBUyZcsVquQhR9NtBJ1yriH9tcAuWp83hQTG6i0BMxTSXEx17FKQAEGkaG017F3jXJjUn5Q4xWybTOk9iyAw7XFSbApNHRAzAtjwsju/jRT01uNkIpZtRliY8RskGaIkNGDX/sQhCeX90aI9r23ACLTUbDBuhIeAdGIu/KeR5Zjbdm6Xhmm6VGCp76eeNdNYpESgFKE4iDG2EJIrR1gxF/ZLGHobSJldI4zrCk+i8lR7F6KtcRfNn8OqDB6WCXUUsg3t780p5W5qvSLkVKj1OZr/zPFGhejZ8Y2l9cqkCmVg7dDV8/ptF50mtd5nawcz81UF4PkFT6sp5gL0GIe5BJMSX1zONO901fIhkyBqLvF/YP0BIAdDkSemIVo89Ssw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(18002099003)(16102099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XlbioDxCEq5Ymj5F6YyDz7QhyOJrUan+lqbT2Sml6dNq4hNJLJGjKxgBN2/g5kUONm8DemgtpPiUK2HathCqyNR3XsR2lP7mHElxm2ugdQmc0zN/blezDaXTInD/INyCssJuc94s24hK/gUPa9DAuTYTqYoS2U9b7r80Vwy+m0cQnyy8x559wTfJ41v8k47tD0MNQr3UX1tgwfbCCa3eSbv6H9QjNOCpjPJGwhyeBbLHC6i6I1Mjx7Ri+uZisTXP3/LQQm9qh3yCr8o0wZ5z1A/gqjz+D0cOan0SJO63UyM43WuyfoD0jEvLWT99XKOlzE9/AIa54nbey+aCz8FDEBcd2prLKSR/ZqtvyjSkA3xNDiTcH2zxO0Ph7dun7sAhoqHADcEVUZDbK+s1gUqB/om/+ZzsXd2LLLN7feic/PfcA4BlaQdp4pk4PHiF3PQb
X-Exchange-RoutingPolicyChecked:
	MfEP0r7F0vOvMQmSnqI31OH1Kv+o4RLc8XMVt740hoeU0DkCZGLpZYKZRkRbmQKEOnK/7R0L4/NKRRKfTO4eYpqX8nH+yOI+/XokHpzNrgYx0Q9wOthCAwvgL/fOl42KOAZrZ4wRzaaibM0yQMjn4/R271WR/FZEhzHoYgiKB6QQKGzi9T/xWrd14cR+nxuRwX3UsF/dQRGLahHG3S5hsheP3L5l+qiEfZY1GJr+GjjndzEUBvshgRg/280/OvmRiMJBbKJd2DrvKkengASyO8jhnCqtHefYv0DdGgc3/NklVjxRND62qy5HFb7Gr97RLTyHfmNWSZgGxb/WGsJ3ng==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:45:03.1853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f554f8e7-706f-4d86-431c-08df0f30f3ed
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4516
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa29845 cx=c_pps
 a=XmpCLDa7gY5zTWVzJon4ng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=7cSoefOn4YfZyThIjaAA:9
X-Proofpoint-ORIG-GUID: 8Yvg4z1zc-9UkXH3FLe2C7gPWTo8jruW
X-Proofpoint-GUID: 8Yvg4z1zc-9UkXH3FLe2C7gPWTo8jruW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfXzU8tl2gMjUQs
 rqp4KOPD1nEHJCnO/YB/8HvAGwSiN8L6bqtVlMyfbE/NoAjc2ORTcWKXktSTvoQk8f9LM7FrMyX
 faCUVZZUmF0sA5fYFuItXJDyPRulwct739Fz8xtFkjla74JczBzKTo4v0nw6s4QvKkKxl++p0Wz
 qOBctWmsSSEM9mtihvCQYhGQlgr2D6jvob6W2FUwQYqbhGBrRs/7IfnJ/GlCuqwiRwLKSLY1blu
 Rl2aHBPpXlYnDnR11UsORSSc6rpNMW0IcgzTRoOdgogcf3u10Ow4RWDAXzOoj3cO4XpiI22Dybq
 UvD73VfKRaj5OCMosawA+7rgiaDMHAJnnIVSCq70ZujIudVmTP1iuC71DsBQoAaHWPf+p9BWizC
 ZmUexzU3+nxehtZ2B9/1ApqtZqoqJcjt7Vf/9Tu8LK3JcjkADfwh3u29ruA6Cwf3m84V45tx0IJ
 9xxtii5V1z0Q5wNJ12g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX/5qLkFa9LT9T
 rYiTrh9MzX7NGXW/qR0BQ9FQIZRXNtuKLecrS/ktH8XaUKquuNkcgiI1nk/Ckwhvx3K7ARy0YP6
 ks+y0bH/zTK7yhF1CnjMODCVTY+U29o=
X-Proofpoint-Spam-Reason: safe

In asoc_sdw_hw_params() set the codec_ch_mask member of struct
snd_soc_dai_link_ch_map for capture streams. ASoC will then pass the
correct number of channels to each codec hw_params(). This prevents
trying to enable more channels on the codec DP than have been allocated
bitslots in the SoundWire frame, which would cause bus clash errors.

In theory codec_ch_mask could also be set for playback streams, but for
those the CPU is the only sender so there is no risk of bus clash.
For playback streams codec_ch_mask is set to 0 to preserve the existing
behavior and avoid introducing bugs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index cab1578b893d..778ba6531434 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1731,7 +1731,7 @@ int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai_link_ch_map *ch_maps;
 	int ch = params_channels(params);
-	unsigned int ch_mask;
+	unsigned int cpu_ch_mask, codec_ch_mask;
 	int num_codecs;
 	int step;
 	int i;
@@ -1741,8 +1741,9 @@ int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 
 	/* Identical data will be sent to all codecs in playback */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ch_mask = GENMASK(ch - 1, 0);
+		cpu_ch_mask = GENMASK(ch - 1, 0);
 		step = 0;
+		codec_ch_mask = 0;
 	} else {
 		num_codecs = rtd->dai_link->num_codecs;
 
@@ -1752,17 +1753,24 @@ int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
-		ch_mask = GENMASK(ch / num_codecs - 1, 0);
-		step = hweight_long(ch_mask);
+		cpu_ch_mask = GENMASK(ch / num_codecs - 1, 0);
+		step = hweight_long(cpu_ch_mask);
+		codec_ch_mask = cpu_ch_mask;
 	}
 
 	/*
 	 * The captured data will be combined from each cpu DAI if the dai
 	 * link has more than one codec DAIs. Set codec channel mask and
 	 * ASoC will set the corresponding channel numbers for each cpu dai.
+	 *
+	 * sdw_stream_add_slave() assigns different payload offsets to each
+	 * codec in a capture stream, so that the same channels on each
+	 * codec map to different channels on the CPU.
 	 */
-	for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
-		ch_maps->cpu_ch_mask = ch_mask << (i * step);
+	for_each_link_ch_maps(rtd->dai_link, i, ch_maps) {
+		ch_maps->cpu_ch_mask = cpu_ch_mask << (i * step);
+		ch_maps->codec_ch_mask = codec_ch_mask;
+	}
 
 	return 0;
 }
-- 
2.47.3

