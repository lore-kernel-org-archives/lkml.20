Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434403;
	b=pUgS7SaqpWlYPGXQXVZqo/Vw5gbYaONXpcMNZofNTqWTM9sw+jhFPI9OhOSfvSdhz2gg
	 syTfnioXaJ/TaS4ZEZJ7no2XD7xqc0CtDYcLVfSiWZ2nL1HfeECu1Oawtc8/vPonEpGjc
	 DR7tejoC/tSpmljkflvDeyDO5i5ftsmatnvm0TBGq8zygzuL+wYR6ww8H1pjQFumcyQ2O
	 YVH990eMlR82AHB9h732TqqE6KOlFdiTQuQ63VJdcK8pO3p+MqahhMm3bjp0tBRSbrVAw
	 WSKFJFYUBHQGHqMVdUTQDmxDbwQY0TicV5d+BcLkqlFspPQPlgjP6wH3NRIqdNv2+7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434403;
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
	bh=0rPzJp1LoU72ngHYqIfrY+0V5+xK8+6ktYx4gEUIhQs=;
	b=NKtd1m/PQnUNYRfxYE8HLV7T98PEQCGZjRror62tz2EpDk/G4KlHQdfYKBavUzX5as6V
	 iiYlAVm4YwVPDCKUoPN9O+aZ5YWTO4DOXQZH5A6TTzXTeOni8up1T0w3YHYeoq+ZNA/jY
	 GBBWnGhniS/UF/XrFnao0wpoz6URmG6MC5sQpRMfmI0WuI15DeL5nAw4uniTg5syNTuB4
	 7A6uwWIJ8PLFtNUGr3CSJdTbwaZYG92+DlNWJTIhCFhWjiWWqla6kHa6crQoKGBlmE0YR
	 NBL2prZ2EaL/9AwCSZdnjaWWMt4NLYwMAFQ+PvraUDxUJGfr2Nnu3/uzBSVKEXWZbNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pfj0coDU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.45
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2845606A32F;
	Mon, 19 Oct 2026 18:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2845606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pfj0coDU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuhNHgWlyatcKKCJukTDqveeQFg8qBCNBHeODIZP6pEB+6jY7PRV+oSKe+qKRy5zUcQnoFbixOyZ6l3tOK1s1+4RvbDCJETf1iM5tL+zGpcE+rE4Wrkq+YEYtKGIMrdQ+DVB63zuRsXZ6vF+QAikF0479Mhk8Bgxj6Jk9xhYxwU9FHs3gcZcyZe9n8etLnc8GQLRYQ8vPbe6Er14rPNFdVTp47mQ7yUzDj9DL11OT3XtyPUNLWz7CIyMnf+QIOBVXOVmHEVmShlxke/jCvw7z6N8banDI6XOWr1RNHH/21AgxnNPAulPr5nxMvNOrYV451bL3oMIEb/GtiHYKVV7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rPzJp1LoU72ngHYqIfrY+0V5+xK8+6ktYx4gEUIhQs=;
 b=GmtEntjYd+I2vDWfuMj53Wm4eLbT+AkJqiFshJvypV7uy35qAxPAiQ4Ia1M+M9b3TkEzkz9znfu62usIx6330qery7wUHSqS9UNvTB30idJxqURDocKGWz/PQPyrQnRRmMKKOpWv9tpASSECOHIDuYi/zbiuXBb4okwiVVHFe+WveSoRCrWByDuOW52BlFMtCe9UjSOYO1AYLvQCYV592Mrnv8KeXI9xb+hvsCiYxQY4569yE9U67bZK61IUKW/xI+azh/u1XiETK+h7NHGyj+4rNOmM4qxQk/0ad1l9lfpR1DCd0bL7kN9C50hxTq5+EHnW4KrySZcw8PVSKfErtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rPzJp1LoU72ngHYqIfrY+0V5+xK8+6ktYx4gEUIhQs=;
 b=pfj0coDULVwqbFJoT4FG7smPEH/iw57M5m4wol2NewLlNR/VkvRoOIQST272/K/GIt1dFwcjOWa6z5ljvEQQj5HiRn+66VvxvbmJidB2rcqxK4q5pXnhCI2wA8cblIRfPt1XdCr3FNMXCGbha7F7lzXXmY9DJr54N2mkRlPd3dr63W4gqUnuyrOl9REDDBEO1uXK0s77Tt9qvTpj8yIrVwX2UMwTAC6NaoFrRr1VzYFSIC776+zJEbwEOf6Mhf5sGXkdbnW/Y6Z3w9H3eoD9aSDiAGveT3l3Y8lANQMiGBFEu7PnJ0Ceq9DDO4CGc7aCWkTc1lw6jy0/fJi/Pfy4sA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:40 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:19 -0400
Subject: [PATCH v2 04/13] ARM: dts: imx6q-gw5400-a: fix SPI NOR flash
 vendor prefix
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-4-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1079;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Pi16ZNtWSgN5kITYOWkKpvb2kelfJnb1L8wB+HsX61U=;
 b=uOIA3Co1sO/B3m8VCC+nhEoQORfUoiM0h+XjoZR3yutdPhFoABaB8CNMHJbYL1kTDGiwSwao1
 NpiVlEYQINzCt6QRFC4ZCTkdNbxWdCddoDZx6D5A0iAAMgWHESgEeOZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:25c::19) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf091b3-f0ca-438f-89ea-08df2e0e84fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QGYWAn0D69o+QzMAFvhSwhA4bIZpuAz0qF0s7SOnfDIExrxwXXkm9IcCKcAgtpqENrhHF0PeUGHitqcsbUpAFtQv5n+Scf1PvRgYTcFRq6eXxj+ILN5S6SdgFsdCE7Z3vJ/1NQ8VULqjP443Mw0jZGTfNUBpkLg/4IHgOwFtDowNC+NgF9nt6JCC/hf/PxtYRW/GNRxcBc9eqqmw6yPj+6JdTeDNOMMBu2gKtR7zvO2rpk+Bstsw7o/7V/IiYTq0EQm/N3NQ0L4c3nC3G0u1lJEhhOEQRPuCvJmUjY6tJvpJN+421y7iZyHgq/AntH0c1+TFRKIAaEcanXclrASOkIFTw9Z/XvCeIdMlOE2E49v4PgOAy9k/IqNhC+OqpvedoC7gQ0fQR4U6niYkNPvTXWcFksboD5yws8APKMmKG+kbZoLXG2wA7IBeMmwNHgD9pCCi+iFZ8cq2HgaQpDyVAvSDb6uSIEkYDilo/mmUvS5RyKgKf23Q/xWaF0xvbFfut3Rd0BSEuyYHfsfrvxrbPbbgc3mI1LvBNCi9yqjw/FOlp0XW+sRgMp20zijzuDFN4BvUbYe27+QB25RB8BKUUwZtzv8P7/FusEQoZa2bm3QgjYSAw0HqR6NcYyI14rXVfvaBAtV75Bm1Q8XsRad2rkUM2CBzvu4kFueVStC8yKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnp3MlZtbU13MmtQM3J5N2tFek1wMC9iMWlrYUhQQnpWVllQNk9vcnRFckxY?=
 =?utf-8?B?RkdBNEZQdWtuV1cyUmhRVDBhQTVIRENiaWxGeWZRWTE2WkM2ZVU3RGZOTUhF?=
 =?utf-8?B?UjAxdzQ1cFBWRGVJOWlIRjN3cXZscE5zcEh2bUZ3UWl5MVU2T2RnZS8rNUhQ?=
 =?utf-8?B?WXZ0N08yUTllaUNzSUJWY3dBaE5LcXB2VUVPUmxjRXpjNUFNMGpMQXJNemlM?=
 =?utf-8?B?VlhWd25KTFlVR0VxR1ZZMElDS01rYUhIeWJBeXd6b2cxSTA1dGZ6SXBDamxO?=
 =?utf-8?B?c1VKQXFHNjEvbGNNUC9EU3c4L3cvbEtHTUhVcGNrdDFDQTYwdlZWQzM5SlNW?=
 =?utf-8?B?VDVxS1JtQnVvUXF1WkkzeEpiYUVEOWpjbkk5d096MzA1S2M0TjRFWHdFSm4r?=
 =?utf-8?B?dXowbW4reGhMRzk5L21mNlhpNXdqTkdvRERKMFJzS2Z2cW02ajIzL0xMdjRO?=
 =?utf-8?B?T2MrbU8raytWODdONVFuVUllRWduUUNtamo1YnZ6UTJKSURscXBHTEdNeUkv?=
 =?utf-8?B?cE1zdDZpOXlDLytlOS8vbVloR2ZRL2w2WkdqdGlQWERBeEF5NDIyeWVucXVL?=
 =?utf-8?B?OUgxTnAraXpIbHhRMHZXNS85cWtsMU5qR05QSnNNUDllUHByNDZQNm9CM1lW?=
 =?utf-8?B?STl3R0twanl3YSsxS2kycGRQNFhZbTd2dVQvdnorU3RrOEZQRkFudUoxWDNF?=
 =?utf-8?B?YzMwY3J6alhWaGo4VExEVkFOaGxHNm5hWFpPTU0xZ3hVN1RXclRhNUJCb3ZX?=
 =?utf-8?B?ZXpVZ2E0WER2eFRGbmJjcFlzelRwTmV6cklHbFRnZTQ3YXo1MW9vWUlkbHEr?=
 =?utf-8?B?MW9JNGc3VVQ3U0ExOTFzMjQ5dmhRY3Q0M3lUSk9UbDRBOEQ4UkZLK0UxbTAv?=
 =?utf-8?B?Nmw1NUp4VHFXU2tQQVZoWXFBQlV4MHRkRVJGZERZQ0V0dW9DWnJxUFdydTdT?=
 =?utf-8?B?N3pud0x6clpGdnNJT3UvYXRGSU1lbTVOclU5dWYwVEtVbmFCdkQzZysyZW5N?=
 =?utf-8?B?aHBLUVpGSW5sN3hpVzdPcDQvUHFtWWh2Y0hEVldLTTlTQlM2bnVqcGpVR2Zk?=
 =?utf-8?B?SDJidis1WGNFMnFJTjkrUUJDVzAzaXNWU1J1cG12RzNUSXhDc0NFeU9kbFQr?=
 =?utf-8?B?bCszQ2JvSVE1eHpTazdSeG1ORVhsVE0rRUVwTVdhbGt4TkJ5WGJIWURPanBr?=
 =?utf-8?B?OHQ2NWx4bWRwSFlhTG5paTIzY0ZvR3F4YkdBdVR5V2JUVnZVNFNWZDhVOWsy?=
 =?utf-8?B?UkltZkFZcVdKZ2R4aXpFR1ErOVprSnBrSHAraWlVaThKN0ViMzA1a0xONGJG?=
 =?utf-8?B?M1huM2xkenVNejRyQnEyZzZjcFNBS1FZNlNVSk1kYlpTN214VWxNd0hCZThv?=
 =?utf-8?B?N1NDSW5tMlpaOWlmYVFhQ01DZnVzdmU0QUtlUDhEa2tXeGRBN1J5TnYwVFVl?=
 =?utf-8?B?cklENjgySlpGbjlwbWUyb2lVQktzOXNITlIrVi96dHIyN3pyZXFWOTNaN1kx?=
 =?utf-8?B?eWVJQmNjUC9lbDBZbFFON2ZrOXhnWGU1bmVRTXRJODcvZDdsK20wRldybHpJ?=
 =?utf-8?B?RUh5MXFsV0tTWkErN3JrMnB5a3YwbW1IZDU0eWFxcHV3SkZwR2JiNFpTenNa?=
 =?utf-8?B?WTBGWDhNbWE5NlFldWxneFptZjBTbEcybGQybjhRRUNjYWdDK1hIS3Zqdm16?=
 =?utf-8?B?LzhtNHcvaVc1enVUU1UrWW5EOEV3VUN5YlRUd2phcVc3WjNKb05KSFN6VHM4?=
 =?utf-8?B?K3NOME42YTgrYTQyTXZNZVhWOVN1bkRmY0VBRGZDRWJFemt2SEZMdm93TEtm?=
 =?utf-8?B?aExSajRBbklMdkZXRnpvRW94a2VjdHZoTWk0RDg2NVFQNVJJRy9PNmw2dTk5?=
 =?utf-8?B?Z3V0ZmJzUWZBNlV0MnN2Uk5GVUpFUzhrbDgvR2l3ck9oMEEyRXpsY1ZtQi8r?=
 =?utf-8?B?bENrQTBWQmdBdDk2Ym1sY21ta0Y1cTdPQTBsamJ2RC9wcmhqMjFya1ZxL2Vk?=
 =?utf-8?B?U0NNbnVpSERaOUJhejVqdE5McDh2aUZOTW9tTkZBblRQTkQ5WFhtcHpBNjNl?=
 =?utf-8?B?V2lxY0dseHp4YWtmd2F0REJEUkI4VzlJcis2dk1CK3ZHcEM4amFZZlo1ZnZK?=
 =?utf-8?B?TmZLelFLMFRhVDdWME8rTHJqalJVdUhUbGptM1JNWFVCWi9GMDE4NlA3Rkx4?=
 =?utf-8?B?UllKQ0tNRkxJSVE3TXdsanFab3ZPdjNCWnAwQjJ1M1pORm84MmtYYWRwbndw?=
 =?utf-8?B?U3JjMmRDajl4OS9oaTFwVWg5azZqQWtuSVdnWFdHOFRPQlM5Z3FXRkpKM2g2?=
 =?utf-8?B?SWdMUlpoa3loK2ViNlAzV0pHSVFzSVlBTXVBUVB1U2FDRzlma25WVTJ6dlN6?=
 =?utf-8?Q?g2YqUfAAD82VvIpA09f1c852o0WuXZ52WsKnt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf091b3-f0ca-438f-89ea-08df2e0e84fb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:40.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XrZKrxcrrmRjHJxtgMqms5ZBmDcAcJIB7Pjli+PShrxnqFR7GoiFYHK4Km0+MVjWsFX3k6qYqLSbIhKibJkmIrQET6IZRKaYzRI+OnH663EBHQMgeUeorCeghSMayNB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557

From: Frank Li <Frank.Li@nxp.com>

The W25Q256 is a Winbond part. Replace the incorrect 'sst,w25q256'
compatible string with 'winbond,w25q256' to match the jedec,spi-nor
schema, which accepts '(winbond,)?w25q256' but not 'sst,w25q256'.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dtb: flash@0 (sst,w25q256): compatible: 'oneOf' conditional failed, one must be fixed:
        ['sst,w25q256', 'jedec,spi-nor'] is too long

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
index bf8fde9cb38d9..89c52b2e7c24f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts
@@ -128,7 +128,7 @@ &ecspi1 {
 	status = "okay";
 
 	flash: flash@0 {
-		compatible = "sst,w25q256", "jedec,spi-nor";
+		compatible = "winbond,w25q256", "jedec,spi-nor";
 		spi-max-frequency = <30000000>;
 		reg = <0>;
 	};

-- 
2.43.0

