Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E354705E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790563361; cv=pass; b=dmDLfxXcddKbrykDz9IZvlq8Y6ODLpb2xEyvJd+NdW1iwje7I4j71dpjE9rgdILJoWOrSfkMQK9PMBBiBRza/tWACeyYJhut6nRy+wiixcMvepraCeGDJKqaAsh7RDOSUxe5CGEu/eMaqgvFRTfRoMPeYKMie7nWb3F2gR2ERFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790563361; c=relaxed/simple;
	bh=bXqGGGHvRX+DxVfURuCOZN27dzuqLCZs9c/rSc6OWcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcJ+l9Ss5VAfYIhJNjq+05pRFcgVRvkP+yF65l3OmlYRwx/5lEbLp/NKLsZBEaiwdhi9TIqCxPYCxX6ucdeFUA/oi+p8r+5fsd+xyvVx6sAgZ8kVCDgHlOCCcChGYRnww4R2BC9atbz0sdIHYyaziIIGGT6y4VZbKbRP9cyEtmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fA1DmN9t; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA1DmN9t"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so2117309f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790563358; cv=none;
        d=google.com; s=arc-20260327;
        b=h9dDWMLmrrsHK8/C6yVhAW5fneZVnhZR3NaWmFP5y+bdITSHuAgLMKrYhZCQfUUnhi
         /4CjnSxr5qlUEtDUldYwgYAZ3mgDNYsCVMtHr8EWgRe8rnBIyLbwZ8t2/4hdE378kKkq
         M4qsm11HGWjP8mN6RYJC//DEAhMsv2kfqao7rOEfiTMlAvAmT3vvazPpId5+VrNx8Y/u
         M+FQ0nD+9FWo4dcMkrlnLybJ0W0EsdAli0nhnluATUnm5ynMezzwaIKRAR7OpCkcGevF
         BUZDsYfz+4NDgl2y6Be8O7x25Np90o9r3e65+N7ui3ZR1Ayc8PYrn+qKyy+7e4nYmLq7
         Aa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YZjJVun8xN7GDkHYEL3bXr/VlWpA2YfoNARMcoM9xVw=;
        fh=U7XioR7oegYtIRPkbXGhDU5r8kYPiqByrpQWT4G9paU=;
        b=rHxwKR9V0ZUnCEURtb8q/agxYUwY5G+EO7Vxc1Pff8rvy3OxgC/30YYOFC4cPhNeFo
         egbyqw/IaiEHQpM2f/YijmcxdstM/364SlbbH6opkO2YPdi97D94FYupNg9e+JrjPdPv
         XW9LZkNG0EXlqi+bRDYnRSO9/vi00o4gwH3qtnLT1Lw3OAfCC70J6zyM47ol0xAMhj03
         HCtNMf4FYtuBXRCjNVZom6zY3tRqsbLoEKPfOQvLpbxXd+ISoDDRF+lIznh6ItFaQ6MC
         S2GyUuWywLslg3Jp4gYRoxNSpOOl0V5Dck20qK349OdQ8ffPJccU3nRIwkNy8LXofMsj
         HxEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790563358; x=1791168158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZjJVun8xN7GDkHYEL3bXr/VlWpA2YfoNARMcoM9xVw=;
        b=fA1DmN9tfr8+fR4X5OT7c0dJELozpc9ekg7gIU6+yoo9zLw2ubj5dJOpnjwjXsnAJq
         sSFmr2LQfJqrg0c7ahyPvsf4Vdr+VlYyUrQq0PppRcWyToTYpLrXerR6SSs934kaYGwJ
         85TNctz0JxTzyMPeL9jrfQ1liQDzPydxrCb/602B/1UtavnwaIiltdzXJ/rviPvDEVRk
         IZIX+dvGyWdse7gEwEne0aCrAXM6Y4rXLGJXed34kZkWuz3kK+B5/b1QmatRg26pFC1t
         1LE05y/usvC3+iZClX2AclmnaslzpV4a4p22bL7As9e4Zvu40zlr7vQP4tUT5dVi/Udg
         uCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790563358; x=1791168158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZjJVun8xN7GDkHYEL3bXr/VlWpA2YfoNARMcoM9xVw=;
        b=v3KrO26EvSd7M3YKDZVItAYcpxg9fA8FoqeZb/HUGTLU4k/evOJvdalziTBy5/Wp7I
         qK+3kQsFB29IcL2STCD9bRfz1R9ueZMsLG/Xjf816oA1jQNh90o3tnype05YyCVVzzWT
         UHZLfXfcloKgtSGa+CXsBCJqwbZ9fAiqbNMT4xtmaEbj0eaqu4y9b9oc2OrK1RziwKAQ
         b3prDmnS4z+4EqLTPNisaP9KY/3H523N+XEIEWIyStBB/6CLuTAzj1yZCPxdu0mYiWC3
         fdOeoGb0yVKuYJMCG89GvDQJiy07Sh91OPnaHtSHjsIYYv8wLGQPKIGk9/ScPOovRcxx
         7gAA==
X-Forwarded-Encrypted: i=1; AKwUvByMv+g5b3ToJBQ3GcCJoCBaRXTADgU0K+/VoStRMlkKSVQ2Zw6CVjcfX0Warv9/tNnlOd+soc1vLx1fSvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe1ziaE8AlRcPAbRHCKG3wa8fXqY56dxzCNW2N2eb8JYf2epMr
	rHFwkWTXnwlYK3De0Y67OOatlGsfM01EfeOk1//mftrDSuFULHs63Z+qhZ81YUjFU/bv74gIOE7
	FWooFIWNCmQoyqEVC7MU3VXrg230WWCI=
X-Gm-Gg: AYBFou2XSkK1qE1+Z1KsL6Tp75/Re3iajOtm+IMU1fvuQ334NlzWqoyIwBMxk/+uS84
	N6g22zCVx14h+IevWmO+tEkTCXQvLKrK1qEyvLLauydbJkCzQE06LyYWQOsNKbvls6+bkbRikmZ
	J3nc27eybWBfq91gQan3JXjw11XT7v4F/U5ZxbM7DPHw6vJMN9ALmT+SfUhIIZgU6geIfEaGd8s
	0wRlVl/KXQtTIKCl3Sv+QTaIELVo0Mzvr8YaNEWYoBQBY1db6JTEissWSdfCDBWzsHPx9hwAKdN
	JODBbbmNixTmD6JK6oQdf3KCj5yt1vc8vrsZ17bCLG0wQyS/ogqqrQdW
X-Received: by 2002:a05:6000:385:b0:488:8cde:aaf5 with SMTP id
 ffacd0b85a97d-4888cdead77mr6051154f8f.2.1790563357707; Sun, 27 Sep 2026
 19:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-2-jiangwen6@xiaomi.com>
 <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4xQhmRigaV_2G3pdOgk5mvC6HNzqCyUdRY3RSG8-QNC-Q@mail.gmail.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 28 Sep 2026 10:42:26 +0800
X-Gm-Features: AclHuK-tj6RxDkR8fHhPZoG4i4S4CyEDCcJlFwKY4ZUdtlHJk_F2XqaylhywMI4
Message-ID: <CAHKocdFUw3BDjKwGhE+gMxyVXmMWtX4pP8brY3dBOhYhYoCgdg@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Sept 2026 at 05:30, Barry Song <baohua@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 2:28=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.c=
om> wrote:
> >
> > vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> > set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> > helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> > unavailable on CONFIG_HUGETLB_PAGE=3Dn kernels and couples mm/vmalloc.c=
 to
> > HugeTLB internals it does not otherwise need.
> >
> > Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> > pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> > __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> > depend on CONFIG_HUGETLB_PAGE.
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>
> LGTM. Please see the comment below.
>
> Reviewed-by: Barry Song <baohua@kernel.org>
>
> [...]
>
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +                 pgprot_t prot, unsigned long size)
> > +{
> > +       unsigned long pfn =3D __phys_to_pfn(phys);
> > +       pte_t pte =3D pte_mkcont(pfn_pte(pfn, prot));
> > +       unsigned int nr =3D size >> PAGE_SHIFT;
> > +
> > +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> > +       VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> > +       VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> > +
> > +       __set_ptes(&init_mm, addr, ptep, pte, nr);
>
> You have patch 4 to revert the `clear_flush()` modification from
> 06fc959fcff ("arm64/mm: Support huge pte-mapped pages in vmap").
>
> I guess you may still need to guard against the case I mentioned in my
> reply to patch 4:
> https://lore.kernel.org/linux-mm/CAGsJ_4xiLScr2PrPu7Eem73GvPCtsuYd3J05kW3=
SC4QSs5Q4aQ@mail.gmail.com/
>
> Something like this:
> VM_WARN_ON (pte_valid(__ptep_get(ptep)));
>

Hi Barry,

Agreed. I'll add this. The vmap path should never see a valid=E2=86=92valid=
 transition,
but an explicit assert makes that contract visible.

Thanks,
Wen.
