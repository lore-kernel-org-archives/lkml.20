Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434446;
	b=242YgmkXrUdhD8UjWmQvD6mBnc6ywowTiOxKWidDeQ8Un1mdyszzjT0sMwFeFXVBxJCe
	 vnBl5bswR7s79zFm0MLCuYP+jVFAQtTAd07sutpoj1wH0yGoEg8Y9uWGgUf5NNUgZ7xkg
	 oseusvHimABsWt6hB0/kzepciV1dMqe53/Jl0IYF+qZPLn375MAdPQA43RyQEsdf4DJ1X
	 +qeXgfNVDsMhMqnZl74d/Gaoj2LzCclFMw8v373KjXZoWaB+SdTuP7zUeZJg8eq1jeu6n
	 cmsD+q/7V8qlLUQVeGQbsU8fUEgbYxQkNZcIx2S+9fvrfjtcCCjbYHN66iJtsdCC4eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434446;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=+KQGi+q5ZdlTum1m/wOlG/OrMS3CvtA23weMKe1tpz0=;
	b=QvNYVKBQ9xdId3sWS0oH8dV999JzV1u2IiRALtcqtaP7wx3xf4wjQGXbNtZzU1t+rr4D
	 pEf5YBgqaslqTEs4db49tjVxgalFytjr1BPslD3KDMuwS4jRgq4u3ieqj0BIXS/nh/YkZ
	 R8/zKP/YJtLlbGtU/ckH17spsq8Ooeyq58yD0ljcu0ECN1hHccA7FEm8NkMPPAPl/VvXL
	 OV/ZpAUvedpbwzk8YXKaSJxTYEFbYnoNOj6tbA2GbOhQDZZHFoh1kmHmiw2e//CLZ6nAp
	 8i+oA+zeSh+RSSldQ5Q6aKCR11gRuv/VRPlr5pIz+Ga5brVImmYr54VOmUDKhhmS57g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IzNoXho5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14C260A6F54;
	Mon, 19 Oct 2026 18:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14C260A6F54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IzNoXho5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFDqlU7TgXLyXLCEtWQnGJgGfIq36i9jjFB67bhycUKadrGOKJh46vMOF0gWiiwFR55iFJX8Ph7u3w1kx6L0Acrfxp1jfx22bDM8SKAXu9ogxzRYB3xDkprXQZDFJcgTkP70r1nX/2vtJ3epH4AB2VEa6unj75eNAAhMh6ulFWda5Wu68R/Dj6VsKWVljHvWO/onMrp+nExB180wuFWIENpznvwOYQ/jTivfjbUtHIaBu/qDLEeE7upLzIBKSJU5lXeT6Frdk45Djqw34gIHcLO46ukZlxB+BAVXAbzHiUEvNWOkUGYW4Nprs8HA29+q36Mav2AO8Hv0N+LFCtZxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KQGi+q5ZdlTum1m/wOlG/OrMS3CvtA23weMKe1tpz0=;
 b=pICvFQiFQ79pK7frQjwlHh7Khl0RU8+aZs+5dPoMeEe6MQZGdXLGl0NAm3Bv3x7CtyVS/Y0sFOSXvl0cU960rTi0rIaDe7Ejl8z9pilmGBzU0RZI9bby4jHL8zDuqI5Sfk7iEFIcQzekZDvW+laS6rDGIqVM3dquxlukl91T73PVvBKtmDw99LUua5ob5IVU+jH2h0CKaU5WeFnddti0kAKjS9bZ2adTwB7A1fEBOUzmih2HtJ+f5FyllaFktHEYomauCM5pYBsjwT7QnATTLrkk1u/fdtQqRfTtBUwFobpE7gaACeCUN4vATRNI2ruOhSB+2325PdoZpYFrTE7wlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KQGi+q5ZdlTum1m/wOlG/OrMS3CvtA23weMKe1tpz0=;
 b=IzNoXho5z9D+nTATKiPFBf5HIP6QnH55ap+sVslz0vZnue7zRM5gZl3oz4GCsBN8w72crhfzkKj1CWkKon+AYF0faAR/Fh3chiNRW9nEkiEe5jUoOCyn6QS0vV/816c80NK+BmJGL0RKsPs5GB3nsXImXrlXt4DJ0TlWyvklMoizWvGhsRPG+S/Vzu+j07hxj/Ly0wNH1XpMgWfV2L5Gf7XKtbuEIWRpF4fhV9CrfC0hBSXc1A/YQsdfX7qjg201jJpmvvKXrTT/QgoDfVuypZCeysZp5xl4+JgZjJiOsiwZf8y/dNuGZ2Z4Hpc+/B/9z4mfsSh5JlIdAQDj8B8kkA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:27:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:27:23 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:28 -0400
Subject: [PATCH v2 13/13] ARM: dts: imx6sx-sdb-mqs: remove pinctrl-0 and
 pinctrl-names
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-13-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=941;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2uKCnb2rQhdKK13s7SnmIcokV62X+xPrpxXH8dFv/f0=;
 b=y2mJovXc4X9PVBmIDdlSfCYdPfwmhhB9f1uXnZ8Z9UY3d7I+LyRMmjnc0mekKAtXsrIWU6E2C
 NHVuhh8kEz0DiUqD3uYJo3b0peZrGixA3Fd4pQ9Iz3mYVe5sOOI002L
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:454::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c42d7b-d35a-4c4b-b6e3-08df2e0e9e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ubKlpo8fHULYv2ToxC1rs8gaXnTAcKLEDrkfS6dOkhEFkN1g1U6eb6vmszRLqroaAhjhyqmMs9ioY1fpghin4Vy0YzAgAl46H54CVxSQaC8mJhyoBaTTL99abzKqaYxDHQjETMbAzvpw6FH+A/oitG7ZO+SqoTtx32YfWKgngRi6HI/D/y4PM0F3QwiXPH7IPRPFchc2BRp8KMEjzpDRYjWkoJK8R8xch7dZceYVQFZGXEGOwfWkHYN9NsieXr1ySFTtLZDhvEvGJ9DGi5856d0sosYKmgK+PRr6tbr9uvxMa1O9HTFGzZIgVpmPCMkL34HkmkfGGPJLit2w0vczjZiCVj636t3ufo/WIWDP6m1SFn2lROAsNbVsOxNS7j6xIXLmFzHYwm9RvglWCaK8nxJELUsg2jM5pDmxPol/mYfwVJDz3mk0u78ZnnR5OGdrLLJUoGC2R7mQKcOF6nj60NHJP8lhC6rUvmiKFHUZg/xHdakAtBo/60yaMrqC6W/A6z7blitkQ1LcQG98QIwNhvsIIQV8b6YU98aKQs2HD09dI5HOLcAWYLqZOYsY8mGEO/ABb5sQjKNgyR//rSb6No4c/lCKFXYzocc9jcg29Hw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjlMOU1vR0Y2RFdDaXhXQ3dHMVVYRXQzT2RUQnBzWjZnME9uODlGc0ZFZG8x?=
 =?utf-8?B?cGw2NDdISWFlUU02b1pNcmk4YmM5MTRSTkZVVEZ4b28zMU1mNGc0ZTJSSkRp?=
 =?utf-8?B?S1RkT2FxTU1laDRWS09MMktaZ09jMXdFMlNaQ1RENlNqN09XbDVYbGdZMVgz?=
 =?utf-8?B?Vkc1dzVLRmwvOFZYZStzVzZYSHVEN1VzMjZlejhNTWU5UVl6S0dKaVlOMlZH?=
 =?utf-8?B?UkdMOVVxS29yemx6cWJnUDR4UndaN3FMenQvZ1R3cmFKK1NmeElETDgvOVdi?=
 =?utf-8?B?N0Y3VFRzK0UyamI0N1FGVlBXbmtod1ZLcXFrS3RnU1lQMm9vUENueGFlUjdq?=
 =?utf-8?B?R2JXL29TMVJMWm55RFhQT3RrR0NGSmk1SXFsTzJDNzgra0YyMHhjL2R1SDhv?=
 =?utf-8?B?cGIyZU9NTENYa25Kcll5SXBSWnliV2VnK2NURHgwY2ErRGhlNkJxSk5CU0pC?=
 =?utf-8?B?OS9pL1pZaFpZWkdqMWIxUVJmZENOMUZFSGFNdFBkOFRzcE1SM2I4YXM4LzY4?=
 =?utf-8?B?SXpNRGp5bzJDRkNCK3lkeWpuUDlKSytuTzVETVBuTDJIQmFoMmhWZFFQaEhQ?=
 =?utf-8?B?M1BlUld4UGU5N3hJNFU4R3dQbkdCNXpBOHp0ZHdNd3MzOGZyVE93VGlUeGQ5?=
 =?utf-8?B?NFNzcUxPNEhLMDVtSWx6QUdnZTc4SmxSQUN4MG9DZ1pRaFl4bUpkWnZUZFVD?=
 =?utf-8?B?NjdEM2lPTFdrWTVueFE1RGU2TmdRWFVoUnlocVcvdDVsek5RUmg0OUt4dFho?=
 =?utf-8?B?dnFmaG96alJmZ0YxbEtTMzU5MG1VbUZSWVorUWYwK2toZlJlc04yaThvMmxl?=
 =?utf-8?B?K1N1cHRhNVNYVEdOSGUxMldzekNsVUJnbFJWczF0bUkwcnV3VDg2eDdncmpE?=
 =?utf-8?B?RmdhOWthVjNvZXl4Lzljc1o0aW9KT2RpU2RTUzhtMzFXam0wK2ZiNEhtWERP?=
 =?utf-8?B?SDFjQ3pDTjQ5YVUxMUpFWVF6a25TU1JDNGFCb2N2cnVkQldXOWtGZlBDQm9o?=
 =?utf-8?B?dCtGYkxSZ3RWcmx6OXlJUE9WOEcvNVVsRkR1Qko2ZWFneGorU2Z0ckxwTXg5?=
 =?utf-8?B?cy9CbWRzTmc3MFFYZy94MURIRGI4MnAzbTBDQ3U3YXZvVGRocVF4T2EybTd6?=
 =?utf-8?B?L09FMjkvaFk3MGkvb1ZqWXVNSEZ4ZnVkbzdvbm9qdkMvV004RzJxdVp5RHU2?=
 =?utf-8?B?UU9Ka0R4N3lkcFVPV0hCem04QldoTkk0Zy8zUjNUNlMwRS9HOWcrelcvWWRr?=
 =?utf-8?B?eDYzL0RGL1hmMTBtN09jVGlabFY1Q1B3TXEvMno2S1g4N2VlcVF4V3RsM0Rs?=
 =?utf-8?B?bFYyUFhmZTBrMWtIWHJwSUp4MmVpWVRHTHNUTWVaMkNzdU1VRmhreTcyN2da?=
 =?utf-8?B?QkJOaVVnWldZeWNzTmZyUkVFdnBwSFl6VkhzZjFsdHJEdHpuVEZpWXJudEJq?=
 =?utf-8?B?Y01YT1Z4VWJ4RE9xRmdPUDV4b3hGd1E1STUyN2tmRHorMk1aZDUwNUo1S3Z0?=
 =?utf-8?B?UUc0WmR3blpjd3dYYWtRUW5vYTRZbzZ3UWQ3QmJNTWh4N2hSeGk0dmdjQ0dk?=
 =?utf-8?B?QTdBNDRobW9DbWNMRGhDbGZGRUhYelNkeXJLMXRmMlhYbmh2MHlLd0VZVk1k?=
 =?utf-8?B?L0Y1RFAxWE1HZGozU0ZuMFMwVHpDMWJwVXl3SlJ2NHprTWFUL0NTdVhLNHBk?=
 =?utf-8?B?c1Q1eTlUL0tUL0tyeTdtbzBMYTVodytaVXQ3WWZENXo3emNGam5waFZjS0tW?=
 =?utf-8?B?YnM5NnRwM0dJVjVvelZjRUx6ckJGQW0wUDFXRlJUM1VJOEsweitJbnpmSGtV?=
 =?utf-8?B?WjQzVXlWWitIU1ZJZkRRZzZycnBsdVQybk1wUGttci9UQ08ybGZLb09yVzBq?=
 =?utf-8?B?R3FraFpkOTkrRFBId2lGekNYV054aVhObXpUT3V4bjRsV1ZnL0VqQ25ySFZ0?=
 =?utf-8?B?SjZ5aGFpQThLeWUrZjlnZUMvRW9ISFFLNTBVbmJwL3NpY1huRzNKUm93WEcw?=
 =?utf-8?B?NFF6blBJNnlnWGpnUkNSRFRLUk4rT085aU5NbEpDYzh5dmc0S1UrMkd1RU1U?=
 =?utf-8?B?UGEwMTdtVTk3ZDliTk42b0VvS1RIZmJQRGErbnVDM0RHdG1janh6aVY4QUQ5?=
 =?utf-8?B?NUowTmU1ckZtVjhsNnh4Yk9UWjVtUlYrYzJKejVmcGNCSHZpQXpkWHpkUGRm?=
 =?utf-8?B?WWJHRWVaVXlMeit5azYyR1NxN3psNlpYeWU2OTZ3VTVWUlBYSW1LVVZESHNt?=
 =?utf-8?B?TWZSMmp1Ykpnb3ltUW1oMW5MYjFQeHRvV2hINjJBd2tJU2pEZklJNkd1OTlY?=
 =?utf-8?B?MWs0bWl3TmY4bHBOTmFzL0JhdGlON3llV01NYmF1WlRkVk1QVHhXRnpxUWZE?=
 =?utf-8?Q?yW+EpoXuENAlqmOi6tlgm/LiDPx/ab6Ypg8oJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c42d7b-d35a-4c4b-b6e3-08df2e0e9e7c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:27:23.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iioym4fvRC7ysI3I1CgRUJlMY8HI8hPIRQxiZAcVq+CoINyzq7ldkEpqd8W6ja5vFT1dcQGCBD69uhvCBbl9vzCxErMc0RejvUZq88qw8Zx70ThpRQc1mlnsOxeJoMFy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

From: Frank Li <Frank.Li@nxp.com>

Use /delete-property/ pinctrl-0 to remove pinctrl property to avoid pin
conflict.

Remove empty property pinctrl-0 to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: sai@21d4000 (fsl,imx6sx-sai): pinctrl-0: True is not of type 'array'
        from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
index a4ab2d3e960c4..a943a31c4c9c6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dts
@@ -33,7 +33,8 @@ &mqs {
 };
 
 &sai1 {
-	pinctrl-0 = <>;
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
 	status = "okay";
 };
 

-- 
2.43.0

