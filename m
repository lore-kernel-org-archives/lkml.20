Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1280349CFD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421305; cv=none; b=QAlrfPDI900JpUqgF46l0RRX6NbP+Ua/bB+nEo6ET+qzXegZLJ2OkbdrGE8iBtusVGaRXbwirzsFql6QzH1BmcjlrLw7AMzEOqEi+SCRdu8n/1btuDpfSAQIcymQeclVs3lw+sDcER8y2BcYE5/kH/nrXz9Z1V+IqPVTYTybObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421305; c=relaxed/simple;
	bh=y7hhy0jMwIBWPpKFihLcA9zDPb8SzNujCS4xLyCrVPc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G07Erv330Jg5JyU0bfmrq3Acmryg6MmJxCDDwuww4+9JT0P80JG9UJNGodBEL+gGknUkk0fJc3S5/HXx3VE/0Rt3fZYc36BZCe+xY2Ci5R81bhV4KH7ble56p8bYOld/13knewAIz+0WJC55X+17kwI2PMFlY2CSM2wEZBMelbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sUvBvNeE; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sUvBvNeE"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so16244255e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792421302; x=1793026102; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bF3manf6h/sdWmju/9t0IgXnvtLovSvm8SwVL7k7d50=;
        b=sUvBvNeEkXK1QlcOhSqJPvKlYpI/knTEvGBnon5X6FFNlektSEYWdCKyUwzF6cJ07j
         9wjQdu/anPLE5IG8L12cSkaOeFIMp2kFdHLzsw4GuSCbZmfHEz6HHOWghyhlpFSzGxRB
         IRBrODzXPKmkhkPojdsK+1INBghAm4D136rY7U03X64U3K3C9AWCcPScheNuWthS4BcK
         uS/K+x/eVOPAeBQxE/A8Hmukmv3EyBJXzXvDwsj5qujCfRREcv8/zbEaObi1dtB5v92B
         BOBNMfId9xTzkDANAk1pYKmb5BtpHyDqskOBilObAh8U9CSATLGvYMOtiJbslLVxLuK0
         L3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421302; x=1793026102;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bF3manf6h/sdWmju/9t0IgXnvtLovSvm8SwVL7k7d50=;
        b=LcOOoq6dyfhn5fs6rO3O3Vi1Yqk+mAb0F6UE9xCt6/5gIWmRqUifuRTDXwZfR0+jUh
         i0r0jD8r2f5Lh5Tk/dbZrqM8s3KCjCEPrfyQRxL1mD+/IBh0H5gzIkReZKEGzG3FzUTB
         //+eoQHuvta4APV1ILRyxwcQiIdds41mt3+ueVAKnqgPWgo2u3FG1DgP4Ws3JO4Ur6iU
         Bo4L4mS8lKZrRajPzGNDkg4EMMz9BMGMAiw4LCTb091bzCBBiSlTDXEV+woZs6j2SmiZ
         xZ4wKH0F/DaNuuz8BiSRt+xhJbcnF+7rRZh9vLCUvYVDRRuw0zDbJzTTKHG75Sxym0HA
         F+VA==
X-Forwarded-Encrypted: i=1; AKwUvBzuu8ndCDqBs+cvJeizvtprmIDb65bLwqvhNnIMbBY5Li+ZWM/3gpr9+u6OSr+zSx2dcuSqH8/yqBFxkN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbnro84aXB8/Zk50SMa5hwq+Giwv0CVKniyW/fDFZRqIvxMAs4
	aIe/T5tARqEq5YCg0v6jfhQiPlsMiYz9IYoYT3xkvilpBLPdgrcX7W0S8mwGyy8cBCrZNswVIx9
	13gn91Bhy+Ikqsg==
X-Received: from wmej10.prod.google.com ([2002:a05:600c:42ca:b0:4a1:e58a:b550])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6218:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a1ddaa5803mr151862875e9.15.1792421300447;
 Mon, 19 Oct 2026 07:48:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:48:05 +0000
In-Reply-To: <cover.1792248922.git.jpiecuch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1792248922.git.jpiecuch@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019144807.1207781-1-jpiecuch@google.com>
Subject: Re: [RFC PATCH sched_ext/for-7.4 0/5] sched_ext: Make
 ops.cpu_acquire/release() reliable
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 18, 2026 at 12:14:44PM +0000, Kuba Piecuch wrote:
> - ops.cpu_acquire() moves from before ops.dispatch() to the point where
>   the CPU actually switches to an SCX task or idle, so ops.dispatch()
>   may now run on a released CPU. A speculative acquire before dispatch
>   can't be made reliable without hooks in every class.

I'd like to reconsider this part of the approach, for two reasons.

First, it changes the semantics of ops.cpu_acquire() relative to the
original implementation. Schedulers could so far assume that the CPU
is acquired whenever ops.dispatch() runs. With this patchset they can't.

Second, it loses a case ops.cpu_release() should cover. Say an RT task
blocks, ops.dispatch() inserts T into the local DSQ, the rq lock gets
dropped, another RT task wakes up on the CPU, the SCX pick returns
RETRY_TASK and the RT task wins. That's an RT -> RT switch, so the CPU
never becomes available, no ops.cpu_release() is invoked and T sits on
the local DSQ until the CPU picks from SCX again.

The standard answer to that would be SCX_ENQ_IMMED, but IMMED isn't
bulletproof either. It relies on rq->next_class being raised through
wakeup_preempt() whenever a higher-class task is about to take the CPU,
and there are several ways around that:

- sched_setscheduler() or a PI boost promoting a queued task to RT/DL:
  sched_change_end() doesn't call wakeup_preempt() for non-running
  tasks, switched_to_rt() only does resched_curr() and switched_to_dl()
  calls wakeup_preempt_dl() directly.

- DL replenishment (dl_task_timer()), CFS bandwidth unthrottling
  (partial mode) and RT group unthrottling enqueue and resched_curr()
  without going through wakeup_preempt().

- When the ext dl_server picks an SCX task, next_class becomes ext
  although RT tasks are queued, so rq_is_open() accepts IMMED inserts.
  Once the server runs out of budget, RT takes over without any wakeup.

- With core scheduling, a forced idle pick resets next_class to idle
  while tasks remain on the local DSQ, so a later RT wakeup goes to
  wakeup_preempt_idle() rather than wakeup_preempt_scx().

In all of these, IMMED tasks end up stranded on the local DSQ behind
the higher-class task.

Making next_class exact would mean touching rt, dl, fair and core, and
still wouldn't cover the dl_server and forced idle cases. What I think
would fix it is a single SCX hook in __schedule(), right after the pick:

	next = pick_next_task(rq, &rf);
	rq->next_class = next->sched_class;
	scx_settle_pick(rq, next);

gated on scx_enabled() and next's class being above ext. At that point
the pick is final, the hook runs on the CPU that's going to run next
(core-sched siblings settle in their own __schedule()), and a preempted
prev as well as anything ops.dispatch() inserted are already on the
local DSQ. If rq->scx.nr_immed is non-zero, the hook schedules a
re-enqueue of the IMMED tasks, whatever made the higher-class task
runnable.

The same hook also allows fixing ops.cpu_acquire/release() while
preserving the original semantics. ops.cpu_acquire() stays in
dispatch_one(), before ops.dispatch(), and the hook releases the CPU
if it's still acquired when the pick lands above ext, with the task
actually picked in args->task. That correctly handles every abandoned
pick (RETRY_TASK, the ext dl_server returning NULL, core-sched
restarts), and in the example with an RT task above ops.cpu_release()
gets to re-enqueue T. The release calls v1 adds to put_prev_task_scx()
and put_prev_task_idle() go away. The rest of v1 (class changes,
hotplug, enable/disable) stays.

Tejun, Peter, would a hook like this be acceptable? The core.c
footprint is one line, it's a static branch when SCX isn't enabled, and
the out-of-line call only happens when the pick goes to a class above
SCX. If you're OK with it, I'd send the IMMED fix first, separately
(Fixes: 98d709cba319 ("sched_ext: Implement SCX_ENQ_IMMED")), and
rebase v2 of this series on top of it.

Thanks,
Kuba
