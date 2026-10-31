Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793422295;
	b=WRYqtFAf43RlMHzFlhL/4I61N4+P1CkdGkozXprxzjoF21ml/nAKLEWuR09WlmlBha8K
	 IlJ5mUTlxjmh7O6Nc9M7ndkKQSZEqtFfULj9wnK4xoK1JZMWAyMgeOG6ByJ0UFFvcqwtm
	 TO0rW6AaiM35NLfGqQjaa9J4XAg9JHZEcyB9n6/STy5/z6RSAQMfldLCyq1iRgETt70SN
	 rJlH5Kcvv9vbsjUBgslKDAiNfqk8o4Jk6LgJgHLwScWy9iFGZJxgrHAjiQtVTCrsLYyTx
	 Kr3Pj9vel3aDwA5tdahlcl8MNg5IOWF4PUZ+qOPDAKj0fxZZ6t4Y0Pu6w9K7lxgIEmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793422295;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
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
	bh=1CqlgEj5PK6j2ag+uWWAKueIFfVXPEmWxYDHHlMmBBE=;
	b=P4nTfD1iOdLhFs/DL+wgJaJzbctrcdxaj7o3nDyBlrqCmwSwBRfszJ36FV91VAwGwwEG
	 QubAvi4KtuB+CKrVmzdvDD30ND/AQSqC8G0Ok0ki5JzsssM5fKqc8ugH5ywn0Beu2Lsm0
	 Vi0z/8HOfQbgo6AVpU55G+VdUVAvuR69w5tsZBzaR58mOlP9Dr8/81Ek4SI3kcUPnGn93
	 FgCtSadgjq9T4sG9S3DT3RVILouZ35ryZmArXgTqDYLPkPySDEY5TasalTrO4SY7x/07n
	 7NiJLEzf/K8tEormM8MnZi0/VibIbccLkGDppXjEiwJpq0tON9+odu5RlubB527w6Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=mamm9J+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.135
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022135.outbound.protection.outlook.com [40.107.75.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B126606A323;
	Sat, 31 Oct 2026 04:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B126606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=mamm9J+E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePDJDh5sYQNBsLXivUjV6OKsuXo3oIqFnjQzjhbVsrOeAsSdt5vq6nmNLnrS4BkGAewHfZlHX2oc7z3seZgTsU3dg7KeqZ9Zp5YebT0F3wnzaYkB86q9bqqvJCKnUPgel8K0zPJdO9fiU/YeeW9tTB1B3WhZ6cPnI6go6Rue9K97JxuOdtQQXeVogufZAUkf3f/MAUJr8oKd5kP6PYw2Y0NrS8b8jJ5XDHCA4jJT4adUbL5Ol07ea6xcz4ewWMRaTHomZJOgrnQl/Xe1ZO1G5JYik/3SJy0cJKZPDwkz75FwG3lC2B8ZhMn1NdG3tAolrqWLF1QXS7wHUso/bc2jjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CqlgEj5PK6j2ag+uWWAKueIFfVXPEmWxYDHHlMmBBE=;
 b=Q4DBETi2yQuv00e3u9Am2KrN4R2cTpay0MHH1mgjGuszoA7ACWav9wPHhNv6r73s0t6nj/cn9eivWiu1F1OOYS9gBnSZELfW4PM9IbTt3IOwpjMmKwViYQDs8UJHW8hHQqN++BNbKXRfBwcSFqc7B9LIxG5e5SeHIYfwJa90tERUOjozGj8mcrd01pbly90UFsHzL0zJsOV66sE0bkCYDOyxZcIfIt/hTDeVkgZhxwY7smuG1VKw2dnJNw2yshx9qDq4eTGqrV0K33XSfQs3p5+UDeXPGUzZElTUL9xxa+p5uBs755uArr9VUFfdIIlQ66+8dOnXvLOGHvxIqdLIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CqlgEj5PK6j2ag+uWWAKueIFfVXPEmWxYDHHlMmBBE=;
 b=mamm9J+E2k2+qUKwyzeRb8Q0/dH6EeqK0OfXeBsNjUclx12XaNKiTRJS1mzxDHINbFbmfM7OhGud4jBn/TyM+Rb08m3q1A7pSK1+3PUcJbE162BQDMTLMHHCht7Djb6OK2JcHV0M0ebN+NaqUVnCTblBT6N+6edSq1NWZhxTI2MuTdA5YugkYKHZ/VCzm8MJQQQukqSXG0m+9tByAp2vqMbShyxcpIPg/LyXclcPZc/Ixcs+OIqGr2Npm3bGyGV5ICnM73PBS8OxhZCqdZfTf7Fy4+c5VAFGxaigpviBKbDCKgEgXjEm94inSxRkIUJgEwnjDxmpN+8a+TEFxl98/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TYNPR03MB10089.apcprd03.prod.outlook.com (2603:1096:405:3d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sat, 31 Oct
 2026 04:51:32 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0569.010; Sat, 31 Oct 2026
 04:51:31 +0000
Message-ID: <31535217-e87d-4ef7-b22d-32c35ee998bb@amlogic.com>
Date: Sat, 31 Oct 2026 12:51:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for S4
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, wbieganski@baylibre.com
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <179337024629.131241.9227206619077693683.b4-reply@b4>
 <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
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
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TYNPR03MB10089:EE_
X-MS-Office365-Filtering-Correlation-Id: 460c3db5-f668-4c23-f830-08df370aa19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|3023799007|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261022105027099003|261021135927099003|261021121427099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	JNpxx2qGfPxW6UujoB7ANja4ZisSsyEKSpQ6AuCwcqGzWocLN6bTweMqXMwT/BuKn3Y4f3MuOkwSaZz0Z3/vvFgOez1yGhvJ2QZG4Gf3TK3w+HGLhtZprmAF94f/nLlYN3ETfP7snf0Jq3t1kgicV5wxL2Mx2tQpWMyogL/olQgpzgO8I7ET2rJ/+Rm97xuyKmtjk+PEfEMe8KeTjGPk5wKv5dcAC0Ih15nK+nQ4NcbI4WPeQuJQ7VVCAtxlR7CVXrmnGnLY0cj511VC9FaAxPea98M+g8fEEhUNchWmpyAg40sd2iYAdscRj3vEgkfRz213PSwYq7JrzmkqjrfkL4tJOnkkAOpzY6HkIvgNtZ5vnKKTku15wV/Q8jZugJTZVi6iD0a8ZVgkUxuX+1tNQDS1NpyBWwlIlhm0Va4ykzIEhn9yFGW0AyTKZPOaLY0uoaL3hdP79LOj7yKT2EsTrPVI/LidIVyGrykPbqaNCyhqxy66/kLxnzPilJ08fqZhnPLX0pQH+f5B9mTuiShSnmjrdubEPqo5qPv+vYQ4Dqnonxo2Xs9bfeQiSYYQe3LHdk8cfUNX6CPh9MVUmt+3KAzUcxHyIzBsOJeVc88kKhCIdwTgB08DebAYZWvn6rkIInOp1W3cCVD8DK5VP8aJKWoK5/ALy0QMF+4cKi7wi+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(3023799007)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261021135927099003)(261021121427099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDdHSzVzeFJWQU9GRGRKaHZCa0UzL0M5bFQ5QmFqazNUNEM5NmhsZGhYRitj?=
 =?utf-8?B?NEplc0dIQ0FPU21ud3diZUdOTjNnS0pYODNsbzBlVStDUXVtcTlDa0RXeSt0?=
 =?utf-8?B?TDErVS90Q2FpaEw3QnI2dDJrSWtQaUIrY2JTckR5SVdYd3VTdGp6SnJlY3N6?=
 =?utf-8?B?ejArUlRnaHNrR2phWlFGSWxGN1htQ09tcEQyYXhSQ0pwcll1Q0ptRWU4cmtr?=
 =?utf-8?B?bmFjbFhKaEdLRzBQeml5bEl2R0k5WGlhOUk4eENRZG9ndk9icERHcGpKWE9U?=
 =?utf-8?B?ZStLd1VPY2JweWxYcmt3WkJuY0l4UHlneG5DNVBncUhyMStvekwzd2U5SlQ1?=
 =?utf-8?B?SFIvaHJnSE12R0E5enhUQ2kwdUR0TWE5OWEzeTFRTkRNNmdibWdrZVcybHZh?=
 =?utf-8?B?cW52UE1Sdzl0a2FqdXpDS2Y5RGhsa1hBZzRwOXFiRU5xWUZTLzhjek9aVXow?=
 =?utf-8?B?d2tFNFMyU1o2ZXVkVlRnNXZqQXUrZEdMdWR3OFEzTFhmZS9LemFjbmRDUHVw?=
 =?utf-8?B?TForSDdEazJLc01rR0NjaTA4NEtyZGJlNi9XMmRHeGtjdDBZSkJmNjNrSk1a?=
 =?utf-8?B?RnJ1d2g5NFV4S3lIWkd3V3lkSTNzNTRSeko5cm1Pb0dReG84UEpKUFd6MVlB?=
 =?utf-8?B?bFJ2elZiUlRZZFIycS9wUW9EVVAwRSs1aDQvdEZnQVg5TUI4VFhyWm1pOVNx?=
 =?utf-8?B?cThEUXQxamtVemdFclp3dDltNjdTVlFDbkptREpyTFBMdXVOQUFXWExpM2ds?=
 =?utf-8?B?ZWdnelpJRTl6dS9TVWx1amdBTjZ3QmpYV3VTZWQ3Ry8wMks0TzRxSXRva3dR?=
 =?utf-8?B?TzdWYjRDK3lVV2lDV3Zha05WMXRPaE92cGo0UHh2MzVXdytxR2FzWjZNN0Yz?=
 =?utf-8?B?TUF6dTZNWXFEcE45QW1pTTRHL2xzSU1zakN6QkxYazg2aWN6USt6NmUvcTd3?=
 =?utf-8?B?M3ZLK01ZMkNyUHhwSTJpTktPUWpQNmxHb3l3cXhGa2puRTFaa2U3WGVwbzFk?=
 =?utf-8?B?UndobUI1eU9nMjRORnVvRTZ6S2UyYUsyUmtKWStkT0x3d0J0RExlSmptNGRr?=
 =?utf-8?B?bGVJSkoveTZaZmtTYVd6VWJGWXAycmtpZDA1cHBnSUt0MnRUV3dSc25XQjJx?=
 =?utf-8?B?U3MzK01wOXA5NDBXSVdBdDNXanhHUjM1cFZmbUFSaXUwQ2txdjRTdkQ1ZG5R?=
 =?utf-8?B?TDAxQWpkQ3BBUjFLanlXM21aSVovbE00eHNZRGRQa0FzaVQrZkJtRldOZUNq?=
 =?utf-8?B?VTA5SmF3eWRMMFBwNXgybUwzS1pvOTVUc3BWQm8yajQ1Z3grYStYcFY5QUVV?=
 =?utf-8?B?QmtOQjZHN3NKVnc4MEU1ZXQ1cHdsYUNLWFh1RzZDZ0d6YiswNlo2R3Yxejgy?=
 =?utf-8?B?dzdiL2NtUTRmZFVvNTZDZnZPR1dWb0ZoSloxekw5aEZGenhtRUdpOHZaSWFX?=
 =?utf-8?B?WlNyZENuVXN6RVVwQXZIZ3hpZm44d0E3ZGFZRmk0ejI4QnpYcFJWUjliOXFB?=
 =?utf-8?B?SVQyQUF6c0JLYW1xcmtFWGZrb3BJUTBjaFlZVllaM2h6bVY2ZXRTUDhCU0w4?=
 =?utf-8?B?ci9UU1Q3emsrWGw4d1dMVVJZM1QvZFR5Vk1QelN5Vmpaa2Q3VHJlMjRCVEhD?=
 =?utf-8?B?UnptNkVBOHdhdFlKU3A2NnNyakY3T2dnR21DR3UzQ1dCRVY2bHF3ZnYyRlVT?=
 =?utf-8?B?ekdOT2w2eFFPdDdBSmRaZy9iZisxTEtLVHZ4TG1ob25ZcnQ3TExBRnA4Zzdp?=
 =?utf-8?B?V1dSMUx4ekl4RlBFT21jcDB5UTZGVHI4aDFYRTdpTlFCeGljTE5SUENkS3VM?=
 =?utf-8?B?RmtuU0RCVW9CUTlYUmJKcHhsNWtPb3llOEVGWk9TbXFYc2hHWEx4V1c0OVF6?=
 =?utf-8?B?dEpiYzJrbkFseDdGNmR3Um93WkNYTUlmaTlCMjNsTDVQRzE4UG9hTkxwaUdh?=
 =?utf-8?B?eEtVVlRHaXNRM09maUc1VnFMYnZkWU5XSzdGM01Fa3dDKzdYZ2Q5WDA1UXVU?=
 =?utf-8?B?c1czSXdSdzJGVURJb29IQ1h1eTU3UitzUTZOV0Y2WklCeUhsejE4dE1lM0xl?=
 =?utf-8?B?aGVvWTM2b2M1TnF3WmpPbVFPYkNnVDJRbFVQUFpJL0laRlRIMU9WRlN4R3Uz?=
 =?utf-8?B?aHo1cEFCT09STEV4MUZRUU9BNkpyZmg1TnNEZU5ReDhqZEM2elIvdmxRMmdz?=
 =?utf-8?B?eGgyamNpK29qMWhYckxsWmk1ckxMUlJweUVTN3ZHNWtYSm5pL0dXdFNCNFhs?=
 =?utf-8?B?dkUyY2htUFRjYUpnSC9DeW5IN0wyR2dHWjIyNkxRem5IUXAxVkpVOTIrMG9H?=
 =?utf-8?B?R1ovbEhiRzVXQkRPazRQMHZMK0hORHBpSURwNlNUZHU4RDd6TmZWZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460c3db5-f668-4c23-f830-08df370aa19c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2026 04:51:31.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5DIZZsWxmnkZ52crcSZ+R+3POpRGseRHs5LDekzr1EysFnua8txnGvO/foCBbOY5KgVGDFHERJvYBXqZJIZfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR03MB10089

Hi Nicolas,

>
> Hi,
>
>
> ---- Le ven., 30 oct. 2026 10:24:06 -0400 wbieganski@baylibre.com a écrit ----
>
>
>> Hi,
>> I tested v12 series on AQ222 board with v7.2-rc1. Firmware version:
>> 'v0.4.ff.I0c83495.75444b3' build 'Thu Apr 16 18:18:55 2026'.
>
> That reminded me, is that firmware in linux-firmware?
This firmware is currently not in the repo of linux firmware. Should we 
merge the driver first, and then submit the blob to the firmware repo?
>
>
> Nicolas

BRs

Zhentao

>> RAW NV12 frames at the decoder output were visually OK across typical
>> resolutions and H.264 profiles (main, high, baseline) with and without
>> B-frames in the stream, also with I-frames only streams. I used Gstreamer's
>> (ver. 1.26) 'v4l2slh264dec' element on Trixie with both mmap and DMA-bufs
>> buffering (on the capture queue only). Input bitstreams where
>> FFmpeg-generated (testsrc2 + libx264) or publicly available test videos.
>>
>> Decoder (and the output) remained stable with simulated (non key) frame
>> drop at max resolution (1920x1088, noise generated by FFmpeg's bitstream
>> filter).
>>
>> The performance at max resolution, tested with 'filesrc ! parsebin !
>> v4l2slh264dec ! fakevideosink' pipeline was ~85 fps (fixed number of
>> outputted frames divided by the total execution time).
>>
>> Tested-by: Wojciech Biegański
>>
