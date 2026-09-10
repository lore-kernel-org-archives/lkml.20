Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EED45A284;
	Thu, 10 Sep 2026 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040715; cv=fail; b=FkpsuzbIeXxKqLiJohDDrycR2Tl/RUwhu+z8yeXC39AiT+t8/jqB3REY41wvKqdatGOVBttRqOFzAE6vrSsDZkO9zOO4So6t2V2m6chaoeEawpTOm7XSU+Z1nK2z5+ENV7Ersxe578W+aUp3yxZfqSGXYoGZhsXdLG230/J8GMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040715; c=relaxed/simple;
	bh=K6aUqF3eiWaiDD4VzeJRja5DclMbLne39BzTaF495XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jAYJ3gU2kujv+Qzb6OrNSfh1Nlr1vnF4iQ0BQIhb+/+fSmKa/fQydhnkw3B8uyeXLKhxTeLezQpBWh2nqJHvgYPr2adfaa58vVY5bUTxJvpDf86RDpccW3wRJyt20V8RQTF3kASREiqzHcN0BKo6iYmtRPVLvEizO8PAaOrwDJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kbTXI20U; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z9RGhYU+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kbTXI20U";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z9RGhYU+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A0RXct2693935;
	Thu, 10 Sep 2026 06:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=uJSzzSr9stua8eJ1
	nF6zgcLxJ8neCUPzewkV9Fu5If8=; b=kbTXI20UQ+PVEH3UxIknIn2nqLSqLUS5
	yjOF6vSb46d2unAcapvxYIXFVTUAXzCq94bdFiUyQaE8pImOaO3nlkE7wA8GGbR6
	EJUDn0cdo01wHw+HxHje3e8kfnHdOl31LxGoj1WleWMzxOP0Zhnv/Y2+ZS46jy28
	xVEUH+Xr1vs2qThuL1oaszxm46RgcEuObbU8aEROw8GCidMbH+1oTnVFTFVjZ0SS
	LCd+wlK747kAZmYsMMqNVFQ1QwmHD4FNSxkd86/SpA4m9+3v+2/1/JDEAE8HfKXy
	XU/2LOoycb/t1gt1K9zB3b7aIyfyu3LjxEMiiiJd0DwDweTBlAo2ag==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023132.outbound.protection.outlook.com [40.93.196.132])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyms0kk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 06:45:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxoPUjMNPHSKGG2uLYQnkYimVUKMkKWa1+otS2++30WzG35OnXnQeAua2HIFKMI+73yogZdfyC0h+8b7b/g/BdDkoetxI9EdwRNhXslhatFLKN5mm6Au2UtEwRWKasvB9bexF1J7LKNKBZgeyWH5bK4CKTfNG0arpm/ILcPhFpQYsZDvMeizRx22IlnkRru3CiIZHIQDU7SPUC+TjVSm2CL6FSDYfX9BoEctoyUB1uqVxn7GLFkdv/eU00ITu9POkKBlJEucQJCJxcbohXQ5IXJfwT87l2HAGSfK4pi7hfqmUc37u73Il9WPQAf4vNaVPLALvMpGlH41vorB55CtWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJSzzSr9stua8eJ1nF6zgcLxJ8neCUPzewkV9Fu5If8=;
 b=d2IjGTPGckyCyv+7A/e019edRBsZTCy0tij7o0CYqWEiUbgTTVN57GZYrAxrkVUFCZJgJN7738A+I5FvAHk1UwT/CAhn3yxrCbJXOAKcwChNa1F3CjXB/336s1eHG80Xxu4ARIKReK3Ljq5D6xHG5Q/dt0GkaWQmAoYWk5MKpRlXgL6OvIoaow3uhIS9BVfyJdksfrAkRe1B3dJfRQqJVmwAoCTIoqRu9jVr1V0Y5z6fSuiLujMr3VjnI+I5WnlTvWjgxQZB9mb77lqqNVja5eTaKhYYGXRoUOCFcAuY83a15r10qj8Hoy0HEuFBIx8Rm4MoLUbKJAnKzdgQS4Ovqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJSzzSr9stua8eJ1nF6zgcLxJ8neCUPzewkV9Fu5If8=;
 b=z9RGhYU+kAayWxDbB/hcVPFvZhhG9i41b58uruCrB1cCgZIh1GZPSkgo+3T+31p2MgfEyZ37kE75eejbXuI97LaDNT4/f8JNun3RdyGg+sQnULc+WdnflLOYhI9QO4StqAU1rYjBydPZ+qMbc7NTFrwsIHexjHIBVSFXnDzQTq8=
Received: from MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::35)
 by PH0PR19MB7453.namprd19.prod.outlook.com (2603:10b6:510:28f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:45:04 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:303:114:cafe::3d) by MW4P222CA0030.outlook.office365.com
 (2603:10b6:303:114::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 11:45:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 11:45:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 34D29406559;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1CA7682026C;
	Thu, 10 Sep 2026 11:45:01 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/5] ASoC: Fix missing channel fixup for codec end of ch_map
Date: Thu, 10 Sep 2026 12:44:55 +0100
Message-ID: <20260910114500.1586637-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|PH0PR19MB7453:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80019d21-ebb9-4b95-d7e3-08df0f30f32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|23010399003|82310400026|376014|10067099003|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	nIhvPjREcDRv8zpcJjJfKiwNC6cCNrNxvsFGkGWSlRIRSJepLcJRUytoKn2T7PjlG72juGzYwKoS1x2/CKl4sEIRJUtW/1vhO4gfy9n1jsUmZp46DYN6caeQe/q8SIDMZpvxKcV9cVvm1qZ+yCgKgvcxMV5KoGMi+w+XuHBwR077v1pvbUB4H2cNh1ZXGH2tB0gEK3fMeTGZ0nnEuPXp1ea0WcMWfUrOfGEAodOEXNqWhyX368ej3u+MsoUEsQ02UM9UEfdyazK6P5GKWJ3HzdCA3vy189PZe+EPzhMqJv3XZTjRsPAtrzkAlXVhB1iyj7/o90rzpTYA6stCaTv2MAKfmRfSWUoJPVTZktAwypmq3Y6kRsL//F3h8MxUeNXfloqELB2XXaCbmMewv/PQNbhPsaU/3tUh4hrsGAH2aA222pSGs6Ism4ocLs27Sd7aVxadK4u+8qyNJcIytRgpCbbgryQEr674z8z+eCa+qNc56kt1owyoYT8ZU5JTzh54glvzKTbgsVddVASkzHAqDmZ1R+xKlmIebY7rH1XM2RILey65Ep847ELmv0uAxodmIcsSGexVfKSdyZUNClm36g+kRfRydKcNmZur2UNsnIzTL7Np17yKcczbVGsv8PlM4pknXWbc1Gg9IeaWhh7eU2FTIAYgdmdDOtALAqkwUzDwjlBBe8sU2Ag5VqEuoOix
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(23010399003)(82310400026)(376014)(10067099003)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rFR6syq6Rpmit/OHBw9nljyw4AP1IG/VECF2idHh/p7ctT+Oi12jDV7pZwrYVg3M4iY+pBgF6Jt2qdspbgQRX2SezYavVbB0G5+G8OnquRPsL8VoR90gTyUwhTWjMwwusIWpjZhVo9SBsgJWb2Rl/RuREorIhQNUSHXtzQNTBjZJKDqvSQB2zy007T8SczjyHFl9TQtZZPD4WZ+n2N2Yhi65J4N99qwHGZCDFGl6d+YXppH2OKg1wSo1kwE5WODH+Z2a1i99ATJ4xNLm7lHdn1YJZ0knaP2Upi0ww16M2D4czMfIpNgFy4yNtKNimuc/olPtMIXy4NSAjA/Ka+2nOHK3xFoYqVndQnq4coC6O5FVU5mDUIP0cEOTWOC8IiUrHWWumX/SvcmNMW6Op6HgQURO1Z3Gz5+DTUa3XJA6NOpU2OZTs2XdubIq6Q0d+I/3
X-Exchange-RoutingPolicyChecked:
	t1x1OLZQg4mY+a1t69vL1/tMTyi4wNvM+Jvap3DnLZIb2HmeuDOnPZ+FMwFeTml0Mp6D/2awNU0TfUwoMgtNarD3LQkhOhlbOJizgRfxQz4XjPt6uQWWjtw9PsvIRP29XwlAYqeA7BElqG3iLuiQqt2jdtFoPmfEhkQhwz5MnxLF/vjibm+ipFiNfhqK84TbbJCAZ864BPxlDbwSrr5N90yIBwLJ6mt3gQiEtMZTUpQslBU9lW95kwCKVkIoi4m3nmvuvBjddiNpdBM+cGP3fMOGjgwImR6GS+KQpulgojyPrDV+Dg4FMQOqwov8QRGUDCP7L1f4nKkvmeTtJHBCtA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:45:02.0307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80019d21-ebb9-4b95-d7e3-08df0f30f32b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7453
X-Proofpoint-ORIG-GUID: CBxEEc5-2t2d3MUaQcNcWSwAAvn1PYYW
X-Proofpoint-GUID: CBxEEc5-2t2d3MUaQcNcWSwAAvn1PYYW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX4SpgZ3mJwvLf
 vheji6M5BfwWps4pNQeaPR58WzlwpiKrwxTKm+xK4aOtZBvgVJd+3QpaobL20ypF5hhAq111cBl
 c4aXHjXvz+vrs7gT/9I/V6kujY91YVU=
X-Authority-Analysis: v=2.4 cv=OKiyTiaB c=1 sm=1 tr=0 ts=6aa29846 cx=c_pps
 a=LH/tFbq2k+kQ3xVriB62Mw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=FTTaCd4oxHDOGbCqjlwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX5mQDrR4pO7Yh
 5WhuQTdNrkfyEnnyZHl9yL1ONYwwkJmZ5O6cLy76D3l/emyP8KLWgd/yYVrj3IrxqoUY6X0qE7e
 VxTcRin0pXT6r9grJ5G4ns3BJ7IzJNUCJLomoxkCeE1Tufg8T/1U1+kRQdmZFw/pBUeJq6g/q16
 xAgSevUsr5CP5p02XyG/hIjPaOtrnSe9qb7dAtUsnrDlhxwBzb047LpDSUiSvP/Bhv5tWVSV1Sg
 9J+i2+Xk/t1cyRifMxRzZDWNc6zdplBpaBnUS2gFvjfz1BZgss7HJx20dSOMOtPvy5qXWRylEbb
 a2c3VgzI7Tt5uzdMaHSJA9qQhcmZGc3kQKxNMRxbny+n6H2BXD6GYVL3aGQyz34v6P433EcPAqx
 5dX8N9wNDVC1CWXYIWVnP46OYUunJ22yy0V21l3fYs2RyAAxMB/rYvWlXdkjCxnwB4XuvRbP3cx
 /qlxqtr82Aqw8yCwlkg==
X-Proofpoint-Spam-Reason: safe

Struct snd_soc_dai_link_ch_map had a single mask member to set the
CPU channel masks. But no fixup was done to the codec end of the link.

For example if a 4-channel CPU capture DAI was made from two codecs both
supplying 2 channels, the hw_params() of the codec would be passed a
channel count of 4.

On SoundWire this could cause multiple codecs to send data in the same
bits of a frame because the unused channels were not disabled.

The changes in this series are:
- Separate channel masks for CPU and codec in struct
  snd_soc_dai_link_ch_map .

- Apply the codec channel mask as a channel count fixup if the machine
  drive has not set a TDM mask.

- Set the codec channel mask in the SoundWire machine driver.

- Remove the workaround from the cs_amp machine driver.

Richard Fitzgerald (5):
  ASoC: Rename snd_soc_dai_link_ch_map.ch_mask to cpu_ch_mask
  ASoC: Add codec_ch_mask to snd_soc_dai_link_ch_map
  ASoC: soc-pcm: Apply snd_soc_dai_link_ch_map.codec_ch_mask to codec
    params
  ASoC: sdw_utils: Set snd_soc_dai_link_ch_map.codec_ch_mask for capture
  ASoC: sdw_utils: cs_amp: Delete bogus and incorrect capture channel
    fixup

 include/sound/soc.h                  |  3 +-
 include/sound/soc_sdw_utils.h        |  2 --
 sound/soc/sdw_utils/soc_sdw_cs_amp.c | 46 ----------------------------
 sound/soc/sdw_utils/soc_sdw_utils.c  | 24 +++++++++------
 sound/soc/soc-pcm.c                  | 18 ++++++++---
 5 files changed, 29 insertions(+), 64 deletions(-)

-- 
2.47.3

