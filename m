Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794436003;
	b=bQqyRVX8sGEPJw9VxBkP69Ny8I8R9PvLdI8/tfpXOx7pEHD9npAh/VCmBBdMm6Do5qIu
	 nvMyiYpjsaHcjO2Z3HtRjHYc3AhvLH7KCYFwrFGjJtMHf8cHTUigg+VNaw+f9+IWbeRn/
	 Amdpk3jN5MFfzaO3T1jUbsQijPzOASXEX+As4bL9jZp9SDrg34Wx6sBkpf+WEOjel85t0
	 F9fvBDpFa9z7lrggNsHm7wiUx4PQAOcOq9nvRgIyHjiRDecPt5RYJXc/f7CX4LSxn8+1Y
	 HgJRbIoY5NWVcu4WstmfhIGsUqrpEi7N3XvD74XcDvXsLWyKkKm5W2VKYewpqpxvPtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0qXxJbBqWWiSbLfZQoa2Zp5mRREk6/0luQcqtAQF1PU=;
	b=LsiUpiFBYj13PVPz7L52K8NfMEC8atwxIFnPn0dudUh1YO7zoHP3X1MaFuSRNOek0Gu5
	 EWL7ccK3jbq+bqBGOsfFYRX5zncz+BQalLRq/dnP7xmCAvXn0NP4CoBsn48snNa/ir8zB
	 pLw57ADUCEGGeTLOOO+/JtZU+KFm1koq+I7fikIdwpj12lT4G3YALPCdxl1dLXmHSvR59
	 YC6lJd2nWacQ0UXkUqUpSMpLC+ep35cex/puLSzia72CFRxpYzTywgzb1KsZAlBc+KOJ9
	 PteljaXz/6dJUTKntT+XSOxz3Q3vqHbo73Dt6+pQCV/cgbtwfLl7+XO5EnXorvw+Nmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec0YF4YO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACACF606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACACF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ec0YF4YO
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535f598d126so23521cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794436001; cv=none;
        d=google.com; s=arc-20260327;
        b=TIOW5QJT8PGaSisLxNnvsTwEJyUtUZHq984HM3a6z2xkGu++LYX1Kvt19OYGg8ktxW
         2HgJKCT0xGNY64PQsI8M+iE/mLbBTkCcUVrjyLklVaCp4Yt3+DpcoCthiwtwIV8Pa7gH
         529pUVJo8rx1ZQAGJY9l68K4OYcdLj49vh5owuQbpqJeak8xzMSTYXF9nHY4005OTcVm
         kttU6fNZdGkXTnxAd/A2dzQwIMoMdgh+Gcj5sj4TawJmtfwBJ9F5lDgtbq4NpxctmWXX
         QklmD+pnHFWXP1P3c799QCFebkKLECpa2c8rLCr4GnC/LRSgFNuwQi9nLRyQ37TGE/fL
         MEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0qXxJbBqWWiSbLfZQoa2Zp5mRREk6/0luQcqtAQF1PU=;
        fh=29ISDCVnjPS6oCLUwnvS5IThfMS6emiEdsWK8ghAivQ=;
        b=E2OIV7KiO3E8QqtOAcGG77U56oE/9rzOnfxyBMTx5VuhbciKBE8WvIG+JijxryZ1cE
         dkjGjAIrK+Kf9mvni4zmZBq7lnSVwEBWkO8QwFJdOlO/zyi8d8Zlj2QsFbs3OGAUJkEa
         /HMy25Qpna6ie5fYUrmTZCXEWg0Fc4xUVyPVPBAR0TFzO/MXBxo+H1qiVWoosQzQZCu1
         mi33DppePsscZfrxUoXVIljKxWU/gYfokoLTDVM7Rva90Nk30CMIcr+zw3dr/5tFkj8i
         4T7vcW+TR3q1JRoMoGtf4jUQHjUHJ/FpqShEq9qx0/XVfN5HMVINeCEQ2P/YiDN98CWE
         MvqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794436001; x=1795040801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qXxJbBqWWiSbLfZQoa2Zp5mRREk6/0luQcqtAQF1PU=;
        b=ec0YF4YORkFYrD07kZqj/7trVjA5ziDmer8jWF42Ed1N65WeBROUJvACPd1BIr0For
         O1a3Huqx1ZHrPByueVOrFcOBt2daJnQyxdOKZNCpnLyDM6HU9aQZMnip8G1TMv5g0AMV
         OtecPnu+7/EGhhBDwCtQlvVJhHCwq95XSOMKy61FuREg6P7slTFUdyt2WRN/2HxK6Q28
         S9yX+74i+ytPS1FJH8tBNdXkn3YvX6mUiJBAZ4BNgUp7XRkEz3d9V/NKd87Dxje0mga/
         v1TpSjnWTMX7P5LaDphk2OhQ5E1nWfV0QCiOUVD30C75Wb7lpppc73WzzlHyAb8R3gT7
         ByLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436001; x=1795040801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qXxJbBqWWiSbLfZQoa2Zp5mRREk6/0luQcqtAQF1PU=;
        b=QAaXCmQeNR3uRhmOMThfGSqMarUqiqzOEQoj9rqdkhD+wtqaNduDRtlv3hhHDrAZVj
         SUH7617JSFBYTdRCRvKJNEoOxP2jdwE93TmkzB3ssuNL8ZOuYduhPqhqIDnt4ZW7Xpi3
         iGlTMXY+Xbtc0MS1ac16qFLpRfgqphtmhRxCYJ2lAARc+ez4nmLfcaZgD/1/XpUWL5wj
         qIHBEsuos033uO8guLx+gDiujmaXVkt29RfecF1pVCa7aE1E3NFHVkvDPLe42ZJlWulU
         SKpkWfR0iwXOni0ukgjSTEcvUb6MwGbXpj0ZBwgwFNOGjmcI8e6GIlwEN+UvaLlj+I/G
         a19Q==
X-Forwarded-Encrypted: i=1; AL+hErHJ+G+9VQWLdM1MMwY8LZE0r1VuIxXwtGw/1vK8WXZ6djcC1DtmLH6lo/3+T/DxWygDdcrrooBiLJxhvVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pEBIl1P6FgOzvp+fpjZip+n5w4BoNANqCoz23oMbj3JGSIdkF
	vVI4biNMf3ULN1bdLMDH5M67QIC2HlwQSwkMgRlaM3eONKaICXnd5+U8/O59h7po6WNvflULjnB
	8hQnpAZ7kXiL9k1akZC2K+J7liwWYeyTb3mF03Xrx
X-Gm-Gg: AYBFou0JJkt9hNlSEM0vzxPfKs0bkrDe/QF2ZkL8FCfMIEFYeXeRdRQGw79jSyO7wl+
	dedLLnRmLgBBeSKeyDQWXnfla0WEK3Brl5Ulh6BD6iud/cajOJV5Tp0LMOt/YeyMjm28vTVTkNy
	zFFvxv8eJJ5wLEaYYoyQaqEcKXzGcbtRiZoGSrWN1FFDEfuM0m1PPHgtjmX1Jvj6vWUA6jDQ8zJ
	PIYH9JrbwOHWgjCqMBEay9Qxq4j0dFRI4lfd5Cfwdhp5Yya6ljstib64tgszvTkTnbm1TiEZ+Uq
	rmyAV8p3uajdqzrfYXe0TKwGpzOxvFV1Ih5eGh7bvdGOJkG9XlWbsGIwDLjo8Nn6THSSfMPiqqo
	5boEYmfrKHFxVL3ftD9Clhypqzm8eoawJITsK
X-Received: by 2002:ac8:5c84:0:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-5598d505571mr2598201cf.9.1794436000897; Wed, 11 Nov 2026
 14:26:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794046188.git.zhengqi.arch@bytedance.com>
 <586d6c53ab7e4c64d6e89ad3cf0cf7e07dabbfaf.1794046188.git.zhengqi.arch@bytedance.com>
 <7abb3aa1-385a-422f-86bd-7aac9661c4d8@kernel.org> <423c9b28-ecf2-4fab-817d-2fb326690c73@linux.dev>
 <3a1a3bb5-0b01-4f20-aa0e-74a952544b8c@kernel.org> <5f68ffba-9f56-4e31-9e7c-9d110f552efc@bytedance.com>
In-Reply-To: <5f68ffba-9f56-4e31-9e7c-9d110f552efc@bytedance.com>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 11 Nov 2026 14:26:30 -0800
X-Gm-Features: AclHuK8ui2RDy0cmaEz9Z61Dze9vT6ffy1pZqe99lY-d2GDxcD7lU32xjKq4-x4
Message-ID: <CAPTztWb0XbjCxtihyp=Tx16Z_kjF+M8sa7YcUjvFv0WcS83MAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mm: gup: allow long-term pins of CMA-allocated
 HugeTLB folios
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, muchun.song@linux.dev, osalvador@suse.de, 
	akpm@linux-foundation.org, azpijr@gmail.com, lance.yang@linux.dev, 
	Qi Zheng <qi.zheng@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:27=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.co=
m> wrote:
>
> Hi David,
>
> On 11/11/26 3:43 PM, David Hildenbrand (Arm) wrote:
> > On 11/9/26 04:10, Qi Zheng wrote:
> >>
> >>
> >> On 11/8/26 1:58 AM, David Hildenbrand (Arm) wrote:
> >>> On 11/7/26 11:30, Qi Zheng wrote:
> >>>> From: Qi Zheng <zhengqi.arch@bytedance.com>
> >>>>
> >>>> Long-term pinning treats explicitly CMA-allocated HugeTLB folios as
> >>>> unpinnable, causing unnecessary migration or pinning failures.
> >>>>
> >>>> These folios already own their CMA bitmap ranges, and memory blocks
> >>>> overlapping CMA areas cannot be offlined. Allow HugeTLB folios with
> >>>> HPG_cma to be pinned directly, including in ZONE_MOVABLE.
> >>>>
> >>>> Fixes: cf11e85fc08c ("mm: hugetlb: optionally allocate gigantic huge=
pages using cma")
> >>>> Cc: stable@vger.kernel.org
> >>>> Suggested-by: Muchun Song <muchun.song@linux.dev>
> >>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> >>>> Acked-by: Muchun Song <muchun.song@linux.dev>
> >>>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> >>>> Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> >>>> ---
> >>>>    include/linux/mm.h | 29 +----------------------------
> >>>>    mm/gup.c           | 31 +++++++++++++++++++++++++++++++
> >>>>    2 files changed, 32 insertions(+), 28 deletions(-)
> >>>>
> >>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >>>> index 2d0b8a4c9974f..75dd40265d3f4 100644
> >>>> --- a/include/linux/mm.h
> >>>> +++ b/include/linux/mm.h
> >>>> @@ -2975,35 +2975,8 @@ static inline bool is_zero_folio(const struct=
 folio *folio)
> >>>>            return is_zero_page(&folio->page);
> >>>>    }
> >>>>
> >>>> -/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin folios */
> >>>>    #ifdef CONFIG_MIGRATION
> >>>> -static inline bool folio_is_longterm_pinnable(struct folio *folio)
> >>>> -{
> >>>> -#ifdef CONFIG_CMA
> >>>> -  int mt =3D folio_migratetype(folio);
> >>>> -
> >>>> -  if (mt =3D=3D MIGRATE_CMA || mt =3D=3D MIGRATE_ISOLATE)
> >>>> -          return false;
> >>>> -#endif
> >>>> -  /* The zero page can be "pinned" but gets special handling. */
> >>>> -  if (is_zero_folio(folio))
> >>>> -          return true;
> >>>> -
> >>>> -  /* Coherent device memory must always allow eviction. */
> >>>> -  if (folio_is_device_coherent(folio))
> >>>> -          return false;
> >>>> -
> >>>> -  /*
> >>>> -   * Filesystems can only tolerate transient delays to truncate and
> >>>> -   * hole-punch operations
> >>>> -   */
> >>>> -  if (folio_is_fsdax(folio))
> >>>> -          return false;
> >>>> -
> >>>> -  /* Otherwise, non-movable zone folios can be pinned. */
> >>>> -  return !folio_is_zone_movable(folio);
> >>>> -
> >>>> -}
> >>>
> >>> Moving code while adding new stuff to it, please don't.
> >>>
> >>> Move code first, then modify it.
> >>>
> >>> I don't want to play "find the difference between two pictures" on a =
Saturday
> >>> evening.
> >>
> >
> > You resent your series way too fast.
>
> Got it.
>
> >
> > Now we have discussions in to threads, congratulations ;)
> >
> >> ;), got it.
> >>
> >> I moved the code to resolve a build dependency.
> >>
> >
> > Why can't that be resolved differently? What is the dependency?
>
> The dependency is that the new check wants to use
> `folio_test_hugetlb_cma()`, which is a HugeTLB-specific inline helper
> from `include/linux/hugetlb.h`.
>
> `folio_is_longterm_pinnable()` currently lives in `include/linux/mm.h`,
> while `include/linux/hugetlb.h` already includes `linux/mm.h`. So I
> can't simply use `folio_test_hugetlb_cma()` from `mm.h`
>
> >
> >>>
> >>>> +bool folio_is_longterm_pinnable(struct folio *folio);
> >>>>    #else
> >>>>    static inline bool folio_is_longterm_pinnable(struct folio *folio=
)
> >>>>    {
> >>>> diff --git a/mm/gup.c b/mm/gup.c
> >>>> index 2b405cce2ca5c..f41701c603500 100644
> >>>> --- a/mm/gup.c
> >>>> +++ b/mm/gup.c
> >>>> @@ -2216,6 +2216,37 @@ struct page *get_dump_page(unsigned long addr=
, int *locked)
> >>>>
> >>>>    #ifdef CONFIG_MIGRATION
> >>>>
> >>>> +bool folio_is_longterm_pinnable(struct folio *folio)
> >>>> +{
> >>>> +#ifdef CONFIG_CMA
> >>>> +  int mt =3D folio_migratetype(folio);
> >>>> +
> >>>> +  /* These HugeTLB folios own the CMA memory, so they can be long-t=
erm pinned. */
> >>>> +  if (folio_test_hugetlb(folio) && folio_test_hugetlb_cma(folio))
> >>>> +          return true;
> >>> More hugetlb hackery ... don't like that, sorry.
> >>
> >> Agree.
> >>
> >>>
> >>> I think this just goes down to a problem we discussed a while ago tha=
t is
> >>> independent of hugetlb: we'd need some way to identify that the the p=
age was
> >>> actually allocated by the CMA owner, and it's not just some other mov=
able
> >>> allcoation that ended up there.
> >>>
> >>> For something generic non-hugetlb thing, can't we call into CMA to as=
k whether
> >>> the current chunk is marked allocated?
> >>
> >> The existing bitmap is set before allocation completes, so the range
> >> may still contain borrowed movable pages. A set bit alone cannot
> >> establish ownership.
>
> The more accurate code path is as follows.
>
> Assuming the 2M buddy allocation is successful, page P is borrowed from
> the 1G CMA area.
>
> Now, proceed to request a new 1G huge page:
>
> only_alloc_fresh_hugetlb_folio
> --> alloc_gigantic_frozen_folio
>      --> hugetlb_cma_alloc_frozen_folio
>          --> cma_range_alloc
>                  /* set bitmap!! */
>              --> bitmap_set(cmr->bitmap, bitmap_no, bitmap_count);
>
>                  <time A>
>
>                  /* may fail */
>                  alloc_contig_frozen_range
>
>          /* set HPG_cma!! */
>          folio_set_hugetlb_cma(folio);
>
> At time A, for page P, a bitmap was set, but HPG_cma was not set.
>
> If a concurrent FOLL_LONGTERM pin uses the bitmap alone to determine
> ownership, it could incorrectly allow P to remain pinned. If
> alloc_contig_frozen_range() fails, cma_range_alloc() clears the bitmap
> bits, while the long-term pin on P remains.
>
> HPG_cma is set only after explicit CMA allocation succeeds. It records
> the folio's own CMA ownership, whereas a set bitmap bit can represent
> another allocation's in-flight reservation. Therefore, the bitmap
> alone cannot replace HPG_cma in this check.
>
> >>
> >> A generic query may need separate ownership tracking, such as an
> >> owned_bitmap recording successfully allocated pages. Its updates and
> >> lookups would also need to handle concurrency with fast GUP.
> >
> > Or simply two bitmaps? "trying allocation - allocated"
>
> As a fix, perhaps this is a bit too complex? :(
>
> Alternatively, we could adjust the timing for setting the bitmap, though
> this might introduce new concurrency issues.
>
> Thanks,
> Qi

Yeah, ideally there would be a way to identify folios allocated
through cma_alloc. But that would probably require.. dare I say.. a
page flag. Trying to check bitmaps does seem too complex.

And, since we've had a local change that does exactly the same thing
for a few years (which I apparently forgot to send along with other
hugetlb_cma changes), I can confirm that this looks good to me and
works. So,

Reviewed-by: Frank van der Linden <fvdl@google.com>
