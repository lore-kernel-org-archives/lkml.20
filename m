Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792876805;
	b=L3Sg4vdux4Hdkb6qb8D95o5UqS3vb1Mhcq0OG6vJfc7MsBCmKkynb0080/1oHFfWhIsz
	 k3w6PQglMqj6cFy7MQQz8x8BLcjSvYhRlwI72V0nno4E/iYgeuQ2PNkRxivEWni0rcWkb
	 6TC/mt33onGSPUn6/XZDhZrZSwrr/ONqsEP9DV1GsGZasql/Jgq/b6bHXRXzu3vvG2eVk
	 BClZJWqwQo8FDVDYruWhjHmD1pAdDwk3wXJj14DqpL5il+wmR8HNyclLzCR43nGPOoLDl
	 ygX5GIcVZKAmDKlFld8i0PhPGvbzbwHp23nrSDbjB4TdDv2L9VMB21akVu+9jMsPObw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792876805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2qX06TRcsoaA1V6tFyU6u4Clht3fXnSDMXbx6q3STP0=;
	b=bXi2fn4aJUzwDcQZ6OMN00Vmqw5kEVuG7DdP0VrugvBfxEl8BnzVCsWhLRvY4L2OV8j/
	 hxvGOURpX2dDaMz08dVh1J3sQqM9/F/WdthtX/stFdLTrEKtVaTtCd2N0qUqURbMBl/6t
	 iE8xnyOZ9G8jNcubHRXWHgsjXAHZp1sDhUp7CC+hy4xNcUwHdFe0Hmn+/QHbpIUjsG4KJ
	 ecpuRj67E/xixZme+4AGB/rTnuB22/UTs8Xv/SOT5LpwUiFTI6fH6R2HFaqyl9PXrFM4w
	 hsdiYc/clnUrxUm30S7GF1fuX0mbar/zeuDs0FoPLuS5Lp6zvbXukouPM+hkDqwrcjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FJW8YnIe;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25F4606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FJW8YnIe
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c5b7d5865so292094f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792876803; x=1793481603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2qX06TRcsoaA1V6tFyU6u4Clht3fXnSDMXbx6q3STP0=;
        b=FJW8YnIeGGHORmKZRLw8h586uC4rWoQAABujeOgEiLyO2yPG84kUWpoiBOZlKgn4+p
         6ytJ5bQMCMj7QA+uZUehDtWGch7mWm2mINSKUJZZDcYQAuqLXKaxjz3D0Kp7w5gTyKdZ
         3vH/bderHSJDYxOkJzVSmAirIWMyot98092WY3EywRO8Xyxs2RCliHFQjCmtAtG6ucNs
         AYmx4BoBt/+HRDSXLQMzS5iBVzHZcNmJuvENM+oRQ8cPaYfTgJ14RBKI6trKKQCqhJ+O
         o9vXrEBvX03c+0YGfdBoKYAuB6so7AzRMbB7biw/pVlydzXxs0ug7l5yO83a7FEdVyv1
         JpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792876803; x=1793481603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qX06TRcsoaA1V6tFyU6u4Clht3fXnSDMXbx6q3STP0=;
        b=rHmI5Pg/RsfhUZvrNnZmkoXw+pOJyCzqOmVktbaMwgsIr2H/VDXImLKrvA+YVz1wlF
         0JUtv6ffesPYC/TAZaXqcn/ZtozC5So34Yqs6nJVgap/ULIYWItog0Sf+XFYW2y9R21w
         WASQMOThFVwdTt4ji6XKwhWT41/e4PLM5BZJkjpdbkRTFPj1ivwJe56MALCIdie6k/bj
         22gW2UdLFTzXhMqWY3rN5uQnYwsns7LOamder3yB/ZQdibzz5pjtq0ImJBAhAbGg9mD5
         2h89EswVKGdvfojYiLr1YhH5oP9/wYxlqWNFelqTIfcYd2v5TlqWIdukZNzGt9eH9RKA
         X3Ug==
X-Gm-Message-State: AFq9FYISE3BAxPFdnyNN5rPCeSLxqzniwcO10iueuMrSQpUNaNR3pAIz
	uZgkgU5H2bSdnslPU/F4c+GeSj3HUjf4j0zw5HqiYXeoR/NbALd3uACr
X-Gm-Gg: AYBFou3TUPFON+0OYgtK7BqcqM8PHXIrbLkVuGKC8a6lNpsnQdQzEXdFDzUl8xE3K0l
	FBGuBPlBWgyKvlBPhzfRmy40LiiXR88kDnlEom31xS+QZtQQwoc2/xv5YqRroGbE1WVu+jMuZ0J
	/IXqK5ioiNP9sxk4Ez6NzQaQWUcR4WiC1fSdorAnDFpIo6j4yrj3itxbDCJvFsiIYUbPNyflc1n
	QBOzFNvByqCWQT9ZCnC6ShqDhsqe/E7DkuU9wpM/B8ifvW3K5GR07JGBitrzVD+jf6rWnRji9Lk
	a+4bRO4zkV7UhrA4I7XkyYOrvuTHBalHWIuqAZ5eNSuCD8iox1pF8tx1DZhh833m55PE2pe32ym
	rqkcs1qM0DFsjvLat+2JBRepC5XzEOjnQFFNHwKNWNweGzZShWiJ6W8YKlD+1iMcaHiUHgurMZ0
	oFoFhrDAvmeZueKkErR2IjCfVii3W/oHZ7PvMJH1EV5LIzGuyvBAJRIGU+lkBuK7VvnT+D6EUWS
	1oLSzS+8n2UWkxh8upL7bCc397NJtFaLt2wSP2aBkM5f4J+kOvuO8XkP/Px/sdqg+xZ6mA0NQ13
	aTZT/mM=
X-Received: by 2002:a05:600d:b:b0:4a2:417:7db5 with SMTP id 5b1f17b1804b1-4a35ac7c2f8mr38083235e9.2.1792876802949;
        Sat, 24 Oct 2026 14:20:02 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm5787359f8f.58.2026.10.24.14.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:20:01 -0700 (PDT)
Date: Sun, 25 Oct 2026 00:19:57 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, 
	Suleiman Souhlal <suleiman@google.com>, Andrea Righi <arighi@nvidia.com>, 
	Metin Kaya <Metin.Kaya@arm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Zimuzo Ezeozue <zezeozue@google.com>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Qais Yousef <qyousef@layalina.io>, Xuewen Yan <xuewen.yan94@gmail.com>, 
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>, 
	Hui Su <sh_def@163.com>, "Shubhang Kaushik (Ampere)" <sh@gentwo.org>, 
	kernel-team@android.com
Subject: Re: [PATCH v33 5/7] sched/proxy: Break cyclic proxy chains by
 deactivating blocked tasks
Message-ID: <at0fFKw8Vv1br_PZ@scheduler.schedules>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-6-jstultz@google.com>
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
In-Reply-To: <20261023220431.1106611-6-jstultz@google.com>

On Fri, Oct 23, 2026 at 10:04:16PM +0000, John Stultz wrote:
> From: "zhidao su (Xiaomi)" <soolaugust@gmail.com>
> 
> find_proxy_task() follows the blocked_on/owner chain for a
> blocked donor. If the chain forms a cycle, __schedule() can keep
> walking the same chain while holding rq->lock.
> Signed-off-by: zhidao su (Xiaomi) <soolaugust@gmail.com>
> [jstultz: Simplified slightly, dropping WARN_ON and owner == donor
>  check, slightly reworked commit message]
> Signed-off-by: John Stultz <jstultz@google.com>
> ---
>  kernel/sched/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 43ba76b5a3464..12a42252bf474 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6984,6 +6984,8 @@ static void proxy_migrate_task(struct rq *rq, struct rq_flags *rf,
>  	proxy_reacquire_rq_lock(rq, rf);
>  }
>  
> +#define MAX_PROXY_CHAIN_DEPTH 1024
> +
>  /*
>   * Find runnable lock owner to proxy for mutex blocked donor
>   *
> @@ -7019,6 +7021,7 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  	int this_cpu = cpu_of(rq);
>  	struct task_struct *p;
>  	int owner_cpu;
> +	int chain_depth = 0;
>  
>  	/* Follow blocked_on chain. */
>  	for (p = donor; p->is_blocked; p = owner) {
> @@ -7139,6 +7142,13 @@ find_proxy_task(struct rq *rq, struct task_struct *donor, struct rq_flags *rf)
>  			 */
>  			goto resched_idle;
>  		}
> +
> +		/* Limit the depth we'll proxy to avoid cyclic deadlocks */
> +		if (++chain_depth > MAX_PROXY_CHAIN_DEPTH) {
> +			__clear_task_blocked_on(p, NULL);
> +			goto deactivate;
> +		}
> +
>  		/*
>  		 * OK, now we're absolutely sure @owner is on this
>  		 * rq, therefore holding @rq->lock is sufficient to
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 

This needs a Fixes tag, no?

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
