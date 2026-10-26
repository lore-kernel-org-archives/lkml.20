Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793031681;
	b=pI3DkFQTY5GRR02ETmMFHuWdV6+2sd3vAxOaBjjl5upaUOGojGObqDBo+xO0VpenkyGj
	 i7vzlvHY5WPQPz3FHteA05mPkJ6lLOBCGEt/LIRgarCHPKATpkoxrpMoVb6oISQiv34FX
	 Le9tz3jFpbxPs9o72tmjHB+RqvWiYbgLcAah+rz1syYuLf+OA2Gt17QBpAMxsjEpFlXz4
	 6Af1kwhfWt8J17Ie7tkZyiBn9Puw39SIrr30GEEi74R80CAHcZVlMavMXSV0DP+WTI1Uw
	 aGMwKY5PStqCyeJjbYqCOmBYrOIl/XLObPL8Lu+G0DZBqp8FE9ZSoNlbYm6ez56nAbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031681;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=ONyJs2o6vUTcrolkYveJ/SOlnxXM+6ru8B0UzgeL8vI=;
	b=kimOn8ItLMEMptc0vRMSMc3KsSkOzobEK2Mmc+9/akK8eFw/xOnRQAcnzSBXcznbXdoB
	 a9t9BamNyqzB1kWJNYQQZzK0fHTw06jrbh+z1U2M3CDqrMoC6FZGqAdVGcsuILsziSHVW
	 34LFOGdZIba+ra/8Civ2cdlaI/yGBTSfTiSrm4NlKp13WqsgyWxhXDdLcldwQ9kFMpBt9
	 E7KxVJH+odrgenjsSTnG7jH32R0URufz+MKvLYXl0yaWxjsjWNTc//46RwL0fKTr/Xe6O
	 /LDeQIvRWfvErbmJojgj00zM9gaERXXIHQLSkf8EP8TQf0i9uDaTD0amB1TjevuZevA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=pCV7V752;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.2
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34065606A31A;
	Mon, 26 Oct 2026 16:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34065606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=pCV7V752
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fD5L/UumnlluydmS05j9zX/PkR/yJyuYUH5ymHpnbfeo0ep7D4x6c2auT3tU7DNajYg5xigqh+EfXhBMBfDtuz8A4i+c3vKmBVePnqOq67zL6DiJ3Dk6FU0RFNYGkiPVwTYjb4RrM6QPoRH5tiS0StP0p6o//Yxxs7CKZoaMPGYceETFy3xrSOaAro1uuXN2D6IjAiHgLnSofuPjOe0c8gdvwYQAVzqTI2/v9OuUHBiZOpy6uGg3nND+5xB7lvGToMxqf8AXS0iwsmvVJPef76FM4uLMqzkBx0gzlNGCng6BebHQQjnNk8A4U8r2a4KiqShdo519bBPppPxh4wbxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONyJs2o6vUTcrolkYveJ/SOlnxXM+6ru8B0UzgeL8vI=;
 b=NVTmnH5yz+KKVUpf4foM5JkrAXUD/3SvoZbt1URgzyU2NxVCKjeqc55/wNRj/bjihVuAkq1OXEgXgniAAkKB9CqkZzIhaP0CcQoEUI4cIgOJW86aJYHjCI1pCGrszHBWyeZSoWZFcxUxnsHpti81OxKnzjNzimiiy267M+hyYSfc19/ckxKxViAaZLUTWa6w+xQSXcVjtlDVQqQcyd+yR/4/FdgjHxMvtVXJJicRr9AStgsRhKDM+aZ0Li3Y9udmxcOBZxVQhV3qzCFzIp5bbyT6mFd0Hz6m46Hx4zAQe5G0z298IEPc34ZYbZoBVLJ7gZ1Jn4tar1PRfbtZt1+V6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONyJs2o6vUTcrolkYveJ/SOlnxXM+6ru8B0UzgeL8vI=;
 b=pCV7V752PlcPzDFiCFdMXyzQRoijg4IWK3dsUyT/cw8zufRzX1jN4OKEEKlWjD1mQ5Q7GaKsBjLsYPvigTyLf9vx9d7u+448vIGFtdq2Opi4++NIYZRpRhz/BcE7hbxdHEMWebdcPMaDFLHRuHnUwQisuSxhndZ+kJT1quoqG3g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by OSCPR01MB13330.jpnprd01.prod.outlook.com
 (2603:1096:604:34b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 16:21:17 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 16:21:17 +0000
Message-ID: <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
Date: Mon, 26 Oct 2026 16:21:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA3P292CA0041.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::16) To TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|OSCPR01MB13330:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ed8308-4fab-48fa-4e62-08df337d2992
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|261026121527099003|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|10067099003|20046099003|18002099003|22082099003|261026140227099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	nK17od90vbnRMaoUxC975tu4Yj2bqUcG+WgiZLr6+OeR+RsvbHPr1UcIh5K3g7yRWY5GnFrjMBMlV5q4dA5+KriaHv1IOIwjB3PfCdMx2QVNrAiRXGtFhGG6Qoxt3PuvtD3IkBzrVT5cdIFVDm1RNIoei15JxMSQM1xait2H3sHpW5uvr48/Qme39YrVlpYVe7S5Sn0gBZgzezj8AhaUzfseLZrc/J+/GXv1wFFIDzGEfr3dqJGXTimTkbIPrXegscNXWmwOV19XtsOwu++GhHd95mREpun5jisBxQa9q/aYPHzhAuH8pAuneyljmeyaYK0VHMLS2CcPnRvUqSQ+pL2UyBz9T3eNVh5UOERwxJEFohfkdEgVSBEQpWZMfhyYGFtJ+vE8OQgxaIbGrntoMYtGdhBlFWCzQwQdKEH2S9DtP/gwO76gUjGZ2X4P305stGdCmouZV5DmrAZFEI9h5Z2LyiabeI3EunWQayPqISexc0YMo5uJSIVJ4x2raD2N9GcLBMD/vDsCYdWddTJ09WODFEKUquqtIY+rlTGZN6vSsTqsnu8KkHdYchenxanJWavzUCYDyeqVl9akI0hgSfM770YlKPq2W/PZK630iyby5ObZ2mVpp+e4veQYvIV1zWdaJ6b/cj2WLOuI5WyRx30gQp7l+/QOVY3NnlfXHjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(261026121527099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(10067099003)(20046099003)(18002099003)(22082099003)(261026140227099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDhaRFlJbjRUalpybXMyRDJwK1J6OFJhWTYrRyt5VU5nazNvMllkbzdva3hM?=
 =?utf-8?B?OXRMRHpLRWpFcWIrc2dRTjF5a1NqY05MejZMbVdya3BEeGdLOVZjalpST0dk?=
 =?utf-8?B?eExFOG9xR0RHcW81T25qbGthTWVrRzlWc25IemtxeFgrVjhoeHlPbXZlVjFl?=
 =?utf-8?B?T1h4NGRGT2IrNHNna3lseXBadDlpS0pyYU54MEpRNk9ZTnZPZm15WlptY2JS?=
 =?utf-8?B?aVZUUXRUelovZXQ2VFJuVW5qVHl3RTFXQlQ5TlZOaU44TW9JbkhKN0ticUJn?=
 =?utf-8?B?bHg4dUpocEpVSlJIOXNBNk5nTWJrZFoyTUQwU2dTUnZBTDNiL0E3ankwS2pF?=
 =?utf-8?B?bEt4V0hCendqQVZxVEFWWHRhR2lKbys4Sy9lUGhnYTBHc1ptcGs4bWVwMy8w?=
 =?utf-8?B?a1RHU0RSdWRXNHBkWnBYdnp6RTBQR3pZK2IwS3dOMVBnNytFWTNJeWM2RTRw?=
 =?utf-8?B?WWI0MUxYcnhJUDFHSlkwY2RYa0kwYy9JTEdDaS93bzU0TGZFQ1QrTGNTRnRH?=
 =?utf-8?B?VTZDam9CZnhaK0dtNjAxL1dEb29EUnJwc0V4eXdaRXFCc1JEdzRBbi9sVVYz?=
 =?utf-8?B?QVB6MXdUbkRRRGJHZzlXVGxzSjV0MXNnWlNTUFFVTnowMWQzeW5kcnB6WUtH?=
 =?utf-8?B?cGdFc1NhVndMV1JaUzVIQ2xLdU5ESktXRElVSTZvUmpEYUVMSnd0dDh4bFVR?=
 =?utf-8?B?QVcvZFVMSXVSRnhncjJPYkZpS1JpWjFaaENnZDZpTUJ6MzFzM1RVN1dCVTI5?=
 =?utf-8?B?WkdaQnA3OUhTN1pKdU5HVTRldTg1RGJVc20zSTdLOHJaejdPVDhqUGtZMHgx?=
 =?utf-8?B?V2ZubUF4YVgxZmJrTkxVVm1scW11YWc2M3FnWWJod0h2T1Fjb1I5cGxrdDV6?=
 =?utf-8?B?Rk9xeFhhdzUrd0Z3YzM2dEQvU2l6ZzcrcU9zSUtZSkM0bWJiamxzWGc2L3lL?=
 =?utf-8?B?TDd3aG5pdHlhYTZTd0VXZDI1N2FHcXh3ckI3RlcvWS8xeHp1a3BxdlNRWXpw?=
 =?utf-8?B?T3JsR1ZUdSs3RGRrbXF0SVZvcWxDTHllQm9vWVo0M3dJWGMvcWdjNUNITHRN?=
 =?utf-8?B?T0xwL3ZRbHdvRlUvL2hHWWRYZDBTcWtrYWZOOGloVmxHUURTekVQYTl5VkpJ?=
 =?utf-8?B?Y2t5ZndjbmgwVGREMm9kclFCeFp6THBlWE5POExTT0ZQNE0zQUIwSk5sR2Y0?=
 =?utf-8?B?aGZ0cmovZDFELzg4eDVrc0JGSnY5dkN4eTJzUUp4WnpXT1ppbnVyUmgrOVRQ?=
 =?utf-8?B?UnJrb1BFNmJXM2tYRXJ0UlF2NDJmRUxxZXQ3T0RCdDlOdEEwNThicTdUTzlH?=
 =?utf-8?B?WUN4Vmxac2hPanQ2eStyTHBkcDVDejlWemViV3BPRWVGRE43YjZCaUhDbjBU?=
 =?utf-8?B?Z2svd0lONERLNlRESmNkaUVQZkNMeUhZZ1hjVnVDMkR4bVFWK0s1aXNvNmMv?=
 =?utf-8?B?eWZ3dGtnU1diUzMyWDErNlVsdnp5YlRBZ3JGeXpNYzFtWTdxY0FiTnpHOFl2?=
 =?utf-8?B?QTVaV0xYWSt3RHE4aUIwaHhMVlVqaGRGNlNFNVc5ejV3a3MranduZ3N2MndJ?=
 =?utf-8?B?YXJ3V1hJZUpYMjdaUTJKYUQvOCtmSWlSZnRmWkRsaTVxN211N29PSWZkUTFk?=
 =?utf-8?B?eHZtanUwVzlLMTlqd200SklnVVNoei96aHBKbXJ3eE9HN0FXb2t6R280TTRH?=
 =?utf-8?B?cWxNOHRRcHh0RDVkY1E5VGFGeWxqclR5SlVmS0c4cUNIWmljN3FtSGhnNXpE?=
 =?utf-8?B?TGdYL3YrWUlmSURFQWpRV3lNeUdNNmxOWGZCZzFSNWwzcGhydWVFWUJlS3Mv?=
 =?utf-8?B?SytxdjVOcmt2WXBDUGdiNWVRdkRPd0JRUWE2UW12OG52OHFkdUhzQUdKak1s?=
 =?utf-8?B?QUdIUHY1ZitiandhSWhGT0NCTHgwdEdpSnJjZlN5dlAwRG9VR1p0MSt6ZHJv?=
 =?utf-8?B?c3F4dUtyYk12UGxzTkNROWVPYW45VlZ2OWFvNGdyOURIQlNUbG1GTW43WENL?=
 =?utf-8?B?UEtFSmlQdDlWTlZ4d1hmeWJMVXRTVlhybUNXK0tLN1F0anQvZmtSMTlIaGdU?=
 =?utf-8?B?TDZmWUhVOVBnQjBjUmZTR0RPblNGaXpXVFFyV2UwMnhYYVRPNkRTUHRRMVVt?=
 =?utf-8?B?dVlaVnR6Y3VoVXErSWxNWmVQczdpMU1IVVl6eXQ4d2VjTWNjeXFGKzlMUGdR?=
 =?utf-8?B?aHpGdlN6SUlzQUFxT3ZGOTZqZVdWTUVRcmFRME1ON2taNm5ZR1RrcllvdklK?=
 =?utf-8?B?ZittOFptNEVZOXRRSmNrd2ZRSWZGek1TdHBzZjlkNUtPZVlJZSsvOFlqNXJP?=
 =?utf-8?B?dU5IK1FNSXZ0bmp5VklzMFdFRDYram1Wem5HamZCTWpkbVc5bXpQQT09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ed8308-4fab-48fa-4e62-08df337d2992
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 16:21:17.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +i+v8MNA5SH5jZwocJFeeu6A3d64od6gCDvN4equuo4AOecRghlCzgY0eoV1Rpz7erT89xIbmf7d0icQxYJPrzAc6NZ0uOTNa0606dVFRc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13330

Hi Frank,

On 10/20/2026 8:18 PM, Frank Li wrote:
> On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
>> The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
>> the Renesas I3C controller is controlled through the SYS_I3C_CFG
>> register of the system controller. Document the
>> renesas,analog-noise-filter property, which references the system
>> controller together with the offset of the SYS_I3C_CFG register and
>> the state of the filter: 1 enables the filter and 0 bypasses it.
>>
>> The property is optional: device trees not providing it keep the
>> filter at its reset value.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
>> ---
>>   .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>> index 08fcea89a015..381807844351 100644
>> --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>> @@ -96,6 +96,25 @@ properties:
>>         - const: presetn
>>         - const: tresetn
>>
>> +  renesas,analog-noise-filter:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> I don't like this syscon property, look like it is one kind pad propterty.
> Is it possible model as pinctrl?

On the RZ/G3L and RZ/G3S this filter is not controlled on the pin 
controller's address space but in the SYSC address space (hence the
need for the sysc phandle).

There are a few factors weighing against modeling this as pinctrl.

The first is that the physical pads used by I3C are multiplexed between 
it and for example RIIC3, so we are not filtering the pad but the 
internal path of the I3C IP. The pinctrl does indeed have some controls 
for the pad's digital filters, that apply to whatever block is 
multiplexed to the pad.

Besides this, even if it were moved to pinctrl we would still need the 
sysc reference, as the pfc driver would need a way to reference the sysc 
address space.

With this, I think that having a DT property is the best approach. 
However, the form of the property can be changed if you are against this 
particular one. For example, the register offset can be moved to 
platform_data in the I3C driver:

  - renesas,analog-noise-filter = <&sysc 0/1> at the SoC level

or I can also split it into two properties.

What approach would work better here? Me I'm leaning towards having
renesas,analog-digital-filter.

Best regards,
Diogo

> 
> Frank
> 
>> +    description:
>> +      Analog noise filter for the I3C input signals (I3C_SDA, I3C_SCL),
>> +      controlled through the SYS_I3C_CFG register of the system
>> +      controller (SYSC). Three entries specifying the system controller,
>> +      the offset of the SYS_I3C_CFG register and the state of the filter.
>> +      If not present, the filter keeps its reset state.
>> +    items:
>> +      - items:
>> +          - description: phandle to the system controller node
>> +          - description: offset of the SYS_I3C_CFG register within the SYSC
>> +          - enum: [0, 1]
>> +            description: |
>> +              state of the analog noise filter:
>> +               - 1: enable the filter, performing noise reduction on the
>> +                 I3C_SDA and I3C_SCL input signals
>> +               - 0: bypass the filter
>> +
>>   required:
>>     - compatible
>>     - reg
>>
>> --
>> 2.56.0
>>

