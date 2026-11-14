Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630949;
	b=cyZ0M0uLR68N4pAcIWk8vaUVOePdgY1oLRiLAGKsamrpgYvxcVwi2SCtkRgqqpThjMRz
	 YXn0Kz7qdWWvm/f0+4ihyIqy4HezVpxoVgV3E8Iahn5QC5qEPjKXV+mq7+/C4wrb/1u9G
	 7cZ7vc+CGYE+5nUDhEUbb2IHCso94T/ID3lDAp2yDR1Fh5gfd1ImZiujGKuUhbmW0vXi/
	 OETPskg5XAoWeyaqz8apZ8JTqhPi2GPmNhFPHv3D7RHfpXfzjGj26eNXcoj6jW9l8V5JG
	 Unm+boLy84nTkQGGig8nVOzeneTRBQTcsDVAvmFhJWhoFVCxSmny2HfSAFWPjSIXhWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RxV2i3CwJwPvn+mwJ4cbWtgTLXqgAkSjs2t6czxawYk=;
	b=esT68SGwexwnfU5Db59FaFCOz4yadRo6Sw6MU3Ik7qtEyfLFdwyN36SN0uTBFc1w3ryj
	 N8kuc/bjLBF1m03fRRSEJNNROKl6fcjNL/eXVc4/jYzP22sTMwCQ7c49xKu0W4DqpesUY
	 CFDH+PaU11aQhlG9o8/JT9EBttcQMkApSGZq7Fs6hRYh7pjy7nVRJgvc8eYihXO6WSPtA
	 Vl7gsqc5TYKXz1T6Oz4IxbN8ZcSTvTQYBoa+a5neJZ9fgTYPv72hOQ5iuYIG+CZIN1Hj3
	 TafB34bgNDXHZrx25jo158RDEMNeVDvav+VCa34qIHz4TLUTkZehCG54wViwgztZ8eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkO6hsgJ;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BAA606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BAA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkO6hsgJ
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso627329a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794630947; x=1795235747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxV2i3CwJwPvn+mwJ4cbWtgTLXqgAkSjs2t6czxawYk=;
        b=xkO6hsgJgFkvYEMsg6Ftt7qe6mlYT/sGec658NtUqneRzNQ8zNAdIylJH1jWG2dFT9
         4txmzjTYIR9kLsnSGjeU9ePtlBiBKyJTFDk+bugykjJ1mt3ld7qAd97xCbQnWlpiyxcL
         Di3kCYfFAUCOVSG3BTGfMO0wYO3zgivxHR0c4LB03WlYupLypkcmhVWZv5ch0eeInJhO
         h1m9Ot5pTUzNy5nVrhmS9PkVxEWxOZMXrsQqTzFofPy2vePZzKEQm00UY9pTxnvQ3Nwy
         7R+16L3IBviRfguh8zVr3X/PA5Djs7lTW+5Dk46IFAZK9hA6SSaZp+4ROGsOzLVt12Tb
         ulAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630947; x=1795235747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxV2i3CwJwPvn+mwJ4cbWtgTLXqgAkSjs2t6czxawYk=;
        b=fu13K2mHWdQUhmJJKfwzWKzAoAdHNrRUKcBn7tHQJh6jlQWWTWYe4e9WS9w3wkDEli
         EPMSl9e5vx1J2EOgQplx6FEapdGvkEjRCa6xJyEt7PbaaLA4bPpd83gLKhapMjouNRBm
         fnUyhG0h32ve6MimYCSv76jJHijyVE9876LVAphb6NOj/sDsxXAwzNk4VmIb0fd7h4Iu
         wNB6reRJkM6FKPoYcl6nrntmvcLJM6J3yBXSGUrSWxnwtjHY9sOHWKriuCz+vUOwZ6JU
         mQmvUy8bDKi37pRqIrhoczVcccIRIRZJ3C1k6KwCUuFV2gP85OSrepaV7GsoWki8aU7N
         0qtA==
X-Forwarded-Encrypted: i=1; AL+hErFJsX1th68azLODRF2SsRmf56TeXWIQWyHv5PtWXkB5MzWcFIyg2X75VCPEUIZdug1C7MNtNb64txE4hbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AUes/0RjFEI0bfSWjQg0qK/FEp1VD74fMEjYWrfsF1s0bdiWs
	UlJqzcLP2vxHL+bhrdhv75G6SDMU5VqC3D3BzavH7vNmjeub3mAEPYgU
X-Gm-Gg: AYBFou1pKmHMHjOv6QeitFatzc1+rmAD+N6Sc9e8prYFUZGlHDZU5g6V6RrQbMKXqFX
	eQwo1sapOVRQv/hXFkqoGKgTA+Shu7GZQtiwHSQSO8pNm4CUtNl6a42nhY2gyys/gr/gVTja8ay
	WMpaU29mJryD9VPhLGj4nwjnxH552ikC3P/sZdNKR1+CKdoUrWxvoEr9TUiFAZDfdBtFKEUv6fN
	EhZcbH2ZN962kAPeWwRpJHbiZAgLRIVYzrxVuv5BxgqKaYFOYZAsdvWFC7i/VWxo3UvMevSVokT
	KRLDBGoIqI/8IcQjy8R1zok1LHF61bCDqUOmqtKD9GUzhN/BirgT1Z3XlxoxSvq04X+XYfoDMkW
	AkqOwP/I4xuOJRveIYl8pD7vEztpia8QYLQaCqOKg91WWTrARhOWQluK0Qx0lofl2kQx598vBDn
	fP4UgxMTR4ne661bl3ZT6y/PageLrtjrcBOTRrpAifINTJzA8ipSxLQvvtLUPo7dY1vDnKu78d5
	4deTiYkN/4pj4KZw/HORAUxMmb8JuCxY3opIA0OMDJc2I+yCIWCCS3y5P+ZOY8dIfqqHmuCDd99
	Yrweqgf+RePfleZ86d5bFin/llyKKzb1b0Q=
X-Received: by 2002:a17:90a:c88b:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b1b0ba890emr4682230a91.59.1794630947279;
        Fri, 13 Nov 2026 20:35:47 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm12089020a91.15.2026.11.13.20.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:35:46 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	joelagnelf@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ecourtney@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v2] gpu: nova-core: mm: reserve room for every prepared page table page
Date: Sat, 14 Nov 2026 11:35:35 +0700
Message-ID: <20261114043535.158583-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
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

install_mappings() moves every page in pt_pages into page_table_allocs
with push_within_capacity(), but prepare_map() reserves room only for an
estimate of the pages of the mapping it prepares. The estimate is too
low for a range that crosses a page table boundary, and it leaves out
pages that earlier calls put in pt_pages. Preparing several mappings
before executing them is then enough to make the push fail. The page is
freed although its PDE has been written, and pages still in pt_pages
can have their PDEs installed into it later.

Reserve room for each page when it is added to pt_pages, and drop the
estimate. Also move a page into page_table_allocs before writing its
PDE, so that a failing PDE write does not free it either.

The problem was found by an LLM-assisted code review.

Fixes: 4e4182282d4e ("gpu: nova-core: mm: Add multi-page mapping API to VMM")
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
v2: reserve room for each page as it is added to pt_pages, so that pages
left by earlier or failed calls are covered too. The Sashiko review
pointed out that v1 alone still lets a failing push free a parent page
while its children stay in pt_pages.

Tested on a GB203 with a temporary self-test that prepares eight
single-page mappings 1 TiB apart in a fresh Vmm and then executes them:
without this patch every execute_map() fails with -ENOMEM, with it they
all succeed. The MM self-tests still pass.

v1: https://lore.kernel.org/nova-gpu/20261113075422.943779-1-vladazaharova2018@gmail.com/

 drivers/gpu/nova-core/mm/pagetable.rs     | 24 ---------------
 drivers/gpu/nova-core/mm/pagetable/map.rs | 37 ++++++++++++++---------
 2 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index 63a7e1855caa..03a132406a15 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -248,30 +248,6 @@ fn entry_size(level: PageTableLevel) -> usize {
             8 // 64-bit PDE/PTE
         }
     }
-
-    /// Compute upper bound on page table pages needed for `num_virt_pages`.
-    ///
-    /// Walks from PTE level up through PDE levels, accumulating the tree.
-    fn pt_pages_upper_bound(num_virt_pages: usize) -> usize {
-        let mut total = 0;
-
-        // PTE pages at the leaf level.
-        let pte_epp = Self::entries_per_page(Self::PTE_LEVEL);
-        let mut pages_at_level = num_virt_pages.div_ceil(pte_epp);
-        total += pages_at_level;
-
-        // Walk PDE levels bottom-up (reverse of PDE_LEVELS).
-        for &level in Self::PDE_LEVELS.iter().rev() {
-            let epp = Self::entries_per_page(level);
-
-            // How many pages at this level do we need to point to
-            // the previous pages_at_level?
-            pages_at_level = pages_at_level.div_ceil(epp);
-            total += pages_at_level;
-        }
-
-        total
-    }
 }
 
 /// Marker struct for MMU v2 (Turing/Ampere/Ada).
diff --git a/drivers/gpu/nova-core/mm/pagetable/map.rs b/drivers/gpu/nova-core/mm/pagetable/map.rs
index f7774b9cc972..2517fdcc5217 100644
--- a/drivers/gpu/nova-core/mm/pagetable/map.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/map.rs
@@ -116,6 +116,7 @@ fn ensure_single_pte_path(
         &self,
         mm: &mut GpuMm<'_>,
         vfn: Vfn,
+        page_table_allocs: &mut KVec<Pin<KBox<AllocatedBlocks>>>,
         pt_pages: &mut RBTree<VramAddress, PreparedPtPage>,
     ) -> Result {
         let max_iter = 2 * M::PDE_LEVELS.len();
@@ -140,6 +141,10 @@ fn ensure_single_pte_path(
                     install_addr,
                     level,
                 } => {
+                    // Reserve so install_mappings() can use push_within_capacity (no alloc in
+                    // fence signalling critical path). It installs every page in `pt_pages`,
+                    // including pages left by earlier calls, so keep room for all of them.
+                    page_table_allocs.reserve(pt_pages.iter().count() + 1, GFP_KERNEL)?;
                     let page = Self::alloc_and_zero_page(mm, level)?;
                     let node = RBTreeNode::new(install_addr, page, GFP_KERNEL)?;
                     let old = pt_pages.insert(node);
@@ -163,8 +168,8 @@ fn ensure_single_pte_path(
 
     /// Prepare page table resources for mapping `num_pages` pages starting at `vfn_start`.
     ///
-    /// Reserves capacity in `page_table_allocs`, then walks the hierarchy
-    /// per-VFN to prepare pages for all missing PDEs.
+    /// Walks the hierarchy per-VFN to prepare pages for all missing PDEs, and
+    /// reserves capacity in `page_table_allocs` for them.
     pub(super) fn prepare_map(
         &self,
         mm: &mut GpuMm<'_>,
@@ -173,16 +178,11 @@ pub(super) fn prepare_map(
         page_table_allocs: &mut KVec<Pin<KBox<AllocatedBlocks>>>,
         pt_pages: &mut RBTree<VramAddress, PreparedPtPage>,
     ) -> Result {
-        // Pre-reserve so install_mappings() can use push_within_capacity (no alloc
-        // in fence signalling critical path).
-        let pt_upper_bound = M::pt_pages_upper_bound(num_pages);
-        page_table_allocs.reserve(pt_upper_bound, GFP_KERNEL)?;
-
         // Walk the hierarchy per-VFN to prepare pages for all missing PDEs.
         for i in 0..num_pages {
             let i_u64: u64 = i.into_safe_cast();
             let vfn = Vfn::new(vfn_start.raw() + i_u64);
-            self.ensure_single_pte_path(mm, vfn, pt_pages)?;
+            self.ensure_single_pte_path(mm, vfn, page_table_allocs, pt_pages)?;
         }
         Ok(())
     }
@@ -207,10 +207,21 @@ pub(super) fn install_mappings(
             while let Some(c) = cursor {
                 let (next, node) = c.remove_current();
                 let (install_addr, page) = node.to_key_value();
-                let page_vram =
-                    VramAddress::from_raw(page.alloc.iter().next().ok_or(ENOMEM)?.offset());
+                let page_vram = page
+                    .alloc
+                    .iter()
+                    .next()
+                    .map(|b| VramAddress::from_raw(b.offset()));
+                let level = page.level;
+
+                // Keep the page before pointing a PDE at it, so that no failure below can free a
+                // page that a PDE points at. ensure_single_pte_path() reserved room for it.
+                page_table_allocs
+                    .push_within_capacity(page.alloc)
+                    .map_err(|_| ENOMEM)?;
+                let page_vram = page_vram.ok_or(ENOMEM)?;
 
-                if page.level == M::DUAL_PDE_LEVEL {
+                if level == M::DUAL_PDE_LEVEL {
                     let new_dpde = M::DualPde::new_small(Pfn::from(page_vram));
                     new_dpde.write(pramin, install_addr)?;
                 } else {
@@ -218,10 +229,6 @@ pub(super) fn install_mappings(
                     new_pde.write(pramin, install_addr)?;
                 }
 
-                page_table_allocs
-                    .push_within_capacity(page.alloc)
-                    .map_err(|_| ENOMEM)?;
-
                 cursor = next;
             }
 

base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

