Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663E5246788;
	Thu,  8 Oct 2026 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438528; cv=none; b=DfCN7CJmGUAILzH4Hs/46NtnxzedlVEWKrGc/fQWtxfaoDg4oFltTfslOJxz7woGhCXQsjIYCP9eQpzaOZuSEgCBnQxfY09UB+8zoRlCtp+qf2T64+E2PIzd6dXamKEjY3r9o7cZMg6gxY0A8FIacI9pI+p5aN8pnriqMD8h8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438528; c=relaxed/simple;
	bh=UQYmy2isNA91Eu1EVzESe03RFAFjECOdoWuzwaYO7U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/xHwxR13wiDW8HJFqkauvJmTVC1Xe36cg/HaIwdXcj10O/1NdIwKdvqEHdZNIdJMvwr+H7/0kL6/S0aC0cXnA4J0e+O2ou/IJkwaMf11FT3m5TaYY1uRhm3TrmMkQzVxq7gPUgFlvbfftnCAbU1oa4zZDWy5XxT+IPZmaExI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=saJce94a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="saJce94a"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DEF32C6;
	Thu,  8 Oct 2026 07:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791438406;
	bh=UQYmy2isNA91Eu1EVzESe03RFAFjECOdoWuzwaYO7U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=saJce94ai6LH4OkD37Uw8W+dL3vtNYEzXMLtsj7uTSfHSSPI5jKbbSmDUoWh99tN5
	 G/g+9L8iwRww595BDAlIZsFkBfi+Yda0HC8NTZ6r47Q/8aJ/e+GTYNFupMc1zdAS3w
	 rR+TwtXJzUaORct6iZ1yVDZ1anzFtSOQvFAG6qCU=
Date: Thu, 8 Oct 2026 07:48:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: v4l2-subdev: Fix NULL pointer dereference
 in subdev_open()
Message-ID: <20261008054842.GB683793@killaraus.ideasonboard.com>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-2-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008042600.275884-2-nicfio@gmail.com>

On Thu, Oct 08, 2026 at 06:25:59AM +0200, Nicola Fiorillo wrote:
> Unbinding a driver while something opens a /dev/v4l-subdevN node oopses
> the kernel:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000008
>   RIP: 0010:subdev_open+0x8a/0x190 [videodev]
>   Call Trace:
>    v4l2_open+0xa9/0x100 [videodev]
>    chrdev_open+0xb2/0x230
>    do_dentry_open+0x14c/0x440
>    vfs_open+0x2e/0xe0
>    path_openat+0x82e/0x12d0
>    do_filp_open+0xc4/0x170
>    do_sys_openat2+0xae/0xe0
>    __x64_sys_openat+0x55/0xa0
> 
> v4l2_device_unregister_subdev() clears sd->v4l2_dev, then unregisters
> the media entity, which clears sd->entity.graph_obj.mdev, and only then
> unregisters the device node. Drivers that call media_device_unregister()
> before v4l2_device_unregister(), as vimc does, clear
> sd->entity.graph_obj.mdev even earlier, while the sub-device nodes are
> still registered. subdev_open() dereferences both pointers. v4l2_open()
> has checked that the node is registered, but it drops videodev_lock
> before calling fops->open(), so the whole unregistration can run in
> between. Reordering v4l2_device_unregister_subdev() would not help in
> the second case, and checking the two pointers in subdev_open() would
> only narrow the window.
> 
> Neither pointer is needed in subdev_open(). Both record that the
> sub-device is registered, and are cleared on purpose when it goes away,
> while open() runs on behalf of the device node. The node has its own
> pointer to the same v4l2_device, vdev->v4l2_dev, which is set when the
> node is registered and never cleared, and the V4L2 core already relies
> on it for as long as the node exists: v4l2_release() dereferences it on
> every close. The sub-device's entity is registered with
> vdev->v4l2_dev->mdev, so that is also the media device to take the
> module reference through.
> 
> That reference goes through mdev->dev->driver, which the driver core
> clears once the media device's own driver has been unbound, as when
> syzbot unbinds vimc. Read it once with READ_ONCE(), as
> dev_driver_string() does, and fail the open with -ENODEV if it is gone:
> unbinding does not unload the module, so the pointer read is either
> still valid or NULL.
> 
> With this, subdev_open() no longer reads a pointer that the V4L2 core or
> the driver core clears when a driver is unbound. It can still run on a
> sub-device that has just been unregistered, exactly like a file handle
> opened an instant earlier. The lifetime of the sub-device and of the
> media device when a driver goes away with file handles open, and module
> unloading, are a separate, known limitation that this does not address.
> 
> Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, at

We don't develop or test patcheson 6.12.86.

> cycle 7 of a loop unbinding and rebinding a sensor while four processes
> opened every /dev/v4l-subdev*. syzbot hit the second dereference on the
> same line by unbinding vimc, and so does a test in QEMU with KASAN that
> opens vimc's sub-device nodes while vimc is unbound and rebound; with
> this patch the same test shows no oops, KASAN report or warning.
> 
> Reported-by: syzbot+74de6401dbdd377b5746@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=74de6401dbdd377b5746
> Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a07d77e58..c56ca328f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -96,6 +96,7 @@ static int subdev_open(struct file *file)
>  {
>  	struct video_device *vdev = video_devdata(file);
>  	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
> +	struct media_device *mdev = vdev->v4l2_dev->mdev;
>  	struct v4l2_subdev_fh *subdev_fh;
>  	int ret;
>  
> @@ -112,10 +113,17 @@ static int subdev_open(struct file *file)
>  	v4l2_fh_init(&subdev_fh->vfh, vdev);
>  	v4l2_fh_add(&subdev_fh->vfh, file);
>  
> -	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
> +	if (mdev && mdev->dev) {
> +		struct device_driver *drv = READ_ONCE(mdev->dev->driver);
>  		struct module *owner;
>  
> -		owner = sd->entity.graph_obj.mdev->dev->driver->owner;
> +		/* The media device's driver has been unbound meanwhile. */
> +		if (!drv) {
> +			ret = -ENODEV;
> +			goto err;
> +		}
> +
> +		owner = drv->owner;

All of this is a hack that may reduce a race window but it doesn't fix
the problem.

>  		if (!try_module_get(owner)) {
>  			ret = -EBUSY;
>  			goto err;

-- 
Regards,

Laurent Pinchart
