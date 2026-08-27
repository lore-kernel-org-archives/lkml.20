Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022086.outbound.protection.outlook.com [52.101.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2313348465
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821078; cv=fail; b=YK/vvE+KFyTNNWuGD3EdjqxKjjBlpJTNtQSsxuzSz82f5lx0ZsiWVn2xLY5xcFhMfAgnFHTFTX1dnkZahuwQ0jiGuvXulObE58f9AxOjlOlgykV7VypSzsUliSAvKRcSwQwwPL2sch9QzyYjjR2tKFP2zDcpzBVfrGdpYJWnxIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821078; c=relaxed/simple;
	bh=npBjyRKtx5tHTK/EZFAPZpZ2r+ZQcb4qfDkvESqyOcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RVAlx867DfS4vKkuNxkji6a5jj4s79566OuPaNFbv7631kPu/KTrKkhAA8nGkf8Yu/ulMLaVUqjArFfJtmWn9cHJqnlIN4FDct5w7mMeJKV8cOSp/8FYt8zp3eqRNUGwYpvn5jbjLT1QjVID51YV2Iyhq2hvd8SysqE87doIFEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbGbxqTDqa4iyi2C+8wV+PaFqaXW129bNebvyf5LAwNwQUD89F6ffpNdN5bUDCYTB8uD8b9XJVGw3O6px9f6By4ryUa2FqiIhGzu+7t2aEDfUZKau26WrMkSSMQbTQXxCtpz841AVYIlhL6tAJDsNn7L3Yd9id14mTBDSux7PIaHq/k6bkq+O0ZcGnX63h4tTShiUCL8fECwuW7VqRuEkIccIAgr7WqVtO3qoQAkgHr22XaUfq1L/ulhdseAUsX59ZIV/Fp+82euZtYRp1xCatFT8GZ7fhyjJ51pm92KwrWDiSGItiKKuFRuwKKKlsaYuufmAKe+zbPeSKHf80KQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=hk3DC75Kg1w9bq4frOOxKUoju8M/Y8tVhK6/28i85FU=;
 b=XHjRAjC7admdWDV+LJRItZz3G9pzw9JgcvLVpq7FqgJv2yKil4W2ADpszOjCUOEAMu+OCOkVucvXiRyCNvH2Lr6OY0btew64e52kLGgBF/WaLKmbJJ7+BcNPaW+vtWKLqSufVtWh4AFz2RinGBdhPfPJTWhZgriwar8E4ipeAe6KZzmMIdHwcPkiVVNLai97VMYjiU+a+KvCQ28UUMn4eW2yvIMxWHNZnTdyCd11LLAZxwGoH7GvjpL2ocyDFi7rLcUAjflUwSYkyguAMacbN4Sx2JipP8S+pWok7qAg1VNmhqFOxR/EIYEJgLGcmMFmxOrhQvQYlYluwgXdr51PUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB3175.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 08:57:51 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 08:57:51 +0000
Date: Thu, 27 Aug 2026 04:57:49 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	paulmck@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	zhanxusheng1024@gmail.com, neelx@suse.com, chjohnst@mail.com, mproche@mail.com, 
	sean@ashe.io, steve@abita.co, rishil1999@outlook.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] sched: Annotate rq->rd with __rcu and update
 lockless readers
Message-ID: <qb77zzhmbb22f6g4of3lzgv5e3chxfbbgw3chn2dmle4lhvp3u@3apu5i3qf7bs>
References: <20260826224238.936456-1-atomlin@atomlin.com>
 <20260826224238.936456-2-atomlin@atomlin.com>
 <CAKfTPtACUPezTdiJKUW8zdb0NoURZU2Of+AnMU5VvzXE0tmB2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKfTPtACUPezTdiJKUW8zdb0NoURZU2Of+AnMU5VvzXE0tmB2g@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0665.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::16) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB3175:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c0621f-70b5-4765-1a4c-08df04194641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5VBk316KTW4qJdN8C7Kjv5OkLzQqnZqkLevp/72HPnX5KkjZBxbN/PP6fv7Bt9x2uaSqobA4tAlZwynCvnp46MbJyGoRQ3d+uu9rmQhpSmNPElw5Nj96MYX/ERHsNoRcqGrtA/Wj3Mar5GDiE47hQWPYpTVZ43gYGp7jU4kcFOeGiOek05NTQixJCV6HzOJtHwDPWtEhwmYQz4esQVYhGzmfKecLXFYaDefjWbnPfhxRTE5dslUBh5PMBH2RstkSCVO7IRQU624blKxnmc7hSFxyuOwjEu0lNOlD1u6A5bXYuoi6VarAkl3iWtc0egLhxmtJ/rJLbOZrR44UqU5nMT5KpNmVCE4az80pIsQGtN/u+pf2BtxAjNEWg99Hr03NVzTMgA3lBGZ6oyQ+ZD0qVenKctCcB8SYXgqL9OckVAL6qbs9C9gq9BoQWXR2nCIrgF/9JTMi1Mh9Qt16J2c8A6EAdx6Wfc4la+rjEwpyYf3CsbezTH9rlESoLnBGP6u39PYhoYalzGNzlrPYqEuyitAzwIBuNRhsRRbDpEdDAI6xWL2krwsW02d4Po1X4zyvogWGME8b7hKav1g8otPv7cHPKtmJhrfkBhaZaUS1B5n4T3+dBeViSgnXfm3tErzY4HLrg4SyBbe1jxJAwnNRnjidhMDb+1ADx6ShA2vZ7ag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGhuREVtRkNJYzRYYS9TNzBZV2VBakVlNFBRU0QxbkdHYmhRM2pCWnVEczVZ?=
 =?utf-8?B?MHNETGNoMTg1SGE2aDRYbWI1V0xHb0JFWHVmWnlxNThyYzc5aFF5UUdIbGVN?=
 =?utf-8?B?UDhUeVBZTlJUaEU4c01RK0ppR2graldCZk9IcXh4ZCttS0RTa1lYKzd2WmNn?=
 =?utf-8?B?cmhqNG5UOXhWb2xGakxtaWl2N3drRU1vRCtpTzgyYytlQ0QrQ2k5VzNPRC9B?=
 =?utf-8?B?TXFrckJESllPME04amx6aXRXOXFUblU5VXoyZmJ1b1VTdjhZa3FDbGJ4OS8x?=
 =?utf-8?B?QWdUZ0JodEtXVHlYVms4a1pxdmkzUnMvNmxsOFIyNkJvRkdFRENzV2d6TGJ6?=
 =?utf-8?B?WEg5OFJSWTZNRzUwMFJTNzNDUXVVajFNVFdXU2pDRnRad0hrQzF5c0VhakZ5?=
 =?utf-8?B?Um1KcE5pODRtQnFlckI5THgwdjZ5WmMrRXNzaFJIV3ZTTUR1V1FLTkdpQTMv?=
 =?utf-8?B?RjZJeGtTa1VBbVV5VDY0WTFVR1ZLMTNkZjV5c05TQXpBMU45OTArWTRKdEFq?=
 =?utf-8?B?OXhjeFBWVXRTUUJmOFgxOUJxYjNWd25IbzJqTFFlVUxheXNpYXVRcEhHT01D?=
 =?utf-8?B?ekJsRTRkZmVlc0k0dVZzWEl1c0FDKy8zeVFCOGhLTmd1cks0K1pFTlkzbVhE?=
 =?utf-8?B?dVg0bThUb0lSVkpVekx4aEsrYUlWdS9EcEZubmVGUTZma1l5Rm9jZmNOODVM?=
 =?utf-8?B?em52NDJhUXg5bjVhRVBzekpXbkJJNGRJY2tZUTlwQ3RFbU1YOUJoVEVTQVUx?=
 =?utf-8?B?aW1uS3R5V09WUi9UUUFwaU1Vem5UWDYvUDU5QXVLTFdNb0pGeGFaZW5LQXpI?=
 =?utf-8?B?Tmc1cjRrZ1ovRUZTeW51VDVDc29UUG5VcHhLSmtrd1Bvek5hVmJFNy83Z1p5?=
 =?utf-8?B?MnRzZzBRSzFRUDRNTS9VQmRhSnFuMDlseVUwNGFjUzBJODN2M0Q2NTNvSHEr?=
 =?utf-8?B?ZzNmZjJLUmI5M09jVlFLTHJra0dEdHFhK1N0U2F4TTBIK0VJNVAxQklGbDhj?=
 =?utf-8?B?K2s3bjI5TzBidTE0TkdVUHpFR1RUWWc2QzVkeTRCbmprb2RrOGl0eGJwVlkz?=
 =?utf-8?B?M3RPTVNxMzRja3FVWGVNd0MvZTYrTHdnMkJYekhZL0lvOThQcnNnd3cybHB4?=
 =?utf-8?B?aUxBc2tJa01TU2t5OVBiLzlyR2d1OUFWYzFMM3VFYUJabi9HMFA5Wmk3elk4?=
 =?utf-8?B?Sm43TGY0RWhLQmdxQzNCOWFwWHk5SHVpVFBaUGoyVHlQVFFEMURneXQ5ZVRX?=
 =?utf-8?B?ZVJLSVRhNjBUOHJaQldjejM5anE2RzhsdENDWm4walhCYXR6WWZydFhaZXV1?=
 =?utf-8?B?Y1hzRjdLZGVQbjN2ZjFxeGdFNjFkTXgrZExMQXF0T1czQ1JOcGVmazd3ZGI1?=
 =?utf-8?B?Rk1IOHNqWWJLcTZaMHFDVVNlMU00Rm1rdGpGNUU5QmY3c2xIWFovUkwydXNl?=
 =?utf-8?B?VFhtNmxWWnh4QkFIR2o5YUEzQ2VvUzNqOWZBSmpuRlRIV3J1NHJGVkJLTitl?=
 =?utf-8?B?NWFWV2UxQlBvOVRyWXFqMWVka3NOWFlPUUdpNzM2ZkxyMmRrb3ZPQ215dW9j?=
 =?utf-8?B?UTVLLzBucjhjVng0bkRhWjlNNVdGaEdzQVNkRm1acWpTY3JMZUtjTW02ckdh?=
 =?utf-8?B?ZXJiZ2luWU1pL09QMlRCOG1KV3pwam92a0VXRUZhRVpsR1g3M3gzNlJWWWtl?=
 =?utf-8?B?SmEwODdaYWtVeWtCeXluNjdtYjhpRmNsaWFmOHgxUmtGakpIWXUvMUR2OW1P?=
 =?utf-8?B?bGgwTU1EYVFoWTE3Ym1GcEt1cDViV3lCbVN3cm1jVE9wMVpMeGZXYXArSGJo?=
 =?utf-8?B?aUlReDFBTFFzSllSeEhpTmRQaHV5ekUwVTBhNVZWSHp3WEhpdHVFWFJNUlRD?=
 =?utf-8?B?WVY4MFhuUDVFUkRhOFQyWFhyVWlmTTdXTW56ME5rSy9rRjhXdm0xNHE2aEgw?=
 =?utf-8?B?NkNidUdYaURuVTZkTEhhU3VaWHlsTjFLS0tuYU1qQkoxREYveVQ3eHFoZWxT?=
 =?utf-8?B?dGVqS3hxeFpkSGV5QjEwdUVwVW8xc2VHS1NTV3IxeWIyU2Z5aXU0a3ZHOHhE?=
 =?utf-8?B?cFJTcnAybnd4N2g4WkpBR3hSSHE2WFpVMEhHSnl0dzNlN05sbEVxYkU1OXE4?=
 =?utf-8?B?d0VoaCsrcklWb3B6NlAwMVRCMG53eURoVVAwOUhpb1ZWdHdoc1hTcVN0NCta?=
 =?utf-8?B?RFUycnZaYW4vK3lvV3lTNW5tbTFSNVJodkoyYzBQK1plWEpGWmdkMElKQmN1?=
 =?utf-8?B?NFVkUlFiQlU1YndwTFcyY3B0S2hjb3MwWnlaOVJreWFmd0xWVFRVdlJKNmxo?=
 =?utf-8?Q?Mxn7dYn0IiX6nGnWE2?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c0621f-70b5-4765-1a4c-08df04194641
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 08:57:51.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CCHaVwks4FXZg+DP6hvQCh81pPVcYBC5mxCli8ElJ+GIA0Ak243/pYrRuR4zVLhEAZs1Nbvyy/HfRu5mKXOWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3175

On Thu, Aug 27, 2026 at 08:54:18AM +0200, Vincent Guittot wrote:
> On Thu, 27 Aug 2026 at 00:42, Aaron Tomlin <atomlin@atomlin.com> wrote:
> >
> > The root_domain pointer rd field in struct rq is updated dynamically
> > using RCU, and its memory reclamation is deferred via call_rcu() in
> > rq_attach_root(). However, struct rq's rd field was missing the __rcu
> > compiler annotation, and several lockless readers across the scheduler
> > subsystem accessed rq->rd directly without using RCU dereference
> > primitives.
> >
> > Add the __rcu annotation to struct rq's rd field in kernel/sched/sched.h.
> > Update lockless readers across kernel/sched/ to use rcu_dereference(),
> > rcu_dereference_sched() or rcu_access_pointer() appropriately. This
> > ensures proper data-dependency barriers on all architectures, enables
> > Sparse static analysis validation, and documents RCU read-side ownership
> > contracts.
> >
> > Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> > ---
> >  kernel/sched/core.c     | 24 ++++++++++-----
> >  kernel/sched/deadline.c | 67 +++++++++++++++++++++++------------------
> >  kernel/sched/fair.c     | 29 +++++++++---------
> >  kernel/sched/rt.c       | 64 ++++++++++++++++++++++-----------------
> >  kernel/sched/sched.h    |  2 +-
> >  kernel/sched/topology.c | 11 ++++---
> >  6 files changed, 113 insertions(+), 84 deletions(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 2e7cde033a31..86de58f5825b 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -8547,8 +8547,10 @@ void set_rq_online(struct rq *rq)
> >  {
> >         if (!rq->online) {
> >                 const struct sched_class *class;
> > +               struct root_domain *rd;
> >
> > -               cpumask_set_cpu(rq->cpu, rq->rd->online);
> > +               rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> > +               cpumask_set_cpu(rq->cpu, rd->online);
> >                 rq->online = 1;
> >
> >                 for_each_class(class) {
> > @@ -8562,6 +8564,7 @@ void set_rq_offline(struct rq *rq)
> >  {
> >         if (rq->online) {
> >                 const struct sched_class *class;
> > +               struct root_domain *rd;
> >
> >                 update_rq_clock(rq);
> >                 for_each_class(class) {
> > @@ -8569,7 +8572,8 @@ void set_rq_offline(struct rq *rq)
> >                                 class->rq_offline(rq);
> >                 }
> >
> > -               cpumask_clear_cpu(rq->cpu, rq->rd->online);
> > +               rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> > +               cpumask_clear_cpu(rq->cpu, rd->online);
> >                 rq->online = 0;
> >         }
> >  }
> > @@ -8577,10 +8581,12 @@ void set_rq_offline(struct rq *rq)
> >  static inline void sched_set_rq_online(struct rq *rq, int cpu)
> >  {
> >         struct rq_flags rf;
> > +       struct root_domain *rd;
> >
> >         rq_lock_irqsave(rq, &rf);
> > -       if (rq->rd) {
> > -               BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> > +       rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> > +       if (rd) {
> > +               BUG_ON(!cpumask_test_cpu(cpu, rd->span));
> >                 set_rq_online(rq);
> >         }
> >         rq_unlock_irqrestore(rq, &rf);
> > @@ -8589,10 +8595,12 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
> >  static inline void sched_set_rq_offline(struct rq *rq, int cpu)
> >  {
> >         struct rq_flags rf;
> > +       struct root_domain *rd;
> >
> >         rq_lock_irqsave(rq, &rf);
> > -       if (rq->rd) {
> > -               BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
> > +       rd = rcu_dereference_protected(rq->rd, lockdep_is_held(&rq->__lock));
> > +       if (rd) {
> > +               BUG_ON(!cpumask_test_cpu(cpu, rd->span));
> >                 set_rq_offline(rq);
> >         }
> >         rq_unlock_irqrestore(rq, &rf);
> > @@ -9009,8 +9017,8 @@ void __init sched_init(void)
> >  #endif
> >                 rq->next_class = &idle_sched_class;
> >
> > -               rq->sd = NULL;
> > -               rq->rd = NULL;
> > +               RCU_INIT_POINTER(rq->sd, NULL);
> > +               RCU_INIT_POINTER(rq->rd, NULL);
> >                 rq->cpu_capacity = SCHED_CAPACITY_SCALE;
> >                 rq->balance_callback = &balance_push_callback;
> >                 rq->active_balance = 0;
> > diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> > index 857dbe3519a8..026d8b499dcf 100644
> > --- a/kernel/sched/deadline.c
> > +++ b/kernel/sched/deadline.c
> > @@ -122,12 +122,12 @@ static inline struct dl_bw *dl_bw_of(int i)
> >  {
> >         RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
> >                          "sched RCU must be held");
> > -       return &cpu_rq(i)->rd->dl_bw;
> > +       return &rcu_dereference_sched(cpu_rq(i)->rd)->dl_bw;
> >  }
> >
> >  static inline int dl_bw_cpus(int i)
> >  {
> > -       struct root_domain *rd = cpu_rq(i)->rd;
> > +       struct root_domain *rd = rcu_dereference_sched(cpu_rq(i)->rd);
> >
> >         RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
> >                          "sched RCU must be held");
> > @@ -159,13 +159,13 @@ static inline unsigned long dl_bw_capacity(int i)
> >                 RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
> >                                  "sched RCU must be held");
> >
> > -               return __dl_bw_capacity(cpu_rq(i)->rd->span);
> > +               return __dl_bw_capacity(rcu_dereference_sched(cpu_rq(i)->rd)->span);
> >         }
> >  }
> >
> >  bool dl_bw_visited(int cpu, u64 cookie)
> >  {
> > -       struct root_domain *rd = cpu_rq(cpu)->rd;
> > +       struct root_domain *rd = rcu_dereference_sched(cpu_rq(cpu)->rd);
> >
> >         if (rd->visit_cookie == cookie)
> >                 return true;
> > @@ -533,15 +533,18 @@ void init_dl_rq(struct dl_rq *dl_rq)
> >
> >  static inline int dl_overloaded(struct rq *rq)
> >  {
> > -       return atomic_read(&rq->rd->dlo_count);
> > +       return atomic_read(&rcu_dereference_sched(rq->rd)->dlo_count);
> >  }
> >
> >  static inline void dl_set_overload(struct rq *rq)
> >  {
> > +       struct root_domain *rd;
> > +
> >         if (!rq->online)
> >                 return;
> >
> > -       cpumask_set_cpu(rq->cpu, rq->rd->dlo_mask);
> > +       rd = rcu_dereference_sched(rq->rd);
> > +       cpumask_set_cpu(rq->cpu, rd->dlo_mask);
> >         /*
> >          * Must be visible before the overload count is
> >          * set (as in sched_rt.c).
> > @@ -549,16 +552,19 @@ static inline void dl_set_overload(struct rq *rq)
> >          * Matched by the barrier in pull_dl_task().
> >          */
> >         smp_wmb();
> > -       atomic_inc(&rq->rd->dlo_count);
> > +       atomic_inc(&rd->dlo_count);
> >  }
> >
> >  static inline void dl_clear_overload(struct rq *rq)
> >  {
> > +       struct root_domain *rd;
> > +
> >         if (!rq->online)
> >                 return;
> >
> > -       atomic_dec(&rq->rd->dlo_count);
> > -       cpumask_clear_cpu(rq->cpu, rq->rd->dlo_mask);
> > +       rd = rcu_dereference_sched(rq->rd);
> > +       atomic_dec(&rd->dlo_count);
> > +       cpumask_clear_cpu(rq->cpu, rd->dlo_mask);
> >  }
> >
> >  #define __node_2_pdl(node) \
> > @@ -699,14 +705,14 @@ static struct rq *dl_task_offline_migration(struct rq *rq, struct task_struct *p
> >          * since p is still hanging out in the old (now moved to default) root
> >          * domain.
> >          */
> > -       dl_b = &rq->rd->dl_bw;
> > +       dl_b = &rcu_dereference_sched(rq->rd)->dl_bw;
> >         raw_spin_lock(&dl_b->lock);
> > -       __dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
> > +       __dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_sched(rq->rd)->span));
> >         raw_spin_unlock(&dl_b->lock);
> >
> > -       dl_b = &later_rq->rd->dl_bw;
> > +       dl_b = &rcu_dereference_sched(later_rq->rd)->dl_bw;
> >         raw_spin_lock(&dl_b->lock);
> > -       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(later_rq->rd->span));
> > +       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_sched(later_rq->rd)->span));
> >         raw_spin_unlock(&dl_b->lock);
> >
> >         set_task_cpu(p, later_rq->cpu);
> > @@ -2222,9 +2228,9 @@ static void inc_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
> >         if (dl_rq->earliest_dl.curr == 0 ||
> >             dl_time_before(deadline, dl_rq->earliest_dl.curr)) {
> >                 if (dl_rq->earliest_dl.curr == 0)
> > -                       cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_HIGHER);
> > +                       cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu, CPUPRI_HIGHER);
> >                 dl_rq->earliest_dl.curr = deadline;
> > -               cpudl_set(&rq->rd->cpudl, rq->cpu, deadline);
> > +               cpudl_set(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, deadline);
> >         }
> >  }
> >
> > @@ -2239,14 +2245,15 @@ static void dec_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
> >         if (!dl_rq->dl_nr_running) {
> >                 dl_rq->earliest_dl.curr = 0;
> >                 dl_rq->earliest_dl.next = 0;
> > -               cpudl_clear(&rq->rd->cpudl, rq->cpu, rq->online);
> > -               cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
> > +               cpudl_clear(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, rq->online);
> > +               cpupri_set(&rcu_dereference_sched(rq->rd)->cpupri, rq->cpu,
> > +                          rq->rt.highest_prio.curr);
> >         } else {
> >                 struct rb_node *leftmost = rb_first_cached(&dl_rq->root);
> >                 struct sched_dl_entity *entry = __node_2_dle(leftmost);
> >
> >                 dl_rq->earliest_dl.curr = entry->deadline;
> > -               cpudl_set(&rq->rd->cpudl, rq->cpu, entry->deadline);
> > +               cpudl_set(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, entry->deadline);
> >         }
> >  }
> >
> > @@ -2686,12 +2693,14 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
> >
> >  static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
> >  {
> > +       struct root_domain *rd = rcu_dereference_sched(rq->rd);
> > +
> >         /*
> >          * Current can't be migrated, useless to reschedule,
> >          * let's hope p can move out.
> >          */
> >         if (rq->curr->nr_cpus_allowed == 1 ||
> > -           !cpudl_find(&rq->rd->cpudl, rq->donor, NULL))
> > +           !cpudl_find(&rd->cpudl, rq->donor, NULL))
> >                 return;
> >
> >         /*
> > @@ -2699,7 +2708,7 @@ static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
> >          * see if it is pushed or pulled somewhere else.
> >          */
> >         if (p->nr_cpus_allowed != 1 &&
> > -           cpudl_find(&rq->rd->cpudl, p, NULL))
> > +           cpudl_find(&rd->cpudl, p, NULL))
> >                 return;
> >
> >         resched_curr(rq);
> > @@ -2948,7 +2957,7 @@ static int find_later_rq(struct task_struct *task)
> >          * We have to consider system topology and task affinity
> >          * first, then we can look for a suitable CPU.
> >          */
> > -       if (!cpudl_find(&task_rq(task)->rd->cpudl, task, later_mask))
> > +       if (!cpudl_find(&rcu_dereference_sched(task_rq(task)->rd)->cpudl, task, later_mask))
> >                 return -1;
> >
> >         /*
> > @@ -3232,7 +3241,7 @@ static void pull_dl_task(struct rq *this_rq)
> >          */
> >         smp_rmb();
> >
> > -       for_each_cpu(cpu, this_rq->rd->dlo_mask) {
> > +       for_each_cpu(cpu, rcu_dereference_sched(this_rq->rd)->dlo_mask) {
> >                 if (this_cpu == cpu)
> >                         continue;
> >
> > @@ -3358,7 +3367,7 @@ bool dl_task_needs_bw_move(struct task_struct *p,
> >         if (!dl_task(p))
> >                 return false;
> >
> > -       return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
> > +       return !cpumask_intersects(rcu_dereference_sched(task_rq(p)->rd)->span, new_mask);
> >  }
> >
> >  /* Assumes rq->lock is held */
> > @@ -3368,9 +3377,9 @@ static void rq_online_dl(struct rq *rq)
> >                 dl_set_overload(rq);
> >
> >         if (rq->dl.dl_nr_running > 0)
> > -               cpudl_set(&rq->rd->cpudl, rq->cpu, rq->dl.earliest_dl.curr);
> > +               cpudl_set(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, rq->dl.earliest_dl.curr);
> >         else
> > -               cpudl_clear(&rq->rd->cpudl, rq->cpu, true);
> > +               cpudl_clear(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, true);
> >  }
> >
> >  /* Assumes rq->lock is held */
> > @@ -3379,7 +3388,7 @@ static void rq_offline_dl(struct rq *rq)
> >         if (rq->dl.overloaded)
> >                 dl_clear_overload(rq);
> >
> > -       cpudl_clear(&rq->rd->cpudl, rq->cpu, false);
> > +       cpudl_clear(&rcu_dereference_sched(rq->rd)->cpudl, rq->cpu, false);
> >  }
> >
> >  void __init init_sched_dl_class(void)
> > @@ -3440,10 +3449,10 @@ void dl_add_task_root_domain(struct task_struct *p)
> >         cpu = cpumask_first_and(cpu_active_mask, msk);
> >         BUG_ON(cpu >= nr_cpu_ids);
> >         rq = cpu_rq(cpu);
> > -       dl_b = &rq->rd->dl_bw;
> > +       dl_b = &rcu_dereference_sched(rq->rd)->dl_bw;
> >
> >         raw_spin_lock(&dl_b->lock);
> > -       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
> > +       __dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_sched(rq->rd)->span));
> >         raw_spin_unlock(&dl_b->lock);
> >         raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
> >  }
> > @@ -3504,7 +3513,7 @@ void dl_clear_root_domain(struct root_domain *rd)
> >
> >  void dl_clear_root_domain_cpu(int cpu)
> >  {
> > -       dl_clear_root_domain(cpu_rq(cpu)->rd);
> > +       dl_clear_root_domain(rcu_dereference_sched(cpu_rq(cpu)->rd));
> >  }
> >
> >  static void switched_from_dl(struct rq *rq, struct task_struct *p)
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index f79fcba4afec..51b28440d05d 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -7865,13 +7865,10 @@ static inline void set_rd_overutilized(struct root_domain *rd, bool flag)
> >
> >  static inline void check_update_overutilized_status(struct rq *rq)
> >  {
> > -       /*
> > -        * overutilized field is used for load balancing decisions only
> > -        * if energy aware scheduler is being used
> > -        */
> 
> There is no reason to remove the comment above

Agreed. That was an unintentional drop while updating the function to use
rcu_dereference_sched().

Kind regards,
-- 
Aaron Tomlin
