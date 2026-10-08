Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A33D9535
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444641; cv=none; b=sIFM3mxFuqkKvaa3FnL4sKDM4rGborh4kldv1KemKy/7P+xs1SktSbnQZ7YRXBUD2a6DrEEQwKsxxZVhWziOC3t9rDtagDYAmDnvmIqy2XxgUAK3N4zqr9BfNPW/1exzqET2w+8Yqz+nPrajcK2yKnLJtk1JeY/LVcEwVYw7c9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444641; c=relaxed/simple;
	bh=ZRj8nD6TnoWrdtQ47lJkomVWahJQ80S25nasHm2yrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNMoTJ8dOhjIw1Un7xujimXADZV/F4RNDUuno35sQ4REB/G4CowczGLpvXWj1CEZr+9j/ZpWvXJNSndsb14lEqM0yAf2CPZllEQ1AD8I/rnpe6WUpJexP5XXFpZYFMdNFan7bTD8/PJHH5gca785WNg4NFu94cAJ1GEOs3cdZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jSw8KpxI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jSw8KpxI"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso2981568a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444633; x=1792049433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8u18xg6N9qLEr1Kj9955ylpG90sgpgszfVpX4EGLse4=;
        b=jSw8KpxImUoG1miIDYwfTkB0Hm4Agpok7jWGb37JH9DN/wK/lBNfgmAY4evhlr7aN2
         VFgMUZnOSwA2avdGZ87X36SYt5KD+HNNdhQE1Q1kPlfPyvcPzotmd+BGvKs2XhtgQafT
         y1nqKd2doHI3exzsIxydtLuAKdd1DfaAlCNNNr01BjRoZpCxE3VIGQS/u1LEMpU/P+Mf
         AV3tCI51Tc9e/5r/Shejh8yVaLFzUCzjf1GM8xHJDzEr2r7y0wxEBmemo52fpOvOFn+p
         pM5qPjBdAGMTYnR46JY41bg2MmnkEjp/+ZqBmoaInRe+VUo/sO4hOt9uoMrlv05XuT8O
         BFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444633; x=1792049433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8u18xg6N9qLEr1Kj9955ylpG90sgpgszfVpX4EGLse4=;
        b=2Jwhq2HXAEHLLLiefOfrAHXlNBMWFDBBO2mfEQeLKTbKFuHaNebHxvrYDozu8Ko7cK
         zOyVpxDwInoE4WlwncthTsuFblYs1/5Rp84v0SnM2+zaCw6kqyyAZ1PWn9AGkfO2s5Dn
         3BtgN7sKVastskXByehFI0DzB8MEdlVU00G8QXUzN3jGdGOfnrA5jnW1i6SNDzsNepmh
         c1LJJyVEqK+e/oZD8Vxq7sKrY5+OEgYPg/t9/qMDehODnHk9IKH+HuGhlIKH48Gc5VBh
         syZzBp4Uyf16JJUrLezUNrdQvA27n6FhhuzGdeWHxJJ4yQXlf60wMwk0wSxIisPbqvk/
         PBgQ==
X-Forwarded-Encrypted: i=1; AKwUvByjhwL9sKco5g8o6iZaEkogBWzHK6LYhrBKMZQo2jZGiN0WRyAXoVf4i7zSp6Rsx5bk4r+ePi/pfSPgXZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwsPNuJI+pbt+zGtYVCEzQpzanGI1Is5g1qh5tVl2oydOwXE9a
	L6uJz2szosKz8fbPSt5Q8Mia1nPmAob2I6vaHNGmUH7HJHjfsTNuoX1XLL85ccgv14U=
X-Gm-Gg: AYBFou3qhxu/TKY/Q5Z3soFfvJqbAvVJJlEdn9i5cRfvg4b3C5RXnQKpttbtRXii3fR
	GVd1VMA7cPvx8oZIeJTLp9EhW3T4dTOqUfvFuH/5KT5+L6QqfQOQFt1H0HgL6Sw5o5SbvnoMEbV
	kyJusDg19MxZuaYKZ5xokUifU+uoWp5nksHCihYGFdaWiADqz5Fkw/ylvoymsxCHnQRMk/dhmHd
	+Cxz+AvDnH33yhlxj6b+mb2DyMeexxEchw04vWcVugvOwfzc+hYFFA+CBPCD7Qup3mgvU9BVXln
	rx5rs8WQzqJHoBtyigJTtKRXvMzDR6qmCwrn7Mlj3LjvbfkzAy1W4+/vHU3riAe2T74xpbA1T0o
	czE5n8IbdFmgDOMnIuLE/nlRwDMj+t/XlMOKehtW2YncEcPqW9xOc+XuVXH1+iEdJr9FD+cNDdj
	qHA6W3/VBWSG7Sn5RRKyS4XktSd6EzCikLUDRU3ptZCVeahiuMYFagnYthRPRgKJUDgwc3Y/3IY
	8x6T7fF3QrqVjocNk0=
X-Received: by 2002:a17:90b:3ec9:b0:3a0:9aa4:f9bf with SMTP id 98e67ed59e1d1-3a8a072a971mr4136690a91.12.1791444632841;
        Thu, 08 Oct 2026 00:30:32 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:32 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Thu,  8 Oct 2026 15:30:17 +0800
Message-ID: <20261008073021.2512665-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory hot-remove can free page tables allocated through different
paths. Some of these paths run page-table constructors, while others,
including generic sparse-vmemmap population, do not. The teardown
paths on x86, RISC-V and arm64 do not consistently handle this
distinction, leaving constructors and destructors unbalanced and
corrupting NR_PAGETABLE accounting.

On x86, the destructor is missing for vmemmap PTE tables allocated by
HugeTLB vmemmap optimization. RISC-V also misses the destructor for
constructed PUD tables. Conversely, arm64 and RISC-V can run
destructors on vmemmap tables that were never constructed.

This series uses PageTable() to determine whether a destructor is
needed before freeing a page-table page. The RISC-V fixes share a
common freeing helper across PTE, PMD and PUD teardown.

This series is limited to bug fixes for the existing teardown paths.
A follow-up series will convert runtime vmemmap page-table allocation
to the generic page-table allocation helpers, ensuring that these
tables run the corresponding constructors. Once these tables follow
the normal constructor and destructor lifecycle, the PageTable()
checks in the arm64 and RISC-V teardown paths can be removed.

Muchun Song (4):
  x86/mm: fix missing pgtable destructor for vmemmap tables
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c   |  3 ++-
 arch/riscv/mm/init.c  | 34 +++++++++++++++-------------------
 arch/x86/mm/init_64.c |  2 ++
 3 files changed, 19 insertions(+), 20 deletions(-)


base-commit: a92f009ac1c21986ff1ea0706419e545a4739513
-- 
2.54.0

