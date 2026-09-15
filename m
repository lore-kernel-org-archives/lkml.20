Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA2C44065A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456417; cv=none; b=L9dWD9C7XuKh57g9OpCdbniTFZxe7Y/VsN+Aisal9ntvJKffLYp9kVEtwKEOAlaXeEFDrsSxU0pPFYrk9i2XdegxbHlORv/Tb9WtwIrR1/ZrxXhbk1Jk+4CpxGaFLZ0p4LRbn5xhgRQXr/kNlKlksUshbpoxhffqHCiSXQ07W/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456417; c=relaxed/simple;
	bh=VJPiA57oY/5vyoJkrmWgpCXvfp7VtHP7Ct2Mll3e6pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdbDdhTlp0K7U970qkJz3mhVxdZtwuqGgeOU2V1VYK6rRz28mWHrZZ2yznG1dtc9QGbD3cPi1FVSR00L1j8vqm/L9jLZAqTr3yDlVR97ZEXTJ54hl6ZOclq/RYs0STk+CqXm7Gkn6qlH+2IdvdWG4IHAtVr8wFyvehj/WqE4YVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrYP5Coz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrYP5Coz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so31221185e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456414; x=1790061214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=velMxIt+642lquxYVKbrnSVvPRt1SpQzIuYolRQYJw0=;
        b=HrYP5CoznF8vgUi3JCmujnTnNjVljxzsH/hWlebMlSfTOqXBdY2QbsFWdOXlLungB1
         QnE9UaPv1FgVCrMyYpK3xZmJQHtzM6jMGAX7SkXA2efeyQoIH3bHBnYNWyTrW1rtcHro
         +3hk0tgALDfb6giikhzTK71it21pLTngv7N3/UiZp5YTwoVHlSbwzHdOvddOCTgVuQib
         6bGigJxAVd3/qc1ECbVEOvtsgSabxi5s+S6NVLNjvxXS4QjJbVVpM7jsJqPSmF3FhjXM
         aUZ9uadZiNhC02GGM78bDfAzK2hELwQAqAxATZTqCmX3QNORZCYjawO+LUn33D2qDUrC
         8GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456414; x=1790061214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=velMxIt+642lquxYVKbrnSVvPRt1SpQzIuYolRQYJw0=;
        b=I+NoBi6qEsJeAybvZV4kHflEnLd6Dp/6eHDlmC7a4ADpB3t6lPTQqjMkeEQdciLgom
         zJC53Ynv62H0sdFhvgV3w2R2PGYkYn67sa5jqG0cxClsZOXjPxjmLKMHPKfzZB3/umuK
         FbCOMXMu2LFwKiw+bFnLj8lGM31O/6ysPeHFsyBIuBpIemzr287uOzXm3SGJm2wWw6jB
         Xm5JYfuV8oKJdp9fn3sihqnkntu9zBsYZIagP+352GMOu1Xhxapof66rNQgqLJ13Y9F3
         aWxu/aOEYhzdJ/fkuzIuYNfFI/G7Iqyf+8HRsdV7CNRZ50REc84nRF6bKB06VqWr719F
         CYwA==
X-Forwarded-Encrypted: i=1; AKwUvBy8xmLRnUihnv/DymuT6okaZ5cH0mlojzJqZ24iXnJxuYp8tnw4jJKZxV7Fw9h2xMjN9F2wyQfkWyXq5Ko=@vger.kernel.org
X-Gm-Message-State: AFuF++lSbjZaM1riCa09FJVnzRrDjQIxy2oxhh9fKVym0xx5PROmpdWE
	pFwX0gZ4GQ96iaTzkQwpT4jL1AqI91LwrwBMcZw0XnDJGH/VhqNM5i7c
X-Gm-Gg: AYBFou0dPNX3RpKkjsMPcfSYIh0vguGRmJFmeTLr9Hjv7LdU1YWuZdF5FD/DuITPmZC
	Cyg7B4wwaYS/EGYCd+yOpQ4jMrxuidd8o1bunIYJMsgxnrSLUbM+OF7KLaQZqt5DFg86Wmb1Ziw
	QSr3uwDLpaqrwY6tV7VfwAXloWHfLoh7MbVlihUwITNxOS1DahiH5v7XoC5QGvmLUSt03NEpc+F
	k2bRgtcm3G1Mf1YxbMCekLiYBJOzQ0fOzh76nzTHhZajcvNeaNWXTTQrDJRysfkYpRAqIwOMW6b
	uEHn/7qCWJq4FzF1Syqp8/xtcMtXT1nuFkG2x9TMmxbOA+sVUIAnipC4qURwAfKI3EPoPa8h5+j
	ljkJubruRPju5XHIqNSt4Vddb1hFr0iSCe1r5vGTc8/eZAa6xowPIFEWGCpHbpb6TAd69BkHT6X
	xpI2CHJM17oaHIjWTq5isDm9vs7PxjaUiFLuaMHUVgM2oNUyXCl+DoZs3zWlRv9iriXOA2zW8Tw
	QF/U0bTa+Rr1SNZhpNjqzd2/dTbQHUBxFR6i8tbGy0kNfNyKhrk95h3h3T5uB7hQdahWtTl/ZRx
	pnk1P6COrsbrymbu
X-Received: by 2002:a05:600c:4e4a:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49e7a63a784mr80413585e9.3.1789456412284;
        Tue, 15 Sep 2026 00:13:32 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm42941345e9.6.2026.09.15.00.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:31 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	osalvador@suse.de,
	stable@vger.kernel.org
Subject: [PATCH 2/2] MIPS: mm: do not write a huge TLB entry when the probe misses
Date: Tue, 15 Sep 2026 07:13:25 +0000
Message-ID: <20260915071329.15125-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071329.15125-1-orgads@gmail.com>
References: <20260915071329.15125-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__update_tlb() probes for the 8K pair at the address it is given and,
for a huge pmd, writes the huge entry with tlbwi at the probed index or
with tlbwr when the probe misses. That works only if the caller passes
the faulting address, so that the probe finds the 4K entry the refill
handler loaded for the faulting page and the huge entry replaces it.

update_mmu_cache_pmd() is not called that way. do_set_pmd() has always
passed the huge-aligned address, and since commit ebcfc63d6bca ("mm:
abstract THP allocation") the anonymous THP fault path does too
(map_anon_folio_pmd()). The probe then misses the stale 4K entry, which
sits at the faulting page somewhere else in the 2 MB range, tlbwr adds
a huge entry next to it, and the TLB holds two entries matching the
faulting address. Octeon raises "Machine Check exception - caused by
multiple matching entries in the TLB" on the next refill of that page;
a process on a CN63XX board died this way within a second of start, on
the first anonymous THP of its bss.

Skip the write when the probe misses. The refill and TLBL/TLBS handlers
probe the faulting address themselves and rewrite the stale entry with
the huge one (they also set the software young bit), so the entry is
installed on the next access at the cost of one exception.

Fixes: fd062c847a8c ("MIPS: TLB support for hugetlbfs.")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -332,6 +332,19 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	/* this could be a huge page  */
 	if (pmd_leaf(*pmdp)) {
 		unsigned long lo;
+
+		/*
+		 * The probe above only covers the 8K pair at @address, and
+		 * a huge mapping is installed with the huge-aligned address
+		 * while the refill that started the fault left a 4K entry
+		 * for the faulting page elsewhere in the range. Writing the
+		 * huge entry to a random index would leave two entries
+		 * matching the faulting address; leave it to the refill and
+		 * TLBL/TLBS handlers, which probe the faulting address.
+		 */
+		if (idx < 0)
+			goto out;
+
 		write_c0_pagemask(PM_HUGE_MASK);
 		ptep = (pte_t *)pmdp;
 		lo = pte_to_entrylo(pte_val(*ptep));
@@ -339,10 +352,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 		write_c0_entrylo1(lo + (HPAGE_SIZE >> 7));
 
 		mtc0_tlbw_hazard();
-		if (idx < 0)
-			tlb_write_random();
-		else
-			tlb_write_indexed();
+		tlb_write_indexed();
 		tlbw_use_hazard();
 		write_c0_pagemask(PM_DEFAULT_MASK);
 	} else
@@ -380,6 +390,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 			tlb_write_indexed();
 	}
 	tlbw_use_hazard();
+out:
 	htw_start();
 	flush_micro_tlb_vm(vma);
 
-- 
2.47.0
