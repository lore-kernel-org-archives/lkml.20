Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794441661;
	b=r7GITfb5wm+TabGzIZVDuXGNGRGr9uVMmm4/0L0egLS/bymvlhO//OtM5vMHCH6W52bw
	 wHVgsW9JJz7QVwlNeloktzbVjVgoXtlrkJCzUdtRpuuxOWTvNceR6S0MZrSKLv+NAIisq
	 P1+8aZKguwAxwj4pEaRG7wvjJTWsuAHniHZb4Pn9I/h27anjx/ZHmNAzE4qJVEIVhLLEA
	 +JguA2rRSqKIo07DUS31WDoYeaDkido2XOBBW1KmpFbo9axqgHJhsmT3mpYkWEoFdwqEx
	 Jy1AKRocbx8kCsS0m3etCKXjuxRfYC5tdykxE9YPZlxDcgrwMawl+t8huj3I+Hj4H4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/+sJZZbZo2UcO+Nr8+QxFylA7K/BaXAtaD89aBd6sd0=;
	b=vV33WglYztKYnrJsnelwsC8LSeMj5UlIPsWfwysohQMPJMcGIGy+zpoUgBeHAnwC4M2h
	 Ak6W84oSRoTI00WwvWPVVqdJRdYnq0xs9jmMtIzSEGCr2KL0n+3YwwEa8SCCunXxY+jNv
	 1bBFKmdJGlz7x0GveeJgU7My0Oyl3Q1AKL+P8Sv3bo4QgVLuaRX4FEi2EdtOqoltCUnf9
	 OzTDdXY1lM250G5oRmo/KaFtPrsRezW/errBC+Sie1ZyJS6O2By4hV9SqgGC1ZQxmLkUc
	 aFSAW2QLygjYMVFuRP7CC9LyAAE6fe6uaTev8SznfVYg8DLw02iooU5fZ6/wz9p1D7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dcBJruwg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A8C606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A8C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dcBJruwg
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-54492d8a988so50561cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794441660; cv=none;
        d=google.com; s=arc-20260327;
        b=mi8qFegXL1Lk+XzUyp0/E/15/jS0LbTsEhAE37nVisSfut1jwwk8Qwwtk3g5IjI3PA
         2sF//ezlcpvhoPT98zd+x//wk1hQYGZzxe1diHTrx/TE+HixJQI464kvw62SBWp3t1EN
         +fiDMrqRcysXqiU/halmlfbPvVm1qDauBOQTLQ6NRUrD4LeEt1kt9ieffEs60EE2+5h1
         m0mvRCNf+8pSuL+/ddXovuh1LCW3oGatJ9/2mYnesabHdtFlXlVRM56dZLYVuV0CVOh7
         c+Wb5py9PrE2/DkR3lPPJpyEAu6/f+T5rNE4yYYgliIGu1oKPSTzhpQHgK2gx4fCIV6I
         aJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/+sJZZbZo2UcO+Nr8+QxFylA7K/BaXAtaD89aBd6sd0=;
        fh=m870kmJ8sbDlfjlYZzQo5rM8bMk7AOHvpV8KhZZZ/6o=;
        b=cDCZwHDPxPU2pRLYDLSNOSXZkYJizXiJ1E0ECBPnn1Kge9FTxpakfBRuD9JZiGWnDu
         MKZ8hxoppEpbouU1O1C/seQiCVG1KOF8cOglOgv5alJ+g5Fzt5zzZjN6wHPdEWPZuXYd
         MoNo30+OF6BrOew1h4ZR+JI2nE7g0pTbyaY6/oMX3FYRo0eTfNbOt2sbsfwXQehDiDb6
         ni/vc90u1LxeVAsh5+3/XdJ6+eLEFdlemZjag4qy4CkC4bNLHaJWBsWSAjPVbSd6El+3
         oeUate6u5TStstSHRPiCJ9sFXrnCJpvnMvGcvy4CHpno2zYiMxL1OKf03V/F07UU5Td4
         9tpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794441660; x=1795046460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+sJZZbZo2UcO+Nr8+QxFylA7K/BaXAtaD89aBd6sd0=;
        b=dcBJruwgmI32fJUHkVeAuOndx0klrM/2CRwka4MTFuwqygp3DB7kzNjkF8naz6sHOY
         sp47V6HNvCdFrWE/wq0ysnF0suaCP00g/oYycnkvG24EowH+Q4DlI4GfO9LWyyVqPQM0
         f1BEtdeQOyrihFcDgaiKKHQ0hxxr9fSXdB4UTO+QKmOi42QltBeTlPuyZzICnTp/eVZO
         LIyyD4rFn+rxLi6lpovw+/DV+qsnWeDmCcq3AZTAbeJ41O0Fr67IoQs+PblVC6aQvfCS
         PW2g/zioYtuD5/1zADHJQuJInizafVZI+WNsD/pfrcd+clStBErU8aqk/E/Z6JoAQ6ma
         Bg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441660; x=1795046460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+sJZZbZo2UcO+Nr8+QxFylA7K/BaXAtaD89aBd6sd0=;
        b=eThztEfPMlZLcqYMLtZXwjxnnckeoSdr/nPpWmLoHSeSfzfvfiwrywHk9Hj++HxcV8
         MnGAnhX1NOM5L4Li5Aqs8oj0dNcI/cBLQR2srwm+arba1AMidZeX4Gb6+iP+ZukMtXER
         Fr9MxwLawS0YRxdEN0RdekM3vCdGsQZupC+KzVuDcrRvyqIozBifuVr9nR/wtYdtK9UX
         pRfPYRV6c6BR5EHfahIvw6dAV77AAtSdcqUXMvcwJwU4nQv3lCzq3fZ1/1gXRFM+cWpH
         P/gzKSYepb0CbIaf0OJx/CUxQzt8OHND6m7A3tGy5kmMLGAruG5AW51f2bCaHMV/3tRg
         Zm4A==
X-Forwarded-Encrypted: i=1; AL+hErGkFsLzJla6+A4f74NRsRqydG+pCoWf4fxUkg2crqhyubpFawxEzTQUM2qgCQcaEXQ1UVZX5V0nNL1Dcv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z83clny6+Bi03ccm2nNq565gYZ1CnSxU5yhm3lnIsP+CqL8ukyI
	aqxim9WxI62iz5Nu0hfgp+r5/9Vn8EvQa1TOWS7GdISFQCMJkbe/h9+1zC/SN6P2JQLllivTLQT
	IagC3uDNvh+c8UYLBmuq+N4f/8lTicwAgA6myNExl
X-Gm-Gg: AYBFou2ZMtBVTMxNI4pnvwIKowpu+CHWvHOEknn91JqX1BopwrWNEmsVWClEHKmenGZ
	n9ouWFAh2HoAB3eGaeSitv537sn4fiH+7GPQC3M6+xcHpxydCfxm2iMfkWJys0cshqozE1pecie
	RkPx6+9JZRBWdwvuibzO8qdRtSEsgPi7WDf1F21aHxYzCGWOuiWgrlRmlpx0H9Gkv0plMUuzDLY
	QMCWA9d1485D/++pRo/pbP6L0LUPJOUsxA54NF2e0NEVjcPxAiptivjYUD2MRl6WGuztgPPjQRk
	HzhagehN+b6i5Et3HHAbWOSi1JaFPBYtg+dJn/JquYKztRQ0Mm6sZ8WIKJ/NoKCn0je2p8MbcGe
	XSAFgSrLj2OVVA22V1Fy6tKlPBLyLHZGtR0u//anIHfARUdezthX+NidApkc1V10IXspkucuaar
	r9b8IXwA+vT8tJleVtDOs2S6rIxQ==
X-Received: by 2002:a05:622a:514c:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-5596742d03cmr7885161cf.0.1794441657704; Wed, 11 Nov 2026
 16:00:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110112546.261415-1-hao.ge@linux.dev> <20261110112546.261415-4-hao.ge@linux.dev>
 <f416f84a-03de-49fd-ab67-d86ed4dec633@linux.dev>
In-Reply-To: <f416f84a-03de-49fd-ab67-d86ed4dec633@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Nov 2026 00:00:45 +0000
X-Gm-Features: AclHuK9BKDPw8mqltXLLAZPx2uW3RHH6cpnOYo4JgG_IF10oXVJ9B3sYkpkOZaI
Message-ID: <CAJuCfpEO6F5g43=uR=PmNmZwRXDzLjT_4CfE7UUZmt7iebgjfg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] mm/vmalloc: BUG_ON() on an unaligned range in vmap_range_noflush()
To: Hao Ge <hao.ge@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Dmitry Vyukov <dvyukov@google.com>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dennis Zhou <dennis@kernel.org>, Christoph Lameter <cl@gentwo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 12:26=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
>
>
> On 2026/11/10 19:25, Hao Ge wrote:
> > commit a739e6b557af ("mm: vmalloc: WARN_ON if mapping size is not
> > PAGE_SIZE aligned") put the check in vmap_pte_range(), which is too
> > late, because the upper levels may already have installed page
> > tables for a range that is rejected anyway.
> >
> > The pte loop maps whole pages and stops only when addr lands
> > exactly on end.  An unaligned end lets addr jump over it and the
> > loop keeps mapping past the range.  An unaligned start maps the
> > page below the range and usually misses end too.  Such a range is
> > never a legitimate request, and the corruption it leaves behind is
> > hard to attribute to the caller afterwards, so bug out on addr and
> > end at the entry of vmap_range_noflush() and drop the check from
> > vmap_pte_range().
> >
> > Signed-off-by: Hao Ge <hao.ge@linux.dev>
> > ---
> >  mm/vmalloc.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 093b8d5f7b0e..27f2674a5556 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -125,9 +125,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long=
 addr, unsigned long end,
> >       unsigned long size;
> >       unsigned int nr_pages;
> >
> > -     if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> > -             return -EINVAL;
> > -
> >       pfn =3D phys_addr >> PAGE_SHIFT;
> >       pte =3D pte_alloc_kernel_track(pmd, addr, mask);
> >       if (!pte)
> > @@ -347,6 +344,7 @@ static int vmap_range_noflush(unsigned long addr, u=
nsigned long end,
> >        */
> >       might_sleep();
> >       BUG_ON(addr >=3D end);
> > +     BUG_ON(!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(end));
>
> I know BUG_ON() is ugly and it was not my first choice either, but I
> have not figured out a better way to handle __vunmap_range_noflush().
>
> If an unaligned range is passed to it, the pte loop may clear PTEs
> adjacent to the range. Say a caller passes [3, 12) while [0, 3)
> belongs to somebody else. The loop operates on whole pages, so it
> starts at the page containing 3 and clears [0, 3) with it. That
> silently corrupts a live mapping, and the corruption is not detected
> until the owner touches the page. Bugs like that are nearly
> impossible to debug afterwards.
>
> It is not feasible for __vunmap_range_noflush() to just return an
> invalid-argument error upfront. Its job is to clear PTEs, and an
> early return leaves the residual PTEs behind.
>
> I also thought about warning and returning -EINVAL on the map side
> and keeping BUG_ON() only in __vunmap_range_noflush(), but the
> rollback kills that idea.
>
> int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>                 pgprot_t prot, struct page **pages, unsigned int page_shi=
ft,
>                 gfp_t gfp_mask)
> {
>         int err;
>
>         if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
>                 return -EINVAL;
>
>         if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
>                 page_shift =3D PAGE_SHIFT;
>
>         err =3D vmap_pages_range_noflush_walk(addr, end, prot, pages, pag=
e_shift);
>
>         /* Undo the PTEs installed before the failure. */
>         if (err)
>                 __vunmap_range_noflush(addr, end,
>                                        gfpflags_allow_blocking(gfp_mask))=
;
>
>         return err;
> }
>
> If the walk WARNs and returns -EINVAL for a bad range, the undo
> above passes that same range to __vunmap_range_noflush(), and we
> BUG right after the WARN. vmap_page_range() runs into the same
> thing on its error path.
>
> So the map side cannot warn while the unmap side BUGs, the rollback
> drags the rejected range into the unmap anyway. And the unmap side
> cannot warn and skip either, that leaves the stale PTEs.
>
> Also, these checks are the last line of defense. All in-tree callers
> pass page aligned, non-empty ranges, and I am not aware of anyone ever
> hitting this line. So for correct code the BUG_ON never fires at all,
> no user will ever see it. The only one who can trip it is the developer
> who just passed the bad range, and for him a stack trace right at the
> spot is much better than chasing a silent corruption afterwards.
>
> I settled on BUG_ON here. It may not be an ideal solution, but if anyone
> has a better idea or alternative approach, please let me know.
> I would greatly appreciate it.

I don't see a better way to handle this situation but I would add a
WARN_ON_ONCE() alignment check at the beginning of vmap_page_range()
too because it is used in some of the exported functions like
ioremap_page() and pci_remap_iospace(). If someone passes an unaliged
address to these functions your change would turn a warning+function
failure into a panic.

>
> Thanks
> Best Regards
> Hao
>
> >
> >       start =3D addr;
> >       pgd =3D pgd_offset_k(addr);
