Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794206100;
	b=VIiYeA/SCuimgHVQ7kj/z8nyKIX8ls1CE4+oNlDaALXCuMetRzYoc/FIMPyM05L3mvA+
	 KCHspwWz4Sy6yExWFv6FNeaJZp/CCKZTOEKUyvykJ6lrU3BIQ3ZlQA/xUk32YCUyIPfi9
	 MH7P18PG2wuBgtdeCM967naStAC4/nBKVlCRDHCGsUs/Mqo5Hvr2srbxrcO4ZN8fYU+BW
	 eVba1WSOEi7z0w9Nx9CjLCy4Lwp20uyMQxeAP6UBpPubtvddHVT4qfsKwS6lDwbusIL65
	 uARoBihedGRqVfCJlIzoCd2hZZDjPL9PQA4xF6SyIL+wWIWpUzmwvNgx+FnL6yBlh+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206100;
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
	bh=rseQX7vXp2t1+EdyOu0G7X5tvj/pZ/xAUX/c5fPxImo=;
	b=QYPNgT1wW6c/agUpuPLcFZgGFDHlowfCTZuAMFj52wpV8bHCO3LdmZUKypihKuY8kUzz
	 WwppHeBtN7BOlIxG9KCJOWR0C4M22kCTMc5wMlyuKEBNli3v1yiCM+pMmFDIFw/yhjSlC
	 WTzyEKI5lBDVRUHHFgpDztq6Bx0AscGUuJyei5m7Wj4wTzyDp581viwX08tqOj1HLdtSi
	 ieaH4YXAiZP7WVa/Z6+NuFKqgXTSi+r1sNxtjY87hUyvwyD2swdRbP+AJ7PWgvZkJ8lWV
	 Ytla1soqEUaExDsLx2RPtML3ey5AMB6068tgLtPRRY1+79upAUq7RbPZDMQCL7EPzwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=topic.nl;
	spf=pass smtp.mailfrom=topic.nl;
	dkim=pass header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=sqD5civB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.72
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021072.outbound.protection.outlook.com [52.101.65.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B539606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B539606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=sqD5civB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASmdlg+4Ic6jfK/6UHi5mQMkCOMkHfY2IUtOhuTJw9HVq0TpQG9O9yN0vjBBnG7miLuURE/6yxZkcucGmR5V5Gsl4k0hU6fsNVmUhDyBxXtVyXlUmGf1XZ8h3Uh8nwut+zSfoRmEPV0Z54CGdG1pAyLK1fgpmq062oSESpUrGdtYQDMAqplVA0JN9oeTBl9wtqXduZrq9imDA22GpEbslvMi2Ga6hW2Rr2+vKyi8r6qNv4wp8Ap5JTSzPKJKT0zYUDKXsKJmp4CQ28HBqGvqVa55kA4K0qFC436sJbC7LSDYUKkX0LNHMCl7RVwLG/UYY/hys3qWXc0x7gNxj+tU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rseQX7vXp2t1+EdyOu0G7X5tvj/pZ/xAUX/c5fPxImo=;
 b=IeBT9sph8kUR52qfV1IIoWUDIPOu9+np2YiNGmPcjwavnLo3mVcCh4zS8ILJN7uBc3R12uFkghq5RT7WK+CddpmTAkzi85hoa03mV8kdyxWE8SLLVLxs1l/Jyt4ZV6TBpfb/Rl+12Zzf3voSJ9o9Sdrvst0wpucc7FD7LNgqBh0D6+h3c0ABHlho5Wl62h4jb9c3Cj3dypSCnHSEt2wVQvwO3ny0Veu4EyPjVwIBbgQdF4jbJZNn3DdRnTgR8QIC+pPq1eP8PoC8o8D3Ex1eX7+I+vKPifmhVqyZJZnU0u5KqnW4ZGx1Z6/9DP+fZ970CqvtJoCfKmuF5W0GexVRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=googlemail.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rseQX7vXp2t1+EdyOu0G7X5tvj/pZ/xAUX/c5fPxImo=;
 b=sqD5civBbI6ZuBF5ruGgystDnKWrXiyljFcsUMH0l+hp5fRuZvm/zM+d28MnqDV38Xn9eDg48HPk7GeHWlOfYo8AAvWc5MriWgbyW9VcPF0ZQqHgKx0f+4cHWcgG6xK8YddX1vVQBY/2fATzGrGMCQvSGtPM6x0SinE2Be75QcXCBhcjJHEZn+F2CO4eUimZ+DG1a9FC1nGWyvILRNWs1TevpBwmTlzUEBTdOvmJQfNlDrqYcyEBcu/RuR1qQo1duK4FvgatxoE4slVaX49KE2AJ5jeVmF8k9y/aPzTyTVFvAxpMIqIZZEjhVCw2m2mjgEzrPJj1X6cqkKhLexAoZw==
Received: from DUZPR01CA0286.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::12) by AS8PR04MB8085.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 06:34:55 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::6d) by DUZPR01CA0286.outlook.office365.com
 (2603:10a6:10:4b7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 06:34:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 06:34:55 +0000
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.98) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 06:34:54 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by AS8PR04MB8499.eurprd04.prod.outlook.com
 (2603:10a6:20b:342::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 9 Nov 2026
 06:34:52 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 06:34:52 +0000
Message-ID: <e70bb142-20fb-46e2-8aa4-955854ddb1d2@topic.nl>
Date: Mon, 9 Nov 2026 07:34:51 +0100
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 2/2] regulator: pwm-regulator: Revert "Add validity checks
 in continuous .get_voltage"
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>
CC: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
References: <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6954786b-65e0-4206-a0c4-60cd251dbec9@emailsignatures365.codetwo.com>
 <20261106130010.340950-2-mike.looijmans@topic.nl>
 <27e5c94a-acf2-4e32-92df-e3de124e0bc6@sirena.org.uk>
 <CAFBinCCN+P0YRvOP9pwmxVXGv-MGyuZn_45nCZ-7ko8Ko3v+-A@mail.gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <CAFBinCCN+P0YRvOP9pwmxVXGv-MGyuZn_45nCZ-7ko8Ko3v+-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::27) To VI0PR04MB12030.eurprd04.prod.outlook.com
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
	VI0PR04MB12030:EE_|AS8PR04MB8499:EE_|DB1PEPF000509EF:EE_|AS8PR04MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5bf474-da82-41e7-a284-08df3e2b9175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|22082099003|38350700014|18002099003|4143699003|261009223027099003|3023799007|56012099006|261021121427099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 35XqjTzRPMd00Yuqny3gp5h3lq0LdFne5YxgjtHzK2uqXofTMNHjn7wHf2Dh2+KQRjmEbFuqqCqGAp3Mgw/nasAbc9clKccHbnozR0vScACYqMkho81lzn+yalDcGGFZcJ3YNTVt7YdKxrgFS9WQo6ipskYZ+ofqdNjOLYmG9yZViZl+838J7A67BA1fC8Yhv4GCeP1krxVljYnlH2fpHC5mTfD0crnPuREjgqopINHXhl8ohqyeqvW875HVTp8sUaJIyDHdiLFg9PDmK7nfxzZ3CoW88mYLrRjaWYvmqvAjr/8AQexyThw0M4cT7nUy+IErzMwlfmUaNP9iNJ0YZBygLk+t74cycjayZElo186PVxImg3CMsfbkDHIm5L3Vbq2kESBX3rmLwR/taSH+Q4tTDSvahv5p0FiMcLDMxPw3OPe6aNp81ewDN/80adJqr2rsOJB7oMdEp+EQ3JWhjig330O7XeOWxPaNxjlAtC3q/tFdOKh+v9DIGZ+AYelbV2wnzgZeweJm9vLtF4CP8zo/Rf97QIvV07FviNJ4kPziYF/UC+MMrCUcPQePgULoWqpuYstWX+XwUy6nQIZDLrUXfaQfvRczyxgsrw/MPkMphPQ67ub97VRsXU3tfH4or241glu4pEiem4Ts5bRlkbDIpuIPkzHwTf9748zspIc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(22082099003)(38350700014)(18002099003)(4143699003)(261009223027099003)(3023799007)(56012099006)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: bpASH2+MhYZ8j1Qn6OHA8iw35lkUZpL8qYJRLZWctedAG473RlokyjtoKwpidSnZvpttt1hm7LzTpeHzRiMf4N41LGK/vIV+cOGOhQamA/1PrRP6ZeoZHlhmoOdqHLknEiYgvRXv5rEipUU6dNmfuOHUOJsuUBR9gKRy/dVrtEmC54rkp39Mm84npzc6z3VqhrLnJXLb2twios/WtBNqv0Tl13UhzhU2KEq0yNB3fRDxTa7HrhTImzvlMQT+Pjz6lEBRmJulgqeaR1JTBdbfEw5N1yylsbZm9sdBG1rHu6h6tEA3vh81KkJ+JpHIcDgMMs/ZXFp5skEgnw12J+vpVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8499
X-CodeTwo-MessageID: e4cc650a-5c06-47ac-870e-2511dc0ef795.20261109063454@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47d5c5a2-e801-49ad-76af-08df3e2b8f4a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|35042699022|14060799003|1800799024|82310400026|36860700016|4143699003|56012099006|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	94J+M63Q3P5ks8FS3YxpmPHG/6UZiOaR6WOfiI4eJbrX0LHleOqPzlnWa7mhU8Dv9hr9WDLsIU1F3y31nD6ZR3JjGxnWOBI/DEN6BVy6JcL0fjb1bXhH2zSFHRc0NVitkCFtT1MwEu2/C50JqVrjJvxYOfSBLim7OJtrsFGYAQrbPYlAilHcZvPbRBr59Knfu6oVT5Zug6CqzGTr9DgC1Rsbv0q+vr//JahJ93t2p+IXDP+kO5jR0yY/IgZIH0Nc8SH6hss6mz+0SoMJ9KStBtqag6YROjtYUupceEFvUR9m7slLCnOcuZMQDmobWmD1jpBTwFwrQMb4kBJ70QvOTa/DDsgt5h38/aI5BOJnlLj4ngxUDtlLz+bNnwvDC+G2VmGl6IkVSeday3dwtZ3jf1wCk6cd7hZgQGnJxKDLFDn84yffYhxMUfn5ut+JpBoMCnQgTbrgK3bGWhuijqFiaEwiNtFwuTa3jvFIGgVZ6d7BYD/jwMFimqm94Vu+EuY1bhlKj2M68Wm/f/Qod0EUaUiiP1CA0VhizVs1ETHp32K8vSvP1QYHyZY2nnlW0fvreToWajEI0CVWp2JT44mng7L1AECT+tmIflbE6PsXTBiZ+qMHGzkyskTDY0+75Cwsl97MIe1YrHeCMw0oeaVGCw==
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(35042699022)(14060799003)(1800799024)(82310400026)(36860700016)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g6rJHFQkHsccWibXv2ADrTMQgRCVIyTS8BLKB1sJSqbehgaGBXG5BH4Eze3pdH5jpCcEHdU+YsPk0KKR5qDuNTFbbWs9WfbSfI0N6GrX5kYxmEBXw7J5J4emzX5X9dkF8RfL2oz3Aig1zAxXq8OVBrmhqGgG/ADSSOQvQqdLPYOpQjyBySbc40mS1cktOrtVpiHLOHMAePQQM/TBJ1gk0/JQrX+HwLAsh9sN/K8lSuwhcjplywLouYrHSAfYoO1ZOb/Y+ve0N3vb6g0OFWb3mYfsSGZp0fvyah9nfeP10ZgfFmH5+B0ichjWkr+C1/CuOnRJ1wKpIUmb5ozRm4Plqp//ICH9GXLTTorYiZ769KjGn1RNV81lTxa3I8RoqtXAqBQcn+mwk4tVojq5UEwPLTCc244NR6tIH7L9SolrPBZUNv82eHppMNfkoeL1DQ4f
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 06:34:55.3992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5bf474-da82-41e7-a284-08df3e2b9175
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8085

On 06-11-2026 22:45, Martin Blumenstingl wrote:
> On Fri, Nov 6, 2026 at 2:46=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>> On Fri, Nov 06, 2026 at 01:59:56PM +0100, Mike Looijmans wrote:
>>> This reverts commit c92688cac239 ("regulator: pwm-regulator: Add validi=
ty
>>> checks in continuous .get_voltage").
>> And again...  please don't try to sneak changes past people :/
> Thank you for looping me in, Mark!
>
>>> The core, and in particular the machine_constraints_voltage() method,
>>> expects the regulator to report what the current setting is, even if th=
at
>>> is outside the allowed range. The core will then bring the voltage into
>>> that range. It cannot do that if the regulator refuses to return its
>>> setting, and causes probe() to fail for a pwm-regulator when it has
>>> restrictions to the PWM range with messages like:
>>>    dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>>>    pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to reg=
ister
>>>      regulator pwm-regulator
>>>    pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator faile=
d
>>>      with error -131
>>>
>>> Besides that, regulator_get_voltage() is not supposed to return any
>>> state information, as is mentioned in the API documentation.
> according to include/linux/regulator/driver.h:
>   * @get_voltage: Return the currently configured voltage for the regulat=
or;
>   *                   return -ENOTRECOVERABLE if regulator can't be read =
at
>   *                   bootup and hasn't been set yet.
>
> Can you please specify which API documentation you are referring to?

https://docs.kernel.org/driver-api/regulator.html#c.regulator_get_voltage

And the text above clearly states "can't be read at=C2=A0bootup and hasn't=
=20
been set yet", which is not the same as "whenever it's set out of range".


> I believe back when this change was authored it didn't make a
> difference on my board (but made sense based on review feedback).
> So I'm not against reverting as long as we have a proper explanation
> why the original patch is incorrect.
>
>
> Best regards,
> Martin


--=20
Mike Looijmans



