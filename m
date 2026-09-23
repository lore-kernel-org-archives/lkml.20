Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB5A396D0D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202726; cv=none; b=G61INTn0FaVJy+7PwAVPt+pVTrJtkQ8KwkAcvzOa1aAwXEd97KVYaIlDDYgI1i3X8TbZnVL/wbBJRCvfdBgZf/WMLBofNA9SHUej9JZyXyYvNZPeiWOCuKuXmnJzf9LdQfQoz9Kr3wxNJrxxTOGuVnGpqtqSQOrtQHfOSpcmezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202726; c=relaxed/simple;
	bh=+7Fa68RkVUaSKXHx7D9LSko/X7DgoFCCmrI4RX5nfaI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fWgfASp2rqOTLLFESJwFyAkJxy8o3NuzdGc5E2Wd1eaetAkNFlQYRDtUNZM8gqdtb5m7SLCLNRUcXWxj+yW+sMZHv+xEibDKEuZqddsDWCTlm+MiOl/RnoV/wqqHoAkdxN0EM0L6cs8CjE8m4oc0RUJi6bMOTGlm2zNzqaq1XRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=X2mNFTAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="X2mNFTAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664CA1F00893;
	Wed, 23 Sep 2026 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790202725;
	bh=Bxf0qfMfsaxisq5UZ3SzuyCSxoFCjpdy7dNmDjiJt2E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=X2mNFTAynqJKc99C9i0zaKuzSO/xxQaKys32ItvkJWs1xUAMPG9UNc9soM7xXdidl
	 kiF+VEWg84idMei3OgrybKgm3bRYkchCMj1TFALO/5Z/Fp9E+ueLdy+Kh7DA4BRpxG
	 hEGlP2s/v99pG2eoDmhdkxdaixuUHbsPyFjEGZFo=
Date: Wed, 23 Sep 2026 15:32:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kasong@tencent.com
Cc: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, David Hildenbrand
 <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance
 Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li
 <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham
 <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song
 <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, Shivam
 Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v6 00/17] mm/huge_memory: clean up and decouple the anon
 and file split helpers
Message-Id: <20260923153204.4fbc4a07679561feb4b665be@linux-foundation.org>
In-Reply-To: <20260923-swap-thp-cleanup-v6-0-ba1b4ba72c6f@tencent.com>
References: <20260923-swap-thp-cleanup-v6-0-ba1b4ba72c6f@tencent.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 23:32:31 +0200 Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org> wrote:

> The folio split path handles anon, page cache and swap cache folios in
> one routine.  That mixing is what makes the swap cache split
> restrictions hard to lift and to review. We now support uniform split to
> order-0 only, and no mappingless swap cache folios. And it has left a fair
> number of dead or redundant checks behind.
> 
> This series prepares for lifting those restrictions by cleaning up the
> code first: split the routine into an anon and a file helper, and keep
> all swap cache handling in the anon helper.  The file helper never sees
> a swap cache folio, folio_check_splittable() rejects them up front.
> 
> Apart from two bug fixes (patch 1 and 2) and a slight adjustment of anon
> splitting (patch 12), this is a pure cleanup.

Thanks, I've updated mm.git's mm-unstable branch to this version.

> Changes in v6:
> - Comments updated and make a few variables const as suggested by
>   [David Hildenbrand]
> - Link to v5: https://patch.msgid.link/20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com

Here's how v6 altered mm.git:


 mm/huge_memory.c |   19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

--- a/mm/huge_memory.c~b
+++ a/mm/huge_memory.c
@@ -3538,6 +3538,11 @@ void vma_adjust_trans_huge(struct vm_are
 		split_huge_pmd_if_needed(next, end);
 }
 
+/*
+ * A return value of 0 does not mean that unmapping succeeded. It might
+ * still have failed, but remap_anon_folio() must be called afterwards,
+ * for anon folios.
+ */
 static int unmap_folio(struct folio *folio)
 {
 	enum ttu_flags ttu_flags = TTU_RMAP_LOCKED | TTU_SYNC |
@@ -3555,7 +3560,6 @@ static int unmap_folio(struct folio *fol
 	/*
 	 * Anon pages need migration entries to preserve them, but file
 	 * pages can simply be left unmapped, then faulted back on demand.
-	 * If that is ever changed (perhaps for mlock), update remap_anon_folio().
 	 */
 	if (folio_test_anon(folio))
 		try_to_migrate(folio, ttu_flags);
@@ -4025,7 +4029,7 @@ static int __folio_freeze_split_anon(str
 {
 	struct folio *end_folio = folio_next(folio);
 	struct swap_cluster_info *ci = NULL;
-	int old_order = folio_order(folio);
+	const int old_order = folio_order(folio);
 	struct folio *new_folio, *next;
 	struct anon_vma *anon_vma = NULL;
 	enum ttu_flags ttu_flags = 0;
@@ -4048,8 +4052,7 @@ static int __folio_freeze_split_anon(str
 	 * the reference nor the lock. Anything else needs a reference
 	 * first and folio_ref_freeze() below catches it.
 	 *
-	 * Note a swapped-out THP counts as unmapped here as swap PTEs do
-	 * not contribute mapcount, and they are splittable.
+	 * Note that entirely swapped-out THPs are unmapped but can be split.
 	 */
 	if (folio_mapped(folio)) {
 		anon_vma = folio_get_anon_vma(folio);
@@ -4133,10 +4136,10 @@ static int __folio_freeze_split_file(str
 		unsigned int new_order, struct page *split_at,
 		struct list_head *list, enum split_type split_type)
 {
+	const long old_nr_pages = folio_nr_pages(folio);
 	struct address_space *mapping = folio->mapping;
 	XA_STATE(xas, &mapping->i_pages, folio->index);
 	struct folio *end_folio = folio_next(folio);
-	long old_nr_pages = folio_nr_pages(folio);
 	struct mem_cgroup *memcg, *old_memcg;
 	struct folio *new_folio, *next;
 	int nr_shmem_dropped = 0;
@@ -4166,7 +4169,7 @@ static int __folio_freeze_split_file(str
 	mapping_set_update(&xas, mapping);
 
 	if (split_type == SPLIT_TYPE_UNIFORM) {
-		int old_order = folio_order(folio);
+		const int old_order = folio_order(folio);
 
 		xas_set_order(&xas, folio->index, new_order);
 		xas_split_alloc(&xas, folio, old_order, gfp);
@@ -4269,10 +4272,6 @@ static int __folio_freeze_split_file(str
 	folio_ref_unfreeze(folio, folio_nr_pages(folio) + 1);
 	lruvec_unlock(lruvec);
 fail:
-	/*
-	 * If we want to use try_to_migrate() on file in unmap_folio,
-	 * remember to add remap_anon_folio() and adapt it.
-	 */
 	xas_unlock_irq(&xas);
 fail_mmap_unlock:
 	if (nr_shmem_dropped)
_

