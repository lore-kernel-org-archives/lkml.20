Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8A4CE689;
	Fri, 25 Sep 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350969; cv=fail; b=h8zJownIkaPgN69FoX9dB8t/jGGuRAc65Gge1rKdynjgUJgR9q8OfxiGr2h0EKYCAN7+k7r0ySIyQU9jDYcN2AUBBVDAuPHLw4GzbuH+7QTlJDqWFGlt695Qt/mxfF5vNQdW0we85tC+5DsEW63fKiUHQ3Gr+qNOCjHp5v4joQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350969; c=relaxed/simple;
	bh=hdUOvbEEoy2T9bi3VnmyL6AO7RsfF/dVLkKzagqpf7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tkUBgeSK4bIjgRg+/M7HH0F4Kr8itLn1tKsDfDiOu0Taq/DLhXzWHMlvK38VBBVBbuIxcy8HXxdhhVwC6/BOs8Uv2NKyVnlUEnqzR9akd0Lasam362ZWjNiQYkxumlxiO1UZQnKk3HhF7MN+b99qnQRzZbr2dGNsd2wCx5GfSTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VH3o2Rai; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MBbiWHVW; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VH3o2Rai";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MBbiWHVW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDVjve2786040;
	Fri, 25 Sep 2026 10:42:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=WU1Af5I4DCu2pAzf
	T68KLAv0yah+SDyk7LUw0naxuU0=; b=VH3o2RaiXTpl0PovEBbaS+k7L9mlXY+w
	EVfFnzKresiuvP+mMmS473cC6PCsoo3BmCfJxmjWE1FsMuS61O6xf0J+p9AK9nW6
	CQD2pnQNc5JNUtYc7IRYOQ8Gnu9EgLU/McskIfjaR/U1NdI1cwPDZtJ0l5+YGAXF
	e/fDRQtvpJagIabWXM24Ld6aMY7Db3CUYTrTJvFF4LjMkWpJCNCjNqZD8TdCrHwp
	mThTjHOgQXSgUrlB6dGAVk3ErceKy/BC8HYSLDv/G5Y7ocHX8oxdQBVxvuNz23o4
	zSDUAjTaBtFmRX6vjeU7Ha6RjlGEKrqGi5oDpVOgr7bj0SYZUrMzvw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022081.outbound.protection.outlook.com [40.93.195.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gw698hh4u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 10:42:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGbFIPfVYU50/D9QJ3TzsdSiMEJQI7ZkyalyZTigpjD5tWVwlTuUst9P+jSYSKkLo6eZC1WA8u0CLzn2Jg2URYCYx7iV+BdMJn3DtgRpamCfFb/A3gKSZGUM/1cpm7bWYynqH8wRP3FFCPn8ib+TIf0THrtXtX7Tj68mByA/q2shgd1idyR3dEHM0K6otLKLWq6r+DVvo1XuIbNzJzfwtZesOBmFk5Hl1QL8YHIzDKu7c2+6b4o/ykL8t2iSoY0Hh2u1Bjmom+eeFse0CDPfxFDbQj+GK4P9suOFZjnZ31g6lZcDRuuTqiakcoZi0jj0rKHwPpbx5OnoaJnPeTyUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU1Af5I4DCu2pAzfT68KLAv0yah+SDyk7LUw0naxuU0=;
 b=U3pHPIzIZPQfV+aIz7rgjVQPFJaI5Z9pBYJNxGfy9L2DEFCqrtxYRCc0VvBXHOYwaHjbyQbx0lajbpedXKPTcs/fnAB6uHCKzSXoT87XB6a4tn6A/y4eVCm0K+3rOmzKlvVZgnpJYLpTY1kXVhjLJm9mkYvMyj6pbVFUW6Dm7Py0q2EWEAXqk4o+eluyXDSrMrfhLl+aozcKMxF4GwIAy1O3VA4o+oSeo5hgj3AUbwi0D9RiCg69Go9g63mhq1OexVLNJDpDd+CcDx010m2QnI5zVQp9QMHykM/o/vooonX/K/gWBhS7xne5rIAv6Z6hg6/OfQT6GI9UU0HQ6mUikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU1Af5I4DCu2pAzfT68KLAv0yah+SDyk7LUw0naxuU0=;
 b=MBbiWHVWkxMIXnIDCRB18uBuTL67wAAcqUgG7+L6ARfI2qMvf3lzYqRf2bCoGAJvhpxe+ThgYRI7jRiCUbMvSL4POKKdh7tLspB+2EgUgVBbZivTi9OCOh1RVVmOJnObG/4QJD5S99n7SgAE5pgeVaMKYtoVGIFhDVeJckTDF6w=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by LV5PR19MB9155.namprd19.prod.outlook.com (2603:10b6:408:2b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:42:25 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:59d::4) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Fri,
 25 Sep 2026 15:42:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 25 Sep 2026 15:42:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A9B03406540;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 88FC7820247;
	Fri, 25 Sep 2026 15:42:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Allow SoundWire devices to communicate during remove
Date: Fri, 25 Sep 2026 16:42:13 +0100
Message-ID: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|LV5PR19MB9155:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 36e3685a-311c-4d03-aa21-08df1b1b9767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|23010399003|82310400026|10067099003|11063799006|56012099006|6133799003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	udjL17kSmLWNA4zKy85WlbEOT8WYx+2bipF40kG755GF4Y5AF3rxKywNj7Q7lNkU3UG0nYmexllFCuc8K/y0D9NZk4h4x2uIthDpuIbK9LD52x7LNj36KLj2SzlzShFzOmZ49Vam9J+7YmUskJMJ8eaAlpkPUfPHuh04bigo8pZpO1JT/KLQ/GqSRNmT92+N3OKfeZurS++rC7ZYoGOC67VQnuhsnFbCASH3IHkTa+xzwQHjvT5Dg4zIBXIfbUDDX/v4efKY336SDyvhKiIbjB9gCi2Pe9GDKFBStytxAbPRUhnmEkeE6O/h4hZWmbXlnHuYu2uTBwmgEZ4YQB6/DyXnO9OpSAI+1MwfC7KQZomB5B/+uXKCCfKys9Kj93qXvziwZE4EMQz5BOOfYwcXqbWG3AjymcmhP/veKCn8OUcSNLK12Za0egKIzqYVUyBCLxUH2rnryw9WF4s7K/dqolmP8d+fLhMnzKD9ZDN84/gjqoYjyJCJmHpXA/XVrMtDn4HvMOSot1DDZtDG+nGEBzvuM2w6mhcsSkGLG6+Jver+A3/ARnFIF+iv1PdaTRgjkItX/gKNjuThIrzbdOfhynPa/uPjOUctja2DqrDxfVaCg/7/VZtIydLrTvT0hwTjFC1l9lMjHW0cmZH9G/QKz+Dx7YSBugSp/+M+kQydEtrM6zaQvIRgM//NPrZoSkoiFytLcb7n9DjTSYT5tPx4Gg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vOd566cRHSDU0rC+AEpW6d4Ji0JpmBYjbY/8SsCDS1yL3ztqO9N5Tbwx4n3LByxuoqGzMfnP/THKejQyEzUTdhJU15TE5bJVKC1UsZsf38anXm4A+Mp2n+4UiCk+zU4B/tX1kASNdH/Bvc0GgmuKi//7uQ6ZVz5V78FXN5x4jiGs2erU4nrjhF/csD7iudnTNiHo3JBnTN1cCWuliyhv4InwCw47j3NiqCtnLFBQNFgOGL6fjJL0UGxdgOvG2AEGs4TlaiQOyq7NU5CIiBok4oy+igyPYSIVh+wXlM8OwPHRrfWqBYJtHSEjI5m9mtp2rd/ihS+gqUIIyyhsAt1IVoloN8gZ9DRmHDew1WrUpIYLnJj2Q3adIatALOfmOqqGYyWdMOGlKVDBay8tgvYY8zDSBDE4UiNGhh21HVV907shBqnxJAzZD0nofe+R31Lq
X-Exchange-RoutingPolicyChecked:
	4h8vi7UX3qtNBlqjYyM0+CYk627pAcZMRJKlJXH9hbRVD6ewa8DSHjGj44NSHXgl/rjMQCjkb/qQ8xgTW5myD+0qYS0B9R6zMrMdEil3XpxSdPkffdHGcZ6bn5srnREKVQNcK2URcHfYHevZSuazyKXNlRJzHOZYsHI4nuk0R+yo23Ao/TlEstUiqXlhRKF9RTVakjjeJRfgJNxqHaW1dTQG9hdytclXMnlD1dlLLJlc+PKUz1SSaMm/6WHQ8khs8A+0cyL+RS/x+GXWTh5P4R/kqBfq2FF4lUdr+cH9IxRZr8WijUT5H0iFYM6x+HxIf3oabYUK88uAhRhPMaZEfw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:42:22.4884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e3685a-311c-4d03-aa21-08df1b1b9767
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX0utm9DHW9p6a
 JE1YE8U4ZPMOrDtL6oMBX2FwAejmgTraoa8wks7INhlqqM3O3JIGTfvWMnNxG+jHLD7R4exJh4J
 rcdPiOxdUCf7eBpHdy18+vs+eV+t2huut6THaZEHAl9iqc9s/+IHTTSm34SMO9Mh0bAX86BlsAW
 yjBPAERthoe2NGpkYVidq/c4FFyz21u3BzOoyUjuX03rmJEEfciImiYNpcjnxIZ9zgnsyIce08D
 pS2MTk1DNEoXRHWxKlKzNYfCfXnD10v8kibAcrm3CQkRTEencqnt/Uzud8mb+cMaIFfHtaLjok9
 oQLwvslFRIh3WwmhTvItlFCcdN2Epr9NOnYAEX2IoD2q8IftdbBSAMAWP1dXtJQbJeKfyBHaZ8C
 wGtx9/TvJ5sQM4/9A1ksl2o37TZmzlO1IW2HtGPIqM3bGmMF+sCaTJFoYkpbwprrvvpTsGKenyf
 RjSFVI7uoQ0vu3ZqnAw==
X-Proofpoint-GUID: hDTxJ-GKvOB_EUNRvQzyLOqTyokFK6C3
X-Authority-Analysis: v=2.4 cv=Zu94uN7G c=1 sm=1 tr=0 ts=6ab69666 cx=c_pps
 a=kzlga8Pj6Xs+ezKxcisf3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=AMs0GybAEfspHTM54-oA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MiBTYWx0ZWRfX5O9HwBXtR43T
 Lg2xlEoFfB4S5ZS0r4HaZez8Mkr4DXrxwJWqDJJNha9UDekTnLfu7fVHfPl4/YBzyhGFayEfV0t
 9QWhGtvQBiW1OuJd3JayfTxWfNBpICw=
X-Proofpoint-ORIG-GUID: hDTxJ-GKvOB_EUNRvQzyLOqTyokFK6C3
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

Thanks,
Charles

Changes since v1:
 - Add a new helper to destroy the children on the bus separately, this
   allows the IRQs to be disabled for final cleanup.
 - Split device_unregister into device_del and put_device.

Changes since v1:
 - Add a new helper to destroy the children on the bus separately, this
   allows the IRQs to be disabled for final cleanup.
 - Split device_unregister into device_del and put_device.

Charles Keepax (3):
  soundwire: bus: Don't unassign dev_num before unregistering device
  soundwire: bus: Expose a helper to remove devices from the bus
  soundwire: intel_auxdevice: Don't disable IRQs before removing
    children

 drivers/soundwire/bus.c             | 45 +++++++++++++++++++++--------
 drivers/soundwire/intel.h           |  1 +
 drivers/soundwire/intel_auxdevice.c |  7 ++++-
 drivers/soundwire/intel_init.c      | 21 ++++++++++++++
 include/linux/soundwire/sdw.h       |  1 +
 include/linux/soundwire/sdw_intel.h |  1 +
 6 files changed, 63 insertions(+), 13 deletions(-)

-- 
2.47.3

