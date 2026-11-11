Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370835;
	b=DwpwmYFR13s4DaDfv9N28D6zKwdNKlsWTgYTrB5rtf7lHmytGIOXVxxQoDB7m2Ubk6Lr
	 KsxbeRmvochpUOEosmX7u/5fMCTns/oG02qjkNg+VqMM69oh8UYg6JO1EWpkVIsFji5wy
	 2sN4ZuQMBahbBaNvlR/7yFKCxqiPQKA5U9dA7REzMvsLKDW+TBWLW/V2727i0o5QkgWHX
	 9kxISadJmSdJ+YTk757CrbWkgJDmqcmTiNf9gCr5oEFN2Huq5FuPhU96glgIjPDpGPzcF
	 ZZQu98KtB/O1EKxCCHSAjnsGDiQqWAef67HsurvJ0PeT9pIWZ5jpGHtgAcCU5+P8YYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370835;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5VPvi16aTfUGvRge7NmMtGFtiMAVs5vb/QmpxWZyDtE=;
	b=XUxMcROlKigC9AVKdXwdfS6h4zCQi4oLQPu23H6p7JbFQoKF1VvnaHmxeeEhJfKIJj5t
	 HOyqR4Xrl3+fU5lqyU/0dSfbC7Ng1DSUlwf9iexNDPKSZfab2afMCWykhHVASMyNmKgSI
	 KMG2/RkGLvBQUHbwR4zTmjy0Mvv+Iopf9mg2NgQJod0CVdUFFCx4OZZRPnbge4AhTmnGv
	 IsTH16ZCkAvXXN+RTK8cazse1cvTx4u3y0iaeMmPVPip/UZI2+TOANQaJwFWHM3tFyeUn
	 ED5iXnaVEe1zgZJf9fcv7cW0vgV07MyzFq7rJfIMxbsLmNq8kAwhV3A66zZbQDJ1h5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kbete8jq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934CB606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kbete8jq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72CAF2F;
	Tue, 10 Nov 2026 20:20:29 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F9ED3F85F;
	Tue, 10 Nov 2026 20:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794370832; bh=q4bDza+9RXUkz14jm7hMKykBo0/ojwxsZGrMyrNAjbM=;
	h=From:To:Cc:Subject:Date:From;
	b=kbete8jq0c/XKOuk5zkXNSNsPrmUFXSfpTsWqba7embjkA6FQM0qtgvrR8QxJipqU
	 fpOoayaYBicrh53xDQLg7g7UhAQkkxtz7v1EPoLT2+E4Rlg+9gzIXktDP1qY5j1aV5
	 XBPQgvZk7YwG8B10h3VQc2b25E6Od7n29jk2l1NE=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Daniel Cashman <dcashman@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Limit ARCH_MMAP_RND_BITS_MAX to 24 for 42-bit VA
Date: Wed, 11 Nov 2026 09:50:27 +0530
Message-ID: <20261111042027.1541604-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing ARCH_MMAP_RND_BITS_MAX value of 27 for 42-bit VA (64K) pgtable
configuration allows an mmap randomization range that exceeds the available
user space address space constraints.

This can cause mmap allocations to fail when the maximum randomization is
enabled. Although it does require CONFIG_EXPERT for ARCH_MMAP_RND_BITS to
take values up to ARCH_MMAP_RND_BITS_MAX.

8>------------------------------------------------------------------------
[    2.269084] Failed to execute /init (error -12)
[    2.269114] Run /sbin/init as init process
[    2.269137]   with arguments:
[    2.269153]     /sbin/init
[    2.269175]   with environment:
[    2.269192]     HOME=/
[    2.269213]     TERM=linux
[    2.270517] Starting init: /sbin/init exists but couldn't execute it (error -12)
[    2.270550] Run /etc/init as init process
[    2.270573]   with arguments:
[    2.270589]     /etc/init
[    2.270611]   with environment:
[    2.270628]     HOME=/
[    2.270649]     TERM=linux
[    2.270703] Run /bin/init as init process
[    2.270726]   with arguments:
[    2.270742]     /bin/init
[    2.270764]   with environment:
[    2.270781]     HOME=/
[    2.270802]     TERM=linux
[    2.270856] Run /bin/sh as init process
[    2.270878]   with arguments:
[    2.270895]     /bin/sh
[    2.270916]   with environment:
[    2.270933]     HOME=/
[    2.270954]     TERM=linux
[    2.272254] Starting init: /bin/sh exists but couldn't execute it (error -12)
[    2.272294] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
[    2.273501] CPU: 0 UID: 0 PID: 1 Comm: sh Not tainted 7.4.0-rc2-00002-g8c7973a9cac1 #1 PREEMPT(full)
[    2.273656] Hardware name: Foundation-v8A (DT)
[    2.273734] Call trace:
[    2.273793]  show_stack+0x18/0x24 (C)
[    2.273919]  dump_stack_lvl+0x60/0x80
[    2.274056]  dump_stack+0x18/0x24
[    2.274189]  vpanic+0x168/0x354
[    2.274318]  do_panic_on_target_cpu+0x0/0x1c
[    2.274458]  kernel_init+0x120/0x150
[    2.274611]  ret_from_fork+0x10/0x20
[    2.274755] SMP: stopping secondary CPUs
[    2.274835] Kernel Offset: disabled
[    2.274897] CPU features: 0x0,00000000,0030002e,fbb88b43,2edce72f
[    2.274998] Memory Limit: none
[    2.275065] ---[ end Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance. ]---
8<------------------------------------------------------------------------

Although ARCH_MMAP_RND_BITS_MAX as 25 creates 2TB randomization range which
is well below total 4TB address range with VA_BITS = 42, it does not really
work and causes the following segmentation faults during boot.

8>------------------------------------------------------------------------
[    2.265866] Run /init as init process
Saving 256 bits of non-creditable seed for next boot
Starting syslogd: Segmentation fault
FAIL
Segmentation fault
Segmentation fault
Populating /dev using udev: Segmentation fault
FAIL
Segmentation fault
Starting crond: OK
crond[97]: crond (busybox 1.37.0) started, log level 8
8<------------------------------------------------------------------------

Reduce ARCH_MMAP_RND_BITS_MAX from 27 to 24 for 42-bit VA configuration on
64K base page size, which ensures randomization range remains within total
available user space.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Cashman <dcashman@google.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Fixes: 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS")
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v7.4-rc2

 arch/arm64/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1075bc661833..8d8b1331178a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -300,7 +300,7 @@ config ARCH_MMAP_RND_BITS_MIN
 config ARCH_MMAP_RND_BITS_MAX
 	default 19 if ARM64_VA_BITS=36
 	default 24 if ARM64_VA_BITS=39
-	default 27 if ARM64_VA_BITS=42
+	default 24 if ARM64_VA_BITS=42
 	default 30 if ARM64_VA_BITS=47
 	default 29 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
 	default 31 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
-- 
2.43.0

