Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF947D452
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156507; cv=none; b=lFeMNdxQ7oG9TH1kenIEigLXQEL/TNFDEP6bDPoDV9KPlmrMSa2YXOi6PC57Cmq4u889DebkBnwti3oREJGdN/gm14leVo85MKzF7nmbowjfc/E18tGT1v6y4mBJW+XXXdQYLSYRHBd5OIMQQhiQZHDLVfTOjmAFfvbH2c83tUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156507; c=relaxed/simple;
	bh=UxFboLT3/CD8oM/4D1o7HhX26fNhcRUtc19vZW8uABU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ym13WnzYh7CbFAQHVJ5ZgbfQ9LNbGxfm/75yWAwpgtqsJdbLrJx+phQK82ENT8vb0SBUgudIv3lparWvCyuvxQSEZF6BjJ1QBRYaahSj2XaobaTGTfB3wqhvSMsmeiwAaF73klXoQ6/NurAabNHYH+WWKIHGkrmtF0YiNLsGSS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5i+AP0v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5i+AP0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E723B1F00893;
	Wed, 23 Sep 2026 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790156505;
	bh=KIWCajMiURS7WRviggJnv1QIOiNyOS+SklvACs0UUxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K5i+AP0vSJzauqGLuX7zaQXc7Xfnmx4LtWEbRZKy0GpiMpyb0AVRC6XoyDJ+emV/y
	 utNMYE9v9JirXDG72k+gGY3SOtkLQ40VrbcY34FEwYUbxegwTfZelrUAfPWKsy6Wmp
	 UKIDUP9orIPONpumQf6tRWfbCfGj9gtL00fAqxmVQ6b85prFiuhVG1dbgCynfnp4vj
	 Joae53lL2scx/qEPbJmh4cv1ffiixZ99/T/C67CkdZ6rKOLdzx9jxgbEwzCqmfzvaG
	 ciO/SSPXvFp908BHh3+DRQ9JkqZZHN3vHGK5p35Fm56mexkCVwjkaDfAVf7KpgrMkM
	 2ddThT4F2f0+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephen Bancroft" <stevereaver@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Richard Weinberger" <richard@nod.at>, linux-kernel@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260923092626.873202-1-stevereaver@gmail.com>
References: <20260921021459.283023-1-stevereaver@gmail.com>
 <20260923092626.873202-1-stevereaver@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 09:41:44 +0000
Message-Id: <20260923094144.E723B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: maps: UAF of mtd_info and I/O memory on device unregistration
--

commit ad3016fe3893b23f61acf9f96913ff51726ac3a0
Author: Stephen Bancroft <stevereaver@gmail.com>

mtd: maps: add INT0800 firmware-flash map driver
   =20
Add a read-only mapping driver that binds the ACPI INT0800 "Intel
82802 firmware hub" device and exposes the system firmware flash as an
MTD ROM device.

> diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
> new file mode 100644
> index 0000000000000..c5f108aa34797
> --- /dev/null
> +++ b/drivers/mtd/maps/int0800.c

[ ... ]

> +static void int0800_remove(struct platform_device *pdev)
> +{
> +	struct int0800 *fw =3D platform_get_drvdata(pdev);
> +
> +	mtd_device_unregister(fw->mtd);
> +	map_destroy(fw->mtd);

[Severity: High]
Does this teardown path force a use-after-free if the device is removed
while a file descriptor is open?

While the driver sets .suppress_bind_attrs =3D true to prevent manual sysfs
unbinds, the driver core can still invoke remove() when the underlying
device is unregistered. This can happen if root unbinds the parent bridge
in sysfs, or via ACPI SSDT unloading.

If int0800_remove() is invoked while userspace holds an open file
descriptor, mtd_device_unregister() puts the kref but does not release
the struct device because the character device retains an active reference.

Unconditionally calling map_destroy(fw->mtd) then frees the mtd_info
structure. Could subsequent /dev/mtd0 reads or sysfs accesses dereference
this freed memory and access unmapped devm I/O memory?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923092626.8732=
02-1-stevereaver@gmail.com?part=3D1
