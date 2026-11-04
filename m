Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798080;
	b=XP/4ejgmNvAktwdrfne/EoIQgWemXgZWtoyxBh2qeAxg1OBMI/NtmCjPKPwH42pxFMV7
	 fSrt6dKo/YbpsCAsDDKpQwoqwxFccvCnBQBtivqY5lREtfhSuHVbSa6sHN14kb16gZF4f
	 v04L3ozUh0pxvm+qKYo0BYG9VrXGXvWMf8cfYKTWaHcgmL7Ak+Ayv4ME5IOWwHaGSwy0P
	 vrKr4LZIBqJP2jH4JZDPMJeJPqrPsM2jF6OvqTwj4rphQoejKgR1SJmDk6CqR298/gZpF
	 Ql4khVLZxaN0F1n25tq9zaCa2w1fCppx/J01aQ6OwTdxCeI66R2jiF/VwozZ36XEzlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798080;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vajkXxV2I9Y6AOy4iqgYfUPKodpE+hYIP6A4IuPiEFI=;
	b=QJ4NRNyyUG39FgTE078wBo62o2tm5O3zqIay837QgIble4228fZfrElVFzZsQcH8snDP
	 +0+HE5bMNwkzxCDZuUrrEGkb1hQHjPLtGMSDVcTVDX5bacjanuQsZRWxKsyGFTUTVtnl7
	 GVLT9y6HbJK2vcAkSPCOjzINV+EInt4Lzxgb+jtRa08Cw6lWaRVuAx/oGeG3vtCPHd8EX
	 IKG7kb6AmGed1xKF9KoM9O1Ahj8QeZZJrs6pGjADTzQ+LUBZd/hzJ7arHK8VgK66qJ3qK
	 Z6Waa8NaujOxu26u6aNDBtO8V4mPo1ylABKLpGPKv8hAPLu+dm0SJkkkf3UlFkgNzAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4AE606A339
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F4AE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c43373ae89aso97704366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798079; x=1794402879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vajkXxV2I9Y6AOy4iqgYfUPKodpE+hYIP6A4IuPiEFI=;
        b=uRjIEpvaqrcM4rWIXxrmg11cOBqrkDHOzDOUihCzMp7piHHMTGNTiIgB3ZTdx2Eolk
         dHORtzMo7YLii/Tg2SWgmNKEh5gMSp9H2JPk+Z1L8A3R7w7oCPWf/AeGpIco3OYj/KDO
         u8g9zQwNwsnaLtyoT5Kw3fZS8rir//F2OZ4BQj5XDJ/Z9DUkHi+N8c2U8oMarVjazCgJ
         bNpvxp0grTOtWS40VRU8CmuDBE7szCaxvceHJF8CQownmbKUGaR4FwNcdgP5p52OS3fs
         DizZm39+WisTRA7kv6dKYW2qG4VbeU5BJy98Jc7SISbtYkFHI1Np1+ip4UGgiUFmE3ha
         dPZw==
X-Forwarded-Encrypted: i=1; AKwUvBz3Zkrd5LZ2FSkldXY7p/GYEi1X9LvGXRy+LJ0kD2JMMv6dKB0CRi6QU06DO0AvnOyhQy4Eiw//ti8frEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qh7+rNr/wzQU/jMzJVCizZxuJtgQ8lmckXy+TDiRgfVkkvPIV
	ZYAhN3zs9n0s6PYk1WBKPplRNFyzARe0RVGoDyqT25bv4L0EUsfUSW0XGDZ8PFmlG/Q=
X-Gm-Gg: AYBFou3mxd/MHeH2/4DBFjmXwechKoOA/lR4+/GotuqOYMEY0JzuPfEbnWCtlu1KzuI
	hWmsbkyiTtZ4f2Za4J9rhhyFVz8rz6Qz7uV1eYk+3l+/Fec2YiFYizG+pnrMoy2zOJdgbrboj0+
	uMeCoQsWrSgkOG+Y0qXOsWXddmfAZiKFA8p9zaHjovmeYPzki6uVaU9lw9XIa5eCBB9/WCfVdNK
	1/WwiwAmwGTboz3Cgv0zP2pjcqzak/noi/4VOLX70W4xBLZfe9EWb+JY2jfHSSJZ4jrZ6uSoM0L
	CnALogbcPz2C22CrY0L7xiDc4+TYJq/Dw5QULz6Sl4YYuqC9TfcJHHfjszBgYYLAPLXucbd/Pfs
	ppZx9T3Yg+T9FGsVL8wzu3YthmgQ4sKCZuTa2SOR4x/cM4K14TlmU7ztYygmqbcOxttTYM6sPhb
	C0RVTLb5AM6hgxmF4BBSLvFEtRGgV+p1IxktdvgY9xVQ6gA2Fa04x/qOgYUkKG/OGjuaVO0pary
	ylmL9KDXJtXKusuY/C8lBxI9cEG4YavfUX8mQ6mv3Ta9db3INbFFGdwP2owdcwftN9ONntPYS1P
	0JvnEYyJy4cg7dXDXKHXG1KQ/Om8EzLJjFx6kdAYxUOaTzER0COA9p3Ckss4VzjNS3NR738ZCw0
	oAaT5acvQTEA=
X-Received: by 2002:a17:907:3d89:b0:c40:cee7:3918 with SMTP id a640c23a62f3a-c4ca7b62b2cmr1399074766b.44.1793798078505;
        Wed, 04 Nov 2026 05:14:38 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a4ba7sm69824366b.78.2026.11.04.05.14.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:14:35 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c43373ae89aso97686166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:14:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzNF8hWvoFBMpno5hFUqZ66uAENl4sNhb87t8cAUkKc2xnVnvj5IXe+Xc32al3PhNs7E6JMaBRS0FlGmSY=@vger.kernel.org
X-Received: by 2002:a17:907:9c06:b0:c38:ee33:2931 with SMTP id
 a640c23a62f3a-c4ca7b5f423mr1315927766b.37.1793798073731; Wed, 04 Nov 2026
 05:14:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084604.700540-1-lixicaicai@gmail.com> <20261104120840.GJ1959885@ragnatech.se>
In-Reply-To: <20261104120840.GJ1959885@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 14:14:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-K+S3W3R58Tjk4RZH5KNdwRKNS1qYmMyshL+VNYj_rw@mail.gmail.com>
X-Gm-Features: AclHuK9fH8jlqLC7CTY_wgXt4zpoH5cDgRjYOD9LVeoHWxOe1XqqcCj35WRDWsY
Message-ID: <CAMuHMdV-K+S3W3R58Tjk4RZH5KNdwRKNS1qYmMyshL+VNYj_rw@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar_thermal: fail probe when no
 sensors are probed
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Li Ximo <lixicaicai@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wang Haoran <haoranwangsec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, 4 Nov 2026 at 13:08, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2026-11-03 16:46:04 +0800, Li Ximo wrote:
> > From: Wang Haoran <haoranwangsec@gmail.com>
> >
> > rcar_thermal_probe() returns success even when zero sensors were probed
> > (the per-sensor loop simply falls through with i =3D=3D 0), leaving
> > common->head empty. rcar_thermal_suspend()/rcar_thermal_resume() then
> > call list_first_entry(&common->head, ...) unconditionally, and
> > list_first_entry() on an empty list does not return NULL: it returns
> > container_of() of the list head, i.e. a wild pointer into
> > struct rcar_thermal_common, which is dereferenced at
> > priv->chip->needs_suspend_resume and in the MMIO accesses that follow.
> > A malformed DT node with no MEM resource triggers this at every
> > suspend/resume cycle.
> >
> > As suggested by Niklas S=C3=B6derlund, fix this at the root instead of
> > tolerating an empty list in the PM callbacks: fail probe with -ENODEV
> > when no sensor was probed, since a successfully bound driver with zero
> > sensors is meaningless. The error path through rcar_thermal_remove()
> > already tolerates the empty list (it iterates with
> > rcar_thermal_for_each_priv()).
> >
> > This issue was found by static analysis; we do not have R-Car hardware,
> > so this is compile-tested only.
> >
> > Reported-by: Wang Haoran <haoranwangsec@gmail.com>
> > Reported-by: Li Ximo <lixicaicai@gmail.com>
> > Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
> > ---
> > v1: https://lore.kernel.org/r/20261026115018.3227372-1-lixicaicai@gmail=
.com
> > v2: completely rework the fix per Niklas S=C3=B6derlund's review: fail =
probe
> > with -ENODEV when no sensors are probed instead of guarding
> > suspend/resume.
> >
> >  drivers/thermal/renesas/rcar_thermal.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/r=
enesas/rcar_thermal.c
> > index 9a9038671..6a1e977d8 100644
> > --- a/drivers/thermal/renesas/rcar_thermal.c
> > +++ b/drivers/thermal/renesas/rcar_thermal.c
> > @@ -514,6 +514,12 @@ static int rcar_thermal_probe(struct platform_devi=
ce *pdev)
> >                       enr_bits |=3D 3 << (i * 8);
> >       }
> >
> > +     if (!i) {
>
> While this works I think it's fragile as it depends on the loop variable
> of the last loop. If the loop is changed, or a new one added, this check
> can break. Why not make it robust and check if any sensors where added
> to the list containing sensors (common->head)?

Yeah, then we could move the loop variable declarations inside the
for-statements...

> > +             dev_err(dev, "no thermal sensor probed\n");
> > +             ret =3D -ENODEV;
> > +             goto error_unregister;
> > +     }
> > +
> >       if (common->base && enr_bits)
> >               rcar_thermal_common_write(common, ENR, enr_bits);

... if not for the next line:

    dev_info(dev, "%d sensor probed\n", i);

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
