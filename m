Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794885685;
	b=P/lSAzZZGnt1wyAYIgSxotJaCNieppt+9VQZBkoyJR3R5vgxdUE+jDq6g4IT2v4nPGrw
	 Z5ZwFf8NBqsF/jkofYBjCrprk46TBMqeXgs7mTuBbZ+cvy4VZlPJO4TxF3D7k4RwNCkcH
	 pP27QfrMbzL9lddLVSbE+rxJwx84pFUvlCoD0bBKSelIDO8sPWRoMZm3me4TNab/DZMmM
	 6J8jgB/61aggEyEFxOQeYrrc90zRozBq5n/9+rnT7Ymv6QvFHpruompxh/yrKlDiYq2IE
	 as8kBbjWD+FUBgySc3d5PJmMZRqrtVb6I1vFon+AjmEDs021RyEfgAwEwOV2Yf4RW8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885685;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-OriginalArrivalTime:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-SET-LOWER-SCL-SCANNER:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
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
	bh=KGlwVSllxJ587DoCwNq857CZl9eVgkU8rusCE6w/8Cg=;
	b=HUmI8B342GisUFaMXM3l4LwEvm/fGtMzcJr+2uJZAfaG1pPf2Iw532DUAftot/fsGyWx
	 j/JYReiHIEkBcqjhDHaO8Ue9y9Hp9vzW0OZgrz7zujlYJIfDLqMctXasl+u91YZrbMROi
	 cHqU8FZix5OUhjLRRsdrgDhanmT0utN9CN34WIfNPjE6l+TVPJvzfQ4S0YO8L9RWuv3sO
	 7MVJaXvetaRhtuBySmT7X8gnLircLU7i2hNWb4qNUSbywJwY5iX7yVRKS6lHyTTB9JKAe
	 gE3iZdYZ6Paiv7EY25C6UcWjk3NF5EnEa+CiZUmq1P2l+BgRoNEN0BYz41+cE3XTGNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=lR1l4KVW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.4
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ECC606A894;
	Tue, 17 Nov 2026 03:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0ECC606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=lR1l4KVW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k52clg99zmaTTGBHUfcF9gZZQg7cGPBKC7QztYg74ASpXHMDbXGTk5SasLIbpM9B2KianwweRK97qFPnmE9P7iFu39lfEnrHmeMJ90hEBSG8dqutncoH/ewy0dHBmotBnXU1XGAJbFGjyDOM/IjjhMNkqBHePAF+xaw6tfkabUjbEoIu6avWROPNdN4syefCLu5GwLZjbaIAc31XkoQvN5q62aFqNm7CAInhhYMW/HSNkIrREl9IvhTRoY9+0LnLR7StZ2q9M4E5gJM5+yic9r9Y2lM1W8KrHfJug0oj5/YCLcVsWAhjSYnqZJllgoIzG39UrHrb/jHJYPSB11l4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGlwVSllxJ587DoCwNq857CZl9eVgkU8rusCE6w/8Cg=;
 b=nwAMh7+Y6s2jVDPK6zXm0PuTB9ZrRwE2CMgbGjwrbu0oS3+wBh7ZCxB4OuSm2L+8srMELs6JKXhws/KFyZ0gr7cbdeyMqzNlokK5/9Rg56bB2gjvDorGfomCXEnyLQhQqW/vWFTRVDcp45qkJNeo2t9gipfddKrQ2Yz6QpvtJ7Sxjvqys/NGZNVoapAv2m8CIfU001F78w6Dyu1TbPqpL060otWJShZWIpuAu4ZSyywHNo7gkHw5qa/AXxJf7PMDpd6OfpqtKPnrqhEF0lMUTCVby39M06B/VoL62Sq7pIZpspMNAv2yqIfwN68xTiWJZY+F23dRntVmuqaAMzAQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGlwVSllxJ587DoCwNq857CZl9eVgkU8rusCE6w/8Cg=;
 b=lR1l4KVW2oyutB6igZTHSuLvbowr+LRvcyWTSAFXaWoKoufj+a+79wSg66FWGo3z0C/yEQan2JbYMeqDAuALpkJxivLXOPVONprfm1bb+Qz/ZKmgwSaM3ABhrZlnxQz9UPCCJoLFQOqFFXLEFA3P9sX1ewAscnu244kVpOzoKOw=
Received: from VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:29d::13)
 by DU4PR06MB999718.eurprd06.prod.outlook.com (2603:10a6:10:637::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 03:21:20 +0000
Received: from MI3PEPF00008490.eurprd03.prod.outlook.com
 (2603:10a6:800:29d:cafe::21) by VIYP296CA0012.outlook.office365.com
 (2603:10a6:800:29d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 03:21:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 MI3PEPF00008490.mail.protection.outlook.com (10.167.240.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 03:21:19 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 17 Nov 2026 04:21:19 +0100
From: jiegu <jie.gu@leica-geosystems.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gujie <jie.gu@leica-geosystems.com.cn>
Subject: [PATCH] rfkill: gpio: initialize GPIOs according to default-blocked
Date: Tue, 17 Nov 2026 03:20:59 +0000
Message-ID: <20261117032059.3946777-1-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
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
X-OriginalArrivalTime: 17 Nov 2026 03:21:19.0494 (UTC) FILETIME=[B6A18260:01DD7642]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008490:EE_|DU4PR06MB999718:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 969e3403-7ae3-4f57-f471-08df4459d966
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|18002099003|16102099003|6133799003|261009223027099003|3023799007|56012099006|5023799004|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261021123027099003|261022105027099003|10067099003|43062017;
X-Microsoft-Antispam-Message-Info:
	XmUhhFEvATZ2mRbU6fvAHcWiMBPIIJ03b06HN3tKJGEhwlcRl87KH9YD+af0qFTPSxcXG4eYJSELAMbcs7W77YFsL3hznNAzpqFWgm1kGUzqK637F9KojFiIMGqxvNj1cQpf+qVWI1J2S7YnS7nOzsrLovldAh6tJ7TI/EULWZVtv9iWy9n07YCHagpwiirifBp2+y3Q4UmKjo/IFlun0JduNub2XkuuNvpxKnpDIkVPSP6xOz62Jhy8dVYe5t5NNkdu+8h4CLna5CeYwI8z6OmVjCIgksfDhv8Z6Sth1NxysIz3IPIfbtTmTEijdtzjOodfFCxnoT9e4H3inPqhdEEbn5wHTYAgmKuIyMsqO7GzkjP37XE4iAFELUG5VZ9uLug+BWS6HSW7wPX9f8lnLvJf70z67FLdyyDkEwzOVcog0ddrC/bMY/z1ebENfbCdmjTfKMiXoctI1bYuu/pa09IjXY57VjwgofOAHjmkA+xfxSeqbCrK/P1huxH13Rf11b47oLiOhxaUIYd7GK8zYUUdOTb1iNpWJGmSzjsweMo3PnASZsOkW0oWa/Fwq4nppBQGuXFfPR0i0CwqdfLykkAlBvWXE6vv93QwuG40OdVwBRU7CKABb61WIA4NJBDzgZxSk0+btMdk7XMaba2WwCUGRIYYHh/v64puDh9hgZkmT3/mNyNVaftqn+MY10rTldRYu30kcx5KbsKU70FeWrvfgB+QjF/kQ/SzekPl9y88ZrP9yWW8Qv11SJuivjB3
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(18002099003)(16102099003)(6133799003)(261009223027099003)(3023799007)(56012099006)(5023799004)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QvEIpQL7Z2mvNxpiJJcJWmo5oFKoZyG43GCXPdeTVXjrMOjmCBpfB+CSHbtUIcqK1Xue7pWa+RNl/zMocSauFgz2fL/d+WY1FkxKhhlwUNHtdOMcij40xivm9M/EllSm6NUqipwoCO+RYazrJcxAIb3gDUeyZpBHq5/baOh5XnKb1aCD8D8HOG7cqZ3aGDOwI1tW/eJ3hSVbPEq4NJT492jSYfBqhvno6bsG5F/PK8rLAmmvwim4nEFlzEzX5csRwsBsIPeVFBuM7cffXxMCQ8WttNs69mDKSE2im9JGH84XBoxL2L8fa8PxG+hZwTTYxeACrLbcOfFmYijf0KM2mKy6dy9SQlPMD+ZbeRuSZKC0ozgIXkU0ghBhjxunXES4O7bHm2oizrU4nyp9zIZe3JWmDDs3wXC/0/Hni4UKLNzkR+7Fe/BzzmCBIToKQT85
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 03:21:19.9269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 969e3403-7ae3-4f57-f471-08df4459d966
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008490.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB999718

From: gujie <jie.gu@leica-geosystems.com.cn>

When default-blocked is present, rfkill_gpio_probe() initializes the
software state to blocked but configures the GPIOs to the unblocked
level.

rfkill_init_sw_state() does not invoke the set_block callback and marks
the state as persistent, so registration does not normally synchronize
the GPIOs. The radio can therefore remain enabled while rfkill reports
it as blocked, until userspace toggles the state.

Initialize both GPIOs using !blocked, matching the existing set_block
callback and the initial software state. Preserve the existing behavior
when default-blocked is absent.

Signed-off-by: gujie <jie.gu@leica-geosystems.com.cn>
---
 net/rfkill/rfkill-gpio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/rfkill/rfkill-gpio.c b/net/rfkill/rfkill-gpio.c
index cf2dcec6ce5a..e1248a6f7711 100644
--- a/net/rfkill/rfkill-gpio.c
+++ b/net/rfkill/rfkill-gpio.c
@@ -98,6 +98,7 @@ static int rfkill_gpio_probe(struct platform_device *pdev)
 	const char *name_property;
 	const char *type_property;
 	struct gpio_desc *gpio;
+	bool blocked;
 	int ret;
 
 	if (dmi_check_system(rfkill_gpio_deny_table))
@@ -148,11 +149,13 @@ static int rfkill_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = gpiod_direction_output(rfkill->reset_gpio, true);
+	blocked = device_property_present(&pdev->dev, "default-blocked");
+
+	ret = gpiod_direction_output(rfkill->reset_gpio, !blocked);
 	if (ret)
 		return ret;
 
-	ret = gpiod_direction_output(rfkill->shutdown_gpio, true);
+	ret = gpiod_direction_output(rfkill->shutdown_gpio, !blocked);
 	if (ret)
 		return ret;
 
@@ -162,7 +165,7 @@ static int rfkill_gpio_probe(struct platform_device *pdev)
 	if (!rfkill->rfkill_dev)
 		return -ENOMEM;
 
-	if (device_property_present(&pdev->dev, "default-blocked"))
+	if (blocked)
 		rfkill_init_sw_state(rfkill->rfkill_dev, true);
 
 	ret = rfkill_register(rfkill->rfkill_dev);
-- 
2.34.1

