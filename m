Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515351;
	b=U9bgxysEFzxDjEKMl3e+crgb4aqeArzsWHIH3mUC4qD0QX79DFPySuZxj9wcGMscKh0D
	 JK9c+dehSiuHx16+BmeIQBNSqAnc9Az1/neAvj96raQVlLJYQlGk+OBboZvj7MsRs3qMA
	 QbB/kamFYD6lNEesR2xkVLVWVpQljrMOIduKnAnRtfPWIX1jd58nzOYbQu0+I7KzEFyd8
	 QlutUO1cho7SrM1aZY6g+3iW2/00Ea5lSBAHI7qyQs6G/hdQU/wtOpqt1KqVxfXPxyQSB
	 fEdhVce1NKrHl3F5KJHbEbzs/3qPTbkJ08eIGMo8gtRSs52xYLwvkbccOoKTAGh9XjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515351;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=fWPBh4xlXvHa2PfIk2O3jnTg7iaOCA9kUP9jRVQ5YkU=;
	b=OrhRbzkQ6A9rJrUD3uVuY/I6fE45O6J6m/hZHW4V8SwSdHxi1CYU6NS+STbQMBPT7NNS
	 wD+SHQMF1t316OwkWQqI336hN37qpHO+MhvF5WG7QpmK4boozRJUOa946DZk537itTUFQ
	 foyTtul9zDWO9NOL0Jek3tS6xCI70Ov+2DD4cYoCOD9yitlBG2/Avv/OiK+TzFgkwzQOg
	 gnhsq0AXiA2qtUkuVwxYokLhK7LZSIoOsvB/tgoIYLVP+wVKsRiZixF63xtjHFPoFcia6
	 tABjnuLzL55nvAxpIX7K/vlX5cLmRU8bv3pgL6PPa7w+DSr+zXvsPCGOzSdAYPb2Fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JB0ZOzkr;
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92250606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92250606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JB0ZOzkr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xl9e7alOwd/kiUgVOqOJ845lSSz3tfs5SaPASXGt7kg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793515348; v=1; x=1794120148;
 b=JB0ZOzkr9yBqzyGeHjJkHQyDVZmJtGcrtMU5ckKpJ/45p6f47rU81ZuYt4Zx3eXcAbI1XnC5
 n+a10glpaCyhCjPBPaljZrdGw7nHg/X43qT5LA+Z3i3NDtU3Wg5/2dXTbMunmtjUT/oL3m/XSGB
 dW72FeU8bExF8q1SYhikXu5g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 48526ceea99b9bcd;
	Sun, 01 Nov 2026 06:42:28 +0000
X-Mizu-Trace-ID: 48526ceea99b9bcd
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page
 handling
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <587556c5-389f-4616-99f9-f0216b72f112@linux.dev>
Date: Sun, 1 Nov 2026 14:42:07 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D520BF9-F46D-4652-B155-DACEF486B473@linux.dev>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <20261020115824.823278-2-songmuchun@bytedance.com>
 <587556c5-389f-4616-99f9-f0216b72f112@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Nov 1, 2026, at 14:31, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
>=20
>=20
> On 10/20/26 7:58 PM, Muchun Song wrote:
>> The new head page is already tracked on the vmemmap page list before
>> remapping starts.  Passing it separately gives the remap walker two
>> ways to refer to the same page and unnecessarily complicates its
>> interface.
>> Use the page list as the single handoff mechanism for the head page,
>> removing the redundant state from the walker.
>> No functional change intended.
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>  mm/hugetlb_vmemmap.c | 17 +++++++----------
>>  1 file changed, 7 insertions(+), 10 deletions(-)
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index 8b3abb562599..164e93e980bf 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -25,7 +25,6 @@
>>   *
>>   * @remap_pte:		called for each lowest-level entry =
(PTE).
>>   * @nr_walked:		the number of walked pte.
>> - * @vmemmap_head:	the page to be installed as first in the vmemmap =
range
>>   * @vmemmap_tail:	the page to be installed as non-first in the =
vmemmap range
>>   * @vmemmap_pages:	the list head of the vmemmap pages that can be =
freed
>>   *			or is mapped from.
>=20
> The @vmemmap_pages description may need updating as well. After this

Yes, the comment is out of date even without this patch.

> change, the list is no longer only an output list for pages to be =
freed;
> its first entry is also consumed as the new head backing page. It =
would
> be helpful to document this input contract explicitly.

But I can fix this in this along the way.

>=20
> Other than that, once Lance's comment is addressed:
>=20
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Thanks.

>=20
> Thanks,
> Qi
>=20
>> @@ -37,7 +36,6 @@ struct vmemmap_remap_walk {
>>  					     struct vmemmap_remap_walk =
*walk);
>>    	unsigned long		nr_walked;
>> -	struct page		*vmemmap_head;
>>  	struct page		*vmemmap_tail;
>>  	struct list_head	*vmemmap_pages;
>>  @@ -208,10 +206,13 @@ static void vmemmap_remap_pte(pte_t *pte, =
unsigned long addr,
>>  	pte_t entry;
>>    	/* Remapping the head page requires r/w */
>> -	if (unlikely(walk->nr_walked =3D=3D 0 && walk->vmemmap_head)) {
>> +	if (unlikely(walk->nr_walked =3D=3D 0)) {
>> +		struct page *head;
>> +
>>  		VM_WARN_ON_ONCE(!PageHead((const struct page *)addr));
>>  -		list_del(&walk->vmemmap_head->lru);
>> +		head =3D list_first_entry(walk->vmemmap_pages, struct =
page, lru);
>> +		list_del(&head->lru);
>>    		/*
>>  		 * Makes sure that preceding stores to the page contents =
from
>> @@ -220,7 +221,7 @@ static void vmemmap_remap_pte(pte_t *pte, =
unsigned long addr,
>>  		 */
>>  		smp_wmb();
>>  -		entry =3D mk_pte(walk->vmemmap_head, PAGE_KERNEL);
>> +		entry =3D mk_pte(head, PAGE_KERNEL);
>>  	} else {
>>  		VM_WARN_ON_ONCE(!PageTail((const struct page *)addr));
>>  @@ -289,7 +290,6 @@ static int vmemmap_remap_split(unsigned long =
start, unsigned long end)
>>   *		to remap.
>>   * @end:	end address of the vmemmap virtual address range that we =
want to
>>   *		remap.
>> - * @vmemmap_head: the page to be installed as first in the vmemmap =
range
>>   * @vmemmap_tail: the page to be installed as non-first in the =
vmemmap range
>>   * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is =
callers
>>   *		responsibility to free pages.
>> @@ -298,7 +298,6 @@ static int vmemmap_remap_split(unsigned long =
start, unsigned long end)
>>   * Return: %0 on success, negative error code otherwise.
>>   */
>>  static int vmemmap_remap_free(unsigned long start, unsigned long =
end,
>> -			      struct page *vmemmap_head,
>>  			      struct page *vmemmap_tail,
>>  			      struct list_head *vmemmap_pages,
>>  			      unsigned long flags)
>> @@ -306,7 +305,6 @@ static int vmemmap_remap_free(unsigned long =
start, unsigned long end,
>>  	int ret;
>>  	struct vmemmap_remap_walk walk =3D {
>>  		.remap_pte	=3D vmemmap_remap_pte,
>> -		.vmemmap_head	=3D vmemmap_head,
>>  		.vmemmap_tail	=3D vmemmap_tail,
>>  		.vmemmap_pages	=3D vmemmap_pages,
>>  		.flags		=3D flags,
>> @@ -547,8 +545,7 @@ static int __hugetlb_vmemmap_optimize_folio(const =
struct hstate *h,
>>  	 * they can be freed by the caller.
>>  	 */
>>  	ret =3D vmemmap_remap_free(vmemmap_start, vmemmap_end,
>> -				 vmemmap_head, vmemmap_tail,
>> -				 vmemmap_pages, flags);
>> +				 vmemmap_tail, vmemmap_pages, flags);
>>  out:
>>  	if (ret)
>>  		folio_clear_hugetlb_vmemmap_optimized(folio);
>=20

