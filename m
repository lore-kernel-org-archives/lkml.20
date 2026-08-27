Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B254A1387
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852548; cv=pass; b=HMVVrqtXHNZRZ6B1xuPfcCjzjQCs3FG6hxUv+273IlvsGRIlfM7ogHZ3h22lwsy/5v99PCcYZOnYnN+hs2OsgNuD8/dMZhzQRH5aXf/tGcz24tNRGMFIARoT/AAr0hxrRuKpsJSIp3sPfpZwD2VEa70eDyjO5nggGtCzkbl7t7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852548; c=relaxed/simple;
	bh=pgCMtD9F5pZsbHoUxg1WLQyMASwSOzIDszsvJZMORzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQO3+6NlwVbQrDGkALVbuNMNBJzK1DuJHHIa4AY+xVxtBoF1SG2s96L6RcfdRToSByKU7vKfFaOR/CxzQ9sYNGmNUPXmSRR3QtjT7IdTxCqmKokeSkaZGwCQ+2//3Zv27SHPwP3ebzbwWUU5KXtHwLl0/zGoeiWvdW0DpejU/as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy9vJBck; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy9vJBck"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c252c7270faso19099566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787852545; cv=none;
        d=google.com; s=arc-20260327;
        b=OTdI1Wzdt89KG0n6bUBD27xVhiA/2dzYYTgbzvlTaBA39tjKdaMtfQDW7qWajH/RbV
         GdfeRTGUDUBOQUySAUfxckufEwVUz/Hhau7z9MWW+HOJVMzBN1Nnx84fan4EN0SxECSt
         0jDNOXTe0gAFZDkQBPiDiLJF/E1aVcrbjm/mqKiGYpLH+mph9ddSF9Py+MCI6fVhvNw/
         RoQq4sLEPRv7cFY0s5nuqgvliBdRh4SIHdqwIk8Zz8B1EqVJn02v75jo9WiNmx4Sjj/v
         e8eAcnhRo0jtunTwy1I7elQP0MVt0LgRYI47nlh/EK4Ak/n4w+Hw7XbuHo8ChKXiHKet
         nH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4g2R7hDD/VxEow4hCMhyCloS5wn9CYeEzUt4DHWtAc=;
        fh=Oh+CWRzgxe93sk+4+osGhx8m4IOhm9FB3MpgBxHa/Bk=;
        b=Ex7iRl1bUNGWlwYZZ6i38waJzu3lEfyXJq5yomg0TGAd1vsA7s6cxT2DtSxtkB7HQF
         QFrVflOraPVAmtmLMFnI2msa7Qq1rp/nWL9fzHceQym0eoHWZn3o9FkWYqZOo8dv2hL9
         b+kSvR1OaYqMHbsTZsxPnk2E9Rt2LsyW6H/CwsDE/dOcgIbGqB4T/zD0X7AjOYZaiSoA
         8RBqxSF/sRnQzVsez6+wRc+s6Wu7kRmBy4tielt2WZfxzRenPtVpwYZmRvsNudLzW5i3
         M39sATYX7aqhWKyBDuwBChJxSZrl4apBDtS1amkQV5+9bymxS6DTOHLpayhFKb8S4z3K
         bhiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787852545; x=1788457345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4g2R7hDD/VxEow4hCMhyCloS5wn9CYeEzUt4DHWtAc=;
        b=Sy9vJBck3l7W8MihELLG4eaJGraIEUEDp3JO5/cDwcx8eHxmx1jmkQkKp/u/SdtOE9
         Zz/JyXZTs89+L7EFbor6J7mWGRLbMAtTQA972jpQ1MoJ2mNsLAHgxw9ZAY9dA7hjUPQ9
         7ibofcduFKDwMp7qao0+zCY/78OD2CA2EoobIg37Y2UKWFwcY3L3PdVnXd425/3FkYBW
         SxbeRei9b/kA8nE1ddY/1zUI/mFDaxWukTYVa2Rj/O9xiulg5AyxiOOdJbNesT/7d559
         7J/YzksAEh0mik/d68LJ+xfRHlpLO1QsWIp/EtgUw0UagPGABuxdKqCQSjnQZ+kaOO6C
         r7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852545; x=1788457345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4g2R7hDD/VxEow4hCMhyCloS5wn9CYeEzUt4DHWtAc=;
        b=m+KdzahWku5ecGDVrH9m5S2qrKjCjpLpCe+8DJtBjtsCS0H6nMpJXaMLOv+KHnpwVW
         O8/gew7GJ6ckT2R6ZpoKvVpsCQkfj2hyuWroyLUJEFUHS5PXAdTOcfiCZlNkW1JfZ2Ar
         B54BXIIK74IMVV6z/Cy6vX7SfXsqgHuFHsWPKRBApDRnOw90bNFuFptq1dDzVaKG7P1j
         Q9wPuvxpm9YvlEsWrMBKsPuY7m+TansOb1kRzchx/HOyD4cxXy1TCQvnY2m/dOJ7CwzI
         yhzOtLKvQuo/nOyocSPnIot7zPiXGCvsz9kdV73SUHFr/H9kUJZYBa76y61ebQWgiVZB
         vjMw==
X-Forwarded-Encrypted: i=1; AHgh+Rpykkm2XPb8pZi/vyTEIKZ/mpAdEhSci0zyRknYK2fVZpfYio8ZFEP8iF0pH8JygqDwHY/LxABufh0yCsY=@vger.kernel.org
X-Gm-Message-State: AFuF++moLK0+m5wA+AG2GQBaAfEsXTke03wHEWmhp86ayCUruQCfGpXf
	LX9u9rV9fGJok8keEYW9kWmN2c/FY2edmxozN/Q2Cf3bvkv+dfux8EeR32frUluB+JLBDUY1bR4
	nTHDatMEbRKWjqIMHoAAOm1M8b/5SzQw=
X-Gm-Gg: AR+sD12nQM3/LuotSSQGhilmGDXclalTcRYfod03mivcSV1tu2Zlg9beBW7SU+6IyIP
	bECse3PvIrGywMyb6tfFAP6HppuxdSHLumUqlFfs2IYgkw5olEGZVyes6jBPIanetMuhtt5NJXF
	3sMaRsR6XsMYAF8rt59tLtVIQVjWeMTvw4WdVdDfa5RLlvf3QgCBGBxlkkoUr7VjJ6GHomCwz6j
	caPc5rNJkO1C94C1VEvgnDIKrVbFzdooddPO6YgWLErrx8uZepEuCHbx+So7/x52NQnK1vUCt9C
	afcL2FBjT8zs4+SDKmX+xZBsZs7gOIRTrvcZdDCFdc1rzWiiPc4QrOIcVeMi8qZOKJqitT7KR+c
	6
X-Received: by 2002:a17:907:6d0f:b0:c24:f8e0:f092 with SMTP id
 a640c23a62f3a-c2556bd24d2mr32286066b.1.1787852545239; Thu, 27 Aug 2026
 10:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-11-9b43f5163238@tencent.com> <5ee65970-abb9-47ea-b548-5430b382cf7c@kernel.org>
In-Reply-To: <5ee65970-abb9-47ea-b548-5430b382cf7c@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:41:48 +0800
X-Gm-Features: AcwNN1U7uq0MZRyrRJQyABR8mE1_Ys0frTFUmcCYhz0ueNXpbpen6JtJp3NAFzc
Message-ID: <CAMgjq7CgxBEuX0rtUdx=g5RFijONOfDuUM=A2FBqy1R2N2n-2Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] mm/huge_memory: allow splitting mappingless swap
 cache folios
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 12:41=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
> > +     if (anon_vma) {
> >               if (!ret && !folio_is_device_private(folio))
> >                       ttu_flags =3D TTU_USE_SHARED_ZEROPAGE;
> >               remap_page(folio, 1 << old_order, ttu_flags);
> > @@ -4259,6 +4261,7 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
> >               struct page *split_at, struct page *lock_at,
> >               struct list_head *list, enum split_type split_type)
> >  {
> > +     bool is_swapcache =3D folio_test_swapcache(folio);
> >       struct folio *end_folio =3D folio_next(folio);
> >       bool is_anon =3D folio_test_anon(folio);
> >       int old_order =3D folio_order(folio);
> > @@ -4285,8 +4288,11 @@ static int __folio_split(struct folio *folio, un=
signed int new_order,
> >       }
> >
> >       if (is_anon)
> > -             ret =3D __folio_split_unmap_and_freeze_anon(folio, new_or=
der, split_at, true,
> > -                                                       true, list, spl=
it_type);
> > +             ret =3D __folio_split_unmap_and_freeze(folio, new_order, =
split_at, true,
> > +                                                  true, list, split_ty=
pe);
> > +     else if (is_swapcache)
> > +             ret =3D __folio_split_unmap_and_freeze(folio, new_order, =
split_at, true,
> > +                                                  false, list, split_t=
ype);
>
> These two boolean parameters are really a pain. There must be a better wa=
y.
>
> Also, I don't like that __folio_split_unmap_and_freeze() sounds generic a=
gain.
>
> There must be a better way for that as well. We had a clean split and now=
 we
> mangle it again.
>
>
> ... but I am just before my PTO and out of puff, so others can brainstorm=
 on how
> to do this cleaner :)

What if we just keep the __folio_split_unmap_and_freeze_anon name? And
have that "bool remap" mentioned in previous reply? Clean swap cache
could be considered "anon compatible" as they might become anon
anytime, and even for shmem, shmem shares the same IO and LRU like
anon, so considering clean swap cache "psudo anon" seems not too bad?
