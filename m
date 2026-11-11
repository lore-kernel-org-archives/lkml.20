Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794386481;
	b=Kop6BTn2gf/gtY6alhAq/830esSLoeGVbiIkLSxUr+WCAEzbNKnt1cvfPa5rkR3a6om4
	 T/t1UqA2hBt41oNtptBRsYlQUhpu+JJMpYBxuoYNxnV5MN3cf3nC7FnIFRKchaOrPG9Lm
	 1K92y2aa9/PmJbQ0gK9fCRezhMoBvdqi5kkq+MUr8uR7oXvW7cKAp3Dpnt7KtpPImzAlj
	 53n+zkqVLY2pmhTO+iNXLD7AXQnBdPbd09x09il9a/3OXrA4oJKvDzebs7Aa4bllOM9U1
	 JwLHAOvw9EFbSMKhsKBNA7xdF5fxBsbixVjYriL+YjC2COvIB0i2cu62xfTATHfeLZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386481;
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
	bh=npRwoxW/IuV0TKrPySSFRRUXATkD3ZambhQqw4vM3/c=;
	b=ZsocaLWLZ8GwhgkYMDA9HzP/CP5XBU1IvwFipbu6OICCxJTYgZqpXHXLvUuVbLYVf6eW
	 ZTd9C2rraq2L4uQfB3IzewNX/4fhnV3zfCCXbLC1iznOP+DvUsbK+XezYxxJYJkuSLKCD
	 YECC5u82h4XCqb4ABy1s4WM9rDoaXlBvybV6USkY8a+eNUdazGUwPZwzVDh5YnChPGvQg
	 +d+kn+PErjCN7zrPSHvK80gvELq4C50fvV++yDHonoz+s+Ez62/OLTbtd+9qELv/t9czH
	 CZf7onQqNnrKchaw0xhE4e0k4zXaoniMrDot++N/Ewm0ueYParcTyv+L/sI4z8uYddQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="f/smcXI6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.42
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6211060A2616;
	Wed, 11 Nov 2026 08:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6211060A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=f/smcXI6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7Q0svrfCw07UbZ7RJjrCUlbSfO3tbdL5cYV7RwR+ULUXf10NBZsJFww/9/nipvgM4YkuPs1BIDI99a0TFkjfRL6qOae3AldQErheyxu7Y5qcUaaQJDlVmd/v1CSTMo3xab2pFc204yS6wQdNuKBZaiMK5JxRUy2xHbQKZV0V9g8t2nJrtmqiN3FklKcLZWNVirvD3vtu6jLC6hn0m7ib7LpV5uoWxdk8HzNw3+9D9jBi/R9IMCDavrS4uwQXgygYg8mzKyChFlCT+fRS+LSuRPWCBt5jLdIQKlX5IIMyyxZScahT8a8TPMlXqfxeyUSp5bUmK+B1kC5XRglqYTLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npRwoxW/IuV0TKrPySSFRRUXATkD3ZambhQqw4vM3/c=;
 b=BTGjcFr1u0WWIG7mFthHlySTGGDFdlfXcr0EXNCLlrDWpUPRoHlJrE9k+IJ4FQrJdP3d6+5RkT5XCa03rIOQCJbOorcMbMx6bAWe696s2USGk/pTNzKFQYBzits4mZrgkOOPYyK2R7RFZlC65X2ts3mdV33dlJDfkcgmD8WFQAHD5ayeRZOZ+exSheHXaWaMijhMs/5tWDYtmWB6oEOz+AR0WksN8Zr6z6aTEJcL7ZcgTf3EAyHatp1gQU83pJsCPx+ol3s2Qie/jFohZ9YBKeCS58m9FzPUcxscXUeOxNYv3UCwlK3tyYPyqKGCxB7huPi17A/fQWGmgWb8pNwzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npRwoxW/IuV0TKrPySSFRRUXATkD3ZambhQqw4vM3/c=;
 b=f/smcXI6A8Y2cT93s3DmOly/L7b8XtYGFdvfxBY8Y3Gn924KJN7uE9iPEkgjKlz7WdyxcMQwEU7Bv+PEWK6pJz6PkctGIROLiKuRiwRkTTXKwFWzX0oBmeZyASGxXuoAo+tpJc1e8gey0MRDc0GhFYbXObMCzH2BAAk+tEtD1RrezcCrHnOWRcAQs5Adlq3PLeguGCdOHQSvF6hOiu754iZn+e7fhph9KNNsc3dZpPpLEag7VU09IqDIzH8H2JXooaTjh7FTryeUNmqDNawFBvVmwwk6MQT8TMm0X5vx6HW6exzOxMFDtZ50rnlO/w7pM8ALiqHc+LIf1hMBN1yvhA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AM8PR04MB7474.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:41:18 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 08:41:18 +0000
Message-ID: <01cd7ae5-29f8-4aa7-91f9-88cc4f0b7b53@oss.nxp.com>
Date: Wed, 11 Nov 2026 10:45:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add
 Youritech et050fw01-kt
To: Frank Obergfell <frank.obergfell@bytesatwork.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Walle <mwalle@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexander Forsch <alexander.forsch@bytesatwork.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
 <20261111081150.950272-2-frank.obergfell@bytesatwork.ch>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261111081150.950272-2-frank.obergfell@bytesatwork.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0389.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AM8PR04MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 338fa310-f451-4e91-9330-08df3fcf8dcd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|7416014|22082099003|18002099003|921020|4143699003|10067099003|11063799006|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	swogcptqk1O6F3X9lsjKSibUXQWQSazyBwlV50y+CUjKqQCrvLoSXUwo0intMfa90g1A2MVu+fEu6aziQ/VHzPOMuGQIgCLUXACKOMbdfn/YVXUBi4IElXOFNC4APf+kqtEFzdRR69qryF4jwl2yMuU4zJde9kLuxfV+jffJZHDGJ9LUOTPGkK9P93w04cpT2SwbvXDGJG4u09wEuXLmwWpCeIt3sXxZ4mksuj9oVY1e8eJiWw1Kch9N3mw/TrIJvzwRSKlm3T8ZQDuBY8jqSPgHzu6mlUbPCXPX4fymEGqCIyM1SKpCGb1uJv85AtI3XmBFfU8ZJzZZPTSjVpNgK6+x0hkY2mXoEvh9oCqH7KV2hASB+2uBYdsMQxS88TWBmKK2/dlX5mAseTFFqRiFiCaWou2g1+/KbCAinvC72uS5Ikl4ay3MNYbdi0X3nNiTXlVcPYiznS6xmJuEjJfCBPIvZJEKe55gK5E2dgT+lIqzWfkaXe/91Y9Ri2J+7Ra+eKwlruqn9lFGkExulSPRiU7Kqiuhn/aSjW7u9e/hVAjXXftj+lk1zAz4C7OXJw0Da6r/glzQrUh+59AXwzNExUVfP33VxNWEJ3jzTcPVgJFStROwIxyJwlMT0WblY8StoCn2EdAS5Z11fiFJ1WY0seSlPyMfjSTuWOt0KGqMlnX/phbnugvSJsGnFsnz3E9TlLwy4xSsbmRlLoNb1xMWKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(921020)(4143699003)(10067099003)(11063799006)(261026121527099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDZmcWZYSFFQN3JobGlCZUEzT09SSUUzNkVIYjFKSTdabjlUTUlsTjgxclN1?=
 =?utf-8?B?ZmEwMzdjbFpVc2JQMk9xTmNlYTgxL29sZ3Rva0htMjh1WVYxSW5aWlRKWlNE?=
 =?utf-8?B?UkdOb2VzQ3k0Qy8vMkhPM0lmU2NyTlpydmlQQ1NVOXdwL1dyOUY4YkdnZVg3?=
 =?utf-8?B?dDhoOXdHTWlzam40ZGNkSlNFbnRkYWx1cjNHd3NzbmVtVWtnY1dKSk9PaW00?=
 =?utf-8?B?UmlzYTc3TFZMZGpKM2h6dDIrSGlxOGFlcU1ObTVjTmhFS3RXVGE1ZHdiaENK?=
 =?utf-8?B?TE9DRzhDMHB4TE11YTQrdWdTajhNZ3JqVG5DNDBacVNtWnQ0SmhqYTRQRm9m?=
 =?utf-8?B?WkxwaGNGRUJpQkJ5ZTB3LzlrMTJNbUhrZTNScjluTEZ2SmoxMm03aWVPWUhw?=
 =?utf-8?B?Yms0T0EzYjlxRUlkYXp5QUxtMFBQNU1wN3ZLK2xiellPOGNGelBqZGhKRmlY?=
 =?utf-8?B?V0VNQWFWSjczMXdXN3BYK0RmM2pBZUVBU1YwS3hlOWp4SnNZNmV5NFlEUmdG?=
 =?utf-8?B?VXFiYXRMYnl0QW42YVFKL2pmK1U1VXdWRVNGS0JhQ2VFS2VqN1JQTk5yNHd6?=
 =?utf-8?B?WHFWV1NTUnlUUnRyYjlNaDcyUTVxNHNXZ3ZPckFqa09VMlpQU2VFbTBLLzY1?=
 =?utf-8?B?OUxYNnZMSEQySUZtajRONGNZNDVlaEU0OS9iTlQvbnEzWFpwU2tLdFI1WmRj?=
 =?utf-8?B?WHV6bEdUTG1HbUNWSWNwTlZyMzk5MDBTOGh4N1NJZGtxSFA4K0xqWGt5MGEx?=
 =?utf-8?B?dTVhUTR2SmFNY0ljTWZUaTB6QWo3SnpVcjYvSVNGUWV4K0VaZlJOa1B1R0py?=
 =?utf-8?B?NjMrV1RCK2svQ2NZODc0T3IrVEJva0VrQnJCWkI3QnEwUnZ2MXFnYkxvY3hw?=
 =?utf-8?B?S3VIclVva2txakZhZkM5R0JqUi8xbmNoZUVHd1pjMHNaclIzTkZzTVZpVVpC?=
 =?utf-8?B?UTBrWTNsSXJuSjV6S2ppTklQYjhrY0RTQUxPM0pPODN0QUJYZ0dRMkhIYzJ2?=
 =?utf-8?B?YVNtZXA0WVdTemdiSURNYzcreDJUVnphWmY1L0F5MlhNOGFBZnBJZmp0dDU5?=
 =?utf-8?B?Ui9JaXFJd3djNWUrb09sK2dmK0RuaXd2N0w2MEt0Z1dMSXVyZVJuWnh2RE1s?=
 =?utf-8?B?N2VJZGlvOGkxZGp1VzAvMjhPZWRzdFU2eWo0L2FBQm0wM291eWhBMVFuS2lQ?=
 =?utf-8?B?NFZjVkc5dG5Kc2dzTll2V3gxN2h0MXpCSDZPODROUCtVeFZ1UHBwcERTWjA2?=
 =?utf-8?B?Q0xhNU1odERLU3czcGdOZ3BOd2JMQkdiM1gxeFIrL0ZtUzFlWC9uQ0JBYjd6?=
 =?utf-8?B?NUlER0VweEhxZng1ZjYyUXFna0J2S1o0eERzcy90dmZGbVNzeXZaN1VLVDk5?=
 =?utf-8?B?UGRLVEZxYmFjUW8ycEVVUGg5VHY0dzRwT2lreFZCTVZhZU8zMDRrYXNjWEFZ?=
 =?utf-8?B?R3BhSlZGS3JiaGVtY3VoTGJVbzRSdFRNZFJpdWcrNWFWZE16cnRjczdEclVR?=
 =?utf-8?B?bkRkdkQ4bFdmWTJ1ZjAydGp2QmdFNDBhVlFCNFU5cnB6U2Y1bisvb2kzOEFV?=
 =?utf-8?B?c1RONkUyYkF2VTBNMDVwTTdzNHpVN0luLzZwQ1p3SmlCZ0daY2ZvNFgyT0gw?=
 =?utf-8?B?NmpLL0E2VW8rZ0VJVk5RVkU2NTBHWk5KVnNMdHg5dTBSNmdGNzNoTjBMUXAz?=
 =?utf-8?B?SEVidGxFcWdDSlJ0cVR4SjJNeDUwd09CMmxZWGRoaG9wK3phMmRvNXVrWll5?=
 =?utf-8?B?MzdQNjI4Wm5PbU1WczhsY2VPVlZXUDFPZ1M5b01PTlgycnQ5YUFxbnhvRHVv?=
 =?utf-8?B?Nm9QWDMzemIxbmxhakJZa3p4MXlqYWJSQmRpT2xOREJTa2lUdncwWlpKd2Q5?=
 =?utf-8?B?UlRZSHhSRnRxc0hKUVhlVlJuM0ljTG1JMlNpMy8rQVlRckNnZWZvNXFhSHhW?=
 =?utf-8?B?djdzYkRwTnlwYnhnci9qbDZMeVRKdTk2K1c2TTlLNnVMSzFpSGpYK1lLUm5P?=
 =?utf-8?B?NCtsbWptTkFzWVdSOTQzbTg2bWV1bmNiSU14RExaVFJ4Ui9IcW9HeEI4UHla?=
 =?utf-8?B?ZjVpbldXWWMxdm5NTEVQR1VpZG82dHVtTkJtVEIvOVozZStEZzdha2Y4QjJQ?=
 =?utf-8?B?Y0F1czdyQ3AwQnBZVFpWRC9NMnFYKzlUK0R1QUJPeDlIektwakdYckJuV0pL?=
 =?utf-8?B?VW9taVRDa1JUSWRNeDdKTHJYT3pUUStOWkRJRDNlRTE3WDgrN2h3aHlvellk?=
 =?utf-8?B?bjU0M3FBR080NTRINmQvbzZJU3hsSzVIdFRmTlR3M0grQ0IwWTlYNkFxZWMx?=
 =?utf-8?B?dVUxV2NmMW5tbHV1Ky83LzV2Z0tQTVV0V3BPWVBuaHo5MDFTOHVOZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338fa310-f451-4e91-9330-08df3fcf8dcd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:41:18.0994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcN3SR0L+zd73d0oghgZLxm/m/w8mczoBz8+iTP5eN6yPKZPtG8FGa6r4khCeOCqBYHoJVhrv+qX5CL8FmGC4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7474

On 11/11/26 10:11, Frank Obergfell wrote:
> Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
> compatible string for the Youritech et050fw01-kt panel.
> 
> The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
> physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
> display controller.
> 
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


