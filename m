Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794051665;
	b=ICKzYyLwkshmwBWdxSLB7gSWNhKmM19rpY8qbGw3f+byOeagJY5duG/umZYqfcLcwkxt
	 hJXKBa9abfyoaw0R+hkUX7nUGnB2VkVSAvJAelOpyw3S70EN+gUIgjk5gDAzpdRLPf9vO
	 zJwq33pshMFoeR+NO2RkAOp7GiTS+8xgubpyu53YjCLlZ33SLofRMYISslRoNYSk4DxO3
	 CeppNYUvEUOOO+5SOWbGZU0ZmGTyPbFsSQ1e6epMJfu0Aa5ctxGVXDTFqPwkjJxmyDn8j
	 HE6K7gGtpEXF0+/gUBFeofLQCkD8S4L3F3CUgerxjeON45gIeYq5l+EDcwtA+PSqKgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
	b=WLJNeP+Enb0aZUz9Neivp7qf7XRp6HBAQRlieC/91un5iXz03U69FxzuWdqBEcA1KrLZ
	 fLrMNf77o93FQEK2uVvQX/vJu2+5R3BlxmKEgfaDwXn2KFR9orkYLt0eKhXhkGrAKcfwA
	 vsMIDEfIYeCp4NdNuNSHvgnaCQYa3rIYCPf/LhoWCtenslJUo0rK93J1ekXyPRFjLfGr1
	 lkx/6MwhQY3FZ3hxYYWAIJBOKOBan6VaqljjWSTC5gTXwkXg5I9dJP0n3cXunOHGzZl8l
	 veh07QoQi5hDFtiIwgzQcvEhPZHX/D+rjFwalWe0UE10G9wwMnkX8oj9sf1x8mHq8Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Uv/MnhPY";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B3A606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B3A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uv/MnhPY
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b30cbfa628so16019047b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794051664; cv=none;
        d=google.com; s=arc-20260327;
        b=iwJ7Aobn5gzlYvjoZ41YWH5+CHwwWcN2V8tExGSmHE2c1Eol//5gkGUWc6R0weEE3F
         hUAl/sMmVY80kcla8YiNGUcqbey5e5CXi4jRBHmmSoUOOv8Xhe1x6uTACMLy1i/6pDOw
         kLX+ypbKVPSy+oWqplH65uPfk7QCJiCCziQ9FrORyiSaaEtrOyW9tUQ0HTtR77GSSexp
         wlQhRkZkDb3NzRG88rMoCKZnXznjL296UXwo/Jav1vkyIx6OVoNk62pr7F974HmPOXId
         6G/v5v1kwkzjaBUQvgh8QhFw9bdjIfBOiA8l27GTGWEddGXbJwiRtTYuc0mUfEMlnv8V
         ChKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        fh=SjCG+KQpZwLWe+L4fK6RDBu/3LO005kk9kqF0UaZsh8=;
        b=dnz6jB4tF0R+miVF3k9P7/lnWhX8jdAu8inqnADz7DiUuC5bHha/Jr9RFwbGDXiEKF
         QIlypTDmpTixWctrNmXewHXWVidOvNm1H83ukMJdNTQ5PsyHxuOK+Qhx/yy8Qt0tb7al
         l3QWdWT5cnj0QcpfQTYJBOo2yEc308M3NfuQWil1gbVM3Wk5qlEdodhRz0j0yozOIti0
         sgsSxftNLBcSG12gwIwsggCb/JG5kv2VlqQD40x33vB+/2j9aAwicy7siHKD/L7pl3Di
         sqjgVHNJG09tiMCgos1jOCScAdDdNdxgceTeuMK9NPCuVNunTfYo5VT0Xi+BJVhwnPs5
         Foig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794051664; x=1794656464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=Uv/MnhPYUlJ/ZX3RqlHb/a6i0gp4cIGYXj+kYDIio6V/YvCxjxJA1aNGJgeNRUxdZK
         B/NFrxW9NBs500iOBSmcRTVBEasxYtHEFcd1egHm20Ej7uyJJ0Rp80nGbvp1/+e7tMUh
         wC4e8gHwYM8o8Vt+rPhlrdBEvOkGrJMCV7IXeSzzC3VlhId/fBBldvUud2QPRdiinNFg
         3BXu0ujHM/Sv5SgFKJsM0tDit0cL0SbhnobaRGmwzHbAhwWAWD0tA+ZwfGoHuknR0K4D
         CUIcEppiZGj832l0z4Crge1NX60zE+2QUS9g+zF6snRUzL0NiCH5VfG62J/ktBwChjUT
         cD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794051664; x=1794656464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fTH6XXWW1XsqnJehduXCj5gyuC0EEdV5T9p2wxK7S4=;
        b=2FOvMyFRx++1FOI/gzKDVMoQFVHnFKnSP5TWOMSgcRQWw4LmGuH0CkMKvfrvsF9gUI
         hmYa6RdbTEOUtq/S5slc8xIKKpArU4Tryb/noQjsJtTEPVf8p6pZ4UzSNaoUzntUtuWO
         y529Fsv6Uo28lyXhr81yb0X7/8CPVlxHVXl3G9nOhCg4QlsiesFw92qCnbeXSBrCxikB
         4j5pRvQG0nEtPwe2w+6hXL6EqHwhknuzn6XaWUbzgJV6TwGmLa+6SBDp70g+5IRGof38
         hvSopnXpczfUeTm0lqFqSEceApWA5F+O1U+FV2lh4tShuf9TdMVjyrsdsN3MMp1XPwog
         z5dg==
X-Forwarded-Encrypted: i=1; AL+hErEXdzuqVE/O3b4p23qfY75AlqjW+euP1YJeP8y57Za53aIAUixGr02M13mhcoiZU/3zbsmKYQaSHjPO0eQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qPtMvUbThxRdfkmi/4zMDQK/1W0BtLVi7oI4Z+FHeEFMZ4UnQ
	/cGCXE3tEcAJCp0+Ijc5ssMxgqmRAlfyiPaiWXbcaVmCfn5vvppgvNHVpy3M1AN/9vikVi0Z1eX
	bZ0ad4AZ2OPLN0g1NanUyfUl6aTxBlfM=
X-Gm-Gg: AYBFou3gYm5IJXS3Xub1Hm76qfWuoDa0rY+mLvvZDp+2AJavbBv2YToeI+6epxL9RuJ
	9DfbcdpxMMl9J/ZU2uzudrfy0/AqIbMNw9QX3mCs6EQFf5WOyJV4hyDFpe8HQbK3L/yt733ip/D
	vSsvYyfESqTMR/UUAQI+POFb6mAPBdCfmsNhfOTdlTVimCX+bq/+lU9UnYp+FI6bFLNlk1Mghcl
	toq/klvr4mL2PMsPqp4ZL1Vr6gto/BTMdaoY3tk+JJE3fcke9DJSmPJhZ1pF8RA4ZjkwIILmX8s
	c2EnpVig7K8gZcq/pSPBTWfxtmRYnYYvAHvXJm09IP7vsMrXq85DDVAgsAVCBnnUNkJSdi25Qg0
	EIsNC584PnovkLpsGbXpWIW6VQigzkyGKXzC6UpmlcoYtN9zHOg7UdoOHIEa/5AfZ2hnvCtJz+7
	iMxPPfVwjj3HIgof+AH/ZaKAHF+fpsPnrhIm8H/3SpzdCVvBAq0XrgCdTdWOStxTxM1O3SW7x6A
	mM810IO7fiJT5GUuhKbeOpwWgG2StErTHkxwLXrOHodbVnkBzC6fE3eSKpjew==
X-Received: by 2002:a53:c056:0:20b0:677:c18f:7257 with SMTP id
 956f58d0204a3-67c141e4301mr2310364d50.23.1794051664343; Sat, 07 Nov 2026
 03:41:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof> <au4J-0GOUuueHLZe@rabbit>
In-Reply-To: <au4J-0GOUuueHLZe@rabbit>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 7 Nov 2026 13:40:28 +0200
X-Gm-Features: AclHuK9O7PUmgPlP4zevfIOy9d0EnpN6X7geLvTsMFUAaD8AWKettmZPb3yRw48
Message-ID: <CAHp75VedGBBd8qk5fO9-DkGwmuLQk77_igefAwTbrfcPCMW8Fg@mail.gmail.com>
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
To: Daniel Matyas <matyasdaniel006@gmail.com>
Cc: Nam Cao <namcao@linutronix.de>, dri-devel@lists.freedesktop.org, 
	linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:10=E2=80=AFPM Daniel Matyas <matyasdaniel006@gmail=
.com> wrote:
>
> On Thu, Nov 05, 2026 at 10:47:06PM +0100, Nam Cao wrote:
> > Daniel Matyas <matyasdaniel006@gmail.com> writes:
> > > Questions:
> > >  a) Is removing fb_ili9341 acceptable, pointing users of other ILI934=
1
> > >     modules to panel-mipi-dbi? The KD233 node would then have no driv=
er.
> > >  b) Or should KD233 panel support go into a DRM driver first? I don't=
 have
> > >     its init sequence or physical size, or the board...
> > >  c) Is removal of all of fbtft already planned?
> > >  d) Several other fbtft drivers have drm counterparts. Should I inspe=
ct those
> > >  to see if removal is needed?
> >
> > IIRC the main reason fbtft needs to stay is because it supports paralle=
l
> > interface which is missing in the DRM drivers.
> >
> > Nam
>
> Thank you for clarifying. However, the fb_ili9341 driver uses only the
> SPI interface.

Only two drivers use that macro, indeed:
drivers/staging/fbtft/fb_ili9341.c, line 136
drivers/staging/fbtft/fb_sh1106.c, line 173

> Is it alright then to move (or remove) those drivers that only use
> SPI interface and have DRM counterparts?

You can suggest removing it, but it might break some users (yes, I
understand that FBTFT is a staging driver), but doing such only for
two out of dozens drivers seems to me a bit inconsistent approach.

> Furthermore, would there be a need to enable parallel interface support
> in the DRM subsystem?

If you can do it, I will agree on retiring the FBTFT drivers that will
gain such a support. I can test 8347d (IIRC I have that panel at
hand).

--=20
With Best Regards,
Andy Shevchenko
