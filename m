Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE44C6515
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005163; cv=none; b=mbOE+xZ0yXa6ToLo/WQ0Ax4Dw/Sszmb5HAwqciE8EfUs9yiwR9hR1TcfFku+2PxXPYsZ04cIPpS8uV/iwlLreY1mZ/QxwjJKv8eK+j9ij6nC597RxepIdhD+kGSPftgFr7h3ZJROdFt9SEnzTV/ATB6V/mLVnw9tBPzpRUOrN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005163; c=relaxed/simple;
	bh=lJmFUvv1y720XfvJovLrsTCuIMar34mvrHnhguM16E8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ff1G26/6W7Kuf+ExQmovng5+6Xxcz7zGzGTC4CJ+/tg0ljuIq6qZ80jaZ/LDqKQTN64IOZHpFj0zAjPQG/ygDWWq5R4BrUlUJHdHxbAd6j1uqg0HR+I3PCskdpjyEEJerqRa5TxXNc0Ic3Z0vf4v80nzXR2+b4hkyv5mSN1PPyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/29qR3i; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/29qR3i"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-853e2610bb4so10696b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005161; x=1790609961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3XTZ9CTE6oB6PdoqCRQ1HTKuKJNIEpv7/7Iapup7c0=;
        b=o/29qR3iKcg5Ry9P8efXUMukhuo0aUcZ/mKz63l4RNnhFmDFTk3en/x0KD3ixGrOGR
         OwkgI3Ab+/hoBnRbtb2Gb8HkUw+taY+1ENWWDpX5CWZ0X8rGtm4Q/HZFrZLyTPfSivV1
         o3AZRrcuJ9x3DsjxJo43e+RDqSGk5FoMOQP4FpP/0v8qwnNP7LH66wvrpRdP/2CDhi+g
         3uAIfNu5ONpff2gz6JCZjbRJhL57cq6wDw7pXg3nwU4ef/VXBwkkA2mmjszzx3H246Mx
         Yk7tAvqx7YuvEHgMt5y1fDvhdN0LIqHzRCX1C4AVvcimF5sKY1ys/dpM5tKUxx3sy2bx
         deuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005161; x=1790609961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3XTZ9CTE6oB6PdoqCRQ1HTKuKJNIEpv7/7Iapup7c0=;
        b=cQrO3S+2FUiLxDgohJ7XVA1J3rzV8Zb6Lv/1QtN0nfWwEyOo+xdUkoP92dw2Y9FsD5
         2KvQmGV2TzJEaHu/cdD6bDJBJawd1UBkY/JqW5rDVzSEi/0aZlQZOIEE5FTe7KVMB+4b
         8sGgCpSUulftJHioZoZAlkCAadlX3yauzDeP1aWAOz7j9O1GK3wo+GiX2JroPfemnBN9
         +6c+YetNu3RKYNH4PkacXdnnsqPsKK27PEe/8iaANGQ/reKiuMaSr1W0VzU/9WLVns10
         CnJLwiIfnMor0adAl6zBY0Qfvnt2bLE7xFlxvY2Se7vSdyJXwvNW589BKto0SaOmXzyF
         w96Q==
X-Gm-Message-State: AFuF++mXaD4StGKNXrOapNr1LTvoS5mEbDSYbXpnnPwKuxkav0KSntZz
	702BQbItyeGcLI5+pGC0iEBD++od/3b+P+gQTbnBBGvMqpQR1uwB5gDa
X-Gm-Gg: AYBFou2W/KrE6Ycta/Ks5oXm86RdbpRS6EK+amGNhXR95QhBeKmnNDo9DvPq+KLmNem
	5rShqyQ7reHa5ETOJMefAuY5M6q5NOy7I36jTPX+jSdbIyRb/qPps5vFS9KruboAvGyxq00qCMk
	2aCVnJggWESayul5bd8zxfem0Ha24E6mGL8i4Vlhyg5+KLGj+18FPZ/RnQg5guPzTkUcpHZnww8
	ZROOT4hxa9t1SD3oEAO5seR6pHyOUNti/9CGcG/QMCj1dWzSR93KoA/hc9RHeYqwy7uHYl30eZo
	kZggMZzVrP8oUZ/LClq0Yv4Pm0Nj1NfIwUQAJHbWbk5P1sxku5XpfQmJla8wxEWkq7vjSO5RlTz
	oO4B5dcgZfvhV21rAk/uim8NQyrSpqX+Bxn6Ei3lVPKx8csZH/IGhooMqEOrTypcTB7ZpoNCPWQ
	3g9tENIqfkrZx3HGgNkpv0dDqS5XprwvG0vM0BpMBDtqNxO0M4+zpnMiUHV3eFqsva1JM=
X-Received: by 2002:a05:6a00:158c:b0:878:3705:5726 with SMTP id d2e1a72fcca58-87837055eb1mr4496461b3a.50.1790005161045;
        Mon, 21 Sep 2026 08:39:21 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6ae7d71sm3448186b3a.2.2026.09.21.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:39:20 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marco Elver <elver@google.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 2/5] workqueue: add support for module-owned work
Date: Mon, 21 Sep 2026 23:38:59 +0800
Message-Id: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-2@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
References: <pm-series-6lowpan-lifecycle-82fab5876048c8c9503c-0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Queueing a callback on a system workqueue does not take a reference to
the module containing that callback. A caller which releases its last
module reference after queueing work can therefore leave a callback in
unloaded text. Releasing the reference from the callback itself also
leaves its return path unprotected.

Add module_work and schedule_module_work() to hold the callback's owner
from queueing until the callback returns. Run the dispatch and final
module_put() in workqueue core, which remains present when the callback's
module is unloaded. Cache the function and owner before invoking the
callback so that it can free the containing work item.

6LoWPAN needs this for deferred network-device deletion after removing
the last peer.

Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 include/linux/workqueue.h | 15 ++++++++++++++
 kernel/workqueue.c        | 43 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index c8a36423cb34..9920796c8822 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -128,6 +128,14 @@ struct rcu_work {
 	struct workqueue_struct *wq;
 };
 
+struct module;
+
+struct module_work {
+	struct work_struct work;
+	struct module *owner;
+	work_func_t func;
+};
+
 enum wq_affn_scope {
 	WQ_AFFN_DFL,			/* use system default */
 	WQ_AFFN_CPU,			/* one pod per CPU */
@@ -220,6 +228,11 @@ static inline struct rcu_work *to_rcu_work(struct work_struct *work)
 	return container_of(work, struct rcu_work, work);
 }
 
+static inline struct module_work *to_module_work(struct work_struct *work)
+{
+	return container_of(work, struct module_work, work);
+}
+
 struct execute_work {
 	struct work_struct work;
 };
@@ -634,6 +647,8 @@ extern void __flush_workqueue(struct workqueue_struct *wq);
 extern void drain_workqueue(struct workqueue_struct *wq);
 
 extern int schedule_on_each_cpu(work_func_t func);
+bool schedule_module_work(struct module_work *mwork, work_func_t func,
+			  struct module *owner);
 
 int execute_in_process_context(work_func_t fn, struct execute_work *);
 
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..1a16bc5dfb68 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -48,6 +48,7 @@
 #include <linux/hashtable.h>
 #include <linux/rculist.h>
 #include <linux/nodemask.h>
+#include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/uaccess.h>
 #include <linux/sched/isolation.h>
@@ -4808,6 +4809,48 @@ int execute_in_process_context(work_func_t fn, struct execute_work *ew)
 }
 EXPORT_SYMBOL_GPL(execute_in_process_context);
 
+static void module_work_func(struct work_struct *work)
+{
+	struct module_work *mwork = to_module_work(work);
+	struct module *owner = mwork->owner;
+	work_func_t func = mwork->func;
+
+	func(work);
+	module_put(owner);
+}
+
+/**
+ * schedule_module_work - schedule work owned by a module
+ * @mwork: module work to schedule
+ * @func: work function to schedule
+ * @owner: module owning @func
+ *
+ * Take a reference to @owner before scheduling @func. The reference is
+ * released by workqueue core after the callback returns. The callback may
+ * free @mwork. @mwork must not be pending.
+ *
+ * Return: %false if the module is being removed or the work could not be
+ * queued, %true otherwise.
+ */
+bool schedule_module_work(struct module_work *mwork, work_func_t func,
+			  struct module *owner)
+{
+	if (!try_module_get(owner))
+		return false;
+
+	INIT_WORK(&mwork->work, module_work_func);
+	mwork->owner = owner;
+	mwork->func = func;
+
+	if (!schedule_work(&mwork->work)) {
+		module_put(owner);
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(schedule_module_work);
+
 /**
  * free_workqueue_attrs - free a workqueue_attrs
  * @attrs: workqueue_attrs to free
-- 
2.43.0

