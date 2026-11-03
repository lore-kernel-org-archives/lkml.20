Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.104.111.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709241;
	b=zRf7bFZYEtQblwMOyFzp+AXJjNSA7LATXON101PJanaJ0G4JVMgIBlr5oLd7N7TH9GeX
	 9mz2OgRjY0QYCHB+m7PbrN3GJGNvM7dfkoegdddHk1a4OdkKjvh0VjpINoYF0J3boOaaz
	 ICMTUiJxKq+Mowxpq00ddzXVKvNGPZOuDujx4aKJysB4DsPZs06ptwZuXstxAWbBjz/Nn
	 8yerjy0jncQkVSgNEwWuC/g80SzKTiXUh2kHcl6jgN+ELuZdQQEofWufh2G8kYavI+tTl
	 ZQuBtaSnVZkcvQ+iao8UEvcGurlWYJMLvVU3p8VhnpqsFfXHn0l6TacOBI4wxz+n5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709241;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=3YbZfMNOvwxSAdlNsq/wcOSIe8AOLfjmneeCjbh9K/Q=;
	b=NtiknencajE8g1HuG3Wxw+I7Cs8pOp09lR1HAEabrJt/e68I4NRvnQ2RD3D5eCtXPR7r
	 ffHkwdUe/V3yxsNp8suZD4fEJozfO8nkEI9XLsrN5N+TAfJ1FNrZu7mm4jRS22GWWx2+g
	 HgS6RtMKsjYJeJgnKBlPIUEV+sgZKmvfzuLna9kyWzufi9VIhHQv1P2v4KEFhcO+6lzNr
	 1T98BFTSVseTHHiMfesCzL8vji5MBl7NwfsFZ4E1CuBckJIBjp+6UbNRFmrwKUrAEmW3k
	 ed2tUXUfu+i+y2cpdJGRl1y95ON8uRYErpaCqwUTcHAQqvX9V6KSw94HeS7M/+fdxhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toradex.com;
	spf=pass smtp.mailfrom=toradex.com;
	dkim=pass header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=CrYmIvCV;
	arc=none smtp.remote-ip=194.104.111.113
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C27606D823
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C27606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=toradex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toradex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=toradex.com header.i=@toradex.com header.a=rsa-sha256 header.s=toradex-com header.b=CrYmIvCV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1793709233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3YbZfMNOvwxSAdlNsq/wcOSIe8AOLfjmneeCjbh9K/Q=;
	b=CrYmIvCV6SBAlBDWPU8ls4eVe8IXiV1LWI7FewkaFsFjv5encCGZoyHKKPxRB8EOUy7VCd
	eck5eSt3fSI+dT9ycFq0sA77DQ3nmczrvc6zdKjW/juZwxvrvingdo2IcSaBkxnKox5WDs
	Ga/zwc6g7kDc1nUz21ERA/v9g+jeON0=
Received: from ZR1P278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazon11022079.outbound.protection.outlook.com
 [40.107.168.79]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-32-ELaw-RTuPpy8TEYZSlkQ4w-1; Tue, 03 Nov 2026 13:33:44 +0100
X-MC-Unique: ELaw-RTuPpy8TEYZSlkQ4w-1
X-Mimecast-MFC-AGG-ID: ELaw-RTuPpy8TEYZSlkQ4w_1793709223
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZRZP278MB1985.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b7::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Tue, 3 Nov 2026 12:33:40 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 12:33:40 +0000
Date: Tue, 3 Nov 2026 13:33:38 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx95-aquila: Keep DP_PWR
 always enabled
Message-ID: <aunUon2a8W0mcele@francesco-nb>
References: <20261103105323.2394012-1-francesco@dolcini.it>
 <aunOT21BZmGkJQ25@vm>
In-Reply-To: <aunOT21BZmGkJQ25@vm>
X-ClientProxiedBy: FR0P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::8) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZRZP278MB1985:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e62de9-7550-4cee-c70f-08df39a6b0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|261026140227099003|4143699003|56012099006|261028144727099003|261022105027099003|261026121527099003|10067099003|18002099003|22082099003
X-Microsoft-Antispam-Message-Info: FxA0w88DktgXbNoFJO3daV0O2Vm/MaM4+sa5EincuOqHfdtXm7YXfbYteYVwg0gH2GqOIrfxWAtwEAZXH8uvb8gb36+oHoMdZFqW9rUzQtTdJheRu0NFLe+k7eOZy7RKFryRSTjFJitsppG9eH1/n1Qa/3oX0B0muXmQTb5Sn7qkB9SsFhXT+LnhxvdZfJjLd+1yfmbjgteeK32dE04v+dXxwUrytVF3Qdg3sJnYGHELc9vp1DjWZSt5skSzmeaJ2ZiCU79cP8CvkC4J54wRtEpp4+DWj3EZkP0E1+lE27eydh8qo6c13DUc4L1rZZcNh/z9KxpBzwucpo8wJ0LAe1jQSCgbViYidUReXsSEZauyQV3zg5TcE9Q1QfLsUfmdUEJX+iAFPxWcQlp6J5rWXyN68h2INh9QKFjDKA/InjFCZ0kbtDV15IB6TE2j3Sfgrj+Fio6YgtA0I16l7nibOntJaUso35ooMpeZxuvXgLhPhh5yGlrCi5vkV+R+pj0+9vfco8xJXApBf+FU42dCniknqCvQwlLshwnnX5ULUvM8RL7WmlThG6Q8eUaR3aGUMGTNhPQF81bCn/7rJhRnrnCkBQ4B/RuMdLIUqFr1nR1Se6JX4IvbrmfZ82srKXnJfaJSbQpUJpswNb9JlU9SUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(261026140227099003)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B4UJXakZ5vz8Zjs2LMVITApxCgYm3GSrkTjSmDhE8IcjB1DeKsEc3uimIOLd?=
 =?us-ascii?Q?rb5yM7VCmi2NXOvp4vaZuUr5BBB3T2S2ssA8i75PFcQb+VRAqosfNy/cK5Ss?=
 =?us-ascii?Q?RXnL8zkoHGYLuEp+cQrMU5uICo0nVNXBLF6ExCmhC0jlwusRO0S6V2p4NqRC?=
 =?us-ascii?Q?o8ynneYwrc+l/2Su8itMP2JNj5I/JRTyN1TuPeNHKNH7ZMGXW7wcgd+5f83M?=
 =?us-ascii?Q?oDAXVBVt0Q985ptPz0WNZYcUzqRsPm12H2o/wSFplq0Oz92CyDAdgb50rcJS?=
 =?us-ascii?Q?qgOxmZRkuhx0Ma2h82O7BDV7sO85HPoCiet5VzNxxLfBo2hOxLjaF6TJOsBp?=
 =?us-ascii?Q?Aadik5TL3QAqABvKQB52XwAk000MFlPkHsnhxcSMXNsaf/L8Sqfdn7IjsExU?=
 =?us-ascii?Q?VyAJ9S1NV16WA2evnmKBiunOVtgStXFU75jftVzSvHwR1lHlJlOLwo+eUYnZ?=
 =?us-ascii?Q?UwZXP/fUVQL7Y0SWmMaPdWiZRRsrNAcMGL6oG6VkuF3reX6ngOXZkAZI+svY?=
 =?us-ascii?Q?S6lh6UaHKh0PHadxril8OSDCYvN2WGIpEiqMPcwcLuKR3WbncRE3hd6t19/C?=
 =?us-ascii?Q?eHEmDJHW1eFnVr470baf4wvh6aq6+KWYGVrDslD5hG3X2NsUhqiKWIX30xqv?=
 =?us-ascii?Q?0hf/gGOUqHrtXGCYmI1ZXNWQ0tvKhXWUO+/93Toitdy3R1GdqEfKGDaQFy5Y?=
 =?us-ascii?Q?4fNx+McwpS8b6dOFlfiDXeLqTTYoVJ3BiAkcteyYiJshOWESFNHd8QM2Pr5x?=
 =?us-ascii?Q?ohfEcEjbXKrD71ndtvpxzuENgqai4cP4xMyS0OnG8eS9QRtEwyWg7IsjHIT8?=
 =?us-ascii?Q?7kzPxYgHIaChdobJy4ZfuE0NKirVTT/0CpJ4duvqBFgKNwGdSxpw/1Mw5v/K?=
 =?us-ascii?Q?J0oh4GAQmwtGtX9jIOZjVh3oC6nnGF7LPA5RBZcK825cDf9t4ZOl11HhS+ss?=
 =?us-ascii?Q?zt8b7Md0yuTyaxsOGR3CmNKznDwRPdZDt8vA1bvfREna1xIq/UaWfNHYPj7J?=
 =?us-ascii?Q?HInqC1mZl4WsppWLYLJ93IsrrEb8K9i5Kc5Bg+KH4iCXKI2A31WdbOqjSpQ/?=
 =?us-ascii?Q?1qS6a0qG9Rtdx1pez7HeXx/xXVtm6+PdwabsGBZK/5gFKGkQvCnD1aHB1JWB?=
 =?us-ascii?Q?FGTTXPsQRgs0t+zXxtvU9TlsSzkKloACYobQFGLfF4/DGB3faL5U2O1YKLF5?=
 =?us-ascii?Q?j+J/1zXUPmj6qxqhd4mqv+X71mv4inRjFwUJKFhoZCyb+S+Iowcf6hJeIn2k?=
 =?us-ascii?Q?xVkYCC5dXQR+WAEGYiqafW4RLHco3X8UW9cyG7505CA71y/8/TR4jEU9gNcI?=
 =?us-ascii?Q?nosLv9nXRmpU/XpW4cDlOGahT+0eeptDxd8joAsvS5Njku0W67iVeObaiEPP?=
 =?us-ascii?Q?sq77uKFyfr61gZzhS7p/KMM1YmT8XmSZT3Y2foeREEcKh/AzTsw6aynEwCMj?=
 =?us-ascii?Q?UrNREPwpLqllIx/y7uNSG+QJhLPOmqgWtXWTK+3ck8ZtAmSLfW+UNfFZ1v2L?=
 =?us-ascii?Q?Y25w9HNVWPphtWkNqo7GUIJiTB1t/DmZt7paGF4g84WxXtagEKJxxUtgCTvq?=
 =?us-ascii?Q?eHghKqkAceFddlKauZ67/VWgZwD0brqwTslpwQfxUc2cVloo0K0KbPdI+vmn?=
 =?us-ascii?Q?fCFEaXc/4rtvwpOn5lkYG1eIrDiwQ77FOTEJIpNNY79szEtyRcOBZn9aAowS?=
 =?us-ascii?Q?ZMa4AHZN7hvO44lL4y2NwSI/PP1h5NhE3XfBbVbpOqz5vKSQlRti8AeWS8co?=
 =?us-ascii?Q?G4KRRnCAgXwa8xKwWugHvBZ+CONXTcA=3D?=
X-Exchange-RoutingPolicyChecked: vFyuicRLWi8dCq+Uy5GQtdsJqu95zPzA1KSSQIlduXkUlDIDpGJODehtwIq7YW2naJISFdWrKXCHqSMWWe4Z/xUSYn07HOWqIJD+Ua36pFxAUjoWp5+/O03FTjVnoiD89T1qADX4pnU72ofwpLL51BQOltNemyCxCtrrM4HvZkMLWu+HtxRjk+zTPYflAY87EaNn3+j4nKdDOMMiUxO7ffM7BQbf40sx9fXWgmdJOei+YftjjiDgQE3siPKEHziPX3/POgImCNVzEWazjxigBd9kGPHB551WYw2N9kysQeZnzWHSqHVGhrlkQ/d+ydTqXaHECgajV9HCiifOf7XEFQ==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e62de9-7550-4cee-c70f-08df39a6b0e7
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:33:40.6453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7IvbJGMFpyO3Y3YFW3WVm1VYpyIzjwN8HdrZ5tLt1/qwokzwcJcqQ3uTI7V/HG5Jra+1cFCjedrS4YUlXokShFQJQuQCNUfl0/qg61z374=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRZP278MB1985
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dqJZGcSjK82OcdoH94SxzF6sGS7LhBHeZpkc4n5zR5Y_1793709223
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 02:25:02PM +0200, Laurentiu Palcu wrote:
> Hi Francesco,
>=20
> On Tue, Nov 03, 2026 at 11:53:14AM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >=20
> > DP_PWR on the DisplayPort connector powers active DP cables and
> > adapters, which do not work without it. Keep it always enabled, and mar=
k
> > it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
>=20
> I believe this "mark it boot-on so that the firmware, e.g. U-Boot,
> enables it at boot" sentence is a bit misleading. AFAIK, u-boot does not

It's not.

We use OF_UPSTREAM, this is the single DT file that both U-Boot and
Linux (and maybe other projects) use.

Francesco

