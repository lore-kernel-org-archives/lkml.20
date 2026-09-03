Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7063BCD2E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433144; cv=none; b=QPp/x9gJBpJ1lWFS1ibwBlIhItoZljH/U2wHBpYEzLzRKYVqdxSGDJwyoiE2L/ZpG3ociLeDcO/s4nd/JlSxFMjfIy0A1tztf+U2werBlEvohh232tQFQB/YMuog+mmdlbNfi8bqwPJuBtvMVvVqbwaaY7f5WCaoEoIhN5hY89E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433144; c=relaxed/simple;
	bh=LIVQ/zATHkNeaQ8snZdXFXnpMsJjj9QtCbz0bdZwQCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sG/oDtRxc53vKay0RRFPKzD6nKV75+1fdYhp2Jt8KA1wPF39iBPu+iviWEEJoNM32jRVlq7Vgh0NmjkHaKuYaxJAdvhofRaLyCDluPZM38mRaqVbTiGTk7b9GVXQc0hG/yAUvIvGnAy870LrFnA4CQ3I7VJwFtPnhY7LOj1Cj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W3DBQ7d1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W3DBQ7d1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B89A1F00A3A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788433142;
	bh=M07kDTC7RtEIRUc0/L8LW/ve834ZWk+Wk3XUWfU3fPE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=W3DBQ7d1TfNSquzPg1iFhiXHXhfMnUomVJWNYs++GckW/+qNye9ifJsBI8S12zkcz
	 DICqExkd/0l1l6GoEWD9tYLsd02TeWe5TBU8G7CiZEcLBwaughs+pzkMOeFJiJwVUY
	 X7Kcb2eEeXAIZ1CtKU4CO0E9pBsc08ztTg8itSN47cOQgch38OT5NxEdS6QMJ02odb
	 VsPnclvdsFM2IRPzHWA5AQvEpAmLN9FZ0g+MPvmXvSo1NKnkKh1RAJyttgCnMxzER4
	 X+xmCnkRN23DvJWqGrsmA9Mo6Z79Y4n7SsjIJklyYwhhOqGJN7Qsjs1U3vGq0mjF9K
	 XH2UjZP15TQ3A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so21178741fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybhUH+eAHPydA0eA8JmYJCK7K93sHi/VOT8hn/1N05yFsgBp9WEmS0LEnGhwiJuqZJOF2+aI07YUgkMkg=@vger.kernel.org
X-Gm-Message-State: AFuF++nL+zQvI22tcJCKjPbduclrAvyUHUWggqZ3CbkS1fkKHBzEIFxC
	0w88xOJAOfMSUUFKCswWlnhmMCU6isS2brUKX2us1stM6pkaItQSAP1dpTxiydckw0oI8V1QtuV
	v0syRZWcmofQRrDUK/YBgzDGgT+dgvCE=
X-Received: by 2002:a05:651c:43d2:10b0:3a2:fd1:8a8 with SMTP id
 38308e7fff4ca-3a34fa3aeacmr17663261fa.1.1788433140763; Thu, 03 Sep 2026
 03:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903063142.3770509-1-wenst@chromium.org> <85ce561d-fd2b-4705-9136-0173670e9148@ideasonboard.com>
In-Reply-To: <85ce561d-fd2b-4705-9136-0173670e9148@ideasonboard.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 3 Sep 2026 18:58:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v64NJK8PjVm90ZPK+g_cFkWAroE9en+GBA5_iQdKR0p3PQ@mail.gmail.com>
X-Gm-Features: AcwNN1XR4J3kogo-3-MbXQMUkJLelnEON8rYbcq9wGhIdrfNVZ2Czmm2UzMWnps
Message-ID: <CAGb2v64NJK8PjVm90ZPK+g_cFkWAroE9en+GBA5_iQdKR0p3PQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tidss: dispc: Switch to drm_fb_dma_get_gem_addr() for
 framebuffer addresses
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jyri Sarha <jyri.sarha@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:53=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 03/09/2026 09:31, Chen-Yu Tsai wrote:
> > dispc_plane_state_dma_addr() and dispc_plane_state_p_uv_addr() are
> > basically the same as drm_fb_dma_get_addr(), without the support for
>
> drm_fb_dma_get_gem_addr()
>
> > formats with block parameters. Since the driver doesn't support any of
> > those formats, the result is the same.
> >
> > Switch to drm_fb_dma_get_gem_addr() for getting the framebuffer address=
es.
> > Drop the const modifier on "struct drm_plane_state *state" for
> > dispc_plane_setup() so that the state can be passed to
> > drm_fb_dma_get_gem_addr().
>
> Or add const modifier to drm_fb_dma_get_gem_addr(). But it's ok either wa=
y.

I felt changing it here was the smaller change. Also, returning a DMA
address that one can then do anything to didn't feel completely const to
me.

> > Using the helper also future proofs the driver in case block parameters
> > are added for more formats, especially the common sub-sampled YUV
> > formats.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   drivers/gpu/drm/tidss/tidss_dispc.c | 38 +++-------------------------=
-
> >   drivers/gpu/drm/tidss/tidss_dispc.h |  2 +-
> >   2 files changed, 4 insertions(+), 36 deletions(-)
>
> Looks good to me. I can pick this up and fix the above typo while
> applying, or wait for v2 if you want to do something about the const.
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>   Tomi

Thanks. Please apply and fix the typo.


ChenYu
