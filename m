Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792699471;
	b=vqW40Jo5Pvf5aoFmq0BHMTl4iK8/5fpD+226TprRqojVnLeP+/g6hmp6N1+lciVTl7xW
	 rMTQDqV2eVOQjumdFgYPyDL2uTWNZC99rb5tWaIAzJSL7YLtXvnUukDKg8iJ4r47+ULlc
	 BELYY0SOSx/9HPUa8ms/5xGOFbga96d/QqIE0Ae2cwn4sv5BkQ0G1zPy+0WMHD12QBqN0
	 ZdkZQcTaY3epaUQ/z3FAjz5b8/cclCZ4mZkkGSImZ4YoCUN6MOANmR81BT4FwsMh7CJys
	 E9adi/gpRC6m2SFiRrykIIpVM2LH3RV2Zrgd+lUImp8fYf8PAkc9uB4o68Ojli11W/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699471;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=N4LHmnMG5jgl2AKpldP4g7DvLTfcPFsplanH9M7M56k=;
	b=dQxNDwYbEkUYHqPq2JibxxrYAi7bx8S7RO5r/Bq7MO49EZS9G+ds7n+v/6rMVTf0igG1
	 7/ODReAmuYtG9gF/qXSRh/POXhXD1c1piep04CBJGDAjVBvU4hsqhu5rX5YB1yFOg13m6
	 hTbrtOQ42gS+r3lfHpKhihKRo3vTlrH3FDHaFcRe1vv0ZbJWrFKkn5eqoUGrd0LHIoxLB
	 +JmWn1OozEahAGu203RpduSzANMvaNW/ogWUKUg3TiDhE1+/0XhENQr+z/mZ0qmrJYg1T
	 XJZd5qlkhK70GtEYdIgoWHSYOHedJL3VERlIJKmZ+E+Va0JHF8ZpC2gYyE2mJf+FHzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rNX+FmUE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.63
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50938606A319;
	Thu, 22 Oct 2026 20:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50938606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rNX+FmUE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIxZ9Rs3qq4EFMQxpc1Kazzuwb48wENJLvnSXS3Y3IGjTVW1N5yoNfuBgRIF0FF12kRWuEKZZeJoB4eg6x7NU5hZQ8jNM07F265r5VWQwPrUr9dGndULccUXr0fk1MBRk5TmAYDLm2deO45NFgtvZy5jFB8QjizKCCEEAVvvZw/Nfaqjt8xiSJtZFJINhj9y6iuJ2bX5lOrW2KnBjG3IPayO1WHo6INWXqExnbTXzr9zOIOfEA/9aAv1Lw9dxLU96T7aCommy3KZQbqRDS02ZE8UmZeB8ueRdDnmObW/kydZ4s1AsgqOBajemDjD7gmiSuvXNN0Y7pyClYPPk5pzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4LHmnMG5jgl2AKpldP4g7DvLTfcPFsplanH9M7M56k=;
 b=pyvE93XRY08LzzycuSYtXPJx0zevbo9Zn8Zv2JchG7CSU9VGx5oHuo/Iv3k6KM4nBQ23UvR7rp6glOD8WfYcdkIaQcAI0mrI2fayNiWbRNeCEaTSfneqZ3USNeEGKBkxoshNAnKd4sPP5z6eYQ1Xfq0ENzM5Z+ALUND+XKp+66zcmXVvGw7+IvhmyuTMsSmjglwucZFmKYmTLbLF8UyIBeYx0EHuPAtxOjHVcTcGXekrnHgGsfhbeQ+dh37uQYFFW4RIvEH283uu6svQH/JrRv+Be0SXkOH83F0Nq8Ohp3m/SGOBEr5ywcp45MI9pDTtQswoZxOZlhM/bPn5c2oELw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4LHmnMG5jgl2AKpldP4g7DvLTfcPFsplanH9M7M56k=;
 b=rNX+FmUElGfVjvji3oixwm2JFqj193RfW6qnp4p6xkk0cnYEiJhN3lPa3RzZ2TIdwsGa3iyMH/eLMQVt9iBut4xy6ghlcrxC2ychJedY61lGH5QnWGZZDxt/kr4/LUN6Aa2iP2QCuboxis4pV89R1yJBU1lnMpyhqAe48+C5qdVNHcfLHxoKGDmKZtvtGCufHB6CidH7rQHfsg0xGBeNW/wC+mTOAmGvcjJGbcK5LaO4x25187RU/JmlJ4oYdotFgAp0pv1DqJIexfFO4YEZ+R8oGMO1BkuiuKyh+9gwc8B0di21EU78WHo6oDILHTBCIyAdz1l7PlJ7Xb5e57jSwA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB284075.eurprd04.prod.outlook.com (2603:10a6:290:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 20:04:28 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:04:28 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: imx91-tqma9131-mba91xxca: remove pullup from CAN pins
Date: Thu, 22 Oct 2026 16:04:21 -0400
Message-ID: <179269929794.1281258.10475939228955504729.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
References: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0088.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB284075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e49293f-da67-4fd2-6e3d-08df3077ada9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|19092799006|366016|261009223327099003|921020|56012099006|11063799006|261009221227099003|261009221727099003|261009223027099003|261009220027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5LQeYJmq+7QCiYh2ZbbqPqAN4QKARmOkLLQ/o5vhgX7N2Duv6aS1X6O81pifUpGRO0oU3Mok798qb4m9y+ZcbsSCW106yi6d+rKGUgMgkFE7PK9sLVfAckx0j+RzBD0OAoG8L1DL+QoDrMxp7+k9MxGpU+vS72Uokfwu4RGFFEz3GuhFPppOz8KL2NNRyyZXKUCnHtU+4W6KtSOvWhgh8nHdmfADYnLnnlfM+T/ahJGTWPUSRgHUbuzzQkUBb6MQp5/gMqjdrGKdyj8qI1XgbUdX8zo0FE3/p30j755TAplncoBY04uQGIYTRffz9FByZc7QVJY+wTbAGZeqJ2eZci3x61aU32LKOWhIP2PI5OLTIOP4KEgEJIFKiYzF/aBMlPWPTi5eyGQMrRa9Q11LnH6MozVUzGTX1zMbDU9F3CTRhi+lafklgQ39iNsi41g1PRRFJaDgGXbujSwvrUtEo7sJIZQX2rlGfOm8LhEjqbkkZyOWbWRM0sdG7SJUQMCZanfrCiWVtJ8VwivOIEshJb4Zp7VoEBlr0ybydZfkMKtb1RX57EVD7e+7zqEH4bBZk84zH/8l1XB2+IeXF32TumSV5Lh6z4bcRCqV1yZpIZmmx5yoLLvqzo0Jj1VhVLvelJqc+6fWIEhCJTHWX+IicZdbavFfws2qq2R5VxSnR6pBriCHltHZeRzEi2m7CLaAOfmUa8I9tc4OH8fcnwJKvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(19092799006)(366016)(261009223327099003)(921020)(56012099006)(11063799006)(261009221227099003)(261009221727099003)(261009223027099003)(261009220027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGVxQlhLZmJBc0ttWm1vMUhJMnZSUzAvN1VDSUM4TTliMGZXeGhTcVRLbUtZ?=
 =?utf-8?B?OGg1R2VZWXBWOUo4cmR4NlJBTE5qRkI2eEhIQUNNbDhORzZDNkJyWnlvK1M2?=
 =?utf-8?B?QWNKS25oRzhCako2VXhESlJNOGsxQm1Edk11bGY1b1djZ2Q2Q0Nxd0VHeE52?=
 =?utf-8?B?WlA2NjBuZWI0QlNhSCs1RzRjYVhkVFMzaER2K2N1WkloWndWZzZBSW0yMG1V?=
 =?utf-8?B?T2UyWnhyOE9WalZGelNpNEhXMjBZNml0Zy90M25RZjM0NW1nSVZxS2hqTGlO?=
 =?utf-8?B?MUZMSkJpbEJrdWIzVjh2NHFvR0RQeHFBY3d6Ny9DMHU4SWZNTmFTNy9YbUhz?=
 =?utf-8?B?OGJZaEcrQjN1NkdRRG40UkJreldSdU5OVEZzL1NFUVRuMFhkYjZrZmlxVHlT?=
 =?utf-8?B?OUtja0RIRXBUTUJrTUE2d0Y1TXF1RjdsS3YydDRicDl0NDI2MXFubmNodFcv?=
 =?utf-8?B?SUlmT2lsTHhCOHFTZW9ZaTErMUQxelV0NXNLNUJvVm1JNitvSFdoMTh6QWJQ?=
 =?utf-8?B?YzlMb1BkM2VOTUNMTjB0WFdCUkdjRHR3MEp5T0hzcFhjbncyQjhSakxIeS9M?=
 =?utf-8?B?Rk82dE4wVGE0V1BSc2pHS3RBSGdjYThLVUZiQ29INUIzS2FlT0MvWU0wSEJv?=
 =?utf-8?B?b0FTcTIxUjB5ci9qZE5uY0Q0L2VGSkVzNktramZRRFFFak53U1VSUDEzdnFJ?=
 =?utf-8?B?cTRGKytsTWdQcEpkZ3pzdWlMM3pnbnlTT3U4T2NGNGc2cjZIWVpJdGFZNXdK?=
 =?utf-8?B?Z3BYZXNpNDZCNkFMK29kTHpjenMvZWRna0VlbEN0TUlHa3JXeUdTZ0JhS0hU?=
 =?utf-8?B?ak1vc3Z1K0xsLy9QNlJQS0d4SmhkTkZjWnpRaE1HY1FPMG5qemZaUHM4ejFt?=
 =?utf-8?B?ZEE5OGNYdmNSMGRZWG1YMkF5ZUZmSEtNZ3pMNEdBN2xBWTgxaHpoRFNRN2Ix?=
 =?utf-8?B?L2hLdmQzL1FVa0owaUlNTjRsS05aNVlUa1lYTjAwTEZVMVFqV1g4MUw1R0dF?=
 =?utf-8?B?OFhHbmlSRmJpWWpFQVp5Tzd1WldPSWlqZXhMc0xCcVJtZUx4SWFxdnRxQXVu?=
 =?utf-8?B?U2RwZ2k3MUgrazVrdUcveC94QTRTUkY1M21TUkhHTnlZZDFsL09BbUxQMUdF?=
 =?utf-8?B?TUJtVjNpNU5nUE44Qk1pdjNYaDJTUVBwZ3Y2RXZ1QXA0Um02V0NZVGxaOGNl?=
 =?utf-8?B?VEhIbEFkNHpucFZZTUVGakYreTArcDR4a2lUSWR3cjF4ZFpoMTNEK0RBV1RP?=
 =?utf-8?B?eFczL3o2UkZiMHFMQ3hyaVd0dTFiT0tEcnZYRVlVS0ZiZ1R6TVRuazkrMGlE?=
 =?utf-8?B?MjZuTFpucW16WTh3cWd0WFpOcjVGTkdibUdBbGVZTXVCekkvUDVTWkc5amJV?=
 =?utf-8?B?ak4wOTVtb1BNVWc1TFZLaWZ6QXpRTVJ0ZnBLVHdHU3YwbjFEK25hekZSS1Y0?=
 =?utf-8?B?Q1ZNV0xrTk9pd0VjblFxRDFqZjh2WlhUNVA5SnlGWW1OaXIrbUhrUDFzTkdh?=
 =?utf-8?B?UkhBZk9ORjgxdHQvWk8wS0VKS3lqSEJmYnYyTkkyY0t1aEpLTi9lemhyQWVL?=
 =?utf-8?B?QWZTeFFjMSs2V25NS1pvOEptVm9SZWhZMGg4bVRKSDRla1NNMU9Ec21nTXhR?=
 =?utf-8?B?UUd0YTJobmFkSFNUOWcyZmtkOE43QXAzaEpMSGE4Q3dMbG5Jc3RtRlN0dkpj?=
 =?utf-8?B?OEJZNENCdXdsL0duUGkyR2ZKcmtNWGxxZWIxOTRic04vbmF4bFdnalJjdElX?=
 =?utf-8?B?VktHMWR4b2hKalZQLzR2VUQwc0VPVVkxNytia3I2QWtLQkhKVVV1bzRoMzZr?=
 =?utf-8?B?czJQL2RKdkxzV1VpREt4Y2xXdFFjZUtvRUY2engzWmtjSnY3TDlMS1NLTjEx?=
 =?utf-8?B?MUwrT1hxQVNwMm0vTlBwMFFrVlZ2ZzNGNkovRzYrL0VtMG1KYkpLSWVHcXV4?=
 =?utf-8?B?a2l0MXNuODNCdHd5c01JVTg5bEMxSWNPT0V2eTFZMlZNYmdqMytTS1FQUHFY?=
 =?utf-8?B?U3cwUFc4UlU1dXVDNlNPbC90clk5QTRFYXloSDhFNG5iZGhpWGQxQit3eVJ0?=
 =?utf-8?B?YWFxcjJkMXlYZEJZV2JabHQ3WDl5Sk5TYWpmbUNWWm5TazVCU2VWWmRrelJq?=
 =?utf-8?B?WVhCOUE1WjVtZk9YMUVGMmVwakpONUxDWm1yTElVTFVvRHZZdzBKVlp0N3RL?=
 =?utf-8?B?YjczUEZCQnMvYXhXdDI4azRqbnpZcmErNnU1TmFsWWV3MXpHOFBEVUxlbHRS?=
 =?utf-8?B?b2VwNXR1aDhSakRGRkNPcXlIOFl1dUVWenJHMzFGbUI2QmdEMGprckN1VUlq?=
 =?utf-8?B?M3A2RnVJWVpnMUIwT3c0UDdETGtYUFhxZUxYandocXhxelVIU0JFTWV2WHBF?=
 =?utf-8?Q?3JZLkCYa7L4fhfEKChEKEGuhTp6YE2k/d9kwW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e49293f-da67-4fd2-6e3d-08df3077ada9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:04:28.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xjp1IhwRCQFJWhaX1xJKUdK6RUn9ATRgAkje1SFkXTAP3QSZY5qaRtHDohtb7dftPCk1QjbVrmWG1KHCW1iVEuCDRg24LVY/jmQnZs8oDGNCguUC1Enky1iF/kIBhPTv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB284075

From: Frank Li <Frank.Li@nxp.com>


On Tue, 06 Oct 2026 12:13:45 +0200, Alexander Stein wrote:
> Board has external PU, so internal PU are not needed.
>
> Fixes: e71db39f0c7c ("arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA")

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/6] arm64: dts: imx91-tqma9131-mba91xxca: remove pullup from CAN pins
      commit: 127051abb3d20c9013bd780232421a4911ac2bcf
[2/6] arm64: dts: imx91-tqma9131-mba93xxca: remove pullup from CAN pins
      commit: d6eb58424ab25e8cbba0260ed9dde00c6d0ef0d1
[3/6] arm64: dts: imx93-tqma9352-mba91xxca: remove pullup from CAN pins
      commit: d566b024bd078ca229151ae5d0a65e1bda297c3b
[4/6] arm64: dts: imx93-tqma9352-mba93xxca: remove pullup from CAN pins
      commit: 1962c4a97f10d271b8fe8788f24151a472c1b1b8
[5/6] arm64: dts: imx93-tqma9352-mba93xxla-mini: remove pullup from CAN pins
      commit: 063bcb388783178e3481ed33d6f093ee2a0c78a5
[6/6] arm64: dts: imx93-tqma9352-mba93xxla: remove pullup from CAN pins
      commit: be98e447f1f2252b327005327c3e763332647f3b

squash to one commit

Best regards,
--
Frank Li <Frank.Li@nxp.com>
