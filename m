Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793938114;
	b=UC8lFBXR0A8ksIurLV3xe2qG3hqT5r2akRgS1xNQyJB7JPQHdX1AuXtLWUUNBlrpbb2g
	 fYymysvhNyZtaIV9BYONXI2oHqf1i5KCJfg/n/P3TZxBC4+/6Iib9VLhZvt1/pfkz/rjf
	 fY6Yl+r/3jc5Q+yWJ5DF7HbrQmmMERvjs2EUQZsJzsPSN3kb4GZRYewcfFarvXx2X02WC
	 cJM22voCFogZ8M0YPFuCYIat2rEKWDyMPLOXmRFCk7mb2InQJjqwCFdOV0X1S4YZ1V+52
	 wvL7xJHgDu1Xz2IDGyX1j8WXCLphuRO0hgIwaaZ4lZcUo31lFbNclRTCsnghifCWQPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
	b=t94/aL1IO1mGd5vOQ4a6a5Tq5uJFkk0529juM5iuctHBy8JpbLkoMBe8k6VXbY9AIMYJ
	 Mah8PF9DUDzRTuec+yREAqkh1Eq+yXyNxmvQOUveExW7MMCzE3mO65wb+9zdkwaT8fHdz
	 6Py9IX2r6HQh+3eUpmW8EMup9oOFl7pXwxHskT6BAPjUUQQOh2NXBxMw5rTxjzGKXaNX5
	 +7wAiCjc0am+NsZ1vlzaQZCUhBD076ijLLpybNR+ZU9ZHs7ean/rCq6OLlbI6xQUtabTM
	 5Txd4dcu/Z3UREo5OCZ2gJo5wkmZMkU4GIxV1l7vXK4M0vac5pIy1ZL1y48It0dLGdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaCL5TeV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC22606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC22606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaCL5TeV
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4a822463a22so82121fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:08:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793938113; cv=none;
        d=google.com; s=arc-20260327;
        b=hvDn1TWb6ulG2bHelfnH/Ezk5gCaaL/Ig1M0q8fFcJt7dw/YhB/fmqsp0XQ+N5m6Z9
         rIdxybKc0jX3HlaBk56zLPVeStN5Jyxe+i5oPqt6W7U+7Ww/QpT06BkEhuZaEju1dvH3
         iEbNHWM2HiHMmcTrBX7noVJRCXrjDn+qIG5yYIg+a72nnndTFuhSA+o0hQdG+3XlZSfC
         Ip6xKQoHU/g6l0i8758Wo7bR0wWeHfOBru3tyM1CZ58NEWSHE36TLbnpafacjrLZl42N
         xuu3nmOuPZf/6TRJtprOw+2v4BStirTLn8G6caaJ9A1t33b4SuNyLSbn+j41CrI8+oc7
         su/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
        fh=htGWhYpWFiA5OT7qGHFpwCpyUcUoKLL2nZoPCZsp7T0=;
        b=G6NOAeEDe64PMvXAIaoL9FvBw2cIN843VThXeH0gjmiUel7nMZTLQLP/K3tkd+CP1H
         Om6IkcvC43Ml3EHGex02DvYBq+BaUG1Bg7Wc+YR7jx+6t6RSGZR5sSbz8+sfkg83REuh
         KpzE/XZtYmh22O+4geBediNpBePodZ6wHJSKZMCnsydmjSPHQCYr3n+oLkgr3A+W4IPx
         JIrVTaI3h+KOJ9EyaI4uQjsOBeyOUtlZ9rLjdWCAQM+qNki0HL78ayq/YoLmGXp7Q0sG
         qEcEFUoBQF0Oxr0+MXgg4oGhts+vE9/0PEgAegI0OZ+3tuaOaoO628BC2N3ouJMuB+v2
         KjzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793938113; x=1794542913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
        b=AaCL5TeVWhCmOWRruX6RQ6uYlbxEmgGW0Fu1FL4Te6OGDFc2+E0dbhTmVykihBcvXc
         qW10F+az4GWUxFwfiqI+9lc4XYVEIwEDIhY4R4GQl+Wt06dOdwqAqbrKFKjIbCSDCFWz
         pYZpH++iT7LvufaCGF9Z1/BAjBZFjjaztq2+Y1vL3wkwrdDuXfW3sQ57A/rzTShVijSe
         ZAoS0eFzO5FsQdT+jdv+jDpQRsSMcmGkQc4UTpwS5svzqAROo8Kpf1MKedp0lW+tMIuY
         bss/LwjkCpG+lqsPeXxivKA3ZOlWwv4t1kExE7+N5n/+/dIHDNJf7GsRmJOWy7EVuft0
         8hTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793938113; x=1794542913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pk3SmESaznUmyk4iOi3We1OgCG1jt/asSQB3At8gf0=;
        b=OZRPeG8qzhHrvaG04aIcaAIKjam13IaEkDlQjyk8lhc0bJcvHfj6y2Oe7LA1ybJLbV
         TzHEdHgirx3yRNhBVWQAVUpGf9O9RKBAQJRHngJ0gsBSKbJRJSiQaETGJqO4xfUQTmbi
         Z/Qtc3cMqqUJWHkHPk9v3o53AWwfMk9lQiMGaG8teVxNAk4I4n3samljyFuN+T+jkulJ
         hdFlJ3EkqfUbXN+EacKNHNPlSIE35iVks8fzPd9vw241y2TCtzbfd7ReNyewUWvwOdBG
         WAB0kSkoZR2z7te9JDzI+xnlwJZv0pZzgUKQ812wt7yQ3s1XlQx3DMIlULqrZPvivo1A
         rQyg==
X-Forwarded-Encrypted: i=1; AKwUvBx/4Y2xagrKS4ZlnpKqE3nXMsvm1Qj/L5O2C0cPQ198ebwFkNcYAcVxqW1pBv0HSfQXc6cm0w6tpugc7xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zVGxSAfGuv0cAtkSa7y+RHwb4m3Gf/bts0ALWx3h4anXBj06t
	yyJC5Yt8CeiwK2sUnbwVTMz8s6F8kZKVnq2o1YAmGiXc0+RPp2VDlNw1QKkuEE3atw4cSeYB4oy
	xIOmD/ri8nbTsr3f86xGGwKCRI8y+0d4=
X-Gm-Gg: AYBFou223SAx2V+Hd6gkTjTiGMRGl+VNpg0n97sHLxGgnLQqQCn7avgYLRhE4tkY8Rh
	GSDgXSSwOwTCEsLpOwCDCJvWU2URc3vjBtqILEZFsSvkEOROtP0UT2VnfThatTYJJTAqZQoG/XS
	wC9j9xuRWhzkuYK29DICQaqlT+nYcAjg+3fJdPukwTME8z+vUasqc/1vQocRPaBldOt5Oq8Hh1t
	+wYmVQMYrkTg9a9t3WrJ1rj3KIBjn0Cv7WNdi9nkFvEMSnULqPkbedoYoeAN63CQ/qVTSA0ifof
	cfEMfGkT0jVPeVkWCVpBqBeJ5RohDoXHhlPgbNEGCcT3zm9r+6XIqEcZkUJwHnRLczxVlHzhgrx
	I5c1HmqbbEc5IQeyhzfbYolvFmr8DTzZGyMJUuzEKGlgDHh5HsNdzRD9NKT7KlX+vZrYvjBE4
X-Received: by 2002:a05:6808:190a:b0:53a:6769:c35b with SMTP id
 5614622812f47-567e14c6645mr1033843b6e.12.1793938112995; Thu, 05 Nov 2026
 20:08:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
 <ausVkYs1-3rJ5Fj0@devuan> <20261105113229.4126d872@pumpkin>
In-Reply-To: <20261105113229.4126d872@pumpkin>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Thu, 5 Nov 2026 20:08:20 -0800
X-Gm-Features: AclHuK9Esb9F2uyydCP0odZv_dxt9WsR5I2SP--qP46odrTEOGmh5Cneq9YrqqY
Message-ID: <CAPDEY+WvnrFgriCyvL6tjY2GiBJ+Dsz0Tz4hJz=n1xW_fywTEQ@mail.gmail.com>
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in sms_ir_init()
To: David Laight <david.laight.linux@gmail.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, 
	morbo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:32=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 4 Nov 2026 12:25:17 +0100
> Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:
>
> > Hi Mariia,
> >
> > > Date: 2026-11-04 01:02:39-0800
> > > From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> > >
> > > In preparation for removing the deprecated strlcat() API[1],
> > > replace the strscpy() and strlcat() calls with a single snprintf()
> > > call to construct the IR device path.
> > >
> > > Both the source and destination buffers have the same capacity,
> >
> > The line above seems irrelevant, and potentially confusing.
> > The size of the input is not important, because since we're appending
> > stuff after it, truncation may actually happen.
>
> And gcc's stupid format overflow check is going to complain.

Thanks for pointing this out! I initially tested with Clang, but
reproduced the warning with GCC. I've switched to seq_buf for v3.

>
> David
>

Best,
Mariia

> >
> > > and the return values are unused. This preserves the resulting
> > > string, including truncation behavior.
> > >
> > > Link: https://github.com/KSPP/linux/issues/370 [1]
> > > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> >
> > Except for the small comment above,
> >
> > Reviewed-by: Alejandro Colomar <alx@kernel.org>
> >
> >
> > Cheers,
> > Alex
> >
> > > ---
> > >  drivers/media/common/siano/smsir.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/commo=
n/siano/smsir.c
> > > index 283770d583d5..636ff228108b 100644
> > > --- a/drivers/media/common/siano/smsir.c
> > > +++ b/drivers/media/common/siano/smsir.c
> > > @@ -55,8 +55,8 @@ int sms_ir_init(struct smscore_device_t *coredev)
> > >     snprintf(coredev->ir.name, sizeof(coredev->ir.name),
> > >              "SMS IR (%s)", sms_get_board(board_id)->name);
> > >
> > > -   strscpy(coredev->ir.phys, coredev->devpath, sizeof(coredev->ir.ph=
ys));
> > > -   strlcat(coredev->ir.phys, "/ir0", sizeof(coredev->ir.phys));
> > > +   snprintf(coredev->ir.phys, sizeof(coredev->ir.phys),
> > > +            "%s/ir0", coredev->devpath);
> > >
> > >     dev->device_name =3D coredev->ir.name;
> > >     dev->input_phys =3D coredev->ir.phys;
> > > --
> > > 2.43.0
> > >
> > >
> >
>
