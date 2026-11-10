Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307951;
	b=diFoxH3qff9Vgmblykk6Ci3g9nSnQtLpfePCIQ+LJCXxZVaO7ffPC1eYK+eEh9Yed5Y9
	 vVUDmM6//ZMTEBfQTazU7Zs/JSypaUUJvNxr4V8XtLsfqW9cx3RrXuQ8KJHbDqCHaHLQ9
	 ggCJ5xubOx7Ypb2Ai38XR+MVuk8usSUeIFPc3V6QvSTqdZ6yWKqSq/BTpAnrHGh4O++y6
	 y34AQBtCPcqDwHYehXSqMQKDcV2w6HHNsTDe3jvFum/pgwGVBgj7MifZJJaa3aOd8kKeo
	 DIctP4oWpIULWuCyCkcq/IPo6MlOq8gd7fxjDXggDkbs6B+jobSM4wmOUo40c1XdXYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
	b=4Gt4SxLPDOZGoM5Hpy2hnNE+SIMlpflFaU+sXf9z8ubYjyYHrSzkaUhvv7kAD4M7t8TN
	 BclLrjHkQKLnVpCj3kaC6OCijmuIb815Ydprw34vwHBmRtRmbuISqv5LP7yoAQPkDcBZm
	 PkDTHrGPHFtG9A+fgQ3Bin19h1OIXXKIaiU7aivx6Mtc23CbxGrJ3xeWGZMICAgO7JeNu
	 OdXqeO0lxvvEaVK6FF/1wJs0ZZkdZPpYYswcCxrhu500FkSnGY00RthwKRh7MWIxPWv/P
	 pxAWVOjz3DxzgCSVKO9p+JCaKQVGME1pnkKYmV+kL0mu3N/aFVV7xBWh7BNBHvrH3KA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2yKUg4k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7AA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2yKUg4k
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b308fca7c3so17389047b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794307950; cv=none;
        d=google.com; s=arc-20260327;
        b=C9VZ1Y2h5b/ZjO4+yFAu5GhLaVZkr3iab/u+97r01+goPfq32HRuoL87WKxDSw9D+v
         07mW2fHJwJTnRZZSsTdikVRcAebOmuG3qK1IzsTVwsk0jnpAoqqufiGaq2lAm3Pd0Kco
         ApUPbA7FuSs/WsZMADG5YdALSJruOsnmMTjxqR4Y/ukQaGmfrnMDhPVvKoUESKU72F0m
         y+BpXO1ptsH30dsXok9+ab59P6MT+OSmbrpPUTSaiO+EaAaEbQ5B4m6uRmDiYgCXzjox
         6f+VHjIDTHuR/TbWAlYGqN7RW2FpY52WdqlEubmH0blo2aiixeGuEoFw7OC/C1W9nFSG
         1O2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        fh=FZlp5aibJEOQ2XMEtAVH0qLcC/euXzk6ka9XyJzYdtw=;
        b=SW71P8s7aYG5PRSjk42qMGZuLHiLueAJifMsAt4nuykY5kD54DXoyg102dEaUOuatd
         QH3c8TmlBnj0zfuq8+whvxQ2ZD9SWxXO1JO3SF+jFoxkrlpzp8jIVf/g3YFefQkoFU3n
         y1Zy46byKkFNScttklctX/NTzQsp8cD1/QtjBBanTeEk1zNR0Ngn8YnSuRDruIT14Gzy
         N84ZXdqU2q8cOmoHxanqp9FLtAAqenYFezlsDP0/YQM1zn2/KqGQljTR76eNid4cBdLF
         odGb9NGg+cYEwucKt8bAPPok8lpI2HFsdU3gh3EY5I5mRTHkMqqW2lqDbtrCPF821vuR
         DAwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307950; x=1794912750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=G2yKUg4kkkNyrAQLdA+svzeZn6bsiQXP/vEdrNCmE3xn8ePwe7ypVchrXLzPlmsfmW
         lzJ/znIv2TTl48zXBASM/vBEzAZQnZV3IFI5K7mcP1Sn/aQJmC0Q+3u8jnETQdK+OdKT
         UMrinFt0wmlR5B7U/Wi6+upm+BxqtF+PZgq6G7oUC/R/Rve1Wc3Qgg9fKoBY1jL0KR5y
         wgYtSJTLX2BHOwgJdKHSOoj+wx6LNeG9PNM34mQWbkp45RbZKXP4v4JWPrUO0bsZObJ2
         PjKKSQAC6V527ZMIejd5C4uGw2iRY5wETwfo5byFtMVf+095etPOYZnI4Z26jWNMjqMB
         xylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307950; x=1794912750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=DzrnqyVJJIx0e0PXVwjPBUJGIaWPvOX7wqKIAaG4Nm5uNkEYi8j8gwWuaiF38V1fLj
         zjaAsRUtdXy8ss4Fu/cmZ+2dlPdXuudpjxVYbWQBycDRE5cZHu+WamM9vL0zi+Gytvay
         4HnkZWBSPuMzyVDIRLscntr4Zs2jR/flMmW2tHeDP6JFjsSUWd8EcDY9f5vPtZLBJTed
         awRmVyMPvnlnCAmafLcKDhqsc0uPHReGG8wuZKUfGN7vn66bLUml9QgnbzTIwjnsepWa
         VzGn7op/Ezx9ZIH4VVQcUyclZUgWhCpeFFzz6PBT/SMlmppCkSfvzEPnchens4mEEEDT
         EEzQ==
X-Forwarded-Encrypted: i=1; AL+hErH9DWFF+JvXB3mwxiOWZx0bVjKDewEYhGPqh9od3s3dsboniMvlzI7n4s7leCR51IJx92nJ7MEbmi8jAXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bs9gJrIaqb9blPzCH+D+w3fh2Xi3huAky0lb454KQoTUk1wvp
	q1S7hNKBvL4fJKmeEcZX0qXs5hX7719FV19oW4dI4k+cps8JP6I+8UC41Z1ycvEcVOkjM4jcbQr
	a8BbeAhVVZpT2BQLcZ93f0rWX7RI022E=
X-Gm-Gg: AYBFou0Bd91lHEGDt1NUux8CpksDdZBaCtNinV2hZLR+6/4+KTY5V4R6KHpfLjbyUOK
	/f6ZCFJmk3mt2JmYxVWOSdw5OZiDAi9vdLwFezEjq4wRaUzRjTP/7uAdCMA0KzJhvGCqATSALKS
	EWKlz7/SmUopjEa/lcTYVMLnbMhZvdlNFdeGIOwfgC/bj6dPEjDzb3Rjy1nMHBkj+xgWcXeTidc
	U3sm0yIjLXmY9nY2ARsvoR3NJzDMn1zWlkUBL+pQHsf9/lPB+WDLlE1H1jQ+EFbfWsKQtejSmCr
	+jD4D2z2+78h9t2Ds9OHtvH0Drl4Ku4keRKm0bnx8Le80oDEBeQ177lAc6zoj3XfEHqydzq1HeU
	RDHl9OGNcC/V0arGDR9oGoTvvkioTcHF5HVK+XqkNzePyt5qnJHAAZep/4MHsxr23UsOak8E/Np
	BColAk4vPuUQHLmEozHzBFvGpBBfoBHKyUNkPjhnaLWmAIAZBX1IVU6HGlL/Yaq5xbp/dGqjerm
	vL8m60kB1iG6KtYUViQLrZb6VTJMFtkU0WIrMSvj7JymHNTjGLRuXgDPutFvg==
X-Received: by 2002:a05:690c:4804:b0:8b3:4022:d81b with SMTP id
 00721157ae682-8b39281e93amr14763687b3.4.1794307950215; Tue, 10 Nov 2026
 02:52:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local> <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
 <avICwdxyi-W1Y3PD@ashevche-desk.local> <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
 <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com> <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
In-Reply-To: <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 12:51:53 +0200
X-Gm-Features: AclHuK_OONOCVTyFsjjRyXe2igkmpzvumbiGAvSGjLyAIyl_gOSbE4gZk1U_Cc4
Message-ID: <CAHp75VdZpqt8PzVypQ85U1OjxszXOmCP9MKv3ozQOh-UVFnR-w@mail.gmail.com>
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, Nov 10, 2026 at 11:12:02AM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > > On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski w=
rote:

...

> > > PS: is there a way of using match_string() with non-const data?
> >
> > Why? It's an input parameter, it returns an index. Whatever you
> > provide will be not modified.


> What I mean is that the following change

> +               ret =3D match_string(merged, n1, sec_props.array[i]);
> +               if (ret >=3D n1) {
>                         merged[count++] =3D sec_props.array[i];
>                         sec_props.array[i] =3D NULL;
>                 }
>
> Results in:

> drivers/base/property.c: In function =E2=80=98fwnode_property_get_names=
=E2=80=99:
> drivers/base/property.c:607:36: error: passing argument 1 of =E2=80=98mat=
ch_string=E2=80=99 from incompatible pointer type [-Wincompatible-pointer-t=
ypes]

> And I don't see a good way of working around it without doing:
>
>         match_string((const char *const)merged, n1, sec_props.array[i]));
>
> which is ugly.

Ah, got it! But why is the "merges" char ** and not char * const *? I
believe that will fix the issue.

--=20
With Best Regards,
Andy Shevchenko
