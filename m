Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE03043CF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811951; cv=none; b=Z8I2fHXwzcbl0fCk0K+/lltCg/tbpOKmt1BVrMvGbKBbsLbwusrmD4Jgp+Paz70BAHtnU3gw74D2ktvIZpX0M8HKf5j1bSq5SZnQwQX7DavaY0wM1W56tjND/HtIsA+fx2XhPrU+L2uN8KCRfZu7kIYaxEPJIAUlWohfDarXQOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811951; c=relaxed/simple;
	bh=L5CSoWwf00douAyPoCNPFsQ6Acjf+d4XGDAxVQaI6+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eop/0gE19+9OGFCQxUxFUK9JjvROxMglgFj8stHouppJvE4aSvjpPMMEcSHKRdWHo47LXk4UiJQ3z51uPnISNiY80CPgV+wYO4Lz4nlu5JWyFTq4Mb/dlrU+h4w2GYj854OfDxUgVnosnrBtTyMSudhA5LYnhLdyaBmhu4nGT7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzVgY/K6; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzVgY/K6"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88679c4f94cso1136179b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791811950; x=1792416750; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBB7wJ/RWrieN5hhWXhCyucQmSXwGOJWa6TdFDtOe0I=;
        b=BzVgY/K6Pkn5wd97WJ5EdaQgIggN8Pxn5WgxHDYsiMw5z58HXIL/E40T8d0MQvdl20
         vdiD3mJlRSSPQo/7SqV/tyYo0sD6nNqry03BEkdfShYmoX9pb6KmMge+jP3YSZ7qnd9r
         PI+dG1qUxOylDhRkpJxySLGEnP4eXbDpsZvy14JcUlSO8weA+yEpHpJMo9edKquwee54
         9FQtV01vPuszymkpi4E9hCSewyYAiNsVV5424Ip3sngTOQY45/B1jND8Ai54OzSts80C
         iRqXYEQkaAmXB9EjC7mWstK6OlwvdOqgloJmtzjXPbGRoatbAVGKkwVMdSZJS4xE0/qN
         gJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811950; x=1792416750;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBB7wJ/RWrieN5hhWXhCyucQmSXwGOJWa6TdFDtOe0I=;
        b=J/vLUCmQkSBVcIvTBupfOPB2aZlwZAsAIP7tvRUhK3cgpULyeaKYclDsgdi8XcaklN
         0upNO0qNXGnUNn3IN5QqED+jlyCLtk8YvU29zbz5pwr0Di/Sm3mE1mlS9j63CS2g23iS
         e10gZsfe9H/fpY+xQdNR8AUHsjh4K7ex1mlagoCzrR31mSL9IxQvyxRQ+tryeAoX2/UN
         MShQN8c+JyGQi9LHvSiOiWArfSirPq4F3Q4k29dQyJc01y6h6XGNl4seqNofhdeHY2h9
         cJdq7GXzGJilvCdzQ23mf5atS0pOaWBMBPvdSZiIVff6sQmDYCQQqwRQRwAwmdqrrInG
         PDnQ==
X-Forwarded-Encrypted: i=1; AKwUvByBCO/8GBLXnrG0jpK0xwh6Ud3yk1PAgDqKkcx7V/fYjFU68rnJyggflZ5bGsrloncyjZv63gpzieh+DNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXk6+VYXHsXnNRj+EPUCZM+YkiHUIFO3k8tgFdjUqKB2f/aN68
	fgEh0YqCpBv0eRk0yN3mwYlM8kPPABKsBNE9gakD5DPoK7W+j8MhI2JpVByyPA9neeOcasfn+GC
	+EdVJaQ==
X-Received: from pfoo19.prod.google.com ([2002:a05:6a00:1a13:b0:891:2a5f:bac4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b8d:b0:874:706d:962a
 with SMTP id d2e1a72fcca58-897c6f12b99mr7991267b3a.28.1791811949510; Mon, 12
 Oct 2026 06:32:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 06:32:28 -0700
In-Reply-To: <20261011015019.4056529-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261011015019.4056529-1-sh_def@163.com>
Message-ID: <aszhbJz0N7cOy5fx@google.com>
Subject: Re: [PATCH] sched/wait: avoid modifying entry on failed priority registration
From: Sean Christopherson <seanjc@google.com>
To: Hui Su <sh_def@163.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, Oct 11, 2026, Hui Su wrote:
> add_wait_queue_priority_exclusive() sets WQ_FLAG_EXCLUSIVE and
> WQ_FLAG_PRIORITY before checking whether another priority waiter is
> already present. Thus, when registration fails with -EBUSY, the entry
> is left unqueued but with modified flags.
> 
> There is no need to modify the entry before the failure check. Move the
> flag update after the check so that a rejected registration does not
> unnecessarily alter the entry.

In case anyone is concerned about this being a meaningful bug, kvm_irqfd_register()
is the only user of add_wait_queue_priority_exclusive() and KVM never touches its
entry if registration fails.  I.e. this is completely benign in the current code
base.

> Signed-off-by: Hui Su <sh_def@163.com>
>
> ---
> Testing:
> - Private x86_64/QEMU differential oracle: the old path modified the entry
>   flags on -EBUSY; the patched path preserved them.
> ---
>  kernel/sched/wait.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
> index d033f600f48c..93b353fbd0c9 100644
> --- a/kernel/sched/wait.c
> +++ b/kernel/sched/wait.c
> @@ -54,14 +54,13 @@ int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
>  {
>  	struct list_head *head = &wq_head->head;
>  
> -	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
> -
>  	guard(spinlock_irqsave)(&wq_head->lock);
>  
>  	if (!list_empty(head) &&
>  	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
>  		return -EBUSY;
>  
> +	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;

AFAICT, nothing peeks at wait queue entries outside of the spinlock (which is
stating the obvious to some extent since there's no RCU in sight), so we're not
relying on the above spinlock acquisition to order the flags update before the
list_add().

Reviewed-by: Sean Christopherson <seanjc@google.com>

>  	list_add(&wq_entry->entry, head);
>  	return 0;
>  }
> 
> base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
> 
> 
