Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411616;
	b=E2kAcerz6x+oteduxImWxN9SCu8NYqGkv4Xzi449ZH8WvQvb1tKxf6VJ2nUIelezZAUx
	 cxohURZxmSM1Y3H6Q5d1OYWiriftIMI/FEQc/wj6jUJ/Zowm/7QmzdIGt0zqHMajoINBE
	 8tkqFzIr6K4QnSswNN30RgBBTZXtXv2ibP3IH/2H+TU/QLe2laqaQw2CgQ6yLH1oCBgHU
	 /+//3udmOsDcf7UFOfhGul5Z06ejSYA8kjZpSQIWZTULjTbn7r8+cCUO8C0Q1XleNaA0A
	 t45iC3lr1RJSEc/AMmH/MjhwygdQykZJtPoKjzReLQbMyTBdzRaMQRnypNFovAzzLrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
	b=mlrUv17TWf+ELJpqxv4K+guiyh2597fZRPIKFkPnUSCH1xcfsUPoe6j9BfFX1A9aA6Dm
	 V/+kvvDULpQwiChIScMgr598UruPakTdlC996g00cMcy5p4iLPJi0hqJtehijXerZDyfL
	 AQK4KCpgorC56d+ZbHD80tnYvmlWjo+Nd0gFfHXdW3FPc9cEAOnQF5KN1d2Yo3EwfKSXj
	 8g1R5MgUAor7VSiHsulOEmBsPutYPrjbLSM4uCbEBWI8fxskJDwCs1NueMzLVrUINV6oQ
	 CAlEB6fZsVhc5MpeXn7Hqa676cSuj+Qo2SprfdL80BgVsK3l3ETqwsp9AOCLpxws0Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUVIlqux;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6E606A884
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A6E606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUVIlqux
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3720addb068so5955440eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794411616; cv=none;
        d=google.com; s=arc-20260327;
        b=I/6SsMN6eYwWn/T/lI7Xn9F2z9nxEmiSxy3M8GH29572eDnqj729LQNVEbIlaPUGMV
         jEtDFhE6YqNbqYrpBt81pXeM31dZ7khlfQbus8p8W9UQsFd+AeFCeuk0eKozoRLRl/8s
         IdATWHNOgJVx6guGTiXfx0ljbPelskeNXPoE/qgKlX1KPociYKRMe89lwzAAiR+8Knwy
         rLlhDvNsa7jaFOxiag30VDqCl/btKjkSTf0aX2/zpgH6tE2X9CgLlZsTuoDDSBuBkSIJ
         eJVPpjA2r57dmo6VXzIyLIFlC9A7DRsTKA2RFuGlrvDAZEQDPo0Y/TyakkkuBGpFjd68
         V3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
        fh=kTi0Tp2aztHtQWqkLW6U83hTcaolxvblgWP1iYHKIH0=;
        b=Ahyx8GdMCokxtQYAaZfYBqBc+nZ2BayfKCkcl0s+qPw9d/jmIuhmaaL2DW2ZlYguPP
         aE8CnprYzuRHgBqyoX1mt6CdUWEU5NZphYU/maeZkQVhwAMPUAI4eamUeTx+4+OQ/x3d
         z+8+s+RKfoi4LJuaymWCWWnxqhhpDorfC9owTAzK0hsOBJ51fM6weG2JcQ9r3OsnCpc5
         ealWwwZPx46NDxc613ggpZzbJ5aqKCu+7N05txpR2uAAb/L7a/6BPZsPFcVqGpZxpEmd
         T0/jSndht7NBtGXcQRDaAlXJQTEdU2zHfvazlZqhz03vVnbUW79U1YOxR1DR/gNUZjGF
         oiHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411616; x=1795016416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
        b=EUVIlquxammoSTN9iurX3iFNjZ9wQuiOwUEdWPlRwWkDWX7hi/f6JjeG2Y7i9JI1Ew
         EV418Eb2te9j2g9OKOB5NyTsETaciNBq24TUMcA/cSgN4RTLoPnPNmtlfbR6gpXucI0/
         LLIZbo4FCfTIe35Vpi9XX6oawD5fyAeigI1kGO6T+iLKmgRuTSa6VblTz3fIZ6Gv9rHm
         pVJ+il0AA5mMuKec2C2133edzkW4+/j6TP5iWkZQHzi1fUR5QZgSi5VhkPbBJoHi6d5P
         1BlTYBQaI/XMdcItwa3pDxmHNxl7QmHb4EbgZDhmIHV2cjzQnEVG26rTA8jMtNowhJHs
         el6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411616; x=1795016416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
        b=e65iGaYGdo+UazkimoCYTE7hs4klxUGy1qrcDpGHDow0orjNSKP0lqoI6Gk4t5rk4T
         9XG4C+NudvObWkBCZoS9OeCzUDQWzwohp2TxPSenoj9Qqa1x12xIgZMAt3djVkFJcEtx
         XXDIy0vEs6R7afQtrapUj60BvSsVNYDef+sz80BbLx5CK1Phxbt4dFc06JjVO5vaiiUw
         Jy0cow2e/7gxGXhflhi2af6hz5I1+xQPe0tcWooalpkvrjqJoHTRPK0LJ8X6/H2y8Qvu
         0IGaxT407PxRiis5ykBqDMM1snlekt42nR52/z3B30hWgFiCbgr0Ca88p3rFXx54kHtW
         sUEw==
X-Forwarded-Encrypted: i=1; AL+hErERstU6dwe0r1zAwYwn4N0300J43gwmXZDwZSXbfnKz1Bp+R341nPxjb25Sx2yFAFev/aHDwCtDjVEJgR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O8HUKiKqIjyxOFxrU1DDPySHsXQ07iR6WhCzEdLng8jzHT3uC
	jZLK2MkZKnI+KaqHCRkDFmDUeXXlLI52JLN/qdaKcq3Pdod/SYr5NLG8xVJDtMEkCarljeX/95Y
	d4tudc4/ANih2Woo/tZqdH0nWou8ODHA=
X-Gm-Gg: AYBFou3smNGQMANn3btHroP5qqlcQ/JX1WGSQ7eqxpOoJ2jqOSHuZzqXN6WvyLV5mkx
	nonTewv8aQKiBQAespRW+VNlmwh9Gn6HHB2juCTFQLJEW4j21DmSPxkqB8q9eC9X746RpUV/T7r
	VZ3j35U0/zlFemP+WrjvIkBXI+aWNbJhXxUNcWTJMIgUaI+DEYvbovm1mHs1erL03C3tFMqfw9g
	r72X7LbIWY1KFW4NAqbXHbLwq229f17qTDrrLO9nditiJT0ZwBrqE9B2YrO/4hGFth5ApOT0i9i
	aglr0bkvSOuFBKmQ3VPhp7/Su7dNSXeIe8Wz6GkIpIF/vUNxDICcKAEM5KuOXZfJV6LUIt/zz8c
	xQzTS7fsfEBv/KL2VnyLqPk+7FHSHL+nOBEkGBMfT7OYG/BuAiyxlwc04I3dmmQXglOsKLzxd2y
	Mcvc6KJMrOXfPMxMAu
X-Received: by 2002:a05:7300:8a19:b0:369:faa2:1fb2 with SMTP id
 5a478bee46e88-376854b7fbamr3110380eec.8.1794411615515; Wed, 11 Nov 2026
 07:40:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111041446.3072716-1-lcy8047@gmail.com> <avSD8X8aRtT--4iK@black.igk.intel.com>
In-Reply-To: <avSD8X8aRtT--4iK@black.igk.intel.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 11 Nov 2026 10:40:04 -0500
X-Gm-Features: AclHuK8YYwgVK0aL7BIkYdbexCHW2lBFLFnga8S1u2LfgEZ_-aTqTN5xvJ2oqzM
Message-ID: <CAKefsHtCtM-kUvw++2PN0tOoAuzHPYZ1YwSBX6jJ4KM1g3dHFQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: Check the alternate mode ID allocation
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From lcy8047@gmail.com Mon Sep 17 00:00:00 2001
From: Changyul Lee <lcy8047@gmail.com>
Subject: Re: [PATCH] usb: typec: Check the alternate mode ID allocation

On Wed, Nov 11, 2026 at 04:04:17PM +0100, Heikki Krogerus wrote:
> On Tue, Nov 10, 2026 at 11:14:46PM -0500, Changyul Lee wrote:
> > Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>
> CC stable...

I'll add the stable Cc tag and send a v2.

Thank you,
Changyul

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 10:04,=
 Heikki Krogerus
<heikki.krogerus@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Nov 10, 2026 at 11:14:46PM -0500, Changyul Lee wrote:
> > typec_register_altmode() stores the return value of altmode_id_get()
> > in an unsigned int without checking it. When ida_alloc() fails, the
> > error code becomes the ID, and the alternate mode is registered under
> > a name such as "port0-partner.4294967284". A second failure on the same
> > partner then fails with a duplicate name:
> >
> >   [    0.423055] sysfs: cannot create duplicate filename '/devices/plat=
form/altfail/typec/port0/port0-partner/port0-partner.4294967284'
> >
> > Return the error when the ID allocation fails.
> >
> > Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>
> CC stable...
>
> > ---
> > Found with a static analysis tool we are developing.
> >
> > Reproduced in QEMU (x86_64) with a test module that registers a port,
> > a partner and 63 partner alternate modes, and then two more with
> > failslab (task-filter) making ida_alloc() fail with -ENOMEM. Without
> > this patch, the first of the two is registered as
> > "port0-partner.4294967284" and the second fails with -EEXIST and the
> > error above. With it, both return -ENOMEM. Same result in three runs
> > each.
> >
> >  drivers/usb/typec/class.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 54c7810b563b..29fb13ca9f28 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -641,11 +641,14 @@ typec_register_altmode(struct device *parent,
> >                      const struct typec_altmode_desc *desc,
> >                      const struct device_type *type)
> >  {
> > -     unsigned int id =3D altmode_id_get(parent);
> > +     int id =3D altmode_id_get(parent);
> >       bool is_port =3D is_typec_port(parent);
> >       struct altmode *alt;
> >       int ret;
> >
> > +     if (id < 0)
> > +             return ERR_PTR(id);
> > +
> >       alt =3D kzalloc_obj(*alt);
> >       if (!alt) {
> >               altmode_id_remove(parent, id);
> >
> > base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> > --
> > 2.43.0
> >
>
> --
> heikki
