Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC60653B61D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169730; cv=none; b=pfL37GDYEOPP3eJ4vSix9jRSwQ2JVNResRNZbwCYHpEFlUuB3AdG90ST86VPWo3+holpzw1qYivrenAxnsKWYrXcfnTPPuCRXv3l2SdsmVSeaun45qlGqNTjPrEeFCtag0Y9TbOFUMe4zQ9KH4c+79gtjiOxCBqVEJaRvJ3SR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169730; c=relaxed/simple;
	bh=7a5LM0omtRuxo1GY+8/etcO0DB5cgJyVFb0k9uB3eCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MG4LYBHl2z86B5Q1Uk2hAvG11R+lSRvL2rAi+/LhJKzs80vRGNDZdMq0Rjj7izaetansnPCV22cY1kBWd+o0U1bMDwIwdZw5wAFo8Ex0v0lTK/aBy3XZ4Dfv/82WdaEulisFsiTSfqWH+G+wKuloJ5vcJ4Sg+Hh6wg45zls/D1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TAHb/taJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TAHb/taJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 435691516;
	Fri, 16 Oct 2026 09:55:25 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F00133F7B4;
	Fri, 16 Oct 2026 09:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169728; bh=7a5LM0omtRuxo1GY+8/etcO0DB5cgJyVFb0k9uB3eCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TAHb/taJYqC/Yzsg/GaktFpDrYnFaTOMGfQau9gLqS8pONtIjMLuHG/26sw4IdvaZ
	 /tRVvzC+EGR4UjB3htGmHnc6OOJoXMCMGU1F3pEZHkVmIsA6aEJGB3ktnXduBnSDm/
	 4ArO3I5g4ynKNMx7qZBzBuPOu0DzmOLTO5hmuC9k=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:07 +0100
Subject: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop sites
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=2109;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7a5LM0omtRuxo1GY+8/etcO0DB5cgJyVFb0k9uB3eCM=;
 b=ry8ADQrujTTFdEbFxyecPPqDjhNg7eET/vbVKpX+EPc6vBXJ9jKOsQ2foozk6MhEfBwdUjTZU
 VJwoW6ObtIzCTZ82mdUuDCtbc8QlakBH0U1WFWBzpUsNZUQ6TrnvRpw
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

TRBSR_EL1 records the status of the buffer that just stopped. Clearing
it in trbe_enable_hw() postpones cleanup until another run starts. If
AUX output cannot restart, for example when AUX space is exhausted,
that clear never executes. Clear the status in arm_trbe_disable()
after disabling TRBE instead.

trbe_handle_overflow() can start the next run without calling
arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
while TRBE is disabled, before attempting the AUX restart. This also
leaves the status clean when the restart fails.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
 	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
 	WARN_ON(buf->trbe_write >= buf->trbe_limit);
-	clr_trbe_status();
 	set_trbe_base_pointer(buf->trbe_hw_base);
 	set_trbe_write_pointer(buf->trbe_write);
 
@@ -1069,6 +1068,8 @@ static int arm_trbe_disable(struct coresight_device *csdev)
 		return -EINVAL;
 
 	trbe_drain_and_disable_local(cpudata);
+	clr_trbe_status();
+
 	buf->cpudata = NULL;
 	cpudata->buf = NULL;
 	cpudata->mode = CS_MODE_DISABLED;
@@ -1095,6 +1096,13 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
 	unsigned long size;
 	struct etm_event_data *event_data;
 
+	/*
+	 * Clear the status. No context synchronization is required here,
+	 * since context synchronization will be performed before TRBE is
+	 * re-enabled (see trbe_enable_hw()).
+	 */
+	clr_trbe_status();
+
 	size = trbe_get_trace_size(handle, buf, true);
 	if (buf->snapshot)
 		handle->head += size;

-- 
2.34.1

