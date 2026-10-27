Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793069877;
	b=ghkt+wpLC5mWYZkSpjWk5WI6x/a1ra3W/eHAPlzPZdgKrPhv4TIJKzdGxQoAAgZr85rz
	 O80wNgSZ5R+DwTxTPFRb4SWp5CrZt6M54q2BEGV26mlVGh/462a4bj25gUGFA8MYpr747
	 qE7VTbsa4tOOEIfoMpL0HjcaZ75IyVkIZLkD5FPYby3hElGplNwqYAGOtYvcHumC9FacU
	 d/47qp0p1weD5S1h6z+MmS/Z/Xnpq2+23R9BY33h+qEyJk1nZrP5Uzzi+6sTWz8kkQj/b
	 PZycp71GBmI5VEZtN7lJs1iLLC1qFGWJgj8BDZFZ1GYD2F1znscfEWN7EA49xZ7Z6+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
	b=oXcYUcu4zJwSFEBNHKLVqj5+UF4y1Kj+FSRibCAsY/fYwYCj2I3mgWKUP0VibeJmmU2a
	 4ecvsd7vLjCcRH0ZusD10+gMSQmfVPbdji7oeeMv8b30yJErmi7Rp/6sLRRAE9/uzK3hc
	 zFpuAETe5bI7h/XhN12Hejq5mS7qvqkxexE4t3WeVtAyNMGhhS5Z8oaZ051kP1IIZGcSY
	 juYY+qLa7DtfY/lMYDmT5e6nw34X6KDoSooRX+uakG8Ty6SU8jdU46ExyFPkU4bBDnuyx
	 NH5jYa8BwpI88b7Mh9sm9riP2b6pL4Vfd87fARgKxaBjwBkDUPbcWYDFkoGv62ohbPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ljZUanrR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A113C606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A113C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ljZUanrR
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533202fe429so180441cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793069875; cv=none;
        d=google.com; s=arc-20260327;
        b=j1TLHYsGtZigEAoEuOEf9/W951REs33ywcm+GpSQzs+fJlC88QQtdXiDtwNBcwEtVa
         p2Val3WRc3H/3mn967huBdeXUE3ORCn+YUysBIdJkcVsFLZE2a3bG6/j9nFYSbBXQT8Q
         ZBSb39teDT7nIR3x8A2mKIy6zSyEqQJhhaBVrPMrWCsu54czeytL6T43oqXtOdmfz9On
         L0kmo/CMnzxrnnPhrYkQxmctnCz/xXV1hRJZJQ7nMmvDrUNO0I9oxqlpA5B+zY+Mc884
         uYPIkUi01rTn01w1swIMKFzua1o/ZaXwXd/ckHPmxpo4q/W6Mf/aDNDRpoXRzZjMQ7PL
         L0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        fh=ukwxd+Aenw2sdsdBDxih5C/LPMLvLKnoBGB0LQd5spI=;
        b=ABBnRxVdCv9tKdqZTFoM5b8Yc7IzI/EJZo4wfr+idYqE4pU7P1zuoohckyS6wsXau2
         bRVzY5kjqkETDooNcbCqB3UMSnc9QhEsSlHLw89HhhbcAJb6HTbr3BcoehTAVYXEzejz
         G6XuEUCBqhPKdEAHPVFV/QaY13SLjRl6klZCz92buG227XCV9VC9r1tFOvypl5EDMTg8
         DQpxzZl7PyoAkGXd99aR0FQHLN6Nz0RZylfWrxj8mn3R9Dnq2E5/lslsfJ6xjJrcxV96
         0xlhhwQ1JvVNKwJcR/XQ15y+aYd0f80ThiK7i8GHgo0TrST7OK/Q/lg/AEzYK0UJP855
         yqwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793069875; x=1793674675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        b=ljZUanrRb8gkmOH2/U/8OjqJFNLu56Bje1DpH4gOD78/Qgf0gWOk7Jtdo88IL22Xh/
         CMyr34eaOOPZKgNkdaOo4dLZfCx592RdOdzPbz0CxRllc2Km7oKvrY8b614n1Di9uCR2
         g95UDw+uQ4plCN6597Ehzhv0MrAE0pch9swGLp9phi493Qi/pOs5x3ejtBYafi1NSYXF
         ydMOVjxbzZfWKfhnadYZ7MbT5VDVrHVQ9y6/YqRCXz54tACS88pLqGFTz/+ZeKoLpAoq
         Q5cKEK1MC2zA4YlWi8VqxznACU56nP4fj2qviutRx98DfAmFnictzpYqA5sYh+tz9cVM
         Cnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069875; x=1793674675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veWNjOyx0q2aoHvEbX2sAz0cuq6dhXLamwz9eTavWpQ=;
        b=lHbLtWCARwH3B/IHaoflnESmnem8s1Y/NQNBko74MISpVK8aUV53lZpxSs0yoTDgbs
         REFnnCUppePpWrIjFMZY+75ptDqcmBygFFMi/Td6FgpvL1zttsEG6KnyUE6c9SYfm5TZ
         5NRL8tf0KdsNRwDE7t6tL1vI5K4ygPoZhvDbcBzmUsljWMqQfXsTlVLzS9dOgG8ZLOhy
         v3JkMbMzzYaTnB2jp24HXrENza6neunh7LeGFLnGILoqfTfnaSDw0dnnM5Z21Rmke1xs
         xJmKvo36ldDAyIaqAOAckDOZQ+sZH1Cjf6GWlMwUpXMaf0ULPn+XzThMCnuUe/1ZZZ8A
         qLBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjvklID9Mb6dSWxm02mnM3Ayi8RmuTpoLqLQsXRK9MEOb8QPhCNYzSxna1dOzuJkzu0gbhn5NahxrrwSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYImmf4Np+GOnJB24761xn6cBnzX4G3Hy4pNDQc1g3GZQUwYH+F3
	Ocs/zWhvmcQA1xuu2RX3JA8gw9NfNoaheUEDeEHxMUO53Oq/f2pNXhEfnDE/u144fzvhDb0a0Vl
	gr8m7S2li1z8mto/MphlEq9EbWdc7ADG+nAXnaPmX
X-Gm-Gg: AYBFou21lKdOKojw9/nQlgybiJR//OaA2cO/Q6B2Nqfc9KGQ1SI8RbRJbYY0gVNnelz
	bfIWi0UbC5pqhJsvQbH6v9lTHodU43LJtjx9e/VrYdEh9kvZ+u84g0H1X0a0awK855X5ZK4lu8c
	zHDPu+ReIKcOk1DdovsrTAXmvVuBCNWwLRa3Les9cU83Wy14VFBGWt42qZcOvtjp+8X7eN5G8MN
	dhkj0qX9YmzB+8dtz2gviVEuRI727OGHTa9vjw6RzsTzgPCJfKeUE57t1a23IjslmIinG9xRmRS
	cRWvFAT3iAqzsf3cY8VT8n+4/2pp1ZhhU0cr6fW3bPJlZprYyTv+aOMHlcpbQX+th0vS1oICfsD
	QsICG0aTWT7COVU1ErZkjdQq0gN6rcmFBM5Y9
X-Received: by 2002:ac8:5cd0:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53e74f18ea0mr8347351cf.8.1793069874720; Mon, 26 Oct 2026
 19:57:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin> <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin> <armexcXDiG8ryZd6@casper.infradead.org>
 <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
 <ar7MsOb6IJLt4eLo@casper.infradead.org> <ar-o1TrOMGrrcxLX@gremlin>
 <ataDTEZIKOYtwhUF@casper.infradead.org> <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
In-Reply-To: <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 26 Oct 2026 19:57:43 -0700
X-Gm-Features: AclHuK_KCyZzsUIRPigLpRqw3YeQAHnl6JHTenlWoPcunSyUcxCZShOICs2gDrI
Message-ID: <CAJuCfpH6o1NAN_4W6VY6o3unxr9V+YCNFiLS8oCg7giWRLz8_g@mail.gmail.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
To: Matthew Wilcox <willy@infradead.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@kernel.org, liam@infradead.org, 
	mhocko@suse.com, rppt@kernel.org, shakeel.butt@linux.dev, vbabka@kernel.org, 
	zhaonanzhe@xiaomi.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, linux-s390@vger.kernel.org, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, Hongru Zhang <zhanghongru@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 7:39=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Oct 19, 2026 at 1:53=E2=80=AFPM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Fri, Oct 02, 2026 at 02:12:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Thu, Oct 01, 2026 at 10:12:16PM +0100, Matthew Wilcox wrote:
> > > > So what I didn't realise is that fork() waits for page faults to fi=
nish.
> > > > I don't think that's necessary, so we can just stop doing that (whi=
tespace
> > > > damaged):
> > > > I think this is safe.  I've booted a kernel with this change, and
> > >
> > > I'm afraid it's not safe :)
> > >
> > > We already actually did this (by mistake I think?) before. See commit
> > > fb49c455323f ("fork: lock VMAs of the parent process when forking") -=
 we shipped
> > > that in 6.4.0 -> 6.4.2 and it corrupted memory all over the place.
> > >
> > > Reports + a consistent reproducer:
> > >
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
> > > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kern=
el.org/
> > > https://lore.kernel.org/all/b198d649-f4bf-b971-31d0-e8433ec2a34c@appl=
ied-asynchrony.com/
> >
> > I wonder if we still need this.  The commit message says:
> >
> >     A concurrent page fault on a page newly marked read-only by the pag=
e
> >     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on th=
e
> >     source vma, defeating the anon_vma_clone() that wasn't done because=
 the
> >     parent vma originally didn't have an anon_vma, but we now might end=
 up
> >     copying a pte entry for a page that has one.
> >
> > But we're holding the mmap_lock for write here, and we need to hold the
> > mmap_lock for read in order to change a vma->anon_vma (asserted in
> > __anon_vma_prepare() with mmap_assert_locked()).
> >
> > At the time of this commit, lock_vma_under_rcu() contained:
> >
> >         /* find_mergeable_anon_vma uses adjacent vmas which are not loc=
ked */
> >         if (!vma->anon_vma && !vma_is_tcp(vma))
> >                 goto inval;
> >
> > so we really did have to wait for read holders to finish the fault.
> > But commit a373baed5a9d deferred the check for a NULL anon VMA until we
> > actually needed it, so I think commit fb49c455323f's logic was invalida=
ted
> > by a373baed5a9d.
> >
> > Maybe I'm wrong.  This is all a bit out of my normal area.
> >
> > > Also we have asserts for this lock in copy_page_range() and
> > > copy_hugetlb_page_range() which will now fail (and possibly more furt=
her down
> > > the stack?)
> >
> > Possibly we have to adjust some assertions to check that either we have
> > the VMA locked or we have the MM write locked.  That doesn't seem
> > unreasonable.
> >
> > > > My argument for why it's safe is that a thread which takes a page
> > > > fault during fork() might have taken the page fault either before o=
r
> > > > after fork().  The faults will definitely happen in the parent proc=
ess.
> > > > They may or may not have happened in the child process, which can't
> > > > possibly care whether or not they've happened.
> > >
> > > The problem isn't the child it's the parent - copy_page_range() _modi=
fies_ the
> > > _parent_'s page tables in-place, on assumption that nothing else can =
access
> > > them (for CoW).
> >
> > I was perhaps unclear.  What I mean is that the child may or may not
> > observe them as having happened.
> >
> > > And actually nowadays things are _even_ worse, you could also have co=
ncurrent
> > > page faults, MADV_DONTNEED, MADV_FREE, MADV_GUARD_INSTALL/REMOVE, UFF=
DIO_COPY +
> > > UFFDIO_MOVE (yikes) all of which might introduce new issues + would h=
ave to be
> > > audited too.
> >
> > Yup.
> >
> > > So - it turns out a lot of stuff implicitly assumes VMA write lock no=
w:
> > >
> > > 1. CoW - deferred TLB flush race
> > >
> > > (The issue above)
> > >
> > > https://lore.kernel.org/all/20230705171213.2843068-2-surenb@google.co=
m/
> > >
> > > This happens because __copy_present_ptes() does wrprotect_ptes() on t=
he parent
> > > without a TLB flush (that's deferred until the end of the fork).
> > >
> > > But unfortunately without a VMA write lock something can then replace=
 the page
> > > table entry in the meantime and you can end up with data loss as a re=
sult.
> >
> > Is it that fb49c455323f commit message is insufficient and we need to
> > prevent simultaneous fork/page fault for other reasons, then?
>
> Yes, I think so. It refers to one of the reasons VMA lock is needed
> during fork, but as Lorenzo points out, there are a number of other
> reasons that require fork to protect VMAs. Note that some of those
> reasons, like MADV_GUARD_INSTALL and UFFDIO_MOVE did not exist at the
> time fb49c455323f was written.

I also have to agree with Lorenzo that allowing fork to run
concurrently with page faults might only shift the mmap_lock
contention from fork to some other operation (mmap/mprotect/etc.), so
even if we fix all these cases we might end up with contention
somewhere else.

>
> Below is the list that AI pointed out, and I think Lorenzo covered
> most if not all of them:
>
> Without vma_start_write_killable(mpnt):
>       1. In-flight VMA readers that locked mpnt before
> mmap_write_lock_killable(oldmm) continue running concurrently with
> dup_mmap().
>       2. New VMA readers (page faults via lock_vma_under_rcu(),
> madvise under MADVISE_VMA_READ_LOCK, userfaultfd via uffd_lock_vma() /
> uffd_move_lock(), vma_start_read_unlocked(), etc.) continue to succeed
> on mpnt while dup_mmap() duplicates its VMA metadata and page tables.
>
>   (Note: When this lock was originally added in fb49c455323f, one
> prominent trigger was a concurrent fault calling anon_vma_prepare() on
> a VMA with mpnt->anon_vma =3D=3D NULL while anon_vma_fork() /
> vma_needs_copy() ran. Although __vmf_anon_prepare() now requires
> mmap_read_trylock()
>   when !vma->anon_vma, removing vma_start_write_killable(mpnt) today
> still breaks several critical invariants.)
>   =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>   ### What would happen if we removed it
>
>   1. **Destruction of live 2MB THP mappings ("bad pmd" -> pmd_clear())
> in copy_pmd_range()**
>   As noted in the comment in copy_pte_range(), copy_pmd_range()
> assumes no concurrent THP transitions on src_pmd:
>     if (pmd_is_huge(*src_pmd)) { ... }
>     if (pmd_none_or_clear_bad(src_pmd))
>         continue;
>   On an anonymous VMA that already has mpnt->anon_vma !=3D NULL, a
> concurrent per-VMA-locked THP fault (do_huge_pmd_anonymous_page()) or
> UFFDIO_MOVE can install a transparent huge PMD into *src_pmd right
> after pmd_is_huge(*src_pmd) observed pmd_none.
> pmd_none_or_clear_bad(src_pmd)
>   then sees pmd_bad(*src_pmd) =3D=3D true (a THP leaf PMD satisfies
> pmd_bad()), prints "bad pmd ...", and calls pmd_clear_bad(src_pmd) =E2=80=
=94
> wiping out the parent's live 2MB PMD without PTL, TLB flush, or
> rmap/refcount/deposited-pgtable/RSS cleanup (corrupting parent memory
> and
>   triggering Bad rss-counter / nr_ptes bugs on exit).
>       =E2=80=A2 The same race exists for huge PUDs in copy_pud_range()
> (pud_none_or_clear_bad(src_pud)).
>       =E2=80=A2 Similarly, copy_huge_pmd() reads special huge PMDs
> (VM_PFNMAP/VM_MIXEDMAP) locklessly and skips rechecking *src_pmd under
> src_ptl assuming it cannot change, so a concurrent MADV_DONTNEED under
> MADVISE_VMA_READ_LOCK could leave the child mapping a stale/zapped PFN
> PMD.
>   2. **Silent CoW data corruption / lost parent writes due to deferred
> flush_tlb_mm(oldmm)**
>   __copy_present_ptes(), copy_huge_pmd(), and
> copy_hugetlb_page_range() write-protect parent PTEs/PMDs without
> flushing TLBs; dup_mmap() defers the flush to flush_tlb_mm(oldmm)
> after all VMAs are copied. Normally, because each copied VMA remains
> VMA-write-locked until
>   mmap_write_unlock(oldmm), no parent thread can handle a CoW write
> fault before flush_tlb_mm(oldmm) finishes.
>   Without the VMA write lock, while CPU 0 is still in dup_mmap()
> copying later VMAs:
>       =E2=80=A2 CPU 1 (parent thread A) still holds a stale writable TLB =
entry
> to old_folio (now CoW-shared with the child).
>       =E2=80=A2 CPU 2 (parent thread B, no cached TLB entry) writes to th=
e
> same page, faults on the R/O PTE under per-VMA read lock, enters
> wp_page_copy(), and copies old_folio into new_folio
> (__wp_page_copy_user()) before taking PTL and calling
> ptep_clear_flush().
>       =E2=80=A2 Any store by CPU 1 through its stale writable TLB entry a=
fter
> __wp_page_copy_user() and before ptep_clear_flush() lands directly in
> old_folio while pte_same() still succeeds =E2=80=94 losing thread A's wri=
te in
> the parent (new_folio) and leaking it into the child (old_folio).
>   3. Broken guard-page (MADV_GUARD_INSTALL) state and KCSAN race on vm_fl=
ags
>   madvise(MADV_GUARD_INSTALL) runs under MADVISE_VMA_READ_LOCK and
> atomically sets VMA_MAYBE_GUARD_BIT on mpnt via vma_set_atomic_flag()
> before installing PTE_MARKER_GUARD entries:
>       =E2=80=A2 vm_area_dup(mpnt) asserts
> ASSERT_EXCLUSIVE_WRITER(orig->vm_flags), which would trip under KCSAN.
>       =E2=80=A2 If vm_area_dup(mpnt) copies mpnt->vm_flags just before
> MADV_GUARD_INSTALL sets VMA_MAYBE_GUARD_BIT and installs
> PTE_MARKER_GUARD PTEs:
>           =E2=80=A2 On a file-backed VMA without anon_vma, tmp misses
> VM_MAYBE_GUARD (part of VM_COPY_ON_FORK), so vma_needs_copy() returns
> false and drops the guard regions in the child.
>           =E2=80=A2 On a VMA with anon_vma !=3D NULL, copy_page_range() c=
opies
> the PTE_MARKER_GUARD entries into tmp, leaving the child VMA with
> guard PTE markers without VM_MAYBE_GUARD set (breaking collapse checks
> such as file_backed_vma_is_retractable() and future merges/forks).
>
>   4. Inconsistent address-space snapshots against UFFDIO_MOVE and
> tcp_zerocopy_receive()
>       =E2=80=A2 When UFFD_FEATURE_EVENT_FORK is not enabled, dup_userfaul=
tfd()
> never increments octx->mmap_changing. Because move_pages()
> (UFFDIO_MOVE) only takes per-VMA read locks (uffd_move_lock()), it
> could move an exclusive folio from a not-yet-copied src address/VMA
> into an
>       already-copied dst address/VMA (losing the page at both
> addresses in the child), or move a zero page from an already-copied
> src to a not-yet-copied dst (duplicating it at both). Even with
> UFFD_FEATURE_EVENT_FORK, octx->mmap_changing is only incremented once
> dup_mmap()
>       reaches the first VMA using octx, so earlier non-uffd VMAs rely
> on VMA write-locking to prevent cross-VMA moves.
>       =E2=80=A2 tcp_mmap() sets VM_MIXEDMAP (in VM_COPY_ON_FORK, without
> VM_DONTCOPY), so copy_page_range() would race with
> tcp_zerocopy_receive() zapping and inserting pages under
> vma_start_read_unlocked().
>   5. Immediate debug assertions (CONFIG_DEBUG_VM)
>   Both copy_page_range() and copy_hugetlb_page_range() call
> vma_assert_write_locked(src_vma) on every CoW VMA, which immediately
> fires VM_WARN_ON_ONCE_VMA(!__is_vma_write_locked(vma), vma) because
> oldmm->mm_lock_seq was bumped by mmap_write_lock_killable(oldmm) while
> mpnt-
>   =EF=BF=BA>vm_lock_seq was never updated.
>
> >
> > > Same issue exists with hugetlb wp too. And god only knows with uffd w=
p :)
> > >
> > > 2. THP - can destroy parent THP mappings
> > >
> > > copy_pmd_range() does:
> > >
> > >       if (pmd_is_huge(*src_pmd)) { copy_huge_pmd(); ... }
> > >       if (pmd_none_or_clear_bad(src_pmd))
> > >               continue;
> > >
> > > Without the write lock, a concurrent fault can install a huge PMD via
> > > do_huge_pmd_anonymous_page() or filemap_map_pmd()/do_set_pmd().
> > >
> > > The issue is that pmd_bad() fires for leaf PMD (ugh) on at least x86 =
and arm64,
> > > meaning that'll clear the page table entry.
> > >
> > > I think Hugh left a comment alluding to this before:
> > >
> > >        * copy_pmd_range()'s prior pmd_none_or_clear_bad(src_pmd), and=
 the
> > >        * error handling here, assume that exclusive mmap_lock on dst =
and src
> > >        * protects anon from unexpected THP transitions; ...
> > >
> > > It's like the mess around pmd_trans_unstable() :(
> >
> > ... could we fix this by taking the ptlock during the copy operation?
> >
> > > 3. copy_pte_range() skips the required pmd_same() recheck assuming wr=
ite lock
> > >
> > > It uses pte_offset_map_rw_nolock() with a dummy pmdval and:
> > >
> > >        * We already hold the exclusive mmap_lock, the copy_pte_range(=
) and
> > >        * retract_page_tables() are using vma->anon_vma to be exclusiv=
e, so
> > >        * the PTE page is stable, and there is no need to get pmdval a=
nd do
> > >        * pmd_same() check.
> > >
> > > (Probably needs updating for VMA write lock...)
> > >
> > > 4. The asserts
> > >
> > > Mentioned above!
> > >
> > > I suspect there's more as well.
> > >
> > > Some of it could be changed, but it'd all be at the cost of behaving =
very
> > > strangely (no VMA lock but mmap write lock) while manipulating things=
.
> > >
> > > And I am not really happy with changing page table entries in the par=
ent VMA
> > > (for CoW) without a VMA write lock held.
> > >
> > > I also wonder whether it would achieve all that much really - the iss=
ue is with
> > > holding the VMA lock across I/O, anything else that tries to grab a w=
rite lock
> > > is going to end up being the new thing that's blocked (mprotect, munm=
ap, mremap,
> > > mlock etc.)
> > >
> > > I think doing something like this would need a very significant redes=
ign and I'm
> > > not convinced it's one that really achieves what we want given all th=
e other
> > > cases that'd get blocked by the VMA lock being held still.
> > >
> > > --
> > > Cheers, Lorenzo
