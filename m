Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793068810;
	b=fBLSVe06C14AjFYtQr5p98i9ftdyRozmcW6/gijc6SwUUF8unl9kjjvWtyFMqwYBOOiR
	 tKRR6cYBSXl9a9z7t7FnnVc2H0aXrAc0B+BSFtGpY5lVp8bMkTlsDi28Ege7IfU0aIB2t
	 pEc0KysTCPyoVc/vYQPaN9RhnHwygR1hdPll6d2wChx+jTavSPuKGhp54zGuehB2VgUWp
	 SrzDX7BwUAbBt1zyWnuLWWZnrNN/RNkt5OddOSFXMxaXwg+2Be7xR4dAYiGKcW1s4xnSW
	 /oLVkcJLcDT12gKZx9HyYjR12jBoLMghme4gtKrxgGaVHu/cJao2WQDQT+zV0tfj/aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=;
	b=JFwPKocm1M4+wyG1LiiYnG+7n0xN8/n5lvo0eiWVWiMNSH4LVLVQ2kqjdpWiNom8Nv+0
	 Q4OmsrR6u6MGHCMXjwGowObNcOANeV8rGZg2So+7i2GZuXVKbZF9BrhbyNv0NhwScxyRW
	 5Kht9xHylb0LgrCERJgp/E2VlXlazveD3XdVJRGfj3E0pu33EHUWbQrTYg7ko6n8MjM0n
	 /uohc8q01QQLeGOTrDClUCnHVeY632kl26Al22BgiJv9HIghHE6xy5Q90g+3l6DWUrgrN
	 WMN6EdAUB3vJH0ahBKLOFZWb0rsdlI8P6ROGd5cMc7GPx7a6azyruqapxYMM93+aKlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=E37S1U3h;
	arc=fail smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11D9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=E37S1U3h
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533202fe429so173901cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793068809; cv=none;
        d=google.com; s=arc-20260327;
        b=gqJVTPQ58CTIAoo47Ou5hdA4Uo/M5Kb04Y20gKzJTiMNfXP/XQ62GNukBkCuKO1OLd
         a7/KG+mwl5PwVfPjXKaD9GzOc84PYRiuhJsr5Q5On1J2tXV/XewLcW+zVscvllhKYEje
         jNnad2KydaLrqUpe4jVc2VdZWdko8T0CS8PFWfuZQiNPTRyfHSSja3Z0F/lnbJ7Led4B
         AleA1w8p8kta1fhACt93ZAVYjUVtX+Kg/wMj5Es6i52A3Wd19aGwPTLzG5hWPhaiixCD
         /bKmiRPK99d1bxJW0CAB5PoSriCDH3R4Fw81GfS2xiYjUXCfQj/qowYje8LGlAzLopZT
         Wl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=;
        fh=x4uqOo2kO1JOHv9/ryCnIIh9adJifa8S6VKLiJNPl7U=;
        b=nHkZyxJkCDvVnzavToeLVRQZ+GUPg2ZAgrYcZOnhN3DYCSqQrvrK0hNUMSfHRgev/z
         3aGQIPasJxzYhHEKZEH0JZpxX0Mmcbs4Cm5M445sUbDIAgNOnNsCNmYVGefzV1n+8Fbn
         2cI+iI2O9jWxp4M+Q2KbqcYotGFaEqE5u8AuDbmjG7+0kbXSfvN1VhSiGH1ZCeSRXLDL
         Ij6Pr3oN7HfzPrj7hIz8puDhGhqNVOVNfGn4NldqYx0xJDze2SiHSvWHeY3D7lRoD/Zi
         dmYF2QOuWU3Ap3/S4GDOAemfk+piQKyP78wJcDXAmHqkKuWPbJAuHIcUzk1lGRR8+xXH
         yCvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793068809; x=1793673609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=;
        b=E37S1U3hx3tJITinVO7rKKHEz2HxO1YCfC9V27gQP+KS7Y/kg6PphfsksNmDj4u89R
         kdrFpiNm/tvGp4mDULn6J4ga/+Asw+7vyCJzHevjtob8vaWMAKNkRgsSQf2sK0QypL+G
         chajq0CUiAUm7k5k7EWMqQlxwFprZVHEyvdJ5c3LiF5QNiO/0GKXarUZLmI1mXCsvJdU
         nZ/RgF9lUgUCvhxFCCNKuBSxYcgcfCl0lwhLFJWJXDsWGAkCdvntcvui90bExWhTepGL
         JJNhepvzp3R6nmgXwFdu08DT8PiWd6STRrbbGOnKBagubO/pjuJyFYQWVP+jd9Kpps18
         7TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068809; x=1793673609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqs34zcQCNfaKeG0W4YG4prKIZumwiPNl9JfXSdONU0=;
        b=PGtuddo8L5qHjUDwFPKy8nl8E2A3NT7Em/uxfSJjPkkcdwEfu++tcsvgkVpb+cATeN
         6tZoFotgCYIyhztebXnmPw6T82epj1y2cf1nGQKMpbChzTK8YGjaxXXRXKgCTqVVb7TX
         Cm8j75nfte+RSk2q424WFkTqbbT8eU58toT8ZxXyZb3eH3ReMWD4l11hdYkb+lmChXOM
         Wxt6BqtEDS0lJvT+SA6tx8aHgHPYEkR0Pa8qhHmeaC0oSfpXFLTULcLtE0cvKeMRLYbT
         mbpj+wKwZjXwVL4KD69tbCV4On9NurDpT6s4apcICdOTTD+mzbVdr8fjhJbpA1O2eJY1
         B3KQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyAw7P2d+PaYe8tyEeNCvWfaQJzExZ1PKl3UZ8mPJTF97ifMWaNfQLOPz17K8z9xDm63jVyVImQqmudlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCv62qFVr28gYLMsQ1lyIEH1ggNjh6HkUr4xGnJW1pYRA5ttU0
	smsi7k3uX3AdZ/1LNOxf7tTbnV5Qr3+d4UYCeBgfyaYm7h6iC8oMC3HFBgWGqu9+YShDqU1lI1J
	P0hLniHwHcYEo7M70Oc+HOAaRl5UhFrj8yyVeLehh
X-Gm-Gg: AYBFou1xoEzvW+q5DJJ5JqxhusxFaHdSNBVFztWfCE3GrZy6CsuaQ/z/HCPr/+oS1DP
	1Nxwrpi80mTmkQatKkXmqKK7shfZ0tBLM/xyHvSTDV/P3H+6ttNC3O4o8YwvyRhguoLXPIp+Qs/
	Ys58vqxUxnm4KvYnC4vqzeMwFAp/Q5s1opup+4qoV7Gk4RoZIDNPR4XZul6L+00+lFrtl17sXQG
	OuN17idUEGYA14IJk2tPljOIlHt7+TsUz1LOJZWF9yWwxVMYqwGSVdjYEo5Z6rWsIoyamvbLiiH
	gl8+f+DLcZoHNdawxlfu9gmKF28F0zA1yTzHa8MeWJEUtez8orsCmUEChJVBZLis1FE+0aEwVw6
	6ghQyrxWGgYxHpjIiuwYOQgjvRUIGLiLet3s=
X-Received: by 2002:ac8:5cd0:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53e74f18ea0mr8104501cf.8.1793068808195; Mon, 26 Oct 2026
 19:40:08 -0700 (PDT)
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
 <ar7MsOb6IJLt4eLo@casper.infradead.org> <ar-o1TrOMGrrcxLX@gremlin> <ataDTEZIKOYtwhUF@casper.infradead.org>
In-Reply-To: <ataDTEZIKOYtwhUF@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 26 Oct 2026 19:39:57 -0700
X-Gm-Features: AclHuK_tjvOAxlKicwQpIP5-vlb-UBKyvjNqAPJfVeuqkSwvVjNbbsDgO4TDlgk
Message-ID: <CAJuCfpH88HGXyLzBr6YGxzTrOq18HaPcRvhN9RwEBxG_ptv7KQ@mail.gmail.com>
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

On Mon, Oct 19, 2026 at 1:53=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Oct 02, 2026 at 02:12:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Oct 01, 2026 at 10:12:16PM +0100, Matthew Wilcox wrote:
> > > So what I didn't realise is that fork() waits for page faults to fini=
sh.
> > > I don't think that's necessary, so we can just stop doing that (white=
space
> > > damaged):
> > > I think this is safe.  I've booted a kernel with this change, and
> >
> > I'm afraid it's not safe :)
> >
> > We already actually did this (by mistake I think?) before. See commit
> > fb49c455323f ("fork: lock VMAs of the parent process when forking") - w=
e shipped
> > that in 6.4.0 -> 6.4.2 and it corrupted memory all over the place.
> >
> > Reports + a consistent reproducer:
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624
> > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel=
.org/
> > https://lore.kernel.org/all/b198d649-f4bf-b971-31d0-e8433ec2a34c@applie=
d-asynchrony.com/
>
> I wonder if we still need this.  The commit message says:
>
>     A concurrent page fault on a page newly marked read-only by the page
>     copy might trigger wp_page_copy() and a anon_vma_prepare(vma) on the
>     source vma, defeating the anon_vma_clone() that wasn't done because t=
he
>     parent vma originally didn't have an anon_vma, but we now might end u=
p
>     copying a pte entry for a page that has one.
>
> But we're holding the mmap_lock for write here, and we need to hold the
> mmap_lock for read in order to change a vma->anon_vma (asserted in
> __anon_vma_prepare() with mmap_assert_locked()).
>
> At the time of this commit, lock_vma_under_rcu() contained:
>
>         /* find_mergeable_anon_vma uses adjacent vmas which are not locke=
d */
>         if (!vma->anon_vma && !vma_is_tcp(vma))
>                 goto inval;
>
> so we really did have to wait for read holders to finish the fault.
> But commit a373baed5a9d deferred the check for a NULL anon VMA until we
> actually needed it, so I think commit fb49c455323f's logic was invalidate=
d
> by a373baed5a9d.
>
> Maybe I'm wrong.  This is all a bit out of my normal area.
>
> > Also we have asserts for this lock in copy_page_range() and
> > copy_hugetlb_page_range() which will now fail (and possibly more furthe=
r down
> > the stack?)
>
> Possibly we have to adjust some assertions to check that either we have
> the VMA locked or we have the MM write locked.  That doesn't seem
> unreasonable.
>
> > > My argument for why it's safe is that a thread which takes a page
> > > fault during fork() might have taken the page fault either before or
> > > after fork().  The faults will definitely happen in the parent proces=
s.
> > > They may or may not have happened in the child process, which can't
> > > possibly care whether or not they've happened.
> >
> > The problem isn't the child it's the parent - copy_page_range() _modifi=
es_ the
> > _parent_'s page tables in-place, on assumption that nothing else can ac=
cess
> > them (for CoW).
>
> I was perhaps unclear.  What I mean is that the child may or may not
> observe them as having happened.
>
> > And actually nowadays things are _even_ worse, you could also have conc=
urrent
> > page faults, MADV_DONTNEED, MADV_FREE, MADV_GUARD_INSTALL/REMOVE, UFFDI=
O_COPY +
> > UFFDIO_MOVE (yikes) all of which might introduce new issues + would hav=
e to be
> > audited too.
>
> Yup.
>
> > So - it turns out a lot of stuff implicitly assumes VMA write lock now:
> >
> > 1. CoW - deferred TLB flush race
> >
> > (The issue above)
> >
> > https://lore.kernel.org/all/20230705171213.2843068-2-surenb@google.com/
> >
> > This happens because __copy_present_ptes() does wrprotect_ptes() on the=
 parent
> > without a TLB flush (that's deferred until the end of the fork).
> >
> > But unfortunately without a VMA write lock something can then replace t=
he page
> > table entry in the meantime and you can end up with data loss as a resu=
lt.
>
> Is it that fb49c455323f commit message is insufficient and we need to
> prevent simultaneous fork/page fault for other reasons, then?

Yes, I think so. It refers to one of the reasons VMA lock is needed
during fork, but as Lorenzo points out, there are a number of other
reasons that require fork to protect VMAs. Note that some of those
reasons, like MADV_GUARD_INSTALL and UFFDIO_MOVE did not exist at the
time fb49c455323f was written.

Below is the list that AI pointed out, and I think Lorenzo covered
most if not all of them:

Without vma_start_write_killable(mpnt):
      1. In-flight VMA readers that locked mpnt before
mmap_write_lock_killable(oldmm) continue running concurrently with
dup_mmap().
      2. New VMA readers (page faults via lock_vma_under_rcu(),
madvise under MADVISE_VMA_READ_LOCK, userfaultfd via uffd_lock_vma() /
uffd_move_lock(), vma_start_read_unlocked(), etc.) continue to succeed
on mpnt while dup_mmap() duplicates its VMA metadata and page tables.

  (Note: When this lock was originally added in fb49c455323f, one
prominent trigger was a concurrent fault calling anon_vma_prepare() on
a VMA with mpnt->anon_vma =3D=3D NULL while anon_vma_fork() /
vma_needs_copy() ran. Although __vmf_anon_prepare() now requires
mmap_read_trylock()
  when !vma->anon_vma, removing vma_start_write_killable(mpnt) today
still breaks several critical invariants.)
  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
  ### What would happen if we removed it

  1. **Destruction of live 2MB THP mappings ("bad pmd" -> pmd_clear())
in copy_pmd_range()**
  As noted in the comment in copy_pte_range(), copy_pmd_range()
assumes no concurrent THP transitions on src_pmd:
    if (pmd_is_huge(*src_pmd)) { ... }
    if (pmd_none_or_clear_bad(src_pmd))
        continue;
  On an anonymous VMA that already has mpnt->anon_vma !=3D NULL, a
concurrent per-VMA-locked THP fault (do_huge_pmd_anonymous_page()) or
UFFDIO_MOVE can install a transparent huge PMD into *src_pmd right
after pmd_is_huge(*src_pmd) observed pmd_none.
pmd_none_or_clear_bad(src_pmd)
  then sees pmd_bad(*src_pmd) =3D=3D true (a THP leaf PMD satisfies
pmd_bad()), prints "bad pmd ...", and calls pmd_clear_bad(src_pmd) =E2=80=
=94
wiping out the parent's live 2MB PMD without PTL, TLB flush, or
rmap/refcount/deposited-pgtable/RSS cleanup (corrupting parent memory
and
  triggering Bad rss-counter / nr_ptes bugs on exit).
      =E2=80=A2 The same race exists for huge PUDs in copy_pud_range()
(pud_none_or_clear_bad(src_pud)).
      =E2=80=A2 Similarly, copy_huge_pmd() reads special huge PMDs
(VM_PFNMAP/VM_MIXEDMAP) locklessly and skips rechecking *src_pmd under
src_ptl assuming it cannot change, so a concurrent MADV_DONTNEED under
MADVISE_VMA_READ_LOCK could leave the child mapping a stale/zapped PFN
PMD.
  2. **Silent CoW data corruption / lost parent writes due to deferred
flush_tlb_mm(oldmm)**
  __copy_present_ptes(), copy_huge_pmd(), and
copy_hugetlb_page_range() write-protect parent PTEs/PMDs without
flushing TLBs; dup_mmap() defers the flush to flush_tlb_mm(oldmm)
after all VMAs are copied. Normally, because each copied VMA remains
VMA-write-locked until
  mmap_write_unlock(oldmm), no parent thread can handle a CoW write
fault before flush_tlb_mm(oldmm) finishes.
  Without the VMA write lock, while CPU 0 is still in dup_mmap()
copying later VMAs:
      =E2=80=A2 CPU 1 (parent thread A) still holds a stale writable TLB en=
try
to old_folio (now CoW-shared with the child).
      =E2=80=A2 CPU 2 (parent thread B, no cached TLB entry) writes to the
same page, faults on the R/O PTE under per-VMA read lock, enters
wp_page_copy(), and copies old_folio into new_folio
(__wp_page_copy_user()) before taking PTL and calling
ptep_clear_flush().
      =E2=80=A2 Any store by CPU 1 through its stale writable TLB entry aft=
er
__wp_page_copy_user() and before ptep_clear_flush() lands directly in
old_folio while pte_same() still succeeds =E2=80=94 losing thread A's write=
 in
the parent (new_folio) and leaking it into the child (old_folio).
  3. Broken guard-page (MADV_GUARD_INSTALL) state and KCSAN race on vm_flag=
s
  madvise(MADV_GUARD_INSTALL) runs under MADVISE_VMA_READ_LOCK and
atomically sets VMA_MAYBE_GUARD_BIT on mpnt via vma_set_atomic_flag()
before installing PTE_MARKER_GUARD entries:
      =E2=80=A2 vm_area_dup(mpnt) asserts
ASSERT_EXCLUSIVE_WRITER(orig->vm_flags), which would trip under KCSAN.
      =E2=80=A2 If vm_area_dup(mpnt) copies mpnt->vm_flags just before
MADV_GUARD_INSTALL sets VMA_MAYBE_GUARD_BIT and installs
PTE_MARKER_GUARD PTEs:
          =E2=80=A2 On a file-backed VMA without anon_vma, tmp misses
VM_MAYBE_GUARD (part of VM_COPY_ON_FORK), so vma_needs_copy() returns
false and drops the guard regions in the child.
          =E2=80=A2 On a VMA with anon_vma !=3D NULL, copy_page_range() cop=
ies
the PTE_MARKER_GUARD entries into tmp, leaving the child VMA with
guard PTE markers without VM_MAYBE_GUARD set (breaking collapse checks
such as file_backed_vma_is_retractable() and future merges/forks).

  4. Inconsistent address-space snapshots against UFFDIO_MOVE and
tcp_zerocopy_receive()
      =E2=80=A2 When UFFD_FEATURE_EVENT_FORK is not enabled, dup_userfaultf=
d()
never increments octx->mmap_changing. Because move_pages()
(UFFDIO_MOVE) only takes per-VMA read locks (uffd_move_lock()), it
could move an exclusive folio from a not-yet-copied src address/VMA
into an
      already-copied dst address/VMA (losing the page at both
addresses in the child), or move a zero page from an already-copied
src to a not-yet-copied dst (duplicating it at both). Even with
UFFD_FEATURE_EVENT_FORK, octx->mmap_changing is only incremented once
dup_mmap()
      reaches the first VMA using octx, so earlier non-uffd VMAs rely
on VMA write-locking to prevent cross-VMA moves.
      =E2=80=A2 tcp_mmap() sets VM_MIXEDMAP (in VM_COPY_ON_FORK, without
VM_DONTCOPY), so copy_page_range() would race with
tcp_zerocopy_receive() zapping and inserting pages under
vma_start_read_unlocked().
  5. Immediate debug assertions (CONFIG_DEBUG_VM)
  Both copy_page_range() and copy_hugetlb_page_range() call
vma_assert_write_locked(src_vma) on every CoW VMA, which immediately
fires VM_WARN_ON_ONCE_VMA(!__is_vma_write_locked(vma), vma) because
oldmm->mm_lock_seq was bumped by mmap_write_lock_killable(oldmm) while
mpnt-
  =EF=BF=BA>vm_lock_seq was never updated.

>
> > Same issue exists with hugetlb wp too. And god only knows with uffd wp =
:)
> >
> > 2. THP - can destroy parent THP mappings
> >
> > copy_pmd_range() does:
> >
> >       if (pmd_is_huge(*src_pmd)) { copy_huge_pmd(); ... }
> >       if (pmd_none_or_clear_bad(src_pmd))
> >               continue;
> >
> > Without the write lock, a concurrent fault can install a huge PMD via
> > do_huge_pmd_anonymous_page() or filemap_map_pmd()/do_set_pmd().
> >
> > The issue is that pmd_bad() fires for leaf PMD (ugh) on at least x86 an=
d arm64,
> > meaning that'll clear the page table entry.
> >
> > I think Hugh left a comment alluding to this before:
> >
> >        * copy_pmd_range()'s prior pmd_none_or_clear_bad(src_pmd), and t=
he
> >        * error handling here, assume that exclusive mmap_lock on dst an=
d src
> >        * protects anon from unexpected THP transitions; ...
> >
> > It's like the mess around pmd_trans_unstable() :(
>
> ... could we fix this by taking the ptlock during the copy operation?
>
> > 3. copy_pte_range() skips the required pmd_same() recheck assuming writ=
e lock
> >
> > It uses pte_offset_map_rw_nolock() with a dummy pmdval and:
> >
> >        * We already hold the exclusive mmap_lock, the copy_pte_range() =
and
> >        * retract_page_tables() are using vma->anon_vma to be exclusive,=
 so
> >        * the PTE page is stable, and there is no need to get pmdval and=
 do
> >        * pmd_same() check.
> >
> > (Probably needs updating for VMA write lock...)
> >
> > 4. The asserts
> >
> > Mentioned above!
> >
> > I suspect there's more as well.
> >
> > Some of it could be changed, but it'd all be at the cost of behaving ve=
ry
> > strangely (no VMA lock but mmap write lock) while manipulating things.
> >
> > And I am not really happy with changing page table entries in the paren=
t VMA
> > (for CoW) without a VMA write lock held.
> >
> > I also wonder whether it would achieve all that much really - the issue=
 is with
> > holding the VMA lock across I/O, anything else that tries to grab a wri=
te lock
> > is going to end up being the new thing that's blocked (mprotect, munmap=
, mremap,
> > mlock etc.)
> >
> > I think doing something like this would need a very significant redesig=
n and I'm
> > not convinced it's one that really achieves what we want given all the =
other
> > cases that'd get blocked by the VMA lock being held still.
> >
> > --
> > Cheers, Lorenzo
