Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537C053F6AE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169740; cv=none; b=Wl+vgQNLg7zbbf6v4IT38tjo6eUY3L1ypHIo3BENM1NeFoqfRxqKU3Vjw45rpRgq9UHqRFnNgQOWp0NTn7BVBxE4yx5JzLGonx62ugx9yr4GRBZs7+iNRv+JR41FtQ7PjuHCuhXcjYSzhVMPeiqXBg56Y7b7eIyxWczEG3H94+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169740; c=relaxed/simple;
	bh=q6xSefM7pghZO5VVH4INJAgbjn8RPPudjJmX9oZNh2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjjtAxNMaz1OtNoqEfA29OfYmFEBzr5xl3x3qjj/p8Ybd2RGkAyX+fiatZJU5ASS+/AJPrBZbPazU4jAa2wEuYVPm2K7op/OHhFkMqZ6QrX0xtThVodrx6MXU9MKx5zLVdKOvbWFVdKrL+ObGYbvBOEo1G0Ynp7Nm2qkFAcps3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YHLs75Ti; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YHLs75Ti"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A56F1477;
	Fri, 16 Oct 2026 09:55:34 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27C203F7B4;
	Fri, 16 Oct 2026 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169737; bh=q6xSefM7pghZO5VVH4INJAgbjn8RPPudjJmX9oZNh2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YHLs75TiqCErZ+y8Vk2kwCpnezK/hXfG4oet801cFn/Xjq6wsxoEIcnqsLy4cbcvE
	 HMZ+tKz1P0g1zo8rCg1ZwnklqOYeWHeNupYCki1wR60Wb/aDc7jis/paZRVqi7+dgp
	 C8cep6lWhl18TCZgrQ83q6cOPOIzVbuYMzyc+ve8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:12 +0100
Subject: [PATCH v2 14/23] coresight: trbe: Treat access not allowed stops
 as fatal
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-14-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1868;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=q6xSefM7pghZO5VVH4INJAgbjn8RPPudjJmX9oZNh2c=;
 b=1FYidLquq3nz0xjzfGRIIeweFCTPn80nSZ8JsFAwV/gRO4uRBQrBJNOrc/5uZMmgQfk2G48H6
 94w2wr8Dc8XCxA+gtH///yqkwjhFFltAno8tlV+JldxPLzTKPQcdWK1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Arm ARM (ARM DDI 0487 M.b), the rule R_RRCNN in "D6.11 UNPREDICTABLE
behavior" permits a buffer management event when the effective SCR_EL3
security state does not match the owning Security state. This can stop
collection with IRQ=1, S=1, EC=0 and BSC=0 while leaving the other
status fields unchanged.

With EA and WRAP clear, trbe_get_fault_act() currently returns SPURIOUS
for this status. The spurious handler re-enables TRBE without clearing
S, so collection can remain stopped. A retained WRAP indication can
instead cause the status to be treated as a normal buffer wrap.

Recognize this architecturally permitted stopped status as an access
not allowed error and return FATAL so the fatal handling reports
truncated trace. Check the syndrome before WRAP and do not exclude
TRG, since both fields are left unchanged by this stop. Check the saved
IRQ bit to preserve updates without a pending interrupt.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 4aeed1a17c4bf1653fb41731ac15f31feec7ed2e..1c585b6123df2f20d08747678d836742ce9564cc 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -708,6 +708,14 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 		goto out_fatal;
 	}
 
+	/* An access not allowed stop can leave WRAP and TRG unchanged. */
+	if (is_trbe_irq(trbsr) && !is_trbe_running(trbsr) &&
+	    ec == TRBSR_EL1_EC_OTHER &&
+	    bsc == TRBSR_EL1_BSC_NOT_STOPPED) {
+		err_str = "Trace buffer access not allowed";
+		goto out_fatal;
+	}
+
 	if (is_trbe_wrap(trbsr))
 		return TRBE_FAULT_ACT_WRAP;
 

-- 
2.34.1

