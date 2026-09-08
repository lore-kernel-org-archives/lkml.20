Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5D583ACB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885410; cv=pass; b=F7naL8gv+Y4DJB/iXVnKZmPHKl4SEOPiHFXityDqgOLkz6Fm31oPje2WC+TgvmP786+UDgXsDvCLqnIJlIwQqhHReIG9ucsQ1YzGgIV/NGTx961bkA5F9GBfYIp0yx1gY7/FVhth+aUFufHNHYB4GLKNriF2MvNElq3rylWTo4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885410; c=relaxed/simple;
	bh=2kpYBWl0KXefWYLIcQZz0qWhIXBa2vP5xaDAEBMBTgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kl1lZ/pmvyWkcV2gnHMqU/UTxzN7Gll81pk0Vgluo4WZZRYpAk1R78WXdSQ+WNU6kBjD4TCsgxa+oVzOZ5ZIQRg9jWh1SYwpHQQaie8OP084trbKNVFqjKN33FqOccLG/sT+vZuPbIsI4rPTV0Xf/haFrnaNIFs+FKQ+jXW0Ix8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C4xhjiBY; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C4xhjiBY"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so607261cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788885407; cv=none;
        d=google.com; s=arc-20260327;
        b=WmqH9NFcVNVGV6Wq5Kh91l9AlVO/SD4b+q/YU2b4i6OPU53yXhTLJrdiWRnyQPt4t2
         73LZwB1V6ERZg9EhX0ZidIDzSocxq0llD2oyg21VqTAMQbzYcjY1pSGVjEDg7MntXRc9
         MJa2dYxymEP0fr/4cluY6B2oO/AsEMwHKcAgrXqT2NYjNYCnb4OnFdUwm7TdJsPWj9X8
         FqE08038pzw1xWHqQ06NOXCxFFeLLaMlv5+Ml6A5rYueHOaltvdHvg0t0rqZQejABhXU
         dvil+2P7+Nq4/mkRsE4vwdooeA7YRD+RHRfmxdnvJ9RtmG8LFjPlki2JRRaLlVQQwdvy
         OXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ar1cqiUGIhblAbeFXXUvhYbgZ/09secUyh9OrIqbTXI=;
        fh=Zky5EiNfM8CGcbLlYxWSnskLK7I/pw4eJdPbg8M2lQQ=;
        b=B1jaexl3fUS8vBMZDAgn0iMP+4AuJgOnxG4zZdMYFZtH9VFmg9+inpkFnbwAzQFwE2
         3j17Xj8+E87SfquwZ7VUYR9ON9rqlo2MIWLmYaaql5ajcmDXoj8cyuDedPXjf0oU7zyk
         roUHvWX+wHjugD7DbW4wCIpI47bNUD0Jig+N3DepGMYHElkiU7D0RX/KMjADCfekTLMg
         la4INUaZ7Dc4ZnHmtbdbr+CK/mGoooMiK4Aobf2kKx5UyDDB/fTDdGaq2w2UgHhYUE++
         5UnnBGvNr4QdOl1m6sTFvElumKIouGFUqh2vpuxpcFKUb2Sd8hYGsuQIbcXusl5vN/1T
         BLYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788885407; x=1789490207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ar1cqiUGIhblAbeFXXUvhYbgZ/09secUyh9OrIqbTXI=;
        b=C4xhjiBYgKl9K81hDkpHxRIhzR5h83VFZfBokdaj1GKk65AvCzVRyZ3VF3C/3pITdE
         yIVji7wgw4F0Ko5/7TJd6LzuuX69+vsspxNPO+NuAMzIoa0YZTI+5wUSiMCxUDRPN5Nm
         4FPaCwS1wSe6D7dnYZl1x53GtP2byurVFrSp8Rx2cEB0XMnxlRDF0vetgmYDDQv/Q4aM
         zJZMLqG5f2hEQBVTL3s46hZ2nwQq7HUVg4872hoe7J481ViNfVxr4ER2Jt99viIiD2CQ
         gYc2/VDKAIJfC3QwT/3c4jbfhPoGVS35JeNYbEOMzU6rdqBKIHJ+M+7sl2SJsudmI+3w
         rtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885407; x=1789490207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar1cqiUGIhblAbeFXXUvhYbgZ/09secUyh9OrIqbTXI=;
        b=iBWrJHpw8RHg7MeoPV8O4rBJc2hZG8BqAY6Alr9p37xTFJleJyolKKrlPHusY7ZB2t
         hnCRwAtN3bCBWDKp5+UYzS3tmNvO3+bstK8GR9Lx8ErtrR64FnP0BUPiOKDTfmOadN+6
         7NoUKZUvs3DiWqZDEZYZb+bg5VSO0Qt7MK+AFyoFagMn8mlDFy3ArHaX5e1+V0B2561h
         47KCDT8vpuLmY3qGtskdLSjddbWLGHBnIuzs7D7dHfxcSi4qzMjlAOD3OCuWwODSrsSQ
         SKFbfAtQrJZNAzrsQ6wEfdqAPt9J/Kg5pO9eXo1Hvifapvni+m21npSrtS74Y2e2PGHh
         yREg==
X-Forwarded-Encrypted: i=1; AKwUvBwCQZYz/SpPSk4EinFGDhV1n1NIytvFLQr6XvemVPW+oAW0CHeZB1c4WqjHJC4ye/N47Ge/oLsu7XrqMys=@vger.kernel.org
X-Gm-Message-State: AFuF++mVbLNhm5OlZKZph0RjwaqgL2eXO1lL1Q0MhVLBkOMa7VF/m8IB
	oremU+V2IhVanbcI4Qsz/g0klSea6oYDI1FkYduLgQZR5T4mXgiW4BA/a5gvFK/YHfCy72wd4Ss
	sqW7r+YyxiV5EaecGHIDOM2Vd1aCf4LCmxyk0L3e6
X-Gm-Gg: AYBFou2iZUUkS8OGYawGieP4K9rsKLMJod16vqyEvzUNh0e+OJj49GuQMspS3o0GtG4
	rcUSkDnyLzCeUQEH77+Ul2KEUbFVozk1b3HC/P0/N4e72jTA8WWN0fOGH9CCxyZtOOC9sdNkPyL
	qgxJswD9jxM/FYqvr6JRuEE2buadJwjq2/HCF8VJ85vJNDwvtd6gFCkW8optVP5uAAKjbNr46/f
	Qd6PBh0g7JK4u3RNcK4x7TFEKVeTB58M404FKGTKCOn9qcNnMOCbxS2sX2f70vl5u3t+SkbFDEi
	1wJ0abhgFriKoSwmBWOMaWGL5rMR4R3sGo3y6nu6Pw==
X-Received: by 2002:ac8:6544:0:b0:52f:4a75:f840 with SMTP id
 d75a77b69052e-530a3b5e4d4mr956091cf.9.1788885406535; Tue, 08 Sep 2026
 09:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com> <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com> <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
In-Reply-To: <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 8 Sep 2026 09:36:35 -0700
X-Gm-Features: AcwNN1XrNENRtIESxOS2O_pA2bNb7D6VHVKhEtTbgLjPfFAgl7jg-nWJ8NnPV2M
Message-ID: <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Prakash Gupta <prakash.gupta@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 12:43=E2=80=AFPM Daniel Mentz <danielmentz@google.c=
om> wrote:
> > >>>> +/*
> > >>>> + * Install num_entries leaf entries starting at ptep (index map_i=
dx_start
> > >>>> + * within the current table), tagging arm_lpae_num_cont()-sized g=
roups with
> > >>>> + * the contiguous hint where both idx and paddr are aligned to th=
e group
> > >>>> + * size. Entries in a misaligned group are installed without the =
hint.
> > >>>> + *
> > >>>> + * idx and paddr both advance by block_size per entry, so their a=
lignment
> > >>>> + * relative to the group size is invariant across a run of entrie=
s within
> > >>>> + * this call: once a group qualifies (or fails to), every later w=
hole group
> > >>>> + * does too, up to num_entries. This merges each such run into a =
single
> > >>>> + * arm_lpae_init_pte() call instead of one call per group.
> > >>>> + */
> > >>>
> > >>> Can you provide an example for when this function installs descript=
ors
> > >>> where the contiguous bit is only set on a subset of them. I would
> > >>> assume that the contiguous bit is either set for all descriptors or
> > >>> none of them.
> > >>>
> > >>
> > >> That assumption doesn't hold in general -- it's only true when the
> > >> map request happens to start and end on a cont_size boundary. For an
> > >> arbitrary map_pages() call it usually doesn't.
> > >
> > > I believe you won't see arbitrary map_pages() calls. I understand tha=
t
> > > these calls are exclusively coming from __iommu_map_domain_pgtbl()
> > > which uses iommu_pgsize() to determine optimal page sizes.
> > >
> > >> Example, 4K granule (num_cont =3D 16, cont_size =3D 64K),
> > >> iova =3D paddr =3D 0x1000, pgcount =3D 34:
> > >>
> > >>    - idx 1..15  (off !=3D 0, misaligned prefix):        installed pl=
ain
> > >>    - idx 16..31 (off =3D=3D 0, paddr now 64K-aligned):     installed=
 w/ CONT
> > >>    - idx 32..34 (off =3D=3D 0, remaining < num_cont):      installed=
 plain
> > >
> > > In the example you provided, I expect that you'll receive three
> > > separate calls from __iommu_map_domain_pgtbl:
> > >  * idx 1..15 with pgsize 4KB
> > >  * one call with pgsize 64KB
> > >  * idx 32..34 with pgsize 4KB
> > >
> > > If I took your argument further, I could argue that we'd also have to
> > > check if we can put down a block mapping if iova =3D paddr =3D 0x0 an=
d
> > > pgcount =3D 512, but we're not doing that either.
> > >
> > > Could you provide the input parameters to the iommu_map() call that
> > > resulted in the parameters you provided i.e. iova =3D paddr =3D 0x100=
0,
> > > pgcount =3D 34:
> > >
> >
> > You're right -- for the iommu_map()/__iommu_map_domain_pgtbl() path, io=
mmu_pgsize()
> > already splits the request at the boundaries you describe before instal=
l_leaf() ever
> > sees it, so install_leaf() doesn't need to handle a mixed prefix/CONT-g=
roup/suffix
> > chunk for that caller.
> >
> > That said, install_leaf() is shared by other callers that reach it thro=
ugh
> > ops->map_pages() directly, without going through iommu_pgsize(). pantho=
r_vm_map_pages()
> > (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_p=
gtable_ops via
> > alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consu=
mer, but does its
> > own chunking with a local get_pgsize() that only ever returns SZ_4K or =
SZ_2M, with no
> > notion of the 64K/32M CONT boundaries. That can hand install_leaf() exa=
ctly the mixed
> > iova=3Dpaddr=3D0x1000, pgcount=3D34 shape in a single call (panfrost's =
map loop uses the same
> > get_pgsize() and hits the same case). So the prefix/aligned-group/suffi=
x handling in
> > install_leaf() is still needed for that path.
>
> Maybe other people can chime in here, but I feel, from an API
> perspective, we should have only one way to make of use iopgtable. I
> think we should just mandate that users honor the updated value for
> pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
> alloc_io_pgtable_ops() call and then choose page sizes appropriately.
> Otherwise, we end up with two pieces of code in the kernel solving the
> same problem. panthor_mmu won't be able to take advantage of the
> contiguous bit until it gets updated accordingly, and that's ok.

On this note, I want to point out that I tried something similar in
2025 (see https://lore.kernel.org/linux-iommu/20250430231924.1481493-1-dani=
elmentz@google.com/).
The feedback I received from Jason at the time was:

"Wouldn't it be better to use the pgsize_bitmap and rely on the core
code to indicate that a contiguous page size is being used, so it can
trivially set the PTE bit without doing all this extra work?"
