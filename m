Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F146629C328
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757739; cv=fail; b=WD67IVHCIFyyNsUaAMEniSuB1Xw06ysQBQyILgB7FlTw/fydfgx6f2IiF4C1iN3GP1v3wITmYIpMw4nHo6h0cDQPofZDwvgRrLZJptoezBbXvZn6P5UHQ9+vyMJCbAH7ukjWzjNmedmKZcoirz5LNXXVa1832GEjv3PADU8A4Xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757739; c=relaxed/simple;
	bh=dpM7DP76Gt6AHtstvNc6DkpxufbUqxaz6HnmWIkXgTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3w1otxFyl22SSISK/9RPZfVMi/f7Uiu/tE0j5X82H7LpzxHuXurzckVCYXMV2zNoILdqMeJYOLOif6gz3t6EChfStrf7wBBoJ4ESJtUV3+1VSHRsiLbaD0jU7sxSwjMYRrDw+t14zTwuT+sWpf9K8QK1eTpu4merCZLNBswYnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=GGt8II/F; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="GGt8II/F"
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67QEsYcv1660576
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:22:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=9+LTR6BXv6tEKpHsIOyT7jkiT7z0eYW8jTeQ9
	4/tcik=; b=GGt8II/F5RNbHBYjWqojIIItYvtQEMLEYrsug/kfFhGNKrKzj82Uq
	KDNSXFMi57MLGeqsRz9Ca7l4+Bu7iPaghOzlfjesZMhfR2PkaoDDJlSiiJ6ClX65
	FkPv/KCJrS8kW2M43oGMUf2LV+KzHtZm6xTXtFuSK4D4I7LnqXUOkyclyhVOQR4B
	h8ELEvghrTTSwIWcRT2Pdv4eaAS2NQUUTKLlNsvdUlPTykd+U8GfjfcieYDRM47W
	PB1G4kVzSV7ArBAF7KE63YDlanTzyxKTpwC9/NUSlNLy1CmLmOZoHdLGQ6CnLAbe
	rRVo2YyFKKeXNdC6UPfZCpDohjuG9y3aQ==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by m0001303.ppops.net (PPS) with ESMTPS id 4g9ce9rk7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:22:16 -0700 (PDT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15c32294e1so80912066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787757735; cv=none;
        d=google.com; s=arc-20260327;
        b=b+2gUATa4VdU5V9JMxMKYLDCppO3Q9vNgiC4c2vUV05HK51/aV+M8xiGVt4Xhw8jVa
         QDdut5AI1GO3lG/ZE0nqh9hu0UhQqx98O/3HEmoX4GkehzW7zjp0S87Rx8Wz+Bsh/hR8
         zKjYXv9Qr7l1RJv5aRi9gi/USHCNPNf4ar0EpqQLRaKozghG1PUqXdHqIJSNPwW6rl8f
         jR3kV2V0OZbLTzNBnuLyS41kWseFNCL+Tueg2wFmu1VMgY5+J7X2hCg47Rbqr4OL8MuA
         h4w0bCP/UzRBer3iepLhRS7b4Uk64Qr7sfF/a4i0Bgbm0DqfRv+2yZpghQFS1RK0a1+w
         Zmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=lzzYRpHE4OUY/HCDzx2PwKyUvmKQFWNuBcWQsYBO99Y=;
        fh=watVR4I7O1nQau36QBCTolcuS39RSbnj/Qla1n49WLM=;
        b=gaBvflxgFflPmDMzr748+5XlN2RPdnHxLSH2otosPay/NswdBK1I+ICIk8IzJhJ2Bz
         3zs5zRzEFS9Fdr6J4hB44/tS9HsJbWZd0X15J265//9y7okYVkrQOVcxU8/lQjXL9dbU
         6VrSKIEaEHCChdoJYoxTK8jwcXqgvB3YV481WTYYhj12HWe82hwAcxBpobmGURzJ6cLN
         cOeySBTMrL0/huSzJXN9AR3r+vPppQuzTNMfQyiaDbbYxHliyvIAbw2Sc4AQJcdpzdc9
         TdHGwfwAWht3xcbVJQTkHcuGLq6YuT2BFkgjjx/gv/F49JWiz9fZr5B9gaZITFrUTsTw
         1Z9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757735; x=1788362535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzzYRpHE4OUY/HCDzx2PwKyUvmKQFWNuBcWQsYBO99Y=;
        b=ecobJ1cba51gwNO6wrDfkeuR+Yrz5G+EO+mS2nlQN8t9tilOWMSZcjy5UezYahtGKY
         5BmFfucpK4aD/pfSXPUoWV0mqhmfgg1I1qovOQ5C2hN/GZhkaei1YTOPJElpOeFra5pQ
         1PSu/EtfPYJOFaak9RE6Qdql+HIbt0XNIOM+utt/ogpgHkzleBNuXewnVxJD5uReQ120
         xj2xH47egPIAPoz29M93YCgQi3mhxYb0gNFiEf7jI1iS11W5sgQeP0BmodBr1cI2D6ep
         D4fBJ+XoCqsHR8hYdcU3hTmyvCwyEuROeEJ4AUhgImka6HWbhbtr9obGncf9HXAxIpPu
         yPqw==
X-Forwarded-Encrypted: i=1; AHgh+RqwhlOy25X0CiQdKsy26P9xp3utd8wITWykzsluQbeFWX2wki3RVbgNTE2jQ2cIcb+m5OoDozfR/YhbQJE=@vger.kernel.org
X-Gm-Message-State: AFuF++kuaimLIc9tGbRZuVaXr6uM8dZKIMEvr9zKJb16qKf8AzJSDrnw
	6P1H5LeGX0V80vyq7rU42bfKCwchgnqp2PkuBS0z8XxyMiZWPUobP1QBY9vYlZ4Ra0SwXitaEwJ
	5nE2keNXPIlWblreAcRUKjJshQpu77EVHLhYjjjT4ik8vHNy63hc6xolBdb6EAfW1dSAf3qaqxw
	34ay4F4iFd9uniwsouimC8r3W7fwPfgXdHotw7MSQ=
X-Gm-Gg: AR+sD12tc/l4WTv1iz7fyaueD0Rad/Q47AETrP+EcqestA5tLQ0EwN3CtewgR+ldbXH
	GaZVkWI4NjtdLTtX9aioVofTEU5u+44LllTiJTMbSb1xDuXgvJACSFeMrpwb5nKmEoh2E3re6d8
	gbIcmdr0hiPCMWuLFIjp+BZKinxokj8regWZ36kfGg9R3x1fzgpcfx4zj0grRftv54gm6Ax/4c
X-Received: by 2002:a17:907:9341:b0:c20:56e8:5457 with SMTP id a640c23a62f3a-c250baffcd8mr856847766b.6.1787757734898;
        Wed, 26 Aug 2026 08:22:14 -0700 (PDT)
X-Received: by 2002:a17:907:9341:b0:c20:56e8:5457 with SMTP id
 a640c23a62f3a-c250baffcd8mr856840666b.6.1787757734389; Wed, 26 Aug 2026
 08:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825172604.3243589-3-alex@ghiti.fr> <20260826133130.806177-1-usama.arif@linux.dev>
In-Reply-To: <20260826133130.806177-1-usama.arif@linux.dev>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Wed, 26 Aug 2026 17:22:02 +0200
X-Gm-Features: AcwNN1VOI_k5zWxrGWx3SOcmXeyQASiKVcWoJt9T6GS6mTNv-MvRHMSAit0jpnA
Message-ID: <CAEmasaWvKWR_2asHtFdLYao7OboBmyXpbWVahUFWZJMRwGfkMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mm/swap: refault on swap-in, not in the swap cache allocator
To: Usama Arif <usama.arif@linux.dev>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: PMq3Fbcplg5mFeo0F1zBiMHXWt67z1wj
X-Authority-Analysis: v=2.4 cv=BKuDalQG c=1 sm=1 tr=0 ts=6a8f04a8 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=pGLkceISAAAA:8 a=e7hYlneb_oNGxzrjXg4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PMq3Fbcplg5mFeo0F1zBiMHXWt67z1wj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyOCBTYWx0ZWRfX8+rB5btYYaKe
 /kUU/HYaN/BRTnxtdEeq3WPlCDAXKh8S/vewBxeFrlts3I+3l5tJIkgsamrmffvk4tGN8CrxH4u
 C/PjSGZyHw6oiY+81IBFQKE8TV4iZofGbWZxmyzoqafPyDig4HQJhr0gpMpw3+qllEKp5jPT6t2
 ZPRJ3Dj8ZZiBVuVs1NUMXvDg04uv7T7yo+1plb9Qv3VcxUL84ixp/2hk2dsIZuxlpJauQElanUl
 duSl2AysXAXwl0zxRXnIQWuoQ2LL5jPx3g3lNAnq+XCK1ceCtaNmda/GhN8NlI6rXANIIgD4N3P
 dXVS49RY+P7R81F1ghQfCVN4bEgKssIC4LWhYOvbqfpie8o6DZA1kPy242NPoV53YLBz9u+aR5f
 cYbK+hFDWC6r3WEgReVq7En6jFZ5N1BTO4u6UK85UPcR/KUETLbH+nBsNc10s1tfzyCk0KPyFIY
 Tx1EFjqRwN4t7h9ZXzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyOCBTYWx0ZWRfX69jBoOQnPZES
 MKvQyCYyINXJRF4cMs50QR9+LICXKdYl2EBbHH+VcWmoexUQ2/vuCwW5lN2eBu3Wu5n/Y5EIO1i
 D+RdXUBGK5zpZPnq2iTAkpR0EErjxm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01

Hi Usama,

On Wed, Aug 26, 2026 at 3:31=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> >
> On Tue, 25 Aug 2026 19:24:52 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> > The swap cache allocator evaluates the refault of every folio it
> > allocates.  zswap writeback also allocates through it: the shrinker puts
> > a buffer folio in the swap cache to write the compressed data out, and
> > that allocation is then counted as an anon refault (and, if the eviction
> > looks recent, as an activation) even though nothing faulted the page
> > back in.  On a workload that writes back continuously this inflates
> > workingset_refault_anon and workingset_activate_anon substantially.
> >
> > Move the refault evaluation out of the allocator and into the two
> > swap-in callers, which read the slot's shadow before the allocation
> > overwrites it.  zswap writeback keeps allocating the buffer, but no
> > longer reports a refault for it.
> >
> > The refault is evaluated before folio_add_lru(), as it was before this
> > patch, so workingset_refault() still sets PG_workingset/PG_active while
> > the folio is off the LRU: folio_add_lru() consumes both when it picks
> > the LRU list, and under MGLRU when it picks the generation.
> >
> > Fixes: aae466b0052e ("mm/swap: implement workingset detection for anony=
mous LRU")
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> > ---
> >  mm/swap_state.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/swap_state.c b/mm/swap_state.c
> > index bf8ff2d2dbf1..8046fea015c9 100644
> > --- a/mm/swap_state.c
> > +++ b/mm/swap_state.c
> > @@ -483,8 +483,6 @@ static struct folio *__swap_cache_alloc(struct swap=
_cluster_info *ci,
> >
> >       /* memsw uncharges swap when folio is added to swap cache */
> >       memcg1_swapin(folio);
> > -     if (shadow)
> > -             workingset_refault(folio, shadow);
> >
> >       node_stat_mod_folio(folio, NR_FILE_PAGES, nr_pages);
> >       lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr_pages);
> > @@ -646,17 +644,26 @@ static struct folio *swap_cache_read_folio(struct=
 swap_io_ctx *ctx,
> >               pgoff_t ilx, bool readahead)
> >  {
> >       struct folio *folio;
> > +     void *shadow =3D NULL;
> >
> >       do {
> >               folio =3D swap_cache_get_folio(entry);
> >               if (folio)
> >                       return folio;
> > +             /*
> > +              * Capture the slot's shadow before the allocation overwr=
ites it,
> > +              * so a fresh swap-in can be evaluated as a refault below.
> > +              */
> > +             shadow =3D swap_cache_get_shadow(entry);
> >               folio =3D __swap_cache_alloc_folio(entry, gfp, BIT(0), NU=
LL, mpol, ilx);
>
> Can this refault against a shadow from a different cache generation?
> Another swap-in can replace this value, reclaim its folio, and install
> a newer shadow while this caller is allocating.  This caller can then
> win the locked insertion but still use the older snapshot.

I agree, you're right, I missed that. Thanks.

>
> What I think should be done here is have an optional shadow output to
> __swap_cache_alloc_folio() and return the value captured by the successful
> __swap_cache_add_check() under ci->lock and se that output in the swap-in
> path?

That seems right, I'll give it a try and report back.

Thanks,

Alex


>
> >       } while (PTR_ERR(folio) =3D=3D -EEXIST);
> >
> >       if (IS_ERR_OR_NULL(folio))
> >               return NULL;
> >
> > +     if (shadow)
> > +             workingset_refault(folio, shadow);
> > +
> >       folio_add_lru(folio);
> >       swap_read_folio(ctx, folio);
> >       if (readahead) {
> > @@ -688,17 +695,26 @@ struct folio *swapin_sync(swp_entry_t entry, gfp_=
t gfp, unsigned long orders,
> >  {
> >       struct swap_io_ctx ctx =3D {};
> >       struct folio *folio;
> > +     void *shadow =3D NULL;
> >
> >       do {
> >               folio =3D swap_cache_get_folio(entry);
> >               if (folio)
> >                       return folio;
> > +             /*
> > +              * Capture the slot's shadow before the allocation overwr=
ites it,
> > +              * so a fresh swap-in can be evaluated as a refault below.
> > +              */
> > +             shadow =3D swap_cache_get_shadow(entry);
> >               folio =3D __swap_cache_alloc_folio(entry, gfp, orders, vm=
f, mpol, ilx);
> >       } while (PTR_ERR(folio) =3D=3D -EEXIST);
> >
> >       if (IS_ERR(folio))
> >               return folio;
> >
> > +     if (shadow)
> > +             workingset_refault(folio, shadow);
> > +
> >       folio_add_lru(folio);
> >       swap_read_folio(&ctx, folio);
> >       swap_read_submit(&ctx);
> > --
> > 2.53.0-Meta
> >
> >
>
