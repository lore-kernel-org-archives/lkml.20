Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794514585;
	b=t+Vpez+BRZOs4JMmY/75pHX1Jba/ovpKitKxDYL6GdjChZjg43oRGBXxIF+JfrmSKk3F
	 Vi3Czu/JzhiDR+acbXloF2ipxzZBdpm/urJvWVFOHttUovpfeIXw632J5BAZF5ZF3u600
	 FV5AUvvJGvwrIp5/F5U0m/N+jdResgCPrk9B9hybSkVwn7F0BAApvd8HppCgeVkytcLL1
	 eG6AJliAHre7ns4VnDIyER0hp6Gd2HcOx+tLCiqwzkqcxLg9dKhJ4OH2Bxm4doVOnEFiC
	 wVCIjWTNbxnW1iWrqPXavu/WMUf+rlEiUB9x+i/OXYHZ/Oa4cLPZ8ACFRBHPc+5lUww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VM8sXKaWHmPbV4KhLM5wB9a1VJzd8w4m87HBeipCc/0=;
	b=NOwOOXsgJZ+aFtK98KG5PC9yumQFa2kNzaQnp8DFyzmxOU1c+MDdBkgdI0ZPDs6GVvDm
	 LqMrfIrCUcDVLUG2I1iXBMcZHhBXgvVMtlHNwRc+LiOq+Ck20pzjviSfwY6XVMgc/BWig
	 yDwVpJg1zsvEFcFzMUWXBwWWTfh0XU/7wlHEJ7bPaJVtu5JUWnV26YGbzmF66MeV/9CuO
	 XMDMfNd8tnzISIasa4G3RbU5iuXcngVX+my1nVInuZUdWgG4M8Avqf6BefJTI/EZMgCL3
	 EbR124Z81KAZpm2HvgYneXr++E2JJcZOsq/MoMG1tGwPTWOTjdFqgG1pr8bM7U6CJeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFFpp0cj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D440F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D440F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zFFpp0cj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492f0a1b685so123400f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794514583; cv=none;
        d=google.com; s=arc-20260327;
        b=DSwnkwBMDxWbNNtZgVZWSLKGtpLg573TP8CRmyEBXhcXhx56HAGVPT09khWM27RHwP
         ZbUXxXNKT9KxA26uvSFg6MmKivGrZyDaMBUdxIMRXd7GqLAwH6MFrpdRCeOp6Tadbi3G
         JL6IazcalLWGNBI6U5aZDn/YfM8H24OGkqTv093pWEoFYuUq4niUjNgBsIND8AaYxN1Y
         aknuZHgLymexHhFscKxwU4p7Bf1/WgDeustHkEyuY/t23OdookgjzaamxgNnIy6R/YXV
         DXHg1DObsVZkYYQvvo+rbrespHzfO5wpP2UPUMBLgr7wVG+hvM9TgsKxWM9/nIsrZCqH
         7W5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VM8sXKaWHmPbV4KhLM5wB9a1VJzd8w4m87HBeipCc/0=;
        fh=lZdCoyWBtokvAuPwSJME8/gMHhIkEwS7XPPQ00p2zZw=;
        b=KYKOOIT6AWYk8UP3xNqU2uu0NarssYgZDlw8gI8p5mjYYTxInSA1oFmcbTsYCltIIn
         yTdfS2btab9SLHKe/TTdOhUMbZJ1kaVDdvbaGzE25ZQSwkX/TNinB5Ndl0Z9r9/K8lTd
         E9KbaY4dv3kUH2zKQJcQxDvodJu7pNq5al8+WhIkpY8+jBfVk/bnNch5owe8l9IEFYDE
         1A/OmFVecoe6g5yRumUaV8PFEzYTsme1v57w7+ImvGar18FZMs6QG9bJs11CungW3RJa
         omOMZ4eIl96B4CPtWFxVvPwoJ0ILNMLRoAU9Wwe1OQDBHwB5qhpNh3wLeFD/BJO7jq0W
         deUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794514583; x=1795119383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VM8sXKaWHmPbV4KhLM5wB9a1VJzd8w4m87HBeipCc/0=;
        b=zFFpp0cj/gUseSsTd176Qcq1WPZruZeEVBOY2pKah07OmRduKu5+B80BGhpCiO/KTf
         A5xgAgA1ZurXcSr6JAxU8pbpPonzVLzZVx/IUhdq14mU0vdE+5IgVBxSM89ybfy4/5KV
         x0rpzH9MPXqFDfHDe5Df12E8eaf7zP4vZwE7rG87kGxA7SSGoa75AsYvSjtF9lItO7x1
         jbQhEYu8/5SW53DXYa83rGjzNn+tZxx+xSH7IPsp1swvao75MmhaerEWVZ/xi8+Qze83
         dfAQp33cjKFUw4FjVj8qO9/43+DyISRcUR9lmgjMNd+zlvBuv2B4+fbW4g6NtdOY4yhV
         b/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794514583; x=1795119383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VM8sXKaWHmPbV4KhLM5wB9a1VJzd8w4m87HBeipCc/0=;
        b=0fz9jZkCeBQ9hIGFS5h9WJQIyk1//LMfjJzYVdJIoR/NZDmT1T0cRpCXUzUYQHMipb
         0ML6e41v5zQhpE+6ALvOqu+r2BeaJDVb3Cpc3W31T4juFB2svxh/2lVu0emFNyf1ONGC
         4nFEJ5nQWNGg6zo1+AN4w/hES+8XopE8yt3721T2+8SaXoBMIUPxmnWA+tVILXZauv44
         KpYTMgtAvSy+yDnDZ2Ex5SuAxky0jIAWa+xhgDHnAuaADftGbaQHsy1iJ6yUqnvr8yQG
         EGwf9fbANo+VZP5PzjyDYtcFsBdeAuzE7144PVguOrhb2BfD03Y5fcz2FP+5f+s+53da
         h6CA==
X-Forwarded-Encrypted: i=1; AL+hErHXnp4v3DIK6rn3xqMM1aJN/VHsqku9zP5RUmvt4tbP/dWAqXpm4dn93QWJ/M1uutag79iwCANQM5YdiTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rr3Vr5qzl3bZlJxC3VQyGcrP0EEySo0tVXhlFlXET5NooXUd2
	eY4L2UOodj86vpVaMElhGX+B6XvWkchyT+AmuydPhGByZH57VK1w1js7k6Bu6ZRtcwH52eGi/bL
	ApKf5+mGBDVOCaAVohWvGoMaYkQQphNQ=
X-Gm-Gg: AYBFou1YMcw/72ZD6uoCctEizM8MBS/0u5MAOY6Y3A+ssA6+/SdsCXoyQsY9cT5cZM6
	pTT563PYzMG8ML+5I5Jk5hpdGS2QKiDEZFCXTU9XzksdZ7M5NXCBGwgiS+fhiPZJ+ET+SPb1jR1
	uuNmZstEpjrcXKt8zoJvWeACu8cM/setLyHOOKYYq+W2Ul7pbitHrXlY9RIfzTP2KR+YsTPQ17f
	S540hrXsh5QVb7+9zSAFA27c+qJyxMWf5mHQjrIU8LeK97fMlPtBj/Up88Xz6p7RPJzua2Y0bMo
	LZ5KAADbDc36Kl5JUMwIZUO91pjRHR3AkTV8Q9Btp4q+sDuQhZ90EnTcWp/xh7+Mo0fGQHUU0yQ
	AXyy6eJG34yV6uRHpjqWQEcHGckKFvx3dFN4IdT4=
X-Received: by 2002:a05:6000:2888:b0:493:d5f0:4e68 with SMTP id
 ffacd0b85a97d-49c72307130mr1133640f8f.36.1794514582969; Thu, 12 Nov 2026
 12:16:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260927060000.518354-1-nikitash.mariiaw@gmail.com> <202611121039.836B308B1@keescook>
In-Reply-To: <202611121039.836B308B1@keescook>
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Date: Thu, 12 Nov 2026 12:16:11 -0800
X-Gm-Features: AclHuK-GVCQIHsehpFTEXM-0fJJGeLDSyoy-UU19uUMapl4TyOdz3_ihKvAnn6w
Message-ID: <CAPDEY+UbZ_VdJQR3n_nf2M4e5dVEQA5wVDTPbPE-T3ckP6H1OA@mail.gmail.com>
Subject: Re: [PATCH] comedi: comedi_bond: Refactor strlcat() to seq_buf in do_dev_config()
To: Kees Cook <kees@kernel.org>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	morbo@google.com, justinstitt@google.com, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, Nov 12, 2026 at 10:39=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Sat, Sep 26, 2026 at 11:00:00PM -0700, Mariia Nikitash wrote:
> > From: Bill Wendling <morbo@google.com>
> >
> > do_dev_config() builds a space-separated list of bonded devices in
> > devpriv->name by formatting each "minor:subdev " pair into a temporary
> > stack buffer with snprintf() and appending it with strlcat() in a loop.
> >
> > In preparation for removing the deprecated strlcat() API[1], use struct
> > seq_buf and seq_buf_printf() to format each entry directly into
> > devpriv->name. This avoids repeated rescanning of devpriv->name and
> > eliminates the temporary buffer.
> >
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Cc: codemender-patching+linux@google.com
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
> > ---
> >  drivers/comedi/drivers/comedi_bond.c | 18 ++++++++----------
> >  1 file changed, 8 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/comedi/drivers/comedi_bond.c b/drivers/comedi/driv=
ers/comedi_bond.c
> > index 8e10ecab4f0d..a10cfbd04c72 100644
> > --- a/drivers/comedi/drivers/comedi_bond.c
> > +++ b/drivers/comedi/drivers/comedi_bond.c
> > @@ -39,6 +39,7 @@
> >
> >  #include <linux/module.h>
> >  #include <linux/string.h>
> > +#include <linux/seq_buf.h>
> >  #include <linux/slab.h>
> >  #include <linux/comedi.h>
> >  #include <linux/comedi/comedilib.h>
> > @@ -170,10 +171,11 @@ static int do_dev_config(struct comedi_device *de=
v, struct comedi_devconfig *it)
> >  {
> >       struct comedi_bond_private *devpriv =3D dev->private;
> >       DECLARE_BITMAP(devs_opened, COMEDI_NUM_BOARD_MINORS);
> > +     struct seq_buf s;
> >       int i;
> >
> >       memset(&devs_opened, 0, sizeof(devs_opened));
> > -     devpriv->name[0] =3D 0;
> > +     seq_buf_init(&s, devpriv->name, sizeof(devpriv->name));
> >       /*
> >        * Loop through all comedi devices specified on the command-line,
> >        * building our device list.
> > @@ -250,15 +252,9 @@ static int do_dev_config(struct comedi_device *dev=
, struct comedi_devconfig *it)
> >                       }
> >                       devpriv->devs =3D devs;
> >                       devpriv->devs[devpriv->ndevs++] =3D bdev;
> > -                     {
> > -                             /* Append dev:subdev to devpriv->name */
> > -                             char buf[20];
> > -
> > -                             snprintf(buf, sizeof(buf), "%u:%u ",
> > -                                      bdev->minor, bdev->subdev);
> > -                             strlcat(devpriv->name, buf,
> > -                                     sizeof(devpriv->name));
> > -                     }
> > +
> > +                     /* Append dev:subdev to devpriv->name */
> > +                     seq_buf_printf(&s, "%u:%u ", bdev->minor, bdev->s=
ubdev);
> >               }
> >       }
> >
> > @@ -267,6 +263,8 @@ static int do_dev_config(struct comedi_device *dev,=
 struct comedi_devconfig *it)
> >               return -EINVAL;
> >       }
> >
> > +     seq_buf_str(&s);
>
> If this hasn't been applied yet, a v2 with the above changed to the
> now-available seq_buf_terminate() would be nice to have. Either way:
>
> Reviewed-by: Kees Cook <kees@kernel.org>


Thanks for the review! This patch has already been merged, but I'd be
happy to send a follow up patch with seq_buf_terminate() if you'd
like.

>
>
> > +
> >       return 0;
> >  }
> >
> > --
> > 2.43.0
> >
>
> --
> Kees Cook

Best,
Mariia
