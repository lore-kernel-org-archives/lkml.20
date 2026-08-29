Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509D8FC0A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788014247; cv=pass; b=rg6k4HYk8pQD+DU+T+goK8qgAogYfqzzNUVOtg+7qfrRMayiz9gjMPENbjVM8HBDhC4wEbMU1mFVJeYzn97XpZYGbiO2XyAgZIrbtHbpAKUCPD3B85WJ+tVs2cOg7lJ4Rj1sjfjQMUmzdiPfVmZ297UCWUY745IZfOaCrYHyqsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788014247; c=relaxed/simple;
	bh=MgA2NGVooXkzTgVF6+l0Vmm7WuBIDGGtn85djZqTNkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTExkk4pny3huvt6ROsl1rgK7yTlRzPVCOuHIoHoC860qiOQgJFjLO8+M3BY4XmZV9kDWpbY5zMt8x/1DFwUyvM8GAA8ErkCyVbfYIribI09GyaJfL203dz3hqCWmlh2dKU7HPGN6sHZA4aQ5HuaovtqP9nNn5ZxlxJnnSWoIcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEjjXMtX; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEjjXMtX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so17053565e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788014243; cv=none;
        d=google.com; s=arc-20260327;
        b=aGjIgJN9PJ0/zZvby4sOFfThYsTAGsHJQ6bo/9xOfrniZTnPytRC84h5YNV15X+syS
         jg/PWtoTRpEMWgcmEPMKNzBWLecZEloqy6mfuq8iJ88EdzfKPZr1nQAr7hwGC7yNIXkB
         N66uX/cPi3dwIbkmqdPxABb3DFWb6ZnyV18TXrOq6F2UAIS5q0SdGln2vcodrK4S70bb
         eTR4kHA72O5AePuTHItRf1xbp5myPxwf7AB9Z/w9/lAnSdAtqiDujGWOrzZCOZWM0kuC
         DNmoIYT15BrrQ3FbYk3h8D3mh648uNeiBYfZJSR3gnZQ1Io+1+JwYN4kq0y3lT3TVbRs
         sVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ9OdMIWwS+HeVefiMGtXz8F2WL73A/c0lBq2ihg7xE=;
        fh=THGlnI3kPYYrpICgoKzdB06FtxMuig0lZXNWWMaH0xo=;
        b=qrvsU8st6vEOoNRgKlrmLoTG6i5OO/w/UHiRKW6huzh6h2YKuH9VfZ3CenmYRwKs85
         2V2hJVZthdsRE5NZqziE4+m7oEJ77PX8qLGic6H7i5Bl0nFTzlQ4mDhNuoNHbXe6R7+s
         91TFtmuSGUCADjPUhooXnevIToBoMqgPD8LwfJJRxeLO6H1WhvlVdl6h6wO2Y0vx0PvH
         mWvCBzx4ZOVZfBfbgZq9Fu4JmAxQ0SIqqTs4gFykaiXD63WL/409vRUP3Nv4wkv5aQ2q
         omRbbrcu2RoRDGxsuADbEoAZrna9gAwv0ylvf4JYUtuGHXjgYm51E1x/V9q+QeMhbrW2
         Lb8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788014243; x=1788619043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZ9OdMIWwS+HeVefiMGtXz8F2WL73A/c0lBq2ihg7xE=;
        b=kEjjXMtXu39pMB9C5faeYrlg5lKBrPZ2ravxMQuZnrLbuCiJWblFeFmLDryjUxrNgz
         u1DesDjOgH7iCZC6MM+1hUWUODbkgj0bdo/YcctesxGHlbd6en2R/V3oTeQPDaTLegmV
         XuVrjcaiD412UIEFYbJSjCv8Etuom0zDzQzGvRLKDg20AVqDcLfBGjg+ZrLShGYoyhBe
         6c5fCS/pRG2neBzBkWSUPP+iLSIAt85FEh5k4pNUbuTo4oIVwbZrF1M2ZolEjLJC9rAR
         kuqKjsHijkrwBRjDmK0hpnaHK/8EioyHey4J98NHfaK0ndp0yvQHRsW0OOtZNqCtjAqL
         6egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788014243; x=1788619043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZ9OdMIWwS+HeVefiMGtXz8F2WL73A/c0lBq2ihg7xE=;
        b=fBapYlMh35iAMUH3GyFojSg8cHPYtuFPq3xZ9l1Yelc9q0z3lbVrvf1lvHPy75naQ2
         Uk7RK0m4i0gn/JRaGCI3Qm4Cz4qOpdHbb2rwjttRc66Q0Yn0KGAOt0nQrOT5f1VxPyKn
         kvhJc9mca04ARKYuUN01qxoDdppHI1K13nbjZxNLSzOnNh+V/qmeXD3uH+F6Ca1tVdmH
         0nHmnXa/IBVYNHwPqvj96/kPFpTvLc/fRmLH1JJ9NIowlsaYv7gqkIYWyFEGiKmr+wEb
         yipep19Gtx/50rmozCA5oFZv1r/R3dbXVNLJm7915FEDfqs3oE5Ctn41whgyr2h4+/Xm
         qw6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoP+o5v+paM9hkpa4A9GlvNpz+qKuhmTXigDtlD8RKMgFPU9Gb9frNhqzIQgtd7B4i+MeRAkZUP82k+3eY=@vger.kernel.org
X-Gm-Message-State: AFuF++kkhwgJ3uKq2lxKXjOdewKFrmZBdxFDSgVbaMhcHqw4i8lj8uzM
	jChyJwxn1/9s9g2svRQaQTiilbKv7Iytxg6p9ZQzkkRO0LJbax/k58yr9cG72np36lU4Zh+k646
	0OcvYQQZKsRzzomZ2lr8IPSunCdlEKvk=
X-Gm-Gg: AR+sD13z/xyYGUM8x+ZcApOw6clfLg5zEZec+vbH9R92ERRmittpFFssD2CXR5yVZF3
	lkmGigAf5w36n5AGBszoMhE0jZpf8xWW7X984cJMhWLX2+fNc6EYFQkJ51huj94WTM/12Qviyum
	73fPEaz3SH400vIkOkYlRKIgT/64aA7hMSO92UHxQcxDZDIQLBDGD/JZOpDgM6FBaABUiomB6mk
	XF2HeL7KgYYTBqep3/DH0jWtgPXFCubEPBO5K7k7rClter7gPP+0svA7GA1oKUe+AjJFtdx/AgO
	1NlBoaSflGCLvqb0cBEgBlsNJ/rXlMcQ5enj0Np8b/skDKo=
X-Received: by 2002:a05:600c:190e:b0:49c:799a:177b with SMTP id
 5b1f17b1804b1-49cca2b74a0mr76687805e9.2.1788014242555; Sat, 29 Aug 2026
 07:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-mremap-fix-locked-vm-v1-1-c80be7505d1e@kernel.org>
In-Reply-To: <20260828-mremap-fix-locked-vm-v1-1-c80be7505d1e@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 29 Aug 2026 22:37:11 +0800
X-Gm-Features: AcwNN1VHoiYexiUTsHD52g-4kbK1C6nEM9rzNia-_c2hFJVdgL6ptuoVUWOQi4w
Message-ID: <CAN_Opa9CZUTUyvveTnVXK7Wy9Xq-9wc=QkASceLv5hTE-NiNnw@mail.gmail.com>
Subject: Re: [PATCH] mm/mremap: account mm->locked_vm correctly for MREMAP_DONTUNMAP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

Thanks for the fix. I agree this is a very clean solution.

On Fri, Aug 28, 2026 at 7:20=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> When a VMA is mremap()'d with MREMAP_DONTUNMAP set, that results in the V=
MA
> being copied, but the source VMA not being unmapped.
>
> If the VMA is mlock()'d this is a legal operation, though the source VMA
> has its VMA_LOCKED_BIT cleared.
>
> However this is done in dontunmap_complete(), after mm->locked_vm was
> incremented via vrm_stat_account(), resulting in double-counting.
>
> Worse, this is not even corrected when source VMA is unmapped, due to
> the VMA_LOCKED_BIT flag having been cleared.
>
> This all works fine in the usual mremap() case (without MREMAP_DONTUNMAP)=
,
> as the source VMA is unmapped with VMA_LOCKED_BIT intact, at which time
> mm->locked_vm is decremented accordingly.
>
> Resolve the issue by invoking vrm_stat_account() only after
> dontunmap_complete() has run.
>
> Note that MREMAP_DONTUNMAP requires old_len =3D=3D new_len, so no need to
> account for a delta in size in this case.
>
> The bug was introduced by commit b714ccb02a76 ("mm/mremap: complete
> refactor of move_vma()") which incorrectly reordered the accounting and t=
he
> clearing of the VMA_LOCKED_BIT flag.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260825-fix-mremap-dontunmap-pgof=
f-v1-1-39a40b2c98b3@kernel.org
> Reported-by: Kunwu Chan <kunwu.chan@gmail.com>
> Closes: https://lore.kernel.org/all/20260828094823.594279-1-kunwu.chan@li=
nux.dev/
> Fixes: b714ccb02a76 ("mm/mremap: complete refactor of move_vma()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/mremap.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 2b4b523a86b8..7c368440fafe 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1355,12 +1355,11 @@ static void dontunmap_complete(struct vma_remap_s=
truct *vrm,
>                 if (vma_is_anonymous(vma) && !vma->vm_file)
>                         vma_set_pgoff(vma, pgoff_unfaulted);
>         }
> -
> -       /* Because we won't unmap we don't need to touch locked_vm. */
>  }
>
>  static unsigned long move_vma(struct vma_remap_struct *vrm)
>  {
> +       const bool is_dontunmap =3D vrm->flags & MREMAP_DONTUNMAP;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_area_struct *new_vma;
>         unsigned long hiwater_vm;
> @@ -1401,10 +1400,10 @@ static unsigned long move_vma(struct vma_remap_st=
ruct *vrm)
>          */
>         hiwater_vm =3D mm->hiwater_vm;
>
> -       vrm_stat_account(vrm, vrm->new_len);
> -       if (unlikely(!err && (vrm->flags & MREMAP_DONTUNMAP)))
> +       if (unlikely(is_dontunmap && !err))
>                 dontunmap_complete(vrm, new_vma);
> -       else
> +       vrm_stat_account(vrm, vrm->new_len);
> +       if (!is_dontunmap || err)
>                 unmap_source_vma(vrm);
>
>         mm->hiwater_vm =3D hiwater_vm;
>
> ---
> base-commit: aeddb4d52acfcc5ce5e988acd48f2906fe966ca3
> change-id: 20260828-mremap-fix-locked-vm-b8991ffc4181
>
> Best regards,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>

I tested the patch with the following tests [1]:
1: test-vmlck.c =E2=80=94 Andrew Morton's test for basic locked_vm accounti=
ng
with mlock()/MREMAP_DONTUNMAP.
2: test_mlock_onfault_nofault.c =E2=80=94 MLOCK_ONFAULT with no pages fault=
ed in.
3: test_mlock_onfault_fault.c =E2=80=94 MLOCK_ONFAULT with pages faulted in=
.

All three tests passed with the patch applied.
Tested-by:  Kunwu Chan <kunwu.chan@gmail.com>

The fix also looks correct to me.
Reviewed-by:  Kunwu Chan <kunwu.chan@gmail.com>

[1] https://github.com/KunWuChan/vmlck_test

Thanks again!

Best,
Kunwu
