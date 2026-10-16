Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3352653163E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169718; cv=none; b=ADRQv5YuujwjnIT0VOl0oZKb0Q1RzEXB67bx36k/9O533wONUPoPZ3+LnDzdx36SjB+RDjxB+hvUBkeQzKSyhhPXGNaiNJoscnPwSM8emPV+TY3hzPq25o6RGTQwwpq1OTRFkTMbhWkXj1vKwPfXbjfkDGkW14l0ze59KHE1kaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169718; c=relaxed/simple;
	bh=uNbBU/EY9WXBUNkGG0itsEkzVgBaX+yaH0M52uUwmFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cYMWb15OLoUsmMOd3cU6aTNUW/1+LIs8RHHSbSDB5FYdybkfluQ4vw6acvU+yrceV5bbomdz3zEys95L3VukkwQxqt7GHgF2h+AQCnle2l/ROuUbVwHEE98DaD6LhGyqGwzX3qZPYJBHFFZLT0hJJObSqmkKF8OiFU6U6E1GOTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RoGf6tzM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RoGf6tzM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4231477;
	Fri, 16 Oct 2026 09:55:08 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F36A3F7B4;
	Fri, 16 Oct 2026 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169712; bh=uNbBU/EY9WXBUNkGG0itsEkzVgBaX+yaH0M52uUwmFg=;
	h=From:Subject:Date:To:Cc:From;
	b=RoGf6tzMTOFAIheS9Av7Qpk1ycv7xrTNG/TLOnfGLq2UCY/KFb1twwh3dPIeRV5zO
	 5+ggGpf1quan/BmBv0S7CSXmB+UVXNibwkFRQE0MY1cNcoQLYG4w1HzEGoflryLauD
	 VdudypJsjmsb5WNiHNaIxqlf0xRjcuDPI5mfY9S8=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/23] coresight: trbe: Refactor buffer and IRQ handling
Date: Fri, 16 Oct 2026 17:54:58 +0100
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJW0moC/x2NXQqEMAyEryJ53kJs/QGvsiyl2qgBqW4qIoh3N
 /g08zHDzAWZhClDV1wgdHDmNSnYTwHDHNJEhqMyWLRNiWVjdunJUwr9Qj5yfpXl77Uc1QqNYdh
 XMRhcVeOIrmod6NqmCZ/v0/d33w8NUt8EeQAAAA==
X-Change-ID: 20261016-trbe_enable_disable_irq_handle_refactor-0a3450f03473
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3375;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uNbBU/EY9WXBUNkGG0itsEkzVgBaX+yaH0M52uUwmFg=;
 b=S+gfnRqM3iuzcg6PNNIY1km7seugr627QKpCGxWjlpn1gBUIRtG3376n6jmPSj1q9lWwl6PAA
 oUd0bCVc24iC9XR5J/ULjUo2UegnPTQtxnQBGTavEWm4mpIJbnk8UHz
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This series follows the earlier TRBE buffer refactoring posting [1].
The work is now split into two parts. This first part contains fixes
and refactoring in preparation for wrap and trigger mode support.
Support for those modes will be sent separately.

The patches are grouped as follows for easier review:

  Patches 1-5: Minor fixes
    Add register definitions, fix the watermark range check, and
    improve erratum checks and perf handle validation.

  Patches 6-11: Enable/disable lifecycle fixes
    Clean up session setup, status clearing and IRQ handle ownership.

  Patches 12-17: Refine status classification
    Decode stop reasons, report truncation on errors and improve
    trace-size accounting.

  Patches 18-23: Improve IRQ and overflow handling
    Keep the handle in per-CPU data, stabilize status reads, and
    improve AUX restarts and trace-gap reporting.

A race also remains between TRBE interrupt handling and AUX pause/resume
from a sampling NMI. This should be resolved as part of the state
machine refactoring in the CoreSight AUX sampling series [2].

[1] https://lore.kernel.org/linux-arm-kernel/20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com/T/#t

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (23):
      arm64/sysreg: Define TRBSR_EL1.EC event classes
      coresight: trbe: Make watermark range check overflow safe in __trbe_normal_offset()
      coresight: trbe: Use helpers for checking errata
      coresight: trbe: Check the buffer association before IRQ validation
      coresight: trbe: Validate perf handle before using sink data
      coresight: trbe: Drop redundant disable from enable path
      coresight: trbe: Publish the session after successful enable
      coresight: trbe: Clear stale external abort status
      coresight: trbe: Clear TRBSR status at stop sites
      coresight: trbe: Drop redundant disables
      coresight: trbe: Assign the perf handle in enable and disable
      coresight: trbe: Decode TRBSR status codes
      coresight: trbe: Simplify wrap status handling
      coresight: trbe: Treat access not allowed stops as fatal
      coresight: trbe: Report truncated trace on buffer update errors
      coresight: trbe: Always classify TRBSR when updating buffer
      coresight: trbe: Calculate trace size across buffer wrap
      coresight: trbe: Keep the perf handle in per-CPU data
      coresight: trbe: Reload the AUX buffer on overflow restart
      coresight: trbe: Add fault action argument to trbe_handle_overflow()
      coresight: trbe: Read TRBSR after prohibiting and flushing trace
      coresight: trbe: Restart trace source for stopped buffers
      coresight: trbe: Report trace gaps with PARTIAL instead of COLLISION

 arch/arm64/include/asm/sysreg.h              |   6 +
 arch/arm64/tools/sysreg                      |   8 +-
 drivers/hwtracing/coresight/coresight-trbe.c | 481 ++++++++++++++++++---------
 drivers/hwtracing/coresight/coresight-trbe.h |   8 -
 4 files changed, 345 insertions(+), 158 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20261016-trbe_enable_disable_irq_handle_refactor-0a3450f03473

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

