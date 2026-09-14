Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7733E95AB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374382; cv=none; b=nfWcE7fYJgALEIuXxRE2QeGiF/MZcr+lAlJfpB4eeHI4h4cHQR0weWt0UMqOfISX8xEcPtOkTVitlRGX27QkKDwCbhgRJGyl0qw9kDeyryFFv/WzYKUL4xjiNr0eQEnCrqpyAYSJ7nU6lfQJyNN6BHnJv/hOPM8FmB9N3y/dvpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374382; c=relaxed/simple;
	bh=sMNXatq2ZvjYODofAuePZj4Y9ZarjIkQoHCzV/smjXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BK273g0+NlKzMttBMHR+9W5TA6RULj6GghqTE0WJlGrozymF5pDdajEyCNvNacMekpbnGtQbkdGilW5sTaJ3SdhqUQsHBmxCdcPm/98XtjBRqVhFISYtbY/ntIcUf5MWAisAySBc1rMx7MKxIK8I0z0aOrX89YaKUyXQXSF0Tuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dauo3b2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dauo3b2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FC91F000FF;
	Mon, 14 Sep 2026 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374381;
	bh=qJuF6NHy0NfPTL2CuFgxJl+ThMlSl7hyjD0yDeZvspw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dauo3b2/TijvvBwK9NJzpWGdnP8ysebPNmQe4eJ9xsuaeHjjVzdQnjzDTJfcQU82B
	 tZ7zTwU2Tql4yfquhBG0VZ0klgRAI6bAJRa2Kt82riPdD2Yr3ZcOYTcrcZVoben6yg
	 lgSeUTntFRYxw+d5QHPaY2lc4rJ/UIVg+AmaT/ib01JKmnx7tFRwDlowp1qHaQauok
	 cVaRM9dyRGlut3OD8lM2zgaHOEwl1XJ3EizHuSe4oG5nvNvt2nyvrRWWkiFyK16i4/
	 QbEEFuXOlagSlp74QnmkTwLwpSCeM1A0fqiTI2mQWfWgvvpyJqUbLTuk99O8wIaNej
	 67ndJ/7N0KuGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: take the flash lock in
 spi_nor_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: pratyush@kernel.org, mwalle@kernel.org, "Itai Handler" <itai.handler@gmail.com>
Cc: takahiro.kuwano@infineon.com, linux-kernel@vger.kernel.org, vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, richard@nod.at
In-Reply-To: <20260914081149.1916589-4-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
 <20260914081149.1916589-4-itai.handler@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:26:20 +0000
Message-Id: <20260914082620.E0FC91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Using a killable wait in the device removal path allows signal=
s to abort critical hardware teardown, potentially bricking the device on t=
he next boot.

Pre-existing issues:
- [Critical] devm-allocated driver data (struct spi_nor and its DMA bounceb=
uf) is freed while userspace can still access the MTD device.
- [High] Releasing the device lock before unregistering the MTD device expo=
ses restored hardware to concurrent I/O and block-layer flushes, causing da=
ta corruption.
- [High] If `wait_event_killable()` is interrupted by a signal, `spi_nor_pr=
ep_and_lock()` returns an error without unwinding `spi_nor_prep()`, permane=
ntly leaking the SPI controller's prepared state.
--

commit f3b4a47f56b538ca231ed893cf829db3979e2e80
Author: Itai Handler <itai.handler@gmail.com>

mtd: spi-nor: take the flash lock in spi_nor_remove()

spi_nor_remove() restores the addressing mode with the same unlocked
call to spi_nor_restore() that spi_nor_shutdown() used before the
previous patch, and it is exposed the same way. This patch moves the
restore inside spi_nor_prep_and_lock() to ensure the lock is held.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 647bf8dce7193..8d0302565445b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3852,8 +3852,14 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  static int spi_nor_remove(struct spi_mem *spimem)
>  {
>  	struct spi_nor *nor =3D spi_mem_get_drvdata(spimem);
> +	int ret;
> =20
> -	spi_nor_restore(nor);
> +	/* As in spi_nor_shutdown(), do not restore under an operation. */
> +	ret =3D spi_nor_prep_and_lock(nor);

[Severity: High]
This is a pre-existing issue, but does this function leak the SPI
controller's prepared state if interrupted by a signal?

Looking at drivers/mtd/spi-nor/core.c:spi_nor_prep_and_lock(), it
successfully calls spi_nor_prep(), but then waits via wait_event_killable():

	ret =3D wait_event_killable(nor->rww.wait,
				  spi_nor_rww_start_exclusive(nor));
	return ret;

If this wait is interrupted by a fatal signal, it returns -ERESTARTSYS
directly without calling spi_nor_unprep().

Can this permanently leak SPI controller resources like clocks and PM
runtime references?


[Severity: Critical]
Does using a killable wait here allow signals to abort the essential hardwa=
re
teardown?

If the process triggering the unbind receives a fatal signal, the lock
acquisition aborts and returns an error. This causes spi_nor_remove() to
skip the essential spi_nor_restore() hardware reset step, leaving the
physical flash in a non-default active state (e.g. 4-byte addressing mode).

Can this cause the system to become unbootable on the next boot if the
bootloader fails to read the flash in the unexpected 4-byte addressing mode?

> +	if (!ret) {
> +		spi_nor_restore(nor);
> +		spi_nor_unlock_and_unprep(nor);
> +	}

[Severity: High]
This is a pre-existing issue, but does dropping the lock here re-open the
race window before the MTD device is unregistered?

Concurrent I/O operations can acquire the lock after
spi_nor_unlock_and_unprep() but before or during mtd_device_unregister()
(which can trigger block layer flushes via mtdblock_release()).

These operations will execute using the driver's cached software state
(4-byte addressing), but the physical chip has already been restored to
3-byte addressing.

Can this result in silent data corruption?

> =20
>  	/* Clean up MTD stuff. */
>  	return mtd_device_unregister(&nor->mtd);
>  }

[Severity: Critical]
This is a pre-existing issue, but is it possible for devm-allocated driver
data to be freed while userspace can still access the MTD device?

In drivers/mtd/spi-nor/core.c:spi_nor_probe(), struct spi_nor is allocated
using devm_kzalloc().

During spi_nor_remove(), mtd_device_unregister() drops a reference to the
MTD device, but does not block if userspace still holds an open file
descriptor:

	return mtd_device_unregister(&nor->mtd);

Since spi_nor_remove() returns immediately, the driver core will execute
devres cleanup, freeing struct spi_nor.

Could subsequent MTD operations from the open file descriptor dereference
the freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914081149.1916=
589-1-itai.handler@gmail.com?part=3D3
