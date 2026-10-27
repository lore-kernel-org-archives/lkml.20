Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793071383;
	b=JxsxA5aY8V/Uoj43zYfkRH26C5I737WngQc2fs2a1o+VuN4robPDY391y1M0Souja96R
	 5Baa2z3S1cPY4pXl92b0yomNLgmgDxNISzuMuuHsV9FNs2UO6R2IgOzH2e18td+c0Jjbh
	 f3lgGNTeMEjSW/wPV+5ePisEfrwFqAkcnGlakaH6hQjqAGgiIPjC7lthDKVpyg6IvZfUC
	 FJ6iLO07wlm1Py/5VFCYNyPANKDP1s0vU/ZNtXWoUDyvHWBkctx0liY91CgSr02paTDYr
	 Y9Dmz4VkjOJbkuDZboIzWlukhLnPiIMi80Qk65bkf+zxtQDrZMa5H67zaR2txVgoILw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mWd1DAd1S4KnKkwjMVvNunqSd6gNRebh+/QyhPldimE=;
	b=NvlyuHQn5seiYM8Ue/zkEFZq0hRsax7UXoxpFmJMIS6PKzPJJMo88Vpq1beNHwkR8OFq
	 AbwEXTohVKLse7C9xx1kw+wN3c6TRm0YtbVGCujhsNIS8MyQriVqKanIqhKZxwAMli+sL
	 FwmRTJCmfzzrUylRDNxioSMwFdX4TfWlhTe3nt6TvaZmulwpZo0V0eviA9z8RjAy04JGg
	 txNI/x7SJd4YWOEa73/MY6O7NZHLD+4Y2nYTGfCF7S26Cy49dHk9b4cYGQq+9BtYmUP3a
	 YSpIEsi6xWCaVVhI4Y6mNJELF5xMt13X+15ASrsYlR7x99oJUzo/0p8HEqzOAvsAwbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B6l2+lis;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF4606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CF4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B6l2+lis
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so6818817eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793071382; x=1793676182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWd1DAd1S4KnKkwjMVvNunqSd6gNRebh+/QyhPldimE=;
        b=B6l2+lisrohOkD8Wp+jy9nt5OBxUtwXbSxKDwCXo6k5BMV6mKALVg0hzqHC0HDu1T0
         EozTFLFK1mkDsXrYcRre/Aw8I02Gbr2QuH/FWimbGXEYnJwsbTtrHbq5Bljvp4KMCrPM
         fZNLOLc8cMKKARgaUrE41Vg0nOQHWA+I2sVVCKr74uJhK2JdpCZ+1mEs3mpvtyiXRDYs
         fiVXC3Fb58OK5GciOI5EQtY67O6x1HjW1CF1qq26XyfJWh64KPVvWw6Rd0GR/jM/ZUKS
         d18NIfdHtHu9llwlQhx+Q8SN8hCitqdASt9Tr8DGCLpTPKSJzC4KYR1O98cM7D0ny1uw
         daXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793071382; x=1793676182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWd1DAd1S4KnKkwjMVvNunqSd6gNRebh+/QyhPldimE=;
        b=e/Y2XGw6Nfk0/XuYVCXUYyfHdIMqLa6wmFXiLnV4XPtRtGDPQ6NfluiEShVYRqTeIm
         +Sug5j545VT75biwNpLFXy8ol3ja+O44R3ip1USJmn7xWw3YK1uGSdQvq26t48VqO3Hn
         p/BE8dKpD+1y+FYev6q3hAA0LeFdmNRtDMMVX+ozRY39wQ3bxx39onYMaeNiepcPfhzA
         TuOKOjgG6DmObFRRe2miEKv77H/0/pgQ6MjSgaJyqnJH3qcnqu+TPcCgv0SQgpPaSnPB
         bxefEWnUt/u/QuEW1LeNIZ4xSYUihLjBLhKgwHr0m0We/nQj811hoLfEetc69F262OMl
         krQw==
X-Forwarded-Encrypted: i=1; AKwUvByFDKyopEO3XUgc4XOE9KwqdW6pKE+kr49QfJ9PFKJb6xxO3OBt1yXAdiJZ/ti68bh9MGf3xYObFrIWQw0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO+OkMSj2tu6xi1x5DjDXYwK0S+YvhOonJoZfUxcL3yPmEW/sG
	An8rd86bnmJUzK4CMyk7poLwtsSXeiQez6+H3zRPrGec2XQIHuy7fxLNICbN+w==
X-Gm-Gg: AYBFou1RsGCqyIoNorKGX3VQi7X4zl88ZDx7OpRhii69H0FmVWtvtysvDulblZqFSuB
	cyiOxo8r2PoRZghetOqcRoE9qSOsUxxgiJpUR0e/YXFWkYCxHHHZMQHkqZkVmjoGYY1a5LzPljC
	D44nI0H/RN51n7cgXmYBr3hn6Uh5FXQgynfA972TZwAaU7GPHTJ6DnuGg+yCkU5hp/ajK+vIFKV
	HV4lx+CXXGQfQn21TlGm/HcY2NhU4aSIVyzJElT6FueShez6y8KMMwvu8kVPcU+HG9K39dapZ6j
	MM7qqSrZl54KsiSKyXl3Rl965w0p/Z82NkDJepVMp0js95gNnxpqNHRFD3sI4wivpYyhOb3roat
	XAb/OV2dlFuIi3eoExkHGPsRU4rj0C/xh4l8LwYNJEz3Hn+RBk5w8ZL6IPp4vyN63UnWxDZrVWe
	zARyFUlhcvmaAxjoj1CNqjKZTQtFOvoOx3M2HcU1gqB+HOjRiZc56lSJaRhxV8d1rdtgfZoaFRx
	oN8dGlr67ZMQvRXg/j39GCvajV9pUfQhrdGR3mQ0eM5QwaqxveTUUEgP6/3
X-Received: by 2002:a05:7301:4388:b0:361:6884:78b1 with SMTP id 5a478bee46e88-369e8507476mr13203756eec.28.1793071382017;
        Mon, 26 Oct 2026 20:23:02 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm49373826eec.25.2026.10.26.20.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:23:01 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Pavithra <pavrampu@linux.ibm.com>
Subject: [PATCH 1/2] powerpc/64s/radix: don't dedup vmemmap covered by an existing PMD leaf
Date: Tue, 27 Oct 2026 08:52:48 +0530
Message-Id: <97f85592bb78a273be8519e6897e7f9b9bd31469.1793070429.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

radix__vmemmap_populate() is asked for one 16MB section, which is 16KB of
struct pages. With no altmap it rounds the request down to a PMD leaf.
That leaf describes 2GB of PFNs with 64KB pages (128MB with 4KB pages),
so it also covers sections that are not present yet. It cannot be freed
while any of those sections are still in use.

A devdax namespace that lands in the same window is marked for vmemmap dedup.
vmemmap_populate_compound_pages() treated the leaf as an existing huge mapping
and skipped it. The core then initializes only the head vmemmap page and assumes
the rest is the shared tail. Those remaining tail slots are real struct pages
still holding the page_init_poison() pattern and are not the shared tail pages.
__init_single_page() warns on the zone mismatch and the following pageblock init
faults in __set_pfnblock_flags_mask().

If the section's vmemmap is already a PMD leaf, clear its compound order
and reuse the leaf, so every struct page in the section is initialized.
The shared-tail layout needs base-page PTEs, so it cannot be built on top of
this leaf and dropping the leaf is not an option while the neighbouring range
is still using it. So, fail the compound populate if a leaf is still seen there.

<Call Trace>
============
[    3.467060][    T1] WARNING: mm/mm_init.c:600 at __init_single_page+0xd0/0xf4, CPU#0: swapper/0/1
<...>
[    3.477419][    T1] NIP [c000000000576b30] __init_single_page+0xd0/0xf4
[    3.477827][    T1] LR [c0000000005778b0] __init_zone_device_page+0x30/0xb8
[    3.478444][    T1] Call Trace:
[    3.478764][    T1]  0x10000 (unreliable)
[    3.479874][    T1]  memmap_init_zone_device+0x164/0x430
[    3.480392][    T1]  memremap_pages+0x43c/0x93c
[    3.480836][    T1]  devm_memremap_pages+0x3c/0xa4
[    3.481328][    T1]  dev_dax_probe+0x264/0x3d0
[    3.481817][    T1]  dax_bus_probe+0x140/0x1c8
[    3.482237][    T1]  really_probe+0x108/0x580
[    3.482681][    T1]  __driver_probe_device+0xcc/0x284
[    3.483186][    T1]  driver_probe_device+0x5c/0x108
[    3.483656][    T1]  __device_attach_driver+0x10c/0x1e8
[    3.484134][    T1]  bus_for_each_drv+0xc0/0x13c
<...>
[    3.499972][    T1] BUG: Kernel NULL pointer dereference on read at 0x00001400
[    3.500417][    T1] Faulting instruction address: 0xc0000000005f4ecc
[    3.500417][    T1] Faulting instruction address: 0xc0000000005f4ecc
cpu 0x0: Vector: 300 (Data Access) at [c000000006756b50]
    pc: c0000000005f4ecc: __set_pfnblock_flags_mask.constprop.0+0x34/0x160
    lr: c000000000577f38: memmap_init_zone_device+0x358/0x430
    pid   = 1, comm = swapper/0
enter ? for help
  memmap_init_zone_device+0x358/0x430
  memmap_init_zone_device+0x220/0x430 (unreliable)
  memremap_pages+0x43c/0x93c
  devm_memremap_pages+0x3c/0xa4
  dev_dax_probe+0x264/0x3d0
  dax_bus_probe+0x140/0x1c8
  really_probe+0x108/0x580
<...>

Fixes: bd0862382adb ("mm/sparse-vmemmap: drop Device DAX-specific population path")
Reported-by: Pavithra <pavrampu@linux.ibm.com>
Assisted-by: LLM
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
Fixes tag here is added since the fix is dependent upon the change mentioned in
"Fixes" tag. The Fixes commit-id is from mm-new branch. Although this could be
an older pre-existing issue, but got exposed after this patch series.

 arch/powerpc/mm/book3s64/radix_pgtable.c | 57 +++++++++++++++++++++---
 1 file changed, 50 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 44868b62b14e..abac39d020ab 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1114,7 +1114,35 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }

+/*
+ * vmemmap is populated one memory section at a time. A section on PowerPC
+ * is 16MB, so backing its struct pages takes a 16K region of vmemmap.
+ * Without an altmap, radix__vmemmap_populate() satisfies such a request by
+ * mapping a whole PMD_SIZE leaf. One leaf holds the struct pages for
+ * PMD_SIZE / sizeof(struct page) PFNs (2GB of memory with 64K pages, 128MB
+ * with 4K pages) i.e. for many sections, including ones that aren't
+ * present yet.
+ * Return true if any part of [start, end) is already covered by such a leaf.
+ */
+static bool __meminit vmemmap_pmd_leaf_mapped(unsigned long start,
+					      unsigned long end)
+{
+	unsigned long addr;

+	for (addr = start; addr < end; addr = pmd_addr_end(addr, end)) {
+		p4d_t *p4d = p4d_offset(pgd_offset_k(addr), addr);
+		pud_t *pud;
+
+		if (p4d_none(READ_ONCE(*p4d)))
+			continue;
+		pud = pud_offset(p4d, addr);
+		if (pud_none(READ_ONCE(*pud)))
+			continue;
+		if (pmd_leaf(READ_ONCE(*pmd_offset(pud, addr))))
+			return true;
+	}
+	return false;
+}

 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1128,8 +1156,20 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pte_t *pte;
 	unsigned long pfn = page_to_pfn((struct page *)start);

-	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn))) {
+		if (!vmemmap_pmd_leaf_mapped(start, end))
+			return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		/*
+		 * A leaf installed for a neighbouring range already backs this
+		 * section with real struct pages and it cannot be freed while
+		 * that range is present, so the shared tail layout would save
+		 * nothing. The core trusts the section's compound order to tell
+		 * which struct pages it must initialize. So, clear it so that
+		 * every struct page of this section is initialized, then reuse
+		 * the leaf like any other section does below.
+		 */
+		section_set_compound_order(__pfn_to_section(pfn), 0);
+	}
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1260,11 +1300,14 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		if (!pmd)
 			return -ENOMEM;

-		if (pmd_leaf(READ_ONCE(*pmd))) {
-			/* existing huge mapping. Skip the range */
-			next = pmd_addr_end(addr, end);
-			continue;
-		}
+		/*
+		 * The struct pages behind a leaf are not the head/shared tail
+		 * layout the core expects for this section and the tails
+		 * would be left uninitialized. radix__vmemmap_populate()
+		 * calls this only when it finds vmemmap optimizable order.
+		 */
+		if (WARN_ON_ONCE(pmd_leaf(READ_ONCE(*pmd))))
+			return -EOPNOTSUPP;
 		pte = vmemmap_pte_alloc(pmd, node, addr);
 		if (!pte)
 			return -ENOMEM;
--
2.39.5

