Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485511;
	b=kl3bsm+Q1OYta8XsO9EQI7KDwMssGAhHBBRvJdycaccW/9IQDiSRbjCYDbFSf3dZAbz2
	 PQ5P+hPBxOt7/pdtvbHr5MBRoIwm5pG2j3Fd7cK/w+Hhd3hPw6bRKBUYxHtdxBpgiZ/BP
	 U1Ja4NKsT3BnAKsMs3GTjE3QCpcrRoy2cKhTomJ3lOsSFftv04g/sZpY4Bw6ioDT9WjnM
	 r+8IQeaKUI587zrICWrnkCtWS2cbkVUZOG/By1ywg9yyzFsIcj/38MxbnTYKQPmYsTyHK
	 SLXGgW7Qro8Ytteo7cc0R60j3WMWgtSf5nnvt9Rpz4k9azVL9ite20B4ImlumunnOvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485511;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RjIVoA7JuaC1/DD/PzNex74Z9uMmLvltbiZtFjdSH74=;
	b=qghHRZlMKPTvgs5wJyuSI8Jx/cw1My2T/obU4YTKD2tWtxALyrD+AOJFK9Tw10Nm2kYn
	 8vTJ11BCu3mR1ITPiN3WaXO+AGy5uXxvUwsUddYFZ8bAFosClHx9nKct/PrT9ljC7eEtr
	 Us7cVLBt3TB9QrijBPZcJmpoz2oZtqPK7egdJU6yGd75YBrDfuinFnY4nF5/X98peidK8
	 8UflIXRlbKjnATA89jy59F+pNce+K7hoD2M3FqrncvCzRuEk7Ujm+EFszeS53yyYzzQ5E
	 RZq8jxvTZc7XbUOD2s5SQ2ewpYnqm/e9dBTowJMTcfgqHd1iPEBGb/0syCC49mHf+iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.77
Received: from out28-77.mail.aliyun.com (out28-77.mail.aliyun.com [115.124.28.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56DB606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0746658|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.093464-0.00237356-0.904162;FP=4307649803286564090|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037033194;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.jlWubOg_1792485497;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jlWubOg_1792485497 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 16:38:20 +0800
From: Li kunyu <likunyu@open-hieco.net>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Li kunyu <likunyu@open-hieco.net>,
	"Li Wang (Hieco)" <li.wang@linux.dev>
Subject: [RFC PATCH 2/6] sched/fair: Add is_smt_buddy_run() to skip SMT domain
Date: Tue, 20 Oct 2026 16:37:42 +0800
Message-ID: <20261020083746.37068-3-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
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

When a CFS task is successfully pushed to an SMT sibling CPU during
periodic load balancing or nohz_kick, scanning the SMT scheduling domain
afterwards is unnecessary. It also risks pulling the task back to the
original CPU, defeating the purpose of the push.

The is_smt_buddy_run() helper is introduced to detect whether a task is
already running on its SMT sibling. When this condition holds, the SMT
scheduling domain is skipped in the subsequent load balance path.

This improves efficiency by avoiding redundant SMT domain scans and
prevents reverse pulling of tasks that were just pushed to the sibling.

Tested-by: Li Wang (Hieco) <li.wang@linux.dev>
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a43a168f23ba..12b3223c6403 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14244,6 +14244,22 @@ update_newidle_cost(struct sched_domain *sd, u64 cost, unsigned int success)
 	return false;
 }
 
+/*
+ * When the CFS task is successfully pushed to the SMT sibling CPU in
+ * the cyclic load balancing and nohz_kick process, skipping the SMT
+ * scheduling domain check can improve efficiency to a certain extent.
+ */
+static bool is_smt_buddy_run(struct sched_domain *sd, bool is_smt_move_task)
+{
+	if (!sched_feat(SMT_BUDDY_ASSIST))
+		return false;
+
+	if ((sd->flags & SD_SHARE_CPUCAPACITY) && is_smt_move_task)
+		return true;
+
+	return false;
+}
+
 /*
  * An exciting thing is that we have implemented an efficient push
  * function process.
@@ -14350,8 +14366,7 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 	int update_next_balance = 0;
 	int need_decay = 0;
 	u64 max_cost = 0;
-
-	smt_buddy_move_task(rq);
+	bool is_smt_move_task = smt_buddy_move_task(rq);
 
 	rcu_read_lock();
 	for_each_domain(cpu, sd) {
@@ -14375,7 +14390,8 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
 
 		interval = get_sd_balance_interval(sd, busy);
 		if (time_after_eq(jiffies, sd->last_balance + interval)) {
-			if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
+			if (!is_smt_buddy_run(sd, is_smt_move_task) &&
+				sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
 				/*
 				 * The LBF_DST_PINNED logic could have changed
 				 * env->dst_cpu, so we can't know our idle
-- 
2.47.3

