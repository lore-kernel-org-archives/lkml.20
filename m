Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5557441A57D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870849; cv=none; b=ATNnlLAYEwklZlZG9ggkdS7dHlW3+EgUV58yyOTfbalGG8r+PP9H7UrcHH0biOisIjMTCzV5Kkc+z/TfQdyDieW85ZMXDOT2qaxjbx4+kNEjdRXLx0dgJVBeAVrTc+5kufL9TUYuPJ4vv1NGAPsVURpvmOjxfNKMxYjS19xa2Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870849; c=relaxed/simple;
	bh=d4ILIYkS8paOjHCpXE6BaUZ3/WlSlEe9BZ9QeJd1Jik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUjqjKAohG8Rxx46eRI1Y3a+kbJC6WcZEj/RFVNtggNX4gvUv4QJ1wpddLeTfUZuM2aJoVSmeH1iare7J5/DRXhqSOFtK/4gX8B5vjYJ7Xa/iff/sRwrgFz3HEj44GCxfooch4mZREkqKoHDbgkcsMogD7YbYW03RQj/0hOtflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ounXHvoD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ounXHvoD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=Qa6MVRp2Z/2Dh1lxhJG6WikCgZ6jgdymcEiDlcJwzks=; b=
	ounXHvoDv1Bsv7T2SWZRZ7vx57Blq+/IwoVJZE/lf1+IFu3EZRobfghZFBoqQdDy5bNnP9tRwhJ5y
	rw575gv5dNSAcMxxhzqhvv5InvaxI/HyRNAgZkuFhO1tiLaVA8mo0xsZzGXmlgP0/PkCMwZPFrvsY
	mixKtjsdwa2auGxNaYA3A+RMqsCidjFhZRdfmZnciec73/zoZcrQwbU5vn++q2S1mSILJXo+X5HFh
	LF3ILxQzCH5qnquK5U6SSQwGfIHvxTAJmwbj2PUNetuZmEcrXPM+nXnlIrXhsxN3o4Xy9urnGyD21
	Xb6Fr03zc0l2CSASQ2o3N9OgqbK32895hg==;
Received: from [81.79.79.1] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJJU-00ABvp-CH; Thu, 01 Oct 2026 18:07:16 +0200
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
Subject: [RFC v6 1/3] workqueue: Simplify unbound sysfs attribute registration
Date: Thu,  1 Oct 2026 17:07:09 +0100
Message-ID: <20261001160711.59888-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001160711.59888-1-tvrtko.ursulin@igalia.com>
References: <20261001160711.59888-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of manually registering each attribute we can put them in an
attribute group with a visibility check and device core will handle the
rest, which simplifies the registration and error unwind.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Bradley Morgan <include@grrlz.net>
Cc: Chia-I Wu <olv@google.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Tejun Heo <tj@kernel.org>
---
v2:
 * Fix accidental rename of affinity_scope.
---
 kernel/workqueue.c | 98 ++++++++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 46 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index e618108c6127..c83d68d7d0ee 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -7599,8 +7599,8 @@ static const struct attribute_group wq_sysfs_group = {
 };
 __ATTRIBUTE_GROUPS(wq_sysfs);
 
-static ssize_t wq_nice_show(struct device *dev, struct device_attribute *attr,
-			    char *buf)
+static ssize_t nice_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	int written;
@@ -7627,8 +7627,8 @@ static struct workqueue_attrs *wq_sysfs_prep_attrs(struct workqueue_struct *wq)
 	return attrs;
 }
 
-static ssize_t wq_nice_store(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count)
+static ssize_t nice_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	struct workqueue_attrs *attrs;
@@ -7652,8 +7652,8 @@ static ssize_t wq_nice_store(struct device *dev, struct device_attribute *attr,
 	return ret ?: count;
 }
 
-static ssize_t wq_cpumask_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static ssize_t unbound_cpumask_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	int written;
@@ -7665,9 +7665,9 @@ static ssize_t wq_cpumask_show(struct device *dev,
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
@@ -7689,8 +7689,8 @@ static ssize_t wq_cpumask_store(struct device *dev,
 	return ret ?: count;
 }
 
-static ssize_t wq_affn_scope_show(struct device *dev,
-				  struct device_attribute *attr, char *buf)
+static ssize_t affinity_scope_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 	int written;
@@ -7708,9 +7708,9 @@ static ssize_t wq_affn_scope_show(struct device *dev,
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
@@ -7731,8 +7731,8 @@ static ssize_t wq_affn_scope_store(struct device *dev,
 	return ret ?: count;
 }
 
-static ssize_t wq_affinity_strict_show(struct device *dev,
-				       struct device_attribute *attr, char *buf)
+static ssize_t affinity_strict_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct workqueue_struct *wq = dev_to_wq(dev);
 
@@ -7740,9 +7740,9 @@ static ssize_t wq_affinity_strict_show(struct device *dev,
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
@@ -7762,14 +7762,40 @@ static ssize_t wq_affinity_strict_store(struct device *dev,
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
+static struct device_attribute dev_attr_unbound_cpumask =
+	__ATTR(cpumask, 0644, unbound_cpumask_show, unbound_cpumask_store);
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
+		return SYSFS_GROUP_INVISIBLE;
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
@@ -7907,14 +7933,9 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
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
@@ -7922,21 +7943,6 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
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
2.55.0

