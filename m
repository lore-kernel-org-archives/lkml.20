Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8CD370ADA;
	Fri, 28 Aug 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932082; cv=fail; b=j/SC1Mf6TyFc16GWsl4UL0z/XNSARXCeKC36wY6YBG6BrA2KDXdBL3bMlN+qDOMHsltG98svWC/ejgUKhUgJYVUWTnHcygGtborLxU8Erk+5MhcZrW96OLqOEyZf7wBt+PZBnMN2Y0AR6lUkoLyEM9HjthSpdup2BcQPgX/VzdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932082; c=relaxed/simple;
	bh=E9D5JGlwbIf2OHcZyyyNNQq44yOy1F6NGX4NJ2J79OU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWZiuVlsxUY2oTYZQbX1B+BiRVf/TvQ9BOcIwI4RNRGObjnF/w3dO7Mg538fcGhnoL4/JtDQri3QYDHQbex8Ej0NrEasDeyY0M6HiZr79NGG/8EXavnFHOF+gEnZ5GNsbvokqTmMiJpBnaQyiRmIsd1DHBg4Di0vlr4rjIL/+Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W9UzFwOL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=WWQ6EFUW; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W9UzFwOL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="WWQ6EFUW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SE5OaC3771110;
	Fri, 28 Aug 2026 10:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cYFx4EPBR41efiUd1zbQYC/Dz6k8XhxKAyRur21X1/c=; b=
	W9UzFwOLdNqBjcHZ/uA48XDiDKetCo8/FltJZbPyTfSFlbM+SVMVjQ1gXA2aGSVE
	2COzB84lbKeuzsBLuBhJ55xQ366yl2A0EpiMP58+LjJTv5OMYSUcVLM3KT6pwz00
	01PBrLED25eg4O3MbqlZpJXOR73LuaNJnh+pJm7OlaWK5aqChttSa/OkxVohBzZY
	dvYB6RIv8rArNvvgSpmf6tF0CRXKyj9ZHjHCh81tdpJsuFTVH/egbvMoquU4Zcb3
	4UT6Ghdx1JvyeWXL4l32OK9qNim47kglNy1NoFQa1eCYxK/RpRrUIzfd3i7777eN
	3gVidhqvOM/Hi8D8MtoLJQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022080.outbound.protection.outlook.com [52.101.53.80])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbbsqr49k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 10:47:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5hVesAYhiBTjTSrPLivSVVZ0NTlutGT4f2MGpwR7uvsyrPfsF4YD6+5ILr5Bt426WVwUY58hdyG3E5HQW+gPpLsH9OFSGjK3iuTZApkAtClYIQrGQx8fHFwDg6dqeRjDULkA5hM1t4UjfQtPUtlphhz7bPvaMxCtCWbkAzbvECG97ptJDvLUj+watghW4+dz3eXBcknNRxLXxDZsUPgUMZG15S09tLB6YrNbd+h3+L5eR/7OQ8a3CHU8VrfEqyC1naPnf1YKaVLMXieofe6gk2lNYajLwS64MshpFhJsY4RdNIq1cZNSjrGz5slr4ZEoIgS6yn7XrKh53n/XXoXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYFx4EPBR41efiUd1zbQYC/Dz6k8XhxKAyRur21X1/c=;
 b=hIgg/8k3UUqzjDw/ghkgw2DZyk5VPCVo8U9bmVXFUZIfHENXoJE3ui3ZAtVz2EOSSq6j9oW4eqq/Fy7voZSLPerTyFKFBllBuT50ZhcXOFZK9Ku8oDPH8Cg8SZx3rYM0OwWoeGdbzRU8ZUuyH4LbXgp5pldMxc0XVpoGWVw7YxU7DGRnhPGtxyR8DqxiJmm1cHdTTXfgU5eTs/Qxd2cRkseRySfVfaJxvkbRZh7fJpWp70M8v7qGxvTZ+vPq/a/+wk5vv4pzWCExSF10zOhzCMMPKnWkBK4LbYcYEyOERpVVwz5rqR1+Qpo15n/T4QplLhIAnzvecR4v98VCnWO05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYFx4EPBR41efiUd1zbQYC/Dz6k8XhxKAyRur21X1/c=;
 b=WWQ6EFUWbS+437miDdpIJXKbGvHg8KdCW+8RUIKLqILyfsFoDYWi3aO32mPG/qOGmw42ngZjtOBjLZAWrxBhmIzVwWcK1oBx4u95jfTWTmfQg44HVB7+yeuWHnutdV0wCorWf8K6ZhyT0YrxavcUcsbBk+Rgg+DyU4kADS9sI/o=
Received: from PH8P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::10)
 by SA0PR19MB4442.namprd19.prod.outlook.com (2603:10b6:806:c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 15:47:26 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:345:cafe::40) by PH8P220CA0019.outlook.office365.com
 (2603:10b6:510:345::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 15:47:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C061A406541;
	Fri, 28 Aug 2026 15:47:23 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.156.117])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C8D8082024B;
	Fri, 28 Aug 2026 15:47:21 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Date: Fri, 28 Aug 2026 10:46:27 -0500
Subject: [PATCH v5 2/2] ASoC: cs35l45: Adds support for SYNC bus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-sound-for-next-cs35l45-sync-v4-v5-2-fe3feba709ff@opensource.cirrus.com>
References: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
In-Reply-To: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787932037; l=8786;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=E9D5JGlwbIf2OHcZyyyNNQq44yOy1F6NGX4NJ2J79OU=;
 b=1GjRJnfIJ4qqqbMuyD3i1oZ6XljCzbgV5fk6Hw7PqXK+Q4rPKR4kfTrP4dD55M6PLEXpUlGyV
 xw0pBsssmSgByREf8baGAJG8DGN80EqwL/GNkMB4jUA6RWL5cRMaMql
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SA0PR19MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: d448bf53-9f0d-45f9-d2cd-08df051ba807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|82310400026|376014|7416014|36860700016|11063799006|10067099003|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	nwssYQvYBL5GH12Q6O28NoAjyQb7n47Y3xyCZBwAAl5DuomS0IOP6MEtkZaAINBZ6dVDEY9K5CXLYxTpuEOIBOJ6CZM+Kqf+LIu2fbUH36v8rzChbe/+hbmXl6v8L+o3c1HIFSV2sfxiQRVpY/RYt26GLTH+TS5Nig+KP4Z/ebBmxjmzIWoB/GJcGp3h1OV//rmyyJ987Uxa/Io2qKoLBY2wDkQNrfub9+7gbThw9xaRtfe4h3p60gEdgri7cjWlvPCbEId/I38q25BSgMY3eTCrM3KuLBvCPK6ZE4Jcuf9ZIBKfly3fD2MQv5S3mONAvSCj54FD+3rJ6qg4DFj35wsbo5fzV3eD1RgX/VqcWFP6ue21bapfdqpqO+XMIFhfndp+XIwwY6EQ0xbi3KPxLsKLjkrCH1QJstSmWYn4vMwWZqHs6t2sfl99ebnQO9PCm+fJYRokK55lT62fYTUeD385v6uKg3nBCRAEC2OtDz24i3M2HdadIdYdYpmqSlxJ5CaxZaqCJ7T9Sh0VuUVZC2IOAe4/s6WCDuS0jI21alOUjeaR7ATqDFMgpTSGvkeU2Za03XXshxmoSqiHT4N7nQw5uLejcZ8p5qg5QgDVdQRhsFMDYs8qdn3mtkYrN2Ytah4hppc8wJzIIrkfKrAM+7LHyXMO9aa+xOjUgg4Hn++INOipK0L2r5Ji9S1kASgkSDXNj0oXvUMFxo0RRVH6lg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(82310400026)(376014)(7416014)(36860700016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gWA2A5fcq2258ph/uwEwi7FT9QD9iEZJoLMaA8DNbj1pqwtHd2m3UArg3Ux8/4+igg3OGkK+Uw2uxBCzLpHXduXtuEB1R17MHhrSsLjKZQlUxilvxI1vezS9qoCRPZ4Idxtw8uCEXnHqdRdaMjDho6xwRZpIdWRAOxRkshJSia+kkIemXoPYPhWo69YiWJnnj18slu4t45tgl/FGPRahuJnY8lBYTyNMnFO8Tjdd2gO02BWv7S7I0Ny/BwBLHZi1dhOfyV35eKUEcCZ2lL5Y0Rebne08iXVNQsgfqy0XJ9chsJxdyXCjmM7KEYaBg3LMLJ2BygoMgEIo3ECuaUbAMNd+2vFcjk0B4Mg5PdWLQjScgx2Wz7118bAfm2K8bHl0+fpQyW+iiuzkFUD+vtruzKMLc5p+Wdc/jmUrDKZyFM+ffC1NsmBa9IMKNjGDjdoC
X-Exchange-RoutingPolicyChecked:
	vyAxL0PyELiXJWBDB+zYohwgGWTUkgz3Tlm5S4VCFOthV7rWQ9KsJkx7XYqOx08PDzr5zSWpatrNrUx+dout6ccJRo9tNiyoJkIZKGNJS1/VD9jKZ2As8S1nmVoN9FQ2+vPtLrDkqUWjsK3NwxUgrbtU5WPeaeB95YSJm8WzdtXFRUNh6EU9zU5z9CQfI83o5MC3eXdJHoMy9BC4Op/p+xBKhgn1bEF6hgiinZKVuVDB6r3ZkIZktfbszahIcjpn8IZ0XgGyHw3E0cDTGHeV3pEbgrJrasSI7NjqpUGavE7YiEC6XQkYEF8BlWIKLpmSY0sBa1GCo5fHlvZRT3CN6Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:47:24.8368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d448bf53-9f0d-45f9-d2cd-08df051ba807
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4442
X-Authority-Analysis: v=2.4 cv=T7K8ifKQ c=1 sm=1 tr=0 ts=6a91ad94 cx=c_pps
 a=kZfhTMRA2IuZrtsc375NMQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=I_x9miFozz5syUPFWzIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: PbzLwl4vWz6Y9XJ9Ty3a86axfwTtp0Tm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzNyBTYWx0ZWRfXwTF8LhTnC3X2
 9m2UimeyCfhA1MX4QKmMrgpGAapxcIh1tKTZQt2Lm59dL9+EQmvM2miwxLdYbd4ufJ7fg9zeSWD
 AQKn7+LBZB21vIJf5M0pumsuFyVQrVY=
X-Proofpoint-GUID: PbzLwl4vWz6Y9XJ9Ty3a86axfwTtp0Tm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzNyBTYWx0ZWRfXwf1ysV91WtUZ
 U+R+FuX3mX2+RzwONCHWzXc4kL20+dObtCPOIEeJwqM/cin/aqNADbFODXJMjTbHuu1EmO6O9R7
 RP15+tQQsNYuujKa0ffUEjvZ4W+YRJR8Tc/+ckK5dhdi6mccj/POtEmrkGRMb2r6l5dkF+lZGXi
 P2zBUArQRojaILGZarEhwC3PY0J5jk4jSyfhD+uARFV9SQ7XkpgwPApGJbcbE1f1g1KRPAZcW5p
 R3yB/6DanaYXyWA4YWgiQnDRX9j8gDAo8vOaC2gTXYgWD4jRfH72btgcvsD7nAb3+KYQOUtildV
 kcPQIOBy3/CiutLyiD5WbGvrP6GnHvF1EdebvSjwEIltcyOOgNzkKcsrMVmVC0/jkN2C/NC1j7u
 i+Q+OzuQSzo73/f4GQtLvZvQjTyuIIutnTA09XyrzxhgGUG1NRVDa8aIfg2NJFgbl9bi0usoyPA
 /LOVLFSanz6T9TwbmwQ==
X-Proofpoint-Spam-Reason: safe

Adds support for the multidevice synchronization (SYNC) bus.
The SYNC bus is an opaque one wire bus that is shared between
Cirrus devices. Initial support only includes software (SW)
data packets.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-tables.c |  4 ++
 sound/soc/codecs/cs35l45.c        | 89 +++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs35l45.h        | 23 ++++++++++
 3 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 764dbaa35042..57982b8ae645 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -51,6 +51,8 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_WKI2C_CTL,			0x00000030 },
 	{ CS35L45_REFCLK_INPUT,			0x00000510 },
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
+	{ CS35L45_SYNC_TX_RX_ENABLES,		0x00000200 },
+	{ CS35L45_SYNC_SW_TX_ID,		0x00000000 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
 	{ CS35L45_ASP_CONTROL1,			0x00000028 },
 	{ CS35L45_ASP_CONTROL2,			0x18180200 },
@@ -134,6 +136,8 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_PWRMGT_STS:
 	case CS35L45_REFCLK_INPUT:
 	case CS35L45_GLOBAL_SAMPLE_RATE:
+	case CS35L45_SYNC_TX_RX_ENABLES:
+	case CS35L45_SYNC_SW_TX_ID:
 	case CS35L45_ASP_ENABLES1:
 	case CS35L45_ASP_CONTROL1:
 	case CS35L45_ASP_CONTROL2:
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index a032bb23b4ac..763cd83b5d6d 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -6,6 +6,7 @@
 //
 // Author: James Schulman <james.schulman@cirrus.com>
 
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
@@ -195,6 +196,46 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	return 0;
 }
 
+static int cs35l45_sync_en_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = cs35l45->sync_en;
+
+	return 0;
+}
+
+static int cs35l45_sync_en_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct cs35l45_private *cs35l45 =
+			snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm =
+			snd_soc_component_to_dapm(component);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	if ((bool)ucontrol->value.integer.value[0] == cs35l45->sync_en) {
+		snd_soc_dapm_mutex_unlock(dapm);
+		return 0;
+	}
+
+	if ((bool)ucontrol->value.integer.value[0])
+		regmap_set_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+	else
+		regmap_clear_bits(cs35l45->regmap, CS35L45_BLOCK_ENABLES2, CS35L45_SYNC_EN_MASK);
+
+	cs35l45->sync_en = (bool)ucontrol->value.integer.value[0];
+
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 1;
+}
+
 static int cs35l45_amplifier_mode_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
@@ -591,6 +632,18 @@ static SOC_ENUM_SINGLE_DECL(amplifier_mode_enum, SND_SOC_NOPM, 0,
 static DECLARE_TLV_DB_SCALE(amp_gain_tlv, 1000, 300, 0);
 static const DECLARE_TLV_DB_SCALE(cs35l45_dig_pcm_vol_tlv, -10225, 25, true);
 
+static const struct snd_kcontrol_new cs35l45_sync_controls[] = {
+	SOC_SINGLE_BOOL_EXT("SYNC Switch", 0, cs35l45_sync_en_get, cs35l45_sync_en_put),
+	SOC_SINGLE("SYNC LSW RX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC LSW TX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_LSW_TX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW RX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_RX_EN_SHIFT, 1, 0),
+	SOC_SINGLE("SYNC SW TX Switch", CS35L45_SYNC_TX_RX_ENABLES,
+			CS35L45_SYNC_SW_TX_EN_SHIFT, 1, 0),
+};
+
 static const struct snd_kcontrol_new cs35l45_controls[] = {
 	SOC_ENUM_EXT("Amplifier Mode", amplifier_mode_enum,
 		     cs35l45_amplifier_mode_get, cs35l45_amplifier_mode_put),
@@ -880,6 +933,19 @@ static struct snd_soc_dai_driver cs35l45_dai[] = {
 static int cs35l45_component_probe(struct snd_soc_component *component)
 {
 	struct cs35l45_private *cs35l45 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = snd_soc_add_component_controls(component, cs35l45_controls,
+					     ARRAY_SIZE(cs35l45_controls));
+	if (ret < 0)
+		return ret;
+
+	if (cs35l45->sync_pin_set) {
+		ret = snd_soc_add_component_controls(component, cs35l45_sync_controls,
+						     ARRAY_SIZE(cs35l45_sync_controls));
+		if (ret < 0)
+			return ret;
+	}
 
 	return wm_adsp2_component_probe(&cs35l45->dsp, component);
 }
@@ -901,9 +967,6 @@ static const struct snd_soc_component_driver cs35l45_component = {
 	.dapm_routes = cs35l45_dapm_routes,
 	.num_dapm_routes = ARRAY_SIZE(cs35l45_dapm_routes),
 
-	.controls = cs35l45_controls,
-	.num_controls = ARRAY_SIZE(cs35l45_controls),
-
 	.name = "cs35l45",
 
 	.endianness = 1,
@@ -1064,6 +1127,19 @@ static int cs35l45_sys_resume(struct device *dev)
 	return 0;
 }
 
+static void cs35l45_apply_sync_property_config(struct cs35l45_private *cs35l45)
+{
+	unsigned int val;
+
+	if (device_property_read_u32(cs35l45->dev, "cirrus,sync-lsw-txid", &val) == 0)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_LSW_TXID_MASK, val << CS35L45_SYNC_LSW_TXID_SHIFT);
+
+	if (device_property_read_u32(cs35l45->dev, "cirrus,sync-sw-txid", &val) == 0)
+		regmap_update_bits(cs35l45->regmap, CS35L45_SYNC_SW_TX_ID,
+				   CS35L45_SYNC_SW_TXID_MASK, val);
+}
+
 static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 {
 	struct device_node *node = cs35l45->dev->of_node;
@@ -1110,10 +1186,15 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 					   val << CS35L45_GPIO_POL_SHIFT);
 
 		ret = of_property_read_u32(child, "gpio-ctrl", &val);
-		if (!ret)
+		if (!ret) {
+			if ((i == 0) && (val == CS35L45_GP1_CTRL_MDSYNC)) {
+				cs35l45->sync_pin_set = true;
+				cs35l45_apply_sync_property_config(cs35l45);
+			}
 			regmap_update_bits(cs35l45->regmap, pad_regs[i],
 					   CS35L45_GPIO_CTRL_MASK,
 					   val << CS35L45_GPIO_CTRL_SHIFT);
+		}
 
 		ret = of_property_read_u32(child, "gpio-invert", &val);
 		if (!ret) {
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 7a790d2acac7..f8a4713ae92f 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -35,6 +35,8 @@
 #define CS35L45_PWRMGT_STS			0x0000290C
 #define CS35L45_REFCLK_INPUT			0x00002C04
 #define CS35L45_GLOBAL_SAMPLE_RATE		0x00002C0C
+#define CS35L45_SYNC_TX_RX_ENABLES		0x00003400
+#define CS35L45_SYNC_SW_TX_ID			0x00003408
 #define CS35L45_BOOST_CCM_CFG			0x00003808
 #define CS35L45_BOOST_DCM_CFG			0x0000380C
 #define CS35L45_BOOST_OV_CFG			0x0000382C
@@ -183,6 +185,8 @@
 #define CS35L45_ASP_EN_SHIFT			27
 #define CS35L45_AMP_DRE_EN_SHIFT		20
 #define CS35L45_AMP_DRE_EN_MASK		BIT(20)
+#define CS35L45_SYNC_EN_SHIFT			8
+#define CS35L45_SYNC_EN_MASK			BIT(8)
 #define CS35L45_MEM_RDY_SHIFT			1
 #define CS35L45_MEM_RDY_MASK			BIT(1)
 
@@ -220,6 +224,22 @@
 #define CS35L45_44P100_KHZ			0x0B
 #define CS35L45_88P200_KHZ			0x0C
 
+/* SYNC_TX_RX_ENABLES */
+#define CS35L45_SYNC_LSW_RX_EN_SHIFT		19
+#define CS35L45_SYNC_LSW_RX_EN_MASK		BIT(19)
+#define CS35L45_SYNC_LSW_TX_EN_SHIFT		18
+#define CS35L45_SYNC_LSW_TX_EN_MASK		BIT(18)
+#define CS35L45_SYNC_SW_RX_EN_SHIFT		17
+#define CS35L45_SYNC_SW_RX_EN_MASK		BIT(17)
+#define CS35L45_SYNC_SW_TX_EN_SHIFT		16
+#define CS35L45_SYNC_SW_TX_EN_MASK		BIT(16)
+
+/* SYNC_SW_TX_ID */
+#define CS35L45_SYNC_LSW_TXID_SHIFT		8
+#define CS35L45_SYNC_LSW_TXID_MASK		GENMASK(10, 8)
+#define CS35L45_SYNC_SW_TXID_SHIFT		0
+#define CS35L45_SYNC_SW_TXID_MASK		GENMASK(2, 0)
+
 /* ASP_ENABLES_1 */
 #define CS35L45_ASP_RX2_EN_SHIFT		17
 #define CS35L45_ASP_RX1_EN_SHIFT		16
@@ -320,6 +340,7 @@
 #define CS35L45_GPIO_CTRL_MASK			GENMASK(22, 20)
 #define CS35L45_GPIO_INVERT_SHIFT		19
 #define CS35L45_GPIO_INVERT_MASK		BIT(19)
+#define CS35L45_GP1_CTRL_MDSYNC		0x2
 
 /* CS35L45_IRQ1_EINT_1 */
 #define CS35L45_BST_UVP_ERR_SHIFT		7
@@ -493,6 +514,8 @@ struct cs35l45_private {
 	struct regulator *vdd_a;
 	bool initialized;
 	bool sysclk_set;
+	bool sync_en;
+	bool sync_pin_set;
 	u8 slot_width;
 	u8 slot_count;
 	int amplifier_mode;

-- 
2.43.0

