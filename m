Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E14756CD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147609; cv=none; b=mUMTpJxuox+Ck4V51C5h1cyYtqfY3jZDecPq3ze1Z6ZMxxdI7v63ZcUlX0NbMyl+LenebREFRypcjQMkMhqhGYoPtqUbgryKA+E9BpL6/RMenME03PwP9mPTZzRxV0udYl86VYeQ/HEBmuQAR9F2Wx0aF0uCy2zbM8/nkd+ev40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147609; c=relaxed/simple;
	bh=wKhzhYX6hS4Wi56TQ3y3x5J4ndL0TrTsKaDlVVdqu1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLiwh3GxoBHFkb5K+ATWHlcWduFytGc51YLyRgRGQqiPruSwyWtPZE4mUmuxIRVmKSbTLjwGmDuAzVEQ8apF9tZyFcW+GMBpmh5xgEZehaDmQHkdkoKKQMOxkkyPB9oiLvegVAgIZl566sNXEf3PQbmgP0dB35XzpvB64aoPDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQ45KpPk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQ45KpPk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso28716485e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147605; x=1792752405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTf2dyjD3kUgeu76x/83E5vQe2hucK0qQ9DL5CxdIj0=;
        b=cQ45KpPkaGq9CpTJCBKS9VbmU0sAwP6BzuNqJ2069s4DAgdfPS54dDWu7s3gWWno+P
         hxeAUln1RPpBr5XzM/yVpsGACT91a7M6lTX0EhDI5+KEWhDG2RNficbZmTYfQnj80hMO
         xkqa6qSu9LvXsNBzNJRhSBGp7h0X362NhbUd2Mi6/u3Hac2nb5NcjpyiSnv1MB+425Bn
         wKuWmGOo0eJdlLCSkbU5/0lGG4G1ZmFN4iHqTG1r+ur9SlF1BCrm7Ecxdo3LT5RDIZWg
         6DSGrIEm0gbQE+vIC6MHQriT/XZxjmpyDLRF9xbbYDvzqaGZ7fkHWfvQQGfzBuB7qrYE
         pqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147605; x=1792752405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTf2dyjD3kUgeu76x/83E5vQe2hucK0qQ9DL5CxdIj0=;
        b=Fcpnqjm6aXvNxFsZjMaEK7imFc7/WlygA4alPMP5cDbEKvq1Cag6U2v5lK5I+tH2ZK
         DOG+ZPlI6XNQZiQfT4a60eF+qUALgnPivUfa/yfETiV+bO34JBHIlscM6vgSgEjm13vb
         IjXz0aNnh6Oi/JXrBQAOpeDJPRTTrHeAePp/sKQXKeOuo8Q1N/gbciVP89UPJrMSHK5s
         a4eWsLCqDFv+5984nwRjjIvpE6WpfdQEu7pB8S9/jbK6ZcH4CSNaFfu1Ay4I77y2yviW
         GB9Ul9KR6C5XUF6qfaMBTgUmZhGvKjSGpcoP3uztjB11F+hFDRhN/61KjYnLBd0/X+vf
         ZUOg==
X-Forwarded-Encrypted: i=1; AKwUvBy5u5pgPfgRMNJEJtzr83Wi6HPoClEFAy8kFnruL6CdZj/Uno6FrJ10RSRI72g5jSsWjm8VOUCX5pnUgqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlTCVatBFPWxnSlQ2/EiX5Op+odNJi5fh3iAewsSeyfCPR01Fy
	lcDRUsM4gTXbpRV8A/y3WZxPvYuOQZNjTHZJa5x/3k4pTeqrRjQ8Henqex/AZFpbJqnmj/dpQwg
	u3wIq784=
X-Gm-Gg: AYBFou0zUp706FBgm5+j4ZlVQMs9SzRrmeo6oPbAFiQK/3pKDC49zMXT4MtsbmW6/a/
	zO+8GqUZpXiZy3nwmoXFYwOkdmSgTSBCHiqsiMaSbSE3svAopZgxNQCbsQatHWBTAQF+OKLotsh
	TibeIhP59PHtDcT5CSdCyd4v/RdTx7ftIdqnDLEGdXwaELOsn6U+N8c6DERIy+NAUrNOQawbtZ9
	lOf2Ho+GHNoaMgq66Hxfqqld2+dxb6s4MWJ70U4eO4vYWCPO/egF0nssr58gzjtm/sdPIgrtpR0
	x2bnxNDH/0hEZd92DOhiM7UFxoTlXVyo5j582akw9Fadafv6FI/ilX8dYAvLGtAVZfxxtU74PiN
	ETi0iia7as02oXbS9zCJPPoc/O3SfrVCs33J8DN92uQ6rYtEtx3B+j88WWjq0BQ1jMHCD1L1Zj2
	L2zGil8pV7t8XL/NH1jPtItlIc3KhGjH3yytDaAZY9GgstH0OUmrYnmMGqCzfjba0zwYoamOazZ
	A==
X-Received: by 2002:a05:600c:a016:b0:4a1:a44d:1d5 with SMTP id 5b1f17b1804b1-4a1a44d0221mr286210265e9.9.1792147605311;
        Fri, 16 Oct 2026 03:46:45 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:14 +0100
Subject: [PATCH v4 04/10] coresight: etm-perf: Reject event if building
 path fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-4-dedf961aca0e@linaro.org>
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

etm_event_build_path() silently skips error cases to support opening
cpu=-1 events on all CPUs when a system might not have reachable sinks
or ETMs for every CPU. In the next commit we want to reject the event
if invalid sharing on any sink is detected, so propagate errors.

This means that things like failed memory allocations when building the
path and invalid aux pause options now reject the event which is
probably an improvement.

Keep the silent skips for things that make sense like missing ETMs and
sinks.

Previously, _coresight_build_path() used -ENODEV both when no route to
the sink existed and when coresight_grab_device() could not acquire a
device or helper on a found route. Return -ENOENT exclusively for the
unreachable case, and retain -ENODEV for device acquisition failures,
such as a missing driver or failure to take a module reference.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 22 ++++++---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 61 +++++++++++++-----------
 2 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c05d657cde73..a635c51c25ac 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -980,6 +980,9 @@ int coresight_path_assign_trace_id(struct coresight_path *path,
  * From there the sink is added to the list along with all the devices that led
  * to that point - the end result is a list from source to sink. In that list
  * the source is the first device and the sink the last one.
+ *
+ * Return: 0 on success, -ENOENT if the sink is unreachable, or another error
+ * if path construction fails.
  */
 static int _coresight_build_path(struct coresight_device *csdev,
 				 struct coresight_device *source,
@@ -996,10 +999,10 @@ static int _coresight_build_path(struct coresight_device *csdev,
 
 	if (coresight_is_percpu_source(csdev) && coresight_is_percpu_sink(sink) &&
 	    sink == per_cpu(csdev_sink, csdev->cpu)) {
-		if (_coresight_build_path(sink, source, sink, path) == 0) {
-			found = true;
-			goto out;
-		}
+		ret = _coresight_build_path(sink, source, sink, path);
+		if (ret)
+			return ret;
+		goto out;
 	}
 
 	/* Not a sink - recursively explore each port found on this element */
@@ -1011,15 +1014,20 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		if (coresight_blocks_source(source, csdev->pdata->out_conns[i]))
 			continue;
 
-		if (child_dev &&
-		    _coresight_build_path(child_dev, source, sink, path) == 0) {
+		if (!child_dev)
+			continue;
+
+		ret = _coresight_build_path(child_dev, source, sink, path);
+		if (!ret) {
 			found = true;
 			break;
 		}
+		if (ret != -ENOENT)
+			return ret;
 	}
 
 	if (!found)
-		return -ENODEV;
+		return -ENOENT;
 
 out:
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index faec4c7bb83d..a9adf1cca7a8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -334,32 +334,30 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
 	return path;
 }
 
-static struct coresight_path *
-etm_event_build_path(struct perf_event *event, int cpu,
-		     struct coresight_device *user_sink,
-		     struct coresight_device *match_sink)
+static int etm_event_build_path(struct perf_event *event, int cpu,
+				struct coresight_device *user_sink,
+				struct coresight_device *match_sink,
+				struct coresight_path **path)
 {
-	struct coresight_path *path = NULL;
 	struct coresight_device *source, *sink;
-	int ret;
+	int ret = 0;
 
+	*path = NULL;
 	source = coresight_get_percpu_source_ref(cpu);
 
-	/*
-	 * If there is no ETM associated with this CPU or ever we try to trace
-	 * on this CPU, we handle it accordingly.
-	 */
+	/* Silently skip CPUs without a loaded ETM. */
 	if (!source)
-		return NULL;
+		return 0;
 
 	/*
 	 * If AUX pause feature is enabled but the ETM driver does not
-	 * support the operations, skip for this source.
+	 * support the operations, reject the whole event.
 	 */
 	if (event->attr.aux_start_paused &&
 	    (!source_ops(source)->pause_perf ||
 	     !source_ops(source)->resume_perf)) {
 		dev_err_once(&source->dev, "AUX pause is not supported.\n");
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -380,30 +378,34 @@ etm_event_build_path(struct perf_event *event, int cpu,
 		 * trace on a CPU if the sink is not compatible.
 		 */
 
-		/* Find the default sink for this ETM */
+		/* Silently skip ETMs with no reachable sink loaded */
 		sink = coresight_find_default_sink(source);
 		if (!sink)
 			goto out;
 
-		/* Check if this sink compatible with the last sink */
+		/* Silently skip sinks incompatible with the last sink. */
 		if (match_sink && !sinks_compatible(match_sink, sink))
 			goto out;
 	}
 
 	/*
-	 * Building a path doesn't enable it, it simply builds a
-	 * list of devices from source to sink that can be
-	 * referenced later when the path is actually needed.
+	 * Build path, but don't enable. Skip CPUs that cannot reach the sink.
+	 * Reject the whole event on other path construction errors.
 	 */
-	path = coresight_build_path(source, sink);
-	if (IS_ERR(path))
+	*path = coresight_build_path(source, sink);
+	if (IS_ERR(*path)) {
+		ret = PTR_ERR(*path);
+		if (ret == -ENOENT)
+			ret = 0;
+		*path = NULL;
 		goto out;
+	}
 
-	/* ensure we can allocate a trace ID for this CPU */
-	ret = coresight_path_assign_trace_id(path, CS_MODE_PERF);
+	/* Reject whole event if we can't allocate a trace ID for this CPU */
+	ret = coresight_path_assign_trace_id(*path, CS_MODE_PERF);
 	if (ret) {
-		coresight_release_path_locked(path);
-		path = NULL;
+		coresight_release_path_locked(*path);
+		*path = NULL;
 		goto out;
 	}
 
@@ -411,7 +413,7 @@ etm_event_build_path(struct perf_event *event, int cpu,
 
 out:
 	coresight_put_percpu_source_ref(source);
-	return IS_ERR_OR_NULL(path) ? NULL : path;
+	return ret;
 }
 
 static void *etm_setup_aux(struct perf_event *event, void **pages,
@@ -448,15 +450,16 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 
 	/*
 	 * Setup the path for each CPU in a trace session. We try to build
-	 * trace path for each CPU in the mask. If we don't find an ETM
-	 * for the CPU or fail to build a path, we clear the CPU from the
-	 * mask and continue with the rest. If ever we try to trace on those
-	 * CPUs, we can handle it and fail the session.
+	 * trace path for each CPU in the mask. Skip CPUs without an ETM, without
+	 * a compatible default sink, or unable to reach the selected sink by
+	 * clearing them from the mask. Other errors reject the whole event.
 	 */
 	for_each_cpu(cpu, mask) {
 		struct coresight_path *path;
 
-		path = etm_event_build_path(event, cpu, user_sink, sink);
+		if (etm_event_build_path(event, cpu, user_sink, sink, &path))
+			goto err;
+
 		if (!path) {
 			/*
 			 * Failed to create a path for the CPU, clear it from

-- 
2.43.0

