Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41A2EDD58
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788119012; cv=pass; b=kABJFp/SZwUt5HjKbF4KTp3bjUptpGOrDC73pMv7oolaUpi5Swvbeh1tXINcRmKzdSa8cRQ7yQG/QH/kepJ3rIz+YlzveaLpFZqoRNy0ItCkaWa39FmjpgxWAkA6Dc4PdkvVky6EPJ7gXmLIL6UcFCM+Hu12sz5Ma6wb+RG4/qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788119012; c=relaxed/simple;
	bh=1fyGudfVL/P/wS7PXUEfL/mlFEi3QZbq3ZBqWyK4FHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKMJinL7LZMXx5a4wVOyizS8EoYlnFAbz6rZVpQ1oPF7TCm5GAs9ItDIC5CuPtnkLMo46psvjOsgwex+/qVVkETjyPhDOp96KZjjB8mcdLNNzgq3YYj3ScmBA9CY1gBjuUtoaieSDPVI1AEHN86/o6mvPa8IpOTBE+U/TRQ5VbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zip1GtYd; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zip1GtYd"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c01c79467so267091cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788119010; cv=none;
        d=google.com; s=arc-20260327;
        b=nYHnLUPTMvjFWs3/R0i9N4zJGY2EfMlqJKFU+Ae9FflfvwDNoL6T87XLA94dWIWGbo
         AIIexxMFi0B6o7pUgycamceMO0xUlD+INomBfJesPm2ia5Hpnfug/VWXU3w0gSnFm8WC
         aS9m/3HyrcoZyW4hkL/lDsms+FounpQkQ0/Ru5Fi3ux4mBld6VzVmQB/23oZV2vvX86D
         +cM0mVYITR3ruD0eyIy/PKg4nnF1cgsOHErMQ93d2a7/s2GgEocpM7+VGawTdf/yXeAx
         b6oggvyKqYLjFKVA2oeDTHV0E2iBaL9/A2hhyZBHmPjjq7C8jIub3IT5qvknhR3/Pmnb
         IWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        fh=KGMRRzTf+X1CpsXo6z7GmWp93pusjf3J7UkRkvrIqCo=;
        b=X5bnRHn2NDdVyTpRFvPD8T3lFgMof7YsUXK2ZyEAaKyLafM+nmAiQv/04Uo/ymbMw1
         ec9ibFBbh9Z8rmLLEnzJ/XThpL6X7zBqsMRcLQCFZN8toT4BHTcanBhUK1NtatUNQWGM
         jzemCIQR566axpA79g7nfM+HhOlWASOi1DrYFqoNaEdXr1IWuJ130ozwWfvC6V31u3Aa
         oaoHBO6+E5LqTVpmrKx+phX22q3NrxqOluaWCNkbGD65TDdPqH7EbxkKuxlIhwmFDrSt
         9eKrYyaqbwV54Gvb5fbDLE7yc5StHd9jeG/uA76a3nvroHKQlUrBDw5EWK6rLe0I+Gh9
         vqCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788119010; x=1788723810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        b=Zip1GtYd/jpgw+9rPfssGFogszMSs1iT71VNQa1yxOHfmtBr4fhQDxhPnlUlj1P+pt
         CSK5inxQeV8v2xrdtOKyTdRbvt/P3sSC6PbaycW+MR27Gjx9DThf9z77L5iEzAo7A+Dr
         xqGVVq9oBkIPf/tLn279dyEwLL1WbIfbG9GrGUP84UkfsuBmHRxec+DUABQroOrWvlHk
         1+HK9sTzkPkWmOEGxRqX24owovyfCWsp9T+NF1oUNhE6kA79tyMI2J3cLYlDAAu1oxEN
         Xk/EACw/9Yr8QMcjA3cR+QV7ptRJZKpOaW+/vqseYJ+1SOnX0tIDYdB9aaqtmJKI8uzC
         T3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788119010; x=1788723810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Epskzlofy8RZiR5d5Xl/eQuciaAzxtDvz2E7jaOYvNo=;
        b=LL9cp41HLinmoR8DQ8EjXUmfhsMI6jpQfsKRUlsKfhsMGJIOCgCRpPqxZ9SIxXW0dX
         WkIILsY/bobkhQ94nZarSn0uttAGrI+QN91kZ4i5HgCYQ/IUto9+fuG9rhzOM44lftiU
         mJ3YBywTA4Ti631f84Ejtd1nam5loAnOtZ1BNcYToITaLFGPSWvN9J88F21NZUgjNkIB
         jTbyspOtJo4d6Ohfg+6HpQpQUn0dHabuCb7FSd7ADwe1e7SdfFRfNN9o6aQSYkpdFsNA
         +bFRjLFw3W7BqDVFFbo9lSiQjoYaZqQCx+E/5cdUjpZgSCEs5pTXJzncVQSGgwu2YoWE
         OQ1A==
X-Forwarded-Encrypted: i=1; AHgh+RqgIYGWQSmaj/tAwQyf4Q3fYXFn/salbH3YYta0hJ9tKgAjXQ41t7lMwMDJl9vmfXj2ehPrJGBuod/Z+sQ=@vger.kernel.org
X-Gm-Message-State: AFuF++netG+wnMCLNoKQLRP8km7le7kKaDc37H6y9ljPVUVIw7s+q7Db
	heDGBr/w0vDTKvAXuiYTVnw0TwSPF6gxDA9dz6vsElZuyOq2zLOmEI6iX1R8duwsQV5ULCHgmjO
	fQ+P6T/MvZ99c/eRlhopx2BoD3sQKqYhQpnWzE6vh
X-Gm-Gg: AR+sD11RYgpz40OCN3Kv1o17pB0521QUhka8btRKLxImD3aSp5mXV55Us+b15x20ZzB
	Sidw5wfbxU6E2rmIEzV2RjLOJIAvlvxHG/Mzunxromf4my49+qlEaHG2Rz+8LpsgQtOBNOstEzy
	L2mMSZIchDmkg/v15I6dbD9GUUjXaCv4WxgpMRrOLBg/pQSr7H40oLVltGbft9vfoj3aiyzj6qP
	O8XUsTUqh6klf1XE7Kyn8qaP5HPzSguU+JzPUgq7WaJyTkNSs5tKunUvg1u4d1ietjJcFnYRhvh
	lOPcQMbo7k2Onhh8JXuln6Kdyerat3sJeWAF+7DHGQ==
X-Received: by 2002:a05:622a:102:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-52ff73ae1ddmr20100711cf.7.1788119009268; Sun, 30 Aug 2026
 12:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com> <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
In-Reply-To: <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 30 Aug 2026 12:43:17 -0700
X-Gm-Features: AcwNN1UIYogI8mjESAIE2AGofbpoBdd5z6oJmUJSI9USsR1cMoCFWy7kojgNdhQ
Message-ID: <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:55=E2=80=AFPM Vijayanand Jitta
<vijayanand.jitta@oss.qualcomm.com> wrote:
> Instead I'll add something like below to arm_lpae_restrict_pgsizes as sug=
gested.

On  a related note, I'm debating whether we should change the word
"restrict" to something like "update" or "fixup", since we are no
longer purely restricting page sizes, we are adding new page sizes.

> >>>> +/*
> >>>> + * Install num_entries leaf entries starting at ptep (index map_idx=
_start
> >>>> + * within the current table), tagging arm_lpae_num_cont()-sized gro=
ups with
> >>>> + * the contiguous hint where both idx and paddr are aligned to the =
group
> >>>> + * size. Entries in a misaligned group are installed without the hi=
nt.
> >>>> + *
> >>>> + * idx and paddr both advance by block_size per entry, so their ali=
gnment
> >>>> + * relative to the group size is invariant across a run of entries =
within
> >>>> + * this call: once a group qualifies (or fails to), every later who=
le group
> >>>> + * does too, up to num_entries. This merges each such run into a si=
ngle
> >>>> + * arm_lpae_init_pte() call instead of one call per group.
> >>>> + */
> >>>
> >>> Can you provide an example for when this function installs descriptor=
s
> >>> where the contiguous bit is only set on a subset of them. I would
> >>> assume that the contiguous bit is either set for all descriptors or
> >>> none of them.
> >>>
> >>
> >> That assumption doesn't hold in general -- it's only true when the
> >> map request happens to start and end on a cont_size boundary. For an
> >> arbitrary map_pages() call it usually doesn't.
> >
> > I believe you won't see arbitrary map_pages() calls. I understand that
> > these calls are exclusively coming from __iommu_map_domain_pgtbl()
> > which uses iommu_pgsize() to determine optimal page sizes.
> >
> >> Example, 4K granule (num_cont =3D 16, cont_size =3D 64K),
> >> iova =3D paddr =3D 0x1000, pgcount =3D 34:
> >>
> >>    - idx 1..15  (off !=3D 0, misaligned prefix):        installed plai=
n
> >>    - idx 16..31 (off =3D=3D 0, paddr now 64K-aligned):     installed w=
/ CONT
> >>    - idx 32..34 (off =3D=3D 0, remaining < num_cont):      installed p=
lain
> >
> > In the example you provided, I expect that you'll receive three
> > separate calls from __iommu_map_domain_pgtbl:
> >  * idx 1..15 with pgsize 4KB
> >  * one call with pgsize 64KB
> >  * idx 32..34 with pgsize 4KB
> >
> > If I took your argument further, I could argue that we'd also have to
> > check if we can put down a block mapping if iova =3D paddr =3D 0x0 and
> > pgcount =3D 512, but we're not doing that either.
> >
> > Could you provide the input parameters to the iommu_map() call that
> > resulted in the parameters you provided i.e. iova =3D paddr =3D 0x1000,
> > pgcount =3D 34:
> >
>
> You're right -- for the iommu_map()/__iommu_map_domain_pgtbl() path, iomm=
u_pgsize()
> already splits the request at the boundaries you describe before install_=
leaf() ever
> sees it, so install_leaf() doesn't need to handle a mixed prefix/CONT-gro=
up/suffix
> chunk for that caller.
>
> That said, install_leaf() is shared by other callers that reach it throug=
h
> ops->map_pages() directly, without going through iommu_pgsize(). panthor_=
vm_map_pages()
> (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgt=
able_ops via
> alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consume=
r, but does its
> own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ=
_2M, with no
> notion of the 64K/32M CONT boundaries. That can hand install_leaf() exact=
ly the mixed
> iova=3Dpaddr=3D0x1000, pgcount=3D34 shape in a single call (panfrost's ma=
p loop uses the same
> get_pgsize() and hits the same case). So the prefix/aligned-group/suffix =
handling in
> install_leaf() is still needed for that path.

Maybe other people can chime in here, but I feel, from an API
perspective, we should have only one way to make of use iopgtable. I
think we should just mandate that users honor the updated value for
pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
alloc_io_pgtable_ops() call and then choose page sizes appropriately.
Otherwise, we end up with two pieces of code in the kernel solving the
same problem. panthor_mmu won't be able to take advantage of the
contiguous bit until it gets updated accordingly, and that's ok.
