Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792677504;
	b=yJ3Wcd45syK6fs6JkdtqtP+yjFDx4qVlPI79i9x3+xdWnh+jiMKIEs13Jub5BX0e3U4S
	 dZOgLbSfKNVIIUVfJv8jOVyIBkPxa59yba1O6UO8Us4r+LRp64nAUGaaoqcISJl+yeQxn
	 OMfVvpUDZlSjO/nJrrCkwrPnia3ioFL78dww3lymF+LZG4MHXaeg8fJYhhXHHjAn7TcO8
	 HZPpTcNluFuU/25loNw6wWdfNHf8Eds0H6sGFrklsta4KxAUeTFRlD9ieZQDk9Mwi0Bf9
	 1S8HOa8bZ3gBllijW6jovQvZS5VEgYZ+ppWaLEz047aVv6Yk5m21/Rj4KOGNF9hcBVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677504;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r6dvKiNfLxIn9aPpSJPfojLr2fT5oFZMP3GcRy36wmk=;
	b=dLKBmh42yv3TqGh7VG665PPMV4x6PJL/tbSPvJ7fOBZ1xlESjgluT2BkQngEIvUiiKos
	 OGeX2kjOmEAV/udQuWsm2ZEvHDLtGuMs3pghDWWB9AiPOu+l7vZw7y46mjfZDA99iQ+sC
	 IJWQQ+vqlsZ2X5JccMNjrSMDPyF37teFJ5lEGGkRBGayqd0qVUQ3yQ6hbnW+e1BYF5EAv
	 r1AvoUpCqPlJJE1cLjZk0gEaypM3T318VB9knoBRATSilt07+/iuzgKc7aKKUD75YB8iW
	 9Q6qF/Es4IdL098ViRVTVhIio0BK/HLx5+CGsI9gSaVfFKhE9JAh2rS/sb0Y1egr+Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=ckSBBib0;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=E1cny+80;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1907F606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1907F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=ckSBBib0;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=E1cny+80
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MDR8cC1115953;
	Thu, 22 Oct 2026 09:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=r6dvKiNfLxIn9aPpSJPfojLr2fT5oFZMP3GcRy36wmk=; b=ckSBBib
	0ojqSGm2p2nwSPDifro1U7sCdiqwaD3AMw6/nAL+r8xXkPhgDw9KNqzYv/9snfrN
	YmbbGpbLlv9hl96o90Z/Xwmn1UNhjFRrky1m6G5rs4+6S0DZz6FiT45h84uU5TyL
	gc6fkluzZuVPTIE+2bOyTalsGRsVg4JPVvGmcTTKsUkpOdUPZlFyZ/l/fazXH9nv
	So74otJbvt7/DHYa+bRRY+z2Pyw3JM28PDv7ebsOtWb/ZGDbTt44evul2lYdtxPX
	/PWRVST5igaS6uPDyCfXacqE0LQejf5ZdxJ0bWzi0mY+xdCwDPcf+AOy87q+279g
	ONzg9lmazhKQcvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=r6dvK
	iNfLxIn9aPpSJPfojLr2fT5oFZMP3GcRy36wmk=; b=E1cny+80rRCFnBmjAyvGp
	7kiAvoT3PeKX6vbtRbiypzBvS26GNgf3QWfnh8J0+vomWPTN4STI1NrzC0ZFh3WZ
	52+5CcxJHHATh7WtbEZ5RnNMRDDD745LKyWtB3FsBiS1PS5l66GzHEw4ze1FMUEr
	HmjOJCUu81+5Ief1+95EuGRppqBO43CaQ+2LNSErP5yiFfHzZCGGfPcn41NjYXF+
	ZV543NNXUlC33N2hYdvG5IgiLIdnSdqpMHk6iLbNPA99WgowjnvirzP8V2ga6zey
	d8W35Dc0SzaqNf8/R5hxcLMw88AxTeE6lrz9AX4KrAFvx+r4VNw9Vb/9DbeOWabu
	Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010047.outbound.protection.outlook.com [40.93.198.47])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hf927b9hb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 09:58:13 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlCmpwHMAfWU/FoYHe6nDVd4riiK3G5YfQpBWSxdt5HDO7L2g5JCfuVbGNEOKTX5Atzh5xBM//5zU3bwXeGNArEUz0Av9oCVgn4A4G+W5pxUKGTYXyhUYMVSau/87Lh014JLuUn0Wc0tz63UzJIKw0RyNhG0zp76pF7DsC6TPBg9rKSSyqGINWU4TBfmA4sfcUPpG1qgbGAOetHwDYYliDrAVvsC20NuP/DoxCzoKwPtM/ZEQY3eYsuytcho65cfaa1JgtGGG+s0GSVp3UsNH8pI0mMbeBJu/2GGnJjboca3jGHOloBmClHDgqLIny4bG4fmBo3ejqpgiEH8iywQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6dvKiNfLxIn9aPpSJPfojLr2fT5oFZMP3GcRy36wmk=;
 b=uq9LSvjRg4yGXDeW58B4y6Yig2KFVFtBt5HDoueBSpixx+nGt3HccmG2VVWaOQ1pGbP020Y/9f3MXymS1Kyo10cqsgndcBbXO7xQ/seNf5IWyoit7ql3LNN1cGtZ3rQslogzJPCq2DLssl46OBk1CCpcBSZTBT0LMCL+f8/qxzJvq4af53xqDv9VAtv7++XYxIaMQRj35qkYCx2yNSttvxbLZEhK7RjfOQ05mNGrPpFkt+N04TM/rlmRpbd/W3YmEmT4k/jLlacdDbrbJPbP4KpBqWI1JnlxfLP9p6pwG1ZCyAP2Jq/9LSt7QyxRxBzY29r15wdQ3mnPSLpnFodylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV9PR03MB8437.namprd03.prod.outlook.com (2603:10b6:408:375::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 13:58:11 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.017; Thu, 22 Oct 2026
 13:58:11 +0000
Date: Thu, 22 Oct 2026 15:58:08 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
Message-ID: <atoKa8JBszlQDGYE@analog.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
 <atjA6l3H5kdrC6SN@analog.com>
 <ee622e48006681f9a25e556e3db360378213a5ce.camel@pengutronix.de>
 <atnZWUA9bc1btCix@analog.com>
 <945dd21b3f5d286a4821af078de7751df6b4cec2.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <945dd21b3f5d286a4821af078de7751df6b4cec2.camel@pengutronix.de>
X-ClientProxiedBy: MM0P280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::23) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV9PR03MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c90c7b-9110-4fde-66e4-08df30448239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|261021121427099003|261021135927099003|4143699003|11063799006|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qlNovmqYX948biH3DE32H9bFg9Mi+RRypT8Aev6SyDbWZF1XIYdmgbnyUiIj2MyIve3zwEweSYWj9uD+N80N92BYIXuZPryX1PbvyKGXwVZFP+Zptn74gcoUw5e+P0eDLo1YuEsc9NsOaaxJi5q5zeyGoGbqFW0aU1gIjoO8Tp7CArk0yj2tziUU0eL9XzQykgGABKa4vB+EwjhKPIMbwSmXwSrYgxLWkbh/eOPp7XjXAhZsS6pw6qc7erjdMp4zz75BRzcYqETArLKRAMmXNUmJMzg6B5HCBKQ8KmmjOAAeN4v1NNyML1S+7CntuL/Lcy5aotnvYRTMxtewc2xwhVho6vMhI2Ut4/jaktOxPBiYKbfC5AhYEdVJ1qKexdeAHTTNMMCfIlL6eVyFOoKr1FsPziLZe6UxRGcQ/VzY64MbPW9E/WMu1Bk4nY0Z0xgTDPh1qS+LBxzlrHT5M8MOqHXX23Pr9Orckv1whV6QKxm0z3S4t07A+gIj3LFE7REusO+pjceDoQ5plvXYhiqApdn2rVr7hw5Je7fC8CvQyWOaA2lqtWn0ZrEbbXUKgm99jkBXXmsnbRTJG09B9SYkkhB5rLPWDLMPq7dn6u2NUgKy6RgdXuKQnHAU5sbHNjoa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(261021121427099003)(261021135927099003)(4143699003)(11063799006)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2NENHpKOWdoN1JlU1E2VWMzWFhEOUIwVWZ6b2J6Nm8rRjVQOGR3MGh4eUdx?=
 =?utf-8?B?d21iWVVWQlZNRnpPc29GdHpPQlFXMzg0R1E2N0NjYUZxNmcvUisxUUpoRkIw?=
 =?utf-8?B?NjVlMGdueVJBZGZtV2hRU0MzcHZZVXY4N3ZTeGIyUW9TdVJaRjlkMCsxN2RO?=
 =?utf-8?B?cEhFV3RtYnZwTitBYmhJRkNEa0VwK0I2UHE4RTVaV0tJdnpoaVhFK24xOTBn?=
 =?utf-8?B?RWZSaFV3eDRRY3JOV1RyNVAxQXJQNGkwTGdDYy9TYXlyaVhjVXJEWW1OVnFY?=
 =?utf-8?B?UVNMRU5hSys5YUVFWmQzazZocmJESUZsenZ3T2hVTVFrdHA0a0hMaTBnT3Nr?=
 =?utf-8?B?Vk9hd3JuTEJBYllkNENMSUcxMWpmWG1XN3ZvTS80TlZPam1iVDZHWGdnVmhJ?=
 =?utf-8?B?STZqa2xhUGdJZDBNRDdlWFljWWVVT2VOV0cyMmxtSnRRS0ZqN1Bvdjk2dXZq?=
 =?utf-8?B?SzBWWUhFWTZHSFhJbzAvSHNkU1BMRTdickZRTmhmQmpEV001djBSVUN6dCtn?=
 =?utf-8?B?TXo2MG1zTC9LaUhVcm1MZm5mWEx6NG9qY1dhb1I5TTZKV00rc2JFMVprOXVo?=
 =?utf-8?B?MVk0TnJZQmhiUXdUMHh2OHJKS25Ya24yb0FBNXB6K0o0Q0VocThjOWNNWGpz?=
 =?utf-8?B?NEFSa0lMWldJMHhiZlFTRzJneUxQOU85R2dPRmZ2SGU5djFrMUY1RW11ZUI2?=
 =?utf-8?B?MkhITnVYN0ZGeE1lcEw3MUxjUlpMY2w3UkFTSStoWW9Xa01JTDBFemp5Z09Q?=
 =?utf-8?B?TElmUnMyb3REUTFjc2xKMlpJeCtPNDNnTFNQSUQyMUFNelQxbmhFVmthSTdt?=
 =?utf-8?B?OTNRdDNIRVl3UVZzNy8wTm9xR0RKdUpLUm1jRUowem9tT1dnSlNzcEQ4WjJW?=
 =?utf-8?B?SlAvc3VpZ2NVcldHYng0ZHdtUzJBQUhZRmd3NjBpaXBRWWVaTXZyYzVjL1Nk?=
 =?utf-8?B?S05XV0FQcjBZY3VKOHVJM3hrTER0RWwzc2lnaFdUZUpYcElyUlhrZ0Y5QzZk?=
 =?utf-8?B?YW5mUGdPMjFHbWZDWFFxNi9VNXpQUjlscjN5Smg1LzM2ay9kbFNRMFlNN0xO?=
 =?utf-8?B?WXlrMWU5YWNzTzFRY1BmK0JyQTU5UHlxREFGSjRzRm5EOVI5UjIwcEJsQlRk?=
 =?utf-8?B?MEFLVmVaZklDdWsvaTBXcFUvUnNOUC9SSCs0U3JnWldMbnlHU2h3VFFmRUpa?=
 =?utf-8?B?azlLZmY1c1FVcGJwckJSa1Y3L1JJYUYrdTZoWnd0VmFMYklPWmZaZGpXWEtK?=
 =?utf-8?B?K0dmaWdwT2R1SFF3QnVTcEVkelF6Tm5jdnNvdmZZNUlLR3BFWXlVQ1NnUlAr?=
 =?utf-8?B?UkhqMElwYUdjcjRlT2g0RkhrNlUyclZwOVVPTy9MTDBsU2JmS2pDWlcrMUdN?=
 =?utf-8?B?dUppY3NYUDNpc0hpRTBxNWFmYWFnT3Nwc1Q1TjdaOGdWZy9manJ6RUJrTHkx?=
 =?utf-8?B?UmtLZkRzcnZsL0VLTkVGQjBXcStnVlJySEpxaFgrWTAwRFlhWWpneUJsSzJa?=
 =?utf-8?B?ZXBTZlVwUlZISVBPd1AzNVJ2Zmd5SU9vUTdTc0tKU1BRK1hCa2F5QUNFejZG?=
 =?utf-8?B?Z3VGSzBhVmgzcmRDTEtrU3JyS0NXdTdNRnN0Ym5qZEgrRmFXQjFwYnJCQk8y?=
 =?utf-8?B?NFRqTDdVbU1uVlR1N04wT05NSU9aZk4xRzE4VG84dGJ5MWx2ZWszUDR6VFFF?=
 =?utf-8?B?L2I3bC9WemkyaW81dnZwdmp2akpiU1RpSlZsNDBaN2ExQUszdXJkRHdQZjQx?=
 =?utf-8?B?WTFhQ0RKR1gycC9xZWVBNVB6RFBSaWhtZXFxeEdCdVdaZEl1OWxiZGxVNTlX?=
 =?utf-8?B?YVVyWTE5Mjh3SXNhL0RRTmVNb3VwOWdzZUk4VEFsN0o1ZVdMWGJNY08zUFdj?=
 =?utf-8?B?RlNzNUcvdTBvUm1QS1Q1R1hDVzhFazF4OVpabzc5REZONUtNTkRJMktWdElq?=
 =?utf-8?B?TkhwaFBpVTV5eTMzemxtcmtNSFNSQzZVYWhnSGdKS2lib09DS0twNVlMaGtR?=
 =?utf-8?B?U0MyVnBhK1Ruc2VtOGhWa0dubWdiK2tFMVVLdmlxVWJqU0VHR0VhSEJ1MHRG?=
 =?utf-8?B?R1pCWGpJUHhVRXBvY21WZzJ3SUFVSEdzWUJVKy9jMUxsZEdYdDh3cHV5UGZC?=
 =?utf-8?B?UHpxYW1mTEY5WXFPVi84VWRBa2NWbml0MTR0bTlQOVlHYVF6NnpJMEJhM1Bx?=
 =?utf-8?B?T1RrakxwUVdJOCt2VHJ2UHNHZFJMbDZnZnIxQ28vVzY3Ry9IMGdTeFlJcUVu?=
 =?utf-8?B?Z2thb3UxcG1BR0FBVGFndVlYSDFwT1dkVkpqOHE4My9SREVxdDhWOUFiTGpM?=
 =?utf-8?B?OU92Q2dOTU05MEFYTFRMN3JZM2k3NUtUeFordGcrdTlCdktWamFrQT09?=
X-Exchange-RoutingPolicyChecked:
	ZOANpukF0yIkW51n/3KfwHVsdUaHj6dQ1D8cVLj+d9hrzOZI1m2vJ3H9753wxdGRbuPXojNkzXYdHmTrtH0T6dGVzW4I5TzUWU8e/u8uvRMKX1AzLGk1/fKOMLXZoJSR1PBrqNAfvegRykgNOXMv2Vy+bdQGF1iA/ecZr/5feEQYYRYFwfOrArF7j7I6aRToA1ORXVdMun56S57jMVFPi9gKS0XHqyEgkyOdmRvrH7S0zPESSh7XSdJDVWDkFRee5vZHxO6Tx7TRrWwbaoGWskmjIbX4rI0BvGA+a3gnTW5Mcj5/R96VZF+aI81NYtOjzRyrJ8y4EMX5a/Ci3LsTZQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c90c7b-9110-4fde-66e4-08df30448239
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:58:11.2851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2bW5ctf8UbPrOBcOOnJN+GzKTS27vZSUV6KZsroPiZy7tUT94tHoBCAedh7B0RW2qhll3RkUCiNbPtOL9uJOQCUzkXOVBdRxGIiJIJvAj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8437
X-Authority-Analysis: v=2.4 cv=AtN7T+9P c=1 sm=1 tr=0 ts=6ada1675 cx=c_pps
 a=NlF6qXdsITzFGNsd7EO88Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=yvkwcaNgexo4INVUlTkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NSBTYWx0ZWRfX7K9VOGqym51v
 rf9KQIa8faluvRkPcQjkDYdSeIlBtjVZHWrtsurNP/zWluOdX5FZlhAkWuxdXu9Qzp6Qmw+fzky
 Yj9pwrW3eSFaIV2cvysSlGAPL9Bv5VJrPuNEOAW3fglDospyr6rkCuymBrfdMo8YyLmp2I7E34d
 5dJJfsxkz27CDH3XgT59dtUxSWRoZ6cbnWFXz27mda6dcvnFhYFdd/9ZOHIxVBX7Hd5MNLEoziX
 WxlShHypJN4BMoyO9JAVNWorUy9qEas+RRZ+sh6PxptWACqWlQwaaolx0CPA5h/r5f673yVq2C6
 /SVVUMpLv8S0jC7cWFSOZuLzLM6l9YerUx5QHmi2Yt3eufOJzhf2E1sAjkq0uUbXKqgF/4E+4Bs
 Y2M3b5ORl2LgSfaOhUhockVa7sXdO4uuo70yVCMGfneL+vcfBsZTf5G+JLA4b+L1BIe2roBvvcz
 ioEWlpsW5hOQY+KotBw==
X-Proofpoint-ORIG-GUID: kB3a33bM1tZ9nvaCQV3GNeSXG8aymxIK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NSBTYWx0ZWRfX83aOvbnSkLpH
 TjaCO+/lVCLYiD3F/7Ce3hQpEH75FjefIqnTveSFn07ozqbGBjARc9qfyS/w6/UCCVv7m+VPOlW
 qppuAC2ov8kg/tUdMijgwae3H0lXk5h9lFvKcG32+qEmpfkLVc+r
X-Proofpoint-GUID: kB3a33bM1tZ9nvaCQV3GNeSXG8aymxIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220055

On Thu, Oct 22, 2026 at 03:00:06PM +0200, Philipp Zabel wrote:
> On Do, 2026-10-22 at 12:17 +0200, Alvin Šipraga wrote:
> > On Thu, Oct 22, 2026 at 10:43:35AM +0200, Philipp Zabel wrote:
> > > On Mi, 2026-10-21 at 16:16 +0200, Alvin Šipraga wrote:
> > > [...]
> > > > Looking forward a bit to the second phase where we have everything
> > > > serialized, maybe it will make sense to also lock around the call to the
> > > > .status driver op too? Not suggesting we do it here (as this is just a
> > > > bugfix), but in general I like when subsystems offer a guarantee that
> > > > driver ops can't be called concurrently. Also the status is kind of
> > > > undefined if you're currently in the process of manipulating the reset
> > > > line.
> > > 
> > > That doesn't change with locking if you can't act on the result of the
> > > status return value under the lock.
> > > 
> > > A concurrent assert/deassert may lose the race against status and
> > > toggle the reset line right after status unlocks, before it returns.
> > 
> > True, it doesn't make any material difference from a consumer point of
> > view.
> > 
> > I was mostly thinking about the provider side though. Such serialization
> > guarantees from the core allow reset controller driver authors to use
> > fewer locks in their own code if they know that the ops can't get called
> > concurrently.
> 
> Do you have any specific examples?
> 
> Most drivers that need locking do so to protect register read-modify-
> writes. Usually a register is shared by multiple reset controls, so a
> per-reset-control lock in the core doesn't help.
> 
> Many drivers that use regmap already get their locking at the regmap
> level.
> 
> > On top of that it makes things consistent (all ops called
> > under the same locks).
> 
> Consistency is nice, but so far it seems to boil down to aesthetics.

Good points. Yeah, you're right, it's mostly aesthetics.

> 
> To me it still looks like the status lock would be unnecessary
> overhead. That being said, the cases where reset_control_status() is
> called in a loop are usually exclusive controls.
> 
> > Still think it's not worth serializing .status?
> 
> Yes.

Alright, will refrain from doing that then.

> 
> > Just want to know if you expressly don't want it in the patches I will
> > send after Shengjiu is done.
> > > 
> > > > What I had in mind later on was to rename what Shengjiu has called
> > > > shared_lock to ops_lock instead.
> > > 
> > > We could also combine this with the exclusive reset control's acquire
> > > "lock" if we move that inside the SRCU section.
> > 
> > I had the same thought. But I kept bumping into the fact that the
> > rcdev->lock mutex is taken in reset_control_acquire() while we are
> > holding rstc->lock. If rstc->lock becomes a spinlock
> 
> Why would it? shared_lock is a mutex, too.

I'm talking about the next step, after auditing all drivers and setting
can_sleep = true where necessary.

As I pointed out in my reply to v2 [1], the shared reset race exists
regardless of whether the underlying reset controller can sleep or
not. Shengjiu's fix only applies to controllers which can sleep. The fix
can be extended to controllers that can't sleep too, but only if
shared_lock is a spinlock - since, in general, the API permits calls in
atomic context. (Those atomic callers obviously rely implicitly on the
non-blocking nature of the backing controller, but that's a bit besides
the point).

So the idea I outlined in [1] is for this shared_lock to be either a
mutex or a spinlock depending on the controller's can_sleep. The logic
of this patch staying the same.

Maybe I misunderstood you here:

> > > We could also combine this with the exclusive reset control's acquire
> > > "lock" if we move that inside the SRCU section.

I understood this to mean "collapse lock and shared_lock into a single
lock". And I was just saying that - with the above in mind - if
shared_lock might be either a mutex or a spinlock, then it doesn't work
to collapse them, because...

> 
> > then that's not OK. And converting rcdev->lock into a spinlock doesn't
> > seem feasible.
> 
> Correct.

of this.

Anyway, I will prepare some patches and you can take a look. I might
have overlooked something but I don't want to waste any more of your
time until we have some code to talk about. :)

[1] https://lore.kernel.org/lkml/atcf1PFVcn5pdsVO@analog.com/

> 
> > But on closer inspection I noticed a couple of things. Look at the function:
> > 
> > int reset_control_acquire(struct reset_control *rstc)
> > {
> > 	struct reset_controller_dev *rcdev;
> > 	struct reset_control *rc;
> > 
> > 	if (!rstc)
> > 		return 0;
> > 
> > 	if (WARN_ON(IS_ERR(rstc)))
> > 		return -EINVAL;
> > 
> > 	if (reset_control_is_array(rstc))
> > 		return reset_control_array_acquire(rstc_to_array(rstc));
> > 
> > (A)	guard(mutex)(&rstc->lock);
> > 
> > 	if (rstc->acquired)
> > 		return 0;
> > 
> > 	guard(srcu)(&rstc->srcu);
> > 
> > 	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
> > 	if (!rcdev)
> > 		return -ENODEV;
> > 
> > (B)	scoped_guard(mutex, &rcdev->lock) {
> > 		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
> > 			if (rstc != rc && rstc->id == rc->id) {
> > 				if (rc->acquired)
> > 					return -EBUSY;
> > 			}
> > 		}
> > 	}
> > (C)
> > (D)	rstc->acquired = true;
> > 
> > 	return 0;
> > }
> > 
> > 1. (A) is the only place where rstc->lock is actually taken. Ostensibly
> > it should be serializing acquire/release logic, but from an API point of
> > view it doesn't make much sense.
> > Just like the remark [*] in my last email (see below), you also shouldn't
> > be trying to acquire the same exclusive reset control from two places at
> > once.
> 
> release() doesn't have to be serialized. Only a single rstc per
> rcdev+id should be possible to be acquired at the same time.
> 
> Racing acquire() on the same rstc is API misuse, but also shouldn't
> hurt in itself. The concurrent reset ops that are expected to follow
> would likely break things though.

Agree.

> 
> > And it doesn't offer any synchronization with other exclusive reset
> > controls for the same controller line.
> 
> Acquire between two different rstc for the same rcdev+id was serialized
> via reset_list_mutex, before we apparently broke it with 8c91302a29bc
> ("reset: protect struct reset_control with its own mutex").

Yes, I noticed the same.

> 
> > 2. The synchronization with other reset controls is done with
> > rcdev->lock at (B). But actually there is a narrow race here. Two tasks
> > could try to acquire their own exclusive control of the same
> > line. Assuming the line is currently released, task 1 could reach (C),
> > get preempted by task 2, which reaches (D) before task 1 is run
> > again. Then you end up with two controls having acquired exclusive
> > control.
> > 
> > The obvious fix for (2) is to put (D) inside the scoped guard block.
> 
> I agree.
> 
> > But then you achieve everything that rstc->lock is supposed to
> > achieve. So I think we can get rid of that lock altogether?
> 
> I think so too, yes.

I'll send a patch.

Kind regards,
Alvin
