Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883481;
	b=lX1or5TR6gk7pcIpZDgWUJVAZU6oFjb/hSZsAOBaLDQiHhMYwE7jZMRXoZKwO1qZ4Pzx
	 zjeXloQkcGD6/QXqVkXlIzymLChTACUEqgGIAtiZmLh3h0FXaeOUlmtAXv9GZ23XehyKV
	 KMn67Qb0uQhYYG95MZxIgpQzXRPAQEAj0G3h4LaYGu0H/DrIycGcVwxA1wQ+rx65Lsi+Y
	 lED1TXpKYsD3cOgJYrlb9MQPVvRpQTk/hgR+K9M4miutwptbDltfjNCjr+sdZaLFaFzqM
	 kLf/xuVtTIZyLMDT/Iyv94d5iAjoQRZq7eE8a17BTsoEXN8Lp0IzfHWTG6cn7XfLgGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883481;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KRkZpMfuJZrvVJ/ru7GvPiPcC8K5sqW0WyYylE2/GEo=;
	b=wP3ifMfy9PR8dRq0RCNwhGvu4eBSzMn4mJ60zEzEfUC6RUkRDtSHzuruwN6dyrWQAD/1
	 zNdWZ9E9dyID/7lw4ivwKMF6C6euFPWpQB8LfGqDtocj120OjPmw6Tw9xwLIcmmiQnA2L
	 PpLB/q0XEzgUnFFTalX5klo4d9yloIncEcpymbGiKE5vbPeuAa5L7aaK7Rg4FicSNqAHC
	 P5qjsc4vxrO9wjPPhjMicYPPAnglKldeMXzBa4U9E4v1VKSzKRwsFqvmYakEMHFs6QdsK
	 umr9yZ+UDl6qktlkCaKeC0r2N4fwNwKgF8W+eY42jXHHla4vSBetW5maTWi3vSwCuaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="jC2A5GX/";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=0jQxSZd7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2237606D821;
	Thu,  5 Nov 2026 12:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2237606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=jC2A5GX/;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=0jQxSZd7
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59uSUC3154817;
	Thu, 5 Nov 2026 07:57:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=KRkZpMfuJZrvVJ/ru7GvPiPcC8K5sqW0WyYylE2/GEo=; b=jC2A5GX
	/ZQliKWMX53WMCbZ8ReylTVm9ZTxLFqSTXAOO0CorKKE8XtoXvSHf9XJQrWt7xkn
	DM4PQx3DhLvbo9DEBc6ov1ySmiRp2PAa5fORELcFJiYEmH0/6kSu/ixb6EUAzl5x
	4HzuE7unnne0XAqAFMUnou9jGIQWyfTZek6o0jKaRXcJ7M0Re8xcAbA4i5H5WCNA
	X2va8ZIr9zNK8DfLD1qcXVHqKghrDMLdN/JODLlneeXsxbzOBLTMnd69Fe9x3fFE
	MYJQJBI9z20PWY9icZpWOl2GmGPRgkR2uY+3yb7Bz6vn6B2KPsZiHeT/RHunkjFL
	q8iN0ELMAZhWMtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=KRkZp
	MfuJZrvVJ/ru7GvPiPcC8K5sqW0WyYylE2/GEo=; b=0jQxSZd7yEBtI14dlMGtm
	DIrA7PEFAnmSouK7ECnH3rPeU0biRa/JBqr5Ud2CPGJr7KMPWYIr6oJL6EzVir+M
	a1j5VbZHjSVsAcxUfgJgQQtQcc3O2s4rOnNIo8tsD0g3BADna8HkSES3nghSKlK4
	ojFjck7PmdRivpDYLwgNIaaIYBD7Et+Cy8nqVK0Wt4WUGr0UfrzOfULAOXE8gmFz
	7IafP98qQvcxhNTI34EWv0wFELexdvImeUrKFwnKdwAhHg7E6pdhGk3VGYY1aHm3
	DaRzifopXEGcC7J9b2szubqn70RIn0OJbFyHnN0XcrbiQAIvuPqWoU+o4+kLg5U2
	Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hrha92vb1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 07:57:51 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGIJeEvenmHQUMeEdv5np+qO9oYnm7ch4KARG9XUR+Ydw6MH/0jgWV9FL1msvJqD3XAVurLsMxB9QbOuzPJzHN/SGnKGEaa8505jrLxXV2dmA7v48KnA7Iv2keAUfas/e6JTsdc5Nrije6PyM82ByzhEbF7TbXCe0lffgHjSsseNB3Mwg40c3kJlGHvho4xYHflnTwi5zKK/UL/St+vtU6dH1DzR5pr18mkJy+9g4QI76Q7xXCw8iOwvKARvpPyFw2rLWa1OtyzUrcOlwg7TE0AE79GL+wHkGIRPgEzJNAfM4p3MI9HX0JT5fG0s/UIzrMGzjRnIEeoPxQn5g5h4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRkZpMfuJZrvVJ/ru7GvPiPcC8K5sqW0WyYylE2/GEo=;
 b=llr6dRVLKyHJYm78nHmBCxS6n43wMRZ5LvbDzYfcCcsJe+M/hpjqE2z3R2I2lgUzGrZKq5RszRIAtnsqq3dA3TDhNqpfj4CVb9q1fZbap+XZvjzGUKznqzKP8eVkWfzYHhiHKy0w4Sn4cCpzoBHDAwqXwz2TKSpAjDr/WYOl3zUpfFXE3sRSKgcdrnMOqXA2Mn7rXNw3hIwroFwul+NPcTOJ39Xz/71nuDj5Zdh+qF+mFHwkzhesi5ROOwhDEQRN9TkNDwDBkJo8OJXL+P6IeLNUmhVgbE3Wv5S4iTdM8TAmjLeFSBIsmLDtDYohhI1/n9zR4H46jcZ4Ks44XbRTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by DM4PR03MB6160.namprd03.prod.outlook.com (2603:10b6:5:39c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 12:57:43 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:57:43 +0000
Date: Thu, 5 Nov 2026 13:57:39 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] mux: gpio: Add optional enable gpio
Message-ID: <aux9PasiRvSJuIMB@analog.com>
References: <20261105-add-external-mux-enable-gpio-v5-0-96c5b62c86ea@vaisala.com>
 <20261105-add-external-mux-enable-gpio-v5-2-96c5b62c86ea@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105-add-external-mux-enable-gpio-v5-2-96c5b62c86ea@vaisala.com>
X-ClientProxiedBy: CPCP307CA0007.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::7)
 To BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|DM4PR03MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f395b8-819c-4923-750a-08df3b3c616f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261009223027099003|261021121427099003|11063799006|261026140227099003|4143699003|10067099003|261102123227099003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	QshwW/x5UrITtnG8yaRGESIG9jmnNAtdV+MJiY2Poz1mssmv2kwJGuPmswajzxWXyyaPkwgrN9NXPiIryx9IACM+gnSLf4G89zUg0wKz4oNOxt8HVyh4WWRIAxZAPq24lTrtzO/5Hd85VuDCOFtTgTIWc7OjTLe5H1qSroFgW1StwAmikNB6inKcpruINQwezRjeL1dWJ8KYrAEq8sCzPZ2tTNnN8q6RQqGxJceanPKNdQ1VRQ1Q3j7VZRVNcu3Plx/GcYuAYfEVWUuG57+N+JF7RmRYzUhZ2r9CDTWYX3kzeVleqFRmGmAPdxxnKedV2bkbd8M4pwUCQLADLF6Ylb7vRhA4jy08yPeXu8xvy+kA0bNkQRqfwey8z0FA2j+8OswFc5Mn4LKJh6M1rN4CDyjSjtmuXfZQoYIkfWD2Hps4F6aPz8aOls+xsEZgIB2Y4i6dXyrwUfc19wLKX2HqiCoLc+UfVmXAvwigMZGgyb4NCA/Q/a9IrlatfHbK6keXY/VAXBDBn2YSoBn7MYgXld6bQ+Vob080EE8C5TbsNLuLzkgWqn9yifjcqAsRM2XT+zZEaG0JAwXUq0TtCe1UMHiZsr4Ixqw/0/XkJlsnZJoVmKl6Z/ASnUDoOZeAAeZc528X8MicE2gegthPFrQy8gQpVCB0fkzPgBFYOmGlSV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261009223027099003)(261021121427099003)(11063799006)(261026140227099003)(4143699003)(10067099003)(261102123227099003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWczTnowbVJncWs1ZHFQUU8wTVcybk9uanlRdmtBZ3ZZQ0F0cEVpOTNEOGZQ?=
 =?utf-8?B?eEdXT3JrMGQ2QnVDZXJERy9xRlFFZ2tmSFNpeTVXL2RzcmFtVWM1VFhpK1NE?=
 =?utf-8?B?NkIrV2JTUHB4K2d2Szh6OVF4Y0ptUmxQNHBGUTR5TWc2bXZybUJCc29qQ2dP?=
 =?utf-8?B?VGh5MEozcThma1IrYVdDaUtFTWJuOVJRM3Z1Tis0S2ZIVU5mVHcyc2g3TzB2?=
 =?utf-8?B?cVhvT3VldFM4Wk9ZYmtvN1FqbXlQWStPM1Q0ZVBMVjY0WHNSSkN2a01jakcv?=
 =?utf-8?B?UHJXSXBFbXFmM09ScXZYTTJ3WU4vcVFla2dLdkJjNE9vUm1HYjFaOC9lalFz?=
 =?utf-8?B?dkgwWStPaWk2elNpYlRXaDRxZkFiYmlod3ViUFBkdUl5eUh6Sk4rWHVKbVpD?=
 =?utf-8?B?UjE3eXFRRXprTll3VWsyenoxK2lMZWgwWm9jTUZjMmh0U0N4WTVldS9kZ093?=
 =?utf-8?B?eXdGQXdtYkZzOWpXUnpiYk1IR3hxSGczQW1tblVPSExEak5ydWs5YTdNY2do?=
 =?utf-8?B?a0M2Q0R1dWpDMDl5V2VuUzdRQ0ZTNy85bnlDRkdyc2dCU3JLb1VyM2dzWTM3?=
 =?utf-8?B?ZmJPeGJNVHBWSTdjK2hCTm8wdGdOVnorbndBcmQ1eVZEVlZEMk5XQkpKaGhE?=
 =?utf-8?B?SlIvVlRxQ1dTaFF4RXc1Yk1WOFl2WEJyaEdHMk1mTk9pY2k3RU5MWW44cjhk?=
 =?utf-8?B?eERiZ3F6SjB4UkV1aFA2TmRRSlhvc3h0WVdSYkd1U1hDcUVYbFlLdUVsWWNx?=
 =?utf-8?B?dDVrajE0Z0tPTG0zRDFtbmJibjNyZ2k2OXNINzZ0SXRPYUFMaGJ0UVpuZllF?=
 =?utf-8?B?a3l5bENlMDVKaDQyS1RjL3paSHY3Q3FjRkNlSzMwZHNtTDArSWtaY0tnVURB?=
 =?utf-8?B?bm1WR09uZFJUNUVreW53Znp0YStkQm5GQUdscDhrZmw1SmFwZGRSb0ZoNTNS?=
 =?utf-8?B?bXdNUjJMdUUwYW45K0x1bVVZNVFXblRXNHd0UDFxTnU5Z3BONXhaKzhZa0RH?=
 =?utf-8?B?d3VxMGhGMkNWbS9KODFFYmtuS0Z4NFBkWk1JbHVwQUVCbjd4MFkraHpHeUhJ?=
 =?utf-8?B?Tnl4bERmaEVWQzViT0FIeVpDR3ZjTWQ1N3R4VWhDNGhZdUtOZkRuUXBDQWR4?=
 =?utf-8?B?bDZlVDJRVXYyU1ZDSnRJZUd1M29Udmoxd2VKZndjUGNWNHVydjZBUDZlS0o4?=
 =?utf-8?B?VGRicFJWNE1jOXd2YUNneGd0SERla1lXdHpFeC9rRG9aL21GKytnMmFMTkNS?=
 =?utf-8?B?N3hLck1BN3lVbzVkT2RYdnltTTdCekJsZnVnRks1c3BKQ1dTR2txVmEvaHdm?=
 =?utf-8?B?eEhvSllPOHJNQkJJemg1R2dDbkJwaTFSMWhkSnhHcjFtQm9XR3pvcXRHQzRY?=
 =?utf-8?B?NW1xU3pnL3RkU1g5MXI5bUtsd0ZROUFMUmtwRHYxK0lBTFpJcWlKeGNnWSsz?=
 =?utf-8?B?TElYN1VUUWJLME05a3JXWHdXZjBxNzcvQWYrVTlGSHJsQ2FWWUZLWi9GV05N?=
 =?utf-8?B?MUh5M0xOVWpESVRqYlRNck1zY21SeHNrVEdBVnBqSS9xbXdqdEJ1dkNKNEJs?=
 =?utf-8?B?OHUrbElkcWxjWVVxeGYzWmpTNkN5aDlHTE0wUUlVblV1Q2VvbnZTS3VsNXlo?=
 =?utf-8?B?RjQyMStraHc2M0QxQmxzbzdKcGR6OE0zOVl2Q0xpSzZzdnpRNXlLMGJzbjZk?=
 =?utf-8?B?aWVKT3VQRk1lVkdzSnYzYmFMczAvRFhqcmZHTXQxd1FCZDZsMnRLKzd1aWRk?=
 =?utf-8?B?ZnFPSzR4N3c5UGcrWGY2QkZscXU0TzBoUTFndEtwZEtjbHhuVHQ1QmpkdENr?=
 =?utf-8?B?Y2luVGxETkxjK1d6MjFhTlhXZE1OdFdKK1FIaHRNT0U0cnVzZDBidHRSbDhK?=
 =?utf-8?B?OXFKSXlCODVnU1NjODE5YjV0elAxWmpjTHlFMTBwbitkZWUxY1g2czBoRzlM?=
 =?utf-8?B?aTRZb0NESDYyYXJMdFNuMnhZTG9TOWhVb3Rqc1lXLzZLd1B4QlBlaE5nV2Rh?=
 =?utf-8?B?QlNDQ0Y3VVhHc0JiWm1LdXpZWFduQXhkUnQ2MUZ1ZkxCRXRoRWtxNzhKNzBw?=
 =?utf-8?B?UjBHcnFTTEhYTllNS3pGeU13cnF3YnhRdm9jdnF2bUFva2lJaWlsY0g1WVpB?=
 =?utf-8?B?d3dNZE5iMlFxVjlQRnpLVVUvZS9ickJibVRiSmpCTkZNZCszdUU1VVNDL0FL?=
 =?utf-8?B?Mm5DcUdmaSs2Q1ViVGphMmlGb0g0ZE82SngrakZ3dnB1SUk0MzVpZEo5MEV3?=
 =?utf-8?B?aTAydkxMYkdKSHBLYzFoZHdPSEpDSVNvalZwNnljcWltZlY3aXhTakxwdFpO?=
 =?utf-8?B?bzVzaDJHc1JmWkJ6Szc4dlJ0WFVSZ2hHdUYrSGplTVhpYW9mRThuQT09?=
X-Exchange-RoutingPolicyChecked:
	J1IVR3NTVmVBaSgpIJz0u0KiiFjHbfGZll+KrGFp9szM3SFRGHK6QwcNnAF3m6hil6mo+If7GmgATZH6sL0LRIdeiLfgXwkyJg/SsgUeL24QtruNDz2e6m6wEEpCtSMSdX5I9pecqQXZj5FFNOluEzO/X4l1ZAm1Hf8P643VhBsFnsuNaxD9AMc2cdvtT+tSXXeKDQhgI96dYzIqW0V3IpbKCFgw1LkhHXzBjd2sItuvwn5amYA+IIqfabQuURG8CK9+7qt3Y7Sc7Iw9G1UJu3hq/NYOKe/+TeNgi8/FhvmQwxyD3GcUEXxZ5kWupz/nyxU/q+Mxh+b2vXBk78Dzrw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f395b8-819c-4923-750a-08df3b3c616f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:57:43.0079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeGkXLUaibzXXQfe7Kv78wI2J0k57zmSaGQCvfPyem+vJ68p7vL8JqSUcUxu8CplYBKAPA1KP8lUGtungWKcJU2mb6lP/9FUXo79kFTwgl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6160
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX5jaW+eyhhiLQ
 spS8vszllpkW6reVSMbDdVshvtJtVoCJ++GJ6BsU6PgzhgRHzkp5bViwkR1PqqrWZWgFYi4j7nV
 aj32oZMz4EGvacPhbSCP7kS4/6BJt5VkDQoK248OuLyN2kzawfeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX8G1K9NBbhVqz
 Lxr356Lzy7ym1N10wADRETwfpwMvr8XkUPrzjyQAii+1ILBA7dtjyR7rlLGJ+Nx1qrI3TB+qxAT
 tVbL2cmKn+9txYXejn5Sbrz5auIIfmouOKCnC17TuHaIRbFpZ3Z+jKe65FhPJ0mcET/MVpVMfPK
 Yx+qFb0XimOjkfse8gwwAn/mHdGU6tQHNRsU3gZIGbaaaYia68nWqLevGlfKnEIV4kRKK/GJ55m
 O4LDTb+2XV/8ty5sfMcwN8XhjZD17lGl3E765JapFXmPgG8+RUctqQXSadeXWIRxxfIYLslGc+y
 mQZ/8fBOI9IhppXGnRSaAavA8E2nlJHq7KHtMBHY4LFzUktQLyGX4aMlJd/G3qFLAy55MHG3r0j
 SkCg3oTbK0elaEIE9fIrJb5fQxfR4IGIO4PC2rUWwoEYKhUQkdEEXLGpUET+5c8rxu8Hi84RN1p
 KjJZxudi6Af06DNNFsg==
X-Proofpoint-ORIG-GUID: kjQTq_ym6B88NflhwLqUFvADHFG9m-2J
X-Authority-Analysis: v=2.4 cv=ZeiIpcVA c=1 sm=1 tr=0 ts=6aec7d4f cx=c_pps
 a=S2IqtmjrQAXuShkhhqPLog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=eWRtdWc1AAAA:8 a=gAnH3GRIAAAA:8 a=oDYG0jCd66gZcCvuQeYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=fQEa9puXOWAy-YWvlEz7:22
X-Proofpoint-GUID: kjQTq_ym6B88NflhwLqUFvADHFG9m-2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051

On Thu, Nov 05, 2026 at 10:11:05AM +0000, Tapio Reijonen wrote:
> Some analog multiplexers have an enable input that disconnects all
> channels when deasserted, independent of the address inputs; on a
> 74HC4051 it is the E input. Add it as an optional gpio.
> 
> The mux gpios are not guaranteed to be updated atomically.
> gpiod_multi_set_value_cansleep() groups them per gpio controller, and
> only controllers implementing set_multiple() can possibly update theirs
> in a single write, so a mux with its address inputs spread over two
> controllers passes through the intermediate addresses on every change.
> Deassert the enable gpio for the duration of the update and assert it
> once the address is settled.
> 
> The enable gpio is also what makes an idle state of MUX_IDLE_DISCONNECT
> possible, which the mux core applies when the chip is registered and after
> every deselect: it leaves the enable gpio deasserted and the address
> inputs alone. Refuse that idle state without an enable gpio, because the
> address inputs cannot disconnect anything on their own and mux_gpio_set()
> would instead drive them to the bit pattern of MUX_IDLE_DISCONNECT.
> 
> Return the status of the gpio writes instead of zero. For a gpio on an
> i2c expander the write can fail, and mux_control_set() only invalidates
> the cached state when set() reports an error, so a failure reported as
> success would leave the mux on the previous channel with later selects
> of the same state skipping the write entirely.
> 
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  drivers/mux/gpio.c | 43 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
> index f9c7863e51b82fb76ed03cf17308fae74716cf6d..cb2f38c1a9e247478f97fffaf1d5ddae4315d1a7 100644
> --- a/drivers/mux/gpio.c
> +++ b/drivers/mux/gpio.c
> @@ -18,6 +18,7 @@
>  
>  struct mux_gpio {
>  	struct gpio_descs *gpios;
> +	struct gpio_desc *enable;
>  };
>  
>  static int mux_gpio_set(struct mux_control *mux, int state)
> @@ -25,12 +26,26 @@ static int mux_gpio_set(struct mux_control *mux, int state)
>  	struct mux_gpio *mux_gpio = mux_chip_priv(mux->chip);
>  	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
>  	u32 value = state;
> +	int ret;
> +
> +	/*
> +	 * The gpios might not be updated atomically, disable the mux
> +	 * meanwhile.
> +	 */
> +	ret = gpiod_set_value_cansleep(mux_gpio->enable, 0);
> +	if (ret)
> +		return ret;
> +
> +	if (state == MUX_IDLE_DISCONNECT)
> +		return 0;
>  
>  	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
>  
> -	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
> +	ret = gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
> +	if (ret)
> +		return ret;
>  
> -	return 0;
> +	return gpiod_set_value_cansleep(mux_gpio->enable, 1);
>  }
>  
>  static const struct mux_control_ops mux_gpio_ops = {
> @@ -63,6 +78,11 @@ static int mux_gpio_probe(struct platform_device *pdev)
>  	mux_gpio = mux_chip_priv(mux_chip);
>  	mux_chip->ops = &mux_gpio_ops;
>  
> +	mux_gpio->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(mux_gpio->enable))
> +		return dev_err_probe(dev, PTR_ERR(mux_gpio->enable),
> +				     "failed to get optional enable gpio\n");
> +
>  	mux_gpio->gpios = devm_gpiod_get_array(dev, "mux", GPIOD_OUT_LOW);
>  	if (IS_ERR(mux_gpio->gpios))
>  		return dev_err_probe(dev, PTR_ERR(mux_gpio->gpios),
> @@ -71,15 +91,22 @@ static int mux_gpio_probe(struct platform_device *pdev)
>  	mux_chip->mux->states = BIT(pins);
>  
>  	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
> -	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
> -		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
> -			dev_err(dev, "invalid idle-state %u\n", idle_state);
> -			return -EINVAL;
> -		}
> +	if (ret < 0)
> +		idle_state = mux_chip->mux->idle_state;
>  
> -		mux_chip->mux->idle_state = idle_state;
> +	if (idle_state == MUX_IDLE_DISCONNECT && !mux_gpio->enable) {
> +		dev_err(dev, "idle-state disconnect requires enable-gpios\n");
> +		return -EINVAL;
>  	}
>  
> +	if (idle_state != MUX_IDLE_AS_IS && idle_state != MUX_IDLE_DISCONNECT &&
> +	    (idle_state < 0 || idle_state >= mux_chip->mux->states)) {
> +		dev_err(dev, "invalid idle-state %d\n", idle_state);
> +		return -EINVAL;
> +	}
> +
> +	mux_chip->mux->idle_state = idle_state;
> +
>  	ret = devm_regulator_get_enable_optional(dev, "mux");
>  	if (ret && ret != -ENODEV)
>  		return dev_err_probe(dev, ret, "failed to get/enable mux supply\n");
> 
> -- 
> 2.47.3
> 
