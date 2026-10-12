Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD778495501
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817844; cv=none; b=QAy8/9iE1pkUf7+qnEbhsyKDWyJrjJ+R/vXBHZJZ8gsV6lvbUFYLam2XPbsYOWMIyXGD3WMMKNdCEOgijthtTXbXBFb5A0osXIsmGb2FpAKiVb+NL2iVegt6o7hsZ0r1UvJUUKpfLw/6CjKzi/pCNqQR+6PlY3EjFSIun/fQax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817844; c=relaxed/simple;
	bh=1PHiJKfIu/xgpU6yu//46s7pC17OiPpMEaZQ7hjjN8o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=prrzqQD0f8oqPphJD/u3GFhAz591GXcPzrzTbv4FwA5S2wx27i18wCDooU/Pof3oqp6J//JFfUOaK51xLAOys2QsR7NUozeE6zESe8LsPZZlMnAYz+FPTQMn3EFu+5kVCXF8JF8ZRz5pyixYWDTcGTCVrGh8HO9PO/hfpB6JrU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTbWEN5K; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTbWEN5K"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso1199803a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817843; x=1792422643; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hO+FHd9uBYhjyWiOpPtUThCmwGDvjw8N9QAPK2ScTYs=;
        b=GTbWEN5KLN8HDg/NZucUh2fAEZEsH1TOEtGx4vHhi8aY0zISQdEoIlH5baUsp5bdAc
         cu7DkNXoL3fC5baYw2MQrIk7slS+vUU0MoGHMSzYrnneJ2nUQ4Qn1+08FxpHB4w6JW4p
         SBnJ6PK9Hr8DLK/Y7eToK11/lEpYahxHmm4KVGpyAVkeWYfJSeq+IiiYj0LcPXbg9Fhx
         /9ZEon2YQhDcGuZZ9HDdmtKS9oKWZtzGHS6XW1s7Z3WJ3g5WkkD2v9AG4BQrFjhHBA0S
         Tknf1MHBwma1/B9/0ZMZGWeKAkx8tW4qfjbcp9EB+m+0lwtDDPeO8OqYW8iFcsIvey+J
         rp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817843; x=1792422643;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hO+FHd9uBYhjyWiOpPtUThCmwGDvjw8N9QAPK2ScTYs=;
        b=Iz0uEm+012rdOEDZoe3NP3LmWpBdX6uT2WFOfSt2vHPg714sdZ7QEOwq+NW8AcbRP+
         ap20OY1T9k6w/gBIxOd82VUYREA6KW9vTwzTSKcBu2vvnpfG3isR9FYXc/OrEQBiUGK5
         RMoUXqQ2Pnu+UKQ5+FEi2BLfp3fYYZvyNS8vBZAi5kcsukBh02v+re+62cYkFx22qvr5
         Mp20ws6kFHTCYV3TwLZa9vrAm5VcEfOmXNZHcWVT41KW5/r+c8DCIdUfT/c8dB345gCU
         cBl+sqpfXhXdfNTzvQlX3jP5W1uqWb70nD4bNIhNotYEhLtcKlyv5K70IgpWYXokGXpL
         baCg==
X-Forwarded-Encrypted: i=1; AKwUvBymqqXQckYQZOCffbjb7P1XdsCiQmKrg3DvxlHGXgjtWSQsyKeHG8QqCej/nqZ9Q1U9E4aKLrT3kFLjlGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuejeucPTMRhmzS+Ht43x/cFQ2mOjKhH7gOUn4Kv/b1H1bpKqd
	HDAmbThkkOmYBxeB7Qt3lj5PAXQ2KvqcV1pxkMm+0nHz26tI+mkr1yw4A3dhepCa
X-Gm-Gg: AYBFou2tnCHiKIgUDQ23dHSUYCbBtMIm6ESInXV9VIotpfyQ2h8F37ucYB/V6OQeR/2
	gIIoShPC1aQelLfsw4PwoXs5N/4j8a22MYiiW12qZjYP2vNF9xccg9pqqQcPOEIhtWxjh3rTgzW
	hJ0Rhnvln1Xb993wTk3MfdXBA7pp7L/yYkSLwpwRma11I+cYqs/S8jt3dI8B3SrEqD2YQJSD4i8
	E3YNj/ZV6kZX6ZvWLUxv2HgmDLAOn+5BXwlUGODSPIo51YBG8ixw1ABUEjtCreLXyzkZuOd5eig
	X2t3Eb5BUJQIQColFOsy/8DBuqZlY26bsg0xGHMQWHCqSIAipIEsailoH8PE/37duBHSo4vDHBQ
	cDsntJP4x0cuNyPkxXDuEAzk62siHWunl6dTf2u75Qxt8U9qL9oq2TbvxitnWAhVqTmmAM24SgD
	tfBYjh6ThyulUxf7uqrJIMYMmDCWxZ7oLIMDNtDJz0J5DlTWz76rWBvs1xC/emycGb/evnScqaP
	sm4mw==
X-Received: by 2002:a17:90a:d007:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3ac3588b5edmr310571a91.13.1791817842956;
        Mon, 12 Oct 2026 08:10:42 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm17520355a91.17.2026.10.12.08.10.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:10:42 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.66.1.3\))
Subject: Re: [PATCH] sched/cache: Avoid publishing partial LLC utilization
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <7c4dbf1d-ba28-484d-b7e1-a713414c284d@amd.com>
Date: Mon, 12 Oct 2026 23:10:10 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A360FD1F-A067-4466-824F-5702E96F3E05@gmail.com>
References: <20261010113425.34829-1-jemmywong512@gmail.com>
 <7c4dbf1d-ba28-484d-b7e1-a713414c284d@amd.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
X-Mailer: Apple Mail (2.3901.200.66.1.3)

Hi Prateek,

> On Oct 12, 2026, at 11:34=E2=80=AFAM, K Prateek Nayak =
<kprateek.nayak@amd.com> wrote:
>=20
> Hello Jemmy,
>=20
> On 10/10/2026 5:04 PM, Jemmy Wong wrote:
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -12121,6 +12121,13 @@ static void record_sg_llc_stats(struct =
lb_env *env,
>> if (env->sd->child !=3D rcu_dereference_all(per_cpu(sd_llc, =
env->dst_cpu)))
>> return;
>>=20
>> + /*
>> +  * Affinity retries can remove CPUs from env->cpus. Do not publish
>> +  * partial utilization against the capacity of the whole group.
>> +  */
>> + if (!cpumask_subset(sched_group_span(group), env->cpus))
>> + return;
>> +
>=20
> nit.
>=20
> When sched_balance_rq() does a "redo" and arrives here, env->flags
> will always have LBF_ALL_PINNED set.
>=20
> That would be a much cheaper check compared to cpumask_subset() to
> ensure env->cpus covers all CPUs.
>=20
> Thoughts?
>=20
>> /*
>>  * At this point we know this group spans a LLC domain.
>>  * Record the statistic of this group in its corresponding
>> --
>> 2.25.1
>=20
> --=20
> Thanks and Regards,
> Prateek

The redo part is right, but LBF_ALL_PINNED reflects the previous
busiest rq, not whether the group being recorded is fully covered.

For example, if cpu1 in LLC0 {cpu0, cpu1} is rejected as all-pinned,
we remove it from env->cpus and redo. The next scan still carries
LBF_ALL_PINNED while recording LLC1 {cpu2, cpu3}, which remains fully
covered. The flag check would skip that update; cpumask_subset()
would not.

It also misses the hotplug window: when cpu1 in LLC0 {cpu0, cpu1}
becomes inactive, a new balance pass can exclude cpu1 from env->cpus
before the domains are rebuilt. The group span and capacity still
cover both CPUs, but utilization is summed only over cpu0.

LBF_ALL_PINNED is clear on this first pass, so the flag check would
allow that partial publication; cpumask_subset() would prevent it.

So I would keep cpumask_subset().

Thanks,
Jemmy=
