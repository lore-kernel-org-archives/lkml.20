Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3173F107E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356269; cv=pass; b=mjm0yPpSqxOg6LsiSpq2o+6yibDewcQwVwYT8qriRaDWlXj7iBzVUPJYcm0OuvjAi8WJsen9jLVyGTBFTddZAD/OsPV/vBB9vK51kIb9K5i9kOMsoTykfbA8z6VFPB3TMpmBj4fmeOqZ/WhPZXq0O0jdw/EUABCGi2+J7y4Ws7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356269; c=relaxed/simple;
	bh=g/M7nl8CAMWTDaPZrkIyMM2srI0yx3TbivxMXYTz5I0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDXEQx6QWqI4yutT2ozYZIf+u76tbEI46/YTmbUDUg6YB1LSGETVs38k3Tc7JEPdikAGXqOwlF/o0TILE/Ouy1hbFZaqwEvIp/ru59FLRM/wj19h7VPiLMTy1aBf5xxUAYbys7pjYK7jTCBaAfJszj+h4xhjqPjL11hOELnTNXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkIX/iv+; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkIX/iv+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2055573c8cso168221166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792356266; cv=none;
        d=google.com; s=arc-20260327;
        b=iuVyHyccUjnTsXxGt7EMevWF/+j3hc40vw9ru9WaXrNOGb2n9fGDfA8/7GwpP+/TQ9
         mdndJpogUuacHB2WNfwn4ba9cbfYOqNpmeOJAAIglhFSm24Qu8LMj/H0hI+y9Y9IsdXv
         oFpzsB+T7FI59MrcIsgY9srSqjTtIxz1YJ6Tb+at63Idp/LCYV0y6mm14Aqtj8EFbCqi
         gwS+j0rpyfjvY7yr2iwWCXuJR12qRSp4tXlJ5s+gROTokLG2qHJHttUUosUeaBA5fRke
         VVSdOacRA5OiI7qHj8zjU7RwK3khtyoUMWfOIN+XmujrzOSBL5TBIqyPaJOILBLK+RRL
         ySvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+3d8Jw9619cDYgKWR0sQxv7zRJyClsX6yDbXUYOrpg=;
        fh=Ht7LP9UptD6evLYKcbnk5sbnn3c4/7geOxzAykJ7UQo=;
        b=RKHp5pVGCRW3HQue+HkNd5+0aFrsQoS8wYa++gZ+q5C8cWfLDGcTycxIZqYfswMNva
         oitmvPZS5F/LFLRy8Nanm+nKe1Vnb41bfxQDtnPrstdW8hql1o5ONahDCd2V4/bXNr5N
         e3+x93evzrGNCE5XTWt5gB4iU/85iBHaV1y2dJoGE38NyFXZVIh97exwgQR8ADZ7GC21
         jDO3p4EjrovmFrTcqTHPo9yco2aWzFWkrKkjiNTw5xWs3IgMSHsvQvLRFKvcQJNvnjEI
         PVDD5p+6j4MFvBdslEeISvNXphpdXARW/yLKgCyLqyUiaL7cQ4kXk4ixaFWu5rE8iBDc
         iTVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792356266; x=1792961066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+3d8Jw9619cDYgKWR0sQxv7zRJyClsX6yDbXUYOrpg=;
        b=ZkIX/iv+M5/D5yFFEj4YlZqpvdMPOnIP7LxI4kX0MHkVXHUTrZjUssaWS7QfMP3Ahj
         SJZf9d30friV9jy+z6n0SDOkXcceSReOcnCS+N2ssL49mzRVjamZqGkgJKbgflNeZmrX
         E21w6A4PgRhgLETAxAhbr49KgEJPliP/fmK5OLgeo6FqhLea3AQHof+UP8O8pXp2N3y3
         25XGEBja6XHlGIvktNLgsqYu4/DBVAsxadcCCmguHM8Bb4GahwWERWE8EumPRFEIZAXd
         lqovZ9Vpcng0BDcBJxpbErtOKtakiQyP0eyUMpzjmDP7VUrpRMAejay/HP2S6l9TIgIL
         Wz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792356266; x=1792961066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+3d8Jw9619cDYgKWR0sQxv7zRJyClsX6yDbXUYOrpg=;
        b=BJxJ9iB7rcY1ONnEQCXaXZJ80m+F15n/hUqvrpQXfel5djEtnnhcfLxj/80E+2YkXS
         N1sop76n3RrS25FnJx8yc0bsTYksXoWCqJdN7g/6kVF0+y8Vs85sxfuznfu2Xx73rqRx
         J5gAicP/qCE1ShswncS7KPLx9zSiV9KAU1OJtHtF5MBrk2YZ68t7p09fFOSISXZfoesl
         yQGR31svi6PIVtXuKOxmTZKGipdJ/xMvpIlHaEwjN4fW0yDx1NmcNovEbmdldyhH/AEU
         AXCaGCLg6VDUk6DQHDwzy0l+quhcILzaW1/b2ZB3I0BNc+PfZTMuwWrlSzNBQD4oxpJM
         icqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF9K59lrWfHUpDvhIZhxWcghKOt0IpBts0csPvQq+yfC6p7OzwktM+EPKLoHdx/+/KirxEOeq0ca327rQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEMK5uXjZZo1uegKKsgEUzDUh7VgABRVhjUZ9/ETqnY42o9Nm7
	vMU2Pm2zFp7SdGz0VCw4mciVQPjM3XafPzOiEIpFtSyi3yMLi/3f1vfBmne8SYZRAMAyO7e9trR
	KwqLkmPAdYjWyxcI8jfbuWXaeBQeCTP39OivMCNk=
X-Gm-Gg: AYBFou1BHrbVR4ZzXgBCwLQYQNWx0NVKnfdngoDcCj8WD+C8xa0Evp6J2BVB8eesGvz
	vCQwXSk/b6OaXZXG1NLloldDvKek7AMPHVOWjT5bw2u0WlEJfEaUzmJxBeVlKP5u9LD7EBNeUFQ
	IxVMeQPksqINjol/CrhMrnnbJKdQ7cJzEGrsH9R93Ch2sEe4NvJNnJCgajAwG1xk+F0oDVAjsTt
	SQ3lHAWK/jIa4C8bQhDZ9teLW+qe3mEFJC8C0VIb8pBgSJFcduh5B8zRcpDzL0+zv/9iX+98aVp
	tx+G9mZACpedhX1FSvMmfhWPTTrC2BnSTlDclzro1TUxrsAt+bUQoiAUUlR/nUIgcgPyHclmxFo
	dMqJ330daiCLMClQf9EELGpnBgpPa5gFmP1xczij00hDeHHUOZKBz9+Z3vLDLSlU39OhxFTTwhL
	W70GE=
X-Received: by 2002:a17:907:5c1:b0:c3f:8c92:3b4a with SMTP id
 a640c23a62f3a-c419df3e37emr375365066b.8.1792356266116; Sun, 18 Oct 2026
 13:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004213755.554191-1-voytikd@gmail.com> <e7c99dc5-dfa4-4ce7-b7da-a3a70a2710a8@roeck-us.net>
 <CAAX90H0qGF-H8BYcmT_vbUGoqN9RbfeGxMdTTRyQPK_h8MzFhA@mail.gmail.com>
 <053269a6-41ab-41eb-8756-b6a04eea2e5a@roeck-us.net> <CAAX90H1-tzrH6hwHHrvfQi2e-TXQKmgNy0Lj2TXG7yDbKYy3Og@mail.gmail.com>
 <170e005b-c6e5-4b48-bc01-9b07ff918252@roeck-us.net>
In-Reply-To: <170e005b-c6e5-4b48-bc01-9b07ff918252@roeck-us.net>
From: Dmitry Voytik <voytikd@gmail.com>
Date: Sun, 18 Oct 2026 22:44:03 +0200
X-Gm-Features: AclHuK-b7gXo_-aEK7081eT4PczvypQ9XyQklJwYCDAyJl8ejlUOVi5e2L1RXsI
Message-ID: <CAAX90H052BKT1d6NZSt4AvnHVc5A6xC2ntkybKmPj=LqhGA18g@mail.gmail.com>
Subject: Re: [PATCH] watchdog: allow WATCHDOG_PRETIMEOUT_GOV_SEL=y
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:48=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/17/26 15:27, Dmitry Voytik wrote:
> > On Sat, Oct 17, 2026 at 11:42=E2=80=AFPM Guenter Roeck <linux@roeck-us.=
net> wrote:
> >>
> >> On 10/17/26 08:59, Dmitry Voytik wrote:
> >>> Hi Guenter,
> >>>
> >>> Thanks for reviewing the patch!
> >>>
> >>> On Fri, Oct 16, 2026 at 8:21=E2=80=AFPM Guenter Roeck <linux@roeck-us=
.net> wrote:
> >>>>
> >>>> On 10/4/26 14:37, Dmitry Voytik wrote:
> >>>>> Fix the issue when WATCHDOG_PRETIMEOUT_GOV_SEL can't be set to =3Dy=
,
> >>>>> and always is =3Dm.
> >>>>>
> >>>>> The issues can be reproduced with the following steps:
> >>>>>         make mrproper
> >>>>>         make defconfig
> >>>>>         ./scripts/config \
> >>>>>           -e WATCHDOG_CORE \
> >>>>>           -e WATCHDOG_PRETIMEOUT_GOV \
> >>>>>           -e WATCHDOG_PRETIMEOUT_GOV_SEL \
> >>>>>           --refresh
> >>>>>         make olddefconfig
> >>>>>         make mod2yesconfig
> >>>>>
> >>>>>         grep '=3Dm$' .config
> >>>>> returns only CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL as module:
> >>>>>         CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL=3Dm
> >>>>>
> >>>>> "make menuconfig" doesn't let it to be switched from =3Dm to =3Dy e=
ither.
> >>>>>
> >>>>
> >>>> This does not explain what the problem actually is that is supposed
> >>>> to be solved with this patch. Since this is just a selector used to
> >>>> enable other configurations, and the configuration option does not
> >>>> result in any packages built, "WATCHDOG_PRETIMEOUT_GOV_SEL can't be
> >>>> set to =3Dy" on its own is not a problem.
> >>>
> >>> The issue is that
> >>>     make mod2yesconfig
> >>> doesn't work as expected. Help says "Change answers from mod to yes i=
f
> >>> possible".
> >>
> >> This does say "If possible".
> >>
> >>> I might have misunderstood it, but I thought all configs should be =
=3Dy
> >>> for this make target.
> >>>
> >>
> >> $ make allmodconfig
> >> $ make mod2yesconfig
> >> $ grep =3Dm .config | wc -l
> >> 51
> >>
> >> Not really.
> >>
> >>> Maybe a dumb question, but why does only this config have " default m=
"
> >>> and others use
> >>> "default WATCHDOG_CORE"? Does it have some special meaning with "defa=
ult m"?
> >>>
> >>
> >> Again, this configuration option is only used to set the (default) val=
ue
> >> for the watchdog pretimeout governor, and the "=3Dm" states that the d=
efault
> >> should be WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dm, not =3DWATCHDOG_CORE.
> >
> > This doesn't explain why it's =3Dm by default.
> >
> >>> I want to have no modules and still not disable the module load
> >>> ability, and it annoys me
> >>> that some configs don't allow "=3Dy" :-) otherwise when I do
> >>>    grep '=3Dm$' .config
> >>> I need to remember that CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL is a speci=
al case.
> >>>
> >>> FYI, for Arch Linux based config, only
> >>> CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL pops up with =3Dm.
> >>> A fix for the same issue with CONFIG_TDX_HOST_SERVICES seems to be ac=
cepted:
> >>> https://lore.kernel.org/lkml/as04AoNxjzlvh-K8@thinkstation/
> >> You are comparing apples with oranges. That commit states:
> >>
> >>     Fix the issue when the driver always gets compiled as a module.
> >>
> >> There is no module that can or will be compiled based on
> >> WATCHDOG_PRETIMEOUT_GOV_SEL.
> >
> > Sure, I understand that. What is the semantic meaning of making it by
> > default =3Dm? And why can't I make it =3Dy?
> > I understand the build artifacts are the same, but I'm curious why =3Dm=
?
> > Why WATCHDOG_PRETIMEOUT_GOV_PANIC is not =3Dm by default?
> > Thanks for the explanation in advance!
> >
>
> The idea is to build WATCHDOG_PRETIMEOUT_GOV_PANIC as module
> by default.

Doesn't this contradict to:

config WATCHDOG_PRETIMEOUT_GOV_PANIC
    default WATCHDOG_CORE

I double checked with "make menuconfig" - when I select "WatchDog
Timer Driver Core"
and then "Enable watchdog pretimeout governors", it sets by default
"Panic watchdog pretimeout governor" as =3Dy, not =3Dm.

Anyway, I'll stop arguing. I may be misunderstanding something here.
I'll just remember
that CONFIG_WATCHDOG_PRETIMEOUT_GOV_SEL can't be set =3Dy for whatever reas=
on.

Thanks for looking into it.

> There is no "why" to answer. Why build anything as module
> by default ? Are you going to question all those 478 default=3Dm
> configurations in the kernel ?
>
> You still do not explain what actual problem you are trying to fix,
> except that WATCHDOG_PRETIMEOUT_GOV_SEL can't be set to =3Dy, which is
> not a problem. The only problem I can see is that you don't like it,
> which is not a reason for making any changes.

> Guenter
>

Best regards,
Dmitry Voytik.
