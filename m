Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1A936AB4D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481575; cv=pass; b=gHK/KkvTbNZNePvHue4OTICdOc6C1FdL26SmC7rAnOYw15Jd9oCzWofCg3Sq4v4bxqG+7tGAEFmAgSLeOVZc2kKIW8n7QooVFL8OPz/G45QJEtLEL/S/ez11rMhTT9ktAJod7jIVbLg1CTOof3dTdq0VkrBI9K88NHRKvr0Mflg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481575; c=relaxed/simple;
	bh=25ZTsU9FfeuDXdZFx2yunT6q1yCHER5vwlZ8uYBDJB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDqqpfS7xAskkLXLpaE85F1AzjhzOdFTBRw1TubpQrZXjnVR4G82Px7dVee9kWa26wXKcy8dXf2V7ScPl5ff3LXiG0nQxGQmazQPMn5ihAcCzNhk3N0AsDKl+sQFZZjAN6Lbj9feR9oMOUxcpdf2c4UpD1pWy2PT5dAiw0vVE9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaWST0ZK; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaWST0ZK"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97cb5c91d5eso84894241.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789481572; cv=none;
        d=google.com; s=arc-20260327;
        b=rSdcWvFnIwMFpbslqh120g0vuh0dFZrFnGhC6YCDjRfbSIU9ZyVS6h2LKoDiyyUTuO
         tkuJqMpYm11wuwk3OxM2YO6F9Y5mCBC0b8bqR84UdPABw3S5IXGQgu86nwIzRjT7XIQq
         EUBEIxQVFPmK+hZQlZ04ZzZM6+J169viHPYHdxU5rOfa18NgZPlGD7vE4H/VqQdrdSkB
         ioQuPsZiQtAUhb0P9KzfMTIPBEPMSmj8u12a1Nbe8WevygoxtSTryip5RHwhxV7hEzcM
         b+5poSn7sJxcVeNeLWPV9BTciI5ZaVbVZodTorV+xaNddReRNe5eR9GMTF3Ea1SZKytz
         f4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i7cn65EbAp0IbKb7n2Q/NZmcE6NpExnNj+DKsdNyhwk=;
        fh=cN8xSv26xTX3YmFM8vDc9pEn0kXtrb9iu1o4Hvhm5Go=;
        b=ceGRrazQ3mcTojBX+yDut9WnAhlsqXT3bBw7sViisvbfjysXNZNG73S4P58KgxGZbz
         lJW3m6HvhCVJkUWjO/4TJNZwi3YUGLE5ZDUE8hpq2GbooK9iztOem1XJTwQV2PWQjUkE
         JAfItZsW0myBPKbwzPJd+0pvVbgGDJ9vmtQ+Fx0Zi5qoazWq1bISkKBgQFtOipMbJwnj
         P4TUpKtVXxkZY64PPFlpzkGkuknbMAp0TT43a2GeikjrbjD1h7rwQfKVIQnbTK3pZLVe
         UgaQQ3X1Rg1WrIk3zspeBqvCxuEVC4xMxslhAXS6bWA0Bdlcft2pKe4s0q8tlV7Ojd1J
         gJVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481572; x=1790086372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i7cn65EbAp0IbKb7n2Q/NZmcE6NpExnNj+DKsdNyhwk=;
        b=MaWST0ZKxzEL3U77pHR0/9Q3XKomfJ6/8XMmVKKZGyokQcERG02q1E5y4svu0eD/9V
         A/1tLfl0b6uE04n9FIbZfODKaKr/xl7D04+kEmBfAABtPEoWcPSea3Bm13p1rJE82x1i
         moKkHj4u8tXsAt3JHuoUFCihPDze086gO+hkuV5xcbD0yS6UWdCb7OKQE+wEmYdAYlmF
         4eXXpJHT4PKQUwiB9eIZjRnWqYY+pr5/PVecKNYP0aXnyfCmX9ccqN23Gc9aLm60TwhX
         YyWxF5/PO8ULbijxnaLMVUEdOhF3WZ1KcN15BpG18b9FAjg7HzcBHRH9Ckr3+Fq/pkY0
         l8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481572; x=1790086372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7cn65EbAp0IbKb7n2Q/NZmcE6NpExnNj+DKsdNyhwk=;
        b=fZyoDr8SFgrPjBkFEScDpFHHi3hYOXCRsxltpME2HobuzBBy7ik8PAloPvUbqG+vlb
         qpeRyUmfkzfALTrqKhaaofL4KxR+lNigjQirvsYe4LaNAcEnjUY9kXJxRtuHgw5OvhlE
         N0UkH3T1R2L8RF7xROY7xjtKS82za0kr0JG+zVcPoo2tYCCM8SNRCsWfBvsLzyl+UZAF
         dpG73Xc3m2qWeh9OC2rAovygmVlOzWISzZtUSmuDzrePnD/Uy0b0e1gJIiyNeY12A7gf
         phQeCqnEssPRDBUyOIFBgM4Wp8hAK3XDPLXjAmeBRVB0meObwB3sLtLSV4zJQAiwO7HC
         m8qQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuNp/r4o73N7lWtsD3cEc9tzes2Dkt2L3dPSnAWSaYeqKU2uy/f/ToI7fLKIsgDmGjLcteEXrI7r7bDfo=@vger.kernel.org
X-Gm-Message-State: AFuF++m/PXfhHm/p5K9BwnnMJpVHII5YE3pjwcljGpmbU1oK5su61mZ+
	9j1lkpCkq7Best1GnMABihLjygWuCqBJSjWKbpELpKxi/umUgfF2GjQXdtidnjRdEf8C1DcNLGX
	muW1tP1QUgzZ163llm56SpNLjPFHUUCw=
X-Gm-Gg: AYBFou0sC5Aa+UEZDAl2fWlB2b2ptWxaMk0yN0nbjddp70qqEWzisSVP+hYDfD9FdTe
	zjcwapHtoU73goOTjgS+Qh+XbaFT2ryMuCMS7Tz2P1277fM+dL1ZvjtFYDGaySDeBcWt2EwRzS0
	q7msywm+tWn0+0h+6vrHF8LKv8hOZN2N3mHDvk7ZY4A0wdqta3nlH45jqeSpNWsgD/Tvfl5+8RW
	rZpZnxXVp1HcwbAI9arVM0MA3tfd4KcgcC9KEXL2e0nt0WPe+FWfDvGY/qR+3Fd1uLe268+pOP3
	mUjHVvmG96gmNj4RRrUZu5ZTCa8d49sg0iMCqXuAr+o92Gz1plk/5fWMJ0aBPMoiqoQl6tXOzf0
	g3h6C3TDZV9qsuY22T/Fch2ZPvcUYqKAoUmiaEZgFOA==
X-Received: by 2002:a05:6102:c54:b0:786:d38d:f7c2 with SMTP id
 ada2fe7eead31-79b5b676f93mr2335600137.1.1789481572122; Tue, 15 Sep 2026
 07:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914143303.90614-1-Dmitry.Chumachenko@cyberprotect.ru> <CYYPR12MB8729B5365277A22CAF0E3481B0BA2@CYYPR12MB8729.namprd12.prod.outlook.com>
In-Reply-To: <CYYPR12MB8729B5365277A22CAF0E3481B0BA2@CYYPR12MB8729.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2026 10:12:37 -0400
X-Gm-Features: AcwNN1WacDhZlbvZYTvJ0gfbBPuwD2uIMCbwq3aGupmgwVj9oiTKkaVVd5BP55s
Message-ID: <CADnq5_MKk5eQnZDTMepVtnAgEjWy84M_3ZPDkELyC5onnsAb2A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check ras and obj before dereference
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Cc: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	"Zhang, Hawking" <Hawking.Zhang@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Mon, Sep 14, 2026 at 11:15=E2=80=AFPM Zhou1, Tao <Tao.Zhou1@amd.com> wro=
te:
>
> AMD General
>
> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
>
> > -----Original Message-----
> > From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
> > Sent: Monday, September 14, 2026 10:33 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>
> > Cc: Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied=
@linux.ie>;
> > Daniel Vetter <daniel@ffwll.ch>; Zhang, Hawking <Hawking.Zhang@amd.com>=
;
> > Zhou1, Tao <Tao.Zhou1@amd.com>; amd-gfx@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; lvc-
> > project@linuxtesting.org; Dmitriy Chumachenko
> > <Dmitry.Chumachenko@cyberprotect.ru>
> > Subject: [PATCH] drm/amdgpu: check ras and obj before dereference
> >
> > [Some people who received this message don't often get email from
> > dmitry.chumachenko@cyberprotect.ru. Learn why this is important at
> > https://aka.ms/LearnAboutSenderIdentification ]
> >
> > nbio_v7_9_handle_ras_controller_intr_no_bifring() dereferences ras and =
obj without
> > checking either for NULL. Both amdgpu_ras_get_context() and
> > amdgpu_ras_find_obj() can return NULL, e.g. during the window between
> > adev->nbio.ras being set (early in amdgpu_ras_init(), by design, to
> > enable the fatal-error interrupt as soon as possible) and the PCIE_BIF =
ras object
> > actually being created in RAS late_init. Any interrupt in that window c=
rashes in hard-
> > IRQ context.
> >
> > This is analogous to commit d190b459b2a4 ("drm/amdgpu: the warning
> > dereferencing obj for nbio_v7_4"), which fixed the same issue in the
> > nbio_v7_4 handler.
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Fixes: 7692e1ee2446 ("drm/amdgpu: add RAS fatal error handler for NBIO =
v7.9")
> > Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> > b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> > index 8e401f8b2a05..2b3a1b9f8efc 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_9.c
> > @@ -518,7 +518,7 @@ static void
> > nbio_v7_9_handle_ras_controller_intr_no_bifring(struct amdgpu_device
> >                                                 RAS_CNTLR_INTERRUPT_CLE=
AR, 1);
> >                 WREG32_SOC15(NBIO, 0, regBIF_BX0_BIF_DOORBELL_INT_CNTL,
> > bif_doorbell_intr_cntl);
> >
> > -               if (!ras->disable_ras_err_cnt_harvest) {
> > +               if (ras && !ras->disable_ras_err_cnt_harvest && obj) {
> >                         /*
> >                          * clear error status after ras_controller_intr
> >                          * according to hw team and count ue number
> > --
> > 2.49.0
>
