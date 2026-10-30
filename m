Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369309;
	b=HJiT/EyX2/Pb959mQ3H4fg01aM/bR4+kbOaJw3YXI6L6U6E4s6EdX29Ztn8KbOcZ4rK1
	 3AqNu95bXOSe4DYsFvlHWK42nnPeHTRLPqcMDma6cQSGfeUlUoyFZY7+oqbaxYBHqj4wT
	 hSMIBjlxriNtipCAY+bWTOi0dsb71oBlEpra/CRKlfhhKUYG0AtKVMIFuL+g80tKLY4Bh
	 TTASi/5nhZGtmb3O81ZzFCPtBxAdT2JKNOX1TayzHKDUUnhIZIqNt7MJqtLrLX0LynscW
	 4HGfWvc5MEJP9Y+6vqeRBBDuaqWtPeqyllvxE5Xrjpy4KSl9mvdAhEvZodOTs3+q0ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
	b=QTwG8F2xkENPHsA9KanS5HlE1H5B6TIt8Soabx9yWmlRAusdV4HFfLDzuHTXEyma80Zx
	 p+P4iSorOCP1RV3Djz27yx4QF74V5bn5mZtSCWTufzfXlsaR1y7hZcQ8yGVz7Gkg94aEN
	 ws4dnpDoMIZQwSAaPBuxdm4PSgUowfj1Kms7dhueVebknf3/7gSG3bya2ciZjhRnCPKZe
	 076A6ZqyAGfXWVqFRY1I0lt4pAbmwCY6lKaX3ZcPdI7cWf7ccvzYSeTDPAQk77t4tD+XP
	 qNNvdLoyF80f3lCn1SIS5P68cpDHndBTlecC/JhymN/CUw2avRTw6wJtcuRuTtFSgAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UW4zkaST;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UW4zkaST
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e95bd1c14cso6903425ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369307; x=1793974107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=UW4zkaST1IP+A/TyfNLtbXQlme+Lx+YCEzsAPxn07XgKzE/t+9ZiMONOyiRrwdVuPh
         FKi7DyjJsfqo0qVY+dsyGHGqePInWXVoMBjAJ/YKJ7Q4n4czbFu7us+DiSdyrpH7eLzv
         Yg/cqAEsRpgZte33an+BcDadPQKLgGokDGA2AmI0p0kfQfZMo6wT0UkxJ/zdpvnTmRUs
         NtdRaQ5zA3uTIJopWWG9/lsy5qh94Se6o6jKQkt8lxh4jTyWAMvHo02AhBRXfyDex46P
         UwQ7uZPVQe4LSTzEe7rfhRM6mJwx9+eHQkqo7P7svwJSx/ygkv6ww5nEfx5T4loSEHd5
         G9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369307; x=1793974107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=D9i1HQep/SicHE7Qplq0rTEI0J1P9ny9Wv/LIOiC8KK5AIbh+KexDEfN0UltjWjCH/
         GKRZ+5URkEUCQuOXh4mBUcnL94dlXKDmun+lOrRnJUahJrBxDohGVBm+NgG5cWq5Q7Po
         rv9mqdporQdJscPTEPgNrfXO24ZWuhdyZighyhnf2ex7/EekkoEegr4H7p70CrRlKTHj
         FEbaDbAdA5MUcx/zrW0HD+p0KIj9lc5fPDYRyx/qkU9pzTqWmVLCXhdShOcWTgaJkwMR
         bp/uBO85MtC7OLpSlhyZ4cWRMMc/EKlWalc8IJkFCNcNAWw+wYD6sz+DCVpuF+687uzc
         xjag==
X-Forwarded-Encrypted: i=1; AKwUvByr+I4ryo8lxkqctSRDtU7KyY1nwWPbfQeG6GRgUuLF1FB5ck2/5PYi/cm6J/wgvTfIfb/krbEJy1f9mtw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH6rhefWJS4y3JH0c2h/5tXetsPdxys9cID6ow6qRrTv7jiQUR
	VR/SkCwWXGEDcclBxwxI568EPuZGXVkBviAFS6lBYGoQ7IfYa2SJEp1b4oC1C4IqDSg=
X-Gm-Gg: AYBFou3RfSnFFUbHT2mDLBGKhNPqbK5zjgDQMaggkWHmdS1QO+Y/1JDm1tnX25z9QbV
	vv4mZzr+FbwWQ63fH9FVw8+F+pTIn/aEQ/f4RlTRmADBm4rmKQBz9ha4GBzDsp+mDQVHQn9QcHu
	CWUMJM7Eputiv9aitQgTBe5gcbQUeHFwaOvsWsQcGm7uFZcuuByvgQj26sPR17zf4GRP1RAepG9
	c0n9BX2Mnt4MHPl1zYNzFtExea/1d844mY3aL8jxDCYH6ASKjp51nrmt5aaOsCJYTn9yFtajVfM
	WGH9PiDD1hvtEezYXPJOY0KnzMCzDvxyZuct9HC+/x1b5CA3M1zZc8JxMY7QeERd16Rsp/jDvId
	zOyLMDMzmnNCXUfzzvFOmLiuDeeR0SzKwimUYmCJvvhhjkwa2ln1sv8twqQEADiAyHNP0P+Vm6Q
	XjPpzwRjN5rtuP3j+0PWVidxpzownY5l9JFecuAr5Jl+s27kKp9ZDRVufSCSxWnntX+Q9ZNurpg
	JTqfsySR2PkcwYLJMj0XnlU6FGfABjhVw8ZLUQRDIPDWVMube1Puf9FrSWq4XoN3LTb7z2vG9Ti
	KDTDLBPb3NXl86buyP4AxQBLL+6ov8jNAcwCmhwcoGoQGKs5snI=
X-Received: by 2002:a17:903:24b:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2eb364f6800mr27744295ad.50.1793369307550;
        Fri, 30 Oct 2026 07:08:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:26 -0700 (PDT)
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
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/4] mm: Simplify device DAX vmemmap optimization plumbing
Date: Fri, 30 Oct 2026 22:07:16 +0800
Message-ID: <20261030140720.1256062-1-songmuchun@bytedance.com>
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

Muchun Song (4):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 ++-
 arch/loongarch/mm/init.c                   |  5 ++-
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 ++++---------
 arch/powerpc/mm/init_64.c                  |  1 +
 arch/powerpc/mm/mem.c                      |  5 ++-
 arch/riscv/mm/init.c                       |  5 ++-
 arch/s390/mm/init.c                        |  5 ++-
 arch/x86/mm/init_64.c                      |  5 ++-
 include/linux/memory_hotplug.h             |  8 ++---
 include/linux/mm.h                         | 40 +---------------------
 mm/memory_hotplug.c                        | 16 ++++-----
 mm/memremap.c                              |  4 +--
 mm/sparse-vmemmap.c                        | 34 ++++++++++--------
 mm/sparse.c                                |  6 ++--
 15 files changed, 54 insertions(+), 120 deletions(-)


base-commit: 5e6c45aaaf93343c7f8a1cde9797080238af5c1b
-- 
2.54.0

