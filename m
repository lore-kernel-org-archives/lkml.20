Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859155;
	b=fKPb+OYnWkqilZPfV3T+uYtprUue2c2qrbp/i/EwGbavR1RM9/jtKQFezs69ViZNCgYP
	 ycH0IeXSFM6FV1A/8dhnXgmnGYFk3I8k/0+1vfxypqixPPA7Eg9H1GJ7BYiHms6DZcctB
	 SsIT0+CCmaBl3K1Vmy6epM4gPS0mODhAikOrQfk+XXCNuLAS2xGQhe7ND87jfeep9KA8H
	 aPwT3oBi9sStO107ot8V9JMNxca/HKOZVDzFMbkiod7XiXSsoiERq5z0eK8ay4MKfKmr2
	 lIkcLtTgLJh108eTZI1iBG3YKq9bfkKnes61I0mWI7Z2ZtRo3n/e4kBrEFIYMR4K/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
	b=p3lTfjVfrHB+Dk7R+2X8KqDCff0qk3tOC9smNHkFiZEU2Hgt6jahD7ve3gqjs8zwvg+p
	 CFVtJm0Mp1+p2IlCKiB9tBiTmZBeIqN5Ph89g//OmvlXmMXBJTnVFi/n4l4sbdVu5MFAr
	 DuPs+F//x68zr/tV2EA3UaE81t77E9nOhn7Ub0E/SKzSeULV4Q4F0/3FD9+CSuiVBPCdJ
	 3jo33j6NQ1nSqz71Y3olQb68knRv4h76nyMAgBMoVK52TtNGNGm70TerelqnGmgkdrrgC
	 UN3EJPZ39WGtu/DcaSxnaAZb2eEahmU5WOxBdgt9EzbBH4iWKyaqdkEt7SBswLaYPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Bp5MW+a7;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFC606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BFC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Bp5MW+a7
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc751eddf25so908482a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859154; x=1794463954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=Bp5MW+a7fGIv/7pTtYa3B2e1LhOCTCnK6GRwFYZT5vkcgLqZ8V8/SOaEEdzRIiXp01
         leju/Xa5AeZzZGikWexBA9GTDkYdVsV/DdrwZLuxDSMxS3Svl1VkYPWR795d/iZ1IvCC
         uGIK+Ml1tDM/D+fJLdWpkNBkTBzWBzuTU7/UkI1UIOR8USH+52nBRpcSJV9Nh5c7CmV3
         N95XAhWV+TXMh6gW1scO3WqQKDn03ibwh4ugu9mA+sy+Pi8ARwjac7k1sC348U8ucUAz
         Jsfm0DSjGVylU5zPIklTDCo5MHTj/gngSwoZcPM0kZ7MB/iE/H1qeV/fmCtTFGnCEFOZ
         jjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859154; x=1794463954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86mQJyKlXA+m+CUFz+gI1B4tAIO9REzBudSQUtfJrm0=;
        b=V05wKLz+ihG79B9f32EA2Tbt4tYA6mLlwl8oqzRcZ4gBwxhixGFTWwKfDvyx+b+U4t
         HQ/NhQdPqXQj+8FoRI228lAU8BotX2mGoytZwY9/EIM5DJrHZFepLzYG0d2YkUfajswl
         UTNIM4xOunq3VU+DtVFJ9MCIOF8FtowdZM7omSCwGGN6h7I8UMkJEHKFIBjSUKxmagdN
         ZWT2GJnJfkUKv2bNveRQ9X3lrNHgMqMjnPeqFc9sLR0fInaR4TSMHMmrGLXnWd3TO6Wk
         S74LH182goD7oelsFzv/a2Plv7HrAvvPNhBcbOBH7Rk1HSHJSn/EEHMiUC4geoDUsXoz
         PgpA==
X-Forwarded-Encrypted: i=1; AKwUvBzJRluJWVFvOP2GGfpwfN0PHqYNUzQLpKg3g5HE7bJQdsYVqTJuDjJwFb6QqUMJoNLM+pxl68HlcxbC4PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bQceFdZ58KAZeDvoWgkU5q4k3O7ra7LYudfk1zaVwuUXFTGfK
	QRsi0T+FHp8VESkcLdG+IkjNvuLcjB2yuS5kO0p9avv+OZSTNyuHDvXT5T/oEauAOT0=
X-Gm-Gg: AYBFou0hFwGeEt2maSciQ/D2qTd7buMZhQ8nVH4gqrpF6GpbK7y6v9EPIvTM735DD7c
	HpJauH1Y7Nr1Z2bcqXknkIVRJZ28DgRaesOM7OxXqfBy4OofZd1o/kgLkIlc+7FRL27qZxTAQnp
	w/R+Ia10LlWGxwK1CYHomSe6+QHHUKX1yIrN0Avci14ZFOuvJ5UQuoMCfObxN0ClPsKN+TZt6wW
	tzZN7K5cDgyOHGzxERoGe9oNBVZcqgw6D07RS/42AjLE3nHQxXS2Q87OO6GQ2lAsPp11l1oxM6G
	d3JJJ5/m1yvsrCpNomCMR3VJ3GfB9l1H9Tk3CqmQNXCR/zbtUBRXKnMpExQyRHDvqYlwqpYwNXZ
	rCZfLqh5s1JzFJZYIjH9uExtS7sPEalEqjsEBMnhPXW8M6Mtf6pOrrEhbgEvI++e2LU1BcylYAf
	D6+jAjJ6XLkuet6Dg8fFoPEaokwDc+kNkOS16FpYqr1WUtgmNzMZhMQEhhb7vANX+fnCZSYkP4M
	lDJIZz19CjV8FrSvhgEPp55kzAc1DGDr3u7qHjbew3TvdDZCDpzwb1tZShHifulnEMkUuIlgoqG
	ENIGKJvoRPa2sLLGB4gI7wxm7eh2iKW9AhjeXidbzNQmu1zcB3LlLhRtcXFKCD99TQ==
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr15532805a91.30.1793859153687;
        Wed, 04 Nov 2026 22:12:33 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:32 -0800 (PST)
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
Subject: [PATCH v2 0/5] mm: Simplify device DAX vmemmap optimization plumbing
Date: Thu,  5 Nov 2026 14:12:12 +0800
Message-ID: <20261105061217.13302-1-songmuchun@bytedance.com>
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

v2:
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

 arch/arm64/mm/mmu.c                        |  5 +-
 arch/loongarch/mm/init.c                   |  7 +--
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 +++------
 arch/powerpc/mm/init_64.c                  |  2 +
 arch/powerpc/mm/mem.c                      |  5 +-
 arch/riscv/mm/init.c                       |  5 +-
 arch/s390/mm/init.c                        |  5 +-
 arch/x86/mm/init_64.c                      |  5 +-
 include/linux/memory_hotplug.h             |  8 ++--
 include/linux/mm.h                         | 40 +---------------
 include/linux/vmemmap-optimization.h       | 56 +++++++++++++++++-----
 mm/memory_hotplug.c                        | 16 +++----
 mm/memremap.c                              |  4 +-
 mm/sparse-vmemmap.c                        | 29 ++++++-----
 mm/sparse.c                                |  6 +--
 mm/sparse.h                                |  5 --
 17 files changed, 97 insertions(+), 136 deletions(-)


base-commit: dba8aba0a9a00ff781c03d82ae534fc6f8c2e263
-- 
2.54.0

