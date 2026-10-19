Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9735F163
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383370; cv=none; b=cfrwSEA+oCNBwOVQoD2Yq5kLZ1rHTrO6meYKVjGheqxw2lUZWMDS2paKQlb+ogk6tashVxZzIy/FHnvGIn9V2GlXQ5h67G7hEL/8F6YguYIdflZkRPTs+t8jdfn7vUqcODIT5+ZIZEVFi8FBYObGllaV432yONpHLUTSjo9lPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383370; c=relaxed/simple;
	bh=yX0F7IKN7JQRgpn8X/6AQPL5XwRWORoMzL58ybNylXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HR4IolQDgYeBu2WYT0+7GKDvOAPzzQD8q1H00Alii9QkeZ6PEJSd3XtFEebTnoaJc7WLoBC4iZ/gVn0XltHZ2pY0mTj4yaAJwajq+0/xTbNUKOKAJ5k0KuMGQ60/W+YIOipzxQc6UkFh/P2ruYpmpkO4NINLmOWot50mC/KAAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gpf3sKLH; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gpf3sKLH"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-16079d54c17so4017384c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792383368; x=1792988168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWxcIVVteXmESwfdXl+/9W8Xt5aHNS3RBHSUXn0IuLg=;
        b=Gpf3sKLHYCP34U0SOOH7SbEBzJzsJz/oBqDFDrU3hAdLOljmPWKzvulqmfJ13U2j/f
         3H/34XWe9XVX3L0JMRxppn6SVPIs0Ck3FUHL7x9dOcOJKysG4nWDbKwqicRRUdQatIH2
         UdURN2B07uC/fQ20/ZohbSiRTtnMwfVDZnbiL56sAduyLXi1vI8TAuiqCvpN48BRhc0O
         XdKpA3Er6YG9QVPzTQXGtHBk9cw4ZGR4DncqlcO74wEDHqJ2Ii4j2FrKgphnGBIhmR6P
         8TSeqUCnAgrTxSrJ+MtJeHMiBPniO6j6vjKGZYj8EkpncX2f0t4mL+lVhmAfCxNlgfGj
         HNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383368; x=1792988168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWxcIVVteXmESwfdXl+/9W8Xt5aHNS3RBHSUXn0IuLg=;
        b=LWt9XHtfeO2dYLUvHF/zswHCdNyIVhsBIo7oApUjCH+lTkCYTpLk0fIWKjudugJgge
         J4bOrZctJTWGswZBiIBm69Rc5skLuCn1kCs43drIRLWCyg1cdQizzCnPa6iRdOmnEwCP
         04NfM4EEdQNdqJPoPzTIuJ4gB03NM9sxhXdEHs/KaEvCjsu7sgix+H38qUubcIatQSps
         kiihbxuYSfmW9ou5cYt86N+QV0J061tv5+pNQvihZ2s5ddos0S9zmjl78swc0z11t+Ax
         arL+HueaqNBp1DSVS4qt2p/Hb+OJ5f7LhQMM/aS9xEkkpBzn+EBSMpdYWLEl04pvt8Ir
         jzjg==
X-Gm-Message-State: AFq9FYIzebHujEKZ4C24vmwbgO1/WBRD02qsYbogZvIx7HslACtCDvdx
	3knSaQ+aKW2SdChzkmD7VVTzZSJ27aBpfqCKdHPT4Pbh0MV3vmmAo7McNoVZHQ==
X-Gm-Gg: AYBFou2EkxcSy20D0ISRk/5GDJRkuT/ABU8EEEALN/jtRtJHaSJtrE1YdLmR5zgXR9J
	IryIfBkZvOctjWW0RApUfNOQg9msHo0PALE2DzxjcxnvKY9YtZ45z8xhH4r5kODUupTaaPPKObb
	NSz3tRne5T/KQto5qhmGQr19FrzZRzHcR7Gbp1C/NxdgtS5fn+bORbWekhuhi1wJ0Nws0JuFY9h
	gxxx479jo1ERz31kfpIAjb0FhcKgU7JIu4uM05iPD5mroGK2dVTDZEXnBY+zhh4b9toT0KANdI2
	ALeBWdntpQaBksziyQWD6HEIk+v8Di2zgWzAZL43VBqIqnzbK1Su3Bd5VYqVlBY9wveed3KZ3ZK
	PACG+4uhTQjccdBRMEcVZA/iQPpUthv8i8XlNLPb06x3LAaOms76cg5gpnYAUZqdeiS78ON2vEe
	1yWXLPnvJ2VFoe9KUJUwGOOZ0xmWdCgJQJoVg8mm71RPWJen9YyQbwro0yZuMrB+j5TGN2sdgNw
	n1oXMxwMlhkSt7W4Ru7k/X9JWMIaEJ5VH4J58V0nh5kGaA6AXPUpuCdZQ==
X-Received: by 2002:a05:701a:ca05:b0:17e:6de6:6a1a with SMTP id a92af1059eb24-18511ad9debmr10488248c88.8.1792383368214;
        Sun, 18 Oct 2026 21:16:08 -0700 (PDT)
Received: from pop-os.tail4adac7.ts.net ([2601:647:4085:6190:d1db:9839:4a08:879d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm37428472c88.11.2026.10.18.21.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 21:16:07 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Cong Wang <cwang@multikernel.io>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] x86/mm: Split a 1G direct mapping that hot-remove only partly covers
Date: Sun, 18 Oct 2026 21:16:06 -0700
Message-ID: <20261019041606.641716-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

Hot-remove works on memory blocks, 128M and up, while the kernel maps
boot memory with 1G pages where it can. Removing a block that sits in
such a 1G page covers only part of it, and remove_pud_table() then
walks the memory that 1G page maps as if it were a PMD table. The
removal succeeds, but it corrupts the first page of the 1G region, may
free that page while still in use, and leaves the removed memory
mapped.

Map the 1G leaf through 2M leaves first, under pgd_lock as
set_memory_*() may change it for the rest of the 1G meanwhile.

Reproduced in a 3G QEMU guest booted with movablecore=1280M. We used a
test module fills the first page of a 1G-mapped region with a known
pattern, then calls offline_and_remove_memory() on one 128M block in
that region. Before this patch, part of the pattern is zeroed and the
1G page stays. After this patch, the pattern is intact, the block is
unmapped, the rest stays mapped through 2M pages, and adding the block
back works.

Fixes: 69ccfe74e16b ("x86/vmemmap: drop handling of 1GB vmemmap ranges")
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: David Hildenbrand <david@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 arch/x86/mm/init_64.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 70e682180291..00770b86b270 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1164,6 +1164,37 @@ remove_pmd_table(pmd_t *pmd_start, unsigned long addr, unsigned long end,
 		update_page_count(PG_LEVEL_2M, -pages);
 }
 
+/* A hot-remove range may cover only part of a 1G page */
+static bool __meminit split_direct_pud(pud_t *pud)
+{
+	pmd_t *pmd = (pmd_t *)__get_free_page(GFP_KERNEL);
+	unsigned long pfn;
+	pgprot_t prot;
+	int i;
+
+	if (!pmd)
+		return false;
+
+	/* set_memory_*() may split or change it for the rest of the 1G */
+	spin_lock(&pgd_lock);
+	if (!pud_leaf(*pud)) {
+		spin_unlock(&pgd_lock);
+		free_page((unsigned long)pmd);
+		return true;
+	}
+	pfn = pud_pfn(*pud);
+	prot = pud_pgprot(*pud);
+	for (i = 0; i < PTRS_PER_PMD; i++)
+		set_pmd(pmd + i, pfn_pmd(pfn + i * (PMD_SIZE >> PAGE_SHIFT), prot));
+	/* Same frames and attributes, so no flush until remove_pagetable() */
+	pud_populate(&init_mm, pud, pmd);
+	spin_unlock(&pgd_lock);
+
+	update_page_count(PG_LEVEL_1G, -1);
+	update_page_count(PG_LEVEL_2M, PTRS_PER_PMD);
+	return true;
+}
+
 static void __meminit
 remove_pud_table(pud_t *pud_start, unsigned long addr, unsigned long end,
 		 struct vmem_altmap *altmap, bool direct)
@@ -1189,6 +1220,9 @@ remove_pud_table(pud_t *pud_start, unsigned long addr, unsigned long end,
 			continue;
 		}
 
+		if (pud_leaf(*pud) && (!direct || !split_direct_pud(pud)))
+			continue;
+
 		pmd_base = pmd_offset(pud, 0);
 		remove_pmd_table(pmd_base, addr, next, direct, altmap);
 		free_pmd_table(pmd_base, pud);
-- 
2.43.0

