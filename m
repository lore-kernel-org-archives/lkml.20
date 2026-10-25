Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956521;
	b=V8CRvjkfbTuC9lWVeGaf4KIys6E9/zBC61bShZz4ZGucf+61fP+xEYNJG2JzBXni9VoB
	 LqSMU828LMZFnC+uadJ3PdBuZCbVkeELEOVz8tIISOd/6LnMT5YFBj22lFm5mfDipWPC1
	 4ebznk1trWdiJGRk4HE7bbdBrD+bESlZY4d5p3LHxgGe7k+3uuhRhRL3vWab1BnwK8VHc
	 4GavyzMrxnlkRn+k/sojYKAA+ANKfe+J4rtvnd8O/LKk2AfUqTVv59hBl9HmU2Dlf4+dT
	 mqAgqNUWFfxou/2eZlu4T5SGQpVFFJoACW5j9qIO2cDrXXM51wySITcHz2eKB9pkt3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=n0x8YL9wXAgJbDATxTaYviyNueLfQgKLOaXNsgGpeXI=;
	b=4zulaHgu23/uaZYByEM+m8HNXFiyi/fFSvdM69zl+9LRUWObLF03W2RRuEhfrWu7P9kz
	 YLYVb0qJZymxOHoGjgsYIbJudsp/xFsDv6IPv1iV2gOswqha+DqnbwfAXXMWoKVlv8rS9
	 XkbtXQ7R0664yM6Eup+6vDCfazOTIYm/tAsklwkkC8xjYebfdw3pQdhVojNK9xqIq5hwA
	 lHbR7VV1jwttfE9baTfZhkbC5pkk4Ja9ZvF3se4pWsQzWKCXNAeevQn6iYSfuB46WxYM6
	 G1bfo2Q+swvy77sq635Vk2fzjTDKug2wbbwVg+k2Zd5eJQ6kK4Li6BdKLygDHvhKzwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eQNfGjEW;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8120B606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8120B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eQNfGjEW
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso1494505e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956520; x=1793561320; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0x8YL9wXAgJbDATxTaYviyNueLfQgKLOaXNsgGpeXI=;
        b=eQNfGjEWvkOz5cyGSHTpV8QgnbVyWMFj+oCqwBDuZ+cuJwD5fHUTYGvOLCygzcgiF4
         5+XAsR+GKSB/tpjaAZV+EagbJWUZvWOFn1pS33hkiT9VTu/XC1r0a+neQErLQEISDhgt
         Z5N0d+aH7o6WoWuJGtaIe8aiPf+T8AzYhhega4d3v45jIANEbP5kwqjVHRLJNos9chew
         Di2joVxqBQXfY0myXXBacGsx5dOnOB0BjsJe7YC3bPVgoGTH3Od4Vse1+uCKF0pxEXY4
         +dG9r/9h7LJhGjd/FFgWX8WuTDYXlalEQu9xwm4YI6fua2tqUAtegrEawPy+2cbxYPf7
         UVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956520; x=1793561320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n0x8YL9wXAgJbDATxTaYviyNueLfQgKLOaXNsgGpeXI=;
        b=Ce+NOcjXpfqsYnAN2WynFdRW2go8qo7OzFuhHXia5r+ExurC385DLJKcqieAB5y8kj
         OPhCIG2qHuXRsFIQykdlIFVuAh0SPDk4VJzDVUr1mEvW8OZRIP6t3RWKeTzSQ5QZ4vH0
         48noxJiXoe0yC4wxvbuIKhnCiv9mrWDkUsdOGETp85i4k9/89sDvAcxITTyG3r928xJU
         J16FtbWAc16tWco9OrWkC5ftrUZVZhx7qyL1qZk5JSTXDwNwgiyHRQytAud09y50G9SM
         Pgx0BJAPVK2eN3FdbDeRmA400ZGYEjM0dwEPU3PcULzGHhEo0fiiDE4iZeNxQVwJvoQp
         qYXw==
X-Forwarded-Encrypted: i=1; AKwUvBzCQH22IePwuXSJNOQqQ3COho90kp86n44x4vTV61f4EmpIvZ13Ga2ATjAvhuIpHoc9bdTFGvM3GuOt+Jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJutAWLN20fDnpBT0edjouPdximmTjaq6gN3aWpQdYcwuElhtO8
	cZWpOI8nTLP8iCWLB8cJOCUzkqzcxz2QmYwrUTTrTskQ+CvL3zNgqw4k
X-Gm-Gg: AYBFou3sTKFNnpxdZ7b11dTGVwdypA7pgvX/ZpliPapY1WGVKG8hjSH6GRil1gs0V/r
	tHdwjLj8TA+O3x1MChQEAE9mSTdZEp3Eb4X7JiI65Hlj4hoOTAi3bJOoI/Pz6Kyj2d90aI9DMqV
	2lVgaSDHapyX1JDR7vLNrkMuv97OFI/dA2W0LOKINpPdSe8wn9Q67P1I2SprRuse/CtfCcA9cFt
	X20lhlrb5Vh46ib/+tNHkwVgT/ntezdOnzXSoBRsPI+TTIk7MZCr2KSDnfhTQGAcE09ab195iMS
	7gnc23AlZ48j8kZ4v/0YRmwb4Pj1I+gOumbbeStC7hHtmrNF8xOLym35JdPyQTeVtvYog2EVE43
	Ei3X8aAZIs9nX9ul0edftKt0lk4wjg7DnL0Nj/gkks3LhZD2e+SJv90wm+JsmOVcendxLEG8RpS
	DrfshiwXWSP6MeDrKwmNGVM16TYJNEKZ8FXp9G0dvPgrD4bd7ZzpPHk5yxlO0Cz4z/jqe0tFltM
	/QSij9yVI8uh6NVTbfPbmfHHl1XHZymUvDRgemSA0nR/PnedmRKsYtK9ibpmY/Vo4mGIZ39+Pzs
	2GoxXMZG81jghJbqnWPd4TR5imWL
X-Received: by 2002:a05:600c:c110:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a35ac89087mr77972295e9.2.1792956519672;
        Sun, 25 Oct 2026 12:28:39 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm12941170f8f.48.2026.10.25.12.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:28:39 -0700 (PDT)
Date: Sun, 25 Oct 2026 22:28:36 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: albin_yang@163.com
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	chen.yu@linux.dev, linux-kernel@vger.kernel.org, albinwyang@tencent.com, 
	jstultz@google.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <at5JrmlnEXPQftDe@scheduler.schedules>
References: <20261025130740.3324391-1-albin_yang@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025130740.3324391-1-albin_yang@163.com>

On Sun, Oct 25, 2026 at 09:07:40PM +0800, albin_yang@163.com wrote:

Hi Wei,

> From: Wei Yang <albinwyang@tencent.com>
> 
> When a task is blocked on a kernel mutex (a proxy-exec donor) and its mutex
> owner runs on another CPU, find_proxy_task() migrates the still-blocked donor
> to the owner's CPU via proxy_migrate_task(). This happens when the donor is
> picked as next while not current, and the owner is on_rq and not delayed. The
> migration re-attaches the donor with attach_task() -> activate_task(rq, p,
> ENQUEUE_NOCLOCK), i.e. without ENQUEUE_RESTORE, so sched_info_enqueue() arms
> last_queued even though the donor is not runnable at all -- a fake enqueue.
> 
> The real wakeup does not correct it: the donor is still on_rq and is not
> sched_delayed, so ttwu_runnable() never calls enqueue_task(), and last_queued
> keeps the migration timestamp. sched_info_arrive() then charges the whole
> interval from the migration until the donor actually runs, i.e. the time it

Well it normally should be like that but, sched_info_arrive() only gets
called when we *hit* the CPU. The issue is already that we start the
counter when we are not waiting for a CPU. The counter gets
charged on dequeue.

ttwu_runnable() calls proxy_needs_return() in the proxy case, then that
calls dequeue_block_task() with TASK_WAKING, where we call
sched_info_dequeue(). Or Am I missing something?

> spent blocked on the mutex is counted as time spent waiting for a CPU.
> 
> Fix by not re-arming last_queued while the task is still blocked on a mutex.
> A delayed dequeue sleeper has no blocked_on, so this is an additional
> condition rather than a replacement for the se.sched_delayed check, and the
> DELAY_DEQUEUE fix is unaffected.
> 
> Measured on a 2 CPU VM: the same ~170 ms block is charged ~167 ms of
> run_delay when the mutex owner runs on another CPU, and 0.01 ms with this
> patch.
> 
> Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
> Signed-off-by: Wei Yang <albinwyang@tencent.com>
> ---
> 
> Reproducer notes and full numbers (5 iterations each, run_delay is field 2 of
> /proc/<tid>/schedstat). A userspace futex mutex never sets blocked_on, so this
> needs a small test module exposing a kernel mutex:
> 
>   config                          block      run_delay delta   migrated
>   -----------------------------   -------    ---------------   --------
>   cross-cpu, unfixed              169.9 ms   167.1 ms          5/5
>   cross-cpu, DELAY_DEQUEUE fix    169.9 ms   167.1 ms          5/5
>   cross-cpu, with this patch      169.8 ms     0.01 ms         5/5
>   same-cpu (control)              167.3 ms     0.00 ms         0/5
> 
> Sanity check: with the donor runnable and contending for the CPU, run_delay
> still grows by ~39 ms over an 80 ms window (5/5), so the gate suppresses only
> the fake enqueue, not real waits.
> 
> Applies on top of:
>   [PATCH v4] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
>   https://lore.kernel.org/all/20261024042753.2276779-1-albin_yang@163.com/

This should be a series instead of separate patches if this goes above.

Also AFAICT this could go wrong once John’s series is applied:

https://lore.kernel.org/lkml/20261023220431.1106611-8-jstultz@google.com/

Adding John to CC.

With this patch, now waiters get dragged from their beloved rq's and
gets in to owner's own list. In this case, on_rq can be false, and
ttwu_runnable() could early return without clearing blocked_on.

Waiters normally wake up with their owners, and wait the CPU for them
so normally we should not start the timer. But on a hierarchy like this,

Where A sleeps and holds the mutex M while B wants it, B with
mutex_lock_interruptible(), and when B gets a kill signal
B need to enqueue separately from A, so it starts to wait.
But blocked_on is set, so B's counter never starts.
This only happens when both pathes are applied.

There's a chance I'm getting something wrong tho. :-).

Thanks,

Kayra
