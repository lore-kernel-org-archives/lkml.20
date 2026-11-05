Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793873494;
	b=bOq1LERnn6P1LUGI38pNilCdobFBVIDCFFcbi3r6ZSl8T7vfLI660m4vLtHZ9BdaV115
	 QVDqlzdVn95K8Isuqb1aahdy0TTTdhIXje6y3gd/ZtCLrR2XdQ9bEquJMa2AidyWvNhR4
	 JAYNskCsctweqdp9jdwIvkMFpyIuidJVLc+xudiHvmB7Bs1ggMcjke4emw4NWMz+IvIeu
	 HQKgS50QMMu99vsy6V/LhOxQi9y87BVAFfnZifrCUW/qpuBWrPYjYgjT8BgN0AlQHvNYr
	 pmreyt2OiDb0pi4qxGUdZnCQbU6B6EXKCUY3bzigFOkJt3UBSwMaXCZpwJc6lT+st1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873494;
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
	bh=edWvdqgTsBCErxpmnz+fY4QoEhA1kOBzuNQxr84jpS8=;
	b=k2fwt3+Jiyx6k13swWaEX9TQZyXkwE3Xcbs/13YYm/Z14MsvqVNqva/sEvxwGmTrEqjW
	 uoRadNu1F3x1PV85r2f+tDWIRhKhd89uTdRGXISBNHexe9BL4dh5JaJVPR21WuiuNVVmB
	 x8sKXSssDWc34jFFsOzE0A10uF54vJnKZEMS+8WamdtUzZq1/R2Y5KUslGcpeUUJpIm5J
	 o4oM3y/4UsJoXVe0Jjz3KIAJpj2GgCcWafM7eCODm/7gsOqxA/KOaK7If8iFmuhzW7DxW
	 qlS7L8ELDDjw34zbNG4KcnKwYrV50D+qbi7G4h91ro0PYB9OKriH0ZWvO/mPvxzgTLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaisala.com;
	spf=pass smtp.mailfrom=vaisala.com;
	dkim=pass header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=1PJQZCQ1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.107
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023107.outbound.protection.outlook.com [52.101.72.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8C7606AA67;
	Thu,  5 Nov 2026 10:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8C7606AA67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=1PJQZCQ1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wvr/sbyQRQOjt1xE0VIdnBQhKVzKLjViWz6Tk4wol0R2XzWFyyh/dZ3xL/jY8Uqf68mSMPoCtREGzdVMW5faML2UIPi8V5/kaq72uMBzO901V5csY1RdWwXtJaHJck8OeMe7XVM/3Mq+HWkEctm1haDXz3506jYdLA18sEQT5/cbIIjfYqJyQzmUWMnQI+W0UCYKCW7IcoDKn427lplMGe3n9tWC6nUyITwziXkjbTVbqxmP+UzsyT+zFNwQ/aYCBWW9wpzeEweHOwAhT2wo3u3EIstS55t8Zmu5AEMFqj+TV2RIiwwfwpLLol8zLWmb87z3PIQJd0GQ9BvTQOIhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edWvdqgTsBCErxpmnz+fY4QoEhA1kOBzuNQxr84jpS8=;
 b=glCG7tRHuP3kkjrV3D5eYEvmiNHKZtVLGugskLvbZIo7fS8UkvDqPFtM2C3E2hMfhNA5KVwkdVTE2j1qpIZVlAd2NdjaVoc/vd1beBY1Yzt1RXrZDr851xp6pjjUkk1Ik9ZwMxMIjUHGNDOTbGrU/7f36xx1duIWH28tsNrJXtfOvd8kvhkF1V9vasU8jFkWOxo1lR5thN7Nz/gl9cw8b9fY/duKraWGWBZoZSKLXaOcFJ/wBleHCDKTQ+IP/AuvOxW12lLOdRBOfC16OeELrgfTc4Mh/kst1AKZx2qU3ikC55PXcyWP6URiXSSf6VuklW5qpX6V+BQZoPDSklqlUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edWvdqgTsBCErxpmnz+fY4QoEhA1kOBzuNQxr84jpS8=;
 b=1PJQZCQ1UEUZKcBP1Dg1iPkXqPG9yzvpvuBlL+Hx+NX5AIDRStVrrn68hypNJQ9782tcgE9En0PlLzcHTahoH8QX2EYmXw/YgX3w8x/DuTKVahAt1B5XLCw8JJLoRMjbUeo1K9MKjAPyRuUXn77tCRc4NN3eLJ+SMmE8TpMqFfuyQ6O1H/pszvJaXVicBet/Xr1UUiFSA2LBLE1ruwBOQbtbp3O95iA4wZQzK+YCiFXQjy5Gpg2/1OestEkfg/CjK0dRutu7FJIM1Tl2QN1t/CQheJTcO1AMGoWvXz/nCiUiayP0FD4VhecDC3LXKJXYbK7N1u79GKyY2U4OTkaedg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com (2603:10a6:102:407::17)
 by DU4PR06MB9644.eurprd06.prod.outlook.com (2603:10a6:10:564::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 10:11:28 +0000
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc]) by PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:11:13 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Thu, 05 Nov 2026 10:11:05 +0000
Subject: [PATCH v5 2/2] mux: gpio: Add optional enable gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-add-external-mux-enable-gpio-v5-2-96c5b62c86ea@vaisala.com>
References: <20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com>
In-Reply-To: <20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793873471; l=4433;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=3zDsm6/mVWsHL/hcVn3mAQKepiAKwAqQe/FYpDGyQ00=;
 b=TELWPyzbEn+FlAfJJIrctR6XNVxoFK6VEGAryz7yDTdZ3IP8CX1rgujeD+3/4W96WoGIgFXo3
 EOYSzSPGYZ7DnF65EhMz1bbFROo8+hBWOgrwOYGBexAWou/mYxhuget
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV2PEPF00046794.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::206) To PA2PR06MB9176.eurprd06.prod.outlook.com
 (2603:10a6:102:407::17)
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
X-MS-TrafficTypeDiagnostic: PA2PR06MB9176:EE_|DU4PR06MB9644:EE_
X-MS-Office365-Filtering-Correlation-Id: b572e101-515a-4397-e1d7-08df3b251f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|22082099003|10067099003|18002099003|38350700014|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	HxeP5naW9t+zHxLbqh4w9YkIGfUEhn2xIdLP3sONJEz2GvWFk/pLux+m4ptjGZdWoxAzXnL1gtFjKvAYK/QAWZb8fYZVe9OE9kKPOTpx1Q049sbzG3t85n9qKCl+1MGjZUvRMVN5T3HiEoIkyE5TE4iBuMlSJaO1mxuY69APepimWslqFOXUppFpZYgKiwgBYhoKNj1myspb31CFZKMUWksbIFBsnZggr3TlPP7NRIPzqeKVzPd1xmAa580mnPmRtj+fPwgZgJLOhTckdLYr0RH8pKNT5Ywm95FtJXVbEZtzr52D7XoUiN+jkKMgZ4Kf3q+5d2tGTUr0gHL9o9MG1IBkchSR6OmBO7qgfh4IfIwTxBk1134JFBBJ9XETGrhWTOwjWEYqCsq22FtPLyqn3anTgEJXVRq/QGRG1rg5Vnnf+H7srMlpq+Zvkep6dchwo4PtN8zq90h43vo69GhHT5wzDLa74bSO4LqjrKxrrg8FX5dA+hbfALeplOpQwtloaQXSqGG7+N141P9rgIi/ZN9TqWw5v/F4XctDBVc/oBXnL+KdiA43uvu9jlPd6rbV4pH46stiCQP0WJU/ewv1TJRe1ObYsr26bBmAvLCqU1ebzJW2mT0absep0/A6wFBRlkJ0znpH22aSPucz6B9Zho/L7Cp1JqF/cT+tM8cTW7eCxyOxFbTq5cFrq2cr7nkjiZ9lAIlIAwXrAOI01RzJE9O1r3OEtRs1qYht8+dn8tQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA2PR06MB9176.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(22082099003)(10067099003)(18002099003)(38350700014)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVdDZXo4U3JWcktEblZKU2c0WWJ5TUJqd2RSNEVNNTFHL3NEbTFTckFjT3RR?=
 =?utf-8?B?QjhEWEhsNFFFZmtaYmJtTTBGQXFCSjVwWjF2bWErQi96QkE5ZFNJT0kyeCs4?=
 =?utf-8?B?YUFrTzY4bklKZit3YjNDUXhjMlZiaWltaGtTdmVLMEdpTkVIS3hYTXcrVWhQ?=
 =?utf-8?B?cTBGUDFNeTlJSWtZeEJ6eXo1Y3J0YXVKVlJpTkdrZzZPRmFmNGZXMi9xQU9i?=
 =?utf-8?B?cDlORUZlOXZjZ1p1d1pSSFhCdGpnc1J6MUptVittRW9SVWtoUGQxaFhCUHY1?=
 =?utf-8?B?dGJlZ0RkNG1obzRab0xjYm9KMHJBSU42TGMweWc4SmpPWWs4RWt2eDAyWitC?=
 =?utf-8?B?OGhsbElvZTlLM3VycG5obnFaN3JoTjhFS1g2QkNBcTV6TDJxK3VTYWtDK1Ro?=
 =?utf-8?B?blg3MEZURHMyR0ZtamM4c242WWFtUEVHRklyRFpLNEgxM004cFpBWGFDb1px?=
 =?utf-8?B?OTY1UGt1amJNNlZRUDBvZHdxc1lweUpuN29kWExQbUtERTdkUHQzbDdxTjN2?=
 =?utf-8?B?YmNsSGQyd1lDQnZZVzFJUllZdTVIc2tzZ2MzdWdjMjB0emE4SE5Lb3RHOTFk?=
 =?utf-8?B?SjgxWlgxOWdVVGxmVU1pTjdlL2F2c0VoVWlMRUE4YU9Pa3RkdzllU0VLNW5K?=
 =?utf-8?B?WWVZcEdMdVY5UERvcVZiVHRVZUJTbmhZelkwWC9US1dhU3hrUG5JdkxzdU13?=
 =?utf-8?B?elFRSi9sVmg3WXBIWUxITTNiVGc4Skh4U1N4RWpnUG9JNUlBaVNjZ1pjSFdW?=
 =?utf-8?B?Y2ptMVZsOGdRZDhUL3JSWnhRcGRoQzdjOGFYQ3NWQUJJNmw3TEpHZTlVcDdG?=
 =?utf-8?B?RmVWTnJLN2t0OFNMVExNTG1hVEFUU0JVSzBFT2ozTmsrU09WQTZRSEdheDhh?=
 =?utf-8?B?amhUclhWcUlSMXhpOWp2U1lSc1Q5TGRlWXFKNWhIN1JsYk1jRmx6N1ZidFUw?=
 =?utf-8?B?aGtxZFlzc2pVK2wwdlk0VTNmRmdHTVJQeUFaQmVVOFF4UHZubFU3UmVuT1FB?=
 =?utf-8?B?SXpDbEtCNnFzQmw4VitkbFJQdkhFMjdoRFVJN0NpZmpPd1ZnOHdlVk9wWEtK?=
 =?utf-8?B?MzY3OTJGRU1NdjVzQmR2Q3lLTmhCMExwTllRRjdoTWZ2TFBlb3BUTFd6R3pw?=
 =?utf-8?B?M2NFWU1kZDd4MWI3cFpJbUVtcjB2dnpaOFhreFBWT0JyekZLNC9jcEhTYzlO?=
 =?utf-8?B?Nm1RMkVXV0pJRVl3SFhKY3gxNUtSNkNxS1BjeVpob3YvaGFrcjZsQUd4cE4w?=
 =?utf-8?B?M01MMzk4ZFJuSDZERnBDc3dTaXdpYUt6aTg2UUhNMHladUxjdk1IR1pCUEU3?=
 =?utf-8?B?QTlVYVBlelp0ME1QeXNNRUNYaER4MDEwQ21ROEVFL2FuckVuSUYrdFJMc0FC?=
 =?utf-8?B?MnNrclQzY0s1NE1PTzFYbHBaL20vZ2ZWdFBXVXRxNHlKdTNNL0I5SnpSRHF5?=
 =?utf-8?B?ODJWblFKU3VwckJsSjdHUjFUaG9JRGVWUTVqVit6eVJFMEpuNk5ZMWMyY3l5?=
 =?utf-8?B?YlVBY1c5TjRLQnA2dkJOdldNc3dKUWlDckRYTm1jbmpUbi9jRWsxV2xQd21o?=
 =?utf-8?B?OE14VVpPeENvRHA2aCtCSlcydmJObTR2VnMwS3BPbEVMWHQzNjZQbHNYSkRT?=
 =?utf-8?B?ZnlXTHMvR2dKMDc2ZVdwbWt4SDhoRTNPZHhnTjZhZm9qL1cvZ0tVamhtamla?=
 =?utf-8?B?VUttV3h0blhlUmhRb2oyVFdFZ2ppU0dOUHlBZVR2R3NhOStOS2RFeGhPc1FL?=
 =?utf-8?B?NVErbW1aQXU4WXZMd05kVUkvZkhBQ054WXdrZkpidmZzd0JEdFNPSTV6Q0g4?=
 =?utf-8?B?VGlpV0xpOWp4eHMyL3Znc015Vk1IWjFuU2tuQ3M0N1RhL2R1L3NvelRBczJm?=
 =?utf-8?B?dU1EZ0dkelRHbkpNRUpGVGtBbGlhRkdCU1Qzakd2amgxVE1xMVZ6TGV0Nzl0?=
 =?utf-8?B?UHZIWFdNZytUVkNtait3bDFvQVdJbWRpNHRBTGc1VU1PR0JJTTQ4SFZCdmlh?=
 =?utf-8?B?aXJxTWsxUHdSb0lENlZTSnhDeVgxVU5vaTluR3JLQzVYNmRTblBjSVdXWnJh?=
 =?utf-8?B?OTJwcGpUZk1ZbHBwcVZjbzB1aERrQWNnSWVXSlhMMU8yWk1vdGNyMGFva1g1?=
 =?utf-8?B?L3lPMGtNaXBmcjliL2NlcTBoTXhSVTVqc2RCSzNzNFF3Z1QrVWMyeXIyeTYz?=
 =?utf-8?B?ZjczS3AxRkxQNlNVemhYSmJncnlNR0Vac0l4dlRMcUZJNWlnb1RkREVMR3VI?=
 =?utf-8?B?Q0hJdXhIV0JWS1ZWY3FaSmNRVmZ0enNPdWtuUTI0YTZSdlk4cm1HbU5oSWFw?=
 =?utf-8?B?KzYyQjIyRDA5OEN4LzZySW5iYTVBSnRja0FYNTN2NEtUaE9iQ1E3ajB1RS80?=
 =?utf-8?Q?ye7ht6N42/eROzzw=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b572e101-515a-4397-e1d7-08df3b251f3b
X-MS-Exchange-CrossTenant-AuthSource: PA2PR06MB9176.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:11:13.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejWW0h9dvDdQHdmhFBq6VkyP+uHkIkats4S6+OrjW1DftUkQSzSi7WLcPgujTXeficTunXeRCHdeluenM0jNatPgpT/I52zEripop3D+61U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB9644

Some analog multiplexers have an enable input that disconnects all
channels when deasserted, independent of the address inputs; on a
74HC4051 it is the E input. Add it as an optional gpio.

The mux gpios are not guaranteed to be updated atomically.
gpiod_multi_set_value_cansleep() groups them per gpio controller, and
only controllers implementing set_multiple() can possibly update theirs
in a single write, so a mux with its address inputs spread over two
controllers passes through the intermediate addresses on every change.
Deassert the enable gpio for the duration of the update and assert it
once the address is settled.

The enable gpio is also what makes an idle state of MUX_IDLE_DISCONNECT
possible, which the mux core applies when the chip is registered and after
every deselect: it leaves the enable gpio deasserted and the address
inputs alone. Refuse that idle state without an enable gpio, because the
address inputs cannot disconnect anything on their own and mux_gpio_set()
would instead drive them to the bit pattern of MUX_IDLE_DISCONNECT.

Return the status of the gpio writes instead of zero. For a gpio on an
i2c expander the write can fail, and mux_control_set() only invalidates
the cached state when set() reports an error, so a failure reported as
success would leave the mux on the previous channel with later selects
of the same state skipping the write entirely.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
---
 drivers/mux/gpio.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index f9c7863e51b82fb76ed03cf17308fae74716cf6d..cb2f38c1a9e247478f97fffaf1d5ddae4315d1a7 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -18,6 +18,7 @@
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
+	struct gpio_desc *enable;
 };
 
 static int mux_gpio_set(struct mux_control *mux, int state)
@@ -25,12 +26,26 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 	struct mux_gpio *mux_gpio = mux_chip_priv(mux->chip);
 	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
 	u32 value = state;
+	int ret;
+
+	/*
+	 * The gpios might not be updated atomically, disable the mux
+	 * meanwhile.
+	 */
+	ret = gpiod_set_value_cansleep(mux_gpio->enable, 0);
+	if (ret)
+		return ret;
+
+	if (state == MUX_IDLE_DISCONNECT)
+		return 0;
 
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
-	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	ret = gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	if (ret)
+		return ret;
 
-	return 0;
+	return gpiod_set_value_cansleep(mux_gpio->enable, 1);
 }
 
 static const struct mux_control_ops mux_gpio_ops = {
@@ -63,6 +78,11 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	mux_gpio = mux_chip_priv(mux_chip);
 	mux_chip->ops = &mux_gpio_ops;
 
+	mux_gpio->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(mux_gpio->enable))
+		return dev_err_probe(dev, PTR_ERR(mux_gpio->enable),
+				     "failed to get optional enable gpio\n");
+
 	mux_gpio->gpios = devm_gpiod_get_array(dev, "mux", GPIOD_OUT_LOW);
 	if (IS_ERR(mux_gpio->gpios))
 		return dev_err_probe(dev, PTR_ERR(mux_gpio->gpios),
@@ -71,15 +91,22 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	mux_chip->mux->states = BIT(pins);
 
 	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
-	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
-		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
-			dev_err(dev, "invalid idle-state %u\n", idle_state);
-			return -EINVAL;
-		}
+	if (ret < 0)
+		idle_state = mux_chip->mux->idle_state;
 
-		mux_chip->mux->idle_state = idle_state;
+	if (idle_state == MUX_IDLE_DISCONNECT && !mux_gpio->enable) {
+		dev_err(dev, "idle-state disconnect requires enable-gpios\n");
+		return -EINVAL;
 	}
 
+	if (idle_state != MUX_IDLE_AS_IS && idle_state != MUX_IDLE_DISCONNECT &&
+	    (idle_state < 0 || idle_state >= mux_chip->mux->states)) {
+		dev_err(dev, "invalid idle-state %d\n", idle_state);
+		return -EINVAL;
+	}
+
+	mux_chip->mux->idle_state = idle_state;
+
 	ret = devm_regulator_get_enable_optional(dev, "mux");
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to get/enable mux supply\n");

-- 
2.47.3

