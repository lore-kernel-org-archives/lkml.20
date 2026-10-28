Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793191575;
	b=q8Gd1MFRVlc5Qs2SmBaDml1yB2QdFSS1crGKax9gawwbW4RiMXY26nSM0Aveg0BHOpAh
	 8KO8MT/MLUFNRKWmnEPyNaen3zJ/QitbW9fe4YG930DsAZqOr0Lvp7iDYqJL5Zy81s5n1
	 vbtaCVk2/2FvB7cWXEJjcsMgK9LHPz0eHFsaP8t105IJCc/Ei61KJPXy2itfvCTMdchPV
	 EopobvdDPrwYxHKWJrKR2WLQ2wfhIyqnVlSiZnT48KW959/yBomeESYclPn0n3xzYcizd
	 JdtZYKXgADvr8SROKMlnj/P3uIQo6wuXd8pWVp+D2Y9Ko6GdJQbKSpPWK31cDt79siA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
	b=OZlUVbZj087097EP+A3iJ1/Ln4tdMMl21aGSbDd+IIKsQPsDTIACvI7EiLRtdZ/pIngz
	 F7JGiqYsl0TcpZmChcYZVzs6wMhxfRWtsMRAc/GfySpM0JUy77rnany22t3yIpggjCMOX
	 lkYR3pzahgP7UFIBIJMTql2dIpT3bAwkus6CzYas6NWbFXAhlialzyHYsY45GuszL/7pZ
	 UsZa5wSN6rIm1SJmv4JRehk4L4buLz8UpikiHAX+42K2NxbxdmPigXbQgNWd93pCeF7LC
	 3YhgSE+bU5t4ORK8ybG52/dluPd4CbYOEnAZaCGCxtrtoesVBQW24eediQtX/uONcJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvCNg+hE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7F2606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7F2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NvCNg+hE
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1292620eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793191574; cv=none;
        d=google.com; s=arc-20260327;
        b=k5trYCURAWDzeX2jNugn3r78KWyIZ4GnbN8+hH65oZqbxQwVDq0+8XM/L5TBaLis23
         2oFvuT46g4LQU6OQZvryWIMtkxlohNlLG5cGvdaohUM4cc+O/tgaSGuxtlWCSBIsDA5L
         Wo7dcWLMzbKqtCuvqBIRM56MkpITF9QTM9o/c/eD7i04homBfCAvcL9GwbnWWm3CT8TN
         Jd6GBarHAvsMmlzGJIICC0isu4ULOL1YCaOxOIY/BEYq/VW+NHCe7J2Kq6kny6XCdjxG
         kpkdol2EZhOGZ8CElkyKprrV9OV53jzs2Weuj8otr+KIKrNImKEdeae/pa3lnPFDcq1k
         DDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
        fh=izLRR0OtchQRoAoiyzW5slR8Hw4XyZ0tDIbxiZ+KTa4=;
        b=kJ0e9b20OzURdVBnX1SmzxFei+hdhkHulcR1YYfA/fVhAjD4DVCyJh/nhoYLYw+msL
         eTSinhXUasPPy+pwtR4l3WhNYoYguDEYvUHaN49rAdTo347g99ziiNRvtuZc5btt4EkK
         qiF177XuKX4VtHnDCoQ93HpJ0+FQ5A9CraBN0cZtmCn0BW8wvkuVX3wPQ4aLE/7R/VQW
         naK1RzXi1wk+/2MilFhQeS9TJ7Na0Nw4WUtD4zAEsn3bDQmG2ytOrhh4VSJvbTvTeJpr
         M/fYBNtJY66r58v/5ooJug9oIQMwOoxxEJpu0g4nzBxxWwDL/s3qQFEXEN4iB/DhhfHs
         LLSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191574; x=1793796374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
        b=NvCNg+hEj1GXa1PRFxoLoNiYzUhef+0uHJboLonS+/zNc5dMN5k3f0Zt2Ahy1xFZwr
         QyFN58dy11p85F771z5tTe/di7qPb6PsxdHZboYrwY3cnDtsg4np9V5pRH/h3zqrre7U
         xYNzsZt63dNqTMIXUaC8ikrrQlsbtdurOkZ+HcgLJa7pXvt8QOKF8wTuVJo9HiaWHuf1
         YmpbxIzayqGQGF0iu4Zwi0JsFMj+JqD743iNYPBvbRe9MKcgQ8ynKsnE23ViRdZTGmnJ
         6OsY/QM9izfyU5t5p5O9jflxl0fR8qlEcWVWAQQvPDHu5tyoU5pU/+D91HJ+EJXuhRvM
         +uBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191574; x=1793796374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr+Qh9RwQ2EtytMAMXYpVvXWO/lPy5jLS4bDF48/ePg=;
        b=cGgTZRpeGg/kIf9iiD3twPshUYQziQjhtQ0tHNVXoNBcL1nWwT2qLsRtjyHOqIj+m2
         43k+dmxrnnxbfATfDeeNGqnSJSTBmpEXthi2cT85B+UvncKPso8jdV3itl30kntNXIfB
         R8Rz6Ns2nFqtLzIX3P1gMXDLNKzlTzVF/5LLnOGYxPbZLc7kuaDqRPl7KKqgtdjfTwsW
         Hfnp0YZRsLwK0S1tisqxqYD3fJjhILdUzoh4HZSSgXUxfI1AyBlZA8DsSrhty29wFeWR
         mw8mHbo2zuhqUBcEcioy/heWNe3FDBBLvtdUfTPAHwjj5uF63BJldCpGi0K/Khtb/9LK
         2qYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwMMIZpsP0cuQYJIKjBRHBZo3CexTSxKBp7eRxMBKnIkST1kQ4qnnpjaoNcA1FPKGFeElrWxvbtQ21veY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt/j2h+6JY/YGLEXfcKQGm+kGEvXne3gGkfroc1gl8/w6m6Wt0
	6LQX3zvP3z67TslMLVjOzvs0gXQtDNzdZkAGzILHxkRUvUq9pCAOd+X1TqAUayyOoSCz61J0J9A
	sogleoaqWrtP1umKp9vnSHOcO5Au/2Bg=
X-Gm-Gg: AYBFou3d6GpZ1ZixdHRL7yEmhbDMSTq0qkOvl3pepiSqxyAS2dVx6RyBuVlo1k5xPqE
	XD1BHbHfEUYie8baQbgXTWM9HxZaHrtI9YmBONPzLDnm/jSn87/azKFdpkAYsT/zM3zkZu0vw+A
	hY9cDewzIGY86oUD80sAHv9lCGUBR3kL/2ZP5iIYdu+5TOfFxAGiidnQB7FxzruoslnrXjPojp3
	l+s+wgKxsDn48PeK6ZykSNaKgVRyjL/KjcTq47cPy2OtSbJk1gRz1mpt6CWmp2/MjtPLRfVR6PV
	lsPr/U6mD05CxnJVAXgrxYsCSKxmh28em8Swplcp79RTmMCxxDhw5lNIn6ylW7tDHj6ofnQe8d/
	+S4PaMk3p0NdWDw3+vE5OW6weAcZx+2VGhyx0FnVU6AydBhMLMTK+226VwnZl7xXPeEFIAg==
X-Received: by 2002:a05:693c:83c3:20b0:369:f182:8e99 with SMTP id
 5a478bee46e88-36a20114838mr3697076eec.35.1793191573518; Wed, 28 Oct 2026
 05:46:13 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
 <CAPVz0n1G0cDuUj7WRfj9YRgvMSd0sqSCjnir2p=QxUGu5BWTXQ@mail.gmail.com> <gXWEBbhSRWKBIHUcDXZu7w@nvidia.com>
In-Reply-To: <gXWEBbhSRWKBIHUcDXZu7w@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 28 Oct 2026 14:46:01 +0200
X-Gm-Features: AclHuK_z6xlcnPRnX5tVTskqs4cNcLBGx7AePFeqnVIxnyi6sGqea_4KfJ43bfE
Message-ID: <CAPVz0n3PeDm3X+hwP_yMhZPk22-gRL0+vFRj5J7QsyUhcAahtw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 28 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:3=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, October 25, 2026 5:51=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
03:46 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Friday, October 23, 2026 11:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 11:26 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =
=D0=BE 10:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > >
> > > > ...
> > > > > > > +MODULE_ALIAS("platform:tegra-dbi");
> > > > > > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > > > > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver=
");
> > > > > > > +MODULE_LICENSE("GPL");
> > > > > >
> > > > > > No separate platform driver or device. If a separate struct dev=
ice is
> > > > > > needed for some technical purpose, we need to create a minimal =
separate
> > > > > > virtual device, but unless there is a strong reason to have tha=
t we
> > > > > > should be fine with just the dc device.
> > > > > >
> > > > > > Thank you
> > > > > > Mikko
> > > > > >
> > > > >
> > > > > ATM, I use bridge framework to describe interface and I am attach=
ing
> > > > > it to RGB since it basically uses RGB to transfer video data. It =
works
> > > > > pretty nice so far.
> > > > >
> > > > > You propose to replicate how RGB works just for DBI?
> > > > >
> > > >
> > > > One of the reasons I used separate pdev was to be able get mipi_dbi
> > > > from it using dev_get_drvdata() from patent (dbi bridge in this cas=
e).
> > > > DBI framework seems to not have a way to pass it in any other way,
> > > > unless you know smth I don't.
> > >
> > > Right, I think using a bridge is fine; passing the mipi_dbi interface=
 is
> > > properly done in other ways. The direct parent devdata link is a bit =
of
> > > a "poor man's bus", and sometimes it breaks down, such as here.
> > >
> > > MIPI DBI is comparable to MIPI DSI -- both have a hardware channel th=
at
> > > sends both pixel data and commands. I think we should follow DSI's
> > > example and have a DBI bus and devices while keeping it as simple as
> > > possible.
> > >
> > > The DC driver would register a DBI host and the panel would bind as a
> > > DBI device. The DC driver can then supply the mipi_dbi object in a fi=
eld
> > > of the mipi_dbi_device.
> > >
> > > This is a bit more complicated than a parent devdata pointer but much
> > > cleaner, and follows the existing DSI pattern.
> > >
> >
> > I understand your intentions, but ATM kernel lacks any DBI type B
> > framework. No hosts, ho devices, noting granular. Implementing
> > everything just not worth my time to support 2 panels of device based
> > on Tegra 20. And I am talking not about time to actually implement
> > this in the code, but to upstream. DSI framework is huge, copying even
> > part of it to wrap legacy DBI interface and ustreaming it does not
> > worth hassle. And yes, I am a poor man, I use a parent devdata bus.
>
> I sketched out the bus implementation and I really don't think it's that
> complicated -- about 200 lines in total. See below. If there turn out to
> be issues we can put an equivalent into drm/tegra/.
>
> -- drm_mipi_dbi_bus.c
>
> /* MIPI DBI devices with command transport through parallel interface */
>
> #include <linux/err.h>
> #include <linux/init.h>
> #include <linux/of.h>
> #include <linux/of_device.h>
> #include <linux/slab.h>
>
> #include <drm/drm_mipi_dbi.h>
> #include <drm/drm_mipi_dbi_bus.h>
>
> static int mipi_dbi_match(struct device *dev, const struct device_driver =
*driver)
> {
>         return of_driver_match_device(dev, driver);
> }
>
> static int mipi_dbi_uevent(const struct device *dev, struct kobj_uevent_e=
nv *env)
> {
>         return of_device_uevent_modalias(dev, env);
> }
>
> static const struct bus_type mipi_dbi_bus_type =3D {
>         .name =3D "mipi-dbi",
>         .match =3D mipi_dbi_match,
>         .uevent =3D mipi_dbi_uevent,
> };
>
> static void mipi_dbi_device_release(struct device *dev)
> {
>         of_node_put(dev->of_node);
>         kfree(to_mipi_dbi_device(dev));
> }
>
> static void mipi_dbi_device_unregister(void *data)
> {
>         struct device *dev =3D data;
>
>         of_node_clear_flag(dev->of_node, OF_POPULATED);
>         device_unregister(dev);
> }
>
> /* called by dbi host driver to create panel device */
> struct mipi_dbi_device *
> devm_mipi_dbi_device_register(struct mipi_dbi_host *host, struct device_n=
ode *np)
> {
>         struct mipi_dbi_device *dbidev;
>         int ret;
>
>         if (!host || !host->dev || !host->dbi || !host->dbi->command ||
>             !host->ops || !host->ops->attach || !host->ops->detach || !np=
)
>                 return ERR_PTR(-EINVAL);
>
>         if (!of_device_is_available(np))
>                 return ERR_PTR(-ENODEV);
>
>         dbidev =3D kzalloc_obj(*dbidev);
>         if (!dbidev)
>                 return ERR_PTR(-ENOMEM);
>
>         if (of_node_test_and_set_flag(np, OF_POPULATED)) {
>                 kfree(dbidev);
>                 return ERR_PTR(-EBUSY);
>         }
>
>         dbidev->host =3D host;
>         dbidev->dbi =3D host->dbi;
>         device_initialize(&dbidev->dev);
>         dbidev->dev.parent =3D host->dev;
>         dbidev->dev.bus =3D &mipi_dbi_bus_type;
>         dbidev->dev.release =3D mipi_dbi_device_release;
>         device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np)));
>
>         ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->dev), =
np->full_name);
>         if (ret)
>                 goto put_device;
>
>         ret =3D device_add(&dbidev->dev);
>         if (ret)
>                 goto put_device;
>
>         ret =3D devm_add_action_or_reset(host->dev, mipi_dbi_device_unreg=
ister,
>                                        &dbidev->dev);
>         if (ret)
>                 return ERR_PTR(ret);
>
>         return dbidev;
>
> put_device:
>         of_node_clear_flag(np, OF_POPULATED);
>         put_device(&dbidev->dev);
>         return ERR_PTR(ret);
> }
> EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
>
> static void mipi_dbi_detach(void *data)
> {
>         struct mipi_dbi_device *dev =3D data;
>
>         dev->host->ops->detach(dev->host, dev);
>         dev->attached =3D false;
> }
>
> /* called by panel on probe completion to attach to dbi host */
> int devm_mipi_dbi_attach(struct mipi_dbi_device *dev)
> {
>         int ret;
>
>         if (dev->attached)
>                 return -EBUSY;
>
>         ret =3D dev->host->ops->attach(dev->host, dev);
>         if (ret)
>                 return ret;
>
>         dev->attached =3D true;
>         return devm_add_action_or_reset(&dev->dev, mipi_dbi_detach, dev);
> }
> EXPORT_SYMBOL_GPL(devm_mipi_dbi_attach);
>
> int __mipi_dbi_driver_register(struct device_driver *driver, struct modul=
e *owner)
> {
>         driver->owner =3D owner;
>         driver->bus =3D &mipi_dbi_bus_type;
>
>         return driver_register(driver);
> }
> EXPORT_SYMBOL_GPL(__mipi_dbi_driver_register);
>
> void mipi_dbi_driver_unregister(struct device_driver *driver)
> {
>         driver_unregister(driver);
> }
> EXPORT_SYMBOL_GPL(mipi_dbi_driver_unregister);
>
> static int __init mipi_dbi_bus_init(void)
> {
>         return bus_register(&mipi_dbi_bus_type);
> }
> subsys_initcall(mipi_dbi_bus_init);
>
> static void __exit mipi_dbi_bus_exit(void)
> {
>         bus_unregister(&mipi_dbi_bus_type);
> }
> module_exit(mipi_dbi_bus_exit);
>
> -- drm_mipi_dbi_bus.h
>
> #ifndef __DRM_MIPI_DBI_BUS_H__
> #define __DRM_MIPI_DBI_BUS_H__
>
> #include <linux/device.h>
> #include <linux/module.h>
>
> struct device_node;
> struct mipi_dbi;
> struct mipi_dbi_device;
> struct mipi_dbi_host;
>
> struct mipi_dbi_host_ops {
>         int (*attach)(struct mipi_dbi_host *host, struct mipi_dbi_device =
*dev);
>         void (*detach)(struct mipi_dbi_host *host, struct mipi_dbi_device=
 *dev);
> };
>
> struct mipi_dbi_host {
>         struct device *dev;
>         struct mipi_dbi *dbi;
>         const struct mipi_dbi_host_ops *ops;
> };
>
> struct mipi_dbi_device {
>         struct device dev;
>         struct mipi_dbi *dbi;
>         struct mipi_dbi_host *host;
>         bool attached;
> };
>
> static inline struct mipi_dbi_device *to_mipi_dbi_device(struct device *d=
ev)
> {
>         return container_of(dev, struct mipi_dbi_device, dev);
> }
>
> struct mipi_dbi_device *
> devm_mipi_dbi_device_register(struct mipi_dbi_host *host, struct device_n=
ode *np);
> int devm_mipi_dbi_attach(struct mipi_dbi_device *dev);
>
> int __mipi_dbi_driver_register(struct device_driver *driver, struct modul=
e *owner);
> void mipi_dbi_driver_unregister(struct device_driver *driver);
>
> #define mipi_dbi_driver_register(driver) \
>         __mipi_dbi_driver_register(driver, THIS_MODULE)
>
> #define module_mipi_dbi_driver(driver) \
>         module_driver(driver, mipi_dbi_driver_register, mipi_dbi_driver_u=
nregister)
>
> #endif
>

Looks promising. I will give it a try.
