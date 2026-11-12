Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446682;
	b=2o6pnPUFd4JhVi5MFs1bZi3BzM/eMWaj3fIZtrt8UQvq5RYm99uyiio9zuxszIiVvNe0
	 RJS1kJNMi2DMaHI2x5WrP6oAsAwZ0rYtuliMCPCwBhdoTu9K46TByWpYAUZTBzphXZM1B
	 lV3PVC672W2OUIHH4v9CpAcA82q51D/V3N8jZSWcw/P/MKugrxjhxc0kPNqqKNtwRMmQh
	 E8hohCZcAsScR6h17ewYjnbyuSffR9JdQQXRNSt5k2Lypy/EGz3FjoCvMjL2YcsknVmpo
	 sULkjaYyJBsN6FXK1xI2jrTO8VfgBHRe1juT+XoBNUj4AiXvbaW/T+/zWQaFDshVU2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446682;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=le8//bQ1MsqlKhfhyQcaY27RPb+slISsfB6M0DEKU1Y=;
	b=p0IcgfS0wTZm3kpHZns2d7F/L7aVg4WltExgxmVSRNp0qEE4J6yAxDyjdq1XbxV9Ax6j
	 NtUHqys+P7WT1oo/6sMwFK2EXPIGIcq3mzIB/tzSUOC7hk/eN7lA3iBQjGASuJyKFLeQw
	 s5hlE672tQtiT9SLr45FKHUd/+3+QB7qmPQ1MCRtpnK2zk9ERKfCNzO4mY6OBtnYCmGqZ
	 yfbdNejMDvFFDAlKtH8E8ao7bHuqUc0Sm4SoZuhlr1TwsM5Y1W8fpGvFLnB+FVBzDTxDD
	 utXG4I3UntnTOlTodw5+vsy14T78UDPNwPFc7VlhksEyIhSPKPxyEgRheCJoVL1KFKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MHTXx3v6;
	arc=none smtp.remote-ip=95.215.58.247
Received: from mta1.migadu.com (out-247.mta1.migadu.com [95.215.58.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B12606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MHTXx3v6
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ulv6tsTtSPsNosfQZmLlbNP0rOnXSeLmQGkvMXd7cDg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794446679; v=1; x=1795051479;
 b=MHTXx3v6JJyx9/VKjZ34x4jjFVl8v+yXZ9eA1PkwFGR0fGEC//ZJrg15U2uhcF2AfVdoDz3Y
 YAbqsQNkbKcdxCYJ2W46VxQHPygdXW3kyqXWjMe46poAxpZi3BDbL+bLaZt8ifubh75uS7Ba4gw
 /yrk1V3QyTYYd4vQeHPniS10=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 217b7d0f88b6f002;
	Thu, 12 Nov 2026 01:24:39 +0000
X-Mizu-Trace-ID: 217b7d0f88b6f002
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 11 Nov 2026 20:24:21 -0500
Subject: [PATCH 2/2] sched/fair: Avoid re-syncing runtime_enabled on root
 domain changes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-bug-sched-fair-offline-active-v1-2-4f54523c5a70@linux.dev>
References: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
In-Reply-To: <20261111-bug-sched-fair-offline-active-v1-0-4f54523c5a70@linux.dev>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

rq_online_fair() calls update_runtime_enabled(), which walks every task
group and takes each group's cfs_bandwidth lock to copy its quota state
into the CPU's cfs_rq. A sched domain rebuild reaches it for every
active CPU through rq_attach_root(), with the rq lock held and
interrupts disabled.

The walk only matters when the cached state may be stale. While a CPU
is online, tg_set_cfs_bandwidth() updates runtime_enabled on it under
the rq lock, and it holds cpus_read_lock() so it cannot miss a CPU that
is coming up. Only unthrottle_offline_cfs_rqs() clears runtime_enabled
behind its back, and a CPU that has never been online has not been
visited at all.

Track this in a per-rq flag that update_runtime_enabled() sets after
the walk and unthrottle_offline_cfs_rqs() clears, and skip the walk
while it is set.

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0,
switching a 4-CPU cpuset to a partition root and offlining or onlining
one CPU take (median of 20 partition switches and 16 hotplug operations):

  operation         before (ms)  after (ms)  change
  partition root           7.68        1.21    -84%
  cpu offline             30.96       13.44    -57%
  cpu online              28.48       12.82    -55%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/fair.c  | 11 +++++++++++
 kernel/sched/sched.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e245a31b0544e..e2f67bdc3031e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7798,6 +7798,15 @@ static void __maybe_unused update_runtime_enabled(struct rq *rq)
 
 	lockdep_assert_rq_held(rq);
 
+	/*
+	 * tg_set_cfs_bandwidth() keeps runtime_enabled up to date while the
+	 * CPU is online, so only the first activation and the one following
+	 * unthrottle_offline_cfs_rqs() need the walk.
+	 */
+	if (rq->cfsb_runtime_valid)
+		return;
+	rq->cfsb_runtime_valid = true;
+
 	guard(rcu)();
 
 	list_for_each_entry_rcu(tg, &task_groups, list) {
@@ -7816,6 +7825,8 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 
 	lockdep_assert_rq_held(rq);
 
+	rq->cfsb_runtime_valid = false;
+
 	/*
 	 * The rq clock has already been updated in the
 	 * set_rq_offline(), so we should skip updating
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 1d76950dbb0a1..1a73383204384 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1412,6 +1412,8 @@ struct rq {
 #ifdef CONFIG_CFS_BANDWIDTH
 	call_single_data_t	cfsb_csd;
 	struct list_head	cfsb_csd_list;
+	/* cfs_rq->runtime_enabled is in sync with the quota of every group */
+	bool			cfsb_runtime_valid;
 #endif
 
 	atomic_t		nr_iowait;

-- 
2.43.0

