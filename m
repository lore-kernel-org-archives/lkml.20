Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728163;
	b=vA9jRMwSRcPFNkjpdf6gwZrbepOPzMHe8DmNA8+ywLmtA7yw97xcr7i4YwnQC/64S1wM
	 GnSSNRcVz7DW/PXhy8UfqFRsg+UBhSUGYbDGAcPe6831O8JqoiVAe7j9sFSUake9liziQ
	 ylbZ2Nfi4/Mz1J9IGEflFpt0aQxp7LAE9IRxQVJX308GAOlBiblWBDKxZbUKQ8bUVASAe
	 xUxxLkd1KkuMSrZNu8KZLjrqC0dNPn0QLcKJuCbU0MjdGsuaNOQF8SjRGy50dtwcLV4ck
	 LtZblujYsaGlfCrmqKX3JlGdp2XRFJWk8bp8OND22AkRmQHKuuAgda5X+PBCaMyWXvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8qBJJGwcOkwORFVl1Xm6qSC9szXJOakEhGG/ugZS/vI=;
	b=jDoST7oi3SL7WYtXulDwismKrylACdkZuxt5D5XcII5bZoRrQDpsOvjZ8sQlmHV7H6ZL
	 yWFHMILzUbplZp8+syf6KQy5o1KlX83bY3s5q+JT3UjvIytTtrtmEyCuJ7hH5MrJP/NIv
	 9lqXbpz5YneB2DuHzxbYl6DaX7rTobQmgpJ60iEDWDSYr/emrcLvzTeCP3jO3aK4d+IBf
	 l2jQXrmBqoEWlrk9B5QqRO70H3pcJ7y88PM+lk4SzXDXlC3UANFzhdX2McWlyyEymQkmv
	 dt4R++ljyG6yJdfmqB+JMFF6xzaBOVWnjlmVndCTszVWkF63UdD2Rt92cLyKmXORMtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oWf5sNUr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AA1606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7AA1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oWf5sNUr
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-54492d8a988so681cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728161; cv=none;
        d=google.com; s=arc-20260327;
        b=jkDJzOa+Znxg9DjvYuIM+UZBhLhtDDRQUd4P1xEy1fXmpaCe9E5jkCpqYYI447R9by
         3ssUGR0ivdvOZvPPWOMu0UtO+AmyF4rLRI07GIRr9f7aIjWucD75vR+vcEnF6CoxBrlj
         1a08wVOQdBttfTopSNKYJ+nP/mAcgTVxn/hw7ttbo+vBmvHi0v+cKRNkpsB+SZ2VLmH5
         GiKgenPsM1q80q3JdtWp1MrmiNq5iZwL5G5JWouv8IztB1B6b4F1oMzpvDuiZ2R6Cj8J
         aHQFhi5lxFtmFwRwRgw1C1vk4sPCA5VwHy6ZY5jlJivxmjANAZBQ0ayAbHkV53NqWXKO
         Q5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8qBJJGwcOkwORFVl1Xm6qSC9szXJOakEhGG/ugZS/vI=;
        fh=H0uTkFBefnQPCs3fifUGx3HyWglOyIJ7o4DToOPz45w=;
        b=pBsiamPNFL/+oKh++sWBvaqD+6Pi9gBCZFkWUoAYVvldT+xcz8xjsAg9edJIXf26+L
         Nyo+Knmyvut3HerF5c6RDezfBIazE03Ltmn1v0+G4YftyjLGhIC49kKMjunEjCM0Wcz5
         tYFo8xV3HlEiVjogNS98VoapOayQkxJMuHSPsG+sGv+xUpT+IvnxlaxkVU/AFXGsJPQp
         BRm4+DFrOejYs9muBGLuTgo8UkzSSSkWSUBw8DTxQdCyU8QzWwWAxeKnyjyMVlE0f8xr
         krbSEzSRACJAs8gt5Aw/H/xAP5rnjKA7c4nerZiB2z6tAOnRCZWP8a/0J/GCp/yQZFMM
         KYdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793728161; x=1794332961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qBJJGwcOkwORFVl1Xm6qSC9szXJOakEhGG/ugZS/vI=;
        b=oWf5sNUr8wmmhZW6+pCHPi6k+uUqd+DVqK9nPj6VJfmepxmoN1+IZ+/RgP4vI7PwcJ
         5Me5E0SvbbBPUx9SinBICPRCf/VoYF762UBNYw40THZPLT62i1MXGHNgsY8MzOmRULgp
         7q61npy14VC0Ty77rM2hV+dk8OSZaD23VhUOga/aualCzku58TvGhhLoHjofQwu3eEHH
         IgHffmoIWXykpFV100elkNsC4PMWaJO2uGIESmTMg2hNLN6Oubv2IBCjmIcbeDcX/xCm
         +CYoVKk8e9HmBoT5h9NL/SvlQrOYrlYLG9UwYAvLFlZo0Mp6yUUd1pjMu3kcu9YsCSir
         n4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728161; x=1794332961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qBJJGwcOkwORFVl1Xm6qSC9szXJOakEhGG/ugZS/vI=;
        b=WQs9zYXyKC7OtwRc06Ts72UikQTTUQdSROOArP6DCgB7DGuettjDv+UCqHHOTUK2m+
         xCeNf5oLTZhC7+q+89tcJJ6fJLFVtJoQZUBO3b6AwNuAP28as0KTxeX+Wn3SLJUSbzS7
         6j+2+HM7FEusnDxVSeXx9SD8W2F7ec+F3SQKtMzCzyms8CDKZ8lLCw4y70lOAwmxEgiN
         1FVj8QGb2thcVGLVr/Lp6mDLeMT8ZnC2UhLvGruA8LxLqy6+B8+22qh77NsG+joNmQL8
         lCX/1O9ERV+wFgaBV65TRqFXkebUYTkEXD85kz9Lu5s28ZiBlwSallrYbhZw+LILiiSQ
         VmKQ==
X-Forwarded-Encrypted: i=1; AKwUvByfOKjBy9mPN/Z+lzd2z3zwV3HTGsCwSMPk9oAqBCe+Iiy4czVzirhygOK1GDs5KyU9wog2tpAKoPwSXL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z++xmYpLRkRywOk+3YVrS2mVOVaAh2SZP+7GOJKrCWb+do0xiGR
	QUx5+QFt1UHtn9pUcMV9iDm1jItNMKh/ADawl+y1TGnS5knie5fftArPEa86Os7NxntIZBqymsx
	Sggbh61HOIh/s2vA9QFpqudL81ffk3BKciq8LfWv5
X-Gm-Gg: AYBFou1z6Uc0GQsm8+cRJhWxNYTayfgj9KUk0t3JvZxvWKSKrkgvFPsOdu17B7ynAiE
	PY8MtV3BIZNER3VmpVXzIo1NxmrKY2TL8PRJLyAq5RxC8totdR1CU/vAU53KVh08N3n7AnqXdc9
	Lv7YROclB+gKRR5eWpkHKTGE/sIrIe3eEs0Wy3JYEx+qYvoB9k0KdeZr808CwBCHdaG8yVWw/65
	O0zMuetRGXMipt493macL16NWqiaQ0Gr1nz6DQCjAo0fg+pLKy68IWE1oGf3fsFmLiOEopcDxaj
	dZ/AK62GCj1BA47x+SXIqtnZUElFwl8dHkkDVzXvAaGydJw+kOsgZA8fB/HbrveIxlVpAxjxAeb
	mFfy5jQTKSbq5TNBjK1DWUuDv12W2flOlSnhZr65XXDJpPU3TsUcK5jK2+Hu6SVAA
X-Received: by 2002:a05:622a:1b21:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-549e0408e65mr23185391cf.10.1793728160913; Tue, 03 Nov 2026
 09:49:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260705180714.3708947-1-jiaqiyan@google.com> <85cb7ea8-8116-4092-8310-69b61eb8602c@kernel.org>
 <ee6bcc74-0846-43f2-bcca-b1bedff74351@oracle.com> <1dea7b3c-7740-474d-b9d4-cd2baf47f181@kernel.org>
 <168ad406-f6b5-4623-adac-9f894e410e48@kernel.org> <8f787434-5326-4a8f-92d0-467e817a23b4@kernel.org>
 <8e48c288-2183-4d58-b69d-5f78344b5da5@kernel.org> <c5658175-8d1d-4aec-9a66-b07d53f75547@kernel.org>
 <352e1f42-2e89-4445-a20e-572ee35c7a0c@kernel.org>
In-Reply-To: <352e1f42-2e89-4445-a20e-572ee35c7a0c@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 3 Nov 2026 09:49:05 -0800
X-Gm-Features: AclHuK_aki5ll0OesKUci7EnpbmfOgQofcwncMlPLSbILVUDcly-CR0P80pjzq8
Message-ID: <CACw3F52YcKohXa69Gtr_us1D4R7AdTbwaHh1ro8YOXZ9UByQ3w@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Only free healthy pages in high-order
 has_hwpoisoned folio
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, William Roche <william.roche@oracle.com>, linmiaohe@huawei.com, 
	ljs@kernel.org, ziy@nvidia.com, osalvador@kernel.org, harry.yoo@oracle.com, 
	willy@infradead.org, osalvador@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, nao.horiguchi@gmail.com, tony.luck@intel.com, 
	wangkefeng.wang@huawei.com, jane.chu@oracle.com, akpm@linux-foundation.org, 
	muchun.song@linux.dev, liam@infradead.org, rientjes@google.com, 
	duenwen@google.com, jthoughton@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	surenb@google.com, mhocko@suse.com, boudewijn@delta-utec.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 2:10=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 8/5/26 10:58, Vlastimil Babka (SUSE) wrote:
> > On 8/4/26 21:51, David Hildenbrand (Arm) wrote:
> >> On 7/28/26 19:18, Vlastimil Babka (SUSE) wrote:
> >>>
> >>> We check all kinds of unexpected state, when that's enable. PageHWPoi=
son
> >>> could have been considered unexpected too, when the checks were made =
more
> >>> and more optional (first by Mel and then me).
> >>>
> >>> But indeed it seems the PageHWPoison check is supposed to be load-bea=
ring
> >>> (hi, Lorenzo!). It's intentionally handled before bad_page() (with a =
taint)
> >>> in check_new_page_bad(). Commits 2a7684a23e9c and f4c18e6f7b5b are al=
so a hint.
> >>>
> >>>
> >>> Yes, the PageHWPoison handling was made part of debugging sanity chec=
k and
> >>> then not recognized properly as load-bearing later.
> >>
> >> BTW, I'd assume we can check for PageHWPoison at free time fairly effi=
ciently, as we
> >> touch all page flags already.
> >>
> >> Something along the lines of:
> >>
> >> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> >> index 520ebd2fa40b5..57f89f8684168 100644
> >> --- a/mm/page_alloc.c
> >> +++ b/mm/page_alloc.c
> >> @@ -1321,6 +1321,7 @@ static __always_inline bool __free_pages_prepare=
(struct page *page,
> >>         bool init =3D want_init_on_free();
> >>         bool compound =3D PageCompound(page);
> >>         struct folio *folio =3D page_folio(page);
> >> +       unsigned int hwpoisoned =3D 0;
> >>
> >>         if (fpi_flags & FPI_PREPARED)
> >>                 return true;
> >> @@ -1347,21 +1348,6 @@ static __always_inline bool __free_pages_prepar=
e(struct page *page,
> >>                 count_vm_events(UNEVICTABLE_PGCLEARED, nr_pages);
> >>         }
> >>
> >> -       if (unlikely(PageHWPoison(page)) && !order) {
> >> -               /* Do not let hwpoison pages hit pcplists/buddy */
> >> -               reset_page_owner(page, order);
> >> -               page_table_check_free(page, order);
> >> -               pgalloc_tag_sub(page, 1 << order);
> >> -
> >> -               /*
> >> -                * The page is isolated and accounted for.
> >> -                * Mark the codetag as empty to avoid accounting error
> >> -                * when the page is freed by unpoison_memory().
> >> -                */
> >> -               clear_page_tag_ref(page);
> >> -               return false;
> >> -       }
> >> -
> >>         VM_BUG_ON_PAGE(compound && compound_order(page) !=3D order, pa=
ge);
> >>
> >>         /*
> >> @@ -1395,8 +1381,26 @@ static __always_inline bool __free_pages_prepar=
e(struct page *page,
> >>                                 }
> >>                         }
> >>                         tail_page->flags.f &=3D ~PAGE_FLAGS_CHECK_AT_P=
REP;
> >> +                       hwpoisoned +=3D PageHWPoison(tail_page);
> >>                 }
> >>         }
> >> +       hwpoisoned +=3D PageHWPoison(page);
> >> +
> >> +       if (unlikely(hwpoisoned)) {
> >> +               /* Do not let hwpoison pages hit pcplists/buddy */
> >> +               reset_page_owner(page, order);
> >> +               page_table_check_free(page, order);
> >> +               pgalloc_tag_sub(page, 1 << order);
> >> +
> >> +               /*
> >> +                * The page is isolated and accounted for.
> >> +                * Mark the codetag as empty to avoid accounting error
> >> +                * when the page is freed by unpoison_memory().
> >> +                */
> >> +               clear_page_tag_ref(page);
> >> +               return false;
> >> +       }
> >> +
> >>         if (folio_test_anon(folio)) {
> >>                 mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
> >>                 folio->mapping =3D NULL;
> >> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selft=
ests/mm/Makefile
> >>
> >>
> >> Of course, we could also fallback for order>0 to do some smart splitti=
ng.
> >
> > I think the freeing part is relatively fine, as tackled by this series.
>
> I think we should really do something like the above to detect hwpoison, =
to then
> fallback to a slow path.
>
> >
> >> Checking on allocation efficiently is indeed a bit more tricky. For co=
mpound
> >> pages prep_compound_page() will already walk all pages.
> >
> > Yeah and non-compound high-order pages should just go away eventually, =
so I
> > wouldn't worry about making them slower now.
> > But it's tricky because prep_compound_page() happens later when we don'=
t
> > expect anything to fail anymore, so it would take some refactoring.
>
> Agreed.
>
> >
> >> Having hwpoison logic to just sync with the buddy when setting hwpoiso=
n flags
> >> would be nicer.
> >
> > I suggested that (soft-offline does it). There might be some downsides,=
 but
> > I can't judge how much they would manifest in practice:
> >
> > https://lore.kernel.org/all/CACw3F50nVECJ%2Bk4g%3DQVZ80yzi_awCOcUiCuB0C=
YcUfxND9-7Tw@mail.gmail.com/
>
> Agreed.

Coming back from a long vacation and catching up with this thread...

I agree David's approach to check for PageHWPoison in
https://lore.kernel.org/linux-mm/8e48c288-2183-4d58-b69d-5f78344b5da5@kerne=
l.org
is much better than relying on PG_has_hwpoison flag. I can update this
in v7.

As for "should we split and salvage healthy subpages", I think we
should do it unless caller is FPI_NOLOCK, i.e. when freeing pages in
NMI / lockless context. The only caveat to call out is, if we reject
the entire folio for FPI_NOLOCK, the healthy sibling pages in that
folio are permanently lost from MemFree. So should we count them in
HardwareCorrupted then, as loss cascading to the corrupted page(s)?


>
> --
> Cheers,
>
> David
