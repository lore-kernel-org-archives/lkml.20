Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250737;
	b=IytygoazlhllNSLwL4x3KLF98oNgUq2Rgj894ktgotY8zecjkpiJzvuufIH+vfXEOYA/
	 tOu5IwdwO9Hnp9TyZWFi4lbOd/XmvhK4x1VMQc8gViDvcmNRnQPBAMZ5qavImtZQh5iR5
	 bqpf1o9vunadkkdNXxgkKEiYJNupm1HFy1CgOwVcsy7IdwvmOWC2+5AAgaHgN3SkCKwWD
	 KnIqls/ErtcnP6Wy3B++3wmEKTQrVNxDMwzSGopZzHwRvCgvcf3hfbRNM0YtBQB8qAHa+
	 ttuPsP2X0Sb3YgweKKFbpGYpdQxjyO/CAAf689UEhMQw+Q7vbT0PXICV+zuo+gChL+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250737;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kScsvF5omIBGyCzx6Xt1u7IAsBNAtQ0U2ngEcowLFMQ=;
	b=S1+AZo8HLxi7UmwWFc0p87wBGYSjc9I0/O+0wz9s3wjiCkARcaPeS0FnH5tgZrXo5l/T
	 Fol16ms7BTSaegHxRGaUcHbCfBZ7zJ/iJl8yjR8WqWy0pNxgAEq4+TP5gM+FF7VotZn1r
	 c9F24tkt3Zkb14KPDLoTEO2plJAJSIRgYI6fv+JaRnAohbcqFGEVaswy0HOO+8i+5blqu
	 s/LVM4LzDhcPFNC7CbjakRhmzcNsES3ysjYRAWHOj2YkMkjK1mpiUy58zK+j8dMgft2J1
	 53Gq9SEmE6fi0CSTD/qe+VY70ojxQh+5qYIWOUp0LP/JjZ0Z9kmXOVFPrgafrcHklKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BPuMJIeq;
	arc=none smtp.remote-ip=91.218.175.184
Received: from mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6719606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6719606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BPuMJIeq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5uFhdvDgxVAAgzuSFrp+bOOxogJv3XKqImRI03XYWSQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794250733; v=1; x=1794855533;
 b=BPuMJIeqJI0F0ZsTQf9N6zhrjSoZXQ6AuCiqnXzcCbRNuzPNNq8GmwdKwxov4FcVS14JxzoZ
 pT265pq9o/Mo+mhQgUCRKAQwiXc6f0SeUrOBMrrpXDyFxHwiK6d25wKcNUG/FZ5f06mWGsaTw41
 /t2OpoR3568A+7iSQ74zE5FU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 785622e6d21c5f4f;
	Mon, 09 Nov 2026 18:58:53 +0000
X-Mizu-Trace-ID: 785622e6d21c5f4f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 10:58:48 -0800
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm: memcontrol: Don't lose track of exiting OOM
 victims
Message-ID: <avIXz853VU6FSMX1@linux.dev>
References: <avA1wXhTMs9eY2NF@chrisdown.name>
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
In-Reply-To: <avA1wXhTMs9eY2NF@chrisdown.name>

On Sun, Nov 08, 2026 at 12:41:37AM -0800, Chris Down wrote:
> When oom_evaluate_task() comes across a victim we've already killed, it
> backs off until the victim's mm has MMF_OOM_SKIP. This gives the victim
> a chance to free some memory before we kill anything else. However,
> since commit a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup"),
> css_task_iter skips exiting tasks once signal->live reaches zero. That
> happens before exit_mm(), so a single-threaded victim can disappear
> from the memcg scan while it still has all its memory.
> 
> This can kill another process when the first kill would have been
> enough to recover, and we've seen it happen in production. If the
> second victim is in a cgroup with memory.oom.group enabled, the extra
> kill can take down the whole workload.
> 
> In tests I used a 64 MiB memcg with swap disabled. I started a process
> that faults in 44 MiB of anonymous memory, submits a 4 KiB direct AIO
> read to null_blk, and goes to sleep. I set null_blk to take 10 seconds
> to complete the read so the victim would have to wait for it in
> exit_aio(). Two seconds after starting the first process, I started a
> second one that tries to fault in 40 MiB.
> 
> The 40 MiB allocation hits memory.max partway through and triggers an
> OOM kill. The OOM killer picks the first process, which has more
> resident memory. With the read still pending, the victim blocks in
> exit_aio() before it can tear down its address space.
> 
> memory.events showed oom_kill 2 in three runs. In one of them the first
> process hadn't submitted the read yet when it was killed. The slow read
> just makes the window easier to hit.
> 
> The cgroup iterator hides these tasks so that cgroup.procs doesn't
> show processes that waitpid() may already have reaped. That's fine for
> cgroup.procs, but the OOM scan needs to see a victim even after its last
> thread has started exiting. We already have CSS_TASK_ITER_WITH_DEAD
> for sched_ext, so use it for mem_cgroup_scan_tasks() as well.
> 
> With this applied, OOM selection backs off while the first victim still
> has memory to free. The 40 MiB allocation completes and memory.events
> shows oom_kill 1 in three test runs.
> 
> Fixes: a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Down <chris@chrisdown.name>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
