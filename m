Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256993AD53F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741553; cv=none; b=Qf2zM1QcTm6mFqMMSXiYuzWETobs1n4DJKWiPlePUcC7LgsLhr2NAC/brWLcxm9YnRSnmRR632PixdVFSgQj3VxTqJwkgD4lxNjtkbBdstH6Q1Jl8vhsYmlyzlhZ8n67elTod6yttDH323kdKEiIv/Kjj8FzrMi/kTmm9TcW0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741553; c=relaxed/simple;
	bh=X5RcxNz2QGiWT9Zse8Ys3prPWoakI8lQ0XS1HkPc+4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bd4ZtwxWUyE5huBwKZEu8Udt4HC3bvFnrzsLlTppEk/OERm0Qx6U7YkQOwbopSzMdkdE5B8qVPtT9eryRjPD5Gd2NbYvO+kiwJcRhpitbt9FfVgVIKclcho5QC/7/d3r5Lo09I4wYZuG8fe7oDgQBEoSygoRe9OMpzbMFtk8vZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=QkO32hVj; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="QkO32hVj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=rt8Z/CWD/C96rMtWvjjrIBWSSM8KoD63SSMFo3bWtps=; b=QkO32hVjfc+/G0/g/NXGebIVc7
	ezbPXutfyVjTWSZCVuoskfL4x7rtcyTPEao46jt81Cn0r5gaEY8rRWlq2p+ysVCp2p0L5kuzFkJGI
	d9B2h2Ev3CIzH/bN5fpanZ8uL7sQdewrGdX3Bi2+pv2egzKphjMPHR+SiLmYW3wwune91ojgORVAy
	FtHYqEFgxg04fZur6vRIvOsC7AKE8m6Zs2Yy2WXknZgcsmuy10+sg0FdqNOuxDrkgqZlcsmV+2Efi
	dNhqOrc1lNr/6vFrTFUBKAdV4kz7DcMH8wDmjMpSfaiZhbO9vZuox7lXHaX2rb7l6G5yaxfw973Pl
	pGpi0ylA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7ZX9-006n9A-0n;
	Fri, 18 Sep 2026 14:25:47 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 18 Sep 2026 07:25:34 -0700
Subject: [PATCH RFC 2/3] workqueue: Add a concurrency_managed workqueue
 attribute
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-wq_final-v1-2-5c43c08a26bc@debian.org>
References: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
In-Reply-To: <20260918-wq_final-v1-0-5c43c08a26bc@debian.org>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, marco.crivellari@suse.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=4395; i=leitao@debian.org;
 h=from:subject:message-id; bh=X5RcxNz2QGiWT9Zse8Ys3prPWoakI8lQ0XS1HkPc+4E=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqrUngwJLoy6f396TtUgvc3oqu7FT/cXB7Cc+rp
 Uo+UjJ+cGeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaq1J4AAKCRA1o5Of/Hh3
 bVXrD/wMpThM6/OzJybgaam5GIPFVP2rZsRosvoUidSeko17zVp0tKPIxn/Jfu6eOf8aTnrTevE
 uiIg7XWDtSh1VQkMXVk1F1T8shbxUuBtJKs7UqNMGj5FfcyDtad0IQ4k9rGqF0eq0xJGL12YaOt
 MifTHji1PUj8QFB7iSPq6uSyyT3k6ufliT6UpPFEmqP4cwAAbljrZBMgOV6CHj6I8+Iuz0SBQ5s
 7bR88wSQN2WPc+twLcIqnzYGjXVqbjs51im1cnoF53OFEuACJG0I7hsz1F+Rj8kq2BZLs/zK8q7
 VvTP7j9z48AkQ/yDf5F0nPCG4/4ZoARJPhaMLTrTRyRzM3OCQlO/g+VDk+CBDQqGag9UgWNxNgH
 nzgnqzY6yWfDdvHqgw8BXR+xW7ZVEHGfyt1ozzfSsfzSaOXdBPu9TbmB8BrPmMLDB+VInLg40uw
 v/ldxBeQJoP7Jo7HBUJC9b17MUYi/FJp56rIkenPi1/WvU12BnJdNdX8dnoK7ED/lamMdVLCXtV
 i39EN8S+02u7+j1dQxX6hD1Ao2k14RHuZT1zVAlDnlqeeG0YC+nD+ggmdbYS/a3zzfFLG36cW2c
 LMhdS1R+HtgJclN/wtYDzNOeh0ITSATokNNqHqlhORCjj9Ls2KBlSEyq228jO8LUo6QKESWCykm
 qwnqZW8samPdsAg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Tejun wanted to have a CM affinity (WQ_AFFN_CPU_CM), but I am proposing
to have an attribute field, that we can set with WQ_AFFN_CPU, depending
on whether we want to have CM or not.

Create workqueue_attrs->concurrency_managed, and use it to decide if we
do CM. It always comes with WQ_AFFN_CPU and affn_strict, since
alloc_wq_std_attrs() sets the three together for a WQ_PERCPU workqueue,
which is the only thing that sets it. It sits below the divider, so
wqattrs_clear_for_pool() clears it and it does not become part of the
pool hash.

This is not set by sysfs (for now?!), and apply_workqueue_attrs() refuses
attrs that carry it, so it is fixed when the workqueue is created, for
now.

So, a workqueue has 4 "attributes" with this patch:

  * cpumask
  	- which CPUs the workqueue may use at all
  * affn_scope
  	- cpu / smt / cache / cache_shard / numa / system
  * affn_strict
	- whether the pod boundary is a hard bind or a hint
  * concurrency_managed
  	- CM enabled or now.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/workqueue.h | 10 ++++++++++
 kernel/workqueue.c        | 19 ++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index a283766a192aaf..a7fc9b0f72af2e 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -204,6 +204,16 @@ struct workqueue_attrs {
 	 */
 	enum wq_affn_scope affn_scope;
 
+	/**
+	 * @concurrency_managed: use the concurrency managed per-cpu pools
+	 *
+	 * Those keep at most one worker running per CPU and account max_active
+	 * per CPU rather than per node. Set from %WQ_PERCPU when the workqueue
+	 * is created and fixed for its lifetime, so it always comes with
+	 * %WQ_AFFN_CPU and @affn_strict.
+	 */
+	bool concurrency_managed;
+
 	/**
 	 * @ordered: work items must be executed one by one in queueing order
 	 */
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1c4f8bdd1cd509..f86e8d0770ca22 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5026,6 +5026,7 @@ static void copy_workqueue_attrs(struct workqueue_attrs *to,
 	 * get_unbound_pool() explicitly clears the fields.
 	 */
 	to->affn_scope = from->affn_scope;
+	to->concurrency_managed = from->concurrency_managed;
 	to->ordered = from->ordered;
 }
 
@@ -5036,6 +5037,7 @@ static void copy_workqueue_attrs(struct workqueue_attrs *to,
 static void wqattrs_clear_for_pool(struct workqueue_attrs *attrs)
 {
 	attrs->affn_scope = WQ_AFFN_NR_TYPES;
+	attrs->concurrency_managed = false;
 	attrs->ordered = false;
 	if (attrs->affn_strict)
 		cpumask_copy(attrs->cpumask, cpu_possible_mask);
@@ -5607,9 +5609,9 @@ static struct pool_workqueue *alloc_pwq(struct workqueue_struct *wq,
 
 	lockdep_assert_held(&wq_pool_mutex);
 
-	WARN_ON_ONCE((wq->flags & WQ_PERCPU) && cpu < 0);
+	WARN_ON_ONCE(attrs->concurrency_managed && cpu < 0);
 
-	if (cpu >= 0 && (wq->flags & WQ_PERCPU)) {
+	if (cpu >= 0 && attrs->concurrency_managed) {
 		pool = get_percpu_pool(wq, cpu);
 	} else {
 		pool = get_unbound_pool(attrs);
@@ -5737,7 +5739,7 @@ apply_wqattrs_prepare(struct workqueue_struct *wq,
 	copy_workqueue_attrs(new_attrs, attrs);
 	wqattrs_actualize_cpumask(new_attrs, unbound_cpumask);
 	cpumask_copy(new_attrs->__pod_cpumask, new_attrs->cpumask);
-	if (!(wq->flags & WQ_PERCPU)) {
+	if (!new_attrs->concurrency_managed) {
 		ctx->dfl_pwq = alloc_unbound_pwq(wq, new_attrs);
 		if (!ctx->dfl_pwq)
 			goto out_free;
@@ -5843,6 +5845,10 @@ int apply_workqueue_attrs(struct workqueue_struct *wq,
 	if (WARN_ON(!(wq->flags & WQ_UNBOUND)))
 		return -EINVAL;
 
+	/* concurrency management comes from WQ_PERCPU, it is not applied */
+	if (WARN_ON(attrs->concurrency_managed))
+		return -EINVAL;
+
 	mutex_lock(&wq_pool_mutex);
 	ret = apply_workqueue_attrs_locked(wq, attrs);
 	mutex_unlock(&wq_pool_mutex);
@@ -5934,6 +5940,13 @@ static struct workqueue_attrs *alloc_wq_std_attrs(struct workqueue_struct *wq)
 	if (wq->flags & __WQ_ORDERED)
 		attrs->ordered = true;
 
+	/* a percpu workqueue wants a concurrency managed pwq on every CPU */
+	if (wq->flags & WQ_PERCPU) {
+		attrs->affn_scope = WQ_AFFN_CPU;
+		attrs->affn_strict = true;
+		attrs->concurrency_managed = true;
+	}
+
 	return attrs;
 }
 

-- 
2.53.0-Meta

