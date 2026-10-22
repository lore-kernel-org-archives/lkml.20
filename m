Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792664404;
	b=pJ5LtGr2C+p/juW+J2gsndbS8Eq2dpO4Os7TQlRmOVMxsmJt22WpKMxivnWrmts/azPO
	 gFg4Kh0rp6XMvkC/ZzOEDqW50HwzJNxzlVrYUH6MF2kyh7Ca/nlhxaTCJCZXP1QcNUnbt
	 3Ybc5F5OGSNqptmbJZLvpySShBHCSvOrzsx52jWgLZHTHb8b/UL+yU+u23SObKQFXolNf
	 gDpmCikb2ikXdBALsqbWvJ5P2lyfmacZfxN0YzO7DhkVhxkGBZ65RE1TrKIhwyC4/MaBR
	 eTOXojzj6dZ/jR7dZBBS/4IfQ8L1ZZ57X2N0UPIXIpOzo77sVR1XvJKHNr8mDN70zAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664404;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgHF3w5xzEfLpUvg4OSP8cvCO99KDU89nVCCebvWh9Y=;
	b=z0er3vMWPWd7H1EOQgWo8N8B6cfkXsIlqrwAyd2BEadanH+KkezR5FvHAUBqKYf/9oBn
	 J0Zeyo4qDiDa8kx9w7rCXCK2Ootxcm5G4rgKK0tIm+ty5D9p8Cu0+604lRXSU0KbMAVNx
	 WgarlHuFQ8RNbO/kuyaUo/4pp4K80LJ79wNA09JJP3tCMzfK75bTSku5ijFcxUEKQhdpG
	 a3iDLrsltgrcMyaLgqA8ixB+8WevfVhghe7L/99jW84eLZ0SnFBxvqQ+5Rqn8YXfiEtWI
	 mawSgI+DfJw+neyNfRVmyrEf8gccfeEZg81VGPYcHvSqdPhhKLR3mdBoKUnJthuAwQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=nBbMMBzR;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=dg0O6cIx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE58606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE58606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=nBbMMBzR;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=dg0O6cIx
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA1LNb1566111;
	Thu, 22 Oct 2026 06:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=qgHF3w5xzEfLpUvg4OSP8cvCO99KDU89nVCCebvWh9Y=; b=nBbMMBz
	RhBr8J632X3KZNZP1EmBBNQDrvb3brdtZ0IehNQFw5Wq5WiV7u9qnNmY1yKt6ung
	uRgOzn15r+4VQ03Gqsr3+fVRA/8LctGXZKn6d+bSnjivHWfyzBBRCr1mI16fXzp2
	hzmZSCySEGU/5Jn0Uddmrkl1kzM3Qh2+tA6Ry9000rzSvpSMIapme9ANUu8+OXBo
	I/sbkDoYTQPzDIKjKU/1zLDeS6Ih4+SuaP+s2W7VsLLLYli95HanJCvnyAYI1lRM
	fE5c4ZnWE4BYXd8HlDiTDhvbm3pVJsvM5uNEZyPEPgmyQ2s8t4xvo+NqyLMOIfTr
	pKiqeCN69U/1i0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=qgHF3
	w5xzEfLpUvg4OSP8cvCO99KDU89nVCCebvWh9Y=; b=dg0O6cIx9aEcJ+r3tXOw1
	4J0adVO6h22asQnHo0HpOfGvc9jwVpJp8m3/Jhjm1T0BlDsOwwcvJapmzhBzL9+n
	nbPcSOawUcDRdbxJ2XshP/Bw90/lus5MrYQ+/KVnZQ2smAqnYyIcwWYijEnhSvla
	Q7Sup2a/34BSc0AS2LC8IEX4PEtqkO4SyWkvo6LlZ++M/R5jLqJr0ZvPltAnF6rl
	3aGXnuZ1xD8EMBmyoagTeO1L+e/bxNcF+Wk9nj0+vfXzlP49dVOzxJoE1N7kj2dN
	hcnYkAYjbINfiCP8ghRQb5MhpYyD6XHJ+zp1XDnu7hfWepoea895mPedpWWgDFK1
	w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hf9ay25ct-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 06:19:43 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOdAU0CcXwEYkNjEjwDEYotlqYasGPW3PCXSLzECKQLyXxoO0yM0qtQUqop7uM41yofXKWkG4Pk5nfuQLaNnyiAveW3U0S+XmYBRRGdWgzOc7ux32vjdl2IHPrvLanHBVl9BoEUYhX4bmwPx5Ut1y1Uxk41jn6XXEjqWGoS0oxC9wlY9qUgOtEsRg6//ysxvsL5ot+F5c7A4QMCxZLJwFD/ha61aDH3GicN6GYhYUBQwzxXytFM66XDOUTP31kIdERFHktWXnAXUc3N4rpheTDsRWisw41Wt2SECwr6efzaU21IykXXZUZz84wt2nDGzPJMWw8nsZxikYQJ4JA/Jqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgHF3w5xzEfLpUvg4OSP8cvCO99KDU89nVCCebvWh9Y=;
 b=W2Pku3ACc3504pRFdJGJ9JytonCwImnm/x3efnuTqnviTMjMoPn2XvccQnZV/COfxA3iRpKtMscqyfjFTvZ23ObTCK/WWLO8NXwB8peAWkEgB3rqYLD8dgKswad6MDghAq1w7LY4srBsOWlpzxsNOKdv3xWFIifhe5sWz1EB0c5KhAr8xavAZXqQpify2iug1K+ZKIG/rWDS/3t2G9jyujcKHnYy1+xTZUk6dKOC9gthQ89oUeY3JOnptGPP82Dks1Ebuzw71kHtGN28xmSpPqIfRY0OmVfVsfDwD90I0edDq3rY/X+fKNl1plYU8aRZMVXmAr0ReZcOT4/qtjeiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SJ0PR03MB6533.namprd03.prod.outlook.com (2603:10b6:a03:386::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 10:17:57 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.017; Thu, 22 Oct 2026
 10:17:55 +0000
Date: Thu, 22 Oct 2026 12:17:47 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
Message-ID: <atnZWUA9bc1btCix@analog.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
 <atjA6l3H5kdrC6SN@analog.com>
 <ee622e48006681f9a25e556e3db360378213a5ce.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee622e48006681f9a25e556e3db360378213a5ce.camel@pengutronix.de>
X-ClientProxiedBy: AS4PR09CA0018.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::6) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SJ0PR03MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: f1580cb3-a069-4af3-50e3-08df3025bd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|6133799003|18002099003|22082099003|261021121427099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OKCC6RU+C4thZgR1X0LqrVuf4rplVnjUssDl328PE3z/dmcP8KKnNrWlNEdIKljHb7bc8ULKFfy5KLMrlOFK8ijyed57/GAFgbVY4xiWqJ2E7+/lBZAYrs0szcJsTJtIBFyuiD/aJhVdfZw08sSI/sdY445ABBq3ig2G+bcCXqFKHgsMGRXMpzIQFsThb1Fq8BwOzdE8txMKnF6CAsylSKRb7guiSnKZd6dRs+gJ+fk2CpvgxHf9+rg22dQUpnm8z1LVGNzi5WaNrGYpVqu6TpMFiBAIlP2HCl1VkYs63PLkUOwMt2GpcOwS7kDSCjrUC38Z2igobFVrY2uYP8whtTv3EMP3Iq5lyFw51K55y9/jU+DQ3A20PtuiYMD5HOpay2PkIpo4bd8MRhzj/hxQaGYaM1acf9Ei5l9NfbqRUWBzSTv/WLiAt9DGHZSbsVOlz2LuNrzOCC8eFf72UUoCwWDt0LqzjgZA1s+LClcUOauD0pst51DQMVlD2RyCuFtpYxNBCwsyo798vDz+z8fyIwKIhCGr1Ik8AxP/uvYxN24JTcUBh97RpQKDczNdX0KQpHD7gWq5sHZFv1735/Orm01RAAZH4Dv6ZekJGSGObP+kn1DoZT8CL0I9cSaiw4L0B8IjZ8nrHNioz0/GZKfXDV3f4lTtt5cQCQJHTi2WU5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(6133799003)(18002099003)(22082099003)(261021121427099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0dKZkFhck5VODJXNE5WcDliczhuZ0hxWHFOenkrUnFkQzNYcTVtOWxBcWRx?=
 =?utf-8?B?WjRmZFpVSGZ5YUkyYXFmd05DSEI2SWh2V1MvSEFybXExOWtTcXdLcFR5K0tI?=
 =?utf-8?B?K0E2ZGM1MkU4YU1MeHNFUWs5YkVSbU5nMlVnR1cxMitWMkRqR0cvdy90RjNr?=
 =?utf-8?B?eUZkOFgwV2RGV0VNeUFJMmpHNDhLRjl4OUZEaGVGdjY3RGpiczV5YUo4bE8y?=
 =?utf-8?B?ZmRlWDNKNWJsZmJFUEQ5MFhxQW5jN0NFZU9CUXdZWUxFN1liN2IyMEpqck5D?=
 =?utf-8?B?RjU5UFZCdTFDUEtvUlNQMFpjM2M0Nm5PcWJWNEhmejlHem9YSWhvOC8yNmZx?=
 =?utf-8?B?SnRoWUFReFN3U0NmZ3ZFOWhNb3RtUTY5Rmg1ZWhnVHpKRjUwNzBzVkkwa1o4?=
 =?utf-8?B?RytKUThGVVFNTHJPUk9DckgveHVrUHZoVXR1QXZaSzkzTUR1YUZ0cjFoUnN2?=
 =?utf-8?B?emRkVUlBK25QWTJqMkhkYTlaNDFnaXdLUDZCeitCUlBMcjY3bi8ybmhCSDB3?=
 =?utf-8?B?eU1SdmJUTnlJVHhiSWtKU0hhZWMxWmpsY0x5bE9Nb2FVY29Nc3pvc3IwZWJK?=
 =?utf-8?B?SjNUdG5mZ1dZbmtodDgvdnJxZ0xPQTN1Y0E0ZS9Scy9reHVYdU5kU3YvQTUy?=
 =?utf-8?B?Qks5NXFmNUlwbHJTRWMrQmdnc3hwMU1qYlVDbXdZcEdmb1JjcjlReE1Id0N5?=
 =?utf-8?B?a2hYOHgwTGlDc1JlZHVvWnIzeThBdGhsR0txZ0NWemR0TVRTUmVOMzhWcmhU?=
 =?utf-8?B?NWl5MWVDMW1haWY2MW1hZXJJWkpzMjBzUWZTQjBtRnNCK1FsR0RoZ2psQjUx?=
 =?utf-8?B?aWExT2JCMVdqdDFvRjJWWkJndk5MMTRVODcxb0gyUE9Ldmw5YXgyTDh0ekx1?=
 =?utf-8?B?VG1uYVNXYWg1MWRWRDV3aTNvMjZNaUlHbWczdVV5MHFvaVBUSHRKZHc3a0d2?=
 =?utf-8?B?WDdCNzJHbVpqY2pNWi9IK2xiZC82SU5kUEdxclppeHJpOWg4Ty9PV0k4cUlG?=
 =?utf-8?B?TWJuZzlPY2xvaWJUZjFpdXZYWHRNNHJsR3dkeW9mRHlLS24xUmozdzc5VDdu?=
 =?utf-8?B?d1U5N0pzWWdSSFpkalM3czFmRDV6VEk5Rm1PZG5Ia1BWZ2tKckYzczVQR3Mz?=
 =?utf-8?B?OEkwaW9TRm1OTjVGdlBvYUxMSDZPWEVxZ3EwR1liekhRdTdrV1EyNFRTNmQ4?=
 =?utf-8?B?MlpqTlZ3L3hYKzBhNnJrdDNqc0dCS2NJRXFQYlYzeStzcVBxcGpDZTNsM3Vo?=
 =?utf-8?B?NVYzZEJIeTZqNHF3Nnc1S1EvNFk1SE9GSEd3ZSsrV1pyakpJdWhqaDhBckpY?=
 =?utf-8?B?aXhKWVYyQy9US3BVVThnQ3lrNGVIcTREVTl5aStqTy9DZUI3OGhVdGpJWHp1?=
 =?utf-8?B?L1JxNWFpU2drNDBRM2JlaWZCcVQxNllJcWhIUWs0RFc2Nm9QdnlZdFZzVEJk?=
 =?utf-8?B?TGRaSzJrbkZqeWVSQWJ2cERUbmtoY3pIbGRZYVM3cDIvK3FPZGZrZENUQmxW?=
 =?utf-8?B?bThXbWpKcU9JZWdFakFGdVR2QVlPZUlrd1JJZmhOb1JGaFRGSTlBcWdRVDJP?=
 =?utf-8?B?WU0rNFRsd3VnY1dobnF3VGZkdWI5UThDakRGdlhkbmMwWHMrSXcrRmhwZTRG?=
 =?utf-8?B?dWlCekhQU2ZQNUxJY09oalJ6WEN5OGVkUmNqelYvakpMaUVESnRobW43eExU?=
 =?utf-8?B?b0h1NkJCRTNTeDNWM1pVSFJzZ0F1NFkycGJCUk1Fak53MzJ0VnEydVQ4YnBJ?=
 =?utf-8?B?ZWk4SEF6U0xjVmNiay9vaEUxRjBhREF5ckJOUzEyS3lIZGF3clNnakxrWFJV?=
 =?utf-8?B?T0J0bGQ5R1Q1VzdkTnMzVkR6aG1WVXBIYU9sbjBmNmZmTFVTcFovRXVod1Iv?=
 =?utf-8?B?SUVvR29NSVd6QkxHaXkxL1k4RndGbGFqa1hjY2tDbDcvN3ZWdlJ3MHhyMGp6?=
 =?utf-8?B?WXowaStvMi9iUGVLM2pKSXkxcGltUS9nWGZmTXhIT1N0MCt6R1hkN3JyUFlZ?=
 =?utf-8?B?eGhJUTYrT3FDcnBVMFdkU2paU2FvdVd5VWJXU2ZvdFo3VUh4bWVZOW9iNzlu?=
 =?utf-8?B?dXlQNVNKTmtlM2J4NFBCb055cWhoVnVNK2tGcHZqVDI4RW1WaHIwSWlnSzJq?=
 =?utf-8?B?NDZYTDQyL0gzUVI3cFNpRnpiWkJiSzEvbXlGS2JyZEhmYlFnUVdMaVBhNGZs?=
 =?utf-8?B?eW5kZlU5MWExS25uTlBpdUtOMG9BbFZTT0crVmRISnpKSEVRbEU0bmRWQm1m?=
 =?utf-8?B?TDVyYUpxZ2xKSGluN2RVdDF4K3NhVHhkUUJTR2ViT2krM294eGpoVU05YU5Y?=
 =?utf-8?B?bkhKYTdkeStsSjdBSnpCaXNpbGcyS3R0OHArc3hFUmFGemd4SEhKdz09?=
X-Exchange-RoutingPolicyChecked:
	qnTiuo7jKN9nI+cDbo4+nn+GYBtGzXX8va2HmCHy5xWNqFfIapxWmO5qZaAz/QGZ6U9RbUAH1aPjp9Vl2pYnr4XPeb+UagBKtPFZZWYwvEC5Bc/V0JMVf/+KmarrmKR4MnXsj0nF8Y4RLBNYB4p1mMtTFVMgPUAg5wDI8NPPooO1XZzr6dK6CeqcDbgwcEDtv7ij9sshvO2gtn/gp/iCEf/1OQeaCZ5Qxb4Ykjhi4/b9VU05Xaa3BfzF+GzRfKp/8RLED4571mbkzSbBBlOPqlnPDMsZsoo6TiyZbQtZO0FTXZEEzuwYht/7dVMNKWf/MQTZBI1BQ1RNtN8P1C9hDQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1580cb3-a069-4af3-50e3-08df3025bd0a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:17:55.6200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbW8X9b6XyuwFwqZCnmoN4reUw/4plu13z46jRmTUNHDF4D6wp2LbzNzZ5cWqf5JONIZ10kbythvccnNj7M9qP/DFPT7n0kSpOTeBD6igoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6533
X-Proofpoint-ORIG-GUID: TRDHYHDC8bSG2HZ1zQXuQ33Z1AVflmjK
X-Authority-Analysis: v=2.4 cv=IMCXmQvG c=1 sm=1 tr=0 ts=6ad9e33f cx=c_pps
 a=8SVoR3TXwnQnu/Z+5+8XkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=StBKjmDmFpLcHiqRWJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX4TdenOg0OjAR
 6Dzu32GTOU3tv59l/P/ycRdMVLHQQ96NB5UAepolkVWa+yQANekQ2ZM1KCoij6edOBl7gogOFXj
 hPqUFF90IfVlHwvBfOrr1St9Q5hyDBLNkJ7OYoWP1eZeImBjF+YKce4cREdMTPpXAvUy5I7YnZP
 rR77IfEkNoP5EEWi2r/vx33ynTCgAqAMxor/mSpfaH3yBQnkXATfA/9kKSaFQsafVMjrKS1RBn6
 SQgxvw9TPfuFw08v36WW6J9W3SKS0d1cN1xMs9vGwdLBsebZjRwYXDJ2I5xzAjLm7/lx7rvWcvi
 dPe73+QkvJwUXkmqjHQqBKdCNJEglc6BEDbWCA69gNVsGY8rMsMg2xFcH7mKYBGfrCuwYiCeNTS
 cAgHOmcGiis71fEdu2gG/GgGPBisOvwlB/9TE7B+tQr788aq6T2seXAooVG/xhQfqvy7BLibp3J
 PmCOYyBQvZNL6V00zTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX8ourfSWn23Xp
 3/t0kupQaTkzOCYFZFAJo3fFbOF5wpRBtVcThPlohXulxWbXFYlJfxkjrGn/bkMKPizhhV8EirN
 8GW6je3d7m1w6GDgpVR9ZAtIQcwxdQTogLviF6BHErzrZx+vvjnw
X-Proofpoint-GUID: TRDHYHDC8bSG2HZ1zQXuQ33Z1AVflmjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Thu, Oct 22, 2026 at 10:43:35AM +0200, Philipp Zabel wrote:
> On Mi, 2026-10-21 at 16:16 +0200, Alvin Šipraga wrote:
> [...]
> > Looking forward a bit to the second phase where we have everything
> > serialized, maybe it will make sense to also lock around the call to the
> > .status driver op too? Not suggesting we do it here (as this is just a
> > bugfix), but in general I like when subsystems offer a guarantee that
> > driver ops can't be called concurrently. Also the status is kind of
> > undefined if you're currently in the process of manipulating the reset
> > line.
> 
> That doesn't change with locking if you can't act on the result of the
> status return value under the lock.
> 
> A concurrent assert/deassert may lose the race against status and
> toggle the reset line right after status unlocks, before it returns.

True, it doesn't make any material difference from a consumer point of
view.

I was mostly thinking about the provider side though. Such serialization
guarantees from the core allow reset controller driver authors to use
fewer locks in their own code if they know that the ops can't get called
concurrently. On top of that it makes things consistent (all ops called
under the same locks).

Still think it's not worth serializing .status? Just want to know if you
expressly don't want it in the patches I will send after Shengjiu is
done.

> 
> > What I had in mind later on was to rename what Shengjiu has called
> > shared_lock to ops_lock instead.
> 
> We could also combine this with the exclusive reset control's acquire
> "lock" if we move that inside the SRCU section.

I had the same thought. But I kept bumping into the fact that the
rcdev->lock mutex is taken in reset_control_acquire() while we are
holding rstc->lock. If rstc->lock becomes a spinlock then that's not OK.
And converting rcdev->lock into a spinlock doesn't seem feasible.

But on closer inspection I noticed a couple of things. Look at the function:

int reset_control_acquire(struct reset_control *rstc)
{
	struct reset_controller_dev *rcdev;
	struct reset_control *rc;

	if (!rstc)
		return 0;

	if (WARN_ON(IS_ERR(rstc)))
		return -EINVAL;

	if (reset_control_is_array(rstc))
		return reset_control_array_acquire(rstc_to_array(rstc));

(A)	guard(mutex)(&rstc->lock);

	if (rstc->acquired)
		return 0;

	guard(srcu)(&rstc->srcu);

	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
	if (!rcdev)
		return -ENODEV;

(B)	scoped_guard(mutex, &rcdev->lock) {
		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
			if (rstc != rc && rstc->id == rc->id) {
				if (rc->acquired)
					return -EBUSY;
			}
		}
	}
(C)
(D)	rstc->acquired = true;

	return 0;
}

1. (A) is the only place where rstc->lock is actually taken. Ostensibly
it should be serializing acquire/release logic, but from an API point of
view it doesn't make much sense. Just like the remark [*] in my last
email (see below), you also shouldn't be trying to acquire the same
exclusive reset control from two places at once. And it doesn't offer
any synchronization with other exclusive reset controls for the same
controller line.

2. The synchronization with other reset controls is done with
rcdev->lock at (B). But actually there is a narrow race here. Two tasks
could try to acquire their own exclusive control of the same
line. Assuming the line is currently released, task 1 could reach (C),
get preempted by task 2, which reaches (D) before task 1 is run
again. Then you end up with two controls having acquired exclusive
control.

The obvious fix for (2) is to put (D) inside the scoped guard block.

But then you achieve everything that rstc->lock is supposed to
achieve. So I think we can get rid of that lock altogether?

> 
> > With the following primitives:
> > 
> >   can_sleep?    CONTROL TYPE       LOCKING PRIMITIVE
> >   --------------------------------------------------
> >   no            shared             spin_lock_irqsave
> >   yes           shared             mutex
> >   no            exclusive          none? see [*]
> >   yes           exclusive          none? see [*]
> 
> Yes.
> 
> > Where all reset control operation functions look like:
> > 
> >   reset_control_op() {
> >     ...
> >   
> >     lock(ops_lock);
> >   
> >     __reset_control_op(); /* inc/dec, ->op() call, etc. here */
> >   
> >     unlock(ops_lock);
> >   }
> 
> It might make sense to split these into _exclusive and _shared
> variants.
> 
> > [*] I'm not sure if it makes sense to add any locking here? I can only
> > see it as API misuse if somebody is manipulating an exclusive reset
> > control from two places at once.
> 
> Right.
> 

Kind regards,
Alvin
