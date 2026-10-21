Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571431;
	b=n5n+b6r71W+4C2/VE0AJGEhFuNYUBdbVjphB4ODPJY645PhPgILK5VK0Et6gCgCHqHsT
	 cLjUT+n36k/PZIap+bALMRN3ees+XsWy+mO46JnNLLfqEj1ryZzY7RkPhu2KD6NUPXakA
	 ao0p84Imyg6B+i5+oULnEgNA+vew6DKKAp3D7Vi3TL9nZVgXne9xG6PXS7tGqiYhg/IN0
	 Gag3yl46IPcnT1g0zmO+pSeXDV9E4vAFgSojWLIwxViXBxk3EpOZ2B1D5SE3Vg3M/cTpH
	 TaZITnoSmivxgUQ9ofrJuwTjObLYDw/WHXO5O+pyR3WrmBVZKfdangh4TQbESJkq0Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
	b=USPvxfaSN/lYk3z4+Au441O7h3MK5sDNVQjFe8xzFVbMcK9Gewn8CNwLNdIYKWtuGONT
	 r8AS5P6W4fsuZ7NhTYvyo6L8Du/QMUq0fjQayMoApwcUBdADKoM8b/q0Gj76IJe1/U65g
	 hUaztv8C1AFZ1yQr86UIQu3MES5izJFlD0A2+mV2bkUlc3aLi8xu6+Rpi+d0Fb8qv182g
	 S7VDKTiFi6fTd753nCe3/BHXM09SzfEOKCnUkX2av9kGjHvyOjQzdFVpNHNxjG5mt2hFy
	 vooOlhKUa/fc32sjnCQi4CjapVU0E0wYs72kglDzPS/FkgDDIgQ8ayQu3McqHeCImRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hnkMDzMG;
	arc=none smtp.remote-ip=74.125.228.6
Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F89606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9F89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hnkMDzMG
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd613507bd1so29353a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571430; x=1793176230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=hnkMDzMGd+RR0t0wSvMoYCKnZWGmdS838KdZLqGb03rGS6n5hh10MnciXr2GsJkbGq
         1VbjnPGzr5abqOyDd8YhBXAybcYDmTJcDpODLfBp7aQFRIr+tRPA9SFNbODb5o8EMI89
         cYuQ4rN0KoKeQ5BL/+TJhs/VPSwSsIZRk3h9re4rpwFsst6yODRVPd5dfhOXcFSygKea
         zWzPu6ncxMXTNWZ3HT9tnd0p06hUyH8czgUmpqmARR5mmYIfKVHr5wkXl1VIiG7Cj70Q
         ANBWoBay4O9x09K1UAuqzweTPIYs0OAzY2+SIoRgwZhkNuxVbZMZYK7x4ynXydZ2EE3f
         2lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571430; x=1793176230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2i7Do+cloqJgPeb5aYLDs8IqOGcJVVvWxpYdA4Y6+Q=;
        b=cUNEhHo9Jg2v0thFQh7Z29QCeGrCcK5AUGB47p7zOe9rzriYFFr9RZbDlo42tfnTrW
         SdFccLnyCbzBvvN7CCkWLWIoIHdZFhMY42CvsLCa2x/87AU+ozKYl3mURDLtOB2Bjbyd
         sjGry7xFYOIjP8Kph0eXVb8LoQhGZeE5aagyiWFu+4daMc4eyfyPifzuCgcXgps6YYYm
         RVl+2IlpdVb6jwId+K1xwV5dy8Nwy5P1rnzKBckcOIJfKjERa1U2UIRRSP5cKWQtGshN
         xWoEMYe2FbSpnubGl4v5mF3TUhaA3M73ZRCKbeTnQzkB5Dxt36RoFKllWkU8MWa72kAQ
         tmHg==
X-Forwarded-Encrypted: i=1; AKwUvBxRZp5GhKsus78oiycLHooKGFk457yJrBpJ2D/p/ELA0Jvr5V9oycLkHXeRu24c7Ui8NKk4TN7EormCGuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHj04LZrcb0v0BRaoEv54Y8yYQrIS7ommgU1CkcD0AQWVZPmXS
	GxyeAGU9tTNGu2YWk2PWLfHd9xiMPdS9V2RmrtY3RY6MuNH6ftXXCx/y
X-Gm-Gg: AYBFou0zzJfeGfkcI1Ib98CrCt2G1FPMqLB786hdMFV2JMQy5RUOkCeboIYAeI/Hb3b
	AP8/p0Nu+rQ/O1DdzhLSX7Vcvdz+bRsSprfCAAqBM1htxPyD+U1pOlnCDMUwOgqhTiMeeXtsutr
	vMStI1u93m+y5KUlTy/ervb1oMbxvuntnj3Ss3jEWq8ZPIX77HJfGsg5Rgz6HzPpgts1A4xWF7g
	+tgVEbBUYzEgp7UYM1CQmjFp3NGY3NlTS1DUh3L9FRjQdbOSfN84VAnbG2ssVdYu5R0ovbAiw7r
	lUuXGZqX+bW4zMpM6eomn6Dl7SqOt3gImJEGT8n8r6anhEeo13EtNPFEOWMjzw+TSmOnsa1nzEq
	Q/U6Us3o5ORGB0Ghjx322TuOvSLciJOXRPCc2ez8aAfYjF6Yc7Ls7ZhXUJj19znPSbvKQ/yApdU
	S1kuvlC/3AbR5NcnFEMr5JHIHMriTOclpOYlIqLdnaNDUeOHcWARQjn9FKlkQ+qi3H9m+Us3MDA
	+loOhhxawx3he3d5w6JEsQcuJd641qylXiGGg+8HeQsrkJAI7Po79xnUqnrrqV+Z6ni
X-Received: by 2002:a05:6a00:918c:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8a089d5de3cmr958437b3a.40.1792571429981;
        Wed, 21 Oct 2026 01:30:29 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:30:28 -0700 (PDT)
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
Subject: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
Date: Wed, 21 Oct 2026 16:30:03 +0800
Message-ID: <20261021083011.2170525-1-chenwandun1@gmail.com>
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

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed, found by Sashiko in [1]. SH supports
   neither CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when
   both are disabled.

v6 --> v8 (v7 mainly tried to fix the initrd issue on release in v6,
that approach is superseded here):
1. Stop marking /memreserve/ regions with NODUMP. v6 marked
   /memreserve/ regions with NODUMP. But a bootloader may specify
   a /memreserve/ entry for memory that the kernel later frees
   (e.g. the initrd), and those pages would then be wrongly
   filtered out of the vmcore after being reused as normal memory.
   The v7 fix (clearing the flag in free_reserved_area()) caused
   a lockless runtime mutation of memblock.memory [2]. Better solutions
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

v6 --> v7:
1. Fix a stale MEMBLOCK_NODUMP flag issue [3]. Memory reserved and
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

[1] https://sashiko.dev/#/patchset/20261016061549.4181390-1-chenwandun1@gmail.com?part=7
[2] https://lore.kernel.org/lkml/20260922090252.B01541F000FF@smtp.kernel.org/
[3] https://sashiko.dev/#/message/20260917220750.GA4013814-robh%40kernel.org

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
 drivers/of/of_reserved_mem.c               | 18 ++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 103 insertions(+), 94 deletions(-)

-- 
2.43.0

