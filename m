Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640B4DDB2A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357329; cv=pass; b=HMMOAOAGgotf+Oie61PW6lPnMBx0AQ8k4X3F/KTGcjpMl/VIxn061zuhj4RmvAyVUiUCYN4AO9mFaDNpZqLTLqI1bwstPaEByTl0jNPo+nwA7EQvrUCDogcCx0I0H6EA4y/a3Gd0OccwEZwIG8c4qauXSVyL3fgc0nB6zLqBhQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357329; c=relaxed/simple;
	bh=escU3Q+P3zWInrjZP9+4JGAHTeMsskmq9FXjRcMohoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxFpWniEA4COx2v/RKP1ldilWNtBxko6Jk0G2TGohia6ZjXsszin6/qNdUK5oELi+Pvld6SBz3lMvOOYEUC2MLRqZlbAz6Ri8U/TVT+cNjLRLDFeYl3lmBhSWU2RZa0Dt8NaWrYoplW5Z1qeTFGTp7VeftHuZdfTjH6TvkapehU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9yxLerV; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9yxLerV"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac01ff101so201988e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792357326; cv=none;
        d=google.com; s=arc-20260327;
        b=EHtwjBZqBh7ZJP18Sm4jNnaz2+ecsvRX6YEzmmAiNKv6lZKjuVWwpE39Q246Dm5vsr
         geHsXYI6FhPMGqRi3FUSJ4nymBPUYumE0NF2e8qp19FDut4QHdMn7oAVfr3S29i4vFFw
         Yo8q5O4c/7V0LjBIpxyHTA/z1zdxrfPETJyty0ZedNGTeMmeYF4iJppRLGNeSPfNcOxQ
         K5s8/s8TF6YHGdEZvd4vPi1WEuIvqbu7yPgs3gMFA59vIuqgndl046+QRq7PqPcJ4q2w
         ZOV93+UsQCciVeco5zO6+kbQS9XWn3oq71Fj0S/Etra9LGtA24Yhd60JlkWU9qHDt+Lk
         +NQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qy/eUVeUOjsCzAJiN1MNGTJCTNknQERtyP6Ddh4oOBI=;
        fh=VtcxxgeVO43LkukabHOYF6jTOec9BQzRpApgcp08GBY=;
        b=Xc0z7beu9hnPXxDDOpkPSxauBnuYtZaot1tddV2fR2n4RepoYT6Y/kKs3OK+G+Ajx3
         PwYmp128sXVygo8os3Mc+3mFlUxryW8DbnpP1R53axxvp/Ian6RdzvKcLL6fRSfNSSIc
         H9HsE9bN8HXAGQ+z5bm/qr1FyEtkMm2UhBKTg7fEcRIjyQvf3/Y3n7o5RXOtJBGtzVt8
         vfllXautl0KbyctvhE+By4LS9qsyLe5hz/3tBNIZ8LvnxF4Q0Khht520NUUbNT/8d3Ut
         qY32VBhlU9S2LZCpsYdxmlyrkc9zaplkoo3aDVYOJfVv6A1FXvOqRm/RtTjZCuGia8CZ
         U14g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792357326; x=1792962126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qy/eUVeUOjsCzAJiN1MNGTJCTNknQERtyP6Ddh4oOBI=;
        b=b9yxLerVZSFDSlMrB3Sqvb1c2CBc0S9R/x13M63+Iu7qSxr0uLDcNnzGrrmz6moqlp
         U5Agy1BkvOS5tab3cU6+EEQPmFVhv4OH+jU10xC6ww8zrcxR1Aoloqb15KnGA3j2j+eR
         6e8n97NeCGo76ppWF/M578Br4kqz09HO3iylmuzFeoSAP2o3VcHbT+3+NYk+H8TFvw4g
         UXvwSobiuH1GWJW+dweH/pcYyQWlimtV1WA+Glep+tkIfgSfdVfd/UMNmqV0veLsojBI
         1lf0R9VoTj9dEcVQt2Q5u9rOhOQsNAfE427MbLke+uY0UoEnYPwJW/cB8G67yBg/KQnO
         9EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357326; x=1792962126;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy/eUVeUOjsCzAJiN1MNGTJCTNknQERtyP6Ddh4oOBI=;
        b=2YxcqarP0+7TxQOlOyqbd4DyoElFRaPV+U9egERKC5aLDtCzCwn1lsNQz3NNdfMpcq
         hNYGuPZYoLvt4pyvqdD+J0v5HHWPBzuW4PCeBStndA0I8Dx00OvXdJyiprCFz+tEZYS6
         xL0x1CLitYpRRxzA5WEruE32XA2LJV682pEleDAhp+e69mdq+EbAojJQbKv99jLkSNBk
         uS/YP+vo/FBzp5jhIhvzF44JZlnprMZwd0VBk5rp4ThiM7KH2Hdsq44JIRGOQ0VzWBhV
         rQ4nBV23LAxUTHVRtCXrF0Y55UIoKn8Ps3GoaoTtdeS8zllk96cwRYHpKmlhGLPjjmoL
         x3Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwTN2tPSnoyfCRzPC53Y5UkTpyb8sblHCSKb/opdRIm3/AODy05IpjYs8hfRYaYygUzAHzwyUmi8Cnb65c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLNq6cruSWrfk8msMpITxMqgU2Nd2k4PftC/INb+4fvAX4lnsT
	Z/tuMb21cNpNKEPeyAKxM9n3+qO6ehamFpAGH8O8jWpck/2l5Ao7R/pEWb32+dwewXhkG7fvQNJ
	ai1pdXHu2Axo66sJfA+c4gvPq2T+v6mKCqg==
X-Gm-Gg: AYBFou1bILnCvmdRkdC6mCFRjAKZNicTzADj70hPLnhypAwrLMMlPINcd8pieEmjC5x
	5hMW61BdmLAUU/gRCb0dLSZ2413IJnwxko+JN4OLDGGXiv6IE0A///9MO27PL/tX4mBtDEq/sfH
	40FCmFPQfzr8sFfOci8n9VtRrzW9wVyoiYCWvPv8rvQvWmvNIjcy+/xsc4/yZasoDMnRqRB9TsW
	HHMwmohf/toqitbRIO9vrj+6jPEmUJu3xTg2CCnvqHatQpBdUPeCFtqd02xz9FRvEr8awm+dXXr
	sk01oUNaUR6JXzWjYWtdLr7WKXJCpRQtiOIc3IFFk5K6mSaIihn8Rl272gcpwy2ObEPRKOG31f6
	e1kJCOyflKMZjWArr8jts6yZYp2klcihTsj6+Ew8ozlIbaw==
X-Received: by 2002:a05:6102:548b:b0:7c3:c0b9:9031 with SMTP id
 ada2fe7eead31-7cc36b17a5fmr1262224137.36.1792357325888; Sun, 18 Oct 2026
 14:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018023349.1697434-1-gourry@gourry.net>
In-Reply-To: <20261018023349.1697434-1-gourry@gourry.net>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Sun, 18 Oct 2026 17:01:55 -0400
X-Gm-Features: AclHuK_otQGVJnFH3of7l6giChtEJc7SlCr0xXb-9-VAKMTt98ua1SNqHcfLZJE
Message-ID: <CAN+CAwMJZ929StJF3=5pJ8uO97u6pK+XrF3LwmhHia-rUO+dUg@mail.gmail.com>
Subject: Re: [PATCH] mm/mempolicy: apply bind policies against the scoped
 allocation zone
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, pasha.tatashin@soleen.com, mhocko@suse.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 10:33=E2=80=AFPM Gregory Price (Meta) <gourry@gourr=
y.net> wrote:
>
> QEMU fails to start a guest with a VFIO device when guest RAM comes
> from a memory backend bound to a movable-only node:
>
>   vfio_container_dma_map(0x55b1b1317800, 0x0, 0x10000000,
>                          0x7f39a2200000)
>     =3D -12 (Cannot allocate memory)
>
> VFIO pins guest RAM when the device is realized, and the pin faults
> the pages in. io_uring fixed buffers fail the same way. Faulting the
> range in before pinning lets the same pin succeed, since resident
> pages are migrated off the node instead.
>
> A long-term pin faults under memalloc_pin_save(). PF_MEMALLOC_PIN makes
> current_gfp_context() clear __GFP_MOVABLE, but policy_nodemask() tests
> apply_policy_zone() against the caller's gfp.
>
> The bind keeps its movable-only nodemask, and the allocation finds no
> usable zone:
>
>   page allocation failure:
>       order:0,
>       mode:0x140dc2(GFP_HIGHUSER|__GFP_ZERO|__GFP_COMP),
>       nodemask=3D1,cpuset=3D/,mems_allowed=3D0-1
>
>   Call Trace:
>    warn_alloc+0x136/0x150
>    __alloc_frozen_pages_noprof+0xed8/0x1720
>    alloc_pages_mpol+0xaa/0x170
>    vma_alloc_folio_noprof+0x65/0xd0
>    __handle_mm_fault+0x137b/0x1ac0
>    handle_mm_fault+0xa0/0x270
>    __get_user_pages+0x250/0xfd0
>    __gup_longterm_locked+0x116/0x870
>    gup_fast_fallback+0xcfc/0xdf0
>    pin_user_pages_fast+0x47/0x60
>    io_pin_pages+0x9a/0x110
>
> Base page faults fail with -ENOMEM.
> hugetlb faults fail with -EFAULT.
>
> Check the policy zone against current_gfp_context(gfp), so a pin-scoped
> fault falls back off the movable-only nodemask, like any other
> non-movable allocation under the same bind.

Hi Gregory,

LGTM, thank you for making it so easy to review!
I wonder if other places are missing current_gfp_context as well.

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> Tested in qemu with a dax/kmem movable-only node 1. io_uring and VFIO
> pins of unfaulted base pages and 2MB hugetlb pages now succeed and land
> on node 0 (correct). QEMU now starts with the same backend binding.
>
> Fixes: 8e3560d963d2 ("mm: honor PF_MEMALLOC_PIN for all movable pages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/mempolicy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 70298fded1b4a..0884c629670dd 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2302,7 +2302,7 @@ static nodemask_t *policy_nodemask(gfp_t gfp, struc=
t mempolicy *pol,
>                 break;
>         case MPOL_BIND:
>                 /* Restrict to nodemask (but not on lower zones) */
> -               if (apply_policy_zone(pol, gfp_zone(gfp)) &&
> +               if (apply_policy_zone(pol, gfp_zone(current_gfp_context(g=
fp))) &&
>                     cpuset_nodemask_valid_mems_allowed(&pol->nodes))
>                         nodemask =3D &pol->nodes;
>                 if (pol->home_node !=3D NUMA_NO_NODE)
> --
> 2.53.0-Meta
>
