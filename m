Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78E49E5CE;
	Fri, 11 Sep 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143575; cv=fail; b=UJQXQhmy5eqoTIMcSHVb2z1AdGck0L4sT5uGxVe5l1ARHzVMrqxx2WiJHVsTyaSPVAcsoCtTkrpSNyUM7XQpL7fqkRJFw8M+BsiGmYc/gat4ofIPPWLPXRO/d8I3KikdVOxLAEYn/KDRNOKCUKgBwFliGRDYX0OlYUktDdaVYY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143575; c=relaxed/simple;
	bh=kub6lrqHN0znX8Pb9dC0Im4bZqKiG66edWyESWK6Q0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EGEFIb5YuKNzsehfeqyGbmPc9S6xR1BaopBjbwWE/Mm2iUYbBZaFPj3WMMGDInks8s1EJ6mz/a2vSjLGhYzlOPlpZjxFYETl/O4udpl0I+iWAPpr0PNm1iRfFnjAYlKeMkwnVT03Um9aza1u8LdDzSqnxou3ZtcdrJUqsz2Js/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eLMZ5l0L; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OD+58+Sy; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eLMZ5l0L";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OD+58+Sy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFNw2Y3275254;
	Fri, 11 Sep 2026 11:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=yuiUnaN/5a2d1t4p
	xi1zlDr/XxLaogP9WfzOuGjKEeo=; b=eLMZ5l0Llb/3XFBhBJmYxAGn0gLO4zoC
	qim78UsZyFp5yLSkjNmVDd8c08pxqU6KTju90DTnhoQDGyW467JvZvs8GgZs6FZK
	5PZEur9dNaQeVpW11UTYJYehZeb70OEC1g6oU8X569gtLEiwS1BSpD8iM6ovml/b
	QUM/2eISroPsq4ckSoMvqcHcfulaP2yXKpqLpYKsr4fCSkf/QWzRrvck1xTFCHaK
	V9lb1ckIIKHLSfasidj/i4Tyyy/GntfwSF0z8GQbqc8a5/KBBWqwHcW5NWslufyK
	QvzdP+lCaraE134OxmKexkmKce2dYrJuTct86zK/cFYWtdywnAz9JA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021135.outbound.protection.outlook.com [52.101.62.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcypb32m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:19:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6qfgQH6TaU0/t0SOpNBmJcJCb32Ic0LdrRMb85D/0mw52CyoB53uyf+Dz4YAWH713Dl0t09I7hsGX/Y25ZWBglK3iENf6G4UDpaHBCroTlhwTfl16EaHZuHp7sUAgnZnxXusJpHIrSemqf1TBeWo3wa2H99zFGwC1BQ+RbOCwn7lTxnJbJynC0OBlJIuiMGoURvgHC/XPw4XrFKxJw6TrLNxVeOeYw4X6VOfTrKrAwcf+vz0VJfwqk+fBcxWe4i6IvuP1r3OpYGsYQLAri2J+iZo2KU1u+NUdGOvEB2HMWA4qXW7OoPUcR3SrMBijM347XeYTkYEbnxuE5fQpsmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuiUnaN/5a2d1t4pxi1zlDr/XxLaogP9WfzOuGjKEeo=;
 b=lCMLaVF+Eu48Vnngs6lPadlEt47LQMpJLN0ZWDS4P8obGR3JWrH1R3M+fzDfYHsK6F4hZj0VabmvqnjF5r0+qMtS47pU9cz2ySLWIyg+yYJ1T/xU2AylVb/GfDQpcKBrOm+FU1Nz4A3toGy7DfBZsJ4fQB4TAnDTw2LacQxGKaiHup0+oXtvXPHQHLX+Cn0giYm6sXRWWr+rVD4Afn6XkupmbudWo/HdyOgrDvo43/OZ+xDmdhO20C3uMhl0kr7EQaDpZ528xIqn0rFeTV/ORj5KeVivEeEkNp+kS6mYA3TmIR1pKkQEnmDtvN9dmqadkyZZDC0RpmghMMDyg0qMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuiUnaN/5a2d1t4pxi1zlDr/XxLaogP9WfzOuGjKEeo=;
 b=OD+58+SyanWtd4sgZ3zhXh6MIAUPbULQebUe3RTLuM5b79ijiCf1WLLvC/IY8XSy2xG2MITZSH39Rzq3t9CEI7Mi+4rbnqTuexiLaAxy183Pnm9+Dqi0MJrv/KO9XB6pyJmhwqDXBmypnd3DrPJqktHegZ7ZSDDXAOe/AefY4Tk=
Received: from BL1PR13CA0094.namprd13.prod.outlook.com (2603:10b6:208:2b9::9)
 by DS3PR19MB9680.namprd19.prod.outlook.com (2603:10b6:8:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 16:19:11 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::3f) by BL1PR13CA0094.outlook.office365.com
 (2603:10b6:208:2b9::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Fri, 11
 Sep 2026 16:19:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 16:19:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10D90406560;
	Fri, 11 Sep 2026 16:19:09 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED7F6820244;
	Fri, 11 Sep 2026 16:19:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Allow SoundWire devices to communicate during remove
Date: Fri, 11 Sep 2026 17:19:01 +0100
Message-ID: <20260911161903.419814-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DS3PR19MB9680:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c8a4639-54cb-4291-094f-08df1020698f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|61400799027|56012099006|11063799006|16102099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jJsPlwzTinn3IPOSiewIXTo4uae5kuN8DxFNdOI5KuajG86GhC+dDu+CVVeWodof9q+r0MfMmOiqHLmxJ2/AER9EIpE0XqKvXpRjutofsGGGWBkjzHXgPDse1+ECfSTlLkyeaUNinaLkVfWix/F4KhE7QbhqLKL+hklHIx0PVBHsfJ+/dPXXCvvXpspaT5+QarG4IosqcteQYXZvgJaH4iJE/anAlt8GO0SLDKJlL1g0rgERe8OrCmze2OtbCGQW0w034IzZnCvFg9EjX1egJXo2cEOJfBPQfUdhYW5cJPOEkft9T2If6QnNrCytd4j8cgXh0/x/6Sc390dsm/xBDQ+YVVEux9KOnTbPUZ0hUyFZlAK89jkC4DRhNJAFykTtPNaDF4NKgfQ6j6KFanLGdU5xcVNzAcgx9c3DgOGlJtJrviRz7LjZCvHG8IFuTO0grpiJfgJv0yRAj54ZH/3bPAQXkK+RugdmlH0+9nt/biFdtDqn41Pu6PiQ8KQNZifHPNpseuSazsga6nwEpkYTEUas23PHoqzBOGheRhyx+7zeSbUf9KO7GJbeXlRp4DCluNEedOTsG1xpgVWwK2p2ROXXHcn3XCmbte7F38Ceba8oQeeSDa4ETJaynoRjPk8cpIADzJZwGSmsyGhbVFmUa24+VOJwvO0udRoCy+uB8SzvMIE3AE3kFHX8+fPJT3DhDGLh7lRweTigZY4wQzUyyg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(61400799027)(56012099006)(11063799006)(16102099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kz9PWnDO6Nf3w3V7lJ3GeuLcMTD0uDv/3Lhs8U0i4s9f3+ZdH7BEKOYV6YzICeewjHLMkgjOmfWWACV5LMjo04eU41n2Ldn5TD8CMD9+ylu3wFj5skn+ix66ZMtwdZeWFgC4EEzXziaAio9X5KIodZsR07onF3JwGJWw2+EzhDzKtif2GyeJ4dKiHDTrs3/OXYzPHg0KkNLFvitmYfof9att6LakSHVE4vljxHaW4fg+eMuA7SMPgYeiXaby7tfT+PAs/elqMwrgqifH5XfjWVIFYc+DgW2BSAn5CuzEtmY5uvSeBjCmV9eTT1K06P3FtKqIo4p8KBNHpgICsY1myKMhq4Zm3JswovstMlxUp3qJe1fd6br3FR4sU+kinhH7AZfFld374YK5lNPQXCkOZrLC7PPwaTLTx/ptPeC9VIGbNsz6BI6nF3w86ZucjjE8
X-Exchange-RoutingPolicyChecked:
	LUaFpLWiacv3Doj7WpSuK9L3YC/QxifF9/W6PdVVINtXK62MNK91u6pP5J7NptJ6w35H2qKT46nwgUSY1eTqGCkS+4ygGoxaJQXGzbNA9JtccP18aV+D5IWf5iPPcJuwA/sfjUATMGukVuRHMYi8DnHj66bwzS+w/1raKNSjY2k1P1mzOcKk0EIAvOVo4p+XXlHZBqsz8bIDLNdGfuchrMREppv8+IHQdDCmUrqszaUvZuYTF52s4cwfHUiLFW0dnwkBeQXwxihfJmcL7cXEULSCXI8KOM1QWF43ahQKv+H2bm3lSADRYBWtDNuhzh1udOaHPX1HpBSlxJ+EUNhRoA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:19:10.3713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8a4639-54cb-4291-094f-08df1020698f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9680
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa42a03 cx=c_pps
 a=rzUdehR910POqGivuQKQfw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=nrA57zWu_qATKoNrvgAA:9
X-Proofpoint-ORIG-GUID: YKvujfol_uEt7XOm5lFBtZStI5XWjaK-
X-Proofpoint-GUID: YKvujfol_uEt7XOm5lFBtZStI5XWjaK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyNyBTYWx0ZWRfXyfdlT0QoquxB
 h3bdhNPR6dAyr4qMTxpwfL6jkg3DodBAsLKPbVym1JYGxIPg7n6bLcBOzNQ6oBmd/KO+U8FPfIG
 8LuVCYEvcuylgX2DxuvXBwcaW8Jf4HDjWxvHwSvAQFY2kXlAmMe91X+NoIyE6F+keeWmgcriagL
 /ULG74J+RZMhUB332Q6nHx5Cc3DWHkYcwBI13e5ilH6KWCCWF8sMhsguQC6fn0QUYD2POAmlxbH
 F7z+du46oojS+FJoYw50u8iii7voDfCUpA+Y8m5GF8ndpFHaQrwJhsMdK7Ht2WjYeM7eNpp0xDI
 mAkCztG4CIPiBZ/8AH/OzD/E0t2BhirLWV83YH/pu9i0LT7/YNO2q9NuKLJRmrtB2H8gtwjOVsp
 MmJe+0NrIMRxnppmF9n3Hpv9oGCzCLB+UVbuUhqq18LynOs7KRU2aoI73puSokOcq7hFxhT9ZR3
 0+tXWs7JirzR0gYm/kA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyNyBTYWx0ZWRfX76LFJSiH5yeY
 h2gcrS5p0DK7Dqd8q3R0LwJaKoppdXkIJC8aZSG+MElHS9wD1LhxcfTIiNe+OoHjeDeIvtso5HJ
 KL2DH+mDqA7hRTP7sFo9P+lExLCrSZA=
X-Proofpoint-Spam-Reason: safe

Currently on Intel systems SoundWire drivers can't communicate with the
device during driver removal. This is primarily because the IRQs are
disabled before the driver remove callback is run. The result of this is
such transactions timeout causing a) a lot of errors in the log and b)
driver remove to take a very long time.

This issue affects cs42l43 and cs42l45, primarily due to both using
regmap IRQ.

 soundwire_intel soundwire_intel.link.0: IO transfer timed out, cmd 3 device 6 addr 5d len 1
 soundwire sdw-master-0-0: trf on Slave 6 failed:-110 write addr 5d count 0
 sdca_class sdw:0:0:01fa:4245:01: Failed to sync masks in 5d

As regmap IRQ is torn down it will mask the interrupts that are
removed. However, there are many valid reasons a driver might want
communicate with the device during removal, others would include
disabling jack detection, putting the device into the lowest possible
power state to save power, etc.

This patch set attempts to address this problem trying to locate the
reason interrupts are disabled, fixing that and then leaving the IRQs
enabled for the remove callback.

Charles Keepax (2):
  soundwire: bus: Don't unassign dev_num before unregistering device
  soundwire: intel_auxdevice: Don't disable IRQs before removing
    children

 drivers/soundwire/bus.c             |  4 ++--
 drivers/soundwire/intel.h           |  1 +
 drivers/soundwire/intel_auxdevice.c |  5 ++++-
 drivers/soundwire/intel_init.c      | 16 ++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  1 +
 5 files changed, 24 insertions(+), 3 deletions(-)

-- 
2.47.3

