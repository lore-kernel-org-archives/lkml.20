Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA523B47E3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699957; cv=none; b=bDFolGERh+nyJl10rWdBKvpz3nymONrbV1LRrnCZewX1ku+rWBSswwy3a9hlJwMOXQTxkj/wPJZLEpEUuIhHXvAZXnMb80Pq9AHUsL2NbStA7jmgl9e9aXRrjXmDiml81KqL1AIjBpZvtfscltIqPIe6gw9UmCudmpGuJJ3qEQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699957; c=relaxed/simple;
	bh=LskNNPuSB8QoudevYzVr17nYyrlTqFaZBhdrhrFkhzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrtXvgX/j34qh7knO0BwrkXF32K1iW3XFoRj7tpckpGkFsgvf0bGclXvTozlTraU1Ce4G/Uvgmc1kT9rBZ/F8dbNwG/sq1XGNFGYuldl4Jg0wtqYZ7YLXO86Lck5gmPgro3usAELfHlNqVZtG0YOxzUIS82iUt0I8bzoiDNW9o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n4xknpOB; arc=none smtp.client-ip=91.218.175.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n4xknpOB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LskNNPuSB8QoudevYzVr17nYyrlTqFaZBhdrhrFkhzE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789699948; v=1; x=1790304748;
 b=n4xknpOBPPEXMDCffjNgIvAWGb62BDrs4DleaYuZxUEDkNfBWXRIwzKw+466pivTS4bSZQYT
 vsmvnqXeXyFLdAYvHtbZ7YH7rSctHvc+yO6w4qF+8W8tYc18nBIHsyGenWHDptP9JPoA12bbKGg
 9BY86SGdjL87zt5oDYkamfW4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b61aff39c1dfddae;
	Fri, 18 Sep 2026 02:52:28 +0000
X-Mizu-Trace-ID: b61aff39c1dfddae
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: kas@kernel.org,
	david@kernel.org
Cc: lance.yang@linux.dev,
	akpm@linux-foundation.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/huge_memory: disallow raw PMD mappings of the huge zero page
Date: Fri, 18 Sep 2026 10:52:14 +0800
Message-ID: <20260918025214.89109-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aqwPHfWhKGty-Q_4@thinkstation>
References: <aqwPHfWhKGty-Q_4@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Sep 17, 2026 at 05:03:09PM +0100, Kiryl Shutsemau wrote:
>On Thu, Sep 17, 2026 at 05:29:48PM +0200, David Hildenbrand (Arm) wrote:
>> On 9/17/26 16:32, Kiryl Shutsemau wrote:
>> > On Thu, Sep 17, 2026 at 08:10:10PM +0800, Lance Yang wrote:
>> >> vm_mixed_zeropage_allowed() validates zeropage insertion into
>> >> VM_MIXEDMAP VMAs. No in-tree user needs to insert the huge zero page
>> >> through vmf_insert_pfn_pmd().
>> >>
>> >> Return VM_FAULT_SIGBUS if vmf_insert_pfn_pmd() is asked to map it.
>> >>
>> >> Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
>> >> Suggested-by: Kiryl Shutsemau <kas@kernel.org>
>> >> Suggested-by: David Hildenbrand <david@kernel.org>
>> >> Signed-off-by: Lance Yang <lance.yang@linux.dev>
>> > 
>> > The patch looks fine, but don't we want to cover the same for non-huge
>> > zero page in vmf_insert_pfn_prot()?
>> 
>> Why would the zeropage be a problem in PFNMAP mapping?
>
>Nothing enforces that it is read-only.

No in-tree user inserts the zeropage through vmf_insert_pfn_prot(), so
rejecting it there should be fine.

Something like:

---8<---
The huge zeropage is reclaimable, but a raw PFN mapping does not pin it.
A PMD mapping of huge_zero_pfn can therefore outlive the folio.

No in-tree user needs either mapping, so reject both with VM_FAULT_SIGBUS
rather than risk making either shared zero page writable.

Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---

 mm/huge_memory.c | 3 +++
 mm/memory.c      | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index b49bffe36d22..de34d64aa763 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1723,6 +1723,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 						(VM_PFNMAP|VM_MIXEDMAP));
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));

+	if (unlikely(is_huge_zero_pfn(pfn)))
+		return VM_FAULT_SIGBUS;
+
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);

 	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
diff --git a/mm/memory.c b/mm/memory.c
index 9e4a70421a6b..5d2d73c69fed 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2956,6 +2956,9 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
 	BUG_ON((vma->vm_flags & VM_MIXEDMAP) && pfn_valid(pfn));

+	if (unlikely(is_zero_pfn(pfn)))
+		return VM_FAULT_SIGBUS;
+
 	if (addr < vma->vm_start || addr >= vma->vm_end)
 		return VM_FAULT_SIGBUS;

--

That would keep both zeropages out of writable raw-PFN fault mappings ...
wdyt?

Cheers, Lance
