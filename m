Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D53AEF51
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789870901; cv=none; b=K0JxR1q+tvN3kWRD/iOEdew7j778aPYndvTAUIGMYRtg/HyTok3dGwdyfmt/l+4f6GGmNe0WttG99i6IS9rdolK8uFWGBQs8iZ5lDpPd7EFGKDakf4LvvdJghZL+0gaxPhL5EIc/O1UrlvexSA/hoqiGxXaD886SPxmFatZrrEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789870901; c=relaxed/simple;
	bh=Y6gudoLSon5TUtZq7oTL7Gg8dFG/qv7CP0yQ73JLIJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jl/AXdZ9s04fuHVJDcVJYDeGHTytwCS8NIsbJn93g8B7CQWOTUunsLD8E0EDZFBEuvDmLb4yxXp+7Tc4oVSPN+kHMtdPKzNo02/tlMNgSiT1yDZEFrsPe6ax7xtbn6s4RkoYkcW2+8n2uod6bnL/uJdZeGR+uVuVR+vWMHikiyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LgY0LOBN; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LgY0LOBN"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcbe208so25298146d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789870899; x=1790475699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1nJwCGi6TfD1t9TRXiakMGCldahc2dZpWyo2fi9hUQ=;
        b=LgY0LOBNpyRDb/ZhnVtTOP5hVgnx2iPozDcJ3DcUgiWzzw+Zc8x0zfCb1kF1VgNVAq
         kP0szZE/GQMDzEXP1g32Is4hAommXxWWO1UMCX1KyePA6v/KELATuraHzX/JHWTkDoRg
         ZLRRX+X1c3I+woSb0qKS6QIS3CAHDDWz77aa0v7m5Z3eOAkfm421+4Y6GCsu3hVz9hc1
         XJpT4eDxfMKMai2MroEx18Tm1ET5ytPj9lBIUZukjh5DLJsE0vpGcvJNd3LosvrzyD9P
         xNVPTu7hfO+ZlcqjLaeNHPASdHtgoKZ5Qub9TFb3MmD+K6o3WwNfOTXtgLB4bk/tDx3S
         qEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789870899; x=1790475699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1nJwCGi6TfD1t9TRXiakMGCldahc2dZpWyo2fi9hUQ=;
        b=klzrQ77JoYhIYMNoC1xZR5Li00QfeezEkCQZtlusCVOX1E7mb6bYFwZFqbvcVtLFmx
         b7uNzi8OWlYAWTP5S6jJ7EAm77xi3GEABf3lqc1Uq9ztQs2Tg8k4S9FkHOlicSJ5DqJk
         PROsxArQkR7Zk/ZrTxJYX6CtRc+z3y723ecHpCuCxJlfgJK4ZtN2XBS/qHsLgB/SeTHB
         LDLknikVcGRV/dEcaLfWpHMqkOPYCHHKkRkrC+acOgl52iB/iPEhKNeeaiZcryn1PMrh
         OLOhRXYXYsczKLPsIRZi8IwMrR1GFyTpgYerRWI+kvhRowoSZENU0zs/DVszErHTyBte
         V7oA==
X-Forwarded-Encrypted: i=1; AKwUvBwmjKPU8waW/zaZXdBkGy8kBHDuSnlg2dYOsT1L6cd+qzyxObCDDBkOLmCFWQHkuN5pWmosyAK4g8Ggv8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kLR2Fw6icwy0DK5D6L+a19Ez4MFFGWv90h8nGifCUKEJu8nwjs
	J3CQIvV2iPBn0EG07pjQDVQraLGwtk/Ab437BFe/MnGjakJNRbF2M70C7uK+/BjkYA==
X-Gm-Gg: AYBFou078/gi0AKD/g53UaA4K6a2U+U+fLH8IbUxdT8ogbWAk10rvkkHZtdfJ9t14zQ
	UmZjM6JWVhtIUh50b623y9bTQGo18jy04JWDIaM1XGsVCMvyR2C5qShg69WjGTjY9WHC1FnZdp7
	B2D0MRw2JXROQUWEErfg1EwafKcbq6gd5Oz6sURBWZoW2q8KOTiIyF0aMi0CwFzmy7zpFSEqHyg
	HxsijH99MI1c4JoAVz8FrxhoB0H1k71Aa68pDOijYNE9E8h8WZnmm5DjSjFh2RoPWk0EmOakqcu
	cpO33ZPvpop8spmygAs02M933KS/9YOSl8Qcx7kxlU9ra5zPGuAAeD2geqkA1/le/6eCKFR5MVu
	N35w6AFCT5EaTtdlfqMUxEd0y8umEBDv/qpYZ/3cc4VKIC5g2McRXstAwqukfMKxgfr7q+LXOuI
	bLDMKntUg4Lt6/1mlqTzgKdVtHiay8Bm/gXwPv1j/+eWbMNuTwDI2vnHSh8ZTsj0im1Dc53Kk=
X-Received: by 2002:a05:6214:320d:b0:910:391e:9e01 with SMTP id 6a1803df08f44-9129c77dabamr47347776d6.13.1789870898846;
        Sat, 19 Sep 2026 19:21:38 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260968bf8sm33626386d6.2.2026.09.19.19.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:21:37 -0700 (PDT)
Date: Sat, 19 Sep 2026 22:21:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hui Peng <benquike@gmail.com>
Cc: gregkh@linuxfoundation.org, michal.pecio@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: fix descriptor parsing OOB, port/bos locking,
 and devio/ledtrig races
Message-ID: <0bc9c10f-6b6e-429c-a625-d34b12aaf2ef@rowland.harvard.edu>
References: <20260919223518.3890208-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919223518.3890208-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 10:35:18PM +0000, Hui Peng wrote:
> Fix multiple memory safety and locking bugs in drivers/usb/core/:
> 
> 1. In usb_parse_ssp_isoc_endpoint_companion() and
>    usb_parse_ss_endpoint_companion() (config.c), check remaining
>    descriptor size before dereferencing desc->bDescriptorType or
>    subtracting desc->bLength.

I have lost count of the number of LLM-generated patches we have 
received trying to "fix" this "problem".  Try asking your LLM whether 
this change is really needed.  (Hint: It isn't.)

> 2. In bos_descriptors_read() (sysfs.c) and usb3_lpm_permit_store()
>    (port.c), hold usb_lock_device() and verify udev->bos /
>    port_dev->child pointers.
> 3. In usbport_trig_deactivate() (ledtrig-usbport.c), unregister the USB
>    notifier before freeing port list entries.
> 4. In devio.c, message.c, and devices.c, validate transfer lengths and
>    string descriptor buffers.

Patches are supposed to address only one issue.  Not four or more.

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---

> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb9425480..ecd96e249260 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -602,7 +602,7 @@ __acquires(ps->lock)
>  			as->bulk_addr = 0;
>  		}
>  	}
> -	ps->disabled_bulk_eps |= (1 << bulk_addr);
> +	ps->disabled_bulk_eps |= (1U << bulk_addr);

This does not look like an instance of "validate transfer lengths and 
string descriptor buffers".  In fact, it doesn't look like this change 
does anything at all.

Much the same can be said for the other changes to this file.

> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 75e2bfd744a9..c16827d16b78 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1358,6 +1358,11 @@ void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
>  			dev->ep_in[epnum] = NULL;
>  	}
>  	if (ep) {
> +		if (reset_hardware && epnum != 0 &&
> +		    usb_endpoint_xfer_control(&ep->desc)) {
> +			dev->ep_out[epnum] = NULL;
> +			dev->ep_in[epnum] = NULL;
> +		}

The kerneldoc for this routine should be updated also.  And this change 
should be mentioned in the patch description.

> diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
> index d22dc78457d7..da6dc2713ffd 100644
> --- a/drivers/usb/core/sysfs.c
> +++ b/drivers/usb/core/sysfs.c
> @@ -908,7 +908,7 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
>  	if (rc < 0)
>  		return -EINTR;
>  	bos = udev->bos;
> -	if (bos) {
> +	if (bos && bos->desc) {

If bos is non-NULL, how can bos->desc ever be NULL?

You really need to check what the LLM suggests before posting it.  They 
tend to be wrong a lot of the time.

Alan Stern

PS: Don't think that just because I didn't mention some parts of the 
patch, that means they look right.  In fact, your default assumption 
regarding LLM-generated or LLM-suggested patches should be that they are 
wrong.
