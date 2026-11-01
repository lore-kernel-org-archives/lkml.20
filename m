Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543557;
	b=VFKmi+IYkhZbFWUoKN6WiezQOPmh6C4+4SymsfgO/WbEQuScRKnQclag3sOMvr1AMsm0
	 74C1zQP6TQrP+k3yXGVR4OoL2whyiGAf/c8ptk+efcpwpnDBNbZREmrN3tLVi0hhxI9IL
	 56GGYEu+khurktEjOx3CaKHZatiyym2vML3PUOEkAGO1m81lQbC5tJewltFTQKhB65cMF
	 GnnmA+BH5zASzNjNHA8rD5o+96Dwp/jWHOhYJEUKodGHU4MJJ5JcHF3rbDOg8XpnrtAVO
	 m8ZLb5rqVTcWdOpCQpYB1RgLZ1eyffGnMqo4kEbZfyiACM1UttQBaLuQyuuh7ZnUgHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543557;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=33+Ajih/EybhbhvEqS+vJmQByXgj3jIZ+TH4V/duWTA=;
	b=qnWUP05I35IcpSI1jKhs7JDiYQQ8ndCWexxMbQYKwxvaMvUF56qhmMKeQGmE7fLhmc8Q
	 /4GZDa5caNi2PKPa0s70nuUK/oF49uAq+yiq6qUC6rOhu2OikwnswN4LQ+XjUJ0oxJo9J
	 eRFl2M2MAEGYX49QYDClziVYYORObQJH3Iu54pRrltMrkB+Yp6R5DIIqbFHQZCmMV5gLV
	 /V4ZWJa6K6DqD+KW8dn26RRKqp3Y+luc2W3NkLFHU7NOql4T/Fp8sQ5j5JyQ3zm/lGgGx
	 meAAx/kaixImhzbq7I0xrl4sQ9Da3enGHAMOmfI23aGglb5YDQIDcqwqdlIPPrL9cZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZOUXOeGo;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C84606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C84606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ZOUXOeGo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=33
	+Ajih/EybhbhvEqS+vJmQByXgj3jIZ+TH4V/duWTA=; b=ZOUXOeGo7GtZE/cG3i
	EXmVCirT9MLnTeKF+/QYzhvUiN9SHFD1oDcOGJYPu3l59tIgvykteRGDsruOWhpo
	DDUgz6xQitw6Jq9hpNR3uCRsnHhAzPmviDnceMlAiMw3+iYhhKOl9dAn0ubIpAzF
	UlJZAJV7+RibCD4C+rfp42WgI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3H7olTedqVuV_EA--.26938S2;
	Sun, 01 Nov 2026 22:31:02 +0800 (CST)
From: albin_yang@163.com
To: kayracizmeci@gmail.com,
	peterz@infradead.org,
	kprateek.nayak@amd.com
Cc: albin_yang@163.com,
	albinwyang@tencent.com,
	bsegall@google.com,
	chen.yu@linux.dev,
	dietmar.eggemann@arm.com,
	jstultz@google.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated blocked donors
Date: Sun,  1 Nov 2026 22:31:01 +0800
Message-ID: <20261101143101.353033-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <0d9bce4b-0d50-46df-b865-76511b2670f6@amd.com>
References: <0d9bce4b-0d50-46df-b865-76511b2670f6@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H7olTedqVuV_EA--.26938S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4xCw4xKw48KF47ur43GFg_yoW5CryDpa
	ykJa43Kw4UKFWUX3WxAr4kX34a9wn7t343Grnay345AF45JrySqFyfKr45uFZ0krZ3uFWS
	vFWjqwsIkFWDCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUNIDwUUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC7wfwk2rnTScg1wAA3b

On Wed, Oct 28, 2026 at 09:10:20AM +0530, K Prateek Nayak wrote:
> Yup! on_cpu / task_current() gets dealt at sched_info_switch()
> which will enqueue the signal if the task is preempted.

Prateek, Kayra, Peter -- thanks for the reviews and suggestions.

I tested the full diff below (comments stripped for brevity).

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
@@ static int ttwu_runnable(struct task_struct *p, int wake_flags) @@
 	if (!task_on_cpu(rq, p)) {
 		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
+		sched_info_enqueue(rq, p);
 	}
 	ttwu_do_wakeup(p);
 	return 1;

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
@@ static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t) @@
 	unsigned long long delta = 0;
+	if (t->is_blocked)
+		t->sched_info.last_queued = 0;

 	if (!t->sched_info.last_queued)
 		return;
@@ static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t) @@
-	if (!t->sched_info.last_queued)
+	if (!t->sched_info.last_queued || t->is_blocked)
 		t->sched_info.last_queued = rq_clock(rq);

Results -- run_delay is field 2 of /proc/<tid>/schedstat:

  proxy exec, donor migrated to the owner's CPU (~170 ms block)
    unpatched   167.07-167.09 ms   5/5   migrated
    patched       0.00 ms         20/20  migrated
    same-cpu      0.00 ms          0/5   not migrated

  DELAY_DEQUEUE, sleeper migrated across CPUs (~150 ms sleep)
    unpatched   147.94-147.99 ms   5/20
    patched       0.00 ms          0/100

Accounting stays alive in both: the proxy reproducer's sanity check
still gains ~39 ms per 80 ms contention window in every run, and the
DELAY_DEQUEUE one shows run_delay growing ~40 ms per round. The latter
also self-checks -- it has to reproduce unpatched, and it does.

Agreed with Kayra and Prateek that p==current needs no call:
try_to_wake_up() WARN_ON_ONCE()s on both se.sched_delayed and
is_blocked there, so that task is running, not waiting.

One ask, about the split rather than the code: keep the DELAY_DEQUEUE
fix as its own patch on se.sched_delayed. p->is_blocked arrived in
4c2a20413d7f and first appears in v7.2-rc1, while that over-count goes
back to v6.12 (152e11f6df29) -- folded in, it cannot be built or
backported for v6.12.y..v7.1.y. It already exists as v4, already
reviewed and tested:

  https://lore.kernel.org/all/20261024042753.2276779-1-albin_yang@163.com/

Happy to be overruled.

On the proxy gate itself, dropping my own !task_is_blocked():
Prateek's covers at least the same ground, and I could not measure a
difference.

Still unmeasured: the donor already being back on p->wake_cpu -- the
case that motivated the ttwu_runnable() call. Every round I measured
ended up with task_cpu(p) != p->wake_cpu, so proxy_needs_return() did
the dequeue and the call was never reached. Forcing that path needs
the owner to migrate mid-hold and the donor to follow it, which is
timing sensitive -- I'll report if I get it, but don't hold the patch
on it.

I'm happy to post this as a series if that helps -- how would you
suggest splitting it?

Thanks,
Wei Yang

