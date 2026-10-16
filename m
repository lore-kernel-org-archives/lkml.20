Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382683B7B7F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185117; cv=none; b=Q7JcySSvsABgDYyYVjhW4Q0uaJ32PeY6k6GP6M++CjJ6VhgbBZKLmuPcwQhymwXEyeuncQuJrroHtKTBQu56JK2eT/tmT86OzP0L/OD5lsMA830rtuNg1TV1Ro8htO6wEfpEpiG+GLqkzpM5LcUqhyxe6f6KsNFH98sIdX3e1Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185117; c=relaxed/simple;
	bh=dsXT5fLLEfFPy9a4CG9YHn/vrX1wJDM9KohaEcRDfBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NFc6d2txZcKfyvw9TdIFL8kZkIF49DU1DZk4dP29jiCV1+shgfut8E5pjfB2qgbGktFbi4vCX4fjuu02/VDqLrbz0xZlpK0Dorz6Vqrqm/9y4w/YgI0SyKeZ68RK9YPztDd1MrPZ+T3PWNMvtyLYDMYf1w6dp794hmUViFMbHqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dPVuiv3E; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dPVuiv3E"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD9F914BF;
	Fri, 16 Oct 2026 14:11:50 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E27C3F673;
	Fri, 16 Oct 2026 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185114; bh=dsXT5fLLEfFPy9a4CG9YHn/vrX1wJDM9KohaEcRDfBg=;
	h=From:Subject:Date:To:Cc:From;
	b=dPVuiv3E6QcGGRi0I8/8Qunhdh/9Fvh4pxI2q+3sCT0k87DQBr5c7A8KrOmm4YlZP
	 xr07TjQA1RIJNnZyCk3Wpu1VkSCJhzXhGMG6JAJ25LBeUiM4Ti5g2Z4UJQUImPthfh
	 Hz+SpBl0ll0fadNvipL8ZTkEkRKMlnLCVgS66XPg=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/11] coresight: trbe: Refactor buffer handling and add
 trigger support
Date: Fri, 16 Oct 2026 22:11:38 +0100
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuT0moC/3WP3WqEMBCFX0VyXUt+NEYpy75HWWSSTLqBVbuJK
 y3LvntHxctCIDmZmfOdebKMKWJmXfFkCZeY4zSSkG8Fc1cYv7CMnjSTXGquRVPOyWJvHyFg6hM
 GcPOU+kWWxgiFSgWPxjKa/qZi/NmcPy+krzFT5+8GWuT6u3s2Qv/rSYeXFW+lNFULba3PkIZ3N
 w3s8toRCe8PyjzvHDZgzrBl7oqP1V7wwx5HsDfsfczbHdO9p/08PQ/ijlOhblxQom2tOHCndSE
 LGUsSQ5y7QlXKBWetQhe8NRygbjRU0rgAyuoafGOUqSQFff0B6t+eHGQBAAA=
X-Change-ID: 20260617-trbe_buffer_refactor_v2-8813e33fde8b
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=5167;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dsXT5fLLEfFPy9a4CG9YHn/vrX1wJDM9KohaEcRDfBg=;
 b=HQmpywo/iu7/80eeDg3wxKMvF63OdxAFFn42fksScyDKp6q87KvphQB0dybS8L0ciFsd7dEZX
 8OOPvIGiBfYB1YqeAFMhmtR4W3UKp0b0AWyhf8SglR9bK9es8Ir+Kj0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

TRBE currently stops trace collection at each buffer limit, so interrupt
latency can cause trace loss. This series adds trigger-based maintenance
and WRAP mode to reduce these gaps, while protecting unconsumed data and
retaining limit-based handling where required by errata.

The perf changes preserve decoder state across contiguous indexed AUX
fragments, with resets when continuity cannot be established. Thread
stacks still flush at each data block boundary. For normal recording, a
quarter-buffer watermark wakes userspace earlier.

The 11 patches cover:

  Patches 01-02: Next-buffer computation cleanup and refactoring.
  Patches 03-07: Trigger support, headroom, save/restore, and KUnit tests.
  Patches 08-11: Decoder continuity and earlier userspace wakeups.

This series is based on coresight-next and requires
"coresight: trbe: Refactor buffer and IRQ handling" [1] to be applied first.

This series has been tested on the Orion6 board with TRBE and the
Juno-r2 board with ETR using the following commands:

  perf record -e cs_etm// -a -- bash -c 'for i in {1..5}; do timeout 0.1 yes > /dev/null; sleep 0.1; done'
  perf script --itrace=i1000iTZ

[1] https://lore.kernel.org/linux-arm-kernel/20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Split the enable/disable, perf-handle lifecycle, and IRQ handling fixes
  into the separate prerequisite series, leaving 11 patches here.
- Restrict KUnit buffer and padding stubs to the synthetic test handle,
  preserving normal buffer lookup and AUX accounting for real perf IRQs.
- Centralize decoder-reset decisions in cs_etm__get_trace(), while
  retaining thread-stack flushing at every data block boundary.
- Reset per-thread decoders for unknown or changed CPUs, preserve CPU
  metadata on all split pieces, and retain resets through empty fragments.
- Reset the decoder on logical AUX offset discontinuities, including
  clipped snapshots and missing AUX records, while preserving continuity
  across internal buffer splits.
- Link to v1: https://lore.kernel.org/r/20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com

---
Leo Yan (11):
      coresight: trbe: Remove misleading comment
      coresight: trbe: Refactor next buffer computation
      coresight: trbe: Track trigger count support per CPU
      coresight: trbe: Use trigger mode for buffer maintenance
      coresight: trbe: Leave headroom for stop-on-trigger mode
      coresight: trbe: Save and restore trigger counter
      coresight: trbe: Add KUnit tests for compute normal buffer
      perf cs-etm: Reset decoder on COLLISION flag
      perf cs-etm: Reset per-thread decoder on CPU migration
      perf cs-etm: Reset decoder on AUX offset discontinuity
      perf cs-etm: Set watermark for AUX trace

 drivers/hwtracing/coresight/Kconfig                |  15 +
 .../coresight/coresight-trbe-kunit-tests.c         | 644 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-trbe.c       | 342 ++++++++---
 drivers/hwtracing/coresight/coresight-trbe.h       |  18 +
 tools/perf/arch/arm/util/cs-etm.c                  |  15 +
 tools/perf/util/auxtrace.h                         |   2 +
 tools/perf/util/cs-etm.c                           |  92 ++-
 7 files changed, 1029 insertions(+), 99 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20260617-trbe_buffer_refactor_v2-8813e33fde8b
prerequisite-message-id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
prerequisite-patch-id: 295f75af9986fc6193b0f3ec0f144096c1194efd
prerequisite-patch-id: 60541bcf6bd25acf076fca2dd2e62ea382541fd5
prerequisite-patch-id: 0a6dbd3a69611c9bdca8ad61ea943d6577251fb8
prerequisite-patch-id: 0f4dc971d1375cd5672a63cd148b6e7f6dfdd9b3
prerequisite-patch-id: b42114d2185bbd15c9095191417aad34137cc5e9
prerequisite-patch-id: fdcdce0d19c611de475c6e9737ef544a9fb19153
prerequisite-patch-id: 948b6aa1254adfc9f89a5aba3ef45e41d891debe
prerequisite-patch-id: ba1cc65a72bcfef9e22fea14f52eeaeeb2c551d3
prerequisite-patch-id: d0efcfbe7d1f7886aaa5c34655c14a979bf55863
prerequisite-patch-id: af045abf5718e35f16a5b98ec7c04213cf24d426
prerequisite-patch-id: d0af1d9f5551622858815d148de5dc3c94cdf564
prerequisite-patch-id: 9d02a95ecafda17debf728ef1098b98030019a10
prerequisite-patch-id: c6251f03223c3bd4bcf43abc292907dd93cad527
prerequisite-patch-id: 690af6c1769b93d8712aa73b322bb4e5f0acdc66
prerequisite-patch-id: 21c3d8dacd550b977ae549a1865e43523ed64f98
prerequisite-patch-id: 0b5666068c0fed73e6906473b38861556881e5b0
prerequisite-patch-id: f5c97c9acc3e691b3612999eae97c3366acf3d97
prerequisite-patch-id: 55846a3b80ca3196062d06522af768ac83751d97
prerequisite-patch-id: 5f5be1d1c925a9c0d945eba516a9075153045292
prerequisite-patch-id: 8e39271308702e557abc4e4e79fc96d0157844a7
prerequisite-patch-id: b99199a58c4a87408c4c2b0b39ee4861f5cd9d80
prerequisite-patch-id: 1bdbfe0417a4a98984b2fbe8d664738657de3032
prerequisite-patch-id: aeab33675e29539d239c8ffdf4bbd4cf861972c6

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

