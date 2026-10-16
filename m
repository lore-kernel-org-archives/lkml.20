Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A22153E30C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169738; cv=none; b=tp7xYYfCIh759q4Yv+QRpSBGADgW+a9yp1mzGgto/+SMx2rqGdcubsq5yrNVZAglsyVf11t2l0KCcvR3lJjToaVQJuVDZbjaFRAABLtWFvyE/3uAP3fsMygYze9O1p25iM9l5FLipprT6GaGBGbx86GaWKQuylFJsDkNW7ddRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169738; c=relaxed/simple;
	bh=w8HM78LVd70g3IrU0TKqbYbHr8mKQzEEIbWDRpOxf3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfzNcj1UNDw9+syl0aqVxEdZKHTKEdsn/zuEUXnjotzi+gyA6MbQHWKjdlZ3xKhV8aVEYTlWE8E+LrhD2+g0q/5oa0GVJSVsu81zHJ1zk5e4LMCqbTh7JNX6gKofSJcEcrRbXCyrmwH/0rd1PvBhW2XBovcIdDfaXJ7vDHxwg0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eqbQJ1nT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eqbQJ1nT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 980A41516;
	Fri, 16 Oct 2026 09:55:32 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FE163F7B4;
	Fri, 16 Oct 2026 09:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169735; bh=w8HM78LVd70g3IrU0TKqbYbHr8mKQzEEIbWDRpOxf3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eqbQJ1nTLxFXsPEAH3wGoKsoXRyozGNzxTc4IMFHd4PUd0WLOq/i3QlepclKIQR3Z
	 ROxA4baDPwmZB37JD/mm12uh8wqkq0C62K/IyRbMFXtNiIVSsrWa77TynAJrbCEB/e
	 8YLz8NDOY3VxdzU3aHaRNMTXnWvtTIbE9nFYWRZ8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:11 +0100
Subject: [PATCH v2 13/23] coresight: trbe: Simplify wrap status handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-13-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2021;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=w8HM78LVd70g3IrU0TKqbYbHr8mKQzEEIbWDRpOxf3Y=;
 b=wdQEVcJOJO8x0TyM5MB9TZDJhYAFtjHPZHXINxM+6EW0aJuotFOUxjMTFjB0biLClgphT10XW
 9lKA4LshuxfA964sW5u9nt8YRL6ssptcgVPXMyATylRPC2eByuQpq67
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

After explicitly decoding the TRBSR_EL1 EC/BSC values, unsupported or
unexpected stop reasons are handled before the WRAP check. And the
erratum and pointer checks is no longer relevant when deciding the
buffer wrap.

Remove the redundant checks and treat any remaining TRBSR_EL1.WRAP
status as a wrap event. This also means WRAP with BSC_NOT_STOPPED is
reported as an overflow instead of a spurious event, which prepares for
for TRBE wrap mode where collection continues and a maintenance
interrupt is raised on current write pointer wrap.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index a851f09d806a6b6a6386d6f7547b01a17f61b88e..4aeed1a17c4bf1653fb41731ac15f31feec7ed2e 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -661,8 +661,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	const char *err_str;
 	int ec = get_trbe_ec(trbsr);
 	int bsc = get_trbe_bsc(trbsr);
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	struct trbe_cpudata *cpudata = buf->cpudata;
 
 	WARN_ON(is_trbe_running(trbsr));
 
@@ -710,14 +708,7 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 		goto out_fatal;
 	}
 
-	/*
-	 * If the trbe is affected by TRBE_WORKAROUND_OVERWRITE_FILL_MODE,
-	 * it might write data after a WRAP event in the fill mode.
-	 * Thus the check TRBPTR == TRBBASER will not be honored.
-	 */
-	if ((is_trbe_wrap(trbsr) && (ec == TRBSR_EL1_EC_OTHER) && (bsc == TRBSR_EL1_BSC_FILLED)) &&
-	    (trbe_may_overwrite_in_fill_mode(cpudata) ||
-	     get_trbe_write_pointer() == get_trbe_base_pointer()))
+	if (is_trbe_wrap(trbsr))
 		return TRBE_FAULT_ACT_WRAP;
 
 	return TRBE_FAULT_ACT_SPURIOUS;

-- 
2.34.1

