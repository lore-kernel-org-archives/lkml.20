Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933740;
	b=O3qsgnzsvIoAp8LdD+aP05Wxc5BYz9+DvVBBeu3Ld4Es9uNw9e26fTLagNOz+srlWWd3
	 lKB1ExSrS17IHD2x1oyaqMq88lKqh0ft7KthNbnu8hEbHl7miNVALTl3JoTRXgb2lilHD
	 5g/C/qJpj6ZTsryDNwlIt3UunpljwDwhh2ROM5d+wJ9uFCdQradxhYYm+hOOdGBDyJqaC
	 LAyVXwmJ+MqcbVr09KhV7oOlK7OOZVk0L916AHbGxmkG1uOKAr5Kv5UWjnGviXQ0pk5fV
	 IG05MIZaNSei6WJCP4d74l0OlhIKf+Q2GiWXV1c0Uq9b9sJXtAJU9cPsbhvrpWtElrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933740;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=8OfFtE9BghprGfgEs7SfcReLZbfiryOJ6K46f0rsq/8=;
	b=PMloNym4llfTmTasHDFt0MvDolLNUXebHtp/+Tk39M7U/Y1qL6xPUhoVhBIHiTJoIBj/
	 Z9CSWHnuteg09AyPbBTH4/mJ/M3fDew0k8zyJCYCUtsoeTP8k5gS4GSuEBtn8If9k4Pvw
	 yqFKfqwbUK0pMnNmfEX2IRQii0G2w4OMxehGtmWsAFlZ9IqdhBscEsVUWtP/rlt/CcB+1
	 d/XB+rzvS4pUVnl55kWbODcUX7YsRTXPx5yka022fvGekbuNklwpKwLLe4eISAZM2Wiqg
	 v+r7Q0YhS+fgIgZ9i1KOczxSIsOspCaVqLZ0YNercqFYJWvCG6tqB1KrY0MsxxcO6+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bvNZQYJy;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9613606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9613606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bvNZQYJy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8O
	fFtE9BghprGfgEs7SfcReLZbfiryOJ6K46f0rsq/8=; b=bvNZQYJySCZCqP4/EG
	Lh7FYeEezjdJdEQxFm32ESok0JMBKUmvH3LlBvO/gAY+mvanDBLdT3Yq42JOS5hY
	EJQ0p5XCQPS11jfiWebFyXqdn0VNUXGaAJMVbpuO8bN7rKUgIWmESf9Hej5vz6Yi
	5WGXq2uF5ellIx6mzi7VDhwFY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3x8gf_91qrpA2CQ--.39109S2;
	Sun, 25 Oct 2026 21:07:43 +0800 (CST)
From: albin_yang@163.com
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	chen.yu@linux.dev,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	albin_yang@163.com,
	albinwyang@tencent.com
Subject: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated blocked donors
Date: Sun, 25 Oct 2026 21:07:40 +0800
Message-ID: <20261025130740.3324391-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
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
X-CM-TRANSID:_____wD3x8gf_91qrpA2CQ--.39109S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAryUtFWxCr48Xr4rCryfJFb_yoW5Kryrpr
	Z3Ww17Gw4kKrWrK3ZFkr4UX3y3CwnrGw43KF1kt34rurs0yr1Igw17KF1xXFZYkrZavF4a
	vF1jga9xAF1qyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRLZ27UUUUU=
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbC7x8Zu2rd-x+QwQAA3U

From: Wei Yang <albinwyang@tencent.com>

When a task is blocked on a kernel mutex (a proxy-exec donor) and its mutex
owner runs on another CPU, find_proxy_task() migrates the still-blocked donor
to the owner's CPU via proxy_migrate_task(). This happens when the donor is
picked as next while not current, and the owner is on_rq and not delayed. The
migration re-attaches the donor with attach_task() -> activate_task(rq, p,
ENQUEUE_NOCLOCK), i.e. without ENQUEUE_RESTORE, so sched_info_enqueue() arms
last_queued even though the donor is not runnable at all -- a fake enqueue.

The real wakeup does not correct it: the donor is still on_rq and is not
sched_delayed, so ttwu_runnable() never calls enqueue_task(), and last_queued
keeps the migration timestamp. sched_info_arrive() then charges the whole
interval from the migration until the donor actually runs, i.e. the time it
spent blocked on the mutex is counted as time spent waiting for a CPU.

Fix by not re-arming last_queued while the task is still blocked on a mutex.
A delayed dequeue sleeper has no blocked_on, so this is an additional
condition rather than a replacement for the se.sched_delayed check, and the
DELAY_DEQUEUE fix is unaffected.

Measured on a 2 CPU VM: the same ~170 ms block is charged ~167 ms of
run_delay when the mutex owner runs on another CPU, and 0.01 ms with this
patch.

Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return migration)")
Signed-off-by: Wei Yang <albinwyang@tencent.com>
---

Reproducer notes and full numbers (5 iterations each, run_delay is field 2 of
/proc/<tid>/schedstat). A userspace futex mutex never sets blocked_on, so this
needs a small test module exposing a kernel mutex:

  config                          block      run_delay delta   migrated
  -----------------------------   -------    ---------------   --------
  cross-cpu, unfixed              169.9 ms   167.1 ms          5/5
  cross-cpu, DELAY_DEQUEUE fix    169.9 ms   167.1 ms          5/5
  cross-cpu, with this patch      169.8 ms     0.01 ms         5/5
  same-cpu (control)              167.3 ms     0.00 ms         0/5

Sanity check: with the donor runnable and contending for the CPU, run_delay
still grows by ~39 ms over an 80 ms window (5/5), so the gate suppresses only
the fake enqueue, not real waits.

Applies on top of:
  [PATCH v4] sched/stats: Fix run_delay over-count for migrated sched_delayed tasks
  https://lore.kernel.org/all/20261024042753.2276779-1-albin_yang@163.com/

Kept separate from the DELAY_DEQUEUE fix on purpose: the delayed dequeue
over-count exists from v6.12, while this one needs the proxy exec
blocked-waiter migration, which only landed in v7.1. Coupling them would
either fail to build (v6.12.y..v6.16.y, no proxy exec at all) or add a
dependency on code that cannot trigger (v6.17.y..v7.0.y, proxy exec present
but no blocked-waiter migration). The two are also independent: the
DELAY_DEQUEUE fix alone leaves this case at 167.1 ms.

 kernel/sched/stats.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index dc626f99ffd9..ef52fbe86bba 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -290,7 +290,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
  */
 static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
 {
-	if (!t->sched_info.last_queued && !t->se.sched_delayed)
+	if (!t->sched_info.last_queued && !t->se.sched_delayed && !task_is_blocked(t))
 		t->sched_info.last_queued = rq_clock(rq);
 }
 
-- 
2.43.7

