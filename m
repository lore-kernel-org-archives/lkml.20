Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1EB1A9B46
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441952; cv=none; b=nntdbBiAx/vfsr5fErb5L+0/5WOcwltSVg1TWmybtN8wo2prMAe9rAfWjOEjq2lyToLaeNSDk9c1usbbvjVMxge2arPPs29+xwrab92nr+II/2BixQRSeDDis+8B52L6Lf6JXRF+iow0TrY/wEIc4Xl6UCOFpm8jPQaAInupZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441952; c=relaxed/simple;
	bh=Nlko003zshr9E6IRb8Mq9Qqt7cyfVhuLTDPkIMIwlcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H0ZeiChVBhq7qEFaskpkXg5jpL/JzsR4uETYstdPIy+CJokI1nsRHjTgaMto/paEiTtJIZgAShBiYS1wX4lmbMwGa1Dfiyqg62sH1w5tUjhk8XRbQCagI7ebEfJ1lxMZCC/qJGoDQ4pKNJk1/CJJBdxcsnhuWC5a/m03L7mP/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=l3Q+tQCj; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="l3Q+tQCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=IY
	ePS5LqvP2FXOl6TJQVq+VIgGLvcNNBxTAb6V0z3nw=; b=l3Q+tQCjhWsGIw1cb5
	FYZBFe/JhReep5rK7cRAYYhWz+Z25c3pk7IkK+iEqxw2h1pwtGd6I+KWog/fmpJ3
	ZW2qQmdaHQhKLwnRUv4gLFG8lGUWT5yXnG2auCifs3GsyumEp/CzGxQTX6kt9G7V
	G8TXnGhMQcap3hnwLh7TKXMfM=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAH7anXO8dq8PrRDQ--.12746S2;
	Thu, 08 Oct 2026 14:44:40 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mike Galbraith <efault@gmx.de>,
	linux-kernel@vger.kernel.org,
	Hui Su <sh_def@163.com>
Subject: [PATCH] sched/autogroup: Serialize nice rate-limit updates
Date: Thu,  8 Oct 2026 15:44:39 +0900
Message-ID: <20261008064440.240528-1-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgAH7anXO8dq8PrRDQ--.12746S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr43uryxKr1UAFyUur15urg_yoW5Jr17pF
	WqyayUtr42q3W7W3Z7Aay8ZFyruw1Ig3y7Jr17G3yfAF1xGw1Fgr10q3yayF47KF9FvFy3
	Zr90y3W3CFyqkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREApUUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6RiR8GrHO9gw9QAA3b

proc_sched_autogroup_set_nice() uses a function-static timestamp to
rate-limit the expensive sched_group_set_shares() operation.

The timestamp check and update are not serialized. Two concurrent
unprivileged writers can therefore both observe an expired timestamp,
update it, and proceed to sched_group_set_shares(), defeating the
intended 100 ms rate limit.

Serialize the timestamp check and update with a dedicated spinlock.
Evaluate the capability before entering the lock and keep the heavy
autogroup operation outside the critical section.

Fixes: 5091faa449ee ("sched: Add 'autogroup' scheduling feature: automated per session task groups")
Signed-off-by: Hui Su <sh_def@163.com>
---
Testing:
- x86_64 KVM KCSAN forced-overlap reproducer reported concurrent writes
  to the shared timestamp from proc_sched_autogroup_set_nice() on CPUs
  0 and 1.
- x86_64 KVM rate-limit oracle observed two pre-fix writes within 20 ms
  and no post-fix pair within a 100 ms window.
---
 kernel/sched/autogroup.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/autogroup.c b/kernel/sched/autogroup.c
index e380cf9372bb..3469a52dd255 100644
--- a/kernel/sched/autogroup.c
+++ b/kernel/sched/autogroup.c
@@ -230,11 +230,14 @@ __setup("noautogroup", setup_autogroup);
 
 #ifdef CONFIG_PROC_FS
 
+static DEFINE_SPINLOCK(autogroup_nice_lock);
+
 int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
 {
 	static unsigned long next = INITIAL_JIFFIES;
 	struct autogroup *ag;
 	unsigned long shares;
+	bool admin;
 	int err, idx;
 
 	if (nice < MIN_NICE || nice > MAX_NICE)
@@ -247,11 +250,17 @@ int proc_sched_autogroup_set_nice(struct task_struct *p, int nice)
 	if (nice < 0 && !can_nice(current, nice))
 		return -EPERM;
 
-	/* This is a heavy operation, taking global locks.. */
-	if (!capable(CAP_SYS_ADMIN) && time_before(jiffies, next))
+	admin = capable(CAP_SYS_ADMIN);
+
+	/* Rate-limit this heavy operation, which takes global locks. */
+	spin_lock(&autogroup_nice_lock);
+	if (!admin && time_before(jiffies, next)) {
+		spin_unlock(&autogroup_nice_lock);
 		return -EAGAIN;
+	}
 
 	next = HZ / 10 + jiffies;
+	spin_unlock(&autogroup_nice_lock);
 	ag = autogroup_task_get(p);
 
 	idx = array_index_nospec(nice + 20, 40);

base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581
-- 
2.55.0

