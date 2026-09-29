Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B222BE655
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670995; cv=none; b=XNDBF9J8RFrJyVCALZmonhD0RZeE4odlpqOlCvOi63hQFDbAe8M1IZeRAL/+3KP6CwHRjcjohhAKE0AACDCx+OVgTO/N22+xCEL4XeZcZnLzCHR/xAqlNfFIe4GI/0WYAGLYa7f6P2UDSD/NUalDzrbN+SdkYg6H6TDe6vZMzWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670995; c=relaxed/simple;
	bh=8vfz9yom+ls/aQov6CVfDaBZr7Ko9IZV3QMRLqEpVmM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aeXhkl0lFXm+83OU3oHBvdDQSyqgYYDIc65wMA/1/LUUCqPLP+eXsvgGpJjHuFG0c/VOWDkm5OzJCHM7gV2ZuVLAQu3nPLrK6LkSnDMzLdieuf4MFYTC3vgtS61/7seAZyB9R31tq2B2GiY1gBA8pjAEvOoZMkJBKi79Z7+nSrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WMXbedJM; arc=none smtp.client-ip=91.218.175.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WMXbedJM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8vfz9yom+ls/aQov6CVfDaBZr7Ko9IZV3QMRLqEpVmM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790670991; v=1; x=1791275791;
 b=WMXbedJMmbqaftd1IpCIhlKKzGIzCRayG9NJsx7HkivNiVYX7SV3JIweXkHE+jmSxSGZGFY8
 cOpVlP8jKib3bYDO45TF0mzuc9vNN19kzoQfIv0Dl7DmxdKGdmnTYmyYPURpDDWxQSCsyxwG715
 JozrFQ1Ypj7BSyJi0O8Z7r2w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7b4496e5929f9e79;
	Tue, 29 Sep 2026 08:36:29 +0000
X-Mizu-Trace-ID: 7b4496e5929f9e79
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 07/12] mm/sparse-vmemmap: switch device DAX to shared
 tail vmemmap pages
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1b542015-8e5a-41af-9e98-9810333e6725@kernel.org>
Date: Tue, 29 Sep 2026 16:36:07 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lance Yang <lance.yang@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <53A73178-93E5-414D-8ECE-96B3082384C4@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260927025441.741633-8-songmuchun@bytedance.com>
 <1b542015-8e5a-41af-9e98-9810333e6725@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 15:36, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/27/26 04:54, Muchun Song wrote:
>> HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap =
pages.
>> Device DAX has not been switched to that mechanism yet.
>>=20
>> Switch device DAX to vmemmap_shared_tail_page() as well. This aligns =
DAX
>> with HugeTLB by using the common per-zone shared tail vmemmap page.
>>=20
>> The optimization is enabled only for DEV-DAX through =
pgmap->vmemmap_shift,
>> which supplies the compound page order recorded in section metadata =
before
>> vmemmap population. Unlike FS-DAX, DEV-DAX does not modify tail =
struct
>> pages, so sharing them is safe.
>>=20
>> Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
>> initialize its entries with PG_reserved for device zones. Also skip
>> poisoning vmemmap-optimizable sections while their struct pages may =
be
>> shared.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Acked-by: Qi Zheng <qi.zheng@linux.dev>
>> ---
>> v3:
>> - Move device_zone() after the definition of NODE_DATA() to fix
>>  non-NUMA builds.
>> - Update the commit message to describe the compound page order =
stored
>>  in section metadata
>> - Collect Acked-by from Qi Zheng
>>=20
>> v2:
>> - Explain why sharing tail vmemmap pages is safe for DEV-DAX
>>  (suggested by Qi Zheng)
>> ---
>=20
> [...]
>=20
>> -
>> static int __meminit vmemmap_populate_compound_pages(unsigned long =
start_pfn,
>>      unsigned long start,
>>      unsigned long end, int node,
>> @@ -551,21 +536,18 @@ static int __meminit =
vmemmap_populate_compound_pages(unsigned long start_pfn,
>> pte_t *pte;
>> int rc;
>> 	unsigned long flags =3D VMEMMAP_POPULATE_DAX;
>> + 	struct page *page;
>> + 	unsigned int order =3D pfn_to_section_compound_order(start_pfn);
>=20
> const and all the way to the top.

OK.

>=20
>=20
> I did wonder about the poisoning change ... because the memmap usually =
gets
> initialized once the memory section gets moved to a zone.
>=20
> SO now I'm a bit confused about the ordering of events :)

Yes, the normal memmap entries are initialized later when the range is
moved into the zone. The shared tail entries are the exception, though.

The ordering for device DAX is:

1. sparse_add_section() sets the section compound order and populates
   the vmemmap.
2. During vmemmap population, optimizable tail entries are mapped to
   the per-zone shared tail page, which is initialized by
   vmemmap_shared_tail_page().
3. page_init_poison() is reached after that population.
4. Later, move_pfn_range_to_zone() calls memmap_init_range(), but the
   latter deliberately skips vmemmap_optimizable_pfn() because those
   entries have already been initialized.

Therefore, an unconditional poison here would overwrite the initialized
shared tail page, and the later zone initialization would not restore =
it.
The non-shared entries are still initialized later as usual.

I agree that this ordering is not obvious. I will update the comment to
make it clearer, for example:

  /*
   * Poison uninitialized struct pages to catch invalid flag =
combinations.
   *
   * Tail struct pages in a vmemmap-optimized section are initialized =
and
   * shared during vmemmap population, so they must not be overwritten =
here.
   */

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David


