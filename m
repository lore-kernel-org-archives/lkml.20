Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E43BB134
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532163; cv=none; b=oPE24mDBpYyv2cIT0tH5uuSt7F3pyEVIau6ZtkQRg0KaCee8/4OA/aGkQlOg57aK7uBYxASstASkprtvPP/YOzZYc0O4gyW+Si5QagcpYKJxrkUb5XN/lsC4enhoePH2YZl03WdxKw/qveXbTeq3XVYSD4T+1pj/9G4IP0x6mWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532163; c=relaxed/simple;
	bh=eOscvcFLA+ncGbqcj9JJdwt4ElKTOfZZnLuXta/yGUM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=I2TElUbGOx1xIA1NkcFWY9zKOc+bJEf+FwjoqZAfYLIDAGdu0+esEJ/RQ6BIs8KB7hk6IE23tsANew5gvCFj6TheTya9oFhsoJS/Qf03vOU8J02BacYowKoCI6TN/3ad9ztxnKchXq3xILc7FyXh8o49aDj5tkRXj7Yt5zCThh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7ZIYEbu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7ZIYEbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A14F1F000FF;
	Fri,  9 Oct 2026 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791532162;
	bh=bx0fg+1kNBZey9Zjx5vHxNflVoYLmmBAZ6Ssi+XdEN8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=I7ZIYEbun2HbR+kYBa0d/d9aKZ8zXKsbVXMRb5gRhu8pkE0UcBWwfgYCC/S57exS4
	 3iy0Gx9BE5ckNUMzW35UrzrIBCTQ30pO4qB6Ionh/PCdW9H4DSX/UosM8fFVoMZW+n
	 7NBra4brYHH1jcwlkJr3lgenSk41fCqARJIiaDc6vDK9aQsVtk5zmyKnqT7lqQS155
	 AbB4SkVNxG+bbPw5qjJp2qfLvkgWFzJpimkqcjQ6Ey/EmGIvzzGJt/uta3BdvcB338
	 EiV153yhOk/puFXC78gsZjFW+DU69j0FWs/HjPIb6AOlOjUEdxsA5+0Daezjt3bo7z
	 mBJHOjkrqlEaA==
Message-ID: <sashiko-outbox-165038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mtd: core: add release hook and removed flag for
 unbind with open handles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Walle" <mwalle@kernel.org>, linux-kernel@vger.kernel.org, "Pratyush
 Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org, tze.yee.ng@altera.com
In-Reply-To: <e4312228d241860b3e3238864d12aae47b721db1.1791512623.git.tze.yee.ng@altera.com>
References: <cover.1791512623.git.tze.yee.ng@altera.com>
 <e4312228d241860b3e3238864d12aae47b721db1.1791512623.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:49:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] mtd: Device Model lifecycle violation causing sysfs Use-After-=
Free
- [High] mtd: Use-After-Free of master object in __put_mtd_device()
- [High] mtd: Master driver object memory leak when CONFIG_MTD_PARTITIONED_=
MASTER is disabled
- [High] mtd: lockless TOCTOU race on master->removed allows UAF on unbind
--

commit 5c236b852da3e75f7d2ec6f13275ac5b432bb26f
Author: Tze Yee Ng <tze.yee.ng@altera.com>

    mtd: core: add release hook and removed flag for unbind with open handl=
es

This commit introduces a new _free hook to struct mtd_info called from the
kref release function to ensure the backing driver object is destroyed only
when the last reference drops. It also adds a removed flag to struct mtd_in=
fo
which is set on unbind and checked before performing hardware operations to
prevent Use-After-Free of parent devm resources.

> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 491a27d0315fa..59133894b5e5c 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -118,6 +118,7 @@ static void mtd_device_release(struct kref *kref)
>  {
>  	struct mtd_info *mtd =3D container_of(kref, struct mtd_info, refcnt);
>  	bool is_partition =3D mtd_is_partition(mtd);
> +	void (*mtd_free)(struct mtd_info *mtd) =3D mtd->_free;
> =20
>  	debugfs_remove_recursive(mtd->dbg.dfs_dir);
> =20
> @@ -135,6 +136,9 @@ static void mtd_device_release(struct kref *kref)
>  		memset(&mtd->dev, 0, sizeof(mtd->dev));
> =20
>  	module_put(THIS_MODULE);
> +
> +	if (mtd_free)
> +		mtd_free(mtd);

[Severity: Critical]
Since struct mtd_info embeds a struct device, does freeing it here violate =
the
Device Model lifecycle?

If user-space holds an open sysfs file for the device, the device core reta=
ins
an elevated kobject reference count on mtd->dev even after device_unregiste=
r()
returns.

If mtd_free() destroys the memory containing the embedded struct device, wo=
n't
the device core access freed memory when put_device() is eventually called =
upon
sysfs file closure?


[Severity: High]
Does this new mtd_free() hook cause a Use-After-Free in __put_mtd_device()?

Looking at __put_mtd_device() in drivers/mtd/mtdcore.c, we have:

	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
		kref_put(&master->refcnt, mtd_device_release);

	module_put(master->owner);

	/* must be the last as master can be freed in the _put_device */
	if (master->_put_device)
		master->_put_device(master);

If mtd_device_release() synchronously frees the master object, won't the
subsequent dereferences of master->owner and master->_put_device access
freed memory?


[Severity: High]
Will the master driver object leak if CONFIG_MTD_PARTITIONED_MASTER is disa=
bled?

When CONFIG_MTD_PARTITIONED_MASTER is disabled, the master device itself is
never registered via add_mtd_device(), so its refcount isn't incremented by
openers or managed by __get_mtd_device() or __put_mtd_device().

If drivers no longer free their objects in the remove() callback and rely
entirely on mtd_device_release(), how will the master driver object be freed
when CONFIG_MTD_PARTITIONED_MASTER is disabled?

>  }
> =20
>  #define MTD_DEVICE_ATTR_RO(name) \

[ ... ]

> @@ -1471,6 +1478,9 @@ int mtd_erase(struct mtd_info *mtd, struct erase_in=
fo *instr)
>  	instr->fail_addr =3D MTD_FAIL_ADDR_UNKNOWN;
>  	adjinstr =3D *instr;
> =20
> +	if (master->removed)
> +		return -ENODEV;
> +

[Severity: High]
Is this lockless check sufficient to prevent the Use-After-Free this patch
aims to solve?

If mtd_erase() checks master->removed and it evaluates to false, the thread
could be preempted.

If a concurrent driver unbind executes the driver's remove() callback,
drains in-flight operations, sets master->removed =3D true, and then the de=
vice
model tears down devm-managed resources, wouldn't the preempted MTD thread
resume and call master->_erase() on freed devm memory and a powered-down bu=
s?

>  	if (!mtd->erasesize || !master->_erase)
>  		return -ENOTSUPP;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791512623.gi=
t.tze.yee.ng@altera.com?part=3D1
