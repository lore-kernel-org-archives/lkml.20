Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA4C541461
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169743; cv=none; b=gqtk7RPUVFS/jk8AwspuBE+EeitK4JPavTGJzm9KCzyrWu9eNCjEdyGFRXwjS+TlsmPWOb8LvbNsiyr3YeOaGw4ygsHhIWzcRNKPbGwBlT/K8EajpShVxRXO9PAOLSAjpjwaopZxQm2WUZx1SzWVkOSSXbYdnauIXc054FVNGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169743; c=relaxed/simple;
	bh=yWcMQrJ3DBzynGtO8A/EkzjEPEYj/c5Q1ImidAgitGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTlMuoo5beq0NC8HlvT/t/uiWEV/9U1LLA8/CoAsCY7WoZ0dSW2LPYj9slLoC2ohJaoj/3oUyrDM0Llo+enHqkfyW1l5Peb/GHOOg3km8JA1LX/5+SMtidWDRSbDtMs/+bz6G1S4dIYACFouIXHSCS7uZFnG1dyqIKrhhbqCCNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UkORsnD8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UkORsnD8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206BE1477;
	Fri, 16 Oct 2026 09:55:38 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBFFD3F7B4;
	Fri, 16 Oct 2026 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169741; bh=yWcMQrJ3DBzynGtO8A/EkzjEPEYj/c5Q1ImidAgitGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UkORsnD8vOoc0ygorycTnWUM9PzAGQJxcxG3Dl8j5RPUJ3dxlE+o4dr1Z2lHLYB31
	 /vNji6DEz3bBNwOBFIVmo6CBSoZ0D4abqsu1F5dsOCeGvDOqtmH+96KYM5+wKmAVON
	 2zgCOoD8PtrSWaVZlQhakviZTcPtr9IE9KFDqMt4=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:14 +0100
Subject: [PATCH v2 16/23] coresight: trbe: Always classify TRBSR when
 updating buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-16-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2929;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yWcMQrJ3DBzynGtO8A/EkzjEPEYj/c5Q1ImidAgitGc=;
 b=N2IcP89/ynF6Y+HXtEcyjSRV3HhA3DmguaPBS50vwyHMcNl4eSfqlsgJbWLrnltijRcTrJW11
 O5HX38akGFcDjV5Bd//4ye0p+EN+WpsLp33Mkv4/wvNATRvPYqhti1y
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

arm_trbe_update_buffer() must account trace when perf stops a session,
even if no maintenance interrupt has been handled. Prepare it for
trigger and wrap modes by making the trace-size decision from the
drained TRBSR status rather than gating classification on IRQ.
Acknowledge IRQ only when it is set.

In FILL mode, reaching LIMIT sets WRAP and IRQ and returns TRBPTR to
BASE. Interrupt delivery can be delayed, so update_buffer() may run
before the IRQ handler. The existing IRQ-gated path uses WRAP to size
through LIMIT in that case; preserve this while also classifying
updates without a pending IRQ.

With classification on the no-IRQ path, a normal software stop can
have TRBSR.S clear and an ignored detected trigger can set TRBSR.TRG.
Neither should warn or discard valid trace. Mark fatal status as
truncated and return zero. Use LIMIT for a filled WRAP and TRBPTR
otherwise.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index ac49098aa08412a23a20d32f84c2e1977ee4a223..661f4a78e67c30652de8c834e4773819fa67b5ac 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -662,8 +662,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	int ec = get_trbe_ec(trbsr);
 	int bsc = get_trbe_bsc(trbsr);
 
-	WARN_ON(is_trbe_running(trbsr));
-
 	if (is_trbe_abort(trbsr)) {
 		err_str = "External abort";
 		goto out_fatal;
@@ -844,7 +842,6 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 	enum trbe_fault_action act;
 	unsigned long size, status;
 	unsigned long flags;
-	bool wrap = false;
 
 	WARN_ON(buf->cpudata != cpudata);
 	WARN_ON(cpudata->cpu != smp_processor_id());
@@ -896,23 +893,20 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		 */
 		clr_trbe_irq();
 		isb();
+	}
 
-		act = trbe_get_fault_act(handle, status);
-		/*
-		 * If this was not due to a WRAP event, we have some
-		 * errors and as such buffer is empty.
-		 */
-		if (act != TRBE_FAULT_ACT_WRAP) {
-			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
-			size = 0;
-			goto done;
-		}
+	act = trbe_get_fault_act(handle, status);
 
+	/* If an error occurred, the buffer may be empty */
+	if (act == TRBE_FAULT_ACT_FATAL) {
+		perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
+		size = 0;
+		goto done;
+	} else if (act == TRBE_FAULT_ACT_WRAP) {
 		trbe_report_wrap_event(handle);
-		wrap = true;
 	}
 
-	size = trbe_get_trace_size(handle, buf, wrap);
+	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 
 done:
 	local_irq_restore(flags);

-- 
2.34.1

