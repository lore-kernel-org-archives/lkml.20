Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728B6286425
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129106; cv=none; b=qUDIK7QEdtaLl/r1+t9NLJOADRnP7UXo+QLuxIzZVxl374O+ZVKDrMUtgkt2BpDmjLAFUjjg8eOEHAkLrfYkOhbNVmqvlmcrW+3a5CzDbOPrf5CO7aHx210Mq5vzrR0V6rXjmHqIfU/q1UVaoQ1r0Ug7JoRkZfs/FDSRhI6vu7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129106; c=relaxed/simple;
	bh=rEtnPWekXA5o6t5jqiTT+KP47/mHE0DgP8GNKlQ/2M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKEUgKfWu0RQiyvmCbIrWnwYjDzHZmf3CU8Jeca8yyorVa5j072mphdykmuI68hFYTROgLUV1RuXbyKYq4/zpL19G9qHDCEZ0PUjpO1LJk8dt+w7UbveSmsigbIdScliCGA/+VF52e71d7fJH0dVHrTl1rIFzJ8iy4QiRaBxKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DPnrrdJB; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DPnrrdJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rE
	tnPWekXA5o6t5jqiTT+KP47/mHE0DgP8GNKlQ/2M4=; b=DPnrrdJBfu+0ce9eJo
	DPpJErWokaAbKlKyHTSHriG8ANpnbBpi5GzMa9qP0j5/+217bI2uXA11+m9UbAbt
	kxeqpHIBkCmd5l300XWjSjNmjr2NLGUmm7JbcEzf+9WLAjFAuf27Jt0V6gGfpP06
	FuQvffmkK4dm53lUHJi+i35ho=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3P5VXM7NqH_PmAA--.44275S2;
	Wed, 23 Sep 2026 10:03:03 +0800 (CST)
From: albin_yang@163.com
To: peterz@infradead.org
Cc: mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	chen.yu@linux.dev,
	kayracizmeci@gmail.com,
	mintaohuang@tencent.com,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: Re: [PATCH v3] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
Date: Wed, 23 Sep 2026 10:03:02 +0800
Message-ID: <20260923020302.3581908-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260922105522.GO1837346@noisy.programming.kicks-ass.net>
References: <20260922105522.GO1837346@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P5VXM7NqH_PmAA--.44275S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4DXF1UAw1xuFyruw13XFb_yoW8XFyrpa
	s8Kr4UG3Wvgr45tFsrZr4xWa1FqwnxCayY9F18trWDZw15Jryavrn2kr4a9FWvkr4fCFsI
	9FnrXFyDAFyj93DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUP3kXUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC7xhqDWqzM1jRWgAA3p

Hi Peter,

On Tue, 22 Sep 2026 12:55:22 +0200, Peter Zijlstra wrote:
> Will we not have a similar problem with proxy exec? That is, would
> t->is_blocked be more appropriate?

Yes, there is a similar issue: proxy_migrate_task() re-attaches a blocked
donor via activate_task() without ENQUEUE_RESTORE -- a fake enqueue that
should not update last_queued. Thanks to Kayra for confirming this and for
the task_is_blocked() idea.

But t->is_blocked can't gate it. In ttwu_runnable(), the real wakeup of a
delayed task does its enqueue_task(ENQUEUE_DELAYED) inside the
if (p->is_blocked) branch, and is_blocked is only cleared afterwards in
ttwu_do_wakeup(). So !is_blocked would suppress exactly the re-arm this
patch relies on, and run_delay would never be accounted.

task_is_blocked() does look usable for the proxy case: every waker clears
blocked_on before waking the task (mutex handoff, ww_mutex die/wound,
proxy_needs_return), so it should not be set on a real wakeup enqueue. But
it cannot replace se.sched_delayed -- a delayed sleeper has no blocked_on at
all -- so it would have to be an additional condition rather than a
substitute.

Before adding that I would like to reproduce the proxy case and confirm what
the donor's run_delay should look like: whether the time it spent blocked on
the mutex ought to be dropped like a delayed sleep, or accounted somehow.

Please shed some light on how the proxy case could be dealt with, or should
this patch only focus on the delayed case?

Thanks,
Wei Yang

