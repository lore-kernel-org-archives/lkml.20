Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794059680;
	b=TQFwrKgMgL4RmyKOn2O0SOt273bezK3D33e8RG32Tzn0oFPwp02gmU7KTCsL//XFO1VN
	 11IhVbHhKyuhhsUa5zySHB13z60gtyaG3VgR2N/ndwLPoEeXG6aRuD2VVDcyqBiUkpNst
	 OQVMiyD6xaU/LiTf947YIK6SslF1F+Yg2nXIgXnCYo7dmbpVQINv2BnsSs76KWAODd9Bi
	 wCzjeCSBtoWwK6I5+nxDW9myBkrRjGIIyCzb5FKe7JiugEeCmNb9qE5T3J8jyQ598J9GJ
	 q2G0LQjuFaub5wu2j6VTJvDTHBOm5iWkjLn2OBduhJ3/9TEIEaBO+OoIfXOB0jc9HQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
	b=Iz3h5Wt8hd1oEX3T8445+ZZeLR8JPiS6ogdjbewWv55rmirhOPYbJqKTfhLqnxfGYyfU
	 6YG+i7xnxUxwrSnao9SlfGPRtiblhtAvGUYYaKrwHM+4FYT7hTiz9x/vEeu4mZ4IcDuF2
	 EMvj+7++avQa7BOvskTBd2qLnqkNmthxBWL/dbc3XM9G06QXMxn9cw3qToV/0AtEDs9Oo
	 +Am1Hyz35i0VMNgUnS8TGAC0gQ5IxLnBnffz1PSgW14mRc95WmLeX4dKGeeDB1Vc7vIjm
	 eOTLI0mChwdPN1jEr6e45rdbL7YLJwaftb13r8zebDacF+dvut8Pxb7V9IBqGi7zBgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycSfE5T9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C368606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C368606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycSfE5T9
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so2134804eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794059679; cv=none;
        d=google.com; s=arc-20260327;
        b=DdOFyy4Oetebj7fQfUs63oSX2+9W/31wo1mFrTaiLKbp2cs2MV4BfJYwYhJFZew9ai
         yZVW7Wjb/1HlHD+FfOp5Zr+mK5OvxiCRQ00wyFVJXaJYPYm9d3SeZ36Bq+wC7k6h5G+y
         Sn6juek0tVDK+av1B3AATzvMCYutMWtI6l4Dz+cnn438fG/nt57QE4iRjM+LrqoRQwUq
         Kx0dsXlurfrq7dtvk/EPRdIfSOLRfyncEiG4f57FEoYLxBTsSri9k4SdDcuAO4yxcahv
         h9endNrLCRxUWXftGOxyOy7tCckguULbDDqwv/K7p1skfRrgSssNimBpXjrxQYxK5Eb5
         T1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        fh=6JvVW7hjTExtd0bnvDdLJoPcL8+N1FBJxmIuqWA5t58=;
        b=RYTXhGUI+zhIVG6LboA/qOOjDztMOhFWmYfu6X2Jj0rikeq+/D2Iu6x/fO+rm2+8h9
         ljBjxE72N1nv++AV2VjiuA5tddS6zVf5kdWOp3rMAV3+b4UNIMatIWNzoRfRYk/s7+W+
         zLKPsH83opv8d0IdrOr5hN6E5Uoe6f77I2Drlm9aAmj0NtWPDg6iojm0JI7GZphMUwO3
         xzjc4+zn9yV8b5t69bulzJHPG9J3BGPaRvNYKYdooqxPzaVTJl8q6ukgJHOVCIQXVqXU
         PT3HKbGL3uQPcmbS/rlJkM7Cr7fTdBtvH/Rk90QuFAYiL3Fr0+NYWVMoNj1Ei7qv3FpM
         tacQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059679; x=1794664479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        b=ycSfE5T9N+tV8tdFDOw77jY11VyiDapgPTfbsh1Vj9BIFylqw+j3WWpeaDXIp/MKz0
         dSZL89QRvQh3oayMXqCttEIOdfeFaU4nC1pEFv9sczOxY1iYGhJdhaXNGKvufX03WVqo
         C9VU64ue/ENINEQetea26uNmPsnBde6xxxWehhkTWpYhqCCgKwEcl+f0BJoIXTyErynl
         xuwuSSYZncUPh3UUXDsebLk9cvhy90ouFYs7/uiUpM/xP8bwrb8yu7EnZhT6Jd6LmtqG
         QZMUXLuU5NIxB/Wo7P/+ZabZy0j/CZP9BQ/p8srjtGpmDyUFMetzG8bQ2fq+mZZX6w19
         2q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059679; x=1794664479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8JE1SvDX09qdFmWuC9l/vzgGLFtTsZ/4jIxUqIKUw=;
        b=LFs7Q/4gutEsAFy5pXunrGYSys8iCgO5s89ktO1y/27BbRrmS4qcg954TzXP8l2mkv
         JDDQB/PnvzrGwaFOJRwCZu90mf+GQDNHR1DWBZSIjmOJFp+NttlHpJpZCRzfaQ50DNkC
         H/WGLsE0lrfTxz3wQlpHhnZb90Tei/Qv9k7lwDdPpbx/7FwU2dszbczGKFXGNnNH6iRh
         WWaw16J3+uuv9B0tE3m5YdvHQ1Bfemi7+yqhyPLOahD9IpDBbfFDEgr0kgAVcO16r2D6
         9DTRtyNazBY6TSg5exOR/gGumpak9812/8qh4Dlc33io7kWNuOs3M/9AgmsU9woVNEjg
         d2og==
X-Forwarded-Encrypted: i=1; AL+hErFAph9OaCkRGUFsC6+uXIRBW0pxAvgBFolT87c0yo+yKvJnxQnxPtyc4C/fW8AD3a0cioVbcP4WxF86Y1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bd5QmmFA4DXeI0T6iVJP+LTkHZbPrFGJGZ5kWMKYqaE2boe8N
	AkmZfka+O/db7779kuFvYYEQGWmBrq9M4uMk5gF9XNeYyTQo2VJs8VuVmpV3TIb0JUNkM/piAYM
	JcolN6oFxN8pgrwc/c5z/KkmL5lx7pHE=
X-Gm-Gg: AYBFou2TIxVA8SvPLABtgXyKzC4tVVsErsfFZt+7fE4MEnXA/btEDGHM2UkW5YSojbF
	XWvSE+PefJqEGrE1HIv8vo0oUIwCcY3USqfWMqbgOdm6h1Rpz+LRr9RjcHMMJSrosV9hL3CXodZ
	tGSjdAggdYsUQc1JH3z2MEmRAt/P0ZXfOVhQgt4rDHM+pDE1HySGZz3HHYSeG+zozuNHSDQmnry
	LVViVSx+uQuPuMvAEnyVJzPkNnOqPSswXHOW9onDZ4PWgxkhPNuD2PHgGk2EdKaU+7Wu4R2yZ1f
	X+P3ZrhMD/2pECgpHxjfk9HCu49A+4ycMxw12cVFZH4N3TFfeYpHxn0h055pvompHMDwn2ByMbO
	Sula/umeTd/5JSUTuZQ9DSrXMBTGtk6T0AiTVDfNB5mdRLZ66gd+3Nts1Z5/WZPKNFYaRFhaUBk
	7AeudIxyuUvfuez7vvmG/1RDcwkTiz/Q==
X-Received: by 2002:a05:7300:ed13:b0:370:121a:b2f with SMTP id
 5a478bee46e88-370121a13b0mr8606853eec.11.1794059679071; Sat, 07 Nov 2026
 05:54:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-2-clamor95@gmail.com>
 <au3NWsXz-hg2LNr_@orome> <CAPVz0n3_oRz8aMr1W=8K7dnHhM=vuGpHjpq6+=80oXiFj5wfSg@mail.gmail.com>
 <au3telUE9A43PDWv@orome>
In-Reply-To: <au3telUE9A43PDWv@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Nov 2026 15:54:27 +0200
X-Gm-Features: AclHuK8lORI9v0DJ7PzJIhwANBCoAngQBMqPQ00GdlIqFV0vGLKb_MHLVYVyoL8
Message-ID: <CAPVz0n0z36TnRJ87itGALHLUvNQJ7+NoOAKdhU=PyKpJhB8WFg@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm: Add MIPI DBI bus support for MIPI DBI Type
 A and B
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:19=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 03:59:05PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
5:14 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:01PM +0200, Svyatoslav Ryhel wrote:
> > > [...]
> > > > diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/d=
rm_mipi_dbi_bus.c
> > > [...]
> > > > +/**
> > > > + * devm_mipi_dbi_device_register() - create a managed MIPI DBI dev=
ice
> > > > + * @dev: device to tie the MIPI-DBI device lifetime to
> > > > + * @host: DBI host to which this device is connected
> > > > + * @np: device tree node associated with the panel MIPI DBI device
> > > > + *
> > > > + * This function is called by DBI host driver to create panel devi=
ce.
> > > > + * It automatically calls mipi_dbi_device_unregister() when @dev i=
s
> > > > + * unbound. It does not automatically free passed device node poin=
ter,
> > > > + * it must be put manually.
> > > > + *
> > > > + * Returns:
> > > > + * A pointer to the newly created MIPI DBI device, or, a pointer e=
ncoded
> > > > + * with an error.
> > > > + */
> > > > +struct mipi_dbi_device *
> > > > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_=
host *host,
> > > > +                           struct device_node *np)
> > > > +{
> > > > +     struct mipi_dbi_device *dbidev;
> > > > +     int ret;
> > > > +
> > > > +     if (!host || !host->dev || !host->dbi || !host->dbi->command =
||
> > > > +         !host->ops || !host->ops->attach || !host->ops->detach ||=
 !np)
> > > > +             return ERR_PTR(-EINVAL);
> > >
> > > Do we want dev->of_node to serve as a fallback for !np?
> > >
> >
> > No we don't dev->of_node is hosts node, and np is panel node.
>
> Fair enough. The parameter name is a bit generic, but I guess if you
> read the documentation it becomes clearer what it means.
>
> > > > +
> > > > +     if (!of_device_is_available(np))
> > > > +             return ERR_PTR(-ENODEV);
> > > > +
> > > > +     dbidev =3D kzalloc_obj(*dbidev);
> > > > +     if (!dbidev)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > > > +     if (of_node_test_and_set_flag(np, OF_POPULATED)) {
> > > > +             kfree(dbidev);
> > > > +             return ERR_PTR(-EBUSY);
> > > > +     }
> > > > +
> > > > +     dbidev->host =3D host;
> > > > +     dbidev->dbi =3D host->dbi;
> > > > +     device_initialize(&dbidev->dev);
> > > > +     dbidev->dev.parent =3D host->dev;
> > > > +     dbidev->dev.bus =3D &mipi_dbi_bus_type;
> > > > +     dbidev->dev.release =3D mipi_dbi_device_release;
> > > > +     device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np=
)));
> > > > +
> > > > +     ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->de=
v), np->full_name);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D device_add(&dbidev->dev);
> > > > +     if (ret)
> > > > +             goto put_device;
> > > > +
> > > > +     ret =3D devm_add_action_or_reset(dev, mipi_dbi_device_unregis=
ter,
> > > > +                                    &dbidev->dev);
> > > > +     if (ret)
> > > > +             return ERR_PTR(ret);
> > > > +
> > > > +     return dbidev;
> > > > +
> > > > +put_device:
> > > > +     of_node_clear_flag(np, OF_POPULATED);
> > > > +     put_device(&dbidev->dev);
> > > > +     return ERR_PTR(ret);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
> > >
> > > Don't we need to of_node_put() here on failure? Otherwise we're leaki=
ng
> > > the reference that we obtained inside the device_set_node() argument.
> > >
> >
> > This is fully repeats device_register logic of drm_mipi_dsi.c so
> > unless DSI framework has leak, this should be correct
>
> Nobody said that drm_mipi_dsi.c is correct. I'm reviewing this patch and
> it seems like it's wrong. If drm_mipi_dsi.c does the same thing it
> probably is wrong, too.
>

May anyone from DRM maintainers clarify this please. I would like to
know if I need to change here anything. Thank you.

> > > > +static int mipi_dbi_drv_remove(struct device *dev)
> > > > +{
> > > > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->drive=
r);
> > > > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > > > +
> > > > +     drv->remove(dbidev);
> > > > +
> > > > +     return 0;
> > > > +}
> > >
> > > Might as well make drv->remove() return an error and propagate that
> > > here.
> > >
> >
> > Have you even checked the code? remove() callback is and should be void=
.
>
> I don't know what you're trying to say here. Yes I can see that the
> remove callback returns void. My point is that device_driver.remove does
> *not* return void and since this is merely a wrapper around it for DBI
> it could also just return int for symmetry.
>
> But there's also continuous work trying to convert all driver remove
> callbacks to return void, so that's eventually going to get "fixed" here
> anyway, so might as well leave it like this.
>
> Thierry
