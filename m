Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794204586;
	b=YAizmK2TNAjK04z+wPeP8s68hTsFPpMANpiIW95nky6TSAwQTO6PdiM2nUh61kr0znU+
	 +etfadP1acu/kHYyHqzqJSNxizq8J3yO8F50EX9FdaN3x+e7UVqtBs3SYTLKGag7EHcVh
	 USglF0m+q0v+reee9dCppO5YBrTHTOtXBFjueVnoCpcBnc0KvwBcoVxaqbEY/vDXzhwFi
	 bXFad53kW4+f6sMhSLJ9/TD0KP6X/TnLc93iiSXeFjvDbdR+3elOsMba2vTr+bMgVqXNx
	 h7U05cyWvOdO0k2/arwnk5Ffak2mLU7ZfX73FoGx6gvpaVjgEW1/yZnzNAaogc1UDcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204586;
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
	bh=XUJ+rrTHVaZdb1rDiHqhB9yahPvWSb/0K2n15ehwt6Q=;
	b=sdJGUYVOi1PTFX8383LCUWl0ZHBfnWg0QsAt0fUoSRRZWOVCbZKKsEhPfNvyUY3glGTr
	 qTOuf3toShTghJBRxyVjtFthrNSMuWiL4OA2vakSNiLKPj/r16EpYG+48g6thJyQR75WG
	 eiiOfgeaIMMaCwDskB48+mpxNO+wn6c/gypt0FpzunkD202P4R/mS8yflYJ+cRzLo/ree
	 WDWQAS/xiQ05bc7HwLMpNbqZRUb4pogsy/vu3IUBxdH4VXEd8M9jlr0np+mM08ugchFCG
	 vfs15A71HpJSqODV6KxlzlZXH/ORolN0qe0YN68ExdHA19PfpasKxUkL6odbF6PaTvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=topic.nl;
	spf=pass smtp.mailfrom=topic.nl;
	dkim=pass header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b="j2oku/6N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.124
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023124.outbound.protection.outlook.com [40.107.162.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A958C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A958C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=j2oku/6N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5M+f7m+ZwxRYHj388zSEURnrElVhAXhLtzVolcITPCgIRA3BgleBY4DOXEGoQ1Ex3IDZ3IpwcKz/hfNPwWnCnmbTeIV5vDKAlhxZxtLHCRsBQ3zpGETiGf0l2ThsHE3zn7p6jwW5nT6Dn6qiw2yQznb6Y1TCq/r+GBTxG0XBLalEoY2KTTwOpRlLGdXZre0NP37XfVeLUXCR9x/rgJTHFgjrW60+oX/gjubB7bGZogVK2YWnFcNIq/DfTaCwFHeu8FeCgGUnPj4QAHS4BAdZKzuVfikJpDS2Q6TCQ8yp4/Rgu7YgBEzr+OuxP6BCqjpGZca0hgpnvp1IHVV0J63XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUJ+rrTHVaZdb1rDiHqhB9yahPvWSb/0K2n15ehwt6Q=;
 b=Ax2NhQWWJrwFHss4Sh95iI3Jr2yEs8j3Tkl5cXFtCyFBZrgId4hIVX5oG/xbR9asgAUM71GiJ6sI7fPqb8/9YD5+EcsZb6F6hOaIHuI/uMkbXn6zXiNN0laktZaC4BdfGpZqDwfr/uIDP9RHSBRoKd/P3qsYsRVEu9qbJAqxapgdU5rLojYzc/XzRiGNtGjWvwWIUQWHLCIgODqM/CsQ0vdeXQRYHD9hTaflpQ/nB8AENOlh79DBW+73T9x15L40x2aBPRFa091YiUWVLDrqNqWAO+l0E+MuKin+8VBiwIaCMYO/AI26kGI9+yMR0doqlA9ZDWqC3Ck/2izbrJZTag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=googlemail.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUJ+rrTHVaZdb1rDiHqhB9yahPvWSb/0K2n15ehwt6Q=;
 b=j2oku/6NM/0d/Pzkfze65YMdxx+tixNLkkJ5uk9PbE0P6TinUq54+LfWEVuCluGbOouaME6dTU97enXw0cQHgrtixnfCBdBgFcU8hmPLdPNgOsJlyzepDoAy4rBgC1AkMQdNAooySu/e3sk0kj9jwn02sxYLuZBj84xITFTquNjT84h65jW6LNAEYQ/suZR0lEx+8eI80Ft8OYpfhuMDlm/5DRB4wMOEXgCvY7ARinSM9rDE//7l5veBmflqaMWppzeYyYnb2dOMW/bKDtkbfFVzbZ8TSeA8K/Oq08WSsuwuiZD4pLHiH9pVfy282o6QTFTRymf/uogYWO5eyJIKeA==
Received: from PAZP264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::13)
 by PAWPR04MB9911.eurprd04.prod.outlook.com (2603:10a6:102:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 06:09:40 +0000
Received: from MI3PEPF00008553.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::7) by PAZP264CA0047.outlook.office365.com
 (2603:10a6:102:1fc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 06:09:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 MI3PEPF00008553.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 06:09:39 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.51) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 09 Nov 2026 06:09:38 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by PA6PR04MB11885.eurprd04.prod.outlook.com
 (2603:10a6:102:513::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 06:09:36 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 06:09:36 +0000
Message-ID: <21c64232-e2e2-45f5-917e-d326d159d285@topic.nl>
Date: Mon, 9 Nov 2026 07:09:34 +0100
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
 <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
 <CAFBinCAaaovFc-Rvrm=U8Z6NG3HZKrQuM55C-xq9JYOhX6htug@mail.gmail.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <CAFBinCAaaovFc-Rvrm=U8Z6NG3HZKrQuM55C-xq9JYOhX6htug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::6) To VI0PR04MB12030.eurprd04.prod.outlook.com
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
	VI0PR04MB12030:EE_|PA6PR04MB11885:EE_|MI3PEPF00008553:EE_|PAWPR04MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7460f9-5e36-41b1-6cf5-08df3e280a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|18002099003|22082099003|6133799003|10067099003|3023799007|4143699003|261028144727099003|261026121527099003|261102123227099003|261026140227099003|261021121427099003|56012099006|261022113327099003|261022075727099003|261022105027099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 VSjIPlZIvrPNU74aZoVlcwWgydCybAFZz5FeNw/byzJOo+8Q5fyOaRDCTuydTMibTg/9KfR0fjC6YN+0vvBNqILAwZBDD7qvrZD5iHCux+LkG/MRGlPHeKcyZTuGI8ZWs4Y6HGNJ5P54rNL89r1Jtv/rcM85vDxY0n21T82cmQhmavQfzX1ICKicHGFbNgQYcLpBQYVOsxYbYuF4Or0pJQIwjN+bZdqxrrYP4R7kepfoGYxNsfROPCkKY9hqOs/9HNtldYZNEc4uC6rC1qO5kNaNL3p2suSAPLso0qiQq6/VJqaOFqsnBifIICHu9ksBNxMvWFbYXL0qmUn8HOZuTMK8Yd3WsH7gz+w7jQ1TRifL73Kj3fOnt2IyCSp9NGxxPbaXoroyQ3w0a8h/XqHT7LLW+6eO2wEohtk/lmeWYmaAGkBViP9bTqPx9Ch6GWaYcONiL93vMS1NyKY0ojEx7nXG2Hu4s0C8bnVDjzdE3xeZuGCi1FaHUYQUOfxxHDwBxJe0FPP5UqwtCIjvUF06mP56iKR38p70MkOHR+A4QP+7XPfkOgrfX91yXyk2qIryjqN1O5AX+okPgD5MabZW//S7UHKt3XfZ+AMKpxtjObxkgd2ojoxY3A7u5SyvHhh7CpSTyZfeXEUlnTuCRwN2tHSaIcCch7kRY/M2sBonEwvnz82lSDRxBhIrH6WwOxXHumBsdEJvGUL9UoV7+x3O7Aw7ot5k5ylC0/YLnC/m+YI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(4143699003)(261028144727099003)(261026121527099003)(261102123227099003)(261026140227099003)(261021121427099003)(56012099006)(261022113327099003)(261022075727099003)(261022105027099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: JrWrohZLI+B+yUwqV2dmdkbk36dYpnYNa4PKINt62GgvWyTwA0vp6cCIRmaUdIpwlC4QPeCgtE/4Gksm/v2jLOzydLOpGz7MG2+QNNRF5DUptmTYtK4EXXNhPYDJMlWJTTfyds6QfQIX0X8YiRhkd6riRx9s3jNf2r4uVtrWxPaMKb6NJoY6SF6KpkdYJP1uD9PrpUYRkM/yMW399/Oka6K5HWbPMpHGZqonvRu1gMqs8CaOW3Yawka+F1PJgQ8HkXnRR6srp53JQKyj5v37fgsAyM6Q+/Z8T6c0hKbh7HrVbtOG1So5S2O7YFfFxnVzGHxe/7PBAJ0rW16HN2aZNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11885
X-CodeTwo-MessageID: a33fa3f1-0613-482a-a6d2-b67d26064034.20261109060938@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008553.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	69ef7a22-06e2-4591-16c5-08df3e2807e4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|376014|23010399003|36860700016|82310400026|10067099003|4143699003|56012099006|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YT5BDuQTeKET/Hlhqz1LWqsHNsEFzv7TKh2mJ8U6hvHqpS+d2ul0J8JFaQCne8VoGPh1I8AKisFbWVF3+ZIKl6AFtXgcOmCYEzIAam/vx9/lvm7uZh4n4W2Z7NNxmj4zWwEdZihjjhoBwXeClNNxb/J9QpYvE5pgDKLTV01orXm3girXgfOdHhCH91OgH8xPG0MjuF3eMk7ac2lwCd9LDnqCQcJBIVKPr7QAuCwAaQfw3ZObjHsL7Su9lMQlR2dHKoeBZ7ARej8aRmAc5pCemA6GwACEVQiE5vREflDhr8yI+stVfWFfxqPZ7511ucpeDZKGQGH3Vqs83O8pbWrVMYGOd/eWTNAhLZdUb8WMiuEly2MgTbBCvufz7hmiWwcg1ppe1MpZh+YZrWypcWq3WU01NqvxEwErRqtaH5Ufq7K2WUFeB6hPZHAMtxChx9L1ZOu4OWa0iNo2QHmD2ns0kn4xcXl++wXvCUg++33vm+xHPBJLhsXYTpZmm72oxiILJwaIAFdjx8O0sP5382ov7djNZ+/wOTNThGrRADG++C636GEHpctA3ihUauK6A0x3RLgCsljgmQ8FGdSWTb4dLGa6TxUc8JpPVGRdKdUWOa4IZzmNvkpbhJox0zGLxHy3exZIQ+a6FlKE1RUlkfkWl9jsuTs/DNQEe08S2rCh/3fMHN6CD9HsNOR76dLSc2nYbMLS3xywEfatW4vLkHGuew==
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(376014)(23010399003)(36860700016)(82310400026)(10067099003)(4143699003)(56012099006)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R3F87P0APnSpcozwxK5GPXrk+JTnxefM9rRhFRzedbxhsYF7ArFnrYMgsdjfZV3oS770fvUlW4YlpiYdeZiWttjCE0IaqjeS5Vz8gs6zZyJm39dogUO8aOLiBboVaRJLjkg0iN07WZVJN99EzXeRNQPywpcnZLrelSMhjJtMAA8zV6fjbuxqajnEsK5NbwLMklPS/0RAzGD6GxplZnzuXKr6EyDsUaSG6ymZXVZ0WK55soiAXJ4Z2Q5UtiE7ZGqBd3dbg8Zhq8upQTpL0VoezAqvqNkxj+bsyMTeWVnkTu/tQvKyfLa4emVCZWQPVxWJq/QdJhAiS/deFnP5IHidbtBsJp48Kuq0v0ziUTZc828mYmdh7BrqcbRQVoPQfBz4eLaxnJo4iikt88lJU11XpPTgQ6nSlBrlyYF+ScoiMv0CMhECEuDEkTy3LdlKynRf
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 06:09:39.6621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7460f9-5e36-41b1-6cf5-08df3e280a06
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008553.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9911

On 06-11-2026 22:57, Martin Blumenstingl wrote:
> On Fri, Nov 6, 2026 at 2:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>> On Fri, Nov 06, 2026 at 01:59:55PM +0100, Mike Looijmans wrote:
>>> This reverts commit 6a7d11efd691 ("regulator: pwm-regulator: Calculate =
the
>>> output voltage for disabled PWMs")
>> Adding Martin who wrote that patch - please CC people if you're directly
>> updating their patches.
> IIRC get_maintainers.pl includes the author of the patch blamed by the
> Fixes: tag (if there's one).
>
>>> A disabled PWM is not the same as "set to 0%". If the PWM is disabled,
>>> this could also mean that its output pin is tristated for example.
> How do we know if it's 0% or tri-stated (and what's the behavior if
> it's tri-stated)?

We don't know, that's the point I'm trying to make. If the PWM is=20
disabled, likely its clock is also turned off, and the actual state of=20
the output is not known. Depending on hardware, it could be high, low,=20
tristated, pulled up/down, ...

What may happen now is:

- The PWM is set at 50% and disabled.

- This function returns "0%" as being the current level during probe of=20
the supply.

- The core wants it to be at 0%, so it doesn't change the setting and=20
enables the PWM.

- The PWM now runs at 50% and the core thinks it's at 0%.


What happens in my case:

- This function returns 0% because the PWM is still disabled

- Core wants it to be 50%, so it calls set_voltage() which sets the PWM=20
but doesn't enable it yet

- Core calls this function again and (still) gets 0% as being the setting.

- This goes on until the supply (and hence the PWM) is enabled.


What the callers expect is that this function returns the value that=20
would be set if the PWM were enabled.


>>> If the PWM range is limited to something else than 0..100% this causes =
the
>>> probe function to fail with messages like:
>>>   dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>>>   pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to regi=
ster regulator pwm-regulator
>>>   pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed=
 with error -131
> What board are you testing with? I'd like to see the .dts to get a
> better understanding of where your board differs from mine.
> I think Uwe (PWM maintainer) also previously mentioned that there's no
> defined behavior for disabling a PWM and then reading it's state
> again. I'll see if I can find his explanation and whether I can come
> up with a patch that may help here.

Here's the DTS fragment for my power supply. You can trigger the=20
behaviour with "pwm-dutycycle-range":

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsp7_supply_pwm: dsp7-supply-pwm=
 {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "pw=
m-regulator";
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwms =3D <&pwm 1 5=
0000 0>; /* Period of 50000ns means=20
20kHz */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator-name =3D=
 "dsp7-pwm";
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* VCOM =3D 3.9V +=
 0.9V * duty_cycle. */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator-min-micr=
ovolt =3D <3900000>;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator-max-micr=
ovolt =3D <4800000>;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm-dutycycle-unit=
 =3D <100>;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm-dutycycle-rang=
e =3D <50 100>; /* Must be >=3D 4.35V */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm-supply =3D <&d=
sp7_supply>;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };

>>> The reason is that regulator_register() calls get_voltage(). The PWM is
>>> disabled at this point, and then the validity check triggers.
>>>
>>> Anything that calls get_voltage() while the PWM is disabled would get a=
n
>>> -ENOTRECOVERABLE return value for a pwm-regulator that doesn't allow 0%=
.
> Why is the revert from your patch 2/2 not enough (it gets rid of
> -ENOTRECOVERABLE)?

This also triggers that. It will get rid of ENOTRECOVERABLE but it still=20
may cause the PWM to be set to incorrect values.

> The problem with this specific revert (your patch 1/2) is that (from
> memory) it will break these boards:
> - arch/arm/boot/dts/amlogic/meson8b-ec100.dts
> - arch/arm/boot/dts/amlogic/meson8b-mxq.dts
> - arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
> - arch/arm/boot/dts/amlogic/meson8m2-wetek-core.dts

I honestly don't see how...


>
> Best regards,
> Martin


--=20
Mike Looijmans



