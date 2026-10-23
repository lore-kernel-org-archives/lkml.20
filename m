Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725351;
	b=JtQjBTcxEu88LOwkmYEIi8Av+K6FSxpWThSnM1LLUir019Ki8lMgc37MJMjkm4rT+yaX
	 HcahMQPbspYfehcMbgK0mtwKmGydy/n0AGhLYuNkrMWp1l126Y33/8RQsC+7B21aL0EvG
	 RqooRxw2YN0xVvUs7nxAG7qC0XT9GHo248Zbk4mQBqK1atddH7krjMQlDHtsbZwUMbVFL
	 pp32t1LGwYvuUEIo75e4Pu0a/gCwFe+iadoCWkn9kAkEptUDeQF27bKt6YwtBOZ5t86KT
	 Y7C83QJW62TTj1JrNgS4BAknrKKcLJizYWLhqBLBuHKSJtpbPUsDrjXudyMZyYh+Qvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725351;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=atKAtRUwRhwoXBh1Pa68vonblhkREK5OXg8Su4R9xck=;
	b=hb1c12BkgeTsUiRlPi+q6ynIy+9Cx1SDuU+e7mXH3dFrIo9zhHjaOhMcGuCdnVu6YN2w
	 gMolp5NLI6HMzswzoKWG102u4mHg88ucEoIK5e1QgqIoLF0fLqVN5Ghv3K2kgf7hAwk5b
	 6dlUWix2bA/c/xwG+g5Rffdjtn53hgo85uapyfJIZNlSGSHzNwOGHNDqRakpLEwGzkTqP
	 nL5S3ka8y3i3AsGUCqQ46Ty3EoeJr7GeqjqabozdSj2myC3cRT9hQ8vW2d7Nepjt2cduJ
	 qjpCOJlTLndBLbyiry3GzVDU23+Upmc9eMsP4XWtdFRBhiTDaNSk6xSina++kl3Q4WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WOBBD81j;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB7F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WOBBD81j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725323;
	bh=atKAtRUwRhwoXBh1Pa68vonblhkREK5OXg8Su4R9xck=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=WOBBD81j7xQReMafpyHphuk2ui9vkj3QyfedTJzZuwFbw/daxlWaw6/cFm0g6KsP/
	 X5rGtK1LvSN0yjomNJcyU1yVE8QpP0iUpTbwHyu+b2qAbBkGHJlzbR0Mx6xbVEk64T
	 tWCNpRnKANMaqyTkUsxGGbycmNWJde7UE5I00icc=
X-QQ-mid: esmtpsz11t1792725317td46a0c3e
X-QQ-Originating-IP: kME1XVvom48nZt66U/NENExLD2O8VdLO1oXmFijvxS4=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2265744787948365858
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/24] gtrace: Initial implementation of gtrace sysfs framework
Date: Fri, 23 Oct 2026 11:14:43 +0800
Message-Id: <20261023031505.2020925-3-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NzOHSugmTg7XZp9EJRpsafMnEkQmDM3bzuwdd5n8/jMev4GYQP1SRMb/
	5TjRSlj+4tX62H1eH/yptWK75+II5451IiyKqIrYZY5mTVcOL4Y+EGhkhCt/N4/+Q3t84Ot
	X8zzIpkbNTSTRomJ8coPZD2328XLTleTT+n3z7vODoxgpE7af33jL+MJsgDqW0CDGJPVwXN
	LXJ7x1TpHpZEW68E3gbJGAiybKpZ69jkF7Oa8JA7pMCdBXnw+u1OoMhig+BiEMV/RhOutQv
	XDdcvrdRfQHN8IS16O0/zaOs/5hN/KAcZ48Gmund7/+KmymFPh7s32ju0LqQ7VRGZDp+R3T
	6BIERkQGUllDggmSp9Sq+xrOVunsQT8u+YyfGELXg1p2IsZSlqfkm4MMniqdFVLBCh+avY0
	6mkeuzchJPJeHv66kv+VdokyLYx45KXP0d3xCvebT7hvD7JBZ+b+h8MLCYdfwwgcxO4XUVA
	bUf2qQlKZLTUPQ+5LPkZwtNg6DZ0scgnFWB8WxVSdAOWQWk/GM5hPpE/26qItjvGy8BbMU4
	rVQzqv1R5QTr6UjHPN7l29Ae2Tp4y1oHoYdY+y/tdkRyiD0GOkzwskGUj4L1W8CYEJz38ko
	T+4pXDQHLQbBlJwlCX1aF+OPF8wktF07LeH4JK94GWAZFGMTaNJ0AQT6BIKJZBMOKsvHPRB
	xP4UuY5YLZV8UXs5sAfztS0Zcft+kuqCGsLZvH5jrh0yv8Z7iOeBiv6hh8qNkNx+LrjiXZ0
	/AKU0ePtZ5YnqkFtdJHPOH7W9C9YglD9v9SUrHQf5RQ0jW3SoUXhQ523YrVGNCVIsP/+Ykq
	gXRXz3SpQ7Z8yZWpZ/fRApGnk3htqqRt6YTnHVhxm9j+IN6Fjuw5eiL2B0/kdj6SBsUa1VW
	M8VeqmRaeKg4s3pjr8+WnCUKTcP20A8UqR9nhj8/AHQBCVac7JmadN2/wqS/mDMLR4OYxzg
	wzmFv7Wh6+ByEexR1u+nURyZysjwOqoNV8RTC14WjjgC62tc204ZiEWJg4umxM0LbvJLFFV
	rxTin1EHwYU1dPwCgFTU0qx4jwDpDgO20R7jO52seXWyi77LanAqVZwfBuqrk=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Add per-component sysfs attribute groups (enable_sink, enable_source,
label) and a connections/ group with nr_links and bidirectional out:X /
in:Y symlinks. Drivers can attach extra groups via pdata->groups; they
are registered and cleaned up inside gtrace_sysfs_add/remove.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Makefile       |   2 +-
 drivers/hwtracing/gtrace/gtrace-core.c  |  47 ++-
 drivers/hwtracing/gtrace/gtrace-sysfs.c | 440 ++++++++++++++++++++++++
 include/linux/gtrace.h                  | 104 ++++++
 4 files changed, 583 insertions(+), 10 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/gtrace-sysfs.c

diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 33274a1ed0b8..ff79a49bdb5e 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_GTRACE) += gtrace.o
-gtrace-y := gtrace-core.o gtrace-perf.o
+gtrace-y := gtrace-core.o gtrace-perf.o gtrace-sysfs.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
 obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 5704e426abe8..cae0a7fa820f 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -17,7 +17,7 @@
 #define GTRACE_POLL_TIMEOUT_US_DEFAULT	10
 
 /* Mutex to serialize component registration/unregistration */
-static DEFINE_MUTEX(gtrace_mutex);
+DEFINE_MUTEX(gtrace_mutex);
 
 /* Per-CPU source instances */
 static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
@@ -36,11 +36,20 @@ struct gtrace_comp_priv {
 	pid_t owner;
 	bool ready;
 	bool visited;
+	enum gtrace_component_mode mode;
 };
 
 #define to_gtrace_comp_priv(__comp)	\
 	container_of_const(__comp, struct gtrace_comp_priv, comp)
 
+enum gtrace_component_mode gtrace_get_mode(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+
+	return cpriv->mode;
+}
+EXPORT_SYMBOL_GPL(gtrace_get_mode);
+
 /* Component type based id generator */
 struct gtrace_type_idx {
 	/* Lock to protect the type ID generator */
@@ -463,6 +472,12 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 		goto err_out_unlock;
 	}
 
+	ret = gtrace_sysfs_add(comp);
+	if (ret < 0) {
+		device_unregister(&comp->dev);
+		goto err_out_unlock;
+	}
+
 	if (comp->pdata->bound_cpu >= 0) {
 		gtrace_get_component(comp);
 		per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = comp;
@@ -507,6 +522,7 @@ void gtrace_unregister_component(struct gtrace_component *comp)
 	}
 
 	gtrace_cleanup_inconns_from_outconns(comp);
+	gtrace_sysfs_remove(comp);
 	device_unregister(&comp->dev);
 
 	mutex_unlock(&gtrace_mutex);
@@ -636,7 +652,8 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
-static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+static int __gtrace_comp_start(struct gtrace_component *comp,
+			       struct gtrace_path *path)
 {
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
@@ -648,17 +665,21 @@ static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
 
 	raw_spin_lock_irqsave(&cpriv->lock, flags);
 	if (cpriv->start_count) {
-		if (cpriv->owner != owner) {
+		if (cpriv->owner != path->owner || cpriv->mode != path->mode) {
 			ret = -EBUSY;
 			goto out;
 		}
 	} else {
 		if (gtdrv->start) {
+			comp->path = path;
 			ret = gtdrv->start(comp);
-			if (ret)
+			if (ret) {
+				comp->path = NULL;
 				goto out;
+			}
 		}
-		cpriv->owner = owner;
+		cpriv->owner = path->owner;
+		cpriv->mode = path->mode;
 	}
 
 	cpriv->start_count++;
@@ -667,7 +688,8 @@ static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
 	return ret;
 }
 
-static int __gtrace_comp_stop(struct gtrace_component *comp)
+static int __gtrace_comp_stop(struct gtrace_component *comp,
+			      struct gtrace_path *path)
 {
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
@@ -680,6 +702,11 @@ static int __gtrace_comp_stop(struct gtrace_component *comp)
 		goto out;
 	}
 
+	if (cpriv->mode != path->mode) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	cpriv->start_count--;
 	if (!cpriv->start_count) {
 		if (!gtdrv) {
@@ -689,6 +716,8 @@ static int __gtrace_comp_stop(struct gtrace_component *comp)
 
 		if (gtdrv->stop)
 			ret = gtdrv->stop(comp);
+		comp->path = NULL;
+		cpriv->mode = GTRACE_COMPONENT_MODE_DISABLED;
 	}
 out:
 	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
@@ -701,7 +730,7 @@ int gtrace_path_start(struct gtrace_path *path)
 	int ret = 0;
 
 	list_for_each_entry_reverse(node, &path->comp_list, head) {
-		ret = __gtrace_comp_start(node->comp, path->owner);
+		ret = __gtrace_comp_start(node->comp, path);
 		if (ret)
 			break;
 	}
@@ -709,7 +738,7 @@ int gtrace_path_start(struct gtrace_path *path)
 	/* If a component failed to start, stop all the components that were started before it */
 	if (ret)
 		list_for_each_entry_continue(node, &path->comp_list, head)
-			__gtrace_comp_stop(node->comp);
+			__gtrace_comp_stop(node->comp, path);
 
 	return ret;
 }
@@ -721,7 +750,7 @@ int gtrace_path_stop(struct gtrace_path *path)
 	int ret = 0, err;
 
 	list_for_each_entry(node, &path->comp_list, head) {
-		err = __gtrace_comp_stop(node->comp);
+		err = __gtrace_comp_stop(node->comp, path);
 		if (err && !ret)
 			ret = err;
 	}
diff --git a/drivers/hwtracing/gtrace/gtrace-sysfs.c b/drivers/hwtracing/gtrace/gtrace-sysfs.c
new file mode 100644
index 000000000000..5f4f3fcb56a4
--- /dev/null
+++ b/drivers/hwtracing/gtrace/gtrace-sysfs.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Spacemit Technologies, Inc.
+ *
+ * Based on drivers/hwtracing/coresight/coresight-sysfs.c
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/property.h>
+
+ssize_t gtrace_simple_show_pair(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_pair_attribute *gtrace_attr =
+		container_of(attr, struct gtrace_pair_attribute, attr);
+	u64 val;
+
+	val = gtrace_relaxed_read_pair(comp->pdata, gtrace_attr->lo_off, gtrace_attr->hi_off);
+	return sysfs_emit(buf, "0x%llx\n", val);
+}
+EXPORT_SYMBOL_GPL(gtrace_simple_show_pair);
+
+ssize_t gtrace_simple_show32(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct gtrace_off_attribute *gtrace_attr =
+		container_of(attr, struct gtrace_off_attribute, attr);
+	u32 val;
+
+	val = gtrace_relaxed_read32(comp->pdata, gtrace_attr->off);
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+EXPORT_SYMBOL_GPL(gtrace_simple_show32);
+
+/*
+ * gtrace_find_activated_sysfs_sink - find the first sink activated via
+ * walks outconns forward from @comp.
+ */
+static struct gtrace_component *
+gtrace_find_activated_sysfs_sink(struct gtrace_component *comp)
+{
+	int i;
+	struct gtrace_component *sink = NULL;
+	struct gtrace_platform_data *pdata = comp->pdata;
+
+	if (comp->sysfs_sink_activated)
+		return comp;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		struct gtrace_component *dest = pdata->outconns[i]->dest_comp;
+
+		if (dest)
+			sink = gtrace_find_activated_sysfs_sink(dest);
+		if (sink)
+			return sink;
+	}
+
+	return NULL;
+}
+
+/** gtrace_validate_source_sysfs - make sure a source has the right credentials to
+ *  be used via sysfs.
+ *  @comp:	the component structure for a source.
+ *  @function:	the function this was called from.
+ *
+ * Assumes the gtrace_mutex is held.
+ */
+static int gtrace_validate_source_sysfs(struct gtrace_component *comp,
+					const char *function)
+{
+	if (!gtrace_is_source(comp->pdata)) {
+		dev_err(&comp->dev, "component is not a trace source in %s\n", function);
+		return -EINVAL;
+	}
+
+	if (!cpu_online(comp->pdata->bound_cpu))
+		return -ENODEV;
+
+	return 0;
+}
+
+int gtrace_enable_sysfs(struct gtrace_component *comp)
+{
+	struct gtrace_component *sink;
+	struct gtrace_path *path;
+	int ret;
+
+	mutex_lock(&gtrace_mutex);
+	ret = gtrace_validate_source_sysfs(comp, __func__);
+	if (ret)
+		goto out;
+
+	/* mode == SYSFS implies that it's already enabled. */
+	if (gtrace_get_mode(comp) == GTRACE_COMPONENT_MODE_SYSFS)
+		goto out;
+
+	sink = gtrace_find_activated_sysfs_sink(comp);
+
+	/*
+	 * gtrace_create_path() acquires gtrace_mutex internally via
+	 * gtrace_walk_output_components(). Release it here first to
+	 * avoid a deadlock.
+	 */
+	mutex_unlock(&gtrace_mutex);
+
+	path = gtrace_create_path(comp, sink, GTRACE_COMPONENT_MODE_SYSFS);
+	if (IS_ERR(path)) {
+		pr_err("building path(s) failed\n");
+		return PTR_ERR(path);
+	}
+
+	mutex_lock(&gtrace_mutex);
+
+	ret = gtrace_path_start(path);
+	if (ret)
+		gtrace_destroy_path(path);
+
+out:
+	mutex_unlock(&gtrace_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_enable_sysfs);
+
+int gtrace_disable_sysfs(struct gtrace_component *comp)
+{
+	struct gtrace_path *path;
+	int ret;
+
+	mutex_lock(&gtrace_mutex);
+
+	ret = gtrace_validate_source_sysfs(comp, __func__);
+	if (ret)
+		goto out;
+
+	path = comp->path;
+
+	if (gtrace_get_mode(comp) != GTRACE_COMPONENT_MODE_SYSFS)
+		goto out;
+
+	ret = gtrace_path_stop(path);
+	if (ret)
+		pr_err("Error. Tracing not stopped\n");
+
+	gtrace_destroy_path(path);
+out:
+	mutex_unlock(&gtrace_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_disable_sysfs);
+
+static ssize_t enable_sink_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	guard(mutex)(&gtrace_mutex);
+
+	return sysfs_emit(buf, "%u\n", comp->sysfs_sink_activated);
+}
+
+static ssize_t enable_sink_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	comp->sysfs_sink_activated = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(enable_sink);
+
+static ssize_t enable_source_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	guard(mutex)(&gtrace_mutex);
+	return sysfs_emit(buf, "%u\n",
+			  gtrace_get_mode(comp) == GTRACE_COMPONENT_MODE_SYSFS);
+}
+
+static ssize_t enable_source_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t size)
+{
+	int ret = 0;
+	unsigned long val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+
+	/*
+	 * gtrace hotplug callbacks in core layer control a activated path
+	 * from its source to sink. Taking hotplug lock here protects a race
+	 * condition with hotplug callbacks.
+	 */
+	guard(cpus_read_lock)();
+
+	if (val) {
+		ret = gtrace_enable_sysfs(comp);
+		if (ret)
+			return ret;
+	} else {
+		ret = gtrace_disable_sysfs(comp);
+		if (ret)
+			return ret;
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(enable_source);
+
+static ssize_t label_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	const char *str;
+	int ret;
+
+	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%s\n", str);
+}
+static DEVICE_ATTR_RO(label);
+
+static umode_t label_is_visible(struct kobject *kobj,
+				struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+
+	if (attr == &dev_attr_label.attr) {
+		if (fwnode_property_present(dev_fwnode(dev), "label"))
+			return attr->mode;
+		else
+			return 0;
+	}
+
+	return attr->mode;
+}
+
+static struct attribute *gtrace_sink_attrs[] = {
+	&dev_attr_enable_sink.attr,
+	&dev_attr_label.attr,
+	NULL,
+};
+
+static const struct attribute_group gtrace_sink_group = {
+	.attrs = gtrace_sink_attrs,
+	.is_visible = label_is_visible,
+};
+
+
+static struct attribute *gtrace_source_attrs[] = {
+	&dev_attr_enable_source.attr,
+	&dev_attr_label.attr,
+	NULL,
+};
+
+static const struct attribute_group gtrace_source_group = {
+	.attrs = gtrace_source_attrs,
+	.is_visible = label_is_visible,
+};
+
+static struct attribute *gtrace_link_attrs[] = {
+	&dev_attr_label.attr,
+	NULL,
+};
+
+static const struct attribute_group gtrace_link_group = {
+	.attrs = gtrace_link_attrs,
+	.is_visible = label_is_visible,
+};
+
+static ssize_t nr_links_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	return sysfs_emit(buf, "%u\n", comp->pdata->nr_inconns + comp->pdata->nr_outconns);
+}
+static DEVICE_ATTR_RO(nr_links);
+
+static struct attribute *gtrace_conns_attrs[] = {
+	&dev_attr_nr_links.attr,
+	NULL,
+};
+
+static struct attribute_group gtrace_conns_group = {
+	.attrs = gtrace_conns_attrs,
+	.name = "connections",
+};
+
+static int gtrace_make_links(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	char *outs, *ins;
+	int i, ret;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (!conn->dest_comp)
+			continue;
+
+		outs = devm_kasprintf(pdata->dev, GFP_KERNEL,
+				      "out:%d", conn->src_port);
+		ins  = devm_kasprintf(&conn->dest_comp->dev, GFP_KERNEL,
+				      "in:%d", conn->dest_port);
+		if (!outs || !ins)
+			return -ENOMEM;
+
+		ret = sysfs_add_link_to_group(&comp->dev.kobj,
+					      "connections",
+					      &conn->dest_comp->dev.kobj, outs);
+		if (ret)
+			return ret;
+
+		ret = sysfs_add_link_to_group(&conn->dest_comp->dev.kobj,
+					      "connections",
+					      &comp->dev.kobj, ins);
+		if (ret) {
+			sysfs_remove_link_from_group(&comp->dev.kobj,
+						     "connections", outs);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static void gtrace_remove_links(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	char buf[32];
+	int i;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (!conn->dest_comp)
+			continue;
+
+		snprintf(buf, sizeof(buf), "out:%d", conn->src_port);
+		sysfs_remove_link_from_group(&comp->dev.kobj,
+					     "connections", buf);
+
+		snprintf(buf, sizeof(buf), "in:%d", conn->dest_port);
+		sysfs_remove_link_from_group(&conn->dest_comp->dev.kobj,
+					     "connections", buf);
+	}
+}
+
+int gtrace_sysfs_add(struct gtrace_component *comp)
+{
+	const struct attribute_group *grp;
+	int ret;
+
+	if (gtrace_is_sink(comp->pdata) || comp->pdata->is_linksink)
+		grp = &gtrace_sink_group;
+	else if (gtrace_is_source(comp->pdata))
+		grp = &gtrace_source_group;
+	else
+		grp = &gtrace_link_group;
+
+	ret = sysfs_create_group(&comp->dev.kobj, grp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to create sysfs group: %d\n", ret);
+		goto out;
+	}
+
+	ret = sysfs_create_group(&comp->dev.kobj, &gtrace_conns_group);
+	if (ret) {
+		dev_err(&comp->dev, "failed to create connections sysfs group: %d\n", ret);
+		goto out_remove_group;
+	}
+
+	ret = gtrace_make_links(comp);
+	if (ret) {
+		dev_err(&comp->dev, "failed to make sysfs links: %d\n", ret);
+		goto out_remove_conns;
+	}
+
+	if (comp->pdata->groups) {
+		ret = device_add_groups(&comp->dev, comp->pdata->groups);
+		if (ret) {
+			dev_err(&comp->dev, "failed to create sysfs component groups: %d\n", ret);
+			goto out_remove_links;
+		}
+	}
+
+	return ret;
+
+out_remove_links:
+	gtrace_remove_links(comp);
+out_remove_conns:
+	sysfs_remove_group(&comp->dev.kobj, &gtrace_conns_group);
+out_remove_group:
+	sysfs_remove_group(&comp->dev.kobj, grp);
+out:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_sysfs_add);
+
+void gtrace_sysfs_remove(struct gtrace_component *comp)
+{
+	mutex_lock(&gtrace_mutex);
+	if (comp->path) {
+		gtrace_path_stop(comp->path);
+		gtrace_destroy_path(comp->path);
+		comp->path = NULL;
+	}
+	mutex_unlock(&gtrace_mutex);
+
+	if (comp->pdata->groups)
+		device_remove_groups(&comp->dev, comp->pdata->groups);
+	gtrace_remove_links(comp);
+	sysfs_remove_group(&comp->dev.kobj, &gtrace_conns_group);
+
+	if (gtrace_is_sink(comp->pdata) || comp->pdata->is_linksink)
+		sysfs_remove_group(&comp->dev.kobj, &gtrace_sink_group);
+	else if (gtrace_is_source(comp->pdata))
+		sysfs_remove_group(&comp->dev.kobj, &gtrace_source_group);
+	else
+		sysfs_remove_group(&comp->dev.kobj, &gtrace_link_group);
+}
+EXPORT_SYMBOL_GPL(gtrace_sysfs_remove);
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index da8ba3779193..9945303d2713 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -14,6 +14,8 @@
 #include <linux/property.h>
 #include <linux/types.h>
 
+extern struct mutex gtrace_mutex;
+
 /*
  * Global list of trace component types across all architectures. Each backend
  * uses the entries relevant to it.
@@ -29,6 +31,8 @@ enum gtrace_component_type {
 
 /* Supported usage modes for trace components */
 enum gtrace_component_mode {
+	GTRACE_COMPONENT_MODE_DISABLED,
+	GTRACE_COMPONENT_MODE_SYSFS,
 	GTRACE_COMPONENT_MODE_PERF,
 	GTRACE_COMPONENT_MODE_MAX
 };
@@ -97,6 +101,9 @@ struct gtrace_hw_ops {
  * @inconns:     Array of pointers to input connections.
  * @nr_outconns: Number of output connections.
  * @outconns:    Array of pointers to output connections.
+ * @is_linksink: A component that can serve as both a link and a sink.
+ * @groups:      operations specific to this component. These will end up in
+ *               the component's sysfs sub-directory.
  */
 struct gtrace_platform_data {
 	struct device *dev;
@@ -138,6 +145,13 @@ struct gtrace_platform_data {
 	 */
 	unsigned int nr_outconns;
 	struct gtrace_connection **outconns;
+
+	/*
+	 * True for components like ETF that can operate as both a link and
+	 * a sink.
+	 */
+	bool is_linksink;
+	const struct attribute_group **groups;
 };
 
 static inline u32 gtrace_read32(struct gtrace_platform_data *pdata, u32 offset)
@@ -156,6 +170,28 @@ static inline u32 gtrace_relaxed_read32(struct gtrace_platform_data *pdata, u32
 	return pdata->read(pdata, offset, true);
 }
 
+static inline u64 gtrace_read_pair(struct gtrace_platform_data *pdata,
+				   u32 lo_offset, u32 hi_offset)
+{
+	if (likely(pdata->io_mem))
+		return readl(pdata->base + lo_offset) |
+			((u64)readl(pdata->base + hi_offset) << 32);
+
+	return pdata->read(pdata, lo_offset, false) |
+		((u64)pdata->read(pdata, hi_offset, false) << 32);
+}
+
+static inline u64 gtrace_relaxed_read_pair(struct gtrace_platform_data *pdata,
+					   u32 lo_offset, u32 hi_offset)
+{
+	if (likely(pdata->io_mem))
+		return readl_relaxed(pdata->base + lo_offset) |
+			((u64)readl_relaxed(pdata->base + hi_offset) << 32);
+
+	return pdata->read(pdata, lo_offset, true) |
+		((u64)pdata->read(pdata, hi_offset, true) << 32);
+}
+
 static inline void gtrace_write32(struct gtrace_platform_data *pdata, u32 val, u32 offset)
 {
 	if (likely(pdata->io_mem))
@@ -173,6 +209,30 @@ static inline void gtrace_relaxed_write32(struct gtrace_platform_data *pdata,
 		pdata->write(pdata, val, offset, true);
 }
 
+static inline void gtrace_relaxed_write_pair(struct gtrace_platform_data *pdata,
+					     u64 val, u32 lo_offset, u32 hi_offset)
+{
+	if (likely(pdata->io_mem)) {
+		writel_relaxed((u32)val, pdata->base + lo_offset);
+		writel_relaxed((u32)(val >> 32), pdata->base + hi_offset);
+	} else {
+		pdata->write(pdata, (u32)val, lo_offset, true);
+		pdata->write(pdata, (u32)(val >> 32), hi_offset, true);
+	}
+}
+
+static inline void gtrace_write_pair(struct gtrace_platform_data *pdata,
+				     u64 val, u32 lo_offset, u32 hi_offset)
+{
+	if (likely(pdata->io_mem)) {
+		writel((u32)val, pdata->base + lo_offset);
+		writel((u32)(val >> 32), pdata->base + hi_offset);
+	} else {
+		pdata->write(pdata, (u32)val, lo_offset, false);
+		pdata->write(pdata, (u32)(val >> 32), hi_offset, false);
+	}
+}
+
 static inline bool gtrace_is_source(struct gtrace_platform_data *pdata)
 {
 	return !pdata->nr_inconns ? true : false;
@@ -200,11 +260,18 @@ struct gtrace_component_id {
  * @pdata:    Pointer to underlying platform data.
  * @id:       Details to match the component.
  * @dev:      Device instance.
+ * @path:     Used for sysfs sources to get path, and for ETF link/sink detection.
+ * @sysfs_sink_activated: When set, this sink is preferred over other
+ *                        reachable sinks when a source walks forward
+ *                        looking for a sysfs trace target (e.g. stop
+ *                        at ETF instead of ETR).
  */
 struct gtrace_component {
 	struct gtrace_platform_data *pdata;
 	struct gtrace_component_id id;
 	struct device dev;
+	struct gtrace_path *path;
+	bool sysfs_sink_activated;
 };
 
 #define to_gtrace_component(__dev)	container_of_const(__dev, struct gtrace_component, dev)
@@ -329,4 +396,41 @@ static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
 int gtrace_perf_init(void);
 void gtrace_perf_exit(void);
 
+enum gtrace_component_mode gtrace_get_mode(struct gtrace_component *comp);
+
+struct gtrace_pair_attribute {
+	struct device_attribute attr;
+	u32 lo_off;
+	u32 hi_off;
+};
+
+struct gtrace_off_attribute {
+	struct device_attribute attr;
+	u32 off;
+};
+
+ssize_t gtrace_simple_show32(struct device *dev, struct device_attribute *attr, char *buf);
+ssize_t gtrace_simple_show_pair(struct device *dev, struct device_attribute *attr, char *buf);
+
+#define gtrace_simple_reg32(name, offset)				\
+	(&((struct gtrace_off_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, gtrace_simple_show32, NULL),		\
+		offset							\
+	   }								\
+	})[0].attr.attr)
+
+#define gtrace_simple_reg64(name, lo_off, hi_off)			\
+	(&((struct gtrace_pair_attribute[]) {				\
+	   {								\
+		__ATTR(name, 0444, gtrace_simple_show_pair, NULL),	\
+		lo_off, hi_off						\
+	   }								\
+	})[0].attr.attr)
+
+int gtrace_enable_sysfs(struct gtrace_component *comp);
+int gtrace_disable_sysfs(struct gtrace_component *comp);
+int gtrace_sysfs_add(struct gtrace_component *comp);
+void gtrace_sysfs_remove(struct gtrace_component *comp);
+
 #endif /* __LINUX_GTRACE_H__ */
-- 
2.34.1

