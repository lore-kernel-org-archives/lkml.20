Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F95208B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984450; cv=none; b=FlL1ZTmm89PfnueaClDP8n5/+yTd3fDY7WgSWcl5LC4TOWZfHv9x0r7F3Jvgq9WvynKgqKHuJSMl1SOHP8eB6lygwoB+sh0HazgOSGKlPPonOkhaz6qWdcR+60eeGLAvn99ttsstLH/PD5+JSI24WpRZ/3roN93v+cLJ7kNVN8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984450; c=relaxed/simple;
	bh=4nL8G6ELl7CFMbqBG3zP8pSTdZg29zbTivq941bN5vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ee4WpGB0I7Lhle3MSbx7LK5LTCBustp0sXzJWkYpAe/tj1VsUxF9vQsM5zYzAVanSWH+w6WckHeyBW22qyvIaUCs4I7HL/7ZRMtIjdnKQbwkVumcnze0/sWp5R5wCWBboe0CAbseIVj3xLue4tpazTOu7zWGgyBVVaf3f+41EUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeOrhBVn; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeOrhBVn"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1419d3416ceso1587572c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984444; x=1792589244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E6cyyvnLPfAcAo320noo6/I7GUps9s4R9YkFjmNOko4=;
        b=GeOrhBVnG5hFtZHVHBV5As9C0yVNTQwbbWWgXmODGLKEz/Kg4zlL0iAo+K3NqE3lzw
         9zSn+8FR4yVZIgBd2bwj9yRr1uxZfaNFf80LkEZPgf6yGVAL7K2EpAtana14W6HlE4Lv
         Rqs9/quPRVpurwAb3EIQs0nzvKBozZtKB6k0bv4FA+mmbpXr/tmz0uEHX9AYl98GAP0u
         2voh3HNIi25DsJt6Yf40hUw8wILy/fL5Ks5vtjolHPzW/tjGhcpmX6o8N9Y7hgtS1lIf
         tdrCucIO5nEXirO85K7D/dKq2b/1m+/vDwRiolMV5OGBky6TmaTCmTQio37KmggbBXJd
         CdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984444; x=1792589244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E6cyyvnLPfAcAo320noo6/I7GUps9s4R9YkFjmNOko4=;
        b=ZYb3R7ksp9Aa7nfSuD8xH1jC20DbrIqOhHQkHv6eE+BBOvAkxiHH1vqAx7tF8rxPHW
         LcQVK5NtcZ4nUqQn1o4o2/dBQjorx4DoWvj5Z0bsWsj2uWpPziK74khDKYLeoP5XBrR4
         AqyAqYXysaQCGT9r6Jqmao0IvKj4asvIrMRHF0vsQsy0ywJM7h9KemPhrZVjChsjWq3C
         n0vwUE3dviH2S94qDvb+eIYjLjuqVMX+LAbpQIgnTCcfwnbXhrliftNZHjYQFuNHhTZX
         EpfoelvUsfiXwPK6lrgegnmT80oalNspmJ0oUPC1lVh+4Cl3eafrw2/7YpZDK2+xI2Iv
         SJ1w==
X-Forwarded-Encrypted: i=1; AKwUvBypHVivGNXg9lA+uq0Sv+xqYU/taCqYKYYqjHte5/wZvNFW83ee73f5ji3Uuk+p6VK8WW3Mwgu9u9BFpc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHzfL/kDyMf/CP6yEqmVqlRjpYgOtTZ7cuaooPGn5so0ZT3+Ez
	YEtV7MgVitc66kHNcE+YU4QbfTHlihH6gmcZESGCBTneICNF/V7RG6yG
X-Gm-Gg: AYBFou1bbgcnavsRYmvuofyL5AV6JHVQ9unmWBgG8Wco/G6Nad7mbOs+eX6WcgF3plx
	G0av7MW7R02khLIuxe8YYqMLYZYQwUxXugTWRGikM7BUX2nBVp5ZWfjHR1PDBhy9NsOX95+hp2S
	jJMoa2HhFJADWdwmPwSSMJrz4gh7CFF3hsHvIEh3zQi2Q87IKbRFIyjFfcUm4S+ZsCZaFZFJaCM
	j2pjczCMJ+PT8jjMjEBUd4N/vo9tzKiUdCxCypS+eVf/UcH74gQ39lPfLqfuvA8MHFgVR2zfCwH
	+K8ibmsK0sojKu8WuD11j0y/JBF2p7Qh0rUU+lJunUYwwQjFrxxSz151Akck/GCRDi+fmAOYHP7
	Uoq824yDcjPCG3GG3O9wT72/DTjsPeYS2e/Na2fxeJV9rXnKZM1ZM3FEAhp3KCzpSg545eNHQCM
	La4sVqKGx0qvs/je8e//mRRpGBDmjW2SvlUDBwFKEm8/b7uIBLXFl+xh+wilcsiscqrAM/ZFm7v
	WV2Mhzxfmw=
X-Received: by 2002:a05:701b:454b:10b0:14d:baf5:c40e with SMTP id a92af1059eb24-16a5faa76admr19755450c88.8.1791984434110;
        Wed, 14 Oct 2026 06:27:14 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm51159211c88.5.2026.10.14.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:27:12 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] sched/deadline: Restore dequeue schedstats on the task dequeue path
Date: Wed, 14 Oct 2026 21:27:04 +0800
Message-ID: <20261014132704.1200766-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update_stats_dequeue_dl() writes p->stats.sleep_start and
p->stats.block_start, and nothing else in deadline.c does.  Its only
caller is update_curr_dl_se(), on the throttle path, which passes
flags = 0, so the DEQUEUE_SLEEP branch that performs those writes never
runs.

Both fields therefore stay zero for SCHED_DEADLINE tasks, and
__update_stats_enqueue_sleeper() skips its work under
`if (sleep_start)` / `if (block_start)`.  A deadline task reports zero
sleep_max, sum_sleep_runtime, block_max, sum_block_runtime, iowait_sum
and iowait_count in /proc/PID/sched, emits no sched_stat_sleep,
sched_stat_blocked or sched_stat_iowait, and contributes nothing to
latencytop.

Commit b5eb4a5f6521 ("sched/dl: Support schedstats for deadline sched
class") called it from __dequeue_task_dl(), on the task dequeue path,
with flags passed through, mirroring update_stats_dequeue_fair().  That
was the only call.  Commit 63ba8422f876 ("sched/deadline: Introduce
deadline servers") replaced __dequeue_task_dl() with dequeue_dl_entity()
and added the throttle-path call instead of carrying the old one over.

Call it from dequeue_task_dl(), after the DEQUEUE_MIGRATING fixup so the
flags are complete.  dequeue_dl_entity() would be the wrong place:
dl_server_stop() reaches it with a server entity, for which dl_task_of()
does not yield a task.

Guard on on_dl_rq(), as set_next_task_dl() and put_prev_task_dl() do.
Without it a throttled task would be accounted twice, once by the
throttle path that dequeued its entity and once here, and the second
update_stats_wait_end_dl() would run against a wait_start the first one
had already cleared.

Restoring the call also makes the migration case behave as intended.
deactivate_task() sets TASK_ON_RQ_MIGRATING before dequeue_task(), so
__update_stats_wait_end() now takes its task_on_rq_migrating() branch and
carries the accumulated wait time into wait_start instead of finalising
it, which is what commit c0e1832ba6da ("sched: Fix incorrect schedstats
for rt and dl thread") aimed for but could not reach on deadline.

Fixes: 63ba8422f876 ("sched/deadline: Introduce deadline servers")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/sched/deadline.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5d..ba09f5a3c256a 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2556,6 +2556,8 @@ static bool dequeue_task_dl(struct rq *rq, struct task_struct *p, int flags)
 	if (task_on_rq_migrating(p))
 		flags |= DEQUEUE_MIGRATING;
 
+	if (on_dl_rq(&p->dl))
+		update_stats_dequeue_dl(&rq->dl, &p->dl, flags);
 	dequeue_dl_entity(&p->dl, flags);
 	if (!p->dl.dl_throttled && !dl_server(&p->dl))
 		dequeue_pushable_dl_task(rq, p);

base-commit: 4a3b51aab6e25244d97936aa65e6d5425adf98e1
-- 
2.43.0

