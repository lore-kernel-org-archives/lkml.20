Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D7152FE43
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169725; cv=none; b=Yu6v0Kw8MJsFhx+eU6LyCmgSxD6ec+LqmlzlrBV0WPgltq8kdKvw70IbuMLPk1RIBfR18bQ6BqPlN0sLU4XQZCTqwjKAm8LzOQJljLQkARK5ARvVnF4b7mearGqYSNHwsY81Bohp8hFvUsPsNxpgorXUvOelCg91nD3VwbZqjvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169725; c=relaxed/simple;
	bh=2mWM0NIrrr+JQA1RmHKfyU3uP0bXY9WQf31AeWam5BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbtnMF3QpM720UR1EhS5aB9PoPXI2WOQ7g7H5E7fnRKKIBb1OW8OVyf1qUlqgDD8THrRJyEW/dqYSQWjyQObE0suFgFLS/Rn4QD5ih0QHX12JNgP5lmpQYjsCLfsmd/BWxXGS4U+1LGp5PaPflKCHEW7lwHnVBM5ogCOlPiBi4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C7FT4xOO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C7FT4xOO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC30F175A;
	Fri, 16 Oct 2026 09:55:19 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 754C53F7B4;
	Fri, 16 Oct 2026 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169723; bh=2mWM0NIrrr+JQA1RmHKfyU3uP0bXY9WQf31AeWam5BY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C7FT4xOO7CQbAFjHHN0XGHiJl1kFLLAEXy4KgqyFz7Br7YLlFZ5fTjgq1xvdd7dgq
	 9MyixdjJ9GJjNT1doqlp+SjtOp7bEWKO72Sqv7rC5wY/LqlalG9JoKKSuYjzKUX5s5
	 0h39BgzNaynzvpi2B2kDRTuugR99lPKBBQYKGbHQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:04 +0100
Subject: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=1810;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=2mWM0NIrrr+JQA1RmHKfyU3uP0bXY9WQf31AeWam5BY=;
 b=qHU4MHw/WoIADWQQAWk+I8IpdL+muDzbXHo+rQ3Jz3ObeU7ucks4ACybmP4MCJdF4WCuF1XGc
 KucRVzeP3mbADIgh53GvTDRvgsFXUsX3uDE7aeQtaNMOQ3aNnU/sGzq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:

 | When the following conditions apply, the PE might ignore a direct or
 | external write to any of certain Trace Buffer Unit registers, other
 | than a direct write or external write to TRBLIMITR_EL1 that clears
 | the conditions:
 | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
 |   or the Trace Buffer Unit is using Self-hosted mode.

trbe_enable_hw() calls set_trbe_disabled() first to ensure TRBE has
already been disabled before programming any other TRBE registers.

However, TRBE is already expected to be disabled before trbe_enable_hw()
runs:

 1. CPU probe resets TRBLIMITR_EL1 via trbe_reset_local();
 2. Interrupt handling disables the buffer before re-enabling it;
 3. The normal disable path clears TRBLIMITR_EL1.E.

Calling set_trbe_disabled() from the enable path is therefore redundant.
Drop the call from trbe_enable_hw(), which only needs to program a
known-disabled TRBE.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index a7c1037a048f5236598f8f3a7cc4f47bff9d329c..979d0fa84c1c7b448c1ce5cd7a37dff8845795ef 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -652,7 +652,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
 	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
 	WARN_ON(buf->trbe_write >= buf->trbe_limit);
-	set_trbe_disabled(buf->cpudata);
 	clr_trbe_status();
 	set_trbe_base_pointer(buf->trbe_hw_base);
 	set_trbe_write_pointer(buf->trbe_write);

-- 
2.34.1

