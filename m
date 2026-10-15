Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E034C7522
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050900; cv=pass; b=iPn3VUVY+IHJyk+v1ehPwqQ1o2Nz1Il+leTI5wXM/ToMAFsheTtllTUvjjUSm1ZtHErs/LC5HEjTcEenxl7RhJRHNi6+CpP8acgpf7GX/f0TKMFaqqJvgVBPHf1RDD0wSPc/1Wpm/i78Mfr/Kw3BgyrdleD3Mqp/2lglC4M/HKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050900; c=relaxed/simple;
	bh=QUhjA9hwUmTXGUjT356rZPUadcbJKMeW3gD2q9pu7ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RB/GrXwAyuAczjs/fDbEtGCQ3tDwnMbfuqn4nd95hItvxh9ADZ9G2C8VFcAADFyN4pHAeGawpdfUCFf/JvBDbjtYN+ITDlykBl2WaU0Bp0EScW+d/+WLtuJ0QN6dCRVwcX5FvUOY56yz8IPgFNB90Zvyc6oQVFcnuFjTXdXSavQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OO/ApVEH; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO/ApVEH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so3059427a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050895; cv=none;
        d=google.com; s=arc-20260327;
        b=Hge44jUx9xeme+gmS3j37JZs9LP8Av3m1WiRv+rHGG5TBvSkbK9WQKqCMjG+eOVVIj
         /kVZbAYvOqOetP2N7204d0S1USscAp/2YtW0agXkNhoxFbmdx+FJ4/kX91x7DLM6ygZV
         qIL7dLJCjM127vtZ5WpNnO9Th8aBnAA0RFEEcvYOHO55fC+h4YyruBR5Y4SlEJofJ36Z
         G87to0uRzs/gnCkQYOB+WCptjxtbikUky+j3Q3esXH7O1t5iPDzdknbFE3E3tU/QRiRq
         xngmnDEXKTq7DWjnCa2BiAPzsckWkS1PwcSOzSGumqgJUZ5PgiZzKlxAqEPrTM3aSAa/
         LhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        fh=jzVAzLsyQUnllz2XxVoG3L9Ky5jg8KkpLO+VSsKze/8=;
        b=q6X0HGzxWnRQPdmn48oiXerbgffFeUuc5AhadXN8/78ZfG2t+asbGQUqy/Xgy0n8kY
         j2eiU26w7qUbDk37LPNKJXxkCLuXU2otabptmp/hoJyF8HvYwmJifLV8ujEdHKX+zxMF
         ZTwvPzO53Gil5AMagDLr4J3aVTXB6jCNKyL4c/BYqIwrpEfosdAlgQzvWl4bmYEe54S8
         tVOpzUHbj5n0j455/TlWgp7KWlwxEdtuZ/hzorJzCI57QDBWUxdUBcQKDIeyH4px4gEw
         X3MY2uY7CGfAPODYzGqDnd9VoCaIx9JifylGuybliA2HZJeBLX0c1NR8Jk4GhiDG30A6
         fdFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050895; x=1792655695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        b=OO/ApVEHdlMA+521QfgUyewuRF+kf2hjs0PRCNJq9e9UyMF+NZg4yE8noEbW0VQqiw
         heeCecfx2SAxsXGljKL8xJcsWHmovEBJ9XE1lJKaKjN6cHPseUAOFx+4YupAR+a+u91y
         9zcqeE4bNofPGI3CJ1aDfILvdWZINkT+V6a60FcuHlaY9ccgNRIV0HnG+0UNFD3bBCWq
         Ngp0MVzqCwUy01JBK5LJgypWF2pyVVInExRXgBvz/sc97GSwGS9xkfQkEyISSIJlfFRi
         XLLz5o4tuiTZmUD5qzvJAUh1OhV/VHAFuGaSZQ8croGvTQtjxplABAs3Roy/E1sdKDgn
         BUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050895; x=1792655695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGN7s60I9kDns7tf8RWcyBjmY1L2WRY6Qxl0o1md1A=;
        b=xmyowCbA/tK/Z4hqOEXfclepTXe/wcweQY/GqlgsW4+Jg30LdKX+RFw6dqEUtahbV7
         KIcUhjhzRAQebFvLFczVpntvT39tliVa8yjNVCNkwo4f3XTkhgqZ2+ZWLNHevcPoQsep
         25mxBfMj9a7bOCBItMA/6BJOuUZT6rJ/vElC8Lnagmsgmxpi6nTtdrbEUUstyZ76oXv2
         8Pqm/tN/Fo837TU/wtqwiJKi5NAgYLfGB1XcktsaAAhrCp57yuHmd8CkUDBwvyLyKRTu
         I+m8qJaEuafP9tjubkMlVxnuUzaOASJct1R+xOh6U52ImA+QmX4rail6LWoh3JjqRiuI
         XsFA==
X-Forwarded-Encrypted: i=1; AKwUvBzETkD9piiCnDL9jqbrr0gXQ0XQHWJesE7FdW9xw6M75YC/KzSw/zfRDK1JajviL7sjyo/IokER5kZt+TM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/NO+TV524H1q866M0uCBUmD2WsaVX3xzbCj0vYVULjSGZ7X4x
	eO/70xoHzfXJE5mNUOcUHZx/DD4sLDMr8XxAbjgj8nA9Kd8P9Ok5qfVlk/yLpW0ZBA+/qX8v1HX
	0GyL+aasMdBG+MKjuge1+ghfWrUG/PZs=
X-Gm-Gg: AYBFou1ol80Yfg8p4XC/wJDurY8WNdgEi4yREVHYB10ma9o8cv91lFjLpYsxL5T4kiC
	cqjDKPJA8qHhUqq6fZmgDVeFNEOGR+788DW95VvUir1f4xh69eAd/zefKtuEDBQ95aYHhlvIQAd
	hftIyeXSGBmMQYbspsw7YijT1OG+H1AczI8nTc+IgqdzLXH6Ro/lYdNCF/EkDjel413SOeF3lCx
	grGXGgCxF5Z1d5xND/MzN3/2TW3VU+nnVPGEpWQhvksaqP2UxanFKgVwMFRsS8EcTWfcse6C49d
	u31+EPsX7/4Kg1IlaTQKhmGhOwKCXhCRxx7CR7cBcIX6e4BimUO/ps0Z39idagLQ5Vg7hALc4VA
	k2YlHrjFLL43Q6FewGleYdV4=
X-Received: by 2002:a17:907:c60e:10b0:c32:110d:682f with SMTP id
 a640c23a62f3a-c32110d6952mr1085661366b.18.1792050895249; Thu, 15 Oct 2026
 00:54:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-3-clamor95@gmail.com>
 <d5f54636c25e0e60731adc200a63ceb5@gmail.com>
In-Reply-To: <d5f54636c25e0e60731adc200a63ceb5@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:54:40 +0300
X-Gm-Features: AclHuK8G-cs7nBf_jb7Nz-sYHdY2hV4DGcnygUqGWeotEdcljE4mZaNjbadyaBQ
Message-ID: <CAPVz0n2yR9C4Jan9=0=ck-RyKk1m19s3q4wfLCz9Bvw1TYNS0A@mail.gmail.com>
Subject: Re: [PATCH v11 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:3=
6 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 13, 2026 at 08:34:58PM +0300, Svyatoslav Ryhel wrote:
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/debugfs.h>
>
> Unused include (left over after debugfs support was dropped).
>

Noted

> > +/**
> > + * struct asus_ec_chip_info
> > + *
> > + * @name: prefix associated with the EC
> > + * @variant: id of programming model of EC
> > + * @mode: state of Factory Mode bit in EC control register
> > + * @read_size: size of block to read
> > + * @keyboard_mask: mask of keyboard packets
> > + */
> > +struct asus_ec_chip_info {
> > +     const char *name;
> > +     enum asusec_variant variant;
> > +     enum asusec_mode fmode;
> > +     u8 read_size;
> > +     u8 keyboard_mask;
> > +};
> > +
> > +/**
> > + * struct asus_ec_data
> > + *
> > + * @ec: public part shared with all cells (must be first)
> > + * @ecreq_lock: prevents simultaneous access to EC
> > + * @ecreq_gpio: EC request GPIO
> > + * @client: pointer to EC's i2c_client
> > + * @info: pointer to EC's version description
> > + * @ec_buf: buffer for EC read
> > + * @logging_disabled: flag disabling logging on reset events
> > + */
> > +struct asus_ec_data {
> > +     struct asusec_core ec;
> > +     struct mutex ecreq_lock;
> > +     struct gpio_desc *ecreq_gpio;
> > +     struct i2c_client *client;
> > +     const struct asus_ec_chip_info *info;
> > +     u8 ec_buf[ASUSEC_ENTRY_BUFSIZE];
> > +};
>
> scripts/kernel-doc warns on these two structs:
> - In struct asus_ec_chip_info, the kerneldoc says @mode while the field i=
s
>   named fmode.
> - In struct asus_ec_data, @logging_disabled no longer exists.
>

Noted

> > +int asus_dockram_access_ctl(struct i2c_client *client, u64 *out, u64 m=
ask,
> > +                         u64 xor)
> > +{
> > +     struct dockram_ec_data *ddata =3D i2c_get_clientdata(client);
> > +     u8 *buf =3D ddata->ctl_buf;
> ...
> > +static struct i2c_client *devm_asus_dockram_get(struct device *dev)
> > +{
> > +     struct i2c_client *parent =3D to_i2c_client(dev);
> > +     struct i2c_client *dockram;
> > +     struct dockram_ec_data *ddata;
> > +     int ret;
> > +
> > +     dockram =3D i2c_new_ancillary_device(parent, "dockram",
> > +                                        parent->addr + ASUSEC_DOCKRAM_=
OFFSET);
> > +     if (IS_ERR(dockram))
> > +             return dockram;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, asus_ec_release_dockram_dev=
,
> > +                                    dockram);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     ddata =3D devm_kzalloc(&dockram->dev, sizeof(*ddata), GFP_KERNEL)=
;
> > +     if (!ddata)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     i2c_set_clientdata(dockram, ddata);
> > +     mutex_init(&ddata->ctl_lock);
> > +
> > +     return dockram;
> > +}
>
> Attaching ddata to &dockram->dev via devm_kzalloc() and
> i2c_set_clientdata() is fragile because dockram is bound to the I2C dummy
> driver. If the dummy driver is unbound from dockram via sysfs, the driver
> core frees &dockram->dev devres allocations and clears dockram's
> driver_data to NULL, so the next call to asus_dockram_access_ctl() will
> dereference NULL.
>
> Instead of allocating a separate struct dockram_ec_data on the ancillary
> i2c_client, could ctl_lock and ctl_buf live in struct asus_ec_data (or
> struct asusec_core) and have asus_dockram_access_ctl() take struct
> asusec_core *ec?
>
> Thanks.
>

I did this since dockram and ec can be accessed and work
independently, hence separate locks and buffers. I would like this to
remain as it is, but you have a point here. Adding check if dockram
client is not NULL should resolve possible issues with
asus_dockram_access_ctl calls.

> --
> Dmitry
