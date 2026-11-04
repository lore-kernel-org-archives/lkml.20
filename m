Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793758465;
	b=S/dMNzNjAHRJdpGncaNTMFcdmcLQgJU0hHVK3sE1RjzaEiBl4/CmTMOGpayoB58UY/Ln
	 KExUe0cXDAPdsyPm9GjgVU+WoGOXlq6vUG57ylQ5TOKw7xNzsrO82bosz2Bx3aJQccmQR
	 kO3Tmuv+quWKQGMsvxL1aCc/tfSGKyEE+F2P2b/Qq5X1wi5r5rehmjxxFWA9TuRhyxuMs
	 o2wofqPHn8H5ed4ABjBfiYxnXZQ1WFDjZly0Yn0tfweY6/Q411thzp/ErxA/BfJc9q62A
	 j3gSIw5sJrpqvwQWSZd9tPQO0EzAE9+TKTn0qOJcdMbVzh+OspD+dwm1Ls8VkM6TYnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758465;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zPm9WRkLS0ckb4k4kdw3voxttGC9csuQBLRbyx1JOKc=;
	b=3ICPDCbhq8AIM+lfTVcoq9rDG0gFoyhYBxJNvPNZsdI2L+7GOlvB1or80KYKi2jXkztP
	 dBLqtnBMBTPKVTxZwSBFhJ02U0QdLPLSXSOoEixKL0yp9f9Kq5VyuXbHz7ag0oXUouJzU
	 1bUjv+9Wa5VWktbmQH9tlwxXEIRIHFinkHVnaDj364grPEHK3ZofvoKaOcUz54azyFJM8
	 i0eborhfbHjri8p5hMusP/yxRGOGWzdze4YMkDaIJ129nRbMSEtfQvhrK0wZhDSHz5k+d
	 26CHgZcbMn10rR4SQTxi0ZnaXt2WGn80RLV+YT6xRAm2IgvQ6a4W5GopGcmjK3wpOFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Efyue5Bm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.58
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F710606A334;
	Wed,  4 Nov 2026 02:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F710606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Efyue5Bm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXO9ia4paCHVX+8Kxq8bam0AmEyXr9u4YIIu2rYR1neLZey8UFgdfvYTk3whWAfZP9j92I3GslLsv94WKHnDBs2Ns6QcglG6rEG2VI0mMvvLEugqJ75BgxR2Lh0Cq2IQLZFsOupk13nnm+Or0kzcaKfXh0o8OOSj1FEgfEOI2VDeQ4WIkpy8U2f6u3UidQimcR0d5PJg3XNZHSqXeF9rK22uK0VdmoeuW7jmFfnGw9vQjHP3cXqKB5d59ewCueb+XekeD489eRDWmmCQmafSYSWMEjac3TR85xGMbXSAM9tOj5NhoWXuI7J25VrJ/8fECKKCFCPg04lQ5yOLCWOCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPm9WRkLS0ckb4k4kdw3voxttGC9csuQBLRbyx1JOKc=;
 b=qxMBmJkzV1KrkeDvKXEBohQfxIiP43f8ApT1FQ04M5tf2sGN5V2ykpYTvx8ktQr/DsHORBCelsl2WHBKRtsHMawRHlsuLwE0dMX/JS3kf5mvOb0k6mKJ29xOdR7JGx2FJQ7Hil96zKbGlJqFTpcXX6EluSixNbv4kC+qOg5VFr46dd3yKgF9qpFgdH5bqVeRvub3NnCIGBTsmA1DpEhUpzsYnFQUail2DZUgn3Xnj2n+NMCCMJaOu49LnRrk7023IlnixPmbJbOjJApN8HzGzhgaUYU3I2avPOtTEf8Ipib6xl+qNNpXglhrDRUZ5+Aw0iYd38PsaknVcyBsOwwvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPm9WRkLS0ckb4k4kdw3voxttGC9csuQBLRbyx1JOKc=;
 b=Efyue5BmINU4wu9e5gwx1yfyrMksXha2f2kq3HmuglpqgRJCQWW4J9fn4MBe/DFTPqJpZvA1UYGTLlt1RXnuUmVkKgpeXhqCIHdS78giH8Tw1pRs8uNO8VB4KRueYGIrehfOvXQWSMqYyb+uAkHYhva6UXys1C83wxaZ7QaYi7VGh7u4sjXb0qAcX5fbu/G/hIgpQruS9cu5mzAlJyWj4MeJJ3QwvAF/vIhVR2TDGJA4PR+BSYDdSBiEe4myNO5Z/Khn95xvdVJL/hgNKZLSxVkdzu+m0dnsyv4H6uejsvjOSApyOVe/hQQv1GwcZLYAEUQhYSXyjsoFaH4mVoUDNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by BR0PR04MB755739.eurprd04.prod.outlook.com (2603:10a6:2c8:5c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 02:14:18 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 02:14:17 +0000
Message-ID: <5815460c-f8f7-48d6-a0f2-3ed56e20bba7@oss.nxp.com>
Date: Wed, 4 Nov 2026 10:13:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
To: Frank Li <Frank.li@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
 <20261103070433.2307145-2-chancel.liu@oss.nxp.com>
 <aun9Hj1Ypc_xSYtL@SMW015318>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <aun9Hj1Ypc_xSYtL@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:295::17) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|BR0PR04MB755739:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce93f98-ae3c-4de7-8272-08df3a195410
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|7416014|376014|10067099003|22082099003|18002099003|13003099007|3023799007|56012099006|11063799006|4143699003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	1VQVuwgd7yFyxitA1lDaiqNvfYhpDemEgH3lC/Q6oDBznzBFuyqIEjVxa7rMB76RngpPN6NTu4y7ImSZyzKFD55S4Nf5bOWEsEuEXycw1RCPy231s9YMkJ/bO680EM5jgB5Hsd76Rhlwt1XQL9xSijoL2Wg0XWbm/936VKseGEaAivwwjRn8hgQYIMJVfbDofqOrzGtMKAk5xUC4ez7+mCiUKYcDfcT+tg3tDfKhitmIEI2jIMu5OuPQnVfZrzWTGGELakUiEj2hQLwrT5PTGiqn7KmeIHWdpy8hCcQyKYZYj9mfnFfwLd/HetyxP0JI632D//BIQMMTY5uRg53NyYOvmvPIyg22Igsk2yhZYDdXNYUasl+MRcvLrUaVFqR78ldydi+TTPulLUX4O8vEq+t1qETTArz07LwezQBy7LObTOuEdsm33XGwILb9hhcgayx93KA/SOA84gALaoUMyfJWnDQn/pQZ0v235rT+R0DqmUQ9Se9QY/FrbiuCdxVnOyRe4AdWx3ICTVz9s40JDaKTqI9DKL4hV49Hys8JSIgSUXZOHlwD5UnNm2xF17PiPHdvKJBcBK8OcD465vVCBm3j5rlwMkPrLMHCAd9YszE+yrJBe8blUVwKEZfOrpyo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(7416014)(376014)(10067099003)(22082099003)(18002099003)(13003099007)(3023799007)(56012099006)(11063799006)(4143699003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1RyQzdhK2NJWjJ0aEhhZklkcC9HZ0JDN1JHcVR3VEdodVAwVXhaUWF2S0V3?=
 =?utf-8?B?elBDbjJJSG45dDB5anovWVByM1RYSlVpTEhsR3pGZ3JCbFlqWVRRR0pzQ3Y1?=
 =?utf-8?B?T1RTeERxQ09QbkRtMjZBaEhiUDgrSkdPNzhxNXNSdlpjY3BERGZtVW9pbHVU?=
 =?utf-8?B?c2cvL2JTUTBTVFRWL29lMHRMbjJyN09sV2NGMzg3TlkwSHN5aE5mUVN3UndB?=
 =?utf-8?B?cjc5d2lIb3o2RWROdUhCSFkvbXNiMTdPQkU5dTlpZFZmd3RpWVlYdmZUaWJS?=
 =?utf-8?B?a2lBVkxCZnBSZkFIVGlLOTJ4azR1cmtFUUdFajAyQnkzSlAvRUtMMVJJTWR0?=
 =?utf-8?B?bEZsd2tVRHFPNHB0OHZ3ZXVXaTRlNWhyTGVpcVJ1ZWNwN1pZdWVOODViTlY0?=
 =?utf-8?B?WlVkNzlKQkVXRmNCM1hQT1pPbjJ4YW0za1UyYWhUOXZkN2lCZGNrRmFSTG9W?=
 =?utf-8?B?cjZuRlhRVWRYbWhJNTNrQlJxQXpEdWpCcUhQT1d1Vm4vRndObzFaM0NwcThw?=
 =?utf-8?B?dERsenlsR05ZdlYrbXVSUjdYcml1VTdlRkJzVHBGKzRqaDFxLzVGei9TNjZ0?=
 =?utf-8?B?UUxhdWR5a1NJd1hVanQvdnViUTVIdXV1SU9kbVg4UHZWbVdRdkgreUo3M2w3?=
 =?utf-8?B?TXNIZkFaRjlsQ1NQSWNMVlZJMkRZZWxiamsvZk9FL2xVbTJSanJsQUgyVDEr?=
 =?utf-8?B?R3BCaVg4YkxEczFyay9kNE1QM09mZTRLQ1QxalBxZDQydHJQVnR0aGpxWFRM?=
 =?utf-8?B?UHYvVDV0MityVS9qcTkyd053Y3d0VXE5KzA4T1lnU0UxVTNkRDlpU2I4bFZk?=
 =?utf-8?B?SE9JblhDZDZLcDNFenNQZU16SElVS3YvOGUvaDBLU0FYVjQ0MHc0U1JJSW00?=
 =?utf-8?B?bmJ6YjlzN3hINWVqNUZ4RHRXZitNa1JMVFc2bDdWclh2WmYranBIVUNGOFNu?=
 =?utf-8?B?cWJ3T1g4d0VKM0lQVU9UNXZwUzBsczk1VlkwTlZ1Z004S3ArMGN1ZUNOWEZE?=
 =?utf-8?B?dUtNYlFwTXFHTzc0Q1BIbksyZyt1aU84NEQydlcydEhpSGJTQU9NTU5hSkpq?=
 =?utf-8?B?cnVEUm1rb0VoUmt1ZllpOFNZRkpjZ3pmdktaeGUzenAyM1VhdUlWN0NkNWRI?=
 =?utf-8?B?Y053VjZjaURBNm1Pbms3WEJEUEFGYWxHUXQ2YkpOTjhXZkxkdXlaR21qVEgr?=
 =?utf-8?B?UFVON2ZISXlGOEtMVkgzOW9tMkpGZzVrOE91bGdTd09wWXlURHRJdXZNcEJj?=
 =?utf-8?B?V1pvcXRPQ0VwbFVGMW4zRnhFVElVMEJLT3pmTnlxVTNkN01aSDdwQ24xVmpn?=
 =?utf-8?B?OHBkdjNpYlVFZDZsZmFSbjZJQnBNS3Y0R0EzVDRNRTRPNVpNWjlnR2JFbk9m?=
 =?utf-8?B?cWZiS1pBbVh4aUxDa0o5UzNZeVhheklyNi9LbnRJWi82bjlaOUVOUFBybTVl?=
 =?utf-8?B?RkJRZGg0WC9wV2J4TnFWbEdnWEU0Y1VsTkU4dTZzTnU3amxyMlBnSFJNRzFX?=
 =?utf-8?B?RTE5WFhINitJS3Z3RkhETFFMZURTdHRwN0FLVGNLU0pMSnpjTXk0TXlSYVU5?=
 =?utf-8?B?bGRYcEdkbjkxbDB2UisvcVNncDJiZmV0Q05lcWptMlNaUnUvbEJicnFUTDVs?=
 =?utf-8?B?aGEwN2w2NTcwQTZmYUdQUFdyYmV0QStaT3NWR0VDeFdwV1o4QS9TcWxxU21l?=
 =?utf-8?B?bGp5T1ltVkRVQksrOTk5OENDc005dERzeVNZVUhBUHlCTThvdGJ4YWcrTTc3?=
 =?utf-8?B?Qm14R0MrbFBwcnpuWGN0T1M4d0RadXFaS1J4elE2a3RXVlpId1FOS3Rqb0F2?=
 =?utf-8?B?TFFWUWc0L3RSTUdLVGFERjRvQ3pXWkFCS2dWNTlPS250UUM3dkdFbmE4aCtN?=
 =?utf-8?B?WW1qWk0vSC8wSE9zS0RmQmFwZjBXdVF0TzRWQ0JDMC9POWFlZHpQS3FSQ3lI?=
 =?utf-8?B?anFrZkRVdmYxOTgxNDd4bkRuUXBwd1NYS3JOdFMzZHN5TklFeTZWWkRTQ3da?=
 =?utf-8?B?OTBkZEdVNHZ1eDBETk5qNTE3R0lja05ZQjFKUWRnRlhjRUJ5N2ozYXhLMm00?=
 =?utf-8?B?d3FQUkRNMTlEVjhqZFhDVjZGTkFpMGpIZDRLNndCRkN3WFJ5YlVZUGo3OFdw?=
 =?utf-8?B?WTdYblExQW5VK2NBMmxDTStWZFpQTFhlcEpsT05aUGs3TUl5V2wxZG9qWHd3?=
 =?utf-8?B?UFV3UksrQUtKb1JCdXNzd0N4SHBEUTM3WGtvY0thWmJiYVgwc1VFY05aUjdJ?=
 =?utf-8?B?L245RUs5STlnUS9UQjdBQjJJYlZRZHdTNE9TcHpicElxbkl4aGNjZTJ4c0RL?=
 =?utf-8?B?QmxZWHNyTG45MXhTRmVsb3c2UHhFWEpyV2o5V29XZ2FGNXlLTkJidz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce93f98-ae3c-4de7-8272-08df3a195410
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 02:14:17.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xJzlcSz++vRAFTJ5uamdhGzJeNhvMFjGhuDMOIq+AH53/jFOXAR9Glg+tGfzvPz33DKYw+beWfzZZRyBCUu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB755739

>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - fsl,imx952-evk-aud-io
>> +          - const: fsl,imx95-19x19-evk-aud-io
>> +      - const: fsl,imx95-19x19-evk-aud-io
>> +
>> +  gpio-controller: true
> 
> I remember Rob said needn't gpio-controller if gpio-map exist
>

gpio-controller is really confusing in such nexus node. However if
remove this property, dt_binding_check reports:
linux-next/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml:
properties: 'gpio-controller' is a dependency of '#gpio-cells'
        from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#

Based on Rob's explanation:
https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/
that a controller property and its corresponding map are mutually
exclusive, I think interrupt-controller should be dropped as well.

>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  gpio-map:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  gpio-map-mask:
>> +    items:
>> +      - const: 0xf
>> +      - const: 0x0
>> +
>> +  gpio-map-pass-thru:
>> +    items:
>> +      - const: 0x0
>> +      - const: 0x1
> 
> I think you should pass thru whole u32 0xffffffff in case GPIO add
> new flags in future.
>

I found this was also been clarified by Rob:
https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/
Okay. I will use 0xffffffff to match the GPIO index exactly and to pass
through the entire GPIO flags cell.

>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clock-map:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  '#address-cells':
>> +    const: 0
> 
> There are not child node, why need #address-cells?
>

Otherwise:
Documentation/devicetree/bindings/connector/fsl,aud-io-slot.example.dts:20.19-32.11:
Warning (interrupt_map): /example-0/connector: Missing '#address-cells'
in interrupt-map provider

>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +  interrupt-map:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  interrupt-map-mask:
>> +    items:
>> +      - const: 0xf
>> +      - const: 0x0
>> +
>> +allOf:
>> +  - $ref: /schemas/gpio/gpio-nexus-node.yaml#
>> +  - $ref: /schemas/clock/clock-nexus-node.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - gpio-controller
>> +  - '#gpio-cells'
>> +  - gpio-map
>> +  - gpio-map-mask
>> +  - gpio-map-pass-thru
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    connector {
>> +      compatible = "fsl,imx95-19x19-evk-aud-io";
>> +      gpio-controller;
>> +      #gpio-cells = <2>;
>> +      gpio-map = <0 0 &gpio1 8 1>;
>> +      gpio-map-mask = <0xf 0x0>;
>> +      gpio-map-pass-thru = <0x0 0x1>;
>> +      #clock-cells = <1>;
>> +      clock-map = <0 &clk 1>;
>> +      #address-cells = <0>;
>> +      interrupt-controller;
>> +      #interrupt-cells = <2>;
>> +      interrupt-map-mask = <0xf 0x0>;
>> +      interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
>                                                           ^  missed count?

Sorry I don't understand what you mean by "missed count". With
#interrupt-cells = <2>, I understand the two cells before &gpio2 to be
the child interrupt specifier, while the two cells after it are the
parent interrupt specifier. Could you please clarify which cell is missing?

Regards,
Chancel Liu

