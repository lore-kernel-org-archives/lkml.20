Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F231336E470
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147608; cv=none; b=iVYfzaXNkE1K2xu4Y1nVWGdWCNn+0mUfXoewVPuNhZhT8Ti6x2/1la3Lq9jIiUrpL185flRQBYD6AiUp4grry+OK9QCYHk8P2O3Cs+I4QsTZk0TLQKJlMgO0rpT0hWiBSoigq1NB19QbV/lu87TKFtemaTrf+MLi4yWj9yzyl4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147608; c=relaxed/simple;
	bh=01h0JUEUUGqxtWwv7NQuIj5gMnYBodQrUzNL2JWNecA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNhS4KNbUaNy3O2RauIm/Is6uh37xYisd/f14nBsQmVUiGpIzFjCNbn/VXoZ+Hnnn7haTYrQ0mSdAyfXadnowzoDmZMevb78Yvxh8vzKaDEoldcK+aDw4jwr4VuFipPCZ75fA3BnkCep5YWj6n19cMgMv4VhnyD9pBu+FojvjCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQWL6wiX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQWL6wiX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1185237f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147603; x=1792752403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCU7cJAIMxdxXXb/6ug/lUYU81eTYh4+NwDNWzudWtU=;
        b=bQWL6wiXq/47GGLnBHKRM0SH6DCb0luDdarQZpea+Dgg8XWJIml4zO6XsAmYnvI2LW
         O520Q8qDq1xybXSFSOD2vpmFzEnOlqpwh8Bnu7mJwbWqMDhiDTKXvdp5xBEmJ4fbL9bQ
         iocFrXjxnpzCvTg8r8HD4IYm1fmlDcebFcOwva71DFnNLgarSa+AGJZgCKtpZVDChGdz
         EY4jkR79jDziX7mriOwIgawMjRGMYiFFp6xPlPxu7vzEpD0kUxdB4tDqZTuLqe7VYBRx
         Sf6TqrYYH8N7EDLXLvt5fnx0DLL69GIGHjLsr4HOH3X9MnOCI4AATg84TIJwNRptNbj5
         jC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147603; x=1792752403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCU7cJAIMxdxXXb/6ug/lUYU81eTYh4+NwDNWzudWtU=;
        b=QYfmfIvEs/ns8GzqpvYoLy9MN4mdTWSLv4gT+PTb0U4UCsx7UIwdtydvgXXfPCK6Cz
         UsgwlCrixDVLHbHcdPptptw6YmvJXNmtE+iyN4jkLr5jD4RCjnpywwLG+JfXGOeSBlxZ
         NRMLGytnNqwAKF2nlSPFNUnexFvncM6Ys/l1WUssWo+QaAH5Hw+HtUaEiX9indu+qb2E
         jD8O/nyAB/kQ7JYs2EIox3TrVQtO3Upz0+2+ZXnX/oPJtAQCWMNOis4vBG4S1xGrKG3s
         93PbggwEmzj5IoqGy0Xy7/o5+zuqJa62mgd3hBQ2TL2efibsaViWfEhH6Sk8rWjXJCVX
         Tnww==
X-Forwarded-Encrypted: i=1; AKwUvBzHVXyhv3g4n+5PD8NOLq2Vd75UPLvkXKBERMju0Lmhmf0wGo4Bx9IM0WWjOsrKBAHzLF3nBuBgA/emHLA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLw8pirNkMoYhLvPkf3ZOQXQ+seNc93cx584xjcEhoVU2e25XLF
	MYxcNlPlq4wkljB0mr064ImdYR8vq5ynQqvRpxq6d7R5gCgGrJHtiM6xcXQZHbA+gYo=
X-Gm-Gg: AYBFou37Q/8g8b2ChH/vNkB70dDnzedpyo7VHXJobFH0LadbbBMG3F7GWoyIogmUiKr
	uqiMr+LsVwrJ5DGWKFjLm57RTER5dBLrBROkxvPvqnbPqYogGLIH/LjDzXRnBL//PZglW9bOt/a
	bivpq/o3StnTdMNe/qPP97nioWcjT827Tkp+f5cRCKA9lZntSAS8Wk6Blo23cSavFR9xOfGwJ15
	9DaQMRTlJDAZby+rOXhgIxbW7vGWXfwkfW2N4L+FykwOedC+FjnXvx3jixQg2xYsYiu1cjybmni
	PUgCWlpHS5sRua6UXc3XjvB9a0sG+hghvOnSVxpbhdSFKEVqlI4CBxCsGSjE2dAou4ZUE/OCD/o
	VIFCQ7Yc1PU0Drh53NxQJgswPtPwggs4zeVu8Ky2u36zzKbffwX3RMW9TEuLW07EjlCepL2e0nI
	MmUvS9evSNh4+DZPKdPnfrklseArOSL4W9AkcgzsiuiSGrS0zcv5P3ZxH/o55Ga0ENjcmJuHid8
	Q==
X-Received: by 2002:a05:6000:611:b0:48d:f5c6:1a0d with SMTP id ffacd0b85a97d-48df5c61b34mr9447610f8f.15.1792147602990;
        Fri, 16 Oct 2026 03:46:42 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:12 +0100
Subject: [PATCH v4 02/10] coresight: etm-perf: Remove workqueue for freeing
 AUX data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-2-dedf961aca0e@linaro.org>
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

AUX cleanup is deferred to a workqueue which is never flushed on module
unload. Pending work items can therefore run after coresight-config is
cleaned up or the module text is unloaded.

Since commit 95ff4ca26c49 ("perf/core: Free AUX pages in unmap path"), Perf
core stops AUX transactions and frees the PMU AUX data from the unmap
path in non-atomic context. Release the resources directly from the
free_aux() callback and remove the workqueue.

Fixes: 0bcbf2e30ff2 ("coresight: etm-perf: new PMU driver for ETM tracers")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 14 ++------------
 drivers/hwtracing/coresight/coresight-etm-perf.h |  2 --
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 09b21a711a87..2323a68584d4 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -18,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/stringhash.h>
 #include <linux/types.h>
-#include <linux/workqueue.h>
 
 #include "coresight-config.h"
 #include "coresight-etm-perf.h"
@@ -211,13 +210,12 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 	sink_ops(sink)->free_buffer(event_data->snk_config);
 }
 
-static void free_event_data(struct work_struct *work)
+static void etm_free_aux(void *data)
 {
 	int cpu;
 	cpumask_t *mask;
-	struct etm_event_data *event_data;
+	struct etm_event_data *event_data = data;
 
-	event_data = container_of(work, struct etm_event_data, work);
 	mask = &event_data->mask;
 
 	/* Free the sink buffers, if there are any */
@@ -288,13 +286,6 @@ static void *alloc_event_data(int cpu)
 	return event_data;
 }
 
-static void etm_free_aux(void *data)
-{
-	struct etm_event_data *event_data = data;
-
-	schedule_work(&event_data->work);
-}
-
 /*
  * Check if two given sinks are compatible with each other,
  * so that they can use the same sink buffers, when an event
@@ -436,7 +427,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	event_data = alloc_event_data(cpu);
 	if (!event_data)
 		return NULL;
-	INIT_WORK(&event_data->work, free_event_data);
 
 	/* First get the selected sink from user space. */
 	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 24d929428633..5e8d985522bd 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -84,7 +84,6 @@ struct etm_filters {
 
 /**
  * struct etm_event_data - Coresight specifics associated to an event
- * @work:		Handle to free allocated memory outside IRQ context.
  * @mask:		Hold the CPU(s) this event was set for.
  * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
  * @snk_config:		The sink configuration.
@@ -92,7 +91,6 @@ struct etm_filters {
  * @path:		An array of path, each slot for one CPU.
  */
 struct etm_event_data {
-	struct work_struct work;
 	cpumask_t mask;
 	cpumask_t aux_hwid_done;
 	void *snk_config;

-- 
2.43.0

