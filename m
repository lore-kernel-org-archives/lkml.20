Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA083B05A7;
	Tue, 15 Sep 2026 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467685; cv=fail; b=HsdT6RbJLy4JIcSX5GDARHJNlm80p5cGZY6kQ7S+M4z5zcGVngWvDt9Kgm6rlFIyEF2kmmuB2pZvSMf0KeC+j6E5Zmpt9VNuolU7CfF17o2B4Ppdw/Ghk9hwz8enrFUUpBKpJuP36UfF91UFUq7G9wcRJ5Uw6w7vfj2PVKmvcr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467685; c=relaxed/simple;
	bh=Zbb5n09qwDm2ZAAWtxUQGZlfHDsGJNvROm96U/RJjCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fY8PnR4aVzUJj585kqrFJwkBAT36xop4qfV8NMWT23DhqYxpovCn+CdKi3LcjDpIG0iPBu+R1nmMeoCwkuUQyVY2wAGZzbug6PtxQy2ipP8DJ69l8cdfuZOPoX8eqLOWQBb88ta3AuXYKJ5aodaO6T7eIP9LpKJu8YJQoBBXNM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KIhVhaEF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=f9Hu1pMY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KIhVhaEF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="f9Hu1pMY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F4cuN53183688;
	Tue, 15 Sep 2026 05:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ag4xvfaKbOTh6rCw
	RuhXWpn5haFzM2a3mOfZeeEVINA=; b=KIhVhaEFz9jNcZ5cL/v+P/h9IXtmL40d
	hWgWFeWtxnRDMM+Cynbm3oTdBY48UoDk5o4U2nftUYgWTpMTBrJWJ0xH3T0uj0Nw
	EafAGgAcnMLCV6+inTS1Il9oV7L8pWcgEwbO6KUjKb5a91jEDHTeEKjQeXb+njsu
	STn4WA9wNxgjEC0RG+Oo0++YDrZuDu5qKjbvP9WiUcx711ue0CYz3qxnQYw32HCD
	EQoCLULkmsqHiJuhNh4ttD+2vrrc10nPxljXKa31j1Nipr20eykUf5l6uFPhkd9g
	ub01fJOGjVC4sLxQq16NjTTB1P1gMmQaRXeRo5mtPVIplSM+tvYasQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020108.outbound.protection.outlook.com [52.101.85.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44wb8sb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 05:21:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xy7iulDyogqg2SceFy8oqOpuJqsoTrsK1eiSIsqgeyMaXzyGBwmzVl7LMJPoJk9Yfu3NYZw3AqxPcqCJYSVqPCal11XlUxNM3aHnFbi0IhykzUwDG2piZO2C1MkK7fRUDZjL0aBc/Ka/K9FS84zmpb+EL9a41yoKpvMLxmU69+/i0dv6muw89ousKD0J+T1CbPiKbodKt+4mMa1u6yf9doYO9QHFJULByzTBVxVbVuHK7Zw86oBY5u9i5JXlie+aiZupLPV2FVKWXOqke28OnZWPb7vvAmgQuQuRPt07DdjDVCQGLEAK5Le2MeBwDofHd4up22buKlTyeTgmFGOyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag4xvfaKbOTh6rCwRuhXWpn5haFzM2a3mOfZeeEVINA=;
 b=RgQxMGS7JqpJ+0qy5SmjSkf////T1gKPhYeHrINHgoHJrRc9Mc2mX3A9SrF5AHYEg9+0QeowlRV6g6R09yW8bZhuFIoweCHFJKl05Azoi40MzbGYx3DTnBESCftdAqVa/a3y8VGrhNn0cZ0GpfBfJ6ucBOYl1vkFy0vHjeMN6LS3d+MNsVmMVKdk6KykFwXT8qs7JkCniNPf3M5CVM/P2DcB7ae4IpxXXp2W8gmS4D/R3iOm24/ZZtd0emdoC3I+SQ0x9huP/7OrAQfikwGujk8ALu1Aez9vRmdluchMtbZZZ7aHPhrnIBdMXWdLH+RX485R3iY6PqA9ou+U8dcglg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag4xvfaKbOTh6rCwRuhXWpn5haFzM2a3mOfZeeEVINA=;
 b=f9Hu1pMYiQEo1Fq8QH2/e7hMk5ZJfyD+pAVJOlRUySFg8vAFMFKSMhiu5e9NGJD9AVbBR7l7oo7WwNAy0eWe9kYYEGuo/CfloJKzcrC3HOxV8BbcSZy5/ENnDMuj+DAMuFQGBqlMJmDu37rabiyQ2qVWGuoAWX7WSMBsDBONEdE=
Received: from SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20)
 by SA1PR19MB5498.namprd19.prod.outlook.com (2603:10b6:806:232::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 15 Sep
 2026 10:21:13 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::32) by SJ0PR03CA0075.outlook.office365.com
 (2603:10b6:a03:331::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 10:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 10:21:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 34FD3406547;
	Tue, 15 Sep 2026 10:21:11 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26026820247;
	Tue, 15 Sep 2026 10:21:11 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Wait for firmware timer expiry before system suspend
Date: Tue, 15 Sep 2026 11:21:10 +0100
Message-ID: <20260915102110.3276924-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SA1PR19MB5498:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8d4623fc-3fdb-4669-d595-08df1313118f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|61400799027|82310400026|36860700016|23010399003|376014|11063799006|56012099006|10067099003|13003099007|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uMljcYDsH2z0u33XUX7IQmy5s1moKyr3c+yT3VQgmocmvvkQsuyAzb6afMedbGO5Bhif/we+hDZpL9fNsRulrSv0l965YpGjxVl6DYROZuBa/xOsX83Adqe4fTC0cnJH0CPHNBBNcgGRh0yT5Kh2IZ4DG4KijCf8iM7yMjZT1gT3zh02hFF+OrT5gwuMjrrp6H90aYpec6p5nnPRtU+foFIlRgc/YGQE8xQ9+DO5Zx30aih5iQv8fuM1pQjrrt7Aqq0ABnZdUsvZhGebbdeZQBzGtbRV3a4+ZaeiCre8xLeayBRUZakhHVDXwHcfmYmGSsTES13Xscru99QLw4gTDYNDP9g0ETmyJCpdti7WSFaWyZmVaISOIFhyLNdvYHNR0a35PtS0uWzI0E8oVFrpqEpoc5plQnDX03nokeCROI8hBjdYmNncJl9Fsb1jYtN/HeBhdPc+oAJmuqGQ9AWgCo8VvFTDOG3KL6JemgdiPttNwoVbriyi8JtgqD39li57sSeP8kdZ6tMzcnSwANcFHwc+sZ8xYvjab+Fo9OKhppMa3gYV+HFw/0I5jQfzoasAQj4z5DWAROLGH7HKhypR4fPt2ghSGES3TrdNAv7SPaf8SplIMMPovUQ++Zg/cgfXffIYY9RHYtMDqhW47ZoVqUzhSktRPfYsupyijE2uiPCWN42ekbwc9IqEznoI23z27DXC65iOuUhTa5PfWpwWAg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(13003099007)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QK6mC49+KZ/wEvSsnYYh0hfk6TajZQ3Zwf7w6xXNQH0C5HhaX2YtcMfojbmQMCF5TnGBmsCfN2Heb0tXgW2Q0/gc3VuTKPWkFHVRfZGpk0a6nn+opEsW7eIYeRTtW5mL3hOofhHcrC1sj8wwtYBqRsFN9aUJFAESAUSE23J8m9+3wygYl0Y37yKf88KC3wGUP5WwnUZFrjT/luA5P/4L7XpmJXz4CFbHdOIGEV5siVZcX+eVfoQgdAT2d4mpdV1gqjjailhvKPfBt0+szsYUfEIJY5lu1lzEp21pcGb+SEblDicXv7+aSQK3+62O4UY0rcQdb+3l6fCD9iXphHyvwmB9sMybKwd8B+khz55uQd35FfdqvfcxuYYsvokLC/Cu8S/RceGa0AAiutpS8LLAZ6PJSyRH1bSDEycRc5vEpTRrPeitHDIjhT1Th3wE8icM
X-Exchange-RoutingPolicyChecked:
	SBTLsfzXgSLKPkiTfyvzLnhBgO7ZgAKjLqbzXhM3S8IuDy5SlFjYpgsG28ZY6RAdne3M1NNtLH3lUsrxH5R5xxQeJ00HxLxe244H5DIwYb3i1oEu26zCdce5EZwcOcx4ptLZ619+0fb2IbB+BJ3XGsnjkzPSD5wvpL15ZxST4z7YkIPPH0f5tdOzvJLEHSTbrXT4WPQ1JdGApTE1YcPDYRZDGziU1OxsdmaaHzbFV3J+A/yIJsP6LK/86Aw5LWRiLnB9OJGVLBgHK7xvsbl4QxqqC31agRvKVmWpVStl4blt6w5LDfBmq26z/M4lCworao/LN533PuDChJe8c4/juQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 10:21:12.6438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4623fc-3fdb-4669-d595-08df1313118f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5498
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa91c1e cx=c_pps
 a=l6WPzq2nfbAxniYbonYZnA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=mVQvxMdK0yHnoWamQeQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0OSBTYWx0ZWRfX7OR/QDkiaAmi
 26NBbAk8K1w3vr2/eQxBzp9V3tyqBg2/neeGzPdIgaPs6VkNSt2Ogma5flekGd4JhtaUxiWdUOA
 GoArFXb8qxO8aJIGsawV77K2wude8iaOTkayjJrHDWTjzCCP8yOGf62mBIUUnNxVqiaxzHag0CA
 uElHLFXqEmAorbm862Id1372ukcTXCupJOqod9acQAf7Kr615NIJgdQ7d5k4/Vq+TeryXVLikPX
 DQ+7bJaBr6iKDw/ZM2YSk2O4yVnE/F4oK1R0QwEXxY/MNZaQAAaEtRfgFnHD6F3tczaryQaqrhg
 TaTg4ah95ebiX/CAqwjnbUoPsuTruRJgOgo/CbU/cfcty1rZn8fMqDetDboPzqkICc9IvzI9LJX
 xDjl2zbccc5cAruo5XSNCBvKuOPv7rW6lSbLfAVKR5jGyPR6ysDo2MUjrjj2q3hnUPWGHz0OO9q
 Ag5G4Guf3FfvlV33gHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0OSBTYWx0ZWRfX+l2g6h1UmGo0
 50GBc9Q5r8sUI6D93WRuLrur8+1awvE/J/+9nBp65bue4vkgxdSwf0I+n9nmfarRi4LOXoEhcw6
 Inom9LMvDUCwR1Ua0cNNsP+jClzcyck=
X-Proofpoint-ORIG-GUID: AroXhdt38wAJYkn-YmjEUh4UGX2yeyeG
X-Proofpoint-GUID: AroXhdt38wAJYkn-YmjEUh4UGX2yeyeG
X-Proofpoint-Spam-Reason: safe

On CS35L5x firmware older than 3.13.7 (B0 silicon) and 4.7.16 (B2 silicon)
a SoundWire bus reset is not allowed within 250ms of the last firmware
timer start.

This is already avoided during runtime suspend by the various idle
timeouts. System suspend can happen at any time so needs special
protection. The driver cannot cancel the firmware timer, so it must wait
long enough for the timer to expire.

The delay is placed in the suspend stage because typically this has less
impact on end users than delays in resuming. The amp is in PS3 power
state when suspending and no new timers will be started in this state.
An extra 10ms is added to the delay to avoid a race on the exact instant
the firmware timer expires.

There is no need to have the delay for every driver instance. The timers
on each amp will expire in parallel, so the delay is only needed once.
A global flag is used so that the first instance to reach its suspend()
callback will delay and then clear the flag. The cs35l56_fw_idle_wait_lock
mutex is to ensure this is still safe if async_suspend was ever enabled
for SoundWire devices.

Fixes: e496112529006 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Reported-by: Ferenc Lengyel <leferi99@gmail.com>
Closes: https://github.com/thesofproject/linux/issues/5898
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  4 ++++
 sound/soc/codecs/cs35l56-sdw.c    | 27 +++++++++++++++++++++-
 sound/soc/codecs/cs35l56-shared.c | 38 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 17 ++++++++++++++
 sound/soc/codecs/cs35l56.h        |  1 +
 5 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 45a5df574aa6d..447876ba29541 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -209,6 +209,9 @@ struct snd_ctl_elem_value;
 
 #define CS35L56_GPIO_FN_GPIO				0x00000001
 
+/* DSP1_FW_VER */
+#define CS35L56_FW_MAIN_VERSION_MASK			GENMASK(19, 0)
+
 /* Mixer input sources */
 #define CS35L56_INPUT_SRC_NONE				0x00
 #define CS35L56_INPUT_SRC_ASP1RX1			0x08
@@ -445,6 +448,7 @@ int cs35l56_cal_set_status_get(struct cs35l56_base *cs35l56_base,
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version);
 void cs35l56_warn_if_firmware_missing(struct cs35l56_base *cs35l56_base);
+bool cs35l56_needs_wait_for_firmware_timer_expiry(struct cs35l56_base *cs35l56_base);
 void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp);
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 98bb4542b9143..b2507a6a37c1a 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
@@ -36,6 +37,9 @@
 #define CS35L56_LATE_READ_POLL_US	10
 #define CS35L56_LATE_READ_TIMEOUT_US	1000
 
+static DEFINE_MUTEX(cs35l56_fw_idle_wait_lock);
+static bool cs35l56_fw_idle_wait_pending;
+
 static int cs35l56_sdw_poll_mem_status(struct sdw_slave *peripheral,
 				       unsigned int mask,
 				       unsigned int match)
@@ -382,14 +386,34 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int cs35l56_sdw_system_suspend_prepare(struct device *dev)
+{
+	cs35l56_fw_idle_wait_pending = true;
+
+	return 0;
+}
+
 static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
+	int ret;
 
 	if (cs35l56->sdw_attached)
 		cs35l56_mask_soundwire_interrupts(cs35l56);
 
-	return cs35l56_system_suspend(dev);
+	ret = cs35l56_system_suspend(dev);
+	if (ret < 0)
+		return ret;
+
+	scoped_guard(mutex, &cs35l56_fw_idle_wait_lock) {
+		if (cs35l56_fw_idle_wait_pending && cs35l56->needs_wait_for_fw_idle) {
+			dev_dbg(cs35l56->base.dev, "Wait for FW timer expiry\n");
+			msleep(CS35L56_FW_REQ_ACTIVE_TIMEOUT_MS + 10);
+			cs35l56_fw_idle_wait_pending = false;
+		}
+	}
+
+	return 0;
 }
 
 static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_device_id *id)
@@ -455,6 +479,7 @@ static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
 }
 
 static const struct dev_pm_ops cs35l56_sdw_pm = {
+	.prepare = cs35l56_sdw_system_suspend_prepare,
 	SET_RUNTIME_PM_OPS(cs35l56_sdw_runtime_suspend, cs35l56_sdw_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_sdw_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 7b3e37d462d61..b37f65cd4d336 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -1379,6 +1379,44 @@ void cs35l56_warn_if_firmware_missing(struct cs35l56_base *cs35l56_base)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_warn_if_firmware_missing, "SND_SOC_CS35L56_SHARED");
 
+bool cs35l56_needs_wait_for_firmware_timer_expiry(struct cs35l56_base *cs35l56_base)
+{
+	unsigned int fw_ver;
+	bool prot_sts;
+	int ret;
+
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		switch (cs35l56_base->rev) {
+		case 0xb0:
+			ret = cs35l56_read_prot_status(cs35l56_base, &prot_sts, &fw_ver);
+			if (ret)
+				return true;
+
+			if ((fw_ver & CS35L56_FW_MAIN_VERSION_MASK) < 0x30d07)
+				return true;
+
+			return false;
+		case 0xb2:
+			ret = cs35l56_read_prot_status(cs35l56_base, &prot_sts, &fw_ver);
+			if (ret)
+				return true;
+
+			if ((fw_ver & CS35L56_FW_MAIN_VERSION_MASK) < 0x40710)
+				return true;
+
+			return false;
+		default:
+			return false;
+		}
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_needs_wait_for_firmware_timer_expiry, "SND_SOC_CS35L56_SHARED");
+
 void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp)
 {
 	__be32 pid, sid, tid;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 74129fcc79dce..04402808dcde6 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1649,6 +1649,10 @@ int cs35l56_system_resume(struct device *dev)
 
 	dev_dbg(dev, "system_resume\n");
 
+	/* Assume the firmware reset to default until we can check it */
+	if (cs35l56->base.init_done)
+		cs35l56->needs_wait_for_fw_idle = true;
+
 	/*
 	 * We might have done a hard reset or the CS35L56 was power-cycled
 	 * so wait for control port to be ready.
@@ -1663,6 +1667,16 @@ int cs35l56_system_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (cs35l56->sdw_peripheral && cs35l56->base.init_done) {
+		ret = pm_runtime_resume_and_get(cs35l56->base.dev);
+		if (ret < 0)
+			return ret;
+
+		cs35l56->needs_wait_for_fw_idle =
+			cs35l56_needs_wait_for_firmware_timer_expiry(&cs35l56->base);
+		pm_runtime_put_autosuspend(cs35l56->base.dev);
+	}
+
 	/* Firmware won't have been loaded if the component hasn't probed */
 	if (!cs35l56->component)
 		return 0;
@@ -2187,6 +2201,9 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	if (ret)
 		return dev_err_probe(cs35l56->base.dev, ret, "Failed to write ASP1_CONTROL3\n");
 
+	cs35l56->needs_wait_for_fw_idle =
+		cs35l56_needs_wait_for_firmware_timer_expiry(&cs35l56->base);
+
 	cs35l56->base.init_done = true;
 	complete_all(&cs35l56->init_completion);
 
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index f7cf8aa653e28..b46f410f0e093 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -43,6 +43,7 @@ struct cs35l56_private {
 	bool soft_resetting;
 	bool sdw_attached;
 	bool component_registered;
+	bool needs_wait_for_fw_idle;
 	struct completion init_completion;
 
 	int speaker_id;
-- 
2.47.3

