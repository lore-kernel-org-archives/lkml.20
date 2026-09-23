Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229348BD4E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164642; cv=pass; b=ORuZDjCUIUDagkmN73DStTG8e2B1Dda0JZ+PSUQ29BYHeAOaI3rwgi10KoK13f/JHdNEqf5sReImL1TQl44ZNQaxzuaGr5qHRMzSV7st5ce6U/nJpIpM+Sgj9wETwJcxKcAH6h4ihIiSy5XSaA6qX6PTbXFnCHHc5HV2IZtYf5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164642; c=relaxed/simple;
	bh=d3pIqDKjwzqjI/GWL4Iy6hIvXv3G/GiTWsez1fVu8C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6po/rLHzbSLJvWGEPtQHqWA5Dz+EtSTLm13Au8M5fk3cV2TpVaKAYygKitXz7yZ/Y0syQZmoNVQrGWQWKlm9eLdkKjHQOA9f8436xTLc8uY+jRNzebfsNniFLNntv2J95lr9qE8+nIlAq0QcbTEYY62SjycRsiszjK7zcV8QlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Scs9TqAO; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Scs9TqAO"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so770271e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164633; cv=none;
        d=google.com; s=arc-20260327;
        b=Es8W2JmbafM1YoEtWtc+nbB/h9R5dwVwjWBxtHQRWT6A62ba+Z1BKj/jJUBPMZlPRV
         sZbQryHMvprnuXkAAOeVzMD+tK1IIZrcGnlS+1CMtc5Lnh7WCGFpt5evNz+um0S7ndGt
         zhU4bD6ofWjfhEVSUr+xJRz8jUzvyMZ9vuAjPdCLw8Z5oN0j9KpybyiqMBHu7auRPRno
         PYsviN6VJg74ySwsFMAZvlXnTIJPBbPw51sbQTLHiGwu5uDBrTL59/BnhQqwaGceJHH+
         K4yF25IS5dWbhoYT5e/SX7LRzMJ84RbXKYagKyB9Dsv6rwaACayd5k1tMiQ6jIxBoNlh
         H+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        fh=iaFZXbLq0sMzCjUaKBw29Fm3U3rGWRVnG+SDcm29gm8=;
        b=EnW+aZunAuToDArHVQ5PpdLW0PnZr/jph6b6u8DrUNrTljwfgxpFCUDYmJrKWalxFM
         dJKlq3/nkaZ8QVZW+2e5lrpC9MUSM3N8JRD19MkpNtS6GESfa8fr+sciXY3Jb4dMdQKM
         T5pjgj8p0D7EYdq+semX3O9ZPYYh0dG08Jk9p1vNTR3axCzJ8gd8569m7dK5eoybGBYq
         vH0KCu4Z8fZt2cFYUPHaFs9MTrFGu+XWCcCUwLmdQuS2nTJl3LgJUGEt5hhO9eJWvW11
         6hdZDd4tfQjoW2kG+cOXiylpsZYu0lYS89mNx8Q+bGD1P2+Q9VtRGBMO7aEBLdGKvUBf
         CxgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164633; x=1790769433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        b=Scs9TqAOeun6E3adqnKirTUb2uMGfPeDXH1RLZiEi24/AxnWgJpIPRoNeRD8DN2eWz
         MBexJ3Qa8LxTsIuy+MQNTVLOK/ISFHgycX+COaHNGx+LC+kOAmh16SM2ZwlvlKKNu/86
         AasTUQ6yLelHa70Zr+rQkps+4+D1GJquzRPJMyHWmUp3k2fDtGzZjVachKJKu27Jj+57
         02xxpJcqW8kEWeRm8CE+BGHkYvdXw5zfsM8Kup+GL6wprkP9Y/zk9v0q92Q+1FA9aI6P
         FDg5cP/3z3Q2nq9jlAQ4kDhd+x63GGzBOmH9r8JPBVfqzcKplORF273lMh1n4zIMyHP0
         VJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164633; x=1790769433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        b=qJq7nY7ieJY2qUDfGHzVfizL8OVvEYUTLkfIkR/ynbHN967snl/+YuHaV/M2F7ZQCm
         GMsA/UWNPZO5ZkRoorHcRoLsXgPvZdkzenF0TWMC+zCT+JoUR+Uid4bovZJAmK99z4WB
         stDx8yBn2Pqhmre7XCAbTzYZ03OEzsR4z0vWdUtOuo1IHtnyIEjihs2JEbtXvogZhL+2
         iFVsDPPAkDVDTlP/Z1vQLnBDbBpzN2bX4S3lDdKE5Cfhq3xIT+fasBN9D+/SrMNvilcI
         YKAlz6QU9iycD7s6BOpMi9/0KBerTVUrOMkz8CWz1Nbfeu2EauK3N1GVJT/rEyZ/JMPC
         /aPA==
X-Forwarded-Encrypted: i=1; AKwUvBzaCPdq4N4URYMMXQFvix0LZXgqlS0mKMYv6Y1m5KHFUhW2noplIRigY6YHWSjCxAzN3ltJS+LzwJDe1FQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ltTo5+xM59wepI1YaP5eXIihJpYZh633MhrpRLwYeZVhcfXE9l
	FtjlvThusC7AEvnqCd06584+vsUrliZAy5oUSqyrsTXl5zudTq4fxj9pyvy/GIXjU1oQzxoeyTW
	DarZDvSMDCfz/yfUGung8rsNeCfxVphA=
X-Gm-Gg: AYBFou3IPNMXKFF163Z3Rs0ClVhEEg5yqkzXKaVthAsOIXjpFdC6TFgitQB5nLHgGCw
	Gox92zkm+f3qi0W/9DgtZvv7/TTbVaTGaCZT9gaDuGk47lMQYpNdgITN9JOJddwnYDDvlPelONo
	E7FNE3LOLNM3dGVYqCYPNb6uG9lTPY+euYrFkiIhym8AH8v4a1+BeWMJwUYSCZ+iVkKfdwNEFcy
	5M6T48W4ylnw9P9GpNPUaG0+yb6MdOmDZVDL9W8vSIO5Pp9yYgIllawAmLv++d8001mVG5+M9Nt
	7jTG02X2U8/4pmAQXV5l3YQkDsXE8DZoroPjQQ78h1eCwHXgw+wDLlGX21HiGbU4p/X4AnWD8Cs
	b5dcaOmAXkyR2
X-Received: by 2002:a05:6512:3b1e:b0:5b8:999f:718b with SMTP id
 2adb3069b0e04-5b8d89529a8mr775837e87.12.1790164632483; Wed, 23 Sep 2026
 04:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921021459.283023-1-stevereaver@gmail.com>
 <20260923092626.873202-1-stevereaver@gmail.com> <20260923094144.E723B1F00893@smtp.kernel.org>
In-Reply-To: <20260923094144.E723B1F00893@smtp.kernel.org>
From: Steve Reaver <stevereaver@gmail.com>
Date: Wed, 23 Sep 2026 21:57:00 +1000
X-Gm-Features: AcwNN1Vz4ppQFb3PfMiYiHwl33Vcr8dKREmMuo6U_3H7qEGvy_Pm4z2nh8h_0rk
Message-ID: <CA+sfT55QcfAGP=ttb-YNvR85ggCyfmgBp9YJ4853KGg0da1aDQ@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The remaining removal paths don't apply to this device. The platform
device is only unregistered via ACPI_RECONFIG_DEVICE_REMOVE, which
requires the INT0800 ACPI node to leave the namespace. INT0800 is a
static DSDT device: it has no _EJ0 (the eject sysfs attribute is never
created for it), cannot live in an unloadable SSDT overlay, and has no
hotplug notify source. Unbinding a parent device/driver does not
invoke a child's remove(). With .suppress_bind_attrs the sysfs unbind
is gone, and module unload is blocked by open fds via mtd->owner. The
residual "rmmod -f with CONFIG_MODULE_FORCE_UNLOAD" bypasses
refcounting for every driver. FWIW, the underlying limitation =E2=80=94 map
providers freeing mtd_info while the core cannot wait for open fds =E2=80=
=94
is shared by all existing drivers/mtd/maps users; addressing it would
be an MTD core lifetime change beyond this driver.

On Wed, 23 Sept 2026 at 19:41, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mtd: maps: UAF of mtd_info and I/O memory on device unregistrati=
on
> --
>
> commit ad3016fe3893b23f61acf9f96913ff51726ac3a0
> Author: Stephen Bancroft <stevereaver@gmail.com>
>
> mtd: maps: add INT0800 firmware-flash map driver
>
> Add a read-only mapping driver that binds the ACPI INT0800 "Intel
> 82802 firmware hub" device and exposes the system firmware flash as an
> MTD ROM device.
>
> > diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
> > new file mode 100644
> > index 0000000000000..c5f108aa34797
> > --- /dev/null
> > +++ b/drivers/mtd/maps/int0800.c
>
> [ ... ]
>
> > +static void int0800_remove(struct platform_device *pdev)
> > +{
> > +     struct int0800 *fw =3D platform_get_drvdata(pdev);
> > +
> > +     mtd_device_unregister(fw->mtd);
> > +     map_destroy(fw->mtd);
>
> [Severity: High]
> Does this teardown path force a use-after-free if the device is removed
> while a file descriptor is open?
>
> While the driver sets .suppress_bind_attrs =3D true to prevent manual sys=
fs
> unbinds, the driver core can still invoke remove() when the underlying
> device is unregistered. This can happen if root unbinds the parent bridge
> in sysfs, or via ACPI SSDT unloading.
>
> If int0800_remove() is invoked while userspace holds an open file
> descriptor, mtd_device_unregister() puts the kref but does not release
> the struct device because the character device retains an active referenc=
e.
>
> Unconditionally calling map_destroy(fw->mtd) then frees the mtd_info
> structure. Could subsequent /dev/mtd0 reads or sysfs accesses dereference
> this freed memory and access unmapped devm I/O memory?
>
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923092626.87=
3202-1-stevereaver@gmail.com?part=3D1



--=20
Steve Reaver
http://www.stevereaver.com/
Electronic Music Production
