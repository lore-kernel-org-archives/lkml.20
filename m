Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4658F083
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887132; cv=pass; b=YyAs6v2eGSvZoqkOtd6lg4xdzqKZf83J+R3FR+dxLFUEHh2VqCZpZszuEK4zkoGJr3HcfoB7XUzuuSeS0nl5xi5gbCVkFI+kUZmdljkWnoCpvbB9FxUIOZDm8Ia7vr8VNBmoaX+WYzWJqi1hCkeOGvFOB1mx7pDMA1TzojdDeVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887132; c=relaxed/simple;
	bh=ZUsNUDfHNSayvs0cLcpq7eFB/vP8mG73JqyT3D6YigY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjkvE50AvCM7q/yn7OXWGcPn1LKs0DdCfFgVpfIz4J2EsiJLueiaur85UhT/AghVWYmwDtqJPLzLAbkl2FNmVnrnnD6t7CkRuJ50qvPRSLQKbH6aDxDc/pWFkzIi9jUNYBkRGA2RKb6uHgCTi2M7jBAN7zgolLALwjeH5SsEeOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TRJtx9dm; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TRJtx9dm"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff390a6cso232765ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788887129; cv=none;
        d=google.com; s=arc-20260327;
        b=WN7K2cJd0q6doJaN0+QTQW59DbxXjvzwgsN0USwNAZyefnec+JuXRlKzv/XBLVbwPx
         glCbLpOKe/FbGHWOet3+/OxVtNMYgJGIGYhxTyWVl2bxRs0UzwznnGtFLSPL+29bEpf9
         bZ0gOZc2ZX6Syj+uTr7f0OaO38PQa/IvUJ98FCxyaDsYM91IPDSiR4V4Y68RB3hxdpZJ
         ujfhSj5ZcuWfqqdCR4yvTA+5ljWsjui2XUzIS57k0gpn76vo9aISDrHF4NclrLvvu6zd
         u7qOmTtRnUEd1BV7TbLIbdaKwknqdaR2fsKjPKH6RY9uNV49MmRiGlcOn+5+y3tJE8ff
         rsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2BEbL6oK2TNdrl07S1eqJBu8muYQ4YhMI1yhqy/NuU=;
        fh=OfWC9xZ9hblJGtRJStyoOOoZtj+0uSob+ykJFN/729M=;
        b=TJEwam0/53a+oPBx8FYGvK1N2No1r08PCS/eIX4IybEKP1Lewjh0P0CySRcEp6ynTQ
         Si+S3r0ycOxXGx5Dd6R8S0KIxj39npuIQaz0PYCq6/kWsbgB8EvQHaQrmgeipJRXu7q8
         QwxMtOYlR2A3X2LNgMeQxLbJ+ic1cwo/ogkQnm0DkCvbUFvZ2queLmEgi9rrIAxurdDD
         QER3iQ/eO2sGLg9mDgvY/5EO6C7Fx6bxf3qfsaPP0RwM9jjMBiVZM1mpkAPfLJ4V5oNp
         s4VLdNmY3Iq4+KRmGhiScq8eN4ZB+O0N18HyhMc3RoIm6BLNQ93v9PjHT1dH0yPp/lJ/
         HarA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887129; x=1789491929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2BEbL6oK2TNdrl07S1eqJBu8muYQ4YhMI1yhqy/NuU=;
        b=TRJtx9dm82UydXooLijXgweSIPd/7h7ego1IEGxsi31TGWTEYzOuvf0PulEs5Bk/VJ
         XIATD8LDlvhemQhGnHyILtw1CT8w0kDnYPjJSfrnkH9UYr0OKSjhDpi3xro1+vi5AqII
         8mHt7zlG0HbE7E2p+WKKKyIHb81ZJi7GgPzheXytf/YwFbi/G/W/El6DLB4gg+re+UYm
         9BcS+HvDGoz9EqX8Bbfj24ubMj9X9bNEz0Ch6BaD2UQmYqzlpiOV3EmH1uf36yVKQ3o2
         rcFEhnFzeGrI4AF1FRLN4YIgYRR+eDbf2+rG/VrdEP6JgFp7AQ3UFB7jpe8svWViE7GW
         6sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887129; x=1789491929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2BEbL6oK2TNdrl07S1eqJBu8muYQ4YhMI1yhqy/NuU=;
        b=ki+MstdH42+T88iHsgeRLrkvs1HUc494tvruw9X9d0xjwoaq2FU9uZ18+VoiHdnJtJ
         22Gek2T8gUcYESiLmWG6BWuZS+3iDGAPki7y1old6irWJkmsqfrRGgilyHM6ySvMxl6S
         MUT8RNpMe+hfl9/H/cg6P/Hs0H5v2anN8LiE7E1vfDlg2z/4yiFw4GyDtxvUfD9wPzHf
         PTxu5Hrs7RlfFbVu3UPXxFuoLsPDe9OY0Qac15oxHc5LPYlVFV+cW7gl9bERlzXPUK2t
         8eTUOphIlDe1/ezRqIZVkClYu2M+HAcTTOnednVbHBSHLXXM+maa3W3A+RMf8g7zDjRU
         /4+g==
X-Forwarded-Encrypted: i=1; AKwUvBwe2/xXqqCwI9tP8Q7lbhKuNxfr+r9oLTmR+FpRWui/3VJOGoXnU+Y2zlhbE2gIoj9VW1O5qEQm+UcZv7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ki/Gtc4mx4SBMuOGvbrdcA54QQX4o4Gnlq/i8eB0CGAa0tt4zP
	tkD265s/VhKvLqfP4aTtg9+ovPbwyGpE69CduLYgMl5QS30KV42ZnpwO7B+j0h5V2FWcRk5eXFx
	5rLGBeacKdOiDE5j3VWq5NfvaeajkRyOfeAlIOeX2
X-Gm-Gg: AYBFou04tn28Kqa+KTaArzlXg4LXzbv7efs5mjhzjNZiQqjXIRWwnnXoJP1gytXVsP/
	gGfFuN/mPHGEQ/USRgU1aE78WDpT6lZ5Qys/B0B0WLc9h2405xnb4ZmIHI0onQc6oCKBHxrVyJv
	7eBYrRtxzqtkjuw8fTyeyLJ1tLx+boMe5yDFenEDNsD4CKqNg8Gkkl29wdRSmLkD+YiJw2BM5n/
	RbnmXWLfMBeFsH2vBwC2roupZGuRDuIHh3lBOD8013EbQ2Q6KV8OWpl87N6V59n6/fYHuWglt0K
	slW0k727QsBcUiLqQljxGx1ZU/NUG+eKe9ahNQNAU/6RLk8PE7XunSK3zBXT87WSu4J1xR+F+IV
	/iUTiQLlE7RM2czpkszPYr8AmfAQYIE8=
X-Received: by 2002:a17:903:26cc:b0:2d5:db3d:1a43 with SMTP id
 d9443c01a7336-2db28e87ca5mr17559255ad.16.1788887128208; Tue, 08 Sep 2026
 10:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com> <20260908-kcov-extrecord-v3-8-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-8-dcbc11593e88@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 8 Sep 2026 19:04:50 +0200
X-Gm-Features: AcwNN1VvbLJASh_Ky3VRZJSD9T0ID1T_I_eVvcK3XtYNZ85Q5pJtmiWgBBKhAmI
Message-ID: <CAG48ez1ueO-rc+TKQZJoFuf0ingYR=E7s_exEDvOyE=CsDp7Ew@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/12] kcov: log freeing of SLUB objects and pages
To: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 6:55=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> To help with using CONFIG_KCOV_MEMORY for detecting use-after-free issues=
,
> log when memory (SLUB objects or page allocations) is being freed.
>
> This should happen after KASAN has already marked the memory as freed;
> this will become important if we allow driving delay injection off this
> in the future.

Oops, I should include the page allocator and SLUB people on this one
patch in the series, since I'm adding a hook in their code.

> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  include/uapi/linux/kcov.h | 1 +
>  mm/kasan/common.c         | 2 ++
>  mm/page_alloc.c           | 3 +++
>  3 files changed, 6 insertions(+)
>
> diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> index 7d7147e7b427..76822d1c119a 100644
> --- a/include/uapi/linux/kcov.h
> +++ b/include/uapi/linux/kcov.h
> @@ -90,6 +90,7 @@ static inline __u64 kcov_remote_handle(__u64 subsys, __=
u64 inst)
>  #define MEMORY_ACCESS_RECORD_WRITE 0x10
>  #define MEMORY_ACCESS_RECORD_RMW 0x20
>  #define MEMORY_ACCESS_RECORD_ATOMIC 0x40
> +#define MEMORY_ACCESS_RECORD_FREE 0x80
>  struct memory_access_record {
>         __aligned_u64 ip_address_and_kcov_flags;
>         __aligned_u64 data_address;
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 1ab77ac9719c..3a648eaad024 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -283,6 +283,8 @@ bool __kasan_slab_free(struct kmem_cache *cache, void=
 *object, bool init,
>                 return false;
>
>         poison_slab_object(cache, object, init);
> +       _kcov_handle_memaccess(object, cache->object_size,
> +                                   MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACC=
ESS_RECORD_FREE);
>
>         if (no_quarantine)
>                 return false;
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 083cbcb5bdde..910d14925b84 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1446,6 +1446,9 @@ static __always_inline bool __free_pages_prepare(st=
ruct page *page,
>         if (init)
>                 clear_highpages_kasan_tagged(page, 1 << order);
>
> +       _kcov_handle_memaccess(page_address(page), (1 << order)*PAGE_SIZE=
,
> +                                   MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACC=
ESS_RECORD_FREE);
> +
>         /*
>          * arch_free_page() can make the page's contents inaccessible.  s=
390
>          * does this.  So nothing which can access the page's contents sh=
ould
>
> --
> 2.55.0.979.g7e5102b832-goog
>
