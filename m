Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB4846E01C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147618; cv=none; b=SHESuRhr4u/qk+F41GTmEVowQU6VTQJroiuXpE6Op3he0Mi7kCuIggQqulUWypirq1hx6cPcCPp6DUugUcOD9jOIhYFxqmnKPnICznPWQ9GsXgJwTEjoywKPG2lkvHig+Rt1V06shTgCkB2+xZ08q2SOioHekLaUvb4FfdjfQHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147618; c=relaxed/simple;
	bh=CeEJDvGcdVXWpZngpqYr3VtoXhPArAJt/TwUMGXjtqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4Z+LwOJuLSIoI3U6yI4KY5T639E81nm4wonr2+oOXBqBQnRIwi1X0VJxEVlVhPTioFbYdkzf9bJtS2q2xgmbZxBZDTyUC/0+TDWsZ+Y4w9fVaIrMCTjBAhWqoK2+knRAgMHtBBQ7EjZmkHi9+MncIpjkNWQtY9j3yKkUaT8syM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kopXmPzh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kopXmPzh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a17baef589so27132195e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147608; x=1792752408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5pbw+EjYsPXTQHFedZbkGufrex07JrCC4mJKBhxDf0=;
        b=kopXmPzhG+oMC3Pk+rDKJx74kn9FmlnyqHrb7kUsfGQ2R2007cAHkSnnxDsqhkuwD3
         DIg+o3CQbj2UJ6VqX2yKaE222HVK4u64xB5WoOwVmTZ4c2b3iUIB5WjAcCJZAIbKNtiK
         qCPVYxq3Z9TbCIOeP1QAF03X6dZvO35trIYTKv84V8w4CkseuyQAa9JmV0d4vagKUQJB
         54xCkyV2CGqZZyWQST8MQba99lNdPxV04lzOMcyRxw/adkCNQnhR799GkP9ihz+YgVvk
         PguZqptLhQxI0CJhPwVerIJF0R7I8wJS1ka8qJfajXnBV7a+lhvTrm0PxHuCODFs6Im2
         q9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147608; x=1792752408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5pbw+EjYsPXTQHFedZbkGufrex07JrCC4mJKBhxDf0=;
        b=T8r5so/A2ITFEJ8ZTYsfFBTBLEya7GQC/J6N/xFnZ9EaXxzpcaIQ20i3B2A2LG41FL
         Wnv3CO0zBCs5WfyhWkdXWb7BHeF/jIjrktSZ5jjRAbEZ7bVVkeifyKWJs8LeWq1Dcn/7
         AyhZ1+IVT1TTyFztFlhgHh6sRTQubDtLIsSz4XeVXKyKQCgK0JpnAWP8R48pcpJY3Km5
         0ZoS89xRtXD/mnh9YZ0+hVGeFxv3Iwe/pZoysAgAQvGOQ4C4EczAlMLwrxpCE8rnBj8I
         dwsVQDSSQLo5jvm84tEMwRne2Ucmi0Z7NRwxb+Csg8L3l308dFwstGXX4zvPAU31is1e
         RWpA==
X-Forwarded-Encrypted: i=1; AKwUvBzoFxCcBB/VFdE1+2IQMnDvCZ2w/V1nLaBWPNB/V0XX1EMBh1XuveoDUEyhy8U5QKfU3Pkz/UQOY6PNFp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNay3emsklbXDGMSmC92tTxJFPzExLAqIDWSloqLHGHMIt/E8x
	EKcocQxmUBkWY5ry72DsjtpiyFL9AsnyLM5F0hSBYdv52HpKkrof9mritrZjUbnDSOVwLSag0c3
	ieDve2Hs=
X-Gm-Gg: AYBFou37yfswVw2iNePvcmG9GTZ+XjnrGDJVXioRH692gqzZ7uq81/YR+I6SrqwxhEa
	GecGynfqtuvHrFPqlkC52PFBj2EPln8GfLoLvZrwpId5IuabDPV322yrBSAtUzLq3MttiFtRUo4
	XBJ4JJpy45x/aXDSCZUNVPsvyzhubherCiasd5O5YMT+DYybzeZZu73pFDBr6dHkQcNRWUJmi0C
	2yUs6p5ppKwzx9RSzjCZSfNBfCdmm212r9eP64SXpHTfJtSyjKNmy4XmYOocz/9ADai/Ylspc6A
	/jW2CsQYZLV6Q5KQi7/YwECSd5wboSq9sWIH7oieBR+xQUNfhdK4MKjXQmDQ2IAsLLv26GvBN+v
	WHCcfs3XltsCskjIJo02ZNi4d4B2UWECvJACEY7G9bYU59/HRmc61Hy/vd4M7oiuRQ7ipLfA9ty
	sN9FIxHObq0OX3DaLCgRlRNOb5HkR52wQuhdnPr2Yarwa26oGvzIIvMdmFtS8NO3Zptg3WG6Q+G
	A==
X-Received: by 2002:a05:600c:524a:b0:4a1:8824:c9ba with SMTP id 5b1f17b1804b1-4a18e49234fmr450919035e9.18.1792147606553;
        Fri, 16 Oct 2026 03:46:46 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:15 +0100
Subject: [PATCH v4 05/10] coresight: etm-perf: Prevent sink sharing at
 setup time
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-5-dedf961aca0e@linaro.org>
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

To simplify lower level code in individual sinks and make tracing more
deterministic, check for potential sharing at setup time. Sharing rules
are currently enforced after scheduling in the enable() callback, and
the user who was not allowed to trace silently drops trace. This isn't
ideal because there is no feedback and behaviour depends on scheduling
and the actions of other users. It seems to be have designed that way
because of a misunderstanding that multiple concurrent per-thread events
would be prevented by the perf core exclusive PMU rules, but they are
not.

This removes the use case that different users could successfully trace
together as long as they collaborate to ensure that their events aren't
scheduled concurrently, but in practice, all working use cases when
sinks are shared would be single user.  It also removes the use case
that one user could open multiple per-thread events, but this was
already broken and also not supported in Perf userspace decode. With
1:1 sink to ETRs, there is no change.

Sink sharing rules and ownership lifetimes are identical to the trace ID
map, so add owning PID into the ID map and re-use the same lock.
coresight_trace_id_perf_start() can then be made the place to gate
sharing and return -EBUSY when sharing rules prevent starting the
session.

Now that coresight_trace_id_perf_start() can fail, we might as well do
it before attempting to allocate traceIDs. This has the benefit of
making ID allocations deterministic during concurrent session activation
because another session that fails to claim the sink doesn't claim trace
IDs only to release them again and perturb the successful user.

Use the TGID of the mmap() caller to determine ownership.
event->owner may be NULL if the thread that did perf_event_open() has
exited, and using the thread group means that we now support sharing in
multithreaded use cases.

Walk the registered topology and save the single-source classification
when admitting the first session. Keep it until the last session ends,
and reject new sessions if the topology has gained sources while existing
sessions rely on private buffers.

Fixes: 880af782c6e8 ("coresight: tmc-etf: Add support for CPU-wide trace scenarios")
Fixes: 8d03cfd16a72 ("coresight: tmc-etr: Add support for CPU-wide trace scenarios")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 62 +++++++++++++++
 drivers/hwtracing/coresight/coresight-etm-perf.c | 41 ++++++----
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 drivers/hwtracing/coresight/coresight-trace-id.c | 97 +++++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-trace-id.h | 26 +++++--
 include/linux/coresight.h                        | 26 +++++--
 6 files changed, 217 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a635c51c25ac..fe64c509bf67 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -50,6 +50,68 @@ struct coresight_node {
 	struct list_head link;
 };
 
+static int coresight_add_upstream_node(struct list_head *nodes,
+				       struct coresight_device *csdev)
+{
+	struct coresight_node *node;
+
+	list_for_each_entry(node, nodes, link)
+		if (node->csdev == csdev)
+			return 0;
+
+	node = kmalloc_obj(*node);
+	if (!node)
+		return -ENOMEM;
+
+	node->csdev = csdev;
+	list_add_tail(&node->link, nodes);
+	return 0;
+}
+
+/* Count registered CPU sources, ignoring source filters. */
+int coresight_count_cpu_sources(struct coresight_device *csdev)
+{
+	struct coresight_node *node, *tmp;
+	LIST_HEAD(nodes);
+	int i, ret, count = 0;
+
+	lockdep_assert_held(&coresight_mutex);
+
+	/* Per-CPU sinks have an implicit connection to their source. */
+	if (coresight_is_percpu_sink(csdev))
+		return 1;
+
+	ret = coresight_add_upstream_node(&nodes, csdev);
+	if (ret)
+		return ret;
+
+	/* Retain visited devices to handle converging paths and cycles. */
+	list_for_each_entry(node, &nodes, link) {
+		csdev = node->csdev;
+		if (coresight_is_percpu_source(csdev)) {
+			count++;
+			continue;
+		}
+
+		for (i = 0; i < csdev->pdata->nr_inconns; i++) {
+			struct coresight_connection *conn = csdev->pdata->in_conns[i];
+
+			if (!conn)
+				continue;
+			ret = coresight_add_upstream_node(&nodes, conn->src_dev);
+			if (ret)
+				goto out;
+		}
+	}
+
+out:
+	list_for_each_entry_safe(node, tmp, &nodes, link) {
+		list_del(&node->link);
+		kfree(node);
+	}
+	return ret ? ret : count;
+}
+
 /*
  * When losing synchronisation a new barrier packet needs to be inserted at the
  * beginning of the data collected in a buffer.  That way the decoder knows that
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index a9adf1cca7a8..5261061e4dd4 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -240,7 +240,7 @@ static void etm_free_aux(void *data)
 			 * a refcount is used so that the last event to call
 			 * coresight_trace_id_perf_stop() frees all IDs.
 			 */
-			coresight_trace_id_perf_stop(&sink->perf_sink_id_map);
+			coresight_trace_id_perf_stop(sink);
 
 			coresight_release_path(*ppath);
 		}
@@ -337,6 +337,7 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
 static int etm_event_build_path(struct perf_event *event, int cpu,
 				struct coresight_device *user_sink,
 				struct coresight_device *match_sink,
+				struct etm_event_data *event_data,
 				struct coresight_path **path)
 {
 	struct coresight_device *source, *sink;
@@ -358,7 +359,7 @@ static int etm_event_build_path(struct perf_event *event, int cpu,
 	     !source_ops(source)->resume_perf)) {
 		dev_err_once(&source->dev, "AUX pause is not supported.\n");
 		ret = -EINVAL;
-		goto out;
+		goto out_src;
 	}
 
 	/* If sink has been specified by user, directly use it */
@@ -381,11 +382,11 @@ static int etm_event_build_path(struct perf_event *event, int cpu,
 		/* Silently skip ETMs with no reachable sink loaded */
 		sink = coresight_find_default_sink(source);
 		if (!sink)
-			goto out;
+			goto out_src;
 
 		/* Silently skip sinks incompatible with the last sink. */
 		if (match_sink && !sinks_compatible(match_sink, sink))
-			goto out;
+			goto out_src;
 	}
 
 	/*
@@ -398,20 +399,27 @@ static int etm_event_build_path(struct perf_event *event, int cpu,
 		if (ret == -ENOENT)
 			ret = 0;
 		*path = NULL;
-		goto out;
+		goto out_src;
 	}
 
+	ret = coresight_trace_id_perf_start(sink, event, event_data);
+	if (ret)
+		goto out_path;
+
 	/* Reject whole event if we can't allocate a trace ID for this CPU */
 	ret = coresight_path_assign_trace_id(*path, CS_MODE_PERF);
-	if (ret) {
-		coresight_release_path_locked(*path);
-		*path = NULL;
-		goto out;
-	}
+	if (ret)
+		goto out_trace_id_started;
 
-	coresight_trace_id_perf_start(&sink->perf_sink_id_map);
+	coresight_put_percpu_source_ref(source);
+	return 0;
 
-out:
+out_trace_id_started:
+	coresight_trace_id_perf_stop(sink);
+out_path:
+	coresight_release_path_locked(*path);
+	*path = NULL;
+out_src:
 	coresight_put_percpu_source_ref(source);
 	return ret;
 }
@@ -457,7 +465,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	for_each_cpu(cpu, mask) {
 		struct coresight_path *path;
 
-		if (etm_event_build_path(event, cpu, user_sink, sink, &path))
+		/*
+		 * Use event_data as the unique identifier for this event. Event
+		 * itself is not stable and there are some horrible edge cases
+		 * where it's freed and re-used while another event redirecting
+		 * to the same aux buffer keeps the sink allocation alive.
+		 */
+		if (etm_event_build_path(event, cpu, user_sink, sink,
+					 event_data, &path))
 			goto err;
 
 		if (!path) {
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index edec5a7d2be3..51313fe2cd0e 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -14,6 +14,7 @@
 
 extern struct mutex coresight_mutex;
 extern const struct device_type coresight_dev_type[];
+int coresight_count_cpu_sources(struct coresight_device *csdev);
 
 /*
  * Coresight management registers (0xf00-0xfcc)
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index 7ed337d54d3e..debc30d0de8f 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -7,9 +7,11 @@
 #include <linux/coresight-pmu.h>
 #include <linux/cpumask.h>
 #include <linux/kernel.h>
+#include <linux/sched/signal.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "coresight-priv.h"
 #include "coresight-trace-id.h"
 
 enum trace_id_flags {
@@ -128,14 +130,11 @@ static void coresight_trace_id_free(int id, struct coresight_trace_id_map *id_ma
  */
 static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map)
 {
-	unsigned long flags;
 	int cpu;
 
-	raw_spin_lock_irqsave(&id_map->lock, flags);
 	bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
 	for_each_possible_cpu(cpu)
 		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
-	raw_spin_unlock_irqrestore(&id_map->lock, flags);
 	DUMP_ID_MAP(id_map);
 }
 
@@ -284,17 +283,95 @@ void coresight_trace_id_put_system_id(int id)
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_put_system_id);
 
-void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map)
+int coresight_trace_id_perf_start(struct coresight_device *sink,
+				  struct perf_event *event,
+				  struct etm_event_data *event_data)
 {
-	atomic_inc(&id_map->perf_cs_etm_session_active);
-	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
+	struct coresight_perf_session_id *session = &sink->perf_sink_id_map.session;
+	struct coresight_trace_id_map *id_map = &sink->perf_sink_id_map;
+	bool migratable = event->cpu == -1;
+	int nr_sources;
+
+	/* The caller holds coresight_mutex through path building and admission. */
+	nr_sources = coresight_count_cpu_sources(sink);
+	if (nr_sources < 0)
+		return nr_sources;
+
+	guard(raw_spinlock)(&id_map->lock);
+
+	if (!session->refcount) {
+		session->single_source = nr_sources == 1;
+	} else if (session->single_source && nr_sources != 1) {
+		/* Existing sessions relied on this sink having only one source. */
+		return -EBUSY;
+	}
+
+	/*
+	 * In addition to the Perf core exclusive PMU rules, prevent disjointed
+	 * sessions when sinks may shared. The following restrictions simplify
+	 * ETR buffer management so we don't have to support
+	 * per-thread/migratable bounce buffers moving to other sinks while
+	 * still in use by other threads on the current sink. Not sharing
+	 * between migratable and non-migratable events also means that we can
+	 * assume a buffer is either always attached to a sink, or always
+	 * attached to an event.
+	 */
+	if (!session->single_source) {
+		/*
+		 * Use 'current' instead of event->owner because that's NULL if
+		 * a worker thread calls perf_event_open() and then exits before
+		 * mmap(). Also allow sink sharing between anyone in the thread
+		 * group to support multithreaded auxtrace mmap() calls.
+		 */
+		struct pid *this_pid = task_pid_type(current, PIDTYPE_TGID);
+
+		if (session->owner) {
+			/*
+			 * Prevent mixing event types per sink, regardless of
+			 * owner.
+			 */
+			if (!!session->migratable_event != migratable)
+				return -EBUSY;
+
+			/*
+			 * Limit migratable events to a single event per sink,
+			 * regardless of owner.
+			 */
+			if (migratable &&
+			    session->migratable_event != event_data)
+				return -EBUSY;
+
+			/* Share non migratable events between the same owner */
+			if (session->owner != this_pid)
+				return -EBUSY;
+		} else {
+			if (migratable)
+				session->migratable_event = event_data;
+			session->owner = get_pid(this_pid);
+		}
+	}
+
+	session->refcount++;
+	PERF_SESSION(session->refcount);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_perf_start);
 
-void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map)
+void coresight_trace_id_perf_stop(struct coresight_device *sink)
 {
-	if (!atomic_dec_return(&id_map->perf_cs_etm_session_active))
-		coresight_trace_id_release_all(id_map);
-	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
+	struct coresight_perf_session_id *session = &sink->perf_sink_id_map.session;
+	struct coresight_trace_id_map *id_map = &sink->perf_sink_id_map;
+	struct pid *old_pid = NULL;
+
+	scoped_guard(raw_spinlock, &id_map->lock) {
+		if (--session->refcount <= 0) {
+			coresight_trace_id_release_all(id_map);
+			old_pid = session->owner;
+			id_map->session = (struct coresight_perf_session_id) {};
+		}
+		PERF_SESSION(session->refcount);
+	}
+
+	put_pid(old_pid);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_perf_stop);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index db68e1ec56b6..cd592b0e9076 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -139,21 +139,31 @@ void coresight_trace_id_put_system_id(int id);
 /**
  * Notify the Trace ID allocator that a perf session is starting.
  *
- * Increase the perf session reference count - called by perf when setting up a
- * trace event.
+ * Assign 'current' as the owner of the trace ID map and increment the session
+ * refcount.
  *
- * Perf sessions never free trace IDs to ensure that the ID associated with a
- * CPU cannot change during their and other's concurrent sessions. Instead,
- * this refcount is used so that the last event to finish always frees all IDs.
+ * The caller must hold coresight_mutex while checking the registered topology
+ * and admitting the session. The first session saves whether the sink has only
+ * one CPU source, and subsequent sessions retain that classification.
+ *
+ * Return 0 on success, -EBUSY if sharing rules don't permit this task to share
+ * the map, or -ENOMEM if walking the topology fails.
+ *
+ * Note: Perf sessions never free trace IDs to ensure that the ID associated
+ * with a CPU cannot change during their and other's concurrent sessions.
+ * Instead, this refcount is used so that the last event to finish always frees
+ * all IDs.
  */
-void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map);
+int coresight_trace_id_perf_start(struct coresight_device *sink,
+				  struct perf_event *event,
+				  struct etm_event_data *event_data);
 
 /**
  * Notify the ID allocator that a perf session is stopping.
  *
  * Decrease the perf session reference count. If this causes the count to go to
- * zero, then all Trace IDs will be released.
+ * zero, then all Trace IDs and owner PID will be released.
  */
-void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map);
+void coresight_trace_id_perf_stop(struct coresight_device *sink);
 
 #endif /* _CORESIGHT_TRACE_ID_H */
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index edf2a2fc697c..e718580ea547 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -235,18 +235,34 @@ struct coresight_sysfs_link {
 /* architecturally we have 128 IDs some of which are reserved */
 #define CORESIGHT_TRACE_IDS_MAX 128
 
+/**
+ * Identification of the Perf owner of a trace ID map / sink
+ *
+ * @refcount:		Number of Perf sessions using this ID map.
+ * @single_source:	Sessions were admitted with only one upstream CPU source.
+ *			Kept unchanged until the last session releases the map.
+ * @owner:		PID that owns the active sessions.
+ * @migratable_event:	Unique pointer to identify the owning event if it's
+ *			migratable (event->cpu == -1).
+ */
+struct coresight_perf_session_id {
+	int refcount;
+	bool single_source;
+	struct pid *owner;
+	struct etm_event_data *migratable_event;
+};
+
 /**
  * Trace ID map.
  *
- * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
- *		Initialised so that the reserved IDs are permanently marked as
- *		in use.
- * @perf_cs_etm_session_active: Number of Perf sessions using this ID map.
+ * @used_ids:   Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
+ *              Initialised so that the reserved IDs are permanently marked as
+ *              in use.
  */
 struct coresight_trace_id_map {
 	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
 	atomic_t __percpu *cpu_map;
-	atomic_t perf_cs_etm_session_active;
+	struct coresight_perf_session_id session;
 	raw_spinlock_t lock;
 };
 

-- 
2.43.0

