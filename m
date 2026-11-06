Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973418;
	b=xz9CREyv02hzvS+ZHFwKWtLPaZlKofMu84pFtn7rM0/1Vsi+Ct/2zCHWA/pCPDJnxEBc
	 lL4V6JI/DqzZApjUNsQhNFzA39+Xr4yzBsVvvvxEq+xDNg8lX8rJZic2SjMGlzSqouS0p
	 5yjk8AmA+rT66ErDhvE1JFs4hgMcg5n9MCepEf4INKoSniy679OdxgAEP4GZFln7QLg3V
	 Ky4EsC0XIWv+ZNt38DIsY7BGHBINvOe4iNocAfKU/q0GOfAJ0CCEaeTzRpNOLuQBIQ/0U
	 9MwKxT0gLp6RT00Mhy7x5yP1/480jpIopyqUJbaC0Fm3Y5cgTCMAUSrek2WAEP1Ci9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973418;
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
	bh=VLuPZOW9c2Mc2yXbqllDGgTjfT2TTzTJ82y3FMtzR7A=;
	b=lc3ef7/IUIeTUSiI1x61WMgigWNtFfVGLK2A38rhzaG+5XsV3Hq9utq/vrHftuyiERne
	 Vel1Irp9R8lN+gTRXQNMLTH6LNZB3Dv/lCljU/R7qvn3fajjM8NkO9OdjCX4IEiG5kd3x
	 iGDqUVpoMgqexY8KyTY5mATTvbnTsVrh5rnwDh8+qRxLLgA16PLyzfyqrdqd2X52t5lrS
	 H2iL8U45WFVbywispSbC8JCfTq8e09VT+QSioJ5Mq5UB4xIJmT4oDTezgZq1vk/YMnGeE
	 GWSUX7ayO35Ume0vpIjIw2xe5IvlYg0QhsmUc+cPgTpAYUIVWYIabgBkceRZ2LEaqGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=topic.nl;
	spf=pass smtp.mailfrom=topic.nl;
	dkim=pass header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=dxG6qZES;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.118
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023118.outbound.protection.outlook.com [40.107.159.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92E606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A92E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=topic.nl header.i=@topic.nl header.a=rsa-sha256 header.s=selector2 header.b=dxG6qZES
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwxMHxABI1mn86yg9OIYvsoU07MUMtfyJbh49MujYoYrRNmK8+TWdHIAHM8LIVCSXOiEyl5g8g+5NrmF9SX9qTtj1348r44QGNKjFwgi99ZGtQ9Gea6UfwS4w5VzXz5fbkRGsMA1t/XKDsdxPz3IM5+uLrAVVQUco/QsSf8Avvw2eeCIIw4/lOlC+xQY9DJm87RoMDIuh/dWFuIQG41wysN1CcQqBg8cgNK/dCxFRdymLW66R0ca74c7Hbpt3eJjIFgWTLN36H0I+vN50+SFCGBWfOHuRMqlsmyf8/l0M6Rpx1WvtMUAxTxyxMo/2M5PJZglBOoSahpU8LrkER3S+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLuPZOW9c2Mc2yXbqllDGgTjfT2TTzTJ82y3FMtzR7A=;
 b=y6vDDfHQvp8I3+x2luTZ29lysTS1gcWpfBlLBNYAWrFjNLWj2YOHdpcdj/sFcz3UAetsG/KLHCKpCIw4afCb8SsbdaX2nwTCGnbHaPJkOEtoA41QmAb+IOQrs6cX/fiUDAyvoAFyAMG4LqCkxaxzFcJe7Tc5M0lRSr+COwzpg8ilcHJNXpzaT86dpCcLk9EmGomPNMMpNc/PPZSM/M+awTWcaBtjaIPWCNQBBgxi5srlm7jt/Z4K0dTh30DC/BK4eBH8C9cRXIwxmgEb7TIorsl/2Xu5QAziVJwejZ17crtD1e4/Kdt2Uv6AkxjDZSXlIMoRlUDvlkpZ6gMG80JSrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLuPZOW9c2Mc2yXbqllDGgTjfT2TTzTJ82y3FMtzR7A=;
 b=dxG6qZESLOuxkVD9bZbMqgl8+glzwiYw0OwnyskDiyS+lqpMX4eqSRUPzTgRFR6oQy4/agdMw8UZ1PewH1o16wXKWcKHhj6pQUwJG3DuIn4eYuLIDAK/liD9TtMvZXGmP+Rv0c1nNZzhxLbx2GyWE7e/gOpWEo486Mn6fOtmp3PJ6nL+rN69Dxvj5XkOEmFBsy2IN6V5wB9WO8a7kGxsZ7en/ZGn/HsVutVHnZmYvix/LEotKrczfIweKD7lPMyRABj848s9Sp8S3HrdcVJD7ewd/OYTYbjzxOqnY3Ms9rC7p5PEshb5KSzBlXJrZ7x2rMoXWP1FYsPXiWi5zen1sA==
Received: from AS9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:20b:462::32)
 by BR0PR04MB649822.eurprd04.prod.outlook.com (2603:10a6:2c8:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:56:52 +0000
Received: from AMS1EPF0000009A.eurprd02.prod.outlook.com
 (2603:10a6:20b:462:cafe::52) by AS9PR06CA0024.outlook.office365.com
 (2603:10a6:20b:462::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 13:56:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.93.157.195) smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS1EPF0000009A.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:56:52 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.51) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 06 Nov 2026 13:56:52 +0000
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by AS8PR04MB7750.eurprd04.prod.outlook.com
 (2603:10a6:20b:2aa::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:56:50 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 13:56:49 +0000
Message-ID: <b2f4b33f-e6cf-4d45-b0ed-59aa48b65003@topic.nl>
Date: Fri, 6 Nov 2026 14:56:48 +0100
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/2] regulator: pwm-regulator: Revert "Calculate the
 output voltage for disabled PWMs"
To: Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.44efb263-5265-4fae-9cff-e8eaefbc0afd@emailsignatures365.codetwo.com>
 <20261106130010.340950-1-mike.looijmans@topic.nl>
 <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <1ec088e2-f588-4acf-87e6-0dbf719784bc@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0011.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::14) To VI0PR04MB12030.eurprd04.prod.outlook.com
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
	VI0PR04MB12030:EE_|AS8PR04MB7750:EE_|AMS1EPF0000009A:EE_|BR0PR04MB649822:EE_
X-MS-Office365-Filtering-Correlation-Id: f8053516-01b0-4be1-136f-08df3c0dcfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|22082099003|18002099003|6133799003|10067099003|3023799007|4143699003|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|56012099006|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 ag5E60zkMBSRXiM5OQ63KEtXFxJqVyYwfEvj1C1yA9IUZmrDC13vKpixKGLIAstMQFlnPRDzMxTewOFkWVTR8NVpiKV3SGGD4AVpRLQf/o6yWgAk4aulenzzJP3x41nRSecnB83rFb2fnuAo7PN5KvI5Ik40ZdivC9qkgsprU1TDThIGjllTNUuU78ZshIl3CKaLlWClWJGx0ZmYlk4vOgLwpBN4PtK9J0GAQbEVHe9m1y//grACu5Y4Y3OQ+yI602Xw/lCdWzW+5paybr+quL/+kpyhUzB202qrzMzWiCMA4ISSp+HOKqJP8pd2w+hSC+2kAc3BWW0dIkiT8PyvWWlaZ3duOCn1e5U9s4xI+KEgqO942lukkG/Y+YZg6vMkVW4f/+2K/QzL36X4Gdh7c89/RPw10GnsC/b5PAGrwH5i1m6/7/7ZOo2r/NnHBi+wF+/yL4QnsXK0oEH8/vMTvI0NFGnvIVzHnuiY1hFCCRkFeV69L0Lcl+R6pfzaWwn+MgHPRF7ihGWYaCjPuJ9JQEBix+yh52a/jnJWajZR6T2uics+PHET5pDpsbDlyHTD2Ddie3cFpFypCTCCObiL6tt2TIwkmQcthx6HL9A1wv81WbVap1l8VJqoMs5Y/X9Ta95YCq8wZDZuCrER2vBj8Uw8egXuC6e0KLdkR+qe2Wvbm1Ii/AAo72SehjVakyC9jBUSPqRyOs0wG+rKN4Tf0z2snkCEJTs7x5dCcVc0as4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(4143699003)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(56012099006)(261009223027099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: fYxmoLhN5r6DmbvS+3q2a6PW7GRYSJchvRCFKuRNZxHybI2O6Sgv6r+MuglytxM/ol2OZXvXFAQgyMlRt1QjfFCSCwolWQO0OwthBAVET4cux/N+ZuDhbJfMp/QnkuWE44jk0lCcx4UIc3iNeYrXAJ9lELKI+ypYu/NqFfvA+XpJouAZKMo8z5sROzy9wHYNk0ohwVlKsvj/WtARAJDItT6KRrpECyWfJzdQ5snNPjvXIONu5qHTDukwDTvKXZN/J0w87lm8FGEJuKGvQVxfOAL7OJ3m26dvSfbYqH9EsR4s3ckdlfdZv76dCKrnCY3dhQRs7qBlywxxYpq1vRSWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7750
X-CodeTwo-MessageID: dbe273d7-a542-4e07-a61b-ecc8a83f8cec.20261106135652@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000009A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a26d210-8f56-498b-2069-08df3c0dce01
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700016|35042699022|376014|23010399003|1800799024|22082099003|18002099003|6133799003|10067099003|3023799007|4143699003|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	cWFrvJCnR8QDKhTeuUN640+ZCFgV6DI5QYBBXxECGRuwsn5LtWD5PZFcT4/4Tt3k1bKhCJhk0ooFsjB7LSgzMLeIhuYa6xPyvbVoy3toTsnQyT+tXjY/LGri55nc4hWmdvTjvPcJnRScFMnp4Wd4yZ+JV+uRjRS+84nAFrotL6+ty033tDZ4/uKRbgS9UqTvR5BaS1OjtoNc/bsu/TAAUH5232OgPhZiLM9yI1Ukx/0O6etBNatXTY83DkF8iZVZaaJw1d4zO/JXOc2CqWKBRQBcsLZNwKNEoIUj0tPY8JWYKTou/VrSMxZ3Bpob404uGqiGdAwvRz4WuOGE9PG+9Qdb/TZ6tsSqacR0yISW3dEc+Q2WT2qt/Uj4QA2HHsmEpxN/TgN7v/CLb5T8L1lGNMMHtsT7bc8aNLD7ctrOMxzWMWSs8pxVQyt25pnPDuQetkKHTJEhd1u7rlveQ0fWzp7Bt0E0HN5Ankkxo1TLKp9tOdEdoVaUB5zGEYrWLh6MT0EyG9OZaeHMrziV8i/WkO8Zj5A1IZD/d/e4WLE1IyDTcUnjDFgEeSoMCOY0yC+k30Zo0vuEqmzjj93x6UVFtTkUeAOcc80m4wF56vvL8+KJTWmgoZwHGRTCGbPdMs5tTZvws+vJYe3ztNIE4PpDLlHoYGKySDX1sNrrDK6utntwWPzX2hAFfv5yQqCVkGutr+krqdLrtLbPCxqHyTZxDA==
X-Forefront-Antispam-Report:
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700016)(35042699022)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(4143699003)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	25lsZmYU+lQyhtIeI7il1FVael/65lGz3p9M1mEvPXJg3JYHJSNs6s32aK3AFzK6U0BvDrcJoo7DA3XMGWlgL9DZ854Z7YxRDwoLHqGMCnXr41VXB03/IP27V6wBiwbG/VWZVZliO1nW5qeXbVfQG5ScRHV6Ly9WeRBF6aIY5mulAEk6s58YaeefE6DjfJUDhRycg/z5jDNqMtkOngWKXwI968ptQ/aSQjEcc4UrAhluFQf84KC0k+W2xug71NF5is+VhOn9KzjDqa0UplA/muSL5xr8Rw8E/zWItrUHjWdvQ2YkI6odtYrtLdVBJZFKdqiKtKw2fber+6uWJGF3Z9BVsbkAPRWVcr00J43nzh+ss5L7liGOh7oi/6lKoqI4hX5+/w0GxvIFUnxGJtDb2aowt5+mzCLL2NAp9h9duKpVpXFSlwte0izhMEtNpIAQ
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:56:52.6597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8053516-01b0-4be1-136f-08df3c0dcfb2
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000009A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB649822

On 06-11-2026 14:36, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 01:59:55PM +0100, Mike Looijmans wrote:
>> This reverts commit 6a7d11efd691 ("regulator: pwm-regulator: Calculate t=
he
>> output voltage for disabled PWMs")
> Adding Martin who wrote that patch - please CC people if you're directly
> updating their patches.

Sorry, that wasn't intentional. I was just used to get_maintainer.pl and=20
patman "doing the right thing" that I didn't consider checking that. I=20
promise to do better next time.


>
>> A disabled PWM is not the same as "set to 0%". If the PWM is disabled,
>> this could also mean that its output pin is tristated for example.
>>
>> If the PWM range is limited to something else than 0..100% this causes t=
he
>> probe function to fail with messages like:
>>   dsp7-pwm: failed to get the current voltage: -ENOTRECOVERABLE
>>   pwm-regulator dsp7-supply-pwm: error -ENOTRECOVERABLE: Failed to regis=
ter regulator pwm-regulator
>>   pwm-regulator dsp7-supply-pwm: probe with driver pwm-regulator failed =
with error -131
>>
>> The reason is that regulator_register() calls get_voltage(). The PWM is
>> disabled at this point, and then the validity check triggers.
>>
>> Anything that calls get_voltage() while the PWM is disabled would get an
>> -ENOTRECOVERABLE return value for a pwm-regulator that doesn't allow 0%.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>>   drivers/regulator/pwm-regulator.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-r=
egulator.c
>> index 7434b6b22d325..f50530c77d92f 100644
>> --- a/drivers/regulator/pwm-regulator.c
>> +++ b/drivers/regulator/pwm-regulator.c
>> @@ -157,13 +157,6 @@ static int pwm_regulator_get_voltage(struct regulat=
or_dev *rdev)
>>  =20
>>   	pwm_get_state(drvdata->pwm, &pstate);
>>  =20
>> -	if (!pstate.enabled) {
>> -		if (pstate.polarity =3D=3D PWM_POLARITY_INVERSED)
>> -			pstate.duty_cycle =3D pstate.period;
>> -		else
>> -			pstate.duty_cycle =3D 0;
>> -	}
>> -
>>   	voltage =3D pwm_get_relative_duty_cycle(&pstate, duty_unit);
>>   	if (voltage < min(max_uV_duty, min_uV_duty) ||
>>   	    voltage > max(max_uV_duty, min_uV_duty))
>> ---
>> base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
>> branch: linux-master-pwm-regulator
>>
>> --=20
>> 2.43.0
>>
>>

--=20
Mike Looijmans



