Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478942;
	b=NzH8Y0tZzh9rMkQALbeGpEOik/YGRDjKHSOV5uCgEuqKiJ1oIwW1b4eFmknUlw3R99+h
	 D29vHALC72kJaNulmVA8LQWff84nQ1y9nEzhUuJZxVboTtG70mBP9ReZcI6bAwbyNtsd4
	 ehFWU5U4F1CI+uecp1nG0JNZAsu77Moh0d9hH0p1flJwZvhxDH2LyTI1NxMrCHSaxrrIL
	 6WEE10F9MA3TVVv+ldmdnFwMTmVdDD1+ati+xJiMvR5Bl/DA3vgL5SdRk1I8g5+VeAggk
	 IxWJNBNtswQG1ftzPbhpwJvFCetq6OFwHY1hsYjfYwQjArFwpbWkVTzlOJ5u2P49+eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478942;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Cd2xjAJcvLodQXIsxE1NlllAfYcKe/ozOJbjOaiwSfU=;
	b=i4Sh2fRaIMKsg1VKaYJX0QX+1hov3PS2WLck+DRYG4pKHuRtJRNr2dGVQV5HO36rF7n0
	 GtPYvIB3w7QnOa5X2xImVlJV51xq2SYq+clXp+7cxUlRNk1oQGBQ0bc8cv6YPvqdI/a/e
	 23C+lRRwVx/nxQ1zYJG/3P26uM37Pou7nbGWcceZAedopxMDeBhk2rzAsJFlMLliQ8gPX
	 yIVGrqYhZAgf6e6cJuBtKxl6TjAuOwrmzwBH4P60nFKr3VxBJBRJFl+pWEM9cXr0z5HUB
	 QD7DGB3yWaCGbZ0Dslmd63Iqbkqc0Z8ot5hC7ZqlcULNCuWABc5ThX8muzPwQGlXRBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433891F000C4;
	Tue, 20 Oct 2026 06:49:00 +0000 (UTC)
Date: Tue, 20 Oct 2026 08:48:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yemingxuan <level_zero@qq.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drivers/base: return bus_add_driver() errors
Message-ID: <2026102017-irate-stalling-aba6@gregkh>
References: <tencent_82888DC1594A685D25620A7078BCAEB69D0A@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_82888DC1594A685D25620A7078BCAEB69D0A@qq.com>

On Tue, Oct 20, 2026 at 02:31:06PM +0800, Yemingxuan wrote:
> bus_add_driver() creates the driver's uevent attribute, adds the bus
> driver groups and the bind/unbind files after the driver has already
> been inserted into the bus and its module links have been made.  When
> any of these fail it logs the failure and still returns 0.
> 
> The driver is then registered but incomplete: a driver without
> bind/unbind cannot be bound or unbound from userspace, and a driver
> without its uevent attribute can no longer emit uevent notifications.
> driver_register() reports success, so neither the driver's init routine
> nor its caller retries, and nothing else ever creates the missing
> files.
> 
> The device side of the same driver model already treats the equivalent
> steps this way: device_add() returns failures of the equivalent sysfs
> operations to its caller, and device_del() undoes each one.
> driver_register() already calls bus_remove_driver() when the group
> registration after bus_add_driver() fails, and that branch is only
> unreachable for failures inside bus_add_driver() because of the
> unconditional successful return.
> 
> Propagate the errors so the existing unwind runs.  The new
> out_remove_module label calls module_remove_driver() before falling
> through to out_detach: bus_remove_driver() pairs every operation
> bus_add_driver() performs in reverse order, but the symlinks
> module_add_driver() creates live in the module's sysfs directory, not
> under drv->p->kobj, so the kobject teardown does not remove them.
> The attribute and the groups need no explicit removal because they live
> under drv->p->kobj, and kobject_cleanup() drops the sysfs directory for
> the caller.
> 
> The error messages are kept.  The return value of an initcall is not
> printed by the initcall machinery, so dropping them would turn a
> reported failure into a silent one.
> 
> These failures are not expected on a working system: driver_ktype
> always supplies sysfs_ops, so -EINVAL is unreachable, no in-tree bus
> defines a drv_group that collides with the built-in uevent, bind or
> unbind attributes, and -ENOMEM needs memory pressure.  The point is not
> a user-visible bug but keeping the driver model consistent with the
> device side and leaving the failure reported.
> 
> Signed-off-by: Yemingxuan <level_zero@qq.com>

Full name?

> ---
>  drivers/base/bus.c | 26 +
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> --- a/drivers/base/bus.c	2026-10-20 14:29:46.248067968 +0800
> +++ b/drivers/base/bus.c	2026-10-20 14:29:46.266034395 +0800
> @@ -775,25 +775,28 @@
>  	if (error) {
>  		printk(KERN_ERR "%s: uevent attr (%s) failed\n",
>  			__func__, drv->name);
> +		goto out_remove_module;
>  	}
>  	error = driver_add_groups(drv, sp->bus->drv_groups);
>  	if (error) {
> -		/* How the hell do we get out of this pickle? Give up */
>  		printk(KERN_ERR "%s: driver_add_groups(%s) failed\n",
>  			__func__, drv->name);
> +		goto out_remove_module;

Are you sure that this is going to work properly?  How was this tested?
That comment is a good indication that no one will hit this, so why even
worry about any of this?

thanks,

greg k-h
