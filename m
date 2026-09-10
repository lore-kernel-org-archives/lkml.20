Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B198347A0A5;
	Thu, 10 Sep 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040729; cv=fail; b=QRe5GPkW1Q37gj2JO3UMSh0/UHddkdWjxVIZ80eVCP8z1QJyBH64lO+1NhLt+1IkTwdxKOuIAXqiG4/k4GxNqW8VkNiH4kZvW2rrfxImHBQAtnnFNhJInfR1A4DDna+BrYp6nwJQj4UwdM/RFTETEvFNQyDQ+6PbJYxIa40fr/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040729; c=relaxed/simple;
	bh=Q705JKGJZyQ/WAun9iHutNi5bD1VmyOPUHWRosDy/mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d3N0TQTJ2It9VmMzFIXZrC/urmMDivqD4leI/0/pIZJOGhBvjsg+FXJ6AsaUXMj2cA2TDjs525DQvSrc2zMJM4M/4mEgSFrXyI2Yp6RU0gVmASsoD/aHMnF3+VOJhCIafNfrr8UHoN7wlwNzsAssWr/3Cml5/vIXjefb8dxrgwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kcO0w0j0; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=A2gVH1e0; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kcO0w0j0";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="A2gVH1e0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A2dI993831939;
	Thu, 10 Sep 2026 06:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pBjBS0mZ9TIhTiRJFU//ha4bLq0ksU5fpTLiIVEjkds=; b=
	kcO0w0j0kC5eBTdMkhbVmeah2WWGYm3T4XPDD8KIYsPKvFjnzdbMYcew/lgeOYTn
	GQI1T33JtVRGlLYJ4zHKjofETYTGzPleisrgC1OiUlIlNr0wwgDIx5HIfTocm6iq
	PZXe46KecAZ5/pD8kLUzVEHKE+VDi/KiZzuyopKNHZ3uElJIahvmcTpZMqx+oTug
	4Kc3TgEKh/yrKrsRR2c1XM1xc2nPW4SHPHOQwo4Qbirjf4I4Z8sA4SFDzex9tXVX
	bVaoHygcMe6xdAPGhLFGRQmWtPTirMOaDkvOQGoHaa76dCxN6AXc8qUP+Wakqolb
	0f9H2isTivACVYZs3uFpSQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020119.outbound.protection.outlook.com [40.93.198.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyp92g6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 06:45:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouyITI0/1/PonsGrq5+kSihh2LzRxyWkWv+J5ZxjmFJEAGWDGd7f7LFPLtgUjkiu9azEPujoPzOWpjGttfgZGdSJ6l7CYF++QYsR+v6mlC2bBJG7NEM1Y5ef7k1nNGTK1ni6PjmmMbwpK04SHUZyJJvWZpjMP4sW7BLnJA6JmHJzn7kvvXR0k3sEZS1SJQEYMJ0Hb03QTn8SYyEc/BBzSxbfZWKihrcyW9T6hSqYV5qS1+KRTlCVY96+iaVsDPeV8tnDsdAgK7yHxtJAnRhxJn4LARkX4sIiztrkl75s4nDtVOuOdhSBVf6ZUIi0KdlFDtS8/nU37xoK3WRq7yMzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBjBS0mZ9TIhTiRJFU//ha4bLq0ksU5fpTLiIVEjkds=;
 b=pjiL/FuVzcFD2MYb3+IaJ/E4dShUl2aZjguYnSS1cPFZzEVOSCi8mNSeiqAl/vusmAT5qClJCGGyk84jUaIDNYOxhdYeY+wZkWwhurzR0aP+jH+lJYiLTBw353aLxlJ+y5V+hjt+2G3NWahfvq/Ur2dcV2l1nyMMdjms/98PvwpiwDKEwkGviA1i1wY+UHrPkCljGOMOiQWQ3d37xLQv16rtKDUSoO5ZQHbgW9ad5RrIzpQuI9GWYpzmcYT7qaK5hFX7APHauJ8TPjttE1bnOUscL4vskmxOPoMzCN2BvxddnNivx/reojoROY+CVDpTLq0LwKek+DpSWsHuRwGzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBjBS0mZ9TIhTiRJFU//ha4bLq0ksU5fpTLiIVEjkds=;
 b=A2gVH1e0HLx4ZhG6A1KSNSqyl25vuZOhWI8syyu9sPEHirBX/HqOzzBcMntlzQhcDnKSk72wY76TKg/xTcPm6BN8rUMmDABulhtQvWUfgAUKJhhld6kqVtc4ZFFn96cRoBoYWQnNdIPtTfcwj8VRk6UToY9OMgasZtyQLX9pllM=
Received: from BLAPR03CA0052.namprd03.prod.outlook.com (2603:10b6:208:32d::27)
 by PH3PPFCDF482381.namprd19.prod.outlook.com (2603:10b6:518:1::c4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:45:05 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::2a) by BLAPR03CA0052.outlook.office365.com
 (2603:10b6:208:32d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 11:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 11:45:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5C447406562;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 344B2822567;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 5/5] ASoC: sdw_utils: cs_amp: Delete bogus and incorrect capture channel fixup
Date: Thu, 10 Sep 2026 12:45:00 +0100
Message-ID: <20260910114500.1586637-6-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|PH3PPFCDF482381:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 721a8ef3-72f1-4cb6-ecc3-08df0f30f468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|23010399003|36860700016|3023799007|10067099003|11063799006|5023799004|56012099006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H+Rq5LPZBkk2BK3o4XYpeOFxAieKDGEw1Ep+10O8/7mf+FE+szHars1QmASBFl3sc5dmtM48DueHJjaaez5d6QvoAgw/ZtrQkUuw/1wBIgVZZ8SW641iFztiAH6lTq/CqyvyXi93KA3lys2prV6ovq96cDFXK4P9r8LUzi/JTcmlDrr2K7XtztSq4gg7PmCXw8SKoZ08MotA37iZDulvk4h/WLJAF94A67xXp/86B+ECPnsfFAt20YIqzc4xH8NpJOeWJYaO8mjSoj0gqL0EmVbTczhDCo/eTpDY6btyQ4kyAtd8uVSObvCEyOUbpkhL7ma1+9NcwABFEKixqly5+p2LWAz3gT+xbKiHOePEbLh34i5M9AwEk7Vp29E6VxP4MD2aI72Qf22922w6BZQL89wiKWkuxoattRrwe6wIMQVzsGWanOrmzy2IqnnQRWlYBY0ELMccoBMY0xLalzakqEV/G9cfjgA3Q4CzYJrvsEJRfBkZdtqsd1i+pyA89DWP4STqmZf0IN3yuD5Tq2h9UamB49l4O4c848Jg4+RRkCQysSXgDTJfeTBEjGhZHR/VLTyurhSBTHU5AFtoLYujNj5m+KIKhji0GPqBuzXDelQhzMC1Z1GDzB+fs2quxJuJF089Lt3cEn7svK9HFhBnSMnstigThDZ/yP7lPpYlckHbzA94HDVcuAVCFMStx0quET6OA87oJFSo+vjK1XOxjQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(23010399003)(36860700016)(3023799007)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qe9L5fqs/pXFM4xdlpwgludA2UG8P73yWPdsN5KymvKGMrVzDEUcOyodv9jsH05Vg3faDj7mHALeWJIwfcwBnwvKKyF5TkasrdTzta5RSyKLLGQWhENH2zZXv2ymW6Gszjm+WME2PslpAMpgpe/YaxbWbL9L85Ut5Wzt4MKXYGUkMnA5OwbX3oCIn9eFOvxuP8xS1+wZ9unsA9j5bxOcLLJo9r++JNn9tmDpi0bGjiFs7Pt1uyxf6S7AqulB1eYfUjr19GokL6glZd6SFhxP7A9m9op8O/2Hpjy5zb7HU4Q47+YEHocJEHrmsgrxXKhadlXr9Vg9IBe1Xi4OCuIk9mD6OyvD19E+VGREIAm1u/TChsizeIsoqc55BId3/7SGQ8F3PyVJ8lL2Ifzqrkp3FMHcqK4a1Qa/+UuEp5Qs067c70ol+uAC3hZSMI3/2RI9
X-Exchange-RoutingPolicyChecked:
	JaqypJO4t9VwHWd16kmFblwkwXySgNa29gGgL/y2hP604tu98a79YgkFEWUMxu6MTW4E9sfJk3XmB5RPXFt3oKCfoI++rIcviHf5T4tAdV5rel7fThGVHS4pyFDOpWnkhaNy5rdlDdoqhJ8Jv3fCw+1U08NsJ/lSZR6M7mibwbd2LNDUiYVPMXRdG4gLwmJtyGnxHsrZ/RwJNqm+7ju6X/uw31OzPpyNdGsMQw7LW1LYVnhUSqKzy0edprxOvFESvvlLugNOIMdWv0x04a3oACqP5f2Taxum+QY7ZWj5u5mCVk4I35lqCa/tImlgV4plV/8KxvbPBGQVT8pegDN7gw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:45:04.1070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 721a8ef3-72f1-4cb6-ecc3-08df0f30f468
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCDF482381
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa29849 cx=c_pps
 a=su6dv7EX1thkUT4YzH3YWg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=jauQtPRp_uiQbXMOToAA:9
X-Proofpoint-ORIG-GUID: jBst6stjdz4BDUnomvn8QpJIqiAetMQL
X-Proofpoint-GUID: jBst6stjdz4BDUnomvn8QpJIqiAetMQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX0tplChzo3nad
 9fxEe8HVrcznLP7VPidrZDIdMR8vIHB7eyXh/4o7eK+3B82pcw+RhPpQeguDug5h78S9l9X6vIt
 L/MKlc9rWm0/ANc63Uix8JFFd+vbIiodxp7aX0g8CXGGPkAuoVmjUKic57uvFltG7+gItBIkfif
 +Jt+p5IEkJEu1eq2a1H2VVEDdwlutzZoZzIGXCUcbzyh+ltba7SCrleZNtdbRTtW1y4YDk56HHz
 GUysahH4fcL/9WituYqAE+TvOqn4ol4jJ1k/aOmSlTCepIYewrhuQ/iKPp2CF/16cmILvnjOxoo
 AQL1BLSL/4OL5YuX+mHAIIcNxgcA5lLWbuLOxS1hTH/JVZKRyBypKl0oQ68s6mfVUFpm9W0jLeY
 DCbh4PuEfvteGVjPBfRLALnBDJ7aYv/Ud91+vooCoPr8acZU42CagGyAGnzlYS8o+GJmDDCe2Qs
 1r1na4ygHLtpvzqUO9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfXzlFJsSXpyn2b
 XJnw5BoHVUnlIQgj8sWSzYV/WdRsU3N/36BEzlQgHDGxHra8atlx5N7i6CUK19i1FcZ0x6wsEEY
 MTR7EJKsh9hXVA2p9kgKnmL9hZVJoQo=
X-Proofpoint-Spam-Reason: safe

Delete the asoc_sdw_cs_spk_feedback_rtd_init(). This is not needed now
that the ASoC bug it was working around has been fixed. And it was broken
anyway because it didn't match the way the core SoundWire code mapped
codec channels to frame bitslots.

This code was added to avoid a problem where multiple codec DP outputs
were mapped to the same SoundWire frame bit slot. This would allow a
user to break the SoundWire bus just by enabling mixer outputs using
ALSA controls.

As no production system has used the capture stream, this workaround
was of little consequence and the problem of conflicting DP mappings
was not investigated.

The ASoC bug that enabled too many channels on each codec has now been
fixed. So this workaround can be completely deleted.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc_sdw_utils.h        |  2 --
 sound/soc/sdw_utils/soc_sdw_cs_amp.c | 46 ----------------------------
 sound/soc/sdw_utils/soc_sdw_utils.c  |  4 ---
 3 files changed, 52 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 3c1d177a2f2d..418466438ea1 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -250,8 +250,6 @@ int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_links,
 			 struct asoc_sdw_codec_info *info,
 			 bool playback);
-int asoc_sdw_cs_spk_feedback_rtd_init(struct snd_soc_pcm_runtime *rtd,
-				      struct snd_soc_dai *dai);
 int asoc_sdw_cs35l56_volume_limit(struct snd_soc_card *card, const char *name_prefix);
 
 /* MAXIM codec support */
diff --git a/sound/soc/sdw_utils/soc_sdw_cs_amp.c b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
index 325ab7230481..6e21ef8f87e2 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
@@ -14,7 +14,6 @@
 #include <sound/soc-dai.h>
 #include <sound/soc_sdw_utils.h>
 
-#define CS_AMP_CHANNELS_PER_AMP	4
 #define CS35L56_SPK_VOLUME_0DB 400 /* 0dB Max */
 
 int asoc_sdw_cs35l56_volume_limit(struct snd_soc_card *card, const char *name_prefix)
@@ -64,51 +63,6 @@ int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 }
 EXPORT_SYMBOL_NS(asoc_sdw_cs_spk_rtd_init, "SND_SOC_SDW_UTILS");
 
-int asoc_sdw_cs_spk_feedback_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
-{
-	const struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	const struct snd_soc_dai_link_ch_map *ch_map;
-	const struct snd_soc_dai_link_component *codec_dlc;
-	struct snd_soc_dai *codec_dai;
-	u8 ch_slot[8] = {};
-	unsigned int amps_per_bus, ch_per_amp, mask;
-	int i, ret;
-
-	WARN_ON(dai_link->num_cpus > ARRAY_SIZE(ch_slot));
-
-	/*
-	 * CS35L56 has 4 TX channels. When the capture is aggregated the
-	 * same bus slots will be allocated to all the amps on a bus. Only
-	 * one amp on that bus can be transmitting in each slot so divide
-	 * the available 4 slots between all the amps on a bus.
-	 */
-	amps_per_bus = dai_link->num_codecs / dai_link->num_cpus;
-	if ((amps_per_bus == 0) || (amps_per_bus > CS_AMP_CHANNELS_PER_AMP)) {
-		dev_err(rtd->card->dev, "Illegal num_codecs:%u / num_cpus:%u\n",
-			dai_link->num_codecs, dai_link->num_cpus);
-		return -EINVAL;
-	}
-
-	ch_per_amp = CS_AMP_CHANNELS_PER_AMP / amps_per_bus;
-
-	for_each_rtd_ch_maps(rtd, i, ch_map) {
-		codec_dlc = snd_soc_link_to_codec(rtd->dai_link, i);
-		codec_dai = snd_soc_find_dai(codec_dlc);
-		mask = GENMASK(ch_per_amp - 1, 0) << ch_slot[ch_map->cpu];
-
-		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0, mask, 4, 32);
-		if (ret < 0) {
-			dev_err(rtd->card->dev, "Failed to set TDM slot:%d\n", ret);
-			return ret;
-		}
-
-		ch_slot[ch_map->cpu] += ch_per_amp;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_NS(asoc_sdw_cs_spk_feedback_rtd_init, "SND_SOC_SDW_UTILS");
-
 int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_links,
 			 struct asoc_sdw_codec_info *info,
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 778ba6531434..0d7182bebcdc 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -820,7 +820,6 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs35l56-sdw1c",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
 			},
 		},
 		.dai_num = 2,
@@ -849,7 +848,6 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs35l56-sdw1c",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
 			},
 		},
 		.dai_num = 2,
@@ -878,7 +876,6 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs35l56-sdw1c",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
 			},
 		},
 		.dai_num = 2,
@@ -907,7 +904,6 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs35l56-sdw1c",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
 			},
 		},
 		.dai_num = 2,
-- 
2.47.3

