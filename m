Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B1F4772A9
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136533; cv=pass; b=I9jVnQTa6qjJx7z8FPPyfHY9sgSE8Mhqy728bPCkEKL/l97x/8SLZRPY1YatRUTd8iSsydl5xQ7pfCVhQcaNDJQwOJs2wSppjGs+2k1IjvojRgdOlG0TyOO0Yqas8SwK9Yys6sXRqgWeYbL8ppHrJv2Y2Q5aSGPq6m4mp3X1uGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136533; c=relaxed/simple;
	bh=JS/DfHmzCQBktqfBDcLgWFGsP1pDN4vWax4Q2BX0O+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6/O3/AprGWjkAmpMhXcIuKJI+97PQQG0uCq1ll9lcCyW5/XNTaKA+4REUQOLScfJ+lUZNeDdW//PRNe/T4wI1Gu7doWvbLdKxD+Nls3z+evSDLM3I0x8iUZSY0jcSTTNfNSqL9eLGyesXIOQ7GSJsKPcsiYR/JlleXnVrm2UGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eo7Lxbwq; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eo7Lxbwq"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5351f9dbfe0so98401cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791136525; cv=none;
        d=google.com; s=arc-20260327;
        b=ZuQ+x/UQ7DvxDxIiZ0L9lNl9Zpxlqj+7zOw+O9NZF2IgPru9/+C59O6Js9VsZws/yp
         Pc9ROymK2HfLyToqtpWsTH2HYOUrltvPppcD+ej0mbNALbyoSCB4hyXNt/Lht5a2s7KF
         BVvxtoXQ1YzB6vE/woK1gN3vB9fx44nJu0oQQ/dKGUjZ6SmXvC7AAaQCti9X5cLly6a0
         Zy4AAbSlXut0+lq8tmiJ7uNV2uXkKu5+p8UVu2747O+1dkd5kMjyYnKRUP/HwvJOUNQl
         ZKxLOQAU3NemGwLv83AX2MqUjI9SnWnVu5bUK1M1CU3iP2/xAg/G3VQeXb40IxyQltVL
         dcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFRiHWm52m67lLPZ4QttIFc2/s9ESzUdGTCBMadUb1o=;
        fh=fvvPs9fs0vjxk5YsD4Ti33DJBlnc3bh1t8EeBhLGR1w=;
        b=NkG4j9ownSRRbpaADzrpUlIRNFdF/3GuS6LEPpaCbVu452YrOLbf6MP7a7GLHctLMf
         iCYEXVsgHz+2/V6g59j0diqsLFMIFZAwASEhXqH8jvaLlcuAlIbbgyZWLC+iTnMwgQbs
         lZ7JQB8tCafdGkpLApfhWnnf7ZdA3I2XoPn0D8e5aLzS0GoryM+efXkji6ty5dv5pBmq
         f3LFNvnpyUWys9AEcqLhk8J/JhghsHyG0uprg5yOUg/8eB1QOCngwLnnIm6NZ7kpiSrJ
         gjJv/2H4lU2GFF1i3zSrP7mA/+YBdrPyZjlRAjZcpLhvqYxj9K+P7QZoJOUddWopaaZ5
         WzUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791136525; x=1791741325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFRiHWm52m67lLPZ4QttIFc2/s9ESzUdGTCBMadUb1o=;
        b=eo7Lxbwq+tvykVl3jsl+khAQDgShQ2Tccxz+XQGYPbszWI5v6dRbn9UKzEjJ7snPhZ
         bc4wjz2ApoF/eY3f37u4KH0OOxFVgIB3VIdirmzC7kKVpG4dSygLMlbny5EMLja16fw3
         GBP6leu7UZPutM1QXufrPRm8hLdOws1SCk6Q5l7IikMQkl+u8NbKtWUjAhEVof70x16u
         daDFFMtqnK+tlrmiKN16UdbYKHLSdP8YcnMWEb9o/Mj3go9K4sWDPUWUq93kMW2Qxae9
         GRGxJH9i5j2TKyFo/C+ycnreJwp3KVdAZI6mYzAshvw+onBYLswzrYrNIPj1NPxi80CV
         sRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791136525; x=1791741325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFRiHWm52m67lLPZ4QttIFc2/s9ESzUdGTCBMadUb1o=;
        b=0U3/7f521l6FIZK21aE3mIMXHSRvHnzwoMUIat521ZEvFhOEJvE6utDpBtEQ3mnEE7
         gBFe/rXuvv1bJJbaJYpVaYh7KMxm1wkUHy8h/wcHEm4NRjkZ0gLJFfJya01+fYtORyQP
         jWkDfPoKnhh7PEtPwPQSSXTa/eH2o6KnwCNdUKkaswBTfLQMiht7iSRcJxdAg5r10Ny+
         AWkUaNNqVKjilwBNeO1OIzvl2SmOiX3TOJmpZk2C9I9Vbcf4TR4vE5lRiwReK/cIemVP
         fxFSnO9ei6muTlSHbvce3qdmJa7+wuulUcgm+Fspcz03SE6KlZdNRzfxJWd9vj04obLG
         Rujg==
X-Forwarded-Encrypted: i=1; AKwUvBwQSOTdENd9Qi1RQ7ZXM7zKE5HfssXhj3yNKXi6bD8s+mxFTqbcLpg+LU8Kvid7UkFqELJ7GrY1XilRIIU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqYVDH9SP5lccV5M1o4WE5z83neI4u76m+coSCxp3ShARADu7d
	xz9liT/SyF+Vvyt4A2YDBf/7l7bOX6ACzgv+WzYdXvB1HxzAuyw94aI0MvD5ctNYkANnkVFURU5
	5yCpQnCEW4C+PFwY+g5L56FiwP0pY4nl6YfDo1YXp
X-Gm-Gg: AYBFou2YvuOR4E7BWPu367KXmQLKpSWm+/sNv2OofAGS2ycRRKcFY9C89nQA5r4L4gq
	I/CvGctRyB6EYj7G89v1vz6Vrm+O+vE/gq34fTedsQDhBWFM9lMDzuRBCzisU4eIvdobon2zwlv
	vP4ZnQCcCx1fquHIndgBnQo++HiDmDzuhvejXIIFwXgetfSbgaOu1ZpEStv9m6ZKJaM4eFqoINf
	yfp6HATQNLzKG8K+iuU7YpExkFvJTiDQvXAar/BGQWdq4Nzomzk9DxhuEUlACNrflf7dJwJwVjE
	Hnqf+37O0EsNKOPbY/PN4pw9fBYqj5u5ZzgjndF1G/kvRxlkJB20QRsCodt2w0+z4Ag=
X-Received: by 2002:a05:622a:191c:b0:532:9003:35b1 with SMTP id
 d75a77b69052e-535146541aemr3824271cf.2.1791136524268; Sun, 04 Oct 2026
 10:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929082014.160587-1-hao.ge@linux.dev> <20260929082014.160587-4-hao.ge@linux.dev>
In-Reply-To: <20260929082014.160587-4-hao.ge@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 19:55:12 +0200
X-Gm-Features: AclHuK9GuJ1R4AG2eys0TOfTlndz5Q1KT7n5Xy5IteGOVBALshKC8Ehhj3tDVOw
Message-ID: <CAJuCfpHXT41Y3N70xOF3MXtZm118-mR2DuXP=vt1M+TuMG2Uqw@mail.gmail.com>
Subject: Re: [PATCH v11 3/7] alloc_tag: clean up the populate failure path
To: Hao Ge <hao.ge@linux.dev>
Cc: "=Kent Overstreet" <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 10:20=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> The reservation is already stored in the maple tree when
> vm_module_tags_populate() fails. A failed load never unloads the
> module, so nothing releases the entry. Release it and roll
> module_tags.size back. Without the rollback a concurrent load that
> already passed needs_section_mem() can reuse the freed gap, skip
> vm_module_tags_populate() and write to unmapped memory.
>
> Fixes: 4835f747d3ed ("alloc_tag: support for page allocation tag compress=
ion")
> Fixes: 0f9b685626da ("alloc_tag: populate memory for module tags as neede=
d")

I think 0f9b685626da is the only one being fixed here. 4835f747d3ed
contains the issue simply because 0f9b685626da already had it.

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hao Ge <hao.ge@linux.dev>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/alloc_tag.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
> index 2070e682fe10..3e6306ee0764 100644
> --- a/mm/alloc_tag.c
> +++ b/mm/alloc_tag.c
> @@ -947,6 +947,7 @@ static void *reserve_module_tags(struct module *mod, =
unsigned long size,
>                 return ret;
>
>         if (module_tags.size < offset + size) {
> +               unsigned long prev_size =3D module_tags.size;
>                 int grow_res;
>
>                 module_tags.size =3D offset + size;
> @@ -961,6 +962,8 @@ static void *reserve_module_tags(struct module *mod, =
unsigned long size,
>                         shutdown_mem_profiling(true);
>                         pr_err("Failed to allocate memory for allocation =
tags in the module %s. Memory allocation profiling is disabled!\n",
>                                mod->name);
> +                       release_module_tags(mod, false);
> +                       module_tags.size =3D prev_size;
>                         return ERR_PTR(grow_res);
>                 }
>         }
> --
> 2.25.1
>
