Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4FA3B7757
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165660; cv=none; b=ac23svtaUAqqF7WdHCNOlPgp4i19BF6kmyAipaYoMNHhV9I4D5VA1onOTZWHZFS09ZDr6BX0/822LFsGQX/5y+LcQQ48nqiPLSTnIO71T8+D86izF9yo60EQdoTj7IvGHbIYXxFEYB8CZy451HWwSib8TrhuJlNg7TKsInFOo+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165660; c=relaxed/simple;
	bh=AnnLzZQASW3ffm7HTAuT/jmzPEia7UpYkcE3pF7Rkko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTLvMKRw41+Ha2xHg+bRqd3bfrQqdRid5gT4noWO2xkZIK4McHut5dYsG+RgTFs4j9okQ8xbTAPHQnZv1M/yaL6IEV1RTBeDE0GWdhanehFeOGML73x6Z79tdh4Br98JHTnEtW6ntNvPDh7Oqc1srwprcmeWue6m0YFa+4uWOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEPtgaTp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEPtgaTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788165658; x=1819701658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AnnLzZQASW3ffm7HTAuT/jmzPEia7UpYkcE3pF7Rkko=;
  b=UEPtgaTpUPfbC5zrNIUbi0jN0DkRb24Zd81Mmb0IlOiuoEyx+OdCNzYh
   QCEM8RKrlYI58zLZH35VUYQ8pJeUxuzbqOTj/5aVU5ObmXBW8IkzqGVhu
   HAb/QtmwvXSd1D2j7Q2hPuJZLg/OOEonvIKW5rxqZdTv/Chlyf3u3e7hB
   9gyXXq8khKHS9j1QWOEta2Rt4JMAYjQdZDBT/bgN/HdAI2KIl3BGBpkiC
   mv0Q8XJ/B9OR4UHzsICf64253BOYvIihjtaxySdNMp90i5UWdDw260bFX
   4OTdoPh0FKOGFwwmHNXFcb1C6qBz/Y391vK1ncST+GPRrNI1cF2HGDW9c
   A==;
X-CSE-ConnectionGUID: Qzx3XNRkQ0ek4Ay7Fzvozw==
X-CSE-MsgGUID: SsHDYj5rTHO+lL2hUgTe9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92377409"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92377409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:40:58 -0700
X-CSE-ConnectionGUID: H6RuDwXiQ8W7wzUiQmJoqg==
X-CSE-MsgGUID: S7Snd/52RUep+iJmvdBldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="274008905"
Received: from junjie-desk-dev.bj.intel.com (HELO junjie-desk-dev.tail2c02c1.ts.net) ([10.238.152.71])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:40:54 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	tj@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	akpm@linux-foundation.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com
Subject: Re: [syzbot] [kernfs?] [mm?] INFO: rcu detected stall in kernfs_fop_open (7)
Date: Mon, 31 Aug 2026 16:40:48 +0800
Message-ID: <20260831084048.410424-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <68880766.050a0220.3cc461.000f.GAE@google.com>
References: <68880766.050a0220.3cc461.000f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git a8455260b2e9c024d1872ac1c094793d55a7e537

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 39ac5b97aa3a..901dfd2484e1 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -83,6 +83,10 @@ struct sched_gate_list {
 	s64 cycle_time;
 	s64 cycle_time_extension;
 	s64 base_time;
+	/* min(cycle_time, sum of intervals): the software schedule restarts
+	 * the list after the last entry even when cycle_time is not up yet.
+	 */
+	s64 period;
 };
 
 struct taprio_sched {
@@ -871,12 +875,13 @@ static struct sk_buff *taprio_dequeue(struct Qdisc *sch)
 }
 
 static bool should_restart_cycle(const struct sched_gate_list *oper,
-				 const struct sched_entry *entry)
+				 const struct sched_entry *entry,
+				 ktime_t end_time)
 {
 	if (list_is_last(&entry->list, &oper->entries))
 		return true;
 
-	if (ktime_compare(entry->end_time, oper->cycle_end_time) == 0)
+	if (ktime_compare(end_time, oper->cycle_end_time) == 0)
 		return true;
 
 	return false;
@@ -925,8 +930,9 @@ static enum hrtimer_restart advance_sched(struct hrtimer *timer)
 	int num_tc = netdev_get_num_tc(dev);
 	struct sched_entry *entry, *next;
 	struct Qdisc *sch = q->root;
-	ktime_t end_time;
-	int tc;
+	ktime_t end_time, next_start, now;
+	int budget, tc;
+	s64 behind;
 
 	spin_lock(&q->current_entry_lock);
 	entry = rcu_dereference_protected(q->current_entry,
@@ -952,23 +958,49 @@ static enum hrtimer_restart advance_sched(struct hrtimer *timer)
 		goto first_run;
 	}
 
-	if (should_restart_cycle(oper, entry)) {
-		next = list_first_entry(&oper->entries, struct sched_entry,
-					list);
-		oper->cycle_end_time = ktime_add_ns(oper->cycle_end_time,
-						    oper->cycle_time);
-	} else {
-		next = list_next_entry(entry, list);
+	now = hrtimer_cb_get_time(timer);
+	end_time = entry->end_time;
+	behind = ktime_sub(now, end_time);
+
+	/* Behind, e.g. delayed timer or stepped clock: skip whole periods
+	 * arithmetically and walk at most one more to the entry covering
+	 * now, instead of replaying the backlog one expiry at a time. The
+	 * cap bounds the walk; a leftover is picked up by the next expiry.
+	 */
+	if (unlikely(behind >= oper->period)) {
+		s64 jump = div64_s64(behind, oper->period) * oper->period;
+
+		end_time = ktime_add_ns(end_time, jump);
+		oper->cycle_end_time = ktime_add_ns(oper->cycle_end_time, jump);
 	}
 
-	end_time = ktime_add_ns(entry->end_time, next->interval);
-	end_time = min_t(ktime_t, end_time, oper->cycle_end_time);
+	budget = 2 * oper->num_entries;
+	do {
+		if (should_restart_cycle(oper, entry, end_time)) {
+			next = list_first_entry(&oper->entries,
+						struct sched_entry, list);
+			oper->cycle_end_time = ktime_add_ns(oper->cycle_end_time,
+							    oper->period);
+		} else {
+			next = list_next_entry(entry, list);
+		}
+
+		next_start = end_time;
+		end_time = ktime_add_ns(next_start, next->interval);
+		end_time = min_t(ktime_t, end_time, oper->cycle_end_time);
+		entry = next;
+	} while (unlikely(ktime_compare(end_time, now) <= 0) && budget--);
 
+	/* next can be the entry already published as q->current_entry (a
+	 * single-entry schedule, or a catch-up of whole periods), so the
+	 * close times and budgets below are rewritten in place while
+	 * taprio_dequeue_from_txq() may be reading them.
+	 */
 	for (tc = 0; tc < num_tc; tc++) {
 		if (next->gate_duration[tc] == oper->cycle_time)
 			next->gate_close_time[tc] = KTIME_MAX;
 		else
-			next->gate_close_time[tc] = ktime_add_ns(entry->end_time,
+			next->gate_close_time[tc] = ktime_add_ns(next_start,
 								 next->gate_duration[tc]);
 	}
 
@@ -1130,6 +1162,8 @@ static int parse_taprio_schedule(struct taprio_sched *q, struct nlattr **tb,
 				 struct sched_gate_list *new,
 				 struct netlink_ext_ack *extack)
 {
+	struct sched_entry *entry;
+	ktime_t cycle = 0;
 	int err = 0;
 
 	if (tb[TCA_TAPRIO_ATTR_SCHED_SINGLE_ENTRY]) {
@@ -1152,13 +1186,10 @@ static int parse_taprio_schedule(struct taprio_sched *q, struct nlattr **tb,
 	if (err < 0)
 		return err;
 
-	if (!new->cycle_time) {
-		struct sched_entry *entry;
-		ktime_t cycle = 0;
-
-		list_for_each_entry(entry, &new->entries, list)
-			cycle = ktime_add_ns(cycle, entry->interval);
+	list_for_each_entry(entry, &new->entries, list)
+		cycle = ktime_add_ns(cycle, entry->interval);
 
+	if (!new->cycle_time) {
 		if (cycle < 0 || cycle > INT_MAX) {
 			NL_SET_ERR_MSG(extack, "'cycle_time' is too big");
 			return -EINVAL;
@@ -1172,6 +1203,7 @@ static int parse_taprio_schedule(struct taprio_sched *q, struct nlattr **tb,
 		return -EINVAL;
 	}
 
+	new->period = min(new->cycle_time, cycle);
 	taprio_calculate_gate_durations(q, new);
 
 	return 0;
