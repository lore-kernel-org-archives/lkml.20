Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6973E48C8A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814765; cv=none; b=D6d9Bzx6y5999LsKP1PhGIIB+WtRQW2YDS+vNaW+DXglMfdBpMhV+KGAubkXu3WubuK1EPehjrdPMP992A70JNlOR17+ger1wL6FkmZRm5gJSUtgWno+Nmuh0bLZ834Py5El4w+Po7txjrHAjqhlwvzpjY/fcr9aEG7foOFyRGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814765; c=relaxed/simple;
	bh=CT3UlXezsPQVcTzfULxQ0T/vS7ZQKJs18JZy26WoX88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoPYJYz/P1LoWElCPTO/yuIZCCALK7ZNXi4zARzB+gZMRihv3yQiKgpGvWT1+VVJBesBdBrmffautEz3K3u+5ozoLexOYHy0ZNAgZfTHIFH7lPWS+wIIPzQL5l03R/60MWRo8CoxawHo6iRKPong97YUJbZsxfsBgu0MKr0XADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uri0I5wA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DyryS8nb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uri0I5wA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DyryS8nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791814762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SiY066BjK9IoW82TMg/MXW9dDkVN5m0toWwxXW8kULw=;
	b=Uri0I5wAiu2T9w4ZxYEdFXJ+KADSWqmA6bHhApBN8SLf1OJ3+iW91N4BQNvRJ7vidul98M
	wT/6H+iPCQQhgMtYcICHn53fRh6xDL1MnYZL77CAPc+oKSPYUP+3K91zAiw5wPMVQz1ca8
	P2WxurmIfYxyhkwROfVGfVsbQqNrCyA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-TKWqqqbSNeqx3w-uX9KVLg-1; Mon, 12 Oct 2026 14:19:20 +0000
X-MC-Unique: TKWqqqbSNeqx3w-uX9KVLg-1
X-Mimecast-MFC-AGG-ID: TKWqqqbSNeqx3w-uX9KVLg_1791814760
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a021b1b561so15618035e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791814760; x=1792419560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SiY066BjK9IoW82TMg/MXW9dDkVN5m0toWwxXW8kULw=;
        b=DyryS8nbZ4TEmWz+Aovnc7SSqxVmLXIkdAdeh92H+KtgnN+bAWpKps9taiQmzJJFu2
         R2g1HZNTlve25iN6C8FAxoPzEH2KSmic0fpH+n+Dgy/taPbTKpyn/NMB3m0xwoCw2Jfy
         IRb+YbyS1UUEab47aQUFm1exAfVxKXP3qcOA/EH3di/t1Cki7EfQKPNWSp7O6UpuKFZw
         xoE8HVbeSg4+6C8Q4ozxak6b5HYLXIMW1HxFX9wwh42mrKWGNICsPUwmGEq7nv5gE82x
         D2+yhoiXGMiJgOJj6W1CLId8euF/OVAPUNdVNoi2yHNitT5eStsi5b6NzCF5gbrOBZj2
         Jd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814760; x=1792419560;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiY066BjK9IoW82TMg/MXW9dDkVN5m0toWwxXW8kULw=;
        b=sOxFxhvxyrpDcrRRFNj1sBX2fGA/6w1Geq1u4e3x3ayb6Rh4F+CEITWURKvnUoBEpr
         /mvrQW30Cn4iK2yFae4180iAG+71Nmhie62EThyZLqcEMG9ahT15rWbYMVZ3fT1yKzxR
         tvn4k1Uu+AqgttXEEHzgDE8bqODTH4bi/NGaArO+L0hcmRG6ZYFXx9QOkvFff3k0HuII
         zYvGnHEO9XnpD4uvPakcYKzx30Ta1tuUEK0V1ExOY51iTUz7rh8Mz+fxqWfYMJeZcXLi
         nuABIV7zLY/xk+GLquuktvbJ8KazpvSFl798FYhZ9vyTPdzh27/lWACDJ1qBe0+Kvmfc
         quKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtx2S5wrnAWCAyiU8XqCsDPKs35QLv8oaOeGYwbb6+DSkM2soMvBQz9B3kOX2T/WFfp6lXih/t+N/N1hw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtH3dOBq4wAgqMvDKiR1hMiNZ3oMBZJvMGBfrWuhvc4XtBfrrB
	nLEkaTPGDeCoLmB+aJtjk42vtyYCdG1oRbqtfQshkPf2Eu9FquUsK16J3jBZAoDEcB5xg51bhpQ
	lvFkV0Zj3posnyuZqKyKWnPNWl5wsw87aB0uARa6WKKz1JO8Tuqlzgs3DC4E6AkCigw==
X-Gm-Gg: AYBFou34AqInOrUzeO1aVDM8Eredwo4CE2GPoD4ZjVE/UYyJnCYUwcjW99wn0CCXF44
	fOMcvYWkufVT3dF9wj72/hMVAmTWESTAWOI+kFqPMBWV1v1ZYzCh21qz2Lmtk5hSmvjjUm0mB4Y
	9/crzFUS7JZkTMvzNA6G/0RrCsuBKCdTuyA/OS920/THUEpfwJ5C8qIjqbPa8/pYm/ACbxyJGZZ
	l4EeYNgCS8odCtyI6oaNzkE6S9iSjsPUZ8xLD6CScOlcRBlleMImVBDwOCqWajP8g19qYPrgAF5
	W8OyNaaHZ6hQ0bEIR8VEhw4d4raOnaisaKVk+BkTzpdYXcWiNRj84EPLBdMscOCK388evyLeFOi
	5FGwprDibC1bNPaF//r/42Zhk+nqr
X-Received: by 2002:a05:600c:548d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a18e49c128mr183674045e9.13.1791814759555;
        Mon, 12 Oct 2026 07:19:19 -0700 (PDT)
X-Received: by 2002:a05:600c:548d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a18e49c128mr183673255e9.13.1791814759070;
        Mon, 12 Oct 2026 07:19:19 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20834740f8f.9.2026.10.12.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:19:18 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:19:16 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [RFC PATCH v2] sched: irq: cpu-hotplug race vs
 set_cpus_allowed_ptr()
Message-ID: <aszsZMSo9csAHNJu@jlelli-thinkpadt14gen4.remote.csb>
References: <20261012103946.aOSAmrRe@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012103946.aOSAmrRe@linutronix.de>

Hello,

On 12/10/26 12:39, Sebastian Andrzej Siewior wrote:
> syzbot reported a race of assigning a CPU affinity during CPU hotplug
> operation.
> After the affinity of an IRQ has been changed, the IRQ-core sets
> IRQTF_AFFINITY and wakes the relevant interrupt threads which need to
> adjust their affinity mask. The thread will then invoke
> set_cpus_allowed_ptr() to update the mask. Based on the new mask a CPU
> is chosen on which the thread should run.
> 
> It is verified that this CPU is online however there is no guarantee
> that this CPU remains online while affine_move_task() is moving _this_
> task. Since the current task requests the migration the stopper/
> migration_cpu_stop() is involved at which point the task pauses for a
> while. If the CPU goes offline (or is no longer cpu_online_mask) then
> __migrate_task() (due to is_cpu_allowed() reject) will return the rq of
> the CPU on which the task is currently running (which does not match
> it's task_struct::cpus_mask).
> 
> The aftermath:
> The IRQ-thread's CPU and task's cpus_mask do not match. A
> migrate_disable()-> schedule() will change task_struct::cpus_ptr
> ensuring that the following migrate_enable() will update the task to the
> requested affinity mask. At this point, affine_move_task() expects
> task_struct::migration_pending set but it is NULL because no one
> requested an affinity change while the task was in migrate-disable
> section.
> 
> I see two ways of fixing this:
> - Holding the cpus_read_lock while set_cpus_allowed_ptr() is invoked.
>   This ensure that the CPU remains in the cpu_online_mask while the
>   migration task moving the task over. Should the mask be already
>   invalid, then it is rejected otherwise the operation completes.
> 
>   sashiko complains about deadlock of cpus_write_lock() in the CPU down
>   path and calling irq_migrate_all_off_this_cpu() vs
>   irq_thread_check_affinity() doing cpus_read_lock().
>   As far as I see, there is no deadlock because the mask is updated, the
>   tread is woken, the tread blocks with cpus_read_lock() until the CPU is
>   down.
>   There is nothing that waits for the interrupt thread to complete,
>   there is no synchronize_irq() invocation which would be required for
>   the deadlock to happen.

I would agree with your assessment here. Can't see how a deadlock is
possible.

> - Should __migrate_task() fail to return the requested rq make sure its
>   CPU is part task_struct::cpus_mask. This ensures that the current CPU
>   is still part of mask avoiding a possible push by migrate_enable().
>   sched_class::set_cpus_allowed did not see this mask. It might be a bit
>   inconsistent and feels a bit like select_fallback_rq() without the
>   printk.
> 
>   Sashiko complains:
> | If __migrate_task() fails (e.g., due to a concurrent CPU offline event), this
> | fallback code forcibly modifies p->cpus_mask with cpumask_set_cpu(). This
> | skips the required p->sched_class->set_cpus_allowed() callback and fails to
> | update p->nr_cpus_allowed.
> | Can this bypass global EDF real-time invariants for SCHED_DEADLINE (as
> | set_cpus_allowed_dl() is skipped), and allow unprivileged tasks to escape
> | affinity boundaries, giving them access to CPUs outside their cpusets?

And not going via set_cpus_allowed_dl() might indeed create problems.

So, I would vote for option 1.

Thanks,
Juri

