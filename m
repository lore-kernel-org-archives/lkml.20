Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6AD4A5EDD;
	Wed, 23 Sep 2026 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195182; cv=fail; b=jW7xbklAOFT9WKazG93OU2DOIovRqWqlGwBXP2fFzfwHKY2MCJIcnlTmAAFy478h3YfZzHbwXP7EditUyzxxsIDNxbiJnxOh9wvbYTPQW2fwqE46soCKNkrp2hJp5onYKjppW8EbdzTTXpV2SP3uojkUlj5E7ejljzpjOABTI8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195182; c=relaxed/simple;
	bh=NB5CdnAv0BQlal+urjMbv8/wKy2rHR8585nRfVFbfuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XLwAopuBA+Su5d9239OhrhUsQ+qb4nNYyhkgZuRyjGilgmH8YAkUCsP7TGcsVuS8UQlucAwvB/YUcUgdq0oF+H2mUeBXCgLhn45FKbYplJqmWJGFYUTfH/yjsP1G6X7r9YTrFyuWig/ZppQhr+ho5QJTyUad82a9ujzHI8cODZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j7C9zDla; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j7C9zDla"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXIEuJ0XipCFZ47N6lPSgpakBSH+yOJUN62f2cugjhtEmJ5SYWJZET4UiZT2hN5isBBEoUvtQGyDhwh/WJ7pKz2ICYZITNi7WpC1S72n31gaeqrgk6mKr7rMcl8kHHsNnFYVH4VewL6fWYkV/xxGUfQIEiZEtQeheSjdVA0i6j4b+imc03yIyh0CswDw6wlAJ+qWGXvV7SylfQqkzdk7w9c//6vT4cnJ6Kv83ujXvWUct/nKdd0UbO6PY8gsl6QpcKjUxBa4UHolvqKldKPdGbX1eq3AZMaC4X6ztaCamP+oFoHT6yf6Thlfa4tLsUDlQczmiAfDqwtOCp8CH+vaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cfG6GOog9GfA0H74Yt7aRYGXY2m3VW/9FzFoGOip8o=;
 b=rwcdNJR1TGBpNfeQyVI8NrMvrYkS9/M/8tTTv+7sDWQh1SoydJeuRCggADYgGlGrl8MQahi+noHHd3DvsidJuwt6GPgdxIX6eF0ESHknrJZtr/ewReb1Cy+3A9SvF32wnCM7gxQrncsXuHV9NPB6Yk3YXHj4fqtcMTBPrK1UF8Ilbkum8NhONSQOAwopYZDcLaTnc/C4+rc41io8JQxBJj22EY54hWyw8Jm213vA4yzx04w63tu0PkJL68usyo8qc7R8BakfAVW1dJ2YkB0ejFh6QFAx2HZn+0IlZ0e37PGbYP7UquZqnaS3L1ky429VkdNwAf6wFrY4VdkKGpa8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cfG6GOog9GfA0H74Yt7aRYGXY2m3VW/9FzFoGOip8o=;
 b=j7C9zDlaaQ1D6FDfF7VR/nG7755/5UpvpbFdPFl6ZHNJHHmR0YzABlCkaazGv7PMJCX4VM9eh71DUz1EqzwI4mOIMtNDm1wGgSpnE/wcmq3yvcNZR4EijDagecHwpGfq0EcjVXBevNTFTAOfQ+HuM0sbLg3TCjAgDwGYRoQ85eLEVU64epYk95NvWiRPdHmuMgGrQGokP8p6pipLkcsY6iN+kMG92+X9PGZ4jzxwqWmkmVoSzWY3KoDaHVk53DoEaQpnRBsQ+vY2ENCUGWsmCT5DF50BiCsVhKytqgkZm+U9mQ3VSvdHMdyX4IatgNHHE4lNvz9SFHY0BL7Ylv1x+g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:26:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:26:15 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx7-colibri-iris-v2: drop no-op delete-property
Date: Wed, 23 Sep 2026 16:26:06 -0400
Message-ID: <179019516285.3754870.12202612277425636672.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911134410.178847-1-francesco@dolcini.it>
References: <20260911134410.178847-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c23062d-b316-4d26-81a1-08df19b0ea7c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vigKlX31EIIBxRinW3RTtsAuuurpmWXe+HO26v0hPgEMkyrHio7mpdY+ISEFO2IuSMtVALpyY1PtA09b9OGp9i5paitFoKgAzhZnj5jHuKHB7TtsVLPMxy4N7YAJEHcacS3RHf5NTguGvivWgTrt2X9/S4p4LIxRd0oayI9NI2fxWvX90mLMSiLDhd3fFv2bHOFS+7ztvLiroJQJKaOvZ49LGujpo9PI3VZqnLyGupZVtNg6oCAR2rBfXsNndN0BCPteixndUzqmz7uSsaA0ZFZNXHu0BG6HN3Qa+YgJvnOmZn/RFm2aPMUsdIiK3rOBRGFhiIHBltS2xv82nwa2UT97bGuwYEYDtBmALKhZK4Xd7+EA6K7fAvXpv0yO5vOWpvGCuTdi8oOeROK9vkRpP+wcWKK7iUxP0h2FEXOLWw6lU2mAdD85dibY0OTr+hUEfiHKRaylJrhoxxIEjvYQ0ZdlBzelBDs5ZNukzg2dwSaLA63xxUg2TiMo+lHz/O0fhQ7NtUtjJlWFhru64lYkjgk/0kpnqY58GlFeuyjYejVEjHa2uFmgYKGRn1uw9P8/qjFsJCIfEukzo04sBfqjH6Aa12XRQvPD7OGZzUWmdrGJjg4Hq7v0+WrMp8iXGx0gw6YaMacUsymdUpsV9SwkgG3O5mOVdjbcPyh2lgigRr4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVVNLzhIY1RVNkh3bmxqK2w0YzNpaTR2bWEzZmhDNkV1cTRCaEpya0xVbnNu?=
 =?utf-8?B?SG9sdGU0MW5iYmJpeDhKYWMySFhZY0xnWWczK3d5THZ4cnR1YXlxc0NpRlA3?=
 =?utf-8?B?UDRUbGd4WEZLNm5jeStzR0N2Rm9OZG1neVlESXZvdlhRa1lhYmZyMnJpTnU0?=
 =?utf-8?B?VmpWTkUyclM3NW9ocStkazJhS2dwcmk1SURGaHNZZUw0YzZqb1p3WmFxbUR1?=
 =?utf-8?B?SmplRnNxM3YzeGVhaGFTRVNPT0JjdHZZcUpWOTdxYkt4N3V1Q3JJZkdQNnA3?=
 =?utf-8?B?Um5zQThlUFRlRmpjTnh0dlNEVk50c1ZLdldGK00wdiswSExhaVZpS1M2VUtL?=
 =?utf-8?B?cVhLUmNjaWhWYmFKRVFDR1BnaXQvZUFMNmdXVk8zR0QwcGVkcS8wNjZRZVZh?=
 =?utf-8?B?MUIxSzg4dWI4UjhqcWhkdi90SGNFYnVTMnNRZmh6SElhSzdkMVdSZzgwYWNV?=
 =?utf-8?B?eVBsa05sY0V2UzEwNzFtWjRqQ3Fndk9PaVJVOVMzS0VKOHNQN2tEWEplVEI4?=
 =?utf-8?B?WUkxTlorVkxwSmxQNlAvVTdTVkhSZFZ5OWc4RUF0bXQ0RnhCZjZ3UkQyNlRu?=
 =?utf-8?B?ZTZjb25QNVM4UkZKQ2RNUGRHVnpmOUtYVGNZNXdBTkp5RGs3RmFDZk5WUFl3?=
 =?utf-8?B?cEFtR0w0S3dkaFBFZHB4TzAzbW05enNwWGlUS1VNT2N6cGloblRpNkR4aDRK?=
 =?utf-8?B?N2g4TzVyQ1VwVFpVRVg5SU9tb1g3Umd1WHI2VHU4dlJHWUduMS9WeGpjampB?=
 =?utf-8?B?RzY0VzZCNmNRcXd3Qi9lR1BMWGw0UlNCRHk1YXNBeEdxT3hmYmU2eUZ1NSt3?=
 =?utf-8?B?QWtlYzFsS3lHM1k3eEEzVkhWcjgzOXdHc2pDL21nZDdyV1lkRldEUHF0MFFT?=
 =?utf-8?B?S2Y5WGR5MUhWRXJ5RUlCaEMvWXc2OWZhVnV3MS8wdWFUZ0ttZW5kTkNlMjhw?=
 =?utf-8?B?M1hJN0IzVnJReHRwZFkzSU13SzVJSm1XNnl5QkJNbW5oaFVNRGJjZzBjNG1o?=
 =?utf-8?B?Z1hCUGZLb2VSaXhTQXBtNnRHRHcyMlcyQm5DaEZhbFdDZXB4eEhjUWIrekdN?=
 =?utf-8?B?dFcxY2lRUlMrNDIvWmVyWVRZV09oRDM5U243VDc1TzMzbXVkdUZuYjlCL2pn?=
 =?utf-8?B?dVIzVUNPT0RTL1B0anZTbDk1YWMwb1EyZ1ovK0ZGcWRxZnZwdndBVVErcWJD?=
 =?utf-8?B?cnhDODFsTGFOMCtDUVFldkk0ejRKZDl3V1V1Z3JRTUFXRkJhc3Y1aFpldE80?=
 =?utf-8?B?R0dqdEErWXI4WmJRR2VON09FN1hFZCs1RVdDaEpYcGhIdStiUnYyUXVxQWNM?=
 =?utf-8?B?aHFFb3o2RXpRNW9TU0xFWk1TRFdxSGV2N1NKeU1EM05CcEFJLzVBR2xDZkcy?=
 =?utf-8?B?bkxJNmM2N1ZzSnB2MSs1OTNHMGZoTDRXaWpvZG1LMHQzQ3BwM29CMXNTYm5m?=
 =?utf-8?B?NEJVNUdNeExKZnlKLzkvWjIvbHhXRmVlVTF0aTFZeUZtYkppVnNSVy9idGpW?=
 =?utf-8?B?RFQwTTZSVTRjZ2FwN2ZNbi9IMnI2TkVaUUNvSUN2SFBIRERFVmxvMHlpUGNv?=
 =?utf-8?B?ZjN4MFZJajUvdjVaZU1wdjNJUWlBSlBwS283MzNYOFZvMFlUODFDRWkzR09w?=
 =?utf-8?B?L2pvUTJTVHZjZkk2ZkZOVW9mdklMYUNOUEJzYkRuK1V3ZG9EVTN1TG0xTFJk?=
 =?utf-8?B?dzlxQ1pQZEdGY2ZObGRtTm5aYVZmZHI2N01UU2VCTzNWLzY0WlVYYjBDY3ZN?=
 =?utf-8?B?TFVuYkRzVFlSWHdDTjRuTFVnYUlaKzRtdkNFdTQzcTRQbmVHRkZxVGswS2Iw?=
 =?utf-8?B?OHdhblhnNjdxdGNQamxPZzdDSzRJcTRvcHZnUmozY3IzTkpvelE5SXpRV2o5?=
 =?utf-8?B?ZFQ3L3Zoa0x2a1JoMEs0NDFtTCttNUZrU21ZQk44M0JtS2FSdWtwUXBJMmhj?=
 =?utf-8?B?WFZ6NE8vTTFxbkxoa0lCMFp3Y3NZWDhFWk1XU0habDRFYThxRU5yOTN2aExE?=
 =?utf-8?B?ZENURkh0M1UvdWw1UkdOT3JYTVQrbmpQTmdQaWhXL1lYNGljTy9ZS1ZyNDhP?=
 =?utf-8?B?VnVhUSsyc1E0S1lybGkzL21hK09Md3liV2RXUyt2K2FHaVZhWGtibHIvbzhG?=
 =?utf-8?B?Ry9nUk5KcEJXc2Jxd1BMM1p4b25zc0ZoejhDc1k5L1l3L2tEU0JtOHhIaUw0?=
 =?utf-8?B?bFVmVnNFN3U4S3dxRzd1RlNqcU9YRHhubW93TndTaU4rclpXckxLaTAxNGds?=
 =?utf-8?B?aUdaZ0gzbHU3THphZENqTGlzWExSenBHWlBoS0llRXJQWmF6RWs0NktyM0Q0?=
 =?utf-8?B?WDhoREZGdHY2VXU3ckRpM3dZeDM5cHVtRWN6Z241Sk5OT2NFTjBzUUhza1gx?=
 =?utf-8?Q?8qPqoYhbORm+k9M8h/wtHloMqcxQ+d3UZC+2o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c23062d-b316-4d26-81a1-08df19b0ea7c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:26:15.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ici748uoLE3fioiI3CZjkT18FeLtKMIjbOTseiNtM8ExmQpKZa89zdDcwiy3gbos6F5sGFKIPNXzGq9gaTGVHW9WKVkmD/0NaFhUmAfVm1IqnLK2oqDjW+rB4Xk3nsp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183

From: Frank Li <Frank.Li@nxp.com>


On Fri, 11 Sep 2026 15:44:09 +0200, Francesco Dolcini wrote:
> usdhc1 never has a "keep-power-in-suspend" property set anywhere in
> its inheritance chain, so this /delete-property/ is a no-op left over
> since it was introduced.

Applied, thanks!

[1/1] ARM: dts: imx7-colibri-iris-v2: drop no-op delete-property
      commit: c926063088debfa61147918c473831896ecbc233

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
