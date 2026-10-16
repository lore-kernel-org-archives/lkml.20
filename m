Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4989153ED14
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169742; cv=none; b=Yre8Dq/pItMkBHJLxaXeJLySTm0kWJliRrdJgSpmmA1KslZ59pxSCzwTLq5kcnJgGwCMsGUxFoj3gcb48kWuYVtqKN0AK8fpXnzG/sZvBYmcLVDbE15jPUwJE5XrIPXerim9z++SDavigxSkOSRVxl8cvSlDEkyzqCV//2QG9UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169742; c=relaxed/simple;
	bh=i8NvbVpuzfjMiO2TYqnvpJ+XUXrLAwhczqa0ubO6Urw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T49UbyFiIzK0G8iesNknqdztz+CwaJsHXf1lDzR3rWxH5BIwNuJsbFCmgzbVblpcbJ2v59Vwq5P8WNKTgwmS0Q6GxLOcJigSSN2miEfvne/pxyUG0d+AQhDjyR6eGpPvXpW8PrqHd0ra2Gyz/gUrI1QCwv3PdcxrOfg+2Q0B090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vFbivNU2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vFbivNU2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49EC01691;
	Fri, 16 Oct 2026 09:55:36 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F41013F7B4;
	Fri, 16 Oct 2026 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169739; bh=i8NvbVpuzfjMiO2TYqnvpJ+XUXrLAwhczqa0ubO6Urw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vFbivNU214iNvGciB4ZiTH/AcVgosJp3nYP4qO6naTtG0r7vQX2Y4XDSiaaYT2aej
	 jNDPlr2SMPW4zKHorMNaVCrKCgg8jItAJuax6CGhOolcXk33ukrHALVJeWE4E28RH2
	 oYUBbkLcAFpWk8PPlKQe0Gy0VwnLLLJSuFJWRnWE=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:13 +0100
Subject: [PATCH v2 15/23] coresight: trbe: Report truncated trace on buffer
 update errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-15-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1077;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=i8NvbVpuzfjMiO2TYqnvpJ+XUXrLAwhczqa0ubO6Urw=;
 b=/o5/cCMcND1q+Zxgjbp/2XyQGRR9Qmn4+kmWPIxpvOQnMD1CVZGIpIKd9+hsNPkXc/yUm6yrk
 X5s8CeLKMCGBBI4Ppz0FGwfUN8ou9YEBR1gus12JiBUAG+OAkhF1L15
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

When arm_trbe_update_buffer() handles a pending interrupt that is
not a wrap event, it discards the buffer by returning zero. The AUX
output is not marked as truncated, so userspace is not informed of
the lost trace.

Set PERF_AUX_FLAG_TRUNCATED before returning zero so perf reports
the trace loss when closing the AUX output.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 1c585b6123df2f20d08747678d836742ce9564cc..ac49098aa08412a23a20d32f84c2e1977ee4a223 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -903,6 +903,7 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		 * errors and as such buffer is empty.
 		 */
 		if (act != TRBE_FAULT_ACT_WRAP) {
+			perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
 			size = 0;
 			goto done;
 		}

-- 
2.34.1

