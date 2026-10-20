Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476856;
	b=LjHj01zVvWYX8brKILBx4BhpOlHpcaX2WjoKdfQGjlQdBrcwKcxK/sX/VgqgPkJmI4nk
	 n+F1VQJZnu4EA5x9BCBKyQxBuQKSGHUjvosMvlXUOQfhtARRnSGanlPRKtiR8Qnlpx74U
	 IxKOM6aZfxh7a1AU2wt/+t+p3HYCZa7wd6n5U9hjx1Hto+oJre61uQqAcya4J9XUc8b1/
	 inr+t7vSNr7dFCv9ZpV4QhgFUWwReWazHUG8UDgTvgpNf/S+I2KfnpHWorQbfCtqOhxOs
	 Ddxo8aUX3S5Odxh5reYdabwTqFg2rE1J6X3UlvXOarywzyis0p2gH6dL7Hv9VYmNHWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476856;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Pe8niGVPBJJMWKf52o3UEdkziwiRyy+zgVyIY2WXm2E=;
	b=GEWZDS/CVwjtbSdHLeIx9YMedn881w3rPRHgKyLaYpxo44ISkz86847kHYdcdZ1w49zm
	 KzIwlaKU6gyFQbxOATBTjYwTDJ2IjVNjBZcsQP5/BZYrPFBmkLNssx4JpxzO1EIi1ty+a
	 NxfZ5Kl1ZKqXmA4kYEUvSUl4blz8lowDraCLEabXdpvn9E3gUYoKawYIG1x33tsQaBrtM
	 dKjkfZz9ei+M/DFq1YlKpmZNhnjLeSQcOiySB+rKBZXnEWLm3TkWUATsR6lyAFgYO22uG
	 ELk8ttHQ+C33cs72e1C2LLFiAJllSeDU++y0oZsriXNeXFkdwZ6rYP9LIGBCyAdtXCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mDLSz24r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B54606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mDLSz24r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753F81F000C4;
	Tue, 20 Oct 2026 06:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792476855;
	bh=Pe8niGVPBJJMWKf52o3UEdkziwiRyy+zgVyIY2WXm2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mDLSz24rO3cf4bFtl42jH3arXZYXcZdtQDuqeQi8XxqV+ANIOEPlDv9x+KtHo/7tw
	 tFVcDs3k6PmJdWf0wKf9am1u0WWf9gLFnuBihiMHii5Q8nek2wlOmV4bHHAjzBhLxP
	 YfjRi12AHcXpC8asRIrWqOYJISiLmjQsHeAjUxak=
Date: Tue, 20 Oct 2026 08:13:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: level0000x <level_zero@qq.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/base: return bus_add_driver() errors
Message-ID: <2026102043-ajar-sauciness-f8a9@gregkh>
References: <tencent_454B62AD90C40381288FCAD5C893EC310507@qq.com>
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
In-Reply-To: <tencent_454B62AD90C40381288FCAD5C893EC310507@qq.com>

On Tue, Oct 20, 2026 at 11:09:34AM +0800, level0000x wrote:
> bus_add_driver() creates the driver's uevent attribute, adds the bus
> driver groups and the bind/unbind files.  When any of these fail it
> only prints a message and still returns 0, leaving the driver on the
> bus while the sysfs files user space needs to manage it are silently
> missing: bind/unbind cannot be used and the uevent attribute cannot be
> triggered.  Nothing retries and the caller is told the registration
> succeeded.
> 
> The device side of the same driver model already gets this right.
> device_add() returns failures of the equivalent sysfs operations to
> its caller and device_del() undoes each one, and driver_register()
> already calls bus_remove_driver() when the group registration after
> bus_add_driver() fails.  Commit 85d2b0aa1703 ("module: don't ignore
> sysfs_create_link() failures") made the same change to
> module_add_driver() a few lines above, so the driver side is now the
> only place in this function where a sysfs failure is discarded.
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
> These failures are not expected on a working system: driver_ktype
> always supplies sysfs_ops, so -EINVAL is unreachable, -EEXIST needs a
> bus group to collide with built-in attributes, and -ENOMEM needs
> memory pressure.  The point is not a user-visible bug but keeping the
> failure diagnosable and the resulting state consistent with the device
> side.
> 
> Signed-off-by: level0000x <level_zero@qq.com>
> ---
>  drivers/base/bus.c | 27 +++++++++++----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index d17bd91..e5c8a12 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -772,28 +772,23 @@ int bus_add_driver(struct device_driver *drv)
>  	}
>  
>  	error = driver_create_file(drv, &driver_attr_uevent);
> -	if (error) {
> -		printk(KERN_ERR "%s: uevent attr (%s) failed\n",
> -			__func__, drv->name);
> -	}
> +	if (error)
> +		goto out_remove_module;
> +
>  	error = driver_add_groups(drv, sp->bus->drv_groups);
> -	if (error) {
> -		/* How the hell do we get out of this pickle? Give up */
> -		printk(KERN_ERR "%s: driver_add_groups(%s) failed\n",
> -			__func__, drv->name);
> -	}
> +	if (error)
> +		goto out_remove_module;
>  
>  	if (!drv->suppress_bind_attrs) {
>  		error = add_bind_files(drv);
> -		if (error) {
> -			/* Ditto */
> -			printk(KERN_ERR "%s: add_bind_files(%s) failed\n",
> -				__func__, drv->name);
> -		}
> +		if (error)
> +			goto out_remove_module;
>  	}
>  
>  	return 0;
>  
> +out_remove_module:
> +	module_remove_driver(drv);
>  out_detach:
>  	driver_detach(drv);
>  out_del_list:
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
