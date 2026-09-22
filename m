Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10041A6838
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101859; cv=none; b=mr1gIEe3rha+DYK6sYDfkHolaFYCv20DfXzu0eM3eNh2v94cHwy54uJYLoeaoXtDWi4z5Ot/IANacu3xtZBlJwiSPvWbotqrMBQHHDjaJvc6yOk0wsf9SGYXYST9YtCwdGP8Vl/9GRrl7xgeJ3+kpTMFAmf+7MDHNnu40RrIArg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101859; c=relaxed/simple;
	bh=PHfFJviK67s3fwxzoxwRNrhYzjS9ehevjuhZx6QPkZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G23pEFtVBexBenQofAiG5GNKy0rt1gjo5Od9yPujdYniixzW5TgK+9EhDIcEws6MedUr6/BTr2btCJA/jyufh5UZ/dsk2sAY5z2ML+HC0eLlySDSOyQd7ID1vsX58HBUqykQIH470ZK8CyWYrSC7jVCTIIYAYpKX4oY0flWDSgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE6zRr2H; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE6zRr2H"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c6d6660191so145556b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101857; x=1790706657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMy9Rk3KbQyrH+qkFBTnaqCBL7b3XGUmEw1jNxFww0s=;
        b=YE6zRr2HvQozlw1s6CrYp+JbJPBNy+hKQs2+mOwvu2IzYEYPtnZ0vLte1jZPeva+e9
         W0FsC9PVflted1z12EE5Y7paEwr6T/Mwmc/5fRje3jj9t3ZACGSA3v/1ygInOhuiqLd+
         X4ypGqJ4HohwM5gwakIi61h8SWoUoeTm5M393H2O5SS3rjcJlZgmbkTAx1j34jxZn0SS
         yJh0xEK7uqs5N6YkdexySEj7XlT9uISsk8YbPcnx5p51Zn8KdBHAZ27dTtM8tUq3hwcF
         MlGqswZPCfM/BocIgfpWrqrLYR0VasJfVqXoHLh3+YGWTYbaN50pG4eXzEZabnb2/Tct
         nw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101857; x=1790706657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMy9Rk3KbQyrH+qkFBTnaqCBL7b3XGUmEw1jNxFww0s=;
        b=aGHYx2tBl+omoKSvimBm8xUiqJHslnPmnGG+y9R/t4j9w7JkQ/9vSCfxerhsvfWunh
         ILxE4ZVa8Nuq/r6JwiN405nH5ZIu6z7yL9yx1KH2508woY5+RZnwWT+VLLBF4ppuZQC0
         xj03iqeGRv6AwuzMiOKFSUfT71E5R/gVLa4y4v8DUCZfQw6SOyrm1fldOJhDxFse0QiO
         HYkoPOR4jnMxhkO8G/eVa42kLROOc8qaMpt7ot9pVABBNgajUqC1znFvCuIBo8HBgQEs
         8noENpzFyJadeeOV2ezz9ls0u9ingV5h9oAo87nGn2VqYTSqyfTKS1L0QwzZYkfRXXuD
         vN2w==
X-Forwarded-Encrypted: i=1; AKwUvBxj2pt3nXkOaDlsVhdsb2Jfc6mI3ZpnETQ/m4YzS8al1Tt/bX7ailsyo01yJwsDyW7A1G/6s3hZMNIRXOM=@vger.kernel.org
X-Gm-Message-State: AFuF++nGrpf3DprN12VdPNTinppYPDsUNMDh+9ChxbOpz74cco/9mOHu
	LiALLdBn3m0RVMSlkN7MzTRa3qIk5V7FCCW3oFKvjb15lXP+zrzlYF5FTDlkb7fk
X-Gm-Gg: AYBFou1RCbrD5X+mneMUtCsFXNkw72hM1z2f6QjpJ0m++Hl1z2JyFfByJ9ARgw8DoF+
	yB8k38KsfOCVm14SnuoFRE4ODKMcGle2tEBkChykvvAN4kVLZBpcpfDe7YDj9/gMWg58CoIzZAr
	EDrwB8eX5g/vaZABEh2oSeXonv2iKKYMqkdv8ob3uyHF3sWceETUCs0QkOrS2xnNKqx7k4jPJPi
	1PnDSFJlGRod8Yg6SNGL5uieJVGlNzYkfzfRqvQnBqr6Xlpvzl3u8qqNsOM0LDU1Eh1j5AtfX1h
	O5VdsKgtdn42Pwk/N8PJDG0IBHHw5Y+s7SPgzbKECr2koePG6XFsLlipd4W/KM4GwnoTp2AgPdb
	KTbVO83sfeHomvgptMVON+87SX4jeAN+TZ8qufFOEtp6cFyWj8MHzz9SVMgG8LVKerxHcMEIqRm
	VNM4cNoWb2wc4kuJo89DBX91Q4gBry65eBq1dh+DXJCcjDlqbkl3bAG62OzH6XPaQsGfwVlwFdI
	QPMej1UrKcmxo23NtNKkExuwdK/xdhCFNef9JpM
X-Received: by 2002:a05:6808:f0a:b0:4b5:5bfb:f25e with SMTP id 5614622812f47-4d5b8de193fmr289621b6e.21.1790101856638;
        Tue, 22 Sep 2026 11:30:56 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c3d75355sm120805b6e.3.2026.09.22.11.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:30:55 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] ARM: mm: use kmap_local_page() in copypage-v6
Date: Tue, 22 Sep 2026 13:30:54 -0500
Message-ID: <20260922183054.254875-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmap_atomic() is deprecated in favour of kmap_local_page(), as described
in Documentation/mm/highmem.rst.

ARMv6 and ARMv7 CPUs whose data cache does not alias use
v6_copy_user_highpage_nonaliasing() and
v6_clear_user_highpage_nonaliasing() as copy_user_highpage() and
clear_user_highpage(), to copy a page on a copy-on-write fault and to
zero new anonymous pages. Both map the pages, call copy_page() or
clear_page() and unmap them again, just like the generic copy_highpage()
and clear_highpage(), which use kmap_local_page() since commit
d2c20e51e396 ("mm/highmem: remove deprecated kmap_atomic").

Neither function needs preemption or page faults disabled: they only
access the kernel mappings of the pages, and do no cache maintenance.
kmap_atomic() is __kmap_local_page_prot() with page faults and
preemption (migration on PREEMPT_RT) disabled around it, so the mappings
are made and removed as before, and a highmem page is still mapped with
migration disabled.

Convert both functions to kmap_local_page() and kunmap_local(). Apart
from dropping the deprecated calls, this lets a preemptible kernel
preempt the copy or clear of a page, as it can in the generic helpers.
The aliasing variants use their own fixed mappings and are unchanged.

Assisted-by: LLM sparse
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on QEMU virt (cortex-a15, 2 CPUs, 2 GB, of which 1.25 GB is
    HighMem) with multi_v7_defconfig, which has HIGHMEM=y, plus PREEMPT,
    DEBUG_PREEMPT, PROVE_LOCKING, DEBUG_ATOMIC_SLEEP and DEBUG_HIGHMEM, on
    v7.3-rc4 with and without this patch. A test init checked every word of
    every page after:
    - copy-on-write of 8192 anonymous pages after fork(), written by the
      child and then by the parent, and first writes to 2048 pages of a
      MAP_PRIVATE file mapping (copy_user_highpage());
    - write faults, and read-then-write faults, on 16384 new anonymous
      pages each, right after 16384 pages were filled with a pattern and
      freed; 89-98% of the new pages reused one of those frames
      (clear_user_highpage()).
    pagemap showed all the source pages, copies and new pages in HighMem,
    and kprobes counted at least one call per page into each function.
    Both kernels passed with no splats. With CPU-bound tasks on both CPUs,
    a stack-trace histogram on preempt_schedule_irq() counted no
    preemptions inside copy_page() or inside memset() under
    v6_clear_user_highpage_nonaliasing() without the patch, and 9-54 and
    40-95 with it (two runs). A control that flips a byte of each test page
    in both functions made all five checks fail.
    
    Also built with W=1 for imx_v6_v7_defconfig, which builds the aliasing
    variants too.
    
    The ARMv4/v5 copypage-*.c files also use kmap_atomic(). I've left them
    alone: they do cache maintenance on VIVT caches while the pages are
    mapped, and QEMU doesn't model caches, so I can't test them.

 arch/arm/mm/copypage-v6.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mm/copypage-v6.c b/arch/arm/mm/copypage-v6.c
index 0710dba5c0bf..81d8471dbf00 100644
--- a/arch/arm/mm/copypage-v6.c
+++ b/arch/arm/mm/copypage-v6.c
@@ -32,11 +32,11 @@ static void v6_copy_user_highpage_nonaliasing(struct page *to,
 {
 	void *kto, *kfrom;
 
-	kfrom = kmap_atomic(from);
-	kto = kmap_atomic(to);
+	kfrom = kmap_local_page(from);
+	kto = kmap_local_page(to);
 	copy_page(kto, kfrom);
-	kunmap_atomic(kto);
-	kunmap_atomic(kfrom);
+	kunmap_local(kto);
+	kunmap_local(kfrom);
 }
 
 /*
@@ -45,9 +45,9 @@ static void v6_copy_user_highpage_nonaliasing(struct page *to,
  */
 static void v6_clear_user_highpage_nonaliasing(struct page *page, unsigned long vaddr)
 {
-	void *kaddr = kmap_atomic(page);
+	void *kaddr = kmap_local_page(page);
 	clear_page(kaddr);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 }
 
 /*

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0

