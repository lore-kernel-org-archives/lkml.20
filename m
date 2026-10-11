Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F543B0587
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725059; cv=none; b=PWZC3xe1lKWfWVHRtHeaDNiJV72uIgcAU9ja4cRoIUjIcpM4s0wGp5++zh2M22V5lW9U13ZUTHlDTtmhQ7EtuN/oD4uJJOiHm7q/YYrbHMfWUO++dK72cGNxMptbEr0awFxRTJ+ms9UpsCL80BV0bHb1LGsP3hYGIS6y+gq4Hgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725059; c=relaxed/simple;
	bh=kExQn+/9t5FfC0EyYnz3yE5hxNU8JGWxnmNHyd72amM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=As08Oxqab1BkFaYeeZ/ybCyJx34LsnJHbxwIKH/uSe4TaYuKf9rQHzBA8iNLjBRf8uRRA5cv8Hx4Bsi9HKnwPcPx5ccvlrDIt0oD8XKYQAN5j1f1SJRaZ5+uDvCf44sA6ExFkSy+NOsjo5xqu6iVc5WzbeAB4pD/EfNKku6Vk3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIXhRvBF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIXhRvBF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e836252e1dso8911735ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791725058; x=1792329858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2oNkZjunzzMVyG3EOfIOytuskDXyogdyyjCDaj7C0Eg=;
        b=EIXhRvBFvyiR0tu+tI1LVb4X1AhZPPbIOWeMUbT+JwsMTDdKNVdwDj9GYBRz8LcbdH
         VY0SKQS9KWrbuuiA82RLaON1cu6CILD41wmTH53N729nBCfcfWp3S4G5fpyKUxpT3I95
         weiUsw+yel4+4eucyYk6GQB6mQCyduM6wHWg8QrpivV/QLlUcXOp8JcH+YD2aJL8gzJ4
         cP9AV6VKexNn0O1E4Jo8XgafwRANDemQXtEf1xO624kUgpIT/boFGm16u7seGGr/SqwM
         XN+59OKtMQm19SlQ8voBg7+sUaC1YmzWdrMc6Z76MLlhS8NKksRoG5oy+z/468cCnKod
         oFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725058; x=1792329858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oNkZjunzzMVyG3EOfIOytuskDXyogdyyjCDaj7C0Eg=;
        b=S2K4tVOTZ50RRxFB+KbtG6OB/9BM9Tx5A0ajzE1MomzxDnLIpqWT+a9+trJh6URm2+
         udE98GpzeMJbUnspyUpBZyLxMvLprM5kuWU8oUsDmWyR2EZ/Lmldx8PxNepqXBWQz5mm
         i8NDkyCLRBt1uUTN/S2s1oh3kZg6wZfrsR3scq0LUnk4G+HRtbhgFODfgYGTb/tjPlcc
         2UuOnq2VnT5lBvK/SW1XBYIqbBfrlq2WgkJ/JjkficjIfdUD4kaG8Cc9tW6ejtB5l+tF
         vf5/hHGUZsY9Qh7xNriOimmLlL6LlxC3L8pfTKbLKER4YcfYQ5Jcxmm02/c4zb+StaFa
         Hn4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTMH3G9PLrwLVs8zp2uexo7GXqFvSe1oAVr2ibcN3O612swLeCWhaa2Ww6UmCCFPaUwpjOzulCkl/rhSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwOCO76TVkU7Qad4YUVfxFoBaznUo6UFCnGiHXN12t+2Noa4aA
	NcwI3UrR0PWnQgVF31xRQ875GbrrtzivNpHoRn8SYASdIB2LtARFtMfz
X-Gm-Gg: AYBFou3iUF0c+rLR4rCBUKn52mLcNYm8qYRUfkYCz3D0oDzR+l2knDF16h7g78S+54E
	Mm/e3C3Ga2cs3ryXEWLNq31fZW463gYYyq+8s1Y2ZJ1GwKJ2RcoX4GXcgBcC28zwTH+/AkMkxxk
	Dn41UuW3W2y5/1pU7GAMxZ/v9qxh/H3vFCYxFBunu/mLtcPKYHUKi8nzeQ8D7dklbu4OQS2Flze
	itROKMtiRW/lUJwd/AjMYmns+JbXzvevVgKbL04KWLZc3aLYCki+O67EquEoWem1SkGZV4Pz6I1
	Il7XWXBfvHj0d6x/ffo/2QNg2R2VVGhyVU694gi0bD+fiY8cbLIxXjnH5hO8MLtTKZbkM7vCF3p
	6AHlOKSikXEMx+OfdnQ8btgJsbDw1j5nbAkkFgaGOEttvles89C1UUi1CCxWYcWcGGyKKoJ+TDC
	5SX7gnuFmxj18jRKaJktCmCysgS/dweEeAhFgYg67f5mG6pjiB3nL+I8yghHxrHDMJRN7LI4xDi
	99sRQRkLesWdcFgeHOGa1DRbWDn9KyPMgYp+XpuUMnyo9wueyXRcSaB
X-Received: by 2002:a17:90a:d2c7:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3ab3a33da74mr6165030a91.1.1791725057957;
        Sun, 11 Oct 2026 06:24:17 -0700 (PDT)
Received: from 1u1g-b650-0212.nvidia.com ([72.25.70.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab396620e2sm7595259a91.3.2026.10.11.06.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:24:17 -0700 (PDT)
From: samarth.colleges@gmail.com
To: akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org
Cc: vbabka@kernel.org,
	jannh@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/madvise: keep the hardware dirty bit in MADV_COLD's THP path
Date: Sun, 11 Oct 2026 06:22:27 -0700
Message-ID: <20261011132227.413217-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samarth Narang <samarth.colleges@gmail.com>

For a young, PMD-mapped THP, madvise_cold_or_pageout_pte_range() handles
MADV_COLD by reading orig_pmd = *pmd, calling pmdp_invalidate(),
discarding its return value, and writing back pmd_mkold(orig_pmd):

	if (!pageout && pmd_young(orig_pmd)) {
		pmdp_invalidate(vma, addr, pmd);
		orig_pmd = pmd_mkold(orig_pmd);
		set_pmd_at(mm, addr, pmd, orig_pmd);
		tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
	}

pmdp_invalidate() atomically clears the present bit and returns the PMD
as it was in the page table at that instant.  A store from another CPU
that lands after orig_pmd is read but before the invalidate sets the
hardware dirty bit in the live entry.  Because the written-back value is
derived from the stale orig_pmd, that dirty bit is erased.

If the THP had been marked lazyfree (MADV_FREE), reclaim later finds a
clean PMD and a clean folio and discards it rather than swapping it out
(__discard_anon_folio_pmd_locked()).  The store is then silently lost: a
subsequent read returns stale/zero data, although the MADV_FREE contract
is that a write after the advice call cancels the free.

pmdp_invalidate() returns the pre-invalidate entry precisely so callers
can carry the accessed/dirty bits hardware may have set concurrently
(d52605d7cb30).  change_huge_pmd() and set_pmd_migration_entry()
(8a8683ad9ba4) already do this; the MADV_COLD path does not.  Rebuild
orig_pmd from the returned entry.

Reproduced unprivileged on x86-64: a 2 MiB anon THP is marked MADV_FREE,
then MADV_COLD races a store from another CPU, then MADV_PAGEOUT; the
stored byte reads back zero.  On current mainline built and booted under
KVM, the race lost 131 of 8000 stores before this patch and 0 of 8000
after; a store-before-COLD control and a MADV_NORMAL control lose none.

Fixes: 9c276cc65a58 ("mm: introduce MADV_COLD")
Cc: stable@vger.kernel.org
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
 mm/madvise.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -426,8 +426,14 @@
 		}
 
 		if (!pageout && pmd_young(orig_pmd)) {
-			pmdp_invalidate(vma, addr, pmd);
-			orig_pmd = pmd_mkold(orig_pmd);
+			/*
+			 * Rebuild from the entry pmdp_invalidate() exchanged
+			 * out, not from orig_pmd: hardware may have set the
+			 * dirty bit since orig_pmd was read, and a MADV_FREE'd
+			 * (lazyfree) THP whose dirty bit is lost is discarded
+			 * by reclaim, silently dropping the store.
+			 */
+			orig_pmd = pmd_mkold(pmdp_invalidate(vma, addr, pmd));
 
 			set_pmd_at(mm, addr, pmd, orig_pmd);
 			tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
-- 
2.40.0
