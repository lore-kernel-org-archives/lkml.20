Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98DC1A680C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789832001; cv=none; b=Lt7lhZgqfOpE46758X0FG17u0YP61XiK3+HGGqHp9ZlxhBn20nR3jsEiWaidYD5fmM3n7pdYjhtnPUhd8w9tC6ir2C71u/KjHWjTwYAhoYwZV5QxnLkrPHzSyTD0VbAJAR4GcqVgzoYdFqAfdq2UDToQgysmvm2qx5Rs2lPyFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789832001; c=relaxed/simple;
	bh=a088FxG2waloim9RzjfS45y1hPOO9pTqZqMzPwzEvBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOfdVSHm5LNndfHP+Mx5eJDI7bBuG/ZSlJI++OtACg+twg8/oQG05OYAb5pH4F010pgjwxvHOqqLwbANh8ioJAkN6asG3t3k54EHeJQNMu41ZTAzvSLXvOrsu3TamnzIwv763V/5jncJ843/UdCsilLe6uENW6RBd0uZHNDqNBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WewIRTvZ; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WewIRTvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=SX
	qVdzEgupXhMbjZnYcaK4zeTkCGQHh4mf4DloH80NQ=; b=WewIRTvZ1etxDIO+kZ
	2w63VgL/1Jj5k0VfLutmbRX8t+9nbh8/cwIWPq7zejk0ejWVe2ySfvG02wlgXLlx
	X4xD9MZgFjYOtNsIPJkUSebW3Eb9OIL/bRB03eLGffwK0xLTnohKaxS4ifhxhlZR
	hH2ol54wVZrW7HIlQAFfTIyLk=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3t6fqqq5qlyfRBQ--.7149S2;
	Sat, 19 Sep 2026 23:31:55 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] sched/deadline: Reject debugfs dl_server writes for inactive CPUs
Date: Sun, 20 Sep 2026 00:31:50 +0900
Message-ID: <20260919153150.2618403-3-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919153150.2618403-1-sh_def@163.com>
References: <20260919153150.2618403-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3t6fqqq5qlyfRBQ--.7149S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF43ZF4fGFyDZF45Ww1ftFb_yoW8Gw1rpF
	ZrGFWUWrWUtry8t3yvyr92ga4F9wsrGayaq3Z7Wr93ZryFkrySqa1Y9rya9F17try5CryY
	vFWv934Iqayqqw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU739UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QsrimququvKbwAA3j

Commit 4043f5498416 ("sched/deadline: Reject debugfs dl_server writes
for offline CPUs") rejects per-CPU DL server parameter updates once the
target CPU is offline.

During CPU hot-unplug, however, the CPU is cleared from cpu_active_mask
before it is marked offline. This leaves a window where the CPU is no
longer active but cpu_online() still returns true, so
sched_server_write_common() continues to accept DL server updates.

There is no meaningful reason to reconfigure a per-CPU DL server once the
CPU is being deactivated. Reject the write when the target CPU is inactive
rather than only after it becomes offline.

Fixes: d741f297bcea ("sched/fair: Fair server interface")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/anw7IML1xzHys6re@jlelli-thinkpadt14gen4.remote.csb
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/sched/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..0e1642adb58c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -416,7 +416,7 @@ static ssize_t sched_server_write_common(struct file *filp, const char __user *u
 			return  -EINVAL;
 		}
 
-		if (!cpu_online(cpu_of(rq)))
+		if (!cpu_active(cpu_of(rq)))
 			return -EBUSY;
 
 		update_rq_clock(rq);
-- 
2.55.0

