Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793368297;
	b=rGhqfG1Bb3VQFnr8HPtVELkk7KtcE+OCuQiOkMMoq17MIVdNtEinti6gy7RZdK3Vjjh6
	 RiyqCDeLS5zloHof9l+5s2fZ9+H2x7qsXeR8ffYkEt8EIz5mE81yQq+bpB2Hd8O1UjA0c
	 GquiqX75jf09lE9M3ZfI81MAugO5Ph5TIIneu/Sfrnp2SY96di6z3jE9v+UPv0jWqxAR1
	 yC8EjSySaJlm13gGWO9LXPy1qGV7KU4ciO+eq5dxwM1uz5LE+4LP+hrgNVsttyGNAegXM
	 bgJnvNuCCtMXD0TSkN+9PIVeT1FGz2nHxh3dlCtO4RP4VxjdRKA7XXwRrvEEoAV3H1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368297;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
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
	bh=S41vT5KM5Ywd5K7UdYhAbot2vh+9ZS+MXvIlUSzEDFc=;
	b=u+rYtbVzx54KRll+QUzR0UWH/uXFqN4cDGMCcQ5IMX/JSJZnHriXhW6GnciqF7id+bUX
	 omhObuL2QuxVZ5+Ag68SfqKEXhSOBpt4IbNes1zB2rrS/XD9a59ijaPo/CKPMMU98ztrM
	 sn/UzX/dw1uszsMJRnpOGYQGpxXfr8M0c2QflBuqB2jHNUOEdefhBgHIZ+YmryP0Ph+hK
	 MasqhdCXdB5z1Q8aONs7yxzoN7T8GQm08KD9r1LRYjsRzZlAokAYzj5+ab0tNQ4ib13ZH
	 hRL/NT+zEVX1mTkps5izDMG3kjYakBSt2QNl/ul3K3yskjRmC2g6SDjO9Bwa2deq8yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.116
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020116.outbound.protection.outlook.com [52.101.195.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8060A260E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A8060A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJAs/P1jpjqd+IaeYKcUcPk98imAVGFzRzT50TyU1yrjDphJp9L9nFPjsw/kz4IjvFrxV1NDhYGwZzGN9MkI+EasY2hG/7DP4/QrO6VGo7+/fmIlKNtm2EUyZTSjiy3hw3zSKgWP/KcXQBdz6Kma6nQGRBW7pXPm600OPNEKoH9VLyaexxdewWar/5AvF0lDGAnTvU6qfAAE0WxnTXbpEv3i7kbmyoE9DKbiDcOOtrTwmECKGnQNdwUIFbZSt5ec3qwvYKYEyt4q60wTkC+rycS/fviFZKcZ9JJ+NNZpxJExXmMKWB1VWTRHYLvxa4EDYbx6rGEey8s4vUoM17KDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=S41vT5KM5Ywd5K7UdYhAbot2vh+9ZS+MXvIlUSzEDFc=;
 b=DmYHYtbEhafoJ/gji19SSuH65E/PUzl4E6BFEl1XmFS50PGS9mfcn3HiqKZWxDwsNcyzQFbQqYCKC36dl9TwYXbBsyARE5vG5yGMQd9JZt1/Ztsjb32K6lWv3/zvedj3+E+JAdkfiHjoECSiRaGUIonKQpDv5vsLaEGICGUMC9F4eSxXB3GuFVhuHtl0x8AI6MpKICJJ1wFXGSevnbHe9L3FDCl60+dusSzDX8pUyk+AZRGWwXDrqk6tMbnwdbQAnBLb274gNDFNoXVylarZBVhVjZA0FfENb/TKavBYJduUbTThgSRb//e9Eehr5x1Z4JICq3yQegbEarg+zCZO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOFP123MB081075.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:702::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 13:51:27 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 13:51:27 +0000
Date: Fri, 30 Oct 2026 09:51:23 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, paulmck@kernel.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 tip/sched/core 1/6] sched: Annotate rq->rd with __rcu
 and update lockless readers
Message-ID: <jq6e6gwgc67b3bsptar6cmi5kftnivclvmv3wmr5fmjmhqawhg@fkdniyyzjw23>
References: <20261030013817.753804-1-atomlin@atomlin.com>
 <20261030013817.753804-2-atomlin@atomlin.com>
 <848a0612-61d4-4f59-9f39-e7aaaac7cb5b@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <848a0612-61d4-4f59-9f39-e7aaaac7cb5b@amd.com>
X-ClientProxiedBy: BN9PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:408:fe::9) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOFP123MB081075:EE_
X-MS-Office365-Filtering-Correlation-Id: 4652ec66-77ed-4a9d-1a8c-08df368ce498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|18002099003|22082099003|56012099006|4143699003|261026121527099003|261026140227099003|261028144727099003|10067099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	8KNXj7yFW3+X+YXz6AWsAU5j6/AgRfPxEAGoFFljtjBLW+p+ePPAxRqG6FOo/tXStaaHev3ZJZcrPGaCFyt4Elbd1bpijpQ2RfuDscRhlXS21MSvCluSVC62klqflD7KWvDkmHgxdzu/vDozD17+L4k1UMmh85iyNUbtvP9L5df9Rpjc0vXdMIFGbFTSWbMwnr+DAm0w3APNRHIfIIi1wtUbvt5Lx/HakY1pfDT+bUYx+T5huYXR2U2bLr4P2/urmmqhe71HjpsGudyhUpzH5gwjBZCvSS7w1/wEosT6W7IjG1dq1hBYz0NQOSVh/cwNBIu4Vsa4cBIsjbhZ6d6mUW66Bm3/oYatf5L1ZtPF6jLgkBL2nwfXJ5cKkpzyvDMSgrMHcpJkoNQKfpmtwIo+XSUZ5xSUdp//TXqi1jXtP0j6nR7t4OsJ4/EHRy5qpiW/loKP+n/5myA6/A8JQQxQeScERiy9dXQD+p6famg2WQdnGUGr/GBWnYH7hPKHv/3q/HD9NznRv44wQXDsS5xJyNFomv0Pw3tVgn6ghjYWYE/u3Ad8ONYqBtmWx4YrQYj/pRPhy5Gkur/jb5lukLZJSigDkq04ka6POORYFaKoEqXccP6K7mVHlbA9DqfQW3/3Ma4TniCWN+f68jl/D6fh5Sf9Eri28V7VvM+S/ky36gQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjUxZTFvRDVQQlFCUGdZU0t5d1NERWpQOHNMK0JEYytQTU1lOGREejVxNVpv?=
 =?utf-8?B?SUd5Y2ZGeE03NzhlaGsrdGVhY2hIbGxGTWhXdkxKcmRhYldCNElmWjFKSjAv?=
 =?utf-8?B?VC96Y282QVBLNFQxN0RoSHMwWW9CSXVGYXNuOHRPdE9HQnpuZTAwazdQUGc5?=
 =?utf-8?B?SUcvNVpqVTUxelZQMUQ4MS91NE5pUkk2QkhCbkxreXQrS09XS2xQeUZMKzRT?=
 =?utf-8?B?aEZjY1h1akgrL3pIWk9jR0lLUTUvMmZJR1VaazMycWNrU1FvUFdUTE54clZq?=
 =?utf-8?B?SUNCVTV3ZytUOFQzSUY0ZUh1QzVlU3lJajRhbGlYNWEyUDJObGpJdnBFKzRz?=
 =?utf-8?B?eUV4ZGFxNWErTENKbU9hV2Q2ZS9GeHcvYlU5NVJnLzdCNDJFVW1tK1ZWbE9o?=
 =?utf-8?B?OXd4SnFNNHJmQVU5clpQQ2ZQWWVuOUM4T1d3SmEzOC85b0lDQnJkMnhUZVdN?=
 =?utf-8?B?Um55SXFVV1hBWHFBZXFWQTg1Nk5mMmhySmNaZTVwVnZldGJJMWIxTkh1cnlZ?=
 =?utf-8?B?bzhhRkxqcis2R0JIcUxiOC9rWng2b3I5WVQ0ZmkrWEgzb1NmMWRNM21lcUR2?=
 =?utf-8?B?N2VKK3g4NkJYTStCWFFJenVwK0dGTGxscG42Z1I1WlVtQUFzWkYxUzlKa2RL?=
 =?utf-8?B?cXAwQ211VkFaWTZmbEJIL1ROU3kydGFwMUV3N1grMkpaVDNveld2TzJNSXlu?=
 =?utf-8?B?aVVPMno4MElDTmQ2aVRjZlp3YWNDLzJ1bzY4OUlNNmZVWGovRTlsemVoOHBJ?=
 =?utf-8?B?aGxwdUlydVhBUmFTWmM3ZWFWNFE2VkdSc1hTRG1VWXJDKzVkUmdBQjcyK0sz?=
 =?utf-8?B?VXJleVBBUWNjdlNGeXFBZTdvVEFSQWdIb0JydEhMQlYvM2N3d3dxV040SUdF?=
 =?utf-8?B?STN1VlJyVkFqRlpLcWNlUjY2UTZrMjRiSmovcEhLMWNnTldtMFAyODRtdlRY?=
 =?utf-8?B?dW54QmFTM1VhU2lYWjJSVFRiWFdjOGdIYVJ3QWg2SjRXWmQ3SmpOZEJNMkpN?=
 =?utf-8?B?ZGZqSS80YStKckZJUU13WXZYaVhvamxuSWdEeFBMQ3AwbUNkL2ZhOUtuUUJS?=
 =?utf-8?B?VU1iK2Y1Q2QyWUxLSGdpZ1BwbkREdHNsMVRYVW51dk1yR2NMVWw0c2RsV3Jk?=
 =?utf-8?B?NG82NngxN3FTR2ZSVG00d2xSenFlaDV3RmlCVmhTYXVLZkZ6OGo3T0R0cFFw?=
 =?utf-8?B?V0M0ZHJoS21pWlJvaitaMkdMY0ovWkNKQmxPOWVSdk1tdXBHdVJWQ1Jpbnpw?=
 =?utf-8?B?Y2JobGhQMHhia2xZc2ZDT0RQb2tnU0FxcWtTZmJMdy9pZjRyelFSaDhBUW1Y?=
 =?utf-8?B?ZjMxTHpJYkVScmhnUTZTb21sWEJCQVNvRnlZdXJrbjZweDdkZlBDaXViZFcv?=
 =?utf-8?B?U2ZON1kzd2loVXBBRktyRGx3N09rOWNGR2NQczRLRkVJajVLRkg5c2RoY1Nk?=
 =?utf-8?B?Q0I0UnFkbERoTGFURDV3c2NDRXN6VkowVXJocmxOMUlabFlPQjlvbWdTbmx2?=
 =?utf-8?B?blRuZ25HKzFnZlJ3VHd0TENOS2NyWUR4NXhsWVVwbkxUNXFTMHlkQzN5ZFdO?=
 =?utf-8?B?ZnlIQlp6U1JDQ2pHTWw4VGh2M1BRTFpHcER0U1htTi9BUTVWeTRUSWdhWkNp?=
 =?utf-8?B?TGtsaEloakF6Nmc1YTd6bk1MN2h5MkVUTUZTQzdmK1dCNDRPZ0l0UFo3SzZZ?=
 =?utf-8?B?SUJmUHROWnYrbUxxT0kwZVJmTVNkTVRIS0lZQ0tUTFZrQWVEOVF5NUlTcU8x?=
 =?utf-8?B?ZG5RcURqM0o2VzdkRDNHYkxoU3BnMU83MXlkWW1BSHJnWDVOS3habTB2R0RU?=
 =?utf-8?B?V2hEV2hvMGZDQUUvcUtsN0hMU3V3S2g2cDIrZXU3SS9NZXUxTCtXcDIrMjlD?=
 =?utf-8?B?cTh1WUdMaG9sTFkzbnExS1JvRHp4cEszU09peU5nWDVRZlFXOFptSmhNaHcy?=
 =?utf-8?B?VUNLZFdNZkVzekhsTEo5dlljaUkxdXArTlRrSG1zOTFYaVJ6STNPV3RKdDYr?=
 =?utf-8?B?bXUvOUpXN0xhbXI0TjVZeDBKanc3MTRLUDVNM1pKSk1XYlFhb0cyYXBMS09R?=
 =?utf-8?B?ZS82Z3FaQkR3L0tZSGZkZHNVT2drNUIvdTZQczhyWkJnNDBiZDVYZm5ydjZ6?=
 =?utf-8?B?WldSck9hc25XWndhRjU2aG4xMzFQSVdiZWFwKzdPQTlKNElSbDU5YVl6S2Ir?=
 =?utf-8?B?eGdXQ1oyai9md2FybUw2K2VJVzc4Nit1ZExFcGVUZEFQMk44MmtTWE5rdTR0?=
 =?utf-8?B?T1ZwZWFmRVdVWGFibGNvNFFsWXRDdjVIWVBBQUJoZ1RYMkkzcTBzaGh4MHMz?=
 =?utf-8?B?ZHNJTnc1UEs0M2hUZHlPRllIVXFHTGdmZk9CektGNzM3SU1PazcrQT09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4652ec66-77ed-4a9d-1a8c-08df368ce498
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:51:27.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSBST3NfdxP7PMy+1PLJx+QeBLApN9mInyjWyiZlK/+m7KSdW7cLdvUrJ3zwMxPsFz+BhW9UnTBqoVNKi9DOjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOFP123MB081075

On Fri, Oct 30, 2026 at 10:11:12AM +0530, K Prateek Nayak wrote:
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index d7c3b43158de..4ead07fd0f6d 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -8542,8 +8542,10 @@ void set_rq_online(struct rq *rq)
> >  {
> >  	if (!rq->online) {
> >  		const struct sched_class *class;
> > +		struct root_domain *rd;
> >  
> > -		cpumask_set_cpu(rq->cpu, rq->rd->online);
> > +		rd = rcu_dereference_root_domain(rq->rd);

Hi Prateek,

> 
> nit. Using rcu_dereference_root_domain() everywhere is a bit mouthful.
> How about a couple helpers like like:
> 
> #define rq_rd(rq)	rcu_dereference_root_domain(rq->rd)
> #define cpu_rd(cpu)	rcu_dereference_root_domain(cpu_rq(cpu)->rd)
> 
> ... and those makes the usage much shorter. Thoughts?
> 
> I've attached a coccinelle script at the end that I used to do the
> conversion.

The explicit name was chosen deliberately to mirror
rcu_dereference_sched_domain() and make the RCU read-side critical section
requirement unmistakable to anyone reading the code. I believe shorthand
accessors tend to obscure those synchronization requirements.

> 
> > +		cpumask_set_cpu(rq->cpu, rd->online);
> >  		rq->online = 1;
> >  
> >  		for_each_class(class) {
> > @@ -8557,6 +8559,7 @@ void set_rq_offline(struct rq *rq)
> >  {
> >  	if (rq->online) {
> >  		const struct sched_class *class;
> > +		struct root_domain *rd;
> >  
> >  		update_rq_clock(rq);
> >  		for_each_class(class) {
> > @@ -8564,7 +8567,8 @@ void set_rq_offline(struct rq *rq)
> >  				class->rq_offline(rq);
> >  		}
> >  
> > -		cpumask_clear_cpu(rq->cpu, rq->rd->online);
> > +		rd = rcu_dereference_root_domain(rq->rd);
> 
> nit. If there is no rq_lock() / rcu dependnecy, maybe you can
> initialize rd up top where you declare it for.

Acknowledged.

> 
> > +		cpumask_clear_cpu(rq->cpu, rd->online);
> >  		rq->online = 0;
> >  	}
> >  }
> > @@ -8572,10 +8576,12 @@ void set_rq_offline(struct rq *rq)
> >  static inline void sched_set_rq_online(struct rq *rq, int cpu)
> >  {
> >  	struct rq_flags rf;
> > +	struct root_domain *rd;
> 
> nit. reverse x-mas declaration style would be better IMO.

Acknowledged.

> 
> >  
> >  	rq_lock_irqsave(rq, &rf);
> 
> ... and since you are touching these bits, maybe you can also
> covert these to guard(rq_lock_irqsave)(rq) and save on needing to
> have explicit rq_flags.

I would prefer to leave this out of this series and keep the scope strictly
focused on the __rcu annotations and lockless reader correctness.
Converting rq_lock call sites to guard(rq_lock_irqsave) would be better
suited for a dedicated, tree-wide cleanup pass in core.c.

> 
> > -	if (rq->rd) {
> > -		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> > +	rd = rcu_dereference_root_domain(rq->rd);
> > +	if (rd) {
> > +		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
> >  		set_rq_online(rq);
> >  	}
> >  	rq_unlock_irqrestore(rq, &rf);
> > @@ -8584,10 +8590,12 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
> >  static inline void sched_set_rq_offline(struct rq *rq, int cpu)
> >  {
> >  	struct rq_flags rf;
> > +	struct root_domain *rd;
> >  
> >  	rq_lock_irqsave(rq, &rf);
> > -	if (rq->rd) {
> > -		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> > +	rd = rcu_dereference_root_domain(rq->rd);
> > +	if (rd) {
> > +		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
> >  		set_rq_offline(rq);
> >  	}
> >  	rq_unlock_irqrestore(rq, &rf);
> > @@ -9009,8 +9017,8 @@ void __init sched_init(void)
> >  #endif
> >  		rq->next_class = &idle_sched_class;
> >  
> > -		rq->sd = NULL;
> > -		rq->rd = NULL;
> > +		RCU_INIT_POINTER(rq->sd, NULL);
> > +		RCU_INIT_POINTER(rq->rd, NULL);
> >  		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
> >  		rq->balance_callback = &balance_push_callback;
> >  		rq->active_balance = 0;
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index c0ebdcde5fe5..2dcb3722c317 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -122,12 +122,12 @@ static inline struct dl_bw *dl_bw_of(int i)
> >  {
> >  	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
> >  			 "sched RCU must be held");
> 
> Do we need this warbing given we are using rcu_dereference_all_check()
> which checks for RCU too?
> 
> > -	return &cpu_rq(i)->rd->dl_bw;
> > +	return &rcu_dereference_root_domain(cpu_rq(i)->rd)->dl_bw;
> >  }
> >  
> >  static inline int dl_bw_cpus(int i)
> >  {
> > -	struct root_domain *rd = cpu_rq(i)->rd;
> > +	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(i)->rd);
> >  
> >  	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
> >  			 "sched RCU must be held");
> 
> this warning may not be required either.

Agreed. Previously, rq->rd was accessed directly, so that manual
RCU_LOCKDEP_WARN() was the sole assertion in place. With
rcu_dereference_root_domain(), rcu_dereference_all_check() already
validates that either RCU is held or sched_domains_mutex is locked under
CONFIG_PROVE_RCU. I will drop the redundant warnings in the next iteration.

> 
> [..snip..]
> 
> > @@ -2167,6 +2167,9 @@ queue_balance_callback(struct rq *rq,
> >  	rq->balance_callback = head;
> >  }
> >  
> > +#define rcu_dereference_root_domain(p) \
> 
>                                        ^
> This argument here can be 'rd' for better clarity
>                                    v
> 
> > +	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
> > +
> >  #define rcu_dereference_sched_domain(p) \
> >  	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))

The parameter name 'p' was kept intentionally to maintain 1:1 parity with
rcu_dereference_sched_domain(p) immediately below it, as well as the
general convention used across <linux/rcupdate.h>. Keeping 'p' preserves
that consistency across sched.h.


Kind regards,
-- 
Aaron Tomlin
