Received: from mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB455361666
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804699; cv=none; b=uh/9x2tgM+aOiq5Q1XzhBUd2YFnQl12hlo7970jobldeQTiJ0gOYmIJxn2av5/34m+3LwlHuJk4Np51kdZ0NUkWL7e+0ULWASFD278zSkHjr3YqaSFcvFE45aRzrD1fAbpB5SXXHD4EMUiSGEfFrd5eeuSj2npKYr9YkNVYnHVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804699; c=relaxed/simple;
	bh=vxdy9qtL8Iw/0qYgNuNxt/3jsmrIDEf3IspObO+lOmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKUgiibpN9v7UowjxyQhirVbleNShjxuJJdv6Jjk0B0rbDb4LBS22D9YBomy0sOjTzZ0f72Mwwtly7HbAmJDvjxBQNJy3kTaI1Px35q5yMWYq43KRf8/GBvEEhoCcocHqxvH86tGglxy6CBWPewCUIJabYYUkebi/PzVsOZhsIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uJWDWwJR; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uJWDWwJR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vxdy9qtL8Iw/0qYgNuNxt/3jsmrIDEf3IspObO+lOmE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789804694; v=1; x=1790409494;
 b=uJWDWwJRHL3Ncv9HWlp2j3oZpHzwzE9yqdnI6HVUEQqC4w+5HMapSv47ZyqyvEAE3PlosmVi
 0K3H7GdabBwsW5ecxWtOPZU5UP1gUj8vmGiQIjsok665zbIXkoofCkumo9rTmbItBAYjQ64CwUd
 5OorlY7/i7yOUFyfQlFLRguw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eb1e4559383463a5;
	Sat, 19 Sep 2026 07:58:04 +0000
X-Mizu-Trace-ID: eb1e4559383463a5
X-Migadu-Flow: FLOW_OUT
Date: Sat, 19 Sep 2026 15:58:09 +0800
From: Chen Yu <chen.yu@linux.dev>
To: albin_yang@163.com
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, albinwyang@tencent.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for migrated
 sched_delayed tasks
Message-ID: <aq5AkZq396xkL4LW@three-body>
References: <20260909133345.1572954-1-albin_yang@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909133345.1572954-1-albin_yang@163.com>

On Wed, Sep 09, 2026 at 09:33:45PM +0800, albin_yang@163.com wrote:
> Date: Wed,  9 Sep 2026 21:33:45 +0800
> From: albin_yang@163.com
> To: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
>  vincent.guittot@linaro.org
> Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
>  mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
>  linux-kernel@vger.kernel.org, albinwyang@tencent.com
> Subject: [PATCH] sched/stats: Fix run_delay over-count for migrated
>  sched_delayed tasks
> X-Mailer: git-send-email 2.43.7
> 
> From: Wei Yang <albinwyang@tencent.com>
> 
> With DELAY_DEQUEUE, a blocked task stays on the runqueue with
> se.sched_delayed set and its sched_info.last_queued is cleared, so the sleep
> is not counted into run_delay.

Agree.
The sched_info.last_queued was cleared when that blocked task
switched in on the CPU, its last_queued was cleared in sched_info_arrive(),
because the task did not have to wait/delay anymore, it seems to be me that
the "delayed status" has nothing to do with "run_delay". The issue is what is
the realy timestamp of the task starts to wait.

> 
> When such a delayed (sleeping) task is migrated across CPUs via the plain
> migration paths (move_queued_task / move_queued_task_locked, the latter used
> by __migrate_swap_task), 

Right, for all the migration caused by passive/active load balance(attach_task,
with migrate_load type, see can_migrate_task()), NUMA balancing, CPU affinity changes
via sched_setaffinity(move_queued_task), etc, we should not update the "delayed"
task's last_queued field when enqueuing it on a new CPU - afterall it is not ready
for running.

> activate_task(dst, 0) calls enqueue_task() without
> ENQUEUE_RESTORE, re-arming last_queued to the migration timestamp while the
> task is still sleeping. The later real wakeup (ENQUEUE_DELAYED) tries to
> re-arm last_queued at wakeup time but is suppressed because last_queued is
> already non-zero, so sched_info_arrive() folds the whole sleep duration
> between migration and wakeup into run_delay.
> 
> Fix by not re-arming last_queued for a sched_delayed task in
> sched_info_enqueue(). The wakeup path clears sched_delayed before reaching
> sched_info_enqueue(), so it still re-arms at the real wakeup time. Plain
> runnable tasks and load-balance migrations are unaffected (sched_delayed
> tasks are excluded from active load balancing).
> 
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Signed-off-by: Wei Yang <albinwyang@tencent.com>

Per my understanding, it looks good to me,

Reviewed-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu
