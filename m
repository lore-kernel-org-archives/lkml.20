Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66854374735
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712084; cv=none; b=ejg0JIyvm3XO6djexXgfk59IkncS2GGPOyNnmImkdnKCsQoRzcSdv8b0r3HADqSiYIKeAFhVOvJOVFMGsXsilMRWBxycF2Knv2jfu37Rme4GclPGUDsY/O542dGmS6/bJ/8ZlV2oHe6ipSxuo1cXTDoReQQr+fMBeL1t9VQNT2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712084; c=relaxed/simple;
	bh=kJkWUIcJmnhwP4/i9ONumAw98jqXFVolIY+uJOBZOos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OevVOeJNWAazorrFqJdGMF65zP8VKGdeonUSXcpxkncg4t3xzs1ituqPG1ZNUhiVNfMHrCX9RAxsn014q7KMgxBzFz8KAmlY5BHdz40d/oOHJD6hfgIWE4AVAtGWIZNol7wu52QFRf3psezo3tidoJ9KKaSlQOOaBbwTKh6Ig0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRu9qUjQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRu9qUjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EE21F008A5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789712083;
	bh=mSUon0Ye+JTXHkgGPecismrQ6aWB6KUmBQxrnhvgcgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JRu9qUjQXlRcjBdYLmYId5fUC6gNDmR6uvG9HayWY2hzLkH+HiGKuskUL/ctLgP2U
	 Ob9+gFsoHQpIkKakYQSc0AbdsDy6276zAapXDiWaE9paVunN0VkmUUpMNDSDscA4Dw
	 TvkGHI+97S2SioWsf3/Ey/5smgTkPfQZu5lwVDNsJ+wK04tjbiBQI+ETfTKpxJYqhm
	 sMx5mw0Ln8+FkO+cAoi9V3yM+cMQj4udf54sUfcPw2eDg4/WPE53GkFK1qwojK1mdl
	 O8XwhWGUjhPRf0KLJ2oE243yp5Fxp0NBITZRZQCQ4NAar+SXKaC++dyEEH2NBA+Z/g
	 G9Cm/SO1Eid+g==
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso6903236d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwVYm8D6K8XSgoa8+zMx3w6DMomau9RVuHWnkc8vUkBiBDhSqD3uwUCrdAcxNij1OUw9igG4HsPCG7e7SE=@vger.kernel.org
X-Gm-Message-State: AFuF++lIDbSlTVwptreNux1yYUoGgdhhoWObkyPqMhWc830k13Zih0kL
	r4iAPSarLPoZhb74gNSobIBPfWcjhFnMXtO7QdV+xcnggXN7qjBVDQ+hqeNwiaQUgWhuVMDXi1x
	pf4C6hCIsTc9jch3mHDdItoItY7wTwTc=
X-Received: by 2002:a05:620a:17a3:b0:939:e735:c50e with SMTP id
 af79cd13be357-93bdc6a6970mr193841685a.13.1789712082223; Thu, 17 Sep 2026
 23:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <20260917052933.188679-4-jiangwenxiaomi@gmail.com> <27072d94-13bf-4bea-948a-d8a67976601e@kernel.org>
 <CAHKocdE_zyUQT459AiTBDzQHk0jh+VpXuSMDdgHjkg-dAkgBNg@mail.gmail.com>
 <CAGsJ_4yJ-KCHbJ9S2GKXfO51KB8g-y2Q_MikqE9-6VesR-RC9Q@mail.gmail.com> <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org>
In-Reply-To: <2462f67c-f7d3-4eb3-a093-6a338ef49f14@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 14:14:31 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zMG6v-ioi8-NhveqowPVAnsHkFCNy_c7+KHDMRW3JH-Q@mail.gmail.com>
X-Gm-Features: AcwNN1X6q5f1Ex-rUff9-91gcAaVXuwTbEB0wMz6EV5siIJ-q7nSpPx4G64lSm8
Message-ID: <CAGsJ_4zMG6v-ioi8-NhveqowPVAnsHkFCNy_c7+KHDMRW3JH-Q@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, david@kernel.org, dev.jain@arm.com, 
	jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org, 
	ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 2:05=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 17/09/2026 =C3=A0 23:44, Barry Song a =C3=A9crit :
> > On Thu, Sep 17, 2026 at 10:41=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmai=
l.com> wrote:
[...]

> >>>>
> >>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>>> index cdd68ed3ae1a9..349ced999f959 100644
> >>>> --- a/include/linux/pgtable.h
> >>>> +++ b/include/linux/pgtable.h
> >>>> @@ -2134,6 +2134,35 @@ static inline int pmd_free_pte_page(pmd_t *pm=
d, unsigned long addr)
> >>>>    }
> >>>>    #endif      /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >>>>
> >>>> +/*
> >>>> + * PTE-level block mappings for vmap.
> >>>> + *
> >>>> + * pte_set_huge() only has to be implemented by architectures whose
> >>>> + * arch_vmap_pte_range_map_size() can return a size other than PAGE=
_SIZE.
> >>>> + */
> >>>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> >>>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> >>>> +                             phys_addr_t phys, pgprot_t prot,
> >>>> +                             unsigned long size)
> >>>> +{
> >>>> +     WARN_ON_ONCE(1);
> >>>
> >>> BUILD_BUG_ON() would be better here.
> >>>
> >>> It should be possible because fallback arch_vmap_pte_range_map_size()
> >>> will constant-fold PAGE_SIZE so pte_set_huge() will never be called.
> >>>
> >>
> >> Agreed. These fallbacks exist only to keep the build working on
> >> architectures with PTE-level block mappings and should never actually
> >> be reached, so BUILD_BUG_ON() is right. I'll make that change in v9.
> >>
> >
> > I am not quite sure. It won't be called at runtime because
> > `vmap size`/`unmap size` return `PAGE_SIZE`, so the code won't
> > reach this branch. But it will still be built.
>
> The fallbacks are defined as:
>
> #ifndef arch_vmap_pte_range_map_size
> static inline unsigned long arch_vmap_pte_range_map_size(unsigned long
> addr, unsigned long end,
>                                                          u64 pfn, unsigne=
d int max_page_shift)
> {
>         return PAGE_SIZE;
> }
> #endif
>
> #ifndef arch_vmap_pte_range_unmap_size
> static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long
> addr,
>                                                            pte_t *ptep)
> {
>         return PAGE_SIZE;
> }
> #endif
>
> Therefore in:
>
>                  size =3D arch_vmap_pte_range_unmap_size(addr, pte);
>                  if (size !=3D PAGE_SIZE) {
>
> GCC knows 'size' is const and its value is PAGE_SIZE, so it won't emit
> the branch at all.
>
> It is call constant folding, some explanation here:
> https://en.wikipedia.org/wiki/Constant_folding
>
> >
> > So, would a `BUILD_BUG_ON()` trigger a build failure here?
>
> It shouldn't, if it does it is a compiled bug or this is because someone
> has redefined arch_vmap_pte_range_map_size() and not pte_set_huge()
> which we'd better know at build time rather than at runtime.

Thanks, Christophe. I was also thinking about compiler optimization. I
was just a bit worried that we're touching the common MM code, which
affects almost all architectures, so I'm not quite sure whether this is
supported by all GCC versions used by those architectures.

If it is supported by all of them, I agree that `BUILD_BUG_ON()` is a
perfect approach.

Best Regards
Barry
