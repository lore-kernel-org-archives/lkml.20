Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821160;
	b=g4h69jIikxwgKC2PLy+BF7JFkfKY3i8AeYDGAWCo3mphKz0iGCccInuELTS47CY6sqV4
	 mg9Urt4NbFN7un4pwqd4jscU41RkpwAjVqsoboIuKRHjy7HUjP8+4JdXbTAbDS07UpWKk
	 XNqVsrQv8NGxHQgPgaVvEzDXX76KBN8gH4BITN758L8WYduCOxwQaukY+h+VLATijLh1t
	 NDNN2fJpTXjnvyVh1l/hr/PN64T3Uk9Q9Yx1W5farIi8HYhOXYeaOOP9Lwlf5DbjuF3gm
	 OAbPOrTT9aM0m5IL4ERLIFBOa6M6tgN+hEUlwBXTXBJj2mlt3iw486fKURet+u7P0tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821160;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rpyh3odHBxk1H8Gi+n5lSmv7r3DcRO7Tm6XZfeQ2l8I=;
	b=dtbgLqGGJNOIPxQ5GH4XxYADi7IlKVrU7REjbSZ1dMVnXxAoLeogcp7lWBprGHLKp0+8
	 y9AVW7K9aLqLcLeXHyziaaZffdfKE6pw8XMMsOrC2CGXlioRlK9Q1tu3pUmbu2mwNGtYK
	 B9kev4jl8T3S9ZY2kXq9jLSjkEMFwT2gzU9x0f5nCdFqGfInb4Ci6S6aC+TaqEL2VNcuc
	 OTOyVL/ypr5T7cOKugXqTy5Ac5W9Iuq3hrXv5uIZqWx9clp7+lRo2tQ73hZzRcV9qjgAD
	 NAY74jFdIiGtf+qo9izfsarqT5IBYV0Vz9aepi8+lFKulBrQlGW0CYfOrGOEpLTICvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=axis.com;
	spf=pass smtp.mailfrom=axis.com;
	dkim=pass header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=NG5zBW2C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.69
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3D606A31C;
	Mon, 16 Nov 2026 09:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=NG5zBW2C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjF8i4AA1vpB5ZAGkeibJkgqVClo5303DUu8YrgNbvZEtP2JrK17BfnFqRdXnsZoQ7311xCzGpFijkITlG2cTYQIJ4gOr6DWUOC5BpCa0Yzb2EXXVLq2z0niJq2bO0M5hhaqVT8IGYib2g3oOcYaQLaWdZNfJypRx3FY3BdpopQw/J0sampRsMJ1i/IC6t1HLGghM9mPAXIR7SbrfKpp0nZucxGC76NhC7DLidiWQtHHZ4FVc9AtyOCCFreGH1rftHW99pnMr3b9TLg3Vz9Pj5DqLcfa57MJ7GdKmjZc713Up+6CSbME2UE8AiTj6ex95sbOFOaRL6jC15GkxeT87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpyh3odHBxk1H8Gi+n5lSmv7r3DcRO7Tm6XZfeQ2l8I=;
 b=C/KnIyI/TULAXVLLASh0BqhMz2CQQ/LjP56zBXXLhzxxUbBCY8qomxuyyrl9homX23MT/3CQV8aSQNXyXU9zKfDQemkJ04Rxa1p5ETpLtOru/3Ws8rAi+wHZ8pkTefDPUoE/b0KwH2QzzZRsL+urC72yv1SREbVEpS51ww9RsLGI6bnTBUXlUUVaKU2ADQZvpUuYCcxZI3k/eVHKqNHlj2nBBLc/SkHP5NdCppMRUe9yskml4lWJb1tfWqRfbgd3j+cJq887y53teWYJKFu/gXErJVeXBtisKXFmV1S7+u5u/02MpdJYMwu8bVTgG2tk9AOB5rdMWaQHXRsi6t3CGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=analog.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpyh3odHBxk1H8Gi+n5lSmv7r3DcRO7Tm6XZfeQ2l8I=;
 b=NG5zBW2C8khVGw1F9M2i0W0h9ziwR0S0bOYIg3QKqGW6U49KGq1f6kUtPBiIYNiJh1xdSoXydfCeAULVTrrTFLN/CKaLrZ1oSn1fMvO6hbMrOCrdgVv6ig0n0KoBVwhkHzA/egxwDBDBdEwEfca8zuzkwlLQb5VVgPX5PE6UVv8=
Received: from ZR0P278CA0154.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::9) by
 GV1PR02MB10929.eurprd02.prod.outlook.com (2603:10a6:150:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:25:57 +0000
Received: from ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
 (2603:10a6:910:41:cafe::c) by ZR0P278CA0154.outlook.office365.com
 (2603:10a6:910:41::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 09:25:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 ZR1PEPF0000E6BC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 09:25:55 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 16 Nov
 2026 10:25:54 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 16 Nov 2026 10:25:54 +0100
Received: from pc51840-2244.se.axis.com (pc51840-2244.se.axis.com [10.92.173.9])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 9EA8324FA;
	Mon, 16 Nov 2026 10:25:54 +0100 (CET)
Received: by pc51840-2244.se.axis.com (Postfix, from userid 17330)
	id 994A121F5C8C; Mon, 16 Nov 2026 10:25:54 +0100 (CET)
From: Michael Sikora <michael.sikora@axis.com>
Date: Mon, 16 Nov 2026 10:24:27 +0100
Subject: [PATCH] ASoC: adau7118: Advertise support for S32_LE format
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-adau7118-32b-with-coverletter-v1-1-c66b3c70d228@axis.com>
X-B4-Tracking: v=1; b=H4sIANPL+moC/yXMyw6CMBBG4Vchs3YS2xoUX8W46OVHxhgw04Imh
 He36tl9m7NShgoynZuVFItkmcYKs2soDn68gSVVk93b1tTYJz8fjTmxs4FfUgaO0wJ9oBQoty5
 2fWcPwbtE9fFU9PL+/S/Xv/Mc7ojlO6Vt+wCW5S/3gQAAAA==
X-Change-ID: 20261111-adau7118-32b-with-coverletter-63c9f924ba3d
To: Lars-Peter Clausen <lars@metafoo.de>, =?utf-8?q?Nuno_S=C3=A1?=
	<nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, Michael Sikora <michael.sikora@axis.com>
X-Mailer: b4 0.17-dev-ce4c1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BC:EE_|GV1PR02MB10929:EE_
X-MS-Office365-Filtering-Correlation-Id: feb52513-a361-446b-536c-08df43c39e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009221227099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IkQAq0682n2/1cYJTPwqG4+f5hlz31sO6zrq2WpvT2uy3D3jed+RUpwrd0vBxx8rg17dGKlYz/YpO+VisCTZuuygnuCfCj1yVNsv/g7Q+RFa6VU+w3zepLj020hkRUO3oYbdElYgnQK6WSD9+Y4P8uqkX6OYfQWQWyfvWaHNo+q7K2KVdvhSJY05l7YMOKB4/wIuCCc8y02Oc6NX9qfp74JStMUXlWyOWrkvJAfYBQcYWTgZRH7TuZBl+bP92BAQ5VwGGczQenJtGfPm0+0awhTinz1iajSNv+m0a3aaZkqK0J1PTBDgEufwEzXYBQEZ7bCsv39+WMyheYGmEyUUsPA2eE0vjxGg2Fc3jlMa/maXb/4J1haWMimNrDsJ8AUKhvXse4AdUkgr45k5T3w5TuymZo5M+IeRQUsRTz/hYXJZWxI6dxP1MofzvfxidAZwiyeqtFU2VrRwhceJ9splf3nzGQ2/hjI/3Ow+shLbZ1IZfqrN1zRLDm/Z+Qm4PQgFvRYJpAhokzQIykjDHWdLkY0r16K+0BJfdwVNORwJSMoMyT4LCNBlAR7O885Jo4mtYavdNE5gcjCqFk79Zq698WpEzHM23ieWqElXwTmjqrzryBvTW41d8jKCkXhFA5j8ZOLF+wa7aWQartrT++ABSit8bJ4SH4FfWbpYfHYWUxUHyIMQ+KCT5lXUWCqYk02dzBk0p2pW15T2tHtuCo8aZQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QXbKhT2LB2oCFThjkWLoa/wNU808wY/wl9HrCFrCuP+RnSFnYaYfWwB4eoeLcOOJDy13sS1UcJdAhw5d8nrE8DKb7tB74znbZ6c+IG53uoOJr+DGxzKdcFaER1GdYTA2sYoCTEtF2pXksTCo7WTzHkVXi/d9JImff6o1tiMno5B/ZJMF3EyvFFIQfPkLVl+oY+DKNyu+vN4S6L1Mqprn4Fu25I3jTljcxJjK5Lt2Nl3ZjfZMljcdTFOISWQliL6CITaG+TFN/QmVQnYv99E25KZYAWnOx0iO6jiDacLUXCdmR1qN0ZLdOE/3UF8pr9SxcKfGxAB8AgpV7FsJIT6ADkD8WiXb5rJ88CrOFkUvNWuC+EnbVgJASpwxlHvpILcmNcibecGCPiyzIKaHFD+v8FrBumJP+oHM53Z8JTqR02FLwdmad9Ig444xztfTIieh
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:25:55.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: feb52513-a361-446b-536c-08df43c39e01
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10929

The ADAU7118 supports 32-bit TDM slots, with audio data left-justified
within the slot. Advertise S32_LE as a supported format in the driver.

Signed-off-by: Michael Sikora <michael.sikora@axis.com>
---
 sound/soc/codecs/adau7118.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
index 51064b6217d8..befd6f632af9 100644
--- a/sound/soc/codecs/adau7118.c
+++ b/sound/soc/codecs/adau7118.c
@@ -446,7 +446,7 @@ static struct snd_soc_dai_driver adau7118_dai = {
 		.channels_max = 8,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |
 			SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
-			SNDRV_PCM_FMTBIT_S24_3LE,
+			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE,
 		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min = 4000,
 		.rate_max = 192000,

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261111-adau7118-32b-with-coverletter-63c9f924ba3d

Best regards,
--  
Michael Sikora <michael.sikora@axis.com>

