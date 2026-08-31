Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8726F3E557B;
	Mon, 31 Aug 2026 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177039; cv=fail; b=afQVs+gn7lDomX+AZLjePd90KDX2xTzW/YeHy5dU+Dmg8gsI3tmO5PgioNlqIXwAixzc0Jb221RJIhPPhbTGokLJZ6O3iUF6YpHzxPYsnE0TrO3l4p+7yRtAL2Y90RZERfTEd1B9UvKoPmL/KjilbRylsvxcnH+UILNoe1VkTyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177039; c=relaxed/simple;
	bh=DSW2mjPEax2Bfx601AgKlyjjxeD8rH06YmQki4aT0DI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pgw8+GAzf6a+OnfGSpicuyiVKoRNk3lCfkaZcjza35XQUI3bJUQG9nf+w2oNajXvXbJtxpEdPcD1c82D2Ao1wAi/7JlivP6gNgPy/CgZCUJnWPBV77WjNXFPDctPIvBGYyNTucgWrWEtk7ZlTwolaFpcsEiLs8gmYY84rXgxSDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oOsJ7Zz9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ut8XCPH9; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oOsJ7Zz9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ut8XCPH9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V41kHD1377116;
	Mon, 31 Aug 2026 06:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=D/UX7M2Ojati5duy
	LpwSFzkcm/4wcB2BY2dwxVX3FGI=; b=oOsJ7Zz9KMfjcSWcAR9ZvsCkm/0KxZFS
	3vDCMy/lTfSjR19d08NG7uNJO0oTS97/lHTKRgiFz9VO3w2eDpM7gJWrR2UYlsmG
	95tV1wcj8Si0cit9NFXhAVEEuOBBziynzPIKFdazhGmWOMl3Ty6TBU2p+s11T/qF
	63YdrDiaySR/EzXCWNqib9vk/miY51sYlesjxPv2UM4moeIAR0ReVfoSWfIcMk2T
	5t9S1OR0O5Xc088c9lX1hei+s6DwMTbA8O52cBaoyW2Bnrt1KazUl3bnuG/VqdJy
	AYteDRy7LEd0yKW0m6gxb8zu/XrfqgGjIhaB4Pb8bmb24zT3rrJ9Ew==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020079.outbound.protection.outlook.com [52.101.85.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtysy2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:50:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtWlzcDvDzD8MODsqYy5cY14yeDsISLPwVGZXRY5m7521tbneQprFdB10lsVL4OtCNhc0g6HUM5FC6u29EPcmCUkL7q/GXiz/sVvznzsYQlGEzSroK5j8CanEw4hWE2eMx0TNatTcexJTK/HuMz6VmipUvITbgpMk8aaI8O5IdITnWFOpu2Bq35XnL/jqnSolXTl0Z+prZ8TJr5NPVJoTmLFpXltBXK9bgV6N7yi6YvFpWB+/dJismI1vtPm+Lfh/wVieJ1qGHIuEns+5+j2QgzoxFLOgtXLCSg8JttgZQFmkNeIUU48CRCXmBYJ+/96fq1XQC+clexipzV7UmRnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/UX7M2Ojati5duyLpwSFzkcm/4wcB2BY2dwxVX3FGI=;
 b=PNmE7fS7JewBwgyiLty/n9ydGL1zfVMCr6cRTDqF7jPveIW5oFago1rwEbSvbbaGYlTBX+3x3G7rokYfGLxoHESD/nADO3fN9vnC7Q1X5h7i0hGvKcjkmGcaeVR/ifwx6R4c9rvYo+Mn5P5S3kq/pQmufBBm2vij8e5alyUCdlyKDRjAKwl8woQ/i8eIBz9ALeigce1AmIw2JbsLlCqbdWTvmxTkNHs2n9azqQiwrVigpmHGme4qZVuvL4IvArmSjht0YbW5DpTNRAt58kSX7yq8slnyrF9jtMwvmc5l1ah/ho3p+fJnO1ZY+J5IahYPE/Y/BySKM9NQVP2R7jPcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/UX7M2Ojati5duyLpwSFzkcm/4wcB2BY2dwxVX3FGI=;
 b=ut8XCPH9qHqmwlsdz8io0g7POXehArKw2FgRNVgzGK+pNYF0sCcyvHeBM2taKLewQrAHAt/ZYdvCMUXWY7SqdJWg1PqmHWg/+shx+z0wX38diLsN1Fi07YaDsm1YhrILCo+h9bmvE2xLjVkdajEeqCOqfQmWpoK8Q1HTqqLrQXc=
Received: from PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::11)
 by MN0PR19MB6382.namprd19.prod.outlook.com (2603:10b6:208:3c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 11:50:25 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:346::4) by PH8P221CA0050.outlook.office365.com
 (2603:10b6:510:346::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 11:50:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 11:50:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A320E406544;
	Mon, 31 Aug 2026 11:50:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8DF9B820247;
	Mon, 31 Aug 2026 11:50:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add SoundWire deatach helper
Date: Mon, 31 Aug 2026 12:50:17 +0100
Message-ID: <20260831115019.1616202-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|MN0PR19MB6382:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef35df4f-62f1-4eb2-7306-08df07560b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|61400799027|82310400026|36860700016|23010399003|376014|16102099003|18002099003|56012099006|13003099007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	LCf1xKBvegMWYwQ0hTOiXg3AX/sGrA0mJSi2T6senw00HwGzajzW32VpzOXfdvP33mAPny9Hg/0wY9z1PiD7MYbn1f3ROKVGhr1nFaVSdiERv46z1W7X8xqH5y+nyYychA1tp9ARbWIVgKGo0/58IVPpByDFsNv9+9CFytocus77hsxlrW/3WNEyc6anHeCNi/qtacLaNYjP3S/zB+wWgjZSLI3Icv8b+TvuS+RvZ292g6jc3SohHnnzvkIshD2FT5J23ywix3zyZQyuM1xBTSU5+AUAnE1OZpXM9suNXKuLrGIbGS8mppjJytQlNJYgeOKQmr2kEZ40MFWcyDM+MLiZ4clWztsso9e7gaFiE52D6SVRH0CDl/2KzThwOeNiLLv8A5dxPII4aa8uQGKpUA9Ach+yBRDxTzwk/QGPLfN5ntxME4KeFRer1FjMoQJ0TLsjUh+f4UBE4c5+WiEeiDprn24E0N5v4+rPQ20ZMXE9WfGIunBSxHmRIIh+Rr6ej+YPU+EnzfY1DlVi0dJXE9DLgcMIPDJxUYyTMoB2j+XNd9mXHpUceIPh129V79j6aeKP6z7If/jSl1thuZWVaZs6TtIB3U85/rC/c20b4hFAZOjF9ZJ0H4R+uiqYOp1M3XaQ8fHlbLwcEx33+tVrSHFUf5sbPoJ8D+ZZzGaIHRycFR5BgdqBfebF4OZI2uPPq8Kkd9KqGkD66Eqg7oSeGw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(61400799027)(82310400026)(36860700016)(23010399003)(376014)(16102099003)(18002099003)(56012099006)(13003099007)(11063799006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R3ZLUn8ONizd3JEAcDkLZcboFnCz7fZakIzgk+oU99Jl0LVBsgTV9vjWJMVwZPViZ8JZO8n05H2KPhcfj2QOP3GiOiGLau1d64ivQHs83DI1bk/ShwQ52x8Yre6ixpWJmt5kV8wrTqHTU9qds4qR667XZvpkW099v6h7lXVbMsU2eWUfySyLwl3vDeZYVqDpWiL9jxxQUdWEpWOQL6ujEfKveW8O82siYsJGMca4BDaxQ+pxuy3MiFz6VOGl/XfxKOlA2OLjXCvwLfGqc/BGmcUpSJhfZrP/U6qHrEzFqZ3rdKldkDwug3wQFgAls/XouEItG0gWhNnA/OYo3dRFYxRovDADngMCeVCKvbnaI9Z95r8TasKOmQMHFdtSn52mqzTJhptJqSKCqziZbmVzNJASA/NTtzrA/Lmbn0egPvmsxg2AWQlJxl+yTXJ4a7O1
X-Exchange-RoutingPolicyChecked:
	f5mFO5bjcx90+jaD954zEotNTCfA9803dRKwBudYgwHdoi4wxB4W2XoCapBYWXtCNYYzwrQSLViEVYJoquU2T4JOYjaG3MN2Y31fk52ovGBSzz3No0jgGSCqSVHCMwt7ixdRE9OBvns5bDWvyrNg2e3rIvvWdj8spVyCtxsxBJ3D3NoArBba9i9t7chgu3VIsUJBBFOmzbDYeNGsWipP2tvBa5SKoG44uxWKiZyxm909ZYzOKt+uBeEy2xnTNIDVrfypJIdi58ZFImrqlsTs6k1AlXyW6HhETiHrkrIU6DMhDSxJJtzZ1QyENt2orPxdsJN0gtJfhV6x+ui+NZYBkA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:50:24.1984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef35df4f-62f1-4eb2-7306-08df07560b19
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6382
X-Proofpoint-GUID: QWsmRMC_JBXZM2VuMWTHAgwQZ6gmFcOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfX3gh/Zq64WaK/
 DnXlv9lIICzHHW+Fw29GbbVnwXOm+MKAMfmXMDmqQEys9l40fNzmx93FC5VvkvUAb25bJ7I08ZB
 KNAwUjZyE9YNs3O5AS2e2NUWGlguW0skmtMvsp9PywVIosC4jr+Xj4WvmsYpV0djU4W1jquhvZ+
 FVjUm7CgYdNz1KSzr8itKolVsZCoRlptWlsNAgmwwEifug2+feIiP164kBZ1wBGz++U0cb+X9nx
 grWntaekM4f+VX73i31zFjpy9ZrngzxKyrcrJcgrQXPnfHXjvzT9HrsxWeXUN9gWN6AQJ4ZofGD
 uNYpxEYPxPipYy1dwSokDWV4GOX6xNCV60fwxEItvqFDmA/TNTkD0isNFLoZzQwsnRL+oTt/92f
 w2R6Uf4AGoIDorl99+6q3TzFb5/carq5zYP6U1ikllpDEXy5OhQxvPKd8EWgPJwcTwWCOa2BwW/
 8m0dj1+uVBZfPVrJT0g==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a956a86 cx=c_pps
 a=pMGFFt+mz1AFwwggCsQ+3g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=cZtL-XUxLnsMaWc3fMoA:9
X-Proofpoint-ORIG-GUID: QWsmRMC_JBXZM2VuMWTHAgwQZ6gmFcOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfX8ZrYu/D2PSvE
 D0wEyHvsYlsK8lQejFTruYEnXpCckNCAslqIhhNeUKMu166jfHzBDQWJ2uj4hPj8dNGdJbqpoSW
 M/iEKDiz8BTqmP5MjKUF1FqWiT0Xjtc=
X-Proofpoint-Spam-Reason: safe

Currently, if a SoundWire driver takes an action that causes the device
to detach from the bus it needs to be careful. There will be a period of
time until the detach is recognised by the core, if the driver immediately
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

Charles Keepax (2):
  soundwire: Add a helper function to indicate a device will detach
  mfd: cs42l43: Move to core detach helper

 drivers/mfd/cs42l43-sdw.c     |  2 --
 drivers/mfd/cs42l43.c         | 15 +--------------
 drivers/soundwire/bus.h       |  6 ------
 include/linux/mfd/cs42l43.h   |  1 -
 include/linux/soundwire/sdw.h | 29 +++++++++++++++++++++++++++++
 5 files changed, 30 insertions(+), 23 deletions(-)

-- 
2.47.3

