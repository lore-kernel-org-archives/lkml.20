Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793020503;
	b=rJU0iqoqVka44B2aeWxKegvUWfUETtw0ulM/MrwE5M88TstXh79ORe0KI9jTs3GPxZmQ
	 JRYkMIJxjwmSNGwqvkjszygh5KKOnhsbLpJw0jsQtnicft0WD0QISGO4jTo2fYM0kZtMt
	 Zr5juBZQrtmSyk1Ko82DzZfLr/4WL1ESjBjjiBPdotOjTiKuZAAU/WSC+33FKbaZXbF06
	 A1eccDsJDDwELPavMO5++qWOcdaSMZDqIJ/wwr/ztBJZOoKHqSiadgLw8h57M6l8nNf08
	 dtlHgbu250qeQM07MzQeNO3RMlLlonnaK9APuctK2hzVvfnhP1oqqjSfU5Wtm50GBkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020503;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
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
	bh=J019MUa2l6jJEanI9xBrT4PAePFW06clJMJwNzErupc=;
	b=OrP7A2x7bi/HlGVXKfLE9KW9QWdkwBx1I5W/AbPkYGvyqMg/ASS7+OMTygsdnV2GCvfB
	 XtluxVPmg6umA50PE0I0OhLcKPpYYqYrYpKGVvBCxFK0uAHt++vSXRQxde4GyL5uL8nJ4
	 J6Bsy0n9OsHltfCeNpHUHb/T+lrV20cpScTScxE6NUocq2zHEziAyuqQPJauISEy1ItL1
	 qvxvgNowUGXydiYN3WuKHt9bZb/s0ghEkF14klKkPsacX1fppJKMLqUo8n4yjsdIALWW3
	 Q+Kimx62ql+8AKqLXPet6oVMc1hVaSaB6L7bkwXlJmia/NbfUu7gwZGs7+LXkgG12BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gEfjqo63;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.0
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43678606A31F;
	Mon, 26 Oct 2026 13:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43678606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gEfjqo63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWAc2bvXzu/VCIGjj573RaPpTh7eJ8w/2OFAWcR978oCR8BkYBpCvFrhMFtbnDj22AUNY/h/xbl03V4uP8/fFQALjNe6iqWwCYL0tS1PWuM91EGqFLfjcql/P4VEnPHypc9IoBlL51hyrPmj+W3L5KPZuR6/dCtc8NIoj0bIpVyOItTU5s5WbDRK1cuDwpjdB5ovMER0ehW4rCb853MRiDuQURFMUGjFc7BXy+UPCGniLAScCPaJx76YwgIsHMhYOqejeFigiuyiivj8US8n2LxICGMi1ccLtA5jaHNDS3XwfCICVvjXMcBRI4jFFCsB/l0UrtAcFGOd00kUrH8aQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J019MUa2l6jJEanI9xBrT4PAePFW06clJMJwNzErupc=;
 b=kxaBmWiopSble3WZoqjgC5hdPt3ERyw4Qw1MJoW1Pqg9W2RrPqKDzxLT8Aqwa2VNYSEImIgyYck3R0WbYlPgyTDar5qkFTaK8TgKWnvMyY+eCALBqOB0U50AQ1I2GF+SGq4CstIou7WyEDwQ/YwirBjmI1pKRo4P2stwgog8Uh4MRoJBoOq/lhr3dpfAZ8HlHYIoKqdAfcrw9M5jfhvUSIJ3cie0xORNEXI9tZCbDvT+vtTqYWO3n00AuqdpRKaSzQREgq+cftln0rIq6g/SosXokvQvYImsqK6isVx0qxUdQniDe0xskmeEWtOk1woKK9HJMu9P32ZYkZTn8It4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J019MUa2l6jJEanI9xBrT4PAePFW06clJMJwNzErupc=;
 b=gEfjqo6355/6Bi7iy/iY5xEBg1aSMRLb4P3L09M9Bawmz8m3FQNYyxO4qqJZ5iRVtT1qzqRYg8WWyjXoVKmrSbkR6BkCEYO2TEQJP25FuqK5V5DvlVgyPtcz0BU3vr2RhSTup+os2efGAw72k7FC7b5ehAYQ0NhAHOB/Jt0UlZsh264WR1m4QTK4oyOfR2IaEvW3pujanku84tJnR6Q78yWlF028Zp6DfttW9z7h6pBveiBY5GLQmrYCzfj/3bUxptv2rpNWy7Z7f2GJIhJQ6hwX37zk2T5ZOgjrIC9lPsSqewfD6v8znVJJdjpS9hs9X1Iwqr0y0BVObYieTJGVjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB10827.eurprd04.prod.outlook.com (2603:10a6:150:219::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 13:14:55 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 13:14:55 +0000
Message-ID: <b1ea7bd6-b923-43a7-8dae-33db83c54ba3@oss.nxp.com>
Date: Mon, 26 Oct 2026 15:18:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx8mm-var-dart-sonata: Fix
 TPM reset polarity
To: Stefano Radaelli <stefano.radaelli21@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Luan Rafael Carneiro <luan.r@variscite.com>
References: <20261026123505.48909-1-stefano.r@variscite.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261026123505.48909-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::18) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB10827:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc73125-91c7-4bca-e48b-08df3363207e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|22082099003|18002099003|56012099006|11063799006|261021121427099003|261021123027099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 s1OmulL+DFuyjWyUwjuCr2lk4hrD0EQouxE+hzOcVyY5Xc3QV9GUZg2OoBMmNmbg2y6DtlF2j5loq1VOrdV1zRXug/jvEjzzGjdlfKrGAWTfo+ulcelrTg/6xuBgahdZBpXoqilbxW4QPPq8yOkC/jgP+UE8vam67Y0TzN6SX7h8b2AP1y+7qHN1Soz3sUVaSY6lUhM1WhsmXSBd+c/Uqbcg8/ZET4UmTOQ15cJCUZBKNtwTT9As/TKVjLG/iLN2rVpgDthf9Fn4f33PTVlQnnRMXSRP59aFdENM6chSBsAYpA8aB+cKRHyKgVLWJStxLitJGy5ZkqyZ4T4KIedjh/mw72OmPqNJvmTH0JEfrmc8lrgS9ACmm7TlRTY5s2dA8d8UY+pCNmktpHiMW1su8Uu2VY9T7Xw22roJRDEWf0fSVBkCxlvqLVpXxjTKR2vmPABDUE4GoYsf82QkRjfNDxJo+LPqXLdtzi3Dpbc3RM5hvBjrgxDf4i8+ZzwHAaPLsHztDWn83bD31vLO/eeaAjODoPYgIX3EWkcQpf7fsT5/lYpFhcMz6Om/gES20kJ3U3bYOCcjj8Jrw7sQ1fQRT0nm2Oj8dVFoE4F40SM3wj3ydvUvz1vawV3o4LHCbKU5yuZ6lcvleRwHBA4hBY4nIWbDkY7y2Vgnuk/N7MNrQy0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OUZGU2hVOThSM0MrSXVBK3NwclpuNmhuWWoweUlkVHA5OWN5RXFiakxPU2hx?=
 =?utf-8?B?MC95Ni9UVzhYS2x3RXg4eU41V0dPNEhndG5CWCt1b3JxOFVqZGk5NGJJaHNM?=
 =?utf-8?B?eUV3MzZYRTlRM1FDaVcySlR6aDBEM1VrV3lQSjlKN2RaMmx5VGY4ZDFHMG1s?=
 =?utf-8?B?RDVRZUxhbm14SjBQaEo1dUR2eWIvZXdoOFJ1VVgyNU5OUG05SDhISXhYSUkw?=
 =?utf-8?B?MXEvMjBWT1d1cUw1UTJnVit4UGh2VXEwU3ZxeXhGcVpHTXVkVHJWME1BWGVn?=
 =?utf-8?B?U1FGWk1UUkNXeGJTV000Q0xQd29HVllxN3FKRjQ4cXNOMmovN2NLaFFHaE1E?=
 =?utf-8?B?QWZoUnZvVWR3eHNtbmtXNDRFY1ZsbHJyODRiOXdGNzRKZEJVUGc1L3VMM2Jq?=
 =?utf-8?B?eFdFQ3Z1ZHF6OTI0VkFid2JtcC8vTGRVYi9LdWdpZmxtTDVKYUVuUGdqRGVo?=
 =?utf-8?B?RUE0VTdINUlFbHlraW5RcXJTT21RLzlJZlBudGJVYjd3cWZHU1VNbmVjUWlL?=
 =?utf-8?B?OEJ5TFR5b1pSYUhwQnliTThiTzRrVytrUWo2ZWk5Y1ljdlVtSTRySzFnSjlP?=
 =?utf-8?B?MGNyYkpLckp6QjBLTURVLzd6aHlQUDV6L3RGdTlhQk9valdvUm1QcnB0cUpr?=
 =?utf-8?B?ZkM2VWhmei9tdmNOa0E5cE9CWmI2aGhtUnVwKzZwUWFjc0dCdDFiQkpiQTVa?=
 =?utf-8?B?NmJCSURlN2JXZitka1RlL3ZrTzlaOVhyb3RkZVc1aEs5YVIzTys1QzBUdWJR?=
 =?utf-8?B?SUhXU05zS0dCVmE1WGRITk1OR2NVWVlQK2hpNTlNaGlHaEREWXJqbUt0Y2dk?=
 =?utf-8?B?YlFXSGRtNFlFd0VPM201Z1ZhbWVoeFRkZUo0bkV6STFMSm1hajh6VkNNTGI1?=
 =?utf-8?B?aXVLTDZYQkhCbm9pbnBUZDlYU0JVczJ1b0t0OWYxWGQrRmdxOUFGRW1acEpl?=
 =?utf-8?B?VnQ0U0JsSmNPWFlpTFJXam1HcWdRSHcycktZcHRVeVFTZ3BONHpXTGZFWnVK?=
 =?utf-8?B?OXhkS3hqQjQzbU03eHk4ZXkyRnYvWjRVV2hyNmluai9VWUxwaVAwVEdWaDNV?=
 =?utf-8?B?c2htT1lZL1pXWkpQUHhKUkI3OWdUQkcwVExKdUt5SjVKUUdhZ0JBUXpWRE5N?=
 =?utf-8?B?S2V6QWxHK1pCL2k5RkJ0MWVQRGRsNW9EMXI2cm1pWlpEYTJpU2xpQVlJR2d1?=
 =?utf-8?B?cVY2enFBTnd3KzJvMURhV1BXcEZmc2hDalZGUlpwOXpHODBiNnRmRXEyY3c2?=
 =?utf-8?B?U1BEQjA1WVdURGZsWU91Wm81ZVRFNUJxVEhQMW0zR0NWWlFJSWdDdG5OWUxu?=
 =?utf-8?B?ZjgzcStMMStyVllPR01JcHVxNmpUZnhxVlYvLzcxcEJZVUNlVTRQQXROaUNx?=
 =?utf-8?B?SnA3WWxMWE1HNmxTdngvdnNxQm03S2V2ektzeE05TlVzNHNiVC9HOG1STWhM?=
 =?utf-8?B?L2NiWTJESUtrKzh5OU8xUWkxWjhmNnZIUDFwbmhKSmltKzYzMHZZaWFHYjZC?=
 =?utf-8?B?UHo2VkdmeXVzbmRXeTFrc1haNFVZcFNoUVdWTkVWckRLUmZIeDNlOFlyam4w?=
 =?utf-8?B?WGN4ck5ZVWh5WWpNV1plUDNuSzN0bmhFY3NKOHBvYkZKK3VWQTgwclhRS2Fj?=
 =?utf-8?B?emNXQlRlUmZYODRKeHpOaXFxanVlS3pBNjVrYW9HQkhTZzJ0WlhCTnVEeHNY?=
 =?utf-8?B?Y0VidWFxOEpaZGpSMTl2OE04cGlNNnlpSmFVNFB4TjZzUTZpU0FHUnJPZ0tk?=
 =?utf-8?B?bE5VckpLZW9UUm15RVp3NFVIQWhPVkhEUDlkRFM2TkFMczY4cnNLOW1RWWt4?=
 =?utf-8?B?TmR2bHR3cGU1b3haTjU2amZiMW50dUFBN044dUp5VDljSDNVRE9BOXRLM1Mv?=
 =?utf-8?B?VGlzL1lOVmpNSkZhek0vdk5ld2xzd2J4aU43d29acUNzVFYxcVhsVVBiK3Iz?=
 =?utf-8?B?ZDI0aVBxcjd5WTBHcjVkS2QxOUN1REJjcWd4cnJxNk1WT1VnNURCYU9oQy9B?=
 =?utf-8?B?b2FYUVZDdUFLVThuMVFTTTlmZWxPblVNMHc4aWdHUTRyU0g2OTloRDNqcnFF?=
 =?utf-8?B?SzBzRzRMZjFYZDkyZjdLYW91aHJJaWZFT2xka1p4NmxYYUh2OTh6MWJ0V29M?=
 =?utf-8?B?c0FrYUNXZXZ6OVB6aDh1Ym1tTDJWMFN6QWxzWXBJOW80TnZhSmJlVUNlSWph?=
 =?utf-8?B?UWVCVndMTC9CYm5peGlOcGVWS2NLeG5WV3p5dVRNU0VLSHJoRXMrVGg5VERi?=
 =?utf-8?B?ZlRXS3BvWE1MMjBmV05YUXVyTzVycFQ0VFdxYTdnem5XZGFCWndISEFnOEx1?=
 =?utf-8?B?RU9zdnNXOEJVSlc4Z3BQRWROT0lwRXVSTTlQN2R5T0ZuZllncnA4dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc73125-91c7-4bca-e48b-08df3363207e
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 13:14:55.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bx9j/rIPHbwNx0mSIe3W6vqpZZvcLE8tLJ4JyvaeXIqObqaVVfSrzxwj9KK7jAprS0cCRhSzVH+jjcwha8rVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10827

On 10/26/26 14:35, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> The reset input of the ST33KTPM on the Sonata carrier is active low,
> but its reset-gpios property is declared GPIO_ACTIVE_HIGH. This
> reverses the asserted and deasserted levels of the reset signal.
> 
> Use GPIO_ACTIVE_LOW to describe the reset polarity correctly. This
> fixes the TPM not responding on I2C and the resulting absence of
> /dev/tpm0.
> 
> Fixes: 770aba46ea0f ("arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board")
> Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
> Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> index 57d29a5c3821..2644b7c1239c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> @@ -259,7 +259,7 @@ st33ktpm2xi2c: tpm@2e {
>  		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
>  		reg = <0x2e>;
>  		label = "tpm";
> -		reset-gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
>  	};
>  };
>  

