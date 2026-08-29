Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B6735C180
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788017145; cv=pass; b=qRg+Qc83j08w8o1C/0eJeCQFi/qYLTnmyX7mI6BFtC8J4xZhPC8ya3XfXBh/PG0J59YESr2anC1FVp+foc8XuD42xMMPQRb6LcwQ0bGvXy494uUyJXuIUwA7e8ustjPbpnM12RHTRfIQLdTz7nEgxUQQDgF+PG4VA4P3jFhKUwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788017145; c=relaxed/simple;
	bh=f/s/VPM/Lr0syanvkeae8Dtn9hVd5tNtV+yh//2/w4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbWwkq2PIORJl6iu91sIzh3mM1CamHcUzCBHrTyen7mXeYq2TdLjjCAHSW2T+O91TkSry4hBdHQ4bhFcZVb3ymwswX4Mo2DBKA5hPEibLFeJbCenzY9p2ZwT9f/iF4wWsAM1yP+Fzz1h74UuIEjFkeObxN3kiuH5cIxxK86RVpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnuXiHET; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnuXiHET"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2462514a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788017143; cv=none;
        d=google.com; s=arc-20260327;
        b=Wc5XA7jw7RNLhc3Y/lD2R3M9g+zIWZ7Fqvzx9eKSdDIVGStyrA11GLMVyxeGJ7m357
         Wg5y4OPibGH4w/PlWPHNNPzQ6vKjUQyH1u3nrY9XBtSPvUsU26biEKbOjB5MwB+wVoAl
         nudfvi6gIf6PdgyS01NPMSrqNKy5GErRJhDPUYUbCo81zXGPlhnJPGBMahBQsOGvhErN
         pa+33EvH28Cz7SAt9C8IP/kZKetjH1B6aVH44NUXAHunNAwq6XIegt6eRMbYMCcstTf4
         /f8N0+lJUlIE+kkIH+InxjikFbBAuq9IKv7u8iFD+PdqSvtBgJhTJ4nvKQ6mu9rmtp46
         tKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vdXxpOV3BfxzN65NOTLlQ+CtWQCv48GXwA+hHSuHZk=;
        fh=FnN0Q70UxzkOy7fUXES8DlLXf1v6hT4yNIKj5zdcTXg=;
        b=r3UEM/Ehcu69ms81NA/Xk19gviu0SkpdIwh8gjg7XGn1SW44z9hMIxxWuFRhC6r+Wg
         nlr3eSsak/rQF+7JehJ/ALWx+zGLlGZGFEmoUDG5fYGV2fjtEXjapobEKeNcc0G8eqW9
         v4Yl6tsIdsFnyT9PAJIkxxWTJmZOTRvihTtx3xSOOrmh6HfQE//x2wgdKbGknNr+ybYN
         nxoVEWP7U6S7AfKD1MnZH9igx/N+iFwaB6H8Ksnha4gx1pjb1iIMyEta/rfh3p0Nelhu
         Tiy/FB1cWfCiZro3RIKAGQ2NQ3rE7q5w9UoMo9FWLiF37vVIh0d2VOTk9LA3gBnod7Rz
         qabw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788017143; x=1788621943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+vdXxpOV3BfxzN65NOTLlQ+CtWQCv48GXwA+hHSuHZk=;
        b=rnuXiHETSNmNFdhiI28TxDipGz8H0SRMHfxbiUIF5ThSU60nvC9htZC0fBA547FDWT
         a+SOmVQwDF/0lVEFsRbUzQpzkQNK7ZuspSxU2A6bFQSIKUJVFaEX3E3rs5PcAlmxPq5m
         N8AcUBN+BBq07esEswDeq5dJb5QmrVn1GgNpzz1hZDI4u6kYF8xU4wQxWQfE5mif3Vsf
         cEWYqTBrMJi4Rwx06atcjWTLkf9UEYwmdN7p2UYRZw02cyhWggqXU/TlFaABJRA9T8Kj
         FtDe0ikGOjvKNJdXIptpjga7971K7MPaUHUlqF24Lhx6yX8f7/d1u/Z6r93aI7mcCuty
         y1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788017143; x=1788621943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vdXxpOV3BfxzN65NOTLlQ+CtWQCv48GXwA+hHSuHZk=;
        b=IevRx8CCak93TdT6fTRLPCT6C/KpVOGkqaZnsQzEgkq0AeA1ThmdiyWofwm5jCC5zf
         Do45E1g7A3DTlSnN/MINAutb8UfZpFU5eHmdW+CPGLXrvVYJxPzUvNafgF9kQ9InxRsx
         U/xoGR4UUUPt+vQaAH49nWkXVFI6ndyl1FkFXlpizte2EDL7cufSiiZexN9hjsUhUtVL
         Krs0DO1ThK5SY88Ybhh/dmZ5RNiL6/TiS0SEQ37oohGxAwp/SB+7uhgiOHjbb51VHrU4
         QOohmxlZQyuRUfAYR5D2KnKm8+w2BtSNFxpkF9Vo9IdXfrQ7wfKDY/DNGeJU/KTZKnxH
         QCsA==
X-Forwarded-Encrypted: i=1; AKwUvBx47Xh9St6uqL4E8s2oQIy66GQobs3vZjpo2GuUQ52qMgeuq6OcYXI7cu5DztTnet0t9cidv/W7QfICFFk=@vger.kernel.org
X-Gm-Message-State: AFuF++lIJA0SEIsiFDQMjgRoW8EXOGtXE27B77OqgHfmDZwrf8XplqZQ
	3BS1VALVVvI136/3Y/qwx9QUnC9b6u2kgHumM3iaF6N7Vh1UVZDgE7JknNxcc8N7gOU5Z/ORHUe
	JiYem2DVWXI2eRyC1nwuvOoHMsUdNasc=
X-Gm-Gg: AYBFou2qulz6rWw/InuWY/pB3arZVLp8wzzGx8RfWueSKoobDDcOtcgnRyeliVY97A4
	kvWC0cgh9UL7wAoPY4pucNe09ZWxkAie1aaPwUvMIII/eR7Jip1gg/VZblfZYS+cEeILVYqcmmb
	LzjCl2Okr2hIWK8SxVmymBN7S6LFxX0ugn71WvSSDNSGgZo3XWfWtASfkU11bJp6ax45HaHMEYZ
	MSrifk50P5nWNAxcyuf+iLxd7k8xchDjowp88OURTa211MReYZcHYs1R/me7JhCnPas8T3sBklq
	+n+Oj4NcX5FoWvbDdv3o7gmfTvNTck9qZfBkViyBAKwartpN42Dfh1KivsfpU2f21MaRykpnw9d
	1vQ==
X-Received: by 2002:a17:90b:1e05:b0:398:9bd5:490c with SMTP id
 98e67ed59e1d1-3989bd54c4emr9157251a91.19.1788017143287; Sat, 29 Aug 2026
 08:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625082507.57703-1-clamor95@gmail.com> <20260625082507.57703-2-clamor95@gmail.com>
 <DKSTU1V8CI9T.1CILLIDVSCGTQ@bootlin.com>
In-Reply-To: <DKSTU1V8CI9T.1CILLIDVSCGTQ@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 29 Aug 2026 18:25:32 +0300
X-Gm-Features: AcwNN1UsWEJpZRhqcHwqIRCxBAXEtc7byNpBTuq3vGpQa2odXY3oJraHxfULBuw
Message-ID: <CAPVz0n0zi8DfbNWa25gut4Uz5UpD2ZuQ_xb--CTThysvGJRTxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpu/drm: bridge: tc358768: Add delay after PLL setup
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 19 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:5=
3 Luca Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Thu Jun 25, 2026 at 10:25 AM CEST, Svyatoslav Ryhel wrote:
> > After tc358768_setup_pll() enables PLL_CKEN and the lock indicator come=
s
> > up, the DSI register sequence runs near immediately. On TF700T this
>
> Do you refer to the Asus Transformer Pad TF700T here? Please add the full
> name of the device.
>

Yes, I am referring to Asus Transformer Pad TF700T. Sure, my bad.


> > results in the bridge claiming PLL lock but producing no DSI video outp=
ut:
> > the panel powers up, the backlight comes on, but the framebuffer is nev=
er
> > scanned out.
> >
> > Insert a small settling delay between PLL setup and the rest of the
> > attach.
> >
> > Suggested-by: Michele Brocco <brocco@perceptos.de>
> > Tested-by: Michele Brocco <brocco@perceptos.de> # TF700T
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/tc358768.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge=
/tc358768.c
> > index 0f2820b37302..ea358c8da0e9 100644
> > --- a/drivers/gpu/drm/bridge/tc358768.c
> > +++ b/drivers/gpu/drm/bridge/tc358768.c
> > @@ -824,6 +824,9 @@ static void tc358768_bridge_atomic_pre_enable(struc=
t drm_bridge *bridge,
> >               return;
> >       }
> >
> > +     /* Allow the PLL to settle */
> > +     mdelay(20);
>
> Why 20 ms, and not another amount? Is it backed by some datasheet? Or jus=
t
> "it's what fixed my usecase"?
>
> The extra delay is a panel requirement maybe, and definitely specific to
> the specific hardware pipeline of the TF700T. Would it make sense to add =
a
> DT property so only hardware needing a delay can add it, and add as much =
as
> needed?
>

This is a fair point. Thank you Luca. I will experiment a bit more to
see how this can be arranged differently.

> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
