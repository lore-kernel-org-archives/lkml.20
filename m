Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723128FFF6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035421; cv=none; b=ihQ5tMwAdtZJb8C01hQ0WrXsTd+ltxJ45qwm6ERRcL2uMChXWlPrBiR+ra1WGe8HtP29FDwp9lIYB4QQUR4X763hcHisNdBaO1pBMDHz6wZWlkUkXraNLsFjN3p7ZIc3FiR2tLqTlA5MLHjzk1SsMwyDG77pR6tFMmdbQdz+iTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035421; c=relaxed/simple;
	bh=wl78XntOxtS0v5cmuSFy2Rul8ehDfZ6ttebl81pR+6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LDwuCIRJ1pV8WA/V78xg4hJDqLKp16kdYgUg4Hl38unLX9bx3Fsfmi4NoKtZ1+3GxWmIL59TWkwtwIx2XOR2t68T7km2lIhwGnLONurqXYACL7RjOntKSgbzH3PimN8YrDaZTZoYquTeYvG8Qc67BRxRqbFS4w1mFjuNHHUeZKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvRd2D8v; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvRd2D8v"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so43192625e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792035417; x=1792640217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvsVhU4kPk1tZp2qz93jFIik1GpyvPqpcxvOW0J3Tx4=;
        b=dvRd2D8vT2ptimEjQ4/30lNKvl6hMYQxTvC4QQ6huKl4+rQ/Luy3VOd/iz4kEOxsHv
         fJECOnTSKS+Lrt3kR85xGKnGZKDsVGUVGxbRK7FbrR+n7fGv+18rBmbwbRLf4/upNgyK
         Civd/c30eZkWUgWY3wKvSpaYAmUQ3O8F3iHm13zSr905o0WAl4oDBYW1C3Zhei+looXo
         EvQLUvsTHfdMztl0APdpovwfmb1MZrcywgleEdKzofxGW1gkvfsNGsnjQUcOsQV2Z1/H
         n3GYI9iDoRCBjMl0NJVen9X7hQi4v61gv6FOkC9lzk5j4XtJgH9S8+vM+vh9bfGH68CA
         H4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035417; x=1792640217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvsVhU4kPk1tZp2qz93jFIik1GpyvPqpcxvOW0J3Tx4=;
        b=gXU1Y5hOR4fEE4M18IgsDQGGTQJ1gHGaGpcvem++lWbVdvOhFYSsdQ8g24lFPENUIX
         uyXNo8Z/t9STTszx3SXh0Hp9LB0fbyVQHGj0eGFlepSGLGVTDA6in/L5lS8VnEtvjbtZ
         NG/kPZzL95nK0QR6YjEtk7Zpf94sGV/iYf7dTH6YGSc7WBExRzKmPwMviJQVQyIaU3Vi
         gujRh4X/OltbwmA2tKeLTY5c3rh4Z0hR3cZsZItIgr+Iqv/yvbMVsVMkidPVjO1YAD8u
         WCmpWPzmNEfxHcT7in6vnAJGW8670ILhDTTGNwNevo5XL70MeKkvAR758T8KXbR+Fyf1
         XcPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpWC7bZwAW2hum4MIVYjnLSyhiMcGC21jofplmgPhXVg+x5W4j7MoPZR+krfPUU0SUPzEi7pISHJI2vD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnWyMRGBYo2gAOnychVg63XaGiNgDtCc6UD1T/iRHLMgAT9qlx
	n7PN1/DMaMW7v/OFiX/kuQWTBTgeBp1s5EmxNFf6q8/0yT6Y20F4mdn+
X-Gm-Gg: AYBFou2A/wnywDJLNPe2qbDDxaMTzPmFIWFDfxxHScORm4iLp8t6FxZZfoy9AfhCZhl
	q9ogw2VBIuud49zRsqL4AGpJx40NGFT/jJxg8+j3JHUMZU0dqskEkJ4MMC9RjbBAG6vzvZ2f3AM
	aHNxI2KBYm5ISBLWXxwAZHI/Nwcz3JGjeE5/wWHrdAyvOVxwJ1YOyWx3SQYzbuDJ25clg46GxjS
	U1n7O/6cWBIowvHPC2Y8P8G20iTB1y+3q1cUW/GmWEN9sgQY3ns8Lo7JA1jYvArRpf+tx/rbWix
	L4q8+qpQck3J6GAFV4ot5G1DoGAkowz7nmJCNZImInm/p6BLBy/i8hoWUv64nqctfvBPaduevBG
	pk3n6uB6yBuwgxp0N97nnkw5eSOwFSARPdAFv0Ij4Bo2hq5N/9mK6xqHwEiFPNlXiFkhFYwN48v
	Ma0sFDp4bFLjNEU8j3uAxf7ulisY/EvpN2K4CfX81a3UGbmHaKbAi5Lh8qYVjW7YET7+AaMN2vD
	0M9hjPhwFDXGQUv1jme5vsCJw3+NUMkw7IGFhTxrkYIH/nbjuwlktKh0gDA9Nt+qEvElrSbGymR
	s8WG/CekwRA6e9pr/CRBXeEHyYVBEMzcd17CF+VrDdD52V6eHqwdjjYnWn0hIYKhf1wtQVSc9OB
	uxXhkXIU22dFZMF3GyA==
X-Received: by 2002:a05:600c:c3cc:10b0:4a1:a7f8:c12b with SMTP id 5b1f17b1804b1-4a1a7f8c219mr123205845e9.19.1792035417351;
        Wed, 14 Oct 2026 20:36:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df5c3b89csm603500f8f.23.2026.10.14.20.36.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 20:36:56 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mike Rapoport <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Pre-allocate module page tables for execmem
Date: Thu, 15 Oct 2026 05:36:43 +0200
Message-Id: <20261015033643.84972-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RV64 pre-allocates page-table levels for late kernel mappings. The module
range is guarded by CONFIG_MODULES, although execmem can use it without
modules.

With CONFIG_BPF_JIT=y and CONFIG_MODULES=n, execmem adds a mapping to
init_mm while the current process retains an empty PGD entry. Initializing
a BPF program pack then faults:

  Unable to handle kernel paging request ...
  [ffffffff78000000] pgd=0000000000000000
  ...
  bpf_jit_fill_hole_with_zero
  bpf_prog_pack_alloc

Use CONFIG_EXECMEM for the module-range pre-allocation, as powerpc does
for its execmem page-table setup. Both CONFIG_MODULES and CONFIG_BPF_JIT
select it.

Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on a BeagleV Ahead with matched LLVM 18.1.3 builds based on
    v7.3-rc7:
    
    - unpatched: a native XDP attach triggered the Oops above
    - patched: native XDP attach and detach completed without an Oops

 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb37b0b67efe..d92342c162e2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1437,7 +1437,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 void __init pgtable_cache_init(void)
 {
 	preallocate_pgd_pages_range(VMALLOC_START, VMALLOC_END, "vmalloc");
-	if (IS_ENABLED(CONFIG_MODULES))
+	if (IS_ENABLED(CONFIG_EXECMEM))
 		preallocate_pgd_pages_range(MODULES_VADDR, MODULES_END, "bpf/modules");
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
 		preallocate_pgd_pages_range(VMEMMAP_START, VMEMMAP_END, "vmemmap");
-- 
2.43.0

