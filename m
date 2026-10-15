Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B23D953B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032712; cv=none; b=j9ChgxLqThiWXGpItsXvKWKRi+JahLJCsDKfY0rf+RD5br/r/YljchVa39wKseNJKCFYzRmJG/aG/7f4tmEe/CJiOY6dBz1qB0e9whXqIkxnecX66cTophDC9ArpNxLFA6TTP3X0Oik6Cq0BVbvUBgydq2fVkoVeSFvDLzdxjhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032712; c=relaxed/simple;
	bh=Qi1Hl1ATrZS7rS+yxOdTVGXBRUHQsAyHr4XF0N8iAOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBKrclpb05mwWqVb3Bcg6tK/pHIYxrbBexXMvAT6CINvV4X+7MLTQOdcciI5EfjMHVcKHIaRY+autrqs6QElHiIoXcd5L4Wnl0vewIhOH8giKZnfg9PWMtpykZrTvfU6IkBHGxYGv8Qp29pBI9to4jmHH1a9zsRujM8KzhtYPp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fA2kpRNs; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fA2kpRNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dp
	kgwh85BOXPAJHQjWppV1CE+brnrcfstCcvjd9xMhM=; b=fA2kpRNs8uEnwT2zge
	CFzq4jHbtiUMqzs24u1PaatvB7xW9P6FYVzMoQ7285Ur5zuC1d/xUItNiXhENRpO
	GI41ZoFfFZkvtYpGu56+Bf9XHxSNawhQ+xpJLtPV+fpNfBmkgkrruBBrpQ0+1ls7
	SpdlKaLfsKOQReegsmULuwX+g=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wA3Tx50P9BqUumUEQ--.27817S2;
	Thu, 15 Oct 2026 10:50:29 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/idle: Destroy on-stack hrtimer in play_idle_precise()
Date: Thu, 15 Oct 2026 11:50:28 +0900
Message-ID: <20261015025029.3356060-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3Tx50P9BqUumUEQ--.27817S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFyUWF1UWFW5ZrW8Ary3CFg_yoW8JFW3p3
	90qFy3Kw4UX34qy398AF4kZryUuwsxZa43JFyFgr1rAF4kKr1jqF4jva43Xa1fCr40vw13
	Aa4Fqwnayr15CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6Ra7G2rQP3aaMwAA3F

play_idle_precise() initializes it.timer with hrtimer_setup_on_stack(),
but does not call destroy_hrtimer_on_stack() before the stack object
goes out of scope.

With CONFIG_DEBUG_OBJECTS_TIMERS, hrtimer_setup_on_stack() registers the
timer as an on-stack debug object. Such objects must be removed before
leaving the function which allocated them.

Call destroy_hrtimer_on_stack() after the expiry loop to balance the
on-stack timer lifetime.

Fixes: c1de45ca831a ("sched/idle: Add support for tasks that inject idle")
Signed-off-by: Hui Su <sh_def@163.com>
---
Tested on x86_64 combined candidate tree:

- hrtimer setup/free oracle: PASS (127/127 and 129/129)

- bzImage and modules build: PASS

- Branch-specific validation after split: NOT RUN

 kernel/sched/idle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index eb73b65ce6c4..96adec3f0a6d 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -436,6 +436,7 @@ void play_idle_precise(u64 duration_ns, u64 latency_ns)
 
 	while (!READ_ONCE(it.done))
 		do_idle();
+	destroy_hrtimer_on_stack(&it.timer);
 
 	cpuidle_use_deepest_state(0);
 	current->flags &= ~PF_IDLE;

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053

