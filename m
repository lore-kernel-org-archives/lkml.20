Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025919;
	b=WOod1PZnZpNEg6ZQ+OSHLwIbupzH8uutagxvh/VO9vxu73c8xqPIci7SA01CDIX5FfOM
	 UrmcOlfPyGcD2qX3hoN9os1AY6wNX7STAC9tzLCmS9FU5yuK9+dm5snBq32J0P9r6s1jB
	 DoFdE00yTD2efYuhqJQ5kdRuEIBkmCMbdzjFVr4PsgFymsjxsGllo1SS3CJSQGY+WXteH
	 wtWdbz3SFF0CAqawMlcMYkauvJwAuJEkTs9iXyxOfJsrWZzn5eN3z80q9luuUqY4+w06h
	 U3RclSuVcEyhkxTpJPWFmC2HEyyytXW+Mb4DS+KIiK4sQ2VMHzy1rZaKLtrABydnl1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
	b=UNWGjmf3tmxH2lctb1wFIS3fgZ/n2k2PpPjA/Mvrrk1W1fuC+PQR/4q5070rTKvEM+Ch
	 IqbZWFiyIFh6eauRREcP74tJtXpi3Ru7anA3I0LiolT/z0AacRvjZXm2aaUWWfqzcpAge
	 Tlb5+7Z6A9eSiRu4YsSIcf6E0/NP1QepM/pN/c06hclzfuNkhOQgyy7gRyuFlSJvd8X+e
	 X9y9VquX16PW5Pz1dj8W9u4fnm/Kqlr+9SEMEvwzZAFlmKiHx4BuPQyjqvis2HrwfGTeS
	 1vSEyBlfrIkbiosNEUqij2DT5lU5OxtIdQ/Jlc01aaZIdtyGr4Domoz4kCRgTeldpow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X0EQnD75;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287F0606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 04:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=X0EQnD75
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb681db419so68242a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 20:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025917; x=1794630717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
        b=X0EQnD75PIK6vc2eVCS5KpgklpuhKr/WyFpvsPfyHY+zSsNm071AVoO8F1DmpaUfWD
         yp3xzgMU557Jkf+8OJGDlyt1CFU4YFbYmSFv/iRjSUsXoy2x7PYtDUwOTpsqoobZ/1EQ
         XVNB7Vpsd3nF8nCwMkMR5NT5LfRqIfAqeEySi4P6QWAI9xMCRD59iSf0FzYVB6KksWRz
         /Y+4EMYXWNT81sZZoapBW8joObXg3geIsx0HLll0rLrf/sUN7AYArzIwohjQJyt2fy/e
         nIxShM6NJMqtmwp7UXNNqw2SztYcQpkY0Va0eW9FkB0IiButJ4dF8j2OtlAYN19AKsZN
         sVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025917; x=1794630717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMJYIXC5HK/L92Fsjcvgr4iGfrMwtNzZGIshDMxf8u0=;
        b=0nRBU/ai82ro2zU88664w0dc9PMuPsD2yFjd6DpI0LRiKOPj7UIvHz5OdHeE+3CTO6
         vqyZEsUw5eeqZQfZN9ElSiSJYSUNRC4f2VNT+sjACXOw3hmSESm8VwvjOwyMFXMsHNdH
         gf7+0+BVKS9n3lbF9ZnnYpUL5XitfOcIuv2w5qpj42/KA7QSUuZIFIMIoNcQndHK1v4m
         6Ups2FUoR//cR71imKm31M7fPmIFwQYKaplTbjkprJRk3x3RomzJeyvuBtIx6DZ4i9BH
         Zp6XJUfu1bce4sCQ0XLGMI3daOKH03u72pCKf1atY2Eep6oCk6Mo90vNSRPX0s+Lfp0k
         35WQ==
X-Forwarded-Encrypted: i=1; AL+hErG1RugBcyYdPmHmqE8Un8TkyCezZn4Z6TF1CdhYQ4L6jk7uLaqQqLTjFTEHLWiz6WaQvc6RcwRICHoA9TU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Nwyd/qI4APs4GkZ4ooX7WDuq4WVkOCNQ1ZnQI5jv9abcpOa1u
	pmbInG0iZtmYAIq0Fk4b5BYIOqFnyCba5MDGhUu9q1rv0FHzckILYFOJlKsPA4YolBY=
X-Gm-Gg: AYBFou3BPUNQ1Uxe6QiuBl/83FllZb4NOpGSBo5Hbnq5OIhCEY+RjQFxBh3wCMKVBX9
	pFX/qVUZSmqZBaBmAS73IRIxhYpHwSDTaxAs4p6Gwh/pLMkhrAIdlFW16Ben+k91Td4iNc9Zmaw
	wqxwzzcJuZiBOS2Jsjn3uoqLcZGOw6fmTxlkCyA+8YyZtdyQrcIW9ua11oyNB0gSlS5p2tISl8l
	fVZovfbXe9PqgP2JGimK1+rGIFW/vEgcHUV1HxfALoK+nRmX+bi+5dIX3KxcZxlOGA0DRLxfGOz
	Rv+fhmE0zsRlTLK7vo/mpEUziIhTDikT/oUHadLc5lS14T9bpa13+C4Ad09btv/+7g4LK4dTXz5
	VFr+51oEDoiyZ+4rpBrfUenHqJz7drDAHjTMJy5RbdbXK7AGQxQfSy+dPRVPTRpnvIKiaVTGX7E
	0Ld8/aNDAvRgcf73jZwDBhkF4LoxxOLqdj6bZZw4hETLzWgZeZZUsRPFvjk2DCV8z5kXudOuyxg
	BIdD9FnQLZYUFkdhDpMuKn3SD+BbHwRSDv+qDCB2TCtfdpjfCLlE/ZgTKOADDsfvs208ivyn2WN
	380VX7yoWVqm/UVSoPQhozBnCcpD1TtBHzSnzNFNqlWNFPuHv+JbIZvJdjfx
X-Received: by 2002:a17:90b:3c0a:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3b1060a6be4mr758538a91.13.1794025917280;
        Fri, 06 Nov 2026 20:31:57 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:31:56 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 0/5] mm: Simplify device DAX vmemmap optimization plumbing
Date: Sat,  7 Nov 2026 12:31:17 +0800
Message-ID: <20261107043122.25650-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: simplifying the device DAX vmemmap
optimization plumbing.

After device DAX was converted to section-based vmemmap optimization,
whether a mapping can be optimized is carried in mem_section, and the
architecture-specific population path can handle any remaining fallback.
The code still retains the DAX-specific vmemmap_can_optimize() helper, a
PowerPC override, and @pgmap arguments threaded through lower-level
vmemmap population and memory-removal interfaces. These duplicate the
section-order policy and keep otherwise generic paths coupled to
dev_pagemap.

This series removes that obsolete plumbing by consolidating the
optimization policy around memory-section metadata and simplifying the
generic and architecture-specific population paths. This also eliminates
dependencies that are no longer needed once the optimization state is
carried by the memory section.

This leaves the section compound order as the single source of truth for
vmemmap optimization and decouples the generic sparse-vmemmap and
memory-hotplug paths from device DAX.

This is another smaller step toward the broader HVO generalization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

v3:
- Rebase onto mm-new at 684242af7090.
- Move section_vmemmap_optimization_disable() out of line to fix the
  LoongArch header-order build failure (reported by Sashiko and the
  kernel test robot).
- Keep section_vmemmap_optimizable() in mm/sparse.h and leave the
  vmemmap_optimizable_order() relocation in patch 4.
- Tighten the disable helper checks to require one aligned memory
  section.
- Collect Reviewed-by from Lance Yang.

v2: https://lore.kernel.org/20261105061217.13302-1-songmuchun@bytedance.com/
- Rebase onto mm-new at dba8aba0a9a0
- Add section_vmemmap_optimization_disable() and use it for PowerPC,
  LoongArch, and altmap fallbacks.
- Add a LoongArch patch that keeps device DAX vmemmap optimization
  disabled while leaving HugeTLB HVO unchanged.
- Ignore section compound orders that cannot be optimized.
- Add direct vmemmap-optimization.h includes for architecture users.

v1: https://lore.kernel.org/20261030140720.1256062-1-songmuchun@bytedance.com/

Muchun Song (5):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  loongarch/mm: disable device DAX vmemmap optimization
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 +--
 arch/loongarch/mm/init.c                   |  7 ++--
 arch/powerpc/include/asm/book3s/64/radix.h | 12 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 ++++-------
 arch/powerpc/mm/init_64.c                  |  2 +
 arch/powerpc/mm/mem.c                      |  5 +--
 arch/riscv/mm/init.c                       |  5 +--
 arch/s390/mm/init.c                        |  5 +--
 arch/x86/mm/init_64.c                      |  5 +--
 include/linux/memory_hotplug.h             |  8 ++--
 include/linux/mm.h                         | 40 +------------------
 include/linux/vmemmap-optimization.h       | 31 +++++++++------
 mm/memory_hotplug.c                        | 16 ++++----
 mm/memremap.c                              |  4 +-
 mm/sparse-vmemmap.c                        | 46 +++++++++++++++-------
 mm/sparse.c                                |  6 +--
 16 files changed, 89 insertions(+), 131 deletions(-)


base-commit: 684242af7090928ada5e48fd40a0f3a539b3fd5b
-- 
2.54.0

