Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016858;
	b=1A0aN0ApeSrA+3bYkYJcefWxZEckMITFClQdcY8NPj3L8D7EuXt/J2vYZgyBhjuSlcWe
	 vaJwFcppbxrpc71f6+w6OZyZlDyK7auMyrZz0JDHvd+QfeynWgjKVhpIgEIrjM1hU54gP
	 NrCyNUll1wnH48x4TR/QFbGEEBcwLKX7v6Kch+Bg6b4Yo6BY7KEDcMuAxBFfxcVqTh6NP
	 Sfh+xYXPIRCBvKO3DjxwRJNDFw52Te2OolMTKHxqmIMVEbeTqCOqh1Ev5pELKCkVGV5na
	 mtvLz39XC41kp97pwG2YDHR1z1l+FNFnc99Kn/bEO4H0PSRfmKmSlXHGa7pALQVTaGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016858;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VfkFMg7lN1Y1FIMRAMt9+6vwJVysrowoa3EWgGjm5B4=;
	b=2Z6PdvsUj3/h2NayQO5P2Q4/A74Kutv6dfWnu0ZVtyTiO7nP3RyPZFaZgRXYlNGm+++1
	 FGNzg5RW809/gKiiBoNua9wtB9oVk25e7wq7z37Bijd7EzzgxyQpXGoJMYxR7RfS2BN/Z
	 qfQulBuNaImEAxzbIV35IuXNk0fhmcIvYXtpaE7tez1xklCcJcoLCu1iI51qr+4AFL5d7
	 yupdUT3UlatCoj52DFEATw1HqHLXCdE49Hekc8iY3VTrK0AGYiCXl0NFxuqKQzd2FHi4h
	 US6O6mTrsL7skCrKdnaNKD6LdaTZlMAG822Jbqxe/QJlp3O9Se8Q75kSooEcwh+tjvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sNLaF6cD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3879606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sNLaF6cD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5DD1F01825;
	Mon, 26 Oct 2026 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793016857;
	bh=VfkFMg7lN1Y1FIMRAMt9+6vwJVysrowoa3EWgGjm5B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sNLaF6cDcuRtRmvivvrPrBVNXE2rwyt6EWfgY+3bSUeqSQ4KT43hMSXCYPzFi4wPq
	 cAYoZQiRpGmxzxonASRWDmdP3PLlOjrSU8Y2ZiOZB7nlGuV4aXs+UlSkzqpEHPOcXv
	 yJ6g3uzSPFvWUHWfSoRlFj/ma3s0TUT+oGW5Wt4A=
Date: Mon, 26 Oct 2026 13:14:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <Akshay.Gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de,
	naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
	Prathima L K <Prathima.Lk@amd.com>
Subject: Re: [PATCH v1] misc: amd-sbi: Fix use-after-free on driver unbind
Message-ID: <2026102651-prideful-finance-b60a@gregkh>
References: <20261026113910.1003008-1-Akshay.Gupta@amd.com>
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
In-Reply-To: <20261026113910.1003008-1-Akshay.Gupta@amd.com>

On Mon, Oct 26, 2026 at 05:09:10PM +0530, Akshay Gupta wrote:
> From: Prathima L K <Prathima.Lk@amd.com>
> 
> sbrmi_data was allocated with devm_kzalloc() and freed at unbind while
> an open /dev/sbrmi-* fd could still reference it, leading to a
> use-after-free on ioctl after removal.
> 
> Refcount sbrmi_data with a kref: take a reference in open(), drop it in
> release(), and free the structure only when the last fd closes. Mark the
> device 'detached' under lock when the misc device is deregistered so all
> ioctl/xfer paths return -ENODEV. Move misc deregistration to a devm
> action and drop the now-unneeded i2c/i3c ".remove" callbacks.
> 
> Fixes: 35ac2034db72bbbc73609aab5f05ff6e0d38fdd0 ("misc: amd-sbi: Add support for AMD_SBI IOCTL")

The documentation shows how to properly format this line, please fix it
up, and don't put a blank line between it and these:

> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>

signed-off-by implies review.

> Signed-off-by: Prathima L K <Prathima.Lk@amd.com>

Wait, this is out of order, yours should be below this, right?



> ---
>  drivers/misc/amd-sbi/rmi-core.c | 54 +++++++++++++++++++++++++++++++++
>  drivers/misc/amd-sbi/rmi-core.h |  6 ++++
>  drivers/misc/amd-sbi/rmi-i2c.c  | 54 +++++++++++++++++++--------------
>  3 files changed, 91 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
> index 95c9109101b5..e77f114c16c6 100644
> --- a/drivers/misc/amd-sbi/rmi-core.c
> +++ b/drivers/misc/amd-sbi/rmi-core.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/regmap.h>
> +#include <linux/slab.h>
>  #include "rmi-core.h"
>  
>  /* Mask for Status Register bit[1] */
> @@ -193,6 +194,10 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
>  	u16 thread;
>  
>  	mutex_lock(&data->lock);
> +	if (data->detached) {
> +		ret = -ENODEV;
> +		goto exit_unlock;

Why isn't a guard being used here instead?  Then you can do a simple
"return -ENODEV", right?

> +static int sbrmi_open(struct inode *inode, struct file *fp)
> +{
> +	struct sbrmi_data *data;
> +
> +	data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
> +
> +	mutex_lock(&data->lock);

Again, please use a guard.

> +	if (data->detached) {
> +		mutex_unlock(&data->lock);
> +		return -ENODEV;
> +	}
> +	mutex_unlock(&data->lock);
> +
> +	kref_get(&data->kref);

Are you attempting to use a kref without a lock?  That way lies madness
and is sure to be wrong.

Are you attempting to keep the data "alive" somehow?  Are you sure this
is correct?

> +
> +	return 0;
> +}
> +
> +static int sbrmi_release(struct inode *inode, struct file *fp)
> +{
> +	struct sbrmi_data *data;
> +
> +	data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
> +	kref_put(&data->kref, sbrmi_data_release);

If open is the only thing that can get the reference to the kref, and
this is the thing that drops it, why is the kref needed at all?



> +	return 0;
> +}
> +
>  static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  {
>  	void __user *argp = (void __user *)arg;
> @@ -570,6 +622,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  
>  static const struct file_operations sbrmi_fops = {
>  	.owner		= THIS_MODULE,
> +	.open		= sbrmi_open,
> +	.release	= sbrmi_release,
>  	.unlocked_ioctl	= sbrmi_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
>  };
> diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
> index 975ae858e9fd..ae084beb6c03 100644
> --- a/drivers/misc/amd-sbi/rmi-core.h
> +++ b/drivers/misc/amd-sbi/rmi-core.h
> @@ -9,6 +9,7 @@
>  #include <linux/miscdevice.h>
>  #include <linux/mutex.h>
>  #include <linux/i2c.h>
> +#include <linux/kref.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <uapi/misc/amd-apml.h>
> @@ -56,9 +57,13 @@ struct sbrmi_data {
>  	struct regmap *regmap;
>  	/* Mutex locking */
>  	struct mutex lock;
> +	/* Reference count; keeps @sbrmi_data alive while misc fds are open */
> +	struct kref kref;
>  	u32 pwr_limit_max;
>  	u8 dev_static_addr;
>  	u8 rev;
> +	/* Set on driver unbind; open/ioctl return -ENODEV afterward */
> +	bool detached;

How can open/ioctl even run if the driver is unloaded?  You aren't using
the cdev api properly I think...

thanks,

greg k-h
