Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793873486;
	b=dKV8L/dP+b8TdJYjL9OGx8+8CPhwhd/r0BWJ3uxY4kdSfwOluWUdvC87JzhD+OC/V5kU
	 f2ex9Um0MpMjbEpSUnZOJjO3hK6lpTkbMxjEkRN8ToV2eONRfeFyE9rvQsA0W4pFJTLfh
	 6wGUSJ55AE+/8uDk4384HoV9hRHmv0H66+EdH3EUDXc0/1N08Qh/QiIXPVq/UcY9/m0B/
	 vudS0kUo0RWRr8tdpaogdq7Jvhu9p5zdgpokTWILsM1g84RKdGNrS0PiXYep1tkjI6gku
	 6avaaM4bUZ3k2CoC9xEjOfc12K3R9aY27em0y4K9vNFU7j8xI/dNCW4qcWAaNOwKDTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873486;
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
	bh=FomJC/bDvIu+G8jOMN4BGbvG9MVjlFR4kAKl2WreOzs=;
	b=KwbYxM+28VnpoVAHgW0l+I+zQNvVkvOBII6IXaMXlWIhwl9E+Vv3F1Erea6J+jY128PP
	 U1jPMoacNnvfDDAy97bVutDUHJxt1o+pLHQ/wesPZ28Tfdy9S8cHfL8XCkBLIRaM9cPGL
	 uARgmTleh9tfdeTD4THfNr7f/MbZCD8h+oO5j8PHcVNpRg3qb0BnWEhaVMchzj9i+bcyo
	 1bbG9Tqarz5/G7C8N+h7gwnYcUgCwsrjrlYqRQuJSCvEO/F/KL5jFwyPK3T1BgQl/xaVh
	 hbdeqb2JbVCtZxkQbB0eUEZUF5ga1u+skD/rcwVLsmcXtdCHr1IkJU2nUDEQda+y38w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaisala.com;
	spf=pass smtp.mailfrom=vaisala.com;
	dkim=pass header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b="iKyS//Ik";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.118
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023118.outbound.protection.outlook.com [40.107.162.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49B606A329;
	Thu,  5 Nov 2026 10:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E49B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=iKyS//Ik
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdZPyxt+hhKXZ1V5iOFpEwhb7P3l/OVuU7dRGKa9GHxXA8TfNucQmFSPkL8Rm/dq2domEGk4veOjS3S2ErI5kVIXx9M0LoFMB32EjqXiH1OSzrOHW8xmCnvOR0Pe65r/tqsaB/NJXvo3HFgnrSb7ySXKpfstketSJoX8CcbTmdBQ2ck8Sts2lcgn5YIdZiGjqkOyGKYVcnqrP49mCArp9pf86fI3yrSWCu4Vi139vYVW0uPnvGwQaQDHCtkrUI6TvDUw6U1VvdAh/aJyCtBAcO6n1FFklsVrDqwE94aHHIYpXtBJcYhZOoMa7KKuBGrTVCtnc1H19YPCT/k0fcTioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FomJC/bDvIu+G8jOMN4BGbvG9MVjlFR4kAKl2WreOzs=;
 b=JXV/MTaxWo32ZPjURbTv0D5LPjocNn/nQSbplT57Qu9CPBO47WajwwuzWcI/DzAWDcMNJlOvkc9BNQVFezMj/rn6FGdpvazP1Z3aYMu99WlpC4GHr94ZralClkh/X06c6TFPBbcBLSzHuQjZm+7eI9Ylyo5IoX6XO7HQtiTBaQdDYfcUUT4LHAp40CT0oCd63LSDuoKg28Kw/jFJlVX+wFYVaWxnEHgui8cyzDGBIImukSJI9Jk3JQboiB/YagfdLFjqfcBRgJRNNRdT69vqYIua4IzQoy01Ul6rcWkPe4vRIFB+DLb613FUTlNkumBWOWEfarC2CUh9FPdUbmvHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FomJC/bDvIu+G8jOMN4BGbvG9MVjlFR4kAKl2WreOzs=;
 b=iKyS//Ikhek1HHejc6JESh3FvNvshNXw3nJHRG2I0wQek40pyabWkW/svSxX/1Ul3+WFwgQIX5TUAuaLdb45S1OHFGvLF2prZVZoZ8G9Acg+yZ+Ee0ekdCgOrLR+vCCxfvW1IR1UW9umZ/pMEe7JWfJX8VUfp3bb0K8or0pKp/90G48jbkWg4h+qCh38Ldvsv3lOtCfHvvbARXoU5iYjM4120Oe6h3HqhwsZmUMeCMPXsb51DcvDhGzr8U50GM/uNoxodVz5VAPbyZAqz7CnL/B8ucWTeIWKGax2JlV6AJUqeIRIDFbt0UlrsKCHAiF9JbaygKhna9FdYV9a/Q6dWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com (2603:10a6:102:407::17)
 by PA4PR06MB7197.eurprd06.prod.outlook.com (2603:10a6:102:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 10:11:12 +0000
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc]) by PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:11:12 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Thu, 05 Nov 2026 10:11:04 +0000
Subject: [PATCH v5 1/2] dt-bindings: mux: gpio-mux: Add enable-gpios
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-add-external-mux-enable-gpio-v5-1-96c5b62c86ea@vaisala.com>
References: <20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com>
In-Reply-To: <20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793873471; l=2577;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=Gr1YAJALi3AouD4e5XuzJ0v8KAWvpwPWlcL6zTI5+54=;
 b=aFMROVSEXhKjOL04VZLkeCFAqeqVgU6o264o+KYgkOxzPfSz1Wisu+MeINRhPw8XaIO7VHjK1
 C4Y2HuFz/L3CdTnF9iRk8b/1ipdCnj1XhEgf9JyFYWAUt7exKk2OGFD
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
X-MS-TrafficTypeDiagnostic: PA2PR06MB9176:EE_|PA4PR06MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: e230fb35-97eb-4f68-3a0e-08df3b251ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|38350700014|261009223027099003|261022105027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	Jf80YcPGLlqVoMlUpMq+AIRIcS315Ubz+zxOaYgC0sKndm+YCZ5oTWcck/52D28vt+j0zf8AP6C266DuVwY1eF/E1Hhvxv5K3ioTkFcHcD4+f6X50okrKRKFtwQD+Gskl/Co6EuZEbYj+dY7Cr/kx7dQiYcOrElvZdlUatQ3SRTqsbWqZqCsnH5e+LkGE1Xz0rovt3nTCn5tkIQ0uTHgiSQ45ifNAtPTvFvkIqfts9JwgG8wEs2j2jj96SK0jsrhj4UbcdEnK+TnBx/DuatiJXJuZRT+EvAEuwl+FmgYHykxshyDyMbaLGPRuiFmhZnScmF0SOWlMQKc0fMXkfNPswuLb6YcRP4hNZ7kVTMygCNPARmVeNBA9GlyrwJPpP5JrMMTZb/sUO7FMTyaY6wZU4kjor9RvxBHFAYn6Nwh3vRi4vmN+lPGvL0YvsZDG09opz/JHMXlRq/rce0eLHqlz12gdne7JfaRmkODOGT+S5ymC0UFNOnDEMP0UVSmvKGK7JrTpDTZEXfTjwBq5ukWwos07J5nAk1ojAlKr2knCO+w2CSYr/n80JQ8TgLG6ZOR8VRZDI5fhe/5HODLiYy20PSunAdRI3TpRa9kfKPZ/FnPGJZg1WlCqFQEulfqbwbWmdrb7E6mSb38gLjjhLsQgNHOUvBpX6sE9wq2PahiuUq3VEbIpu5bC6VT2mQZlo6hJRXx/clGUYdU/Te1AMr1eA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA2PR06MB9176.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(38350700014)(261009223027099003)(261022105027099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djJBamgzY2M0NVp6VkhLWG9IRjRHdm1IaWdJYlVjUmo1TXpJQXVRRG9BM0Vs?=
 =?utf-8?B?RkZJblE2dHVhUVh5TERtcTBDY3RkZ2duVEllS093Z3JTMUJyWkhocFdQa3JN?=
 =?utf-8?B?Qis4eHc3ajEvcFlhZDEydERqYVhBQ3pPWUdWdHNzdm5lbW8zY3hNUlI5YmR6?=
 =?utf-8?B?TWwrR1ovS2c2OHNxVmRIRDFmU2UwbGFwNHpSMnEzbEh5OE9NbWFoZzdndEtk?=
 =?utf-8?B?RTdRRlhsY2pOMXRCRFFWSGhOYm1UQU1hSm8yd3c2ODJBK2dSR2Y3MHVYNjVV?=
 =?utf-8?B?Sk96Yi9iRkxMVzhHbXlidjJrd3pzS2xxSGV4M09UQXZaVjhkbUpKQUxjdDl1?=
 =?utf-8?B?S0FuQzNPUzVISFBJRGprd3gzT0pzS0J2cGRsNmN3WVowR3AzR1pLVkdmQmY0?=
 =?utf-8?B?NDZkUklUYmNYSllRZU0vWWY1OWw0V0RnckFSbThsQzRjTnMxRzAvb3RCdHpY?=
 =?utf-8?B?ckVBYVBLMmIrbmwyS2NTVTdIZ2RXVVBub3kxWWdPWHd2Y2VhR0wyOEl0aU14?=
 =?utf-8?B?Q3NkZ3dIbEdNemo4alBQdnBYNDhNb1pWdFF2MzJvazF4ZGhzS3hqUWV1VHZV?=
 =?utf-8?B?Q2M0NThyTllaR1dKRHErYndNN2xIby8vT3NFZWhiTnBoay9KOWpCd2RiZEda?=
 =?utf-8?B?YlZpUXNrRzZ1TWVqaFB3c0RWUi9MSmNpd0dVN3h3bTZHbTU4T1ozZFVOOWFH?=
 =?utf-8?B?cDAvSlZZbjZKaXZha1QzdFNDSjdhRWNWTU80MHlDYXljY2JwMDRZODhTUHBI?=
 =?utf-8?B?UER6VlNEcnZLZE5QNmZ1UW5xK08wMkN3MHIvL3p1Q2xpWllVc2k4cm42c241?=
 =?utf-8?B?R1pDblMzZ2Z0OUJzOG55VGlzQWtFQkJ0Qk5sMDgwaGxiMWRLOStpYUlad2ZT?=
 =?utf-8?B?dTNZTG9iV0NNbTlIRFA1V0VZMDZtS3dyckJZZkcwSmxyZzVKTjBmMmdmVzFv?=
 =?utf-8?B?bUM4NW5PU1ZHQ0ZKWE9zcTBOZ3IvVjB0SWxzemo3dGluQVlpNzg3cG1ZeEJl?=
 =?utf-8?B?T2hicHJ1VytvOXQwNE1nc2c4dFQzem40WTBkVGhUeGEzQ05iWTVYQW5XbVRj?=
 =?utf-8?B?OWloWTNNNGI2RTF4THhtWHM1NHdhTUlmV0xYTHoydkpzdlVUWUpTbVF5alRo?=
 =?utf-8?B?ZFpkcUNBN3BQbDdMRldYYzFDYkZ1b01TWkFyanZCUFNYUFlhbkEzNHdPRjJR?=
 =?utf-8?B?UHovUnhvdlJuZ3BYbXJDcHRESzdtbG01V0VWMWxqZWJtR0dqamlvcUM4QkEr?=
 =?utf-8?B?SGYwYXBlSXI1bnFHQTR4aGNNaHZpUDIrdDliYmdZWFBxTllrYUsvRFFTYVBz?=
 =?utf-8?B?aC9uKzc2RnFkZFUvMHkzbDVFWUFXTnBhdk0zVnErSjNnUjNtcXluOEpFWEVO?=
 =?utf-8?B?WjhteFoxVHNiakZxUXFwYzVqbFdwNi9na3lEb1hCeDdpbFd6NXYwK2hvNVVL?=
 =?utf-8?B?UVlrYXBWWlJxb0liS3dPQnprZ0xYak1Kd2VYMEJEZmUzTDFvdko0eE1mSEJy?=
 =?utf-8?B?cWR3NnBRMDE2RUMvQWFITFo0ZkIrVmtlWHlaRjFwZ1ZGWUIyR0J4VG1Nd21z?=
 =?utf-8?B?VkJjbmU3NzlJRjZ0ZHNyWjJTUTVkd0hmdTFGVVp4R3NGWGIzOW8xQy9ob01a?=
 =?utf-8?B?aU5ZNjJTNnoyZGNCbUlQSTcvUWt3T3djQ21rSUxwZTFpZlZTOWRHOVpnVDBi?=
 =?utf-8?B?cHNaRVpzcEdWZERiK1U4Y3UzYnh5WTZRelVzZllabFVTNEVBVmltUFlKenMx?=
 =?utf-8?B?VUtoMlBYUDR5YTNIMlJqbE5TQmFoWGlaekV3TGxEQlFqRVVUNE9DWWVLcEgz?=
 =?utf-8?B?M2ZsZWphYks0TzhTTlYrSGVnWG9KalRtenFXNTlOME9IR1JIUytjbW9ZSXZm?=
 =?utf-8?B?Q2hKcVdMcVlRK1B6bEowNXNzSnhjcVJRYytERXI3bGI5RFQySkpjSytVeDE0?=
 =?utf-8?B?NlZZbEJkOGdYUWt5ZGovUjF0T0xMVHNTbFdzOStOVFNUVDhsTVo4cGhaOXhr?=
 =?utf-8?B?am8xT1BRZ052eTUxR3dXeEU3MUppZVFWK2JvUmQzMHltTHVRRUJsZC9CMXJa?=
 =?utf-8?B?dDAwNnJrdGtuRkwrLzNpT0dDdVB4Z2pCV2lPQUNjaklpWHVmbEs3VkEvOEJG?=
 =?utf-8?B?a1QvaVJNZWhKbk1JNXdBYnRuR3I5OUNILzZTa2RuSmFTMlUydUJ1ZVhIMlhY?=
 =?utf-8?B?ZFd2a3hJbi9JSUdDRnlPNVdPcTZnZnc4NFNzODZvNkU5Z05JVG1LZzRPYjJo?=
 =?utf-8?B?aWNmVjVtRFE1a2ZVbXQ0bVF0Ui9YblhpM2VHWkxVTUVsaVdRWE5BOXhyeC9y?=
 =?utf-8?B?eXJzamZDRHh5MmcvSU9kM1lVNDMvMWxuVzNSZGpMQXJtVHUxWWIzRzZ4Ynl2?=
 =?utf-8?Q?yhysX4kW/qHwR9dw=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e230fb35-97eb-4f68-3a0e-08df3b251ec1
X-MS-Exchange-CrossTenant-AuthSource: PA2PR06MB9176.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:11:12.6980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+qLq430s8onIcXpP+EN4YqyRCVYygIcov1mEL0kCxAlAxS3y2Ubhbvif2bmhWmf3MP+g2+5Ohw5V7Am60aePz9a0x1spw5RpdSwyOdjjT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7197

Analog multiplexers have an enable input besides the address inputs. On a
74HC4051 it is the E input: with E high, all eight switches are in the
high-impedance off state, independent of S0 to S2. A 74HC4067 works the
same way with four address inputs.

Two things need that input. The mux-controller binding describes an idle
state of disconnect, which a gpio-mux cannot reach today because the
address inputs always select a channel. And the address inputs are plain
gpios that may live on different gpio controllers, so they are not
updated in one go and the mux passes through the intermediate addresses
on every channel change unless it is disabled meanwhile.

Add enable-gpios to describe the enable input, and require it for an idle
state of disconnect.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mux/gpio-mux.yaml          | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
index ef7e33ec85d479ce57c5fe4a780f81a08a6ab6ba..2dd94704fd7bde238af4e84af87c2ad8e955eb14 100644
--- a/Documentation/devicetree/bindings/mux/gpio-mux.yaml
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -29,6 +29,14 @@ properties:
     description:
       Regulator to power on the multiplexer.
 
+  enable-gpios:
+    maxItems: 1
+    description:
+      Enable input of the multiplexer, which disconnects all channels when
+      deasserted, independent of mux-gpios. Deasserted while the mux-gpios
+      are updated and for an idle state of disconnect, which cannot be
+      reached with the mux-gpios alone and thus requires this gpio.
+
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
@@ -47,11 +55,23 @@ anyOf:
   - required:
       - "#mux-state-cells"
 
+allOf:
+  - if:
+      properties:
+        idle-state:
+          const: -2
+      required:
+        - idle-state
+    then:
+      required:
+        - enable-gpios
+
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/mux/mux.h>
 
     mux: mux-controller {
         compatible = "gpio-mux";
@@ -59,6 +79,8 @@ examples:
 
         mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
               <&pioA 1 GPIO_ACTIVE_HIGH>;
+        enable-gpios = <&pioA 2 GPIO_ACTIVE_LOW>;
+        idle-state = <MUX_IDLE_DISCONNECT>;
     };
 
     adc-mux {

-- 
2.47.3

