Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828779;
	b=EOgiua3h5pAT6kbnG90+6+oh6fGHHRuo4WCW1VUdSOTwvRW89iWJVyAPVwRZ35QmxMJY
	 bJru6bCj54TtKPiM082E3GnExk7UnqcUHv+q7PI+ze0p0uWak/MEm5Kp3TLdU96k4HFHK
	 TcasdM+2yvolwAZFm5tdWKpjP97bjPhff/8OZeHwFqvqsI5TEVtut2l9/MW9BXVrg0LiA
	 sVP3RPwEUJWrXjUFEaJBGSvdBSKVlaXjkQdRwLrnXPhjIEa6D3BJFDHqbM1b0ZmYx8EME
	 AYxUc4s0E9b+oahDdN1xwd+T2hF3/x6jYSifgSA16slLgC9SXnzNIBaFuS5LUE4QCxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WkFbdpqrAcDUqj+SkzGRxAQW493jh+pNn7c7c7yEn/k=;
	b=knxaO1E7YhuXtvWNEeXxhZw3Q+L+FukIINhquaPIgUH4szinq+miG7cUG7MBH4FBMnrQ
	 qb/uvfa8T+JrOLbaT4COZe2V+QieiPu2P3H12qJjuKQyVc5/Kt5IVMKWAGs8GJQekx5yD
	 gOr7lxNXWfP0N51C1uwnWfTBrYnbErQd0Be1ReqmpC7UnaaLfVZJAq0JNrQgRPKjLK5oS
	 WGRvWyp3IA2YDECM9aKD1mQUeZcB/S+kYcjaLAnY7sTFl+fE71DKNUF8Sfrov6DHK1rQ7
	 Yt3w9TTJvjIbovy0HuUe/xNlzsKvATR/WW5ISbLF0fbbMqKLbnR0g1uaMnWgJ8jtzCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRraYadp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB1606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FB1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRraYadp
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6798af41644so2299127d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:32:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828778; cv=none;
        d=google.com; s=arc-20260327;
        b=SAErW2UxNR3HxFoN9RYuJDJdflEZQA2qr2wtniB4E1ejpQKrrE9GBdeHOY6cNtxAzI
         GQue4g2oOF7JH7Fo34ZVNYs+nNE8nCdlwnKGmZuqClz6hDh2OFy59tYHNW7m8U5BN+Kg
         +hUh2fzoYO9WSRVOplIBblWgA1ShCastspZZ0TTf7ROp5sOGdkCeHDXBtmbMu0o03Afl
         6MfzCPD3TmonM5VF8CzIC++nGUVfTFJGc2Pt4RB5ofx5P2mRqN8uzCOPZlJixaFxCfTi
         Gq2s6rdzy4R0JhBgUiKLCidy4xXAY+41pCtLtNJwg0b75mWQI29o0M7iD3zQfiYx7fQ7
         EYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkFbdpqrAcDUqj+SkzGRxAQW493jh+pNn7c7c7yEn/k=;
        fh=yD6E/iMyVJpL0pPUDkNcCMZCaZq4hbRs5ZQqTfb5FXI=;
        b=Eo/dua/SKf/EP59VDhOCJGVz9/nPbrBPibbPS3mA0dYAabMABy6zZHWUklAHggV2jq
         Dq+npw6uiLaYfQj4feXG+9MgBVumcdoA3moYAV/E3RmfLVzCwCW7wb1yDFkbPuqwzgqc
         OYR7V7bH9GiE2lH+q7+sfUkVXsRF9SpLpKqEEwYf5KdT6f6+OWKu88Vn3Xbu22KX2qWq
         7JAadW/i1aVF9n98IJMB0TLKDpXZV8nswYg3Z1Q1GY8aDszAsyoEcyNQZpLbff3SBR5h
         ou6c8+e3L63QzHfN3k/ogl5DsTQDmDWqLMld8EsCCy1qc7Cb9UvUMJrna91hxKL6KCWy
         ET+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828778; x=1795433578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WkFbdpqrAcDUqj+SkzGRxAQW493jh+pNn7c7c7yEn/k=;
        b=vRraYadpNIVw/RbL/WNQGKYvSUeBs7DtrXW57WxAjtGzSdi/KYjHctMoQLXvM9FfjM
         GNK4kBMFG3jAIxtlj5M6RY7SJOEGeQqIWReAPor+voM6n1E57lABvaoVY8KgajT00kkI
         7wpaw8em6yCeEcvT766ZTBCENPyrw4BAxB6wHn9Pbn6G2AY5PjtwT52ajkVSvb1nrbve
         1+3HGcpw84IEVT8njKEZc8yvyiNleQQaWb1N/yiUTLM79Wdo+9/9DvUqepNcr15SZWQ3
         9WooTMQD5AYwcysCpshL6uTLOLrPlV1SnRb2Mn+q39W7TsPi9ArnafyVidFBwlyAk5Zb
         sMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828778; x=1795433578;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkFbdpqrAcDUqj+SkzGRxAQW493jh+pNn7c7c7yEn/k=;
        b=HtCZdvj9BsrnnEv9ehKmgSUrQDjIE2Wq5katdITQ9i1nhLlLdblhg4jFLWYxf+wyNC
         DZayEDDKSdOd86E3PeG/zU/5EI6FWUGmRSONmBmMrx4M8JkmXjh+/t6qBfvo5kZ4WY7U
         Mz0wYs0LD8sz8uQtByQIdtJoqFez3nA5Okc0WgjCFYiLej7KSTq+eBovw+gR377zftpc
         rXzvWY/GVR2ZCBC3dlLDUEPfxRWHO0T9/FlLjyfWwTed8vYiZV68XtlY8eGwTHZrxS0S
         2kDVQ4HKX+S1DQ0MT3fgm6IvjoALc1VdiAqXq/sWEoc8iz5WerjdXPGfndgJ1aKgqIBK
         98lQ==
X-Forwarded-Encrypted: i=1; AL+hErEzBx05+hQAjzubD0ihKBc4+wuGwh72enQFBaYwpMCQ7QXR5rWOAH4DGyzzQVj33LUCqW/rmSu8gB5ib9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CKHUF5WKPJElGazmzcB4nBymg0QpEm9NoNi5pe3B1gjlewyff
	IhsBUiUvZ/FADSKsbeNvi3At7FVVzXqrBTSGm8rQKc1AJ7i21GnOI1EFNy3WJ4zjroWxhvthcec
	NPuZ+JFEmQzoWOoMYpf1VHEfE5fRbRdQ=
X-Gm-Gg: AZFdTZf2DrdXe8TWAG4aLM3pUy+RL2z/HIabDk0pedK4snkcrmqL+XV7CCg6gb725ft
	Kt+p256uO+0ExXJpZcE65cXBTiHzSBRk+t4nykrHgcVJt6al3o+ZrzFtGohH5y9SBaN5rr30sU2
	5FPXuvq/HY5FqU/q4AHHJlvhPr319k7gkbfF99K0jkTfxOOnsZVX2Bon+dRb+8Rgzdj78sbrbxe
	5cu5d4xaFG4BE9xJ9ZNVHiYB2JYJsf798cQPuOxWt1OAwWRkfzDOixHHlK+S1a8j9S761T1h4HV
	LMO6zNBZf6+UV6G9/WMPD0/GU04cCmMJlCzyvjOJRo5/MGsOs0rCbvcfneE1b5Sz1GMBMft+ram
	STL+IUQDmjsipuQaWuDil96vGQ0ERh/pFR20LDxKnpw4eLrfl9VuAgB8q5t1tg9dq+732qBCQUy
	TnGS2aY0F+5IOOMZshyV+KbbhRTw==
X-Received: by 2002:a05:690e:400b:b0:675:5e46:36cc with SMTP id
 956f58d0204a3-67d897d9483mr6388130d50.82.1794828777994; Mon, 16 Nov 2026
 03:32:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115120534.2331911-2-thnkslprpt@gmail.com> <avrL1hGke3Hux2IM@U-2FWC9VHC-2323.local>
In-Reply-To: <avrL1hGke3Hux2IM@U-2FWC9VHC-2323.local>
From: Avi <thnkslprpt@gmail.com>
Date: Mon, 16 Nov 2026 06:32:21 -0500
X-Gm-Features: AclHuK_VZyh65L9sMYzi5VAiUspj5fkWhpWYhKx4YL3ocShAjw9Rms0HZoeOtmM
Message-ID: <CA+jvY9HtQZtCW7c10gS03DBLshujocvZRZKseAYyZSjFrBy7mQ@mail.gmail.com>
Subject: Re: [PATCH] dma-contiguous: reserve NUMA CMA areas after default
 reservation failure
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think both quite clear, but I don't mind either way ;-)

On Mon, Nov 16, 2026 at 4:24=E2=80=AFAM Feng Tang <feng.tang@linux.alibaba.=
com> wrote:
>
> On Sun, Nov 15, 2026 at 02:05:35PM +0200, Avi Weiss wrote:
> > dma_contiguous_reserve() returns when reserving the default CMA area
> > fails, skipping independently configured NUMA CMA areas that might
> > still be reservable.
> >
> > Register the default area only when its reservation succeeds, then
> > continue with NUMA CMA reservation even if the default area fails.
> >
> > Fixes: 7e6ace2535d0 ("dma-contiguous: add kconfig option to setup numa =
cma area if not configured explicitly")
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > ---
> >  kernel/dma/contiguous.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index 90937dc7c627..0b6500bb6cd9 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -287,8 +287,6 @@ void __init dma_contiguous_reserve(phys_addr_t limi=
t)
> >                                                 selected_limit,
> >                                                 &dma_contiguous_default=
_area,
> >                                                 fixed);
> > -             if (ret)
> > -                     return;
> >
> >               /*
> >                * We need to insert the new area in our list to avoid
> > @@ -305,9 +303,11 @@ void __init dma_contiguous_reserve(phys_addr_t lim=
it)
> >                * but we also need to insert it in our list to avoid
> >                * having a default area but an empty list.
> >                */
> > -             ret =3D dma_contiguous_insert_area(dma_contiguous_default=
_area);
> > -             if (ret)
> > -                     pr_warn("Couldn't queue default CMA region for he=
ap creation.");
> > +             if (!ret) {
> > +                     ret =3D dma_contiguous_insert_area(dma_contiguous=
_default_area);
> > +                     if (ret)
> > +                             pr_warn("Couldn't queue default CMA regio=
n for heap creation.");
> > +             }
>
> Thanks for the fix!
>
> Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>
>
> one nitpick is, is the below code more readable? (I'm OK with
> your patch as is):
>
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 90937dc7c627..3daa9ae3ab7d 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -288,7 +288,7 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>                                                   &dma_contiguous_default=
_area,
>                                                   fixed);
>                 if (ret)
> -                       return;
> +                       goto numa_resv;
>
>                 /*
>                  * We need to insert the new area in our list to avoid
> @@ -310,6 +310,7 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>                         pr_warn("Couldn't queue default CMA region for he=
ap creation.");
>         }
>
> +numa_resv:
>         dma_numa_cma_reserve();
>  }
>
