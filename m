Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C541C1B808;
	Fri,  9 Oct 2026 02:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512066; cv=none; b=oKW+racMhzTgbybUNceu50uq8+xOOpv0tR2ZAfSc0KUBFTZGe+PZJ7nS5ci5KhidHl9GCblVtMc7m1ojFOduKiyXtXDDH3Icqm0wdWd6/zJweUGMLQZHiSiKPSSfqPtegwfDxIqG1115jFgraHkxnzL+CjNGYCum1/4GwUY2iyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512066; c=relaxed/simple;
	bh=XjYMJefxXIo3gGyZdbK27YJ+okAMpEelayGP13vzO/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5Hf1utg8Nd85mV+emhnCFWwQ8sPTqA2VZ9rWaxc2ImvCY3JUwuyl0SNgTMXCKgw5IU2wlSJuFKj8wwfgOfz+/tgzDaxH8K/pO1abtRTTZZ+Sc3zuEKBVPm08DniNQTpH0FKJ1r/ngigt4xwkHGuRpCbjBHWiSkCRGwFaXwIdos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8g/i35F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8g/i35F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084A71F00893;
	Fri,  9 Oct 2026 02:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791512065;
	bh=9G5OUQT2UcbTq7GSmFBBz/ZFJx0o7ze/5N1vD4295TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8g/i35FU6xtuf2sQgGMZXq/m777NIiX+7+Bjpqv3Ebcs1hW6y15kY7BhUVjQk5js
	 2Ary1d/LHl7lloNAOQ3BRfeGPtrV6N+ArTm+fd9r0anQh1yF2gSPJUYxSz+3udENhh
	 8U/d/KKvxjMt/1+wM0b5paKw7gnc07E42PPNrVcVOmtNbJqo8G1yQ+RE0qEVTcQPKU
	 FK8y72JxsHMEi53EB4+F58Xz5JxRsRLKA7LNjLyRsIrw6EjxLQvRTxbC/mibS2wbju
	 PJp58A9PN5XfsGsw99KDBKsn+4g6bzu0DWobxkdDWTXuseEfxBRI47OPyhFc5gE9W8
	 hEBDh/dqHMHDA==
Date: Thu, 8 Oct 2026 19:14:23 -0700
From: "Peter Chen (Qualcomm)" <peter.chen@kernel.org>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: phy: don't overwrite a device_type the bus already
 set
Message-ID: <ashN_7U0r_aXJOP6@hu-petche-lv.qualcomm.com>
References: <20260924194236.168010-1-raghunathpalla.0209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924194236.168010-1-raghunathpalla.0209@gmail.com>

On 26-09-24 20:42:33, Palla Raghunath wrote:
> usb_add_phy_dev() replaces the device_type of whatever device the PHY
> driver passed in:
> 
> 	x->dev->type = &usb_phy_dev_type;
> 
> That device isn't ours.  PHY drivers point x->dev at the device they are
> bound to, and its bus has usually set a device_type up already.
> 
> i2c is where this hurts.  An i2c client keeps its release callback on
> the device_type, and leaves dev->release NULL:
> 
> 	const struct device_type i2c_client_type = {
> 		.groups  = i2c_dev_groups,
> 		.uevent  = i2c_device_uevent,
> 		.release = i2c_client_dev_release,
> 	};
> 
> usb_phy_dev_type has no ->release, so once it has replaced
> i2c_client_type there is nothing left to free the client with, and
> usb_remove_phy() doesn't put the old type back either.  Removing the
> client then hits the warning in device_release():
> 
>   Device '0-002c' does not have a release() function, it is broken
>   WARNING: drivers/base/core.c:2642 at device_release+0x1de/0x280
>   Workqueue: usb_hub_wq hub_event
>   Call Trace:
>    kobject_put+0x162/0x260
>    device_unregister+0x27/0x30
>    i2c_deregister_clients+0x27d/0x410
>    i2c_del_adapter+0xe9/0x230
>    i2c_tiny_usb_disconnect+0x3f/0x90
>    usb_unbind_interface+0x1e5/0x9c0
>    device_remove+0x125/0x170
>    device_release_driver_internal+0x4e2/0x6b0
>    bus_remove_device+0x2f5/0x470
> 
> syzbot gets there with a fake i2c-tiny-usb adapter: instantiate an
> isp1301 on the new bus through its new_device attribute, then unplug the
> USB device.
> 
> Only i2c is affected.  phy-isp1301.c is the one i2c driver among the
> twelve callers of usb_add_phy_dev(); the others pass a platform device
> or a struct phy, and both leave ->type NULL and keep their release on
> dev->release or dev->class->dev_release, so device_release() still finds
> one for them.
> 
> So only take the device_type if nothing else has.  Callers that rely on
> the uevent handler still get it, their ->type being NULL, and the i2c
> client keeps the release it cannot do without.
> 
> Tested on x86_64 with the syzbot reproducer: before the change the first
> isp1301 instantiation panics on unplug, after it 292 instantiate/unplug
> cycles pass without a splat.
> 
> Reported-by: syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3fb7629cfd12d04beeab
> Fixes: a8534cb092d7 ("usb: phy: introduce usb_phy device type with its own uevent handler")
> Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>

Add Cc: stable@vger.kernel.org, otherwise:

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/phy/phy.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 5a9b9353f343..ded18c7fe32f 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -705,7 +705,13 @@ int usb_add_phy_dev(struct usb_phy *x)
>  	if (ret)
>  		return ret;
>  
> -	x->dev->type = &usb_phy_dev_type;
> +	/*
> +	 * Don't clobber a device_type the bus already set.  x->dev is the
> +	 * PHY driver's own device, and for an i2c client the release
> +	 * callback lives on the type.
> +	 */
> +	if (!x->dev->type)
> +		x->dev->type = &usb_phy_dev_type;
>  
>  	ATOMIC_INIT_NOTIFIER_HEAD(&x->notifier);
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
