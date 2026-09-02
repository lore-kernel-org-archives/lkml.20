Received: from mail-pz2-f3.google.com (mail-pz2-f3.google.com [74.125.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036A02BDC0B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334296; cv=none; b=fqMxjyu36UIPRbCpZctIs3xmcMeK0KTYhCLksp0WkY5qumjuFH7JlcBLRc7yZSecTvTMmt26dccNBDX6vu9pmU9sAqixzST2U5kAjjJrUkrfYOMHVbrRVLjg+sg/dMehJTWlH35/o+5SlV0EyQM4hJ3olP4khTnBnOj5zRAW5bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334296; c=relaxed/simple;
	bh=RWIEXwoFCLRI4LG31OsYGEbdius9ZAooyaqbm1078lw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFfMOrPJ/GK4vyrKalOisZ67RjOYVd4eDogDo5GQq6sZtsZwyt46XqFdvn4tuL172uzo0m7YTQkx3H4xgy7YthksRx1DTRDxpFaTf8vNerampMGgrgAyGqROw1FYiiB1UvJGW8GIjcO8JdWFEvwHGMtpC/5nt/dVizPPRl36tJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hxrdkzj4; arc=none smtp.client-ip=74.125.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hxrdkzj4"
Received: by mail-pz2-f3.google.com with SMTP id 41be03b00d2f7-cc1beca96deso383416a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334293; x=1788939093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5vjeiQCLsTjdZkQJr1qZRy9fU+p/hRxqt/dZCpjN/k=;
        b=Hxrdkzj4sZf7oznppS69J7rfALXljon7BZK8NmPK/qy3WPXlxg3H4PC6uRrG+SZYrY
         g0TehGywLiXDiqbXDvv5FAQmpsAJZ0s6vkYs60lp5mby+tLj5eGJzsuYIpnMBjubcrcU
         oSl5ALGLtZSLxVBfvmoTBBly+tIGSVyibIrNZXvRsk7n+76or1Cx3VEThtaW8bGXT+MD
         RCWS2x1rOygMBeINdeMThapXprz+5+dsv1f5xdA2ddw8wgKmT37DzAMbPiRsnS2/Pytx
         RxfmGpGLnhF4bZ6e0I5g7KiRQpsrKnZIPNzz7n/e8lMd0hN7Km4QIWMFZ5+KNZWclFOY
         3blA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334293; x=1788939093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5vjeiQCLsTjdZkQJr1qZRy9fU+p/hRxqt/dZCpjN/k=;
        b=k+lOgx6EUQrkuuGFxMctPq1768uD3Z03EFDFviSxUTmf9ufD5HV8zs29zCd92eBS5r
         eUfNM23BZyJhnhLBbfoYwHxGliUOZHVPspZVIhHvOZ6E8cjvhxi8xayW0lykEHkLBLHr
         40tvMyoPHAhc1Cczxuk3olEeX0b5pdlydzaKBk/LT9WXKPyVqfDrsNc7qcOAhGRc9QAE
         KA7PnGyujMVOriBjgk6lVO2QEmdVEa8ekELUsMqYi0HSeZ/ZO1ux3c+8N9qGX23BRHYg
         XJOwrzdim4i+B7HS0ZPn5uevIHWN0wBj35f694ktmaUjxUi5aUwwLaYNIcjLAJm3UmbP
         NzSA==
X-Forwarded-Encrypted: i=1; AKwUvBwkQzy59C89Dzkz0BJYcMKfZjJmLKdOYyygseHigM7UHvvsJshijuDjs1GB/ZM8xFiU7b/DdG0rhrByCKk=@vger.kernel.org
X-Gm-Message-State: AFuF++nkYencBuFDHRgHQmD26Hxs8SaAthDf5YfN7oQ3f+sdjAMaLL9/
	2ILsTv6BVTqkkKx+RHr+tqpLXvofuPYFDzlcoP6IKm5uP1cIX3CU+RfO
X-Gm-Gg: AYBFou2lxzrSEewjgRQvQMhfNVarNVVLTNBMmYWY0JRmzMmETIncfWZyWtMKnYiruK0
	Sk+uEFt97uwSo853UX+OnsNX3JPtup5+4QeHMxKkWWQD4kfc1g6uQ2n487ye/kj3/gveR5yK4gS
	1xvC8sb43uAJ4LBbXkbIkpcSqX92xSbxVy26halsx4VTomwK9AFPv8cJqPefFkI2j0ge/2nAFxa
	y96Sg8PccDrk/RoQfn29/TxkuwNZ+D292Pe0wnuKEYg99YDyWEoax7x4deUfUdaq5TW4XpW9b3F
	uzfEuhbfKep2GPzSJUG6RB34P5+6YE1vlyj6FvDVnEI82gN/nPb0pO7pPZR67PBnR8dkdTuxBqL
	ww1sEpvnLNEGolFWRA5a2nDjx7YspFqXg1UAP7lsL6b9dJ1YJajh6xcF0rAaimDWwF9nKJ05D+z
	kJ2YRXhgwG+EWhDU56qvW4cnwXzhoAynbHR/ve4E4BQtHiuueFVTMjXG4hVVtxcA2C8j8UV66r
X-Received: by 2002:a05:6a00:148e:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-85ed1d0414dmr5028771b3a.5.1788334293213;
        Wed, 02 Sep 2026 00:31:33 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:31:32 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
Date: Wed,  2 Sep 2026 15:31:06 +0800
Message-ID: <20260902073116.802752-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

This series introduces a MEMBLOCK_NODUMP flag in memblock to filter
reserved memory on DT-based architectures (arm64, riscv, loongarch).
Reserved regions default are marked MEMBLOCK_NODUMP so kdump omits them;
reusable CMA regions are different because their pages are handed back
to the buddy allocator and may carry crash-relevant data.

ACPI systems already filter reserved memory out of the vmcore through
their existing path; only DT-based systems currently fail to filter these
regions, which is what this series addresses. The flag lives in memblock
itself rather than in a DT-only structure, so the mechanism is generic and
both ACPI and DT systems can benefit from it (suggested by Rob, thanks) [1].

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce. 

The series is based on linux-next and is organized as follows:

Patches 1-4: Preparation and bugfixes: fix the missing HugeTLB
             flagname, switch riscv crash_mem to memblock, fold the
             duplicated per-arch memblock walks into the weak
             defaults, and serialize crash header preparation against
             memory hotplug.
Patches 5-9: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory and /memreserve/ entries with
	     MEMBLOCK_NODUMP flag.
Patch 10:    Exclude MEMBLOCK_NODUMP regions from the vmcore ELF
             header.

In v5, Sashiko found some pre-existing issues related to reserved-memory,
and has no dependency on this series, so these issues have been addressed
in a separate series [2].

v5 --> v6:
1. Serialize crash header preparation against memory hotplug to avoid
   out-of-bounds or use-after-free issues.

2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
   avoiding a panic from too few regions before resize is permitted.

3. Reordered the patches, put pre-existing bugfixes earlier in the series.


v4 --> v5:
1. Rework the mechanism around a memblock-level MEMBLOCK_NODUMP flag
   (suggested by Rob) instead of the v4 opt-in 'dumpable' flag on
   DT-only struct reserved_mem.
2. Switch the riscv vmcore elf header preparation to use memblock
   instead of the resource tree, aligning it with arm64 and loongarch,
   so riscv also can exclude reserved memory from vmcore.
3. Deduplicate the vmcore elf header preparation: arm64, riscv and
   loongarch open-coded the same logic, so fold it into shared
    __weak defaults in crash_core.
4.  Drop the v4 patch that saved /memreserve/ entries into the
    reserved_mem array; /memreserve/ is now marked MEMBLOCK_NODUMP
    directly.

v3 --> v4:
1. Rebase this series on v7.2-rc1.
2. Add two cleanup patches (patch 02/03).
3. Simplify patch 03 to avoid checking whether initial_boot_params is
   NULL multiple times, suggested by Rob.

v2 --> v3:
1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.
2. Fix UAF issue when alloc_reserved_mem_array() fails.
3. Add some prepare patches.

v1 --> v2:
1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
   feedback [3], v2 drop that property and exclude reserve memory
   by default.
2. Split some prepared patches from the original patches.
3. Address coding-style comments on patch 5 from Rob.

[1] https://lore.kernel.org/lkml/20260723234126.GA3253409-robh@kernel.org/
[2] https://lore.kernel.org/lkml/20260818092420.2859026-1-chenwandun1@gmail.com/
[3] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/

Meijing Zhao (1):
  mm: memblock: add missing HugeTLB flag name

Wandun Chen (9):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 ------------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  2 +
 drivers/of/of_reserved_mem.c               | 48 ++++++++++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 51 ++++++++++++++++++++--
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 17 ++++++++
 14 files changed, 131 insertions(+), 95 deletions(-)

-- 
2.43.0

