Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7D649890A;
	Thu,  1 Oct 2026 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856550; cv=none; b=o8wPJDZNqTfYRtzG5KZxvEGH2FmlF9YDKxRs4LyCcObyP7xDw4Tx8e+VbJok34vIy3ByxJ4U2na295XnnTW/mxajk5nT9Y56WhKlHk9tcfhYLZSH81dGp5WORfQjQJoebjHyvKdJa0nh45/XkXhnufOSO5SLx78q+Tw1j1PQV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856550; c=relaxed/simple;
	bh=w4g8SezvbiFS3UHJOThxm7I98kIx4gBk9Iv1qFWZMEE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aHlMrRLw/GcpiA8qc0gZppi9lYtHO0vSthuUVRTBi5wFm5OpZ0YGhK4XFNoFt0JLYL5DFUa4rACNOtpGVp9NyAjvNQFdvsKfrMfB1OWJwtv+FPEj8iX3mXTRiB7OaWAf9g7Wdd/HxUWT4Fwri+tOPHW9gIjnF69V/B9OtnKMgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KHO0Y1Or; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KHO0Y1Or"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:75b7:7bc3:5d5e:18e])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 781BE593;
	Thu,  1 Oct 2026 14:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790856423;
	bh=w4g8SezvbiFS3UHJOThxm7I98kIx4gBk9Iv1qFWZMEE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KHO0Y1OrBukmr63Z2jShcMjKEAGqnGTjbjFQinbc+8P2nX2q1apyYahbA2OP/uS5m
	 KpkV8zMfdLIJZCOyuRgBHJsWVvl5QBqtL7hw2ImwZg8T05bu5kzzGNwgZpxzhzGuwB
	 9o+xTbCQWzZdyG5IXbxUJAaPmYKZO5XUoXwcfC4w=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260810162406.118981-2-A.Nasrolahi01@gmail.com>
References: <20260810162406.118981-2-A.Nasrolahi01@gmail.com>
Subject: Re: [PATCH] media: v4l2-core: make number of video devices configurable
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com, Frank.Li@nxp.com, hverkuil+cisco@kernel.org, guoniu.zhou@oss.nxp.com, Ali Nasrollahi <A.Nasrolahi01@gmail.com>
To: Ali Nasrollahi <a.nasrolahi01@gmail.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 01 Oct 2026 21:08:50 +0900
Message-ID: <179085653047.2882041.14718244537270943651@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Ali Nasrollahi (2026-08-11 01:24:07)
> The V4L2 core currently limits the number of registered video devices to
> 256. This can become a restriction for workloads that create a large
> number of virtual video devices, such as v4l2loopback instances.
>=20
> Make the maximum number of video devices configurable through a module
> parameter. The default and minimum remain at the existing limit of 256,
> while the maximum is capped at 4096.
>=20
> The parameter is only available when CONFIG_VIDEO_FIXED_MINOR_RANGES is
> disabled, as the fixed minor allocation scheme relies on the existing
> minor ranges.
>=20
> The device array is allocated according to the configured limit, while
> the allocation bitmaps remain statically sized to the maximum supported
> limit of 4096.
>=20
> Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>

Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 70 +++++++++++++++++++++++-------
>  1 file changed, 55 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core=
/v4l2-dev.c
> index fd267fb74905..5a526b577970 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -31,7 +31,8 @@
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
> =20
> -#define VIDEO_NUM_DEVICES      256
> +#define VIDEO_MIN_NUM_DEVICES  256
> +#define VIDEO_MAX_NUM_DEVICES  4096
>  #define VIDEO_NAME              "video4linux"
> =20
>  #define dprintk(fmt, arg...) do {                                      \
> @@ -39,6 +40,27 @@
>                        __func__, ##arg);                                \
>  } while (0)
> =20
> +static unsigned int video_nr_devices =3D VIDEO_MIN_NUM_DEVICES;
> +
> +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +static int param_set_video_nr_devices(const char *val,
> +                                     const struct kernel_param *kp)
> +{
> +       return param_set_uint_minmax(val, kp, VIDEO_MIN_NUM_DEVICES,
> +                                    VIDEO_MAX_NUM_DEVICES);
> +}
> +
> +static const struct kernel_param_ops param_ops_video_nr_devices =3D {
> +       .set =3D param_set_video_nr_devices,
> +       .get =3D param_get_uint,
> +};
> +
> +module_param_cb(video_nr_devices, &param_ops_video_nr_devices,
> +               &video_nr_devices, 0444);
> +
> +MODULE_PARM_DESC(video_nr_devices, "Maximum number of V4L2 devices (256-=
4096)");
> +#endif
> +
>  /*
>   *     sysfs stuff
>   */
> @@ -98,9 +120,14 @@ static struct dentry *v4l2_debugfs_root_dir;
>  /*
>   *     Active devices
>   */
> -static struct video_device *video_devices[VIDEO_NUM_DEVICES];
> +#ifdef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +static struct video_device *video_devices[VIDEO_MIN_NUM_DEVICES];
> +static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MIN_NUM_DEVICES);
> +#else
> +static struct video_device **video_devices;
> +static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MAX_NUM_DEVICES);
> +#endif
>  static DEFINE_MUTEX(videodev_lock);
> -static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_NUM_DEVICES);
> =20
>  /* Device node utility functions */
> =20
> @@ -504,7 +531,7 @@ static const struct file_operations v4l2_fops =3D {
>   * in the video_device array, but it was able to obtain a minor number.
>   *
>   * This means that we can always obtain a free stream index number since
> - * the worst case scenario is that there are VIDEO_NUM_DEVICES - 1 slots=
 in
> + * the worst case scenario is that there are video_nr_devices - 1 slots =
in
>   * use of the video_device array.
>   *
>   * Returns a free index number.
> @@ -513,19 +540,19 @@ static int get_index(struct video_device *vdev)
>  {
>         /* This can be static since this function is called with the glob=
al
>            videodev_lock held. */
> -       static DECLARE_BITMAP(used, VIDEO_NUM_DEVICES);
> +       static DECLARE_BITMAP(used, VIDEO_MAX_NUM_DEVICES);
>         int i;
> =20
> -       bitmap_zero(used, VIDEO_NUM_DEVICES);
> +       bitmap_zero(used, VIDEO_MAX_NUM_DEVICES);
> =20
> -       for (i =3D 0; i < VIDEO_NUM_DEVICES; i++) {
> +       for (i =3D 0; i < video_nr_devices; i++) {
>                 if (video_devices[i] !=3D NULL &&
>                     video_devices[i]->v4l2_dev =3D=3D vdev->v4l2_dev) {
>                         __set_bit(video_devices[i]->index, used);
>                 }
>         }
> =20
> -       return find_first_zero_bit(used, VIDEO_NUM_DEVICES);
> +       return find_first_zero_bit(used, video_nr_devices);
>  }
> =20
>  #define SET_VALID_IOCTL(ops, cmd, op) \
> @@ -915,7 +942,7 @@ int __video_register_device(struct video_device *vdev,
>         int i =3D 0;
>         int ret;
>         int minor_offset =3D 0;
> -       int minor_cnt =3D VIDEO_NUM_DEVICES;
> +       int minor_cnt =3D video_nr_devices;
>         const char *name_base;
> =20
>         /* A minor value of -1 marks this video device as never
> @@ -1020,10 +1047,10 @@ int __video_register_device(struct video_device *=
vdev,
>  #else
>         /* The device node number and minor numbers are independent, so
>            we just find the first free minor number. */
> -       for (i =3D 0; i < VIDEO_NUM_DEVICES; i++)
> +       for (i =3D 0; i < video_nr_devices; i++)
>                 if (video_devices[i] =3D=3D NULL)
>                         break;
> -       if (i =3D=3D VIDEO_NUM_DEVICES) {
> +       if (i =3D=3D video_nr_devices) {
>                 mutex_unlock(&videodev_lock);
>                 pr_err("could not get a free minor\n");
>                 return -ENFILE;
> @@ -1032,7 +1059,7 @@ int __video_register_device(struct video_device *vd=
ev,
>         vdev->minor =3D i + minor_offset;
>         vdev->num =3D nr;
> =20
> -       if (WARN_ON(vdev->minor >=3D VIDEO_NUM_DEVICES)) {
> +       if (WARN_ON(vdev->minor >=3D video_nr_devices)) {
>                 mutex_unlock(&videodev_lock);
>                 return -EINVAL;
>         }
> @@ -1241,7 +1268,7 @@ static int __init videodev_init(void)
>         int ret;
> =20
>         pr_info("Linux video capture interface: v2.00\n");
> -       ret =3D register_chrdev_region(dev, VIDEO_NUM_DEVICES, VIDEO_NAME=
);
> +       ret =3D register_chrdev_region(dev, video_nr_devices, VIDEO_NAME);
>         if (ret < 0) {
>                 pr_warn("videodev: unable to get major %d\n",
>                                 VIDEO_MAJOR);
> @@ -1250,11 +1277,21 @@ static int __init videodev_init(void)
> =20
>         ret =3D class_register(&video_class);
>         if (ret < 0) {
> -               unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
> +               unregister_chrdev_region(dev, video_nr_devices);
>                 pr_warn("video_dev: class_register failed\n");
>                 return -EIO;
>         }
> =20
> +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +       video_devices =3D kzalloc_objs(*video_devices, video_nr_devices);
> +       if (!video_devices) {
> +               class_unregister(&video_class);
> +               unregister_chrdev_region(dev, video_nr_devices);
> +               pr_warn("video_dev: failed to allocate video_devices\n");
> +               return -ENOMEM;
> +       }
> +#endif
> +
>         return 0;
>  }
> =20
> @@ -1262,8 +1299,11 @@ static void __exit videodev_exit(void)
>  {
>         dev_t dev =3D MKDEV(VIDEO_MAJOR, 0);
> =20
> +#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
> +       kvfree(video_devices);
> +#endif
>         class_unregister(&video_class);
> -       unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
> +       unregister_chrdev_region(dev, video_nr_devices);
>         debugfs_remove_recursive(v4l2_debugfs_root_dir);
>         v4l2_debugfs_root_dir =3D NULL;
>  }
> --=20
> 2.55.0
>=20
>
