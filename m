Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793133169;
	b=Ou4mvmr/PKubciznoMHM3asHQMFEWMR0T0dCZN+Fp0s2ft0P2C2I6BahMhhEEyWzz7gu
	 om0VC1m60GWW6LdpRRGVtkbGmjE2ov2ZNpct/t8vCovG+8Qev1gwsEFOMa3FgzL0HrZZW
	 QuSh/uFXI/vpIQVLm8P13vSvmiJ7HJqwkqOCGaHPOdGwOcvslFbha3Ro9bNcN1CRISKmc
	 NMntLUZ36kh1TGhL5aWxj6IWLnZc/2EvGoO2tGe0UDvLmvWxeC/tJ0U7xMz5oklC0CZxn
	 YwhDeA9+nYx1MIj1wh5DsSae/hQMui0WHlrKk3SCGO1da0qOUVam6hVNi9i+wZxRiTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133169;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=LMuYjFnWMNmoc6RHBldTHC8xKlMJvZBOmRoafWgGzpo=;
	b=MCeb4meOqWCk77+41Ynbwyt/yMKWOwJBOD3johAggEuHHJm8D+kRKQ+WN0PUDbGjkvy6
	 fdu3uO7Tek0ziks8g6pZxv1QrVxw0zhPJCbokKYS69qIR2C1T2IW3yAAUE0vtteZspqTB
	 5MnBNvbzopd/U+SOWt2MEBUNJEwI+/Y36HL9uKHtlf/7NeXzGuOQSdymkVAM6tN38WEo3
	 gjk2LGLo/vxHriSQGvMw0Hy28Kfcj9bWL/2WRn//p6fGMZ0OpRAY99Mu12igZBZCG7DsI
	 qcmyJlXTMvc12evXhE21oupFZ8s+H4zapzc5q2Qr/oj+k8I8aRYLSOhnuzObrFLmE2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TiTie2ga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A25606A31E;
	Tue, 27 Oct 2026 20:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A25606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TiTie2ga
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6r0IOn0A7x1ZSwp4EM8SEtgvjzuZy887LVKSx6FJ9HmSe7RPP5VpKrKpAXvOfnzlHFf92gjCw9EfWF5XX/vr/oTmjw0+sS37zYZFKUK3K9V6sJaWjkf78kNCxtrak88z2ouR5K4QHR6rFvVnbKI3/On+eG0QbH3zKR0dqMrYv0b9Vd6Mrx3sPv/5Evoa2WiYYHmbXqBh2S6da1lXgYgo6gO/p2eBJwd8n3VfPyLHZ9tr20pObxxSxCYhm051k2Td4sn/BlSw8dZLsolVTLbErigHLNX7ybcWzxpA7afR5U3yNX45DRVLd9SplV/rBnTJOaQk88KAJ5YrLokRUoiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMuYjFnWMNmoc6RHBldTHC8xKlMJvZBOmRoafWgGzpo=;
 b=heu4PlKorBMpi43lC4mPXlpVC1gfrvZy7ScQ3HSmS3XIDDtOXJaX5QcCyYkNAoyjgbF9ol/Gr4qEIPgZxsp+Dmvzeyrm4xe7Sc0dAzHY3OH+l8aLfGd7rQESTJ1cJkdtroouQGqRne6OM7PT2qZ86boeSbj/et4dCHwoCvFiZBnKmoH9dJHmi+KQiatW8F4kSSWeqVB6bkwe+b+9bX50Fbj1pH7Hs6HVNVUlfvF+Ki0SVMO1IIa8/Sz+8+2/Ndrg37HEiS/1sBdsquKlVoxVXur3UiRDailUXrMG2eAKtgNjzZkgula+Q1cYK9N5lp5KAoxcmC3PRLgkm5zg41yBgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMuYjFnWMNmoc6RHBldTHC8xKlMJvZBOmRoafWgGzpo=;
 b=TiTie2gaHY1vFos0lwLpTY/hcryClDU3cEAmhf+jQuqLF0M9/Pwd1JDcISV8U2zHZFcaxMyZMVA4uGGaEYg2EyoUBAYyIgvLlAzqfD2dgJwR72J9SzhZPAtf1gUZspRNvXne84n4fjAn3FjYa2Z9lHG/GN+5b/7uaYUeAvlw0c0hxsTqEev9tSrW54UIJc1MHzwebU+d5qHRm3MimofAi+N5fiM+coczm0b8KDik5nXOgWFHkSHYpnaCvrcvqlHu3IfMbAI/8ww2biyv3R+2MGwjOBQjJJrC0oqC2Yn3o9m+/4WeDBH9eXx8U6LUXtJZdxdwqhCkpGddpDc6N29nGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8408.eurprd04.prod.outlook.com (2603:10a6:102:1c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 20:32:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 20:32:44 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery GPIOs as open drain
Date: Tue, 27 Oct 2026 16:32:36 -0400
Message-ID: <179313310504.293806.5904009332348433520.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7P220CA0100.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: a6beb6ae-d0b5-46c8-95b5-08df346974fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|19092799006|23010399003|1800799024|261009223027099003|261022105027099003|261021121427099003|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
 FGfLNdCUA63dyPiqjQ+cbnGyquzknoCNM4b+uhrjO/7GtZypRcIDpU3+jBkPfRtjZRQl2UjghdF+HXgwvqBIlivLK2KZL6R2cWkCXXuWnsql4eAk8OYqP2ASmuyNG21tOJ6jZb5LkJmMoZrpUyysTCpArqk+eHGknGCSVp/e75z9r4BDd5hkz4pFIuPSKaOtc8yKHnkCg5wuh5mxYHOwz6EOtMcrTrGeNiUwh48yb7GKxUaHLAGrAGilRma7iP2DIyuP4vWq0xaTcU/PgiOPBJwXxLr/w1N/cA5UbtOYzZgb1RjdC+y3aDVl95J2ozpz5ul9Hs+BYovtbbMCbnSy8dXx3cQ6IOgBlWy7WZbwpSpD/5PZQHEHpVBDlXwDaT1s7IGmBgzMe0QSWDc79wMBiSGvQTuP6Eh2ln9GAwGXQ7KazEoHsSsQqpVqHdkzlI0i9GCnCBZllPOEucM5Fc5Bba0wbC+29jPO3/cMXSqbsxcZ0VdHXwptIZqRykvaKJS3gcbG6XV1nlMze1kOk4CdrRhIAiJTLPMTsUks+27LQ+IbyOrQc3N0qUxurHeaDY6SLyABSwbBugKPZkQaF++Em71ywEFxupdlawOdeFCNOpSewaLISre3hjsqHwLAyGF6ePxSWBK8QRc0ABjt/94XXBSRyxx5RhDhnmHGTCMnScA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UHJlSzVUMUFZN3RNZzNzRkkxcVd3U0lHeGdPZk5jUVRQN2FaQW5xcDJ5OTdK?=
 =?utf-8?B?TGNuOVpOVCt2a2ZNZHp1VVNOYkVPOG0vOHZaa1JWWXRKSjloYXhpNEUxZmNq?=
 =?utf-8?B?bXFNNGJ5UzBRZXRTU3ZTMFM1bkFDZkpqdk5sWVRkTUQ1YlpxRExhQ0RoMWxJ?=
 =?utf-8?B?TUZaWmU1WXp5MUsxUW5NSG9pVTJoSy9YckZMcFRRbTlBYk9QYk80YVVRZjFt?=
 =?utf-8?B?eDU5SngrVGtoZmNrYzQyYUNxV041NzV4bWsrL2Nab3lLeWdvNXZSWVB3OGFB?=
 =?utf-8?B?djEwSjFKa2VqRldlSk5FOThGSFBzWVBpUWUwcngyMmRpd0xxcHZmMG1McTBi?=
 =?utf-8?B?dUtIVXVYSExhUUxzRkViTzFQcEJWVEhCK3hWZEY2ekhyUFFyUGpGdTJFV2p6?=
 =?utf-8?B?UWpuR3VNQSt6OVp4bUdxTWdLZTBtd0o5UWhPV1BlTGc1NFFNLzJtanU2T0Zs?=
 =?utf-8?B?QzRuK2hOVGJ2MG9mdGtFcVNYVnpjaDZhR0lXWk5JTTdNMFZnaTBFTVRqUmZB?=
 =?utf-8?B?VjZzVnRQRkh3dFAzSXRnNG9DRzNoQzFCditiZ01CT0dERCs1T0J2VUJsbWNH?=
 =?utf-8?B?WWR4MEhHa3ZaOHY3eUR5bms5dkp1dVNEa2h4eTVuL2pnMkJCdjNoYXk1aDBh?=
 =?utf-8?B?MUxGdzZkOE95cWs0RlNyaG16YlJtRUd3ekUxSHJuR2dFOEpXRjZZaW1TQXhp?=
 =?utf-8?B?L0ovVFJjMHZMOVFaZkhEaitWWk8wSGJERUZUQ01ySGE4cWh0QUlNKzNCeE85?=
 =?utf-8?B?QTVzaTl6VHR3QzU5UHdWUER0bGd3MkNtNzkyazlYdk9INFFMWEFmVkd6Tms0?=
 =?utf-8?B?NHZ0QmNpRnJqV3dZaGZlYUVoZ2VUaGJXc2oxTU45dDZKQVVIeUV4cVZvYUhx?=
 =?utf-8?B?VXgxRkkrUDQ5VkVua1djM0VsSzQ0b1RjelBWMHl2ZnZNWkEwcEEzcFBLcWZI?=
 =?utf-8?B?NE5nWWtVWU9LRUlVelNPU0tkMTN5b0ZCVmUvOTZFdGlGK0dBWXZuZGRvZ2JK?=
 =?utf-8?B?YmVTeWFpS0p6NGVEMm91R2hQZlZBS3NRYUlyOFNoVG5kOWk2UStUQzAvcWpJ?=
 =?utf-8?B?bHRVbXpKOEo1SldGYkdzZ3JqbllqbFB3dHFQV21UMHVrSkcvdFdMdzdQZFMv?=
 =?utf-8?B?ZzZVRDA3WW1vTE5wMzFzeW0vRmQxWUoyM2VjZVB5aitGNzZVR3p2bEI0WnN2?=
 =?utf-8?B?czBGNXBoUkdDQWlZcTVCelIvNlZZM2k4aGNmTm1POTNLbzdMOUcyNjNFT3Np?=
 =?utf-8?B?blB2N21UbFNLNTRLSXlFdXNZTVVJQ2ovODArbGw2cE5nS1dnQStaL2VicEo0?=
 =?utf-8?B?eG1DWXhnZkcyc1RONjJiNjBVQi9RODBzdUFqVGdETjFGWllhWDhjdGZwcFpM?=
 =?utf-8?B?Q1VEaVBsenhhWll5cHNRMGNJZTV1TW01a0labG0rU0tKNVBpTWkzL21CZXdw?=
 =?utf-8?B?OG9LL3JFSHB3aEJMTkFMUHRMLzV1MlhnRE5pUmRzbzRnd0xLSVlCWHFKbW5H?=
 =?utf-8?B?N3hMbmwwNzZ3aGNDS0plVHF5a09pYmFqNXdXZkhCdzZ3VG9NRnBnc0JuTnUx?=
 =?utf-8?B?cFRXUWVtQ0FxTkxCUDk4OFhRY3lUSzNyVHdpaHJrM1RyYXoyayt3cm9NRFlS?=
 =?utf-8?B?VVZ6bXlqTFh6TEI0Zmh4aW1rMndiZ1I4TlE1bUhwcmJraWlIaURCa0Z4MENw?=
 =?utf-8?B?MjloYjFLcGNMN0J5dnJUanRpZzhHVWsyMWF6QkhXUjFOTG1XZkdRbHF4Uy9v?=
 =?utf-8?B?Q2VsMzhwU3ZuTWZzdWhHSmlldFpjZS9RaWlYVHZQaTJrYXB3Um1FdmpnUVV6?=
 =?utf-8?B?VDM2OWRiVnRKU0xZZU9kMW1TMVRjZzFrRXR3Wmhmb1IxZWlONXM4NnZRYnN2?=
 =?utf-8?B?eVVNd3pHczN0akdmLzVjdjFEdnlNdFZtUlZUaDEwVTNXc3YweG55VmVVc28r?=
 =?utf-8?B?VnhlODJ4ZkhzeklkM2VrZjRhcVhtQjdSWTZudDgvQ2dITDFjRmh5UHdxTU94?=
 =?utf-8?B?VFpPQmtsVWt4SStqMzlYQjdBR090bm1nWnU5SWZIeXFram9QaktWMnJCaUxG?=
 =?utf-8?B?aFd5ODgxZG11RDhSSU5PZGczMU9KYUVjY2ZIU0VNOVRINkp6SmNkMWliOCtp?=
 =?utf-8?B?UDN5a0JxTEJNU3hobkR3NXZvVG03VHQ4L0lmeFJyZkNDbzZ0cnZYd2xGRXhH?=
 =?utf-8?B?K2hYaWsyRWprc3dSeWMyM2tNMkdsZTYwVDhGT3B4bjQyZDFoRjM5OGtkYWQ3?=
 =?utf-8?B?QzJtaGc2RGlvVnVvM3l1S1VzR2NuN2RSaGlaYXF4QTkwWExnN0tCbll2UW5n?=
 =?utf-8?B?OVZRakR0NTdnby8xcXd3S1lBZENlTlhGMDVpZjZ6UkxLL0ZwYzYyUHFVVFhr?=
 =?utf-8?Q?V3iHOETdOG97i6oksswDQZY2sKWH6IkrRZg/h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6beb6ae-d0b5-46c8-95b5-08df346974fa
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 20:32:44.9437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNPStT+Vf68AaipxG+bZSdbWhejl/rKgbw4DoIJBPxS4UToZm0trEtAPwbDu9ATPttUxI3rG9EwSBhkD8PbJX9J0axy/3UiscrwLNlB5lAzHtaJBuW7hZjlECb4jkriQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8408

From: Frank Li <Frank.Li@nxp.com>


On Sun, 18 Oct 2026 14:32:23 +0200, Stefano Radaelli wrote:
> The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
> Symphony carrier boards, are missing the open-drain flag.
>
> This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
> match the I2C bus requirements and avoid the warning emitted when the
> I2C core enforces open-drain operation on SCL.
>
> [...]

Applied to imx/dt64-intend, will see in linux-next after v7.4-rc1,
thanks!

[1/4] arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
      commit: 54f91a7c5523e651d5b5c77b5b369a5d627fcbe0
[2/4] arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open drain
      commit: 28db8e4df0f3401a6092427b8103a120ba94ac5c
[3/4] arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
      commit: 990c890685ff00e03b85d6224cf97c6e0a94684f
[4/4] arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open drain
      commit: 0d8e8629b13aecf3467ab0c77e457f037f4be1cf

Best regards,
--
Frank Li <Frank.Li@nxp.com>
