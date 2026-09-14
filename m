Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577914734F9;
	Mon, 14 Sep 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391809; cv=fail; b=syICGjekOiqbl3NoQuMJlbhFmSijGzQcM7xn/u6YiMFhy7yLSRGP+GRVxz5AlPTF838tgMbm/SKkPF8RT4xhK3eux5G8wmgXvAoDuz6xufHPp22wL7x2WCJ8jw6tWXnJgv/lC1KdLowjYxHCukmB4Xbz39zQarIjHpvWRJAQAWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391809; c=relaxed/simple;
	bh=qdH1cNBXWknLZb/l5OWGVVzBG1r9FGWNlmN+L1HAG8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OLuaxL8ei/VpIhezSHAW669m9qaNyTZpJwc7+YshtnHxIRi79kF4+aNxA1DhQv1+bSVykFATyCOw9Dfitn5pKjuMM0YSHENET9g47BWPkEEIf4lSnIVt8xzJwsIyj8rECu9W0zjVf11oq1d1Knz557Nm3GAh5KYu/RqioYJ6wHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=erzVo8Jy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wtoZexkL; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="erzVo8Jy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wtoZexkL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E4UekH250268;
	Mon, 14 Sep 2026 08:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=VL09fbkBfwSxXSb+
	qjFhbaciagN766dtMA8463f4AmM=; b=erzVo8JyMpTxujBi8RNOPHEJHSL1D8qI
	6mJMZdKHGlCgv4QsunUaI/0nsbYljLXSCgvXVzXZyQVUbl13GlRmbhZPmrSTiB3W
	v+vma8OwR0K1cBLmLy/I1Sl+912VQuWJRKWYnCLMGEprRkhsA/P7EBQNt2db1xgA
	iCXgKKl1GfBgFJ7qGZehFS9aoyh4PreprJ6SnfEBoCXnXzRSju/2PLHycC0R5cYo
	Qlkmp4A6m/r1kAmUj0TaDGjCEqFmloKkzAa8xiwKJpvC5DuGScOo3zKpu6sOM+PB
	O8PZADJCufgoDM9J28E1azOY5O42L0TyTqp3eH5s4mJMU43SY9Lg7g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021134.outbound.protection.outlook.com [52.101.52.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35h9w31-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 08:16:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXRiYIWjB1HxZlkXgUjLX727JJ/o5svbSnABWNVz8rG28+SLS94ITrN1wHHia6opDZ5dseaJlc4YTIcQ0hG5mE7I5ws/59TJ2KV6B0Bu0BdBW4KPYo4DHqIJ6NOIlrK24YBMm1h+o8/HhQxxnnfq5KkGPFzosY50QUKoz7U3musHjNS+0VMwie2+sUGeweNiFsO3uQAguNVkcXETAe14vnQ3sfvDeqb/5xUCDcPACVzM59YOdqsH0rdseQrh4eRMXVmlEvvpsgvW67rK1XffAP83wLiejm/HkE5C5XimqrRTp1Qu9aZf2ZQR8nqmSqnIJQjREgy2jnqwTmh+Bq6itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VL09fbkBfwSxXSb+qjFhbaciagN766dtMA8463f4AmM=;
 b=KGjrmg/bnxmaMQ1/E6s8PLsE9cPliVEHO99i5XmsE7RUjbIqqqcxcpw9dYnorvViE7mtwEiHllFKqjIu7BtDiR8uhoUtAlRnqpXbMEOcB+oNl5YsIsIQjbvxKzeyTKvobHpsQUWpaCLkoYe/r+HA+aEcYX0ImZwgXXNbm3t59CvF65cqR8IntHQTeT6cq3ASeJa9F4ySxPGGwrB3VIrqxFuQ56GPpbPPGhfsV1EobjIeiYcxQ0j/3hupIq9WB6Sn0fm60xByNcqQIgCNiv7yLeCJoQU0/LWUlnYznPT3T7k1/JRgoA7D3DBOkD5cXvLlj9pltKaFyEPYAFLZASDK1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VL09fbkBfwSxXSb+qjFhbaciagN766dtMA8463f4AmM=;
 b=wtoZexkLbBFC+2ZZkj/erueqXVu+TcbDaQtFYB1J8Zi3LIjBUEtwEgfB1AUwM0uhHmBErNjPlehuue/XP0shuJXtfufdqhoHAyNO5mIdtV0bvjZqXkGock3EouuK6Mpzfq3AfkX04SOSosTfeyGb6kvwjaPfBL567nMtEVfQYfM=
Received: from SJ0PR13CA0209.namprd13.prod.outlook.com (2603:10b6:a03:2c3::34)
 by PH7PR19MB7148.namprd19.prod.outlook.com (2603:10b6:510:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:16:28 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::88) by SJ0PR13CA0209.outlook.office365.com
 (2603:10b6:a03:2c3::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.8 via Frontend Transport; Mon, 14
 Sep 2026 13:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 13:16:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E93C340655E;
	Mon, 14 Sep 2026 13:16:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C7372820244;
	Mon, 14 Sep 2026 13:16:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SDCA: Remove redundant comment
Date: Mon, 14 Sep 2026 14:16:21 +0100
Message-ID: <20260914131621.1461514-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|PH7PR19MB7148:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cfedca34-0d75-4c77-1b12-08df1262621c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|23010399003|82310400026|11063799006|56012099006|10067099003|16102099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qeAdZH6FzX0U8rXNGK/X4VL6CIDYRiZ8Jj0qTypCLj7cL/Lq7fUmpKirKLbB7cW1EUQdAXy+TQB8JpWT8ZrPpIBjhw/dTS95OgfbruGZpZ29zaFHwTDhQGjLXtlZQxKz+VtgNV/VulCTWTTWljnSmfj0NiNRRMw+ZyTML76mIhZbSZGJbx3BxXT0U+aWJIKq3R9W1aXkv7U/9Rme6Df7Q9o4uTC1xvspu4u6uwqo0ZhnZruMzNnA13mj7xIr3acJt1isXwVZDL+cCEosIgoIMQdwsqsRMwdGvFDHI8pvmtZj/5AjaL076YsyESnkpYKOcLWeBrwczNimEVfawG6vdgZUsFOELpxFTfmwlDl+yheNROuVfoCqKJzDPvrv0hhyCM6z5qFFohEVyZX77y/ZWD1Dc0PIO1zYZzMLE9CvNcMMORwmMigeouIE6IGzqaGF1xB05CoMyEn3aEl+Ir8wST9BF11x9WZyu8zRFYOkoKu0rCHQFikz3VvEyuauEWZV6ekgWvi4XOMAJV0i0EwfTxe9M0O6h4vrbgy57oKldqbPEaWhH8wktUMYTWu7rXc15K3JG3aFhLd6IixB8CCy2sIURIBf7z1ylimS1+ozIrzzAlk6saOc83maEZThcocbx65d7EO4Y/4TreR9fDyaVoLfe/LgSBw/n9gwMC7PNZ7zuWo/jpmYHit4leOCQ747RU/gINgX04r0i1WHhUJ0LQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(16102099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lGOuET29T0zByrzwP15mLJ91wD8GsAXl37o5Ro1EgLNw9RCDwigHPmIepQ0xutQUWN/xF9mAakQRD2O0GB05iwJ0LhBaF/IMvvN9Ds6rxXmFH2YclIMDIdGerGkpa6isaS6Ut8pYRy0d0FfzxmRs3TJO85zNUfhgAemawi83/993PzFB1mRk/frDK1I4ZVSjJagYZQraN8gxZyBzdF19tp9/+eb/dG7q6a1oYGrqy/KzTVnC2mwx7eeiiLa2zPyzvMm8gev5gW68KioumPSbf+gCW6sbN4J6lEwlibev87DdQgy/TsFuv4tqiwYWteOTZ++hDSlTLDrXT+D67fa9DlsABcWeYAyBYQ6LyWNOazOW7TmvR7HsEtPDdilRPzqkWDqqwxh524NU25+f9KvftZfyf9w+EbTwyWT63cGVA9T05vQLCcL4pR07LnrCtviS
X-Exchange-RoutingPolicyChecked:
	uCg8Ei4lupQSUw8+XJmO5Vj8h0eHgy9y4rTrJk4qT+K9mMz1fH630lX3H2YwH9WO6JAjrbatz/QztnI7UPRD5rq+e+tJRgY1ingpl+xXwnD/z+t9UtHDGGcHQTAOu1EZInLIL5W3Z/MNUYhfrIeWA9eUlePiTESovjWUHgZK8DEAsyg/rC4mzzTdupjVteruLypl8W1ozQ3KCoV3Aa4qbypPOLNd56+noMC5sdXLpTSR7lgRa0UK9JlPxFCtOJJOtHqVommet+x9ss0iPS9fZDx1SlQcGvlMr6S4KUO9olESXZbRHE6dxEIamBWfcYqhGEQ3zivJwM5Wf5MUl+nkUQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:16:26.8773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfedca34-0d75-4c77-1b12-08df1262621c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7148
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5MCBTYWx0ZWRfX7u6in4H/dP8f
 uKWaV/DONF5NmGiuy9RbtHbOPA4Vn1uSAmTZ9e6SHnUgXQAKp25MhFPKk8oEvINh+n0TdsJlkSc
 gETMqKhyjHQxzaqlkWw2vNIM+fcoUkE=
X-Proofpoint-GUID: ZVsXwyM8fgOF1LVnpV1UN6eUR4j-6N_j
X-Proofpoint-ORIG-GUID: ZVsXwyM8fgOF1LVnpV1UN6eUR4j-6N_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5MCBTYWx0ZWRfX0daSTqfdvk4i
 IAgvPdXLCSe0RAhIlNN/0F7cL+mt7VxNVJH66gd8AFFhLwp6hhi2pijl7pB/xumO8wjng1Zaizt
 gD5RGqgoQ+oMWmHMuaiJSzHdvPHe+wylLzyZPqI/I8ugOLvlYBCakTogu0SsGSYygh50K5RBnNM
 w1paLXBI2FGXuDHDroKYifBViN7ujXU1kfKiYtHdgpfnpAuKdq+DoUBEtd9CzKHaLLBDkzQ5Bw8
 4TtcJTXRnjgnEKMYv8pw4glUoDLb5Z/1KGrXq8rhJQo5xFEU7WD4Bdr193qBfzI6Z90/wvCmS1v
 vv7MSiEZBMGrns7fy9W9bdfDthVY4rNS/b1ZHUH4kSi0hr9W3zSgSut8JYgGh6WG+gj87X8nbuv
 2fmBAFNQRg8f6IBarJc4sygH0jsZwH7GQJpdsDq+YizOhPB/hTZfF8hQeyAz95FH5drin0WY1GR
 c1r9dcHm9kpEoMjN9Rw==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa7f3bd cx=c_pps
 a=UUmGjFhUr3uPr7k6e03iKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=WGVTN4d7ZwiBa3q0o_cA:9
X-Proofpoint-Spam-Reason: safe

Whilst the comment is correct DisCo does use upper-case for hex numbers
the number being printed here is decimal so the comment is rather
redundant.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_functions.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index b55e3ad8ea343..f39008ac0e7d3 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1983,7 +1983,6 @@ static int find_sdca_cluster_channels(struct device *dev,
 		char channel_property[SDCA_PROPERTY_LENGTH];
 		struct fwnode_handle *channel_node;
 
-		/* DisCo uses upper-case for hex numbers */
 		snprintf(channel_property, sizeof(channel_property),
 			 "mipi-sdca-channel-%d-subproperties", i + 1);
 
-- 
2.47.3

