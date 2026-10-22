Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661942;
	b=EqMeL9PAcC5EotoBwkoHTsI5X3c8thBP84dgjFxOMWzdi2dmEMGrZMgLMU+xAlSpdM/F
	 BLE/7ukRhLIWZhpOQNLJeA6Agi7am0YNZoPeZxj+1KOSfjVS4VF461UHQQmyJTV267Gb9
	 uR/SINGBhUZJH8THOdTTmpAbM1WQka0moU7i+Tj1XsTmDGY/RFfrjI6g8v8xhYm/1Bghx
	 QH3tUsbeFxuArIXT0dTtBpEu8g07OMPux56xC3PgykIrUtPkuJkQIfPcaW0ck9kK1a/N0
	 U/ZoNcW0Cr2bM2Es9tOjqV4ibt9DUxB2UktTDmSSjwzeYuXIeJW2nXNERu89mZVfbdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661942;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TWnMy8uZ+sD20xxvxp1MeSa9/cNwBwCrrG8h/uldN2A=;
	b=DAvJ7m/HA3cnkl3pQty9hKTNROH6vns4EPKPMMhXeyxLVLMtYKd6oPOOJMF8SY35bsuP
	 jWk2zLuxKfLKDLVtAJOC8xe3Z3xR5rgnNR+hCJRiIzMM2qxARwObEqiKPPEWXWatWrJbV
	 ULqlwUxdMyyS3ciguyTNqMDIPPtUhzeSBwl+vfiR8ApDLqdjP3QZB/0WSXEGPzATsMYlt
	 YJTvv+sWoaFkAkifmcjDlbFd9V4sYPtpOsZBwsd0zCwd5U7vNgqMPItftdDOzWZgLc2uq
	 QxjjGINuv1+ukAXakUiFusml2q3sko9pLb7T/R8j+Jsv2t/oc3w8yflJnyiYQ1UBLLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=G458+ILf;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4994606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4994606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=G458+ILf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=TWnMy8uZ+sD20xxvxp1MeSa9/cNwBwCrrG8h/uldN2A=; b=
	G458+ILflcOl5Bo8WaP3DFLX0dFpi+q7xDOHEoBav5BfCytPKG4K8BIqHrVuqWxdK3mStJIefXC/v
	eUMICROOlJPJO2Q3KTGSTynEhLYMSqaxwoftA1tPzxdtwzAlW9L0582qiFH10UoGtVK8yAfqJ/w7i
	fCejxhmBl7Auacz6UZkOFdIVQoiPhAGy5J1gKZetc8CUIioQvPXeUygnH2FnItEmcC9Xui+ioyR1D
	csSgu9Zb6BDqN5pCMEEib66J7CDysF5U89fyIwqUQCyj7LNvpEENByjQaSdYsKx/RB9fIqNt9qmob
	h2YMxmHWbEUqYhsQShEo+i4f5h3Y4KT7yw==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xJpG7-006erg-OO; Thu, 22 Oct 2026 11:38:51 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Bradley Morgan <include@grrlz.net>,
	Chia-I Wu <olv@google.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH v7 2/4] workqueue: Separate sysfs mutable vs immutable wq attribute sanitizing
Date: Thu, 22 Oct 2026 10:38:46 +0100
Message-ID: <20261022093848.5727-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
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

In preparation for adding more sanitization steps split the current ones
into ones which are immutable and the ones which can be modified from
sysfs.

Point being that the mutable steps must only run on the initial workqueue
creation, while the immutable properties need to be sanitized every time
attributes are applied.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Bradley Morgan <include@grrlz.net>
Cc: Chia-I Wu <olv@google.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Tejun Heo <tj@kernel.org>
---
 kernel/workqueue.c | 49 ++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index d8cf546d853f..c634b20f1874 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5706,6 +5706,32 @@ static void apply_wqattrs_cleanup(struct apply_wqattrs_ctx *ctx)
 	}
 }
 
+/* Sanitize attributes not modifiable via sysfs. */
+static void
+sanitize_immutable_workqueue_attrs(struct workqueue_struct *wq,
+				   struct workqueue_attrs *attrs)
+{
+	if (wq->flags & __WQ_ORDERED)
+		attrs->ordered = true;
+}
+
+/* Sanitize attributes modifiable via sysfs. */
+static void
+sanitize_mutable_workqueue_attrs(struct workqueue_struct *wq,
+				 struct workqueue_attrs *attrs)
+{
+	if (wq->flags & WQ_HIGHPRI)
+		attrs->nice = HIGHPRI_NICE_LEVEL;
+}
+
+static void
+sanitize_workqueue_attrs(struct workqueue_struct *wq,
+				 struct workqueue_attrs *attrs)
+{
+	sanitize_immutable_workqueue_attrs(wq, attrs);
+	sanitize_mutable_workqueue_attrs(wq, attrs);
+}
+
 /* allocate the attrs and pwqs for later installation */
 static struct apply_wqattrs_ctx *
 apply_wqattrs_prepare(struct workqueue_struct *wq,
@@ -5735,6 +5761,7 @@ apply_wqattrs_prepare(struct workqueue_struct *wq,
 	 * every possible CPU and never falls back, so it has no default.
 	 */
 	copy_workqueue_attrs(new_attrs, attrs);
+	sanitize_immutable_workqueue_attrs(wq, new_attrs);
 	wqattrs_actualize_cpumask(new_attrs, unbound_cpumask);
 	cpumask_copy(new_attrs->__pod_cpumask, new_attrs->cpumask);
 	if (!(wq->flags & WQ_PERCPU)) {
@@ -5757,6 +5784,7 @@ apply_wqattrs_prepare(struct workqueue_struct *wq,
 
 	/* save the user configured attrs and sanitize it. */
 	copy_workqueue_attrs(new_attrs, attrs);
+	sanitize_immutable_workqueue_attrs(wq, new_attrs);
 	cpumask_and(new_attrs->cpumask, new_attrs->cpumask, cpu_possible_mask);
 	cpumask_copy(new_attrs->__pod_cpumask, new_attrs->cpumask);
 	ctx->attrs = new_attrs;
@@ -5919,24 +5947,6 @@ static void unbound_wq_update_pwq(struct workqueue_struct *wq, int cpu)
 	put_pwq_unlocked(old_pwq);
 }
 
-/* the attrs @wq asked for, as spelled by its flags */
-static struct workqueue_attrs *alloc_wq_std_attrs(struct workqueue_struct *wq)
-{
-	struct workqueue_attrs *attrs;
-
-	attrs = alloc_workqueue_attrs();
-	if (!attrs)
-		return NULL;
-
-	if (wq->flags & WQ_HIGHPRI)
-		attrs->nice = HIGHPRI_NICE_LEVEL;
-
-	if (wq->flags & __WQ_ORDERED)
-		attrs->ordered = true;
-
-	return attrs;
-}
-
 static int alloc_and_link_pwqs(struct workqueue_struct *wq)
 {
 	struct workqueue_attrs *attrs;
@@ -5948,10 +5958,11 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
 	if (!wq->cpu_pwq)
 		goto enomem;
 
-	attrs = alloc_wq_std_attrs(wq);
+	attrs = alloc_workqueue_attrs();
 	if (!attrs)
 		goto enomem;
 
+	sanitize_workqueue_attrs(wq, attrs);
 	ret = apply_workqueue_attrs_locked(wq, attrs);
 	free_workqueue_attrs(attrs);
 	if (ret)
-- 
2.56.0

