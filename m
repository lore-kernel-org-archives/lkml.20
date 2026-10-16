Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DADD47535D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147608; cv=none; b=k2G8N3bArz4eX+0N7mXqMqTPMdnsLHEGGbmxBB++mymdt60vo/TK29YNdpy6qPUd/HB12A2n+EbATaoXGsTzl8Az6p/GzbwJ/2G/csX1pfz5nqBWs2uc2+nmIHlH8z5MxMKy5cOtf0M+74WI6/sxl0xuPJ9MGKsgipIi3dhrD6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147608; c=relaxed/simple;
	bh=0JAyeJDHeWZQzQZepWRqQWO7BIFM3aZJjRNy4D02kEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpfZEM+8OI6vhV9oCnEExw4yeu7cbmeObqIWx7r5J8Bn33BlOEq2PgTogCwB7+MY7P7HTjqyREA4Z8EcIXeEx9fqo6Xz1h1XHgY2F0YYEKCtad5DF/Gb9HufqNXpHqMGs4aisrnCqeJNhdI5KS97ZB/uOVtU0k60mXWQhcCl1eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uAaaz+5O; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uAaaz+5O"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so27430075e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147604; x=1792752404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6SNUR5udOzN8HMLcCIaxFObb70KXjg7FX5VAT1iGes=;
        b=uAaaz+5O013IExVh51f5rnHtHRd4LwucAX7Eg5b7ack6p9DwcTk1umczsNKgJfmnf5
         rlOPIEF+r4oBV8kJW1sVRxWwsdfzm9mH+zNlbpZucLYRQfBZZBlNgil4aHr9WL2RUbkS
         nu+r4IRmF8ySZpjfsKICLjUmXtqti4nYEwNGDCISyidgPEbes2oUnlekgc4jYfR4Sdh/
         iBGnIA3l2cnQJ2GUDce8sSaT7oz/LwSY6x/kqL45+BFKFf3g5QBx4vrjUZ7gRNiG8AaA
         YgjSR4WEyZUoDU6tuiq5j2Q+FZrM8nCM+yeIvvnq2Fts9J+ptdEBPLoKl5OulImVq/e6
         avig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147604; x=1792752404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6SNUR5udOzN8HMLcCIaxFObb70KXjg7FX5VAT1iGes=;
        b=sxelZnm79rDoQCAcPWH9mLT1qXd9KcOCeJgj90Lh37EUfmGkTDNTRJeI1pvR6JnIDR
         qt09D9T/X+N9YhfW4QwkTTJoNj2b8OKumk0Ous1r6aG+He9OKks0QE40N+/OgDnrvE/g
         BdX2bzEYW9CBFddHoXjuBzUuPfvZpN2o7TCx7GoEPRnybwRBgx05lyVb3UwlWcht2i43
         m/q13hXHVgOuksHKLWa6Nj7fTdukWIR1tpN+kpnBJGXq3FL7Jq4f9/RwCk1xiBaoCnPb
         yfw+YcVMwhB/i+QRgXTfqaYIMxS9vNOGxipfcS+i30aWjSgPx55/uXYe0toDIwTgu9TU
         EsxA==
X-Forwarded-Encrypted: i=1; AKwUvBxwMSkZFdw+fdCAgLcK+GsOn6IsM/06fT+006vkOpZVRLrTubM2ZRFgLFCe0cvcC2kqiCgrcHrWvr0qXVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaDFHZyoKAI0UrVgwo64YJxhY9WX6am18gzGiDqz+NFnC3GEQI
	Ni8o4YljPte3EojrVTAaNq94NTGIqHrXyYORj6KSVUPjsaKIZhIMXY+7lymd+x7LKMY=
X-Gm-Gg: AYBFou3nbrvbwwAtlAOpqWRG8SxqZh/k00XiPI/z3g5Yx4XlQp3iODN2kzi/cARVbW7
	0moo7UHmybhWXPzcZBp0udtRRCcROpUJS1g8x+qyPNjei8W2q2TmNax2eKDmD+vvTRNrLmyp24o
	prmHFT01MHSpAL7hi639V4G+aZEmGVH7UJ2s3lj0hvRX/aiqleo3k3be4GiBnyW86i+/avIhh2E
	lkdl+DlO9v3qkuCfIyG4nMpfl03Llqp7GNn7GbdmXizEA5fSt6x6/EHhEl97Pure7pfctBBdD93
	o6qF27/2OaPC/7lsAl4s/gK08E9mZNSJaED1haI2wEDMAc3pMnig50474wYw+ghDFcuD/V79xY+
	vkOme0DYWUapBRC8zUgbd0bf7Ul4XWbd6ddgeLt7tju3ddAqqq0eypuZOw8ANW6njM6z+wZUFsA
	Jf5gVrGc688lrWXXv5B7mAej4uafbt3mtpGxanvCxqRAPSQO/F5T1Pxn0xvEXKahOPKgNUJZyCG
	Q==
X-Received: by 2002:a05:600c:6088:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a1d456dfe2mr3118645e9.7.1792147604136;
        Fri, 16 Oct 2026 03:46:44 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:13 +0100
Subject: [PATCH v4 03/10] coresight: etm-perf: Serialize AUX topology
 access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-3-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2

Perf AUX setup walks the CoreSight connections to select a sink, build
paths and acquire references to the devices and their helpers. Unlike
sysfs tracing, it does not hold coresight_mutex. Driver registration and
removal can therefore change or free connections while setup walks them.
Adding a CTI helper can also reallocate an existing device's output
connection array even when the device is already referenced by a path.

Hold coresight_mutex from sink selection through buffer allocation.
The allocation must also be protected because ETR buffers can look up a
connected CATU. Release the mutex before calling etm_free_aux() on error.

AUX cleanup walks helper connections again when releasing paths. Add a
locking coresight_release_path() wrapper and use
coresight_release_path_locked() for sysfs and setup error paths which
already hold the mutex. Leave sink buffer freeing and configuration
deactivation outside the mutex. AUX cleanup runs in sleepable context
following the preceding workqueue removal.

Add lockdep assertions to path construction and release to document the
existing sysfs locking contract and enforce it for perf as well. This
protects sleepable AUX topology walks; connection reads in atomic path
enable/disable callbacks need a separate solution.

Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 20 ++++++++++++++++----
 drivers/hwtracing/coresight/coresight-etm-perf.c | 11 +++++++----
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 drivers/hwtracing/coresight/coresight-sysfs.c    |  4 ++--
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..c05d657cde73 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -30,8 +30,8 @@
 #include "coresight-trace-id.h"
 
 /*
- * Mutex used to lock all sysfs enable and disable actions and loading and
- * unloading devices by the Coresight core.
+ * Mutex used to serialize device registration and removal, sysfs enable and
+ * disable actions, and perf AUX setup and path release.
  */
 DEFINE_MUTEX(coresight_mutex);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
@@ -910,6 +910,8 @@ static void coresight_drop_device(struct coresight_device *csdev)
 {
 	int i;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	coresight_put_ref(csdev);
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		struct coresight_device *child;
@@ -1046,6 +1048,8 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 	struct coresight_path *path;
 	int rc;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	if (!sink)
 		return ERR_PTR(-EINVAL);
 
@@ -1065,17 +1069,19 @@ struct coresight_path *coresight_build_path(struct coresight_device *source,
 }
 
 /**
- * coresight_release_path - release a previously built path.
+ * coresight_release_path_locked - release a path with coresight_mutex held.
  * @path:	the path to release.
  *
  * Go through all the elements of a path and 1) removed it from the list and
  * 2) free the memory allocated for each node.
  */
-void coresight_release_path(struct coresight_path *path)
+void coresight_release_path_locked(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 	struct coresight_node *nd, *next;
 
+	lockdep_assert_held(&coresight_mutex);
+
 	list_for_each_entry_safe(nd, next, &path->path_list, link) {
 		csdev = nd->csdev;
 
@@ -1087,6 +1093,12 @@ void coresight_release_path(struct coresight_path *path)
 	kfree(path);
 }
 
+void coresight_release_path(struct coresight_path *path)
+{
+	guard(mutex)(&coresight_mutex);
+	coresight_release_path_locked(path);
+}
+
 /* return true if the device is a suitable type for a default sink */
 static bool coresight_is_def_sink_type(struct coresight_device *csdev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 2323a68584d4..faec4c7bb83d 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -402,7 +402,7 @@ etm_event_build_path(struct perf_event *event, int cpu,
 	/* ensure we can allocate a trace ID for this CPU */
 	ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
 	if (ret) {
-		coresight_release_path(path);
+		coresight_release_path_locked(path);
 		path = NULL;
 		goto out;
 	}
@@ -428,6 +428,9 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!event_data)
 		return NULL;
 
+	/* Protect sink selection, path construction and buffer allocation. */
+	mutex_lock(&coresight_mutex);
+
 	/* First get the selected sink from user space. */
 	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
 	if (sink_hash)
@@ -498,13 +501,13 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	if (!event_data->snk_config)
 		goto err;
 
-out:
+	mutex_unlock(&coresight_mutex);
 	return event_data;
 
 err:
+	mutex_unlock(&coresight_mutex);
 	etm_free_aux(event_data);
-	event_data = NULL;
-	goto out;
+	return NULL;
 }
 
 static int etm_event_resume(struct coresight_path *path)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..edec5a7d2be3 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -143,6 +143,7 @@ coresight_find_default_sink(struct coresight_device *csdev);
 struct coresight_path *coresight_build_path(struct coresight_device *csdev,
 					    struct coresight_device *sink);
 void coresight_release_path(struct coresight_path *path);
+void coresight_release_path_locked(struct coresight_path *path);
 int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
 void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
 int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 75000fe64fda..5dd4e9b0426e 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -230,7 +230,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	coresight_disable_path(path);
 
 err_path:
-	coresight_release_path(path);
+	coresight_release_path_locked(path);
 	goto out;
 }
 EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
@@ -256,7 +256,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 		goto out;
 
 	coresight_disable_path(path);
-	coresight_release_path(path);
+	coresight_release_path_locked(path);
 
 out:
 	mutex_unlock(&coresight_mutex);

-- 
2.43.0

