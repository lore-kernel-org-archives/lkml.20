Received: from mta0.migadu.com (out-114.mta0.migadu.com [91.218.175.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7100938D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076083; cv=none; b=M0c1FhTCzLmPOI+TSFh4svLV6vFLe/QPoYQGSviUoS+y0TjDN3tpbt3ybl//C/CRYPsePVIRk5Bzh8zKWHQA/QHpVV9Qmm9lsqZRsBI/0Hlmk6R2gnJtuPcJwRjeubV3DLrYl5BqdC+SZFUF9iwjETFUYy/1JmFVwbHImZTlJCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076083; c=relaxed/simple;
	bh=sSUo0d8E6BWyoxCIKSh8oJBYJiXLVVUVNPEG+Z60ppw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awiK4C9apo1snq4Brgbw2eGe2w+qqow3iJt8BrhM7acP6/cIyC4umssk7dwQK9St1dvSk/pxYV3e8E3BF4+Kd2K6X8owpSj8m+XcnXQt5MxTPSlwScMSJPHk72CeYY8WxlqLtWMSr+f7ttmATFx4qq8TvijwnfEjMnvTpR/nB2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sqO8IcNj; arc=none smtp.client-ip=91.218.175.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sqO8IcNj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sSUo0d8E6BWyoxCIKSh8oJBYJiXLVVUVNPEG+Z60ppw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788076078; v=1; x=1788680878;
 b=sqO8IcNj7JPbFlYWHqTLO58fqocmUBqAgaCtJrLlZj/TsIlfysYRbJlYgEl8A0FhJs57kbgb
 jJR9OzSvXMvso+Ud0X7iaBXbCqzUZnvR9WwmpjDoL15R4rLEtdKwT8dtS+pL/dTP+bK1umZ5lWe
 DNTmzjb2ePlCh8PT8pgfrRyg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee9797414e8e0c9f;
	Sun, 30 Aug 2026 07:47:57 +0000
X-Mizu-Trace-ID: ee9797414e8e0c9f
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: gourry@gourry.net,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	jannh@google.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	balbirs@nvidia.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 0/3] mm: reject zone device folios in more folio walkers
Date: Sun, 30 Aug 2026 15:47:51 +0800
Message-Id: <20260830074751.25370-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <c2577ec5-acf6-466b-ba66-0b3bcabbef7d@linux.dev>
References: <c2577ec5-acf6-466b-ba66-0b3bcabbef7d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sun, Aug 30, 2026 at 01:18:24PM +0800, Lance Yang wrote:
>
>
>On 2026/8/30 08:18, Andrew Morton wrote:
>> On Tue, 18 Aug 2026 12:31:43 +0800 Lance Yang <lance.yang@linux.dev> wrote:
>> 
>>>
>>> On Mon, Aug 17, 2026 at 06:08:07PM -0400, Gregory Price wrote:
>>>> Several LRU-oriented mm walkers resolve the folio backing a PMD entry
>>>> (or a physical pfn) and then reclaim, age, migrate, or lazyfree it
>>>> without ever checking for ZONE_DEVICE memory.
>>>>
>>>> This series adds missing folio_is_zone_device() rejections, matching
>>>> the checks that comparable walkers already perform.
>>>>
>>>> - mm/huge_memory, mm/madvise: the !pmd_present branch above these sites
>>>>   only filters device-private entries (which are non-present).
>>>>
>>>>   A present zone device PMD (e.g. device-coherent) would still reach the
>>>>   folio and be lazyfreed / aged / paged out. Add an explicit check.
>>>>
>>>> - mm/mempolicy: queue_folios_pmd() can see a present zone device PMD
>>>>   (e.g. device-coherent) and queue it for migration.
>>>>
>>>> No crash reproducer - this is a correctness/hardening cleanup found by
>>>> inspection. All checks are placed after the folio is resolved and before
>>>> it is acted upon, on paths that already hold the relevant page-table lock,
>>>> so no locking or refcount changes are involved.
>>>
>>> Cool!
>>>
>>> Gave the whole series a spin on x86_64 QEMU with a PMD-mapped
>>> device-coherent THP. Without these patches, partial MADV_FREE and
>>> MADV_COLD reliably hit a kernel panic in remove_migration_pte(), while
>>> mbind(MPOL_MF_MOVE | MPOL_MF_STRICT) returned -EIO.
>>>
>>> With v2, all three worked fine, PMD mapping stayed intact, and data
>>> checked out :)
>>>
>>> Note that both kernels used the same small change to the in-kernel HMM
>>> test driver, allowing its coherent device memory to be allocated as 2 MB
>>> folios so the PMD-mapped test case could be exercised.
>>>
>>> Tested-by: Lance Yang <lance.yang@linux.dev>
>> 
>> Thanks Lance, you're so diligent.
>> 
>> I'm wondering what to do here.  Gregory told us
>> 
>> : No crash reproducer - this is a correctness/hardening cleanup found by
>> : inspection. All checks are placed after the folio is resolved and before
>> : it is acted upon, on paths that already hold the relevant page-table lock,
>> : so no locking or refcount changes are involved.
>> 
>> And you had to tweak the hmm-test driver to reproduce the bug(s).
>> 
>> So when do we push this series out to -stable?  As a hair-on-fire
>> hotfix, or as a leisurely next-merge-window thing?
>
>Thanks, Andrew :) Yeah, I'd say next merge window should be fine :)
>
>The crash is real once the mapping exists, but I had to tweak test_hmm
>to create that PMD-mapped device-coherent folio, and I couldn't find
>any in-tree production driver doing that today.
>
>So no need to rush this one, I guess.

BTW, noticed that the ZONE_DEVICE split handling only covers
device-private folios, so device-coherent folios aren't supported ...

The call chains are:

split_folio()
  -> __folio_split()
    -> folio_check_splittable()
    -> __folio_freeze_and_split_unmapped()

migrate_vma_pages()
  -> __migrate_device_pages()
    -> migrate_vma_split_unmapped_folio()
      -> folio_split_unmapped()
        -> __folio_freeze_and_split_unmapped()

And I added the device-coherent check to folio_check_splittable() and
folio_split_unmapped(). See below. They can go away once device-coherent
folio splitting is supported :)

If folks think it's worth having, I can send it as a follow-up :)

---8<---
Subject: [PATCH] mm/huge_memory: don't split device-coherent folios

From: Lance Yang <lance.yang@linux.dev>

The ZONE_DEVICE split handling only covers device-private folios.
Device-coherent folios are not supported.

The call chains are:

split_folio()
  -> __folio_split()
    -> folio_check_splittable()
    -> __folio_freeze_and_split_unmapped()

migrate_vma_pages()
  -> __migrate_device_pages()
    -> migrate_vma_split_unmapped_folio()
      -> folio_split_unmapped()
        -> __folio_freeze_and_split_unmapped()

Reject device-coherent folios in folio_check_splittable() and
folio_split_unmapped().

Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 mm/huge_memory.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 54494c3fa983..a5dd38e9a8de 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3937,6 +3937,10 @@ int folio_check_splittable(struct folio *folio, unsigned int new_order,
 	if (!folio->mapping && !folio_test_anon(folio))
 		return -EBUSY;

+	/* TODO: Support splitting device-coherent folios. */
+	if (folio_is_device_coherent(folio))
+		return -EOPNOTSUPP;
+
 	/* order-1 is not supported for anonymous THP. */
 	if (folio_test_anon(folio) && new_order == 1)
 		return -EINVAL;
@@ -4354,15 +4358,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
  *
  * anon_vma_lock is not required to be held, mmap_read_lock() or
  * mmap_write_lock() should be held. @folio is expected to be locked by the
- * caller. device-private and non device-private folios are supported along
+ * caller. device-private and non-ZONE_DEVICE folios are supported along
  * with folios that are in the swapcache. @folio should also be unmapped and
  * isolated from LRU (if applicable)
  *
  * Upon return, the folio is not remapped, split folios are not added to LRU,
  * free_folio_and_swap_cache() is not called, and new folios remain locked.
  *
- * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
- *         insufficient reference count or extra pins).
+ * Return: 0 on success, -EOPNOTSUPP for device-coherent folios, or -EAGAIN if
+ *         the folio cannot be split (e.g., due to insufficient reference
+ *         count or extra pins).
  */
 int folio_split_unmapped(struct folio *folio, unsigned int new_order)
 {
@@ -4373,6 +4378,9 @@ int folio_split_unmapped(struct folio *folio, unsigned int new_order)
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);

+	if (folio_is_device_coherent(folio))
+		return -EOPNOTSUPP;
+
 	if (folio_expected_ref_count(folio) != folio_ref_count(folio) - 1)
 		return -EAGAIN;

--

Cheers, Lance
