Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785957;
	b=pHUCRe+eJ/sJBrK5FhcAR1vHtyKJO0svVttp0iNvwdvFbeOLZ6pLQa4eYWXj25y5lXc3
	 gaBrRRF1kcRu6mm4gcNyg4QP1G3lx/GaRzmfHBQPAaB2PNM7V8+rHObcLW01Pi9A/W3NE
	 NVRwm187jKfuEwd/yQObNuuKPx1oECMyLYqtLLdPOm8Getz6d3KPxPWUdYl4K1KBHC9S6
	 De6Wutc994NNY9giGFpaSS/u8b0uzYgm1F5nWjJ5m1UN1Ioz8hjPkzUy4FKwNTz1sBbdH
	 0JZCZ7b1vDVDPzLfka/5AocWDSBwAVIiriuEhbLg6lk0xifrqvmJyBOFCUA0dAUZ6sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785957;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mNkqYJWjgfmLdaldxYYJOf//rKOtSMV6VcmfTaY2XPw=;
	b=gB6NmMxiiYkRBKiPK409h+gedirqyjZKJr5gsQWvzUnfl/Cqp9jIkMipT1Fiu0tG1EGy
	 //ZA4LJBY3OMzKTa65LoOkUE5CEWDjGfdS1McA2AhmI7ekpLShak2citzqfrp8/GXaJNZ
	 UiCJgRPc7Cgj1Xb5a0kKK55/XThm0gqt/V6eF5IOxAh937jLRsdBB3iyQ12WcSIwi1E8B
	 HbAvgNb+dgEiurP63I+ZjdIpLRlCDFVvfnslf7bZc3+IT/yFqKuSwSU7j7H6FiW2JRR4A
	 AhNRPuNoJR6XVkz/e2BGVA7+b+JWRng+2Qh9AB1VPQzQhPv7lwm+v6L/reBCn+YeFvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=j0znpHim;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C828606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C828606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=j0znpHim
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=mNkqYJWjgfmLdaldxYYJOf//rKOtSMV6VcmfTaY2XPw=;
	t=1793785955; x=2109145955; b=j0znpHim/T70jbRsHtaUOXel27fWMuY7D7uGFOTeuU8OxyJ
	M4pWr/qeWGQqRHmFUX/6gMP39p8qZ5W+if3gmA9V4hYAZ+U1R3kqLIy/u9w8JnpQYaCtFZQHjDfLy
	ujWzALcie6PyjybE5FtzrnuZrTvd4QoRuvtoUinJDX5MZpFbKTAFDLCQ/QU3x8xXWtMfGzXcIVaF9
	86hduW7R23sUCaA5uzWY1Nc8Pag9Ar3gQFBBpJXS7YcO6dbbRtpd+0CRR29VVmgnSvI+zmxcoN6BW
	EejXzQV+Uqd75LWthpBc2xpnOg0PFCJnYq6vLNC8igI9mn42gFyQWPZ7ISpKnv7g==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xOXfU-00284r-PI; Wed, 04 Nov 2026 10:52:32 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Chia-I Wu <olv@google.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Steven Price <steven.price@arm.com>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH v8 1/6] workqueue: Simplify unbound sysfs attribute registration
Date: Wed,  4 Nov 2026 09:52:20 +0000
Message-ID: <20261104095225.32654-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104095225.32654-1-tvrtko.ursulin@igalia.com>
References: <20261104095225.32654-1-tvrtko.ursulin@igalia.com>
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

Instead of manually registering each attribute we can put them in an
attribute group with a visibility check and device core will handle the
rest, which simplifies the registration and error unwind.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Chia-I Wu <olv@google.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Tejun Heo <tj@kernel.org>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com> # v3
---
v2:
 * Fix accidental rename of affinity_scope.

v3:
 * SYSFS_GROUP_INVISIBLE should not be used for un-named groups.

v4:
 * Use DEVICE_ATTR_RW_NAMED. (Tejun)
---
 kernel/workqueue.c | 97 ++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 46 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index f2e8071a6f4e..14b87e972ce9 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -7623,8 +7623,8 @@ static const struct attribute_group wq_sysfs_group = {
 };
 __ATTRIBUTE_GROUPS(wq_sysfs);
 
-static ssize_t wq_nice_show(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t nice_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	int written;
@@ -7651,8 +7651,8 @@ static struct workqueue_attrs *wq_sysfs_prep_attrs(struct workqueue_struct *wq)
 	return attrs;
 }
 
-static ssize_t wq_nice_store(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t nice_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	struct workqueue_attrs *attrs;
@@ -7676,8 +7676,8 @@ static ssize_t wq_nice_store(struct device *dev, struct device_attribute *attr,
 	return ret ?: count;
 }
 
-static ssize_t wq_cpumask_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t unbound_cpumask_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	int written;
@@ -7689,9 +7689,9 @@ static ssize_t wq_cpumask_show(struct device *dev,
 	return written;
 }
 
-static ssize_t wq_cpumask_store(struct device *dev,
-				struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t unbound_cpumask_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	struct workqueue_attrs *attrs;
@@ -7713,8 +7713,8 @@ static ssize_t wq_cpumask_store(struct device *dev,
 	return ret ?: count;
 }
 
-static ssize_t wq_affn_scope_show(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t affinity_scope_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	int written;
@@ -7732,9 +7732,9 @@ static ssize_t wq_affn_scope_show(struct device *dev,
 	return written;
 }
 
-static ssize_t wq_affn_scope_store(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static ssize_t affinity_scope_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	struct workqueue_attrs *attrs;
@@ -7755,8 +7755,8 @@ static ssize_t wq_affn_scope_store(struct device *dev,
 	return ret ?: count;
 }
 
-static ssize_t wq_affinity_strict_show(struct device *dev,
-				       struct device_attribute *attr, char *buf)
+static ssize_t affinity_strict_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 
@@ -7764,9 +7764,9 @@ static ssize_t wq_affinity_strict_show(struct device *dev,
 			 wq->attrs->affn_strict);
 }
 
-static ssize_t wq_affinity_strict_store(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+static ssize_t affinity_strict_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	struct workqueue_attrs *attrs;
@@ -7786,14 +7786,39 @@ static ssize_t wq_affinity_strict_store(struct device *dev,
 	return ret ?: count;
 }
 
-static struct device_attribute wq_sysfs_unbound_attrs[] = {
-	__ATTR(nice, 0644, wq_nice_show, wq_nice_store),
-	__ATTR(cpumask, 0644, wq_cpumask_show, wq_cpumask_store),
-	__ATTR(affinity_scope, 0644, wq_affn_scope_show, wq_affn_scope_store),
-	__ATTR(affinity_strict, 0644, wq_affinity_strict_show, wq_affinity_strict_store),
-	__ATTR_NULL,
+static DEVICE_ATTR_RW(nice);
+static DEVICE_ATTR_RW(affinity_scope);
+static DEVICE_ATTR_RW(affinity_strict);
+/* Avoid naming clash with the other cpumask */
+static DEVICE_ATTR_RW_NAMED(unbound_cpumask, "cpumask");
+
+static struct attribute *wq_sysfs_unbound_attrs[] = {
+	&dev_attr_nice.attr,
+	&dev_attr_unbound_cpumask.attr,
+	&dev_attr_affinity_scope.attr,
+	&dev_attr_affinity_strict.attr,
+	NULL,
 };
 
+static umode_t wq_sysfs_unbound_group_visible(struct kobject *kobj,
+					      struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct workqueue_struct *wq = dev_to_wq(dev);
+
+	if (!(wq->flags & WQ_UNBOUND))
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group wq_sysfs_unbound_group = {
+	.is_visible = wq_sysfs_unbound_group_visible,
+	.attrs = wq_sysfs_unbound_attrs,
+};
+
+__ATTRIBUTE_GROUPS(wq_sysfs_unbound);
+
 static const struct bus_type wq_subsys = {
 	.name				= "workqueue",
 	.dev_groups			= wq_sysfs_groups,
@@ -7931,14 +7956,9 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
 	wq_dev->wq = wq;
 	wq_dev->dev.bus = &wq_subsys;
 	wq_dev->dev.release = wq_device_release;
+	wq_dev->dev.groups = wq_sysfs_unbound_groups;
 	dev_set_name(&wq_dev->dev, "%s", wq->name);
 
-	/*
-	 * attrs are created separately.  Suppress uevent until
-	 * everything is ready.
-	 */
-	dev_set_uevent_suppress(&wq_dev->dev, true);
-
 	ret = device_register(&wq_dev->dev);
 	if (ret) {
 		put_device(&wq_dev->dev);
@@ -7946,21 +7966,6 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
 		return ret;
 	}
 
-	if (wq->flags & WQ_UNBOUND) {
-		struct device_attribute *attr;
-
-		for (attr = wq_sysfs_unbound_attrs; attr->attr.name; attr++) {
-			ret = device_create_file(&wq_dev->dev, attr);
-			if (ret) {
-				device_unregister(&wq_dev->dev);
-				wq->wq_dev = NULL;
-				return ret;
-			}
-		}
-	}
-
-	dev_set_uevent_suppress(&wq_dev->dev, false);
-	kobject_uevent(&wq_dev->dev.kobj, KOBJ_ADD);
 	return 0;
 }
 
-- 
2.56.0

