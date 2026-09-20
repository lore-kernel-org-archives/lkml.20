Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478129ACFD
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931030; cv=none; b=t+UNt4KILrO9tiMajV+2+qGohOjBe8sWQosvQ7USU+ezD4/zglYsRNOphl5J4Mx/qqUD78b1ZVJWI6TKCXbaIpAvklwQDtqu+oesxMkbRhyc8BMIFdWVRIdDlRFhwGnH/MpMg7c+4/0FvbjBZ5Uy/SnH27euqVOw4GvPMbKvF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931030; c=relaxed/simple;
	bh=vfbtDo24wCZuiAXww/y71uSm3rOaGAK52lhHnOJf4hs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LhANwRK/SrzygmJdk3n6yt7hv71Z5Cokk7WCE2jhux7WQ0lNyHUu0Tv35B0rWmpBfJvUjyHYr5gQDXMyGJpS7lpEdzEVuwYjEOaU+/h4gRGMh33fiXTpICHEd/ASAYzxb/07cUS35UrV5j7nHk17pEQpNJxNrdNbNPr39JsBC7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETvVvOkY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETvVvOkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D3B1F000FF;
	Sun, 20 Sep 2026 19:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789931029;
	bh=uctREekJWe2tktIr51UN2v2iX/QbiRDqbdXt9T790Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ETvVvOkYral8ovAAwmT4vAbJd6JYEYV6Z9HLDw/lKsOINOvQChdECow0Cu3ESNnbM
	 nkV8Rz5CCTlKXopFOPP54olYlEPqd9N0+IWJooL3nd0UpgebvaiRrU8HEgFQ6+fqUg
	 XqYbm5UvSE9ee3tAPShA7P6C9PtTJcOj4qIM0xM1qdmEVKggARmL9FMO/19YeesCK5
	 Vyheyv+/NDqPwNd7KxzkK0R1J763t0UwR5hMYjb1zJy1X7UpV7E4hmuidgN8KGIpD9
	 tNyK7hUkAiHLqo7hqcEkRNWhOBt402eqVf1MPYz9DsRk/WZSHmTSAsTTIHFFZ9PMD+
	 kbcXDqY90+/8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mtd: block2mtd: defer device open out of param/sysfs
 write
Reply-To: sashiko-reviews@lists.linux.dev
To: miquel.raynal@bootlin.com, richard@nod.at, "Chris Roy" <iam@thechris.in>, vigneshr@ti.com
Cc: syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, joern@barelysecure.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
In-Reply-To: <20260920185132.1266699-1-iam@thechris.in>
References: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
 <20260920185132.1266699-1-iam@thechris.in>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:03:48 +0000
Message-Id: <20260920190348.B4D3B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mtd: block2mtd: use-after-free and resource leak on init failure
- [High] mtd: block2mtd: sysfs lock inversion bypasses workqueue deferral
--

commit c3f3ebd86ecc63dd07e6a22d8527eadaeb761633
Author: Chris Roy <iam@thechris.in>

mtd: block2mtd: defer device open out of param/sysfs write

This patch defers block2mtd_setup() device opening to a dedicated ordered
workqueue to prevent lockdep-detected lock inversion between VFS and
kernfs/overlayfs during sysfs writes. The setup work is executed via a
dynamically allocated work item, preserving synchronous behavior with
wait_for_completion().

Closes: https://syzkaller.appspot.com/bug?extid=3D7cab6a19619f1b8efc00

> diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2=
mtd.c
> index 349fa07be314c..30ac9325bdd2b 100644
> --- a/drivers/mtd/devices/block2mtd.c
> +++ b/drivers/mtd/devices/block2mtd.c
[ ... ]
> @@ -461,31 +466,85 @@ static int block2mtd_setup2(const char *val)
[ ... ]
>  static int block2mtd_setup(const char *val, const struct kernel_param *k=
p)
>  {
[ ... ]
> +	if (setup_wq) {
> +		ret =3D block2mtd_setup_defer(val);
> +	} else {
> +		/* Not yet deferred to setup_wq; safe to call setup2 directly */
> +		mutex_lock(&list_mutex);
> +		ret =3D block2mtd_setup2(val);
> +		mutex_unlock(&list_mutex);
> +	}

[Severity: High]
Does evaluating setup_wq here bypass the workqueue deferral and re-introduce
the sysfs lock inversion?

Since mod_sysfs_setup() exposes module parameters to sysfs before
do_init_module() calls block2mtd_init(), setup_wq can be NULL during a
concurrent sysfs write.

This would cause the sysfs writer to execute block2mtd_setup2() inline under
the sysfs kernfs lock.

Additionally, since setup_wq is assigned in block2mtd_init() without memory
barriers (such as smp_store_release() and smp_load_acquire()), concurrent
sysfs writers might observe a stale NULL pointer even after initialization
completes.

> +
> +	kernel_param_lock(kp->mod);
> +	module_put(kp->mod);
> +	return ret;
>  }
> =20
> =20
> @@ -496,10 +555,17 @@ static int __init block2mtd_init(void)
>  {
>  	int ret =3D 0;
> =20
> +	setup_wq =3D alloc_ordered_workqueue("block2mtd", 0);
> +	if (!setup_wq)
> +		return -ENOMEM;

[Severity: High]
Can returning -ENOMEM here lead to a use-after-free and resource leak?

If parameters are provided during module load
(e.g., insmod block2mtd.ko block2mtd=3D...), block2mtd_setup() is executed
before block2mtd_init(). Because setup_wq is NULL at that time, it
synchronously registers the MTD device in the block2mtd_setup() else branch
shown above.

If alloc_ordered_workqueue() subsequently fails here, it returns -ENOMEM and
aborts the module load.

The kernel frees the module memory without calling block2mtd_exit(), leaving
the registered MTD device holding dangling function pointers to the unloaded
module text.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920185132.1266=
699-1-iam@thechris.in?part=3D1
