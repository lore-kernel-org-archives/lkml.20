Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793831215;
	b=l00D026qxrCpgsm7/iqIKtjRofApdQtdABMmbpPXkjhH5OAQL9bRFkNAJ1gxH2BKtq+J
	 tekbmvn6845Hbe58REfIxdGiiW41J972Lf2+agrLtjd4Fk1aj3Yz7IHAwPHMT4X4ZuTYa
	 1qrgmUEJAdZSjvHk4TyOX0HNVlTvOGjc1SXj0/NdfGKvjag0tnpf8KO2LcbPHVKNC0m2h
	 UuZifHSWo/hNAs+Tg6DoMBGxialt30KKj+ti7eurcEQZLeUyC//Ii+Lo0WenXqsDnFN/b
	 1qvUT2KWcAAhzB5ijSbOvTfJMr5YfPhTed43VX56h8T7s0bCHTB3EjsxiotmBLaSSJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831215;
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
	bh=3lHFtNoXN9+qA99ptczfl1VTdL7qOlB4XR0As2iekug=;
	b=shKM5ix0H1HRWfH6AOv/8lipcQmyWsjHtPpbZM+BYfigu6NUNett+h7OalsWueBfDcj7
	 5AkyV2Zbb3zlNlFYWQv8yfxPS5Dx5AwkP2hnYQdZT8ob8t37W2CA2/JB7vTAXyDTorrn1
	 Eo+BH5pE8pRCwkB8cGAIHT72W8fbBvzMNnyLfZ/y4gnCRyAiQrKrXLhW25Nd0zGPEJibB
	 E5EOGOD7CwnQlkzkzbeoJsm4J9NbWIXSoEmEtFNs8kWFf9RDiep/9YflOp1lGUykMgp2N
	 XJ1/oN163k/MTPQqFSyqJ+UBsRhCL4TsQ6Cm2E9VpqVVugBUMuBThX9KyHw1fYUnkjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ie7kqqyt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.22
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2103606AB04;
	Wed,  4 Nov 2026 22:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2103606AB04
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ie7kqqyt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFY6V5ChVCvgnsi6COtHUmON5LLt3PbhIk3Fus1PEmjYMyl+gTsOohqPf60EO/qzLWlH/9KeFsgmIRb90979kc8KOHm/lcgdc/BbpGoz3JHzy+QwZS7HV1y+6e0oFJmsHbsDJcjvgOHZeq6I38pDopRfYPFugpEZZkp2kP1hFjl+8dvb5LrKrBh7pNRJPBLzpU+kRViRfQDlVZ4L/xTxLbzwO5RgPz7yxp9wVJ7omynhJV39x+JFOVhfcLvS3fT3J5+ihjcuz+5Uw/dk/ci+/zgXR9qWoaU8yXwMuVr83H55AtI77XuzKk9/wfIepkY2Krc+/KniQJRgTchIhS5UKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lHFtNoXN9+qA99ptczfl1VTdL7qOlB4XR0As2iekug=;
 b=lm5GEXMsNDTdZMMgXhNMdsnz0KW96Fngq6ajFoy6/S+ZLcG28CVlZ51AWsv5aQKYB51fO9HPsKxMhpkVlR4EyyAAHZ69kjuo4VqVnpojslrzxouheZvDcdb2Bg6u1tC++NhZAgsnD41MXGvwNM7/L2Uo3DggWnThFgyyzJVy9artYTfifu1Sh9TPC4ifyfWmxW5Fgyamznalft59MjyNieU0lYr7YADczzPe0pK7hVMExzgQkqiWGTTzFDu2nc1gy4EMOOsOrW6OjYQA84xYkANYmrki7prPMX2u8OOgk9XRz6VpYrE5yTw35ybIH91jj14A35EuTLTouib3wvIbiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lHFtNoXN9+qA99ptczfl1VTdL7qOlB4XR0As2iekug=;
 b=Ie7kqqyt6FRBsYsdy9eolS0c228WVYUulqnDM3FlkZf/7god0jIdwlijtz7Q/g6JzSZ+DG2lEgcL7KlyAT1eI37jpIq8EQaQlmGEbEWVCtbXKgLmvBEAFPbC0FM7ybdsw0YrDSr8nZXW6W/D6hVXGAW3VxWV0P+GiRtNVSpTMKuliQPhCy6cwpeQAP9RAAGV09EtbCyAsCVqq4bLAK+MF7yAo2jKtLhnfGA2BUWhc8Lt3ckUeZcg0D/MJPYV2ZNpxeUQ+bcFlR39vvvXUBhs2hUtbBscF/nnd46vU+CM8T/MEFrIBQRiwj14Z6jxosfPHsHnhuYnIxQHItaRe3Rd2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI7PR04MB524858.eurprd04.prod.outlook.com (2603:10a6:290:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 22:26:52 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 22:26:52 +0000
From: Frank.Li@oss.nxp.com
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Avi Weiss <thnkslprpt@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Javier Martin <javier.martin@vista-silicon.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mx2-emmaprp: return failed buffers on bus errors
Date: Wed,  4 Nov 2026 17:26:40 -0500
Message-ID: <179383119778.3940211.930787543638451593.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029144956.1632798-2-thnkslprpt@gmail.com>
References: <20261029144956.1632798-2-thnkslprpt@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI7PR04MB524858:EE_
X-MS-Office365-Filtering-Correlation-Id: a105dd21-5ebf-4173-da2e-08df3ac2b964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|11063799006|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	VC4cG0i4ikKscO2+pBuguOKgG6UPM0KS132/MTxIT2KwviiI/SMSAXTTlE3LtdjnqyZoZFUR0Ts3/z8IyEWzd6le3uuSU3uT9ev1BPDlnQ5rYsB4k0rX8j/8ejVXJ4gKuKLPeYTcF5BWBiR+231hbAk3pH5pIo0kYAkD7tf9MDdUCGik4ezxJvQ7HiqQ0cWNGfLMScmfJ+mnVJRFCOwN4EofxZylG53TLCnIAuI/jzzOFy2TTlEPBzbmioTDpF6A3esBGAdtQAbYzmoCIO2wfjhjQYhp+iCeWRdNQX7xBAugKAxDDU/rolHk6R+3NWoYNUZXjbBr1GGD6gZKNB1Y3Ib0f9UUDCQYqjs/uti35b6PURypesYa1RR0vkogEdeuTULbYWpvoPmhxxlKkeHO/3LgjPGmFMv1Cx0iiBrrko/FziVsdyjQWbdJsMHHELLLGMdOoFB2Thty3X+rf1D+ZSqvodpKSKcxg2zHqX28X2BKanYV0Gnz6sAn4XU3p3vIv7LuxON0dzq3MTQEyij/jB8gg5X6j5Kzz5SOAB0Jj9Zph5izpTBuwPdoYinjVV5jFEOmFAW529qpQnyd5xShrEElqjkbubGFK3FKJK+PMVXm+fGTvP7pPoKr2oTi91Qan5u29OpWwkyFb2F4Vk3B/nRdZwZYtapLVtUaR+EKkv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE9TT20wYTFEaDFqRGZ5OXgwV2dYTkZwR3NlS3I1UFpFVUZGald1L3JtdStV?=
 =?utf-8?B?VXFITmFZM3hrZFAvb2o4NEtSSGFreW5EVnZYZHdGakUwcE1VcXE4RXM1d0pk?=
 =?utf-8?B?bFF3S05IY3dMZTZOcE52RGxUcGJOdkxkQndiT3pUV0hIQWl1UFRZaDlsMGFx?=
 =?utf-8?B?dnFLbDB0cndiT1JMRmwxTXFUS0F2Z3ZrYkFuaGUrWEZUSHJNUDRjV0JZN2FJ?=
 =?utf-8?B?aTVIdEdRYk9vSVkvMFlBQ1FaQjZnTmpsVFlDZGpyN3Z0QXZWdkRBODVib1JG?=
 =?utf-8?B?M0NsS0F6QW1EVkVPbjR0OXRkbUk1OTRXb3YxUWkvWDdwVThrd1lkZmQ4OGtY?=
 =?utf-8?B?eWR1NEozNGxQa2grZ1hmdHY5NG9SMWNocXRqdnRzTHRNQ3lHbndTQzA4VFFP?=
 =?utf-8?B?NldQbUJkMVpJTTVZd2l6dnhjYWczRFAvY2NPb2U3SmxSM1prbFRtajFLb2ZQ?=
 =?utf-8?B?aytBN3hJcHJqdCtpaDNXUUdNdG5Ocm5nRHE3UnhVRmRsTzhHbkVHbklkc0E4?=
 =?utf-8?B?WHY5dWpldm1OZjdXSmVyeUpzdDY4WVJiTnVLTnN3ci8rbDdEblZvQnhBdFZI?=
 =?utf-8?B?Q2dWVXd2U0dIaGpTTURRYnQ0anNCWVJieWdKcEswRkluK2NCM0Y1ZVlsczNJ?=
 =?utf-8?B?U2pHUlVWdkZ3UlovUEFDbVNUUVZ5RzV0SjdQL0JkNG5WVzlXNjZpTFdQT2VP?=
 =?utf-8?B?RUlZbTFEZTVzYWl0SU4zVWxTeVpLTml4NWJkZTl0SEpyeXVjR2p0dDA2K0ow?=
 =?utf-8?B?TjRDem5kRzBVdVI2VVlQckdGVG5MaXdYS2lIZTVZVGtBaDBSMEtCdGp0cFFK?=
 =?utf-8?B?TEpKallXRUduQ3JOWnltaUdnWndNTGRpTXZYWjVZNXhocG1JMXJkSHRqK3Ja?=
 =?utf-8?B?aER6UVZQZTZaU0NCcExRaU5kL2lWRkdhRHV4Nkx2NGRXWGh4eFZWbml2Q0hm?=
 =?utf-8?B?b2tseERaRFBMSkpqVjRNUXlwVnJ2TUk1dFdrUkRUdndCcjFnQ3ZtNnVqdjFY?=
 =?utf-8?B?RVliZEdIMTNSenhSQzhDb1dtT3B4cGxaZ2VFZHUxM01NVURkNHVTcmhGYzF5?=
 =?utf-8?B?L2YydmdtblFXZGxuV3RTWHhVS21jRUFPbUpMM0hlZzJnVGVyV2JEcUVvYWY3?=
 =?utf-8?B?MjZHTVUvV2hINXMwOGhTMzAvcHJwUDlzWS84bk52eE9ZbjlPc2FBZDU1M0Jp?=
 =?utf-8?B?dytBQUJ0Q2hHc01RU2hyT3BQM0tZWVZJbDN0cWdWOXk5S2E3VlR4S1dSazVx?=
 =?utf-8?B?dWxRdThpTEVJMXMvOU0zU2c0U2dsMFdRTERzZHpDWGpEdTR3YkpISEtoNHVt?=
 =?utf-8?B?MFVURUU5Q2VWSFNzRUtSNmx2YzZFL1kwaGhkaW94Z2dlWWtHYytoMHI1K0g0?=
 =?utf-8?B?SHFJZEJPQ1c2VEQ5TTRRM0UvNVIzcVZpVWt0L2JzLzhYNTFkZmhqRmFrZTJE?=
 =?utf-8?B?T0xER0xxZitmREZyL05LcFNMR29UNnpYOWtUbWtsVmx2cU52NlIyTnJhTUsz?=
 =?utf-8?B?ODR1ellKYmhncVdVKzk5WGhlSzFza0Z6OW9ZY0E0VDJtRVVPOGk5RG1Lb21i?=
 =?utf-8?B?R0ZuZUVkNlRVckt0SzYzNlE1TXZ4cWhRNW1NU0tFTGxmaTBNUWZjSlRzUStY?=
 =?utf-8?B?M3FXVzdib3VyMjVEbUNSTEFNK3NMZ3poL3YzQUJNRDJVNXB2RHE0cUpGVUVj?=
 =?utf-8?B?VlUyc3NNWDYyUWE4dlJXMFZFWFFneEtVVHlUdkJ5TjBsaStqc3liczNMVURu?=
 =?utf-8?B?VC9VbW5nT2hnSkJtVHR6Nm5pV2VuSWswQ1c2NUM4Ui9VUHA1eFpLUHhZODVN?=
 =?utf-8?B?UlZZT0w4dHRQTkI4KzcvN0lDVitBQzB3QWg2TG1tWmVEV0twTjRSV1VPZnNv?=
 =?utf-8?B?OURjUytnSGx2SVh3QmtSeGZhY2VaVjNLdGhNVFVTdkhGN0p4WlUraStUYWw3?=
 =?utf-8?B?dHZUSWt0ajRMWURBZU1CL1NCV1lTN0M0cU1qWWpwUGJ5T2ZYbEpOUzVGZ0xF?=
 =?utf-8?B?aUxMU1hKa3JXUElSelZDbXV3RlZCbjBQK0NYTmQ4TTFiT3E4dXVzV3RENXlC?=
 =?utf-8?B?SkdIUEFlOG41M2xYTnhmck9CZUZHcm5IejR6MnpJSE9FckpNckhLTzh6bGgz?=
 =?utf-8?B?aFlYeDBmamZ3clFoNklyamVOc3hDai8wSjgzb1pURm1VQUJoZUVmV0xqaktp?=
 =?utf-8?B?QnNlZEdZK0JBQ0UvMGtCM2N5TGhrMkh1QlNIU3h5Z1JSelRrYmVONlZjREEv?=
 =?utf-8?B?Ry9VZS9sL0FMVkVWazNxUjROemZQSEJXVHVsQWY0b3lRcmFnN0ltOXhXeVRk?=
 =?utf-8?B?RjVvYWdhZTQ5VUpzRHhTbkFtYjkzTUtZUkI2WlAzMkVEOTlzNTdsKzV0OHZX?=
 =?utf-8?Q?n54a/j3VYO5YURSlrYlRnplHGcTZq6BTItse0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a105dd21-5ebf-4173-da2e-08df3ac2b964
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:26:51.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfWUY1p8ARo1vuml8/cb0dyZjxWDbacCeCfQbSz3ImDl7bK8H64+1EK/dWjs/X3jGiGmPqUbwRZoHcKWTvorxNaxrbg+8p6N6+GNG0ck6PaWLxN8ho9ZktFhK4Dvx/iB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB524858

From: Frank Li <Frank.Li@nxp.com>


On Thu, 29 Oct 2026 16:49:57 +0200, Avi Weiss wrote:
> emmaprp_irq() resets the PrP engine on a read or channel-2 write
> bus error but leaves the source and destination buffers queued.
> v4l2_m2m_job_finish() releases the job without returning either
> buffer, allowing the same pair to be scheduled again.
> 
> Complete both buffers with VB2_BUF_STATE_ERROR before finishing
> the job so userspace can dequeue the failed pair.
> 
> [...]

Applied, thanks!

[1/1] media: mx2-emmaprp: return failed buffers on bus errors
      commit: 2e0758dcfb305acabbfeb5f38ad1a9f8f874898d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
