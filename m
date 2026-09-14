Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8FE369985
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401833; cv=pass; b=me6zMYW7aBHegE++0Ud4V1aaAG+7ZR3KNIvVycIyJBSpnh8GbbT8xEZvanSv0fJLH78iTPAsa/sAi0VkJZOuYucRTQ46hjZZAGu3VfMjjZx2BT09WunX10Gn432dpf5uWY9MDoNsQS18dd+y35CXo1Uei0f1Jy+25PMOnAmJ9O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401833; c=relaxed/simple;
	bh=FByMlc/emSXGXV9S7XSFRcqt0CPXtzEIwlSZLpyOX+0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jh31AigXVVGWHW7P5h9+b1IXfcZmtCyIi/NAhBpVvdBdIE5AXxrZqHmDtmk6edqiYcXNpaWukvjHhSWP/xm+1f22wzrV7DwMs4PQBEQGyWSMTWcWr/4GgzwvwMsn4Hrd9JJC1wdSrRUouqNhYXS+M+xnUENraSsQc/SLqAs7GGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G8BCyd5F; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G8BCyd5F"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9106feddbdfso27671426d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401830; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXtIdKjlo3ke9Z4yvmcsRYgCByIFONhMfeU5xI3Ar5B578ufSmYTFIteFMWMqp8iqo
         tOOKTGJhp6rE/c5HJIVMFw2LDTI4iAlnORRLRylW4Fb+XjnlFiHGSH6dr2psbc3ffQof
         ElbP0At44cLzrI/fhrqpPP6V9kI4iophzSEVi1hqWWOyig7D/3s/JqrYYDv6gSJoBEEB
         Mw5grCOs//lPh05Svx+dUY6pRJUVTirD4SW8m97Ot/JpjMEygPOPYQiBE5adenh0dDPl
         gYyBAqbNUcbyDXCEUNrbSBc1UuTeEpAXcG5sTVtnRkwibxMOeINRqlgdHBjy5aflqC/R
         xlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Lykhn1ziLcNrm34dqlEZxk1CMrWoLDAjyXD14b56Sf8=;
        fh=iHsrWgQr/8P/P4qUp2yuwMdHEvxVHZBAdDglnbaqXM8=;
        b=LO4uJtn5Mz9SOy5sQf1212LxlVZcOq3eM0IcPEoxSz0FGGe/lroQCJ6DbbQ7JwfwQr
         FE+dlAg9GFGmZP7ICiTzcMGM2ANJeNG45PRo6rzOZMnfbXK3r6OFloOf5b64cW4GIZcV
         jFkNqZbxODnhkc34c/XaTTBZwg1t3trLbon/GB1oMw1IoosFkWsBaocGw/mm4B3D6RWy
         dnKr07oroYPpt+/4jKnvvvZmFQlIBoP9+cBjgfibedocrMjB0VKQ8vVYu9zCjPFK0bmZ
         jp3Mmlw7C2tyutu4D4KlJSa5aqUf4Vvv+p/OIwtsDFVEKU1xoFWl8zm3V4ysAO+ksnwR
         QF8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789401830; x=1790006630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lykhn1ziLcNrm34dqlEZxk1CMrWoLDAjyXD14b56Sf8=;
        b=G8BCyd5F3tfqasY7zLpFUXdHyXp2Ou0tGvhdOOxMSCztu4/VrqfDAg/64B/O07OV0K
         IP31OD4j9SFUhaV+3lXVaJX8ZugwUMK6EgPAfEKBQnDeIKNPuYcpJsoN91cWvBPtb/ve
         iDkHqzWqSht78XWwwwNPRaJ+2YLBpnjRcHY8HQ2DD4TVBKgdm1BlZG4eM8zswOQ93Ykw
         ddggY9nhHzTQEaPLAEG5NeZW+tQ4OCuBNFjaoIFcIxdM+KPvu7AZ5gKhPmNH70HaziEY
         9xmrRbHF38WIP47ETV1DOOC26MjbQp3t/Lv8yqB6lc0Hu+aNBrPirrI73xtN9loy31gG
         mnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401830; x=1790006630;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lykhn1ziLcNrm34dqlEZxk1CMrWoLDAjyXD14b56Sf8=;
        b=rDX4CcUGldz7oHOjV9oVlVH74tPOhgfIunt+ciqwMV++168XgczxKo+FzSAj5kMUv5
         aDAg+CjEQuFF3t4x+wyTcDEXzjqbliwhJEw9HHykSOGwDs0hUywTLCAFWL57dQpKiYSv
         pwIitG2yp1h8IsoS0tsrV1rOSI6j97Q6gxwsCqltatRpfDk3k7ajiHIEmRZ941bleDL5
         6vdOlKXkGWoqXx8OvbzNFaNfpVYQMAT5TWk46gxotxG4uA3EJXYq0pQiIi0+SEJWsJHh
         Q/ZJsJuCMb1uSIQhAbCjSvxzhEkjSqSSifqU7e8UHEQqH8T6SGN1O5wL5zsgGh4QYKv7
         xqzQ==
X-Forwarded-Encrypted: i=1; AKwUvBztSkDwR8O13hy4k7WdMp2I4TURiFoiWGXWr3FIfpy+gu04Ho4+rCqvcLwQOamFrqRz0D/LMBLq5qKXu7M=@vger.kernel.org
X-Gm-Message-State: AFuF++n3KhMORI3BsVfjDy9eAvhMCNXFterhtZFVSM9aHpLPuRMXH2Ke
	6Azz2lMbx5wybrbMcDSPXOkjLsRI/lN0scoCUXzWkVOcLQu8d/oaW1wrVjCEQFs2VhPRQTGaA0B
	sMqjmx7kfmpDlG5cg8KL7K9GfBJ77mUGpbWhRBhx7
X-Gm-Gg: AYBFou1d/AUiH3DsaU/ebx1649BBCZAfimn7eE43DQ2dY5vkD/WSmB36PWmucsD3FER
	RefQxnd+lM9GCxSuYgjJrlxeYu0DkN8YWAmJLE2WAmgMSPAgHdYSEejmh6MyHWyGwfBhaHa94qe
	THODbI+UYirRmCEouI81B+6Vtuv264LBIk2RtVMC4mnxmSzdqEmKHS0dkWxFsOB0mR6kqUQfQnh
	TNtqUZJg747U85cGN1ptrR5CMzWDPL3ptdcL0RnTn04863J28FEn0rtHK6nraQXXN9niHyRs5uS
	LeUXGL0g1441lSuMPUYhej+c42xzYw52moikqFnTsIVuKsF3zsYmnAYQc3FvFeP1HsYVd6ZZJf/
	J6tF8DGA1/T8uc0j3lLb/
X-Received: by 2002:a05:6214:e88:b0:912:1fca:531d with SMTP id
 6a1803df08f44-9122e4cf515mr54297366d6.2.1789401828963; Mon, 14 Sep 2026
 09:03:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:03:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:03:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260911145000.3881046-1-joshua.hahnjy@gmail.com>
References: <20260911145000.3881046-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:03:47 -0700
X-Gm-Features: AcwNN1WkNy6DDp-4PGpy28TjQCRTCMJrc6530qqWtllOnWQcoumOeBgfLZrmLZs
Message-ID: <CAEvNRgF7-zY5CRaUHfswRW-31v147SbTHRzMKGdV4e+Gd3Uy8Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mm: hugetlb: Avoid re-allocating global
 reservations on region add failure
To: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> On Wed, 09 Sep 2026 14:49:29 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> When reserving huge pages for a shared mapping, reservations are first
>> requested from the subpool, and any remainder is accounted in global
>> reservations. When adding the file region entries fails later in the
>> process, the reservation attempt must be rolled back.
>>
>> Previously, this error path explicitly dropped the global reservations
>> that were just acquired before jumping to the cleanup label. The cleanup
>> label then returned the pages to the subpool. If concurrent activity in
>> the subpool allowed the subpool to absorb more reservations upon return
>> than it supplied initially, the cleanup label calculated a positive
>> difference and attempted to allocate new global reservations from scratch.
>>
>> This premature release was completely unnecessary because all requested
>> pages were already backed globally: partly by the mount guarantee and
>> partly by the global reservations just acquired. Prematurely dissolving
>> those reservations forced the cleanup path to attempt fresh buddy
>> allocations that could fail under memory pressure.
>>
>> Instead, track the number of global reservations actually accounted so
>> far. In the cleanup label, subtract the already-accounted amount from the
>> difference between requested and returned reservations. This ensures
>> that when global reservations were already acquired, the adjustment is
>> purely non-positive, dropping excess reservations without ever attempting
>> fresh allocations.
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  mm/hugetlb.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 652cfb55c6e6e..1151ad959ffd5 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -6678,6 +6678,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	struct hugepage_subpool *spool = subpool_inode(inode);
>>  	struct resv_map *resv_map;
>>  	struct hugetlb_cgroup *h_cg = NULL;
>> +	long gbl_resv_accted = 0;
>
> Sorry, I think I have a hard time with this variable name ;p (I know,
> even though the function is called huetlb_acct_memory) I get a little
> bit confused because I can't tell if it's meant to be "accepted"
> or "accounted".
>

Haha, didn't make the link between accted and accepted! In the next
revision I'll use gbl_resv_accounted instead.

> I know it puts the line below at 81 columns :p but maybe we can just
> split it across 2 lines?
>

I think this counts as an exception (more readable) so 1 line is okay?
Either way line wrapping shouldn't be a reason for using accted. I just
didn't make the connection between accted and accepted.

Thanks for reviewing!

>>  	long regions_needed = 0;
>>  	long gbl_resv_get;
>>  	long gbl_resv_put;
>> @@ -6768,6 +6769,7 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	err = hugetlb_acct_memory(h, gbl_resv_get);
>>  	if (err < 0)
>>  		goto out_put_pages;
>> +	gbl_resv_accted = gbl_resv_get;
>>
>>  	/*
>>  	 * Account for the reservations made. Shared mappings record regions
>> @@ -6784,7 +6786,6 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  		add = region_add(resv_map, from, to, regions_needed, h, h_cg);
>>
>>  		if (unlikely(add < 0)) {
>> -			hugetlb_acct_memory(h, -gbl_resv_get);
>>  			err = add;
>>  			goto out_put_pages;
>>  		} else if (unlikely(chg > add)) {
>> @@ -6831,9 +6832,10 @@ long hugetlb_reserve_pages(struct inode *inode,
>>  	 * There may be a difference between the number of
>>  	 * reservations to consume and the number to restore now if
>>  	 * there are multiple threads interacting with the subpool -
>> -	 * restore the difference.
>> +	 * restore the difference, taking into account any global
>> +	 * reservations already acquired.
>>  	 */
>> -	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>> +	hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put - gbl_resv_accted);
>>
>>  out_uncharge_cgroup:
>>  	hugetlb_cgroup_uncharge_cgroup_rsvd(hstate_index(h),
>>
>> --
>> 2.55.0.1007.g17ff1f9808-goog
