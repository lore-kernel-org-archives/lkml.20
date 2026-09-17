Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461A4D956F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643814; cv=pass; b=JtzRsTrr8Dky/B6a1C1idxWaPXv3oWhmG4JyT+4F9mylC8UBvprX0xLDA1qrPYbcHylAm5Ywe0ZyVacqM+v2YRFccw6Eo2/07iiPO6xXpZcUD2aCT8HrBHubGP3F2mr47gMez0V8kna8H7OS74aiv6TzDNQRiZPZgDnkxQvABqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643814; c=relaxed/simple;
	bh=L+7jrrmM1xceNH5ZDG2/Kd0WCxATH/Vel0IisJNbBPA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZapU0m8uWxK6WuifvqxXKfGmKfrVHt8f8UGEAe1ymLwpKFhw903x0eWJaT1Jx9Rfvacm37nw4wXw1u73xOBhjAIZHrIvnX2hmrvwdqUfpIu6JWQD2mAAS8OgaRF7TyrOgRKiF3Ab0LKWqZGk/glp2GZ05lho+xgw9lcUWSce4PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=fHCW3CnH; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="fHCW3CnH"
ARC-Seal: i=1; a=rsa-sha256; t=1789643753; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eULJmLEuwv9sBnXxHcwQJE5HTxIvPrHEhvJn0UJbP4WaF1WdxZdpQJc9fKmAmuaelKDU6MFEG/h5tsTjevVaGUNEwuYtNcvqrAlts861YcCabnEHeMEoT5SkIlVE33tEnV/ge01RoIcI1zIbNpAatIhwVyIxBTVn+hlAHJPIAg0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789643753; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=L+7jrrmM1xceNH5ZDG2/Kd0WCxATH/Vel0IisJNbBPA=; 
	b=FJQRfbqRm+mJMKFxD43UkwdtEzpJplzRD8xuPnh99zhoizTulrC5T94tolYsVrylH4Pey/lwBj9zb4b59+5goqOe+x8l24CjhGEnBAId9WT+kffG16BDyoD9c29Wxuaa400DRT8W+sBP22yPbiCQCLb+wT0K+tFPItczLxXkoxs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789643753;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=L+7jrrmM1xceNH5ZDG2/Kd0WCxATH/Vel0IisJNbBPA=;
	b=fHCW3CnHaIVW1eDh1hW7EoqdMjqgwzdh4TzthQw+wJ2ld3pis1jC9rGYkaXvI1jO
	v2jjHF+FVy+1tWxxU0PGAxbaivcUqoiu5ArVgRveLZBopeji1tZNGSgMH/RR7GMibtf
	XZt7iboMb6hXhInrcdzUtOP7Vy85ef4UYHVvM50TeYa1x52kJzifPNXUvmKAYytiIl/
	ymfuJlGampHWZyp9CGJVhJ8k1XXJDMZQ296Mjb3/v0kLDgLsgNP1LLf75mkFPr4kDIu
	hkiZWncWDpvinCFqTsD6t27GUiQmoOV9cmSTiTubOZUR8CAGyYaZZtWbJ2mAY9PlBtF
	qLCHwHRk2w==
Received: by smtp.zohomail.com with SMTPS id 1789643751945368.595441490814;
	Thu, 17 Sep 2026 04:15:51 -0700 (PDT)
Message-ID: <6d21e808d343283264665ec16d297317000fdf4d.camel@icenowy.me>
Subject: Re: [PATCH RFT v2 0/5] drm: Add and use
 drm_fb_dma_get_gem_clipped_addr() helper
From: Icenowy Zheng <uwu@icenowy.me>
To: Chen-Yu Tsai <wenst@chromium.org>, Liu Ying <victor.liu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 19:15:45 +0800
In-Reply-To: <20260916033327.3054126-1-wenst@chromium.org>
References: <20260916033327.3054126-1-wenst@chromium.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-09-16=E4=B8=89=E7=9A=84 11:33 +0800=EF=BC=8CChen-Yu Tsai=E5=
=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.
>=20
> Changes since v1:
> - Add and use new drm_framebuffer_get_block_offset() helper (Thomas)
>=20
>=20
> This series adds a helper to retrieve the buffer starting address of
> a
> "clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
> which gives the address of the full buffer.

Should vs_fb_get_dma_addr() in verisilicon/vs_plane.c be replaced with
this helper too?

I implemented manual framebuffer offset addition here.

Thanks,
Icenowy

>=20
> Some drivers program their hardware with clipped dimensions, so they
> should be using the clipped buffer address as well, unless the
> hardware
> can advance the scanout directly. (Side note: many drivers still use
> the non-clipped dimensions.)
>=20
> While at it, also pull out the offset calculation of
> drm_fb_dma_get_gem_addr()
> into a separate helper in drm_framebuffer.[ch], thereby separating
> responsibilities.
>=20
> The sun4i driver was recently incorrectly converted to use the
> unclipped
> drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
> pixel groups, but also exposed the mismatch between the dimensions
> used
> vs the buffer address. Two other drivers were also touched.
>=20
>=20
> Patch 1 adds a new helper to return the byte offset into a
> framebuffer
> for the start of the pixel block of the given pixel coordinates.
>=20
> Patch 2 adds the new helper to return the buffer address based on
> clipped coordinates.
>=20
> Patch 3 switches the sun4i driver to the new helper, and fixes the
> luma plane buffer address offset for subsampled YUV formats.
>=20
> Patch 4 converts the imx/dc driver to use the new helper. This fixes
> a
> mismatch between the programmed coordinates and the buffer address.
>=20
> Patch 5 replaces the open coded buffer address calculation in the
> imx/dcss driver with the new helper. Existing behavior, which might
> be
> wrong, is preserved.
>=20
>=20
> Please help test. The series is only compile tested on my end. The
> sun4i
> changes should revert its behavior to before the
> drm_fb_dma_get_gem_addr()
> was adopted. The imx/dcss changes should not have any behavioral
> difference.
>=20
>=20
> Thanks
> ChenYu
>=20
> Chen-Yu Tsai (5):
> =C2=A0 drm: Split framebuffer pixel offset calculation from
> =C2=A0=C2=A0=C2=A0 drm_fb_dma_get_gem_addr()
> =C2=A0 drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
> =C2=A0 drm/sun4i: layers: Fix VI buffer address for clipped offsets
> =C2=A0 drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
> =C2=A0 drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
>=20
> =C2=A0drivers/gpu/drm/drm_fb_dma_helper.c=C2=A0=C2=A0=C2=A0 | 61 ++++++++=
++++++----------
> --
> =C2=A0drivers/gpu/drm/drm_framebuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=
5 +++++++++++++++++++
> =C2=A0drivers/gpu/drm/imx/dc/dc-plane.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/imx/dcss/dcss-plane.c=C2=A0 | 34 ++++++--------
> =C2=A0drivers/gpu/drm/sun4i/sun8i_ui_layer.c |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
> =C2=A0include/drm/drm_fb_dma_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++
> =C2=A0include/drm/drm_framebuffer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A08 files changed, 118 insertions(+), 51 deletions(-)
