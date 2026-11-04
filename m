Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829930;
	b=i3CiL+F6lFzyWBviNY8qQ1nQlwBge9M63cndfQOHHWAX4RZVTd+r9bW46H8fQ6Puwv6F
	 vO7nGoJAjN//s78qADa8d+yoyiiwIFuDZZiq9eIbbtxh02TVml70q4uQ8rYPcV07B59q8
	 PkWNG55ntYOGMZlnMZ8N2j+uAGr+6Bl4IUpDJKhPFC8S8KX3uI6yNoWihwkB74viAoHJQ
	 Am7x+BB3hM5iXFlxZO8YbVGY1jjrftPHz4tRdqhq1pJOZfN6JGT3SAAU0RHocKTtVfg5Q
	 az/V4ctCH+BowWge1LTm9KILMDgmpjG4uoRyeg2HcJBXW6m8vyWJpm6yiWrkRunZExw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829930;
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
	bh=LtNOnRLBQaKMleWwAnKI9VntOedJNjcagImHWVSQxDs=;
	b=jHVIJaWijCdKj2/3DJx5WMN0Hqik1xPzrzFQvW+OyCDmFyFzAs5ScYxYPwNGiLuhKOwm
	 h+hsaVcm5Vv/n2sQD0vL7hJgqbm0SoKPzc3A2zYw8CmwSJ0ektJvhUNkRve7O5Ly/Rucz
	 PSTFaAwfFaz2tVwdGIfccb9JKcv6coCSFvPerFNSkISdclYFmuN/jDrd69v0hYu0RUsm7
	 8DaDiJDUZgiF+/pddc27OJWrxGsCEOr6QsNCbnFFhlPOYEyQpEaXa8QFR89j1YCV71mor
	 gLL4Zj8zSvx8ihkA6+j/ac6N9cxbIKmq8rlKfQv5NrvqdCtIDME6qVVaVEYHYc51vlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bqGnJ6PW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.27
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94139606A331;
	Wed,  4 Nov 2026 22:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94139606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bqGnJ6PW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBAviJSxSGNrfhjyVMxgcP+7ciAK2uDnb50Qq/Ov4ukdU5hBtqhb3TwLOxFSTxroZJAUHjA5H3vWvu/R+3UO/EL1zf+w8hemcQI5OLCn0m2WAYzQudomF4+rORaxf3Md0LqQRcAP7gGwD5veuYbPWNp5mcqRS4XuWQIwNanmAaAz/Weyh+NqytDNt6T9R4meQIoLiOJULUrNOKJbvpGixXyHDu50FqW5l41LdRoFiqn/5gTANIRqNlnvZN1hmSKv1eUIWhch/FX5CeLAkzoBVu9bnYUvBWn/0urXfTgCIv2ZezP7iVma2eJGDHW/LmVUKb0oZakgjqOjIx9Tp7MC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtNOnRLBQaKMleWwAnKI9VntOedJNjcagImHWVSQxDs=;
 b=lf2ZIEoZ80RP57MVLUjM+G/6H19G98yzOWWpLRjOvO4kmq116cuXvBTg3855N0X6quMSS+/noMzDNg2NrUl4HP8iYo9N88H3GPPZ+brmUBN01aBNFKIGRI4XLrbx3T9e2bfEXYwNhAknTO6VcPN5BBFpKofULol24o9ohCengunw1AOdmxc+SJENELDwyK0el4ac2IDzhjgS1gZxVsRFj5xJKsuk2iM0Z0iQ1/VhOzkaNNXTnWNPLNBVIWebVjj+0QVnpaCUlhKIx9WIW4IR4au7LLwfhwsPtwK5/hmRj9kVn1WgZsu1AGDf4P3z2xYJmY5r9U6g8nVQzR3zu6oR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtNOnRLBQaKMleWwAnKI9VntOedJNjcagImHWVSQxDs=;
 b=bqGnJ6PWbIg3oNZmXXEwScidPw/eHamUVaUK7sgTbx2c+NoB8RnsGOOw03kXpx7MpRwRNYws6rhUf+NX/zV2ShIzFQ8X/H2txNHV4TPSFaDPREnlerR2zTDRNXJIYnXyPTZoaQEdu2ihbOUmQFdSGr+6xkpGubOrUZnDeJO8Kquq78EJ7hg8whSh7HYJ9WG/MQlcAzEakUD9JedCxPg1Xk9ZuL9wbuo0KX/yKgX0uY2GzphVmcWi2Ir5ut/+r8lvIuEcl5FUMSvSe2wmKEuGe62IbIqMfAw0N4UtFSK/UeM1f2MopEN4nODqiBk6y3DE2rkPEO/YZ05r3YmecSpujA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10162.eurprd04.prod.outlook.com (2603:10a6:800:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 22:05:25 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 22:05:24 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] ARM: dts: ls1021a-twr: disable USB2 by default
Date: Wed,  4 Nov 2026 17:05:17 -0500
Message-ID: <179382991080.3910338.3974877778964499241.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021205018.4037171-1-Frank.Li@oss.nxp.com>
References: <20261021205018.4037171-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0358.namprd03.prod.outlook.com (2603:10b6:8:55::7)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10162:EE_
X-MS-Office365-Filtering-Correlation-Id: d322a8fa-d79b-4d09-824c-08df3abfba29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|56012099006|11063799006|261009223027099003|261028144727099003|261022105027099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kxr+0mTiuD9Gpr3ZVguxZS2c3xHwc+JKHIkoL2U4jZhfkRTZ94lI2cxDkIq2V5W4p19je+i5HOPDmwob8/E1AotznpRi/avJ2woum7qkNPnN5fabjbv0Af61EJbMr0GqMj4YP4fQ/KWQ8IFbEbRvJhbIKbGW53KmhPqzJ1v1Yk8rSAnOv0IVRcN5oCaFxEEcaKcqtQqwoFG51A3a6D7fn9hgdvYuRaocO/MExE6vpULTV3cZjzMaQdjZx6DgQaohmyomTpL1mtvWID4mMV7HUIVcBzk0YM4ciS0JRH+fyt7tfO7KNX8jsXqjAjJsM00PCDRZTWl4yA5NvHLwO6McMoZ00d5u4Dm16/CsoCckbRZymeK8+Y26PpHvJvdALdv+k0Z3Lf1at7o/YkOjncXF1EyQAmOogDAwr28NqNsi2bR1xLMNI5eLLlW4A94CiOO8caDN7ocybsqrbMSU4WO/Nyb7WXfFlsXiv04flz2ngFhU+YwQlcMhTIlsZCeCQ/ydUZst4Gh7xjR6B5tz+D7DEl+Pofb7OGMqx3ekrE382BGnlOXbP9uFSU/GO8WyN0FyRbaTFNkGNy93x85De0KSFETrcYbIMbiyx6cCo0bUZsJ5sRGhKOyUPj4z/XS0LCtWWeb4OEvn6fz//mjxNvUzR1gOV1KHlgKmQp98+by5cImyNfoP1YbTRkkplE5oEnXGYujWAD2n3S2aGHLVLQ2ooQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djJ2ZFNtQ0JYRW5veGpKVXVybnVmckZSYW12cUVIT2ZOOVVwN3pGRTBhSGht?=
 =?utf-8?B?UW9xcEZKWmJnZEZaeU5Sb0JaOFViejdjb1B0NVgxMVNYNWhYTGpEb1lVVnlq?=
 =?utf-8?B?RDY3bW9CcllnV3VQTDY3ZTZuVE54emdGU2NBc0xad3NzT0o1YnJ4UUt5bldQ?=
 =?utf-8?B?YU1BdXQzd2pUZ3JjRHFSYzdUOTAzclhSOUF5emV3ejZtcnlQZlFsem1PZmRN?=
 =?utf-8?B?aWZOTUpJNy81ellQQUZDeEI4cWhFR0pLQ1BDTHpSMlFsL0hIMjVlcGlMOUIz?=
 =?utf-8?B?L2tKMnl1TFlQemFXZCtKNkI0N1dNUWFYamFmTVdtWGp0aGlic0ZGVFFsVFpu?=
 =?utf-8?B?WG1GQWtrMTVRZVdwdWhIY3c0WEVRNjVBKzZRbjhmQ2N5cVBNRXF3RGNudjN2?=
 =?utf-8?B?OEJUbHJkWmdEdHlMWTZWVzV2dUFlbzdxczZuWUtDWHRlZUVuTzRKaFlvZ1Y0?=
 =?utf-8?B?RWdkcFZOMkpGUlJGUHl3elRXbWJySXlaMm9TeE16MlEyOGVJNEhlalBLb3Q1?=
 =?utf-8?B?RE9WWjhna0FKbUhoNkxZUmtTVGtUR1R6WXFLV3hkeDBnZDBlanhiOU5vRkVX?=
 =?utf-8?B?bW1NUFAzVDRzT1BDNTJQa0diMURub2N3bWJxcWxXc2hXVWVVcWFzbTZsSmt0?=
 =?utf-8?B?QnRla3FIUzV0ZFJkZ2ZQV2xGQVlLNXBDV0JaaXhiZjRlT2ZnV1pHZ1VPNDQ2?=
 =?utf-8?B?T09YbGo3Wm45U3ZVVHA1RFdRUWV3NDEwZkVyNE9vdEsrSEJvL0ZVR1drUW03?=
 =?utf-8?B?bmduak1ldStKNnRCUG0xY3ZmQkoyUWo3ZVNSK3NETDBYdzZYUTh5a1JvTml3?=
 =?utf-8?B?ZDh1bjlSbmJHK3hucGxFR0tsWURzaldhVVlpSDBJTi9nVTVCNDhWRnlVNmNF?=
 =?utf-8?B?VU1DaVFLVTFJNytkRTk1VTl3L0RkWktVTUJwYlJpZmNWbGpoWkFBUUt3aHBx?=
 =?utf-8?B?Y1IyTDZRRjF6ODVWMTNYaUpOekhsOE9jZEU0aGl2TklZZXJFaUxJZmpCMXRh?=
 =?utf-8?B?c082U3VaWVVaTUZ2NDJ6VnJNYXo5bzdTTGFLdWlKM21wTlJraE9pbTBUcmht?=
 =?utf-8?B?VzZzMmlRK2NWajk1QWo2U2w1eWYvS3ZQMTIyMUR0L05pZEtSdXNQTDlQVkFT?=
 =?utf-8?B?RHFiRzNFbFNmOW8wMTE5OFFDb2IyRnF5WlFRdUh3dHJRam0zUkhjSTlXU005?=
 =?utf-8?B?YVF6RzEzQStBU2t0L0N6UkxqSk9xbEpCbmtwZWUrcnc3ZEg0MWdXdjA4T0tv?=
 =?utf-8?B?VTRLVnFrYmRpN1Rwc1NVTGJHdXFFSjBuTjFZeUw1VGRzRkF5cFFIMEpNeHlq?=
 =?utf-8?B?QXVLTUNlTXVWN3N5U2VQRTVPQ3dtaitpVmUwOGUyMVlHZHFnWXJwdkErYkps?=
 =?utf-8?B?ZFdhVFlTaDBvTVJQZVVKVERKbm4ramY5YWQ5RTB3VEhPTC9velZnNnE3Y3dD?=
 =?utf-8?B?cE9PUGdSYnloRW5kS0hPYXFVL3JhUkFZOUkxSlQwZEJadFc3eGlpck92L2hB?=
 =?utf-8?B?TFpOellKU0pQSTdiS0hxZUF1czFhYVJ4VUdMczBCaGtRUU1xeSs3RzdXd1Qr?=
 =?utf-8?B?dUpVMHVPaFdIb3A1UUFrWUUxcmJHVXBrWXAxUk9JUzFRWHJhc0VqL3R2Q0Vm?=
 =?utf-8?B?SUtVUUY5bWRqWHlRblg3MHJLKzUvMStrcFZqbkJDSDc4clE5Zmg1ejBYcGsz?=
 =?utf-8?B?aWVyTklaZnRTMGtzcHJtbVJvMGxXMUEyUUlqUlVRZ1lCMWtiK3Z3T1JwQUdu?=
 =?utf-8?B?bDlSRXhWbnpQNVNuQkh5NUladzlNeXNRS0JMNG12TDUza1NFaDR3ODQzQ3Zz?=
 =?utf-8?B?Q2RLNFRFaGhlMEt2VjM3RkY2a1pMZ3Aza283SmNNV2QzOE11Vnc5R200SWJ5?=
 =?utf-8?B?MTl3SHUzT2hIQkRPMzJHS2xiWFZrZnZ2dkxPSUV4TWx4cFU2Z3JMTkhhQ0c4?=
 =?utf-8?B?THZGTVBjZ1B6bFc5Z2xuOUppOUNBTjB1L0Q2TTNqUWZ1endRZm1RSFB3TUxx?=
 =?utf-8?B?L084em1sU3hDeEQyUDZDVDdoaFJIalhwbGZUdEhNVm5OWjcxY29sbzR5T3JG?=
 =?utf-8?B?dDR5MlRaUTZ5b01IdzhRUTRNWDhSQTFwaUR4Rk9JZXlKRmZMQ2VDd1ZhQnJ0?=
 =?utf-8?B?ZlV6Q2Jxc2tJS0hlMWQ1c0lobGh2VmRNb1NYcEh5SmVFRXhGSHNaMzlZdU9S?=
 =?utf-8?B?aTR6THJoMXBiaFh4aXpwUHk1ZFg2YjhJTzVUWmxPQ1c2S3QyVklxbVZLenNY?=
 =?utf-8?B?RS8wLzhEWU1CMGVXZmlUUHZNb0hEQ016cEdKc3NsYlBuWG01bjF4U3JOUEhY?=
 =?utf-8?B?OXZNVkFvRE9pb2NSVWszeXJETldMSWM0THZzNk1VOHh0ZGhlenNBbHI5dWV4?=
 =?utf-8?Q?bOGHDJOueMuon3p3DZdpoGnq0hDOT8fhz5MCF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d322a8fa-d79b-4d09-824c-08df3abfba29
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:05:24.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7WgneQxfViQlO2XmoSZMNB352G9dnLJ+8FJDuBtRsBV9NlGbMW/xc/S6udSI6U+uFEolDGIdCUmVNEC7ml+Apz5cbqg+AvHaGDXU7toH4qv8vXB6ejjAv142VuzpW5E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10162

From: Frank Li <Frank.Li@nxp.com>


On Wed, 21 Oct 2026 16:50:15 -0400, Frank.Li@oss.nxp.com wrote:
> The TWR-ls1021a board doesn't have the USB2 port natively.  However the
> USB2 pins are routed to the ELEV expansion ports and only available with
> TWR-SER2 board connected.  So disable the USB2 by default and users
> of TWR-SER2 board should update the dts to enable it or apply an
> additional overlay.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ls1021a-twr: disable USB2 by default
      commit: 5fdbf005500113e7d09038125de10152a484189f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
