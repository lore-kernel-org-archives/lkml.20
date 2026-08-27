Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021107.outbound.protection.outlook.com [52.101.100.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8041F5CC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824454; cv=fail; b=aLc2JaB3JaBS4sm8avM903uqLc48gS9XV7c8DrX5Ifvs/6vFMV0peyvM8g3yZCFcm1fnDXSXf9OlVOVQcwMOCXg9jZ/M8OoIZv3j72yiYH579hqGEHMjrR0FbfJA9qOG0C/n8G72JyxqLtmZka6CNljg+41lnjgDHr7jJ4SFI7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824454; c=relaxed/simple;
	bh=ZVskFCTmwjOb8pyVRtHnKcSJD7GfOtNlu3sQDNN+uPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kuZQ2AwANl4SC3fseQ8KxuTWbtYpn02cj0Cx6IKrZqcWP0fig0gOhDRk0VEOc97gdT6eNmVztOjUX/V0qA5fWCJvq/Fj7FTPn032O3FKIgVdYuWxFLfWaMEyC73Qrn1pJvHPUIaMDldyJ2v2h4ZcOTCr5INwQl/hVYODwE/Xpz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGsf5eMOozUL61R/6SR1uY4AduhKYSmqMlOU9doNudlptmLaGEd+cLtcocucJjoO8JlnTZtv9f7SJdt0SCkni2OJlmQj15ZVa2Wle/8r33HOTKYLTW8LjUpXFWugxur7Dt16GThSPL9nuC9ey7rDHOpTm2JVn5NDxJcM4psBSMdkXkI0hAhYVXn/xSsDnC7+QgDZSpwUb6Tgdmka2IKAZIv5dsL2NYUAaUcw/0I3wnW1tIIoohap0yzuj1LtahJYwh748DVFSA66ROzsJZkI9dtUQn1KZzbO2ix60ILDQE9MvRelgFgG3o4kGC/BSVtNrwl3r7woz2OfxbMoa8/E2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=hPdjgb/5WOF8WXkMoeTUDmx3p9uRR5UadbhIbTp6UKY=;
 b=Gk0n+6MZw63s7FCrNckK1HcKVh58t9lXokChYGqKeB2+5Oy9OEBXxaCsLa6F6OQrD6KC1mrvPDkmU2OGGVasyHzsRrFLvWExAmksiIQ+slSQktlt4j9C3YPBFgxHE8jj6va54Wblgqja0uQrAWckdS0GZJ2xQKxtkYWJNaYWds9IpE+Fv236NCrAffuuWgVwAUAeoCMJWfGs1hDg9RnXz/o2k+TRyJUs7LUbgAGvY62OpnXDnjif3TtFZ6zx6Fm4t6X43ibnIwhdZz54dZbuih4EmoY9OrwZFGvMC+p1LOzcCLSmCf89F1kwIQ8CG00/6ggnAp4LRhW8f9u5myVXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO7P123MB7470.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:40c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 09:54:00 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 09:53:59 +0000
Date: Thu, 27 Aug 2026 05:53:58 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
Message-ID: <jqzcreyz53zu4afr4g47ej5t3fc6cedpgdvj6whprn22e5lcwp@3f4tstxzfoqj>
References: <20260826224238.936456-1-atomlin@atomlin.com>
 <20260826224238.936456-2-atomlin@atomlin.com>
 <20260827073036.GC4121339@noisy.programming.kicks-ass.net>
 <36maob3lfrzbuktn6qii76rxdyt5bphjauc7dwg4rkmmgljqq2@j46iffegq6hd>
 <20260827093935.GE4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827093935.GE4121339@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO4P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::8) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO7P123MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 97823acf-6b72-4a2a-a4da-08df04211dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|366016|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	A7BIkxTq9da4DmHuwU2oG4pqmLtbmRtgWIAbJmPr4u9JbUubQTG6PxRqIg/phviTPZIQ3XbP2zHvS1QRxSBVq/uMyNFRxYfRKez6kpQS1fX7D2WIb/pznXWIbEk8KNEefbZu1xzHgsOGHhP6yJ4zOr+DCAtdACaYzTX77sPJ83Xkqwh0sjZgZN5L4IyyavUOURUrT1lX783u0srOb5iyJmoKBxLLyvAHjS58/j/V5acMQ3/a2j5QQhZEY6r+WjVH9Ku3XFG51n3xPUa7nPnXZIPcAOQHtDubZj8mjLxfCre8N1y8nw6FzSb7+Fu2RebKqHISm5jOjogq9zn6ce5uaZNWil+lJTtFDhJCcAatJzD3xZTwAY5buMMOHtA74ED/e/fvL/7TDi9o33woKYBQ/3heB42ywr01UYdAiecLQfq2d8IZt5EWwLCsYZRZpAWFMlIPfGjxkVibt9qfrkZ9o8NA2L/rio1dG37f3JHvPKjq8GBNOJhSPVc3cT6xs1wLCv/hh+FHDW+tx5LH/st95GhI42+Omx6UqJVlKs8DyBFxCfak31OWwbTGG/WrZrcUemqDH/I4AexLHK6qKTLZ/uuVoxU9ON+g4FQZvBDgr8llXKH3x30bqU7mRhL/kGrLDzb82p/a7D9tLvjoTaLCkPvPZOI36hoOgun/fUR7B3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDRJTFFRbEYyNHp0N0cvQnhnOGVvS1dlNDJGRSs1TTUraitwNkZYa2Zudndr?=
 =?utf-8?B?QVZPemU2YU9WZ1o0MXB5eVBOcHV5WUpBZitSU0RQazBuOTQ5aTlvUG5iZEww?=
 =?utf-8?B?NXZ4ek52Z0hJSTFUbC96UFUrZm9tampkdDg3UWxSQWYwZ2hUVUVVbnRvZ2xN?=
 =?utf-8?B?RGtiZmpUK2VDNmlvdEk5S0dHOElHRnEwdWdyY1VVanhwc1J1czBXSnJIa0RI?=
 =?utf-8?B?cWR1a3BKR0xBd2t6NHpISDVieThsTVIzTGljZzNYakVpb0M5U2JzZVJIdEUw?=
 =?utf-8?B?UmpzU2ozTHdXdEFZNlZ1ZnNPaFkxTlFDZlMycHJmY2tEc1FHdWZVSUxNd2JI?=
 =?utf-8?B?MmUvaWVyQjJ5ckZwWXcwREtRSGNTTk1kcjhlSFZVMTJSU0NFS3dES3F4Vk1n?=
 =?utf-8?B?eDdZWWl4WENnVmJ2RUlmRDRFZEpWQVFUaDVtejlwd3pmakMyeVh1SFYwazg3?=
 =?utf-8?B?bHphM1B0MEdYRnNUalFVQldJeXBKTjBiVXE2ZCtrVjZEV0srZ0ZOUHBnK0pF?=
 =?utf-8?B?cHZYUVpGSm1oMmxoa2JHYTJTcFdLdjdITzZ6UFluRlJxK2JHWXZmb3Zlcngz?=
 =?utf-8?B?Z2VWWXpGRHovQUFHa3lLVEF3VW1QZmlvZ3FjWGtTclM0RXdwV2ZJR2RxeStZ?=
 =?utf-8?B?S1FqTElzQjkzOXJiNGNsa1UxUG5EbDlDN1duTVVpOExLSkVoblNKMW5RTEQr?=
 =?utf-8?B?RDdpWFdCa2ZXNU1EdTlLS1pTV292Zmg0RHN4dVdZUHA3MWd6OVJXY3UyWmlj?=
 =?utf-8?B?SEFnL2krUUlnVm9DWVRicExhQk1QUk5yRUtzbXVSMWpuSFFyazdkbStEMzRp?=
 =?utf-8?B?dEdaU2FuTWE0U04wbGFVeURodnZzdGE4SmFpeHMvWHplTmY3WkVySU9DMWx0?=
 =?utf-8?B?NjlxOUZXckZ1YmxVcytiVHl4SmJtdEl4MWw1ZXEzOWdvK1RsWHQvclpJeHpO?=
 =?utf-8?B?dG9sSHBTcWJCMFFCZlBvRmlCWGFmY2NVQmg4dm80UkFJN2VjSGh4QUpybFEw?=
 =?utf-8?B?R092MzFjYU5vdnRFZjVUcHI0TkoybldDVmt2dUNVcmhtT2NtRytnWDJsa1Vz?=
 =?utf-8?B?dFhqdGl1NXpLNGVtRktsalFMWjRXTHh6SHNTTzBKT08raHcrZE5uSkhUcnl5?=
 =?utf-8?B?Ti9LWEdLSW5TUWJNRTB1S1oxNFlWa3k0M3JyVldMUnlkZ09RNGVqTG9hVjdp?=
 =?utf-8?B?Nmd0bHRjdmpKMGtheGIvWWUybGFIUFl1VGg4K2h1OXliZkFSY1Bnbzhkc2pZ?=
 =?utf-8?B?cEpzV1pnY0RYMFU1QXlDNDlUVDFraW1oVy9VVHZPVUV2MHVnUkUvM1dnc1c0?=
 =?utf-8?B?eFBuQ2ljeFJOZm41Wm9mdFJ4OUJCeFY2K3pMQlJ5S3R2RE04MVl0ZjIwY2t1?=
 =?utf-8?B?YndHK0lQQUhmNC9UUGVGYTNuSDdXMzFQZnZHWWMrTWZMd0prelExeUhQdWt6?=
 =?utf-8?B?Z2U4eE52ekpyTUdtTm9qMm9kWWwvNTBpbXVIcjh4SytqdHI2VGwxamlDS2pL?=
 =?utf-8?B?VG9uN1ZZT3RGRHBCc3lLTnF2VmMxSWxiTitGYllvRE9oYjVNZDdCblN4bTBp?=
 =?utf-8?B?d0lGa29UZlM4bWgzdDNKQUgvT3c4eE93TmRUTzlTV05rMHk3eW5SODlaN3JS?=
 =?utf-8?B?MEIvVUwrQ0wyc3h6NG5XSEJ0R0pZalR4QmFVQWxZLzE1bmQ4VG1rVlRoYk9I?=
 =?utf-8?B?ZG1FS1l2SUxDWTdGaThHU05SZVZPdCtsSXovdjQySjZ0YkVSV0R5Wi9TbFhV?=
 =?utf-8?B?M0hNVmtDVXZpQ2hWa1NvaGV0SEw3T1E1SUo3WVA3eXpsNS80VlhYUFo3UFdO?=
 =?utf-8?B?THFWejJwNlJVcU1pZW9OY2ZlZHlJRCs2MkNCbVFCTXlSSG43NUptUVNmdkhK?=
 =?utf-8?B?b0NkOHBDWjlKQ2tDZEF3ZjY5d3o5VmNJdDFQVExxWUN4YTVIUkVOaWtKaGVi?=
 =?utf-8?B?enBXNTJjVkZYRElyNjVUbnBDa3R4bXk3QUlXdnkza3ViV0RQWmRXazZ1aXZl?=
 =?utf-8?B?WFJDWWF4RE5QaSt1S3ZuUk5XRDdNZzY4Z2REOVJ1SmcvUFJTV21McUJJdUVk?=
 =?utf-8?B?K25aMXV3YjdhZk5CeGcxdU5VRWdtWk9ma01BcGptQ0JtZFFZR21vSTMzS2hj?=
 =?utf-8?B?andPTnVubGViRzdkUTBpZnB0T3B2Q25sSmFJRERCSnRyc2xsYVVzSjg3ZjRD?=
 =?utf-8?B?YldJVjRNenZ3R1ExYm40bWk5NDNJcWYzK2E1MXNlMmNOU3dSUFlEZjFlbDRQ?=
 =?utf-8?B?MzNRUTVLaGlWRStRc1F6UHlUeDdzbGkzMlVsZ1pTMEsyZlpocE1rY3JLcitu?=
 =?utf-8?B?VmFtcDlyVWQyRlNEbXdPamI0SDZTcVVkdks0UHpFbzJCSXBZMVhjdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97823acf-6b72-4a2a-a4da-08df04211dfd
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:53:59.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0hZ+EliZbEGnxy74nj/fS+reQCuf0iVEe9nMqY9LtvwNU1O931TXcHva4GddgMWto3bP+HpHupWvF5SrDMUGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P123MB7470

On Thu, Aug 27, 2026 at 11:39:35AM +0200, Peter Zijlstra wrote:
> On Thu, Aug 27, 2026 at 05:35:44AM -0400, Aaron Tomlin wrote:
> 
> > To solve this cleanly, I propose introducing a concise helper, for the root
> > domain in kernel/sched/sched.h mirroring rcu_dereference_sched_domain(p):
> > 
> >     #define rcu_dereference_root_domain(p) \
> >         rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
> > 
> > This covers both the update side (under sched_domains_mutex) and read-side
> > contexts (under rq_lock(), preemption-disabled, or RCU read locks) via
> > rcu_read_lock_any_held(), while keeping the call sites clean and
> > eliminating Sparse warnings.
> > 
> > Would you prefer rcu_dereference_root_domain(p)?
> 
> Yeah, but I'm not sure I see the point of adding it, as it is exactly
> the same as rcu_dereference_sched_domain(). The root domains are part of
> the sched domains, so it doesn't seem wrong to me to use that existing
> one.

Indeed. However, the motivation is purely code clarity. Defining
rcu_dereference_root_domain() preserves the natural symmetry of rq->rd and
rq->sd in struct rq, while keeping grep-ability straightforward.

That said, should you still prefer reusing rcu_dereference_sched_domain(),
I am quite happy to convert them over.

Kind regards,
-- 
Aaron Tomlin
