Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973558;
	b=avID9+D3etOxnaDgtvQbOCR5w+sQovgimFPjPTz9I4F8PWxLg2LhdpTr8eG4gzr3MPV9
	 o84vJ1+X4eKsdcUm7NvCqsiQK0iCKW8eg0lpkEr8sYX80G7uQDLnpZZyD645Uf0dbqmM6
	 gOyX0BEQ3Ie+R5XPZQI6hETXmx0to03wj/FCfqE0UkpCRkcZ8FU+YwOBXy6JcDh6SvPP8
	 PDWX2evvPJN01r/yeCiIUfUkwgXYBFNzm5TFV+oMmXspMCRQZc8VNlxzzTvAi1BoKYUNH
	 kwIxubISgMWfnueH8UG0Nv/s3IECYgqyAs5B8GRsrCyTvBlUrpuW1ORIVHwacvSD+vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
	b=yHpkmK/OmsOaHTbVOHAgcTEx5pmqzfIRZThIQ42CppZMjDW+hWP+3Hglcx8JMVxTzl+t
	 D1LqVusPO2MNLh5rDAMglq1fCHerTu22rtlbGxrlQYrI6c6R3WT34HSICglVXabh5Ye6O
	 8U/w2r+TmH/fxk0EFWWLXOBQtxdq+dOXHRu2IYkMnyyq898ciFVtEkDhbdaHpgzT/LJ9F
	 3n6WTaDXmbzc4xWWvWKd6rcM1S0bRM8pp5qlZgcYzHVjugjriLRoQbKxIls2HGwodiLOh
	 +m6kBVT8C9VWTuo8EpVuby/WDW6I2OYNS+Wgz2v4vG60ADhsF9ZP4legJFLFrAwQalQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+QYVG9r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65EE6082BD7
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65EE6082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j+QYVG9r
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1239004eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973557; cv=none;
        d=google.com; s=arc-20260327;
        b=r07B/i26Z+rcBrPI2LdiHnNwySxpLgB0yrhiMwsto6eFNa8Mp6hMUzUGKU0zAsLp6N
         y55o/p8697mBU2p7nA/EWR0tCBHkh29K5h/rkEqaop/t1Dalci8hiexxydLXpNYMSuYx
         BF1sqZ1Z6ZoOJmsABkJ6WSPKhfoTE5NHrLrDrLRBrkagqhHN+HRDfVWTexBdfi1lnoDJ
         0Ua82eUxGZv/DMFj2mheXqgha1de3LFu6cxGKSlrTxjx5LZ7aig26zmjWa2qPDVJq8os
         xYuBx/DoNmeIOXAqB84d2y6ZuP95KpyuQ1E2J75eKaFushNcDGfOJ0mwI1TnnJMMP4zc
         rf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        fh=ZOpfI7GUy0NiB1u5aexjOpw7TFrW8SWJZSYwL4JYh34=;
        b=i2UVEKzGo2YN4RQnJZPXEzmYXmcpmBGwg9gRT8Bu2BYoiHvLcHI7KlmwvnwvEZEdui
         ujIFs0wRnNXxq1BUs1zlCeEhY8xPV12YM/oiCgimAiPB2ZW7ypbWH95hrMTCRpdgMk+k
         fL9VvNPg4QTRO77auk14t7rNDJpgzezFVpdylHU2XqMvub0d4f09jH9vP/3dBkh7n93z
         JV9GlbQJDBZnm4o9hnTS7qBOQpNs3DAdRJcFkGXnqztdRX7X9FD0Wo62iPOPYF3v2x26
         H9yVh1x3Ez+KLV3MeHltl66ux0F9AIfPiCFcU8B3qIfXsl8E795lBuJID+q4o/+xFhZJ
         peNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973557; x=1794578357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        b=j+QYVG9rxlB9SEyj9nUeuS7h5AS2Km4bZWAburYtmvGchkPIuMmdD+23vuXJ4luImZ
         xXfC0+LF7Wq6pIf9bB+0QOc1DQ9Gcg2EVnV+A0Qgl/4Ki8vu5E9MqcZ50WbZbNvWXNBc
         v6q7VIxMcVYIF6kgUmr1baCFL0fswtAF/h/3rT2OC4ZZXOaJMs4ZOmV//xpCVIvMmQew
         g9x+Wrw+zIGEhdUf1dmp2zOWA5oMbUOGRWeqyUxbmACCR7e4+O5c+lDWQptUXn5LadCj
         L/iVYW2GpUUdM5s+RLiBSQelRxB65Uf0PsBgWnmeQz8/u5d8yN5TRJunR3Ev/pTGJUDz
         /h9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973557; x=1794578357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysjRF7+5KAzB2nN8K3/7fs9i+z/VoJBmooPC53OWZV0=;
        b=AWYeR+4YtfW5D0MiFEl5aQDi+Lk7XjkauNrsl3qnfqW0hw7GGz1sAZJi1HsjHvVnA6
         mqSTAKpWOIHLsefjzhzznfZ+u+NsBOamG80t3Ojo8V1fC1IWOhYs1MaDOYeJ8tZSexXE
         DP6TgYZLleo7alujEglB+7VQxQz69lBl1bUDtxKPekfLuD6KbLx+0BK//u5lK8eCSqRO
         QkaDWzn3d+Lpg4vmJ8TuZLTVzmCetGdrd6H0SudfOb6R+aG9ie2678btrC7ZnEkqEDis
         57epZVQ3lE36+Jcxy8dSfKpUm9V9/B5vLLcSt91fogfh2jvucRoAzA+Y0i9JngcxUZoz
         Gohg==
X-Forwarded-Encrypted: i=1; AL+hErEaR8Cq/pzUUyLJkgrLpo/bQJ9WOlToa+1pbhvSpcCiZ6TlkiKOpqKMIRlRVWwNV6hh7B2E23nNVmlEjKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z935CxlcRKwakQGkfclKJ5CcbtgVhei8qhzwTL+ru5jWpWVMEcX
	8tYF1nYOh7wQ7IDYF7UTeqNGlb+QTCmHejwfpLPxUriQ1IhlRlWpKFDpjv1tLuW6z7w9AfcDaY/
	zcI8ahBKhwWE0SkzYpTTZS+BSz9geFOc=
X-Gm-Gg: AYBFou2/wQWOYw3wEQSyoWVXRCa8G8NuwdnlVFvXznTTSyCmh+lW25T1/6N4RVrHYWl
	hZ3t4Bmm84NYLlbjXM6LrELfw1Op/g0O6Q0Ndm3MWJ9VwR8FHZ1/YreVv2JaINOHQpY7qNDi1GV
	I0fouHlNYHWcSJO6m43+7whwQfyQEbJ8Qa6cbxiRzj/7PA607+5GjqPWB7cz5YIK1sMd00WzeKq
	cyh52wCCU38lpN0SU8fqdko2FJrSfGnP8rACpA2zoClYmAu0ijfYZSjGIPS6Nq1jLFQvFg//OhR
	MQBjQb7+5+Hd9NRPgbDJJc5/kcG+OeS0+piM1z03/WtuxI3uNGU+Q7We1/UzkbzECjP7xJhkO5Z
	WXtw99MPOLeH9FcGffbIGc9woFPHre1vzihwk502ImGq2w1Hvwe1gS5KCBSsVlLgxdhUAsi7Uhm
	+CFtoZMEm99Ku64wXMeoKax8eH3ZUwjw==
X-Received: by 2002:a05:7300:8281:b0:369:f2f4:b227 with SMTP id
 5a478bee46e88-36f75b1ffd2mr2981710eec.18.1793973556636; Fri, 06 Nov 2026
 05:59:16 -0800 (PST)
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
 <au3NWsXz-hg2LNr_@orome>
In-Reply-To: <au3NWsXz-hg2LNr_@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 15:59:05 +0200
X-Gm-Features: AclHuK-j0iaOa56-THlEL2TIjiQTJ3K-OFRxGt-N5L_ts2vcZPaUDw3mRDwDbl0
Message-ID: <CAPVz0n3_oRz8aMr1W=8K7dnHhM=vuGpHjpq6+=80oXiFj5wfSg@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm: Add MIPI DBI bus support for MIPI DBI Type
 A and B
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:14=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:01PM +0200, Svyatoslav Ryhel wrote:
> [...]
> > diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/drm_m=
ipi_dbi_bus.c
> [...]
> > +/**
> > + * devm_mipi_dbi_device_register() - create a managed MIPI DBI device
> > + * @dev: device to tie the MIPI-DBI device lifetime to
> > + * @host: DBI host to which this device is connected
> > + * @np: device tree node associated with the panel MIPI DBI device
> > + *
> > + * This function is called by DBI host driver to create panel device.
> > + * It automatically calls mipi_dbi_device_unregister() when @dev is
> > + * unbound. It does not automatically free passed device node pointer,
> > + * it must be put manually.
> > + *
> > + * Returns:
> > + * A pointer to the newly created MIPI DBI device, or, a pointer encod=
ed
> > + * with an error.
> > + */
> > +struct mipi_dbi_device *
> > +devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_host=
 *host,
> > +                           struct device_node *np)
> > +{
> > +     struct mipi_dbi_device *dbidev;
> > +     int ret;
> > +
> > +     if (!host || !host->dev || !host->dbi || !host->dbi->command ||
> > +         !host->ops || !host->ops->attach || !host->ops->detach || !np=
)
> > +             return ERR_PTR(-EINVAL);
>
> Do we want dev->of_node to serve as a fallback for !np?
>

No we don't dev->of_node is hosts node, and np is panel node.

> > +
> > +     if (!of_device_is_available(np))
> > +             return ERR_PTR(-ENODEV);
> > +
> > +     dbidev =3D kzalloc_obj(*dbidev);
> > +     if (!dbidev)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     if (of_node_test_and_set_flag(np, OF_POPULATED)) {
> > +             kfree(dbidev);
> > +             return ERR_PTR(-EBUSY);
> > +     }
> > +
> > +     dbidev->host =3D host;
> > +     dbidev->dbi =3D host->dbi;
> > +     device_initialize(&dbidev->dev);
> > +     dbidev->dev.parent =3D host->dev;
> > +     dbidev->dev.bus =3D &mipi_dbi_bus_type;
> > +     dbidev->dev.release =3D mipi_dbi_device_release;
> > +     device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np)));
> > +
> > +     ret =3D dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->dev), =
np->full_name);
> > +     if (ret)
> > +             goto put_device;
> > +
> > +     ret =3D device_add(&dbidev->dev);
> > +     if (ret)
> > +             goto put_device;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, mipi_dbi_device_unregister,
> > +                                    &dbidev->dev);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return dbidev;
> > +
> > +put_device:
> > +     of_node_clear_flag(np, OF_POPULATED);
> > +     put_device(&dbidev->dev);
> > +     return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
>
> Don't we need to of_node_put() here on failure? Otherwise we're leaking
> the reference that we obtained inside the device_set_node() argument.
>

This is fully repeats device_register logic of drm_mipi_dsi.c so
unless DSI framework has leak, this should be correct

> > +static int mipi_dbi_drv_remove(struct device *dev)
> > +{
> > +     struct mipi_dbi_driver *drv =3D to_mipi_dbi_driver(dev->driver);
> > +     struct mipi_dbi_device *dbidev =3D to_mipi_dbi_device(dev);
> > +
> > +     drv->remove(dbidev);
> > +
> > +     return 0;
> > +}
>
> Might as well make drv->remove() return an error and propagate that
> here.
>

Have you even checked the code? remove() callback is and should be void.

> Thierry
