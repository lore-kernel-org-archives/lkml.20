Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.89
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793970029;
	b=Q/wk80ofFa+rS5Fl8J3FoxjvB7urmnaVXoCnelvrqmrbVTwCgKCfSGxrIdEcK0yg4NFt
	 DOyXDpWer9pB1AMPGIVJZ95/Ox7aOsdSKFM1nKhqcOyn98grtdysiH3sWmDTBtS/mD8n3
	 4JEhhNfUNjK3i+T6ZXE0FiPQXLFZk3iGlq8xrmRMlj6SGmnSCsQWRs509ejA51MZYimaD
	 bqez/be4tbqLIX2FJuxGqc2p9RZg2WU1xWUCkPc0eO8DnQef53iCzpRtpMKSNKTwe21j8
	 4tDMLDOfaP8Gxo9L/0FUGFS8Z6gGkSe1PxqGPI0T7/hzVfajy+tl1yLPQkhiUXLUOyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970029;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Authentication-Results-Original:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-CodeTwo-MessageID:
	 References:X-CodeTwoProcessed:X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7soXnmowJD8OxxlpaDjMBkYjQyL+oIdSzSCaRw6WnIA=;
	b=UK0rmHXWcwlWP1k4VX1twjlan2E7ZoOMJdW6lmxSQcs0ABUnEZ8N4EFxHl1BcNEf7OT/
	 sLg0CCC898vF7woWGayyTyyZahYsCzrl9/MagYyjlBZ9CKJMaziLEj89UbQebEH/y5l3v
	 YfSedyAS3/H+w5IZdrRYuQo5JtzxKqZ7IpD8awRjZXQ0H1klittDUNK59yhW6UDY0VhaO
	 BPwyVdRtoSbSwtTC3rXcVqly9x0Es4MIViOvLRjfx5xAMvsst9xYse5xu9WmU/QXUng91
	 OxRi8eG2phDjwqA/B72JEIe5TW84a5Gsg7DRxgSO6T9gdOokG5LPgY1aDM/So7rvbzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=topic.nl;
	spf=pass smtp.mailfrom=topic.nl;
	dkim=pass header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=x2xj9LNv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.89
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022089.outbound.protection.outlook.com [52.101.66.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110F5606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=x2xj9LNv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8ya/rpiUougz/XjfbZkbXKj05/EtPunEggIfjKuK2WK0xpZaqna0accL9ZMmk74v4BrX+14d7GHW3CnuYq2CC8RSsXNO2ysv1G54m0l7m+cnGhhAdGkTxbdpCfYDRlzTnVsdMgjkGkQ1wPs11Slx2TQdktnPU7ao5bubmAMo17+7WBnvJbrHChb8sh+ARe/+IhGgyvFjDpG1Tthsk92AdpeL6ZzKTQxOEn2w6IrmPF3YeJt6tMklaOIaILlI44chrWXrd/vN2IkAq6vkILVLyz7sq3Lo2rVxkvsTHho3mIf9ppKhS+Dzlu/f1AF6U4HWP7MQNeOwEbunytd0tHijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7soXnmowJD8OxxlpaDjMBkYjQyL+oIdSzSCaRw6WnIA=;
 b=uBHciWxQS7yXmtQPQwvl6zrC0FphJe9mmm+3xZIadf+FjzotLYRYxkdRyS3KCn2iwh0Vas6GkbjKGAA3uQn8iWiPLZ/QZJC5S0kFsShPlbnlNR8wlYYYDLscs9jd1cEXNHUyKQoVbQbAnYHnNuMpVdKtS4IU0ed/ABluh3c8FCPyYeaBoFoy5szDaUN/mv/gxjjwEXKf5juyJRV6px1QGa0LrZypyhkNh19pGILee+swtDOcbjjAtLJMG2v9mQCeQml+HeU4WsJ22LV04a7eu1n3P+DgbVxMGqKqd9uMdd8RUL/7CrEsQXTDqENCz8w91AzTObLQ6jhmwUn06e4FiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7soXnmowJD8OxxlpaDjMBkYjQyL+oIdSzSCaRw6WnIA=;
 b=x2xj9LNvHoY7/fIC1nNM0vVJIGowXN9loVVZAxwIeNV2CaLYFVccbyIvj8zQ+aEIn+tmzdlvPbWnv0OOmhiO1Fr84bc+o2Kf9OqVXInHaJuOkJ06otnK5lF41U9WUNt/yQ3w1KQibAqF0mj2aQ3VLb/nPYe5s9Xl2IeBgYqTIpSLb5R4fIHC+nCovi+m8ET8bwOqSxbrXK91rz0HqP/HwB/FYYaR59zQDxoReMiZYPKCUBrhe7ZDIMEz+sP73EYz6F/PZlrMbmc3cxTSr3Nr3h4MJqMyz1B0BnPyTZnGvY9i2Jnr8u1RCtU19Hx+cu9dtz5uREtUK+3JS+mzAKd2sg==
Received: from CPBP307CA0007.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:1::10) by
 AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:00:23 +0000
Received: from CPH1EPF00000530.eurprd05.prod.outlook.com
 (2603:10a6:380:1:cafe::ac) by CPBP307CA0007.outlook.office365.com
 (2603:10a6:380:1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 13:00:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 CPH1EPF00000530.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:00:22 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.71) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 06 Nov 2026 13:00:22 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by GVXPR04MB11595.eurprd04.prod.outlook.com
 (2603:10a6:150:2c4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 13:00:16 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 13:00:16 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-kernel@vger.kernel.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the output voltage for disabled PWMs"
Date: Fri, 6 Nov 2026 13:59:55 +0100
Message-ID: <20261106130010.340950-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0033.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::27) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR04MB12030:EE_|GVXPR04MB11595:EE_|CPH1EPF00000530:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fffd6f-c761-4eb7-91c5-08df3c05eb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|261026121527099003|261022075727099003|261022113327099003|261022105027099003|261021123027099003|261102123227099003|261021121427099003|261026140227099003|261028144727099003|10067099003|261009223027099003|3023799007|6133799003|18002099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 Tvho11qOxQXBpl9nccfGstHEulQe9r3fb5+ewtEQDgsDrS0Fce4j872l7yJvDDRltZJTsMWFEziHtmsutxI/nMXeHbSOPVEvsFy5q1rWkXAOB4HSurEcWhmXzP9TADtxoivLf29t/54/EMvGu7ry7i46IS/M9Q28eYO5Y52XeYJCCBGcKmLxB3c/ArdQ7NERjpWuK9LRQZ+6xZATHFkW9FpNMLIh+1NyMFAUzPlpHFHoP9E8q/a127XDydJJvOj+soKS+qcV+uA+/H2SqxYvslvOkL4jeGM4iNpws0a9ELd709R6hR5VV7gmmzVoL2+zt1ahOm5RkOD9SEBEgllx3iwEWXbRTFQnwBEh07JTBaqOcBO+XlSBN2KcG+tsO073WbgpcGiJxFSNtOIAtjvah3BGDJiO5zrjCkLaMqVcnY8qOkhia7VVzYngBvgpp3GSOqR5Pl0usNgShk3eWEGEMGOGxayM32q4michVu2MljIzcWqC5s5Jr2HYQyi0rAyCbot279lPhrEr04g9BFUXDgHGXRwI1RXhxtv3gmucyEcsh33yANBAS+cAtPgo1VBH/PcHRYIh79MKNX7HvCBq0qhTjezL1XOgIxSb+Sk/atdmUjyBJ5W7E+3h7vtZzSc6DPX5/z1TZG60pPBlcyu6KF9ZUCFytmvlhumGYMK+EMV2WZ+tDn57ZwvFlDcL0W/bN3vepm7cABqJVkU4KEzh4awtIM3/4DYsQtBKneEvk4g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(261026121527099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261028144727099003)(10067099003)(261009223027099003)(3023799007)(6133799003)(18002099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: sh/47Ns+uGjy13eBGb3G9PkSiXUP17QZMoMyhbAuXhjiJPhKCiqA9NxRrvoxB8DZVN3G6qeQZssCZ6kbmgT9TrzMXe3Si3ZqvDOw3Y5czWn69D7OAw46F0V/xomaQ8tH5mq2g/YxVmKuWHoZBbvUlSkd1KYfmnB1cz8O6ckcEo8yMb5t7YVoO5v7HcoLEdPqtShOZIZfsWrLDATOvdRqblBiaoZX2EucMWuHUv6TF0nZUe3P9ydnOWiCUZlK5voGJN1zyzHpSOQzKBpsYo6U5wA+SecJrQbuOTZ86GWfat5ku7BaZZctP4zWe8bLEU6UQhiWbEkSBgA5jZ4hzJGBgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11595
X-CodeTwo-MessageID: 9944a959-f574-42a6-a7a6-a2c4626dfa43.20261106130022@westeu11-emailsignatures-cloud.codetwo.com
References:
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0e1e637-f913-43cd-4b43-08df3c05e758
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|14060799003|35042699022|376014|36860700016|82310400026|1800799024|56012099006|261022113327099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OVsXH9tfMqSScELRiOObI0JOrzOfFA/MWq571Yb6Fhr47nuwltTHSFfX7z2YLKD2ukEjsLunIgom8F4O49x+ElQGPdYUra0oJjdCVc7rikQirDQrxS4RZbscQ2ptvw6HTKqXqjDMiCf6KIZ/qhKPAicx5e4Co/sNFbFSwOIgl4s0yxvtZoGPslK74K8jPF+BydllbbyFqaPK2pgfOFfWvvvUOAsXgNeSN4Slr4YVK6Q2Wb0/uJd+JIXk96mX1+gGUPou8VuL033A3ULseNmBVpv/bfGb9DhkZN8nD0q7zsNiIvsBVy9Y9WlvpzaIXElUbrIUM3o3KkPzwjRcaf/aInjPcppKtqUXnAOmLsJUChOcAfBOyJD7RoLfRn4dr4Ap8Gyz6icuc5h/08QAlkKx5NC7Z5xeoVOXuo9BclStiF2P6OkGPiS7ClAK9lW5DS0Gf9Cv4Nys0eZT1n2/Be2NB9QxjUFkpRGxiS1aOkULkubAX8moaZXvrxDcsLJO2ZC+A3grr8pgCx04msluaGC2Pw2UCC4CuZAOnsHPa0hMiVQg9qz6I74Y0P6S0T/LRChJ3l7ORsTvDm9eSvk9ly4zYRlHDPWgW7FCXybd+FlATrZP3WCr4YsvqBu8aZauVJ7JjWzKWGbXnO+eTOlND9X4MA==
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(35042699022)(376014)(36860700016)(82310400026)(1800799024)(56012099006)(261022113327099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KHt7bUhBEzO4iQbqY7IZ3t7fPYENPvp/mCCyCbPgmtXjWBYTfLt/+eJMkF5Y2CPP8zQIMm9V+INMqeWnwF1p+ptPYsBZkrF8d8UBEQnGTM0yrWyjhtHS0qBkPvFnZ0EmYSeTkexshWnDt87alw2q503bQ4LgWjZTYvWp3SQRU68OjEmgzx1GUz+VMkY0lU23WoiEEhEDqKzPMqkE0wP+c/mceMJHHnmEA7PtiNXgI7wqhDsFYgSI3OyL1tXMAPZByGn/rFtg2c/h2aE5y8mKLby63gvpaOWFDRh+3w9iB8bYWK8sZW+1wjgyKW7cYAeDeaZPWbbGPP3TGXCMng3gAvtMEdZ9Disg7gwJL3XLz8Z9ViIwaqUjaYVBZGVIidjcLg7lRtcSiGzy+FX0WSIEuk/m9avrND4jTonhlD+M76lir7lT5+ZdbCx6wyPaq9kj
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:00:22.7810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fffd6f-c761-4eb7-91c5-08df3c05eb33
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285

This reverts commit 6a7d11efd691 ("regulator: pwm-regulator: Calculate the
output voltage for disabled PWMs")

A disabled PWM is not the same as "set to 0%". If the PWM is disabled,
this could also mean that its output pin is tristated for example.

If the PWM range is limited to something else than 0..100% this causes the
probe function to fail with messages like:
 dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
 pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to register =
regulator pwm-regulator
 pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed with=
 error -131

The reason is that regulator_register() calls get_voltage(). The PWM is
disabled at this point, and then the validity check triggers.

Anything that calls get_voltage() while the PWM is disabled would get an
-ENOTRECOVERABLE return value for a pwm-regulator that doesn't allow 0%.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 drivers/regulator/pwm-regulator.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regu=
lator.c
index 7434b6b22d325..f50530c77d92f 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -157,13 +157,6 @@ static int pwm_regulator_get_voltage(struct regulator_=
dev *rdev)
=20
 	pwm_get_state(drvdata->pwm, &pstate);
=20
-	if (!pstate.enabled) {
-		if (pstate.polarity =3D=3D PWM_POLARITY_INVERSED)
-			pstate.duty_cycle =3D pstate.period;
-		else
-			pstate.duty_cycle =3D 0;
-	}
-
 	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
 	if (voltage < min(max_uV_duty, min_uV_duty) ||
 	    voltage > max(max_uV_duty, min_uV_duty))
---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
branch: linux-master-pwm-regulator

--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
