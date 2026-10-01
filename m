Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC1251B188
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864499; cv=none; b=EciyEqhx4grMCrPpkQ9Go5jnlT+LmRK9R05qogn6S1JGxnuC75FHNc55aqFYafyj3eD2MQuSMCO7OJvCTN1qwB3qBZl2dVwSN5AjN2YQLdslUdwSjH/g0FdTM4WCl4x5VsJmERNTho/FJ1sD7ik6CHVwDq9cEfkYJ6iAMCbr+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864499; c=relaxed/simple;
	bh=n0cgsO9T0aWAUHgU6i5/oUZCDpuLAw/MjEqJwe2CU2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lL+FBB75Rl8mDzqFAybBZtwDOW7iQcQn9jTmgVCXGLjfSCsWAPN7d5tC2/zciAZGFyzzAtdq+tXXa8okwYns3IaRgRBz0o3JRd8AomVOIAuWlq+Fibi3m/Q4Q0Jh0oajEEKbIzT4oBAhAUTg167x4rmCc24SpTnWMKwoUbrvFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AuxVfQzF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AuxVfQzF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso60251405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790864496; x=1791469296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/XzKic3mIkTxbK/Zld2/LgmkZ+m7jvrTtGlJe2zmg8=;
        b=AuxVfQzFFvCiAo8nv35+gbCN+jcwRReCKsdVNphD64gwx9GuA7yontWyaQCyGBZvCf
         PIA67Y2BFRFzuRof2UKQ4mpkJ8TX0m9xrCCb0R58YnpTi0RhInlbAVzNCw3a1HRB/ETX
         lqi8sIAWPhn8meEXZKYnUh5RRVqalqRhjudpavefwamWXVA5GXQRpC9JmE4m3M+nylSB
         MgZKzDtD8eEGgiszUODjCceOb4GTOTR+XxUqoQfa0MKDjl90SHr86yF14IS2q4CZY9uz
         WL9deHtfkuY3jxEqOZMSqxwnVVdpOZSapv0v4GCLN5yagtMIjAquXDru2BFniMnH+L44
         bVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864496; x=1791469296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/XzKic3mIkTxbK/Zld2/LgmkZ+m7jvrTtGlJe2zmg8=;
        b=jKO1MI2EIfY+WcCfKssq9Vho5mnxiN866p3WDoqja/4rdiX7LsBUJp/QtMcf/w8KQ3
         A5mgjOqJ4Xl9G/NtuqLwv6H/0/m3cez7QeDT9DiY5zT0RTXNKANmu8ROkrybImIeOO0z
         kPNUcacB3kb0fO+ZtwPzuXVDIsc+eqswVe5BjwEnLeApnFmVw3pwuP/4lf2C7qIpOoQA
         mlgTmXiZWoWwjrPA1I5aauJkAiV0LvyVnCnK+Tq/WQFvdncdoiOC6WF9ASG49ZV8kREt
         MKA8i7HDWwDGRmLxEQzE26PGY9mWv355wUe1QlxiLQhaBVoFM7zRmi1n2rxdwRKcb4cO
         fysQ==
X-Forwarded-Encrypted: i=1; AKwUvByNTYPWUVWeIA1XGRSRpOLlok0rYqW/UWqv6MYQsqZmOco4Gfass6cpj4Xp4MoVBavyNPitEysnxb0wUP0=@vger.kernel.org
X-Gm-Message-State: AFuF++mI5DA4l0WcNoFcC2fP33HyCz7NONV76O+WeiYO3RQBKiWbKo0v
	zG1LGBTlnHdCXIJvxHEfBuLEU2QUqKg2rbyn+8BkIbe3lK5m1e4aP+JlSZhmiYWYZUc=
X-Gm-Gg: AYBFou2OIWOi8eQzQAp4M179H7xMpaZG84y7A5UntVK7Ds46x2Dlm3UecxpxhFNBV4J
	atF6x2+FZC9HkuxbJGtKfAHeD4KpW6XbFa36QS1RKSORDLfPQ/gA3dwjJ2qVvsgCPgXvL7gwDm5
	RQVe/6qXQ8h+hysS/2eoWK3Tjqm7t050wqlBP5IWOtEl22yqT7TniwA0YOVF+IysDHIdd8jrlRY
	zde7lxnVqpNS4YYd+ngby7h8OFM2lgGGwWOPcfosYEbw8i3QL+mx/R4fXv950aew0CamjS4k7r9
	tybNT6vRZEeBTLHWjVhQ0wWO2tRjokqgBrsk0pMKd5KP8/2J5x8hpVbbJcsg0X8TNMCDl6J+za9
	0JUwM4IuCM+kkYbGwqpNIJja/CU/vQxcd/CHyfVunlKQ1kxT7UW1Ob3dS6TdfLQ9KAfavosUNKG
	9yLUURqrixJG76BUictq3zTbMxGB3HopUVJpvcN3gU9xFd+gioGVQBEiZ35u2+qAtKaqOig6ofq
	Q==
X-Received: by 2002:a05:600c:6206:b0:49f:eddb:bcb1 with SMTP id 5b1f17b1804b1-4a01b11cb33mr86968865e9.25.1790864495929;
        Thu, 01 Oct 2026 07:21:35 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f1c2sm34783975e9.2.2026.10.01.07.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:21:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 01 Oct 2026 15:21:16 +0100
Subject: [PATCH 2/2] coresight: Retry failed HW_ID writes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-james-cs-retry-hw_id-v1-2-4d45ab46cde7@linaro.org>
References: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
In-Reply-To: <20261001-james-cs-retry-hw_id-v1-0-4d45ab46cde7@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Don't set the aux_hwid_done bit when writes fail so that it can be
retried later if the ring buffer was full. Add a second attempt on stop,
which will always succeed if the stop's AUX output also has enough space
to be written. If there is no AUX record then there will be no decoding,
so the missing HW_ID isn't important.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 50 +++++++++++++++---------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..9238a12628fb 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -536,6 +536,31 @@ static int etm_event_resume(struct coresight_path *path)
 	return ret;
 }
 
+static void etm_output_hw_id(struct perf_event *event,
+			     struct etm_event_data *event_data,
+			     struct coresight_path *path,
+			     struct coresight_device *sink)
+{
+	int cpu = smp_processor_id();
+	u64 hw_id;
+
+	/*
+	 * output cpu / trace ID in perf record, once for the lifetime
+	 * of the event.
+	 */
+	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
+		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
+				CS_AUX_HW_ID_MAJOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
+				CS_AUX_HW_ID_MINOR_VERSION);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
+
+		if (!perf_report_aux_output_id(event, hw_id))
+			cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
+	}
+}
+
 static void etm_event_start(struct perf_event *event, int flags)
 {
 	int cpu = smp_processor_id();
@@ -544,7 +569,6 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *source, *sink;
 	struct coresight_path *path;
-	u64 hw_id;
 
 	if (flags & PERF_EF_RESUME) {
 		path = etm_event_get_ctxt_path(ctxt);
@@ -596,22 +620,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (coresight_enable_source(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
-	/*
-	 * output cpu / trace ID in perf record, once for the lifetime
-	 * of the event.
-	 */
-	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
-		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
-
-		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
-				CS_AUX_HW_ID_MAJOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
-				CS_AUX_HW_ID_MINOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
-
-		perf_report_aux_output_id(event, hw_id);
-	}
+	etm_output_hw_id(event, event_data, path, sink);
 
 out:
 	/* Tell the perf core the event is alive */
@@ -679,6 +688,7 @@ static void etm_event_pause(struct coresight_path *path,
 		if (!size)
 			return;
 
+		etm_output_hw_id(event, event_data, path, sink);
 		perf_aux_output_end(handle, size);
 		perf_aux_output_begin(handle, event);
 	} else {
@@ -769,10 +779,12 @@ static void etm_event_stop(struct perf_event *event, int mode)
 		 * But we should never get a non-zero size with
 		 * an invalid handle.
 		 */
-		if (READ_ONCE(handle->event))
+		if (READ_ONCE(handle->event)) {
+			etm_output_hw_id(event, event_data, path, sink);
 			perf_aux_output_end(handle, size);
-		else
+		} else {
 			WARN_ON(size);
+		}
 	}
 
 	/* Disabling the path make its elements available to other sessions */

-- 
2.43.0

