Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B2E486BB5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532635; cv=none; b=ZlnlGp8Vz6GG1VXhfSvkliUY84AYgj6BXXxUFbYibGLHxh88a1jzc5wY/Izybfdrmtnm1GOBvy6fGl2LyyCfNTqIDI9yCKPdxxmxqUh4i+dXHQUqM19/uZCKDBrjNe8ezvDesgVkbxG+NOlRFiXnJfj5ZASpx1UOTYTTOO/Sn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532635; c=relaxed/simple;
	bh=KyTnYj811YK3qM928s47fSNFfZNDcvHdKQxd3sjhozw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=EH8ozGD3JvNetttuAhI39XcltSyEZJOGlg77ymnNhTmtBbky4kQmMV3ChjV4gpZdLkgZXuRFg6MOKS5rRNOZUPTrAe/l91vBnXt0J5Nu5fx0dNujW/nNL+zrdW3TROdPPzdWVws33L1yu7VCouAlZkZ8NnEg4vcilwuPuuAABJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvHYkB0m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvHYkB0m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173E61F00893;
	Fri,  9 Oct 2026 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791532626;
	bh=mmocaXB/c/ARhLFpC6LBa27C9Gx012oGYBY0BIuokYM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=AvHYkB0m/v9KfnTxP1MFMlWfovct0N/oawBMXUWAW+5jsyE30S6gi9tRVKILqbmpb
	 jxnh51ed8Sld1iX1TCden/Om9ZEG4VdHyjd53EAmZdvJmqN25hiDxJrHEaqCSiirbz
	 kOOj3cdUV+PDbsiRhs3zsSBulgkUfgKH8kdysQdYB3eYPqhlQG8TSyM9nMdQX3EgVE
	 zs98O61C5CiyvwkvqZTxB+e4NEW4zCqAi/hsm/hOeQ3aO/mXPnrGNLW0kUU6kvtZ69
	 yjHYax8Owrt68NnAr7GYDmSd8TvOhTiJm7JLr7+lKZJWi6DH5sSowt8nWh4YbNAL1E
	 IRw1ysNKkxH4Q==
Message-ID: <sashiko-outbox-165042@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, tze.yee.ng@altera.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <f03556b68e5d25bca6b3f533e344d83fc611c3d5.1791512623.git.tze.yee.ng@altera.com>
References: <cover.1791512623.git.tze.yee.ng@altera.com>
 <f03556b68e5d25bca6b3f533e344d83fc611c3d5.1791512623.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:57:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] mtd: spi-nor: double-free on mtd_device_register error path
- [High] mtd: spi-nor: UAF via TOCTOU race from lockless master->removed ch=
eck
- [High] mtd: spi-nor: UAF on nor->id and erase_map via debugfs after unbind
- [High] mtd: spi-nor: UAF and NULL pointer deref in spi_nor_put_device() o=
n unbind
- [Medium] mtd: spi-nor: memory leak of mtd_region on error path
- [Medium] mtd: spi-nor: memory leak of spi_nor object on unbind
--

commit cf3ecfea956c974ea676c9cd71ff2115f0af32ca
Author: Tze Yee Ng <tze.yee.ng@altera.com>

mtd: spi-nor: fix use-after-free on unbind with open handles

The commit switches spi_nor objects from devm_kzalloc to kzalloc with
a custom mtd->_free hook to ensure they outlive the device if file handles
are held open. It also sets a removed flag in the remove callback to
fence off hardware operations during devres teardown.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8bc117b46e028..b28d896f16ed5 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
[ ... ]
> @@ -3549,8 +3558,12 @@ static int spi_nor_set_mtd_eraseregions(struct spi=
_nor *nor)
>  	struct mtd_info *mtd =3D &nor->mtd;
>  	u32 erasesize, i;
> =20
> -	mtd_region =3D devm_kcalloc(nor->dev, map->n_regions, sizeof(*mtd_regio=
n),
> -				  GFP_KERNEL);
> +	if (spi_nor_uses_free_hook(nor))
> +		mtd_region =3D kcalloc(map->n_regions, sizeof(*mtd_region),
> +				     GFP_KERNEL);
> +	else
> +		mtd_region =3D devm_kcalloc(nor->dev, map->n_regions,
> +					  sizeof(*mtd_region), GFP_KERNEL);
>  	if (!mtd_region)
>  		return -ENOMEM;

[Severity: Medium]
Since mtd_region is now allocated with kcalloc, does it get leaked if
spi_nor_get_region_erasesize() fails later in this function?

If an early return happens here:

drivers/mtd/spi-nor/core.c:spi_nor_set_mtd_eraseregions() {
    ...
    for (i =3D 0; i < map->n_regions; i++) {
        erasesize =3D spi_nor_get_region_erasesize(&region[i],
                                                 map->erase_type);
        if (!erasesize)
            return -EINVAL;
    ...
}

mtd_region isn't yet assigned to mtd->eraseregions, so spi_nor_free() will
just call kfree(NULL) and leak this allocation.

[ ... ]
> @@ -3788,12 +3820,13 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  	if (ret)
>  		return ret;
> =20
> -	nor =3D devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
> +	nor =3D kzalloc_obj(*nor, GFP_KERNEL);
>  	if (!nor)
>  		return -ENOMEM;
> =20
>  	nor->spimem =3D spimem;
>  	nor->dev =3D dev;
> +	nor->mtd._free =3D spi_nor_mtd_free;

[Severity: High]
Does extending the lifetime of the spi_nor object cause a crash in
spi_nor_put_device() if the file is closed after the driver unbinds?

When the MTD device is eventually closed, mtdchar_close() calls
spi_nor_put_device(). Since nor is still alive, it will attempt to access
nor->spimem to find the controller. However, nor->spimem was allocated
via devres and freed on unbind. This also attempts to access dev->driver
which will be NULL.

[ ... ]
> @@ -3830,29 +3863,56 @@ static int spi_nor_probe(struct spi_mem *spimem)
[ ... ]
> -	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
> -				   data ? data->nr_parts : 0);
> +	ret =3D mtd_device_register(&nor->mtd, data ? data->parts : NULL,
> +				  data ? data->nr_parts : 0);
> +	if (ret)
> +		goto err_free;
> +
> +	return 0;
> +
> +err_free:
> +	spi_nor_free(nor);
> +	return ret;
>  }

[Severity: Critical]
Can this cause a double-free of the spi_nor object?

If mtd_device_register() succeeds in registering the master MTD but fails
subsequently (e.g., partition allocation fails), the MTD core's error clean=
up
drops the master's kref to 0. This triggers mtd->_free (spi_nor_free) and
frees the object.

Then mtd_device_register() returns an error code, causing a jump to err_free
where spi_nor_free(nor) is called a second time on the already-freed pointe=
r.

[ ... ]
> @@ -3875,6 +3908,21 @@ static int spi_nor_remove(struct spi_mem *spimem)
>  {
>  	struct spi_nor *nor =3D spi_mem_get_drvdata(spimem);
> =20
> +	/*
> +	 * Drain in-flight ops and mark removed so later ops get -ENODEV
> +	 * before touching bus resources freed after this returns.
> +	 */
> +	if (!spi_nor_use_parallel_locking(nor))
> +		mutex_lock(&nor->lock);
> +	else
> +		wait_event(nor->rww.wait, spi_nor_rww_start_exclusive(nor));
> +
> +	nor->mtd.removed =3D true;
> +
> +	if (!spi_nor_use_parallel_locking(nor)) {
> +		mutex_unlock(&nor->lock);
> +	} else {
> +		spi_nor_rww_end_exclusive(nor);
> +		wake_up(&nor->rww.wait);
> +	}

[Severity: High]
Does this create a TOCTOU race with lockless readers?

A reader in the MTD core can check master->removed locklessly and proceed.

If that reader blocks waiting for nor->lock, and spi_nor_remove() concurren=
tly
acquires the lock, sets nor->mtd.removed =3D true, releases the lock, and r=
eturns,
the driver unbind completes and devres frees resources like nor->spimem.

The blocked reader will then wake up, acquire the lock (failing to check
removed again), and try to access the freed devres resources.

> =20
>  	spi_nor_restore(nor);
> =20
>  	/* Clean up MTD stuff. */
>  	return mtd_device_unregister(&nor->mtd);
>  }

[Severity: Medium]
Will this leak the entire spi_nor object if the device has partitions but
CONFIG_MTD_PARTITIONED_MASTER is disabled?

When that config is disabled, the master MTD is never registered. In that
scenario, mtd_device_unregister() returns 0 early without invoking kref_put=
()
on the master.

This means mtd->_free() will never be called, permanently leaking the
kzalloc'd spi_nor object.

> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
> index 288e2866daedb..a0639e91cb2d9 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
[ ... ]
> @@ -299,15 +297,10 @@ static struct dentry *rootdir;
>  void spi_nor_debugfs_register(struct spi_nor *nor)
>  {
>  	struct dentry *d;
> -	int ret;
> =20
>  	if (!rootdir)
>  		rootdir =3D debugfs_create_dir(SPI_NOR_DEBUGFS_ROOT, NULL);
> =20
> -	ret =3D devm_add_action(nor->dev, spi_nor_debugfs_unregister, nor);
> -	if (ret)
> -		return;
> -
>  	d =3D debugfs_create_dir(dev_name(nor->dev), rootdir);
>  	nor->debugfs_root =3D d;

[Severity: High]
Since this devm_add_action() is removed, do the debugfs files remain
accessible after unbind completes, while we wait for the final mtd close?

If the debugfs files persist, accessing them can cause a use-after-free.

For example, reading the params file will call spi_nor_params_show(), which
dereferences nor->id and erase_map.regions. Since those were allocated via
devres, they are freed when the driver unbinds, even if the spi_nor object
itself is kept alive.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791512623.gi=
t.tze.yee.ng@altera.com?part=3D2
