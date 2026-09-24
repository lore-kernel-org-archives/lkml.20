Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB147AF5C;
	Thu, 24 Sep 2026 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251541; cv=fail; b=XhspEr1vsTHy6zESoMOInRpRET2JOVEAhoGe7SLu55HcAng5zuRFW5AQOJwIO0dCCMJ66KLik9frQY/pTWMXEL0q9SaBC7/Ww2CJLY0tm/p4sdooxhlpWDKuApCIjxWafdrn3/cyyGwvQ4OB4N6hEbkLVknHfteEcHxQ8G6F004=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251541; c=relaxed/simple;
	bh=EYpzI+fa9TD9Nt+4guBllVWLaaiCaUXR8FCoWfN130U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NDbl7FMnGQEMQgo4zUl8uATyLUj8r2XPSDCSs9/+xjYGE48DCX8l+LTsycnWOVPRTEhhy/PK/gpVZRpIBSE3LXK4i+2w0cVEJ5deo2ajB/2hQBCGJx/M/q18fAP5Zddds7P2V2zsO4ZwWHXA/UaGPpXbNt+UCxcwhBHOXz1yQAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a7vywXlm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QZ2Z/Z/c; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a7vywXlm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QZ2Z/Z/c"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4qImI3664366;
	Thu, 24 Sep 2026 07:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZJoeBHeiQKNwwIlh
	BSbfyjNR+vVP2DHCQ9A2bNfJ65c=; b=a7vywXlmqupBRylbl01pjt545AV3M8KP
	ngW3NHcevhsrC3VYjFjutS58eJtp9NFFknVePfrrJ+1hkRMXKv9eMQ6spB9jBy21
	9c7vlShwOYgSVPA3gaXgwVCyI5e3KFi/OHRGgxO5KZF1B8/O1obNQNR8mPGyQCNJ
	rXiicmk1OR55hD4Raher/mO897qaNwmiTFR1/mMFdR4VoUJqTZ0n1rQyTMo5y0KI
	8zhKxz4OKZpiFVEOeYbKl/rCmIxpxAdhqrJT1SSd6zYNFpzR+JUGl4FkZPxBJR0L
	moJbIik23zt0H9H1qVpR/JZjqmi9kvYXMCXl+8wUm1kUNt4aYLN+6A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021131.outbound.protection.outlook.com [52.101.52.131])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gsptj77wh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 07:05:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/kNNb6dfklZwW8fjRke6c8nJC0axxJYpnGAUAnZnSNcuGLqg9aEfhom+XN9SK4mz6/fU6VhkAbjE3zvGZL4USLa9pj2U7bsq1MQIAegrJd6PEefN0xMiKfr0br2SC8FRBroaIUP0vIDa/izd8IzbzTeiJGIz1DSDkl7HF2+nFRmBuaO3w87ibXRTt/uxlI4OHE0Y+bRv1NVrq7xd9Sts0jeqU5Z/9kf3M64j/xRuV8Gkz7DjyInJxRyD8BkwWvgHsyht6VOMO2xp93Vib7o4NXhRyUcwm7M85GiVTQds4SN+KrGsNFVwlnn0Rp3fEMuYHAzfVwitP7RXhbovt0C6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJoeBHeiQKNwwIlhBSbfyjNR+vVP2DHCQ9A2bNfJ65c=;
 b=dueoT+ST9b+m2S/m8XwNelZWF1BO0B3Z1jX5NDHEL0+DsJP6ZAF9w0D0I6CzoPRfAKaW0Ft0XjTMHdHB1/pv+I+6zLdlfNGglFGVDNPj0eBMQpymaoYIszInduqYeR9WDvQeaymxqmzH4Q6DUrqzJXI8Sdr4iVmM/ePruKSGy1MDJTgHjayzARDN690QDttZse3SuvXLapMV9AhlLpqj9wV9POeGfAfEBx9Ma2b4SwbT0peeQfvvFsujgqfQRSuAE3eKd58cvURdznl3t1kB5wYxsAFL3HzJ9FymKUBa/0NGD/IF27Cr+9c7poEUR4k1mhezERNpTUL0MEMktVy6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJoeBHeiQKNwwIlhBSbfyjNR+vVP2DHCQ9A2bNfJ65c=;
 b=QZ2Z/Z/c4ffpiqZlV5vvGCBs+KwXITk2qamW8qHkhoxJ7STvM/ooWkSzq5JiIF3sLNN2dKsZ3flntS1BxDRP6qhqd7/1bsvLU1BB24PqeqiONgfeRQSW7alEi7XiLzZ8u/x35E0Al9XWmlwQAstx5ZRBqHYPgPXNevWIpzzlQnc=
Received: from MN2PR07CA0027.namprd07.prod.outlook.com (2603:10b6:208:1a0::37)
 by CY5PR19MB6448.namprd19.prod.outlook.com (2603:10b6:930:3c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:05:26 +0000
Received: from BN3PEPF00022BCA.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::1c) by MN2PR07CA0027.outlook.office365.com
 (2603:10b6:208:1a0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Thu,
 24 Sep 2026 12:05:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCA.mail.protection.outlook.com (10.167.248.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 12:05:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 93176406540;
	Thu, 24 Sep 2026 12:05:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8C45A820247;
	Thu, 24 Sep 2026 12:05:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 0/2] Add SoundWire detach helper
Date: Thu, 24 Sep 2026 13:05:18 +0100
Message-ID: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCA:EE_|CY5PR19MB6448:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5bfd3d47-7df9-4696-7adc-08df1a341e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|376014|82310400026|10067099003|56012099006|11063799006|16102099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	iIfW2EJ659X04/rygkD7GBt9KdgYcTHr2a31ENn0BWosBnsX64q1BOoqzy0VtZdCKSs8zJ1DyAQRtk2juOSKJ0slK1nAWPBeYG0KMsp+PnU5x3T1FENPsRImrwbm/+f0hzWZjiZ+0x/kWuiym7R3vHIiCYNxk9216jJFXAAWAFpwzorKVVU6cWP7kDkvWJiCBclXmPQEcNb8rEC5k6zUlR96EwKW00YPuwk/ClX/hte+5lSubumKOn6Vl7oT2n9WfGoPifquoLtxF4iBWFtSGNIaqgEaaZ6pIN7332n2KNwSNRRrX0NgFobdZEYeNmvk6TWXsCQ4udJBdDcRDqncgsFN0QOjARNsA9UM4JOrm1lDzH6lY5uIJD/YNJtVm8yusgjTV32F4RAUppe4OcW12QfCWHRxCGu/D5XpPUj8R9ZdYGl5Yp2lMqTL3lsf2mLSMhhiWRgQ1+N4AEII4phKGrwEqPEkrbfp7KpInzq0XM2lyO8XU+V8o/wxlJSYVUQkZp/i3+sDh7mI5hp+GhEMIZBLFflclA0+rtXH4HiwE+YrPlAEI3U2hZbBKVWBVeleF1fBK8vHVcWADW/kjU6Hy3tfFkypdzPz+PW5+LFmnKmxr1udEVjiilRVOC/CtsXdCX2aK6SZQSlDGqVgp0J/sRQhjDmadMjMyN9HqL0tcTY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(376014)(82310400026)(10067099003)(56012099006)(11063799006)(16102099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y7g6OPw3a3pxR4E03jETQfUoLyZvHRnibY9qgdq61UN5s7PlqNTTa2Lk7ewwzAtUbUK4ZWFzwqfyeq9f6Q2tXhRIftEwDcs89xmjLGQaGdseIFyQYwMxVuaP0dso3Y/h9B4JLaOLV7NLksASwAC657avep8LCl+UGL02yrhl8yh4droJq121wj4SCeQbXuySbzfm7f6KT+cgNDe1ug9/hub9ueQvf1/fW/aONp5+9EVEM5NHaTI1aEfm1ZtOcs3WQd7laos7vnf1+Iq+Cgi3yJnZ8NR+ydfxFADwpfFUeJ2fQgUMnQ8+klBgWjtl68VOiHqHuzNLCR2//ZK42lvPzBoUrFwdiG/JlU45f3Kx/RKqySrfBeXsmcQrq70+hGkdRYl0BSyPbxY5l8BTpogAU5Q1m5OH9h/lq+ZYeSlhO7vjTVVTSXVGHLcDlkWdWjol
X-Exchange-RoutingPolicyChecked:
	eQhS+eTBL+AfYlaRY9qmBJFNuuG2J9y1v6AMO0u9EBwG+oChYsQAeuX92hBM97NvO1TM7JPOU191kon5R1AHeL8EF9nAc0MbteN1bj6tmX7TZktepqfL2SIdsu460Mrnz8HXfncJn4ms4O1vL+k1uq7EDLmJbPIQHyhqcn0+0yLOShBV4axufJca31O9/kfVi3a4Zd1dAeEYDuaCIfBNrVpuwYwpNzEvpVs66b3RAs+IXqwIICmTxlp+d6iK7gshPlc42u0b1szhsOeaIn23Soad+YUes6InLPxqB3dI2eFiwiDzSgg1ls1e7MtAkhVK7CPA2ZeAU1cADU5aFHTheg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 12:05:25.8679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfd3d47-7df9-4696-7adc-08df1a341e6a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6448
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX23vORqsdNe4t
 L2P5V3/yfletUivUb8Rsm3yAAxHzi+AApVQKhQ68nNxi0IGTpNJyIhimCbzwMcYEwe1ZBuAETdG
 iR3AvwMTsmbRb0jZsnnTrorJiRnEHao=
X-Authority-Analysis: v=2.4 cv=fuZJ914f c=1 sm=1 tr=0 ts=6ab5120b cx=c_pps
 a=rXPbZPGhlTecGYCSGyL8Jw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=cZtL-XUxLnsMaWc3fMoA:9
X-Proofpoint-GUID: VwrV3vmEcB82RUFtTivZQGwUG1rlRe5q
X-Proofpoint-ORIG-GUID: VwrV3vmEcB82RUFtTivZQGwUG1rlRe5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXysH5Rzzzccrz
 m2/wtOUIvHo18F2bTrbMdEEF5T82u6j0tYl4/t/U84kdA3yOIYYMSMW8aKdcgWv1l8fimaMoWCF
 UtVMvEhAgXtoZ5fr6ikBIj8LqyU+hmc9OyMm98rOEb9sDiCSfhJKrzEe4+wCDaaCzm3L5mx6i8O
 BK3GRhXc9QGr9Pcj3B/JVfTuL9ZUVMFxrvF+GRNm2PujuwFbLS3NxiNIdwUyPk3YTrsnlP/skdY
 ST4QZ9eatUpZqLDECGMJ246gO7Tk40wfWyvuBf1o8uNnpqZ0owrGeaPpvCfGyM6yswa5Nel+Psr
 zzePZex564S95j5tmBT9DVTqJ9WqjN7Hx/KyrwnFNS7ZacgSJfVABw7SRDz/Xeb7HqwdS+gVdVZ
 Ef8V/u07F+wTH2pVcc8hFP7k4zps0lkh5Ip+tYtngnmGN7lc41iEekYllqo68M0eOKe0k/OH5/+
 H0KY8EUokfXl41IzUVw==
X-Proofpoint-Spam-Reason: safe

Currently, if a SoundWire driver takes an action that causes the
device to detach from the bus it needs to be careful. There will be
a period of time until the detach is recognised by the core, if the
driver immediately calls sdw_slave_wait_for_init() it is possible for
that to complete before the detach has been recognised. Leaving the
driver with a device that is potentially not ready for what follows.

To avoid this race add a new helper that drivers can use to inform
the core the device will detach. This clears the enumeration
completions ensuring that sdw_slave_wait_for_init() can't complete
until the device re-attaches.

This is the third part of a longer series of moving these slave
attach/deatach operations into the core:

https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
https://lore.kernel.org/linux-sound/20260608102714.2503120-1-ckeepax@opensource.cirrus.com/

I have based this series off Vinod's soundwire tree, but the patches
apply to both the current MFD and SoundWire next branches so should
be fine to apply to either tree.

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

