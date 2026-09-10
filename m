Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022139.outbound.protection.outlook.com [52.101.66.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AD43BBFAF;
	Thu, 10 Sep 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030330; cv=fail; b=H9+MR3MiCV1x9iYl5ebGLm2Wvm7CdyutJu3jESE/JKxq0eC1FnceZkM1ekmb7GWmNg+cLvMNr+7DzE+mfsn35GpnQjUfrQ8oVVHV3xOV0pq0VeNuL2sNnEw9ynsM54UBkAfmYBWvTPRQlc0GxpJwnpIMNEjN1e45XNTlmXF3ko4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030330; c=relaxed/simple;
	bh=bQTZIFpPye2dzi92il9WVyeyhoq21J1Qqvg9+vQ0ENE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=jLHDXcA9pPoUO6qXeP7UvU9jMZRBT15Wtp9qMlh1nFDka2u7QLip74gqkRvcZVlI18r/rI7lojbbex+sE9ekylT+n5ZfywU8coZXZ72J3lr+oCPfb72859F9ngYSZgnuNKQxDy4UxSaCqMf4HHEpyKkNUgBt1s31zYFl20/xKgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=E3ws5PeT; arc=fail smtp.client-ip=52.101.66.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="E3ws5PeT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/7KvHfMsnGxZwjzjOYiPhfEvJ1HfVdbJfovRi217QH+m2FMZvJsxGyl81VugUoY1k0IJDIF4OItmNnpcyS835jgPGxaypnGPhXMVpS4uTnvJwSMIr5qaYo0cuks51M3X3vFBng1U9bRg8gLDYnf2nX+7smJG7ddYHdS+Z5k4C1l0wnleuG4xl5p2Jlb11NLIJbx6TNQDuwBSaEBO+tMk/KWwPSn4XbHyaT8ilQ8nvrQf+7YdybMYwpIiVtK6d6z7UVstPeGIJ0il5v/HLP4XNHI7ye//+4Ds0AENjMXBxJoSh0SVvMIenm/FxWn7HP5MyMlZ9gLrhM7D7hjF+OChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0msCBbFL2WKCpCcEOwKi1IEANrUte7yui/MP/8Znzg=;
 b=y9Q3U/WiMvLRwfQvr1ryAvtQXWB6EbWJq6ghpUppb3VfnzLQA/fzW7rx16MAH6hF5iKqEnqP6HOHO0UCu76ohewJMTuoRdjgQGpAm180AkmyGqGLRIxw8ATdA2rGc9DLfp0l0XBn3PL4ywx6ocfm3UmQeu3Rcgao3wLEC/lMjeU1E05OxzIz7TXra3atIXYIqcqmpqRdDFgMVrBedho08ZjlY7gODJj6CuN/dIh8UCS8qCNpicMANmDyUiuoas/GX8fBMeqOX1HvU/ThhDmga66WH0l5GXnQ5HLqiQyY9XFNMcbjrIJD7DgDMN3122SEdvlB4uZOU7/QPoSqjrPM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0msCBbFL2WKCpCcEOwKi1IEANrUte7yui/MP/8Znzg=;
 b=E3ws5PeTlkHXuzDlBno6OpEa8v+20PkS2xdEdKr6fpdGS5hmyXD0at9e/xtYN2tGadjG/D/8PwK2g1Tzg8eYy/K0AOOVgl+sRZYb8Wxsa+VL0qjt5SD+m6vjDiZQSWdRvJm2bTUuSKYy08Pxj63x9JsIyT7X0eRSOrKMa6GLLcJoIg49GT1gDH6DP/6ZUr57w++OGJN/TeIMw9dcP+/dhKkjKl08WlxKSstXapo8nmXwSivXChUgFxGGV3uDj/u+sJL9/oajeRXUAj15MI14/IiyqHMg9t4SJXyfVg9mcn+LMXm8fUNm5iZQ+geAkqGmIV7E5qa6M+wNAm6xKw+uLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::23)
 by GVXPR06MB8873.eurprd06.prod.outlook.com (2603:10a6:150:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 08:51:54 +0000
Received: from AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17]) by AM9PR06MB7907.eurprd06.prod.outlook.com
 ([fe80::a597:33a7:d4e2:1b17%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:51:54 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: [PATCH 0/2] regulator: Add MPS MPQ4210 buck-boost regulator
 support
Date: Thu, 10 Sep 2026 08:51:40 +0000
Message-Id: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1vomoC/x3MTQ5AMBBA4avIrDUZVaKuIhbFYBK/U0Qi7q6x/
 BbvPeBJmDyU0QNCF3tel4AkjqAd3TKQ4i4YNOocLaZq3najE1RCwzm5YxXVmSYr0OTaWgeh24R
 6vv9nVb/vB2uOhrNjAAAA
X-Change-ID: 20260903-mpq4210-regulator-d4b58046299a
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789030314; l=4053;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=bQTZIFpPye2dzi92il9WVyeyhoq21J1Qqvg9+vQ0ENE=;
 b=a1OuMdH0oSCEK/FJeT1DHDaGTPhAQHRewooL63ZTLzn8VsF4Rw1YZTOhfUIE3AT0/m1e9Bs1J
 r1sPqIPhsvgCRYBq67TFODRfzEpkNxX7p5E9g7fqvslIZhOjejF1zyx
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: BE1P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::17) To AM9PR06MB7907.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a6::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR06MB7907:EE_|GVXPR06MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 73091313-20e7-4cfb-7ef6-08df0f18c39f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	EvdJM4tJToNg20huGL4z0LUYDjw7o7QoDBRWsuNpeJtFjtddnDMM9ydBKp1sS7viItitM2Q3WVn2/lH5mqgv6SiBcGFNkRVIkav/diwmbWQLRLKqzx2/jiZleXJbcZp3s3n/lbb1aV33B8fY/Kyi9BDRrTp+i5pWLDBe37+XVpjXAyOSBfo6P9d0XdxRn8kEyrjbMDpGEhgpqs0rjO7cO9xl9D13y/IVeYubDNFHPFzFl6YudF38fm0QYcawHPvKj065nuD3PKp/sy9u/bH/eNbzYU8zy4U4cZGk8bhiGsPJ6dKu4QJ9sa3JNCrFKqPOqEQnQDfWYHODZuPZOMKFvHsFX/kwTq0YT+T4brX8cc6dioTnQa2r/V5St2sc//LiJ9WYL9WHn8dXMSnyW53I9Uq+7bpkxoqC+kZQxrA4oHNtOqvc68FGU3+ETqfOe0fCCCouuEK2to6pSBwxagOWwWIGFnZoG8QUt+hGj4O4dDgX3SzM73tFvlphxQelZpzs+2qduhYz7Iy2imU1Olsf1KzX3/i11SKObyxEcopV97QOZw8j6ybTVU6/DzJsMsA0h/UvQB1S34wpCIHedUhGqLVC2W2athU8rId2FUVdRR0w2I79tKRmtB15BEREvIthe9/5LsUD2ipbFzSl2JRuvk83Z+TGGMbtgspC4Ox1Q/k9XjkSTiseUsX+pkwg2bmMlz1/2E2eA0s9S3FxC37+tkiUHTK0TkABTC0dgkj7uD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7907.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3lmTzREUDJEQW9jN0t1MldpWjc5YnpDS3lETXlJa3U5MDlmLzY2SmxSckFr?=
 =?utf-8?B?UnAxeEFEYVR4K3lrQkdWdlhVM0lCZ05PWjhQUzRMQ1A2cU9EblB1dUNLNVFW?=
 =?utf-8?B?dUcvVVE3dXQxMmpsdUJlYTEvMFVaUWVnOER6d3locWh5MEJCOWZtTk5YQnY5?=
 =?utf-8?B?cDVjZy85LzZ3OG9YYmVURHBLMWt2MmovVVdYMU53dkVUQ2JzajlKVTkyVVBi?=
 =?utf-8?B?WEp2VDlSbEhaUW52eWhzQkRMZnZBdi85UkhrUWVZQTRYZkxFV1h3ZHBGNzdE?=
 =?utf-8?B?M1BvL1dYUWFXbEhrelBncUgxWFZFSGZjckt1WHQ3M3RzV1dKSFZkVXRaSHcr?=
 =?utf-8?B?M3pVN1JqRTZhMnJuN0tkcDd0Snh1S0NaaytXN0J4eUtPOTYzcThwZmsrYXVT?=
 =?utf-8?B?ZFowTU5kSXF2RWlmbzhCWlJtc2t2b0tjcVVHZFlBNklNNG1HTU41MmRwWnFt?=
 =?utf-8?B?Vk5QSzhuNVVUeUhyUGExeWhtREFzRVF2cVJ1dGdsNUM3eS9tai82YjBxSGx6?=
 =?utf-8?B?WWpsRi9Ub1g3Q3VxTE9KQ3RIUFJRYTh2VDl3VWhsQWFQckFrdXNsTCt2RGZ0?=
 =?utf-8?B?dXBKWm1RWlRnS0JEclBBdmN4TnNPbi9nSTNGNGZmWFdCTVJ5eTBFZmc5NjF2?=
 =?utf-8?B?ZTNjeXRNZ0ZYWHhJM01sYlJSSmhnMnJUM0dmMFNyeUh1SnV1ZE1qem1SR1ht?=
 =?utf-8?B?M2hOc3ZRTjErZzd0VFpnSTEvbkQ5YTRVN25PZnpLWHNMWkZsbHgwek5EVGFY?=
 =?utf-8?B?SVpvZ3p4WTJXekxrMDVBQTc1T2dFek9mMlp2azhGYWRvV2NEbWdXUUxDQlpG?=
 =?utf-8?B?L3dwTVBwanNNOXBlLy9GK1BFeFp5WTY5Z3lDRUtFcmM5cWFCUlFlVjFhbnZo?=
 =?utf-8?B?QURGaXZrZWdDRHdkdXg2WjRzeEVlcHpQVnUxZjlqWkVpYlRxMDZyc3JjZnh1?=
 =?utf-8?B?RVlnakZtNDNHenp6eUR3MFlIRkJoM3JIUjVmL042WllSN0RoYlIyWGcyOUgy?=
 =?utf-8?B?SlBuNXNudzJpMHFDd1hnQ1IxYTJxRlZkWkEySkhBZDBBQWl1YVg4UjNHaVov?=
 =?utf-8?B?d1AzdThNQVB0L1RkcFBzR1M3amZONDh1dXpLVzNNQ1dad1FDcVRXR3FIbWRI?=
 =?utf-8?B?Wkx6MTlqa3dHTmV0cWd1dGhpWDljN2MxSm4vdFdLRWl6dU5RSEdLckMxalBQ?=
 =?utf-8?B?dU9MYlgxd0UxMDQzd2VGbTR5MDlPcEV4R3VWTFRjbzZPanFDWUJLTG1nMjhE?=
 =?utf-8?B?anBkVFk1RkVoN2JVQlB6ZTVjWFMxejRsVXZISWl2TnJFdFZBNlpEblQzYmpH?=
 =?utf-8?B?QjhUMDRtUHgxN0swVVB3c2xnTExmTjhRcExMdnA4L0FNOFF2VGNEcUJMOFIv?=
 =?utf-8?B?VGxjeVl5WFNtRnc5YVpUTzdGR2JnaXV4aHFpOTZVcnpUTWlKNlJGYnFOUS81?=
 =?utf-8?B?MEFid0o1RVN6Rk5KaWNEakJrRjlrYkhKQUtyOHpVdno5ZUZNKy8vUDN6Y21j?=
 =?utf-8?B?RVhwVm54bXpjUzZqc0dRWXBEODZNMDVLSXpnRDNMRTNtb2h0OEFRZ21lNm9N?=
 =?utf-8?B?a3pOWHQrZEkxY3hESDNvcnBISER4NjVGNDhUZlpBM0tUYlFQYVdPMWNzUEFv?=
 =?utf-8?B?SDluZHhWTzhscXlrWVJwOW9BMmRoYksrNWlhQnVGVGIyUnVZaG5jZkxEdHhO?=
 =?utf-8?B?UUlCUklnOGlFWW5vNUorVHRJWXVMM0g3Q01sOERDV0I1WXBRZGRraUZNM3Bq?=
 =?utf-8?B?NnAwODVDTy9LRUFtSlA0cmFMblNicXJFeE1pSXUrZHRDc0ZuRFg0OE9OcU1k?=
 =?utf-8?B?cFZhc0hpYnAxM2dIeWwzMFo5dGIwb1kvdENoeWx1S1RJb3NHdlFVeFA3d1Rp?=
 =?utf-8?B?RXgyMDdSNndyMXFDTm5zZUFOWWZmTDc1RWpkY2Z4QjFldFM2Wjd4bkFJdldp?=
 =?utf-8?B?SGhJK0dsSHZWN3FaaWdkUlpHT1YyaUVjbC9Ea2piazdDNUdHaTcxRXdUV0ov?=
 =?utf-8?B?eHJFc2ZRdS9GWWJFeURqMmVHL1U3bml1S3BWMW9McjFFeWo0TnhGTTZZKzRY?=
 =?utf-8?B?cDlrcjNIVW9tZ3pQU2h0YzVBdTcvS1UvSkU1eG1UajFFcWpMbWNQY3BuS2RT?=
 =?utf-8?B?bTFrVkc0elRuaVNhYUc3cS9wT3FOdE50VndkclV4TjFhN0o3eFM3cXgrNG1D?=
 =?utf-8?B?WS9vWjRtSlVZY045TllCZ2pYRUlhdUhmTmdzSGF6SHRNZFlrYVd6ckFMbnp2?=
 =?utf-8?B?dzNpNWZGU1UyUlNpUCtWV2F0VDR1S1B2cmhQMU56V0VLV1hWUDJRdkNJVXkv?=
 =?utf-8?B?ais1OXJVZzFYOUtIbkV6Rm5lTTRHTHhUYU1zSjNZRThiaStZMVV5SHlSZE12?=
 =?utf-8?Q?3PownI1DWDQ33k4A=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73091313-20e7-4cfb-7ef6-08df0f18c39f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7907.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:51:54.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx7KmKvQoqxlGa0r/z0pf6z2CZ/DwODtqdtPV/6P5gHEbwc5gUUfIj0NmjXfPW/uWRmUFQZTIKMJrsEHs6qwusE7xEaypMBtz9nVNveu3Zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8873

This series adds support for the Monolithic Power Systems MPQ4210, a 40V
synchronous four-switch buck-boost controller with an I2C interface.

The output voltage is programmed through an 11-bit feedback reference DAC
with a 1mV step and is then scaled by an external feedback resistor
divider, so the divider ratio has to be described in the device tree. The
same ratio applies to the reference slew rate, so the four rates that the
Control 1 SR field selects are scaled into a per-device ramp_delay_table
and the field is exposed through regulator_set_ramp_delay_regmap(). The
current limit, switching frequency, dither and interrupt registers are
left at their reset values.

Only 0.3V to 2.047V of the DAC range is specified, so linear_min_sel
holds the driver to that and the lower selectors are not offered. On a
board with a gain of 14 that is the difference between a floor of 4.2V
and one of 0V, and the lower part of that range does not regulate.

Scaling the ramp table is a deliberate difference from ltc3589 and
mp886x, which read an equivalent feedback-divider property but keep their
ramp values unscaled. Every other constraint in the device tree is
expressed at the regulator output, so the selectable rates have to be as
well, or regulator-ramp-delay would select the wrong SR encoding. It does
mean the reachable rates are board specific and no value can be copied
between boards, so the binding documents how they are derived and shows
the calculation in its example.

Two details are worth a reviewer's attention.

Enable follows the start-up sequence the datasheet spells out: commit the
reference with the GO bit, wait 200ms, then set ENPWR. That is why
.enable is open coded rather than using regulator_enable_regmap.

Control 1 bit 2 is documented only as "Reserved", but the datasheet notes
that it must be set to one before the IC starts up. Its reset value is
zero, so probe sets it.

One consequence of the hardware worth spelling out: the MPQ4210 does not
respond on the I2C bus while EN is deasserted. The enable GPIO is
therefore claimed and asserted before the first register access and held
for the lifetime of the device, rather than being handed to the core as
regulator_config::ena_gpiod, which would drop the bus along with the
output.

Tested on an i.MX6SX board, regulator behind an I2C mux, feedback divider
100k/7.685k giving a gain of 14.0124, a 14012uV step and a 4.204V floor:

- A 16 point staircase from 4.204V to 25.2V: the commanded voltage, the
  value read back and the selector decoded from the two reference
  registers agree exactly at every point, and a meter on the rail
  follows.
- With the rail up and no regulator-ramp-delay in the device tree,
  Control 1 reads 0x45: SR at its reset value, bit 2 set, GO
  self-cleared and ENPWR set. Interrupt status reads clear.
- regulator-ramp-delay picks the SR encoding as intended. 1050, an exact
  entry of this board's scaled table, gives 0x85. 3000, above every
  entry, warns "Can't set ramp-delay 3000, setting 2101" and gives 0xC5.
- Sampling Control 1 across a disable and re-enable shows 0x45, 0x44,
  0x45, so ENPWR is cleared and restored as expected.
- Enable takes 230ms, against roughly 16ms for a plain register write on
  this bus.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
Tapio Reijonen (2):
      regulator: dt-bindings: Add MPS MPQ4210
      regulator: Add MPS MPQ4210 buck-boost regulator driver

 .../devicetree/bindings/regulator/mps,mpq4210.yaml |  69 ++++++
 MAINTAINERS                                        |   6 +
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mpq4210.c                        | 243 +++++++++++++++++++++
 5 files changed, 330 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260903-mpq4210-regulator-d4b58046299a

Best regards,
-- 
Tapio Reijonen <tapio.reijonen@vaisala.com>

