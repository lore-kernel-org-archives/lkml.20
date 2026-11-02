Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793637839;
	b=RIORIkoVYT56XwvLPmhMivM45SPN+mO/plUfpUQD8c1iCK2mrRv1RZf0OKiq8NKGrnGV
	 wJvw7h3n99O+aBYpYZDzz7IUIMhOVWKJbkf7ETj8b9uqwJJLIgqiWDrVXu6G3H5xyCBzT
	 EgRzoj87yEiboA2wFUHdb5Rr16xDf1/cmrGEHZSHlD5NECAO7Cv0Z2jwCWGOs8kO9LCGR
	 W0+bOvAZ/HV4pLb0bHUXMwKcclYgLnD/BskR9RoyzwKTqVoKsAjdTyPGlUpkYQ0JVV5pQ
	 pc8fDr/MWJYwoRqnQG1BqsstNWtGkAn/oTBq7HbtbYXWAiKfL+S53bVJWdd2HpHvDug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=NFxEcpkLeHb1oOCRCKLPvaOxQtxM11HJ6HmU20E+oZ8=;
	b=ONcVbF9/IdO4/EfSNBPCZb8/QGdi7sn/112LzyvyM/LvlXbNEJPRHyQeGLACLFjWLJ5E
	 m2hTTBK+NFNGgtY54i07Bzt7F1sTYRKLN8zgYFkIJraJPCFNbUP7pPoGId/LIFpG+GJFv
	 kXMtjZkvAdxkXBv4A6A1iGqptds8/4gof4ErNS8RHnlhWhdyE9CpllmJ4tqRQ1wpLxm4p
	 I57/0apMLqvfWCBwg+Ebw5CSr6ljhyjfJcmKofIK55MQPg9A8MBlmWzDdvRDRgLA8ATQe
	 7cJBy6T9KNVtLLdjla7BaGevn4itdnWGRZyhplId70WlTi2u0OCQAU+wHtdWQs5Aa0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="FC0rqpb/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pL+t8KcS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A158A606BA52;
	Mon,  2 Nov 2026 16:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A158A606BA52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FC0rqpb/;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pL+t8KcS
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Fsa3r3202864;
	Mon, 2 Nov 2026 10:43:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NFxEcpkLeHb1oOCRCKLPvaOxQtxM11HJ6HmU20E+oZ8=; b=
	FC0rqpb/AGU9tpOlfUCSmaV9Knvr2hQMEFA6RZCVSaNS0nkOBeohoQMaMptMenMY
	n00ER1wO2vZFAQwPdC6dTMTyKsA9q+l5BXpWmgky4E1g+OM4v7vub0BFoohQ1L2+
	2c44yPbIkji5Vkve+vwOtG03Y3/OE9Zr7C7ChNe+uCPp8hJU4f+rq2AAkqh9pZ3h
	514gEC8Po0IzQF/Tycg75C+3pUpElsYsSap3NvarunvE71wVjtV5gm2I2vL5465q
	s+8/FdAAuokEovUO3b/BG2+Qx+M3B1Sqp1FqHaUvgDptNsTx2pnf/AMY3G8Etn3x
	MlpsoVJX/YM0PW0YqChbSg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022124.outbound.protection.outlook.com [52.101.53.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfa5d4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 10:43:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuISZOCTIpCmEaisbxTAIpBf9w3v4aelH9n1KxjG9AZfQNHGVjAzRCjwDdZIe2E1cUgDbUZ8/js/0SosceWSbRpCZh7d/nMbO9vcNFVUlR6XBKe9+LZEcGT5hY+H4FHK9UoJMxQ/K1BOV/KzlC6P3pC8KJpo9ifDuWQVvIpl6x9iFfbSlq6nwr5nYmB/ZH7+1wwweiUTFQo/KrJF9zjo5qSRNYkNgdbPYXu9FTSXEnlNO83dQilQjjel7bmPVyQp0ZTL2pzxDiMtpTMEp+ldeUL5XNgAF7kTerdjjIIR4Q3WDoXN3GD/Z26kBeXjw6vBp5PoJMtKhFccdkN0bgB1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFxEcpkLeHb1oOCRCKLPvaOxQtxM11HJ6HmU20E+oZ8=;
 b=IkLpjKDvrY/7r2aWTHgLS3wYAGChb3uATcJ8t1SXHnZNl0Q3dEe3pcAHxcthQ3eJ1cZBDDk7exSE9FMDjOBPyGL7R7PrAfRaXEM9GIsPdFboVj/1h4Ysrpqp7W0hfgOW8jQQNLZsInb9NtWZvLHYnVfF4A/dAVxJojeRCDJz3Pe3iwVNaeEfZ5+NcG6GDfiOyW9H5vC3On1RcqNaeuiZeDLaymdQQBDwzpZ6G3gkaLped+R0Ky9Gj3Rt0z3L90AE4da7v9JkG2qgp8XsjpqxuvPM6GVDY4odtOzFfLkpyZmrne4+Eh1DU5dXdaE2wSyhz8Eh2Yi/kE0XFhkVHGOBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFxEcpkLeHb1oOCRCKLPvaOxQtxM11HJ6HmU20E+oZ8=;
 b=pL+t8KcS4lwMzsPfoLMO0olOgh+NRuQYUJX/DgPpT9uXvwqweEkrLDyUFMmAshaP6viONgGC1+TYGkt6WbUAL7+ztaUZxOBojiACsKGeIUO3kovI1QBHI0Br3b4V1kRjvkOYeQTYiNG2RYcQYzlIX2CGcMR+8tzQOW8H8dWIze8=
Received: from CH0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:610:b3::17)
 by MW6PR19MB6901.namprd19.prod.outlook.com (2603:10b6:303:238::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 16:42:03 +0000
Received: from BN2PEPF0000A88E.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::8) by CH0PR03CA0042.outlook.office365.com
 (2603:10b6:610:b3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Mon, 2
 Nov 2026 16:42:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A88E.mail.protection.outlook.com (10.167.248.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 16:42:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 38C7140654B;
	Mon,  2 Nov 2026 16:42:01 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2488F822540;
	Mon,  2 Nov 2026 16:42:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 RESEND 2/2] mfd: cs42l43: Move to core detach helper
Date: Mon,  2 Nov 2026 16:41:57 +0000
Message-ID: <20261102164157.4010002-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
References: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88E:EE_|MW6PR19MB6901:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 798f68c9-8345-4db1-fd8b-08df390038dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|10067099003|18002099003|16102099003|22082099003|261102123227099003|56012099006|11063799006|261022105027099003|261026121527099003|261009223027099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	HPNP2joSKcuGXIyKaQevq2MYrchjd9IBDFbxAD8+67COQKFaEU+At5ejCzL8vaoktd+g8lGlpdfz2G1RtO4nUmHjbzTlPcgG22sQufwHGsYWzAVrA6THyy+k8VSN1vNBLOuGr+9DWs7zKpZ5PSeDurJFl+8myKVpMLUIKcjXgmsh1Je3GREmr8TJhc2AenVsiWn6OF8Itd53Pn0ypBtWbKoaZS3jc2zrhdS87WzvJutaGNwi2fu4iNCrFbaLd18Q72GtU014X3RZlld7BBCbmRXNGZA9ko/gsKfxASQi4P4Ksft56xFYYFg4hdXEk1r79hHzXJSiArATVeashYhAVvrY/A3O/OUQmfkZuO2FxNagnXFBFP9CMoconsZrjnhBH815ik4i6D9M+JrqG/lEjqtMQsK3qi7RwDfLHXH6bFRia4v2if7hdE4VZ2Gr0Q8sCOUZdDdZsDj9/qztONn26an/SXsWjjYTuI9h61N04Ts/kMws2DSn0yqa9ImYGpg2zXYXU7obk6pd/14WWBwx0rC6iP/RtM5ySIVN9T+JVJ7EQxmqTVc0lEUr8ypp8HEvx0Y3hkKcK+S7LXZS7XhZAUgahdmsdlFMn/GLLAVEgt5PC3x6hs0g7Yb4zJ0DvW4pJQhsLMwqb2St0BQrznqKyhymJsZ04vfI88NcF6AmvM/hcZqOzIpwjtRpY2wuNVLAyk4jRaOIPOZOwRYWaZ5jww==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(10067099003)(18002099003)(16102099003)(22082099003)(261102123227099003)(56012099006)(11063799006)(261022105027099003)(261026121527099003)(261009223027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ByAhSi8a3LdWd8xGfXi54uva28eqim/8E6H7w8ZZxLFgYSnRM7czozkBZF/8KVR9R/uE7Sy2wxlZGy+uvqvtAE+Pb2DzCiuVKYGiMnEnXIy9Q/eUtXgRFvmtAB8HM/zO/8AAmedYwJvydTeSuri7oFXFsSUrWTDlyZUqjjQzqknBhUZMiL/NnmVdEqHPMe5uwivYPsF6mFHlOchAyTfoa2v6MctT+EcejJ6AEMWUgR/8wAJi+vwPiGVKnkw9lR7RF/zlwLBKGvi8BTaBGtT03ABKzb43vM8UD4dP9JTmMaA3+OIaIjulb3OCtSa+O9EVjbXRyVkHzE++JRvZLLMClvYHsnA0NuHNGJ5lPTMVAnpfDYPds9/xdCsN9fyVUP1rTA4HNlajZrI2DHKzjsF2N5MR/BqKs2SSmQ2UxCc1uBSpa30MZkWGHoMxEty1CVmC
X-Exchange-RoutingPolicyChecked:
	gvazRWtyM6gxEZZZTsfhLTLdJa4Ip/lkK7WbAHo5BITXKAO9QuShKjonqIF7Xbjip3wcV0wM493SECZeeAfR0OOUmKPELFQSKmRkxTaBV4sDs+F7+LmDJdO1hJk+jsvXa+kCLCaf3EhK1dQdcTM3PC0GjTejbAfNSM1SQDuRv7t5yy5CqNVL+BKdzNxyn8X4ydFf2SJPVb403PTvtU7PElK+VHiruDHc2Do3/VsKweXXu6w4kVeAL57nmRHXqjMcOra35kbVteme9Gl2jAS+ZVKg45nKJ4MHKp3YYOCpHKqOqhKy6FMOv+LbjsYhnlitZdFpibJ2VMjy4ItflSgAgA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 16:42:02.4551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798f68c9-8345-4db1-fd8b-08df390038dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A88E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR19MB6901
X-Proofpoint-GUID: hQc4amGyTBBYKxHrPiEIHIN2ChHsedmQ
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae8bdc6 cx=c_pps
 a=Z+wCPMcgC1Y9moSb1l8pUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=tnaTcVjs3Zv_HDtWNsIA:9
X-Proofpoint-ORIG-GUID: hQc4amGyTBBYKxHrPiEIHIN2ChHsedmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NiBTYWx0ZWRfX8B0YFWgzfmqs
 H3mF7zbJh3y087WoriX181Ie/yLMJh1C6YujoqElqiSrgogeGZsuoQ8NfIquru7zarzo8XotUAn
 fe/Drs3bX711nTm+ag1w19/Ikg6TH3GcxQXkz7xe4RfaTPTnruxKI+AQEw5WgNhTa2zHJ82UI5p
 mzrH3f8tDQD3a1/snjggDqrgkL/hJEpxEwyf7kK4OC7J4GQnKrinwXo06JOL99dXv8GNRPf8n9l
 /aVXamd0X96hD3fWFGDLupQhi2P9JSbvWtFkDznUJ5Fie/em+mZ00RftVlj+3e7upKJqZSMCKZX
 9JYkLvccy9D2ys9SOSYj2Cy2ZitJyBy3VYy8iBROJaXKU3LMTfSZKWmateuou+TaFMSMQ95vpC/
 b4zeFBKg67oarnnU+ExrAXVxVxdxBangZNuYbbHSM7TkndDDTXSLCW1xnRRv1S9FmPgJPPt0wqj
 IPHNIjlelcDNPS8TVFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NiBTYWx0ZWRfX+SmlHY/Ul/yh
 6iVOImERQdzmceGWlDqx1Ej6sooOj+SgefqUhxckUgP2R6Qr5UrWSgdO8ZcTppL86OGy60G/UBL
 6IDS3E2kwajTXE8ujPWZPv6KZj7vigI=
X-Proofpoint-Spam-Reason: safe

Now the core has a helper to signal a device will detach from
the SoundWire bus, there is no need for the cs42l43 driver code
to separately track that. Switch to using the new core helper.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-sdw.c   |  2 --
 drivers/mfd/cs42l43.c       | 15 +--------------
 include/linux/mfd/cs42l43.h |  1 -
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 22e4c1fe92984..7e4a23aa22556 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -102,8 +102,6 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 		break;
 	case SDW_SLAVE_UNATTACHED:
 		dev_dbg(cs42l43->dev, "Device detach\n");
-
-		complete(&cs42l43->device_detach);
 		break;
 	default:
 		break;
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index a83b62064dae6..341722e4c5276 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -30,7 +30,6 @@
 #define CS42L43_RESET_DELAY_MS			20
 
 #define CS42L43_SDW_ATTACH_TIMEOUT_MS		5000
-#define CS42L43_SDW_DETACH_TIMEOUT_MS		100
 
 #define CS42L43_MCU_BOOT_STAGE1			1
 #define CS42L43_MCU_BOOT_STAGE2			2
@@ -555,7 +554,7 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 		{ CS42L43_SFT_RESET, CS42L43_SFT_RESET_VAL },
 	};
 
-	reinit_completion(&cs42l43->device_detach);
+	sdw_slave_signal_unattach(cs42l43->sdw);
 
 	/*
 	 * Apply cache only because the soft reset will cause the device to
@@ -566,17 +565,6 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 
 	msleep(CS42L43_RESET_DELAY_MS);
 
-	if (cs42l43->sdw) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_DETACH_TIMEOUT_MS);
-		unsigned long time;
-
-		time = wait_for_completion_timeout(&cs42l43->device_detach, timeout);
-		if (!time) {
-			dev_err(cs42l43->dev, "Timed out waiting for device detach\n");
-			return -ETIMEDOUT;
-		}
-	}
-
 	return -EAGAIN;
 }
 
@@ -1125,7 +1113,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	dev_set_drvdata(cs42l43->dev, cs42l43);
 
 	mutex_init(&cs42l43->pll_lock);
-	init_completion(&cs42l43->device_detach);
 	init_completion(&cs42l43->firmware_download);
 	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
 
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 8e993fb535e68..798dc55149662 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -86,7 +86,6 @@ struct cs42l43 {
 	struct regmap_irq_chip_data *irq_data;
 
 	struct work_struct boot_work;
-	struct completion device_detach;
 	struct completion firmware_download;
 	int firmware_error;
 
-- 
2.47.3

