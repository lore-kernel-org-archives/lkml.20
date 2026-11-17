Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929868;
	b=DStIurJ5Mk2KQfbEJmPphi7PGeM8ie7vh6FLjw2533deqbjNNEWG8YHu+UTY+fq+5L+2
	 z61cXRcQ80F2NlnTsM/yRqHi+k2oEUXnTK5XkUw1vVAKEAieRfcjnpdpubXou+GQk/ezp
	 7zEljP2F/7YqT2EdctSJo4AVtIM8dhu8N23AiC/SX3LCIKzZ9Igm88PfrLqj+JQllh1bq
	 8W4sULdqZmjdPlRf9R1Tu3s5TZue72abACW6Q0PEW0C9yCd6QfnqZPWY78g+CPb10mw9M
	 BFM1Liu9thlZY+71+kZoHCaRFe+AfYx3PM4nX0TYygQvEv18qKsQIwxjmNHmuusXyJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929868;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=edkz8rhF75H54wjVaNZcUL3aDSKXaXqJ2SuZNB31jO0=;
	b=e167k+XT3Z01f4Vgc7TnsMRlfvQKbxijLW8qGTmUaPhtCRvfCsCDvCjcpW4/sbNrcY0A
	 CHg97EiBwKp+wTzx2xkjXfzeirAsJCFCUDHxXLfWt5YJwhTAH0gkQnY+1iRb2RKtkROfr
	 CQy/bZYD0TMZJLfRmqzY+LZS3R6/A4nva1V4+F+IvbBlVmnm3gXKLkwvP3cHaT59Up4OE
	 MHmzIWHsKWrkxPQC0gZB1kIVSVLV/TVx5bHOYp/oPodJT5El39AzPYgQ3o0JGF6gHiW3u
	 8y3dE77jTRKvpD2GsW0ZW7OcUfq5PQK/G9tYT/FemijXco63D/JeZEkgUuT8AuAwXkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739C606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4739C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-99075306daaso2924704241.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929867; x=1795534667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edkz8rhF75H54wjVaNZcUL3aDSKXaXqJ2SuZNB31jO0=;
        b=KSIFJELiilkEVrYc4/PpiHZLi9gnbmOr2kARubMzETUgFmy4Z2M77eQP0HhG+wErK+
         u0JhrxfoMVLDmqs9Q202b4KB+6g862TFZpQplxQr4SavlQxP6weKMXXJGRZ55JFKTcWY
         BOUq37qM9IBctsHYvyLmrbgRgF1bflcZ1VBy5akDWiMF5xsgRi8EAyr42/EZGk2rMzcP
         n8QMNKwMNZWp83s1HnSxLGSg0Rh+C7emlvPx1ioINNiDSSTFfVp5J3bboiVH9susBluI
         xo7GAlwqUVjVO74fPl6V8WpMoeqqWOFZp7eP34zuAZWgPcjevmFiQ8vsZc7eHk2iDqjK
         BOOw==
X-Forwarded-Encrypted: i=1; AL+hErHDZQjHMob8DW7Mopn7OIYGsTnDi+KCn/TsEQtCEbj55Ss5DT5yYikvT2iDex0DM0PkjH8fdrwMp5Ks23A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z4ioxK3w0wtTEo0NHHa94d14BnJ00w8EERwgXW+SgMoDqt02C
	lHC6PEXiMUgiona/8P7skTO3wJa1hK3mbxMhQobueqeHxrXwlxRr/KfLLBygMv7t
X-Gm-Gg: AYBFou1Pwc1gA6pdSlG96UBAXLUucGN145kBMpVG7yOyHk6zfgZvg/XKTOHH1M0VrUk
	7Iz6gywqu8wL1GeP5AniPwyslxLmhCL3Wm8PjKZZOAartG+wJWkwNrj6cR2NZB5jtP7/HVUzyha
	tUW5TFMKwyrFo6BArkpiZ5aE3/reih6oam9BdtGsK7nWT1cnDNzg8x1JQf4Uc1oWjR4EigUdf05
	vsxSIYUaa4cf1eYB1lbIdcFP9s8rxu+lMVPphbbtoIOd32GKuxV2e+Pvu7dHWRK5WRC8HjFLsZ/
	KK84a4wJMnCtSsk2SQlSDxvMHMusiwHkdN4DNanRPfDUW+/q7Zjl3MfCCWprlRC54aPxae+pFU7
	UT8lIiiCCK1em4f2Nu0mHwwpkT5z2ZQD8yA5TbzkUpwdF1NTXxLRX63snbWDr7oOzzx2p81niig
	mobiXA5IdwKQ/J5gEmkbO99wI7uOU4esjr5gmxIErhtaTv48SqLxOzbSvhX484278PKgqt6tWsE
	RiCsyO7mfMk/FM3putYkBbeRWu6e/iyKnuqyDoCOpzH6vbyX3+s6KmMm0M4Y2UQ48w7llKifJA5
	nSyMjj+o3CtZ1FrCT+UKHSDxtEQjPWz3BxDof8HwmDqW3iGAksVRY3BPf7XjOVmnlUA=
X-Received: by 2002:a05:6102:f06:b0:7d2:d9c0:2e96 with SMTP id ada2fe7eead31-7d64d8e378cmr5953741137.31.1794929867121;
        Tue, 17 Nov 2026 07:37:47 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e3390a0fcsm2328809241.7.2026.11.17.07.37.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:37:46 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc53938a8fso5197555137.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:37:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEsvmjuPBuFfcDaU9lja6zgHHB4Whqk1whGwi5MzOKLCn16WAEreTgOv8w7QVNfleqsfjJ17IB48YxJ8KI=@vger.kernel.org
X-Received: by 2002:a05:6102:c15:b0:7d2:8dd0:2eb with SMTP id
 ada2fe7eead31-7d64d6ed886mr5633979137.8.1794929866113; Tue, 17 Nov 2026
 07:37:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-b4-tm-pm-du-v1-1-507474331137@bp.renesas.com>
 <CAMuHMdXQjm9rqmKn35G9-CqGSuMO9nirDw2GmFfF2PBfsCvH_Q@mail.gmail.com> <avxy_u864ZT7vsLx@tom-desktop>
In-Reply-To: <avxy_u864ZT7vsLx@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 16:37:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLw4zYGCg5isy8Mdxfgub39CXbCNgFmNsv3XMj40U7dg@mail.gmail.com>
X-Gm-Features: Aa3M54qPbbFS8WXjl4rVfHsNDf_vt32c6X6we35W2mQ26XiZPauxobEfSjiOsc8
Message-ID: <CAMuHMdWLw4zYGCg5isy8Mdxfgub39CXbCNgFmNsv3XMj40U7dg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Add suspend/resume support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tommaso,

On Tue, 17 Nov 2026 at 16:30, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Nov 17, 2026 at 04:12:43PM +0100, Geert Uytterhoeven wrote:
> > On Thu, 12 Nov 2026 at 09:31, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add suspend/resume support to the RZ/G2L DU driver.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > @@ -140,6 +140,27 @@ static const struct drm_driver rzg2l_du_driver =
=3D {
> > >         .minor                  =3D 0,
> > >  };
> > >
> > > +/* -----------------------------------------------------------------=
------------
> > > + * Power management
> > > + */
> > > +
> > > +static int rzg2l_du_pm_suspend(struct device *dev)
> > > +{
> > > +       struct rzg2l_du_device *rcdu =3D dev_get_drvdata(dev);
> > > +
> > > +       return drm_mode_config_helper_suspend(&rcdu->ddev);
> >
> > error: passing argument 1 of =E2=80=98drm_mode_config_helper_suspend=E2=
=80=99 from
> > incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> >
> > The "&" should be dropped...
>
> Sorry are you apply this patch on top of some other series?
> On top of next-20261116 I'm not seeing this issue.
>
> Maybe I'm missing somenthing?

Ah, I have your "[PATCH v9 04/10] drm: renesas: rz-du: Reference the
DRM device by pointer" applied, too...
https://patch.msgid.link/d5a97ddb346c5cb959b39fda45277afb1fa2ae16.179277096=
5.git.tommaso.merciai.xr@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
