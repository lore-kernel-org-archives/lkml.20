Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352172;
	b=zhzmO6BQDxqbEHEzEkPmhFKk7YQE1p7O2+IjtiY4BKD6waMhVtml9bHuSVQwt0orK46S
	 Pc4p5UjLGQ/oF8x8+/dyNZhfx1Os9RPZmm1Iu7TiUaMlUvt9fhyUYEpsbCTcu5ReYdCuH
	 gSdnLaHa48IHemLpjcqqhrfSYWutisEGVGzlO5tTQr5Juc8Wzoq1sVjXYTEpVpNrfMFmr
	 K+Gm/QZyE1Oq6f4O1nj49NeEpzlXkYrIS2oddkjZLIyLIAxFyYve7Dj3JVdQ4aEpEwosM
	 AOK8nH8IE5CcWX3uTEg5S3v4yCttMtIySeby8gW1G9m7c22wIgjs+3aQs+pDjb17b8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352172;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TkCOrFNfCxpRc85ogd6l1q1ueIhyoTGwTSv5WtrZ9a8=;
	b=B8D8AHL8nUvpmXPR6fVU457P5Ct3+VDP8tnEJ+gfkEe32b/KSoRCMWFOK0Mx2am8nXMG
	 tqrU0/+r9HIrEvic4YFwHBHlxe7/w3nnlxDVTfrRXyNa5UhqAEcQt8dIRc4aSiU2XJOXF
	 eXy+qjVSbtJKPFxHd8Xx2PxRDcB6hBYScX4Z+HCAN/fJ6NqoSEpXaXf+Jn8OBMNOcwy1R
	 0aVYxwLhBceR70NJZKKTvqECLq8xE99SjmqTV/qCOXMjtoVGH9Oksdu0+70YfrDl0qRaa
	 8CWFYaDp2uU3tNO5FNSNzEXlrcdenOE5GFfVlJ+RuWoB8UBdZ8O0nCCYGK2ZyC+zoVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MocM69GS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JCcPKkgf;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B16606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B16606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MocM69GS;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JCcPKkgf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793352171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TkCOrFNfCxpRc85ogd6l1q1ueIhyoTGwTSv5WtrZ9a8=;
	b=MocM69GShRnV0vmMdnDdTVe3+hhBS7fpqiO/Kc5zKJ1WsGTBYyOayh8TYvVcca8SVvAQzt
	CJJlgG3xn2ck9rbr+R4BFVkJAGY3ORUKgd9u6RdX5GMcaXtFcHoKZc3X2I+KCdXybyD4ri
	KpAMMaYtA4JeTu4iGuzlVJlkV5H4PxI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-ZZufUMKeMD6A5_juHLFu1g-1; Fri, 30 Oct 2026 05:22:47 -0400
X-MC-Unique: ZZufUMKeMD6A5_juHLFu1g-1
X-Mimecast-MFC-AGG-ID: ZZufUMKeMD6A5_juHLFu1g_1793352166
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so265825f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793352166; x=1793956966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TkCOrFNfCxpRc85ogd6l1q1ueIhyoTGwTSv5WtrZ9a8=;
        b=JCcPKkgftAhnd4KeB0BysBqu20IB4yl+UU6hoJ3TfvS+m3/TOZQuNOyUgubM+yYFLN
         oPnCXW12NNbs6mgMSSeMf38mfRBz8RcbQ3sBKEpr1vTOGkQCFG8P6nH0N2cHmUd9UDuo
         EwEDZR34aHodE/HoHHnStzz+2x/kBCkDjux9HA4c5TTqnqfHCPV8bXQ9GgvlmRtRpSLt
         Jtx6Pv9QxHqDgb8/cF3+/1zvo70G9/7VvpFnT6d+ViPrNS4DfNrFl+jKOhZeGjayQIOP
         /fGBaOzro29pU55ZxEu/HLVQYR9MzU59PcUQRzQ1Y5l8D6iHaINLMpHlS6gMMTq6Btuy
         3p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352166; x=1793956966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkCOrFNfCxpRc85ogd6l1q1ueIhyoTGwTSv5WtrZ9a8=;
        b=FH23CKtKgcjoZkhR7pIjANraPiRTGxaNS/ZI/MfH86AazQ/Y2bRVBBqlfHEBVEP6BQ
         iqk5ocKTbyXYcSGNFVkyQNguNHGzJArpzmP1zXa1pk7QLJwdfgCOkASh19kyaOyD2eA3
         WY6L26RGufcEOBICYGiJH3QR/sKbuBEAXSQUpnsJ4t8WBPBeZ84IgFnK9gqyAnkqI5y8
         SZdo0TywxVkZ844X3w9726MJZucVN4NsJxu1ELjI/hnBnhtCgurHtG5uqROqli+OYBQ5
         Nzvtn64MQGmAAodWJfqj3obBgLG0tJnyO295KlDhwTU6tyJTxZbMza5xUpwx8FwaUW/8
         3Pxg==
X-Forwarded-Encrypted: i=1; AKwUvBwUYtOZpIZEcUgJnDeKC4SFxO1lsb5fJp6fvYUz95gJlAooJF5Lh3ooyu/ZaM1ZFkmNIcy+oehE9AMym84=@vger.kernel.org
X-Gm-Message-State: AFq9FYInwnjOmmTfGcEarsAdLLi+1UHn1AO42YjJdJ/GAzFwHbeCOr5B
	NXxk1dphhO9qmww4u6B8SEEXWYCLcvJikuoBkvYnZ7GlhVr1Y/B6ydltRXQVXUxPjj1hYcSDVXB
	1cofGKGHiyKTSHe8Fgm9prtfoeF0mEKFimFwf/+6G/m4d++qOgx7eI+Y3aY4QLg3V4A==
X-Gm-Gg: AYBFou17Nw24JJ0E2di0DR1g7ffMcH0FWHSBTNAQu+qSjQlSsR6t4fI2/ZcLWA/LZ9W
	WjO6P6XxUDkl1dLkvpbMwpO+A17nHUHnoVWAdz/x8Tt7NNepkIGvSmzwXRTRaWsTuMQxD3KeBMJ
	xXgcAdgTQQW3z36SucRY4UiL26L05Ax0o1TFUW65Rn/NB7jogKJn9NKvCgyOOoPYyoDLVNhZnTt
	xpXdrlKeiHejJHf6uc7lc6hgIGZ/5Q4yEDB6VPMZF3/8vX4jagUKu8H2294zA4qReDOuiNr5z8H
	OQ9TfC2IQ1zz9CHA2kZxNkMtraZjWUqhRa5phV8p6lfKatHW98w01nNrU1Pb4qeelBo0nqedA2t
	duR6M7GgAIsNxs1tE/bBiH6cGMYUNch4ksCL+lBUEE6oAkK8Cp/GAVrlTeRNn7jWxyKkpViTdE5
	pc8ZA=
X-Received: by 2002:a05:6000:2306:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e6e303c80mr3746367f8f.31.1793352166476;
        Fri, 30 Oct 2026 02:22:46 -0700 (PDT)
X-Received: by 2002:a05:6000:2306:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48e6e303c80mr3746333f8f.31.1793352166097;
        Fri, 30 Oct 2026 02:22:46 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.0.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba5dc2sm2083851f8f.54.2026.10.30.02.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:22:45 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:22:43 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Andrea Righi <arighi@nvidia.com>, sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: sched/deadline: total_bw leak when a task leaves SCHED_DEADLINE
 while not queued
Message-ID: <auRh42kZI1xLIWNr@jlelli-thinkpadt14gen4.remote.csb>
References: <2b5fb3f22bca6aa383be8f4781923392@kernel.org>
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
In-Reply-To: <2b5fb3f22bca6aa383be8f4781923392@kernel.org>

Hello,

On 29/10/26 11:55, Tejun Heo wrote:
> Hello,
> 
> A SCHED_DEADLINE task that is switched to another policy while it isn't
> queued (sleeping, or stopped with SIGSTOP) leaves its bandwidth in the root
> domain's total_bw. The bandwidth stays after the task exits. The leak
> happens as follows.
> 
> 1. sched_dl_overflow() doesn't subtract the bandwidth of a task leaving
>    DEADLINE and leaves that to switched_from_dl().
> 2. switched_from_dl() calls task_non_contending() only for a queued task.
>    task_non_contending() releases the bandwidth right away if the 0-lag time
>    has passed and otherwise arms the inactive timer, and
>    inactive_task_timer() releases it once the task is no longer dl_task().
> 3. For a task that isn't queued, the bandwidth is released only if its
>    inactive timer is still pending from its dequeue. No timer is pending if
>    the task never ran as DEADLINE, or if it already fired while the task
>    slept. In the latter case the task was still DEADLINE when the timer
>    fired, so it only dropped running_bw. Either way, nothing releases the
>    bandwidth.
> 
> Repeating it fills total_bw up to the admission cap. After that,
> sched_setattr(SCHED_DEADLINE) and CPU offline fail with -EBUSY, and so does
> enabling a sched_ext scheduler, because attaching the ext dl_server
> bandwidth fails:
> 
>   sched_ext: failed to attach ext_server on CPU 0 (-16)
>   sched_ext: simple: scx_root_enable() failed (-16)
> 
> The reproducer below needs root and debugfs, and assumes x86-64 for the
> syscall number 314.
> 
>   import ctypes, os, signal, time
>   libc = ctypes.CDLL(None, use_errno=True)
>   class SchedAttr(ctypes.Structure):
>       _fields_ = [("size", ctypes.c_uint32), ("policy", ctypes.c_uint32),
>                   ("flags", ctypes.c_uint64), ("nice", ctypes.c_int32),
>                   ("prio", ctypes.c_uint32), ("runtime", ctypes.c_uint64),
>                   ("deadline", ctypes.c_uint64), ("period", ctypes.c_uint64)]
>   def setattr_(pid, policy, runtime=0, period=0):
>       a = SchedAttr(ctypes.sizeof(SchedAttr), policy, 0, 0, 0, runtime, period, period)
>       if libc.syscall(314, pid, ctypes.byref(a), 0):      # sched_setattr
>           raise OSError(ctypes.get_errno(), "sched_setattr")
>   def total_bw():
>       s = open("/sys/kernel/debug/sched/debug").read().split("dl_rq[0]:")[1]
>       return int(s.split("dl_bw->total_bw")[1].split(":")[1].split()[0])
>   def trial(name, body, stop=False):
>       pid = os.fork()
>       if pid == 0:
>           if body == "spin":
>               while True:
>                   pass
>           while True:
>               time.sleep(3600)
>       time.sleep(0.05)
>       bw0 = total_bw()
>       setattr_(pid, 6, runtime=2_000_000, period=10_000_000)  # DEADLINE 2ms/10ms
>       if stop:
>           os.kill(pid, signal.SIGSTOP)
>           time.sleep(0.02)
>       setattr_(pid, 0)                                         # back to OTHER
>       os.kill(pid, signal.SIGKILL)
>       os.waitpid(pid, 0)
>       time.sleep(0.05)
>       print(f"{name:24s} leaked total_bw {total_bw() - bw0:7d} (0.2 CPU = 209715)")
>   trial("sleeping dl>other", "sleep")
>   trial("stopped dl>other", "spin", stop=True)
>   trial("running dl>other", "spin")                            # control
> 
> On mainline 4dd16e31135e it prints:
> 
>   sleeping dl>other        leaked total_bw  209715 (0.2 CPU = 209715)
>   stopped dl>other         leaked total_bw  209715 (0.2 CPU = 209715)
>   running dl>other         leaked total_bw       0 (0.2 CPU = 209715)

Thanks for reporting and for the reproducer!

Does the below help?

Best,
Juri

---
 kernel/sched/deadline.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5d..5a51368bfc70a 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3530,14 +3530,31 @@ static void switched_from_dl(struct rq *rq, struct task_struct *p)
 	dec_dl_tasks_cs(p);
 
 	if (!task_on_rq_queued(p)) {
-		/*
-		 * Inactive timer is armed. However, p is leaving DEADLINE and
-		 * might migrate away from this rq while continuing to run on
-		 * some other class. We need to remove its contribution from
-		 * this rq running_bw now, or sub_rq_bw (below) will complain.
-		 */
-		if (p->dl.dl_non_contending)
+		if (p->dl.dl_non_contending) {
+			/*
+			 * Inactive timer is armed. However, p is leaving
+			 * DEADLINE and might migrate away from this rq while
+			 * continuing to run on some other class. We need to
+			 * remove its contribution from this rq running_bw now,
+			 * or sub_rq_bw (below) will complain.
+			 *
+			 * inactive_task_timer() will find !dl_task(p) and
+			 * release total_bw via __dl_sub().
+			 */
 			sub_running_bw(&p->dl, &rq->dl);
+		} else {
+			/*
+			 * No pending inactive timer: the task never ran as
+			 * DEADLINE or the timer already fired while still
+			 * DEADLINE (only dropping running_bw at that time).
+			 * Nobody else will release total_bw, do it now.
+			 */
+			struct dl_bw *dl_b = dl_bw_of(task_cpu(p));
+
+			raw_spin_lock(&dl_b->lock);
+			__dl_sub(dl_b, p->dl.dl_bw, dl_bw_cpus(task_cpu(p)));
+			raw_spin_unlock(&dl_b->lock);
+		}
 		sub_rq_bw(&p->dl, &rq->dl);
 	}

