Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574D137A834
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104322; cv=pass; b=OwrIsJcnBD/kZNsKaCrtiTI3KZNstjxIxCS1Us7Cnna68OYY1ObWxcqJfS7/Jtry+xRktpQHIUe9SU0qaIhQru+19LKgOqtZqgax7b690KU9CpwfBe1frELsFp5WR9/+nHaNI68UtQR86UPdBQSp5/b+pol9zYgkascM2SrjGGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104322; c=relaxed/simple;
	bh=pde/atokYGlXVQMXPE555qjnd8HsZsyowtY+/7fM9dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdAB5ORbFdTEICO8nVmNXEQsl79VPbZBBY9VQSBQ+Clwa9DQeVYzrn/4NqhmjDBokiz0WepP7G1/qfzBP4r4M8plXmTwV5uBmtTGEZD18RpWE57j9wABs2vVMLGFJ8sdyAa1SD3WPWFYgRVY7Cnb/cnOrE7X+LsGIG5ID2nPbWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc93N2Pa; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc93N2Pa"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso2047985e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792104319; cv=none;
        d=google.com; s=arc-20260327;
        b=AFc8kPqsd65nGugVBbMahY7G1uQxusoL3PskjDk+D120E/lQAPy0RoSqnHpVndcged
         VKqCk9p209P4e+txG09rGJSLzk8MoP6e9YXzVr1asZczzto3++tO+L/Oq5RkuPSWxKGd
         zpBYPuy9VZywn98c1S5Nui6+WWlqQANr2Ma4r7ZEh3jacTHzJhrLVZ3iPh54EdKqAF0b
         qXhGvebz2PFs1UmVAgIoZKefwSA0BOpRH/qoKRqJ0z5ff26CUu+c+Cg0HlXfaYlw6CUc
         aIMLibJ24rFTijlYDm/6JWmf2LOyWgvmjZbys/fNsD9F7j0x9IJXZVotlpx8HmewOh6E
         0vNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cDTDKMrdQwRgjoWMeyrkyF6DIGr4iKPuJqKn3z4+wB8=;
        fh=7EjFpa351EdGS5ImE1pLmZe++EmmZquQT/HB7f8lL2Q=;
        b=Rsn6DHs3pjkc9lHFkfNtANXebF3JuaiEJO9XfM7hQrm88B/MfJPJo/l+jMA5mQiSab
         fPKdonj9e6uL29CYscZqAr8RNGGJqRonR9XjHQygQP37xb6fNFC5RVED65Et0WDUGwmQ
         qV3H7Yq5uyqPIhHD1K1/CfAYTTJCHSIcJT6RhzzYve3Oq2RB/dvuDowWqJvtpg98cRhm
         +nima3KapT6Sf5WrRkCAIlGkaE8yFli9MVyNq7a+MHPMOcb2JQ3E3EOCprBxjls9SQjV
         q5PRGCXUljdBzcraftiJ7nLPBthHv+NYbwtntWL/lK6roVdApywRWS8HWjJHmp02Ua62
         2jPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792104319; x=1792709119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cDTDKMrdQwRgjoWMeyrkyF6DIGr4iKPuJqKn3z4+wB8=;
        b=Xc93N2Paw2r4qyCyhqXFb+KKF8+qI3hlJiOc/ZByj4jMu1HK5sBmNO0AlVSSSqqGlS
         k70ZRbVF6E+0MIsYqkQIaG5zj83j35rm1Dtxs4EAcPFanrijdgaN47i+U1wraVr6pElf
         LlNt9y53wGugS4sSUCG/7GLRCSDmSX2flQrA6wfQdFRvuNklbBASCuCHCr3YCCmXiXP7
         vXc/XT7TX9XbokyCUiYoh5psQ8udGnaTaMiMI+NGprSgxCiK+5agL5E6GcDU14g2nqkI
         QQA9rh0+YpKlXTE8ZhDWVrHXODet4L5v0J/NR4/TcHWzsegsZSNLzaz2wq4w5E7cru8n
         +INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792104319; x=1792709119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cDTDKMrdQwRgjoWMeyrkyF6DIGr4iKPuJqKn3z4+wB8=;
        b=kSnSXsVsldCLMHYJa/7r20QmcwE7IbHaezR+sSrAmAILvZ64bO7c1cQiqqAsStKQcH
         VTaB1B7H+7jpvHM6JTJeW1G4L0J+x5VMmjaex6ncbYK7DvASxfNIuy1vlX3f5u9cUesW
         NpWID3clbvKLszXat0RsrWIlphcG4I4jY03kYmnW5xzYnZluT2mV4JhPabTVZNYWULbD
         4mBsz59azvJ6y76dAXUWdHDTYsxuZrNnbVqHHUC95405vTCaLmxBfuV6ZwY852RDbAtu
         yZVA+EDJkuDaIshsIlDprV9Yqfxrr53xd/mTQikH8HSSlVdx0jhnUiLxs28Qs8HMt2Ay
         DsbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFfDMIFNwLelWeoIQNVOCmNrkzDtr7QCxpcvY3ZiqxyZYGzJHDP3s/g0NxrqzGIWvg215aa95CHk7aVWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPO63/AsuKeDgLhvA0/HGfwtWwam+h9t53xZ4yh+lWCRJHtiGG
	U5aJmNa5o1QuoyjJsIbvgzJ/zvMHIAf5u+HW198ftq97rX/EJKiknMBynvnzrLHMAPlrd4U1Vmc
	1y0+MgmHyT8oExkMzSDSfppedLNpaXew=
X-Gm-Gg: AYBFou3xNlosYGCO9HJ8ha0rDhx0U9UVnUFDkZVOYss3t2QXQHljkaqhyw8ocW8Lnmr
	b3hUz1e9lIgF6ixS8YHXcTXT4npIe4uot9qE2JON59Ybqv6Qi+EpaO0DsxGFHYshOjGcNUmycJh
	zVEw3R0lJAr4qQyNYHl77WS6RSiZbXa85t1bNwc7KfoqoGbfLp/cOrizz/JFHQnujsl7T6k+Q61
	UiUaHlm2/GjT7Q5Dvz/p3fvdajLHlqGy8MhB/2Oo0rjc6f0MtaHV+CHqr/4IRhoaixcYo2rpJlZ
	Z0ysZ9pqdNmpDTTSZLepajQ5pOVLProKpFMH7CM9DL26iN0JAEuDJr0=
X-Received: by 2002:a05:6512:3f24:b0:5b8:f533:d439 with SMTP id
 2adb3069b0e04-5bcde8c1acdmr7282009e87.38.1792104319215; Thu, 15 Oct 2026
 15:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
 <20261008182814.27450-6-kanchanapsridhar2026@gmail.com> <as7JC8o2kggiq_ss@google.com>
 <CACpmpofXMGBP70Rn7jHLwOF38GRKMUGoW3rb1Jp2SPH7ygKcfw@mail.gmail.com>
 <CAO9r8zOEcGmg8eVttu41htugnng0ahnVQbubiJfxVH+GfDe47Q@mail.gmail.com>
 <CACpmpodDA=oqnVa_hsJpyhGt=4zxknYF=QX9L6-sJbxsRxtM2w@mail.gmail.com> <CAO9r8zNN6F01icKUFr8q_AgJvhxGw0MkGezKbBuKzFQV0NaAdg@mail.gmail.com>
In-Reply-To: <CAO9r8zNN6F01icKUFr8q_AgJvhxGw0MkGezKbBuKzFQV0NaAdg@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 15 Oct 2026 15:45:06 -0700
X-Gm-Features: AclHuK8NXYRqg5T9PQ2fZ89a7chOTLHtC37Sjh9lMWynljXBN8yHgyQfD3XnlOE
Message-ID: <CACpmpocCJWkA+zvZ9ivNCt8xSZWfViKQ2ZeYN+f1EmdVTewzRQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 2:39=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> > > > > > @@ -1449,9 +1446,10 @@ static bool zswap_store_page(struct foli=
o *folio, long index,
> > > > > >  {
> > > > > >       swp_entry_t page_swpentry =3D folio_swap_entry(folio, ind=
ex);
> > > > > >       struct zswap_entry *entry, *old;
> > > > > > +     int nid =3D folio_nid(folio);
> > > > > >
> > > > > >       /* allocate entry */
> > > > > > -     entry =3D zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(f=
olio));
> > > > > > +     entry =3D zswap_entry_cache_alloc(GFP_KERNEL, nid);
> > > > >
> > > > > We don't need to allocate the entry on the same node anymore, sho=
uld we
> > > > > drop this and let the slab allocator handle it as it sees fit?
> > > >
> > > > Was this a recent change? I see the folio_nid(folio) on my version =
of
> > > > mm-unstable as of 10-3-2026. Let me check, and yes, allowing the sl=
ab
> > > > allocated handle this is probably a good idea.
> > >
> > > We allocate the entry on the same node to avoid having to store nid i=
n
> > > the zswap entry (see entry_to_nid()). If we store it, then there's no
> > > need to allocate on the node.
> >
> > With patch 0006, we try to bulk allocate all entries for the batch.
> > Only if this fails, we call zswap_entry_cache_alloc(gfp, nid). So
> > patch 0006 addresses this already, and the nid is used on in the
> > fallback case.
>
> If we are storing the nid in the zswap entry, there is no need for
> zswap_entry_cache_alloc() to use the nid anymore.

As of now, zswap_entry_cache_alloc() uses the nid for
kmem_cache_alloc_node(). Is the suggestion to change this to be
kmem_cache_alloc()?

>
> >
> > >
> > > >
> > > > Along the same lines, I have been working on replacing zsmalloc wit=
h
> > > > direct SLAB allocations for the zswap compressed data storage and s=
ee
> > > > very promising results: memory savings and latency improvements. I
> > > > will submit an RFC shortly.
> > >
> > > Keep in mind that zsmalloc is movable memory, while slab memory isn't=
.
> > > Zsmalloc may also be less likely to make a new allocation in the stor=
e
> > > path. There are other considerations beyond memory overhead and
> > > latency here.
> >
> > I realize this means we trade off page migration for writeback for the
> > pages representing zswap compressed data. This might not necessarily
> > be a bad thing for 2 main reasons, the way I see it in this specific
> > context:
> >
> > 1) Page migration would only be transferring a memory pressure problem
> > elsewhere. Not sure how well this would work with memcgs or
> > containers. At some point someone would need to do writeback.
> > 2) I don't believe there is a zswap specific page migration flow in
> > the kernel other than zsmalloc compaction. IOW, memory tiering
> > components like CXL are handled directly in the reclaim path. From
> > what I understand, things wouldn't break with slab memory for zswap
> > compressed storage, but I could be wrong. I hope to include the
> > architecture level considerations/trade-offs in the RFC.
>
> Zsmalloc memory is currently movable, so compaction can move it around
> to free contiguous blocks (e.g. for THP allocations). Slab memory is
> not movable. It can be reclaimable, but writing back memory from zswap
> when we are not under memory pressure is also bad.

All good points, thanks. I agree, writing back memory from zswap when
not under memory pressure is bad, however I have not seen any
writebacks in my experiments with usemem at 60% over-commit and with
64kB mTHP.

I am running these experiments in a memory constrained environment:

QEMU VM: 7G RAM
Swap: 3G
cgroup memory.high: 3G
4 usemem processes want to allocate 1200M each. To make the experiment
even more stringent and representative of actual compression datasets,
each usemem process reads the Silesia dataset from a
pre-fork-allocated buffer into the 1200M. This causes realistic
compression payloads in usemem.

>
> Note that compressed memory can be very large compared to slab
> allocations (or kernel allocations in general), so it can increase
> unmovable (or reclaimable but not movable) memory significantly,
> causing fragmentation.

It took me a while to experiment with compressed size bins, until I
settled on a compromise between memory wasted per slab and zswap
latency in finding the correct size bin to minimize fragmentation. I
have been gathering extensive SLUB stats which indicate:

1) Even under peak zswap compressed quota ("pool") utilization across
10 consecutive iterations, SLUB comes out ahead in less overall memory
overhead.

2) At steady state (when 10 iterations of the workload are done), most
of the slabs have been returned to the Buddy allocator, except for 3M
worth of slab setup per compressed size bin (0 objects in use): this
is as compared to 32K of zsmalloc slub metadata that remains at steady
state.

I learned some really interesting things from these experiments, which
pose questions about the memory penalty due to latency that zsmalloc
adds to zswap compress/decompress paths vs. "internal fragmentation".
I expect to quantify this with data from my experimental setup.
