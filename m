Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71BC3BCD0B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746777; cv=pass; b=D12DPEj268+fDQb7PJ15BdwiAC3tvxMU3N6yL8Xf27SJtMPcPnWeIUja/hu1/nhaCiMSBnQDQ8PrUv8uVuQdMFuWR6spcycqON2mqFYnFC/gp5DwAFzHqJiNUIGjw3PHEzfKBFi5aMBuMcCpjUpgr+AQl2v43dwoI/e7tqECBog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746777; c=relaxed/simple;
	bh=o7xvS6vu5OfNmcyf3X9Q5ZXWPtTTnUcALYoMtd/7lH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeEfS6uZZxm3d9eDKq87u/IZF7WmMWMRwrc0Pmb3bRxzCtjMYeR6LAFeRMqULc2XLYyrmrr9FBKAZjMTNj4Sizita0a33O7AUexoEcMStY4b1RyRf2t1Lfk8qTWP4x3aAnv5OYiZP9NjvEBWopHmgaGpQkPWlK4oyZRXXlGq7po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgBQa2GH; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgBQa2GH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f5d5dbf80so75328f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787746774; cv=none;
        d=google.com; s=arc-20260327;
        b=cHecu55sKY8jJKgR4K95xPCMfdDUhyRxoqCadAf6aeqBzXS3SAhIwH3o2UYxoHkI6W
         VfV7dQ+amh+C62QjdRd4agx3slJIGRvksoQQjN8gZyRktQyKTxqyJpndj/h6dRpU4815
         jAETkLlR6B80p4tlpoa1JjSCzI/XYx+a7NG+97F0X5g/9m2qYD3NtWvd4+LboJOQwG8u
         YhSVSyzapvm74zPgvOJUNga0XnmpSQjtDkLFbcj/n13oBBvEyzjSW6jrIAxdb9iaklj1
         A1wb+d2OREJhKzt2ZWZ18jVxrTDGAuoocdY6xxsxdreA8eynHSQQmb5a6c8rJwd6yRno
         VjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HWTItkLdaNcYG8wfYq3YekuPNOywaSYtZm4aiNMSYwU=;
        fh=oMfYHrAotHjKjge5nPYxNFG5+w1/O0OPYEO//pn1TvI=;
        b=goeAW+brT9sRLv5lK4w4xax6TmarF3BdVGfbIcSSATWmB/J1nan68ts/k98mGGYL1n
         cqkdfBnOOeos3Rt4wdKEujWSuoFJpxU81hauTOus6UQeN4EoWrlXKbNWYeAjkVOfkGiw
         DR5tqT+SPI3kLdMGR8/kPtzdT82Mv9AEAvMEIjv94Wsnl3W/ZhwtwyiApruUnCX8AgHp
         9u/Wie7/8RGC9pp6+RqmJhKofWJoZ/N52r1Ax9ep0TQW0tAjs1TgWEt2AksR/5UnYLhY
         gAedykU188UVUqClYX/gJTvvOqUCwNUwi/KUA00ntOkesAqGVF3+WhL2toM6soGKjrTT
         e7fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787746774; x=1788351574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HWTItkLdaNcYG8wfYq3YekuPNOywaSYtZm4aiNMSYwU=;
        b=XgBQa2GHcjIP1YiRpjqdAH6b9DONVQYF7Pc7BKLsrMvl1iQyqZfMGwn8US5OF19c+6
         SR52hTzw9JixrT9jLi30/ruczlyLd9/vVZxmqpPHY5XiEUeliHGM7jS9sj45TScSF+Kt
         cAuXjiJzgqjMu0tqkGZ8tjSHjbgZ2tou9X1oSjFscg5TgS7EPhZ0/kHtcXyYHr70ZFqH
         iNOk0yPg+Z8veGPiecri2Hc1wfq1uMJnHf2O5Pr3WK9LgA8r5msli7U3J0s74VeiyOAX
         lAh4CosiTwnvOLLjQu1GMMDUYUeuX0/TChh/N5151OaQzFUEz3dhNnOQf5JkjKxxk7nu
         Dj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787746774; x=1788351574;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWTItkLdaNcYG8wfYq3YekuPNOywaSYtZm4aiNMSYwU=;
        b=SaxUZqseuR7mSsTYZIKD4y386inz+TLpcmUFnjXxsExq5l1HcjNwEzpz044ZHOJHXK
         gUf6ljooYHpCMNXu830TZOu2aUdVZV6eNncY+w3TyrZeg6+euUtZz4B6mnP4+twkJK5w
         SrM9oRbm4gbOkhKl/U+xdu25FoPzG/5mo0S8yFGlFO/wMwRJjPtHEO9KOh22HGfXyELN
         aqeY9Smp5J3EN6zWhAMFUuCvMrOcyAQTBLli+D70bPxJrmhyDrW0LSQqRmZmewqW06Vh
         9dN+1gemSw1VNPIxfNEB6dxm6cxckWmQv0zKm3C0u0jmwMp1CawxuoERXWid8NWTTHa3
         hJxA==
X-Forwarded-Encrypted: i=1; AHgh+RqUtl190E/7ORl5rvhQ5f4sn0+hTrROhrYuN2oTkaeQ3vr1Lb8WSfc21mAfUkal9p8AbQEl3a/JHsku31Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lRGuaQuIZrH9lZHBnY5x+YqnXK0c2hv7RUhDzJoF9oAiNLasH5
	M3vqW5Y01ZXwxPWgHUkATbEfrXJRiVzraWU4mJrQNrBYVW7DVF13L13NBuexUPPu4NR9yWiBe7K
	Um2NqnBJeAAMR66UB0o1PVaM1euoUiMY=
X-Gm-Gg: AR+sD11/qYc4Rl1cVNOWpbBiXRJSh0+brEPiMWAIbNC2xVis5WZGIWxgn5C/nBfRf+d
	MJYPOLAUy3zbd5h+ju6I6eUD/Idj7dRgT8LofZzlC7Izw3eIARO8XDkohKCBJe+PJI9ku75VH/i
	bNxSiDmnXU4whlgLLVp+IwN+WUxbsq7m5hi35DEVxwwHEJKXxkMzEDGl6TViZ8zvKBU8HVwIiXV
	7hGDBJEqSe7AHnBUDsn4OKiD2s2YilF8waV8Qibf3r/kisCSOpNM50b3om6kGs/Yc41t7x33RKm
	BhBEN4wyo7ywxSGfjbLKpr1PVq1qucgYi9ys9QpK27xsWu0sjMU9B39roGvnHqJG3RkMa3FJ7Ap
	brMRNI84VpdF0LTf10qmhwEqE+CYw1sZuY4rvkdER
X-Received: by 2002:a05:6000:4711:b0:47f:8e4c:8a4c with SMTP id
 ffacd0b85a97d-482e27403cfmr3428181f8f.4.1787746773692; Wed, 26 Aug 2026
 05:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730090647.2401252-1-xueyuan.chen21@gmail.com>
 <20260730090647.2401252-4-xueyuan.chen21@gmail.com> <2931f8a6-3780-4d6a-b19d-61cbbdad1a3a@intel.com>
 <1e04196a-7079-4a8d-a1b7-844e60d08728@kernel.org> <687afc72-5b6a-4138-8d33-fe5b6b7aef00@intel.com>
 <26e6340e-9551-4d18-b6d7-86cd400a5b88@kernel.org>
In-Reply-To: <26e6340e-9551-4d18-b6d7-86cd400a5b88@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Wed, 26 Aug 2026 20:19:22 +0800
X-Gm-Features: AcwNN1VU5Mbc85A7hVGohdOOFmdIUTao66TRdBDCw720fDhJHgSyn-6YsLEVidU
Message-ID: <CA+qSx6wyvivrp5P-vLSmXeEK8GCs00ThKLSq4C8q7bLLLXUPwA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] x86/mm: add set_direct_map_ro_noflush()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, akpm@linux-foundation.org, ljs@kernel.org, 
	usama.arif@linux.dev, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rppt@kernel.org, ryan.roberts@arm.com, ziy@nvidia.com, baohua@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David, Dave,

Thanks for the review and the discussion.

I'll switch the helper to a page-based signature and do the flush
internally:

    int set_direct_map_ro(struct page *page, unsigned long nr_pages)

I originally chose the address-based signature to prepare for the
interface conversion, but since that work stalled, I'll keep the
helper consistent with the other set_direct_map*() helpers.

The remaining comments will be addressed in v7, which
will be based on the latest mm-unstable.

Thanks,
Xueyuan

On Wed, Aug 26, 2026 at 1:31=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 8/25/26 18:57, Dave Hansen wrote:
> > On 8/25/26 09:43, David Hildenbrand (Arm) wrote:
> >>> int set_direct_map_invalid_noflush(struct page *page)
> >>> int set_direct_map_default_noflush(struct page *page)
> >>> int set_direct_map_valid_noflush(struct page *page, unsigned nr, ...
> >>> int set_direct_map_ro_noflush(const void *addr, unsigned long nr_page=
s)
> >>>
> >>> Which one of these things is not like the other, despite being named
> >>> just like them?
> >>>
> >> That's called out in the cover letter:
> >>
> >> "
> >> This series adds set_direct_map_ro_noflush() so mm code can make a
> >> direct-map range read-only, then uses it for the persistent huge zero
> >> folio. The helper is direct-map specific, takes an address-based range=
 as
> >> discussed for set_direct_map* helpers[2], and leaves TLB invalidation =
to
> >> the caller.
> >> "
> >
> > My concern is not so much what the function is doing or whether or how
> > the specific function is documented. It's more about whether the new
> > function is consistent across all functions with a similar purpose and
> > name. Also, if it is _not_ consistent there needs to be reasoning behin=
d
> > the inconsistency. I think that is missing here.
>
> Yes, the intend from the submitter was to prepare for the interface chang=
e to
> keep them consistent.
>
> I agree that for now it should just consume pages instead of an address a=
nd keep
> the interface consistent in this series.
>
> >
> > In this case, look at the call site:
> >
> >       addr =3D (unsigned long)folio_address(huge_zero_folio);
> >       set_direct_map_ro_noflush((void *)addr, HPAGE_PMD_NR);
> >
> > It *has* a folio. But it does a folio_address() and two casts to massag=
e
> > it into the type for set_direct_map_ro_noflush().
> >
> > If set_direct_map_ro_noflush() just took a 'struct page *', there would
> > be one folio=3D>page conversion, no casting, and complete consistency w=
ith
> > the other set_direct_map*() functions.
>
> Again, I agree with that, and the idea was to keep the interface consiste=
nt as
> it gets converted; it's just that the series that does the conversion sta=
lled.
>
> >
> > I'd also be OK with set_direct_map_ro_noflush() taking a folio, with th=
e
> > implication being that it might eventually make sense to convert the
> > other set_direct_map*() functions to folios. But page vs. folio
> > confusion is much less likely to cause bugs than a void* versus another
> > pointer.
> >
> > IOW, what I think I want is:
> >
> > int set_direct_map_ro_noflush(struct page *page, unsigned long nr_pages=
)
>
> Yes, or as will said
>
>         int set_direct_map_ro(struct page *page, unsigned long nr_pages)
>
> performing the flush internally.
>
> >
> > Or _maybe_:
> >
> > int set_direct_map_ro_noflush(struct folio *folio)
>
> I think I raised it before, but using folios on this interface is not a g=
ood
> idea. Primarily because
>
> a) Once we decouple struct folio from struct page this interface would on=
ly be
> available for folios and ...
>
> b) ... the huge zero page (currently huge zero folio) is on of the exampl=
es that
> *currently* is a folio but very likely won't be a folio in the future. On=
ly
> anon+pagecache that really need mapcounts and all that will be folios.
>
> c) I don't expect any further real folio users (IOW, anonymous folios or
> pagecache folios), but could imagine non-folio users.
>
> --
> Cheers,
>
> David
