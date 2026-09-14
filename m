Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210BD3E557E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388355; cv=none; b=R0rh7FOSanWCEXrkmnOIKNQRTXyFyem3SWCUOXqXBLZTfEnvzj8SfmlLqTMfuBZAGxrE9T5N9Ny5eY8BuNlhpXtzHVkMg+IJx2/XhRzdil1nnb6Ml5xoMLP9mF5vUiFVif9DWqjFW9M9237kMI53V47GfKFUAD3kqwcIqz9mIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388355; c=relaxed/simple;
	bh=HAyAnZ0GadBkjMAXPjuUHMJJX0SITzcvmfI8+Umd6ug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HtzO9fTOmGRB5b6mqH1dXYGJz5i1EqBzAzkMOld8czTgdDcFFbSoT4Apv/rdQ/K+6EkJ7q9AauARMo3LQX+BhgeEeIzuMP25PXvmG7wYZQRUdaEekBNt4Xq4Lu/H14tb+rj13HAd97aUpRIF1d2pxoQ5BqzgkrMOcCmDZDv3ZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mvPXp8oU; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mvPXp8oU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 580794E4059F;
	Mon, 14 Sep 2026 12:19:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D1D560323;
	Mon, 14 Sep 2026 12:19:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55AEE11C7AFEC;
	Mon, 14 Sep 2026 14:19:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789388347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=okg6YUvbJfQyTjw8b4yIFAJ6zweKF8RLdit5ouRtvwA=;
	b=mvPXp8oUQwSYwYrF7tDalA1c1hawfCbb6Bc4VFavuPRIvyk//HB4djgkNcY4VRLlY9oShr
	Tf1FO2vGjSkiEP8p7X6YhLFWEdnMDbCSH1V3zlVbWDxpcC564UDnw1XHn1XRQ4oTnII8sE
	oPdtINBYYBiB8wjxdBFbckGZm85igt8Sg83v5FmnBBpdnIEAG+BCbkw+i7PA8JZVkbUGO+
	a3BKusMG4mw5rGZvgKXCIOBbJwo6dZ2yebHlqbWIfcD0eMg/hqaHim89ib4sz+VvO9h6S+
	pD4p4f4nuAdEuefQboPtcUyUOIc1hzsdtkKkxsOStzV77fLOTESLAVSIyDzrzg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Itai Handler <itai.handler@gmail.com>
Cc: mwalle@kernel.org,  pratyush@kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  vigneshr@ti.com,  richard@nod.at,
  takahiro.kuwano@infineon.com
Subject: Re: [PATCH v2 3/3] mtd: spi-nor: take the flash lock in
 spi_nor_remove()
In-Reply-To: <20260914081149.1916589-4-itai.handler@gmail.com> (Itai Handler's
	message of "Mon, 14 Sep 2026 11:11:49 +0300")
References: <20260914081149.1916589-1-itai.handler@gmail.com>
	<20260914081149.1916589-4-itai.handler@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 14:19:04 +0200
Message-ID: <87a4pkowjr.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 14/09/2026 at 11:11:49 +03, Itai Handler <itai.handler@gmail.com> wrote:

> spi_nor_remove() restores the addressing mode with the same unlocked
> call to spi_nor_restore() that spi_nor_shutdown() used before the
> previous patch, and it is exposed the same way: the MTD device is still
> registered at that point, so an unbind can run the restore while another
> thread is in the middle of an operation. A busy flash silently ignores
> the restore, and a restore that lands between two chunks of a read
> switches the chip to 3-byte addressing while the driver keeps sending
> 4 address bytes.
>
> Moving the restore after mtd_device_unregister() would not fix this.
> Since commit 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
> del_mtd_device() drops a reference instead of refusing with -EBUSY when
> the device is in use, so unregistering returns right away and does not
> wait for an operation that is already running.
>
> Take nor->lock for the restore, as spi_nor_shutdown() now does. The
> unregister stays unconditional, so a flash whose restore had to be
> skipped is still torn down.
>
> Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when e=
xiting")
> Signed-off-by: Itai Handler <itai.handler@gmail.com>
> ---
>  drivers/mtd/spi-nor/core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 647bf8dce719..8d0302565445 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3852,8 +3852,14 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  static int spi_nor_remove(struct spi_mem *spimem)
>  {
>  	struct spi_nor *nor =3D spi_mem_get_drvdata(spimem);
> +	int ret;
>=20=20
> -	spi_nor_restore(nor);
> +	/* As in spi_nor_shutdown(), do not restore under an operation. */
> +	ret =3D spi_nor_prep_and_lock(nor);
> +	if (!ret) {
> +		spi_nor_restore(nor);
> +		spi_nor_unlock_and_unprep(nor);
> +	}

Why isn't this folded into patch 2? You are fixing the same race, but
you do it in two steps which makes step 1 incomplete. I don't get it.

You are making things overly complicated for no reason. You commit logs
are overly verbose and the comments are also superfluous.

Thanks,
Miqu=C3=A8l
