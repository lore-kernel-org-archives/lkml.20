Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0502CCC5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790747598; cv=none; b=nnbig7Xu0zQ66XHKmuoK/fOf82wKDAVVbV9ay8iRwVjLjBqVzzIghAKWwHJPo6uZcsCjp9M/qTjOlpixDov04fpnTmJpd6+cZpoLJh0oPlE1s3y8tODGhl9+qTE8FZ2GazjFQk5W3YWLKhMxlr02Nw5idkxLSwXGtW+QbVQNHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790747598; c=relaxed/simple;
	bh=HOfe6eGDXWWjbg16M03Zk0OLLSQFcWlNyWNgDc1U1cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ArAAAN1++dm8cT/vS4WljdpW9SjOvbX+ngVnoN71BmAaV5MbMg/ZsvdQJmMZch85FhakaH5MGAfwoxU8Ylm1WETaFKdGYFN/SROdBEqKOvJepttQpZ7solETAFrlMs3SAadeEsvKKLmW3OSnJzu/gmXGl+B4bViBmeUr2gmqpTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=bjfaviDB; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="bjfaviDB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=HOfe6eGDXWWjbg16M03Zk0OLLSQFcWlNyWNgDc1U1cw=; b=bjfaviDBFHWVxeZ6pMpxtnv8Sx
	0Vz3JjbyRuT6RnU+pFdwhMcvBDa7lQbk71QYnp6xe4+lCtYnRo8osNnuUu+uNYRzhksl7Dkfv/dWx
	HBNGnEReIvhjsBI9EgV9XgFNOXkFhrthn0rDrFpqKHprTb5W/BFVJCo18IXvrtAR9SqrLU3EU9XxW
	Qd3bh2GMG0yzll0ODJmpEZIZuXdc/0jSRa5K6NW/CSZgegddaQsbMTTMI5A2F0pHReOCzk9uNTC8e
	UxkK5PxATb9id/2zQN9Wv8mPuWaUO5IhkCaIjPSJdmQjcDjKVlip+aO9IJE9SKp+XLuV9Yu1q51OH
	6AXY68DQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1xBnFh-008yCY-1f
	for linux-kernel@vger.kernel.org;
	Wed, 30 Sep 2026 05:53:14 +0000
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so1044693b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzo00OYupb/YIrbnQ8T197+IcZCI6hL7UKQVjtB2PtPOc8QW6eWSRgkppFqf2R39gBEZtfR4Qi/u+osHbY=@vger.kernel.org
X-Gm-Message-State: AFuF++mNAz95KgqzFrbmhugGFHe6AOTfxUSLFCO2XNnTkNJy6fAKeA1y
	mmCKgAmFcjzUwht+/O6WUsLo2y1mzfbuQChybu+vnhlWJzJxPoj4ugajQqI5Hi165VxFhFTOPtv
	HFehDAdRyCPFOJgSREpd6hYLYZjGmDso=
X-Received: by 2002:a05:6a21:1f8c:b0:3dd:65a5:a33 with SMTP id
 adf61e73a8af0-3de9ef4e6e0mr252959637.10.1790747589916; Tue, 29 Sep 2026
 22:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505042631.1916555-1-domibel@debian.org> <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
 <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com> <84e4511ea8e3e6bdff72ce2038bf3a3272744619.camel@iscas.ac.cn>
In-Reply-To: <84e4511ea8e3e6bdff72ce2038bf3a3272744619.camel@iscas.ac.cn>
From: Dominique Belhachemi <domibel@debian.org>
Date: Wed, 30 Sep 2026 01:52:58 -0400
X-Gmail-Original-Message-ID: <CAAvaLCw1ZPBAAURvCR02zxoDrTSxiHaqDp8cjqHsyL7MsTr=Sw@mail.gmail.com>
X-Gm-Features: AclHuK9-oOR0f56IMuemEpm996PDXvOYEpnJvgiFTYENcHWnCYFGQ9svkIM_Dn0
Message-ID: <CAAvaLCw1ZPBAAURvCR02zxoDrTSxiHaqDp8cjqHsyL7MsTr=Sw@mail.gmail.com>
Subject: Re: [PATCH] drm: verisilicon: support non-coherent DMA framebuffers
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Simona Vetter <simona@ffwll.ch>, 
	Paul Cercueil <paul@crapouillou.net>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, ganboing@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Debian-User: domibel

On Tue, Sep 29, 2026 at 3:27=E2=80=AFAM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> =E5=9C=A8 2026-09-28=E4=B8=80=E7=9A=84 01:21 -0400=EF=BC=8CDominique Belh=
achemi=E5=86=99=E9=81=93=EF=BC=9A
> > On Fri, Sep 11, 2026 at 11:33=E2=80=AFAM Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > >
> > > I am still thinking how to decide whether to use dirty-tracking-
> > > based
> > > cache coherent maintenance or writecombine/uncached mapping.
> > >
> > Hi Icenowy,
> >
> > I looked into this again and writecombine/uncached mapping is the way
> > to go.
>
> I think drm/imagination really requires it (because the correspoding
> userspace driver advertises only one memory type with
> `HOST_COHERENT_BIT` set), however in the future it could also add cache
> maintenance support for performance reasons.
>
> > I used Bo Gan's XPbmtUC series and Michal Wilczynski's jh7110 display
> > series and finally got the integrated BXE-4-32 GPU to work.
>
> The XPbmtUC series is problematic -- it "supports EIC7700" "with a
> hypervisor", which means it cannot run on EIC7700 natively. This
> severely restricts its usage.
>
> Samuel Holland from SiFive is working on patching the PTE on-the-fly,
> but that will change all code accessing PTE in the kernel and thus is a
> heavy work.
>
> P.S. For the JH7110 rascal+dust power issue, I did a try-and-error hack
> at [1]. The basical register definition of this register (called
> RGX_CR_POWER_EVENT) is available in their KM volcanic part (but it
> seems to apply for rogue too), but the individual bits for domains are
> undocumented, and the highest 8-bit seems to be some kind of multi-core
> mask on Rogue.
>
>
> [1]
> https://github.com/Icenowy/linux/commit/09db317c9c229ef359e35463f8c08efd3=
e23c685
>
Wow, thanks for sharing this. It works reliably and helped me get rid
of the double-insmod for powervr.
I integrated it into my branch with updated #defines.

Best
-Dominique

> >
> > https://lore.kernel.org/all/20260316060328.1173634-1-ganboing@gmail.com=
/
> > https://lore.kernel.org/all/20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc=
8@samsung.com/
> > https://github.com/domibel/visionfive2_gpu_bringup
> >
