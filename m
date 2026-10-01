Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013022.outbound.protection.outlook.com [52.101.72.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D54C524B17;
	Thu,  1 Oct 2026 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866823; cv=fail; b=Bt6jQx0Fp6VSoUuPeut+qRlv94q8Zrb0ta1stKNTJwEw83iONS7uqVNzCffhlmKeoU/qr1XHw+VSUG/yEC76AtPPJ8VgZZT3iUukTas86XQEd1ujTPrzOw4zNKNOjqKI+xXgiPbxnP2zg/iPoCb8j56fcAbyQFFxcBlxSnaAmcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866823; c=relaxed/simple;
	bh=kJ9JbBcyAd18h1PIu0CBxe8MoQWn21JAH7fWtuKNmK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLEP/AcxK6D8vtzpqikf4XH2WO8yv55L+IJdFDJvLTewKsn7nt3ZtF+2Rn9jrLzMntRwHNS3Xhs0AksQ89SxcUcoe/0+TYolIzZkoP+VR1bSjFhjLZmcyUxRDK42M3ggoM1ljx/kCqPzaz+zyykAOfWj2Br4pVF3cWV3Q9rOIYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Si1tdGBp; arc=fail smtp.client-ip=52.101.72.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Si1tdGBp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZx0+1lFSUiQgyZowcLgF91n3Cwusv67xwskVpgmSx0i6p1wfg1QOJ/qjz5fdP9KDBBTgdCRcnFCs16T/XNVH5B8ZBJbv9n/Ns1v6CeU6b1gcBSalZKoEJ4n6vQ0AdRY3m6gNIM4+QPoG4gDzcY2zhA6RbveN9N4KI3p+ozjR2H880IL6V3cP6tLjFbWwtEeFH9JjKCKNDmHGH7tAIO+F3RRjCy65dMCFNNHijmFw3Gsr+OI1v1wjfemlvBD3/+KteRZyahrytxBWyJpyFFGUz9ZKPVff6jO8GctpjIHXvuNMvTCRPDbla0MamHLNpPOksZ5VUK8sMa5hOJNDYdm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkXBv8Na4wsm/RCPLApeAPIfvqp2P4qELX2hBGYkmWM=;
 b=n9CAurAsMDLDoxop9UgizR6e8zEcJU5i7OYyj/tL57EgLN1hIqeCchtK1GLatU/mR1zFH3CtHorDCJorNYEMTXQwj0q1C4YtYMmDGPimQhwdTyp8ohpq9UX1Lohg1+uK5aI9vEDQFDuSVPsS8M546nBWlFEDckf4hV9pBrqsIX8ziAwr3BI/wRpVEnC0o0LZJOYwivgWtNksjEo5tsNrXUH9Osq44le1p8YaXGd0u0yqr39DE8BG29hXBVAuiNHiZgK5+Pl2d7EkEhFpmB05nVahKuC6/5Ac1DgRb5TMAeBlu77P4mzHMXqUY5xxsxF8WuEsQHPiYnnhp1CKB2oFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkXBv8Na4wsm/RCPLApeAPIfvqp2P4qELX2hBGYkmWM=;
 b=Si1tdGBp00cm7/YCOFgvrYaQ8QXAFlCJzyoD7TsINWy/TUWjsW1bgG1+aGmYU6YCBRW2X8X9CdncxdkZGidcTXZBPdgX4R7YD0YnqeDvggPnQfBTL9ud3j6u0sKzcOCru99PowHIvowWKFUHJnFcTvz8Hopx8jxviNtYD35zexNFTqLJ7HnHEO44Iah+YNyMm5eW53B5hM9Zq5xM1o8K5cAQFq+SIvBEObAb7dB+PAvX4nH06cVdbkXx2GHNVqLrGWlLDNfnsylLHsP9/KHryzT8aFkVAQxutUCY2jFha5BTGBSeM/vpfoZ7EQCztM88EgQ7tzuTpZFsM7+eofRsYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11412.eurprd04.prod.outlook.com (2603:10a6:10:5d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 15:00:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 15:00:17 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrii Salivon <andrijsalivon@plajta.eu>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add support for Amazon Kindle 4 (Yoshi)
Date: Thu,  1 Oct 2026 11:00:10 -0400
Message-ID: <179086680651.2217519.5558580290302031419.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
References: <20260920-imx50-yoshi-v1-0-b8a46b3a972f@plajta.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR14CA0024.namprd14.prod.outlook.com
 (2603:10b6:930:2::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11412:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd34f4e-7e5a-41bb-3c71-08df1fccb489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|19092799006|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	uHJuKoIlWL7Yvq5+v/G9ZzeLA+BMNeTSo6h2mK5wZc/MS+M9N/Bt1Kkwq+qZpusvSbOIfq9exPbW4Z7Whfc1WEQdIQJ1QfzCZAidOmVFQhfLMEeWeOcnqdIMqU5wlLbQvGDJe4hon7aYpwI2zfw+XSAdbk2ZtF3TBA5RVJGriWIL+oWoFNCI5bb7HvQLKWERTett9fw0MqE8I/UtBIQhHx5JfGOeb8efq9ibHIxA7Au4AbLd1Ne+8RJ7Ab1q6mcclUtNWbQfYQtgF96H1oMhKUvKFAi5pPWET0xEpoCXwttLiJlZgPpEpIZAbsGeY/kcR02QuOWzj0dE66SuFJtYQz4+tb9GwMt7ZlMS7eh+y6Y/ojeurW8BpZyH8AFAitxTWf7Ik2xEga+2u15MRwr9MkuS5pPuxOPNcFYJmcoCaADEBnt8rOkYn60Giro//PLlT8cHcS3RMVA3iUHEud3JlMWmERxEXUHG0Msi5E5vSrQE2riZ9l8UZr71MEq5Y7WPgPPiqNL9Q565ksKqDYmrO/nYgAHrrUcN27L9PeGguhBEZ3pINT6nLxhEc4cU8wr+pWlD5TJTBN6FQb1RD46cfAhnqFR6KdJPq56KFB1aNvxGbCEC8pC1PSBzm//rnYXqrCuR3kttN4ZOdokjPMshmLDRa6TyMJEGE44FkQ6ac0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(19092799006)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW1BQmtSeDhHN2VEaENFRlA5ZUJhV3lQQkc3TFZITWlRWmZjZVV4ODZyUS9R?=
 =?utf-8?B?bWVrOS84Q2VvclFQaXVRYisza00rOGtjdEhKZENEdUR5KzN1bDFSQlpkWDUw?=
 =?utf-8?B?TWR5b0hWd2U4VWd5Q3k3c1ZkT2tPM3ovdkRrN2ZXZEJBeDdDaTdaT0pSbkxU?=
 =?utf-8?B?citnSEJ5Qkp0eHIyaDhiYW5oSW1pRTdDd2JKaUUzbmM2Uko0bjJlaTE3cDM2?=
 =?utf-8?B?K2kwdVR2V0dycjZTRzhacllpNUpkcGlic3hZdGtjbDh4RFBuRUNIMzQvZkhs?=
 =?utf-8?B?YncyNkVVM0I3MiszbXhMY1dLRDJYM2RIczBZMDN2ZkNMQnUrY0N5UisvZE5u?=
 =?utf-8?B?bHhMNkRsSnZXN3N0amliWHUxV2NqY25vSEptZTFMbnNkOTJTclhjNjhvTlBl?=
 =?utf-8?B?QXBpYS9QVVNRU25hZ2RZbTFQUGExbTFqbWFOK3hsNWZLUDZxZGFwMEVrc3Nz?=
 =?utf-8?B?VC9HVzkxT0pIVkJsNkEveFZ6R0lQNXJCN1J4SFdWUzYvVGYydVdLck11cEM0?=
 =?utf-8?B?Mld6VnBUbmF6Wlp6dHVQQUM4TWhIcFFZWnFtemhyRktZZkZ4Z1NlSGZZQVc4?=
 =?utf-8?B?WE5uK0xIMDIzemlrU2FseVBiaUR5emxIcnhUWDE0dTFvZ0hkbzVmR3VSZytV?=
 =?utf-8?B?VEtmNXQ5QmJSTWVrR2VKNUszRGcxbGtuYnQ3R2h4VzErNzhNdU50OWYvSEsv?=
 =?utf-8?B?SHc1R3NhODZITmRxN3JHc1JLTmNyU2pkcEtsYVgwU0xvVjQwcSt3U2l3dHAv?=
 =?utf-8?B?OTZHa0FFMGlLK0tLMWxXRGdwZmhlKzQ3QnNaWDNaM0E5ZDEybDZKM2UwaXox?=
 =?utf-8?B?MUxpS3hPQzNTZHpZOVlCYU4wZUFGak9DdzdadnQ1cy80T1pwN2ppOXFsTVpv?=
 =?utf-8?B?OTZjVjdsSVdJd3ZKZm5EWnFMMVZaVWlOUU1DYlZkT3N5SWtKQkV1NFA4aDcw?=
 =?utf-8?B?THFjREF2dUdUSGlOREFHSE9PVXFNUU5vVzd4RWZyTE1qYytNS0w2ZElxR1ZZ?=
 =?utf-8?B?ay8rNS8xdEhDTS8ydGZUTkw3dHNvR1pDRzZGZjZnQUQ4dDhqSmQ4Wnh6K3NN?=
 =?utf-8?B?VVlMeVNQSVg0bkRoUGxPZ01DSmcvQkU3MWJtUjljZ1RkaFM5WmVwZGYxSzF0?=
 =?utf-8?B?bUtDcE9aNnhtczJpZjRoQnIzYnIrdXA1Y2lyRlM5L0NFUWRqOGhlZVFMQzZ5?=
 =?utf-8?B?eExGVnNjeEhMQURYdVBaRFhmZEZrdW94UjloLzBLdks2Q3BTODQwRWZSTUpT?=
 =?utf-8?B?dmhuVUx1YUp0bkFIV0hOUW44WkNUTFBmS3B3cUNEZ2gxeXFEdFg3Rlk1ZUZH?=
 =?utf-8?B?TjljSmJLUU00SUI2OE5LNCtiVEw3ZEx0Mk9GbTltdXovOWVsNXZKM2dqTUJV?=
 =?utf-8?B?NUR4K25PQzdRYWR4S3dKeGZjU0pnWW5McTI2cSt2ZEpqdWVBc1lGU3lBZjNS?=
 =?utf-8?B?Y2JnMHVSQ0xHT1JWditjRFJVUjhSM3hjTGtUZUliUzRvamZsVjdDRWxBYjFi?=
 =?utf-8?B?Wno3RWNnZzBKaGhFT0dDdXBkaGRiWmdHNDlPNXJQMFVlTzdKdm5tMlFxaGJx?=
 =?utf-8?B?eFFkNGpJeGtLb0xvREFLWDFhRjVEU1hPdzVqd3RGRzRMdUlUR0pBYVVzRnE2?=
 =?utf-8?B?QndCVmlvc3FSMlVmY1hXREdGYlUvVmpmb0FSb1lwa1E2K3hUV1Qydmw4Z2ZN?=
 =?utf-8?B?RVpEVDBZek9vQ1FuZmJNMHBhOXQ5ZVNYVUhFaUdvMzRXTlozVHVMclk2di91?=
 =?utf-8?B?VFlJTFBHS2xra1lpcG4yUm9zNkhrWnFuTmlSV0R0dlBuNDFrcVRsOTJuVlNs?=
 =?utf-8?B?eUpBR3M1M0J3RVorV2c3TmY2VzVTUnVSRWQrNHF0c0FVQ2lndjJsdHI3ZW0v?=
 =?utf-8?B?MERzazJzK05za2tGS0pRbkVFalo1NDdVa1Z2UDdTamNQdUp3Z0lCWVB1SnZP?=
 =?utf-8?B?T09MaCtidTU0ZVB6RWlJcDBFL3VOYXp1WFBIRDhRMGxQekQ5WGR6MURZVFQy?=
 =?utf-8?B?ZmVsUGJxaEZHUHErWjZzQmpmbmE0QmpmRnNCc3dhMWpzT0RGWUtrWjFmMzRO?=
 =?utf-8?B?TEo3VWdCampLWmE1K2ppakJWdEsyeVBKSE1WNTRlODJqemJsRjVhUVY2Tzl1?=
 =?utf-8?B?MGdsRWlQQU5DeTJkdGtBT0lZNkJteU5QMDZza0NuU0JMeTVnc3FuUUdtMEpq?=
 =?utf-8?B?RmdHUzRCRDYrNC9jbHUrc0xvVXFlMEcvYVl2Q3Y5cFRYcjgyWHBrWjNzU0N4?=
 =?utf-8?B?SzA1NlRpVGtpTGNIV2xjRHNtR1N4dC9QREJMczJYczUrT2paYnZuVGFHa0FJ?=
 =?utf-8?B?S1MxMnZvajRCNGl5emZGaGtxa3RSa1JhbDVqVWd6QzMxNTFVNjhMSzlJVGpU?=
 =?utf-8?Q?vRYJgzbSaMJaIzdBmJYPic4OOP1ofAnYHiWaT?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd34f4e-7e5a-41bb-3c71-08df1fccb489
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:00:17.4564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdOUgSwSSPD0Ql2DucuS6Q2DLj66EvVUnUlbNL/0hoLB5yBj9k7z9uO9C2ewBUg/+Jfi3jLc/vI/lv2hZiyz+Yxl5AG/MkTWtzOJoitG0thQvKwvpKSo1IVLKu9yNnsp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11412

From: Frank Li <Frank.Li@nxp.com>


On Sun, 20 Sep 2026 21:21:36 +0200, Andrii Salivon wrote:
> This series adds the device tree binding and initial board support
> for the i.MX50 based Amazon Kindle 4.
> 
> Changes since v1:
> - Fixed alphabetical ordering in fsl.yaml, Makefile, and the dts
>   iomuxc pin group entries
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
      commit: 60d031f9e361afcd1a33efcaacdcb19205fd6d5d
[2/2] ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)
      commit: 1a4b790752a297a296cf48b8e3f88684060d745f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
