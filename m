Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA64A2A61
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052144; cv=none; b=TrEplPJbAadUCTslB7KTJAu73vBw5ouZuioGhkute+Rsxc9Idssthl1Pwzyb3XaiWqyFQsf0ya+7v6PpKTv8hQuVCbBj4mF+j3CNyZtRdBmaGj63SJUFBsBu4zIIlqBxcZYr8xdSkkOynUt+5uqFl+OqiIoaCENA0nbulFZe2Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052144; c=relaxed/simple;
	bh=D4QDZJ/BhJGnafANKKKHld4iAuwS8mDIcGUUG7IlTII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqA4p1An8+pkSy3zoYq12TpyVLzgsodY9ELZhJcurGu5hNl2Y43qgdVVlCIbYMTAeSlXFRaJu3qPmHov4zPe0PdZ0Ll9SsLR6E8WgcKVxBTfyMVDmCIOeNQgecfVc+BryQkd2iirEr+DNC7c8ifRzEk4zWg6YSoQo5+uO6pN+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=p9sj8iuU; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="p9sj8iuU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=xUDfzTwxG11mZ+J3dXeQ6zMdoSjL7YUgi8RSjzuPL1I=; b=p9sj8iuUbHGRJsN3msTkEH14+u
	E+OWu7WWJvfngw9KdEc+DvQPZXsYosNyNB4OhgZXCUDXK4rqbLj84c8snpe6edoWBLCEZrSQYhgxM
	LOaNE1vvFHbvMxvoFh5IR7XXb1P0rhQDztU9CV35fvU6F32QSBXdTyfx8CEVuxIHn2epL7nSJil4U
	53cP6nENWILQrzZJoSkEdXzX0POJGGO1ZjL2uFe6/1V0HPkpuiEN8glfqKKjXbV9bOJLw1tkW2AgC
	H28uje127JoUSZcS6CWrBbXE1BxT1BmDiL9YBhVOqeRqPGII0Taaw2MtM6HGG1y6iyP8gdjM8uNmt
	cfwVpL0w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4gBd-000aYU-2v;
	Thu, 10 Sep 2026 14:55:38 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 10 Sep 2026 07:54:13 -0700
Subject: [PATCH wq/for-7.4 2/2] workqueue: derive the standard attrs from
 the workqueue flags
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-realsplit_last_v2-v1-2-464d64b71b29@debian.org>
References: <20260910-realsplit_last_v2-v1-0-464d64b71b29@debian.org>
In-Reply-To: <20260910-realsplit_last_v2-v1-0-464d64b71b29@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: marco.crivellari@suse.com, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=5186; i=leitao@debian.org;
 h=from:subject:message-id; bh=D4QDZJ/BhJGnafANKKKHld4iAuwS8mDIcGUUG7IlTII=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqosTff1wbPG7ov6uGLqOe2Yzx0hBZnIghB9wto
 9L7rgpOHiqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqLE3wAKCRA1o5Of/Hh3
 bTZVD/9OFLdgOmAh45vnblIeMGtN2dqpNLtLow3nE8C4io1Oq72lkKNFPBQKX/5wbMor/8lCh6t
 imAs4n8+gAlK1rwmd42pG54hSkSBjogr4RbyhvQsZ3ituRvCyZH0Ha0rJdbStDXpF54wyXIFd07
 EEKhr2vmxcZrI61admEgU9RF0YficNvAKWAqmSWoZj+2XzQME5BE7oRh0taRnw/zvCqAwraBTUS
 Whf1JSP+ldw59t1QdXV0ESItNurycnGVl6u2DiTDcx5fl04gMNR4bsSruJeNWLebug8lPLzglDt
 b4dnuFzG5gl4811Gx0FR+ZkDkr3wlc+dzPczBsDxmNWjMgnh/IrSOalX1riUEykn38rJv38H6TH
 sVIkXd+i2aTvSu+8KmPdYfnekiVXKP/aaTMLpiNxJzy6pMrUcqg8hQG49NOJsDg60Qig5vH5/Tw
 tHH7+p9wRpL008xY1tHowSyCA7SqymucvDpcqdGKRE/4I9fce7K/vtQ+hQbuHHKdS87NMliRgi8
 YCAiZmbjxoeBkt+Nm+e6NRup4IiKB2gEpSKpKSMrir/mwzrh9fuIBA7J6iA3dOJEK0qADmAEH89
 bodsgD6jfST4sdIudHOKs50lhfvYtmY4cS5lkrycH31Kb4ZnNxGCR7vxRhTSIWkDDXf0+Bf8cYB
 PSf6OKRpIYJhbrg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

alloc_and_link_pwqs() picks one of three static attrs arrays indexed by
WQ_HIGHPRI, and branches to a separate apply_workqueue_attrs_locked()
call for percpu, ordered and unbound workqueues. The arrays differ only
in the nice level and the ordered bit, which the flags already say.

Build the attrs from the flags instead. alloc_wq_std_attrs() sets nice
for WQ_HIGHPRI and ordered for __WQ_ORDERED, which collapses the three
branches into one call and drops the three arrays along with their
workqueue_init_early() loop.

The ordering WARN now sits behind its own __WQ_ORDERED test rather than
the unbound branch. __WQ_ORDERED is internal and every macro that sets it
pairs it with WQ_UNBOUND, so the WARN covers the same workqueues as
before.

The attrs are allocated per creation now. apply_wqattrs_prepare() already
allocates one on the same path, including in workqueue_init_early(), so
that is not a new constraint, and it only copies what it is given, so the
caller can free them once apply_workqueue_attrs_locked() returns.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 kernel/workqueue.c | 76 +++++++++++++++++++++++-------------------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 8232a60e107cf7..39187f424c34e7 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -533,15 +533,6 @@ static DEFINE_IDR(worker_pool_idr);	/* PR: idr of all pools */
 /* PL: hash of all unbound pools keyed by pool->attrs */
 static DEFINE_HASHTABLE(unbound_pool_hash, UNBOUND_POOL_HASH_ORDER);
 
-/* I: attributes used when instantiating standard unbound pools on demand */
-static struct workqueue_attrs *unbound_std_wq_attrs[NR_STD_WORKER_POOLS];
-
-/* I: attributes used when instantiating ordered pools on demand */
-static struct workqueue_attrs *ordered_wq_attrs[NR_STD_WORKER_POOLS];
-
-/* I: attributes of percpu workqueues, which are backed by the static pools */
-static struct workqueue_attrs *percpu_std_wq_attrs[NR_STD_WORKER_POOLS];
-
 /*
  * I: kthread_worker to release pwq's. pwq release needs to be bounced to a
  * process context while holding a pool lock. Bounce to a dedicated kthread
@@ -5920,9 +5911,27 @@ static void unbound_wq_update_pwq(struct workqueue_struct *wq, int cpu)
 	put_pwq_unlocked(old_pwq);
 }
 
+/* the attrs @wq asked for, as spelled by its flags */
+static struct workqueue_attrs *alloc_wq_std_attrs(struct workqueue_struct *wq)
+{
+	struct workqueue_attrs *attrs;
+
+	attrs = alloc_workqueue_attrs();
+	if (!attrs)
+		return NULL;
+
+	if (wq->flags & WQ_HIGHPRI)
+		attrs->nice = HIGHPRI_NICE_LEVEL;
+
+	if (wq->flags & __WQ_ORDERED)
+		attrs->ordered = true;
+
+	return attrs;
+}
+
 static int alloc_and_link_pwqs(struct workqueue_struct *wq)
 {
-	bool highpri = wq->flags & WQ_HIGHPRI;
+	struct workqueue_attrs *attrs;
 	int ret;
 
 	lockdep_assert_held(&wq_pool_mutex);
@@ -5931,23 +5940,24 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
 	if (!wq->cpu_pwq)
 		goto enomem;
 
-	if (!(wq->flags & WQ_UNBOUND)) {
-		ret = apply_workqueue_attrs_locked(wq, percpu_std_wq_attrs[highpri]);
-	} else if (wq->flags & __WQ_ORDERED) {
-		struct pool_workqueue *dfl_pwq;
+	attrs = alloc_wq_std_attrs(wq);
+	if (!attrs)
+		goto enomem;
+
+	ret = apply_workqueue_attrs_locked(wq, attrs);
+	free_workqueue_attrs(attrs);
+	if (ret)
+		goto enomem;
+
+	if (wq->flags & __WQ_ORDERED) {
+		struct pool_workqueue *dfl_pwq = rcu_access_pointer(wq->dfl_pwq);
 
-		ret = apply_workqueue_attrs_locked(wq, ordered_wq_attrs[highpri]);
 		/* there should only be single pwq for ordering guarantee */
-		dfl_pwq = rcu_access_pointer(wq->dfl_pwq);
-		WARN(!ret && (wq->pwqs.next != &dfl_pwq->pwqs_node ||
-			      wq->pwqs.prev != &dfl_pwq->pwqs_node),
+		WARN(wq->pwqs.next != &dfl_pwq->pwqs_node ||
+		     wq->pwqs.prev != &dfl_pwq->pwqs_node,
 		     "ordering guarantee broken for workqueue %s\n", wq->name);
-	} else {
-		ret = apply_workqueue_attrs_locked(wq, unbound_std_wq_attrs[highpri]);
 	}
 
-	if (ret)
-		goto enomem;
 	return 0;
 
 enomem:
@@ -8378,28 +8388,6 @@ void __init workqueue_init_early(void)
 			init_cpu_worker_pool(pool, cpu, std_nice[i++]);
 	}
 
-	/* create default unbound, ordered and percpu wq attrs */
-	for (i = 0; i < NR_STD_WORKER_POOLS; i++) {
-		struct workqueue_attrs *attrs;
-
-		BUG_ON(!(attrs = alloc_workqueue_attrs()));
-		attrs->nice = std_nice[i];
-		unbound_std_wq_attrs[i] = attrs;
-
-		/*
-		 * An ordered wq should have only one pwq as ordering is
-		 * guaranteed by max_active which is enforced by pwqs.
-		 */
-		BUG_ON(!(attrs = alloc_workqueue_attrs()));
-		attrs->nice = std_nice[i];
-		attrs->ordered = true;
-		ordered_wq_attrs[i] = attrs;
-
-		BUG_ON(!(attrs = alloc_workqueue_attrs()));
-		attrs->nice = std_nice[i];
-		percpu_std_wq_attrs[i] = attrs;
-	}
-
 	system_wq = alloc_workqueue("events", WQ_PERCPU | __WQ_DEPRECATED, 0);
 	system_percpu_wq = alloc_workqueue("events", WQ_PERCPU, 0);
 	system_highpri_wq = alloc_workqueue("events_highpri",

-- 
2.53.0-Meta

