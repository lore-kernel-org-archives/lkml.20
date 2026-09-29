Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37D524AE8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686990; cv=none; b=YSD8zVp+/KZvNmu3HIPRFNWlKKEZXE4s0taj746MBv7zJk27/iQZVnMKKrXbVGxJnGIBNX//2XaIyKbPTzMB6xXLAh8q0v+0X0AdNGarOoHSPCFDPdpje9xqYNZopwBa3+/B9wUcvwIpHG6zvyh44KlGWp9F78xubgi/pxwFRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686990; c=relaxed/simple;
	bh=Cz6yzoqzZZKggbHRYEUoEWMBF2GsBR1cUX34xnIoG/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoCOERBJupolJGjrWW+zC5AK2SSspdwuSXdVXfK7jdSpFwcXU2aGtVG4MPeMBNYZZUcSpO9KLnIyXYPdbib0HUvvjlRUMhQvhJLq0aPYPza3BH1y6jfvEzaC0Q9FrztNOU8p4lQ0xQPdoe6UEhW+RpokzgbdWXpJscEOJ+soWBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKzOvk4l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKzOvk4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED09E1F00899
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686989;
	bh=37EPhNuTofFwtN/QAT2xqnB++jVEO++YPBVY4Xssh88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nKzOvk4lm01c9i6AFXI7ItCmLiSuPVH2ddKMA0U10rCgJ6SySxDHxB5Cl509EseUe
	 pqf78FYA48f5OE55XybnweEdt9slRT+67vn2qOHODe3Rj8HMqHjF6ejfiz6EcZoMfY
	 kBcKZ10rUM+DlTUhCJkmNUJ8PTV1bSgDuaKcJ8Fbp6nrOtxYCNNNZPIQbYZD8xGczR
	 7ruUrQFz9r7mPyZyeerbA1GUKBnrRHQJyw/6mw+xJDPdzAqrVMKBqtbjvn0U5XBtv1
	 SOyWP/P90EClsPxkLzaOgLVEIel/E1EeDR0K39Dr90ZusUggVu/12fbw+5v4rwmsff
	 yPtaf37Ch+HbA==
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4693691fde7so2604303fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:03:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjTTJStxQIpYn/o7jzJjxBdqLIFyUh1xNlbuOOl+l0jrQcX+NfKFlEsosxLzy7mNDWm+RH9/eaeqy9z/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nyCWhHBx2rk+D6c+OTe4YMwHAK6L33QiwV2YIjxCI1KPLEz6LT
	0H/7exxt4fNWQqfB1FxGoBqRv2CbwDSqBbIDGR59zXWfyUs38JluIdf15YF+0DrbsiVIiWdJ1HN
	HBwiFUJE2aad9IZrtbvDSzW5xPvEHXdk=
X-Received: by 2002:a05:6870:d404:b0:499:f197:d79 with SMTP id
 586e51a60fabf-499f197114emr1076008fac.17.1790686988186; Tue, 29 Sep 2026
 06:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org> <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 29 Sep 2026 15:02:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
X-Gm-Features: AclHuK-Qd0URk-jzkKvP69eKU__69SXNOlyvT8nHCDMV5m7lT3rRWZmfmDiZ-Kw
Message-ID: <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jun,

thanks for your patch!

On Mon, Jul 27, 2026 at 10:09=E2=80=AFAM Jun Nie <jun.nie@linaro.org> wrote=
:

> +#define R63455_MF_CMD_ACCESS_PROTECT   0xb0
> +#define R63455_SEQ_CTL                 0xd6
> +#define R63455_DSI_CTL                 0xb6
> +#define R63455_DISP_MODE               0xb7
> +#define R63455_GEN_OUTPIN_SET          0xb9
> +#define R63455_DISP_SET1               0xc0
> +#define R63455_DISP_SET2               0xf1
> +#define R63455_DISP_SET3               0xc6
> +#define R63455_DISP_SET3_2             0xcd
> +#define R63455_DISP_SET4               0xcf
> +#define R63455_DISP_SET5               0xec
> +#define R63455_DISP_SET6               0xef
> +#define R63455_TE_GPIO_CTL             0xbe
> +#define R63455_PPS_SET                 0xe6

This is more details than we usually get, which is nice.

> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_MF_CMD_ACCESS_PROTECT, =
0x00);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_SEQ_CTL, 0x00);
> +       r63455_dsi_write_seq(ctx, dsi_ctx,
> +                            R63455_DSI_CTL,
> +                            0x20, 0x6b, 0x80, 0x06, 0x33, 0x9a, 0x00, 0x=
1a,
> +                            0x7a);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_MODE,
> +                            0x54, 0x00, 0x00, 0x00);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
> +                            0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0=
0,
> +                            0xf, 0xb2, 0x00, 0x64);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3,
> +                            0x08, 0x70, 0x28, 0x48, 0x00, 0x00, 0x13, 0x=
21,
> +                            0xff, 0x00, 0x0f, 0x01, 0x14, 0x17, 0x00, 0x=
00,
> +                            0x00, 0x02, 0x40, 0x0C, 0x00, 0x00, 0x00, 0x=
20,
> +                            0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x70, 0x=
08,
> +                            0xD0, 0x02, 0x21, 0x6F, 0x08, 0x5A, 0x00, 0x=
00,
> +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00,
> +                            0x00, 0x00, 0x00, 0x00, 0x00);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET1,
> +                            RTN, 0x86, LE16_BYTE0(VBP), LE16_BYTE1(VBP),=
 0x08,
> +                            0x70, BE16_BYTE0(VFP), BE16_BYTE1(VFP), 0x00=
,
> +                            0x00, 0x08, 0x3B, 0x00, 0x00, 0x19, 0x01, 0x=
22);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3_2, 0x00);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET4,
> +                            0x8b, 0x00, 0x80, 0x46, 0x61, 0x00, 0x8b);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET5,
> +                            BE16_BYTE0(VID_VS_DELAY),
> +                            BE16_BYTE1(VID_VS_DELAY),
> +                            0x00, 0x00, 0x00);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET6,
> +                            0x00, 0x24, 0x00, 0x00, 0x1f, 0x00, 0x00, 0x=
00,
> +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00,
> +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00,
> +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00,
> +                            0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x=
00,
> +                            0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x=
03,
> +                            0x1D, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x=
00,
> +                            0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x=
00,
> +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00,
> +                            0x00);
> +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_TE_GPIO_CTL,
> +                            0x00, 0x6A, 0x02);

So for the commands above we have a little more knowledge than just
opaque numbers about what the display controller is doing.

If you have a datasheet for this display controller, then please add some
one-line comments before each command to explain what is being set
up.

It still bugs me that we accept this much magic numbers in panel
drivers but I guess I just take a deep breath and live with it.

Yours,
Linus Walleij
