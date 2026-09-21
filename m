Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C23264E3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957814; cv=none; b=eF+HYvc1dgB0K5jzJ0IavGouPW4CfLYZvWZPQ+wKx3Kl8n7R0uhpGCF9sfkP0M/ZF3ZOewZ8oxRO/pLR90VG5tHgwG0uDBfLb1jEHjFU2DMg8yQUNcqwzlppm7hI/jJiQtNDIzvxzHV9GHBwBB9hlM+PpjvaEXswl5oIwp8U8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957814; c=relaxed/simple;
	bh=1G2CUL3nMFe018S2/CGEXPi2A/Stwvb7HE+chgwrod0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eBBqeXBjVm8xDxi1ztfm9cosXQ0hTYaPHl66E86DkHMhdroLDtY909tkjUbOLxmZroEeBA+utHazTMKoON4cAUTEHamWjN3uXj8F1u7DxnZgGkonZESufJ+0wpOAKnoZX+18riOE7Zw7S73YsFtiAAvCzWHifX46nIBeE+D2xxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXcg4Rre; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXcg4Rre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556771F000FF;
	Mon, 21 Sep 2026 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789957812;
	bh=/XL5rnfKQLyBQCvuigtRdilLwJDi3LJgcPBEohWzXVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXcg4Rre3q2j468v7bd6oqbpWb0KCs4xUiB+6vb8/mHPa7LEOFSCmYwpLII+ciGAK
	 9fua8wyMqPBHan4Q/CfZ7rXrA6bjTow7d1rM96x9ouWeXe6e3SnhyNitrxzb3m5oHR
	 z6oQMIXOFeluzF1mVQemeSKkRZPDyPs5J8aV83lzz7zLIxEYq/RH7Fk7VOuIW5aAK9
	 KhKrjWAJAebIRw3bMR0t9A6opLq4WFgCA7HeF0Vb43FfOr1/hGy3cbkE8FaB65AmPQ
	 ZrLiEiq/l2bYztDm23vgkW1ju5PJtkxy1I5P46BlLP71yonRgxJIS1XOqeBhnvpggB
	 JjvH1Dmdaa9WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: maps: add INT0800 firmware-flash map driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephen Bancroft" <stevereaver@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, linux-kernel@vger.kernel.org
In-Reply-To: <20260921021459.283023-1-stevereaver@gmail.com>
References: <V2-MESSAGE-ID> <20260921021459.283023-1-stevereaver@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 02:30:11 +0000
Message-Id: <20260921023012.556771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: maps: Use-After-Free in int0800 via sysfs driver unbind
--

commit 2d904c4a0ae5009245dd1587c804f0ac6e9402b8
Author: Stephen Bancroft <stevereaver@gmail.com>

mtd: maps: add INT0800 firmware-flash map driver

Adds a read-only MTD mapping driver that binds the ACPI INT0800 device and
exposes the system firmware flash as an MTD ROM device.

> diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
> new file mode 100644
> index 0000000000000..0188d58b168d9
> --- /dev/null
> +++ b/drivers/mtd/maps/int0800.c

[ ... ]

> +static void int0800_remove(struct platform_device *pdev)
> +{
> +	struct int0800 *fw =3D platform_get_drvdata(pdev);
> +
> +	mtd_device_unregister(fw->mtd);
> +	map_destroy(fw->mtd);
> +}

[Severity: High]
Can this lead to a use-after-free and unmapped memory dereference if a
user forces a driver unbind via sysfs while the character device is still
open?

If a privileged user opens /dev/mtdX and then writes to
/sys/bus/platform/drivers/int0800/unbind, int0800_remove() is invoked.
This unconditionally calls map_destroy(fw->mtd), freeing the mtd_info
structure and allowing devres to unmap fw->map.virt.

Since mtdchar_open() incrementing the module use-count does not prevent
forced sysfs unbinds, a subsequent read() on the still-open file
descriptor would dereference the freed mtd_info and read from the
unmapped memory.

Should this driver set .suppress_bind_attrs =3D true in the platform_driver
to prevent forced sysfs unbinds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921021459.2830=
23-1-stevereaver@gmail.com?part=3D1
