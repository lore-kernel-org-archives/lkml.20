Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B76415F17
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082926; cv=none; b=ZoXKu+IFAjRzyA1XD1rhyRBB2+Twy5c7RnhfFYi1Wjt0bop1lMz1Yc64sEC8gcCtvW4lRveh3GyelZWk8NiFv5VROVEF7B4pd0d7ZdHSy2hGZtJeoS/eUzcGzqg7vtR6PiP4dVYmphBOY2jwb9lhfn36M/p1Hr5Gr+Kcby5q1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082926; c=relaxed/simple;
	bh=pOBqVVuIHVvqeyU6wrQ4dgNXmfPDjIBGUxzWzaeok4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6fsocAUdgbIbVMJV0XfwRVQKnYUWv/RyOQTCVXJ++WXfZY5Vf2OIGKrlzVSOTwsxJ7qeIt5FAlt+CSMnWja1iaK+6fDmzkWCKJpwz5g753aV1PQ8KWo1KZA1T9JNlLvQSPmkvMAFhr98LvuG9nkeRXn1ON/1yJnfOY3Hgwn46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cgHcJQMG; arc=none smtp.client-ip=95.215.58.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cgHcJQMG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pOBqVVuIHVvqeyU6wrQ4dgNXmfPDjIBGUxzWzaeok4Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790082921; v=1; x=1790687721;
 b=cgHcJQMG2Yii1JBRXOHyKTaRHPnr561X5sQWfKG7QTarfZEqMSltVpTknBjNqsId+Q9DOBOS
 wo3oaCVuMjkdIAz8Ih4Ca/vPRI3YIOq5Gt7DhPMmJC8BMBJU7xMXNR3jRyvh8ZIE+J+Pca2zmmp
 qFBkwnBi1HWhXGJElbi8ZInk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 957524858cb9f755;
	Tue, 22 Sep 2026 13:15:16 +0000
X-Mizu-Trace-ID: 957524858cb9f755
X-Migadu-Flow: FLOW_OUT
Message-ID: <a1cc2eaa-5a36-491d-8ec7-0bcf4132a535@linux.dev>
Date: Tue, 22 Sep 2026 14:15:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v7 10/29] mm: make PMD migration-entry splitting explicit
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org
Cc: ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
References: <20260914122950.3283997-1-usama.arif@linux.dev>
 <20260914122950.3283997-11-usama.arif@linux.dev>
 <35f36d8b-d215-439c-8e77-3a70deed7609@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <35f36d8b-d215-439c-8e77-3a70deed7609@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/09/2026 23:10, David Hildenbrand (Arm) wrote:
> On 9/14/26 14:28, Usama Arif wrote:
>> __split_huge_pmd() and friends take a "freeze" boolean that every caller
>> has to pass and almost every caller passes as false. The name says nothing
>> about what it selects, and the one thing it does select - PTE migration
>> entries instead of PTE mappings - is only ever wanted by the rmap migration
>> path.
>>
>> Rename it to use_migration_entries, keep it private to mm/huge_memory.c,
>> and add split_pmd_to_migration_entries() for try_to_migrate_one(), the only
>> caller that wants it.
>>
>> migrate_vma_split_unmapped_folio() also passed freeze=true, but only ever
>> runs on a PMD that is already a migration entry, which the generic helper
>> expands into PTE migration entries either way. Its folio_get() only existed
>> to balance the put_page() that freeze=true performs, so both go.
>>
>> No functional change intended.
>>
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> 
> [...]
> 
>> +void split_pmd_to_migration_entries(struct vm_area_struct *vma,
>> +				    unsigned long address, pmd_t *pmd);
> 
> Two tele tabbies please.


Ack, in next revision.

> 
>>  bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>>  			   pmd_t *pmdp, struct folio *folio);
>>  void map_anon_folio_pmd_nopf(struct folio *folio, pmd_t *pmd,
>> @@ -690,12 +690,14 @@ static inline void deferred_split_folio(struct folio *folio, bool partially_mapp
>>  	do { } while (0)
>>  
>>  static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
>> -		unsigned long address, bool freeze) {}
>> +		unsigned long address) {}
>>  static inline void split_huge_pmd_address(struct vm_area_struct *vma,
>> -		unsigned long address, bool freeze) {}
>> +		unsigned long address) {}
>>  static inline void split_huge_pmd_locked(struct vm_area_struct *vma,
>> -					 unsigned long address, pmd_t *pmd,
>> -					 bool freeze) {}
>> +					 unsigned long address, pmd_t *pmd) {}
>> +static inline void
>> +split_pmd_to_migration_entries(struct vm_area_struct *vma,
>> +			       unsigned long address, pmd_t *pmd) {}
> 
> Dito.
> 

Ack, in next revision.

>>  
>>  static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>>  					 unsigned long addr, pmd_t *pmdp,
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index ee8d46827ffdc..873887aed0bc2 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2033,7 +2033,7 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>  		pte_free(dst_mm, pgtable);
>>  		spin_unlock(src_ptl);
>>  		spin_unlock(dst_ptl);
>> -		__split_huge_pmd(src_vma, src_pmd, addr, false);
>> +		__split_huge_pmd(src_vma, src_pmd, addr);
>>  		return -EAGAIN;
>>  	}
>>  	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>> @@ -2257,7 +2257,7 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
>>  	folio_unlock(folio);
>>  	spin_unlock(vmf->ptl);
>>  fallback:
>> -	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
>> +	__split_huge_pmd(vma, vmf->pmd, vmf->address);
>>  	return VM_FAULT_FALLBACK;
>>  }
>>  
>> @@ -3190,7 +3190,7 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
>>  }
>>  
>>  static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>> -		unsigned long haddr, bool freeze)
>> +		unsigned long haddr, bool use_migration_entries)
> 
> 
> Just curious: s/use_migration_entries/to_migration_entries/
> 

Done for next revision.>>  {
>>  	struct mm_struct *mm = vma->vm_mm;
>>  	struct folio *folio;
>> @@ -3291,10 +3291,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>  		 * folios w.r.t anon exclusive handling. See the comments for
>>  		 * folio handling and anon_exclusive below.
>>  		 */
>> -		if (freeze && anon_exclusive &&
>> +		if (use_migration_entries && anon_exclusive &&
>>  		    folio_try_share_anon_rmap_pmd(folio, page))
>> -			freeze = false;
>> -		if (!freeze) {
>> +			use_migration_entries = false;
>> +		if (!use_migration_entries) {
>>  			rmap_t rmap_flags = RMAP_NONE;
>>  
>>  			folio_ref_add(folio, HPAGE_PMD_NR - 1);
>> @@ -3344,11 +3344,11 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>  		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
>>  
>>  		/*
>> -		 * Without "freeze", we'll simply split the PMD, propagating the
>> -		 * PageAnonExclusive() flag for each PTE by setting it for
>> +		 * Without migration entries, we'll simply split the PMD and
> 
> "When not splitting to migration entries .."
> 

Ack, in next revision.

>> +		 * propagate the PageAnonExclusive() flag for each PTE by setting it for
>>  		 * each subpage -- no need to (temporarily) clear.
> 
> While at it: s/subpage/page/


Ack, in next revision.

> 
>>  		 *
>> -		 * With "freeze" we want to replace mapped pages by
>> +		 * With migration entries we want to replace mapped pages by
> 
> "When splitting to migration entries ..."

Ack, in next revision.

> 
>>  		 * migration entries right away. This is only possible if we
>>  		 * managed to clear PageAnonExclusive() -- see
>>  		 * set_pmd_migration_entry().
>> @@ -3359,10 +3359,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>  		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
>>  		 */
>>  		anon_exclusive = PageAnonExclusive(page);
>> -		if (freeze && anon_exclusive &&
>> +		if (use_migration_entries && anon_exclusive &&
>>  		    folio_try_share_anon_rmap_pmd(folio, page))
>> -			freeze = false;
>> -		if (!freeze) {
>> +			use_migration_entries = false;
>> +		if (!use_migration_entries) {
>>  			rmap_t rmap_flags = RMAP_NONE;
>>  
> 
> [...]
> 
>>  
>>  	smp_wmb(); /* make pte visible before pmd */
>> @@ -3477,15 +3477,28 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>  }
>>  
>>  void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>> -			   pmd_t *pmd, bool freeze)
>> +			   pmd_t *pmd)
> 
> While at it ...
> 
>>  {
>>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>>  	if (pmd_trans_huge(*pmd) || pmd_is_valid_softleaf(*pmd))
>> -		__split_huge_pmd_locked(vma, pmd, address, freeze);
>> +		__split_huge_pmd_locked(vma, pmd, address, false);
>> +}
>> +
>> +/*
>> + * Split a present PMD into PTE migration entries, for the rmap migration
>> + * walker.  Like split_huge_pmd_locked(), the caller must hold the PMD lock and
>> + * must already be inside an mmu_notifier invalidate range.
>> + */
> 
> I'd prefer kerneldoc but I'll let you decide.

Switched to kerneldoc.

> 
>> +void split_pmd_to_migration_entries(struct vm_area_struct *vma,
>> +				    unsigned long address, pmd_t *pmd)
> 
> two tabs ...
> 
> [...]
> 
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -918,12 +918,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
>>  	unsigned long flags;
>>  	int ret = 0;
>>  
>> -	/*
>> -	 * take a reference, since split_huge_pmd_address() with freeze = true
>> -	 * drops a reference at the end.
>> -	 */
>> -	folio_get(folio);
>> -	split_huge_pmd_address(migrate->vma, addr, true);
>> +	split_huge_pmd_address(migrate->vma, addr);
> 
> 
> Everything up to this point was trivial :)
> 
> You say that it already is unmapped (which makes sense looking at the
> function name).
> 
> In VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio) we verify.
> 
> Did you run the hmm selftests with DEBUG_VM enabled, just to be sure? I remember
> they exercise at least some of the THP logic in here.
> 

I have now, with CONFIG_DEBUG_VM=y, CONFIG_DEBUG_VM_PGTABLE=y and
panic_on_warn=1, on this series and on the base commit. The result is
identical either way:

  # Totals: pass:35 fail:3 xfail:0 xpass:0 skip:40 error:0

The three failures are file_read, file_write and migrate_file_private,
all of which fail at

  hmm-tests.c:828:file_read:Expected fd (-1) >= 0 (0)

i.e. hmm_create_file()'s open("/tmp", O_TMPFILE), which the VM I am using
with 9p /tmp does not support. they fail the same way on the unpatched
kernel.  The 40 skips are the DEVICE_COHERENT half.

The 40 skips are the DEVICE_COHERENT half.


> 
>>  	ret = folio_split_unmapped(folio, 0);
>>  	if (ret)
>>  		return ret;
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 2888ee638d872..ee33bbb421008 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -530,7 +530,7 @@ static inline long change_pmd_range(struct mmu_gather *tlb,
>>  		if (pmd_is_huge(_pmd)) {
>>  			if ((next - addr != HPAGE_PMD_SIZE) ||
>>  			    pgtable_split_needed(vma, cp_flags)) {
>> -				__split_huge_pmd(vma, pmd, addr, false);
>> +				__split_huge_pmd(vma, pmd, addr);
>>  				/*
>>  				 * For file-backed, the pmd could have been
>>  				 * cleared; make sure pmd populated if
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 5332c52909be1..feb751e29b992 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2290,7 +2290,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>  				 * restart so we can process the PTE-mapped THP.
>>  				 */
>>  				split_huge_pmd_locked(vma, pvmw.address,
>> -						      pvmw.pmd, false);
>> +						      pvmw.pmd);
> 
> You can feel brave and squeeze it into a single line now :)
> 

Ack lol> 
> Overall LGTM.
> 


Thanks for the reviews!!
