Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092896;
	b=3kYBKncdwSt+dtPAfn1aPtn+CBPrO+8fDKONoQREPl38LVbx5D3K/KZaUVIcgBiocelk
	 d7E8jrKsQgFA0qmVRWmjhXeaNT+Ge6OlTdt5wy+IEZzoYqPtzBD9UMu3C8ukEHd4Nw76O
	 AE3AfC1f3pi3OHpLjLGF9PswZC2GOJqdgBvBCE1kx4RLujB9Ud6Qmij+RKjEhoHBVoGWk
	 BbwLjy+OospTbpoym4yU4TOJjrFNV2rvsmjC00S1lCR84YFAoPtt+qLb2im4cboAdjqjr
	 hIir+DFMyR/o34grsI4Pnjt1+O7/o1goDo6r8XS/yjQF8f1TvfV1pZtSQ4zQozfEbMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092896;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eb/3KtXZsy3gnl1iQq9qG8nt/tf1naxAX7juQFsvfoU=;
	b=oa//2tXNeTw10VcV8evd/cGyM94yjAdfVjA6fZju/viYogLcESvnAlCHlgKmelQ5xo+P
	 yFokeLL1NiZJZ842YEs0fWMIz1sEwZB0YkFGGC5IEwoEnaxZ7IuAwXC5Av4QQMB2ksLXo
	 4SheTpynAFMaU000FZ39dQvuhxedFRDNdpc4zyH1SHkWT+SJvSZXD4SIXfulhxhwAIGse
	 Sc2yd8P+0c1zrI1Lf+r9p6YXIZMlzt/8t1rH1N+a6hTQSD8fyJN4H7UwmGbnX3WaW2NWc
	 8UY++afbSyBibEO2xvLFqrvX6+AXlPuDyE3Q0jRpkt3S+dsUF4qJn8m8sW84/rYxrxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aeFDwL2k;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZBkNnUH3;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F5C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F5C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aeFDwL2k;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZBkNnUH3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793092895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eb/3KtXZsy3gnl1iQq9qG8nt/tf1naxAX7juQFsvfoU=;
	b=aeFDwL2kgporrUbP7Scs9/mdVUUQaJSUn6B+TUfQ9b8uwV/KH7lURuKKEnBDWXLIn6dkjQ
	aCTOZQH44JU9ep1R7WUabNhSw740eg6oJwtRQQWe6hzkQrq9g/dHG6pTs0X7m6yPrudzXA
	7r03cMJDhmQY+u9KUo/dtwfLYC2pjoc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-dE9ISYmLNXuS8su7Pd2FNg-1; Tue, 27 Oct 2026 05:21:33 -0400
X-MC-Unique: dE9ISYmLNXuS8su7Pd2FNg-1
X-Mimecast-MFC-AGG-ID: dE9ISYmLNXuS8su7Pd2FNg_1793092892
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so37446875e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793092892; x=1793697692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eb/3KtXZsy3gnl1iQq9qG8nt/tf1naxAX7juQFsvfoU=;
        b=ZBkNnUH3J6Lixqed9eCinPnVq6eviCUodafUxSd8nE1azaMHBb5hQSyjtJpZXGitkn
         fAqjkkQNh8+VLNVIsP7aLGUz8W2F2yyPZmYtJZivxQiURgJnCrB+aUU8kcXK8Fmld65g
         bQa2jx378fAS6sfjlbGM5wZLr/8AeqbEk4yhNtN8QkT1R0BuRt4lQUpb0LtXVHZc0jGC
         nJm30p/IYHU5v9LK5A9xxk4kGT625LSB3HeRcwOR83U/yh6HCqI5hnSfYuezt4+p06uq
         Slnb0ofgcTY0JtMtNLK1X+dNbD9XgkA55sFWBNyUrgtsPKMOVLEf0WhjG6eqhKmKDKJ8
         OCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092892; x=1793697692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb/3KtXZsy3gnl1iQq9qG8nt/tf1naxAX7juQFsvfoU=;
        b=iS2OpGccIux72cYAhe5l4lrXlHFbHvyZUWU3m6zMZvkqsDGRczuvN8mVq+cT3WkcUo
         ok6+VOWBUfR2NmZ4J6OyMn6XaAXVRj+YTilFhRJhU6pkxHN7o8kTLzZSIuMQK7M/4BsI
         wdrGf/545NonrbmKgPsQppkbF9bEsSfeNMG6vNp9EQaoNoMeQNjM5FcS1FKeBxX3s+IN
         LCl9DMEQJokMi27WXVHvo5x3FMJiggorBpuIMOKn2EXPMHTD/OFoV885YgISrNp9KPDD
         TsDj13aSGdq2eDGYYUDOkdX9P7nxzA9O06tIeDJND0YZkq3tM/XQibdJerHxghVDUXH7
         8pSA==
X-Forwarded-Encrypted: i=1; AKwUvBzRmevMqSEeZ1OY+fpxJ24kIG/WsKTZqZ8abNnTTYW4Mfvn89EBm8KHqUj9E68SfLaTAYhQLXBjD4BNcW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKywHnON71PoD4oVAmQRekc/JDZHoHg9u54iM4yzO7VMOsa3juX
	EhIpPd7mDkvTdow0oKKU+uZPOtN2hq/6DBo6dTEljyjfo51i0VGu/dUjV59I2tIPjiicyidZjIY
	BWpry8YHtihEXhUMpma2jsBc/DghLvZTa4HBZvom/mtmy4i75GcsArSdbSMzZO69KLw==
X-Gm-Gg: AYBFou3s8YwF49iY91CmdhhhWHYlhom8mjoxXAj6M+M3vyMqkghR0x3pkhDmS7cg7Tf
	UilvmOZ4g8Odd2NAzuXMjq6hx85nkkFvB09td+cxdGk3nNJ5n750aeGm5UkVKZ4LwjaMT1DhrN7
	F/fFGqlOwshkh/cuLZ4KuEit7vd5tXBhfPmU+Gcx1SrhasiW4/asOQUhAkhfr26j0bhCxXYHVIm
	hxN4o6j0GYD5ZlO63tTz87kBY0SlHs+YTyDol/gHV57mvWpNJYGFUjm6qLJXsp+hykb333e2QGz
	exuAMUaB1GtAiJCGmHeSJmal1K0c23wyrBNEySqaz0noLXMIUaMDE53XSHbZwCEPXnrYS3oDUHB
	1Y7BsoW5iBWKmV/yULwAVLgMem/Y3w0I=
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr159129055e9.23.1793092892228;
        Tue, 27 Oct 2026 02:21:32 -0700 (PDT)
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr159128665e9.23.1793092891831;
        Tue, 27 Oct 2026 02:21:31 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.35.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a74d7f18a3sm69630055e9.1.2026.10.27.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:21:28 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] sched/deadline: Fix this_bw on class change of a
 dying task
Message-ID: <auBtGChHjceaFJ6E@jlelli-thinkpadt14gen4.remote.csb>
References: <20261025124657.836229-1-nickolai@csail.mit.edu>
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
In-Reply-To: <20261025124657.836229-1-nickolai@csail.mit.edu>

Hello,

On 25/10/26 08:46, Nickolai Zeldovich wrote:
> Moving a SCHED_DEADLINE task out of the class with sched_setscheduler(2)
> after it stored TASK_DEAD in do_task_dead(), but before __schedule()
> dequeued it, subtracts its bandwidth from the runqueue's this_bw twice.
> this_bw then stays short until reboot: __sub_rq_bw() warns about the
> underflow or about running_bw > this_bw, and GRUB reclaim for
> SCHED_FLAG_RECLAIM tasks on that CPU is miscomputed.
> 
> The class change dequeues the still queued task with DEQUEUE_SAVE, which
> removes its bandwidth from running_bw and this_bw. switched_from_dl()
> then calls task_non_contending(), which, if the 0-lag time has passed,
> removes it from this_bw again because the task is TASK_DEAD. That
> removal is meant for the dying task's own DEQUEUE_SLEEP dequeue, which
> has removed nothing before it.
> 
> Do the TASK_DEAD removal only on that dequeue path.
> 
> Reproduced under QEMU on x86_64 and riscv64 by moving exiting deadline
> tasks to SCHED_OTHER in a loop; with this patch there is no warning.
> 
> Fixes: 8fd27231c330 ("sched/deadline: Track the "total rq utilization" too")
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---

Thanks for the report, reproducer and fix!

I adapted the following to the set of other tests I maintain. You can
find my attempt here [1]. If you want to create a MR please go ahead,
otherwise I will merge mine (if you are OK with it :).

1 - https://github.com/jlelli/sched-deadline-tests/commit/ccea314c39957a935113f6a8c058690a3a48133b

Tested-by: Juri Lelli <juri.lelli@redhat.com>

> Notes:
>     Reproducer (root or CAP_SYS_NICE, two or more CPUs; the warnings are
>     WARN_ON_ONCE, so boot afresh for each run):
>     
>       gcc -O2 -o dl-dead-short dl-dead-short.c && ./dl-dead-short
>       dmesg | grep 'WARNING:.*deadline'
>     

...

> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index c0ebdcde5fe5d..dfae08625342e 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -444,7 +444,7 @@ static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
>  			if (!dl_task || READ_ONCE(p->__state) == TASK_DEAD) {
>  				struct dl_bw *dl_b = dl_bw_of(task_cpu(p));
>  
> -				if (READ_ONCE(p->__state) == TASK_DEAD)
> +				if (dl_task && READ_ONCE(p->__state) == TASK_DEAD)
>  					sub_rq_bw(dl_se, &rq->dl);
>  				raw_spin_lock(&dl_b->lock);
>  				__dl_sub(dl_b, dl_se->dl_bw, dl_bw_cpus(task_cpu(p)));
> 

And this makes sense to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

