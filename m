Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793970027;
	b=h0/lRGRgRSmr6r4Cgawt/8CpTwEiIwzvv3/zaAOn8EHkF+dNqyWrzKooIKyUtymBAFzg
	 oLlAEfUtd0YZaPJ8YJVrQB7YKFbyFmcScK4dT659kO0xOjO25ZYOxb+sXlAs3Wb7tKwNJ
	 9D4sYXgGYDJ2qhiFqZDZvAsKAXDVY2L9wpaBW2zY0shqL6Iw94bhEnDDIe4Et9iHyidt2
	 aAn06nhREzI5qhUk8AIIeLjNoYKsCbqb2FLkB9DO/bZWvvw7krG5DNPcAA2Lnr7wQvM07
	 S4iRd04/7nuFqfiJUQGSx8OU7mMaCMb8n9qyXYa+40/5gcIoT8/wau/9M1XMykX6MpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970027;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Authentication-Results-Original:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
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
	bh=qy2xQ8G/tGwwrvr7RbLXCDLsSq7AxDGUeDmDwnZeoG4=;
	b=p0AnDcV6DbKqVbWpHpmLxacAZJjqaUmmso3dsnL5cHwmMZC2qNuLLANjCwKREaKNtaS8
	 L5VRN+E4P8VnDOnuH4iMMm7IiYwnHuPGWeokKJcZaHFzOIRStXuiZphWEUfaxBvfcf48m
	 skYbvn+7ChNmt7iKibLO9rduWqzI+Byjg6/SkJhLWjWxNPAfavMHe4ABch5NdWcCGNXXw
	 /0O2kcC282nufeJGL/0c+6wTDewAgJoz26AZnoM9zMRwRpwAvNmLjoOFexDOcteB6IjZs
	 zJcgZ1Q94xahE/C50jk854Ht06U4Cr4tO1Tnvp0VM1UqBYx8jPmRPleYaR0zTGXSdIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=topic.nl;
	spf=pass smtp.mailfrom=topic.nl;
	dkim=pass header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=mpKBcETw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.108
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023108.outbound.protection.outlook.com [52.101.72.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD7606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BD7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=mpKBcETw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjdGFoWF2uuqZd5lt8jRpT9Zttqw3FHEG0/LzMsvrg177TC7DwXrm71Jm/cb3rPHSFn2BkK47Ah7UeY0uR1XiwX/JSrBycUmbQKMhkDb0ABdf0DhXdNzM532GtRUqCD2GrXj1UtksXTRnRL3z6QIdZBq3HnLo31z0eHLBm8ih2sFGhjzL0cerf60i3DQ8pCeDfrXMHDCw7CgbsE/8oYUcuON389viUZUqr7XbIHQqpdHTMOTFMdCMGMBq9Lfjo/FgO/v1H6aqZf5TEnOY5i+J4gDUsE3goGsuHn7oLXUI37xA5E7E+YN5rYM7e74Mmd85q09QCcgVh/nSHAKJkGWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qy2xQ8G/tGwwrvr7RbLXCDLsSq7AxDGUeDmDwnZeoG4=;
 b=Ah4iWia33FJjB66ryaNDMkUiVxGnsG0i/CH0OIKzy1CmcUph6Vk+caCuAmqtk4Y0aaAJW3g75JPSJdDMjmAhiuQauonBe0xJWxuf/JrGc5Qy0wilWvAmGdwsopfMfvXPPkiZERY6WvNlHVgNGVX4sfkv9WhqJvcmMNNUFYFX/0NpqB0biwdARSdE0jLUPEMc/K/VCSRgwc+L4T108SO2wG364PTzaHQtt4DzeDMWuWFEd2BxtD8g8X69u+uxo6M/q08tqskpiwnsFjTmvjc9Z9U1/iA9s7rTFMDjNuWKDaynB6UNJFuFPPyLnTBEIJc4rlP9Djm/0BkWobhzB43AcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qy2xQ8G/tGwwrvr7RbLXCDLsSq7AxDGUeDmDwnZeoG4=;
 b=mpKBcETwZZOGAJFvbMbmui1dPEHGPGyPklanlF2QzuJSJ9Nhdi8WsNU+Ct6MhWOHGO9+KPXsTvT51jLxYZSnfKgd4UsGk1C0EO1gvyx7+72Wptxlcj/3DOKoJU1xxX1vOfg9dd7Fgi1Pz2/rjt1/cGMWFEIlqb9nL39CW51PZZklD7olAt9iHgqMdLnPka5FxR4mtPFfLpW3v1Bhh2YsRYHsXei6aVl0H5FvSRXs4JzZBftEYOdjXXQyMiSdOr4xLs/ZTKPmIuVkel3MQpnCUw28bZlK17SXZDjfF4jJX46R9g53Dhvc1auTH6xA9ZyWVLM9XtYH1jaMXlPOBvDTDw==
Received: from DUZPR01CA0353.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::16) by MI9PR04MB217036.eurprd04.prod.outlook.com
 (2603:10a6:290:b6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 13:00:22 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::86) by DUZPR01CA0353.outlook.office365.com
 (2603:10a6:10:4b8::16) with Microsoft SMTP Server (version=TLS1_3,
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
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:00:22 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.71) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 06 Nov 2026 13:00:21 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by GVXPR04MB11595.eurprd04.prod.outlook.com
 (2603:10a6:150:2c4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 13:00:17 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 13:00:17 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: linux-kernel@vger.kernel.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] regulator: pwm-regulator: Revert "Add validity checks in continuous .get_voltage"
Date: Fri, 6 Nov 2026 13:59:56 +0100
Message-ID: <20261106130010.340950-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106130010.340950-1-mike.looijmans@topic.nl>
References: <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6954786b-65e0-4206-a0c4-60cd251dbec9@emailsignatures365.codetwo.com>
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
	VI0PR04MB12030:EE_|GVXPR04MB11595:EE_|DU2PEPF00028D02:EE_|MI9PR04MB217036:EE_
X-MS-Office365-Filtering-Correlation-Id: c45f4bfc-24ec-4690-e053-08df3c05eaea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|261026121527099003|261022075727099003|261022105027099003|261021123027099003|261102123227099003|261021121427099003|261026140227099003|261028144727099003|10067099003|261009223027099003|3023799007|22082099003|18002099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 P3MZ/v7uBEeRQtIhIdi5hufRHw+6kN01RxeN1rA7/vKA9QsSI87vsiq8sK+knu6KIKozekclYsIE8KZkEL8Ih/9uuXCJXiEPYyO79Ln17VYNtMcjYztNVJnqAdcHuhdHJD0GTS7/owXjQkDWsH8k/gNRVrLMHaE1q6mNGY1mdJ4Nrn3LBH6lvr969V3e+gBz6YIKr6O9T5/ZZ4A/5jA1wN6ZgvC5Ra0joSkwRygDwKIKy975s/dJq5tuFnCiUxvRNW0KMxcmAtHsj71to32nuU3D9+1pe+9ZbgCzZP9g1qcWqeMK0G/hSjqtmd6Xkj2XAyvcP2+OWkpfXPSy6WiQcfkP/KqjYvOMShSy+jrbnwlQdXfpNyWt8gTuTSbFLLkQAEjMm13j2VQs2tRqX77tt9GLWkOvvJ+kWBDcnhKNVlazBVwT0Opgtg6C7jWPkh3NxzTi/scPGo4XgSrUTxcXyn7ACukSV3VVakE7rStI5SQPpVGCgpGug/11dB8+w/s4cF50R6tg/sSqrCeL3/JqEwBg72kWfD/ntT6AeXJUSqFIfQgjIrGVe/i/tdc/Y+FQtQewoPT9OzU0Fc9PZ1bOMTNnVYZH+0WhQTZ8Go9EymeFfdUCrPz4JxtHXwR6Kc403nb9ZzwTw/YcmrmdwkYGM8KjYdNgsHmRay+gKpOxWO5Lxd5m7C4Ck02ftryAgkDDCyUslNW8qwo2XwI8wzSJ75Nm1h9WDmfJdJ79efapYm8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(261026121527099003)(261022075727099003)(261022105027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261028144727099003)(10067099003)(261009223027099003)(3023799007)(22082099003)(18002099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: RiHVrbSMrZFzSfZX75Xopw+CHqrJhToC4gnhiYaYr1wynrIwk86hN3w3u+2QWCQoxCd9lShxY5ZL9HVbhoe5v8KhNDeEXEdWIPga/Bg2F5mdOpTC53dOx/GXZ0MYnU6oFHji6PPfYrSaDpzioJY8iawVPhQ0hehHivwwQfPIDT5TjAdaLDV9iscRsLo631ALQzAiKaprJNhPHcd9NW6ba0d6VAPsyUdZ7eNli4fA6Zp98ox/2OS1Tkj8HC2hSced9trlcKTEI77km72S0KfVZke4WnRsjXFLQ3SWZDwjT0pieHeAOyAt1tRWOawxqQbyLNePkpt6fy08AInTjXfDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11595
X-CodeTwo-MessageID: 1b4788da-a593-4263-8699-cfda3a6057d4.20261106130021@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0af920ed-126e-48c3-a566-08df3c05e7c9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|35042699022|376014|1800799024|82310400026|36860700016|14060799003|261026121527099003|56012099006|4143699003|261022105027099003|261021123027099003|261102123227099003|261022075727099003|261021121427099003|261028144727099003|261026140227099003|261009223027099003|18002099003|10067099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VWJ3e/Nn7WRYq1nkcjYyrmFqNClWtLwuqtb9ds5Q6pf+nr9sWKhKUosezLBHUZr+AENmbciMs/7jLs0S2SH3m4PkZA50HRmtGQxRl8vV7pNMzlBaYVR5r7hWgANoROxS4+hg4TMdYKxwK+2ISp5iQuCOMOIqLPz5/MfKTmSR08WXj/RKDM6VK3I765XiSBOQ8LPnU24vm++mLVH8p0AkibpoN71vizf9xqnSvdSrxgyj0HTA54zS1w31P9DmKBbZXafft5TovQFlXxkYKmC7CPo2/bu6VDvZ5OlMjjUVAd3jt8v5HTNVJ/A23vDs3XMMWgLrKIy7HUv43Wxi/KploWObiDJz9hQt3UfJi8YzsSuqN1NN6iKB/fZaN1UfMUN2L3Ck30iom04kFNVcfqVQLLU565dCiE/G/b6G9T+uBFjxu1qkOT36oBDagl/ioPmt/wxKMns2snXDK0UiZGHeoLUWz5ywoMV3aAHSvefbxBLv3QdBEHT/eNMIqxEDfUcCY9zoitzw2PgJ5vBAQHitz+ga69Idqs6HJt5rq8s1jXtFlIX7jrA0qhC9wCgwYOqWMmM7+I9KQoeG/nDZBma3eKvUHFN9W1ejhzMbqXb0OhUN2PkSMkAiM72clCVuSaWxtszCDJgT+9AaNACn1HyPeQ==
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(376014)(1800799024)(82310400026)(36860700016)(14060799003)(261026121527099003)(56012099006)(4143699003)(261022105027099003)(261021123027099003)(261102123227099003)(261022075727099003)(261021121427099003)(261028144727099003)(261026140227099003)(261009223027099003)(18002099003)(10067099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XYzrQr1wo4fwGG0NTZRVayQ8R8RJw6upXf0VlaomhlFjoy5eijvmqbOE6GeN0cKCrdQwli/1e+IklRvJqm0fp4bkA2rjjd3W7tVgf+JFapUQKrHoKrLetulDjotirLrF7Ju3fh1/Gj4h887u2lkOew8gv9lDggE8IznfkxZNy/qnWcDWWMhd3ydqZQhDPfhOwA83UlOuhU39ZqJTBVc/Povr0fGUpCDa1F7Saded+7RQLNPxJbYZQc2tY7JAsRlrnXDM65Q6aLMdtRT023e7esFRzsoYEGy1ODcPiipIKETjhe8Cc9LbwCp9XmDX2LJ6IIl3IBSGRI1lHEKJbODASLqByq5KJ9fmEczsJK/Brdafzg0GI+5DNkHXEYuMB3hPnxn6gQYWiQ+7xV8lR0Mt8rx2xAgqBTiJsUcxLSohH4BaoV8tfBY/B7AxzbzsFQhY
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:00:22.2961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c45f4bfc-24ec-4690-e053-08df3c05eaea
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB217036

This reverts commit c92688cac239 ("regulator: pwm-regulator: Add validity
checks in continuous .get_voltage").

The core, and in particular the machine_constraints_voltage() method,
expects the regulator to report what the current setting is, even if that
is outside the allowed range. The core will then bring the voltage into
that range. It cannot do that if the regulator refuses to return its
setting, and causes probe() to fail for a pwm-regulator when it has
restrictions to the PWM range with messages like:
  dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
  pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to register
    regulator pwm-regulator
  pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed
    with error -131

Besides that, regulator_get_voltage() is not supposed to return any
state information, as is mentioned in the API documentation.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 drivers/regulator/pwm-regulator.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regu=
lator.c
index f50530c77d92f..00fcf9a172b47 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -158,9 +158,6 @@ static int pwm_regulator_get_voltage(struct regulator_d=
ev *rdev)
 	pwm_get_state(drvdata->pwm, &pstate);
=20
 	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
-	if (voltage < min(max_uV_duty, min_uV_duty) ||
-	    voltage > max(max_uV_duty, min_uV_duty))
-		return -ENOTRECOVERABLE;
=20
 	/*
 	 * The dutycycle for min_uV might be greater than the one for max_uV.
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
