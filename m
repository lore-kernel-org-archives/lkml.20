Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702443;
	b=Z3l+s5y8WXGUWDZI1H/eLaf8ywCDK5Tk+pO3HFZFXyXDFHiR0i0yxZK99raj9D0Njl/y
	 kB7g+ZAUNy65jA1gz6D5YK2qUbhDfWCXpA5ThxnFo2mkWHEH65Q1yGzKIXRx6VDJsDtUs
	 tY8mteM+Qw5zxeASP2C3An5Hx3t5yrrqYBVll4c9w3x2c7d9OCkRrs7E2G7Q6OZZkLJIF
	 J1V5B5oF75Khgmt36dGiO2kGAYng60DgyOqRYcZiV7ul4fkxbSTlD4vXYSIyiQGN4Ulis
	 k2+x+3X8HgHVNER+KStJbNZdbLNgSyqAFHYGNpA5yuC58JjvDnTaHpVBhWXsYPRWz2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702443;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NZQ/jxaXhmx3+NGsx5iUfLAnkKxEwFa1sS+NnNdS1BU=;
	b=IR4sbmJSn1YTg67Q09cqto57+bhRfM074wq9KCm+KiTKzP9SMhhVJPdLm6b86eNIi6e1
	 Kmbk6tXLb80opWrYpfdJNGQ4Ggtz50fiddb1LUM22JP0Kvc0mDbbiGhzrM3xYaoR7gru4
	 TRFAnBUPEV8JAwtz5ZyH81WO5jbdX+9pA/tTO7uvUFlstXxucIv48p0f9HRIcnTNszTbE
	 y5nJaGIYdnsmoV5rVTYmBsh/Ijvt7tNYyrUOKgeayTu5NGUJhXSbSn4gQeOi/+STC154W
	 fKwfBn5HX5rMzA7Khu2gSizyzy0fPoWGFnNgPDtBqn7Sp4eHCaSCMVs0GoChklEKCMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="iXAn/3Js";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xutu1B2b;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90964606B103
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90964606B103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iXAn/3Js;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Xutu1B2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793702441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NZQ/jxaXhmx3+NGsx5iUfLAnkKxEwFa1sS+NnNdS1BU=;
	b=iXAn/3Jsm97Maw+PlGysJVc0u8x/c7PLIy7hEyuDzeb2Wvh/10C4B9rAi77j4716uYYmtz
	wi2zeVIvAUj+nmSAiHh8vd0DtUzGR8Zd3vWI13yheCVc2U3qA457wTddTD8t12arwgznff
	IAne8Vg/bA/YmrENOK/ZExNQhU2ScCQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-Ug_Dl4H7NJ2g9QmR3pwAmA-1; Tue, 03 Nov 2026 05:40:38 -0500
X-MC-Unique: Ug_Dl4H7NJ2g9QmR3pwAmA-1
X-Mimecast-MFC-AGG-ID: Ug_Dl4H7NJ2g9QmR3pwAmA_1793702437
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b02d63407so3157113f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793702437; x=1794307237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NZQ/jxaXhmx3+NGsx5iUfLAnkKxEwFa1sS+NnNdS1BU=;
        b=Xutu1B2bUUt7tnZD4k8e6cAEgx54tG2RtY6d9c4Yr3BRFz0kpzA/6tBWYPLyQ4PpfM
         DNGC9UX385HDdGhgQcCCXdI6TN5ZT0FEsn0tWM+uDpLjCePEEPHLRGe7naYEDUpxNCuR
         VAx3rjQ9Ok5qDVV0kL3OvP9N+UKoIDlK4QmCkQhHw5QufOekI6/+dtTteItI8mN6BO/i
         F6cfoFdFg/XK5y+r5ZdIPlWQGsA+4y0QrP17lo+K11H/30e5e5i5oZVkLqc19iwmRsOd
         H6NUXFPB/A36IpTAsS3ycDUHQ0d8MXr57w/MfqzJv+81hIaT3ztHMKRSjPu7dtyDAOOA
         NYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702437; x=1794307237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZQ/jxaXhmx3+NGsx5iUfLAnkKxEwFa1sS+NnNdS1BU=;
        b=VX493S6WlVivEn7PslWOlUbMsz4q103pg5YESc186JwdbYg5dECrgekgre7be7TXbg
         lllZVpu85EkmhenQMGrNt58NDgv6UTqagGT3rkl5ZAkFwh+D9QvKfECZT0dnCMIJ2BIM
         PNyPOH0CBz+MkRH0byAetncpZ362raiAUCTK7GF5lQa7mqmYJvZXqJ49nxw1fopGU6RB
         K/1H9HBQyilvr8cbRQFXe9fMWZcQZgfPUiPCWttt3QChk3gudzsNYun+n74od042sI6U
         KBlLvdJyS1HjjRBKZUyBTpO4Y59gq5eWSCWRHsFFmQWjx1GRT3e9WKz8MwRVLF/S7CSV
         QxLQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0lYYvTap4gtlB3T7EhnhrPt53bXwV0QGnDgpFjeU8KJFocviO43WcJ/sWPV1xHTVuYAwwj8zYrXhJiSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RqxWPWwHs6bxi4JiaDGSjsHgyh33PxhS26/Mw+WyDueFsujzw
	RQaKmRY6Ph+A0+k7tiVSDAbNXQ3cAS5gUs2ixD1VRiyP5xuvX/muw5faAhPRvNpkKJMggOtWQmC
	53lPGCEo0aSLOi+krV+dhJh5Jjl6L2KJmrpONjvLXlD3Mm0w3r7/Aqnur0tJ50iRO6xNrcvFJFw
	==
X-Gm-Gg: AYBFou0RfY8rfJcnbMfBTM9Rfv1+8PFGaVcbZIERlRDwd9CwbZfJ18EYqHEPDqgXnwM
	8zSYZGLb2NvJhJOocaIaWiZxMOIDduDS36PI43+CpyGSbyLQy094ZETGYTQRYExp54zP/ipBoX7
	1s5cc+cI+OyKhlG4NFjh+tAzQ0DmpLXefmCrHIqu0cv3Xfrhs6LREi8uyLfJ8NOkVHz0b1CgMFV
	kNgMz4Gc8kIvU/BY2sYUazWMNbgh09TcfiW5e2gSBJ66oDQA625BNM6+HU24iLeCbpDrfFyacSU
	lZt0pW6D4WiA06gwj5WlSdUe0dn0IK7jJ+PnlCRGglvbljCSa4OfofIlcdSIqD4UuRtFCrkCNi7
	IKTTf159CQbJq98SRr+9ZaQLefeE/J2w/AsCkC1+C0zFrUJa5aMCrokqKkpNAkKtQ374KMwN5gt
	uXDw==
X-Received: by 2002:a05:6000:2885:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-48e6e2c2536mr26477986f8f.1.1793702436853;
        Tue, 03 Nov 2026 02:40:36 -0800 (PST)
X-Received: by 2002:a05:6000:2885:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-48e6e2c2536mr26477952f8f.1.1793702436456;
        Tue, 03 Nov 2026 02:40:36 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm24096953f8f.27.2026.11.03.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:40:35 -0800 (PST)
Date: Tue, 3 Nov 2026 11:40:32 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
	Hui Su <sh_def@163.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Fix cpuset_mutex double unlock in
 __sched_setscheduler()
Message-ID: <aum6IBxgdiJ09Kiv@jlelli-thinkpadt14gen4.remote.csb>
References: <20261102134606.242743-1-parri.andrea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102134606.242743-1-parri.andrea@gmail.com>

Hello,

On 02/11/26 14:46, Andrea Parri wrote:
> A sched_setattr() with SCHED_FLAG_KEEP_POLICY on a SCHED_DEADLINE task
> unlocks cpuset_mutex twice if the task's policy changes concurrently:
> 
>   WARNING: bad unlock balance detected!
>   7.4.0-rc1 #1 Not tainted
>   -------------------------------------
>   repro/126 is trying to release lock (cpuset_mutex) at:
>   [<ffffffff9a17cacc>] __sched_setscheduler+0x9cc/0xc40
>   but there are no more locks to release!
>   ...
>   Call Trace:
>    print_unlock_imbalance_bug.part.0+0xfb/0x110
>    lock_release+0x286/0x2e0
>    __mutex_unlock_slowpath+0x1a/0x400
>    __sched_setscheduler+0x9cc/0xc40
>    __x64_sys_sched_setattr+0xa3/0x1b0
>    do_syscall_64+0x106/0x5f0
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> __sched_setscheduler() samples p->policy before taking any lock, and
> restarts from the recheck label if p->policy differs under the rq lock.
> The restart drops cpuset_mutex but leaves cpuset_locked set, so a pass
> that no longer needs the mutex still unlocks it on its way out:
> 
>   CPU 1                                CPU 2
>   __sched_setscheduler(KEEP_POLICY)
>     policy = p->policy /* DEADLINE */
>                                        __sched_setscheduler(SCHED_OTHER)
>                                          p->policy = SCHED_OTHER
>     cpuset_locked = true
>     cpuset_lock()
>     rq = task_rq_lock(p)
>     oldpolicy != p->policy
>       cpuset_unlock()
>       goto recheck
>     /* no cpuset_lock() this time */
>     ...
>     if (cpuset_locked)
>       cpuset_unlock()
> 
> Without CONFIG_DEBUG_MUTEXES, or CONFIG_DEBUG_RT_MUTEXES on PREEMPT_RT,
> nothing warns. The second unlock still clears the owner field regardless
> of who holds the mutex, so another task can lose cpuset_mutex inside its
> critical section. Entering SCHED_DEADLINE needs CAP_SYS_NICE, but a
> racing caller that owns the task does not need it if it samples a policy
> other than SCHED_DEADLINE.
> 
> Clear cpuset_locked when dropping the mutex for the restart. This should be
> safe because the flag is only tested on the paths leaving the next pass,
> after that pass has set it again if it took the mutex.
> 
> The following program, run as root, reproduces the splat, which no longer
> appears with this applied. On PREEMPT_RT it crashes the kernel within
> seconds, which this also fixes:
> 
>   #define _GNU_SOURCE
>   #include <pthread.h>
>   #include <stdint.h>
>   #include <sys/syscall.h>
>   #include <unistd.h>
> 
>   struct attr {
>       uint32_t size, policy;
>       uint64_t flags;
>       int32_t nice;
>       uint32_t prio;
>       uint64_t runtime, deadline, period;
>   };
> 
>   static volatile int stop;
>   static volatile pid_t target;
> 
>   static void set(struct attr a)
>   {
>       a.size = sizeof(a);
>       syscall(SYS_sched_setattr, target, &a, 0);
>   }
> 
>   static void *sleeper(void *arg)
>   {
>       target = syscall(SYS_gettid);
>       while (!stop)
>           usleep(1000);
>       return arg;
>   }
> 
>   static void *switcher(void *arg)
>   {
>       while (!stop) {
>           /* SCHED_DEADLINE, 2us every 1s */
>           set((struct attr){ .policy = 6, .runtime = 2000,
>                              .deadline = 1000000000,
>                              .period = 1000000000 });
>           set((struct attr){ .policy = 0 }); /* SCHED_OTHER */
>       }
>       return arg;
>   }
> 
>   static void *racer(void *arg)
>   {
>       /* KEEP_POLICY | KEEP_PARAMS */
>       while (!stop)
>           set((struct attr){ .flags = 0x18 });
>       return arg;
>   }
> 
>   int main(void)
>   {
>       pthread_t t[5];
>       int i;
> 
>       pthread_create(&t[0], NULL, sleeper, NULL);
>       while (!target)
>           usleep(100);
>       pthread_create(&t[1], NULL, switcher, NULL);
>       for (i = 2; i < 5; i++)
>           pthread_create(&t[i], NULL, racer, NULL);
>       sleep(30);
>       stop = 1;
>       for (i = 0; i < 5; i++)
>           pthread_join(t[i], NULL);
>       return 0;
>   }
> 
> An LLM helped find the PREEMPT_RT crash and write this patch and its test.
> 
> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261016062629.2102883-1-sh_def%40163.com
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Cc: stable@vger.kernel.org
> ---

The fix looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

As I said in the other fix, I'm not sure we want to keep the reproducer
in the changelog, or if it's better to start collecting them somewhere
else (it might be easier to actually run them).

Thanks,
Juri

