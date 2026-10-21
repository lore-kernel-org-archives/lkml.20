Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592215;
	b=HgRaia/EUEHHXMOs/zEPUUDJfEWAQ187/dsBgrbkO/hrm7WJK60eOqL4mFBxGPKUNx43
	 gXJneqA0yC8SpagKOj+ZeCCPhXaW1R5rXqYX2wYQ/Vv6egwBRW0LzbKkMEbMvB0E/kxFk
	 6AcRlmUxIrNaPBkDGKblOIMPKlIzLRgcYqYD66BvISanjuogbC87E8PfRbiRK0qWuQcNi
	 KeLYja8X9cq9C181IP5wjx784BaRTnukqPnpCQt7Kp5Vn7lLvdXXqse27AjbOEU1RqdqM
	 77W1VTpqP+OclIVBs0GkFlzpBPDRAxR1xz6dQfOFehO2PA8+uZ/IVBr4xCKhWikLMSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592215;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5hIfhJJUL/g/8V0DLmQSFpLRflc8OcUS4pfSHCoPnH0=;
	b=3/OvUczJMjH8bxZmskx2GimTshnyMqkr1lsiFMJYJuTY595FyGG64dIzEBYP8Hrji/Xy
	 hLfFuZFag38kLmuxbIaAbs6SdmCMvFaDoSi8zI24ok6qF4F3obHUcRTCcErwgqC+bKJdp
	 OEh4fpFAdin1pq81l9Et9xOY7ZwhSetZtGNx3TPSXdjMMc72320QIn7jlVviWIPtddV1m
	 RwEE9+cdbXiJXjrXey0kc2QL/K3H0afy+8aXhgwOIPbCjjgVmhACXnNJDzZSu3TGHfvmf
	 3mRP/3wDiY6WnWwf3yKCsyE4OFyVkzMNEoKabZPYT+aSd/KT7LoohtIF0bdmgxc3wmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=E7ba0Jxt;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=rsolpVkX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BB9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BB9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=E7ba0Jxt;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=rsolpVkX
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEE0Nj2721243;
	Wed, 21 Oct 2026 10:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=5hIfhJJUL/g/8V0DLmQSFpLRflc8O
	cUS4pfSHCoPnH0=; b=E7ba0JxtLngUAHy980xQ7PQ2F1RsIBnq3G0VlOn/38dCj
	GLrWi0kRa0WS7/LJyTJB8RjH74PomQLpIRoLurU/+qkHCsQUoGQMBt08Giv7IZ/G
	a/6HLMUgdLuyS7nBqcgin+/5pn7FC/i/vLF7GloK32MBf/s1m854cRJafnTBB+co
	/fxzvN3QeLDQCmVuvUCItmkehgLIftx8bd9Rfz7MW2W/xQzeYmXKe3YaZdoqajs+
	JXbKkKx+NoD3WHBFQBvkxOIP3hSgB7KOpNgWqN7Lc4a5zvqK7T1TD/77fXgwP4sR
	J6sxGwHqhOgyouLLmMT/ydXKg6L6n1Gvcffyu2wGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=5hIfhJJUL/g/8V0DLmQSFpLRflc8O
	cUS4pfSHCoPnH0=; b=rsolpVkXg29V1Mk25l+Xtmc7Q8V7OxRBuwp775LhiyEe1
	DpyONnEKc7OcFq65m1u4TF5LVm9WlZoNkJ07aI3zfsVYC/jIdt95jmrV0K2ktdS4
	p/uxKvtDQgj7+BW3r7W8A44emugbNpJ0a75FQflEXd9U64mEzCT4YslCTyi5ZF16
	zd5W8UuBIkY7yrrlYJyicBVwdkDJLls6Z1H+LBN6lgC5knQW+r9ArPLn227X5DoW
	nBOnnBikgKtcE5RwP+NZqUwD4l/bmJbmQPxlow0uEAnhHiqY5lGHdEAN0iDmgN8Q
	CHzSvslvz9H7At76jW7V3JSgRnXWcUJ3RQfehiKZg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hem0tbnk6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:16:35 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gy/ndtx6bnvWQnWKHG5cyIfEy7rWsvG9VlN1RO87CFzEtrthgb/MSbqEGLvbjflw6GawaSqi2LJMMIFXy0qYuaiPsfJAZdSV7mCqgHvCZaUa1Z2cMpK3aqTptAPrn+ydZOIOqCZ0GHk+I2zI3AbPeS3QocQIfSkJOiPJ2THzrkJFTLxwJNGCr0luRTGz9kGUZrhnzT8s3h7/+GKzSccVrDS2evkqWHt33t8utSxQYV+/6STzjgTaVw/1dabMz56LAVb9PN0pSZlsbtLvBWrXGi1H17L4Usp77tdeWPoOPG876ZRdI81LQHVj8UjqrdMlfv73Oz51UFh/7781AjGABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hIfhJJUL/g/8V0DLmQSFpLRflc8OcUS4pfSHCoPnH0=;
 b=CovEF8rTtkx4DOXITVuBAhp758i8P1Mv+ewSdH9wVS8vw+xQo6pH/y69W4epY6ylDp0HEoVeDxYl+mUQKyMBraabHixTm1Lh+aeFdyWKt++DJwWP3GReFfbFO6ABnKvqmShp6guZD/HplR7SGG7z93Quoi/44slZt2QujKvF1NvqPWFWyHfLnBh6OGWlvykYh72l9HOvReigw94kdyraGem1FMYByJiZoVmT4V3QTe3m9CJgJyDTfP/mSvf7X57hETJ4esS70cIdFlis1e2zMPr7fyF4KuIlk8Wsh9imvv/ppT8Vlzza5MR6otXY0Hbm4q3dYGfmPr62BUqtcfQ9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by SN4PR03MB989445.namprd03.prod.outlook.com (2603:10b6:806:211::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:16:33 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:16:32 +0000
Date: Wed, 21 Oct 2026 16:16:29 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
Message-ID: <atjA6l3H5kdrC6SN@analog.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
X-ClientProxiedBy: MM0P280CA0054.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::24) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|SN4PR03MB989445:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ac2b02-51f2-4d29-61a1-08df2f7de81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|4143699003|11063799006|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+9HW2lSQSETzgDcjdAV1pBhPy+wfRm1/MB2CVZXKsIF8JQL4OoDHHf3V4NBgOlq0gW06SrH2fD1sN3lnsKeMA/MqrrA3QIKf4/wBta/UGgX3SwfvDIrIZ4UQwvCSLFlzWVzHKU8i9wC34Gz3858kmIC+lq36Ap6QTtyQPgSsoLzwjo1ePSn2E3tn+sbYxv5J1NU293qL6eCzfr0V1EIdf6wuV1lL1H6iFv7W0vdjvyiLiIEzGKuDwZykEcIGXcVhr/o4ngZadGIHmI4jk9Ox1l0Ez8PzTNCplXSgT9Amx9p/JI5JO1uT4SDaz/dv36XYH0BGZvD1SsgfmZ4onl6xo7R5yZk6NFVkxQzBV5Cbw/FHReF/QfIkJgy6OHxR1uc31GJpFpFI6sXsBaNDW8RQGOAuhURF9AK97kAo5V5p2OXZbgGuG/crk3wlyFSeQSuUFKcPYTPuNmYFVEMOLKmB9XfcUE6RC4ZuPF81Tsm5THxXew6j+IwXJxgEaEBLlx2Q2r2KX41ntXSLyIrrAER9IHTQAoDuBkpXqoLcf9bTrEEU3NE5/c3uYikG1Etaf0kxr2eIQspxktC4tiemma98Pnph7Ua9sE08RTlVpBvP5hE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnNocGF1V3VaN1VDZ0hwSVBvOXFuZWdMUG1jaXFVRGM4YlNhbDlBVkhWbmUr?=
 =?utf-8?B?UFVJcWVPUElFZEcwQlc4bHNVTDFwUmliZmV0YlArOWM0aU0wYzA2aUNNWlpZ?=
 =?utf-8?B?bTQxczUxY2ZKQ1NoSDRzUlY0TmhxTTdyZVN1dTVRVk5XM2NZbDNoNnBQWktq?=
 =?utf-8?B?QnEzR0dyQmJDT2JzcWV3NktzSGVzNjJpQWZxYm41L1o1S3JyYVJBZXZRcXRL?=
 =?utf-8?B?S2JmRDZJM0l2WEJqekx4aHRrUlkrWG9PNTBENjdFRnFaMHB4RmYxQmdkcjdr?=
 =?utf-8?B?eFNvWElodTR3ZFNXd3lpdGdHNXkrWEVWWnlzWHV2VGRFT3JQYnRYb3l1TFI3?=
 =?utf-8?B?ZHhnOEVJcTQ4bVdGN2dWd0NGdjNJZ1hSRzc1dHJVWXJMWmtOWS9SUHJCYUFr?=
 =?utf-8?B?Z2tFTFM2enBvOUV6SEtiUEVjR2hyQzRqOTM5REtERXJxc3ZwalRVTkRnZHBo?=
 =?utf-8?B?MHR6aWkydVMwdU9GRjlDQkRqakwzTzByK0toMVNTY3Ztc0FJek9sNW4wck1S?=
 =?utf-8?B?cmNWZUp6UmVjUzJoOVFCVFJNSjNSWEFkOWVxeHBpdHRXOWI5YTF2MzlPQkZw?=
 =?utf-8?B?SlBKOE5WWE9jUTFNZVYvTUIyeGUyY2ZzK0VOK1cvKzNtVDNhMGxjNndPQ0lv?=
 =?utf-8?B?OUExdng1QWpSc0owRndiQmpPQTZOVlJsZTZqYUUybmt5RTVBS0xxa1lFVzRB?=
 =?utf-8?B?aU5ldmNHczZ1aUtPMDhIaFcyVkJ5ZHFZaE9oWjlpRjJpZWN3ZzFrbXlJYU80?=
 =?utf-8?B?bUF6TmtuRGdrK08zQndIMThFOHZGVDJaVllBWUNOMmZnK0RWYjlzSWlKcWhs?=
 =?utf-8?B?UnQ2TTU0aDJwQUhhYVJSR1FtS21XU3NPRjdCTEtIZ2trVlN6dmpCKzNHWHYr?=
 =?utf-8?B?bDRwNnYzZ3F0NjAzUDVLZDlrUmhzZFdDNWdOb2xueDM3TFc0QlNzR3F4MkdZ?=
 =?utf-8?B?SUpsUUtyVGwrQnJLSVIrUW5MYW92ZmVrNEtrTXVuS1JKSXdYM0pFdUorK3dU?=
 =?utf-8?B?LzlacFIwbDEwMEo5dUg5VHBKc0ozdGhyMUo3NWlCZnhiMEF2STlqWjhuQ203?=
 =?utf-8?B?UURuRDRsQ2N2N05RaFRVWE5oWWtSemViQ2Zxd2R2d0xFVjVMaWtWeWNjeTl2?=
 =?utf-8?B?NytvczNiNkRFcjJnY0YyaUFNc2kwZjF3KzlTYXRrYk95a0pxOWs4MGk2SlZ0?=
 =?utf-8?B?Z29sbzFpaXZod1pyMm5KZGd5RkIwaDJLMWFoVlBlQmpieTBHczYwaENCSmdW?=
 =?utf-8?B?SVZLR1dON1FqcTBwZmtETWRJRjlCbGdQVE9iYU5aRk11eTFpYk4vdkJaV1Mv?=
 =?utf-8?B?ZEV0RWFTdnJtbGxlWlF6aTVsb3c4NnVxbHVBN1NGbjB6NFdhN0pMK2o2MnNH?=
 =?utf-8?B?amRWMDQ5dG9ZWHJvVXpLZmtJd1NHVENEbTJ6Rjg1dDl2OXdsN2xJZWpWQVJ0?=
 =?utf-8?B?MWdyZE1xWWZ1YjNBRFo5NFJOdXV4TGpoUlMvenpySmZnZTRkbndsRE9yRmRr?=
 =?utf-8?B?ZTFvYUN3aEE3VGJWZEdlR21lQTRxamovYW5GNTNsOXBvR0pJQmFIb0l2OVM1?=
 =?utf-8?B?cXJQckRWVTNsRXhUWEk5VTJ3cGV0QVhoVHRRV0JjNkJQUHRTNEYzWm84KzMv?=
 =?utf-8?B?N3dReEJtd256eWZvQUczN2NzeTdiKyt2clAwWWg0UjZSL1J5UkdzWFI0aE9q?=
 =?utf-8?B?VDRzS1R4SEIwSGI1SEsxbUlId3d1WWFXOC9HbDhmRVhzRm5JeHdBY2JhYlFO?=
 =?utf-8?B?SmkrSjZkZTgxZU45eDZMa3RQdzBjaDhzc1hoWGQ0R2Vjd3BQa0lYeGxGTnA0?=
 =?utf-8?B?ZXdWc29mQTNFd0NMTTQ5eURBamg4Y25PdmtYS01wTkw1OXpkR3ZQaWhDRkpS?=
 =?utf-8?B?NzlPUFF2eU00YmEvWkVpQ1pwTnREN1NseDQ5L3B3N21pekVqNWwxQ3NJVnh5?=
 =?utf-8?B?SW8zdXhGcDlvNi84VmxTaUJpV3V0L2Z0N2YyWVFDbVg2MUgxRlVpNUk1TjJt?=
 =?utf-8?B?SEo4WDArb2U3VVZCZ1d6Zjl2REJVbWIzQnowN0pyNDhIVENNNHFUUHhXTXI0?=
 =?utf-8?B?dmR0OE5ONU9lME9JejVQREtyTDFNR0lzcFgwNGF2VXY3WkFQNG93Lyt5Vmtm?=
 =?utf-8?B?OUdYdGtFb0kza0F4MCtjMVk4QWxqbUhVMFpab3Q0L3EzVTY1bXExNWwzUWM2?=
 =?utf-8?B?cktzWEw4NmNsMWU4NG9OZzdUZ056WmdoVk92MWhpZXBWNFFWaTgybTZRR2lF?=
 =?utf-8?B?cDQxUHdPQ28rSFVyejBVQ240b0pPMUJIa2thQytqTzZYM01pRDlRUjRwQ0Rv?=
 =?utf-8?B?QjJjeTYveG42a0ZxcmJDbHdZL05VNjNSSGQ1dmVGajltUExyWVltZz09?=
X-Exchange-RoutingPolicyChecked:
	j4PGeJNOwa1zD+W1HDvvz9meCZ+ap0vTjCfNgy96RSKGh/FMRdWx7+abRW0qelx+8MJPUyNIdYqHSFlyRJ1nLoiv4MsUH6Y2KjKJuJT1OZeI5RVXvxYabKjNyUh9VlsVcJILgj0y4v4zD54BDHu8tCqdRrpmOYHMt0KgtUrjq5wEKYENk/qkcVAhSnKUrkrT/I/w/s7BaX1ofWZ+uOTlYIJ0vCe+QaciQoYIaZ4hnuBvKXyB5qNVZFJnYulNn8yD+FHyAOzQSwxrr2ra5URXFnqEnPOmUg0lyGo9NteNGbQE7UufJDSkiI+mLes5StBCGuwm/nmFjr+9z6+pYuoq8A==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ac2b02-51f2-4d29-61a1-08df2f7de81c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:16:32.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVcGzeTCX3kawPGdB7okJrnZcrQ6EUuNlRyU1RpScCh4iltSk0FK3Tjqm1Ukgd6BPuwH6ah3I/UbllksOaCYW2+Gy9cwGUXw4Anhmrii/WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989445
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfXzHpqVoxaU/RE
 Q/s73L3ZBLL3B7zDm99yhx+dqqWbutcRExWw44V5oXs895WWzdUzF/105R3tAO8I8br9Cr/FsK2
 k4RhJlMQvNPA07qTxEuZ5tZcZa/9ZDrovXqsKglHr+2JdBS/mKUG
X-Proofpoint-GUID: y6nHTpvIkUXdp-S6RSeq1cIKTaHOBig_
X-Proofpoint-ORIG-GUID: y6nHTpvIkUXdp-S6RSeq1cIKTaHOBig_
X-Authority-Analysis: v=2.4 cv=HOdWhYtv c=1 sm=1 tr=0 ts=6ad8c943 cx=c_pps
 a=/Dg/agRq+0IGp9KZEOxzXg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=c92rfblmAAAA:8 a=8AirrxEcAAAA:8
 a=UVZtI8TRbtACt8DtaR4A:9 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX62MSg8nUZYJq
 s6c+9cm120lbEsJd3Jg4P4/SzpLHTdEWOZfp/1bYFIPeEZ2UczZgKlQrZtzIYcJQ6myIfVIS02P
 ylYa4RwHM1Y8YTtNmOW8Zyz1QV6xd1y6LhZmfnix9xEKcgKnztPEHe9yEmCNF9abQMU/QL+fOcV
 4QOvc2Q1KSjvxVGovPYx/O4eUjmqABPojTcJs/rJNuwVoQoy9FJjUuqFgY/fZNup4gC9qTZWSJg
 f7htJOPcgyEsUV+xg6nL4z76E85wvcjhhbGDTYFyeNw2a/bSP5oRzOyU/33lkpd/meWGZ6let6h
 uDKEMVf1bV5I3Y64D3d4/z26CZ7Q7IXCD78gLJZQqFkwzWLx3rgVqaCPQxPLFZiv8Q/MEy9Q0BE
 svP4Jc9/FA+mg8+0SUkJj18WKyczQ6PcO3TOx571jRoseRtQsqAR9nLVxkwpRHQiJU1RFWxBuCd
 IYRUMaH2k9x/LubgpmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210056

On Wed, Oct 21, 2026 at 03:24:23PM +0200, Philipp Zabel wrote:
> On Mi, 2026-10-21 at 11:09 +0800, shengjiu.wang@oss.nxp.com wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > 
> > reset_control_deassert() and reset_control_reset() are documented to
> > guarantee that the reset line has been deasserted, respectively that a
> > reset pulse has been issued, by the time they return.
> > 
> > For a shared reset only the first caller runs the hardware op; the other
> > callers just bump the refcount and return. When the op can sleep this
> > breaks the guarantee: a second caller can observe the bumped refcount and
> > return before the first caller's op has finished, and then touch hardware
> > that is still in reset.
> > 
> > Add a reset_controller_dev::can_sleep flag that a provider sets when its
> > reset ops may sleep. When it is set, serialize the shared refcount update
> > and the hardware op in reset_control_reset() and reset_control_deassert()
> > under a new per-control mutex, taken inside the SRCU read-side critical
> > section. Providers that leave the flag clear keep the existing lockless
> > path, so callers in atomic context are unaffected.
> 
> I think this paragraph should go first.
> 
> > Set can_sleep in the reset-gpio driver, which drives the line with
> > gpiod_set_value_cansleep() and may therefore sleep. Other providers whose
> > reset ops may sleep still need to opt in.
> 
> Please split this out into a separate patch.
> 
> > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> 
> This is a partial fix for an issue introduced by 0b52297f2288, but only
> for reset-gpio, which didn't exist back then.
> 
> On the other hand, the patch doesn't apply before commit 8c91302a29bc1
> ("reset: protect struct reset_control with its own mutex"), which only
> allows this to be trivially backported to v7.1, with adjustments needed
> for older kernels.
> 
> The commit this is supposed to fix, 8a0de73cf9dc ("ASoC: ak4458: add
> optional reset control to instead of gpio"), is in v6.2. I'm not sure
> if something changed between v6.2 and now that exposed this issue for
> ak4458?
> 
> In short, do you have an opinion how (far) this should be backported,
> and does this warrant some Cc:stable tag?
> 
> > Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Assisted-by: Anthropic:claude-opus-4-8
> 
> Drop, see 1e035297ffda ("docs: remove Assisted-by references").
> 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > ---
> > Changes in v3:
> > - Drop the reset_control_reset_atomic()/reset_control_deassert_atomic()
> >   variants and their reset.h declarations/stubs; gate the mutex on
> >   rcdev->can_sleep instead, so non-sleeping controllers keep the lockless
> >   path and need no new API.
> > - Use a dedicated rstc->shared_lock taken inside the SRCU read-side section
> >   instead of reusing rstc->lock before SRCU.
> > - Set can_sleep in reset-gpio; no other provider is converted.
> > - Drop the lockdep_assert_not_held() additions and the reset.rst / kerneldoc
> >   text about sleeping-vs-atomic variants.
> > 
> > Changes in v2:
> > - Serialize only the shared may-sleep path under rstc->lock (taken before
> >   SRCU to match reset_control_acquire()'s order); exclusive path stays
> >   lockless, and reset_control_assert() is left unchanged.
> > - Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic()
> >   for atomic callers; gate the mutex on can_sleep so no shared consumer is
> >   regressed and so it works on all configs.
> > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> >   controller op re-entering the API on the same control.
> > - Declare the new variants and stubs in reset.h, and document the sleeping
> >   vs atomic variants in the kerneldoc and reset.rst.
> > 
> >  drivers/reset/core.c             | 125 +++++++++++++++++++++----------
> >  drivers/reset/reset-gpio.c       |   1 +
> >  include/linux/reset-controller.h |   3 +
> >  3 files changed, 89 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index 38e189d04d09..dd6e47163f6c 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -52,6 +52,9 @@ static DEFINE_IDA(reset_gpio_ida);
> >   *                   only used for shared resets, which means that the value
> >   *                   will be either 0 or 1.
> >   * @lock: serializes the internals of reset_control_acquire()
> > + * @shared_lock: serializes the shared refcount update and the hardware op for
> > + *               controllers whose ops may sleep (rcdev->can_sleep); taken only
> > + *               inside the SRCU read-side critical section
> >   */
> >  struct reset_control {
> >  	struct reset_controller_dev __rcu *rcdev;
> > @@ -65,6 +68,8 @@ struct reset_control {
> >  	atomic_t deassert_count;
> >  	atomic_t triggered_count;
> >  	struct mutex lock;
> > +	/* serializes the shared refcount update with its hardware op */
> > +	struct mutex shared_lock;
> >  };
> >  
> >  /**
> > @@ -355,6 +360,32 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
> >  	return rstc->array;
> >  }
> >  
> > +static int __reset_control_reset(struct reset_control *rstc,
> > +				 struct reset_controller_dev *rcdev)
> > +{
> > +	int ret;
> > +
> > +	if (!rcdev->ops->reset)
> > +		return -ENOTSUPP;
> > +
> > +	if (rstc->shared) {
> > +		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
> > +			return -EINVAL;
> > +
> > +		if (atomic_inc_return(&rstc->triggered_count) != 1)
> > +			return 0;
> > +	} else {
> > +		if (!rstc->acquired)
> > +			return -EPERM;
> > +	}
> > +
> > +	ret = rcdev->ops->reset(rcdev, rstc->id);
> > +	if (rstc->shared && ret)
> > +		atomic_dec(&rstc->triggered_count);
> > +
> > +	return ret;
> > +}
> > +
> >  /**
> >   * reset_control_reset - reset the controlled device
> >   * @rstc: reset controller
> > @@ -362,6 +393,9 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
> >   * On a shared reset line the actual reset pulse is only triggered once for the
> >   * lifetime of the reset_control instance: for all but the first caller this is
> >   * a no-op.
> > + *
> > + * After calling this function, the reset is guaranteed to have seen a reset
> 
> s/reset/reset line/
> 
> The sashiko bot constructed an unlikely but theoretically possible
> scenario that requires to lock _assert() after all:
> 
> https://sashiko.dev/#/patchset/20261021030925.3543841-1-shengjiu.wang%40oss.nxp.com

Looking forward a bit to the second phase where we have everything
serialized, maybe it will make sense to also lock around the call to the
.status driver op too? Not suggesting we do it here (as this is just a
bugfix), but in general I like when subsystems offer a guarantee that
driver ops can't be called concurrently. Also the status is kind of
undefined if you're currently in the process of manipulating the reset
line.

What I had in mind later on was to rename what Shengjiu has called
shared_lock to ops_lock instead. With the following primitives:

  can_sleep?    CONTROL TYPE       LOCKING PRIMITIVE
  --------------------------------------------------
  no            shared             spin_lock_irqsave
  yes           shared             mutex
  no            exclusive          none? see [*]
  yes           exclusive          none? see [*]

Where all reset control operation functions look like:

  reset_control_op() {
    ...
  
    lock(ops_lock);
  
    __reset_control_op(); /* inc/dec, ->op() call, etc. here */
  
    unlock(ops_lock);
  }

[*] I'm not sure if it makes sense to add any locking here? I can only
see it as API misuse if somebody is manipulating an exclusive reset
control from two places at once.

Just some thoughts, not particularly relevant to Shengjiu's change :)

Kind regards,
Alvin
