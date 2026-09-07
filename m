Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECBA78F4A;
	Mon,  7 Sep 2026 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773815; cv=fail; b=CWcKZS/KMfFOR+sZPTfNh5o/Z/5jls7F7GiPwZsziwcmG2MpalhseSlyfcF9tKPfoHkmMiOJcDUA/I/xCgMysu75q0U/qDDKF2c/0C4U+8Klbw/TLwQZp/D/+QSvv12SAq7AF1ii0k0eUPo9tzTW0qZzTFRr2i34vwRTjTgnCNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773815; c=relaxed/simple;
	bh=ydUk49B/0fc7NN6JSO9ACX40Iq4LvOQPGYZWoLQ4CLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tbn3kg0fJikb9LvG2Ic4sKQDZu8OlNVzyteaaZmdO2r5BfFtJjfoFP/p/rpTk5rlNyX9ahWIKKZIAwS/CW4W38sTwmUoKRmqIVt9hUqqJHvwygaxHQWhbJ8DfLXrUsoNKAu+XGgd2EA76VGx0cP8nT8eAGOe1mOMKcKdAf2A4pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DWoO/mqS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WIcXR9SN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DWoO/mqS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WIcXR9SN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6871avtK3872313;
	Mon, 7 Sep 2026 04:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=x8WO7U6Vsc4TOMsv
	aufvIt9Emnj11s/eDj2/yCO9zdU=; b=DWoO/mqSHfA9DBRCfnMbt/qyZXwAZcZg
	lf60Rbmwm9lahQChtIdj2JA+j2tdc9etQmUrc2q6KT11211k+C3WMZF8PSPJO+P5
	ttUErmlaFMUqurqeRwJyhV4sZY7L9kcBrfZcQUN+ja3/j+kfLN38GydCfkaZGz4X
	TWdM9xHqMcW72ZLDwFiOxA+dYXVkPViFbmnHO9G6MCoRKHnZUe0WhXrK0gq+4CJD
	qEtuTzudZgpvtfpUPzlsF0n6brOjV34C/INU36zFQd4FRN8HhXcziAXX1vW3uR51
	9l75tqlAkhundROYkLq5nEIwifzxbGWo1EMvbGmc77MZCwBdY/+P2Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020111.outbound.protection.outlook.com [52.101.56.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjssq2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 04:36:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVwgXipirlnwxpF9XqXRGVVPXAkRkCrJIeElWh0vGNdheY4KZT7hJ0ZDkZwMm37do840FxPVMEH0aCK7ZMHPsLqWFKVWXD2e2L6GVniXSrSHEEIbh+N/q2+tqMGOjB3y3Hiv7JgOcS7wA62OIwCmXomiNRK5+NKiNVBqMrIilkavQo++H8rodLuVXKIIHHN/N2irBPGER0WZve98V68GKeukAfVxwIaVwqfiVhqcKg6AslUWEz1uIDERJaErAFJa+HyH0aC9oIXENQkvbNqMS+L1k1pnYjKj+NdL45IGoVISLpxruw8a+x7qVuJlZrOUTt1DJ+r8w16M+y+DdX7vxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8WO7U6Vsc4TOMsvaufvIt9Emnj11s/eDj2/yCO9zdU=;
 b=wF/fiH8dOr4H/++HPVDOlo/uKfJoHVmvSezeNtlIQFr3D4IR8bq1ftBZsYhcjdTK30JMfwFuwWcV5oGFGhE/lyjvQ0z2U/FTfUUX3eY2j9kvIVBfBZr2Q6ZLMQqwieDN1w7zv066e0lGGNIFrMz4GLw46e+Iu4xhB0aiK0p/ZibGOdwBq5x8tXiosbWYAeRg1KDl4fdBUZT2HLauZ3nTiex1HhkKf+XRy82PZOwiUDkdPJ2GrhL45KgrjQFNU5m/LfqpwzeGsi92tt5O9Qlx6gbAVlE2yhGnzJG5QCCBQOvCOUtbzCXOLLr3Xh6EAXGugrPlIYYOWyKEl9rZ28IzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8WO7U6Vsc4TOMsvaufvIt9Emnj11s/eDj2/yCO9zdU=;
 b=WIcXR9SN/ID6oUw52IoTJqHrmr2jhIH5SYpX0CW8mtRkAL4by2G4tC/O9s7jPu+rZKjO3L9CemMFNvaCopx33K+riK5grUdshIoPZibtVGG1UPWpJby7i3Et+sl8ncdPd8bTwafdHrntNoT3cMPUUMVgpMnlHrqErZKiKGnZNDs=
Received: from BL1PR13CA0140.namprd13.prod.outlook.com (2603:10b6:208:2bb::25)
 by CH6PR19MB160781.namprd19.prod.outlook.com (2603:10b6:610:304::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:36:47 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:208:2bb:cafe::4d) by BL1PR13CA0140.outlook.office365.com
 (2603:10b6:208:2bb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 09:36:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 09:36:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A5F5406543;
	Mon,  7 Sep 2026 09:36:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 81FCC820247;
	Mon,  7 Sep 2026 09:36:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Fix race between kexec and snd_soc_register_component()
Date: Mon,  7 Sep 2026 10:36:45 +0100
Message-ID: <20260907093645.27407-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|CH6PR19MB160781:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ecca6c14-2cbf-4333-2874-08df0cc38941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|61400799027|34020700016|5023799004|11063799006|56012099006|6133799003|16102099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	nKWl/8y2iAO7q6lkW90ORP5QqCeM/mhBIMU8yFe4IQB+J0y+bVUZ0aXCQl7rwHuqZRpjvVrKmvBdVrFVeLFMKes9gPpuxk2GGhmsIf5ixytx9pzy9aVQAvbj1ou/+905OyX0RqKbklTTBpJZlxSUB9yIg/3ypzPCZ5ziYwXCgqG5OOg/P0NoOBCpy1HREzhy7PHFIGP3hfRKGFL88YSND5IX++Y2/7yPFpfJ7AgXxGkFNSea/HbkJ7KYhoe/TYCfWx+f7LFpCUzF5FPqLssyXfCVH4CPcdOXEG4/zXFwrIFPI5GxCT9pF6yf+K5RZV09ST1K8Y2UHysYQR2EUVR6/5xaBECBat/WSo5W8YyGti8dbAcwc5I+EHZMLMXTlx7TypZ08cZ4Wluf0xBsDw9lCHeqtOllVONRTss6JHWEWXE7TGTsle6lQsCsHPL9/0Y/5m+81bjn/mk/sp1rsvllgaOBWmMabcErS4POB7a/BvkhOkNTZOPyS3A+P+ifICwvkTkjvJJOcxkY1vlvxBrWb5DndZ2QSWjt3aV/GYFx97lTTefw0NO5et4PjQJ6TEctZEp+/Rbp33C4jZdZMn7CB7fl0/fb4X3UA5Kuq4REtzvDHdXeC/r7uf75xwIMXRqwNeLStuXKnvw5sBiDq/jvncx8PDCZPU4c8gf5xAHeJseQ0zm5pAhiM30BwLnro0SJKYCmJDP3Gv1EQE13gC4ETA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(61400799027)(34020700016)(5023799004)(11063799006)(56012099006)(6133799003)(16102099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fLd8CZPxUiFoDaAaucl5jDnCuESyA/EHSAo9Gvl6+CNFjoS6+vRY8/WR6OuXSEr5X12wOl1IV1/rOZJ+vdSqvP8rc9qclJbPv1860cY1/+LkxV92p6+Jgmn0yXgXoB8zgfM8O1viODtJ0/ao5vXWAHwWKM6F1TM8hcluvSN9eCiT/ZCm6bW2YCcSRNjDorKIL8DrU8DF+HNLsbHEqZGP5zOlMf+Wse/2fDL7yR6WRNUl0fVdwABVxXISu2GelvjTrnyxDwX8AvdVoMU9CxfjB7kTklkUHwhtrwKDjQb56n7h4kMrTDn37jJT0udafPhfOO/Q7pKGmdON2/+R3555B5lsufCLsHDBTWpsefolsrNpjRHXUDVGdfJFkjM8DPbrsf6Tz41PmWOuUHx5jyA6whKtpQohdAs4wsypctXqSU1e75CfWllOLyFhoaaMI1su
X-Exchange-RoutingPolicyChecked:
	L08sd5f4FXOiM2WQ+kow7IN9F2ezkCMSAs3tLYHHIMtSRbg3ZTDa2qm5tCoZ3xgoz9k/vWKYkRVSAyNLkRJ3tihz+JZHppttGxWDda0XtrjSo9HwIBsl0QDXmiti+s5DCoM5WP8fb433qFsSSFfN3X6Efi2OJ7rrKBjLhNTEjUTUWdjGKFTZ/ontM5tzGO8YFYJ8LM5yKkkbaIKVpDBDytWi429OfOjxk0upSuzTops71I5XH4GNccNkPEb5HIU6rgmB32aDbiTRJteqWUN+5lumjdu8lTO8vDXk+iks8Cigql0xFXU/d/8CjhLih2+LLJ8jv+xMlwIUwBvtVVbyzQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:36:46.8739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecca6c14-2cbf-4333-2874-08df0cc38941
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH6PR19MB160781
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9e85b3 cx=c_pps
 a=uOxnHlk0p54I2XS21iaCKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=4p3RGeWLTW2k7k9YAj4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNCBTYWx0ZWRfX6LVoM8lv3gP1
 0Taqn76XGCBmVQtWj8Ec7Y2HxptobwWmmu7CoegOvFhMgDhZj9CKhuyYzLjOz8es6L2u2AdfoZM
 H/cj/0mEkKHBwf0cTnIXtJTo73yKVqL+uPjfz1qP9vpbMLGowT6gttpsifwyq3splS70Ks1nHZQ
 K1YmG6HX/NSw2XUlLDHz2tDPPEeDQxuvjShAg1uKszB2sNETRvoaaR7yZg8E2f4HV028zM8P4FO
 drN9QSB3OTBVs9PaUQMoFin+C3f/iKxrfr0qdDbrr008F5SghchMt24yAPrSUvsYI3xZw0gYfvY
 YfdDjN60rvWyzO0fuvRFxmSd9G5FYzZh6Nsi3kWC0cTHoFhjXJHRQyw244UPrfAFzcASt35wML7
 ZJKM1mEThcvL1pbJunShsYbOYZYRUWiUNxSfkaPz1qVPdonokAYa2RA7GFuSoa9idg9YkE3ZsK5
 66A57TtjsFFrfqMszyg==
X-Proofpoint-ORIG-GUID: I4Oq5PTKRhQPrn9aFlJCjBvYTFs4j9k3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNCBTYWx0ZWRfXzc1oetjpdqpX
 yPNHOZTNm3f11K9JptnTjHVsJUvoVLDBENYEIkN9FxEwB31p+sEniaQhlmvyHnaTvWrDMOjv3gx
 k7035OMszX0fgv8M3yvK/fnwbu7ib/4=
X-Proofpoint-GUID: I4Oq5PTKRhQPrn9aFlJCjBvYTFs4j9k3
X-Proofpoint-Spam-Reason: safe

Use a reboot notifier and a mutex to prevent snd_soc_register_component()
from racing with a kexec reboot. This prevents snd_soc_register_component()
from manipulating device lists while device_shutdown() is walking them.

Commit 1d80a4792f1de ("ASoC: cs35l56: Fix probe deadlock waiting for
SoundWire enumeration") moved snd_soc_register_component() out of probe()
into a workqueue item. See the description in that commit for a
detailed explanation.

That change introduces a race between snd_soc_register_component() and
kexec. The reboot notifier and mutex prevent the shutdown race.

There is one remaining race with KEXEC_JUMP because it does not invoke
reboot notifiers or freeze freezable workqueues. But KEXEC_JUMP is
rarely used and is supported on only two architectures (x86 and SuperH).
It does not appear to be enabled by default in any distro. It is also
unlikely there will be a KEXEC_JUMP before snd_soc_register_component()
has had the opportunity to execute. Fixing this can be deferred to a
future patch.

Fixes: 1d80a4792f1de ("ASoC: cs35l56: Fix probe deadlock waiting for SoundWire enumeration")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 890429ab0dfb..35d210626627 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -18,9 +18,11 @@
 #include <linux/interrupt.h>
 #include <linux/math.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
@@ -37,6 +39,13 @@
 #include "wm_adsp.h"
 #include "cs35l56.h"
 
+/*
+ * snd_soc_register_component() can call component_probe() on all instances
+ * in a card, so deferred registration must be protected across all instances.
+ */
+static DEFINE_MUTEX(cs35l56_component_register_lock);
+static bool cs35l56_shutting_down;
+
 void cs35l56_mask_soundwire_interrupts(struct cs35l56_private *cs35l56)
 {
 	 /*
@@ -1957,6 +1966,11 @@ static void cs35l56_component_register_work(struct work_struct *work)
 						       component_register_work);
 	int ret;
 
+	guard(mutex)(&cs35l56_component_register_lock);
+
+	if (cs35l56_shutting_down)
+		return;
+
 	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(cs35l56->base.dev, pm_err);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm_err);
 	if (ret) {
@@ -2217,6 +2231,37 @@ EXPORT_NS_GPL_DEV_PM_OPS(cs35l56_pm_ops_i2c_spi, SND_SOC_CS35L56_CORE) = {
 };
 #endif
 
+static int cs35l56_reboot_notify(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	guard(mutex)(&cs35l56_component_register_lock);
+	cs35l56_shutting_down = true;
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block cs35l56_reboot_notifier = {
+	.notifier_call = cs35l56_reboot_notify,
+};
+
+static int __init cs35l56_modinit(void)
+{
+	/*
+	 * Use reboot notifier to prevent race between shutdown and
+	 * snd_soc_register_component(). Driver shutdown() callback would
+	 * run too late, after device_shutdown() is already walking the
+	 * device list that component registration can modify.
+	 */
+	return register_reboot_notifier(&cs35l56_reboot_notifier);
+}
+module_init(cs35l56_modinit);
+
+static void __exit cs35l56_modexit(void)
+{
+	unregister_reboot_notifier(&cs35l56_reboot_notifier);
+}
+module_exit(cs35l56_modexit);
+
 MODULE_DESCRIPTION("ASoC CS35L56 driver");
 MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
-- 
2.47.3

