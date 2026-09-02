Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7F387369
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337290; cv=none; b=GBPxVOxc1boO32+hKf7fPvBFYX3G5xCE9AOegrywzTZ5NnoHCix6//kozhoqNcuzzxpI10ZieW/FfCCHRX/t5AgvMydyL8gpJTHE3LCylRjilU2sCheUBK6afFyM2Lx7JBG9rIHGbWzmK04iES4UR2oOcBBqshVoHrjQmPL611g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337290; c=relaxed/simple;
	bh=S/DDeofDFjukeAqdAjT4JO0tmRjj5+yKl/2bPOQzAMo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J7DMZEXXMAyDJ+1yqq8ktibPVS9WpCzQ58VLWdJ8ll9kBJr1dkcLB7Qze7F+QxnzA0k0tw5ZfPRbSGWHM1tMkqFDQ2x09zrjwMGUp14oB4CuiIwWmSQn+u3x9SHBGSRU94SC8eFkezVvjhNVx85mmL5VAZRWz1lGm1z8d8SS2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jBaZw2qW; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jBaZw2qW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788337285; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=iNoRqdc8m9w3m+60kUwqxzcZvb/6PUqMIyy503xs1Pg=;
	b=jBaZw2qWzOHGG/k0GleYHLDoE4kqwKR2zF7rskeK+U7CTxdbi3U+CtJsR8qQ7YLiZjawzX1jSUQTdDDY7WS04NulWRJIVyhYmYIYjUtWYsyAiWv0imvDnr2lTkn4giOMCczMH/5H69wvhLOF+XRPJewungAhltzeWQ26IwvMFv4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XAC1mFU_1788337284;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0XAC1mFU_1788337284 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 16:21:24 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH] sched_clock: Add option to use absolute time against hardware clock reset
Date: Wed,  2 Sep 2026 16:21:23 +0800
Message-Id: <20260902082123.95770-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently sched_clock shows the relative time to the boot starting of
kernel, while there could be long firmware start time before it and
after the hardware reset.

On modern server platforms, there could be several software running in
parallel. Like for arm64, it could have  SCP (System Control Processor)
firmware running on SCP processor, and ATF (Arm Trusted Firmware) and
Linux OS on the main processor.

Debugging some nasty issues on these platform may need to cross-check
the logs from these firmwares and Linux kernel for specific events,
where a unified reference timeline is critical. All these software can
read the hardware timer, which is also the base of sched_clock for
Linux kernel. Using the absolute counter since hardware timer reset
makes it possible for all kinds of software to have a same time base.

Add 'abs_sched_clock' parameter to provide an option for using absolute
counter, and users should make sure their sched_clock (hardware timer)
is capable of supporting absolute counter before enabling the option.

Locally, it did help on chasing some RAS issues which needed cooperation
between kernel, SCP firmware and ATF, by mapping the actions from each
players into one timeline based on the timestamps in their logs.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 kernel/time/sched_clock.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index f3aaef695b8c..321c580d6799 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -49,6 +49,10 @@ static int irqtime = -1;
 
 core_param(irqtime, irqtime, int, 0400);
 
+/* Whether to use the absolute counter since the clock hardware reset */
+static bool abs_sched_clock;
+core_param(abs_sched_clock, abs_sched_clock, bool, 0400);
+
 static u64 notrace jiffy_sched_clock_read(void)
 {
 	/*
@@ -200,10 +204,14 @@ void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 
 	rd = cd.read_data[0];
 
-	/* Update epoch for new counter and update 'epoch_ns' from old counter*/
+	/* Update epoch for new counter and update 'epoch_ns' */
 	new_epoch = read();
-	cyc = cd.actual_read_sched_clock();
-	ns = rd.epoch_ns + cyc_to_ns((cyc - rd.epoch_cyc) & rd.sched_clock_mask, rd.mult, rd.shift);
+	if (abs_sched_clock) {
+		ns = cyc_to_ns(new_epoch & new_mask, new_mult, new_shift);
+	} else {
+		cyc = cd.actual_read_sched_clock();
+		ns = rd.epoch_ns + cyc_to_ns((cyc - rd.epoch_cyc) & rd.sched_clock_mask, rd.mult, rd.shift);
+	}
 	cd.actual_read_sched_clock = read;
 
 	rd.read_sched_clock	= read;
-- 
2.39.5 (Apple Git-154)

