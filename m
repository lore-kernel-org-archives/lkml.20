Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4437CD40
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842180; cv=pass; b=TJm4juhjDOtli20ahJFwQz5pxNvULl1ODxPu5SsZmjHraG4hkKIfbbaEFFCgMsjpOTPUL/xsbhDjSn4t8mI+ZqNqdXeIeSIA/7rXrQDTy1J6zD+C0cbUpLvhBbb6cuXwGGuPfM3AINRLzW3botcGYGwEuf3EwFoF0XO923Na3dU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842180; c=relaxed/simple;
	bh=jm2nHaih5BXHaeOFhCL9tqX2pECpTwOmWm/uHwiinw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMLTjyXez7yXxKwOiZyK5NePbVWg+T2rBuqPoD6W4PjpwK8UUffAJEx64r97Z+4ij3JK4l1rd9vzuPZXWeUDh3fnD3O2iMOTx92v2WHVlw4EBpHQuKCtqaXFjkJW4RJSj+KVdDZ5+8lkH9IZHZjDapfWxjl4Dl2eSXi79Dt3rB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYukGc2S; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYukGc2S"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afd5b1678so925104f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790842177; cv=none;
        d=google.com; s=arc-20260327;
        b=cgJNPGgIxyGz8l6zBH/ao7IiupFaKWBm/j9xGu4ODYS4XuNle1Lg3Zon/HbsV0AYtx
         j0sKL791+K5hyXIzF+dZwWqF8oK7jyXNGAz+8peE1cxvWw/hXpSXDHYIFmqvjk17jnsl
         xD8Ir3PsljlswN3dnAi9nTqaj8vdq7kzS+pCPo2UCbEqyIyYQ6T7e+RkKbrUKKYZaO25
         +A+3zlmiYL1YYHdtXXEXQnPcwKPx7Eia5Rcp/7mn0Mk0nWpp3Kxfhj1Wo45iCnwOR/mW
         3OGnF628G7BScDwvXE45nXsJmqpWw9BIa7LOkQnHAIEYzdEBOzO81CtaP0rsuIC9ISMh
         l1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7WUeRXQIxnR9XpkkjIeWQnzVeCWSoXoruQ6cCNl/Q6Q=;
        fh=eBCIUzhbaAytbvHexurMd2va/dBwLROHy9nmcVXo71k=;
        b=EhAIZPfiC71KP7CV4teoAd2NkhDNBDDZQpIN3U4nNMRHxRY5eP+2s1K4yqxoTvnwuP
         oObeI5SjVyOu7SyOE5MSFU1nqdxoOLKnNixOcYa78riLyIox1zvN7o+nKAfyzQDzRSEj
         TldmB6GbJfcQCK/4VVXTRpMc40mfZzX+oFGTgr6huUHs3UCRWGAJn6pu6HMHWzfpr/5V
         c1R0RYdgzfKq2ZbECaFOWKt1619rY4XddTdI1aqoDehpx86L5KuvYvJBxPnDYC/elVoM
         X89F4oEXZQk1vGkIeYzUURz2V9ED/U5RTgsCA78uHz8QEJM5dOl3f7kfNLbAa3EW6cNa
         coOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790842177; x=1791446977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7WUeRXQIxnR9XpkkjIeWQnzVeCWSoXoruQ6cCNl/Q6Q=;
        b=lYukGc2StZXsrmxyofgrVlLNi5W6zKIj8JNFUzLnLQlUTuaytUGDJflpJDeuSEXU79
         Y6MhZ+RLx7xcGu+N/E+2S131s1faQbMkCUajgdnd31U4eGX1SXnXn7ZNChpc4yUPkEbI
         BiolI/dDQv+B3CRnkHzUWSXogyZOotZjRsT0fznBCRVei0J2aDhkb44GSeGbq/oXvBKH
         IyFzn0lt1dqfmBq2tjm3sxvILBVjul5uD0hT4XX+VG+mDPN4yIujgtYY5Sn3sQCBNTzH
         sh5MVgHZq6LrKeAzdnrcKncr+gK+WyTzyZewSBGmrrbCsfIO7vLmAejskEMOlQcoXZAU
         rb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842177; x=1791446977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WUeRXQIxnR9XpkkjIeWQnzVeCWSoXoruQ6cCNl/Q6Q=;
        b=s//1Bpa1wPzZaHvHuN976wyDAJR2h4Ca5ZovTVatOd5kjxmndI58c4lc0XI948ouvH
         u8lNMSpkXLOMvnLhRY2Vx0H/n5h82Hduj0/OMB5Fr7a10XM/1oDVLmxaj1Rl85Jc7pv5
         HyIhylmEAgmUWPOjEg9V4IceLt11ei4C/T8ERnb6CnrgrUj4fWtAj1NA2okeYHtFbFt7
         23KsmEw60A/yhiy37v/h0pXhXWLpa05/fPs0+vc4aJuTxNOlEm9ZYyYBY9rcFOBpB0/K
         btCoH9/XpHJgzQdy2aYcuGEX4WHfCa362FBZezexc/36OgNFBoPth2OFsodmgkla3cYq
         KckA==
X-Forwarded-Encrypted: i=1; AKwUvBwPScef/GqF3+7T+9a/jme+mwS10XhdOmfaqVrhF8vosY/vQeW4PhzbemRZlORC6juihkVswSdX56+xhrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjeIb1LSRU6TREXjzDOS+eaxojJ3IyrdRsHZN73JdXGxTxrXmi
	W04j/ovmZvxD/Oz9pkHl081XYf9YwT7n73/YSr8EbgafIU2rhAAOBYLomtX9DdC3D/qpFGHehxG
	R2uWrD0SU8Fa7vT4TeqE5axUl5bT4RZ4=
X-Gm-Gg: AYBFou2aTeYPBCkGUxKK8lLa5PyuxVH1oVN6/K+5il42Y3W4rMqe5vzLh7/0Hf0zLeN
	NdFuYEfScbgMAUOLjfcf7CG7unxeh5jOaeaXRVv84eETS5O2Zk6yzOV1WM5RoJmFfz5zMs0FsU0
	jTNRtvEp3Gl4t+IQqm2chDcUxDGuVXzzbv4oFgCH/+Cnn62FuROwhY1GKo0bulqAaObaqJOtmih
	zkpGSKdqwnA7cZef9WQ1wN1HhSVkm0UGMrNCzmL1h3vmZgPbFez9NMxfTO0eN1ZCIvrmWxjuYwz
	ZNEfZqd9bqnxqwE71PALKTdQXa2Msto4RTsC/UmCL8/SEV6Ncv4e30V7
X-Received: by 2002:a5d:6f0d:0:b0:48b:677:f80d with SMTP id
 ffacd0b85a97d-48b0677f9aamr3770293f8f.26.1790842176618; Thu, 01 Oct 2026
 01:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-10-jiangwen6@xiaomi.com>
 <ar0lMkKxugZV7xyw@milan>
In-Reply-To: <ar0lMkKxugZV7xyw@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 16:09:24 +0800
X-Gm-Features: AclHuK8OMAhb_UVj1_7OhXb2I-BHJ5VHW4np9K-mqeZSCcIAGrWhZjO-kRMUNUQ
Message-ID: <CAHKocdEqnCCyW1TgmiRotFO0hQdHt7pXP1sdqzZ7Up6wc+-Bsw@mail.gmail.com>
Subject: Re: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sept 2026 at 23:05, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:31PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > In many cases, the pages passed to vmap() may include high-order
> > pages. For example, the systemheap often allocates pages in descending
> > order: order 8, then 4, then 0. Currently, vmap() iterates over every
> > page individually=E2=80=94even pages inside a high-order block are hand=
led
> > one by one.
> >
> > This patch detects physically contiguous pages (regardless of whether
> > they are compound or non-compound) by scanning with
> > num_pages_contiguous(), and maps them as a single contiguous block
> > whenever possible. The mapping order is determined by taking the
> > minimum of the contiguous page count and the pfn alignment, allowing
> > graceful degradation when pfn alignment is less than the contiguous
> > range.
> >
> > Pages with the same page_shift are coalesced and mapped via
> > vmap_pages_range_noflush_walk() to avoid page table rewalk.
> >
> > As users typically allocate memory in descending orders (e.g.
> > 8 =E2=86=92 4 =E2=86=92 0), once an order-0 page is encountered, we sto=
p scanning
> > for contiguous pages since subsequent pages are likely order-0 as well.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 80 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index a43965016eb4d..37cddb7f45a4f 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t pro=
t, unsigned long size)
> >       return arch_vmap_pte_supported_shift(size);
> >  }
> >
> > +static inline int get_vmap_batch_order(struct page **pages,
> > +             pgprot_t prot, unsigned int nr_pages)
> >
> get_vmap_mapping_order()?
>

Agreed, that's a clearer name.

> > +{
> > +     unsigned long pfn;
> > +     unsigned int nr_contig;
> > +     int order;
> > +
> > +     if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> > +             return 0;
> > +
> > +     /* Limit nr_pages by pfn alignment */
> > +     pfn =3D page_to_pfn(*pages);
> > +     if (pfn > 0)
> > +             nr_pages =3D min_t(size_t, nr_pages, 1UL << __ffs(pfn));
> > +
> > +     nr_contig =3D num_pages_contiguous(pages, nr_pages);
> > +     if (nr_contig < 2)
> > +             return 0;
> > +
> > +     order =3D ilog2(nr_contig);
> > +
> > +     if (vm_shift(prot, PAGE_SIZE << order) =3D=3D PAGE_SHIFT)
> > +             return 0;
> > +
> > +     return order;
> > +}
> > +
> > +static int vmap_pages_range_batched(unsigned long addr, unsigned long =
end,
> > +             pgprot_t prot, struct page **pages)
> > +{
> > +     const unsigned int nr_pages =3D (end - addr) >> PAGE_SHIFT;
> > +     unsigned int prev_shift =3D 0, batch_idx =3D 0;
> > +     unsigned long batch_start =3D addr, batch_end =3D addr;
> > +     int err;
> > +
> > +     err =3D kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> > +                                          PAGE_SHIFT, GFP_KERNEL);
> > +
> > +     if (err)
> > +             goto out;
> > +
> > +     for (unsigned int i =3D 0; i < nr_pages; ) {
> > +             unsigned int shift =3D PAGE_SHIFT +
> > +                     get_vmap_batch_order(pages + i, prot, nr_pages - =
i);
> > +
> > +             if (!i)
> > +                     prev_shift =3D shift;
> > +
> > +             if (shift !=3D prev_shift) {
> > +                     err =3D vmap_pages_range_noflush_walk(batch_start=
, batch_end,
> > +                                     prot, pages + batch_idx, prev_shi=
ft);
> > +                     if (err)
> > +                             goto out;
> > +                     prev_shift =3D shift;
> > +                     batch_start =3D batch_end;
> > +                     batch_idx =3D i;
> > +             }
> > +
> > +             /*
> > +              * Once we fail to batch pages, we expect to fail batchin=
g
> > +              * for all remaining pages, so just give up.
> > +              */
> > +             if (shift =3D=3D PAGE_SHIFT)
> > +                     break;
> > +
> > +             batch_end +=3D 1UL << shift;
> > +             i +=3D 1U << (shift - PAGE_SHIFT);
> > +     }
> > +
> > +     /* Remaining */
> > +     if (batch_start < end)
> > +             err =3D vmap_pages_range_noflush_walk(batch_start, end, p=
rot,
> > +                             pages + batch_idx, prev_shift);
> > +
> > +out:
> > +     flush_cache_vmap(addr, end);
> > +     return err;
> >
> On error, if kmsan_vmap_pages_range_noflush() succeed you do not do a
> proper cleanup?
>
> i.e. to cleanup KMSAN metadata: kmsan_vunmap_range_noflush(addr, end);
>

The KMSAN metadata is cleaned up by the caller: on error vmap calls
vunmap(area->addr), which reaches kmsan_vunmap_range_noflush() through
remove_vm_area() -> free_unmap_vmap_area() -> vunmap_range_noflush().
That is the same contract as the pre-existing vmap_pages_range() path,
which likewise relied on the caller's vunmap() to clean up. So there
is no behavioral
change here.

Thanks,
Wen

> > +}
> > +
> >  /**
> >   * vmap - map an array of pages into virtually contiguous space
> >   * @pages: array of page pointers
> > @@ -3619,8 +3698,7 @@ void *vmap(struct page **pages, unsigned int coun=
t,
> >               return NULL;
> >
> >       addr =3D (unsigned long)area->addr;
> > -     if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> > -                             pages, PAGE_SHIFT) < 0) {
> > +     if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), =
pages) < 0) {
> >               vunmap(area->addr);
> >               return NULL;
> >       }
> > --
> > 2.34.1
> >
