Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218311;
	b=dY+kQV6VsM20D57NnCmY9oZgnTPK901v2vlibIiBOyG3S14Q95o/D9MfKsRICFuHI2yg
	 OKRnBGX2CB9omxK9f/eeBy/TnBMPLlQnYL3fgNLLHJqbI9uiHN2O+fW+TfRyPRKitAkYW
	 7zVUCvMibdMO9PL/lGS3BpJV5ohshuDUHhU0R5+9wFlmsDrqAGAdgIqZCB3AbvsqaZtX4
	 Ff2UlRcptNz1qgkiTfGjpyPDKpEFw6pPoOxRUludgGz92z3FwRIKbF6aCPrglh/+YEQXO
	 UE8lr2e01lam9h2kFD6JIY7nF53YqaZG6vp00uHIZYTH2o1a/tBFTvQOVVm/rlG2giA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZTW9tD9mNMY5t4i8EBaHTJulg/a3E+adgD2YdbO2jyc=;
	b=lIVw2TiRGwxJmoL2mlba0z41F+FOR82lv/6iBhYwM8fT2AXdIlSvGjOlGXsAVj4mAdVV
	 hw8/c7IQJnmXdFBWwBYpjkqrgonuOpDPkA1i3pROylpKZ1HUy+RU6QFZUUgaibn2PJ5/9
	 C11iYXI9F2BeWwfrvjtkcJlwWAoRdDcjg0IxheF547DOwyt+jrVCHRwQR1bL8gB7gBAlS
	 nB0E8j7+8T44gs5JL2CbMRNR4iyTsk2xo2TK7lnl7JnlWB1wJ2iNFvuudp7xO+4yFPvFJ
	 RJyxqjo1R4rLCiM7g5JR8MZcLJA+R1O/4AdC3FTVZ2+4FY/yrhNnn+BQsW+CqL+6JeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=N9siTmlX;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=N9siTmlX
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so672748c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794218310; x=1794823110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTW9tD9mNMY5t4i8EBaHTJulg/a3E+adgD2YdbO2jyc=;
        b=N9siTmlX1yNnhMNlAGcnNZV7DzGrc4QbXqlFleGMb4IB7wfpvCJJoQiIhtQSwb2NHf
         PcZ9fB5EBSvW6p5E8zGCi8i6goyLhmSyhq8SyLFC15oDXjR5Z1TFfEiYVmQr32ULnVqS
         tTgPAXGwfqHWi5szAX8UX/0vBzPI+ADMTnEVZDfz8aDzRuqxLyLr0Kbf2v004WSd3Oge
         nVOZeWpyV3vKnF/BQBPUFejG4H0k232t1Ngiq+uQq0XheRTk+5KBCDRMu+2uKewZlFIA
         E8RSozlIhc6ueX3ActlN4KORSNWsamRi4n9E4Fq950hJzWcsBmvS4z/3zj8o6IrQkpbC
         a2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218310; x=1794823110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZTW9tD9mNMY5t4i8EBaHTJulg/a3E+adgD2YdbO2jyc=;
        b=pD4REPWn+rNedNjuAL6adQoF+U4o+xLVycv0hZAnrh98gJEwDkDwi6v7nvN/4IBbPG
         VV/C7Vdy91ZJIIPFW7FNYizS8o2SwtuwVy31uFpS7UUrhZlY+0YfqaJP5O5iOIgEqbuY
         BVYiTDcTfLM6Q0RmXXwmL60KCZdDVZKxBsc9D5RMFQgsimS7/PtZbGYCX3fT9y0aLIH2
         9AMeOHVQ2oFMUOAZ7iGoEbQObzyDbGszMD/Wu0mHSObGkNrHegcaeYBIxhNbZGZ+Eq8f
         2xha+8/dEBegry4xJt8PArVDSwmPWwHZmSQ5bOU99FlcYriBb6WdPkhhFVyELvau3ruH
         rIbg==
X-Forwarded-Encrypted: i=1; AL+hErEr4AGoJUoteBbRYux4fQXM9rN+6yl8HjVfexduvgkoUlXiDAZZZCw2rIHPodwc4tKvFnPowr5MP3xFUGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eL4F2p7/1u+4fN8fIsDW7B+/nqma1ye5MzICZ+S7gBxfPYKlv
	Mgy3WKeTcQBpeZyh0LlEa5hH8J03rHKwpk2v3dISk5Qu7Q4/cT7ly0Aoz/APDkvdEco=
X-Gm-Gg: AYBFou2gWJ+jBA/Zv/DfHqjgZhw/mV03OplP4qTd3rnU2Loa/j4eFbDmfwTm5EFXqgq
	Skf5oRqC7WxOiipu4UpBe9I0Ja3+uBD9XnTzJ5MLsEpbrb0eElHzSj8xgjxdveDOpRNeo8HvLb3
	lZJksd8bh8ox+5sx77ZzJXSAm8humcFEyJXyxzIclBCpwUzKkQGxubOLtetvA+DvkUyiDuAtw+o
	9V4S4GBzKYUHDEXVQHtw1GjxmbtMHS+lkmmev9PQ0T14zJkD9D/cSnIoG3/wlS8VWEJ9JbiWCuz
	8het3MpA2cJ5t3F5xNaTqH9nw5k0h1YJEBx9AlFk5w/0aeqOin/q9ZrfcahP8uRzaaoCwWl2Urx
	TLn5/nkhjzXIBJfT8rooBRtVhW6Zk9PLCXcqfpTie2TUYh/Ui6u5FXX8q4Ryx4umaoh5rYlt6yc
	Phj0IS3nfc3JdDF+Ubj9j4bJcY5y/g++E2m5fudo+x3Qwtjo/MaUgLNJQ/vvJ76L0Up76w6lyiH
	bMkoHAbZWZ8s0HhoVoKway1UWCUdc9JfQ/Ppua+X945SagF6HApYN+WmdNoQUh6DiPq9WfCup9y
	0y0LV0xZkW4Htc9fSEH4jAqetn90mQjs6pZHSHyfBFzLzaPjPb2Hf08R9/o2KBSBDmu0FRg/kmi
	9PRnE+gw=
X-Received: by 2002:a05:7022:1114:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b39feabda0mr5619021c88.19.1794218309995;
        Mon, 09 Nov 2026 01:58:29 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm12841684c88.5.2026.11.09.01.58.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 01:58:29 -0800 (PST)
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
Subject: [PATCH 03/11] mm/mm_init: simplify zone device page initialization
Date: Mon,  9 Nov 2026 17:57:58 +0800
Message-ID: <20261109095807.41547-4-songmuchun@bytedance.com>
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

memmap_init_zone_device() currently seeds its reusable head and tail
templates by fully initializing the first real struct page and copying
it back into a stack object. This keeps the first page outside the
common loops and leaves __init_zone_device_page() only for template
construction.

Build both templates directly from the PFN-independent state. Add the
head-specific pgmap and refcount state to the head template and the
compound metadata to the tail template, then initialize every page
through zone_device_page_init_from_template().

This removes the special handling for the first head and tail pages
without changing their final state.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c | 91 ++++++++--------------------------------------------
 1 file changed, 14 insertions(+), 77 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9677698f30d3..6cf74f6840de 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1044,48 +1044,6 @@ static void __init memmap_init(void)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
-					  unsigned long zone_idx, int nid,
-					  struct dev_pagemap *pgmap)
-{
-
-	__init_single_page(page, pfn, zone_idx, nid);
-
-	/*
-	 * Mark page reserved as it will need to wait for onlining
-	 * phase for it to be fully associated with a zone.
-	 *
-	 * We can use the non-atomic __set_bit operation for setting
-	 * the flag as we are still initializing the pages.
-	 */
-	__SetPageReserved(page);
-
-	/*
-	 * ZONE_DEVICE pages union ->lru with a ->pgmap back pointer
-	 * and zone_device_data.  It is a bug if a ZONE_DEVICE page is
-	 * ever freed or placed on a driver-private list.
-	 */
-	page_folio(page)->pgmap = pgmap;
-	page->zone_device_data = NULL;
-
-	/*
-	 * MEMORY_DEVICE_GENERIC pages regain a refcount of 1 in the free
-	 * path. The remaining ZONE_DEVICE types start from 0 here and raise
-	 * the count again when the allocator or driver hands the page out.
-	 */
-	switch (pgmap->type) {
-	case MEMORY_DEVICE_FS_DAX:
-	case MEMORY_DEVICE_PRIVATE:
-	case MEMORY_DEVICE_COHERENT:
-	case MEMORY_DEVICE_PCI_P2PDMA:
-		set_page_count(page, 0);
-		break;
-
-	case MEMORY_DEVICE_GENERIC:
-		break;
-	}
-}
-
 static void zone_device_page_init_from_template(struct page *page,
 		unsigned long pfn, struct page *template)
 {
@@ -1126,30 +1084,13 @@ static void __ref memmap_init_compound(struct page *head,
 	unsigned long pfn, end_pfn = head_pfn + nr_pages;
 	unsigned int order = pgmap->vmemmap_shift;
 	struct page template;
-	struct page *page;
 
-	/*
-	 * We have to initialize the pages, including setting up page links.
-	 * prep_compound_page() does not take care of that, so instead we
-	 * open-code prep_compound_page() so we can take care of initializing
-	 * the pages in the same go.
-	 */
-	__SetPageHead(head);
+	memmap_init_page_common(&template, zone_idx, nid);
+	prep_compound_tail(&template, head, order);
 
-	/*
-	 * All tails of the same compound page share the state established by
-	 * prep_compound_tail(). Reuse one tail template for the whole range and
-	 * refresh only the PFN-dependent fields in that template before each copy.
-	 */
-	pfn = head_pfn + 1;
-	page = pfn_to_page(pfn);
-	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-	prep_compound_tail(page, head, order);
-	set_page_count(page, 0);
-	memcpy(&template, page, sizeof(*page));
-
-	/* Initialize the remaining tail pages from template. */
-	for (pfn = head_pfn + 2; pfn < end_pfn; pfn++)
+	__SetPageHead(head);
+	/* Initialize the tail pages from template. */
+	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++)
 		zone_device_page_init_from_template(pfn_to_page(pfn), pfn,
 						    &template);
 	prep_compound_head(head, order);
@@ -1188,22 +1129,18 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 	VM_WARN_ON(!IS_ALIGNED(start_pfn | nr_pages, pfns_per_compound));
 
+	memmap_init_page_common(&template, zone_idx, nid);
+	page_folio(&template)->pgmap = pgmap;
 	/*
-	 * Seed the reusable head-page template from the first real struct
-	 * page. The normal page-init and refcount helpers must operate on
-	 * a real memmap entry rather than a stack object.
+	 * MEMORY_DEVICE_GENERIC pages regain a refcount of one in the free
+	 * path. The remaining ZONE_DEVICE types start from zero here and raise
+	 * the count again when the allocator or driver hands the page out.
 	 */
-	pfn = start_pfn;
-	page = pfn_to_page(pfn);
-	__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-	memcpy(&template, page, sizeof(*page));
-	if (pfns_per_compound != 1)
-		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, pgmap));
-	pfn += pfns_per_compound;
+	if (pgmap->type == MEMORY_DEVICE_GENERIC)
+		atomic_set(&template._refcount, 1);
 
-	/* Initialize the remaining head pages from template. */
-	for (; pfn < end_pfn; pfn += pfns_per_compound) {
+	/* Initialize the head pages from template. */
+	for (pfn = start_pfn; pfn < end_pfn; pfn += pfns_per_compound) {
 		page = pfn_to_page(pfn);
 
 		zone_device_page_init_from_template(page, pfn, &template);
-- 
2.54.0

