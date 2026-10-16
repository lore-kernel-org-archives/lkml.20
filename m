Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA10A53CA7F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169734; cv=none; b=RlbOwpVuDfEngbmLdqoWOKbli9Y0heaqMLCg4GGx27PHCei9vY6OcOIsCwIkQoJZJ/Bd1H0ln4hs3HNuP35LW0Qu6oAPeyDN+28Ld+z9DsGxUvQ2KnDisz7X4hTPpKsOihVMRNeVrjr4+j0hjB6M0iZ8j2B4HW30bZg8M4LogKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169734; c=relaxed/simple;
	bh=Ci4jQGVodjiB+/z/lfOy/LyT2edA351Qgh0wmsig4rY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LdC8PArPcJMYzMyvaUg2u3AEWqTn2hTNhTgC4Y1Ntns2s4nQPqUU5f/3Ua4Q0E+lE8l9lnKipgY5oImFcGiqtkdoY9DInwVUhOcQ3Ba4C24qgbO42aPmwhMy7WQNk6ME0FjxDbGb0mVHocVL4vcJXv2QlAwxgUgf4zBaKXLEiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KVLOmbDV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KVLOmbDV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74131691;
	Fri, 16 Oct 2026 09:55:28 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FE513F7B4;
	Fri, 16 Oct 2026 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169732; bh=Ci4jQGVodjiB+/z/lfOy/LyT2edA351Qgh0wmsig4rY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KVLOmbDVKubejrK78neacC+V0Rhbz32I/P1WLQo5Sm2j3hTtKwIEHrvWSi/hhmbfI
	 7KoXZhLTw2EJhGaWXbo78cGyLmGkLUlN1Hp/x8V+N4AP2yx5NIuBdqp16BR7TBvgoV
	 LB7rWLiwzW/mANW71CMsyPbIEfzes8k6lR5QaXEU=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:09 +0100
Subject: [PATCH v2 11/23] coresight: trbe: Assign the perf handle in enable
 and disable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-11-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3418;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Ci4jQGVodjiB+/z/lfOy/LyT2edA351Qgh0wmsig4rY=;
 b=7cpRKItxfN8/08ZsQgsas0Sp4YJg0iK/kZoIm4+dwIdfR1CjzvzPJQnQE/dSZfI2f95+JNrvi
 DO4P7w50Qm6Acd0Sco+V4JidJzI2sfQU6kwEMVjO5ckHF+188ABUIZ/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

etm-perf owns the perf output handle embedded in its per-CPU etm_ctxt and
passes it to TRBE through arm_trbe_enable(). TRBE binds that handle after
successful sink enable and unbinds it in arm_trbe_disable(). The handle
object remains valid throughout this interval, even if the current AUX
transaction ends or a new transaction begins.

The inner enable helper currently publishes the handle, while truncation
and failed rollover clear it. Sink disable leaves the handle installed
after dropping the buffer association. These assignments track the AUX
transaction rather than the enabled sink session.

Publish the handle only in arm_trbe_enable() after successful setup and
clear it in arm_trbe_disable() before dropping the buffer association.
Remove the assignments from the inner enable, overflow and truncation
paths so the handle association follows the enabled sink session.

A valid handle object may have no active AUX transaction, so the IRQ
handler continues to check perf_get_aux() before accessing the
transaction's configuration.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 4a041bbc6e970d72a7d735e15f7221037cb091d6..1f51c33de83638479436683fd96e31d69c3b860f 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -303,11 +303,8 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
 
 static void trbe_truncate_event(struct perf_output_handle *handle)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
-
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 	perf_aux_output_end(handle, 0);
-	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
 }
 
 /*
@@ -1012,7 +1009,6 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
 	if (ret)
 		goto err;
 
-	*this_cpu_ptr(buf->cpudata->drvdata->handle) = handle;
 	trbe_enable_hw(buf);
 	return 0;
 err:
@@ -1042,6 +1038,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 		return ret;
 	}
 
+	*this_cpu_ptr(drvdata->handle) = handle;
 	cpudata->buf = buf;
 	cpudata->mode = mode;
 	return 0;
@@ -1062,6 +1059,7 @@ static int arm_trbe_disable(struct coresight_device *csdev)
 	trbe_drain_and_disable_local(cpudata);
 	clr_trbe_status();
 
+	*this_cpu_ptr(drvdata->handle) = NULL;
 	buf->cpudata = NULL;
 	cpudata->buf = NULL;
 	cpudata->mode = CS_MODE_DISABLED;
@@ -1102,16 +1100,12 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 	trbe_report_wrap_event(handle);
 	perf_aux_output_end(handle, size);
 	event_data = perf_aux_output_begin(handle, event);
-	if (!event_data) {
-		/*
-		 * We are unable to restart the trace collection,
-		 * thus leave the TRBE disabled. The etm-perf driver
-		 * is able to detect this with a disconnected handle
-		 * (handle->event = NULL).
-		 */
-		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
+	/*
+	 * If trace collection cannot be restarted, leave TRBE disabled.
+	 * The etm-perf driver detects this through handle->event == NULL.
+	 */
+	if (!event_data)
 		return -EINVAL;
-	}
 
 	return __arm_trbe_enable(buf, handle);
 }

-- 
2.34.1

