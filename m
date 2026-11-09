Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215339;
	b=oz73wVYNWjddeCMNY5hIlrm+uNUj3iIE55yEMvS3nm6S+BYh+ZrnXO5wkmumJFPQA2yN
	 BOQmCVPd4wptA8VhsVQDEcDZW47k+TgX89vQWlmZzCK9NCU3gwCzXxqkzWtZuHjISwuI7
	 s4LFFNeH77Mxv+OPunTJXiyWo/nny7t0/J1CS9EWQEHT9wPwm3hQeYy0wK78von0xdYT7
	 ANaz3t9dlW5gWsuTSQfOY+wcIF9c73UuRhsk/vGGQcO+D2F+F5+OEhQmIlujIFOQLY2vN
	 ONZ9UJn/xTgcQXE4FRjpTJP+TvMCAUbEm0ExqG2FUoM5AnUTC9q0AS/yWN1nmXCHJPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pKCMQsA5DnpTSt9KpKYbpxlYWXML1e9U0EpHZz4hA90=;
	b=4GTVL0PpR1rVgpQI2XXrxLQmJcWi09NhcfF7olQeUsSpqzA01VZAovksqYKtxCOROFXZ
	 34+SmhUjy23znGCqYeFYTh7iZ1sgAxW0Rot9zXdN686zofTylZ0yM3QNk4npU/9G3ytQO
	 iQNrfqnfJnOR1yVC5ENrnecw1LLxrW6hCXlqQKiQCE6ye36qWIG29g627AT6eAt7XEtNa
	 P3hvtvn4Ug0UPv4/if2pY6Xv4MUv/73UWrTkhuuEBcgiOrJfu9hmFMYdTyWGEHahxuxWC
	 sV2v/kIcUddjO5nsAzrS7g9DBGvlq/dV7JnyPxuzW62fcajv1g7pwtvkHRFRSA6hVlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Za1sUmno;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E54D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E54D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Za1sUmno
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so298979a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794215338; x=1794820138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKCMQsA5DnpTSt9KpKYbpxlYWXML1e9U0EpHZz4hA90=;
        b=Za1sUmnoUREFR9TN3SAvYTtI4WW6B1mryMIVB8KLxE/I8+X+loXosjU2XWKtmGiFpq
         MZ0utwePnVSLXPJL4y2mD66YMbI6SKH+8RVIYo1DIxc4VadxF7WqlAkxN4f6cnT66nDz
         h+LvVOsO1tBBo51XJWsG9uZFzHrYZd+stgMh0HYPFScKVU0F4TUnu3Ob+pZq6uChGVtg
         xVu6rrqdvlr4vikx6u53IjWp+qv81QKd0pSx5ArnBC3+hmvP+txpiduLa+++KY88hVwV
         fUzzjc4wB/fqIaaoECf18cnc2YBdieCJLpsfSQSqd/p6YH06bDPfpj68HhevzEDtEDmW
         6AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215338; x=1794820138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKCMQsA5DnpTSt9KpKYbpxlYWXML1e9U0EpHZz4hA90=;
        b=1VtuRvb86j46dLtcs0shMWIxY4YJBOrKjCKdp0jbZB1cPwUDtuYK4TeeVfEXD1WVma
         emgsjwWzzfd+pMGTz/WFUTo49mfWQFiqAkZj223f57h3gO6EE3bSLXaiyE3mPvht2T3n
         MkYiG8Csh9sNOOh6sv28pDvdtslcBjZ3Npl5+gYLZ9FKyILOibkVR52vC83hJImLN7vg
         9bMh1DuqZfQJUnLsvNtB4vmd+TOQka66g8VtQO1myMtJIJ1ijpy5nP9GRKXWBUANhOzC
         rc+GqUXf4Det5jjA7zyuPgG6PLRw2DIlOUxKDdrjHYKZmBmS3EtyBgKjNe6sCvxgHjNz
         X3Jg==
X-Forwarded-Encrypted: i=1; AL+hErG6SK6rp1f1FMSjWy2bnljRf4ofghyhcquPUW7qMeAD4HoW7wqemM2gkVTNOB5MebOgBmOkXvCo2nYJLaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NDWE909vbmiNfcFzOyFRbDT568LNLKgIamvwb1+5zWJ7xXDzb
	A6CoFyly9mx2GTUw4enN0qv6NoCjd4VD1jRZ7VE2NAEJlXxvuyr/nqh6
X-Gm-Gg: AYBFou0k1Qn/cIv3RRm8jAZFmw9JtFm5PN7uBFNgdSPQzemOUttaYA1p0JYAjzz3PE7
	9ea1yObNMPtvnT4IraFBBbipoB2/IX5dO3bzdumos5aeJxtkbMm3haCtILOExqx48bYqp74mIxk
	ByMaxHu4kTgHQ6/QYvUquDbNDggbD0Upjr87fsUZ7cQeEytbRq+EU+hd1AtivKIPoDWp5T21MZa
	CrvYjHYZIZAWyb5+JUKBOCjLcBCyX9rKR+NJPyqd3cPszbXcpM7mq69rWwwDDDD5EpFBsx/SyMZ
	6k32LeujMP7A9a+bVschf82UiNVUIgOuN7l6OBr3g543HQfyYRh/N4LzVNGVAKfV51Db5Se+cAK
	FkjGCMcm97JBNnwMS6mDuA/9tL4XZaqQia7JGuYLSb814coWI7fc+1ty7vE5An+C+z+/cLZDZgY
	JcrE4fC/xW1KOyGJVg+5+aIw/HOwBt6S05S3IB7GtRgDN5rTs7JusOjBBsNlfsj8HS1AUNtp3Ug
	hsB6JzTyPP4qWingqWdpQ+v1/nJzB8F0kxlHNv8JKnvfKDdwfujhKDLrcseLz6qoZ3BIrSYC2A7
	W0bf4wg9KsV5pnK4l2vm8IyrN86DKwPwNQqy2W6UoMMiq+Jcp0l6tEcg68WC3C0=
X-Received: by 2002:a17:90b:1e47:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3b12d3fc296mr2297733a91.11.1794215338255;
        Mon, 09 Nov 2026 01:08:58 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm6031438a91.13.2026.11.09.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:08:56 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: david@kernel.org,
	hughd@google.com,
	akpm@linux-foundation.org,
	fengwei.yin@intel.com
Cc: ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/migrate: fix mlock state loss when migrating PTE-mapped large folios
Date: Mon,  9 Nov 2026 17:08:46 +0800
Message-ID: <20261109090846.1068409-1-chenwandun1@gmail.com>
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

try_to_migrate() clears PG_mlocked when unmapping the source folio.
For PTE-mapped large folios, remove_migration_pte() restores one PTE at
a time, but the rmap helpers only restore mlock for full-folio mappings.
This leaves the destination PTE-mapped large folio without PG_mlocked.

Restore mlock once all PTEs of the destination folio are restored under
a single page table lock.

Fixes: dc68badcede4 ("mm: mlock: update mlock_pte_range to handle large folio")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 mm/migrate.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 94033c222e04..140e291d4587 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -353,6 +353,7 @@ static bool remove_migration_pte(struct folio *folio,
 {
 	struct rmap_walk_arg *rmap_walk_arg = arg;
 	DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
+	unsigned long nr_ptes = 0;
 
 	while (page_vma_mapped_walk(&pvmw)) {
 		rmap_t rmap_flags = RMAP_NONE;
@@ -446,9 +447,16 @@ static bool remove_migration_pte(struct folio *folio,
 			else
 				folio_add_file_rmap_pte(folio, new, vma);
 			set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
+
+			nr_ptes++;
 		}
-		if (READ_ONCE(vma->vm_flags) & VM_LOCKED)
+		if (READ_ONCE(vma->vm_flags) & VM_LOCKED) {
+			if (folio_test_large(folio) &&
+			    nr_ptes == folio_nr_pages(folio) &&
+			    !(pvmw.flags & PVMW_PGTABLE_CROSSED))
+				mlock_vma_folio(folio, vma);
 			mlock_drain_local();
+		}
 
 		trace_remove_migration_pte(pvmw.address, pte_val(pte),
 					   compound_order(new));
-- 
2.43.0

