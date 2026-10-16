Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B138F62F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131368; cv=none; b=PNEgbwhtzKE6Ql8+sf0cUDmrJa9bP5zeyMl7HiBxkYcZzetPape3TsSTgBmOEHkvfWJxgWseQLgF2Hw/UeYR7QVLbPQNIOQAq4FtLLseaRxGFaLxm+1yoTKj3QRGqQUlkciqAeiV65zrX1+ymBcjwPtxG10w579bO7av/xFwvgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131368; c=relaxed/simple;
	bh=SFyIaApyPoAqh1kxlCBd4ba/EGIrL5c9Dca/smC2pSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8IuWFu13pr8OjJ3ratKzNHUntZ1XeSosp3Gnwaw7Z+SwdjSAujhMeeVrzWnSLf+tuy+MtTvBpsuD8g2mxK6qbpF6C3yj+qtBX2kHs+mi9E6nFori7qW1IVamGZC/bBvwsHvtUhYe9EFDKuG3vEwQYlagTO6IBBSLKf7U4/9K3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLXTimhL; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLXTimhL"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd5cd8e8104so622655a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131366; x=1792736166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/NJsqoDw9kAgUv61Xlf8FJQUfxWPDelOgkY9LP+DeM=;
        b=eLXTimhLYtOG+y361WFIr5Y60KiGpf1e7RDJeJU5uK4bVw5zxo0hIs6f4K+lVA0e4r
         yJOakfEpLSQv6xSw4wftETTzR72mfmzWGQoluqF9za8TTwQXmezN28+spv4lfx/38Lf2
         o/GXI/ucXPQS63FYRwQhZ+mGSP0xcG9aVAFt5EvwaC4c5p3IvFSE1lPTJNcJaPQElm4n
         s84aAd8ZLUpFUDCP0nftPfzRTKg1a4EEeKoMJ7I6jGPUA2xCiLN3I//7xwKVhGQ/nG2+
         mKJDH/GIvlJQsbYnkbMxZRagVAZwsn4Fis6uYH4/UdbAfG5JdNpo4jrpjg+LvT9KAQ0x
         lwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131366; x=1792736166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/NJsqoDw9kAgUv61Xlf8FJQUfxWPDelOgkY9LP+DeM=;
        b=wx3a287r8UXgbK++a8XSWGT5n9UrwFUNs+fqRuapqApvL8yIfabVP8Qn/dZKTmsZyN
         eIH+jiZbDHCePRoU+XesiZ07jJ+69jf7rcVNgCpCXrzmCdxp/HgkaUc7yyQYu2JLLI7t
         X+HJPBC77VtsZQXZpdg7qzKxNKoYDCmya4uWxpZTDR7JvZbBY3f4ujCTr+v23mSx4B67
         +GeZdxYgYMJ7ZNl0/gPdpxOr3vyDrjJ5ZRrq7QAHCkJu/YnsM8+AVzRvgObiUny0HB1P
         ZKBpCjfZ5bQzx9VdO+HFa5nOYgo4irf1udlpGASEhRmg7SlkGxtv+HogTbjQCshmUQ7w
         FBsA==
X-Forwarded-Encrypted: i=1; AKwUvByH9bkL16SmNT91vU+vFTnGfKjNWVqQEfi6M4TCV2FayMfx5BIqg+HamAzyISzE4trpBnR7UwD6aoD6rQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD6yXTrWdnT+jMXubkNCEe2eIDITsLER+sjn2yhlUhhXSLhR4e
	fwJEnpKHCexXzr6VSE3cJuPQ+W7Q+k1KTiFPWE7bQPrhTvzIYrqkll8Y
X-Gm-Gg: AYBFou26Z8ifpLuSI3U3Cn3Uu7wKAo1f3mY0DbTXYxu7OUDUJB9wcqASB89f9zwei7N
	uL1wx9TT3qkeJLGpuq2LMvqhET8GNUO6pfaBLoGOyUTjypYHcaS+Ii3eVuRjTIuRi8m6XKXfmiH
	Q+XTnI0AB9uIHOw0+JkqphUjjUr/0gTbQrx7g7o3ykL2opkOekyiHAFJI1RkPhlo46fR6D1MEAT
	8iQ/trZ3+kqcB9+v9PIJ7AIr+J6YfEy+EPRCygzykn4P2ik5n4tmEOHruPmTf0ZrhzQmOmQpNjv
	gUNuj8HJGAk5xKGU2lI1F4idtC6ZCDgS93IhuV5H4JcuG9gwL/gUETKzFqWsWhNik95yCtwQX2m
	DYC/FTeCwhDoOjaF0U7ba4pCvWqgKuMxTYND1/aB1OiHGwX76mMUbJfVqcQklNpYIUjzgF6MWBo
	XKxXVJCQFUYdHrSRVmgc/M/U7BkjtDg+ExGGfIy4SIVLVeJFQZHg4YZ7POD5YnVh0kBEFyPRSbn
	T9zXUthkT8=
X-Received: by 2002:a05:6a00:c494:b0:89c:d875:602a with SMTP id d2e1a72fcca58-89cd8756af1mr6506797b3a.11.1792131366058;
        Thu, 15 Oct 2026 23:16:06 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:05 -0700 (PDT)
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
Subject: [RESEND PATCH v8 0/8] kdump: reduce vmcore size and capture time
Date: Fri, 16 Oct 2026 14:15:41 +0800
Message-ID: <20261016061549.4181390-1-chenwandun1@gmail.com>
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
   exist but need extra preparation, so temporarily dropped the patch
   that introduced the problem to keep this series simple in v8.

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

