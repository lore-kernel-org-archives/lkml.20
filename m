Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360847C11A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399621; cv=pass; b=pm93eP9tQ17ZQdOfex2CuP5s9L0WFexkAoozREdHi106qHYIbxN34SPN/Zk7IZQ57Ea8qlCLPCOkKNL1mmGPwUFzOSA65w7WE7QqDt6OCXuO1sRWgDA6FMxIMgBhfOZH4/2Pv7eZmHhXjQHDdqwwRcCNTZOzL6cch6JaotUOIGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399621; c=relaxed/simple;
	bh=C5lqWZYRcdT+xV+Ag/2xtxUo/YeIYupOIT7BEys5X94=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVAJQsf+PgXjCKTXqMTBW8ikyLtv5vsbMKrdZi9ZBYdl3TGSxLQ9ua92M/n/VCr02AnjTxiu148SmyhOHlLHmZ582+OsrBNq2pz5vAraKundk6durJns+u3d996qHB6Lso0Lj5+O2jcfNNokfgCoOgICquqm/+Za7zpwsyOkNk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HwMseecO; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwMseecO"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90e7c71f86eso27127216d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789399619; cv=none;
        d=google.com; s=arc-20260327;
        b=proUvx4BMYHZMr9dLJmfbsWT8DZ3je1cp4YWKXFWl4UlN0CMVa8hsqwdYvnQq12ec7
         uqK5riNnUYGG2MsR6dKUH/gFVXO7l4hPm0ooyDl/2U7YavpEWR6TAXE6TYfpL3vnUKTY
         3ES3g1LCD8a7/NjlS0nodxB9lk4xhvlaZywPIVrw+yfGdIrOslHLPJX2KLRKtUcpgrs+
         OH4CpLkJFRClNaV0pvtBv90Y+ndlERK6W/k35XQZOmCAfaPmS+pc9OibXUdA+9sHOGsI
         HnOPjrQ2rgKy6BfhZRsq5jLV4RmwiIArTRfe05R7W7K5UyTZmreWMh5+V69Fq9tq+HRk
         v4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Mcn1aLlH7H+x4GqfxFrf2tZYu3mAVZpDuMSayy1t56g=;
        fh=sGqqw4tffT8WdmjHzg7oorIeZkMLgab/d+mo2WfZ6ho=;
        b=ph8ccLR/l5t1xkDIWlBHkTSmgkExo3/sKfQI8zeo3aQi3BJy8nCBM2t6/S2Gv0aCh7
         WzCDVpRkK+J4I7LQwSc2VwM51w56MoispajUsAYF8zghKnRtxN9cnGApdEkwDUah1IAC
         mhZugepUbb+KV2tpbvOHAD6EXHKHPDW3HJ+nxtQ/BNGhhAB52evp+rn2ywx2XTS30sGt
         8Yh1SYZAtD8PCMtNsLMMrsmWeshR+Fo1SsO1Lmddo20UhLnNzN6dDJm0NAIGz0gy0ftp
         H2qv++J4KXDWjF+u5OM+pYh/VlAyMvATM71qJXZJx9shJYjB6LB7RtkUWlRbQz3ETkXN
         AhiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789399619; x=1790004419; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcn1aLlH7H+x4GqfxFrf2tZYu3mAVZpDuMSayy1t56g=;
        b=HwMseecOp+U4cNXqHkW/HkE0R4aOFptqCaUC5FH3BzqHQseW8iCOBtvDOp5rRjou89
         jXzzL3+/kZdj2v9cHuoX1Z2JtWYWUld1f8HM+O9Xbq7/aBNt6RFuQKJ0m52h7D2MMD7n
         zVa2jQC+mJzn0fnuZrZdFEIWx9qY1IhxN3vZsxRzCka9MMh2FiL9t85/bH8i607cVTgq
         3Ibfbdwx/OblqgZAwTiRQX7vx15xnrNJEf/qBErCTyxuzibJEJoZTq5nEGbdtdGNagvq
         jGFRoMc1t5Uzt3nbUQajLwS9Fmm63B24nvahyunPRgzO3cBT5nVYim8bYuiX+yXmoRKJ
         P+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399619; x=1790004419;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcn1aLlH7H+x4GqfxFrf2tZYu3mAVZpDuMSayy1t56g=;
        b=JX+4ujg2m7PxSGueZGXLoZ+LOEFj7bGkkJeCX1B9kI/C10XSozpnRYLGemODs9Ox2m
         0kz+vJXTBC3sdAkMQlpYio2IqKfDCViMKQIetjwGU8pSpJeMJ0ceWpoV1YfGPPvezIs8
         VYMWava8Boy+dJQqs/lJLMxOgEo6rSNBf1BwmMC2q/gE9tstCvZpELy54+svCKb2O1Rm
         krDAeg8/3+kQ3LM1B+YuL/qDs4aZKdMH6TcVNgoT7Ta/kQwlugi1Noid8G9/1guD4oRB
         5BI5OWVxsMApKPp+ctrrYH8AarQQZpijsGKrwWXAb7+Yc39JOT8ChfkXp1Sdp1c0QnHe
         Biqg==
X-Forwarded-Encrypted: i=1; AKwUvBz1zC5Iy+Harjk/RuzZ/XAt0a3g0mn8/X9T5yka5s11E9u7JpQ1YWQkXLQv+M7i7j4w81eWLcDP+CbrfHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lyJrEwXNLh8C5bz61lR1Y6U/s/EabTszi2zYVtf547RAsAIdRh
	0IW9L6sGk9PZLImVxwEyXdMidA3g4asFlJDAu9atXS/AVdVqaYNL01b7OIwMb1PkqLTkuOtlHkG
	6k6ds9zDTCR+He24H70K8pDxhY1JF3RAfugpmShS5
X-Gm-Gg: AYBFou0VvZUNo1PHJCaZyQeyhcr5ZoaOgTZE3MPfPevwl/VmqW5zH4aH1QkQvReahpw
	T4yLKZBquPRDqXKF+GvgMQmlolpix5MFe/RfEHl9owGbl8Hob/6jBd8qVpcbs+o4wN6OHVK+RgG
	/YbsPS2Nn6O36y6xLzzecwlAA7kqkQ0wceauLC2oXxxG2Ea+pm51iLqut9hKw1mqRXq9p/GXZfR
	EkhDtWyFX9hXUVK/V0mCIiFmerT1qLYtjkp7hLPjl1Ngzgz9WhENK6ltOB7g2DJ7a1pGxcHjDvc
	D1lw9cJ/D9FXKHRnVL4jnvf5wpgd0xWJTP9VvWEf/3bJNHyYzENeatHTW8lqdzhQlITpFZmVR7V
	oIzJY0ABW0A==
X-Received: by 2002:a05:6214:451a:b0:90e:9665:71b9 with SMTP id
 6a1803df08f44-9122e65b41emr46757376d6.27.1789399617103; Mon, 14 Sep 2026
 08:26:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:26:56 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:26:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260910195800.3459455-1-joshua.hahnjy@gmail.com>
References: <20260910195800.3459455-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:26:56 -0700
X-Gm-Features: AcwNN1WXsa-zr5yhxjh8RtbW6G0xYf0DGleOaP88Iype7y1bZYBjUUrEH2Yb5dI
Message-ID: <CAEvNRgHbzY30n1hz2vv7BiBMMhci+NEv_ubP1LjQNmBuu6Kjgw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm: hugetlb: Fix subpool usage leak on allocation failure
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org, 
	Zhao Li <enderaoelyther@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> */
> On Wed, 9 Sep 2026 15:54:59 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>
>> On Wed, 09 Sep 2026 14:49:28 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> > From: Ackerley Tng <ackerleytng@google.com>
>> >
>> > When folio allocation fails early (e.g. buddy allocation failure or
>> > cgroup charging failure) and a reservation was not used (meaning an
>> > unreserved global page was needed), the subpool page acquired during the
>> > allocation attempt must still be returned.
>> >
>> > Currently, the subpool cleanup error path only returns the page to the
>> > subpool if a reservation was used. If no reservation was used, it skips
>> > releasing the page back to the subpool, permanently leaking the subpool's
>> > used pages counter.
>> >
>> > With subpools now always tracking used pages, always release the page
>> > back to the subpool whenever a subpool page was acquired.
>> >
>> > Opportunistically rename the local variables tracking global reservations
>> > needed and global reservations returned. This clarifies the accounting:
>> > a value of zero for needed global reservations indicates an existing
>> > reservation satisfies the allocation, while a non-zero value indicates
>> > new global pages are required.
>> >
>> > Adjust global reservations using the difference between reservations
>> > needed and reservations returned to properly handle races where concurrent
>> > threads interact with the same subpool.
>>
>> This one conflicts with "mm/hugetlb: fix max-only subpool accounting on
>> alloc_hugetlb_folio failure".
>> https://lore.kernel.org/20260428113037.88766-2-enderaoelyther@gmail.com.
>>
>>
>> > @@ -3074,13 +3074,10 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
>> >  	return folio;
>> >
>> >  out_subpool_put:
>> > -	/*
>> > -	 * put page to subpool iff the quota of subpool's rsv_hpages is used
>> > -	 * during hugepage_subpool_get_pages.
>> > -	 */
>> > -	if (map_chg && !gbl_chg) {
>> > -		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
>> > -		hugetlb_acct_memory(h, -gbl_reserve);
>> > +	if (map_chg) {
>> > +		long gbl_resv_put = hugepage_subpool_put_pages(spool, 1);
>> > +
>> > +		hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
>> >  	}
>> >
>> >  out_end_reservation:
>>
>> Here.
>>
>> I presently have Zhao Li's patch staged in mm.git's
>> mm-hotfixes-unstable branch, awaiting review.
>>
>> What to do?

My vote is to drop [2] from Zhao and switch over to this series.

>
> Hi Andrew, I hope you are having a good day!
>
> Yeah, I also noticed this too [1]. There are actually 4 proposed
> solutions for this in the mailing list which is a good indication that
> something is wrong here : -) But unfortunately it seems like there was
> no resolution the last time I pointed this out : -(
>
> I CC-ed all the authors previously on that chain but wasn't able to
> get a response, maybe we'll give it another shot here?
>
> Ackerley, Zhao, David, Song, hopefully we can align here.
>

[2] from Zhao could be one of the components to get -stable out of
trouble as Andrew requested at [3], but I think small changes on -stable
leave lots of gaps.

[2] does not address these issues with alloc_hugetlb_folio():

Firstly, there's a condition in the fix checking that min_hpages is not
requested and max_hpages is requested. That looks like if min_hpages
were requested, used_hpages wouldn't be restored even if it was being
tracked.

I could be wrong about the above, and we could also iterate on [2] to
cover the edge cases, but I think [2] would then just become bigger and
harder to understand.

Beyond that, [2] relies on local variables in alloc_hugetlb_folio() to
determine whether to update subpool tracking (a global state), so if
there's any kind of race between threads doing subpool get/put, any
local variable state would be updating the global subpool state wrongly.

> Personally I'm partial to Ackerley's approach here since I think the
> get/put semantics that he proposes is the easiest to understand for me.
>

I think it's hard to use smaller changes to fix the global state
changes, I'd prefer not digging to find all the edge cases in favor of a
cleaner fix.

I'm not super familiar with upstream backports to stable, but I'd rather
backport an understandable fix than more open-coding.

(Understandable is subjective, of course, I'm biased towards the fix
here.)

> It would be great if we could sort this out since I think it's been
> a while since we've had all of these proposals in flight.
>
> Thank you everyone!
> Joshua
>
> [1] https://lore.kernel.org/all/20260713144557.3845941-1-joshua.hahnjy@gmail.com/
[2] https://lore.kernel.org/20260428113037.88766-2-enderaoelyther@gmail.com
[3] https://lore.kernel.org/all/20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org/
