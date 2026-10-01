Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE6383C7D;
	Thu,  1 Oct 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867703; cv=fail; b=MIexBvonKakbYQbRzb6QJZRCZ9ojAiJApMTfyrR74PYRtj1HQYWUVYuTv2R5wAyR3V/HKAnwOPW0aviZ2gDrkBD9EQ+yZCYIAbGP8Mv53/29u/juYwTax5/tQo0mQQFMIl9XsEat02YKLIMNVV1OJZq5EX/r6zB9rLlvLmXC+JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867703; c=relaxed/simple;
	bh=gv6GS8dexBP3D52LIUvbyjD9Gz5ppfSmKtREVFZk/oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=up6RICeFpZ8mP/Cr1EOZyHoBusAAOwtRqtBWSadoGGUfeeaW/5GmQQwvizjSNizkGs2ugxOEH9dWGZrOGT9gxYGv+TKRWGcmXsYoDgirG5hCLCofLe7ycJHPcoba1hHJ/8kFS1A4TYhmyQ5N967C5Au8pxTrl3oKhIOEGVuPY8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SwT8IfST; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tME1eU9g; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SwT8IfST";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tME1eU9g"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691D23sg3843519;
	Thu, 1 Oct 2026 10:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JlUDYfdy+xzypPsnCPG2MRLIVUMfOVWQ7V6rsqtNQ4s=; b=
	SwT8IfSTfzKOLfTA97fD71YrVkjS8xtFzy4jVh7vv4u31nxwsv1nz4jfaRN239wp
	ifMVc31Z2h0eR7gG1RIKB7PL9vJQHDd0jpAAaMf3V5jpiBht1MQx6YSMEka2KRR/
	usoM9ov91YJiJOaD+hxW3gsHWsXj57ts3OjKlDPd1yhlTatNxhcepMDk6Gj5bUOz
	sqxJBD3i2LR1gxriQPkWIOV5cpza0mfqbShCYRFdMayORFQy7JqMnBSHWSh6h1iG
	Xlt+sPWDRRo3L/leHbZl0Gdn4dCo+C1b+YpTXMjPIaLFRzB3VHfK8k/5qxPUVG+i
	hLd1KwCSxCIptmh23eKOaQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022119.outbound.protection.outlook.com [52.101.43.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h1gv7gq1v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 10:14:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zo6GTRkr+Dk+hSGptWq3dwKPPXm+HqGBNItf0/z8vnxk6srdtd5QS3D17jc6AmXqKm43G51mzw2qGlJGBdsEpRsHbx+NpeBcVQi7r5Sp9golCotlWQ6WOKJX72tMnhLOw04L5IpguU3XO8UFI8+cthuxJaJB3D+xvr/6ZRX6sY+9g4q60PYIy9L2640jLoVwrUTOVOP9C0Pp//qsOF6vJq3CI2ym4veCqN3h0/P2yx3cvYnEwuCiIl4nimwbe4fYe+CkKaDnNImG3eZ1BwXDd8Lgia/VCk5B5GvWUmiGsx5aqVMy06TrCh6QaCetgBUjEBSA1X4PtwMJbuFHIcns1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlUDYfdy+xzypPsnCPG2MRLIVUMfOVWQ7V6rsqtNQ4s=;
 b=aeuGIEsg5XZuWmbc4BaTSZZp4R74A2mgx5CPlIaUAZYSp/qFHhKHkSZNDjvo5Hg6LJLIT+l7ODliGiFo6mFeZmKPSVe6Tl924tPq8ZmQObcXeW2Hvj/tdTwkgV77BGs5nBRuHvK/bEgW6579ok3w4GfHj/JY0ERGAYWp+NjCbsZWofgBBiiI2COaE7aeqpn1ADEOfncvNQ6KdEj843ec6O4nnVgvY241YYKGdy4DXg1MoLlta/kWFllJFw+WwJ4PgJ1qqDJAeIrEY/KzbR6Dp/iO2bgfwxDrP9P4meonk+UVldzDa+I4G9Za0q3Ux9yEqzihltzJRq0+o0hieVpJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlUDYfdy+xzypPsnCPG2MRLIVUMfOVWQ7V6rsqtNQ4s=;
 b=tME1eU9gsyIYnt+dCn0bX8vSQ4X2DPXvJsNXyrsYg7MX/ymJTtOrxfqhYbuvVdlNGmK6N8IL/0V/Zx+HRaVDnDU7JAEtAaqHkXf4qxnPkrqYhuQgSzUpHxg+ELX4AJRXU8G4SYhX+pO4AaGf8iDXhfhht9TBgk6M0aFHjz8ly0Q=
Received: from CH2PR03CA0018.namprd03.prod.outlook.com (2603:10b6:610:59::28)
 by MW4PR19MB5590.namprd19.prod.outlook.com (2603:10b6:303:188::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 15:14:43 +0000
Received: from BN1PEPF00018074.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::25) by CH2PR03CA0018.outlook.office365.com
 (2603:10b6:610:59::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 15:14:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018074.mail.protection.outlook.com (10.167.245.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 15:14:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B4AA2406544;
	Thu,  1 Oct 2026 15:14:41 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.82.140])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7C6A882254F;
	Thu,  1 Oct 2026 15:14:39 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Date: Thu, 01 Oct 2026 10:14:28 -0500
Subject: [PATCH 2/2] ASoC: cs35l45: Adds support for LDPM feature
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-cs35l45-ldpm-v1-2-545787a5afe5@opensource.cirrus.com>
References: <20261001-cs35l45-ldpm-v1-0-545787a5afe5@opensource.cirrus.com>
In-Reply-To: <20261001-cs35l45-ldpm-v1-0-545787a5afe5@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867674; l=9491;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=gv6GS8dexBP3D52LIUvbyjD9Gz5ppfSmKtREVFZk/oo=;
 b=8HyIFUBLMsSmzlKuS9SFybMVkih9La7JePGXa0GfXmILiicghQgH/bPAS68pcE0bWXTwT/BVm
 r475hl++UXfDRvY1oxKuVgrHXAE+S5dcypk9HMiocbGCbbnbxiENjAD
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018074:EE_|MW4PR19MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fea11ac-8362-4555-242a-08df1fceb870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|7416014|376014|23010399003|82310400026|22082099003|18002099003|16102099003|10067099003|260925021311599003|260925021911599003|56012099006|260925022911599003|11063799006;
X-Microsoft-Antispam-Message-Info:
	hRooVEN1PDkPGnD8By6lx/5tHFSYjsBBMAZJXoTWn7ZyqIfyKTcFZLjSe3piwzJjASb+37SwVvqbdJRfXGSUhjydkWjoY/Zid9v1+6xwtK5k2APQbLd104foNtaT12RtZ8sB0mKAL057/a/oLzeStYQyJ/J/hJ5zntd3ovIt3gQ5ltt+uPpnXhlHCPyEIuJmvBp+yNI/tnevWdcUOfkuidky9RQnilDDC2xlTFJE7lyKRtJ9kCva0x3vh44rwGqb/OvQCdNkXMbxnyYUDVbgB4yAK1J+HXCcmohHz+SVT3lFAxLu6SHkHFIIwufBFI+gKOo/cMLTK7tT76NbBCyMo98pk7XkFOWOIqxaMAuYeWkki7OpLa/xeoSHa/X4NHzEH4Hr2D6lerci3xCQL92lAmgSKYgnm+9fsch6jzUHx02MC1OVRibcE9vUuEBlwQDWgGUWRaqds/h38az7HHbP7ysZ5ggskG7f1+Ty6fzfN1NEsOgMAA0MHsnar14lXRNbXEkonDfv/fqzmBsHkiIJnd2FGSUAZEsYnIfE0rAWOS7j54jfE43MSBMN6R+9qSR6NICZ2Pwfi/p/zwUHuCi/ICN6oOxQOHpkyO7MonJxT/7I+VASqjhQ97k5E4rl5wD4EjfNsJrZp0/AkPFlPQcHXFhpu7y+4JpKUEd7Lez5NB/tELPSIbqrUjB+ZRncllft
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(7416014)(376014)(23010399003)(82310400026)(22082099003)(18002099003)(16102099003)(10067099003)(260925021311599003)(260925021911599003)(56012099006)(260925022911599003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tImMWKgfyM+Q13eFC1dFOa3Fs4py1p5LihJ5Qc4DQwUJXUFddcWep2c6tiH/zIaPa6rRmd4tiAwPK+a1eBCpEnLRP3IsR21jlZjv19iRufuuhmfjK/zn9Ig1QgHPBHXuWEUagX/wf+l88yCkJDlA7JPNSR3VYPzLHGz09qWHHD+ValdC5qTrNpsaK865meL4sUxp6S0X8UZ3MBc6Q9jurjzxvKyslkdgaGAoKL3o5jDWuh+zKvywpAKR9fQw7lkdf8fx9xljiDorLHSpVMSynTJFSpctseyqoBnTpdRh7rCG3Rf9+9eprC4vTdssBeCrSZApXrmWp5gPlnynX6D2kVZD0ZSYKQGhzq/NwT7tgVrI0KXSJGOAnmIfpaqeCuqule9M2BThUPKsTXzyn//kHjKQ4rnNo6GAYH/lbxzbMqNtkt0x3UlgmeamnzW/XvYn
X-Exchange-RoutingPolicyChecked:
	BNPHlytEsgnGlA7E/9kb1iv3v1m9Lc8528I8SWx20KS5tuPsXj3fA0yuo1Wk/TCjMgb0LyUaPpnj1GDPE906OqtjWOy4E1UJAjY8Ne89Nhl61P0xLr2m6965UbAUUeQxG5Hftz5xfDPFx5eqfwWeGDZtIrjPK52Cb6BXR0rvPG2+wXrvDISPGugiZLo0Rg19fqzRX3itrPvl+yJemMtSkClzdCpt03ta0up57eaiFW5EyGLtfe6WLVrf+4FOXhCdYcWGIFWGQxLyxyfJzxHzTHrKyIlz64+KfT7DyuWSIvhELm97669OD+OTAQR51uYgbSzKl5ryVrov2efIwN1S3Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:14:42.5811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fea11ac-8362-4555-242a-08df1fceb870
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5590
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6abe78ed cx=c_pps
 a=ONh++nyoOH37ENyuzPCuVQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Cc_FQji7pSlTQF4bIFkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX3AFj/O9NUInd
 06meThpMz8MobL88MNsSh/PfzwWGCvg579Tl+ztT1/mzgNQv/eztBjrL3shxkk3vuHyTQmpdt5i
 eJODrfWfXM9DmCPMUp3QHZlrPMF99+6nH7QNUexr+Eie9LuKIbYhSCQcPYriR4XoL9z0LeSSHFY
 mhnkiY9niVZbtWmEHqTCwsF8GgJBSQIXG7C89Gr4qb/wSbnn7Tnmn0gWuOb4KnLNzxTmElg3i1R
 wvNFMWca2xxPwh3wb1FjMRZqDcK1r7sj7/QhpRka/0iMhKN5pybFVm8X8wytJLGU+1ddjKpvWFX
 0XDxmyfqJW/nL2ICGufIyOoM+ySSPk6JNZyY4DW99KXCscoqkzJdFL/vC0rtjTGWPOolINtD2wo
 Bgey8bEy91O9YmAULeqyluNCdLSMvk9EaEiqOnhWQc9s7gllTe91tYfZjq4ob9hPe15ufRbtRYN
 sW6rGZkUUgFnEy34LKw==
X-Proofpoint-ORIG-GUID: 7Fcu19xChKJsoe4nDgLtNzmeS9rChYhB
X-Proofpoint-GUID: 7Fcu19xChKJsoe4nDgLtNzmeS9rChYhB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX3eqbsqafQ4Ji
 xYDslkHYWSi0oO+OI3KbWCav8guLIJWQuX+WMxZ4cWdbsF6RIlS//aBLTPOf7GVjPM7XZfDolPa
 zgD4f1pMh4p3/fopx8GRZsCuE5SkYo0=
X-Proofpoint-Spam-Reason: safe

Adds support for level dependent power management
feature.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-tables.c | 58 ++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l45.c        | 80 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l45.h        | 30 +++++++++++++++
 3 files changed, 168 insertions(+)

diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 57982b8ae645..554c8121a74f 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -53,6 +53,7 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
 	{ CS35L45_SYNC_TX_RX_ENABLES,		0x00000200 },
 	{ CS35L45_SYNC_SW_TX_ID,		0x00000000 },
+	{ CS35L45_BOOST_LPMODE_CFG,		0x00000002 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
 	{ CS35L45_ASP_CONTROL1,			0x00000028 },
 	{ CS35L45_ASP_CONTROL2,			0x18180200 },
@@ -76,6 +77,7 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_DSP1RX6_INPUT,		0x00000028 },
 	{ CS35L45_DSP1RX7_INPUT,		0x0000003A },
 	{ CS35L45_DSP1RX8_INPUT,		0x00000028 },
+	{ CS35L45_LDPM_CONFIG,			0x00003636 },
 	{ CS35L45_AMP_PCM_CONTROL,		0x00100000 },
 	{ CS35L45_AMP_GAIN,			0x00002300 },
 	{ CS35L45_IRQ1_CFG,			0x00000000 },
@@ -138,6 +140,7 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_GLOBAL_SAMPLE_RATE:
 	case CS35L45_SYNC_TX_RX_ENABLES:
 	case CS35L45_SYNC_SW_TX_ID:
+	case CS35L45_BOOST_LPMODE_CFG:
 	case CS35L45_ASP_ENABLES1:
 	case CS35L45_ASP_CONTROL1:
 	case CS35L45_ASP_CONTROL2:
@@ -162,6 +165,7 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_DSP1RX7_INPUT:
 	case CS35L45_DSP1RX8_INPUT:
 	case CS35L45_HVLV_CONFIG:
+	case CS35L45_LDPM_CONFIG:
 	case CS35L45_AMP_PCM_CONTROL:
 	case CS35L45_AMP_GAIN:
 	case CS35L45_AMP_PCM_HPF_TST:
@@ -334,3 +338,57 @@ int cs35l45_get_clk_freq_id(unsigned int freq)
 	return -EINVAL;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l45_get_clk_freq_id, "SND_SOC_CS35L45");
+
+static const struct {
+	u8 cfg_id;
+	s32 pcm_thld_db;
+} cs35l45_ldpm_pcm_thld[] = {
+	{ 0x0, -66 },
+	{ 0x1, -72 },
+	{ 0x2, -78 },
+	{ 0x3, -84 },
+	{ 0x4, -90 },
+	{ 0x5, -96 },
+	{ 0x6, -102 },
+	{ 0x7, -2147483648 },
+};
+
+int cs35l45_get_ldpm_pcm_thld(s32 pcm_thld_db)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs35l45_ldpm_pcm_thld); i++) {
+		if (cs35l45_ldpm_pcm_thld[i].pcm_thld_db == pcm_thld_db)
+			return cs35l45_ldpm_pcm_thld[i].cfg_id;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l45_get_ldpm_pcm_thld, "SND_SOC_CS35L45");
+
+static const struct {
+	u8 cfg_id;
+	u32 delay_ms;
+} cs35l45_ldpm_delay[] = {
+	{ 0x0, 5 },
+	{ 0x1, 10 },
+	{ 0x2, 25 },
+	{ 0x3, 50 },
+	{ 0x4, 100 },
+	{ 0x5, 250 },
+	{ 0x6, 500 },
+	{ 0x7, 1000 },
+};
+
+int cs35l45_get_ldpm_delay(u32 delay_ms)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(cs35l45_ldpm_delay); i++) {
+		if (cs35l45_ldpm_delay[i].delay_ms == delay_ms)
+			return cs35l45_ldpm_delay[i].cfg_id;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l45_get_ldpm_delay, "SND_SOC_CS35L45");
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 9eef7c8b1837..064ee612f05e 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1148,6 +1148,82 @@ static void cs35l45_apply_sync_property_config(struct cs35l45_private *cs35l45)
 				   CS35L45_SYNC_SW_TXID_MASK, val);
 }
 
+static int cs35l45_apply_ldpm_config(struct cs35l45_private *cs35l45)
+{
+	char prop_name[CS35L45_LDPM_PROP_NAME_MAX];
+	int i, ret;
+	u32 val;
+
+	for (i = LDPM_GROUP1; i < NUM_LDPM_GROUP; i++) {
+		sprintf(prop_name, "cirrus,ldpm-group%d-pcm-threshold-db", i);
+		if (device_property_read_u32(cs35l45->dev, prop_name, &val) == 0) {
+			ret = cs35l45_get_ldpm_pcm_thld((s32)val);
+			if (ret == -EINVAL)
+				return -EINVAL;
+
+			switch (i) {
+			case LDPM_GROUP1:
+				regmap_update_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG,
+						   CS35L45_LDPM_GP1_PCM_THLD_MASK,
+						   FIELD_PREP(CS35L45_LDPM_GP1_PCM_THLD_MASK,
+						   ret));
+				break;
+			case LDPM_GROUP2:
+				regmap_update_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG,
+						   CS35L45_LDPM_GP2_PCM_THLD_MASK,
+						   FIELD_PREP(CS35L45_LDPM_GP2_PCM_THLD_MASK,
+						   ret));
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
+
+		sprintf(prop_name, "cirrus,ldpm-group%d-delay-ms", i);
+		if (device_property_read_u32(cs35l45->dev, prop_name, &val) == 0) {
+			ret = cs35l45_get_ldpm_delay(val);
+			if (ret == -EINVAL)
+				return -EINVAL;
+
+			switch (i) {
+			case LDPM_GROUP1:
+				regmap_update_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG,
+						   CS35L45_LDPM_GP1_DELAY_MASK,
+						   FIELD_PREP(CS35L45_LDPM_GP1_DELAY_MASK, ret));
+				break;
+			case LDPM_GROUP2:
+				regmap_update_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG,
+						   CS35L45_LDPM_GP2_DELAY_MASK,
+						   FIELD_PREP(CS35L45_LDPM_GP2_DELAY_MASK, ret));
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
+	}
+
+	if (device_property_read_bool(cs35l45->dev, "cirrus,ldpm-group1-boost-select"))
+		regmap_set_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG, CS35L45_LDPM_GP1_BOOST_SEL);
+
+	if (device_property_read_u32(cs35l45->dev, "cirrus,boost-low-power-mode", &val) == 0)
+		regmap_write(cs35l45->regmap, CS35L45_BOOST_LPMODE_CFG, val);
+
+	if (device_property_read_bool(cs35l45->dev, "cirrus,ldpm-group1-amp-select"))
+		regmap_set_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG, CS35L45_LDPM_GP1_AMP_SEL);
+
+	if ((device_property_read_u32(cs35l45->dev, "cirrus,amplifier-low-power-mode", &val) == 0)
+				      && (val == 0))
+		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES, CS35L45_NFR_EN_MASK);
+
+	if (device_property_read_bool(cs35l45->dev, "cirrus,ldpm-group2-vmon-select"))
+		regmap_set_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG, CS35L45_LDPM_GP2_VMON_SEL);
+
+	if (device_property_read_bool(cs35l45->dev, "cirrus,ldpm-group2-imon-select"))
+		regmap_set_bits(cs35l45->regmap, CS35L45_LDPM_CONFIG, CS35L45_LDPM_GP2_IMON_SEL);
+
+	return 0;
+}
+
 static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 {
 	struct device_node *node = cs35l45->dev->of_node;
@@ -1223,6 +1299,10 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 				   val << CS35L45_ASP_DOUT_HIZ_CTRL_SHIFT);
 	}
 
+	ret = cs35l45_apply_ldpm_config(cs35l45);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index f8a4713ae92f..5014c765adcb 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -38,6 +38,7 @@
 #define CS35L45_SYNC_TX_RX_ENABLES		0x00003400
 #define CS35L45_SYNC_SW_TX_ID			0x00003408
 #define CS35L45_BOOST_CCM_CFG			0x00003808
+#define CS35L45_BOOST_LPMODE_CFG		0x00003810
 #define CS35L45_BOOST_DCM_CFG			0x0000380C
 #define CS35L45_BOOST_OV_CFG			0x0000382C
 #define CS35L45_ASP_ENABLES1			0x00004800
@@ -174,6 +175,8 @@
 #define CS35L45_BST_EN_MASK			GENMASK(5, 4)
 #define CS35L45_RCV_EN_SHIFT			2
 #define CS35L45_RCV_EN_MASK			BIT(2)
+#define CS35L45_NFR_EN_SHIFT			1
+#define CS35L45_NFR_EN_MASK			BIT(1)
 #define CS35L45_AMP_EN_SHIFT			0
 #define CS35L45_AMP_EN_MASK			BIT(0)
 
@@ -240,6 +243,9 @@
 #define CS35L45_SYNC_SW_TXID_SHIFT		0
 #define CS35L45_SYNC_SW_TXID_MASK		GENMASK(2, 0)
 
+/* BOOST_LPMODE_CFG */
+#define CS35L45_BST_LPMODE_SEL			GENMASK(1, 0)
+
 /* ASP_ENABLES_1 */
 #define CS35L45_ASP_RX2_EN_SHIFT		17
 #define CS35L45_ASP_RX1_EN_SHIFT		16
@@ -303,6 +309,20 @@
 #define CS35L45_HVLV_MODE_SHIFT		0
 #define CS35L45_HVLV_MODE_MASK			GENMASK(1, 0)
 
+/* LDPM_CONFIG */
+#define CS35L45_LDPM_GP1_BOOST_SEL		BIT(15)
+#define CS35L45_LDPM_GP1_AMP_SEL		BIT(14)
+#define CS35L45_LDPM_GP1_DELAY_SHIFT		11
+#define CS35L45_LDPM_GP1_DELAY_MASK		GENMASK(13, 11)
+#define CS35L45_LDPM_GP1_PCM_THLD_SHIFT	8
+#define CS35L45_LDPM_GP1_PCM_THLD_MASK		GENMASK(10, 8)
+#define CS35L45_LDPM_GP2_IMON_SEL		BIT(7)
+#define CS35L45_LDPM_GP2_VMON_SEL		BIT(6)
+#define CS35L45_LDPM_GP2_DELAY_SHIFT		3
+#define CS35L45_LDPM_GP2_DELAY_MASK		GENMASK(5, 3)
+#define CS35L45_LDPM_GP2_PCM_THLD_SHIFT	0
+#define CS35L45_LDPM_GP2_PCM_THLD_MASK		GENMASK(2, 0)
+
 /* AMP_PCM_CONTROL */
 #define CS35L45_AMP_VOL_PCM_SHIFT		0
 #define CS35L45_AMP_VOL_PCM_WIDTH		11
@@ -448,6 +468,12 @@ enum amp_mode {
 	AMP_MODE_RCV  = 1,
 };
 
+enum ldpm_groups {
+	LDPM_GROUP1 = 1,
+	LDPM_GROUP2 = 2,
+	NUM_LDPM_GROUP,
+};
+
 #define CS35L45_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			 SNDRV_PCM_FMTBIT_S24_3LE| \
 			 SNDRV_PCM_FMTBIT_S24_LE)
@@ -457,6 +483,8 @@ enum amp_mode {
 		       SNDRV_PCM_RATE_88200 | \
 		       SNDRV_PCM_RATE_96000)
 
+#define CS35L45_LDPM_PROP_NAME_MAX	37
+
 /*
  * IRQs
  */
@@ -531,6 +559,8 @@ extern const struct regmap_config cs35l45_i2c_regmap;
 extern const struct regmap_config cs35l45_spi_regmap;
 int cs35l45_apply_patch(struct cs35l45_private *cs35l45);
 int cs35l45_get_clk_freq_id(unsigned int freq);
+int cs35l45_get_ldpm_pcm_thld(int pcm_thld_db);
+int cs35l45_get_ldpm_delay(u32 delay_ms);
 int cs35l45_probe(struct cs35l45_private *cs35l45);
 void cs35l45_remove(struct cs35l45_private *cs35l45);
 

-- 
2.43.0

