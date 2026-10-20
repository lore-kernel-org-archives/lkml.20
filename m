Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792502963;
	b=13i1fHCDrxHoGjehpqcClWmv/+wLfX4Qyp9C53GXDRPrwtXnxJc8P2ADXa8DFmwJkj5R
	 A0lrHPJja98R9tv/TYUIhreX2uKwS0lRXX55HFTFJ89LJruIp9WoewbHGLQlDZW5FMjDI
	 oEk9AZa8p+ItxoG2fwx5RKV27H3VInFD21wfhY0XCmxs52K/mFUA27zKbjeaY40ApmHKC
	 8j4vVE9n7LL35Ue8LDwcq/FHgOF2FwnojeaoXfcyOnov4ZxT2KNYIHZ0/fhro86mC8VGO
	 hcw/77aOe4d1y/0XZY50X4Ci9Z7NF22vKU7UwZahKLHomTvgEsd9Qg7jajs3HrEhufw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502963;
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uC6awCZLEnnWRDtNowUrJKpjcfJxJqSbc7BUJnbDBIQ=;
	b=3XWf4kuJ8iw0Z+TabrDbJfVYG1gj9oS2Vj4imgul4/i1OpCgnmLH4yT/gY8xxt4hLNBH
	 kDvnz/mi0vRcNiwz43wYaow6JDaIeO5WPJW7OTFxoNxVPeyLFqj7DawdmgAHtrGWdhSxl
	 NeAEcODW0Yhj3X/fa976mdkE3FlUnBgBw4BbN7feDFQ7h7ZuLOnXdHq6yW2C2MrYekhyp
	 fTH/e23eF33pBPEGLPQOlXAhzObCEw+NdNvyoK9uNyC/g5rC95RzYw8YRVZiBGPQRC9pe
	 ejWbT1YnHsSpxMJeJr2MJ6StOJBx/3Y1i7sHfxrrBNvaSp2CWycEsjmw09Gj7LMz90A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=sJRWFA41;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=w2wNMEsn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFB606A31C;
	Tue, 20 Oct 2026 13:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFFB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=sJRWFA41;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=w2wNMEsn
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDCtRZ3845080;
	Tue, 20 Oct 2026 09:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=uC6awCZLEnnWRDtNowUrJKpjcfJxJqSbc7BUJnbDBIQ=; b=sJRWFA4
	1b+1GoBZ2K9IaKsKemtjlXohJnbtB80BDzhcmHlgc0smNUtB3I2piM6BKsR2Cj9o
	Y53jc1TzvytIn0GMc1pjUjegbvN061V8C+JihCVyjbO4L1Z9mp8JL3vhi4GRHKBp
	ek8l7Z7EDPPOZtg1Wfay80PrZzYIGv+rJN6CAL/OPsu2FZW4/7pNd4SRsKp8Lqck
	j2Q8RICEFC6YVcSPoifCv4+SgoQcseAXTKWFmph49bRLw3OmBNY7Wn5cfNO3BW+B
	cHj1YX/hJu6iVFxVs45gqHbXOk8Y6X5xGXHB4bli+w17qiNHLwfF2fjkGq7QtnVd
	5PF76G3btLdoWHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=uC6aw
	CZLEnnWRDtNowUrJKpjcfJxJqSbc7BUJnbDBIQ=; b=w2wNMEsnjVQRMe9mLxek6
	d71hk9l1Dd0bpwmGoc35aB26LfNLXNFVoLpqWACYgRW20wQYfZ34GdD/mQfvwM7k
	7uscSP7JcCGgXxnOOOTSGdUtxGjFUrRehV5E4yrM+mg+Aa+CJgTOWsWxMcos5e0d
	QXFVQlTkqiroa/vtsWMB8mei+bltSfPKL7Z9N9TsnriiaKr+Y4ElwUmx1K4TkfcF
	gNos6Bi/yhl/NGPv7C4ayJmaOniQSaqBtIm1xJ8U5xt8alT4bYBlhwKQwbvXX/Mt
	PBqu1U2aLjtgqjshiWOiTka5uEF2kc3kZUrtUbsCyAXSNip/6T4Fh5bjG765l+ob
	w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hdw68uss0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 09:29:00 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmCSrcMBA8bUVfOkzC9yYfgB64BaYpwVx4LtLOMeWyVUrCivxmNupBiEwHlhN30Fu+SKVI+n7lUMqv+Y/Ux8W56pSeWxaV8plv4gvC+vj/TA+l/XsIoBwHegI2ZbDMtEtNrFfp1Z/4cMNOHWXRvVsXoPc5zgUMpezOGjRA/LjANIFU7lgoI6dzUPfYmdY1qo1cPour2kMFWM+LFQYsHrsKuJXMBV3R0JgWkPAf/23nTabGVU0vBkV9eAl8/j2zPkhn8quDpAGNZnh7L2qNHXOpqV3oxeVW4R/LqqdtoH/Az98dVlWzh69+dTzcQFOhrPdvTb/N6jOBryJ6A2/H3F0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC6awCZLEnnWRDtNowUrJKpjcfJxJqSbc7BUJnbDBIQ=;
 b=BbzQGJdnZAbatlJBRHPP4JK/xawUvnUG6aI6SXjmzzkDqYD1e1yAdoVMoN2sCGBsl70BNBqJmD/ksVFTmnUjvbjm3jkZvIkjo7KueCnMEF9QEoJ/jl7iCfGvUNRjy/8jB7jAB6fI4BFwz8J68PCTx2TawHQJt0ac83pjR8oQIruVsjqfoYUeOV25H8eE3VdvrZ9lpzEFCBIvA62rYWkWpAjR48GQiZjK3Q50oh+0kD+rea86ggcP4BzdipFvzMSDwhuIbBf9YWQOknh5A7wjGvRfStxrCbrkgB2G05WQsD+2DopG8JF5nv6cT7mizQBjo/V9XMmaNiE1Iod6H2Nn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by PH0PR03MB5829.namprd03.prod.outlook.com (2603:10b6:510:35::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Tue, 20 Oct
 2026 13:28:58 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 13:28:58 +0000
Date: Tue, 20 Oct 2026 15:28:55 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, shengjiu.wang@oss.nxp.com,
        corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
        hansg@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH V2] reset: core: Serialize concurrent deassert/reset of
 shared resets
Message-ID: <atdsZNZYGtT4Ob-M@analog.com>
References: <20261019055301.3234571-1-shengjiu.wang@oss.nxp.com>
 <CAA+D8APDSYbzX3S9RuLinoPiuqPHEX+L+-ZcSg-RtxxaWyvrJA@mail.gmail.com>
 <atcf1PFVcn5pdsVO@analog.com>
 <cda25e6b8be6887da0da859b748662238025c60c.camel@pengutronix.de>
 <atc4eH5JMQnquRBY@analog.com>
 <CAA+D8AO=OpHDMOuzTSeXuUnGKchAjrpUTfzhpCDc=nXPV=aRbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AO=OpHDMOuzTSeXuUnGKchAjrpUTfzhpCDc=nXPV=aRbw@mail.gmail.com>
X-ClientProxiedBy: MM0P280CA0062.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::16) To BN9PR03MB5977.namprd03.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|PH0PR03MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 04578209-217b-4447-a1f2-08df2eae1866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|7416014|6133799003|22082099003|18002099003|10067099003|4133799003|11063799006|261009223027099003|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	QbMECPMTys8kFJZuXpoBj92uuLeoJQ7HQZf9crSUX9ci157wAiBm3EhI1fX+jFYeVJdCXq0NkYyATt1yhNdikjl1ZHBzamQLsXHGA4pOb+ldRSyo3d6dz6tdaR42QiS7gKw/EfU25ZJf2pmdA0qokspegjm0zVMnnBucC/c5t7pihKEuu6bxVI4Fr/ii4QrS8nwsgrXVjMxSA86lNdFjQDsj71qdzA8LezQTobvPsqPL3I1OTbBamwuG8sV8HXrQZTykw+BD4n7eP+6FolFHskQZ75vDZbW6tA+rilin+F12yBVZaEfrjjmI9E2k0+0O3UWV7BYkRBLOP9PJfS/ZHsis9Z4Vu3RyTqBL1NoIvbtyT8qv4cDAiiPaakc6O9vjXuIwHQpWfZeB/x0fGmahuBNFn/WsGU8IxorSTJ0GKAwD1OmxMnnicxy0xt4Q8+LfTVbiSFA+nN/FauWbWyRVK2vi2rQBOqqwRxiYLCBcbuppWX/FK7IJFwPcOD3Uoo5gEU+WaU81fxLfYLUs+ogCozbf/ztU9eByb9NQOM8pe0a5qXTnGYMLz2uz/et47BlvkME9C2dQ0Rqk98dEHA36V+4IbiZO/sJzM0oat5ow1pzHMKGNpyXJS8fs7wx8+BS5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(4133799003)(11063799006)(261009223027099003)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3BZZExCV0NsZDZWR2dNWVJYbW1sb2MyTzhpQ3ZpT1c2M3gzZlRSN1VXUUxr?=
 =?utf-8?B?ZFZ5Wll3bzVLMk84cDRBL1hTK21Ua0tHZTJkcTl4NzE1b0ttM0pGQXlkRzBY?=
 =?utf-8?B?blZNQjdEMlpibGQzRk1KRS9EbkxCdXBQN1FWazh4eVpvcXVCOEE0dmgwMmZO?=
 =?utf-8?B?dHhBcEZKWW0vSWdabm9YelI3V053eWhMbmQxKzUvUXA4Y29rYkwvNU9zL3Zi?=
 =?utf-8?B?a2hkUkZHMmkrUlNiYW5zL0owNFU4dURBMUNSM25oYkZ0SWlHYUVWenBQUXkv?=
 =?utf-8?B?QzFxNk8vNmlKTUZrZnlqVWx2M2F6Z1FncVdHbFZtOEZUb1B4ekVRZG5lTzZ0?=
 =?utf-8?B?RkxqVlpzeTBBUGFNa3JtTE1QZHRuRWVmY21PMHBYSUNLcmc5MEUzTVhzYUQ5?=
 =?utf-8?B?a2FyTmc0QzY0YTJVekw5SE8vSVk4ZG5pa1dBMERFS2pqY0U4djNPcUFDdXda?=
 =?utf-8?B?K0w4MWE5bFRaRm5KMHAwVWdFRkhucy8zbE02NlplUkxrV0psckNaOEpTUlBr?=
 =?utf-8?B?ZTFHSEpDS2JnTVdKa3R4WWJCL1pZVlFZL3RDN1YyL2ZxZ0lnbktLNExvbHEx?=
 =?utf-8?B?eWVYT3oxOWFjNWlnbXhyK21UVHFqZlczaExXSHZHcTl0NUNDL2R3Zy9NbERj?=
 =?utf-8?B?WWZ2Unc0aUxTY3lXTkV6RThFMnJnMnVnTEMxVmYwME45QTV0V0ZlbUZGS3lv?=
 =?utf-8?B?aWtwam9zbFc2QWFDSVN2aXo5cTNUeFNmODR0VFU1dTRxTzQvMWtpUHJnOWFu?=
 =?utf-8?B?K01yaitRRnNKMnNPd3YzQkp2aFh1ODZRUFJRd2oyNHN3VEw2QmJ4TFRhT0xG?=
 =?utf-8?B?WXdMT1RuYWxTZjhkamRnSzJ5bDBIOGNoTXRaeGJzU1QrUEd2TzFiKzNDS3F1?=
 =?utf-8?B?eVgzaUUvVXpjNEFncjFCcjN0Vm5MS1NNdzFCUWxreHE4OTZtSnhKVmx2MW44?=
 =?utf-8?B?MDIrV0ZlMWRBTW5BMTRwcGZ1eHYxdVJWNS9DVkFNd2NiUGdqdWV6RWorbkV0?=
 =?utf-8?B?UGFrY2lBUmZRM2xNOStEVndSZEsrWUtuc3Y4RkxuMUdLZjVlTjBKTjRITXBP?=
 =?utf-8?B?ZmhlQ2hza2ZpTFVoMVRNdjF5YWhTSGZKNGtiOTRlRVNabmhrbytNVHBrTkJX?=
 =?utf-8?B?R3I4RklMTkdreEMzRkpRdXBIamNIVlpRR0lWV0RDRlV3SnQ5V1RKYmNrT0d3?=
 =?utf-8?B?RTIvbXExeHFERitTNW94OFFPVVhybXZCdXl5Q2poOEhPWG5RRzV0REdPcUlj?=
 =?utf-8?B?TFd6U3pJMjBFRXBGeU9Vbnhma2JEV3lmSks1SW1lOUVza29LcjRRb0JNM2Jl?=
 =?utf-8?B?cnFDZW1GZWlIK1JrWWc1R0xHRHBtajRORmttUVpkQXhHQ0lPWEE0TjNUSWg3?=
 =?utf-8?B?UlQ4bE5MQ1pwN3k2Y1BVREFlS0R1TWhjV0NjWlpxbmtMMStRenFCZ2VlQzR2?=
 =?utf-8?B?YUVlVjV1ZTBnZjAxeCs1dTdIM0RuR0M2U2lKV21Fb0Fsa0pESU9BUmxYY3lX?=
 =?utf-8?B?aysrSmtYa29iMGFXN1dOMkhsUjZpMkN5Rk9BWlBNL0lVbkpyNVhkMGUwM0RL?=
 =?utf-8?B?R0VVUnJZcUJnbm5pa2pPcGJXN09HWFE5SFhxdU1tOFN6cVVWZHE1MWowZzZU?=
 =?utf-8?B?WHpqZ1NmS1NNQTZaYkFVVWxLSks2b1F3SUxLZ3F6cDE5ZFpVQVFyZkdTb3pu?=
 =?utf-8?B?TlhmZkdVTVZkL3pKdzh4UXBYSjN1SGUrVGFZd3E3UWpsRnlSYmpDTUFSR2tz?=
 =?utf-8?B?OWdUdG1qRWUyWVF1blNjQmZObzE2ZEpuaEJSaFduZjlpOUVPcWJsRlpWV1Ra?=
 =?utf-8?B?SGoxUVEyRUpuN1N5TUFSRjFyUDlCRkgxWXRvNzBlaVJrVHk0WW1LekhhTHgy?=
 =?utf-8?B?Z3lVeWgyYmdIN2cxSjNrdUtjS3JQQlVWQlEyUXlEWHVUbEZWV1U3UU5Cb3pw?=
 =?utf-8?B?eW9iV3lqdlVFQTdXTExqSSs0Y0N0OEJneGhkMnZpRE1PNERNNEVPSmI3NE5m?=
 =?utf-8?B?Ui9aK1NXdnFZLzdEUW93VFpCNUwrT2NXSW1lZ2l0VHBnR3RNMjQ3L2xramtt?=
 =?utf-8?B?SmpkbXZYOHk2enQwbjV4ZFhyUW1WZnJudU1PUEprNEdBcGJZb1E3eEJheDlm?=
 =?utf-8?B?RU04b0hCU0ovUUwwN3Btay93ZHU1dkdaREt1c3ErMFdKbW1oOXN0Y1VCbDIz?=
 =?utf-8?B?eEw1SjFnMXZjaU02THpDS2VvNjhYT25TMWpxWUx2NGNZRXZBMTRQdnhIR0Rw?=
 =?utf-8?B?eHd4WVFIeXcrRWtFWUhHWWdIRXphZmpLc2paMHE1enFyZUgxTzVFQ0RDS0ZR?=
 =?utf-8?B?MnJHVWN5eXNUdjZSM3BMdk9sek5wU0QvMzRNYVBOMEpTU2Z5SmdpUT09?=
X-Exchange-RoutingPolicyChecked:
	CTKHD6F3Ms1rlTgBXI6bxAoMgf/mjq9TiVnYbEIHGMdeZt3pUxQGIqxYLxGUNRNw6ajkaxkeA+LCPfTaeDORWvvd5SyqQvj97Ul1evWoa5PpRJ+AHrktB3fXpaVJA8lK2F2QpX9nszgfpJ3lipNo6oP14mhBH+96TQLUq047jJsBw9GzDNqSXcyiMhLvi5lPrgtTgfEbA226P2meT5KXu6lR8tPxd30z1x3Koo7sAici35oHGdzsxaSEYXBjuj23JwhsUbLTQCko6H/jwb1ibLncPWzhDqsgzzSa8sg/NrS8LP+/nPrauzFL2wjZDK790BYDGEPJSBVq5bi1umEdOg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04578209-217b-4447-a1f2-08df2eae1866
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:28:58.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2C09PjT4JOBojYIXI1SMJZrDCaXpMjWl6wtNLJwqdhvoy53Wbztt6+6eZXNG479Az+aMRw1LHH4LVLSKwyAjPaYam7AwuojxlXYzWZDgRaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5829
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX2ACH/3Z6G4lI
 y3eNLh/hei1g8DKRtkZkK3Yrk1zcJbnT9SCKpUr4B99gEJofJvRt+u149LUVIXju9/0uSsrSozu
 L5d/dY3ih1lhI/xFenPyWNAeEKHrgca2VOJJMhlQYbdd/+EvrLvS
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ad76c9c cx=c_pps
 a=zrUOGFyhpnkGsAL0isy7CA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=8AirrxEcAAAA:8 a=cKzIFmLy3HsMhRQOwusA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: xF5mWCh2dZA2XPMXLO_rKZFn2tCSFDUt
X-Proofpoint-GUID: xF5mWCh2dZA2XPMXLO_rKZFn2tCSFDUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX2toIbfHG7zTU
 XWvsVUKs1AU/PRWLxiZTsgUKr9iZAvcJBymSHVyJAHG7J+fCFYxZYjutj6cXOiF/j5QlGoBVgzL
 Tbmqor5hggZwZJyXzmMxaJzin3DuPcIfnl6urpJ+nVpIDlr8Wyt1IbiKlFPoSzheyFvrzOsuEOk
 79bl0+5tUvIeq2EtGXBcsXYtbFkFTwoTJZQk0wJY7q3gYJ3BIVbQ6mXDmrobRuDu6P8nw4AdUMk
 iT05KK2HnNd0vnvyMDY1QIGqBiknIfxO0+xPCJOiSgyL/AM27DHQNGWqOJBwpZT3kPxBZWnPhPm
 lzZARlaGp6oF6Qte7sTBEdH2+A0ewRSpmoz9RQM+UlntTTEug56aBAYkyidHe5fh9r/TmhyfD2X
 OVNv/WCScJWbFWslnTybMg7MjMOaaDSRFKEyqjpRc7gV2kmHrkJXpa9nAp7K1xiwW0K9kx8f4dH
 2XY7TglGKQxNnPPAyfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200053

On Tue, Oct 20, 2026 at 06:23:29PM +0800, Shengjiu Wang wrote:
> On Tue, Oct 20, 2026 at 6:03 PM Alvin Šipraga <alvin.sipraga@analog.com> wrote:
> >
> > On Tue, Oct 20, 2026 at 10:56:14AM +0200, Philipp Zabel wrote:
> > > On Di, 2026-10-20 at 10:29 +0200, Alvin Šipraga wrote:
> > > > On Tue, Oct 20, 2026 at 03:17:40PM +0800, Shengjiu Wang wrote:
> > > > > Hi Philipp
> > > > >
> > > > > On Mon, Oct 19, 2026 at 1:52 PM <shengjiu.wang@oss.nxp.com> wrote:
> > > > > >
> > > > > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > >
> > > > > > reset_control_deassert() and reset_control_reset() guarantee that the
> > > > > > reset line is deasserted / a reset pulse has been issued once they return.
> > > > > > For a shared reset only the first caller runs the hardware op; others just
> > > > > > bump the refcount and return early, so a concurrent caller can return
> > > > > > before the first caller's (possibly sleeping) op has finished.
> > > > > >
> > > > > > Serialize the shared refcount update and the hardware op under the
> > > > > > existing per-control rstc->lock, taken before the SRCU section to match
> > > > > > reset_control_acquire()'s mutex->srcu order. The lock is taken only on the
> > > > > > shared path and only for may-sleep callers (reset_control_reset() and
> > > > > > reset_control_deassert()); the exclusive path stays lockless. Callers in
> > > > > > atomic context must use the new lockless reset_control_reset_atomic() and
> > > > > > reset_control_deassert_atomic() variants, which skip the mutex and so
> > > > > > carry no completion guarantee.
> > > > > >
> > > > > > The op is now called with rstc->lock held on the shared path, so it must
> > > > > > not re-enter reset_control_reset()/deassert()/acquire() on the same
> > > > > > control; a lockdep_assert_not_held() at each lock site catches that.
> > > > > >
> > > > > > reset_control_assert() is unchanged: a shared assert makes no guarantee
> > > > > > about the line state, so there is nothing to serialize.
> > > > > >
> > > > > > Fixes: 0b52297f2288 ("reset: Add support for shared reset controls")
> > > > > > Link: https://urldefense.com/v3/__https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/__;!!A3Ni8CS0y2Y!-DPstHB0ai7dP0DW897uht_CO6I0TiFaRb7LtPgEydRyEl3Hliigq6BxOLE3llSaFx-aTBDOtenncE_4XlyaU7qCNQ$ 
> > > > > > Assisted-by: Anthropic:claude-opus-4-8
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Serialize only the shared may-sleep path under rstc->lock (taken before
> > > > > >   SRCU to match reset_control_acquire()'s order); exclusive path stays
> > > > > >   lockless, and reset_control_assert() is left unchanged.
> > > > > > - Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic()
> > > > > >   for atomic callers; gate the mutex on can_sleep so no shared consumer is
> > > > > >   regressed and so it works on all configs.
> > > > > > - Factor the body into __reset_control_*()/__reset_control_*_locked()
> > > > > >   helpers, and lockdep_assert_not_held() at each lock site to catch a
> > > > > >   controller op re-entering the API on the same control.
> > > > > > - Declare the new variants and stubs in reset.h, and document the sleeping
> > > > > >   vs atomic variants in the kerneldoc and reset.rst.
> > > > > >
> > > > > >  Documentation/driver-api/reset.rst |  10 ++
> > > > > >  drivers/reset/core.c               | 204 ++++++++++++++++++++++-------
> > > > > >  include/linux/reset.h              |  12 ++
> > > > > >  3 files changed, 177 insertions(+), 49 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
> > > > > > index 932699c57d1e..0fbc1ba92dd8 100644
> > > > > > --- a/Documentation/driver-api/reset.rst
> > > > > > +++ b/Documentation/driver-api/reset.rst
> > > > > > @@ -185,13 +185,23 @@ Given the reset control, consumers can call reset_control_assert() and
> > > > > >  reset_control_deassert(), trigger a reset pulse using reset_control_reset(), or
> > > > > >  query the reset line status using reset_control_status().
> > > > > >
> > > > > > +For shared reset controls, reset_control_reset() and reset_control_deassert()
> > > > > > +may sleep and must be called from process context. Consumers that need to
> > > > > > +operate a reset line from atomic context can use reset_control_reset_atomic()
> > > > > > +or reset_control_deassert_atomic(); these never sleep, but do not serialize
> > > > > > +concurrent shared callers and so do not provide the completion guarantee of
> > > > > > +their sleeping counterparts. The underlying reset controller's ops must not
> > > > > > +sleep when the atomic variants are used.
> > > > >
> > > > > On second thought, this change lets reset_control_deassert() sleep, so
> > > > > any driver
> > > > > that currently calls it from atomic context would now block. The new
> > > > > _atomic() variants
> > > > > let those callers opt out, but I can't tell how many drivers would
> > > > > need updating, and any
> > > > > one we miss is a silent risk.
> > > > >
> > > > > Do you have another idea to fix the concurrent deassert() problem on
> > > > > shared resets
> > > > > without this risk?  Or should we go back to the original proposal?
> > > > > https://urldefense.com/v3/__https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/T/*m66615477929b38f788d6d22a2c0bb9ca62173e89__;Iw!!A3Ni8CS0y2Y!-DPstHB0ai7dP0DW897uht_CO6I0TiFaRb7LtPgEydRyEl3Hliigq6BxOLE3llSaFx-aTBDOtenncE_4XlyfNK_xgw$ 
> > > >
> > > > The reset core could borrow a trick from the regmap library, where it
> > > > uses either a mutex or spinlock depending on whether the underlying
> > > > reset controller's ops can sleep or not. Check the struct
> > > > regmap_bus::fast_io member and how it's used in __regmap_init().
> > > >
> > > > It would also allow the problem to be fixed for atomic users. Right now
> > > > you still have the race even if the underlying reset controller's ops
> > > > don't sleep and the _atomic() API is being used. But if you know that
> > > > the reset controller ops don't sleep, you can serialize shared reset
> > > > control operations using a spinlock.
> > >
> > > Yes, that sounds like it could work.
> > >
> > > > With the above design you can leave the consumers alone and drop the
> > > > _atomic() variant of the API functions. (I'll also point out that adding
> > > > sleepy/atomic-awareness to the core would open the door for consumers to
> > > > report their requirements, e.g. that the reset control musn't sleep, and
> > > > for the core to validate this with the properties of the consumer.)
> > >
> > > Adding _atomic() variant at the very least would require correctly
> > > setting can_sleep/fast_io for all reset controller implementations and
> > > making sure that the sleeping controllers throw an error in the
> > > _atomic() API.
> > >
> > > > But... it requires an audit of all reset controller providers in the
> > > > tree, to see if they are atomic-safe or not, and report some kind of
> > > > .can_sleep property to the core (like regmap's .fast_io). I have a
> > > > feeling this is still more straightforward and less error-prone than
> > > > auditing all the consumers.
> > >
> > > Seconded. I'd really like to move to an API that visibly separates
> > > exclusive and shared resets, as well as sleeping / non-sleeping API,
> > > but I'm afraid that would be a lot of churn.
> > >
> > > > The other downside is that it's not a simple patch which can be
> > > > backported, which might be what you are looking for.
> > > >
> > > > Any thoughts? I can also help out if the idea seems good.
> > >
> > > How about adding the can_sleep property, setting it for reset-gpio, and
> > > adding the mutex first, and only then adding the other reset
> > > controllers and the spinlock. That could allow to backport a relatively
> > > constrained subset of the change.
> >
> > Yeah that makes sense. Shengjiu, if you also agree, I can pick up the
> > second phase (tree-wide audit + spinlock variant) if you don't have the
> > time. Or Philipp, do you think it both phases should be part of the same
> > overall series?
> >
> 
> Agreed on the phased approach. I will send the patch for phase 1.
> 
> Alvin, please go ahead and pick up phase 2 (the tree-wide audit +
> spinlock variant) - I'm happy for you to own it.

Sure thing! I'll wait for your patch(es) and build on top from there.

Cheers,
Alvin
