Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A0254A7C5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066927; cv=none; b=jA18fiO1zsCjK8yEoWynhBTvvklBj24crtBsGBk0D8KFFjT2ckEOOcznZb++fiZGeEIaVdUGmdHpJJCXsL4BHst2WBAGhLkEDkd9brhQ6RQ77NVP2CMUH7KSnJmYarL+8sMJz/9m+XTF7GdvHlYIs5bH72TUltWAPRylTaqg6nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066927; c=relaxed/simple;
	bh=yypLGx5EfShmwU5p7dSHfpRMrVdaDFKPq1V32dLEodY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L7rnQRIEc+CMo04Lh4FLDlOsehG7DUDtE9AtrsgoTdlVLWB/zzHa3UN+15fuz9hIYbhYyhtjuN+t/05oY2UuUyX4JVUPBHcCFbZwwg82R8exut7Slq3C39dhjVQLIiLL0RzwQMIQEkh8D6NHjAgyasqrOTBshM93eolmCQRFYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYmzM6km; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYmzM6km"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A311F000FF;
	Thu, 10 Sep 2026 19:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066926;
	bh=JZVOaFw5q3Zl8L28VK/fdwfOdI9hxz0zCPLilgPhh/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RYmzM6kmNwdAxmQgv0lcHb7x7JwW8eIsjQYdWcFf535tY9vxdp3md4hJfxhvs8E/i
	 GwNVgz3sJJzmVylrVi2QlZ1gP09YV3ZSWdXe7gl5rEvl4F1FRPdRCFty6hVCRkJ48w
	 ueqMQXARIhiVDUUDrqO7ApIVJ1+n1o5qWzhbAMdVtnIrpkS8iJrVvlhWN7lsqJYhSs
	 X8CNXRaEDPqvtcwN3Drbu5jYLo24ZpvjIqQqyOtS7D+eZF0VFMgZsQngs3opCU1WAK
	 oWyg3ydrm4I+vCF6MqsFBPNPROdWv/m81IwbJzxNAFpjU6FU9s8DcamJ46m9JBilIK
	 w7QFzek47dqBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in
 spi_nor_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: pratyush@kernel.org, "Itai Handler" <itai.handler@gmail.com>, mwalle@kernel.org
Cc: richard@nod.at, miquel.raynal@bootlin.com, takahiro.kuwano@infineon.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com
In-Reply-To: <20260910184452.895485-3-itai.handler@gmail.com>
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 19:02:05 +0000
Message-Id: <20260910190205.D0A311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Releasing the lock before unregistering the MTD device allows =
queued MTD operations to execute on a flash that has been restored to 3-byt=
e mode, corrupting writes and erases.
- [Critical] Unregistering the MTD device does not wait for existing users =
to close their file descriptors, leading to a Use-After-Free of `struct spi=
_nor` on subsequent I/O.
- [High] Missing `spi_nor_unprep()` in the error path of `spi_nor_prep_and_=
lock()` causes permanent hardware resource leaks and deadlocks.
--

commit cca0f80dbf08e34d8606b95f2df252dd1ddf153c
Author: Itai Handler <itai.handler@gmail.com>

mtd: spi-nor: take the flash lock in spi_nor_remove()

spi_nor_remove() restores the addressing mode with the same unlocked
call to spi_nor_restore() that spi_nor_shutdown() used before the
previous patch, and it is exposed the same way. This commit fixes
the issue by taking nor->lock for the restore to prevent unbinds
from running the restore while another thread is in the middle of
an operation.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 96dd6ae6d6191..51128c94d1ce3 100644
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
This is a pre-existing issue, but does spi_nor_prep_and_lock() leak resourc=
es
if interrupted by a signal?

If a user issues an operation using parallel locking (SNOR_F_RWW),
spi_nor_prep_and_lock() acquires resources via spi_nor_prep() and then ente=
rs
wait_event_killable():

drivers/mtd/spi-nor/core.c:spi_nor_prep_and_lock() {
    ...
    ret =3D spi_nor_prep(nor);
    if (ret)
        return ret;

    if (!spi_nor_use_parallel_locking(nor))
        ...
    else
        ret =3D wait_event_killable(nor->rww.wait,
                                  spi_nor_rww_start_exclusive(nor));

    return ret;
}

If a signal interrupts the wait, wait_event_killable() returns -ERESTARTSYS.
The function returns this error immediately without calling spi_nor_unprep(=
),
permanently leaking the acquired controller resources (such as clocks or
power management runtime) and deadlocking the mutex.

> +	if (!ret) {
> +		spi_nor_restore(nor);
> +		spi_nor_unlock_and_unprep(nor);
> +	}
> =20
>  	/* Clean up MTD stuff. */
>  	return mtd_device_unregister(&nor->mtd);

[Severity: Critical]
This is a pre-existing issue, but does dropping the lock before unregisteri=
ng
the MTD device leave a race window where pending operations can wake up and
execute?

A userspace process can queue operations (e.g., via a blocked character
device) while the SPI NOR driver is concurrently unbound. Since the lock is
released here, and mtd_device_unregister() doesn't wait for pending
operations to finish, the queued operations can acquire the lock and execute
before the device is fully torn down.

If this happens, the operations will execute while the driver software expe=
cts
4-byte addressing but the hardware has been restored to 3-byte mode, leading
to corrupted reads and writes.

[Severity: Critical]
This is a pre-existing issue, but does unregistering the MTD device without
waiting for existing users to close their file descriptors lead to a
Use-After-Free of struct spi_nor?

A userspace process can open the MTD device, incrementing its kref. When the
driver is unbound, spi_nor_remove() calls mtd_device_unregister().

As noted in the commit message, del_mtd_device() merely drops a reference
without waiting for active users to close the device.

When spi_nor_remove() returns, devres will immediately free the struct spi_=
nor
memory (which was allocated via devm_kzalloc), but the userspace process may
still issue operations or close the file descriptor, dereferencing the freed
memory.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910184452.8954=
85-1-itai.handler@gmail.com?part=3D2
