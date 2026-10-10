Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6951B286D5E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602040; cv=none; b=ajmyot6xQqaEPGm40V0+xPlecmXhBN9UzaENw6WWIkUwCFXhRSZzfoYG/C/IS8aY2W9+T4tN546bTPf5lfjnOtXxIOHRgoq3yzk2oKWSi7x2OYcTLi2wExmvAYYBrf4H6aqM5s9bofIYya5MVqDL9E5jzIprCnyqj+zPK2yRlT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602040; c=relaxed/simple;
	bh=9+oijFs0RtndlFAcrXit8W2owPEF6zilZOegvpMhbbU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=TcvbhLhIz7NQDr29SUUPHOkptuGgzODhEvd+IX/Y6BiQQYdAM/HOIeq3o0z42+H//bQvVN3sg6LmDQOMLq49u8CjcHCHm5kKPGu2mS9Ry80ridLLdyu3nZl0710BHeBVRQA9quXfBvJiryXJn5nbMCjXe/u/oIZ7/67vXfv+Arw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vef2rv7Z; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vef2rv7Z"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so108625a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602038; x=1792206838; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=52r0DQA6VHslRPY4d465zT8bD3IZsbQHeenHGiRXH1E=;
        b=Vef2rv7Ziif3/8eCWeO+/I2oAOVcs95BMAnh5IEH1BImRlYw9R47afCkp7CyP42Yfk
         UH8APDeIOZWIzNUJPnxYwVzo2jRT9fP7zZbMW3xaWYR43nG/PCKk8O6Quv1oyglulvXE
         2drzGa+vK/ogW43In+jfzjbj7XchLwIdt1qowWkvXZMlrsCZ7TqH40ReWtqS/sQDEtXB
         p8uLo1XYLW8W+w5SZ2al8Yn2M+a7Tlo3KwVbkD5f9KgN1aqo6E0njtZdM/fYrTLBtSbw
         nfwYTarUAyMRBIoc6Uwwnn3Px2JKLxCkjVstBaVMs9rAN6pg57rFQVWkOX/bjA/lcR5L
         JiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602038; x=1792206838;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52r0DQA6VHslRPY4d465zT8bD3IZsbQHeenHGiRXH1E=;
        b=BiaF2qtXzxIqytlC0xg5SzYghQ++T7X/rBimm4nAqibK38TSi8H3aBsz21ZL5vgfwW
         fgzKohR/ppk0UVroNq1CEkEMfPVldM+8hC9bG2yfni1l28L0z/oIZvcP41Wl+iAZnsui
         FQP6CZoYk96W82Sqdbz1XwmpzwXyGbO72Ns5Updiyn6VrhxBafHbNcr62lzjsO8o93Db
         zougS0ZICakhJbdi0kuXvY+3KdvaBVlqJgez7jE9qCe2JX3Xpw48dWRXWpXEOtoTLR+C
         f1kp8ni8LmX9RJt4mm9D2kCsE7LM+fO4QqbQtaXXiIQ0gVyYMQhd/OtG32dO5354zXY8
         409Q==
X-Forwarded-Encrypted: i=1; AKwUvByiy+EoXcC51NUIblQnEdgBPkaXnA6AnU71WmUqnbM4R0YipdAStp3PjJRAdOPta7W3ZazF3fB46zK6GkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLe4+jPByRQw/gvwQbEVgIyQfTy3+U3d732jDHfpRg192/TGpB
	ghpZh3qIK1vz+EQNFKYnoiDxmcQdeSo0O0QtzwbYFX074Q2mMuklkWW5
X-Gm-Gg: AYBFou1h4Dp7rLXwNfkyGaBzahnI8SNlmIJ4m2kD3lSCYUG4EERDpN2dlr48xqLlfpE
	GwK0h3hve6Ml1LVcntHzIvcXSs9z7LOG4Xzh+4DXAhPFnT5QtPa8AnUVtHqHepea1jXZP1t9aOA
	T33TL9Uxe+iv+N8hEkAdBa9JJj8i6qdrQ410LpzlV4UV/C16UTKtMMDBtKZJfp9cae7alsE5vvf
	3kXvSQ7GnfiiuCnsK4wE8RJGsybYUM+Joxy9y56M4ISPid6rfMMTXWktpteGenLVKUXIdPRTfyc
	Fc2va/3qKgxIbHSbwtJkKMXvje1w24AVJVaafJQctnGqrPv0YaqsJPBnbIRB3J/y9lUrISvj03q
	rGHPb6BVWt4rT9pDaONhTL0PdZnldQntAEL71pMbQGULI5NEIxYVyjxSbq9PRCGuAVJlJGrP9UI
	acqJl0jOzqi8m+qoX1cr2YSofHpEG3zuiYoaHRbEa1N1Hmu4Pvr+7FH+VNnrNpszg=
X-Received: by 2002:a05:6a21:6b85:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3e16bf7f829mr3219499637.11.1791602038529;
        Fri, 09 Oct 2026 20:13:58 -0700 (PDT)
Received: from smtpclient.apple ([2a05:dfc1:8bc4:feda::10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e53f8bsm1862872a12.24.2026.10.09.20.13.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 20:13:56 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.66.1.3\))
Subject: Re: [PATCH] sched/cache: Remove the old cache group footprint on exec
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <b73d47b04b62d2637920f59134b632d607a71aee.camel@linux.intel.com>
Date: Sat, 10 Oct 2026 11:13:31 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Chen Yu <yu.c.chen@intel.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <650309CC-380D-4EC6-88F7-45A2CEA0F33E@gmail.com>
References: <20261009151215.62878-1-jemmywong512@gmail.com>
 <b73d47b04b62d2637920f59134b632d607a71aee.camel@linux.intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
X-Mailer: Apple Mail (2.3901.200.66.1.3)

Hi Tim,

Thanks for the review.

This was found by code inspection, not a workload reproducer.

I'll mention vfork() and clarify that the issue mainly concerns
longer-lived CLONE_VM tasks that accumulate NUMA faults before exec.

I'll also add the Fixes tag and document that footprint subtraction
must precede task_numa_free() resetting p->total_numa_faults.

I'll send v2 with these changes and your Reviewed-by tag.

Thanks,
Jemmy


> On Oct 10, 2026, at 5:01=E2=80=AFAM, Tim Chen =
<tim.c.chen@linux.intel.com> wrote:
>=20
> On Fri, 2026-10-09 at 23:12 +0800, Jemmy Wong wrote:
>> Exec replaces the task's cache group before resetting its NUMA fault
>> statistics, but only the exit path subtracts the task's contribution
>> from the old group's footprint.
>>=20
>> Although de_thread() removes other members of the executing task's
>> thread group, tasks created with CLONE_VM without CLONE_THREAD can
>> retain the old mm and cache group. The executing task's contribution
>> then remains in that group without further updates or decay, =
potentially
>> suppressing cache-aware aggregation through the LLC capacity check.
>=20
> Thanks for catching this.
>=20
> It might help to mention vfork() explicitly, where the parent keeps =
the old mm
> alive while the child execs. In practice a vfork child rarely builds
> up NUMA faults before exec, since NUMA scanning starts late, so the
> leak mostly matters for longer-lived CLONE_VM tasks that later exec. =
If
> you have a workload where you saw this, please mention it. Otherwise,
> saying it was found by code inspection is fine.
>=20
> Please also add:
>=20
> Fixes: b636fef85bda ("sched/cache: Introduce =
task_struct->sched_cache_grp to fix UAF")
>=20
>=20
>>=20
>> Factor the existing footprint subtraction into a helper and use it =
when
>> leaving a cache group on both exec and exit. Subtract before dropping =
the
>> old group reference, preserving the existing underflow protection.
>>=20
>> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
>> ---
>> kernel/sched/fair.c | 51 =
++++++++++++++++++++++++++-------------------
>> 1 file changed, 29 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 57360f5cdde4..af182c9fcde7 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -1771,6 +1771,25 @@ void sched_cache_fork_cleanup(struct =
task_struct *p)
>> RCU_INIT_POINTER(p->sched_cache_grp, NULL);
>> }
>>=20
>> +static void sched_cache_footprint_sub(struct sched_cache_group *grp,
>> +       struct task_struct *p)
>> +{
>> +#ifdef CONFIG_NUMA_BALANCING
>> + /*
>> +  * Remove this task's contribution when it leaves the group, either
>> +  * through exit or exec. Other thread groups sharing the old mm can
>> +  * keep the group alive after exec resets this task's NUMA =
statistics.
>> +  * Unlocked for performance; clamp to avoid underflow.
>> +  */
>> + if (grp && p->total_numa_faults) {
>> + unsigned long fp =3D READ_ONCE(grp->footprint);
>> + unsigned long sub =3D min(fp, p->total_numa_faults);
>> +
>> + WRITE_ONCE(grp->footprint, fp - sub);
>> + }
>> +#endif
>> +}
>> +
>> void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct =
*mm)
>> {
>> struct sched_cache_group *old;
>> @@ -1780,6 +1799,7 @@ void sched_cache_exec_mmap(struct task_struct =
*p, struct mm_struct *mm)
>>  * the old one. @p is current and the only writer of its own pointer.
>>  */
>> old =3D sched_cache_replace_grp(p, =
sched_cache_group_get(mm->sched_cache_grp));
>> + sched_cache_footprint_sub(old, p);
>> sched_cache_group_put(old);
>> }
>=20
> This relies on running before task_numa_free() in bprm_execve()
> clears p->total_numa_faults, and nothing enforces that ordering. A
> short comment here noting the dependency would keep a future exec
> rework from quietly bringing the leak back.
>=20
> With the changelog and comment tweaks above:
>=20
> Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
>=20
>=20
>=20
>>=20
>> @@ -1787,19 +1807,7 @@ void sched_cache_exit_mm(struct task_struct =
*p)
>> {
>> struct sched_cache_group *grp =3D sched_cache_replace_grp(p, NULL);
>>=20
>> -#ifdef CONFIG_NUMA_BALANCING
>> - /*
>> -  * Subtract this task's footprint from the group before dropping =
the
>> -  * reference, so the group footprint converges as its threads exit.
>> -  * Unlocked for performance; clamp to avoid underflow.
>> -  */
>> - if (grp && p->total_numa_faults) {
>> - unsigned long fp =3D READ_ONCE(grp->footprint);
>> - unsigned long sub =3D min(fp, p->total_numa_faults);
>> -
>> - WRITE_ONCE(grp->footprint, fp - sub);
>> - }
>> -#endif
>> + sched_cache_footprint_sub(grp, p);
>> sched_cache_group_put(grp);
>> }
>>=20
>> @@ -3975,16 +3983,15 @@ static void task_numa_placement(struct =
task_struct *p)
>>  * sharing this mm. Acceptable since footprint is a
>>  * heuristic and occasional lost updates are tolerable.
>>  *
>> -  * If a task exits, its corresponding footprint must
>> -  * be subtracted from p->sched_cache_grp->footprint,
>> -  * otherwise the footprint will not converge: the
>> -  * exiting thread's footprint remains unchanged/undecayed.
>> -  * See exit_mm().
>> +  * If a task leaves its cache group through exit or exec,
>> +  * its contribution must be subtracted from the old group's
>> +  * footprint. Otherwise, that contribution remains
>> +  * unchanged/undecayed while other tasks keep the group alive.
>> +  * See sched_cache_footprint_sub().
>>  *
>> -  * Lost updates and unsynchronized subtraction
>> -  * in exit_mm() can cause footprint + diff to
>> -  * go negative. Clamp to zero to prevent the
>> -  * unsigned footprint from wrapping.
>> +  * Lost updates and unsynchronized subtraction on exit or
>> +  * exec can cause footprint + diff to go negative. Clamp
>> +  * to zero to prevent the unsigned footprint from wrapping.
>>  */
>> scoped_guard(rcu) {
>> grp =3D rcu_dereference(p->sched_cache_grp);


