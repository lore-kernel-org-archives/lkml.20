Received: from out198-21.us.a.mail.aliyun.com (out198-21.us.a.mail.aliyun.com [47.90.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93A3B19B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491714; cv=none; b=lndJ/j2EHBaIa6LSxxSJvIjiGC4KaCHpsk7YrrjgdZBPMUEJAgaYdIxCY5r/1JkUr9e2lK2aNCvw0EfKiZv6ST73wdtqGG0KA1RO9pgRxdkl54Jr26Y5mgNgk0a3wY4SS5QdwnZNJdiVwdikPIQ4ASzF+ReEFpWQVKaU71YJckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491714; c=relaxed/simple;
	bh=7JHv/oUO1glsXACWcyOizSGmq3RjHi1PHy5jlFbpQdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YdaDLKgUOb/TajUx/EcsBqmoUA7Dx5S6YwOxnIpimGEuDnf4r4fbbfK3GtozP6T7AJsgARFVnonKE8gM8NhN0m53NKy7i19LRFzHfG1Z6SfuCLCRYnmpveehPXoYoGfaZ5AHlrP3nu07I2TvyP19/ysTmMkFd7b6uh3uZ+9UY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1374914|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.293729-0.0054717-0.700799;FP=17705932824423996475|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033022149254;MF=fuhao@open-hieco.net;NM=1;PH=DS;RN=17;RT=17;SR=0;TI=SMTPD_---.j53GVsc_1788491362;
Received: from higon..(mailfrom:fuhao@open-hieco.net fp:SMTPD_---.j53GVsc_1788491362 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:09:38 +0800
From: Fu Hao <fuhao@open-hieco.net>
To: puwen@hygon.cn,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	hpa@zytor.com
Cc: linux-kernel@vger.kernel.org,
	tingyin.duan@gmail.com,
	Fu Hao <fuhao@open-hieco.net>
Subject: [PATCH v5 0/5] Add support for Hygon family 18h models 4h-8h
Date: Fri,  4 Sep 2026 11:09:12 +0800
Message-Id: <cover.1788404433.git.fuhao@open-hieco.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

This patch series introduce support for the new-generation Hygon
processor models 0x4–0x8, addressing five key areas:

1. CPU Topology Updates
The new processor introduces a revised CPU topology hierarchy
compared to previous generations. This patch updates the kernel's
topology detection logic to correctly identify core/socket
relationships and cache sharing patterns.

2. L3 Performance Monitoring Updates
The L3 perf registers of model 6h differ from those of the
previous processor.

3. Microcode loading
Add microcode loading support for Hygon processor.

4. Audio Controller Driver
Add initial support for the integrated HD-Audio controller.
This patch has been accepted and merged into mainline.

5. New SB IOAPIC information support
The southbridge IOAPIC of Hygon's new-generation processors is
located at 00:0b.0.
This patch has been accepted and merged into mainline.

v4->v5:
  - Add HYPERVISOR check for patch x86/cpu/hygon.
  - Refine the commit messages for the third patch.
  - Use per-CPU MSR read for microcode revision retrieval.

v3->v4:
  - Rebase to 7.2-rc2.
  - Refine the commit messages and comments for patch x86/cpu/hygon.
  - Add bounds checks to the microcode patch.
  - The HD-Audio patch has been applied to for-next branch.
 
v2->v3:
  - Refine the commit messages for patch x86/cpu/hygon.
  - Update the logic for deriving the LLC ID from the APIC ID on Hygon
    processors.
  - Clean up and refine Hygon microcode support code.
  - Refine the code of Hygon HD-Audio device ID.
  - The iommu/hygon patch has been accepted and merged into iommu branch.

v1->v2:
  - Refine the patch x86/cpu/hygon.
  - Do a separate compilation unit on hygon microcode loading support.
  - Use "access_sdnctl_in_dword" instead of "hygon_dword_acess" for
    accessing the HDA registers.

Fu Hao (5):
  x86/cpu/hygon: Adjust the die_id and logical_die_id for Hygon models
    0x4 through 0x8
  x86/cpu: Get LLC ID for Hygon processor models 0x6 through 0x8
  x86/cpu/hygon: Remove Spectral Chicken for Hygon processors
  perf/x86/uncore: Add L3 PMU support for Hygon family 18h model 6h
  x86/microcode/hygon: Add microcode loading support for Hygon
    processors

 arch/x86/Kconfig                         |   2 +-
 arch/x86/events/amd/uncore.c             |  48 +-
 arch/x86/include/asm/perf_event.h        |   8 +
 arch/x86/kernel/cpu/cacheinfo.c          |  21 +-
 arch/x86/kernel/cpu/hygon.c              |  20 +-
 arch/x86/kernel/cpu/microcode/Makefile   |   1 +
 arch/x86/kernel/cpu/microcode/core.c     |  17 +-
 arch/x86/kernel/cpu/microcode/hygon.c    | 851 +++++++++++++++++++++++
 arch/x86/kernel/cpu/microcode/internal.h |  20 +
 9 files changed, 976 insertions(+), 12 deletions(-)
 create mode 100644 arch/x86/kernel/cpu/microcode/hygon.c

-- 
2.34.1

