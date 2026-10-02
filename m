Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD1253340
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904873; cv=pass; b=EPYQAtfOWV7IO3+Xb5iKR4nLE6z44VWM8rV46manf2qAuc0Cij3SLoGDIzXYIwHwzatmwukZT7lurraTqGihXOJZsR2ieGT1cBAA9shedYBFaqP2y27qyIJySrBDTc7WNMyQWmgGvLGvBsNR+jT9OVwBcM6vI6p28sKIaLfyjEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904873; c=relaxed/simple;
	bh=gAgVlC/5lNOMEgevWNth911gIQfnfncz7NhLzBjdR88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nfl+QTuKisMOdNqpz6THaRJ08mR5xsvXD5xayiVvk3D4HkSFrFAacrhdnWOpQx7PS0B97+/hjr7S4wgOhyNfxZdAXgdzA4+cy4aRiNuP9Njj8kpEV9yF3XSilt5yOOpYZCOJpppu0Zq9Mbb0If/TRmwKa217lBz3r/RjXreh4RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4+/rDQa; arc=pass smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4+/rDQa"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b69d00121so31463f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790904870; cv=none;
        d=google.com; s=arc-20260327;
        b=VPH0HTT47RYty7738Po7cFhJmN4oQbPBhBLtB/GEB8aGnAVI70i8ifIJXQisjBEXjG
         qV6eijb06pwPEE2TZpJI9F9t2qewMJtDXPYQGAfVa19RysFoHasqZM/+IXB4cybApSAf
         te3FWhwZUioOf/QLYLzogzCnsJUldW/JKiYHFyVYzdVYZEsMEBTLTjYu7w+mZY/CSwNk
         GUBIMapR+xh6vz5SWsGje+Com7vZAgAB6OeqABfvxAetX7/fFgeOxpJPjtcO1IGhYXlq
         HJx2huCUGQEdJMAzOlI/DxmZwLsO2A4L/6pDNKfvGzW0ZxSRrs3usv1Wt32ZgY/ATbmi
         KnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7kzLbFV0dwlxOBcT/RyJ42nswcrqycHxeUvPWMKQHOM=;
        fh=LeZCGe+/MocyMFOFO/qQ2LKtpslfJ31BW8v9Mdfd9TY=;
        b=IeibkMvipdfodgWdA4Pe1AdhqZFFCHVokleYL4V7F8tXpct8Ore2npmLBy0bLhrDJY
         L58hneiSXpAJy2PjN1aWlOcBAV8443WB0ULIK5CeLiEQNzRG1uEqPSry7Pjyx83TX7zE
         s1T1bGEtHF+oPWGJeijS+8I3kpVq079wFooDvLzPjj+mO/vOGlJ1Cc1EfBPwY6JC5sEI
         fWX4T8527NUJ4+WVFrczhuJOSlvfOpYyI8ejzoBAEN10YA9MtRlKGhr+Mnal/ov+eomT
         jXT8pDdXFRJ8/9b0+fcnkJbg8264KvApp0rnmX3mopHXODWNGOG7DVTEyGL5pE3FyLek
         9Beg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904870; x=1791509670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7kzLbFV0dwlxOBcT/RyJ42nswcrqycHxeUvPWMKQHOM=;
        b=A4+/rDQaqTUT9vQi28d7aCYAbDszitFbpfTmFft+62AcmtRl2EBpepGRYj8P7Iwx6D
         N1Zo/z1Y5mbBgWwML5jdEOD6p0+BysBNgMGl2AOtI1up8T1T8/8yeOCj76vuNILKlnIq
         1RXs7owneQ752IzWBWS/WNN74+8ciYz/aoh0W70Zj1ipAxEtLlCEdDzoaPFntYjzlFVm
         ayTwB80M/UZa3jMfGaxt3wKN90qu75CiPiq+rfqhio5TGi1mfy0m0OuJsTDi1fEd0I9w
         ACBTwzkqeIwcUzfPiJE6xQFmgezfBOyml5Fs1VQVkdOcJPcikqDr/MlnVzopUPYSglUl
         6Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904870; x=1791509670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kzLbFV0dwlxOBcT/RyJ42nswcrqycHxeUvPWMKQHOM=;
        b=Cp2K7JBhhGtdSnalg5zz16WFVNh93PPINJl9+KnZWWc6R+YR1WjN1zCJ3OcpKw6dmG
         ZlJZPUogbxCJlvC7QxYOF2bdF1U3O7znkRyjkDJmD2slfsw1BAc4AOg1x9H02HGmD6Ao
         wO+ZlgJks/oJz7Xwh6+WalvC6tEzDk7z1ukhbhIDuDbPy1ENn0+/FNC9dhrmn8ebC3nZ
         yXaDFo/Vp6nhonaLFiW62TTLw08lSV/AoJnnBCz5rh3lsFIzAnXhYopJSDUhrQNobxiE
         E8cc5H8n3j7lXhLteFubORd+y4b3fez/eXrx2z1+7hmJ30Kr6ZMNFwOqQ+/gbI4YlJWh
         DNeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUiZ/4keBpd+zQRJfTs2Uqxih6NTmf4vb7s6P7Fk1kV9q3XbRQ77aJe/PVtlZPB5mrvGgHfPvj+whifMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7JTVConOVPuT9wvmQs1sWqQdECk60FgpVEufx2VbH6WHeo41U
	abysH6ZWJGlzQDYXY/w1K1uAZrzQ2qNPczSMiEAyhWO5KOvaMWvyyZsac5cdWjfk4Btk5mk1xuj
	sm66LN/o85Z4o7DqgaQGazk/Kvvbm8h0=
X-Gm-Gg: AYBFou1t6HcHdNMGifSrPhz9KSa4YcjrzIAzqSkkIJWGmuYqMcC7WgR+mjPzo0z8jPF
	2j1UySwPy18BqrvsdrlfVP/FMfnUNII4k9eJS5z75VdwC3zJaveAP67iTK2PTjtqjmO5N2zcWQo
	1Log6vGuKb6QhnTtINyE2LMkmuWT9RbA6mchsg9V7s+j4i6gkTdO9woxHj3i4Q/lqaEJzSE3a9A
	Qzm7FJZttiJvgHU59P/ARDs0VxIvQH6o+yQoky07KMKJVPeyZQ54RhiXxP7TsjcoAVBi/f1wXwG
	tXrzc7+hof9AcjE29/yup3fLqqvPBSFq1zEtckSjIyKtczaEMFRhxjZmDw0+CPyN3f6rQ69RkDS
	1U9TjNirGKOBgVP3GQkrySpG8SSqFLxv71W9z3zY=
X-Received: by 2002:a05:6000:4553:b0:48a:fb21:57ff with SMTP id
 ffacd0b85a97d-48b126b18a8mr1280078f8f.1.1790904869631; Thu, 01 Oct 2026
 18:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-3-xueyuan.chen21@gmail.com> <arvJbQmr9GwToA8R@willie-the-truck>
In-Reply-To: <arvJbQmr9GwToA8R@willie-the-truck>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Fri, 2 Oct 2026 09:34:17 +0800
X-Gm-Features: AclHuK_utlXfpNApdIg0tCcQS_k28vJDN8Yu8dMba1JX-4Q5uJzs9ebkm6k6FjA
Message-ID: <CA+qSx6zV32EN18S+GjESz-Es+6=Zh-m8U=-UovA=rsoBnLWWww@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] arm64/mm: add set_direct_map_ro()
To: Will Deacon <will@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	rppt@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:21=E2=80=AFPM Will Deacon <will@kernel.org> wrot=
e:
>
> On Tue, Sep 01, 2026 at 11:18:17PM +0800, Xueyuan Chen wrote:
> > Implement set_direct_map_ro() for arm64 and flush the TLB internally.
> >
> > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  arch/arm64/include/asm/set_memory.h |  2 ++
> >  arch/arm64/mm/pageattr.c            | 12 ++++++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/a=
sm/set_memory.h
> > index 0091ba12200e..1be86dc11543 100644
> > --- a/arch/arm64/include/asm/set_memory.h
> > +++ b/arch/arm64/include/asm/set_memory.h
> > @@ -13,6 +13,8 @@ int set_memory_valid(unsigned long addr, int numpages=
, int enable);
> >
> >  int set_direct_map_invalid_noflush(struct page *page, unsigned int num=
pages);
> >  int set_direct_map_default_noflush(struct page *page, unsigned int num=
pages);
> > +int set_direct_map_ro(struct page *page, unsigned int nr);
> > +#define set_direct_map_ro set_direct_map_ro
> >  bool kernel_page_present(struct page *page);
> >
> >  int set_memory_encrypted(unsigned long addr, int numpages);
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index 132938b32eb1..0e95cd904ccb 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -355,6 +355,18 @@ int realm_register_memory_enc_ops(void)
> >       return arm64_mem_crypt_ops_register(&realm_crypt_ops);
> >  }
> >
> > +int set_direct_map_ro(struct page *page, unsigned int nr)
> > +{
> > +     unsigned long addr =3D (unsigned long)page_address(page);
> > +
> > +     if (!can_set_direct_map())
> > +             return 0;
> > +
> > +     return __change_memory_common(addr, PAGE_SIZE * nr,
> > +                                   __pgprot(PTE_RDONLY),
> > +                                   __pgprot(PTE_WRITE));
> > +}
>
> I haven't quite followed whether or not you intend to send a v8
> making set_memory_ro() handle linear addresses, but fwiw the
> implementation you have here at least looks correct to me, so:
>
> Acked-by: Will Deacon <will@kernel.org>

Thanks for taking a look!

>
> Will
