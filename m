Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218329;
	b=ueiuwvkpcblIVz1ZQZE3EQwQxFSEEhVp2Of9CPV7woJ1diB3AAcZkfN9UQQQa6B6B2zK
	 IABHq4Lv/8myEDFa4Y1DHyHKucHoZXytnDwP9oRue6bf6LW5u2aaNDo5F6l8ZsVhoktqs
	 IE6o04xihAO3kTly3K8+9dk2z/+lCln4FhYWmXlBXL35D/aAbOFZAA7wKNtAR2n4hqV10
	 By00fp2XfrA+akk0TN5r8441q7725IJ1HbCBVx2D7VsK+ljK7W97XqrqY4GNbRpMRajGl
	 HTy0575W/a8LJvu25kxp11sZb3By21Cro+Lai9bPMOk6O9mKVwU9n+Y0l/Kov9ZBShg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tLLqV/79ic6LaYQ9gny2eZCESoOQIsoKnn0MRua10fI=;
	b=3sfIlPmqoXnWIJcsIVI4LahYhD8x0+jgkRYRBKWN+dViDzqMgimP2ZJLF/k3sDXtz3NU
	 Y6TOh5ut1EhEFpxxBgZlBQPc3F6s3BmzI7xkT4h//Yd/LOuMwB48XKoSNP5H7bHKiEd3j
	 +5A9EBaffBc8e6diFvmiE1mKF9XFQajxL+I2/80S/MyzaiDzuy62tDnxxjdtE7vM+5vBK
	 TxNsw24dZbiLQM1s9j/aCT2wXu39BJOMOaVzLotkBAM+oauQKo5x5g3zPYX/6VSjY6m0T
	 TF6+kGMoyC0bK94hilqViMdqXn0HtCyoxX+Zcm/MyBA3aVpVS6AskfssgCVrt3Mpg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=d5OYVKoN;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DB8606EEB0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DB8606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=d5OYVKoN
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so775554c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218328; x=1794823128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLLqV/79ic6LaYQ9gny2eZCESoOQIsoKnn0MRua10fI=;
        b=d5OYVKoNKh0xnN32jXEHNtHFrr02vztPIZO/1Z2fgMrXxBTrvGJRUnNlkW9cr4yDZo
         3K0cLtAXnuX9GKrGp7ZYKhhV1wfrLTVz4A/5oltUPFleXEknnZBIECt8NfnCklYk8sWB
         cdVRDJJsQIKijaqUYaKzGMxSB0QSHpn6+5I9WtZP0qivp03PyGZ5Q6cog4/9TehBsy0N
         WStZgdSnjLyn1+2BtiUNb/+/i28mDygiqamdULVHUHrdJtA5NrMyoToJULF4z325HmX6
         mfbgxlejblXs06wpAF1R73jn8DweCQMdDz4VzZ56T3r0mlp6D4w1oOxBZEKDSx6hRohQ
         Ed4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218328; x=1794823128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tLLqV/79ic6LaYQ9gny2eZCESoOQIsoKnn0MRua10fI=;
        b=VODmiFK7+2Kcy/6yYwP7IJH4yXBN30UjdtWmRhTKUCrorKbY9uNz+d4bOuIqzLn7Ee
         CXP2kdnRcc0uVDHFxDB90NqCDhCgwgzgmwWPkgGc6atiQpl9P0pythY/6DROL4VTY5hA
         y4M3s92T0T+XQMDsA8xdZr7DpqF/MCOmtSBGqnAJYYoU9Swff9xBiWyf9ZTWB3tE+Z0q
         KGKmeiUIgzZD2TbW5UvjoKYNjf0PddxG0ZFHNtlI+gJGMLFxdJgNFZ3Bi1OB/cJxiloG
         my2X01uef8MuQ3kZfOOR3Viwz2uuJyW6xpBWQO43uoLmd6JH+fcpCImrHkOwdWxiEJAJ
         yFaA==
X-Forwarded-Encrypted: i=1; AL+hErHmV+ZrO3jbluJWLXznnDpZiwmIW+tQnSOPOvBoydatNm/r5o2bNFlVJFjLG3BnlU8d4RZTPBsG3lUJA3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0EgO2w8dl6F7ExNLDNx6pCEiowdQMSXZoFL7XbJK33cxLCCZu
	TjwtrvUXQnAS6u26iC8/TYcL9D3YnYF6AWpopBybyaPuND/1SExXLMB1jvn5+fml68w=
X-Gm-Gg: AYBFou3Nf4wkuRfgDp/4j0SJ4+ETKf4+ia6dvZkL42Lw5eNLJSXsENBe9oA/vqY1t/j
	9OEQv1pMArreITQjVdg+63+sxnGT6+JNF7VL/8VvQDokwXTv4ZC4MW3UsGwnbnL2CK0lomKH0zy
	FXxz1UJOWMfPmFvCNckJwu/s0IY9ytsKs3TED3nRLBhrFwdcHlkAjxlQ64tMHEJsUOd+X3tB3am
	mPc4yw6FBPhOI9Om766pMR3xQQFpgYUHWmj+kNsabc2M4QBF98BXRyyNmqG79CwjvG+22hxJm/w
	/jdSh3Lp1cEczS6oTHZrSfV5WjnfCGFyriWhlLbSSVkoN7o533ejCaE9ViDFKwarZS0C+0/8ATa
	WXKXyaziEwcmWgUN0ZtPPdxECt8CAgR5h0/J+D/YGoomi20Ecb2dnN6zei/ddRD5JHAKVm4OvJp
	bXo/6RkAwPPnaMubHLNNYeygiXbTMr5jr1Z8NDJyrqGs452pX9DHg1YAa8jtO8KulCqd7cjoIkd
	3DLmNPcWCxXrX4rB3PTv+9zCkCiyBpgcXxcSPNRaBiONHSjgLnwtXspcR/Gfr5tuGHOH+kY34gz
	oKoT5qLwXcu/e1Zmog0c2Fj3jmQAZGHLP+eW8xtvGSo4usNEfFDuuZLbOd5U0g==
X-Received: by 2002:a05:7022:4588:b0:144:fb42:52 with SMTP id a92af1059eb24-1b39feb42f0mr7894237c88.28.1794218327859;
        Mon, 09 Nov 2026 01:58:47 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:47 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 07/11] mm/hugetlb: use common compound page initialization helper
Date: Mon,  9 Nov 2026 17:58:02 +0800
Message-ID: <20261109095807.41547-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109095807.41547-1-songmuchun@bytedance.com>
References: <20261109095807.41547-1-songmuchun@bytedance.com>
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

Boot-time gigantic hugetlb folios open-code the frozen compound
struct page initialization across two helpers.

Use memmap_init_compound_page_frozen() and remove the open-coded
helpers. This keeps the initialization rules shared with ZONE_DEVICE
instead of maintaining two implementations.

No functional change is intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 52 ++--------------------------------------------------
 1 file changed, 2 insertions(+), 50 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d2aaad235458..290e7859b2d7 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3222,50 +3222,6 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return true;
 }
 
-/* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
-static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
-					struct hstate *h,
-					unsigned long start_page_number,
-					unsigned long end_page_number)
-{
-	enum zone_type zone = folio_zonenum(folio);
-	int nid = folio_nid(folio);
-	struct page *page = folio_page(folio, start_page_number);
-	unsigned long head_pfn = folio_pfn(folio);
-	unsigned long pfn, end_pfn = head_pfn + end_page_number;
-	unsigned int order = huge_page_order(h);
-
-	/*
-	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
-	 * we must initialize them ourselves here.
-	 */
-	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
-		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail(page, &folio->page, order);
-		set_page_count(page, 0);
-	}
-}
-
-static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
-					      unsigned long pfn,
-					      struct hstate *h,
-					      enum zone_type zone, int nid,
-					      unsigned long nr_pages)
-{
-	struct page *head = &folio->page;
-
-	/*
-	 * This is an open-coded prep_compound_page() whereby we avoid
-	 * walking pages twice by initializing/preparing+freezing them in the
-	 * same go.
-	 */
-	__init_single_page(head, pfn, zone, nid);
-	__folio_set_head(folio);
-	set_page_count(head, 0);
-	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
-	prep_compound_head(head, huge_page_order(h));
-}
-
 /*
  * memblock-allocated pageblocks might not have the migrate type set
  * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
@@ -3323,8 +3279,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = PHYS_PFN(__pa(m));
 		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
-		const enum zone_type zone = zone_idx(pfn_to_zone(pfn, nid));
-		unsigned long nr_struct_pages = nr_pages;
+		const struct zone *zone = pfn_to_zone(pfn, nid);
 
 		h = m->hstate;
 		/*
@@ -3336,10 +3291,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		prev_h = h;
 
 		VM_BUG_ON(!hstate_is_gigantic(h));
-
-		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
-		hugetlb_folio_init_vmemmap(folio, pfn, h, zone, nid, nr_struct_pages);
+		memmap_init_compound_page_frozen(page, pfn, zone, huge_page_order(h));
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-- 
2.54.0

