Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D042E8D6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758557; cv=pass; b=AHQC6aKl+WbbibqxgPTGMBQmPyg139QaFamGvXjQ0DIkEFKzjtGZexhvxEWgEdUMWLUvs5cZganmKefJkUVPccPsxW8YQe7Osfc8wSY+fFAQa2kKkSGLvXjs8h+y7NV3ylk1VX9U/vy7yeO1sqS+0ldUA91vwF6AI84fAVSNiVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758557; c=relaxed/simple;
	bh=abErfC33CbNFbY3oc3pdHalPqdAnCa9dxRZNa7+VFeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6BOH5p0M7zRy3j5aTck9Hym5MDzytwSybny5xmLii7BCvEqxMkX1gmStOiFbMAEVDqmCdD4AEc+7A5zw2GKtvIKBeI3N1cZN1MLbT11BuGvIomT5MORYpLyzazzZ4jt4aogIGrHvIkLpzPcsDNEjoXz+pMsMTiDaU2JweRmGsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJBA48UW; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJBA48UW"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-3396cec93b6so5808854eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758554; cv=none;
        d=google.com; s=arc-20260327;
        b=d99XfHbRvwt7qdbm4/UKe5Cens9HIZFF4AObg4OYZTdhAzWOxL0OPxOtlOJJCJCKuL
         SPHs+sB5LKqFGgtwmcMZhe/m0MpbExMay/ozYVXiqON//36CmPp/gzn9nY1sjouUa71T
         mUd4lxEp7qcThWVmmAiKwcU4NA75k3W2Tkvn3vYKP1Ub09X9tYjwwghd2VwTwgceRFbU
         3zM+BvieEP7m899fAsiFIgoX5tkOdBaovupMhbjWyAJxpcYT3W9fihWUIKSPMgNBs6bp
         xVDpcDBvm3h1CK7uT3J358T7rv4f8nV3IhWqbjnX4Dc04wLjpvg2rrwQChUlKaUehmXB
         WYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tK3QynNJMVX6fk91fIN3QptmwfowFv6iOT0xBS9VT+c=;
        fh=ZQYCeE6aYrZStXQmA3j9HM9bU7w1mcz9tkrvwlcB2ts=;
        b=rwijH1I0YuqpzshgkjpWZpg2US2g6Qg+Q+qWj68FRNhYT0oJNPJPwN4QD1iavns7lt
         HYIGiCm0zulBHaYDqccCWX2Jbzfze/DekPXWaELlYk8NOF/KiWtEOSIl9lYuEoGS2MMd
         bC38oZxcCPlHEAk4lfqRSTmb3sZd04fEyRzZ5W033H6t4aKex2e+wgL7fiuA4iaOHbcc
         zTVejOFs3V7TTP8QGL+dkWn+V3944k3QtXPa2oz6BQ/KYd62ZNR/EkjmDyAY3k1UVfQL
         pCjXwlLn9B9zxJfIlbBNpIFFow1TcIPoYrROTENihoT5M/fBHiuu1IOZDN/Pumvw4j/a
         Ozog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758554; x=1791363354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tK3QynNJMVX6fk91fIN3QptmwfowFv6iOT0xBS9VT+c=;
        b=KJBA48UWipxI48Q02C+mBfABDC5msOfOaSv8aX2fdI1HML8vVRGO61y1NxPD57HAHd
         HfSDziq0Tzzdnpr5Q7wM2lgbckJGdbnB/VQ050HFMN5mE8NKtHQaCbBIZUT30bfEzWev
         XQzeeNJa/hQnMjKtlIfvKt8u1mKWLLnvwBfZ2Z38MV406DE5rObDrEjv3j+P6Yb7Ge15
         YvuC0/XjeMzmC7HKIQZ5G8whr/AEd3EJcWcjvFIv5qQND08/NWWr7ZUObQGaNV7na0tG
         SDbqSGBiCjMKV70FUKvRqOiTdlavlF54TJdum4IAqkDO+98ubxSKPhsxI9d7CFpRfKib
         gotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758554; x=1791363354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK3QynNJMVX6fk91fIN3QptmwfowFv6iOT0xBS9VT+c=;
        b=DVopverNCg2hfQBo8dZKb/hPM7xS49hlT8/T1SGviT8wjy8Qcv/O1+D6uQNf5WMB+Y
         f/xT9QMnPp1aRfdqH82QRVkiclFyCipQYB8F/miXlrJDPEBLZLh0harTbjgIAIK2LpQL
         48ecxvvZbKBNpO4fqauTKtryV9uKCocCL2KtO6qvrSAa0A+0aennB+36304Y9mhBDbho
         KggGvdZTtZ0HvkCDtao+q3fpJBcPyORxQ1pJ7VWkfaP8uz6Rxq+aby2MRO8NbOATeSY2
         hAZu4fFhT5cULyEvfoxIJXl5pcgzljMYP/SAWm/idU1dOP7mVE6gVbM4Yf9d/XuQ+3TH
         pQog==
X-Forwarded-Encrypted: i=1; AKwUvByG+zoIRmB7wgYlEx098WUlk9VRKZYLnQyCrarrNLQbsOUYxboJAKnL2qlUUg6rqjaKLAV+wqfJlFPcr9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJYa071TKxToTj98si9oDBcIZPXfKUgSqSsNxgvOay+5Vpfj0y
	QNwtXkHmJfbaH3uav6YNdgzJq2Nl6abCxyewq8oFL4KBnyZXlz2vaLzE9AcTGhsN5FL+nOrDF2Q
	DuyYBKu6lJAp0FyhF14u/qPcioY+s22U=
X-Gm-Gg: AYBFou2vrC6r/yCVNq+ylQm9TwEKjiGaBPvFk7h9TqTxE0uecbI63mL6v92HL3V/idl
	GjJU1hWTvC9abM962HdLnxFh3UgEoRPGQp+/HujiXe1IKHfpUxqh3UimvqEX1+fhGb3ahR8y7kS
	XqwwG8n1XZEHH5yURsGLFQzRLO0DnhI762V4vtmzvOT0c6cr9vXTDaQt0Cnm42qNBilUigSvgiD
	kIvVdCt4P6/dlnF+XSXsouR1O5wWuNLxurx4vzBORR8YJq4kk3aQjqIaHmoQzNlUoChyqXrhByL
	BzFw0BmBE2L0KyZpBJY1uCizvkhhAI/B77a7JParNJ+yv7LUJx31wGyvtW0AKPpu4b0SdRTFCE7
	/gS+rqDb/URMX
X-Received: by 2002:a05:693c:66cc:10b0:33c:e9d:6d4b with SMTP id
 5a478bee46e88-34ce1a002femr1132397eec.41.1790758554481; Wed, 30 Sep 2026
 01:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-2-clamor95@gmail.com>
 <arzI6PXbGAgXs9Uh@orome>
In-Reply-To: <arzI6PXbGAgXs9Uh@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 11:55:42 +0300
X-Gm-Features: AclHuK--O-LZ7t9iRpgmVS0LccEUwDL6n7PPlA0pa15dhw7HSbr4NELCXapQceg
Message-ID: <CAPVz0n3dOfmF6C5r0Z1t6ezzCoQEZh+V_oLGMFaUh1xHBMv+UA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/tegra: dc: Expand available registers layouts
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:35 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:30AM +0300, Svyatoslav Ryhel wrote:
> > Expand existing DC register definitions with additional fields in
> > preparation for adding the 8-bit CPU interface.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c |  3 ++-
> >  drivers/gpu/drm/tegra/dc.h | 54 ++++++++++++++++++++++++++++++++++----
> >  2 files changed, 51 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index b0bfa946e6979..5c67928bcabfa 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >
> >       if (dc->rgb) {
> >               /* XXX: parameterize? */
> > -             value =3D SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
> > +             value =3D SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +                     SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
> >               tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
> >       }
> >
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0cb0515968b35..5679e1ca0c2a5 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define DC_COM_CRC_CHECKSUM                  0x301
> >  #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
> >  #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> > +#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
> >  #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
> >  #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> > +#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
> > +#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
> >  #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
> >  #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
> >  #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> > @@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS0         0x400
> > -#define H_PULSE0_ENABLE (1 <<  8)
> > -#define H_PULSE1_ENABLE (1 << 10)
> > -#define H_PULSE2_ENABLE (1 << 12)
> > +#define H_PULSE0_ENABLE                              BIT(8)
> > +#define H_PULSE1_ENABLE                              BIT(10)
> > +#define H_PULSE2_ENABLE                              BIT(12)
> > +#define V_PULSE0_ENABLE                              BIT(16)
> > +#define V_PULSE1_ENABLE                              BIT(18)
> > +#define V_PULSE2_ENABLE                              BIT(19)
> > +#define V_PULSE3_ENABLE                              BIT(20)
> > +#define M0_ENABLE                            BIT(24)
> > +#define M1_ENABLE                            BIT(26)
> >
> >  #define DC_DISP_DISP_SIGNAL_OPTIONS1         0x401
> >
> > @@ -451,11 +460,30 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >  #define BASE_COLOR_SIZE_888    (  8 << 0)
> >  #define BASE_COLOR_SIZE_101010 ( 10 << 0)
> >  #define BASE_COLOR_SIZE_121212 ( 12 << 0)
> > +#define DISP_COLOR_SWAP_BGR  BIT(16)
> >  #define CMU_ENABLE_ENABLE      (1 << 20)
> >
> >  #define DC_DISP_SHIFT_CLOCK_OPTIONS          0x431
> > -#define  SC1_H_QUALIFIER_NONE        (1 << 16)
> > -#define  SC0_H_QUALIFIER_NONE        (1 <<  0)
> > +#define SC0_H_QUALIFIER(x)                   (((x) & 0x7) <<  0)
> > +#define SC1_H_QUALIFIER(x)                   (((x) & 0x7) << 16)
> > +enum {
> > +     SC_H_QUALIFIER_DISABLE,
> > +     SC_H_QUALIFIER_NONE,
> > +     SC_H_QUALIFIER_HACTIVE,
> > +     SC_H_QUALIFIER_EXT_HACTIVE,
> > +     SC_H_QUALIFIER_HPULSE,
> > +     SC_H_QUALIFIER_EXT_HPULSE,
> > +};
>
> Let's stick with regular defines for this, there's really no advantage
> in using enums for this and the other enums introduced by this patch.
>

Alright, noted. Thanks.

> Thierry
