Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5720C545D85
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169750; cv=none; b=rd3Uh97SkfILbrZwesR8ohXh3+4PnHD0U6dhRgdVPvCJ9Dh+pnIHGeSEjxAregc1K4C96Gtg9DDkEPtgRsYFPh3OUwqa37ooUb3xLj21Thmiryfg/AY+KrBdpUQEJkD3wQEnJ0eUk2p8DPCBhcYMZbknO9501JENDxWGOKB9Eew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169750; c=relaxed/simple;
	bh=GQRU9DFvAxcogjfhIENbBt6INOxd1HytQUmpWyWEfRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joVCJpR4VVAu70On+8E33gN7mdsQF/L6B2BF3Ch0YvXLVz4kHy6ne78Nn9S+OcBf/mzJNPQbn+Ghg8FY6ojUeINsNsQBmyZaIJ/xjWR23d60v3Q365G7vwLjvpBIxsESCl7e8fqNcrAAiZPtYDCMDCIWnunP0VUqC3Cl1yIwjdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bEM8qECs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bEM8qECs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 731CD1691;
	Fri, 16 Oct 2026 09:55:45 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DA293F7B4;
	Fri, 16 Oct 2026 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169748; bh=GQRU9DFvAxcogjfhIENbBt6INOxd1HytQUmpWyWEfRE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bEM8qECskA4mbmm+3PxnZ7rrV8bNyLdf/0L5uUfgn93fEdpUixwvYjklB9qLZuad8
	 fxazEPugZ5NPUKKK5jxXFTW6KfGrOk7caEcEsPek5LEaYtvl95l8b/m2EGlTEigvoN
	 VwXc8doira51QgRChYgmiwc5cklzJLiLgfjcLshg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:18 +0100
Subject: [PATCH v2 20/23] coresight: trbe: Add fault action argument to
 trbe_handle_overflow()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-20-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1741;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=GQRU9DFvAxcogjfhIENbBt6INOxd1HytQUmpWyWEfRE=;
 b=GRFWx5MtpRGZ6KTGxd6mRZGFkmMpkY23N0YTyZHahDGJnGJtTyN2XyZuxMQlO9UGo+M8YQOuH
 uS8KEHffl16ABa39VbAKDsEUeIEowkjGLck7OM8cMMnj2FvZOwWfbrR
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Add a new argument to trbe_handle_overflow() for the fault action, which
is used to compare the wrap event for trace size calculation.

No functional change intended; this is preparation for a later update.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index f1f102df6c387f53feaa12b89d3df89f734afcdb..c83c440d4ac13c346bc2a7f9093951c186c90157 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1132,7 +1132,8 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
 	set_trbe_enabled(cpudata, trblimitr);
 }
 
-static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
+static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
+				enum trbe_fault_action act)
 {
 	struct perf_output_handle *handle = cpudata->handle;
 	struct perf_event *event = handle->event;
@@ -1147,7 +1148,7 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
 	 */
 	clr_trbe_status();
 
-	size = trbe_get_trace_size(handle, buf, true);
+	size = trbe_get_trace_size(handle, buf, act == TRBE_FAULT_ACT_WRAP);
 	if (buf->snapshot)
 		handle->head += size;
 
@@ -1253,7 +1254,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:
-		truncated = !!trbe_handle_overflow(cpudata);
+		truncated = !!trbe_handle_overflow(cpudata, act);
 		break;
 	case TRBE_FAULT_ACT_SPURIOUS:
 		trbe_handle_spurious(cpudata);

-- 
2.34.1

