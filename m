Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961977;
	b=iXWTXv/g8aJ7BQierlfd6Y7yMP5T6oec6dD7Wy5e4Jr4Q/4UkASHhbOZJrvVaig4mKAA
	 bprpICLA5tZYdorrf+TtPULPWDKSAm6DtpPG+K5vhE0Kv8C/iuY/Moatjly6Hi8CgHkYB
	 3Ap2SC8F5MRpzcu4reXSrTNF3n70JppCYQsACV0k8NzEfIB/ow8XPWrMotJk+OyHuZBQl
	 4q+ykvnyWpVUwFSUfrhMV6h92Hk8175PM/pnvfc9XZXPwHDMkz2XRx7P9zzhHUr45StY2
	 y4R8giH5xsKx79gVwNIckjLoXOjt1OkCCSw4O5D2CtQbUR8O01cofK/UzrHEbD2eKfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961977;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bFMefXNV5N4MRE7vZflvBnk4vd+rwC7CnxpG7xTJOq0=;
	b=kcJBR6JwdbDRTUc8dumNaVfWOjai+y8t/f2Pioi85ZmOej6eFaanPierSIl6QrIWi1Zw
	 WYCcmeseL7VyME4ABQ3rnPOt2TyGYFH+2rgEkxUDx1Z6HMx8mm0ZLrS4MVCod6e6mXf7i
	 IGfuOUWT83lM0KlGZ+WWtERyCwfYwZ+3GmLoCNr6ijbpoIUT4NTpWUMBk8yq8eRtjjzie
	 as+8VpGk7Bq4zk6sKAvEhh+rgPcXvUl3LXwgP1EObLCkgychUxenppKbw5glx02sNlxY8
	 fcksSxBcOQupqMiYa5oQkVWVNX65CeLqqWPE1bPsgl2tpn3Bt9GiMWbt2UQB+RIY7lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KLlbSeem;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AbKd9uT6;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17046606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17046606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KLlbSeem;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AbKd9uT6
Date: Fri, 6 Nov 2026 11:46:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793961975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bFMefXNV5N4MRE7vZflvBnk4vd+rwC7CnxpG7xTJOq0=;
	b=KLlbSeemZD0zoz2cIAltcNVqFLoxaCHAzAUshf0EbPMYikbqQBQ5LZU3hW8+qGVcBJWmbt
	cxJAsVOLXCUaSxUMcd7XwY2Hxo6OdLRyQicdSWVTZSj8iLb3Jmou5xG0YvRGenlAZXUJwZ
	eyffUe+XeT8115UN56UHf+nzMv7IHnDOe3Tc30AV2aKkeGF/w2/2Y9I9gWGpRg4lDUXYG7
	/2yGsoyNP1wn+Z4h0D0DdU6orEbGm47Bba3UgTALyPRQozlrFBNAlklJ8BnfMPnmJs4mUP
	FVZs9Q5hxcAnoP2cQnCK263porUCa4ZfTdbMWorVG2NMcskjA24zz+fghKYKCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793961975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bFMefXNV5N4MRE7vZflvBnk4vd+rwC7CnxpG7xTJOq0=;
	b=AbKd9uT6iyQ51zRrzq1q+J4aDfy2PJ9vjs+OVRPP2pYGNAePs/PhoWK1oa4eaeTJxsFQtJ
	EYsNSzj5TBU/hcDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: mt4022@columbia.edu
Cc: Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	tz2294@columbia.edu
Subject: Re: [PATCH v2] smpboot: Run the thread function only once before
 parking
Message-ID: <20261106104614.LMF0MgmB@linutronix.de>
References: <20261104-smpboot-park-once-v2-1-ea28ec9fd85e@columbia.edu>
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
In-Reply-To: <20261104-smpboot-park-once-v2-1-ea28ec9fd85e@columbia.edu>

On 2026-11-04 16:58:09 [-0500], Mani Tofigh via B4 Relay wrote:
> From: Mani Tofigh <mt4022@columbia.edu>
> 
> Since commit 4a3b51aab6e2 ("smpboot: Don't park the thread if work is
> pending"), smpboot_thread_fn() parks only once thread_should_run() is
> false.  CPU offline waits for that with no timeout and with
> cpu_hotplug_lock held for write.
> 
> When the outgoing CPU keeps receiving more packets than it can process,
> ksoftirqd always has NET_RX pending and never parks.  The offline then
> waits for as long as the packets keep coming and everything that takes
> cpus_read_lock() waits with it:

I would end with a full stop and strip the backtrace. We do know what it
looks like.

>   [   41.469979] INFO: task kworker/0:1:10 blocked for more than 20 seconds.
>   [   41.470020] task:kworker/0:1     state:D stack:28392 pid:10    tgid:10    ppid:2      task_flags:0x4208060 flags:0x00080000
>   [   41.470055] Workqueue: events vmstat_shepherd
>   [   41.470077] Call Trace:
>   [   41.470082]  <TASK>
>   [   41.470091]  __schedule+0x10f1/0x4760
>   [   41.470175]  schedule+0xd7/0x2c0
>   [   41.470189]  percpu_rwsem_wait+0x1f8/0x4e0
>   [   41.470269]  __percpu_down_read+0x11f/0x3e0
>   [   41.470287]  cpus_read_lock+0xc1/0xd0
>   [   41.470301]  vmstat_shepherd+0x22/0x2a0
>   [   41.470315]  process_one_work+0x92b/0x16d0
>   [   41.470393]  worker_thread+0x4e6/0xd60
>   [   41.470507]  kthread+0x300/0x3e0
>   [   41.470542]  ret_from_fork+0x4f0/0x6f0
>   [   41.470597]  ret_from_fork_asm+0x1a/0x30
>   [   41.470623]  </TASK>
>   [   41.470635] INFO: task cpuhp/3:33 blocked for more than 20 seconds.
>   [   41.470653] task:cpuhp/3         state:D stack:27976 pid:33    tgid:33    ppid:2      task_flags:0x4208040 flags:0x00080000
>   [   41.470678] Call Trace:
>   [   41.470682]  <TASK>
>   [   41.470690]  __schedule+0x10f1/0x4760
>   [   41.470753]  schedule+0xd7/0x2c0
>   [   41.470766]  schedule_timeout+0x176/0x250
>   [   41.470849]  wait_for_completion+0x169/0x3b0
>   [   41.470918]  kthread_park+0xff/0x180
>   [   41.470934]  smpboot_park_threads+0xd5/0x160
>   [   41.470959]  cpuhp_invoke_callback+0x2b0/0x1190
>   [   41.470995]  cpuhp_thread_fun+0x2f8/0x6d0
>   [   41.471027]  smpboot_thread_fn+0x2fb/0x8a0
>   [   41.471051]  kthread+0x300/0x3e0
>   [   41.471083]  ret_from_fork+0x4f0/0x6f0
>   [   41.471132]  ret_from_fork_asm+0x1a/0x30
>   [   41.471154]  </TASK>
> 
> That commit only needs the work queued before the park request to run
> once on its own CPU.  Softirqs left pending are taken over by the
> dead-CPU callbacks as before.  So on a park request, run the thread
> function once if there is work and then park.  With the fix, the
> offline finishes under the same load.
> 
> This bug was identified and confirmed with the help of a deterministic
> hypervisor currently under development.  The C reproducer below however
> hits it within about 25s.
>
> Fixes: 4a3b51aab6e2 ("smpboot: Don't park the thread if work is pending")
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>

Other than that,
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> ---
> Changes in v2:
> - Use Sebastian's comment above the thread function call
> - Link to v1: https://lore.kernel.org/all/20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu/
> 
> Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/ksoftpark.c

Sebastian
