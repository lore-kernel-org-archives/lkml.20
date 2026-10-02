Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AED23D28C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905800; cv=none; b=LOingIhhe3e3C+FxKBOC0ZFORIVabGg6Bi82bGLvbIBlXkL7Vh7jsDMITGNxjKjT0wQEUKUyiydlCu5226EyOrHjj0ZLEi4icJB3CJ8UxiZ7+L32y3Jd4Vfp+B0citrOQjlOEv8kaejxzEu8Au45BNbU3yGY+a9SVKNBSX1qCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905800; c=relaxed/simple;
	bh=O/F6AKy+1TPXxN7FZeSSixd6YDpdthmqRGsFYibhu3U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XSOYqgGLMB28IL4iiCMMrARrchuIoUQ8Qe+XGPzod/TQZxXOpkiTFPtr4evs+ekJDQ5teuN2tPJqHhZLS633ORfqzKg5pLO2rUSk6wkrQDUi1v4rrrlIQEccrkyrbXaqIWwGHx37igF2wTB+08TfAI7NxLeehfZ6xQMCDLLytAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ohcTV+WL; arc=none smtp.client-ip=91.218.175.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ohcTV+WL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O/F6AKy+1TPXxN7FZeSSixd6YDpdthmqRGsFYibhu3U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790905794; v=1; x=1791510594;
 b=ohcTV+WLBQIjClcA1S1hNHO1DQXU8X2joFAGsI1ThoyMAN+PVq5OqpomUoURl0QZZTMDOsg8
 rUTsUjr8j6+/QF/c69xneTs28BVt9aj99XKSrbX2cQn4X8gxKFZI157OdULq5kABQEEY5+ijQ1g
 unZwtNPkMlkqFp8pYbm9JY2o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7473f29920ffea9f;
	Fri, 02 Oct 2026 01:49:54 +0000
X-Mizu-Trace-ID: 7473f29920ffea9f
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page
 init
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ar5xbQsUpSQZg0wO@kernel.org>
Date: Fri, 2 Oct 2026 09:48:42 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <78D5D6AA-BE36-432C-B0F7-453F93DF18C0@linux.dev>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
 <20260929053231.66085-7-songmuchun@bytedance.com>
 <ar5xbQsUpSQZg0wO@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 1, 2026, at 22:42, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> Hi Muchun,

Hi,

>=20
> On Tue, Sep 29, 2026 at 01:32:31PM +0800, Muchun Song wrote:
>> For vmemmap-optimized sections, tail struct pages may be backed by
>> shared vmemmap pages. Those shared pages must carry the same page =
zone
>> ID as the struct pages initialized for the section.
>>=20
>> Warn in __init_single_page() if the shared tail page has a different
>> page_zone_id(), which would indicate inconsistent initialization.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Acked-by: Qi Zheng <qi.zheng@linux.dev>
>> ---
>> v3:
>> - Collect Acked-by from Qi Zheng
>>=20
>> v2:
>> - New patch.
>> ---
>> mm/mm_init.c | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 1650d6bc1211..bd02e8d06965 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct page =
*page, unsigned long pfn,
>> if (!is_highmem_idx(zone))
>> 	set_page_address(page, __va(pfn << PAGE_SHIFT));
>> #endif
>> + 	=
VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pf=
n)) &&
>> + 			page_zone_id(page + =
VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=3D
>> + 			page_zone_id(page));
>=20
> Hmm, page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES is initialized a tad =
later
> than page so it'll have stale data in the page->flags, won't it?

Lance is right. The shared tail struct pages are already initialized by
vmemmap_shared_tail_page() during vmemmap population, so they're not =
stale.
The head 64 struct pages are initialized later =E2=80=94 right here, =
after vmemmap
population.

Thanks,
Muchun

>=20
>> }
>>=20
>> #ifdef CONFIG_NUMA
>> --=20
>> 2.54.0
>>=20
>=20
> --=20
> Sincerely yours,
> Mike.


