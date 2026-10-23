Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792744988;
	b=A4zcWgRHvv+5Ld8KUlb711HBUIZ2HqtLIrwkKRb3FKoaAxZCrAfwf0d7bqJUerXrjUjE
	 EBmoVuT9834Fig4MJhLiF65Hws0O+y94s6/AZuB5y/VC49Lv+qyfGLnQCPKhATSfZVhIH
	 o+oLEMkZbMycx7JeqFKU0udsRH2Mcg1xIBqJ2MAz/DevcpiSFg2cEKcvstPp7RTrbfhxp
	 08/LV9Ckj9WY7hG9tscG2Bhg7elaQCCpqNIbcY/sEdKL7liPP6Z/dGarKxa9+hTZUp368
	 p8z+sKkut2nmGG2vmo+1d+B8glZyyr7Ji4A36C9aRSvlW7uNaWKwR4gUto5nM6+q+sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744988;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3mX2h5ERnLxO9lBtfoVBHCvU60NaNMTporkWVIH/Ii0=;
	b=B3vvhG9nMVs6cW4OGiMiYUV2Si4db88eDJMrt7/w7Su5ipebSseVy8sKKpXez+OHLAaS
	 TF29OGulAEYhC05Dmak9GTZRucJnRgS/2RMOq/VWHqmhcacbx0N6FTfru5sOPcH/zMzgq
	 tOaCcubEK6eKOCfS8+Vrxlu0uwIKUmnOnbp9YtZiJGWA2S4al7XMEYgmskN0PfRC/Ggl0
	 UmBI8fcvr02ZrRR8nKzz4rwMRRuDP4Y470wlUI8+nzHy3L40T0CgwVbrBauw+pR8pDgn2
	 9JFYGySaC5A2PKmtx/8exd7XBpdqYrmDX9XZoFuJ/q5QD9LSPfKLaYZzKCmhkxQ1Ytw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Vd4pSDyH;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=HTzgX5iW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BCE606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BCE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Vd4pSDyH;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=HTzgX5iW
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7Gbkr3518557;
	Fri, 23 Oct 2026 04:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=3mX2h5ERnLxO9lBtfoVBHCvU60NaNMTporkWVIH/Ii0=; b=Vd4pSDy
	H1Prd8aRt+AfqT8cvyCllM+2zcBSFD3gD81NiYi9QSObNHUdQUmwh7KUFk4XeVLe
	xE7X7YVRI6nJ8YhLp1ABWwNpzf0QMBa3fGZxGDGsEZFsKlSDgE9BRWNblT2OXNkz
	hNsFWdb2oW5KTppsfucEFACCbImHpZ2we6MuBYwZR58TwimtQy33cqH7KkHDTaTT
	NC3comHdj5esr7oPvdxCRWGdWMTM15QK/EKRFYbaq5c3F8Fa26hqekKzJNcgyO14
	djLLrvvMCQgUJtstnNCJ77QTmCEwcrKEkTlQkQkZBpCJHXwdtLXKIJIz3p/tk4VX
	61qpN94sqmbwExA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=3mX2h
	5ERnLxO9lBtfoVBHCvU60NaNMTporkWVIH/Ii0=; b=HTzgX5iWw98pShtwdijDS
	Fy3YyP5NGhRYed/lqd+8YzuvwmA+D3SfFceOnEIl3yQoDz3WRP6BDRj62bp2ndG7
	iWX7oDA9dYYKDF4aJSZzknqW2rUN231CeSA8dtoKXKhiuqxcuqocLIONzz1PrzQ7
	fIrzL3itltP7wiKBQSXHVkuuC3aJ8d+7XDzMQ0iYFeKHhuqDwSvY4ZCX1i9i1PU/
	mq2WORNboh0hESx8VxfD0jgdmXZCf0O43HdpMpfwWo/r4gnEavzU1XRAYiL/vcUP
	Q4/sVXg2R/VBcgOLQByXv3tg20tx08lWSWuWlnfGOFrOehcxpQ/aklHqS1XQHl5f
	w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hfuxk2ewy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 04:42:54 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD1SHVzndbcpM20lPZp2NQ8WbA7j7YHtAtFzSE54ElX4IsZLDnl70EgbY1HHZMtBizYVYzqJ3lJlThvBun9AbBM+bGt2093bA6vRJK6YFHoCZXVuxOFzcCyTCo6efeXDiEpO2z/E6kEKUg566fJTeqUtZUH9aye9C+JNM3YRGHlb8w+g/6AOBaMXqpT/3ADX0qsv6vA/DLA/HdTCLXLUjE1Y5JZktyZXw9CqH8RnS7EmbHf5lpYfi2Bhf4OdLHieUm8gcqvxJ2lH7IemAnrrNIoQ6cxpbTS3RnX/3938nMg53fDLlcwqTE4mr3f9sRgPpBKosum4szPIt26yo/1/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mX2h5ERnLxO9lBtfoVBHCvU60NaNMTporkWVIH/Ii0=;
 b=WkfJ7yMftb01zozCjFDVhmMMt2rs8iS2DsldA78KAmzqO8jrJQudj519hLXzBzI1p+VYGyaE+dR+0KKgWpfC5YYlSufgpLC25KAhPlrc9b37cV+A0cqG146dNbnT8q+zqMn7KIGNPfA5tm3SIyVPbn3hbLdp4JELm6UZr+3qG09rLHRfRXPxmW4yqJoSmTIY5S2DZjY9dJkHFfvi4I54eiUwJQYiQIP+t6dlxmVABWDPfCpXRjZf2b4bpCSXwOlAUyoqmkTlU+cQnkEuNq8wRszsREyLXCyCsJZLZHPAYw8CFX6DHMnlJvaNrYbXsQEDMKw5w34URFthB6/Ur1nEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7454.namprd03.prod.outlook.com (2603:10b6:408:1a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 08:42:51 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 08:42:51 +0000
Date: Fri, 23 Oct 2026 10:42:47 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: shengjiu.wang@oss.nxp.com
Cc: p.zabel@pengutronix.de, krzk@kernel.org, hansg@kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH v4 1/2] reset: core: Serialize concurrent deassert/reset
 of shared resets
Message-ID: <atsd9JrTnA0bxMZQ@analog.com>
References: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
 <20261023071609.3795354-2-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023071609.3795354-2-shengjiu.wang@oss.nxp.com>
X-ClientProxiedBy: AM9P192CA0017.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::22) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: b999e8aa-a719-49cd-a2d2-08df30e19f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SGEriANr07aOUBh7Ku53+ht3mxVAqqE2Q3fdwOaXUAE72wvWs2jVZutF6V/lKVdjQU3+F8gsqsaaP6MM+Y+G9pTlspVtW9ALf9cTEgRq6vTX5Q77jvZQG5AajKynpRGEJju+n1fmoWvY/lNZHoMeE/KIEEwd70cll8qgk8FaAB1drGZ8GdTf6pA5soqPXLDlcklDoF+Hpxtsyr3BHGYCJ38cq8AdtHkH6EYNTXFNUmtjpN6+z12f8YM0Kb6EqmPmlIQgrZr1uuapxJ3tm/sbTBzg2n933/1afwNFxbw0VuJV3ZyMoMxJ5c+7o33noLiyCM8Gu0/YXIGJGGGGqIgTs0wxHt6D29x8cdeoT4Z80vV/1rz8Bajrcf16nnJrFVpaWYqTKBDSCRZiZ7ugFknqvV+Rg0koFlK0+uH2Gugw3Q6rO/pRAWyjLvUgs3arojUIwOxqnpA7qtu3Y8gYIC0v7Oec9k/oN4ajlKvXH9bsIUIWzAt6TMJiRL5hn98bZXLnXJtKY/0ArqRwrw+IgI1ns4sY+0e3SKd9DBEZ0LIT59DL4/r5d2idrRScWvvftiABUrhmnlD8IH7kKc+zlg2dbqi0EwuEAElQePPji+YtjccqXkHXos83HCLPN16n267D
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGF6djAwNFZuSWRONG5JVHhwZDV5MmJmY0RPaFNaeDE1Q2k2aTA5MDZVYU9h?=
 =?utf-8?B?aEJ5aTlhLzZBNWYvRVNVcWYyenBCQWNVU3ZBa3ZhMHplVVd4c0V5dFNKdkZj?=
 =?utf-8?B?VUcvckRqdjdMVjlYeXBmMWRyUjIyc2JBaTZTem0wMEwrdGJJRnJmYUYwdmpJ?=
 =?utf-8?B?UUM4bGN5Z2RYY2tHMXBING4xb1ZWdU8rVXNmS2h5UkJEbXVUK0ZURkIzZjht?=
 =?utf-8?B?LzcxNG1WSGttOU9pTlRLRllHRVVZc1NiV3VPVkFpL25URnVUYW1vWnJKODBT?=
 =?utf-8?B?OVQ0VXJia3J3SUdINVRvbWJHNm04aTZDVnVycEd6MERSVXdhWVpZV3dNWWI5?=
 =?utf-8?B?U1BxbFRBLzBiMVVNM0cxQXRxVldIMXVrSnhQVnNvMHk5NVdlV1F1WnBtTkhG?=
 =?utf-8?B?UHpjR3hHeXRmWVcyVzFjdWk0dVJ1bUREaDM1UHhIU2IraGl3Ny9EQzhTaWVG?=
 =?utf-8?B?QkhuRmR1Nlk0Umx3VFl6VkFhV0I3d3UybDdQUEltWFRWWVpWRnBML3pTalla?=
 =?utf-8?B?QjZWZTdmZm9BK0ZuQ3BqYjBrM29xeTNHbVdCMldNUGQyaUZmNUcxcmlvZG05?=
 =?utf-8?B?TWI0TlZyWXZFUW9wVHlyQmQ0MWxpbFJRS2FiaHdzZFdpc3Q0N2dmUzlFY3Jr?=
 =?utf-8?B?RTFLNzIxa1ZBQy9yOEFCZ1FBVlJzL3JhdzgrcFFCM3BaS1E0LzdIVllGdHc4?=
 =?utf-8?B?QnZMUmoyU0tNR2dMd2dtNVlMRXR2Z3k2aTN5NlJEZnlmMUpQNmdlNTlKVmZk?=
 =?utf-8?B?Snlhc2o5dVRBOGF5QnB1Mm1NVEI0RGxTb2ZkR0kvbHgxaTVROWoyNWVKREZT?=
 =?utf-8?B?NnZmMlNaK3J6Y1hjMUdETGgxcUxyQmRIS2ZKcWZoNWhhVThIbUdBVitlZ3Bk?=
 =?utf-8?B?elZVVmFlUzVFejZ3b3JhamF1d2JCOWVtT0VqckFNeUlHcHJaczJBSWRIYXhx?=
 =?utf-8?B?Q2V3TmY4ZEU2dVQ3ZGtzNDVkckI0bUttVmdOZGVwZzdQam9yemI2ckZQZjk2?=
 =?utf-8?B?THRsY3psMGZYV0NXNGFIaUpQeTNVTlF1UGVmZHVsYndrdnp5U1NLWHYxeGlm?=
 =?utf-8?B?NG1EVmttUzl3VzFxNytwa0dUSDlMVUZuajRPQnZUb0RKeE5waEozc05HckFP?=
 =?utf-8?B?TWVFbTg5RjlabU1DT3BKWmRsbDdNb0QyYnhmNWd4N2Rnc2lLWlAvOHhJMjU5?=
 =?utf-8?B?VVRrUm9rMUpVWFUvWEVvRTdZMHY1SG5BbDA2V1VrSmxyWkk0Q0pTNTFIL2FO?=
 =?utf-8?B?RHNxTnArRnp0a2VjWjNoTFFISWdpYjFSZ1A0L2hhbmoyYk92RVczUmVXWWxn?=
 =?utf-8?B?TTBtMVY1Ky9KUjhjdU50T1ZhQ3drdzJrL2hJdGFWVzY1Q2tJWXhFbjlIeEdK?=
 =?utf-8?B?ZCtSZmlZR2hIbitkMjE3RlVNb3FlcXBsb0plOTQ3Nm0vb24vamYvMkxyWlFk?=
 =?utf-8?B?akE3OGtUc3dQZXFHRjNXdzFjdnlDNDU3MFJGeEdHa2pvTjVTWE10a2ZteTMx?=
 =?utf-8?B?OVdUWkdnQkNXU3BUTHdOTFVtT2N2RVJzSjdWQm42SFArYTlJb2cyTVVsdzFj?=
 =?utf-8?B?RUIvOE4yNnkySHM0UjVEeUZDbWRXbnJKMVNjNkpqOHZnRkJTa3JYWFl4WCtl?=
 =?utf-8?B?Yjl4SkRQc1JTdlVHNzhXRFV2eWdKSVdsVzRwYjNWc2tYN1RleDZIWTR6Z2RS?=
 =?utf-8?B?QlNPY1pjMkI0Ny9LQ2NGeHZLWXdTN2E5dUZTK1ZyWVdwTG9UQW11V2o1dG15?=
 =?utf-8?B?TlZRZnMwTCtpSjIydWNMbEZkK05HVjhLNEwvQlVqZGFPV04rLzFRazB6ZEFV?=
 =?utf-8?B?OGhkKzNhNUUwcVJCeW9NNkJObUMvclBvV2w4bWRLNlhTSkoxeVZmLzVzQ29U?=
 =?utf-8?B?ZWZUQVdIbTAvcDhhUlc3ZlZaTWQ4Y3h0KzJTNVZVelcrSUtzSlliUURJU2FK?=
 =?utf-8?B?aHdBbWgvdFMvL1pwa3ZJdDU2T0VzZ1F0SzBUKzhaeWRHNEdxWGpMdCszUXdE?=
 =?utf-8?B?bWJGWkUrMjJkSzNaNk1SWnhMckMxZFhzY1FuU0lNakE0OUI3UGppeURCdUZI?=
 =?utf-8?B?YnRZeldja0t2N3B2RFFTWFZhWTQ4K3RQdDRJbU5kU2pjdFJPMDNEOHFmRVhI?=
 =?utf-8?B?T2hVY0JqZlM2dVg4NWI2emQ5aDc1UjNvaCt3QzRYVVliRkt4YTRrK21VdEds?=
 =?utf-8?B?dk5ma1FraHVnV1QyQkRBY2daVVpLRXc2Y0pER2x2bkdhVmdXdzkzU2RmVVZu?=
 =?utf-8?B?SU9oNmc0c0dsaXJFZ3laTm50bUo1QXRESHptNGRJOEdRL1ZubWoyMnpSaUxG?=
 =?utf-8?B?VDFXRXd0ZXlPVlpOeEsxTW8wdGdwekJjOFZub3BGdTBjbjVYa2h1Zz09?=
X-Exchange-RoutingPolicyChecked:
	uYeCSEqbTYrBO5tvw4TaTQY+M+OWTpgsSx+nivz9sl1uWXCFVQ/L56eqRKqNPVPkzuMzPMlp7QcQZQT5mZa8LgzAeWPE4DrNmTO2iCeJDvsNNkBXI9L4pe4z54zd48vLW1YfZRrckDI7RTZo3+dr4X+kkSurnw9tmSKxNckfPRjkehpUyr8y4AOGpn6PMlz4d59pw/Vqx9RkbwlO0KqKwdPZh1z/EBGOZzK/VacLjbz4da+1cf9+rEqVt65DQmwMrCO77f2I5VA7+aiNeUIOSD3Vvb/fDfnDQNL0mr4IkoZGi2iEwxjAnHma4fkrwQAT1DzITq90Kgi/5EAK1uGq6Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b999e8aa-a719-49cd-a2d2-08df30e19f9a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 08:42:51.5558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaEjYs92bRUWNMmsgCnhOjY+E76up83GJbpjaNTizalalULlMXtc6xY8Bws84khngfCyl/fnkSpKu/+tVexRE8Rahm5jvWgRWo9sg7MkCQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7454
X-Authority-Analysis: v=2.4 cv=JMyuIMKb c=1 sm=1 tr=0 ts=6adb1e0e cx=c_pps
 a=A3soYu1h9hn2xD7k0nk5XA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=8AirrxEcAAAA:8 a=AfuJxepiAuZL0v8z7C8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX5oCVeGkm2Tzb
 vXabcdTMoGmNDikZjaEE82IYKCDMpqvFvw1JL2zXv3jd8F9mJXP+wanQcuk6qT8OILVl/m0nERU
 QEBrtfUZZrMcRI/QT4QsintkJM2lKyT4nS6NfpJCiSxXUl1P1xTAsWpg/3YJ801GK0Qd8ylsfgE
 Y6tqf7aniEl2OLMKYtWNW98Cf4d1n9cvXsEdJKP8ICDRnABRIEaaINlowsk8hpSotw9WuojEyPI
 +YzbvUf3EHAtz9UQaQU/n7hU4vaOROKvSqRYrG440ct5h2kQbsqQlUuPMlgBmm5BGOvAk8xK8kV
 ep9dMLFb3P1HtIPzb/123jneeDq4BA5bCAwTChul0LMVx2W8zaSTz0AKmpQY6lU0WZryHC8bVUx
 AlQ6Et23ALIr/baWulIpA3K5voc9PuIPgc8+T6AwCO0tJldcb6SLWFWEWiIKdIzH+Eber9tei2h
 DkrqNLoy/xmIxLNnnJA==
X-Proofpoint-GUID: vGbq8xCQlEscQJ7PzSa9AYgc3hupWOQ3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNCBTYWx0ZWRfX/UfJXQPDezt3
 6fpTh9h7FADorkufPrLCtUUIWVzZJBELvbBFimU1+mhIQL1YER3+9tC7FlhgPfOp1F7OEkBvkZc
 sRdeUAHZrj19mX6zZ3zEdwkm1ipxpRA+U5jk3SGzNKflOrKy39nG
X-Proofpoint-ORIG-GUID: vGbq8xCQlEscQJ7PzSa9AYgc3hupWOQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230034

On Fri, Oct 23, 2026 at 03:16:08PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Add a reset_controller_dev::can_sleep flag that a provider sets when its
> reset ops may sleep. When it is set, serialize the shared refcount update
> and the hardware op in reset_control_reset(), reset_control_deassert() and
> reset_control_assert() under a new per-control mutex, taken inside the SRCU
> read-side critical section. Providers that leave the flag clear keep the
> existing lockless path, so callers in atomic context are unaffected.
> 
> reset_control_deassert() and reset_control_reset() are documented to
> guarantee that the reset line has been deasserted, respectively that a
> reset pulse has been issued, by the time they return.
> 
> For a shared reset only the first caller runs the hardware op; the other
> callers just bump the refcount and return. When the op can sleep this
> breaks the guarantee: a second caller can observe the bumped refcount and
> return before the first caller's op has finished, and then touch hardware
> that is still in reset. A reset_control_assert() racing a concurrent
> reset_control_deassert() can likewise interleave the two sleeping ops and
> leave the line asserted while the refcount says it is deasserted.
> 
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  drivers/reset/core.c             | 205 ++++++++++++++++++++-----------
>  include/linux/reset-controller.h |   4 +
>  2 files changed, 138 insertions(+), 71 deletions(-)
