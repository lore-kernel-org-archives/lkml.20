Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928379;
	b=hu2Zo3B4qc8sVDOII5PMmw4WsHrwps+ueMp8VbTp8nqGAxGGZCUhLaKcoMZiKJA19XKd
	 4lAuSZyHM7adksf8Qn/KNDe68eIiAQinLS7AATOfNXURaMz+zxTI5ASVMombSCT7fy1Ms
	 RSVsrJh3saVGaxneAiai2Ty1H2MoeGMUezbjM8AiDGLHu3M1K0xA07hpAfx13wdsBb3g2
	 IWJKDN215pYmLxU8ZA34+9tbQ47C1lMyv/WUMQ3RHxut+BlcLa79EZJ9eS1at70Vj9teY
	 EyoWMBZDGxgKptK41Vbabv8vaAAyZaiUlw9zuj4w4Q03Fi28PFqzevYoaTMxYxBNyDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lXzAHAHuyb7ljn+BW0UDmcAkjyTtMTKu31hzJUVD5x8=;
	b=DpgahynG2u0PHF7nEpiHgHnfdxw575WoFQPOJVeV79XkQ2jb3yqC8itJPOipGtMlWKam
	 C1OK+6oNdDA8E0rMvWsqd9Nj9Ixq4ZYBtJz7b+OYzVN7d/2AFqDXzNV2d0QMDLCyE5BCg
	 /EMd7XmTiyTU/5ybILIcUBymR9IthxFqPoEVwByC9NGNi3MUsM8MzHdNzMG9IaQnQzXsN
	 mhcDHNi/QaK6SGMO39DqkCp/j3SCAAtsdEdstFQPljs3a89s3N3vxkP93B5HOi7rXdgHx
	 nSvSDpgolUBovmudwN14nuZBaGAQyx5p5qIM9qNtz1KJu/3fhvFufPyZssByVbwE7Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3297606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3297606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-990703f817fso3546770241.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928377; x=1795533177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXzAHAHuyb7ljn+BW0UDmcAkjyTtMTKu31hzJUVD5x8=;
        b=Obb8PH6gJOQOMFbShke5pkxkmi2au8Me9CQKx6vgq4JsH9DOmmdsW4Zjg/uNfN8dWs
         t42AavDKKrSstjgjwNTN4ltNODrl7/B1b+1HS4tCpt6oCwwC5uaTdLL6+WRYfozD5QXi
         Xs/3zyWMokGc63z8uOfPG5M1FInfIwJv89zQ/F3PNEfPis9sfyhyv5frH9K8iNt2V9XK
         +SO+tl9fi0Eh46RNWreJkqM0W9v9xw/6JE0gvasrR+DSBmBi6R8mGk/Oh4tT6PsXBi5U
         R92vuV6UDZ31qb5X2iZDy/KN0S3sh8Y+TiNesZO1TaMNrMBAG0QCvxad4AsUDQN3dNQi
         tF+Q==
X-Forwarded-Encrypted: i=1; AL+hErFdLHu0H4h4dZ40SkrZ3tYj8H+bbpsiUN7LkOi8Wn52GqJcCFh/xfezOsyOp3INIKToWYFw4rEAE+dubTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rq89C/UtMeFnuAi8Vf47ncl4c1eFpA5zjaZmINJe1KIwvjJVT
	Y03JwsqLZ/W0N7Bje7YquK5uhGsgc3iC2f0gVVlGb4oRD7sS7k85Z9BxNjCCDG/x
X-Gm-Gg: AYBFou33tUq7f7DPD9KJTYJNbfsNj75Lm0RsW1XN/Cv8kwEVVQgq5CGGq6Uqs0l4F+u
	lKtWVXd8voz0MJfzEqpt/cEclMjdBUPewodUrFf7OPSjHTQr0UKauELFWYxtyQ0hCn6KRXG7/xC
	xLX3ozH5Ufrnk6cV2GVB0hMAPu0/+qpkWP08gkYw0VHgI89/uNs5ezyIhtw7MnhcdNKXmJXTW7e
	J8GHB+lKmRXKLX3m0MhoPL8AOkGIbjMVGJTcAGj3YdlPZ4lXiftCELW3u5PhlqdxmrvZz+WsUQX
	6uY2yI1jIbtovF5LGAEwu5Jd+lFSMtFcYl7EoeZBHU/x07AoAourLZySKQffGKkX3Wqkrp30res
	ojZjPetxICKwqnAc1OxggsgQS8VYalGkZ2RBpRgmuM1fuqModJdufJ+Pft1DLCrVyoJ2xix5DMj
	Hzzpk5L57TfJqiOlfduEkT+9U1A0/QL0PuUuTh28xRll2w44+CiFHtXyQUd6f6CKJgNy4UuG291
	8yYBIAD0pMifUYXRMkycQGogPS/9QeEAtTxeiCl7mTkYkkH0AGBFF0nCs+tZrL0oAgi/0Tsn2p5
	Fb3bOXta0wyU3rcQBBqcRcoWGyJGHoaiGedm3gJqiyCcWKDsCHzw0yl2T6BZpL2Fnu8=
X-Received: by 2002:a05:6122:2094:b0:5ea:be1b:1b66 with SMTP id 71dfb90a1353d-5ee344fcf20mr5283772e0c.0.1794928377266;
        Tue, 17 Nov 2026 07:12:57 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e339bfb55sm2183891241.12.2026.11.17.07.12.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:12:56 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-990703f817fso3546749241.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGuGl1IlF87XSy+Xsq1I7hFWRK8ljbh7LR4XEyDngsnpfprpU+rpJKpND4qSAqiREgXP/XVhJ+qyjPKNF8=@vger.kernel.org
X-Received: by 2002:a05:6122:4202:b0:5ec:c180:e1a1 with SMTP id
 71dfb90a1353d-5ee3468bc3dmr6118113e0c.2.1794928376130; Tue, 17 Nov 2026
 07:12:56 -0800 (PST)
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
In-Reply-To: <20261112-b4-tm-pm-du-v1-1-507474331137@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 16:12:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQjm9rqmKn35G9-CqGSuMO9nirDw2GmFfF2PBfsCvH_Q@mail.gmail.com>
X-Gm-Features: Aa3M54ptylXmhL6SzM56Sx5LCXa21m2jXwzZpxrJX2kGuRvWvlxVM_ksOElm6ig
Message-ID: <CAMuHMdXQjm9rqmKn35G9-CqGSuMO9nirDw2GmFfF2PBfsCvH_Q@mail.gmail.com>
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

On Thu, 12 Nov 2026 at 09:31, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add suspend/resume support to the RZ/G2L DU driver.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -140,6 +140,27 @@ static const struct drm_driver rzg2l_du_driver =3D {
>         .minor                  =3D 0,
>  };
>
> +/* ---------------------------------------------------------------------=
--------
> + * Power management
> + */
> +
> +static int rzg2l_du_pm_suspend(struct device *dev)
> +{
> +       struct rzg2l_du_device *rcdu =3D dev_get_drvdata(dev);
> +
> +       return drm_mode_config_helper_suspend(&rcdu->ddev);

error: passing argument 1 of =E2=80=98drm_mode_config_helper_suspend=E2=80=
=99 from
incompatible pointer type [-Werror=3Dincompatible-pointer-types]

The "&" should be dropped...

> +}
> +
> +static int rzg2l_du_pm_resume(struct device *dev)
> +{
> +       struct rzg2l_du_device *rcdu =3D dev_get_drvdata(dev);
> +
> +       return drm_mode_config_helper_resume(&rcdu->ddev);

... likewise.

> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rzg2l_du_pm_ops,
> +                               rzg2l_du_pm_suspend, rzg2l_du_pm_resume);
> +
>  /* ---------------------------------------------------------------------=
--------
>   * Platform driver
>   */

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
