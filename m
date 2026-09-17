Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C754D9F76
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645384; cv=pass; b=L19ndrR8f5cgW4JFFbuEf1skj5Vx35qAxh+Ea4YLQVOj5lgpGdoE5akj2dwlD5208aDpEhz2UOkxJj3pSxP7kiBTWVrKeDdZMsZ491F3gXs3ZRIpZS0XIK/id57vgbgzhBM5Vj/ZnFFP3GCHvv9F/yDCDenZPfOriTVK44RKFsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645384; c=relaxed/simple;
	bh=vbrxd5srWOipj09aXDQHzqS5lMVRJ7HAcTG0L1bqBDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqmK19eHYO7VT0KUA8Neu2/JNq5QOjfdy+18aL6jaXVpNKUBQc/gx+I2Si5vJoVrh8AVuJ/xvQenXwbaEJjx2Rar8ffAKLS8HAsGeU67/gRkwVzgmNDspYYnPkLuDr1NmlV0PfIofCHr+QsBLasRAOdHXJuvMpodS5bqiW26+hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z6lNuCY4; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z6lNuCY4"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e56a1fe3fso623251d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789645372; cv=none;
        d=google.com; s=arc-20260327;
        b=WFtZd0BUFNhvtPCP4p7rqaj8tlx1bcPOWofHoJqTbaAKRoJdqxka0dVxkJFUPRUDe/
         /UQ8OqVPtpofxC/mqDR+sHI8TGtZlimvF4ahtjz5VPXtx3k1NXth+2Vk50biCW01TQ1e
         j1RdmILmFjCylJN+FLbld6LQlzcgwCrHdhLBau9QDMB9nYWutgDHAjF3cXNq5DxOalxG
         750eLopTfdL067NUku5fuNcQV7DJeCYl94NAW8PIZ56p5uDpo4WvZOE6qHH0zS7c826z
         Z6p1yBcT5MxnaWlTzbfdqYQho7fG++ClftXNYBzXpqoFKDQJmIVu05zFGo3vJvCl3gEX
         N24w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        fh=eZmhsGPwR2jJpHp13aNC5fIe8WrMq+XsJb6rfSNDyfk=;
        b=IP9Fu7C972m9KdNkI3A7vR7NeHKtcvY9MGlk+XDXYLVfhCdIUXtQfbvCfaGMsqaYTU
         HAaARp2EBj+zhqTxBGXCM9HvVcTgqIhGW5yS34rhXrKcXXxd0YqZbga0nJMXPCn7MFKA
         YZ3Bmwu1oOqYEEbTluwYLR97nmCERRJ2mptq6xYCx3G3w2sLvZ8d0vPhQjFoOnWFIjOt
         yadHJqi6yqomDa7rBQy4bDoYmx/q0ejIdFyhz2EiJCJQvuzPPFgVX6gB5lvdG0lD4XZh
         xalRAa56oTu82xFz6oBkJIHdlwgfJpGJQm8VTFO/BJXxF74smg/GeWqW2/0iRWvUh3JA
         0nkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789645372; x=1790250172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=Z6lNuCY4gE6sFsdgRC8dhHeA26EM/JX+utE3xfIQJE1t4mtSPU3u37JiKG8oQPP343
         nD+khk6UbF8qwB6xqmTL3mfPiXVzOHBV00/6LrGteIaflvPlaJyqwzgW88Gjzk8Y04kv
         QcUhlcMMM2OmM1PJQ8iXJW37qiDP/mjGNcE5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645372; x=1790250172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glNGbXLPG/pOAS+pJMdVn3sfq0+G6eulTKEjqN2qPww=;
        b=Axltj+BmGBoQdjKVG8JaOmVJRx5bowCzHCD4YYBq2xoOlvo77NrpnMtfm+8nz1sFCY
         Qh+xWlJZMDnnT8SNC/ecMjIG89WXxb+2O9vip3a3y/b4gRA7lL0OszBZhxngSAW+j8uH
         z7TQKn4CKu5bo+dc5ImDqrVkMYqc54qLjdb7uw8VQlqW9g63wHXm9DhoKInAs8xK4Btd
         xRgRCssl+hlF8szV3oBIZGmzrj7oEvhR4UPiexcosVKrgOqq/wsnWQe0VlAYzhAKhB53
         /9EiK2ylmbgVhDhXaE5jqlYiWCTx+yv2B05eN7P7tf4t/mSr8HZ1yhvghbNRmyHMjJ+I
         NlbA==
X-Forwarded-Encrypted: i=1; AKwUvByv2hGy3K/+CrM+2YWbFiy07GRsNHPr3LtalJJrgYnzn4WyUtTzlPMdAHL7HpJ+Df6uoblCmDIFqAkmads=@vger.kernel.org
X-Gm-Message-State: AFuF++lN0SLdmTvKWiiFQ0W1lGU2D1VNaq1abk4WipieGAN9XDWoSJ4X
	djvS+MGPIQrjIJT7NTOrulTWzA1z34H0A8TgkghHG2zaua7uT59CUMc67AlEtzQFL67fR+Fwk7l
	YnLWeNl/piZ+bABzC32eC8f3B4AM3/FNBcq6+THgR
X-Gm-Gg: AYBFou1N8mPC8MYqt1cqHwbBxl9sGX77URYqJo0y9i0/YnCWPQepFhxzxPSH3oSXHiz
	irU2T7ijPwsuD3R5XsA0G/IgUby37uCesUDR5HOR12dQY4e4rgdJlPlMg988GCWlfAYH9CntwEM
	1BYwM8vUX329wIftFDAYJVSzQB1TfWs2U/hu1+zuYiPO2Xg1y6RqQmayJ82utI1SU3X4KoInedp
	CPdSh1GWXMuxoVLwprWC6EMdYZ/Ok84Ua37XQteHIGxBpxfcHH7Zb/Vu70iRCC5Z/QvqhW+E4rK
	Wr12XQC+tIE3yijz6yDi+eR1t6QA4bjBvrLZJAJhPgMpyyAAHPiiilgbjAuliLfI9cPL/v9Pj4j
	wGzw3Xq1x
X-Received: by 2002:a05:690e:1181:b0:66e:54a0:cdd3 with SMTP id
 956f58d0204a3-6717724501emr313133d50.42.1789645371777; Thu, 17 Sep 2026
 04:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916033327.3054126-1-wenst@chromium.org> <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
In-Reply-To: <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Sep 2026 19:42:39 +0800
X-Gm-Features: AcwNN1UiSWBQWxLfTBKkSaF0uFiyhB3L4EIUoSHVNJlTekBmF6uuJ4F5EBEDj-E
Message-ID: <CAGXv+5FHiW8umZ=wLLb5wK5Qz3hf-mbxC_zH5v+pwxxyUNTwew@mail.gmail.com>
Subject: Re: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr()
 helper
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Liu Ying <victor.liu@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:16=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-09-16=E4=B8=89=E7=9A=84 11:33 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.
> >
> > Changes since v1:
> > - Add and use new drm_framebuffer_get_block_offset() helper (Thomas)
> >
> >
> > This series adds a helper to retrieve the buffer starting address of
> > a
> > "clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
> > which gives the address of the full buffer.
>
> Should vs_fb_get_dma_addr() in verisilicon/vs_plane.c be replaced with
> this helper too?
>
> I implemented manual framebuffer offset addition here.

Didn't I replace vs_fb_get_dma_addr() with drm_fb_dma_get_gem_addr()
already? At the time only primary and cursor planes were supported by
the driver. The primary plane can't be clipped, and the cursor plane
had some custom clipping, but seemed to want the unclipped address.


ChenYu

> Thanks,
> Icenowy
>
> >
> > Some drivers program their hardware with clipped dimensions, so they
> > should be using the clipped buffer address as well, unless the
> > hardware
> > can advance the scanout directly. (Side note: many drivers still use
> > the non-clipped dimensions.)
> >
> > While at it, also pull out the offset calculation of
> > drm_fb_dma_get_gem_addr()
> > into a separate helper in drm_framebuffer.[ch], thereby separating
> > responsibilities.
> >
> > The sun4i driver was recently incorrectly converted to use the
> > unclipped
> > drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
> > pixel groups, but also exposed the mismatch between the dimensions
> > used
> > vs the buffer address. Two other drivers were also touched.
> >
> >
> > Patch 1 adds a new helper to return the byte offset into a
> > framebuffer
> > for the start of the pixel block of the given pixel coordinates.
> >
> > Patch 2 adds the new helper to return the buffer address based on
> > clipped coordinates.
> >
> > Patch 3 switches the sun4i driver to the new helper, and fixes the
> > luma plane buffer address offset for subsampled YUV formats.
> >
> > Patch 4 converts the imx/dc driver to use the new helper. This fixes
> > a
> > mismatch between the programmed coordinates and the buffer address.
> >
> > Patch 5 replaces the open coded buffer address calculation in the
> > imx/dcss driver with the new helper. Existing behavior, which might
> > be
> > wrong, is preserved.
> >
> >
> > Please help test. The series is only compile tested on my end. The
> > sun4i
> > changes should revert its behavior to before the
> > drm_fb_dma_get_gem_addr()
> > was adopted. The imx/dcss changes should not have any behavioral
> > difference.
> >
> >
> > Thanks
> > ChenYu
> >
> > Chen-Yu Tsai (5):
> >   drm: Split framebuffer pixel offset calculation from
> >     drm_fb_dma_get_gem_addr()
> >   drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
> >   drm/sun4i: layers: Fix VI buffer address for clipped offsets
> >   drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >   drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> >
> >  drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++----------
> > --
> >  drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
> >  drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
> >  drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
> >  include/drm/drm_fb_dma_helper.h        |  4 ++
> >  include/drm/drm_framebuffer.h          |  3 ++
> >  8 files changed, 118 insertions(+), 51 deletions(-)
