Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976F3A3E97
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252815; cv=pass; b=cZdJPqwEknSZWk8M/Exu7eYnu1e8bFPe1rVewY4y4py9MWBikVGb55OY/l+AaQzDqmCnXWznV5DMo6g/K/W94wPfcpWA6dvnttDvvImMmhfEeK1JFOkLft5RrgZyB4kRchZGEViYtnmiQ2dDhRcapk8tLNhxC3dKOGILZPavu0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252815; c=relaxed/simple;
	bh=wiy+NLzkwFoKdfeR9uWNcg9YIp8IfEjhimuqcA3+buE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gK43SL0TbvQnbe/eP3Ro38TMoI4AG4xRj7pLsyRX0twN3SbYFRf4BSiHpFfWxuf00+js7x7LGlvef4bvDWbOuHv3NmR9gLaqKB6Im/C39g6rujYhLLymeAAExu2MmPVc1RtAHDmt9HQ95WmTE1Vsaj7hVO6JHbcmI9pd43s79Z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLm/4uV0; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLm/4uV0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e8c710847so101023766b.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792252812; cv=none;
        d=google.com; s=arc-20260327;
        b=AXRSI9ZtbTDTmYyoBTOiu75mwu8h1WHX5Dg++jsiI+vslz1AwSBKyxsXsaIhQZVuJJ
         rk1FxA2Fr1fa2M+tWNM5LRA7CvxWsJdQ8QqG/ClkltAT0hOdXDghcIm6n99/NsA/0pH0
         BllizOyQYDFTSVyj6SN08kVI42jm1K9xrXpOC7qmGEYxkCE8sKCQ8NtnnmyUcPsP+fYm
         jfyEE3Fn7vDPG/maggFKaTHu/UexlbRTo68GzfjgIkXHPQ6i4dmenkHxxiFS/67cnYbz
         W2sJqo92FKLwzgSpe935Y0ugxtLnpsCKFSp0hQla7M0jbaa4u4t8pdJIz/JiriLcJZvI
         7UjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=heuAmACvgemhYqOlhZaeKhFmZFnxaUC/Oh++mSifMjA=;
        fh=mALTJKqUhjGhva334FYNpTTECgXtH9jjunDSZz3jJ98=;
        b=NqnNh3rtslMWLTMc5Kqu8Yj/x1xzkfpN2RQPCdZGKhxd5WLTc98HhWrmkW0Pi+4rLK
         PBJW+5v9m0pAba6C3MnNZ8O+33fP74Lnlw8+P+pSh2/mLf/UYsbqSspjVGjbo6ko7v6b
         u9aivubR8j0qVHvz5yxkFnBYC7atOiwEO3brzKI7VP8JP9r9saAb8fyYeN+D+S7fOHsP
         hNca46TOpVLgpu8+E2eHeFaSywOiuuZzkiMO0Q1+MupLjpKcI8u8XgsD5XWRDdzo/4st
         ugOK/UzLCbeoBavVAkAMmaWbhYvbHq4B3voKHd3950L6iZz7GKdXoKhkT2O+wwgxpzr9
         xVew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252812; x=1792857612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heuAmACvgemhYqOlhZaeKhFmZFnxaUC/Oh++mSifMjA=;
        b=KLm/4uV0RMxKs37GrWWtsedpsHFWNLX7wH5iybXVlKt22bhKEdLuP/uYc3zNUITSVn
         6WB8bzy7gzOj00T0oe4yDzol7SajekpKRLTvf92Peq5ywK2Vn/F50k0jzjz/myt/BxiP
         Tvks4umgbWG34Kt8GGFgNzuqS3hx+/WP3wSF/JxGGkxkVfm1jfQnCMJqPnpjNHHURwWm
         1ttPv1+wrHS0y+Joy7E+ImNw9K28k3trVCL8/R+ZOapOmleZ9nsRgEiaU46mnNwzGfEj
         oQTzfpbdoiK/Gx7LKXlho3M2gNQlBqmITPOdunP/1EbA6OI8GRd0NRYu0jfzDpFMVBEA
         dqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252812; x=1792857612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=heuAmACvgemhYqOlhZaeKhFmZFnxaUC/Oh++mSifMjA=;
        b=PvmH0if4EAG0TziH1uQpa461RqFq386zJwd+l/M48Y446lODp5kfCRBFbzbO3sPMnc
         EeObssbjaVLmWRSzmTM+yyPNHHbZ2KKsuy196OcuXGEnfpJu7Wm5/DwM+SyO4/GrUMQy
         j2Bc0kaXVlxOG8mDmCQ/QkUsgF9E4qOIrYDUeda3uzMlAcHlSTVpiWsKfDdz1LPSBb7o
         zMd3GNZveN3dhXcAeZ7RFDH0jfBIQpSLE6QuNAoukvPZwinp1MgOkBcS1LRSz6b/8yf6
         Ze+xOEk7MHcHJwu6GiA3wP4z/9snrbZOvkg03S/+C6zTSWc65HeUuBHjznP96g0xetTo
         vyYw==
X-Forwarded-Encrypted: i=1; AKwUvBwxUshisxueZVy3PxvVwswmuU1z/vk7YF/RQUD97HbX9UC9kUe5mWSjmbhbotXuSlH7fmHdG+gs83BcrJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrz+S/G2bIB688ijI2Zt891kl559Non9wA30vt7z4jOOIFlVIF
	kUGfkRfNw6AkTb1XdQhLIV9dvSz7PbEvS89YeSV6f4ZOWsppNiKuoUDvHcSUqM4Rx2E2VXMgfcl
	lrM4z9Vb81CciNVpLij7kOdF1zwfXHXwrupv3VEM+SA==
X-Gm-Gg: AYBFou0fN9fPIvizn4l63RvZnP6NqSIzxXKWZg5NPvjaLZ3bN1bKvUddwbEj565pPGA
	K3xxFlmoaZE8lJhpTowYnOXXMgVN4TkMFH2kVnEKyv7NdrjRIrXFLGtLrZMAjw78XSbHIkMlkxk
	8EATE9IK/cACgKt4fN1316uz9NLavyVUo4PAbhr5BmJfsicjbWWw3FRyH7++kYTFfxBL7K2XbYJ
	8cSSL5ZrGGQ9CZEdZ8GEAQg/lD0Sc57H43FTm5WZbvgsfjZdUZXISwGF1JxBAZsQN70u5FkALRn
	D/CaLn0+HUWD5sEpibCXlQZFLvo3fKHz8IymWjgAzQopu3g5BqJyhobUAciQQVmLr8GtyobCiCk
	uDUD5WE0S/jLY92DHxt5x07QBPQvc4U125dfQmRfE9NvYf05986pyKGKrnHYg2yP0ckDX
X-Received: by 2002:a17:907:d08d:b0:c41:8736:8c38 with SMTP id
 a640c23a62f3a-c419f703a50mr183625266b.30.1792252811604; Sat, 17 Oct 2026
 09:00:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004213755.554191-1-voytikd@gmail.com> <e7c99dc5-dfa4-4ce7-b7da-a3a70a2710a8@roeck-us.net>
In-Reply-To: <e7c99dc5-dfa4-4ce7-b7da-a3a70a2710a8@roeck-us.net>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Sat, 17 Oct 2026 17:59:46 +0200
X-Gm-Features: AclHuK9eyUQ-EeMBBG5As37PnBuim74fPBHiC1Q9YRECSk0aLgHjvs0lsct5Mig
Message-ID: <CAAX90H0qGF-H8BYcmT_vbUGoqN9RbfeGxMdTTRyQPK_h8MzFhA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: allow WATCHDOG_PRETIMEOUT_GOV_SEL=y
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for reviewing the patch!

On Fri, Oct 16, 2026 at 8:21=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/4/26 14:37, Dmitry Voytik wrote:
> > Fix the issue when WATCHDOG_PRETIMEOUT_GOV_SEL can't be set to =3Dy,
> > and always is =3Dm.
> >
> > The issues can be reproduced with the following steps:
> >       make mrproper
> >       make defconfig
> >       ./scripts/config \
> >         -e WATCHDOG_CORE \
> >         -e WATCHDOG_PRETIMEOUT_GOV \
> >         -e WATCHDOG_PRETIMEOUT_GOV_SEL \
> >         --refresh
> >       make olddefconfig
> >       make mod2yesconfig
> >
> >       grep '=3Dm$' .config
> > returns only CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL as module:
> >       CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=3Dm
> >
> > "make menuconfig" doesn't let it to be switched from =3Dm to =3Dy eithe=
r.
> >
>
> This does not explain what the problem actually is that is supposed
> to be solved with this patch. Since this is just a selector used to
> enable other configurations, and the configuration option does not
> result in any packages built, "WATCHDOG_PRETIMEOUT_GOV_SEL can't be
> set to =3Dy" on its own is not a problem.

The issue is that
  make mod2yesconfig
doesn't work as expected. Help says "Change answers from mod to yes if
possible".
I might have misunderstood it, but I thought all configs should be =3Dy
for this make target.

Maybe a dumb question, but why does only this config have " default m"
and others use
"default WATCHDOG_CORE"? Does it have some special meaning with "default m"=
?

I want to have no modules and still not disable the module load
ability, and it annoys me
that some configs don't allow "=3Dy" :-) otherwise when I do
 grep '=3Dm$' .config
I need to remember that CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL is a special cas=
e.

FYI, for Arch Linux based config, only
CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL pops up with =3Dm.
A fix for the same issue with CONFIG_TDX_HOST_SERVICES seems to be accepted=
:
https://lore.kernel.org/lkml/as04AoNxjzlvh-K8@thinkstation/

Thanks again!

> Guenter

Best Regards,
Dmitry Voytik.
