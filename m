Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905E4CEE48
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350214; cv=pass; b=SNaaZmyxVotpPfhqc4/9mZDPTZKhv9fszKQxKW2kWp5Nh2BxKXYR4TTsYzYhbYyVEKFBJ7Dasri5UqtuiXpPCLutZMPk63L+AFfyjHrmvxqR1UmTiugwMRO3wuUm/zyy8Nrn/sl/FbEwStte57migpmakcxkS6xuGwzRgZ9Ecrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350214; c=relaxed/simple;
	bh=n4954fXz02c4Oj5+YdOqhp+44wJpR+Hr4ZJmBOKkwVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYjoYTcZMz+YyJ7nA4po3lAV/HPhUNKFMtmsTh+N6yWWTFOpoBHEr9TmJZfNi2Q/or112LyMWZekVReoQkVjXYQRLNLsepCP4WLjgeihl7siikxzXhnM2cMcIrRHqyLRUm6PTwViCp7G8oFls1mbSD2r17EI5kfnQ+ekqluw47A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JfYXZeRK; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JfYXZeRK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso58075e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350211; cv=none;
        d=google.com; s=arc-20260327;
        b=oslauyXPPeAQG0Y/oJ+MbILTgcgJQ+Es9EpVuIBfCIZKEFWe0NV0zqkiC4rMY95+3Y
         kheDvqHfVBwZr33hhil99tLa1GjMEPR8yRW+MpvDsyMuD2waWQLT/XCrvf9M1vPrBI72
         NUwzuWoKfmqPsINeagSwsYYgp8+T2i1xQMGzgVIELZQGtG/XX+mhQXms7TWtj2rupBml
         y9XI4VEOnF5rtFTExbCLG8aSNJLozZyvqM9N37shn7z8XKEmCr5OrfHVfrCIounMMXDX
         ji4F/rzLV4ilclHOiFj55cEupjIapMatJs2/UuAOUVhIp0faHN5AiL57bdunxRepjtEw
         euCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ROrsOcUgsvdnaotZ8dOgUC/WrOneg/H1WIYmp3Dbi2o=;
        fh=935yAi6rW0t39M68yAW/3cl7ve7tJr0EsNcXTtKyxu0=;
        b=L4l167QRfEsWDwxWtXpfLggJTEnffE6oawx4weeARuArTJBM/DJ5uCeuPDYht8RfcJ
         yQxMQbnqN53Tn/E/hQrGYHvrr64Bo4N1yGW4eLLnHJYbPym/5OIEFn6ufGqTUkX8Qxnq
         yBKS3OqCb2kDC8ntAs8m8S0LTUml5P49QqLEgNQdPq2ugcCQROK9TXaC16SYQF+W0uNc
         MPy2HieMvImTrb8p1mpGnEpZGSFlWGk8F1q0JXUwhC5PW1mhSECCKu9Arkj4KLZWAgC+
         a1mYQOnZokX2MLaPw79gSPNPibT8w6uUO6muRWGtVBcEd7kKX+CqOCqYqZ7pZNGv3i02
         c6yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790350211; x=1790955011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROrsOcUgsvdnaotZ8dOgUC/WrOneg/H1WIYmp3Dbi2o=;
        b=JfYXZeRKk+uo+6AtZ+rfAZ977i9l1p0mBf9rBbX/kWrI5TcybcuIR4Gf522f/5UTPB
         fDbzEwsEZcha+MJhIV2JKoIBFYARrvbYspiMSsa3rRKytjZs3gby81jzxx8toUGeiisF
         dGvZU+yC0u74Cv6qmCGyY7Rue4sVx9ZR0UAhj0cXyYgNGxI5r5li1AuMQq9W0dH9I2oT
         jpyXTJYC2EWY1IhacHEtrPyfTwDsZU73rjEZwnAj2asGOkVJnd6VpYcjXvxEgJ/TT0LR
         MXhacQBFV+kxg4M+YGXqE1K+NFirslVqtfMvawzo3dCRuKEteH+eT07u5hymiyxMFlRr
         AscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350211; x=1790955011;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROrsOcUgsvdnaotZ8dOgUC/WrOneg/H1WIYmp3Dbi2o=;
        b=IOh43KSXUq/Fvyaih+ZBuHGJ6v/3LTfr6FcQyTKi8sst0GUeIyDYpdn63uH17FyM2g
         0NOoyc2mjuwkH1+70rvfet0AwGRh7tLocAAsvJX/tm8diKtZBDOR7Fdg1VjMSnJr3c0R
         5jLJWkHanfOb6DWehZwHfOm/UWEUrD3w0SXCUWstmdM1LLm5figQXqwM6aG3s21c0HKa
         9L/ZyODXWm1lQDMNRyF1fmGtTOahTNXtKGUKx+G6OrU9y17qFvzqfHbB7CBNWQFIa9u4
         UbZYhW7gF60ScqfjRJqJzXMtAgO7w0N+BQakGurWykERDYsSAk98va+uguAJk4zJIhnJ
         2/8A==
X-Forwarded-Encrypted: i=1; AKwUvBwcE0P2svuO/DbbZCp8PFGOTyxu+wSMVJaVtSjXvUcWr7DycFrRwaQJaJA6Glfo+/LA7n4pDnTK7N12iJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++kHa6YaMg1aenc1e+Zm/J17fPxSCOtucUpEIxR3TVdS6CJYwXGk
	px0clPA/urcECjwez3lwoe5S5xfXM9gvaHmKeX76RbyiOxHiewqgeUq6Pcr93kcFq+NKfA4maLx
	V4YOwAWxhNBp/kcA3CJc96h5LBWxirD5CGp+gTv+S
X-Gm-Gg: AYBFou2OQWxy7L9634kNXI0lyh3XpBS/qkDtTBxDTlBOqOgHcURcNFzcafMXQgJlcYQ
	/foNJtwtq2NsGqzgIly881oFQDhGDCG4lthwTxCNSRXBjZ7NjhhFKI3QUpdO2yvY68Tw5kiA/4B
	XdNB8SHlXECgc0ZMNAsu3mzQs3ccq/az2U9+PIcHYyIhjQvWtlW0VMqNyCOzMVVYAGvLRPVJccP
	Q81YJBLazcoSF3gL6oDTWc+LCyUog1z8fTsJZO/Kk+cMO3seqlXrVmKgODygTIAEU5ewPaouQPZ
	E1Zs//pv+QH2BW2lne5SVgse++nyYLxEz51Y7VJ4TaFynsYhQDcZJLohATa9htL2cjcXywc9mfl
	F8C7AXPZiWbe0Mw==
X-Received: by 2002:a05:600c:3014:b0:49f:e12d:1a60 with SMTP id
 5b1f17b1804b1-49ff638a87fmr227415e9.4.1790350210427; Fri, 25 Sep 2026
 08:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417201913.2393655-1-jyescas@google.com> <df0a5e79-f2a2-4f74-868b-8f6291accb04@oss.qualcomm.com>
In-Reply-To: <df0a5e79-f2a2-4f74-868b-8f6291accb04@oss.qualcomm.com>
From: Juan Yescas <jyescas@google.com>
Date: Fri, 25 Sep 2026 08:29:58 -0700
X-Gm-Features: AclHuK91aA7NHqV433GteBTggY1TVKYNnE0__wEQzOG6MTG22gothUdiDWS_u9I
Message-ID: <CAJDx_rhLvcWV2-qzwVNG1DHnh2G4i26FgusebATLDj9zGg166g@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: system_heap: Set allocation orders for larger
 page sizes
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 5:11=E2=80=AFAM Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> On 4/18/2025 1:49 AM, Juan Yescas wrote:
> > This change sets the allocation orders for the different page sizes
> > (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> > for large page sizes were calculated incorrectly, this caused system
> > heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
> >
> > This change was tested on 4k/16k page size kernels.
> >
> > Signed-off-by: Juan Yescas <jyescas@google.com>
> > Acked-by: John Stultz <jstultz@google.com>
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >
> > Changes in v2:
> >   - Add John's Acked-by tag.
> >   - Add TJ's Reviewed-by tag
> >   - Use dma-buf: system_heap: in the subject since this is specific to =
the
> >     system heap, as per TJ.
> >   - Remove extra space in if statement.
> >
> > Changes in v3:
> >   - Remove defines for the orders as per Christian.
> >   - Update the order array for 64k page sizes as per TJ
> >
> >  drivers/dma-buf/heaps/system_heap.c | 21 ++++++++++++++++++---
> >  1 file changed, 18 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea16..8c10c0f2b473 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/mm.h>
> >  #include <linux/module.h>
> >  #include <linux/scatterlist.h>
> > +#include <linux/sizes.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> >
> > @@ -44,14 +45,28 @@ struct dma_heap_attachment {
> >  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> >                               | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> >                               | __GFP_COMP)
> > -static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_OR=
DER_GFP};
> >  /*
> >   * The selection of the orders used for allocation (1MB, 64K, 4K) is d=
esigned
> >   * to match with the sizes often found in IOMMUs. Using order 4 pages =
instead
> >   * of order 0 pages can significantly improve the performance of many =
IOMMUs
> >   * by reducing TLB pressure and time spent updating page tables.
> > + *
> > + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The=
 possible
> > + * page sizes for ARM devices could be 4K, 16K and 64K.
> > + */
> > +#if (PAGE_SIZE =3D=3D SZ_64K)
> > +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, LOW_ORDER_GFP};
> > +/* 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE=
 =3D 1MiB */
> > +static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 0};
> > +#else
> > +static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_OR=
DER_GFP};
> > +/*
> > + * 1MiB allocs are calculated with (2 ^ (20 - PAGE_SHIFT)) * PAGE_SIZE=
 =3D 1MiB
> > + * 64KiB allocs are calculated with (2 ^ (16 - PAGE_SHIFT)) * PAGE_SIZ=
E =3D 64KiB
> >   */
> > -static const unsigned int orders[] =3D {8, 4, 0};
> > +static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 16 - PAGE_SHI=
FT, 0};
> > +#endif
> > +
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> >  static struct sg_table *dup_sg_table(struct sg_table *table)
> > @@ -318,7 +333,7 @@ static struct page *alloc_largest_available(unsigne=
d long size,
> >       int i;
> >
> >       for (i =3D 0; i < NUM_ORDERS; i++) {
> > -             if (size <  (PAGE_SIZE << orders[i]))
> > +             if (size < (PAGE_SIZE << orders[i]))
> >                       continue;
> >               if (max_order < orders[i])
> >                       continue;
>
> Hello Juan,
> I've posted a respin of the patch by extending upon your work,
> Can you please review?
> Aplogies for adding signed-off by, will drop it in v2.
>
> Link -
> https://lore.kernel.org/all/20260921-dma_buf_improvement-v1-1-23d82e771de=
c@oss.qualcomm.com/
>

Hi Pankaj,

There is another change that fixes the problem and adds the 2MiB
order. It has already been
reviewed the Christian K=C3=B6nig:

https://lore.kernel.org/all/20260914212258.2657788-3-dave@stgolabs.net/

>
