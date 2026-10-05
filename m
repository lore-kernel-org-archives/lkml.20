Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA9248881
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185547; cv=none; b=qAJYDW1MWLtnw9NttQ2JnjVbcqqtgb/BDGf65R1Eo0dHaFdJXJnvi3aKmLmoLlhl1KUAuoqRysxyIM4Z4cGuld5El/DhpS0KqaVM+KYP7iDG141TcqKCqAyo6AsBXtcjuKhp+kAbBQ/tWuhEOJC0sYh84dHiE1M9yPHlv9JXt/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185547; c=relaxed/simple;
	bh=i3MhW3u4rI/7fSNYkPSGDXp9wwNmPkOkLpaVV2av/2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WvzaseMUsIO0IliRfkr1g5uziwSG1oRDUQ5Q75rr9FC1a2C589OIQhpQvPtloWqCNsDENvGuefLiRGOfT8fBoW7CA2gs8B0YDtVBYb0447yMF1wVrB6kFS2iJdhnA1pTYa8n+QoxKB9JWfpdmaudoR23auiSFh7UssDUJsBHpJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DHay7A2/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=togabaCg; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DHay7A2/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="togabaCg"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hyrgq20D3zKm5M;
	Mon, 05 Oct 2026 09:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1791185543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EPCFXPYp6jHIgMNbN/Hqj2UocbXOr6W6kRzBx/pb5Cs=;
	b=DHay7A2/ZgQeEUsXGbxwItE0gxgFmvvrrVc8KMIaFPXGKnL/VSCfJO1tG1wOM64IuQ9HF3
	PEDPDJ827F9Ry4SRWb7vfBh86jKNOXsAkXwXAmxDeUQjCodPZDd9lLz7AGUU+JbO+1q+VO
	NtFtdTByG44p9A+94SfypKU0YrF2BM5sUku+N95FJDpeYi1Cj5T8qkDlHhB2CEBp3RZzZE
	uoI16HIonH4x7Rng5OqoOpgYTU1i2iGjMdNwz7agqHLxfhvKoyrU2cqp4PnO/qsWfnjf3Q
	G173MvUQCCRraws5WVwtoi5/Akrw/MAiSRoT5kgcRWVbGbkm3ed27Wrox/vIiA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=togabaCg;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1791185541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EPCFXPYp6jHIgMNbN/Hqj2UocbXOr6W6kRzBx/pb5Cs=;
	b=togabaCgvXQzSok1Fx2fX7VyL0Q/fcUa58xHvyF5xy8xIBSUDKCPijjpGTCeLBOjeZc/II
	+0I1saByj2xt6ye32lRGQoKQA46W9R0ZeY4F5FSdOM4/leB4AKvyTD6yuJJGqUjs6LWkmn
	OGvwly7DyVDdgzCHKcnSZ7ben/liGTiIcJjBL0tXX58QpfwGsq7u6/qqq89gDrgU14WVg0
	Sw2FFDnbFpLIau47tvpiVdSG01+lt3iCXCUtM4WMz+rsAgphCXrUW+63R5HfFxHZqG/B7R
	wptcWpl4bEz8rM4hHMkd1TTdfLI9vyTZu4CND3Gow1HpGObQCjpBuQgOqLlNoQ==
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-kernel@vger.kernel.org
Subject: [Question] sched: rt.c: kernel-doc warning
Date: Mon,  5 Oct 2026 09:27:38 +0200
Message-ID: <20261005072738.2902503-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8436aoce3gitb78do9dktr8ddjpbd3hq
X-MBO-RS-ID: ac1ef69d79a06a0a7cb
X-Rspamd-Queue-Id: 4hyrgq20D3zKm5M

Hi,

I'm trying to fix built warning and stumbled over this one:

$make W=1 -j8 > make_output.txt
In file included from kernel/sched/build_policy.c:52:
kernel/sched/rt.c:12:18: warning: ‘max_rt_runtime’ defined but not used [-Wunused-const-variable=]
   12 | static const u64 max_rt_runtime = MAX_BW;
      |                  ^~~~~~~~~~~~~~

I just can't make sense of this, because max_rt_runtime is used later in the
file - see diff.
What am I missing?

Thanks
 Manuel Ebner
---
 kernel/sched/rt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a2..4d15f5c47 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -10,6 +10,14 @@
 int sched_rr_timeslice = RR_TIMESLICE;
 /* More than 4 hours if BW_SHIFT equals 20. */
 static const u64 max_rt_runtime = MAX_BW;
+/* When I build a tinyconfig this warning is triggered
+ *
+ * $make W=1 -j8 > make_output.txt
+ * In file included from kernel/sched/build_policy.c:52:
+ * kernel/sched/rt.c:12:18: warning: ‘max_rt_runtime’ defined but not used [-Wunused-const-variable=]
+ *   12 | static const u64 max_rt_runtime = MAX_BW;
+ *      |                  ^~~~~~~~~~~~~~
+ */
 
 /*
  * period over which we measure -rt task CPU usage in us.
@@ -2766,6 +2774,9 @@ static int tg_set_rt_bandwidth(struct task_group *tg,
 	 * Bound quota to defend quota against overflow during bandwidth shift.
 	 */
 	if (rt_runtime != RUNTIME_INF && rt_runtime > max_rt_runtime)
+/* 
+ * here max_rt_runtime is obviosly used
+ */
 		return -EINVAL;
 
 	mutex_lock(&rt_constraints_mutex);
@@ -2857,6 +2868,9 @@ static int sched_rt_global_validate(void)
 		((sysctl_sched_rt_runtime > sysctl_sched_rt_period) ||
 		 ((u64)sysctl_sched_rt_runtime *
 			NSEC_PER_USEC > max_rt_runtime)))
+/*
+ * here it is used again
+ */
 		return -EINVAL;
 
 #ifdef CONFIG_RT_GROUP_SCHED
-- 
2.55.0

