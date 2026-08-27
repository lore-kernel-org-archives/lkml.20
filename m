Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020096.outbound.protection.outlook.com [52.101.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDCB57C9F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863074; cv=fail; b=kTtj77yGSqOMcq2X8iQy1qpXkvpBxyAfeotzPU/oeZlyiKSYoRuqwlVP2rV9dIWhYqrCMA8j0L47R2lZr6gFYn3/Z2ytcYbkwqSj3D+oDmpDDdQ5FYK+5dTtjAFTzDd+AyMNRm2hA4h3QafU9ugieaclig8lIyUFtrD2JXBKe2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863074; c=relaxed/simple;
	bh=O86DfLqnxUvb8dCYp7CdHbzPqMWFAwzYV4yHr483aKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T3kyCddiAtP/ywc5V1CGBtuWJVklqlkH2m3MAEaJOfxzmKcEQ0OhMNPQnygrWECzR6oR1PnoJyhvYusteukk5QRKPd1DNPY3qJUutbyEotDvFWFhdnEM1/0Yej6AIDgoujAuzAKCqfiKpQ0LokGPF2BVArHlWBvtdnjdt94P2/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKEbhfXAMhpUR0V5V49joM0PioSYYI9aMeNhB63ZuxdiZOle4AC9qwGYuTCLo9fUDhXC6G1HK0CtMC9wkxUF/+cLb13POqib2LzourabXpGzCv5F/y2nXq5/Usci2g5Eod/b2kE78uXOGz5YqhXONHnxkx2gc/Ladk5h5HlxvhqO3KMi6VJ2TB4dp/S+5nq5ObqFkVnm4c3iNlpBmegaSy1uI2qTEBrzOf1bw17f6mRJt88Nd6rxxK1eCBGr/BuPurMxtgb4m7mE3hF9QOUiJ6Lta6o8sCP0blKh5h6yvfSI0wbu6/QYtYjZQE6tH50kwf8doCcvy6dWakHVr5Ekng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=L6dLuwVPwpNP3bVVvrjGEk87oCaeCsYN38RaJLrzp98=;
 b=pnkRDkQIUmpNsdg25hahN52Sc+UsKnFKwCGWVdRIBilNKHl6BRBCcEXnS91nOU0TtETy0B4uHNq7iyY7qjMmSsqKIk5DvgpLJ80IXF7HaEk6y3epBmOoFGcQNiJwTn7jlthBM4YtuE12DghrmKgUfzUD0+31jBQ9b8fab/kMaU2hzfnazJ3lO46XZehPG3vTgBwoVEHXaJHH8+XCuns3skphqq7SwHHwbxzh4mWSW9Sq4eZDxrzsPQeUm6UVDZfgpQvlNnGgslRolC60uBNvYxNpS/oZhhQ2i7jUxz0WI4/vyja4YzCjVr1a5Dkq72UPh40y67awGEEMd5cJt/pZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO0P123MB7718.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:42a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Thu, 27 Aug
 2026 20:37:41 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 20:37:41 +0000
Date: Thu, 27 Aug 2026 16:37:39 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
Message-ID: <zekeanf2poef2qh2dkinxxwhme5utfibmz6bmvqrz2dzd3o6ub@gfokk2j2xroc>
References: <20260827194014.977758-1-atomlin@atomlin.com>
 <20260827194014.977758-2-atomlin@atomlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827194014.977758-2-atomlin@atomlin.com>
X-ClientProxiedBy: LO4P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::7) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO0P123MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f44237-edd7-4c06-6be0-08df047b0a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|56012099006|4143699003|3023799007|6133799003|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	QKTQWIqpLvIGvzMFS8oI0DC+ZWvXRECbjcwBI/erCfdY0qgmNTcDJl4EbJlPUw08yJUhuCdOOoGzNcDn1JzPA7p9IOkL21UudbGiRUXqOoBJhwPl7jn2pIvarAVL0a95cPQKIjdvapEZMvW4oOsJGQ8Uii6E2LyJUe1fQbByDkOXnWkruxw4fxGhlK9iUU58PqFeLtEcmDXgKZ42gzd4G9Fm6LL6+BYCH53eHeaei1ii/S3PFupUilOZ435c0zHbefofyvfW70qiC5r47ysJo4XfwCE/+yWD4d73lFVApugr5edl5MSYleQGCrwnT3NdHRLYry6Jz6/HNdMttfKnu8pTu2tAGg6aP5ZXM8Ls5Swz6kCYgh19F10ZXN9P2FX6msqpbtmHRsi4XOHAFvAeXuABHEUzq/Mq5wLyVVoOB27mAqiXH1Uk1cY1c6kjyuM4rndUVF4ElXZeGs9n2fED9zy5RuXLnFt+k80ejsoBts+tPY0HFzAKCwoYKlP0u1sEed79V2tkW2udOY9D86b+f3Q+0f6EdLKmN6v/iSjGjpjja8mYxhvEaIGdzBQAmSv9LF6dFlRhGP5jiCcZGDzrS3i0kCzJoowJujdJ9cYQde0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(4143699003)(3023799007)(6133799003)(5023799004)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUNLekY4Y3pZb0tVOE9mMFBORkNyOStnbzExSjRDOU9CVnRrTVZ0L2JlaGZF?=
 =?utf-8?B?d3ZSd20wQnNTbm5jZ1ZyU0pmVUhzZWxvcSsyRjJtcUM1bWdHMEx2QmJBcHQw?=
 =?utf-8?B?SXZtVnZ1U20yZjVFdlZWMVNCUk5pNkl4djJFV3h3R2pYWHRJUEtHRE1vOXNE?=
 =?utf-8?B?TUx1NktQNTRaazNNcEhMTG5vWlJoamFuLy9hYXdUOUlXY0ZGTzhyZ1VvOFRk?=
 =?utf-8?B?d1pSS2h2dXJpNVp4RHhVd1ZmcG9BSUdEdlYxOFYxRUhBSm1YMmpPVlNvNGpr?=
 =?utf-8?B?THF5SVhhaDUrYi9meUt5S3RFT3dXS0hHc05HRk5qdWlqcmpiY1phZXhiS3Zu?=
 =?utf-8?B?T0lGWkJzTEFVL1liZ3ZybWNWMjIzd1A3TGZDVTkvYnZlazc3eklUb0dpelVT?=
 =?utf-8?B?cDZmck15ZTVZT214eDVKbGNBM3lUaXJ1NUtRT29QaVRIVzltckZqRUtNYjE5?=
 =?utf-8?B?Wm5vR3RWTXNYWnE4QUY3SXdkWmZiSDFEMHhjWTlQT0IxcWZlbHFpK1Z3akJX?=
 =?utf-8?B?NG1FSStlUDljTUxYbXhtWC81NzhNYU9Ra01QWWdhQUw3S0kxVEE0cHJUVXFL?=
 =?utf-8?B?eERWNC9rRE1lTitFem1EbmxWSnlOWmtqZ1ZhdE9CQ2F5am43N2ZPWUFZVzc4?=
 =?utf-8?B?SG12b2MxVDlCMHRuRStpWkYwR1BxSTBKdjRQSDhVMWYvK0VZZWVjbUtKTUJG?=
 =?utf-8?B?QjFCaDJxWWZHbHRDVTJLL05uazFJU2ZRa3g1eEhEYXBpT0pPQjZ1N1huV0ky?=
 =?utf-8?B?NjZvMmtVV2JEZHdjanVhc0JuU3pTdFRHQnBRa2xwMzk5bHN5ZmR1a3RNLzhD?=
 =?utf-8?B?WElBMktzMFYxS3FnRU0rVndOVTZ3MXlJUHY1ZktXVExjM0ZjZGRLZEVURzB4?=
 =?utf-8?B?V21Sc0d4dWlZd2NSRnlEVHBDbGpZU0Zpdy9QU09DeWtISmpaSkFXMTZaUXow?=
 =?utf-8?B?RmFJcUtwWXl4Z0pMVkNzQXE1RWJrM3dIaElIZXhsVWxEcjU5NzB5ekFjTTBo?=
 =?utf-8?B?YXRvclpETVI3UEVHRmFvdUFmUDY0Tk5lbzZyUHdadjAxMWZGUDQvc2lBTnBE?=
 =?utf-8?B?SW9Pb3UzOVR5Zi8zRGhRR28yc0xxRnl6em9WNEVTVm54bTlHUVZmd1BLSFhF?=
 =?utf-8?B?RVNTdkNoWnlLQUZkOUNEbE0xNXk5QXRnZVk0b0R5Vk5Dc2JhM2haTTc4UWJh?=
 =?utf-8?B?dWFTYm5rOXFmeENNeHVGc1RmNHpUa2NJaHZpMzQ1ODIvSndWRkozNmNtNWZK?=
 =?utf-8?B?VGJPQlFQK0NiWEFsMGlRdnZYRi9FRTZuRExINnZBcnlZR3dGcm00cHZWMk9h?=
 =?utf-8?B?Ym0vM0VNdjNNR010dmk2Z0JkMGljOGZadUliYWQ4RmJiRVN0Wk5ab1dpSytv?=
 =?utf-8?B?aUprcjFMTlNDdWZMM2ZxS0FPUTAvQS9qRnF1NnZ2MUZGOWJvc0ZSWWp5Ymoz?=
 =?utf-8?B?dFg5OUt1YkdBYUhCTzhxNmZlcXI4V2p6Tk52UG8zVVdiOHYxdTU5TGxJTy9M?=
 =?utf-8?B?b1g3OE9ObmRaTDZEYk1KeHNYM1UwRys3UjIxdWlvSHBxa3pNbG93bDBSU1hL?=
 =?utf-8?B?eTZIcXZEWkxPV0Q2N2grVUVMY3BJNnU4MExERUgrK1BTSjlQLzJkNWFkbG5Z?=
 =?utf-8?B?ZVlrVWRlb2FncGxuYnZybUJ3cHYvVllHR3dtNDZIRG81ZjlZaWNtVzJDQUhR?=
 =?utf-8?B?S0l3ZzAyNUQ2UkdGK1RidlZrckNtdEZZcHZmaGJBcnZqeVNSclFiV3g5bkJ0?=
 =?utf-8?B?d3ZJOXFUelR6MlF5QitxNC8xTFIzTHpRclhHWERyeUM0QmpPTldhQVZTa3FE?=
 =?utf-8?B?WXIxQWdDa1N6ci9uWk4wUTVWdnVDSTg0WkdPcG1UNkJvVkVTZmZSR0QxWnF1?=
 =?utf-8?B?bUhOU01tYmxzY3AxeXJjNS9XY3BVVzhnalhWRk5CVEtvZzNJclF5ZFcwVXd5?=
 =?utf-8?B?MUhEUlUzaWZrR0xRYmZTaGYxMjRTUXJ3NXgwZ2xTcjJyclY4azdzUHBOUnpT?=
 =?utf-8?B?NDJZYkhCVHFhK3NycHpqMjNLaldtSzhSQUJpWTRDb1I5aHNaV3pFeUNrdTNM?=
 =?utf-8?B?bEpzRHk4U3paVCsyN0NSN21tZFRTaVlLNDNrWUxSbURFQTNPK2RmbGFuUDJI?=
 =?utf-8?B?ZWNaT3o5ellwdG1XNW9DdVVJYlFmNzBlT2dCOVhHK1FwSkhNYTd2U3BHU3Bp?=
 =?utf-8?B?THJ0OURwVGZiZlNweWhUU1NFWTRDU1hmdE56ZXY0Z2E4ODZ1bkg0ZTgzeEpJ?=
 =?utf-8?B?VTh3M0hpV25QeFEzUndYVWxoTmZpQXB1Y2IzdWVoekhlL01LamN4ZFpKakxk?=
 =?utf-8?Q?I8Kjinksppf9468+u0?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f44237-edd7-4c06-6be0-08df047b0a1d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 20:37:40.9264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHtdiJUBzdfQdvjqtjijjVvC2n0bk9CcEKN2TQy+PKH6VflZdVEyeamHgrtYjeYB9GNxK2sVuVEhR9/WRXL0cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB7718

On Thu, Aug 27, 2026 at 03:40:09PM -0400, Aaron Tomlin wrote:
> @@ -3355,10 +3363,7 @@ static void set_cpus_allowed_dl(struct task_struct *p,
>  bool dl_task_needs_bw_move(struct task_struct *p,
>  			   const struct cpumask *new_mask)
>  {
> -	if (!dl_task(p))
> -		return false;
> -
> -	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
> +	return !cpumask_intersects(rcu_dereference_root_domain(task_rq(p)->rd)->span, new_mask);
>  }

Hi Peter, Vincent,

Please ignore; I will address this in the next iteration.

Sashiko [1] correctly reported that dl_task_needs_bw_move(), is invoked
while holding cpuset_mutex in process context, with neither
sched_domains_mutex held nor an active RCU read-side critical section.

I subsequently confirmed this using virtme-ng:

    [  170.335047] WARNING: suspicious RCU usage
    [  170.335052] 7.2.0-rc7-virtme-00041-g6509e33120f4 #23 Not tainted
    [  170.335054] -----------------------------
    [  170.335056] kernel/sched/deadline.c:3366 suspicious rcu_dereference_check() usage!

[1]: https://sashiko.dev/#/patchset/20260827194014.977758-1-atomlin%40atomlin.com

Additionally, direct dereferences of the __rcu pointer still require
suitable conversion.

Kind regards,
-- 
Aaron Tomlin
