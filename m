Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478984;
	b=h4qJq8WB4xaf9xC3scW96U7TBzWtScjRDMphHYNorsJtfxVGQbAuPQIj/+KCXEWE99vr
	 qXHIkQRcz/d3SRt5t197cKC82bOHtmtMLam9OgHq2t+DBrwmF5IchXBzVPHCYZebxgbm6
	 uWZSwbXrEX+zHrQaAk7fUcAhmzh8EA1kkj6WD/gzlv8fP3lSSz+wi2itNp9h4jzhSLnfR
	 8bZ0E4Zjt9Pru2qgmLZrfP+2b4sYHbbo/fz6Iw3C0oSXkfY3tuFh7AXekE8UG/pPYS4mX
	 72hQYxTGnaifF2+rwKPlKkUxvKp0W1OasZoSuMVk/4y0JWcnVZoSEy6M5qufrtw25ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478984;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NrjgqyA6vgHQiLK4KkbdHl8Hwg3brlnXNKkvtFzOs0I=;
	b=bqHvD1nfA3w6AautU5V5RRWzwT2g+hnF9x4E3jwe/jfvy9j+rWD9ag6TXWbJIKEFoin9
	 QARTiw7Lo2Dc8m5Y9qppjPd6RKEsVxHJCgujCo2dMCAGwgQ4i8bJ757XM8JksQu3RHdqr
	 UVcwRDdFk2n8wCdopPxNeo0vkFKwTrWARvAkghjfp5YgQse8qUTSiI9nDzctmjhbqbfwq
	 Lj/hyrqhIJNU4fZMD9lGf2DZcpuWC2BqHjy/lCTDd74H7NhuLdpcxNiP5VxeMlL7ZI00v
	 ji54/ZrP6cSjca/k277A5pdgyCOPsMK9zhSU5/bjdpaePVfCN3LgNo1F0KZoc8Z5L8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6A606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA6C1F000C4;
	Tue, 20 Oct 2026 06:49:42 +0000 (UTC)
Date: Tue, 20 Oct 2026 08:49:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yemingxuan <level_zero@qq.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drivers/base: return bus_add_driver() errors
Message-ID: <2026102057-udder-arrange-c2fc@gregkh>
References: <tencent_454B62AD90C40381288FCAD5C893EC310507@qq.com>
 <tencent_4592542B31D15B00CDA368D5E884674CC805@qq.com>
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
In-Reply-To: <tencent_4592542B31D15B00CDA368D5E884674CC805@qq.com>

On Tue, Oct 20, 2026 at 02:35:42PM +0800, Yemingxuan wrote:
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
> ---
>  drivers/base/bus.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index d17bd91..a63e55c 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -775,25 +775,28 @@ int bus_add_driver(struct device_driver *drv)
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
>  	}
>  
>  	if (!drv->suppress_bind_attrs) {
>  		error = add_bind_files(drv);
>  		if (error) {
> -			/* Ditto */
>  			printk(KERN_ERR "%s: add_bind_files(%s) failed\n",
>  				__func__, drv->name);
> +			goto out_remove_module;
>  		}
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
