Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA8C52FE49
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169727; cv=none; b=N88o73DRvauAx9/RQVKs0ZwplepzUkCwlqNIi8Nwuqp0iqK/e0aVktAAzTXkWaWVRXlnZM/y35G9e43pYaBM58LfJwGX44xtRtR7Om2yIDET2EHNckhjOXWyp7NdJcYusos4xFr5Lh91fFTTJ77g4Z3N8rUhRBdpJ/SFHwG85hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169727; c=relaxed/simple;
	bh=Nph8rVqtGI3EDRlPDWoX+ktitTsVVlbL02jWjnR1dNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXajVVz2wTai6P18QWXansolhbqXrwmsQMsbm7c/aN0XZ9r4T4rCpBNa0i3RyGsDXDsnDFz0RtRkDlxL16tHR08Wj6sV0XYkQdHKCeQe+rNUaEHlecPT5jtGc80/MZlo5z3vHEzSl3xn06rf98KLVktiFdS28sqb31nu/2K+ZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W9gYqHGC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W9gYqHGC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 936FB1516;
	Fri, 16 Oct 2026 09:55:21 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CFC63F7B4;
	Fri, 16 Oct 2026 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169724; bh=Nph8rVqtGI3EDRlPDWoX+ktitTsVVlbL02jWjnR1dNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W9gYqHGCXwgMoJjKwGAAzbghiIKUIZh2sRTxoSgbcOs2+y0wCArV0nHjshjNR2nyg
	 YhA+xg+dc9DZh2mWqN5FXxd8vx4xdM1sGPCzDq8uY8DoTD1mm2OS5HvHZRAjL5S4yC
	 IIs16Tqr8jaaop7UmwRs1nVN+HLIx2lAe/kpZyZA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:05 +0100
Subject: [PATCH v2 07/23] coresight: trbe: Publish the session after
 successful enable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-7-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2521;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Nph8rVqtGI3EDRlPDWoX+ktitTsVVlbL02jWjnR1dNA=;
 b=V+vG3b4fwpgP+lSYbv31bGij4E8lKBJP9R1e0trH06hG9NssqXsGsqfriqky2OTcj+5E3aZ+L
 8wioiHOnznuDrKEGikEK2i1MNlJ5v0venoxTJ7PLALQqgckd1lVno9u
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

arm_trbe_enable() records the session buffer and perf mode before
__arm_trbe_enable() can fail. CoreSight skips the sink disable callback
when sink enable fails, leaving that session state published even though
tracing did not start.

Install buf->cpudata temporarily for the buffer setup helpers, then call
__arm_trbe_enable() before assigning cpudata->buf and cpudata->mode.
Clear the temporary buffer association if setup fails; the inner helper
still truncates and ends the AUX transaction.

After successful enable, retain the buffer association across AUX
transactions and clear it in arm_trbe_disable().

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 979d0fa84c1c7b448c1ce5cd7a37dff8845795ef..9dfc6bb7afb4c42dfdec643ee7e4f2f193e2b70c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -69,6 +69,7 @@ struct trbe_buf {
 	int nr_pages;
 	void **pages;
 	bool snapshot;
+	/* CPU used to configure this buffer. */
 	struct trbe_cpudata *cpudata;
 };
 
@@ -137,6 +138,7 @@ struct trbe_save_state {
  * @trbe_align		- Software alignment used for the TRBPTR_EL1.
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
+ * @buf			- Buffer configuration retained for the enabled session.
  * @drvdata		- TRBE specific drvdata
  * @errata		- Bit map for the errata on this TRBE.
  */
@@ -1033,17 +1035,24 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
 	struct perf_output_handle *handle = path->handle;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	int ret;
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
 	WARN_ON(cpudata->drvdata != drvdata);
 	if (mode != CS_MODE_PERF)
 		return -EINVAL;
 
-	cpudata->buf = buf;
-	cpudata->mode = mode;
+	/* Buffer helpers need the CPU association while setting up tracing. */
 	buf->cpudata = cpudata;
+	ret = __arm_trbe_enable(buf, handle);
+	if (ret) {
+		buf->cpudata = NULL;
+		return ret;
+	}
 
-	return __arm_trbe_enable(buf, handle);
+	cpudata->buf = buf;
+	cpudata->mode = mode;
+	return 0;
 }
 
 static int arm_trbe_disable(struct coresight_device *csdev)

-- 
2.34.1

