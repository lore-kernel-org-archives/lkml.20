Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD81A4F68D1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965724; cv=none; b=F9bJ2ZysrupSZhxdGnwOZg4Z9j9TjFpid6TtiSP+349IBaokP5wbzY20QotxHPDE4WjnjhcxRxs5lKezHQWVwIaELxhJT1hawYprumGCGcVF+FnIB/10b5oFLYH3CUdXTA+4qEeJXU1aSyGLMcinhDeyut1yoC+NbEaBf68fWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965724; c=relaxed/simple;
	bh=37xW3bXnNDjppoFLWCR/oa4xzrjQIHEZAETiL9CojqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzFs7JkZZ60A72buYis7blAN4YSniYndNbn6DgDMo/7VeQFh8GWiY77P0Xk0V7UUp8HWd02BvZTjUUP/COZg5wXI7UJl9ZCnslc0kcWwUFOe7r09EI/3LCrgyKdMivznVgl9R4wm6Ki+Uz7O+gfySHr/JksdkNdCv/iD0uJqyE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QIbdlSC1; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QIbdlSC1"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-534e6545939so537261cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790965716; x=1791570516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h3hPlfvLElJBAlrqMs6yd7kZHuzl23umtFhgk5gi4Bk=;
        b=QIbdlSC1cRQKwFgqae5NgVFC9bRdle+DKHpSLYP2vuVydNfJuennMOqTviLZVCMT2I
         OFFdGgYuZGQXrh6eJ2fPph7Jgt05pCL3/VulnBmI3G3RPbC1xW9Ajw+i3Ok4E0pbQs1N
         0Rmak8zHWKpkbvlm9c21PgyXvOapm4Bb+44IrNdp9SFdUAJqrr8z49zId3smxN06jiud
         RZ0Bw95XnR/RfDRPhNwToTZqVJJVUbNvgn+2vGFJzypYobxQjDOi8E6Y2wMXch0CEvKx
         jZ1cfJOh8ZNf1ezpi3svnsxfLtUkLXtSJtPJJJLfx1q5S7oY92+a9uF920rGCPgs73hY
         aXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965716; x=1791570516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3hPlfvLElJBAlrqMs6yd7kZHuzl23umtFhgk5gi4Bk=;
        b=sZrsu4jdDtLdDvsH48zigjiIMqssXStJPjRJsPQ8dzpDKrQ6lp6k7dot/UhE2SYGQi
         J9GygfOn0/CiJ4yWvKcDOaCKC1LbSh8YZ8xrmeiLiRYL/kdQ5R7VeuKtTZcys+I/Ygc0
         9UJ+oqNnjIsNCnwnVWK6im79VQDN+o3El/Sv4D3LARCH3Fb26z+JjTz1ubizfdoPaBOJ
         in/rvp/dt+G7dnNLF2Wm3hDqimc4AROfJfAk7D6zpZqMoiHpFh4Fdj044SQdyDMhuTJz
         esBBGTE8OmJkREAOMz/j0/PbHUmzW7Qf3Mx69BRS0TOsKGlEPP2RRCAYR9NTJbtP8ihn
         qYow==
X-Forwarded-Encrypted: i=1; AKwUvBymq9es8A68yEoRAFDxX7EhTqSk7Sw5fx6M71mnzng95p+yPcGvLnn5YkZsKqmuo6eGhUFJbwXLRlEXH2k=@vger.kernel.org
X-Gm-Message-State: AFuF++n9/DW+E54pNDOA/X5uHnVeD+W86Cs99xUJpECMLhPvSgj3oKx2
	1Bxjt972F0+VaXrstHruA2bpQ4xpH/9bIFDnbCnbspctsGRhqnrRdMNCmkUMjz16uQb5viDNRqi
	INQ+bHg==
X-Gm-Gg: AYBFou2+PSxjZVuacSSSwkGKuCJtTBP0GBfl0u33PgTdxJMnWXM7f3926pwe3mSMTOe
	PgmlxkZFXweXu/zVJefLSgDneX5Pm61eV55VdeoWndFIq395iZWzx4kDaWkpJ4Tpc1mJZZBNdaR
	rUsd5o/snLO/G3yiBdzkb3oVCMS0qTXlutRWEjI8pC5YDsS/TVU3EPxL1/CWNP6ZKCU70hvJNzr
	+X8und03lOp5Q2xbh0yCHdT7lXg00KxjHDc5BQAyHU1Xfbl6wmdt+x4a7lt9jXktrwfxc6ziRu+
	wIWAJr6GhT4CcJ6Lxl4nF1zUhnz7ksVx4V/b/nNbI5YeQ0IqwzluRAXu0mBQv6bwTvQzDeRBD+7
	V84Umi+Af+fGHa8x57yTEPyKKc/64S3bH86Itz9X9qhcxUMQg+4W+90K2xTI6RJBopxqL3uyTR+
	Nbv/Wrzj1rtW5sLyjXcWi/8jRjsYsKaABsTZykQCTQ0cGvk3VJqDC0BNiKnEFdvHOjqRrWrzPSh
	TA3X7dMAg==
X-Received: by 2002:ac8:6f0e:0:b0:532:af50:8d7d with SMTP id d75a77b69052e-53511e71255mr2084371cf.33.1790965715552;
        Fri, 02 Oct 2026 11:28:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5350d54de14sm7781361cf.20.2026.10.02.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:28:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:28:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
	johan@kernel.org, linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] usb: core: don't set drvdata to NULL in
 usb_unbind_interface()
Message-ID: <c47f59d7-366a-4588-9742-b6e484c1c996@rowland.harvard.edu>
References: <20261002145455.3392703-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002145455.3392703-1-dakr@kernel.org>

On Fri, Oct 02, 2026 at 04:52:49PM +0200, Danilo Krummrich wrote:
> usb_unbind_interface() serves as the remove() callback of struct
> usb_driver and calls usb_set_intfdata(intf, NULL) to clear the bus
> device private data pointer.
> 
> However, the driver core code already sets the bus device private data
> pointer to NULL in device_unbind_cleanup() *after* devres_release_all(),
> which makes the call redundant.
> 
> In addition, it can create unexpected NULL pointer dereference scenarios
> when drivers use managed APIs.
> 
> 	int probe(struct usb_interface *intf,
> 		  const struct usb_device_id *id)
> 	{
> 		struct data *data;
> 		int ret;
> 
> 		data = devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
> 		if (!data)
> 			return -ENOMEM;
> 
> 		ret = devm_device_add_group(&intf->dev, &foo_attr_group);
> 		if (ret)
> 			return ret;
> 
> 		...
> 	}
> 
> 	ssize_t foo_value_show(struct device *dev, struct device_attribute *attr,
> 			       char *buf)
> 	{
> 		struct usb_interface *intf = to_usb_interface(dev);
> 		struct data *data = usb_get_intfdata(intf);
> 
> 		/* Potential NULL pointer dereference */
> 		return sysfs_emit(buf, "%u\n", data->value);
> 	}
> 
> Nothing prevents usb_unbind_interface() to race with foo_value_show()
> and set usb_set_intfdata(intf, NULL).
> 
> Besides that, the Rust driver core code manages a driver's bus device
> private data and destroys it in device_unbind_cleanup().
> 
> If usb_unbind_interface() sets the pointer to NULL prematurely, the Rust
> driver core code sees NULL, and hence skips the destructor of the bus
> device private data, which leaks all its resources.

Aren't there a few interface drivers that explicitly set the intfdata 
value to NULL in their own ->remove() routines?  If you haven't checked 
for that, you might want to.

> Thus, drop usb_set_intfdata(intf, NULL) from usb_unbind_interface() and
> move it to usb_driver_release_interface(), which manually calls the
> remove() callback of struct usb_driver, and hence can't rely on the
> driver core.
> 
> Cc: stable@kernel.org
> Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Makes sense,  IIRC, that line was added mostly as a convenience for 
drivers, anyway.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>  drivers/usb/core/driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 7f33fe5ba03b..412174270fbf 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -497,7 +497,6 @@ static int usb_unbind_interface(struct device *dev)
>  	} else {
>  		intf->needs_altsetting0 = 1;
>  	}
> -	usb_set_intfdata(intf, NULL);
>  
>  	intf->condition = USB_INTERFACE_UNBOUND;
>  	intf->needs_remote_wakeup = 0;
> @@ -644,6 +643,7 @@ void usb_driver_release_interface(struct usb_driver *driver,
>  	} else {
>  		device_lock(dev);
>  		usb_unbind_interface(dev);
> +		dev_set_drvdata(dev, NULL);
>  		dev->driver = NULL;
>  		device_unlock(dev);
>  	}
> 
> base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
> -- 
> 2.56.0
