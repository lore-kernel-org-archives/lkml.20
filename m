Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C078371CE3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120156; cv=none; b=hhalXjZNh+ZNTPPQfiONswCW+usPQNOIRA6PppE9ZMKkJao2PBLxaJ09FL1OTQsbGtJNwYJZvlDlRhslyxfLWTjyg8fKjAn4DRnA6/04JI9dpyQXB6ANo319ac5QVFRL9CndzgXSr/+ECCNCMesykQ9GNMR4o0gQulqyav+Yl4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120156; c=relaxed/simple;
	bh=PpYg3/Cmk2CzPlG98OVhEDOXoUWD9dGaoWaQvMSxYs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=osT8Utm3Jze2lNQ8FsqCguRXbEhKpZbTJhzewMba8zdwqV3GVj0lXxpakzr6xE/aZcWpbh/JSNJtSrZba2KFPsgSWwE+ET6dWGxJ2AmM3dEVhtnpOYGa5IrbYPu/6tX7KVOiFT2dSDfBKNAzZeLrRnw6AworIWEO4MePvtKB99Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJkczYb2; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJkczYb2"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3a51696a650so3488637a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792120153; x=1792724953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ed5L209SneTzZcWvCiPDVyFxWV1jqEY6cKUsalB6bvY=;
        b=FJkczYb2l4oDt5Ywi8qBhH/vBRnESY9aK+yO+bpX10HxvuifgI7XSnJI8HvqrWSACp
         jFJxlLKihjOMxrguziXrNEOFyTQpzgPC4pcVW8aQLa5EwwebzV42pyWeoAJQaD7K/EHG
         HbVnQUwNRihZYK9/C6jG7kIMaACDpOPYamWGKbbtl2NqB7zkm8oZGfzOPpen8duICDf4
         Mqp4zWAcmZTSp6yxuy7wPfSUaUTrE+Dxht2iS/SW8KGafiib+Fr0jq/ysG10Ojr8fwjP
         ei536N9GzJjWFOc+XzYEq5zquXaiy8s6MJJb3UTnMzbv1RJY4DWf/TAJPszlSc3xlQzh
         ZH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120153; x=1792724953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ed5L209SneTzZcWvCiPDVyFxWV1jqEY6cKUsalB6bvY=;
        b=bFzHAPYaV1IMtcazo775eJiRcwB3TirX7gYJIozLJmZ1xmVokRNJghczuMMff3hugm
         OvS4Dx4Le8WDfcWCg9UygFtWB9tpSBAG6FkXtwDa/iT9dHQNigoNiy4sjT+Kiwp/z/g1
         YUDz5BxW3FmiOa5UCqy2Hp2JaQu7rLjmRZio8aGAOnCYVRUg5fLxfG/O4vpjpDZoZF6c
         xeOcWQ0F0N5FFe82ngTOzyB+WaaSepBuRKZ3YLvBHzIgFIt/viT6xN9U8ojyCEVmDbP3
         PaDpn0SR73MdBK6wI6e0R5jA9nMUn8+kEcw0kzL9dW7ALlGHsSHuHlFOdE1KTCFz/K2V
         pPXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpMoVj3xN0VZQrUK1JQb6NZ9Up9lbYX6Y/ZMXlfycO0UKsMZQuAr8SJ9qz1RDlvsCodxoZLc6wgfKlA/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA64dR74SrbM4vikFojtdJDwlvG/8i76CI5L/mb8PkNJMrl6aD
	VibGQUZaVAp3fzUuOiPM3pe2uKXxu5eF6YNcoHdDzuP/D8gNkMAl51Fl
X-Gm-Gg: AYBFou2giGjDgqrrMarfNx78/v9ki/93QawNr06B3phGX4deTNOYAAeTSrPUYIaZCak
	hbe8WPcwMwDZhzhwB/LmfVOhoAa9cxzPpoH1a9esfo9VeMXUm7RQAkoDANEzFOgayCxUHfNX9tB
	/UHhXsLHs40NBPgrDQuIiSozaXhvrealB9nXdhJurt7uVKI6OggfYxcnpZaG3oCZN7WqC7NBvvy
	E0WAWL2IOXqUiIMzRI8ClySaSRy8lr0r7IrrNmLIugxaQ96/3ZsAHeFwjuSUZ4M6tb1KqG3WW5A
	zKbMiwxWPSf/KRIrmZwhKopRqemhlTo1Xr3/UyOHijlZuFVPHkGlNtZ2U2m5JRQcKdQDR3KPn/H
	ZvZQ3NrrS2octaIcBLOYgGfkbXEIdQueArVTiemPCdIYEHK70aOGk7vzfLtJCAloLTYzVTbO/c8
	yV4RT9OjyXWsKxu/hshwhNVPQbYDGfnoT2tC0RCxhv+8m5rrJQ1zn+kn/Ja7frjgk4tljynOsE/
	mu00GxQZUe1yZ4Zcj85Fw==
X-Received: by 2002:a17:90a:d44d:b0:3a4:b0f3:6597 with SMTP id 98e67ed59e1d1-3ab39fea5c6mr19481452a91.0.1792120152572;
        Thu, 15 Oct 2026 20:09:12 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm370085a91.4.2026.10.15.20.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:09:11 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
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
Subject: [PATCH v8 0/8] kdump: reduce vmcore size and capture time
Date: Fri, 16 Oct 2026 11:08:47 +0800
Message-ID: <20261016030855.4062882-1-chenwandun1@gmail.com>
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

ACPI systems already filter reserved memory out of the vmcore through
their existing path: firmware reports those carveouts as unusable in
the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
(is_usable_memory(), efi-init.c), and the ELF header builder has
always skipped nomap regions; only DT-based systems currently fail
to filter these regions, which is what this series addresses.

This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
memblock to filter reserved memory on DT-based architectures. A new
flag is needed because MEMBLOCK_NOMAP can only express regions without
a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
so kdump omits them; reusable CMA regions are different because their
pages are handed back to the buddy allocator and may carry crash-relevant
data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
             memblock, fold the duplicated per-arch memblock walks
             into the weak defaults, and serialize crash header
             preparation against memory hotplug.
Patches 4-7: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory entries with MEMBLOCK_NODUMP.
Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
             ELF header.

v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
that approach is superseded here):

1. Stop marking /memreserve/ regions with NODUMP. v6 marked
   /memreserve/ regions with NODUMP. But a bootloader may specify
   a /memreserve/ entry for memory that the kernel later frees
   (e.g. the initrd), and those pages would then be wrongly
   filtered out of the vmcore after being reused as normal memory.
   The v7 fix (clearing the flag in free_reserved_area()) caused
   a lockless runtime mutation of memblock.memory [1]. Better solutions
   exist but need extra preparation, so they are left out to keep
   this series simple in v8.

2. Fix a build failure in patch 2 with both ARCH_KEEP_MEMBLOCK and
   MEMORY_HOTPLUG are unset. There the memblock arrays live in
   .init.data, and the weak defaults referencing them create section
   mismatches, which turn into build errors when SECTION_MISMATCH_WARN_ONLY
   is also unset.

3. RISCV recently gained crash hotplug support, so adapt its handler
   like x86 in patch 3: use __crash_prepare_headers() instead of
   crash_prepare_headers() to avoid self-deadlock.

4. Update the cover letter per review feedback: describe how ACPI
   systems filter reserved memory and why a new flag is needed
   instead of reusing NOMAP.

Every patch in this series now carries an Acked-by or Reviewed-by tag.
Patches 2 and 3 have changed since v6, but the changes (a build fix and
a riscv hotplug adaptation) do not alter the logic the tags were given
for, so their tags are kept. If any tag should not be carried, please
let me know and I will drop it.


v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [2]. Memory reserved and
   marked as NODUMP may later be freed (the initrd, for example),
   so the NODUMP flag must be cleared accordingly. Since the fix is
   part of the NODUMP infrastructure introduced by patch 5, it has
   been folded into that patch.
2. Drop the "generic" related description in the cover letter.
3. Collect the Acked-by and Reviewed-by tags received during the v6
   review (thanks to Baoquan, Mike, Rob and Marek). Patch 5 is the
   only one without a tag, as its Reviewed-by was dropped when the
   fix was folded in.
4. Drop patch 1 of v6, which has been merged separately.


v5 --> v6:
1. Serialize crash header preparation against memory hotplug to avoid
   out-of-bounds or use-after-free issues.
2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
   avoiding a panic from too few regions before resize is permitted.
3. Reordered the patches, put pre-existing bugfixes earlier in the series.

[1] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
[2] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org

v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/


Wandun Chen (8):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/crash.c                  |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  1 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 15 ++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 100 insertions(+), 94 deletions(-)

-- 
2.43.0

