Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3243A75AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788237676; cv=none; b=sTOEIEKmkjWWJMM61+COK5fPT4aYuKKnvOv3q8gFw8znHEDB43Go5Dpsx/IrLU1vhTAvPTlPD9gSFfmbr8KUa6Y7DWfYNDWinh+RxnmnyMvBttImZxiFqPobnUJsoqiPtHnaRHMU9122WtvQbU0sOFu02DsRn1Q+CkOIUhqHucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788237676; c=relaxed/simple;
	bh=hKqngZ762bbaB0cbCmY02z1J3gEa2tsdYDVv0A+lT3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgrF2SuH8R3DwXvfQrnT0vpazSpiwvtbleO65+Qhmp8+jrfhnkmOcDwJnLfEhSVYYJ6LcrqwC/5CDSOhIpHH5x6cYEMobvUuYUqb4Fjxxbm9krCebflpqdzfwku5l6jfKXwoyXgy8uOmMnmjuDxC7S0Q4RLh2Zg2wELV/HbZCG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2Kf9SZCY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2Kf9SZCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEF71F000E9;
	Tue,  1 Sep 2026 04:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788237674;
	bh=c9RqgGcU7VIULsOTMql3RDvxF+GRGNv7tcYJhtF+xuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2Kf9SZCYc0kxOXESeI7oqWdJC6yzUUxAkSpMS3iwDBrjX6d94qC5uygn7Hc92Ct5V
	 q4Qou02SkO02kqMaodNKBlj4hrY6NGCJGnE4lGy6qlUDhglO1DcQZ//stdA+Cnwqua
	 Mkopam7HT1hxQ62us2I/VmdPLsWxPlg/RRCvX9v4=
Date: Tue, 1 Sep 2026 06:41:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
Cc: jirislaby@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: phantom: fix open file UAF after device removal
Message-ID: <2026090121-bloomers-egomaniac-776b@gregkh>
References: <20260831151326.131296-1-khoavna.tin.2225@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831151326.131296-1-khoavna.tin.2225@gmail.com>

On Mon, Aug 31, 2026 at 10:13:26PM +0700, Vu Nguyen Anh Khoa wrote:
> phantom_remove() tears down the character device and frees struct
> phantom_device immediately. Already-open file descriptors still keep
> file->private_data pointing at that object, and their ioctl(), poll(),
> and release() paths remain callable after cdev_del() returns. The VFS
> also performs cdev_put() after ->release(), so freeing a container with
> an embedded cdev leaves an open-file UAF behind.
> 
> Keep the runtime state alive until the last open file is closed, store
> the cdev separately so it can outlive the device state, and block new
> opens while removal is in progress. Mark removed devices so file
> operations fail cleanly without touching unmapped MMIO.
> 
> Assisted-by: LLM (Codex, GPT-5)
> Signed-off-by: Vu Nguyen Anh Khoa <khoavna.tin.2225@gmail.com>
> ---
>  drivers/misc/phantom.c | 123 +++++++++++++++++++++++++++++++----------
>  1 file changed, 93 insertions(+), 30 deletions(-)

Cool, how was this found and tested?

And how was remove() called while the device node was open?  How can
this device be removed while the system is running?


> 
> diff --git a/drivers/misc/phantom.c b/drivers/misc/phantom.c
> index 331cae539290..dcec9c02c426 100644
> --- a/drivers/misc/phantom.c
> +++ b/drivers/misc/phantom.c
> @@ -48,9 +48,11 @@ struct phantom_device {
>  	u32 __iomem *oaddr;
>  	unsigned long status;
>  	atomic_t counter;
> +	unsigned int minor;
> +	bool removed;
>  
>  	wait_queue_head_t wait;
> -	struct cdev cdev;
> +	struct cdev *cdev;
>  
>  	struct mutex open_lock;
>  	spinlock_t regs_lock;
> @@ -60,7 +62,7 @@ struct phantom_device {
>  	u32 ctl_reg;
>  };
>  
> -static unsigned char phantom_devices[PHANTOM_MAX_MINORS];
> +static struct phantom_device *phantom_devices[PHANTOM_MAX_MINORS];
>  
>  static int phantom_status(struct phantom_device *dev, unsigned long newstat)
>  {
> @@ -94,21 +96,31 @@ static long phantom_ioctl(struct file *file, unsigned int cmd,
>  	void __user *argp = (void __user *)arg;
>  	unsigned long flags;
>  	unsigned int i;
> +	long retval = 0;
> +
> +	if (mutex_lock_interruptible(&dev->open_lock))
> +		return -ERESTARTSYS;

guard?

thanks,

greg k-h
