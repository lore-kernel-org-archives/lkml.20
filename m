Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793097307;
	b=4GuVSZE/mX0Lja7f9q/MREWoLP7+gvQaiftZ4eOEYsXfxXYUXZtT7tAy/cQV/RQoqQD7
	 AMkyKgXO5fu2H8SBSVp9lrEQNyx78w+6L9VP/dH/HmFv21W99Lo9xHVsDpxajtS6XsYVI
	 oeXa8pMba0/wb3By5sef0Iy1c/1Hgk5eg+/JGn3REyVR5XesRh8Wn55EWewduGnZK2bXz
	 fpbk+mApDcD6bJgyFfUvQF2HfMc1MqC3l4ungpHkFwwivdOGjJglvBRCuJKrPMdloGKhG
	 CeqUG7B919TxO3fU/qZdJjygKtsZvH84pLiwLuEg/pr8opEAW8uo4BHzPKBpC6nNVtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097307;
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
	bh=TnyJAKpbrzT6//5IDpQP6SqjuQWCpBYIFYB3Wu1DxuE=;
	b=OkAbFN9fGcqqPSvoZ8tyR6inkCN4j0mu2HMbowdT7WNS5Oi7af4hGfxrggXanxUDC6eJ
	 WZPFYyZtp55ApXhAg84wiCxvtOxd6fXOOFmLzpfpuozA8jZNn+i3VVVVgRIB4wIe1Y3NY
	 dxVvi0xc40DLjiH9ROR6hChW7L58p437nLtarNX2j3YDKaffSfmbwlCXdJFxJZJ/zm8Cq
	 ZImUyQPVhVcwG1sPmpxt1uK6ewy9FX0tw33NKcGrd6gN28M/kXtmsbsZoJHtIjDgTA9Q0
	 QwXxeRygVuOqcxErBjatoESF7q+6mHJB87916Y+dp7UvCFsL7TLPnVgcXsc0/YubgPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="GoEY8E/k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.56
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82904606A335;
	Tue, 27 Oct 2026 10:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82904606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=GoEY8E/k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czkMOyDQmBweWAbpK58uvT6cArWZpS2aZqYUlfILojHlMZW3sJu6XYblrs5apdWDnYvYWloFHtJ+YVvSaxJyeje9aVN+Yv8r6TtshG46qsQFk5KlPfpZJljPjN18fbDueqRP9ofp5aYiBSQ3VDF1AA4nKWum9c8CpAULEtk0S9YpUqQsCpCS63nfBlmGxQ5xbFkf3ZWN+eE9ZZ+DpDuSPhYqcZ1xX0jRGddi06xLtt/dGvapmvbxvL6cgz+qsTsJW1nMYGCCbVd5c4ttfJsC+fMPk2QbMNYiVCrRxhdv9VTjDS2MMs+NXeewmHAtgtYTqavaeRSHz6GB2juH7313lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnyJAKpbrzT6//5IDpQP6SqjuQWCpBYIFYB3Wu1DxuE=;
 b=lGA/4vtNMBbC8nclirALuWqCe4f7cMMxiCc8MfHm1friIr1KGWjQfXYikMq4M0fRxbDH+12UDKbTCGA4SmNbLpfbM0JaKtIcRhFp5F4tVyySP15l4rFOiRETxfNc0q9WOFbdeMQ5i4RQSDsO5nn1zErH40fT6ntBb4aWzH4TzdBGBmdH+Gl828JqhmUzatMICbkfYHD1BLhsXtcf5vVWJEEbOCA81dUoq5IRCgW6bQABP8GF2oc6OBsr8vhm55WSJJ4F2+nN9knWTSyB/W8HbarC3h0yaYgAXmEIbkxp3F1CKkoCT5sEdhb8y63mlJP/RekdskgMBugJq1CQEsOx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnyJAKpbrzT6//5IDpQP6SqjuQWCpBYIFYB3Wu1DxuE=;
 b=GoEY8E/kKC0ksQyNaJr/YWRZEgs41UUozt0r4Hq2R6NSeRZZ6tIlk0Joe9/IRo6DFRHfGljnugcafDAHJZVZMzk1cbH9tYF1pzgaeSBQJ5jzPayahXJuCEZbqbBOBuYlAN8fIMojeWlXVZEV0cjGbb0KryCLuhw8e1qhuNfpocM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 (2603:1096:405:1a1::11) by TY7PR01MB14856.jpnprd01.prod.outlook.com
 (2603:1096:405:24f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:35:03 +0000
Received: from TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4]) by TYYPR01MB15118.jpnprd01.prod.outlook.com
 ([fe80::1116:d56:8164:63b4%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:35:03 +0000
Message-ID: <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
Date: Tue, 27 Oct 2026 10:34:54 +0000
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
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
In-Reply-To: <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0214.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::12) To TYYPR01MB15118.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15118:EE_|TY7PR01MB14856:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ea123b-a45d-49a8-84cb-08df3415f5bb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261026140227099003|11063799006|4143699003|56012099006|261009223027099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|10067099003|22082099003|20046099003|261026121527099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	S2JQ+zmX7DLwqKfGanmwRlexMbrgZhSP0vJ9OGA6ozrAfn6l3Zd6/I6Tx2BqLKVSNzOcmS9GwyAEX9+pk6K5imZ4dvO6MoUKxPh05I/4Yaa4G/y6mgMs/OuxtdkxCcyhGxP+JtIdphSoS6hlhQHBZQHD3HPC3A/501CMqsYAcTUuPz9rgT9WTpICT2Hd5Hmznd6X2sFnxqo0jESj3EmMkAppXHFA6f3Yqv5nA1hfRlyIFlm8U/mNsqmx3L/5t7HgTTo2pD0nVMt6WbO9RLTc7XdWmgI3g3gyligo8ZM6fKFhujaapfBW1m4hDwFelftoHElq6Au2vbs8gj4VmvPodX5dDbIvwVwk2l50b51EOzGsJ/2QdNtYg1jCcR3toOJBKnJ9ig/zp6CZ6T29oIvF6AZUtKb0JZ/tAf6tD8pdVytdhx4V3kiKpQ2rBRIjNUKRrmbmJBTAnQLjUnxy4gd83DFViGNXy9QXwOXr3kwJ+OsCWkaF075QEGpA216vjfZLi4VBMWmMmQ/KRPbpv/yJFGT2q5eFL3gu1KIodKclsR408BVfsAscXPGRswP7qGj9x0KHS/5336oFu/1opAiXyO/f7aPU3G5csuZPKhuHwo2S01bNZ6Fit753ATeYljhjQSD7pc9XXdKqqVCzqm2xNmcHeLrR0NCIn0EwUe0PEyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261026140227099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003)(22082099003)(20046099003)(261026121527099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEk3NzJqN21FeHRZcUZQZ0VQdEtEQjllQ0dsYlhxMXlPODNPWWJ0SFNKQTl1?=
 =?utf-8?B?RkhDZDgxWTlOcWxRVnp4KzRCQVpWdE5Zdk56NG81bks4REkrNTNHUGI3b2k2?=
 =?utf-8?B?QjI2MnBEczIvcnkzZVJQWGQ1TEtoQy9CQ2hVWFI2dXI2dUlubFNCdlVvVStp?=
 =?utf-8?B?ZlFWRkxzT3BIRVQvWTBzRDJYZWhFaHpnUGU1bUE4ajFzcUZYQTNUVVRtakRq?=
 =?utf-8?B?bU82ZE0yM3ZEZ1NJb1N5dnc1YytyeHloRmJHS1lGbmQzNUx1dTAveXY0Szg0?=
 =?utf-8?B?NHdaOHd4RkJCNUdaKy9NdlZoT3JUaThkVzdHT1Z3MWdsMjJpT0FSOERlQlZT?=
 =?utf-8?B?Y2xhZXllSXVTMUdycmxCKzN4YmdpSGhKeTdFa0xqVDZVRzR3V1FJV1lNemR0?=
 =?utf-8?B?T3h6eHdQYmxQdjBwRWE1Wkc5b1JybGdNV3hvd1RsT3d3aThOakZ0Rkg0UGZG?=
 =?utf-8?B?YXJKRkdsdnV2VUlpT1JPbHMzYjJBN2JxN25ZL3RiUVpmRUhNbmhjMWRrci9T?=
 =?utf-8?B?NjFBcFNOTFhVUmk1WDBNWEtuTm5URlVxeE4xNGsxTmRjMWFxbHJ6dXdJaWI5?=
 =?utf-8?B?TEh3WVJORnVrSmt5WFhuYm1QNUZMYVRzdGhJbnhwa2hYZmZkejFpZWRvQnF3?=
 =?utf-8?B?ZkIzdytRSmM2VFRFY1NGSk94Uzh4ZXU5WmxpK3R0WFZyREYzNkQrZTl5TVUr?=
 =?utf-8?B?RndQaGpaU2xCbHZYVVYwVEJRb3FYa0Y3SUJQaGFSMXdtaWpEdWNFVGxESkRS?=
 =?utf-8?B?dzZGUDJ2MVd6U1k5UmVPSCtMTUF3NkNNVWxaMFd1bUF2RUtkZ2RFSk5rKzdj?=
 =?utf-8?B?UDJGeUVnL0owRDFrcFZlZHdJU3BiRHFCWVUvNHpUSEZ0OUlJaGpCcW11TE12?=
 =?utf-8?B?c1RNbzlVRzBsUElMVUNZc2FTdzBUOHB2MENHQ29oZ1diSk5tOTlnOFY4S3dt?=
 =?utf-8?B?djlxTkdrc0ZYdnhIclByWVFrSXk3TmlnNDBNM2hvb2ptUVVLTEg1U2pxQWJP?=
 =?utf-8?B?Q1dDbm90WjQrZkVibGV0L1hhc3JEU0JBZllnQ3VWSFVqQ2ZCWFREMGwvYzFz?=
 =?utf-8?B?TWpneFhHVVJ0MjRsbnNNd3ZJZkRSY3p5U002QWljKzluMlYzYWNQeFl5SHI4?=
 =?utf-8?B?Y2JSRHM5QllLQVl4dW9ENmVFaVZSUS9QTm5zdGtrRjNGSk9uM3hrR1ZJWUEv?=
 =?utf-8?B?RnJQZEUxL2ZEaC9JcWZMWENoY2FrT3FzRVNiRlY4UGtBWStvVGt3Q1I1bzJ6?=
 =?utf-8?B?eDdPclVKcm9TQVJ6ZkFIVUE4V3ROVFRYWk4wckxlTStsNVlzTjRlRFQ2dWx6?=
 =?utf-8?B?bmFJWDJabElCNithQW1KK1owUUZqSENDQWZUS3FkWVRqN0tXZjROSjBZOG9l?=
 =?utf-8?B?TWZ2cWZsZ3NHTWNFVXFyRndheEJ4ZEVIU2QxNHZqVmxESHBFL0ltY1pJcExk?=
 =?utf-8?B?NDJNb1diZEFzbi9qVWpLVWt6QllEMkhGOURQOFFmYXViQU4xQTY4QjRKdW4y?=
 =?utf-8?B?UHovcFkrQTNsVnA5NytQYWpxdHRkS2ZUKzRhQnEwYU1RaEUrZ1p2SDVmRGRD?=
 =?utf-8?B?Nm9TUDJiSmMyVVFoVGl5dmIxelpNS0VhWnpwWEFSM2dmVS95bTN1eGptL1Ir?=
 =?utf-8?B?RWxwTHZYSWFTTHptVEVpZ3lLY1crdGtPSDl4elhiOFpTekNqalBiTlcxZXUr?=
 =?utf-8?B?YXp0SnZ4dmQwK1VQRlhIa25qYWIwVzUxNTBFWE4yVFZSb2dTZnBmRWxZNjNC?=
 =?utf-8?B?S295bzlXSENHTnp0UzZYS2kzVUJ2UFlJZkpXalcrSG1uL1V3ZUxTVlRzeXo2?=
 =?utf-8?B?SDJyTUxYZUtURlpnU29qQTJaUHhhSGhXd3N4dWRqZDFxYzFCMkY5VVJxVVpC?=
 =?utf-8?B?cGJDRENKOC82VTc4STdCR2h0amZTNC9PV0l6ZlhTOEZtZ2dsenhDYUtObjJR?=
 =?utf-8?B?SHM5bTBZdFNsd2g4M0ExWFJBTUhsWVl0TWJTeW5TR0VneG9RZVMzMmtlS3Ey?=
 =?utf-8?B?RDNlQXpET1lSam5Yc3lxZ3Z5UTNkd0w0Rzl6b1lzTzFWSlRVOUZLY253UTBt?=
 =?utf-8?B?bkdTdllqcjRlcVBuN2h4M3BNYWI1RWRVcmhyR3doVkw5Z2dTMlpFQjFyZlVP?=
 =?utf-8?B?TWtRM3V5TndHYzFZaUtUS2RmWDBBMHFMNE9IdTlZb1E1SkdvUU5iaHVibGxa?=
 =?utf-8?B?cnpnWTFtZ2V6YlRtbEpQSi9OTDFrZHRnVkxILzZKeDNjL0hoOEd0aUZxVUFq?=
 =?utf-8?B?ckI5ekt4cmVQcUlJL1JaZDZIZnVxZ2NWTUluQ2ZFTHZDZVFRdGg1U0VGQzFQ?=
 =?utf-8?B?dFdaS2wrQUQwYmNtdXVYVlQrS20xSmduM3VWTUZ2R08vQ3FtUDQ4UT09?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ea123b-a45d-49a8-84cb-08df3415f5bb
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:35:03.5039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzCByvPNy4f714ZXrU1PBDrqqq7YkqppkOMwz1pNiLJNLDhFSRVerk5WkFh9ldx+J87qHKsELQQn560tpMDYg9PJ1c7PJsgDHfTBSQieVUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14856

On 10/26/2026 8:33 PM, Frank Li wrote:
> On Mon, Oct 26, 2026 at 04:21:06PM +0000, Diogo Ivo wrote:
>> Hi Frank,
>>
>> On 10/20/2026 8:18 PM, Frank Li wrote:
>>> On Tue, Oct 20, 2026 at 10:36:26AM +0100, Diogo Ivo wrote:
>>>> The analog noise filter for the input terminals (I3C_SDA, I3C_SCL) of
>>>> the Renesas I3C controller is controlled through the SYS_I3C_CFG
>>>> register of the system controller. Document the
>>>> renesas,analog-noise-filter property, which references the system
>>>> controller together with the offset of the SYS_I3C_CFG register and
>>>> the state of the filter: 1 enables the filter and 0 bypasses it.
>>>>
>>>> The property is optional: device trees not providing it keep the
>>>> filter at its reset value.
>>>>
>>>> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
>>>> ---
>>>>    .../devicetree/bindings/i3c/renesas,i3c.yaml          | 19 +++++++++++++++++++
>>>>    1 file changed, 19 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>> index 08fcea89a015..381807844351 100644
>>>> --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>>>> @@ -96,6 +96,25 @@ properties:
>>>>          - const: presetn
>>>>          - const: tresetn
>>>>
>>>> +  renesas,analog-noise-filter:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>
>>> I don't like this syscon property, look like it is one kind pad propterty.
>>> Is it possible model as pinctrl?
>>
>> On the RZ/G3L and RZ/G3S this filter is not controlled on the pin
>> controller's address space but in the SYSC address space (hence the
>> need for the sysc phandle).
>>
>> There are a few factors weighing against modeling this as pinctrl.
>>
>> The first is that the physical pads used by I3C are multiplexed between it
>> and for example RIIC3, so we are not filtering the pad but the internal path
>> of the I3C IP. The pinctrl does indeed have some controls for the pad's
>> digital filters, that apply to whatever block is multiplexed to the pad.
>>
>> Besides this, even if it were moved to pinctrl we would still need the sysc
>> reference, as the pfc driver would need a way to reference the sysc address
>> space.
> 
> System allows multi pinctrl devices. your syscon can work as pinctrl provider
> 
> pinctrl-0 = <&your nomral pinctrl>, <&syscon i3c ... > ;
> 
> The key problem is if model is resonable. Syscon is simple, but have not
> good abstract.

Doing this in pinctrl is feasible, especially since the pinctrl driver 
on G3L already has a reference to syscon for clone channels. The 
question really is if this is what makes the most sense, as again we are 
not really controlling an external pin but something inside the IP
block, so I'm still not fully convinced. Are there more opinions on this?

Thanks,
Diogo
> Frank
> 
>>
>> With this, I think that having a DT property is the best approach. However,
>> the form of the property can be changed if you are against this particular
>> one. For example, the register offset can be moved to platform_data in the
>> I3C driver:
>>
>>   - renesas,analog-noise-filter = <&sysc 0/1> at the SoC level
>>
>> or I can also split it into two properties.
>>
>> What approach would work better here? Me I'm leaning towards having
>> renesas,analog-digital-filter.
>>
>> Best regards,
>> Diogo
>>
>>>
>>> Frank
>>>
>>>> +    description:
>>>> +      Analog noise filter for the I3C input signals (I3C_SDA, I3C_SCL),
>>>> +      controlled through the SYS_I3C_CFG register of the system
>>>> +      controller (SYSC). Three entries specifying the system controller,
>>>> +      the offset of the SYS_I3C_CFG register and the state of the filter.
>>>> +      If not present, the filter keeps its reset state.
>>>> +    items:
>>>> +      - items:
>>>> +          - description: phandle to the system controller node
>>>> +          - description: offset of the SYS_I3C_CFG register within the SYSC
>>>> +          - enum: [0, 1]
>>>> +            description: |
>>>> +              state of the analog noise filter:
>>>> +               - 1: enable the filter, performing noise reduction on the
>>>> +                 I3C_SDA and I3C_SCL input signals
>>>> +               - 0: bypass the filter
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>>>
>>>> --
>>>> 2.56.0
>>>>
>>

