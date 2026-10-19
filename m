Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792434432;
	b=jnfL/p2/0nr7rSl8/w1hU92PU4nnovCaydBjLWvd6oobFW28CgFJUOUuWHDeNaBsXVjw
	 H6eb8POddX/hYuPjzjqlsJzOF+aFwjoWWG74fzijX7xs3KJ3hLIEBbzv17louLcyhuudC
	 rq7DOLlYPGoV85zDvudAjwTWIumgIVbgcFEz19drmWX6sAi3V70bxgfv1qRcIf/0PLEp9
	 DAxFqxWDePdVXlUpoXykaGUvuLyPEYGYuWRWUzC6pLTNVFI23hmjbkKNnUpa0HRdJCGuh
	 TpOMY8QUV4GWEgeX4omP78Mvr5JzSolkoX5SKoPSlentSPdMWgi67txXuwdCzwzgKLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434432;
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
	bh=tWCnmoznKXvgWUUVYHDjq7gl0ZqHa802Qe8uF03O5i0=;
	b=R4WrgFEg+HnrpVwXmQogLirdRoBAy0XSmLWVspZrBJ1QMnFtkFYFg038NTG+ztgGqd2q
	 jG0F5ViG/1zrDfPiJnERdpap5air0jQyDqoO9dOm+riL/kB6g0OVEV3mvkmcAMBsYSmy0
	 SlYFt7C8aD5udgYpy0su/QXJIQheZLRuepXFph7acgqRbCxpSioF2OZfDTNjlHojzKa6m
	 UDe4+H9JW679qI6DRYwSBMxPiZcIsaca63UgrB4+1GaJKLlgTgm+lt+orLIMjcT9MJ9c4
	 P0HcHJIFBFcPyWsiGeEX9gBLuI8cxT6kQ6IOnho/tTFA3hbmH8ncfcMtUuxR8hgOIRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=sRQlZJyC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.52
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9260A2608;
	Mon, 19 Oct 2026 18:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F9260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=sRQlZJyC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrahcPm4qwNb2le6iY3vMLSvPeUjYVJ0zdgQ+0fvl4OFqFeG45Ly8WHKPpjVkg7SARF9Z/O4LEz5Ws28UHwjG96KGn92oiOwK7mgCe2emTvn/V9Rt22yVvkIYEGpOTTMWs5ZPfQa+wKP7UVGdogIWxeKBrvWxIUlZsDESLj6W2mp7CkajoXCcK4r5XFs2JoKzitgjWdnnsjyQxB5q3h08qsgyODCfp886VEmYBevyPWBmEKhZw9vUafDOTKG6op/K2aMM3VMSyAdSkt3PuVVz7IRp97ERlzzT68flpH/MNgiEPZ6Eb6vNXOy71qwo8AJSyYi/BCq2vsLha2GUY7vjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWCnmoznKXvgWUUVYHDjq7gl0ZqHa802Qe8uF03O5i0=;
 b=nCt8uqiAoQXV+NY2txgrahQFi8FE/nSCD2dJmXO6JLZY8MzsPgnB7DxVB+sHM5+ws4MEu3JIUf9eHHr/mzFt4821zyNMc5PH44cVbXqKGC1jXtNbc8Dt2zS23twBhrM1PF/0BKjwsaACYxQ9HA65c0ksbkieysi0F9cYbJsH/2+QyrcrZuJLNK5fmcEUvkXi0q+8cGzO20Q0ZqASDdi6jS58mhkdrMzzGt4Ikj9i+pKUJoLeD+HtFwvVC1mVkjAr2uuujgr2kxAl/0KpDyplf8X23aWB60bAtLKcfVXhPBdsJwmBdCnnJbX4TbR2lv3B7rcKAX4cfpsMNYn7ivWQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWCnmoznKXvgWUUVYHDjq7gl0ZqHa802Qe8uF03O5i0=;
 b=sRQlZJyCrLInBN6I3lbI3xjxRZNoVA53J3dvYOuzxFHICr6rcH55kJH6i3SigXSOpaOs6VsyoMeyzUyrOeLnWApy8SB4lsVNx3Y0JdV9Tx3tC/t2W1/GgdoKeUP6QKOzeqSII9wMQSMOA+6mZXwKTLJzcjTRVYoM0/ugQYy5aEQjiaImLNxHjfH3XMNMaDJMjAprYWbC82iL0ip90Mj3BRZjsa2me+/hB/Gi48xYWHhu4i8smnPrJpz/4nhm13ZD6/nHP5uSGLMH9zWA52yk7qk4U1Q4WmV1GAlfBXImIJ0JeNaexQTLbtK26VAWjIaIWs2r9qMg76ESY/gIYDbXjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:27:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:27:09 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:25 -0400
Subject: [PATCH v2 10/13] ARM: dts: imx6q-h100: rename port to port@0 for
 mipi_csi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-10-dcdcbe6389c1@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1028;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EOck0q5j27977V5nGZtqVxUiY25l1In6ErzSktCp7CA=;
 b=qZMZ815rUVpmzauLQnigfcsU1NvedX+WjS8GZ//UXk4kw6G2l9q4GZwZmpOLwd+5zmQ3Guprs
 cElLbE0iTihAb3qW6E+Dv3+b+oeOx0ozc574Iysb8cJ0n011MICDqU2
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5728a9-3f04-4347-f81a-08df2e0e964c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qlVR3bGETSZjZKj65BRsHFFAfZ3hqUWK06EdfNSQRcDB64N9DglUpp6HVG6ywUa/CGFQjm9RjDWE5dWMoucTj3Fuvp35Vv6brzXki6gmonPDovrf7d450A65sXpSaEijF03nCNouQ/Xhzmgj/ar1eJVy0egDGUw80oG4amWGozYbGZSa8E3kzIEkwNdMtmUof84M15MAPxxZA8Yk1rtYTXDcz4bHnLNEVkWLPet1IA7s+wq+ltf/yNalYBLojkMV0vJSM/HoYcSCwAO2WnsI+vqPiwA/syWkNZP9FpRZk5hQ7Y1furlqAc0LKSXvvJVPZy27/KI5mxMUoGr22iDyaHSflPWiF01zIadDuCWJIPUYflP725BiTlET21+P8v9DcNQ1puSKtZuZZp+c8IchJCakGrHIt9dQsU/qPYtcVOJveDwkOnfkGI5MG6ABFbVCxwHiTf+pwVaVbH3k8EEP2VT3iLXCof6wgSiyvYZBNt9jx/sF2jfDUp+kEWCQhoFjWfW2FhTZj60u/T4oxiPgGphyCywCghw/NtJXjyu/28h3QPtCnIhC4lxCV9yuchgdsuYQE3wfzdWkoclAZK8Oznav6RkuJUg9UTx3g2Bl0Ss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2l2VTBvVVBPWnRITHNHU0NBR2VCTkhxbTVMZ2duNUpzeW5WV0hRRTMyL2lG?=
 =?utf-8?B?TTBQL1l5aFNCOXdFZFdKNWMwTWxNWkZRd25KdW4vcHRHUjJwdHU2ZTFveWRN?=
 =?utf-8?B?SHVlaGtNemcwdDR4UmpwWStVSHNSd04rTG9hVkc3ZXRneDNHaklqaXdZVGF0?=
 =?utf-8?B?L1BWdDhoZWt3UllOYW1CQWhPdnVLMnMwblVMWHNDQXJDc1hzYm9KMkkwS2Iv?=
 =?utf-8?B?SkRiRVF4UVBjd2llMzNrUmVlMDc2UnFNVFgrZWpVb2UxR0w3KzdKV2EvajFa?=
 =?utf-8?B?SWIyd1gyektxMFJqMDhQOC9URTVPUWEyNFZOZk5PVWY4NkxHUmx0TEJ1dlNj?=
 =?utf-8?B?eldERnV2b1JVRE92V1pkSGp1dkszTE5BbmVLQzh4OTlhVXpWMTlJb2xjMjJr?=
 =?utf-8?B?N2dMYnRPM1NBL2d4WVhRRXhIbmNhd0dYVUtnUzQ2VHR0QXh0dk90czQ0bGcz?=
 =?utf-8?B?dEduZlhXT0NMNEJieDhZcUl0QXRrdWF1YXJDNHlJeVYzMnVsTDExSmZQNDEw?=
 =?utf-8?B?blB1RU03emRXeW5obnlvSVRDL1MzemtuZmg5QU85MjE2K2xGTzhlaEw3aHhL?=
 =?utf-8?B?THRrYnJmdi8wZ2J1d1lxVjZyUW5zdHUyOWJvanN1MWNiekFydjZlRXA2MFhH?=
 =?utf-8?B?akt4cW5RL0VHZ1Zhb2pLSFJGZ3JnNTQ1bldPeGp2VEg0UXJGR2Z4T3BxZDFS?=
 =?utf-8?B?MHAycFllZVk0UGJoWTZpSWo2eUVXalVwdm5SaWhTYzN6WlE2R0xOeEJsRVpa?=
 =?utf-8?B?MnFLdXlHTlpQd2Fjdys3ekxjQ09sNUs2ak5MQUQzTElRWG4wbjZRZjBwZVE5?=
 =?utf-8?B?aklHNEg3cFVMMS9PaG4xS2JwY055QXg2Q3RiYTQ5K1NJMDNONVUzeHgrc1hh?=
 =?utf-8?B?bHdmWkNCWUcvWDljUi9CUEg2YURCRytGTUtsVmVaVEtkSWtzMTFiTlNRUTV2?=
 =?utf-8?B?UFF6OWtKaW5wNmlJbU9pRVRVVHdoc2RVVVlOcmNMcHNyYTNyZFU1Z2tDQkFx?=
 =?utf-8?B?bHNseXdtaWx6UzlJamRsMHAxWko2bTZ4UGd6ZCtkaFRKbDZUYVAwRE52enFz?=
 =?utf-8?B?Q0xUSEx5K29kenFsYjZJUG13VktpYUs5c29pK21VSmdUeS9BMFBMdzJoWU1u?=
 =?utf-8?B?eHlIeUQxUHpta1V2d2tlVUtORkhqQ3RJMEFVWTdWZkk5S25wQjdEcHkyMGRS?=
 =?utf-8?B?S2IrbjRWQjVnTGhad0pYK25TcE9uVTVLd00xVWFabjloQnQ4U3BSL0lmeU1w?=
 =?utf-8?B?Si8wSmpkREIxM3MyckszUXkvRlQxcElBZlJsOTJ2dENnWGpER0VOZDBFQmNq?=
 =?utf-8?B?R0NHUHFFbmw0RERsTy9mYzZhUFFJaE9uT3N3bUZuQ3NEZkszKzM0SmdPOThS?=
 =?utf-8?B?dFI3OHdaM1JMdEsydm4wNEhQZ2Q2N3VJakhDNXNCcVlnb09nemFxMjFPK2pE?=
 =?utf-8?B?SzkzWHNyYjllRU94M1VLa3d1ZS8yNWdPMDlTakFrNVMxRnMzdjZXemQycU5l?=
 =?utf-8?B?T21ibHArS1hYNUhueHU0WUdhS1lxZ3paTVRlYWNhNjVxVXMzTWQwQjJEcjZN?=
 =?utf-8?B?QSt5bkJzakhXVytWbnJTSVpCLzVpZUpUbFl3dDlDbm1PWjF1N2pURmh1cktv?=
 =?utf-8?B?Y05GSzVkaDExckpKaUNlL2pueDZleXdxUC9GY2YrSUZ6REtIUkNnY0hwMTNp?=
 =?utf-8?B?UzNOZGh3RFRTYmVKSGRvMzNVUjVQd0E3ZEV0TklWellzeUp4ZmVWK3lPOHBQ?=
 =?utf-8?B?RUIxWFk4VzFmWWp1dUQrWGt5T0pFc29sa1JWcEdiUlMyU3ROcG5rNDRKM0tk?=
 =?utf-8?B?ZTVZZXRkUU4xaFhTR3FYV040bFZHN1ArTkR0MzFMZ1l3MGp3NTdIWi9qV2Iy?=
 =?utf-8?B?Tm4rT3FEeE9EYTE0YWUzakY1dG5YMmRYbEJDZmFTQXU5THBFZEJqTmxUK3Ru?=
 =?utf-8?B?UnNIRGpxWXFxWHIxblhKUm8yZHNHbmxUV3MzbkdQakMxV3BEMndtV3JTZDcr?=
 =?utf-8?B?R2dNU0puaW9TSEtoYmJ2cVlNWDIyQXU1VlNnYm0zVGd6S3lIRnFWemlTZzQx?=
 =?utf-8?B?bVF3ZXFMUERFY2RjTTNWK25FOHA0c3Y4UHpSRHVwQXBya0hDYmpLcW1pWlA0?=
 =?utf-8?B?VTEyNG5nTXpsNlMrRDY0OTZGY1NUcTdndVllOHR2OS80SlFESGxmQ21kakYx?=
 =?utf-8?B?dUg5Yjk4OURBRDlhTEZ0ako1S0JVVldyS2JMOXJMWE44VnNjZy9QYk9xMUNW?=
 =?utf-8?B?bUdnaWp6aFhST1VEUVJRWUlqQ1FmMmRLeDE2TEFqaWRmejVYckxFeEFmcmZu?=
 =?utf-8?B?dkp1RTlJSUR5YlFGd1pSUXVoUEdFc3FFWmFEbnhhazk2R1hUak9OOWQzQnhq?=
 =?utf-8?Q?8pxhSh87Kqod7M/4N0HXbB0UzvXgjWIE5Cw8c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5728a9-3f04-4347-f81a-08df2e0e964c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:27:09.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUBPlGT0I0iMzwShkNKC6B/xLGK21Dev+z//WXRIKcRNajNKBAZ7Dc9EJ/StnD3VmJsVLaQrBxRstRLUJxq0fTcWQ5qnMOKUhdayzny7CppmMv01f0nj/qR7UPzJDtvX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

From: Frank Li <Frank.Li@nxp.com>

mipi_csi port@0 is input port. There are not 'port' at binding doc. Rename
it to port@0 and add reg = <0> to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$', '^port@[1-4]$'
        from schema $id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
index 4c8ea43815597..a5180c655c9a6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-h100.dts
@@ -335,7 +335,9 @@ MX6QDL_PAD_KEY_ROW1__SD2_VSELECT	0x1b0b0
 &mipi_csi {
 	status = "okay";
 
-	port {
+	port@0 {
+		reg = <0>;
+
 		mipi_csi2_in: endpoint {
 			remote-endpoint = <&tc358743_out>;
 			data-lanes = <1 2 3 4>;

-- 
2.43.0

