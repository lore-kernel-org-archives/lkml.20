Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D36F411FB2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852950; cv=pass; b=YNfsUCfGWxbIfzrUM2/KYulaned5g6KsIBpZXYrGWaEd7ZwYkem47XwuDGvIvzKTzU5bBy0thwDN4/rg6YbCp3wuB2tVQmQ6tWYWPZlf1fycgY3MiUHNpCf5bDnY2hN7qK52P9Do1WiBeYjyLm7qaxVafwIaotqRkk+2/t6Ygsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852950; c=relaxed/simple;
	bh=Kl5pSnCX22Pcpw/tUycVQnuIXaPY9vzNtDRAxRmP2lI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hEPmO4XPozvkINnYHnCGD5kSQjypPoElKK5DmR+JWaXxGneLZvWKF2CktM9H8xQxEdyevuY4w2fKCYnR1n/5eUNPwe/PQtfZDyj86MNl+VuYL5dLGQy6HBjQexXiCI5E8cAFWIc3xSHbsdfneujwl/7HkqFyS3BlmLGh+3Pb6qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlBr0qCw; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlBr0qCw"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a60d406a5cso26954a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852947; cv=none;
        d=google.com; s=arc-20260327;
        b=QxioUEgTD+Kk39wUfm4ka9dZ9QN2KYb8lbFtHnNISUNz4IK0Z0uVmC9mozdMJUWlR7
         d/mLvCmLO89uF8wOC9BKmeqtt4jFcxrkkj1+o7XIMVXV5xo8Dk24nao8M8/0Obn3A73v
         b5pfbtSJOY/MlC3hn+xvy+Vce4+ZDAkRCjd6uT11lk9W9wftAzR57bnsaR8CrBwofY2v
         rVkaWfCSS0/sPRPeRYnlaVbSxbqetx78gd/36lT3ZavsEMsUxx+Neh5h8X2mhCtNx/UW
         BqHNxoZktd3DdNfFxXGP+vjesHe9oQxtivV/k8lBYfWQ1e2Dmh4S5Bgoec9BrJWygJwY
         gcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yW6biE5fdFGdJHeb2R6IVd0GCVVjxtlUxzSI9ivUYnw=;
        fh=UCGu+hjoSU13WLpHlay2AUArCM+xCJ+x9XWZPDY3FuU=;
        b=R/1L2u+OyEpSdSOBFDMkzYuPKJELcF8JduHFzrrqXFM3c6GadJ3KoZMsNog6G+bj9P
         4D+QyXdrz9npsy00a6bqoumrdHEc+AnJ21bgq7rdoBCGJ+c6KZUN/uaoPyE46d0q7tpR
         EGYFcHLts/MV3pmAN7PX9XyIvGUZ94enDvvnfEmAVGZ/Wki5uAeUht7wzyatFygbl/iq
         abr0df8/v4QAyFUsZ6jWS2PZQ97yVTDEK0efvToW4J2kY48M71pkiAMwlgx+qy/b+eEs
         +02HbuBMhgJ9W1ooyDvijr/iJEJsrv+4CHTLuBICFsLDLuol9ZaaHZmaT+wgZD1C/8QT
         ViWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787852947; x=1788457747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yW6biE5fdFGdJHeb2R6IVd0GCVVjxtlUxzSI9ivUYnw=;
        b=TlBr0qCwQ82QmQCwqpeMjmzWoAFM3T4Oyg+A/pRiYd1Jbe2ChK0kujUFqqTnNyzyxp
         b95FaqaIrwylU9JcJPb+UCFyV3rLATrpkkqLDP4SuRf/xbz9MF2JgRbSZ3F6tb+QNwtm
         5C5wEmxM6oPOa8nHPBXja0MVMlVBpCNhIKFSMz1eBTm73rLawgtaefaQHEOBbE3bwH12
         ZI23lq/V7UPntlduJQKnxHEC/PU/IBtJRLrtIVw7GFpGzcsduP3GuECZnYfKpfzNfIza
         6c7s8OxAYF5qkFMChRQc5fCk4PQ7qs56OeWZZVwxZuVKeRYZMhSsHp+vhcfuQhNBAUiu
         CkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852947; x=1788457747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yW6biE5fdFGdJHeb2R6IVd0GCVVjxtlUxzSI9ivUYnw=;
        b=VkzC6g7uHF/EnjpNTygfOSDY3BP2JXjhVX4j6qC+4g0b636pNcvvkz9oHxp+8dZtYB
         +HZBKjnEmuH0B9a0c+OVTiZigngP2cpPbFWwEvzZngaMhejn/WG33PPa3YDVDJaimNzq
         CH+5r2NiDUTNFn5Q+X/dTKr7evyeCGQzSr3K6O7oWtVpk2ctBsZl9mgDNfGxSkdMcWJ8
         ScrxMWgMQW1HZGGaowJLzG5C4tiyQhdOb1GyZpcqRl51j6fkvJpjdio8tj7ve8CjN9aX
         XIJLduSLu9VBKFz1OS9o4O7ODffJLomZKQ597jFgc2kZpb73Aw4fQvniegIWe9Qs01Je
         F8RQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/1iAYo7S/uks6wOXxpun7AhGtbYptoxmOoKToEAtLux8PwjvjVrCnLMW+UHbZyeZanw/LUWS0tbUDLi0=@vger.kernel.org
X-Gm-Message-State: AFuF++n6cYoOW6PCskm5eI48K+I5vfwwbu7x8KQiAt+zpbOa8hozk9e3
	sYQsti2/dgmB5eM4c7iEo2GieDQxBhNlVVGuuDxVmT4lzXs8bWENl3L8zSSbfMuCszsnyto3jon
	ppTOla6ADj5goLTv2vSrmqQCjGHgB47E=
X-Gm-Gg: AR+sD115wz4nahceR3WoC3L2r10fKWksXArwS/A0IfKwW+yfHQJPUigpqL21Lk3d6Dc
	tkLuhB5GM09KjwQ/S+qyhAfZuhKVMANOYzK1vLinh5kTEr6clhRTjpOI8+E1mSKwP4rnklbyZTV
	Wi5LWjwrDfsgrL963VWl+9rX4v/9HA205OWvn8rs1tJ0j4OVRhrdyJf7V972Liyfx8OunRZPPa1
	SE6z4MFuSc8aIr2EVzQYVgYBOc0sXWpDYBy0xbO3Tf/RnJ/cLarhcs20xew+uBJKCJdNFa2KgkH
	DU4QhOwALEM7Nvxsh0ZSZzr9WzOLxOSbyFSGDtMAZR3PV8ThPPA4FHrGOKnY0Ja5WfkTHgvcYbC
	4OM39g0cI7LgF
X-Received: by 2002:a05:6402:d0b:b0:6a6:4a5:bd37 with SMTP id
 4fb4d7f45d1cf-6a60d33913dmr89806a12.8.1787852946307; Thu, 27 Aug 2026
 10:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-16-9b43f5163238@tencent.com> <DKYI7U97KSE1.2S1M7CWBNBYFW@nvidia.com>
In-Reply-To: <DKYI7U97KSE1.2S1M7CWBNBYFW@nvidia.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:48:30 +0800
X-Gm-Features: AcwNN1XhnSrcGWzKjxM9OlQz8QONVR283xx9Jx4nU8W4sLhXLThIBH32-pmHlLU
Message-ID: <CAMgjq7CXqtbCH1cEJpNEta8KJbqDzd+ZQEd81dS9botZmCsQZg@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] mm/huge_memory: clarify supported split orders
 in comment
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:02=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On Thu Aug 20, 2026 at 2:55 PM EDT, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > The doc comment for __split_huge_page_to_list_to_order() needs an
> > update: only order 1 is rejected for anon and swapcache folios,
> > matching the new_order =3D=3D 1 check in folio_check_splittable().
> >
> > Also realign the continuation line of the function signature while at
> > it.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/huge_memory.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 06f353f937d1..0a971ca48151 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -4400,11 +4400,10 @@ int folio_split_unmapped(struct folio *folio, u=
nsigned int new_order)
> >   *    GUP pins, will result in the folio not getting split; instead, t=
he caller
> >   *    will receive an -EAGAIN.
> >   *
> > - * 4) @new_order > 1, usually. Order-1 is not supported for anon or sw=
apcache
> > - *    folios: anon folios need subpage 2 for _deferred_list, which ord=
er-1
> > - *    folios lack, and a swapcache folio may become anon once faulted =
in.
> > - *    File-backed order-1 folios are supported, since they do not use
> > - *    _deferred_list.
> > + * 4) @new_order !=3D 1 for anon or swapcache. Anon folios need subpag=
e 2 for
>
> We use head page + tail pages instead of subpages, so the sentence could
> be
>
> Anon folios stores _deferred_list in second tail page, which order-1
> folios lack, ...

Good to know, will update.
>
> > + *    _deferred_list, which order-1 folios lack, and a swapcache folio=
 may
> > + *    become anon once faulted in. File-backed order-1 folios are supp=
orted,
> > + *    since they do not use _deferred_list.
> >   *
> >   * After splitting, the caller's folio reference will be transferred t=
o @page,
> >   * resulting in a raised refcount of @page after this call. The other =
pages may
> > @@ -4432,7 +4431,7 @@ int folio_split_unmapped(struct folio *folio, uns=
igned int new_order)
> >   * with the folio. Splitting to order 0 is compatible with all folios.
> >   */
> >  int __split_huge_page_to_list_to_order(struct page *page, struct list_=
head *list,
> > -                                  unsigned int new_order)
> > +                                    unsigned int new_order)
> >  {
> >       struct folio *folio =3D page_folio(page);
> >
>
> Otherwise, LGTM.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
>

Thanks!
