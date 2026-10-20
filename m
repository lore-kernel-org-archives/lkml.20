Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792490664;
	b=tL4CR4DIO9mpRbBGB8bcUQczYkTkJak1Z/W78jWLx/ALZpPEV3ysMvPbmSnLTZfmTGtM
	 HXvZj8cynik4/k0A7p+3V860LChyVDvkhWTbs8GksZwsn549+BN0aR2H+eOtaYF6twqcF
	 Xo/KupgCn6Fmhai7BMIL4z52MWKW1laeeSN9/OrQfl1c7Z0rnktHo/0chSRfR8qTL5psV
	 RmIbLVV3yCyFOf9DHq9Z5FKZQTTKRqq0qpzVlPEu2aFYHQPaHQV4T5FOTVU7hYQLC0/jw
	 YY9mX7tnPjWNbIfELdVM3b3Aa2T7dg5DLRBhvX6jIz6spbtvyw5dHaIhN0Cz1Qd6qKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490664;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4+NPZKYasntUVEXjhfBChNafPFxVyUgHVT2+yWc/oXw=;
	b=5IYtHIJFWXc/0vMxJBZ5f1M/FEZZPDs9pa3ZX2GzUg6tzHJeui79/nq+2Vd7Xu6gycZd
	 VLmCLBKolhzo1/OellzijM3KIxNlsotiSKqT+f9Ero6TNkcNTFC+D2iuVbY67mpnKdBH+
	 obSg7TntbyXuom95IQTa+xhvSgcwRDGiewC70W2XPNCe5ZsmJUfVt2lwapNJRF92BPxFR
	 SO0znzWvjdd0vY1IwWog9S3BVhu04nq4WPQl4ifsaTDa7LZQbIj7bTjNxGh9SflaREN2+
	 MDqaohFnnp2a6B74llCNT4ulJBavMM/wn/NYQZzT/Ru8GfUFkQvzIGDEqu2Jbz9+vvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=ErT+AVRf;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=RRhyjHd9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC78606A31B;
	Tue, 20 Oct 2026 10:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=ErT+AVRf;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=RRhyjHd9
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7uRBM3046207;
	Tue, 20 Oct 2026 06:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=4+NPZKYasntUVEXjhfBChNafPFxVyUgHVT2+yWc/oXw=; b=ErT+AVR
	fStGoiqy9dCKt045i8ydGzVXzF4Cc+20Ol0GJ48zSiaflzSaIlWyjAYapMiJUqvK
	JBoD24KvD11lZUmeWB98Fmws8Y98XGe7UKAXsnFyld2WM+s6bCVKIBmG5bRHPhWz
	2AlvTURsp46A/gKdynSgc/fN6C//o2DY92O+AMJSIqjo0SkKnrhET5o4sOTU4a4x
	QDWD+LV7Ppnr3XN0AHBzm1C+dkTB8A9F1HAhm9j2BVTBhqOqV1lbnD/8SJS01tCW
	/yS46o9g5dPMMUSmEvSn+TkYL2opaR/D45l/rALWedknEsUESSvqLK3Ngt2x5dc2
	P7El0dNkfKPTUvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4+NPZ
	KYasntUVEXjhfBChNafPFxVyUgHVT2+yWc/oXw=; b=RRhyjHd98qD2rc9x3PncE
	NyhL5MyStiE3dZET/c/Syqf082Dp0JVZcQ8m5PAtpSPqlOQxPuWWtMdLhOUhw8sS
	UXcHvxP3XoaCQTT5gJCwS8fuHYvaTkGuzlA73c9D372OPHNN7Dd0KB/0W3hI9Dp/
	DkoJXeF9hDB7tS8jhM+lSjY1awg/Jrel8ymoSFd5hhLZLxg8HgWwBZTnsQqUgJos
	lZi14hblYcwj/s1LLdjr/fkPkqE9A9+pjQCSZUYV5uxx5vUz304chJEhszbv0m3s
	KgaJoIhiYc8pFQE6ofB+MdH/3On8V53zWoUWonjzzy2yui2IQL8dYssJgL7AAcW1
	Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hdw6ajn8m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 06:03:51 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cS1+htAJurniTa9OsQaR66F6GGD1ZHs4d1WiEXvs+D6Wf9mbhGXBmRvlB2Nrm7cHwsvB3ehoGFXKQ20FI0rmbAjo1ukiDkHCtYQPyx+O8MOJkpBN1yUG4Uo4MdRsPTcszJ2dggBzca7IlcLKZWTTzOVHr+lt4BbW/uSZhB8hSijguO9K7Y1thQwYBDLnR9DB4qd1tPGCdfj52we7rxt5JP1gH/AcXe2KX/Qmm83hpte5ZA5ZPjUsQvST8ta57HrPzSZN4HY46ZTKEWeTXTF9vwLQoXWAcjCUubGbrQtoOQp1wuX2Hm2Pqa/B+bpdKdp3eqVDRMituznbnS5iGRAXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+NPZKYasntUVEXjhfBChNafPFxVyUgHVT2+yWc/oXw=;
 b=GX7Tiy7f8KrksivIgpkkIFOwZk07fhKIXjmsAznhK+jNMs/o7zLz/6P/JxuR4HGnjyRH0Z9HaBchoRD8Nz5hjVlqrC6ayZqpV3x09U2RBa5UlayJuz+1Z3QvmAjC5BMKf/72i6dgFwayDGHEeiGmUM4eFMiI0xrrZdTC6iMM8VuzpmIn5ep4XOtX88JmpX3Vi6IEoPe/PY6YZM7aMgMFpITZ3Ma37b0CBc5tP5kuXcxJALXyabMHnrX+DgKLmKCDFkY/D4PuapUVc48zcSPCe4txaZt2fUoeYmkLF3JHNNRt70FDvU9+HsCTnKc11hyYG9bu2mVTKNtylSR58e3A+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by MN2PR03MB4944.namprd03.prod.outlook.com (2603:10b6:208:1b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 10:03:49 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 10:03:48 +0000
Date: Tue, 20 Oct 2026 12:03:40 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, shengjiu.wang@oss.nxp.com,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        hansg@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH V2] reset: core: Serialize concurrent deassert/reset of
 shared resets
Message-ID: <atc4eH5JMQnquRBY@analog.com>
References: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
 <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
 <atcf1PFVcn5pdsVO@analog.com>
 <cda25e6b8be6887da0da859b748662238025c60c.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cda25e6b8be6887da0da859b748662238025c60c.camel@pengutronix.de>
X-ClientProxiedBy: AU2P273CA0084.AREP273.PROD.OUTLOOK.COM
 (2603:1086:200:72::8) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|MN2PR03MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: 85974e77-3482-43a3-b3f6-08df2e916df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|56012099006|5023799004|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	j18HVhzzL1rfw+nABodytdxqZzqKOvG1TrwHVZ5l0T7no/YwL2Yp34KRAboEYmQGqa68QpUrnxK0sc1Cv03kzk6DP3lhuJRIWxMveJ0saRGOCPbPD1BXLnhzjnfXNwfc/p9k6mPMMttRedN9OCeQ0m2w1m7ScpjyIevcpcQNElvX8Sg4fOIPIJ332cv+hpD11z9Zu/7uPzSJl9MrIxQD+T5S5lYFKHkYAJkCbRHW0Yt4pwRcSO/eHgCNevjr4NyrSTSW/3YDlZ4BqO64RATM9id6hKPSa0JEAG+fVym9DrussNhGKomRp+dF0FXobHvFVuqiW2/ZHFmbuawkjPFKQUxoGFYodoQVYKL/PkIDD+2qVMSpOYS5B+a3Chzd6kwKLfFnH4j6HioYgoeclx5UOAl4POzu1M9NJhhclxyC8oo4GBtE5Hg5wBSmzPyTW/vovXNGGnHXMtF0eqp9BetAs8Sp1U8nEuHYU7c87/g1QTmHCor2Bv3uAvuEG6E1gMuHvndCF5rV/D1v40YpOg/TBpzyGujSUtRqJDm0ZFnn9Wp5bG2j5EO+pzkjrcCdVq0MXOjx+znAJM6h46zxoZ6LrR/Z9sfW8vR77ZhRJWVJ+1UzaQA4wLxibuZl4dPh2+Op
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmhhYkhQS3hkKzdzYzdtTU4zYjZPNFYrbHgrcGpaVUYrMUxJSkp0OWljeloy?=
 =?utf-8?B?cUpsRzlxeFdkTS9lZncrbGh3dFdBTnBISzNoNU9HZGZQOEhZQXQ0eEJleVdU?=
 =?utf-8?B?ZW1RdTI1ZHp0RnE0ZC9scW8zeWJtbXhjTXRvOWtkaW1TV09tZ3E0OFZVblQr?=
 =?utf-8?B?dVJyeFpMWm1aQmVNOXEySTdITzhQTTBLSnV2aXRtaFZqc3c2dURzaWQxZnMr?=
 =?utf-8?B?eDhoQ0NRT3VuUXBEajZJZlpqeWl6WXBVdmRmbkJHZ0Y0TUtra3AxNWJCSnBh?=
 =?utf-8?B?MGVUankxaElWMlVvQUVKb1MwQlJQL2w1VFIyekN5K0pleHhJRE40VHAwNnJ2?=
 =?utf-8?B?WlduRnZ4Z1lGMUpkVzhYNUg2ZiticXkyRS96UWw0aWxBeGxQZlpWSlY5SFFF?=
 =?utf-8?B?dkZJQkFjNlBnM3RVVml3MHA0emtsbVROcGpWVFdZbzZlSHRsS1orRkNQa2pI?=
 =?utf-8?B?bHRWRlZvWjBtYm5EMXVMc2N1azJJVFJYcW42SStlUFVJTjBEcERNQ04vd1Jr?=
 =?utf-8?B?clplWHhzVVk0MktrQ2J1dkpoWjVzNGlMbm0zMXQvQkJWczVPaW9KTXdrSzN6?=
 =?utf-8?B?U3lBMUhRVms2S3ZCaXZEYWEvNnE3VUMxTWlLNVhiRWwxdFhFT21LU3BhaFQr?=
 =?utf-8?B?L0lWRnU2VFZtYU0vaHJuakVHSW5OdmlSQ08rSzVRMS9rVzJRbmtuSVVTaTlR?=
 =?utf-8?B?QTZRaHd1cmlGUTVySXovNHlrak53NVpxMjd3UTRsaTUyVk1TQlFSdThOV3o0?=
 =?utf-8?B?MTQwcUpwL2cvczhYaVZDbkZxV3J3SGUvZlFVRmlBSC90MGQzSFZKaHZqTUx3?=
 =?utf-8?B?WVlIOE94UTJtZWNXRmhacmEvQUVTNTN0Tk9LMEtqZitsZ0tUMlVnOEtKVHlZ?=
 =?utf-8?B?ZjBzczErVSt5TFlra21UclpZQVJqWHp5ajVlbHlxTzNHaU9ra2VpbDNnRU5I?=
 =?utf-8?B?ZW9pRGZMLzVRVkJxQ2hiU0M3eFNrQy9VRG5qaTVVYUFvdWJJZ1pxSE9LM3Jo?=
 =?utf-8?B?ak5iZDdaUDVVdWRvR1ErLzVhZGxjbUZ1dno0MFpNRGJyNFZtYlkvTUw3dWVE?=
 =?utf-8?B?RkZQOVZXT2tVV2JjQklSWWxiMUpvdFc4YVpyUUdFM1VWSGY1MmxwWnA4bkdC?=
 =?utf-8?B?enI2SWhyMHljOXprOXNiUXdRa3FvSG5MSWtsRXRMRFdYSERjbERJaFkyOUVx?=
 =?utf-8?B?K2RRenIxV3FnL0VTcnZOL0VPRE5SZFloQjlKZFdESy9PRklIMGRlRUppR2Fw?=
 =?utf-8?B?anF0dDJVNjFCdlE0SGIyNGJwY0RuM092eEpuZ09oUkN0Vk81SkVFVjR2bFB5?=
 =?utf-8?B?ZC9PY2RCU1NnUHdvOXRodms3YXJNSWFIOGZkZ3RWZWovNllsaDgxQWZOTTJH?=
 =?utf-8?B?N0Jja0J5Nk9CTCtOcDgyNE9tdm9ubmpaTzV5WkgwR3lvTi9IQmwrSkVzc0Rj?=
 =?utf-8?B?WS9pTGxUUFZFNkhKSVN2T2pFdm9SU2VnUnZBQTdZazFnVVVmQUxFb3FkMWlI?=
 =?utf-8?B?QUwrVFFkYTZtZkhDOFFvTVFQR3NZQlJqc1Jibk9XTzVTakQ1bkMyd2NkVkw3?=
 =?utf-8?B?akdQNklTaUtDcXp1MUpVM0FmQkRSVlZyanBaOHVrekd0RXlxRWR1djVxTjFJ?=
 =?utf-8?B?VlFyMnVqb3dWY1JIL2loRTYvYitVbllndk1MdE4vWThoR1FXYjM0bU5RQmNq?=
 =?utf-8?B?UEcxb2tYdFZNV0tPZGhab3ZOL3FBL0c4NWROeHNaWVRuQjY5YkZRYkh4VmJR?=
 =?utf-8?B?WHJDNHNFOFlob0xpRVRHT0JTbHgwZFpPSGdlQlNFdXFSbE1SbXFianovTGhW?=
 =?utf-8?B?UGY1bFVvM3pWRXdIaENudkg0bk5sb29CUUgzNytYb2ljUGE5bC9rV2psM2lC?=
 =?utf-8?B?YUVHMXZ1aE50V1lDVFI0eVJtUXNpN2lueFF4eWN5WFRPaG14bnQ4Q0dHOXoy?=
 =?utf-8?B?ZzRIK1BvWFdHcTNDcnVySnhrQllKUXBSSTc0Uk9PTUtnWEQ0bzZzY29Xa01N?=
 =?utf-8?B?MHhUZjYyK1dGOXhyVW9kQ2ZCdjh3cWJDcnJNZG84ekgrdWNWSTBvbkk5Z1JI?=
 =?utf-8?B?RFk5YmVOOTJuM2p4S1FmS0NlVExLaFZBNW05ZXRnbncwbVU1c3AzRy9STmNn?=
 =?utf-8?B?Z0picEw2TS83S2JLYXBsK2FacGsrTzNSNVA0MjlpMlN0SGFha1pJZngvc0ZQ?=
 =?utf-8?B?bHJvUlJSRElGREk5c0VhVGpOeVNiajQvMG5kdFU4TzR3V0dVVkNMSW5rU0xa?=
 =?utf-8?B?NDVBWDlUTlZHMU9lSEVTd2ZraVBHZGdnNjdkTlNpWXRTTWFxRis4RWFza3lm?=
 =?utf-8?B?YWxPZlVmREtlSVNacE1ENjdSMzBsaGhSbVVDNjNobGh0UXhCc3J0UT09?=
X-Exchange-RoutingPolicyChecked:
	Mzxw7B8PA7/VhjdC/5a5r0bumUkTEVQEkhXsljhrSm1gi0cQSHlBAmtqn6yJdNitWO+GZjZEJnbHg73BwDSmHh2863bMtAXfoMzyN6OhtnEA+RdFVpFMr9Jjo7ruo+gRIcrG1BKv18tRE3I/SjcrUK+NMv6LrfzgkuAyoFuFpVubzFwLWufTD0athGVapCjCAt5n6vHBh1Gcl7BlOw9rqpvtMRM6HtVOcjucKK+rABhOtb3AWlCxoTc3HFqRebYLADqW91JUpydxmKRc/no2o09ImdrYWTX0OV6XAZy7sZ8seY07dsNvj0FDLy1IFJRdC0EvU1K6+jcRG+KtApk0Jg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85974e77-3482-43a3-b3f6-08df2e916df1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 10:03:47.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Wr32d/s1RmFCfZfAfh44Ckojt7BnLrDOHNtBxuddfMoX+mvcb0JIWLQjEiTqiv+5diQupHGu/arAmmqWznu2XECSkAN6yhxvvbAr5TiNac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4944
X-Authority-Analysis: v=2.4 cv=G8uJgNk5 c=1 sm=1 tr=0 ts=6ad73c87 cx=c_pps
 a=jknTlamspUmmG4HRyne6iw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=8AirrxEcAAAA:8 a=6-UYu0cnxD-4WMyIO_wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOSBTYWx0ZWRfX6362xP9FHizQ
 j6xyTu9w1OwDoQfRvAEq647yAepBoTHfYXg+Gk+63OgD7qAyNThst+XkKlOx80gB3YNNGzd27QJ
 zV3QIAlhpnQRS8bpPpHQ3Ma7thIX/SE7/2aIci000ItOBWQsxF6LKWu6BAMHBoGeC2M3F7hRClS
 kfhm/M0Oy20NPnYv2J3Uummjisqt/RUVAKo6Jmp8nSClNkJis3dXTo9Fw/q9n68aookIT+ZHAT/
 G2Kkfpb/TLX/f6NISUY1ZahyXjx0GJKK8hPU3jCnxcW/epyUbqEPoki0kxFppTtsde+gQnL7f4j
 +2M+5vZ/gptL3YcuUJgTFRoIkXj0MJo89KjS9znAoDk1MS0lBijzBC81M5VWPPNRxT0mu7ZX5dX
 g1QkN6H0y44scEzgqGN1PC93gx5+83/mCc167cUxx96kizPzqmgHy8w973Rkp89fYZluk/dP7sr
 ZvqQOzL6cz+7ncK9Uhg==
X-Proofpoint-ORIG-GUID: Ql16c1NhJSqJZQhPtr84SuK-PTlYExTf
X-Proofpoint-GUID: Ql16c1NhJSqJZQhPtr84SuK-PTlYExTf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzOSBTYWx0ZWRfX9B5Wxk/y5be7
 2ZvSQe5L5tHbREKYkQraiRNQaiqlFffmCDlwIrbpmp+xaEndxXhMhNP1GHngp44USSQyN6EU7si
 7S5NUyO4+KAjxLtVfJFcZ8VXnmWvB2JgYYWRXmiZSq+TPQn7D8ae
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200039

On Tue, Oct 20, 2026 at 10:56:14AM +0200, Philipp Zabel wrote:
> On Di, 2026-10-20 at 10:29 +0200, Alvin Šipraga wrote:
> > On Tue, Oct 20, 2026 at 03:17:40PM +0800, Shengjiu Wang wrote:
> > > Hi Philipp
> > > 
> > > On Mon, Oct 19, 2026 at 1:52 PM <shengjiu.wang@oss.nxp.com> wrote:
> > > > 
> > > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > 
> > > > reset_control_deassert() and reset_control_reset() guarantee that the
> > > > reset line is deasserted / a reset pulse has been issued once they return.
> > > > For a shared reset only the first caller runs the hardware op; others just
> > > > bump the refcount and return early, so a concurrent caller can return
> > > > before the first caller's (possibly sleeping) op has finished.
> > > > 
> > > > Serialize the shared refcount update and the hardware op under the
> > > > existing per-control rstc->lock, taken before the SRCU section to match
> > > > reset_control_acquire()'s mutex->srcu order. The lock is taken only on the
> > > > shared path and only for may-sleep callers (reset_control_reset() and
> > > > reset_control_deassert()); the exclusive path stays lockless. Callers in
> > > > atomic context must use the new lockless reset_control_reset_atomic() and
> > > > reset_control_deassert_atomic() variants, which skip the mutex and so
> > > > carry no completion guarantee.
> > > > 
> > > > The op is now called with rstc->lock held on the shared path, so it must
> > > > not re-enter reset_control_reset()/deassert()/acquire() on the same
> > > > control; a lockdep_assert_not_held() at each lock site catches that.
> > > > 
> > > > reset_control_assert() is unchanged: a shared assert makes no guarantee
> > > > about the line state, so there is nothing to serialize.
> > > > 
> > > > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> > > > Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
> > > > Assisted-by: Anthropic:claude-opus-4-8
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > > Changes in v2:
> > > > - Serialize only the shared may-sleep path under rstc->lock (taken before
> > > >   SRCU to match reset_control_acquire()'s order); exclusive path stays
> > > >   lockless, and reset_control_assert() is left unchanged.
> > > > - Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic()
> > > >   for atomic callers; gate the mutex on can_sleep so no shared consumer is
> > > >   regressed and so it works on all configs.
> > > > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> > > >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> > > >   controller op re-entering the API on the same control.
> > > > - Declare the new variants and stubs in reset.h, and document the sleeping
> > > >   vs atomic variants in the kerneldoc and reset.rst.
> > > > 
> > > >  Documentation/driver-api/reset.rst |  10 ++
> > > >  drivers/reset/core.c               | 204 ++++++++++++++++++++++-------
> > > >  include/linux/reset.h              |  12 ++
> > > >  3 files changed, 177 insertions(+), 49 deletions(-)
> > > > 
> > > > diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
> > > > index 932699c57d1e..0fbc1ba92dd8 100644
> > > > --- a/Documentation/driver-api/reset.rst
> > > > +++ b/Documentation/driver-api/reset.rst
> > > > @@ -185,13 +185,23 @@ Given the reset control, consumers can call reset_control_assert() and
> > > >  reset_control_deassert(), trigger a reset pulse using reset_control_reset(), or
> > > >  query the reset line status using reset_control_status().
> > > > 
> > > > +For shared reset controls, reset_control_reset() and reset_control_deassert()
> > > > +may sleep and must be called from process context. Consumers that need to
> > > > +operate a reset line from atomic context can use reset_control_reset_atomic()
> > > > +or reset_control_deassert_atomic(); these never sleep, but do not serialize
> > > > +concurrent shared callers and so do not provide the completion guarantee of
> > > > +their sleeping counterparts. The underlying reset controller's ops must not
> > > > +sleep when the atomic variants are used.
> > > 
> > > On second thought, this change lets reset_control_deassert() sleep, so
> > > any driver
> > > that currently calls it from atomic context would now block. The new
> > > _atomic() variants
> > > let those callers opt out, but I can't tell how many drivers would
> > > need updating, and any
> > > one we miss is a silent risk.
> > > 
> > > Do you have another idea to fix the concurrent deassert() problem on
> > > shared resets
> > > without this risk?  Or should we go back to the original proposal?
> > > https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/T/#m66615477929b38f788d6d22a2c0bb9ca62173e89
> > 
> > The reset core could borrow a trick from the regmap library, where it
> > uses either a mutex or spinlock depending on whether the underlying
> > reset controller's ops can sleep or not. Check the struct
> > regmap_bus::fast_io member and how it's used in __regmap_init().
> > 
> > It would also allow the problem to be fixed for atomic users. Right now
> > you still have the race even if the underlying reset controller's ops
> > don't sleep and the _atomic() API is being used. But if you know that
> > the reset controller ops don't sleep, you can serialize shared reset
> > control operations using a spinlock.
> 
> Yes, that sounds like it could work.
> 
> > With the above design you can leave the consumers alone and drop the
> > _atomic() variant of the API functions. (I'll also point out that adding
> > sleepy/atomic-awareness to the core would open the door for consumers to
> > report their requirements, e.g. that the reset control musn't sleep, and
> > for the core to validate this with the properties of the consumer.)
> 
> Adding _atomic() variant at the very least would require correctly
> setting can_sleep/fast_io for all reset controller implementations and
> making sure that the sleeping controllers throw an error in the
> _atomic() API.
> 
> > But... it requires an audit of all reset controller providers in the
> > tree, to see if they are atomic-safe or not, and report some kind of
> > .can_sleep property to the core (like regmap's .fast_io). I have a
> > feeling this is still more straightforward and less error-prone than
> > auditing all the consumers.
> 
> Seconded. I'd really like to move to an API that visibly separates
> exclusive and shared resets, as well as sleeping / non-sleeping API,
> but I'm afraid that would be a lot of churn.
> 
> > The other downside is that it's not a simple patch which can be
> > backported, which might be what you are looking for.
> > 
> > Any thoughts? I can also help out if the idea seems good.
> 
> How about adding the can_sleep property, setting it for reset-gpio, and
> adding the mutex first, and only then adding the other reset
> controllers and the spinlock. That could allow to backport a relatively
> constrained subset of the change.

Yeah that makes sense. Shengjiu, if you also agree, I can pick up the
second phase (tree-wide audit + spinlock variant) if you don't have the
time. Or Philipp, do you think it both phases should be part of the same
overall series?

Kind regards,
Alvin
