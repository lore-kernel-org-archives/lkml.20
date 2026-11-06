Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974028;
	b=ujp0ftyV7ipSPz4eD9P721tTrpBXWmC3DPpUSMqVRpDeGRqikEVEZfAZNGe2NoMPYX4m
	 dLHWSYN9qnF9Pmo5gRa/BxeOamcvqoY6Se9c3NrEREhFbSZs0spyc30edn6Zq4skWpTGx
	 aftHiFZlOYx+8FSSmLbtyMva1VbLBCGbQDZLLRMjCryGXP6b1RtqaN1te631d8ecMyUSE
	 qdjD5aI8RYvwn56VbcYkxG/PCojjK9XoS4aW+GNwoBPpz2rWf8zfAKEyuIV0G3uimIRzZ
	 dWcMSwzvwZ4Mp3ilHjlnu9msZ/QNgPstXWpngISo7b8HXG10Q+9mtFL85umu1dxVjhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
	b=kLmfPDm7kO2pKWR4I1hlxIfEWBvoQebaUbdySL5Y/xHLb74LCDB+dQjghYXnf+0GUM5c
	 e01Nci0HMvC/qDNRn9EdwNWp1ASh/vH+WpSKNCrLVo0SzYqTOOCA34aCdXvXIkHQ/RziR
	 cz0pNTEeSFOFAnLVqW4Me49NR/t7ADuwxU/zo0U82tc8y8x57f96tnr6Djf3o5ush4Po/
	 SFxQs5IRcKfQ26AtinQWJcrm7/M4W2l1uyk2B0SeKUajX+c0k7Uizi4ZoKypM82TSSUpC
	 O3HrMx1PGFmbXUFvVXD9XlCfr7C61ugMmXiiayxZ1MPn4P7OJMKcNY508T5v/78+ipg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diwYusPb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38E606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F38E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diwYusPb
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso82393166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974026; cv=none;
        d=google.com; s=arc-20260327;
        b=phbijpBRe4i1wp5LzZhkw2uEoAMFqw0tQmo2nrSunNIj0Sm0TFJ5QRLHJMNpfJGCEg
         +BCgxTK96hmp6tEqXVcIgSfsxwwXEwaKc7jtWXOyZTzJGTb5/ZwDFAzFPLuinublloBd
         J35HFrpmuGf/a52HVV8kkUEzuMgjA8bFb0PKeX5Nb6q8xk0sdDbKZdmrRZCEV49XQk4F
         QiQJlEa5691p9RZBYZ/QzLn8qKN9vrtg4/Tn46s+P4l8U7/AgoCVnWpBzeLYidEEfeS/
         /3a4OhdYGwyFHIxHRVbkODkgccgRio0fhW6RxpRWHlO0iB6VzUCOqOLwgBNB0rmahvJ9
         JulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
        fh=60UEHFtyGVtEQV0BhtsBSLyKM6UoyK7YPH4n1B4goK0=;
        b=P4uB0kP5n5cfh6o8PhGN5KArQ1T7oZxoVMDPyEG4Mwe8JUVVLApS/Fqw3Y1vVAdtWB
         8yeVrAN0VRKNATPVNX9aPUeNt0fUZsjEOfectfqaCJkJ4d4wU+McD2OkBTQJMG5e/uwG
         t8w2JqzVgftcUgziQ32SFNdqkVocVmdjYDs//zNDcJR1l1nUHdo9xrdSuWn/9Dbud5UM
         y03s5/zYEGJuMKS6ohlsWjpEvjjwETaqpnhCgZ+X5uj913lCySyWHFloBVfl1jAsX9RV
         X1HikSy7nyKOYF8eszi98HGLp7A5Zq6ZREZFcw6bcg9EFX6JGGOh74SXULUVC+A1IKL4
         e5nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974026; x=1794578826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
        b=diwYusPbK3mZRd+qud70e0rpFKU9vePSkEqawtb7pazo0DhAieJnGMjc2Bj52uvI1m
         CFKdlC1/L29Cb6BAD3xiDhPt1V/LnZc19JQX8LgSsdRvBQNmkGy0/CIYtcuNuKvyJ7L1
         bhwb1daNfmN6dzXInXeVuF8q3f0qkVIeFjFFlfCAvcn+kyRJIfZJY6IMqVWBHOlSoNra
         B6vjihQZg2qlT8RozkWOKuVBd42dDEUFi5HUDXR+zpX4o7dNEBXCIyD/jccWZjAlCxuk
         CyqwGFccSEp314pE3QWbgwZ/qgGpCmDjeIj86SS4vgbpbbnXNJWe0Ac/xc9g3vhKd1ph
         LewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974026; x=1794578826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CF2uVzHFb62iNIhC5h8KQfZpRW0Yj9jP3Jhqf3ga0/4=;
        b=X1Qs4d0XdcBm3QMayer6yD6AgX+Gi6HLF00TV0uz8yy+Tp/fq0+heukuNUcItG2d57
         pt1+m4Ep84Ap+Ecik16f0IXIPtzOnMMJixeyNONC//mMFvwDuMvWHS0CDw1dUwDIakjt
         tl5LtTu7y8/d9S2Kiaa7MY/ogVLwa/fZsnqG1KOccqGnmGlS/EuJelR5i9kh2X8W+Spu
         5aG9j0CXVE0vJeibD+hmldBs8Kt6NjeDVu1dRi9LSfNgLK2S8N/3M3pzic7UM8E5IUIb
         FFUFIldV/b3Hi94ZgL+DLetl3gz+ulLUCG/ZEPF2LyXGWqee6r2WnIMzPrIiMsMkvQmm
         1xgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxe0szx3JyvgfoRaTABdUY3b0tTUjtmzLuV0staz5PkyqUTGcGQxZHL8ja/ax56+zMKH30o+FFhZRK6AOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DB5TfUVcNB2jMG6cjNqikH0IqmucqfWvQ7V6UmtPrMDO4zFMn
	zH/TIWAdxge2hD2hY7tTsX/I8hH+ck4zOHpE4xtK3GxOkYb45J2rREHygi8aFtCuttB/PtWEc2e
	P24pq0q4P6XubVsvZqv1UcXgH8kqUcbk=
X-Gm-Gg: AYBFou2jO6y0FIGBURUaOuF7iv8kzwQuU7vYWN2GRxDytv+1VpTqrX50aasSR2d58sh
	BhAxIJXD/cQk/g6eo1TzeeWifoCba3DDruUR7mf4iifS0zIzoyaB9eL/AP4A4JTpjcLJeF7bN1I
	ElC1o2fZZhYmulR0aAbFZCZ3IuOQgwNtHhg4K8mBZzHf/gIY6WMW5Q5qxAo1Fcn7X1bmTBN7IWy
	kVC+qNpxGpP/JwsYr0V4VxbP4FHtTm8B5vCvy4TkYQsSgXzSChQniRkRw5WCDf0SElmCwaF+pqW
	ipX6IcWPZZVBMTLVScne2MBMup7Y72N4EJIY7kdW9yokGAfWFfzOIYZ4a4RsuBPAqG70knbvB6y
	tvvTl7xIzabf855fWgcv7/RceMTnYLhd9T9OQ8RMAd/5AzzsHh6/xZEpaB7i2vVGhlsE44nqp5a
	nmZxyD12M1QMPP5ibAQcwbEZ/I83xsQaD3n8v6WnJBKTx76HDOOck=
X-Received: by 2002:a17:906:794a:b0:c36:179b:6d68 with SMTP id
 a640c23a62f3a-c4d34babc94mr212442366b.24.1793974026265; Fri, 06 Nov 2026
 06:07:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-5-clamor95@gmail.com>
 <au3X8tpU9KWas9ZM@orome>
In-Reply-To: <au3X8tpU9KWas9ZM@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:06:52 +0200
X-Gm-Features: AclHuK9W8h_VdmRrbmlRdGVn94XocWlAhADiJndzE0sl5T8qxllPsgvIMFjUVog
Message-ID: <CAPVz0n1h8SS09Nt9fw4q806ktEM59fQRXTqdP053E7+2onzmYA@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] drm/tegra: dc: Refactor and expand header
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:56=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:04PM +0200, Svyatoslav Ryhel wrote:
> > Refactor and expand existing DC register definitions with additional
> > fields in preparation for adding the 8-bit CPU interface.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c  |  11 +-
> >  drivers/gpu/drm/tegra/dc.h  | 856 +++++++++++++++++++++---------------
> >  drivers/gpu/drm/tegra/rgb.c |   8 +-
> >  3 files changed, 514 insertions(+), 361 deletions(-)
>
> This is impossible to review. Please split this up into refactor and
> expand patches. Each should be a separate change.
>
> Also, a lot of the "refactor" is just pointless whitespace changes that
> are just not necessary. Please keep the changes to a minimum.
>

Well, I did what Mikko asked. It is not my problem that this header is
a hot mess. Initially I just wanted to add fragments needed by dbi.

> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> [...]
> > @@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >
> >       if (dc->rgb) {
> >               /* XXX: parameterize? */
> > -             value =3D SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
> > +             value =3D SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> > +                     SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
>
> This type of change seems entirely useless to me. It's neither more
> readable nor shorter.
>
> [...]
> > diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> > index 0cb0515968b35..2b87bb675d4cf 100644
> > --- a/drivers/gpu/drm/tegra/dc.h
> > +++ b/drivers/gpu/drm/tegra/dc.h
> > @@ -178,9 +178,11 @@ int tegra_dc_rgb_init(struct drm_device *drm, stru=
ct tegra_dc *dc);
> >  int tegra_dc_rgb_exit(struct tegra_dc *dc);
> >
> >  #define DC_CMD_GENERAL_INCR_SYNCPT           0x000
> > +
> >  #define DC_CMD_GENERAL_INCR_SYNCPT_CNTRL     0x001
> > -#define  SYNCPT_CNTRL_NO_STALL   (1 << 8)
> > -#define  SYNCPT_CNTRL_SOFT_RESET (1 << 0)
> > +#define  SYNCPT_CNTRL_NO_STALL                       BIT(8)
> > +#define  SYNCPT_CNTRL_SOFT_RESET             BIT(0)
>
> The whitespace changes here are completely arbitrary, it's changing one
> preference for another. You're actually changing the contents in this
> case, so it's not that bad. Still unnecessary, though.
>
> > -#define DISP_CTRL_MODE_STOP (0 << 5)
> > -#define DISP_CTRL_MODE_C_DISPLAY (1 << 5)
> > -#define DISP_CTRL_MODE_NC_DISPLAY (2 << 5)
> > -#define DISP_CTRL_MODE_MASK (3 << 5)
> > +#define  DISP_CTRL_MODE_STOP                 (0 << 5)
> > +#define  DISP_CTRL_MODE_C_DISPLAY            (1 << 5)
> > +#define  DISP_CTRL_MODE_NC_DISPLAY           (2 << 5)
> > +#define  DISP_CTRL_MODE_MASK                 (3 << 5)
>
> These are purely whitespace changes. Please don't do that.
>

This separates register content for register definitions

> >  #define DC_COM_CRC_CONTROL                   0x300
> > -#define  DC_COM_CRC_CONTROL_ALWAYS (1 << 3)
> > -#define  DC_COM_CRC_CONTROL_FULL_FRAME  (0 << 2)
> > -#define  DC_COM_CRC_CONTROL_ACTIVE_DATA (1 << 2)
> > -#define  DC_COM_CRC_CONTROL_WAIT (1 << 1)
> > -#define  DC_COM_CRC_CONTROL_ENABLE (1 << 0)
> > +#define  DC_COM_CRC_CONTROL_ALWAYS           BIT(3)
> > +#define  DC_COM_CRC_CONTROL_FULL_FRAME               (0 << 2)
> > +#define  DC_COM_CRC_CONTROL_ACTIVE_DATA              BIT(2)
> > +#define  DC_COM_CRC_CONTROL_WAIT             BIT(1)
> > +#define  DC_COM_CRC_CONTROL_ENABLE           BIT(0)
>
> FULL_FRAME and ACTIVE_DATA were previously consistent, now it just looks
> weird. Either use proper GENMASK() definitions where applicable, along
> with modifications in the driver to use FIELD_PREP() and FIELD_GET(), or
> just don't change it at all.
>

This one seems legit, I must have missed that.

> > +
> >  #define DC_COM_CRC_CHECKSUM                  0x301
> > -#define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
> > -#define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> > -#define LVS_OUTPUT_POLARITY_LOW (1 << 28)
> > -#define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> > -#define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
> > -#define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
> > -#define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> > -#define DC_COM_PIN_OUTPUT_SELECT(x) (0x314 + (x))
> > +
> > +/* Defines in PIN_OUTPUT/INPUT_* describe pin position, not state */
>
> This comment is completely confusing to me. The registers themselves
> define the state and bit positions within them seem to indicate the pin
> positions.
>
> > +#define DC_COM_PIN_OUTPUT_ENABLE(x)          (0x302 + (x))
> > +#define DC_COM_PIN_OUTPUT_POLARITY(x)                (0x306 + (x))
> > +#define DC_COM_PIN_OUTPUT_DATA(x)            (0x30a + (x))
> > +#define  PIN_UNMASK(x)                               BIT((x) + 1)
>
> Given that pin positions are in steps of two for all registers, does
> that PIN_UNMASK apply to all of them or just PIN_OUTPUT_DATA?
>

Check TRM

> > +#define DC_COM_PIN_INPUT_ENABLE(x)           (0x30e + (x))
> > +
> [...]
> > +/* DC_COM_PIN_OUTPUT/INPUT_*_3 */
> > +#define PIN_LSCK                             0
> > +#define PIN_LSDA                             2
> > +#define PIN_LCSN                             4
> > +#define PIN_LDC                                      6
> > +#define PIN_LSPI                             8
> > +#define PIN_LSDI                             10
> > +
> > +#define DC_COM_PIN_INPUT_DATA(x)             (0x312 + (x))
>
> It's not clear that PIN_INPUT_DATA_* can take any of those PIN_*
> defines. Given that there are only two PIN_INPUT_DATA registers that's
> probably not true, so I think it'd be good to somehow specify how that
> works here.
>

I do not need input data, hence this field is not populated

> > +#define DC_COM_PIN_OUTPUT_SELECT(x)          (0x314 + (x))
> > +#define  PIN_OUTPUT_SELECT_MASK(x)           (0x7 << (x))
> > +#define  PIN_OUTPUT_SELECT_PRIM(x)           (0 << (x))
> > +#define  PIN_OUTPUT_SELECT_OUT(x)            (1 << (x))
> > +#define  PIN_OUTPUT_SELECT_F2(x)             (2 << (x))
> > +#define  PIN_OUTPUT_SELECT_F3(x)             (3 << (x))
> > +#define  PIN_OUTPUT_SELECT_F4(x)             (4 << (x))
> > +#define  PIN_OUTPUT_SELECT_F5(x)             (5 << (x))
> > +#define  PIN_OUTPUT_SELECT_F6(x)             (6 << (x))
> > +#define  PIN_OUTPUT_SELECT_F7(x)             (7 << (x))
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT0 */
> > +#define PIN_OUTPUT_SELECT_LD0                        0
> > +#define PIN_OUTPUT_SELECT_LD1                        4
> > +#define PIN_OUTPUT_SELECT_LD2                        8
> > +#define PIN_OUTPUT_SELECT_LD3                        12
> > +#define PIN_OUTPUT_SELECT_LD4                        16
> > +#define PIN_OUTPUT_SELECT_LD5                        20
> > +#define PIN_OUTPUT_SELECT_LD6                        24
> > +#define PIN_OUTPUT_SELECT_LD7                        28
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT1 */
> > +#define PIN_OUTPUT_SELECT_LD8                        0
> > +#define PIN_OUTPUT_SELECT_LD9                        4
> > +#define PIN_OUTPUT_SELECT_LD10                       8
> > +#define PIN_OUTPUT_SELECT_LD11                       12
> > +#define PIN_OUTPUT_SELECT_LD12                       16
> > +#define PIN_OUTPUT_SELECT_LD13                       20
> > +#define PIN_OUTPUT_SELECT_LD14                       24
> > +#define PIN_OUTPUT_SELECT_LD15                       28
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT2 */
> > +#define PIN_OUTPUT_SELECT_LD16                       0
> > +#define PIN_OUTPUT_SELECT_LD17                       4
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT3 */
> > +#define PIN_OUTPUT_SELECT_LPW0                       0
> > +#define PIN_OUTPUT_SELECT_LPW1                       4
> > +#define PIN_OUTPUT_SELECT_LPW2                       8
> > +#define PIN_OUTPUT_SELECT_LSC0                       16
> > +#define PIN_OUTPUT_SELECT_LSC1                       20
> > +#define PIN_OUTPUT_SELECT_LVS                        24
> > +#define PIN_OUTPUT_SELECT_LHS                        28
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT4 */
> > +#define PIN_OUTPUT_SELECT_LHP0                       0
> > +#define PIN_OUTPUT_SELECT_LHP1                       4
> > +#define PIN_OUTPUT_SELECT_LHP2                       8
> > +#define PIN_OUTPUT_SELECT_LVP0                       16
> > +#define PIN_OUTPUT_SELECT_LVP1                       20
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT5 */
> > +#define PIN_OUTPUT_SELECT_LM0                        0
> > +#define PIN_OUTPUT_SELECT_LM1                        4
> > +#define PIN_OUTPUT_SELECT_LDI                        8
> > +#define PIN_OUTPUT_SELECT_LPP                        12
> > +
> > +/* DC_COM_PIN_OUTPUT_SELECT6 */
> > +#define PIN_OUTPUT_SELECT_LSCK                       0
> > +#define PIN_OUTPUT_SELECT_LSDA                       4
> > +#define PIN_OUTPUT_SELECT_LCSN                       8
> > +#define PIN_OUTPUT_SELECT_LDC                        12
> > +#define PIN_OUTPUT_SELECT_LSPI                       16
> > +#define PIN_OUTPUT_SELECT_LSDI                       20
> >
> >  #define DC_COM_PIN_MISC_CONTROL                      0x31b
>
> If there's only one PIN_MISC_CONTROL register, does that take these same
> PIN_* values as bit indices?
>

Check TRM

> Thierry
