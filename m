Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99149E5FB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341825; cv=none; b=Hyr3Q235Ffxaj/GgHorwBfAFsPNR/g3JkdMD0KM9oa8y5/+aJYy14hl29Yz+XnYsIAjz/0uT90eXhBmqXCCleXGnc6aUgLnpmGu5IKiU0AbsYl/s3fW49bQZPGc60FPPCVaWdrfRv1tyZuexH1WvIDXq4uE5Ns6Z+PgVtmbFbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341825; c=relaxed/simple;
	bh=+H8wd3KxoLQhIxIIsqx9Pglq8Hissbnu71I6XmryHEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3yAyVVOyRO9f1slXC2wHlG46mRqyv6NWFn/yd+1T/YvAXFvsGvWkES9/ocDAbgAY+HQMK12z3EIDGmu6fx6ngSgIAg8eGEYkMlt3EHwFjVNpTxB4bXjEVFWyYxqV5r6KdQnaF5/n8Qqssp14x+4JW9+zhb06C3evushc/+C8Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=BWNOaLVe; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BWNOaLVe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=oGHSLLwKv0zDT6rIwh/wTQn6lQUcxUD/fW03K3MBdzM=; b=BWNOaLVePpzjiT3T94d3Em7Z+r
	t3lQiCxQOj1ccPEjgIyRcTdEOmImn7OSOV3B+O3leUNUW95RUsosJPWCxuAgYy8kUaCdafqbGwZFT
	Khp45Bfnolw09MFdilT5v8yyuHOnBDa/FI+GWV3P0S9j9CFE6sSV77/o2D9ibonBO22SYMq1QF8HF
	GXyIE82DIgPk0zj8bOiyXxHK0Zf242sBKDR1NieU1MUk6LV8YxNypaADdbD272/lde8ESdDf4C9sp
	TE5IFRA59G2ojnUZtBQK+MltYC9hiELaQ0EB6du5ASYx245XKLgcAPJRYr67IslFRj21oLMN68Mq9
	fSYf/Bxg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xA5go-005KH5-0o;
	Fri, 25 Sep 2026 13:10:10 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 25 Sep 2026 06:09:50 -0700
Subject: [PATCH wq/for-7.4 v2 1/3] workqueue: Move the initial max_active
 setup into a helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-wq_final-v2-1-860ee052169e@debian.org>
References: <20260925-wq_final-v2-0-860ee052169e@debian.org>
In-Reply-To: <20260925-wq_final-v2-0-860ee052169e@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375; i=leitao@debian.org;
 h=from:subject:message-id; bh=+H8wd3KxoLQhIxIIsqx9Pglq8Hissbnu71I6XmryHEg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqtnKq/LG6WR69EhUuuqSTj0lfzEr7xD8Z/kbTL
 FOAD20X6bSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCarZyqgAKCRA1o5Of/Hh3
 bSSaD/4nMkyIULccdYnamBGGLD62SoXOMZGoAkNQE5Zl9nSI9G935C8C3zyb18CSEvJG3JbIumq
 gJZ6QYje52igkJKGX8U3hs+NLmo3j5wkTzo6qoDQ3voI/JrTMUGMqBJif+/s56nlZrYbtyYuJF6
 KTzKlxI6CRYerVjhmla6myw/uws5PvOYBpYIwgn0vTF1XH1wIyFd0uPj2pHHwERUOmpWQrjlQsL
 SkTrYFWadUiQElb/QnAnmH2QzDEY/h54SZOlR9qzUgPQE6sbPFgC8oP6PZPPK4n4immAWkS1SSw
 bVFsAiujwHPbW6FnpWSsIINXQSFecdSxmfZzj9A2Fq7Yc9wn9ZKEujYHlvMTzXEQWHLgHX1fpwx
 wZXTBuhSyVAJtwBEd6t8+HyphCPNrZqOdLYfvpO/GPOG1Wy6cqIkuXJ38D33yfvukNkmXHtY85h
 pyxtU70/nayrygnwXtNqX0cYJinzVaPJZgq7Ljhka8x0RBW9XE8J+WdnUGYkZEadSs/xc1KOEqa
 q0JV774JSUHsz1dFzp4XcgxEbndwwe7hpbY+vfQ3dmA9HwhVoc6ToaNcSFp7YJjtbyA+lk3S/JI
 7Wp+o6qvh5jYux9otg2wED/sQriaOlxEDs717nAznnGb96aNoolyFUB2QeAt0e/BzXi5lTJFg4W
 xcBpaNGXx6aSdlQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Extract the max/min active assignment into a helper, simplifying
__alloc_workqueue() and keeping the next patch easier to review and reason
about.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index e618108c6127da..97d2c9c0a7d6ab 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6031,6 +6031,32 @@ static int init_rescuer(struct workqueue_struct *wq)
 	return 0;
 }
 
+static void wq_init_max_active(struct workqueue_struct *wq, int max_active)
+{
+	int effective_max_active;
+
+	if (wq->flags & WQ_BH) {
+		/*
+		 * BH workqueues always share a single execution context per CPU
+		 * and don't impose any max_active limit.
+		 */
+		effective_max_active = INT_MAX;
+	} else {
+		effective_max_active = max_active ?: WQ_DFL_ACTIVE;
+		effective_max_active = wq_clamp_max_active(effective_max_active,
+							   wq->flags, wq->name);
+	}
+
+	if (wq->flags & WQ_UNBOUND) {
+		wq->max_active = effective_max_active;
+		wq->min_active = min(effective_max_active, WQ_DFL_MIN_ACTIVE);
+		wq->saved_min_active = wq->min_active;
+	} else {
+		wq->percpu_max_active = effective_max_active;
+	}
+	wq->saved_max_active = effective_max_active;
+}
+
 /**
  * wq_adjust_max_active - update a wq's max_active to the current setting
  * @wq: target workqueue
@@ -6156,27 +6182,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		flags &= ~WQ_PERCPU;
 	}
 
-	if (flags & WQ_BH) {
-		/*
-		 * BH workqueues always share a single execution context per CPU
-		 * and don't impose any max_active limit.
-		 */
-		max_active = INT_MAX;
-	} else {
-		max_active = max_active ?: WQ_DFL_ACTIVE;
-		max_active = wq_clamp_max_active(max_active, flags, wq->name);
-	}
-
 	/* init wq */
 	wq->flags = flags;
-	if (flags & WQ_UNBOUND) {
-		wq->max_active = max_active;
-		wq->min_active = min(max_active, WQ_DFL_MIN_ACTIVE);
-		wq->saved_min_active = wq->min_active;
-	} else {
-		wq->percpu_max_active = max_active;
-	}
-	wq->saved_max_active = max_active;
+	wq_init_max_active(wq, max_active);
 	mutex_init(&wq->mutex);
 	atomic_set(&wq->nr_pwqs_to_flush, 0);
 	INIT_LIST_HEAD(&wq->pwqs);

-- 
2.53.0-Meta

