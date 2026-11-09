Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794205356;
	b=aTBV++7VPQygMXuGoOA6tnkzL4a08fvFoKF4uXnSHshDBzJFtvfu/f5t+E6Z/15+aQdC
	 HlIuAD1/qkGJApdzKKGnYaUKiYG6cruG2FX+uZTJnPztfkRHU1Rd13VRczFqdTMEZxTS5
	 z6wCQKQ8gnGHTobUwaew+ZXTjCLCwTzcaRDZFxPUxuRVcSulwDRvG14fykRLin2TyClw2
	 2ygfjiVKMsouBtMgC05hORqP6WHruqSN0ZqFHaPQC7eb7cuWIScF0W+WsPtu25SaHYUzt
	 qMv3hZ5snO7AYTj/kaPwd3Mmd+Q3zgebEdsyhINWAO6ZQwIwrVYlo0DcbIbo6AKCKvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205356;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Authentication-Results-Original:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:CC:References:Content-Language:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-CodeTwo-MessageID:
	 X-CodeTwoProcessed:X-EOPAttributedMessage:
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
	bh=24lnj/hDOHXZInbnc2MB6LKyfbx1zMu8Fkz6rKA28U0=;
	b=W/z+LgGkyRGT4j+XvXWC/sdvwC9rgCZ5kXI+9QCcfso6cWQIAYqWGzAARaS1NYuvcC3V
	 cvv4JCej3EvC3++cQIRD9UXsncCN/ZjY+GT32L/tgnMhscxMh+E4NwgBq0vSukjq1iGIY
	 WFLvsz2Y3pLS7KkGVjRdSetIKLQQDK8VI7duR6fO11gkEhGYh0WEMSfu9LTGZpgimGjn+
	 vCNEHOkEJsc0iIVRsOLke5FlJhQhERoqUGpZXQlUPHtXXCCnN22Oc12Xn+ebxiMihcARC
	 8MUPZ1lK0TJdVCn8vvCABURg9NskfcOwXhccLFPdQWfBfMdbp9OwW3Z2arjCSqknPSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=topic.nl;
	spf=pass smtp.mailfrom=topic.nl;
	dkim=pass header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=HKGZRMFv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.139
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0834606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0834606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=HKGZRMFv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9SMp6jOX0ddKtuf+PuPX8pixH9PBR9FE18yoUh7Vado1sGjljcnx5A/ruxxy4z7v1O75zE2BA3Y/vcYsLlEQSsK3wqimVYZ/zziD5E69rM0W4U3YrkE5rrtkmvAumioXeKDLFwNGr7nPbLXTh4+OIWRA0dbpSmrqlhNcHnPzg8nWkCkg94zH5dWiGJu9wpcaB1wpNO9/SORcMlTIjVIm1wKua4OnhrEpCsjPD9434XXWzcEZj3p3kc/AFkpfLJj4z9BiJ1Le9GdoROkp+N3535357TEMnhh7qyeI+g3R706AplDRCxfaOOVlNibzaTLGcREQAn48PyypI1mLlpoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24lnj/hDOHXZInbnc2MB6LKyfbx1zMu8Fkz6rKA28U0=;
 b=mk5Ujzho5PAkXr+Gkb84hQTc19rWQQs0R8gYxmVVOpyzjPmg+z1pZ47eEp+nQe8q/hvKiPgfXcV5UmpgAM9MXWA5hmgEzbfQKLVkDhRw//iS0hehkAzkegPD6JOQLOfj4I88Uf9XDLN7ZP3v2kzuU+lFkypLevvVMQzEq9xgr+zvV1Y6GJBEezXWiULsPj9/6YCLBWJNYhmdZ4S3XymgHnDnpBlPsLCnHC/PcjONTbtJY2kOrtJKnNvqQ3hw2wM2OfPX1CsOqeZPhBIBc4AIm1kLrfeUUCt5mUsdPdOJ1j+ulNfFDWRhd2wpm2h8ORyeaS38fW80lt8qc6FdZBt5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24lnj/hDOHXZInbnc2MB6LKyfbx1zMu8Fkz6rKA28U0=;
 b=HKGZRMFvbMUgE247tvPmY6wCFlMluUVinUQq7okCNKUgxGOb/x0TDAKXrguBeu0mw/CpyVEun+H5ow7xQWy2iJUa2lXikGfymoq53uwZLMzwYwxu4I2VGplk6QSwRit8U13YrHHmAOhRjzMk9M3p7z1kRjPnfoQ8Zvf8bljPV4ldxiMMcDx9ySiEX2vJOicTAq6o9UH18NDuu4oXQYgXLdS/VnbUWWAoPE1+SWAj7LfV3ZGvGZl26tFvlf2JCbKOrAbHRk921pgAVfIQslaTMUl0MZncV+DjvLuMa5AsortrCai3aLJOvBFXyd56TxXFRyMbvcUIMrIp/xFR2O4dbg==
Received: from DUZPR01CA0184.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::7) by DB9PR04MB9555.eurprd04.prod.outlook.com
 (2603:10a6:10:303::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 06:22:31 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::37) by DUZPR01CA0184.outlook.office365.com
 (2603:10a6:10:4b3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 06:22:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 06:22:31 +0000
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.98) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 06:22:30 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by PA6PR04MB11779.eurprd04.prod.outlook.com
 (2603:10a6:102:521::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 06:22:27 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 06:22:27 +0000
Message-ID: <d5f544e7-fe67-4e70-bb4b-9e106c0f3c57@topic.nl>
Date: Mon, 9 Nov 2026 07:22:26 +0100
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 2/2] regulator: pwm-regulator: Revert "Add validity checks
 in continuous .get_voltage"
To: Mark Brown <broonie@kernel.org>
CC: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6954786b-65e0-4206-a0c4-60cd251dbec9@emailsignatures365.codetwo.com>
 <20261106130010.340950-2-mike.looijmans@topic.nl>
 <6c74f007-5a18-4a4c-90b8-df2f3cc3b36a@sirena.org.uk>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <6c74f007-5a18-4a4c-90b8-df2f3cc3b36a@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::11) To VI0PR04MB12030.eurprd04.prod.outlook.com
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
	VI0PR04MB12030:EE_|PA6PR04MB11779:EE_|DU2PEPF00028D12:EE_|DB9PR04MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: 04565164-c304-4eef-d117-08df3e29d5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|4143699003|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 K54DJ+98Fwa+6jOJa7e10jxnMKF/mKEQevi8C0I2Dz05P5VQfte2162zB+iSWOLFMWsQxQcDrw+TfC4Xz83jJGWe57JNYca2GZUnFLzfRo1SPd2gSSs6P9Fw3KfpJxURZtCXak9PSEN3TEDZNZUWL9G3uA2BsphC5kBESBU8LC1NF4gwsKTLdW+BdcDLeBZbm6wYjSaK6DTbIAdy2Qf2Vx5+/Zd/jbwM4IvfYtJIJWWDjpCekDG2M2wu9g0VcTTpdrQiUs9ZzNqkFoOwRxd9fcIXhR0DIqz0DRW3eLrEISsiHqGBLhgqrp4Moz0eAqf3YI32i2ombP0jSyKalw+Gl1ue9Ryr6POVZ7wB6UDpkiBFgw4kQuu8Q7YyQNgPO63q/Z6Vz0MBhnE+Djos90Ocu92JDezS6Ojmbnun2m3zdVQf+LgzpxqLY2XI3y9Azz+Hw3WCp7PA/5AJu5aF4HRVjBBAcpITTS7BCQ2wJ2NJCtzStCyxA94rel6PLk340jaVdLnVqsKmUMHmBMM9LvRtcBvF94jUYIGspBps8qWe877K99L5mEdYDi5qaFcfbDDOZgACM7jxRjWQccElvJhrZTq9kYC1Z3ZigMho8/nQJW3QYJLyltTY0bidfPYzd+VXDY9nF2ps4GNa4C12/6iCCEpRn48lrghSu85VOasVmKA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: ULWNbZ/87CDSMImEM+YtN16Z8LuPCH5ZRSI+X9uykYj1aUT2CdCAB2Dw+aJqkZ1VPAccmQgzMMs0H/whpX3xJ0SQjDdqv+Vhe16XA1ELipFZMHb5rvZbXDzb5N8KoRRPT1CydRZELUv4DaDE3B4KG4hAKO3z1TNfLAREKXkuBYpPJtvE4+ob7VM/q8GKCxAIdXJpdIzWUXx4PJFTTAlEwRPv3sw0WdbPimh8BBNGe+v1p79YVCWe6pLJm7oNaKk5AhHrdPiwrbQHI4XNAQbL5K7PXn7FgyJWRYlIOQujDOw8VvmVIcprpM+MFd6XfiBc4IwdDhBPxJjrLtH+NBc+Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11779
X-CodeTwo-MessageID: 69cac3a6-8be1-4fc4-a175-99f4a98a243d.20261109062230@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57e446c1-ab9c-4532-4f26-08df3e29d37d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|376014|23010399003|36860700016|82310400026|10067099003|4143699003|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	0vY3Se8tEkDaOeXw73HeYSs2opqB/ypJ8KJ2geGv1tdLiUsWccHrmdfEE3MNOdtPqcMyNFmyRCgi2cJAkPmZruwBkL57ii6RdzUwRgkbfRM7zxx1l9mX1owMvWLZA8+ZbaKiia526CgPBe1lTP8DjKxuU6Wwcb1TaytnkAjFbXp4HojOV0WNP1LdlAdyjcKBj4Fpm55/9329jNzgNC+/VLjNzGb0NXHaKqRWSFoZLgzoffzzmeZ4zosquiNr5lWG646oLqX53yaaIAMxOpvkJyTd1nJOLl94GLiBdDRx3y/9cQ5Vy2sFExMO8rJKzbyRy4IqC8muFtwDSSJ+ZhzYmygon4A+1oQwJ6mR+2Xmw3ggLzcblwO3NrqCs9VVO+keMrr0GbC3nwU9q+GpD/FjgnnyYEGg3d9XCycMGQJAJLrI2N7BCyLcABN0DPjaSj701kQuCz+XQtc4261NP+fPdIb+OEpB+Xq5nQDGS1AXFVUeC/MttUVjB9eGVSbRzFv209MnnWorkS5WKIimoklu3LspzK27hrW/RtC8qwxVtHf0tLkLjaRgFu+Y+BW7KnFhrnXIlSHGMYKfnGmUS3olUznqQxOr2wiZXbyvbnIw1uDXzTtEG9szjzcbSvDg22R+NkRgNDBxeQb2RqFVqOkohA==
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oh7b9luL2oB3MJtcHiHBPONJ3Ou1ulxCGaxzlI49HPzZTFfxQ5mn8upiItJ7+NLcWfrElvYUOQW/HFLV0z+xArIEbu5yxNXu7kUJ828CE+5KFSnC8BKoKSgOWbBayArHXVEooyof9DprLTBtCzvLj73b+7WruBqHPGSXGtGw7rtShsdPXdBBcBRNbPIQTZIrKOXogbMCeT+hjXFOr0ZrCFbK2CnwnWqsYqO5t0+ajjsLjJUV+03cFCOlSZCNXkxzH8Bf7Ul1NVrkCTjW1hF8Wp7SyAIXK0vEIRzodvl36Pyl2xTKACer3sj0QXzA4qvD3JhoPLX1dbyA7Sa4+7AIqxGln/trERHwIYS4MTMaOQTTIZW/kLCeEup9nPyJdN9VTbnGXm3HepmIaLWrDWIqIHMRkh/dAZZlG5YwZk28o4oaWU+ibygJBWdzCkIo1adG
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 06:22:31.3339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04565164-c304-4eef-d117-08df3e29d5f8
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9555

On 08-11-2026 16:13, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 01:59:56PM +0100, Mike Looijmans wrote:
>> This reverts commit c92688cac239 ("regulator: pwm-regulator: Add validit=
y
>> checks in continuous .get_voltage").
>> The core, and in particular the machine_constraints_voltage() method,
>> expects the regulator to report what the current setting is, even if tha=
t
>> is outside the allowed range. The core will then bring the voltage into
>> that range. It cannot do that if the regulator refuses to return its
>> setting, and causes probe() to fail for a pwm-regulator when it has
>> restrictions to the PWM range with messages like:
>>    dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>>    pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to regi=
ster
>>      regulator pwm-regulator
>>    pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed
>>      with error -131
> Are you sure?  We have specific handling for -ENOTRECOVERABLE which just
> blindly writes in the range specified in the constraints if the current
> voltage is unreadable.  If that mechanism isn't working we should fix it
> rather than changing drivers.

In core.c:

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (current_uV =3D=3D -ENOTRECOVERABLE) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This regulator can't be read =
and must be initialized */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev_info(rdev, "Setting %d-%duV=
\n",
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev->const=
raints->min_uV,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev->const=
raints->max_uV);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _regulator_do_set_voltage(rdev,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 rdev->constraints->min_uV,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 rdev->constraints->max_uV);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 current_uV =3D regulator_get_vol=
tage_rdev(rdev);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (current_uV < 0) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (current_uV !=3D -EPROBE_DEFE=
R)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdev_err(rdev,
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0"failed to get the current voltage: %pe\n",
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ERR_PTR(current_uV));
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return current_uV;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }

After=C2=A0_regulator_do_set_voltage() it calls=C2=A0regulator_get_voltage_=
rdev()=20
again, which keeps returning=C2=A0-ENOTRECOVERABLE, and thus the error path=
=20
kicks in.


>
>> Besides that, regulator_get_voltage() is not supposed to return any
>> state information, as is mentioned in the API documentation.
>>   	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
>> -	if (voltage < min(max_uV_duty, min_uV_duty) ||
>> -	    voltage > max(max_uV_duty, min_uV_duty))
>> -		return -ENOTRECOVERABLE;
> The rest of the function relies on this to avoid having to deal with
> wrapping when things are out of range.

It's core.c that will handle that. It expects regulator_get_voltage() to=20
return something out of range, and will correct that situation.



--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



