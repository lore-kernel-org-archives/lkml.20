Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFF33D5657
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890639; cv=pass; b=nuOb4KsqCENmWQlWm2cCzT7pqxzB+N9c8I3nRpxVFloUBfyERu6/LYzq4GG/srSXTG4gZUqc2njEcPIA/Ubb+GgXCbXnA1NhV+UWjLwE04bW7nrZlH+JunpGlHBKpBQORJKezFP3fW9NvRSfBraSw89uRAWSvq72PnFOS7xaSng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890639; c=relaxed/simple;
	bh=vSS1hji3JfZkUk0WmXLRGWuCXFuWJ0GKvJtQ41XBpq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blX3NwCFhakF/W43Pfy8H6Lno39N/cKBP09rWife8B3YQCvrmbCOJdY15OR17IuGNe0SgoinK4CP3uzROkntZsx0TdRZR165Hj4NyPOE0xvG+knrRl3fBuVj1u0U997LXnhN3gARgn+e6xp20GaiLiu/Zv0k2GCsLcy7NgiIp8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nNFfn2nP; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nNFfn2nP"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5337fa12431so743981cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791890637; cv=none;
        d=google.com; s=arc-20260327;
        b=CmMMCP4+NfoMGLsx/cRwhtHT1Dns0Y+UKJylkuJ36mJSNmLmSkf8iOu8TLQgvstEIY
         UY1OKivG+VBBMzKpfN0EFdd97d8WSGYL015Jbvo3jzBwZhdNauCJG8cnbX1N8yj9tq3P
         +88ra8geeaGPgE0/u0Tmq1xWsJuVGyUptIWMH9K7+36mJc2XhYkcXs8p6zY6p05abeO8
         AmPM2keQ3ynEQNkUsLrR0B5gv7rEYSZ+Qmh4m899sbtRFye/5gYYMuvS/+4zwxoF9hoh
         ACBvkKCWa7KGksuZNjOi+RtAf/4i+4NgMC6LNq9wNRsTWJ4w1x2l1SnZSVDAFpGzqhND
         LD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xzn08Xsc7kDwJ9WnURk+AQXsKYZTAAr7RKZN9XHYFSg=;
        fh=ej1o/UtUdyhOyY104FplFgqHJjM1GJccwXBagyN4nx4=;
        b=hRNZcZKdA3hNICGSXPBi+D7H730DgnHzFFJFTikLiFFcvClZjgcaNuk1dBy/acmjTB
         ZAjdOB4foQybgIN7FX8pILf5RggpWdfAnIwWCPMgDbqiODRIGa2T0jxIvAZv440nYnVa
         cv4+atd79CZ/zkVD3bSgsB2etXouTU3K+5wPZbYL00KM+FYuysmDWm9g7cPBsuVia44b
         g6+Z+7xbP2KW0VlBTq1T8Al/2bgTZ27iDEuipT6AIPUsxTiKxSi5Z79nM21+MWHejdih
         EGUjViH73k/mSCm3B+ElArzSZSuCo7KQYItyZ9UzmKW031yPouifqKYxDe7oFamlW9IW
         i9Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791890637; x=1792495437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xzn08Xsc7kDwJ9WnURk+AQXsKYZTAAr7RKZN9XHYFSg=;
        b=nNFfn2nP9gVII/8ngiWUW49PHh+TxaXxkAgKCgyillJRSOI3enRiTeI87DC+AnwcvR
         b57bRfLukQMk2hIJp21AyWuvMP5EhjT0EyqgFultL0iEFeLEizcXJux2j+4xnsA6KhB5
         hZQYxx5b/LksdgLJFBSFvNdPITfy3TukZqFdlfT9Sro6NoJaYewrAq3KnDcmzbwKRPyW
         nr5iz+QFoYDb6ZUu/+HQ1m4/Lpy2bgO8uqm4VoE2AUqJ3k7HvIh5mn2Y4KEp3Eqppw6P
         e3WX9WleORmUkh8jG667dJE9Z8Ww0A8eu//jJhataYHMFDxhMxrDoEIavwHMSWKqw4wq
         gvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890637; x=1792495437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xzn08Xsc7kDwJ9WnURk+AQXsKYZTAAr7RKZN9XHYFSg=;
        b=OxpAWoZVxA6FpmfOyx8W28woAvYksOLHdkvbk9vjcmdCoWzYX1icg+pSdmz4Kw32pk
         RwL2Gwdu/pA1LIAfLyn5Y7qqajD+93GMxvpf9Xu9FkqYIpgqdsPJ+EY8yE92Al7odMgK
         WRMmGhvbjTBpIsiZ5QGfQkyFwmHzMkiKU/Wb4TehXv8HFEHn5GV+Ys6PgOHUP7r3CO7a
         eMoS/wqhF0uregkK2idqISSGzzEdKpybJ+yJ5cDSJkKVNM62Bm6SVc0jxhLPJXkwFLMO
         8B0T3did0bLROXFQhT9oM7MZ/aN9lJFiDySx/Oh+khZGkynuNNN5vq15C8OZppffoLaL
         LbMA==
X-Forwarded-Encrypted: i=1; AKwUvBzuUWeJv5Q8T1Miwft4kuFBy/ZrHids0rLMYNV44XgVZ6cPngZDFRdyYABc2Q/LyBXG0CcBFsiN0ElJm2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYICg5RCJJFEFdA3cN8764Wf64Rg//prYE3zJKqimrr/mb8y7oB8
	9HBEfwJ4SJx1Us2lfy6rY7wgvw1fNDRg6v8FQgAFPyIgBJFy1xh4otE4puGzFaJWHWyEW3Gk9TF
	8ugYmjNBMDuSEi8GXy5kAXiqvSHtXM0uqaX1vAmwh
X-Gm-Gg: AYBFou3AXMAApFF4fKizdg8wRbCPPgPH7ox3YPlvDGLTimmOGVaYDwvWq619niKgBq4
	ZE/r6z7MlORSr4q9+SUom+RYWPfpxQaVhfrhU4Ajgo+WK+0K/ultwfU0O9ZFR7dp59AbpZ2L57V
	4SQ3ftmk03Z9Lk0qCfOvcY2eJd9/0sMG7fNHmDEsHtL7lc9uXEInUn2pnNVdEPFiveXi4DUni/M
	C6ks1MCO+fbZeyvOYGwLVtg6558++ZdRkbEkgUGSJJEpSKzmuQ+Hu+pJKvyDC7CFv12a2y/7hvs
	yMcxdDvuOZsNWS7/tI2PHoPYQimkWgBCRPyuJIiNMIQeJtRZlawML0U8IuDywqCOxKM=
X-Received: by 2002:ac8:6105:0:b0:531:475:4ce6 with SMTP id
 d75a77b69052e-535b4ed04b3mr47467571cf.9.1791890636806; Tue, 13 Oct 2026
 04:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009063619.112313-1-hao.ge@linux.dev> <20261009063619.112313-4-hao.ge@linux.dev>
In-Reply-To: <20261009063619.112313-4-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Oct 2026 15:23:41 +0400
X-Gm-Features: AclHuK-h0QSYINdnd37OoLMuJ9wy9b_aLEO1B1JVU8ue7bvUVrVwE_vPxVcZz8s
Message-ID: <CAJuCfpHjX+_AvwgqV3XB_QQuorvnegvd_YjQ85JZWfSk-ckUHA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] powerpc: drop redundant unmaps of failed vmap mappings
To: Hao Ge <hao.ge@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Uladzislau Rezki <urezki@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 10:36=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> vmap_page_range() and ioremap_page_range() clear the PTEs they
> installed when they fail, so the vunmap_range() in remap_isa_base()
> and ioremap_phb() has nothing left to remove.
>
> Signed-off-by: Hao Ge <hao.ge@linux.dev>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  arch/powerpc/kernel/isa-bridge.c | 5 ++---
>  arch/powerpc/kernel/pci_64.c     | 4 +---
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/isa-bridge.c b/arch/powerpc/kernel/isa-b=
ridge.c
> index 5c064485197a..93029d85e6ea 100644
> --- a/arch/powerpc/kernel/isa-bridge.c
> +++ b/arch/powerpc/kernel/isa-bridge.c
> @@ -46,9 +46,8 @@ static void remap_isa_base(phys_addr_t pa, unsigned lon=
g size)
>         WARN_ON_ONCE(size & ~PAGE_MASK);
>
>         if (slab_is_available()) {
> -               if (vmap_page_range(ISA_IO_BASE, ISA_IO_BASE + size, pa,
> -                                   pgprot_noncached(PAGE_KERNEL)))
> -                       vunmap_range(ISA_IO_BASE, ISA_IO_BASE + size);
> +               vmap_page_range(ISA_IO_BASE, ISA_IO_BASE + size, pa,
> +                               pgprot_noncached(PAGE_KERNEL));
>         } else {
>                 early_ioremap_range(ISA_IO_BASE, pa, size,
>                                 pgprot_noncached(PAGE_KERNEL));
> diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
> index e27342ef128b..f74269636d5e 100644
> --- a/arch/powerpc/kernel/pci_64.c
> +++ b/arch/powerpc/kernel/pci_64.c
> @@ -139,10 +139,8 @@ void __iomem *ioremap_phb(phys_addr_t paddr, unsigne=
d long size)
>
>         addr =3D (unsigned long)area->addr;
>         if (ioremap_page_range(addr, addr + size, paddr,
> -                       pgprot_noncached(PAGE_KERNEL))) {
> -               vunmap_range(addr, addr + size);
> +                       pgprot_noncached(PAGE_KERNEL)))
>                 return NULL;
> -       }
>
>         return (void __iomem *)addr;
>  }
> --
> 2.25.1
>
