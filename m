Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589927;
	b=ojauqJgvHDAmueaCwdu2L6du7iBv6+FnQfU0MJcyZ1hX9yzh3aXAHDi/m0mkRViBtrKk
	 lQut9wATbWtObCCCcj4i04pB/Gv7+UlNoOHi3YFtldroeyHmtdYhtUY9ilqZ7hX+bEwUb
	 IApz4V3ZY+9/hIkdNjCQKL+TFXNcOutZcUjcctLGoS8Vyk8CavzuCxhaV33W3bxp8lMAK
	 AxavEvoDMGDtE759VSWHeu2Etqy2IIyaIeDHdf9czsulF8J9uGB/ArIyY7Tj+iQGuT/zm
	 1gWiiuMgrwAVl28Rn3d2Lb/1uGivua+4jFfEoy/8OLY4FrstGNZeyGW2fum6hj4LkNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5c03wHQY/A8JbxeL/7g0tRvKNDHudBeP+rG9bb169uk=;
	b=T0WV8Jf9jQsS6WQwAtQEje61dDjYXFKDEKQ5FlhfS/VZS8/9MzL7MOE3K3cPya7S2QgP
	 /rOugAGCKAuRAP4E2ZmDMw0gfLHoGFOXls0Q4/G4yF1jnl5swEuHX7PqdckjGhgtHeHbb
	 RwE2x6Fu9mr8Rm55JHyIvkuXdw47X4BusoF57k4XgUf9mcWzgcAIc274epTdl8A6ijTmV
	 QjIhQgPlUs3j2GRNDEv9QuSyCH0ncHuXUWbBm2TPznO4GSSCOjZY35oAJ/y0hxAvBnF52
	 E5EIbTVh7gaCt9BdIYdP80Kv3104mWv9BXy9AOVSz5lB0qAXXRV/XRB1jnXUYrQil2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXCMSsEE;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857D606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0857D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXCMSsEE
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67489c8202cso616748d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792589926; x=1793194726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5c03wHQY/A8JbxeL/7g0tRvKNDHudBeP+rG9bb169uk=;
        b=jXCMSsEESFZVjdjzfNi/bSWJKOk17XHYGmVTOCwIqZR8IXFZ6JaIxgj94S01mE6lUN
         kq3GZopQP4XE3Aac2PnfcyXRLRPRbsLLJlSf0T32r8vh0qDFMoYAopIX+TKjG29ZXM4Y
         zSN3qBw5x1XAQ0jrz5EGFddq+djTNyr7mu+NuNf3Ur43I54hi5uxGp5PO8CHc3EHyN2D
         0y82te8fXM447P4Sc40m4ZsRGzrgXJrH0EneZrcrRHAfmJdkkg5hVh0O0HidBJREB09b
         ctxtwOFsO1hWk+J6+BL8H+WgneHn54rwRdrGbnWvyYGAgknwA5yY1RVuSI55SmggxVAX
         8U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589926; x=1793194726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c03wHQY/A8JbxeL/7g0tRvKNDHudBeP+rG9bb169uk=;
        b=C/fHoypZsnJV+g2GmRr9zBb/xbadRIt1uY+/xLoBwwp2RORJX+VCwekhXWzWU7uMxf
         NgaReKsmOKB9NiCx9YR53XLv7FqGDxtgesqMrnzyIgLdFHdeTPlDfmmjm2jiwS9BNuRj
         RCV+5wwczwZkP3t8F+LiNvyeQM59gcQKvrBUQGo7rOWzBpNpHEKheDvbkIFKdWtnKgnG
         LhfNI8Zec0VZgddwtLdlNaw5zwFTQ1qyQYuEUq9reGxZo+HaBeTPIRm1MhFYFA2bpgRM
         PThzx9mcNobw1lsDJF/w0351D3L9j6YoIRaeV1XCO8uUjkr7O5ghl+ThtYxlb5msHpKS
         l96w==
X-Forwarded-Encrypted: i=1; AKwUvByKyLGFzvOf7ipYwKHtx/VZYzXA7esxIAXlcjXre3jy4Cg5la0wUT7sP8XrJ4/e5rawMocCI4oC2O57uyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmKKZLRREbwH00bShFQekZK9CpSkpW006A+2Oz7CHsR7as73V5
	ZKL+mrAA3r11X49rw/xMwLDkvUnnOemyjlBtZ3b4uf6bi83CLdjp9e4A7BKWyKRd
X-Gm-Gg: AYBFou2o7wyND+gI13cIW38eE2v3DZx2SxwutZzp+N2gwhLLMycunkFHBq2uEp4TqZi
	fLyLw3a9Z2w3t6xNWPOS73HSJ5+xb7bDO7r7YSgBpO9R8Z+grjZ/irkV8UHYHY8ZGQ9QuP1nmhT
	VL5CiyUDNA88gty4VQkpRkImpeY2t3y0ZutKDV+sWzJ4ZREuybyyqdIfWx/Cpz7fzFhMajEQSFq
	04KOaesg94mTcA0kDdN+Jbc5TeO8HqAJ7ZutAznqbzyghrD30PV1JGw0GgWdSd36Zw84VoNP0ox
	nldPqzcZfbMs3PwFLWMUjy8l+gkTx/lqEp5XgBgwf477rx3P94tYkKQMBAFDQqXvXBRvVx8lCrq
	MTEj8J2hNqtbxfGeltrYbz//rypjSUMBSZmamp+yA6ioKKsSc98orqOYS/4zdADf8roEa5eD1+i
	KYVfsOyvxUmm7ulsJlsP2PWSeNHVuDi922pP8iEwB5KMl9Ylpc16uMaLw46BJxhjGPMLx6ROTLg
	el3i8wqX0PxdZUKLfVXKVczDomkty49ZHn/VyowATDcU76hSm0bcOUp1o5HJEl/r0F22BpvPF84
	ZhoRFuEkrt9TDgbO3rdU6NHcE+F5Vn0Yixjk5uI5bGGV9LFs/h1YA+IwhPKWyA==
X-Received: by 2002:a05:690e:d8b:b0:679:bf13:c01a with SMTP id 956f58d0204a3-67a0ddf103fmr945125d50.0.1792589925959;
        Wed, 21 Oct 2026 06:38:45 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e501c01sm1052477d50.15.2026.10.21.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:38:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:38:37 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: axboe@kernel.dk, hare@suse.de, dwagner@suse.de, frederic@kernel.org,
	tj@kernel.org, sean@ashe.io, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] blk-mq: dispatch kworker to housekeeping CPU when
 hctx cpumask is empty
Message-ID: <atjAXSTH2aRligiA@fedora-laptop>
References: <20261016052203.489760-1-atomlin@atomlin.com>
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
In-Reply-To: <20261016052203.489760-1-atomlin@atomlin.com>

On Fri, Oct 16, 2026 at 01:22:03AM -0400, Aaron Tomlin wrote:
> Commit a46c27026da1 ("blk-mq: don't schedule block kworker on isolated
> CPUs") excluded isolated CPUs from hctx->cpumask to prevent worker
> threads from executing block work on isolated CPUs. When all CPUs mapped
> to a hardware queue are isolated (i.e. blk_mq_hctx_empty_cpumask(hctx)
> evaluates to true), blk_mq_hctx_next_cpu() returns WORK_CPU_UNBOUND with
> the intention of offloading execution.
> 
> However, kblockd_workqueue is allocated as a per-CPU workqueue
> (WQ_PERCPU). When WORK_CPU_UNBOUND is queued on a per-CPU workqueue, the
> workqueue core resolves the target CPU via raw_smp_processor_id().
> Consequently, if a task executing on an isolated CPU submits I/O and
> triggers an asynchronous queue dispatch with zero delay (e.g. upon
> hardware queue congestion, tag/resource exhaustion returning
> BLK_STS_RESOURCE, or plugging), &hctx->run_work is queued directly onto
> the local isolated CPU's worker pool. This causes the local per-CPU
> high-priority kworker (e.g. "kworker/6:1H-kblockd") to be scheduled on
> the isolated CPU. In real-time environments, an active SCHED_FIFO workload
> will starve this SCHED_NORMAL worker, causing hardware dispatch to stall,
> in addition to introducing unwanted latency jitter on nohz_full cores,
> thereby defeating the original objective of commit a46c27026da1.
> 
> Introduce blk_mq_hctx_unbound_cpu() to select an online housekeeping CPU
> from housekeeping_cpumask(HK_TYPE_DOMAIN) via
> cpumask_any_and_distribute() when executing on an isolated CPU, and
> otherwise fall back to WORK_CPU_UNBOUND. Use this helper across the
> unbound fallback paths in blk_mq_hctx_next_cpu()
> 
> This ensures that:
>     1.  When executing on an isolated CPU, deferred queue work is
>         cleanly offloaded to an online housekeeping CPU across single-queue
>         devices, hardware queues with empty cpumasks, and offline CPU
>         fallback paths.
> 
>     2.  The per-CPU high-priority kworker on the isolated CPU is not
>         scheduled, avoiding priority inversion and latency jitter.
> 
>     3.  When executing on a non-isolated CPU, WORK_CPU_UNBOUND is
>         preserved, maintaining optimal local execution with zero CPU
>         bouncing.
> 
> Fixes: a46c27026da1 ("blk-mq: don't schedule block kworker on isolated CPUs")

The current code follows behavior of schedule_work() and other related
wq APIs. If you think it is wrong, care to fix schedule_work() too,
otherwise it confuses people, IMHO.


Thanks,
Ming
