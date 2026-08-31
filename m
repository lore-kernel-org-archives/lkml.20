Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C888481FA0;
	Mon, 31 Aug 2026 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184934; cv=fail; b=RYiuYGAIyPJEsLp1xjaXQxlEojANvZRJKJOF3QxA6sUJKzvGXpYDCqp6B/GsX71GmLmOXzBhHsmri3PWu/9MGK6hSwVM4MaFYuUgeF3MY6mtRVMgvcX7A8EiRVdi9V78WnBB8MATLNFfpxEiI9pr93szDAXEVxYvkRHDD5nYKzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184934; c=relaxed/simple;
	bh=FfGY/hgv+DPvGSUs/06PYkfBgrql3SCMtbnTRFMsohc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Db7zu3qzsOX/LQ1s6OAaM95yPk61HessczPxbUziLfptbxboHxxWOEnwjzhB5WXxh5M6z+l4BfQA5WhDo904Kj0CF3O6Ot5QmERNCSLn7Sp8uvrGuvHhhAZ/9Qxxn6QHD1yY0JbNVn1dnsy0VUFY5St8nbC/8v8o/XRiUJBbOfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EOkLqWbC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wvMOM448; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EOkLqWbC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wvMOM448"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V5RRQT1516251;
	Mon, 31 Aug 2026 09:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=k9pOoUE1LWzRDMcq
	XbjqLM3beqsaO2OZwmlV17b8sJM=; b=EOkLqWbClg4JXRySvuE40cALj3x9hTS8
	Dj23lSb6aI7txBVRdkbHKgBHc8DqxpIYozW/GO1bWXmuVGm8UGKv02nDkQML0BxC
	YaoUtS3irsQ453TIFdVyMMKbf8z1x+3GzU/3FYXtLAghzS97rLHWmr1KnQH2PHRN
	/53jeqBkQzlV0geaEzmzpd0e5uqUTjTd1b3NqWHT7mkfPJQSlzMWizAm7sZgU4pW
	RyprvouZ4ZDfwe2xOkX9jlzXN5GBc9YbBTuBNYDYQ6HGuQns8gtVCTf8R2m5mXif
	whUU1SD4ChV5MHbMkONJKqEoVfrA2HJxbwTs74iVwQU28ZXP7ijxGg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020074.outbound.protection.outlook.com [52.101.61.74])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyt69r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 09:02:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCGAax4b6wndYUXJWqWiSF1pLGOToJFqEHduNZPc+RDt02a9P/tyvW7KSSJ6W0EoMOCADUY4or2asL9C8xgkgBk0n/b7lay44LyqwhEWVmY6N5X971VoyyWYWakFLvzGUda1kCm8zaDHjn+BAU4l8+UU2oOW48yrwSH/eMriA9NQF9ag99VkPjQ+LnkyhQ7Orc+qyx+R1A5urcVbqTF0wT4WLuPHUB1Z1DvN98Fx5GVIwRdS4erXyxs9WBaXj4hXLFSrGhN42FfNqqEHq4V84Vzm49m/fwd+xUHmJoqdfQP7plIeUwSAOsOgXpFBO0joKIovDJeq/2Wuc6qSH6kMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9pOoUE1LWzRDMcqXbjqLM3beqsaO2OZwmlV17b8sJM=;
 b=OMuIcCxCe8DVIFSGtWLdMjxUeP+LqXWt1eD/i2w7KZO6KiREkoqE7/PVTqoicug/2MD/saZK/zpwn+CK7rXHkyz+JgHCGuWYRg+oKWdFRpnJ4HAhTaaQoHKWw3a3TftA1yqpwzAGngevx+QyVdic+s47H55fdBRQYi6KG1weMZ5g1X5keyUF+sQGCR3YQtVXr97XM5C+juhN7B/sH5ejnZzH9POkjdCfePUoPD3Mlr6Y0AWfM77IwDarXlEov+C4LiqMf8V4MjAhwcdSihO/LRnsUFpzQbcccKUXP1bYrS/r3ZwWmfKQn7+8FW/8iPkuYW3rxm7PSk1a2NtoFxM4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9pOoUE1LWzRDMcqXbjqLM3beqsaO2OZwmlV17b8sJM=;
 b=wvMOM448OZHZ/Jyy5xSObS+CTXB01ljM6wugLTSoKfqeUJf7F+l6lWxezu0Iev1lw/mWAr2eS1FS5JPbBsgzxdjHpwaNrpXfKwpAGQdHLLYJZP0fkByr8Lac2lpavK7D4in1IYK5MU7CcUZa67Z1lqaX4CWgc+ACOC2VDJ/94bc=
Received: from SA0PR12CA0008.namprd12.prod.outlook.com (2603:10b6:806:6f::13)
 by DS2PR19MB493324.namprd19.prod.outlook.com (2603:10b6:8:404::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:02:03 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:6f:cafe::90) by SA0PR12CA0008.outlook.office365.com
 (2603:10b6:806:6f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 14:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 14:02:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DF359406544;
	Mon, 31 Aug 2026 14:02:00 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C9827820247;
	Mon, 31 Aug 2026 14:02:00 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add SoundWire detach helper
Date: Mon, 31 Aug 2026 15:01:55 +0100
Message-ID: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DS2PR19MB493324:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ce12d946-9519-4221-1425-08df07686ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|36860700016|23010399003|61400799027|376014|10067099003|16102099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	TmNTZDjtZLJP4kDobmx1Xopa96RUtc0WJyKNTOsUG+y4cH8NsMhNXN76aLcJ5ZeWboaebk/8i8rS7nOOR7UsavQoz4absoQ50lKi2GtWVuFiTTwzZlK8lQb7WD8mm3pphvNH6F74dKGQZStmriz602ymQ6bT13Ja4hv9UPVnWA/MxdKnaxulhoeAhmAwFJPSwUb4O7cQZlIow5P0IQBH1Pe6vosD03SB7LPDedUZub5GZcq5JEoElnXjxokiE+Gy3pjkfYNAjgxzAPBl6VOcVDJkZC5Bz+ZiV/IILTlNr4kh/6CvcsgGhHvFpWLJRyZo6124MWXPqp0CwZMCX9yyhxWFNKbLyg0cFDKuf4+AZOmv+dXX2YUKwOIYCYrcf+keGFzDm0BdV5bhl86RKBjHapp2A92goAaybZpKCtOrXZJEDeNXoXohPHhMoDvgHpy1SFR06GqTkgM/Q2cHqtweKB5H6izK/UOG29KG2TNho8EX/55KHjhyO/mDG34R0GgyHrJZx5GejbSzTMZrZ8UIZsX//Lw8lJDnvKG2Jj+ImjBB65YUZMfTRoSbtSkZhaUEHZ+BHVlahY/o2QLEtbtA8KmQVj108Kz1xYixsEJ6/uG31RLUY7Bqp/x3ik+0stVkH8gFfTGIF7wrS5927NY58+uRyAMP1QvogO/I7uK4jeTg8p7pr5903o/fqjcO7TtZrqZeWNcWGRrQjEkkERfyyg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(10067099003)(16102099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nsCIx4VtuSReKZf4Y92JLB93FkYj3q6SsWKcIPaACEjAauM8oURg4+WLehhIqrHwFYlGsUliQCnShfN16jLspAUOHytaZHgwSnHFXpAxwO7jfJHn9aSQE+kCeo6GA97FbdpTrSDPGK6WhqvrsTXdMDeQ0MT6E9pIwFo7D6SN9yNYrFib5PmbdsCf4Zqu2QEqZp/kE3ld0qDLBGN0hVGRs6L/P1Oj8HaP03o1qjJ01A+fXO2dvbwsknw4xk5jd2ZO9T4f8Koxc4ZgJhTxdHZUZQy1cdGpcLUWEQUsIxlPLNA4Q4jskm8HfI4+w5t+cVq1jG7+Fnq9xOV51SuZQj1AHz+Cb/uss9LyLR7w6f+QxIAkbO199jRs/DKiIX8TTpHKEJ8E+cEnE3GAkMIsLlcLRfKs6nUi2joLUUI15cpeqPHofgULi+22fOPZZxelflvT
X-Exchange-RoutingPolicyChecked:
	NIUIvlUweHC8xr4UMpe4DOICk34HDsXyA4joQfMY93gGRtsLZOFr/l1ajYgx3PG8t6vJtqHy6jMT8+m9XcqZFvnGmX0AGiyVEhvdFTkglrp4N5St8O2Mus3a5uJgEikaFmunMxb6iqG7PLc1C9Sp3mOfjrG8jGtuT5tJiNKe2kCUs2jWz11/LvZ7wrGHnkxBLtRKuvfnk/aVZ3Xtly+liMAUDiZTdfLg73TFQ1MI+Vt4L/2HWpvnxMze95hCnEjQkXqD2OcRekTidX09TKhqvoaBHemrA0lIVohoqA/dIRohqfZLJqz527RcH3sy8WuGRGPRaHu19bb7nZPzgMw3Ug==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:02:02.3042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce12d946-9519-4221-1425-08df07686ebd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB493324
X-Proofpoint-GUID: OG3YUK7Mza7JrgGZ0jUClQubmb2defGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMSBTYWx0ZWRfX2N1TNHXAruGU
 wOGH7kYQ6NGvzRp5IC4J7DcC0e5DNqpLkbods2lRwpOPLl8l0710HnK3TKAzdOMOmstoZq/AVhn
 KTCd3INZV4Z4N6K1KPmyrtBoKHLizIem1JbfdYqWH396SQsEOL3YcT57MgdlwOyqIkh6X9WTxB1
 7jyMET6VFG36cTgR2T3uHsZGpbpN5zW41iEcRHCuFc0NbsAnHoiIauDuwIFeyO403iqkc/VTRsv
 j9h+tmg6f6AiGa62pUTvb5pmdJIyxndMVw8mUzP6fouvQdpBoAYvKCTqCvX/lhB98q4LTd261oR
 Ii2lzRfk/X/XtM4K8laH6JunBYrc7kdPZeXlcnM6o7euw7fMpVCHd9Yyt2AvkWXus4bvxjukKvO
 uf1teOsrr/fzigEDtP5hE2PzXyG2E+xXkTlekD6wC+9LG29Q/wUIbveyQiYJf8Kol18zg7X0PUQ
 HYG8shPYBLvRbFDxd9w==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a95895e cx=c_pps
 a=yYy2G489n0tWBFeUj/OB0w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=cZtL-XUxLnsMaWc3fMoA:9
X-Proofpoint-ORIG-GUID: OG3YUK7Mza7JrgGZ0jUClQubmb2defGs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMSBTYWx0ZWRfX4ek8GYSoAg5e
 hrVRMayEbbTty2JIZ1CENZ++SuuFaNzg/iTaM94jV/UNwUHlpOfqgqLjoLAytK0eVSSKdrFNVpQ
 bcZCKblnnkC56OxvLhEEFV4QVj/P52E=
X-Proofpoint-Spam-Reason: safe

Currently, if a SoundWire driver takes an action that causes the device
to detach from the bus it needs to be careful. There will be a period of
time until the detach is recognised by the core, if the driver
immediately
calls sdw_slave_wait_for_init() it is possible for that to complete
before the detach has been recognised. Leaving the driver with a device
that is potentially not ready for what follows.

To avoid this race add a new helper that drivers can use to inform the
core the device will detach. This clears the enumeration completions
ensuring that sdw_slave_wait_for_init() can't complete until the device
re-attaches.

This is the third part of a longer series of moving these slave
attach/deatach operations into the core:

https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/

I have based this series off Vinod's soundwire tree as that probably
makes sense for which tree to take it through.

Thanks,
Charles

Changes since v1:
 - Correct kerneldoc

Charles Keepax (2):
  soundwire: Add a helper function to indicate a device will detach
  mfd: cs42l43: Move to core detach helper

 drivers/mfd/cs42l43-sdw.c     |  2 --
 drivers/mfd/cs42l43.c         | 15 +--------------
 drivers/soundwire/bus.h       |  6 ------
 include/linux/mfd/cs42l43.h   |  1 -
 include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
 5 files changed, 27 insertions(+), 23 deletions(-)

-- 
2.47.3

