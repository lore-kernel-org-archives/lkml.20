Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CDB49892B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672120; cv=none; b=hYN2FsxLg/BeKca59QCdAuMKOpgDOTb5rmlxICgTrIlIlsemV/N/9r8R8Q+UjxoepdZpa0fUxiJ9zTmMzIYFDWx80kVK+E5QKOa+Q7JivkmniajJInkwuuTRTzY8UxzkuODoLE3txOJS7GMjDxZGF0jKrwXoZ6jnRXZOagjJlmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672120; c=relaxed/simple;
	bh=5M/KPCjOb0npjy4tdO8guwlLO2nblTzRF09cmm03tDM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=RRTS/FCM+3/qXhnTzrd4jS/Urwrr3i7sD9VViW8umDZkrCm8fraM8TrFZtUaMoMIMVIsyyL7a8Z6uKMG/mj+4sk92dAZKqzmcj94WPP6gs8+dzvQMGfw0Uk1dbKcGuGRmLqpNsbMza5SjKHgdJ8aUnwvwmagG5g1qIjRR4lUFp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tdf/pTJI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tdf/pTJI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=fZFYe1NfdTaUDslomStKThI9EcPWJaaP46XuSQJfzqI=; b=Tdf/pTJIbl5IpoTrbLIfKqo0hz
	rmjnydDFbfv8qTmo4hP1ul3MPuAPkfcQ47V9bTOmJ4Eo45mZCRSMLwoYAj5c//uQa7Bl+dHUSjVht
	bVDShip85G8/fGXrhiI7EOvwB+8AlrEufpa5xRgaekfvHLWQ1TSTDFDNwo4Wm2LNtHoEc+BM1NKd/
	OAJ3scJMn2IVmjCbD6J+e6Rxi7tZFAUGSQdgd0BU1/WezFNIJXR9yCmQkcFAIJvTaxLFNdieqD3dx
	b41UbM+JKrnOoph7JmlMRusLqULxZVp9T4xeI/arvarBRjXmuBnVGO5jiWtNt1AHSVev9tafkri01
	7ZJ+7x+A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcF-0000000BsLW-3AVU;
	Tue, 29 Sep 2026 08:55:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id B518F3010E3; Tue, 29 Sep 2026 10:55:10 +0200 (CEST)
Message-ID: <20260929085320.209298048@infradead.org>
User-Agent: quilt/0.68
Date: Tue, 29 Sep 2026 10:49:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 tj@kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] sched/fair: Extend for_each_sched_entity() with a back-link
References: <20260929084923.092062266@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Leave a trail of bread crumbs, such that we can find our way back down the
hierarchy. No actual users yet, but split out because its a bit tricky.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/fair.c  |   14 +++++++++++---
 kernel/sched/sched.h |    1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -318,8 +318,13 @@ const struct sched_class fair_sched_clas
 #ifdef CONFIG_FAIR_GROUP_SCHED
 
 /* Walk up scheduling entities hierarchy */
-#define for_each_sched_entity(se, cfs_rq)				\
-	for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = (se)->parent)
+#define for_each_sched_entity(se, cfs_rq)					\
+	for (struct sched_entity *_BL = NULL;					\
+	     (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
+	     (se) = (se)->parent, _BL = (se))
+
+#define for_each_sched_entity_bl(se, cfs_rq) \
+	for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))
 
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
@@ -456,6 +461,9 @@ static int se_is_idle(struct sched_entit
 #define for_each_sched_entity(se, cfs_rq) \
 	for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = NULL)
 
+#define for_each_sched_entity_bl(se, cfs_rq) \
+	for (; ((se) = NULL);)
+
 static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	return true;
@@ -15233,7 +15241,7 @@ static inline void task_tick_core(struct
 /*
  * se_fi_update - Update the cfs_rq->zero_vruntime_fi in a CFS hierarchy if needed.
  */
-static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
+static void se_fi_update(struct sched_entity *se, unsigned int fi_seq,
 			 bool forceidle)
 {
 	struct cfs_rq *cfs_rq;
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -726,6 +726,7 @@ struct cfs_rq {
 	unsigned long		tg_runnable_avg_contrib;
 	long			propagate;
 	long			prop_runnable_sum;
+	struct sched_entity	*backlink;
 
 	/*
 	 *   h_load = weight * f(tg)


