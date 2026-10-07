Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50FE43F8CB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791395713; cv=none; b=EwCrz1mktge+TQQoFVMRvI5hBYGqd2urycFvuGo60QOiZ+vJ3nNpVa8SdkJ/vLgli8xPiVQkc2yflHM0uHyxGF+iNLR9gJkbJlQlvWu9qi6ZNS4D6R8t+421+MQTgxt6dTnSePSQDN4nyehy2MDzVqTbe3wpTQxGcxhdIoObpIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791395713; c=relaxed/simple;
	bh=ke688EiZv7Hz5A3yoyZYE6WoFX7dc/lqhTa8W6a13dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C29NFB7CQiOMzcj83yIvqIBQD+J2/WwzV8ykZpfKY4r84RopYLenmWOLSlhz4GoCFXQLetiRmewSpq+mdBjo6lenVQN6DUx7vEyZL221npwKrYF8Fo3YJqC7agK8fHQhWuasUrKuXCG2W366LYeLWTvj24dXMJML1fHhOs7UthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=en7MgX5J; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="en7MgX5J"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e7457349eso325588285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791395711; x=1792000511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UngZ8k3YNt3VJyCBdJrwK5aCUhaIZau8MCEL0x/UbHY=;
        b=en7MgX5JdzfWnY4lbrbnRDKoNvkk5EScS8Zlw89NuHjP4ePEayP9LogDgY4VrsGUVp
         q5LLdyePhpgKRo62Qwgz9iDEdrDsjJnIU9NGOkBevsamWzf3r31r7fRaa866ta+eMGX2
         QUJLhTYGpzEqUkW535/KGBjclJJf698ZCRCmUKRf+ZiSriRRtP+EuPzePhvbTf+8+oaK
         RZkHCdH6qoRI3lM8wUezHP6wIQHK0VolROAKgTEqmNvDDEaPSdLmpYiK40ec13rXECJh
         lFRbkk/ILKsYxsCKOa4JIiMVRggUc7C7LJyZV7DXf+N3ebqkhh1d1UGmLHqliG3hTahM
         4+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791395711; x=1792000511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UngZ8k3YNt3VJyCBdJrwK5aCUhaIZau8MCEL0x/UbHY=;
        b=I8i1MlsrbqHm2Wz9IZKB6Epem9MMrIOwcU7ZfoA44E0fcteoFwpXtJw5I1JNl4UKGv
         XRNEBgCCv2kh/EdvXdkj3+NYiQb0yIxyiLx1jPkqHRpHIpFLubaJEsJtv5Lx5dyIyHFO
         xiKmWvqwhXl6qE+UqnF0MEQZZZfoSWKr21I0qYkt+98YU1GRBrlDvcAD8Mq5KCNF8pI9
         dbj36DeGW+e4fWDpkYf8mean7EsYcii/GcZ5N/CaCPpV5xZ2j1NLINVwpVC59C2SNC+/
         T8yuvT2E8ExVKIH0Fe60bxBj5N2cCahXjqpmcEZSSYV+gRCcb5+179J3vLxGLUIU5Ouy
         AHyg==
X-Forwarded-Encrypted: i=1; AKwUvBz5XXQrTRAqFflMp2t38GDSY66aEcW2ldEqG6J/8Wvk0G6wUYuciXfrybApXP8B2AU2FbpY7qh5jjGKYlo=@vger.kernel.org
X-Gm-Message-State: AFuF++kiO5mn0nKIcgeX0TFwGlrJxgcMpitPbSkla2uV8RXcGGMiGBgq
	Lp9vCFiv/JdqTqETyrZJdD5c9foSK7eEdBMW8u2LlHsItfI+Erxz5AWVJwo8VpaBEQ==
X-Gm-Gg: AYBFou2G//ceGSQtbVMEFp5wJ8Bdcs6mkVg015MTqluasDAtVLzKbk4WqLOxHA9gYFh
	iKOI5bk9WEb+dG6t/2Dy3smxxbd/YNjAigu4R7BkTWl4S619UOPqL3TgTI7l+dkhuJKJdLDxzxU
	a+DdgjTR22dzETqC3oBen40gV0tKjikarIFL8BdJXR2TkROxcxQqb4gjPdmejCShnKahyJzUSuT
	lB4JJ9tb3BvY6D9CAwyEeBjTYyW6XTy8MEeBoah01J86V7tp4wB/fKnjsRxt3LfLlHJNEBmuobh
	SfWetKhTeCVDUBdFI/ez2FI0bOu4A3zcP1pvtw+OUCrKk98znAFxprY6RsW1mVot2Xv9jqkVHpq
	1ksKpBr4K00vZglyKUL7MC+omj2JQKSHPClZNC+Rpq5+b733yEgxuAPrxgnuEI2q4B1ThnkuD7A
	jSsBlVQp5hL3jYlEj2ULBrabIJ+UsvffhJbwsop33XhpVp1Ow6ra0plgDMKu525Nfg8sh3T0Uij
	n8A/OcW9IIbuyKscIObGrkNQWpAjGlGQqh+46/ccw==
X-Received: by 2002:a05:620a:4081:b0:93c:66da:ee08 with SMTP id af79cd13be357-93e9b76c7bamr579983785a.14.1791395710620;
        Wed, 07 Oct 2026 10:55:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e99160036sm274186885a.25.2026.10.07.10.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:55:09 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:55:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Giuseppe Piscitelli <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [RFC PATCH] USB: core: emit a device-level modalias
Message-ID: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
References: <20261007161721.60593-1-ooonea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007161721.60593-1-ooonea@gmail.com>

On Wed, Oct 07, 2026 at 06:17:21PM +0200, Giuseppe Piscitelli wrote:
> USB device drivers can load from interface modaliases after a userspace
> client has already configured the device. Loading apple-mfi-fastcharge
> then reprobes the generic binding and interrupts usbmuxd transfers.

This description is very confusing for anyone who doesn't already know 
what you're talking about.  Are you referring to some particular type of 
device?  If not, why mention apple-mfi-fastcharge and usbmuxd?  If yes, 
you should say what type of device and why apple-mfi-fastcharge and 
usbmuxd would get loaded in the first place.

> Emit a modalias on the device event, with unknown interface fields left
> as wildcards.

Why?  What does this accomplish?  How does it prevent 
apple-mfi-fastcharge from interrupting usbmuxd transfers?

>  The existing udev module loader can load matching modules
> before consumers receive the processed device event.

Why do you say "_existing_ udev module loader"?  Are you trying to 
reassure people who might think there was a _nonexistent_ udev module 
loader?

What processed device event?  Is this the uevent added by the patch or 
is it something else?  In what way does it get "processed"?

Sure, the udev module loader _can_ load matching modules before 
consumers receive the processed device event.  But udev might run slowly 
and not get around to loading matching modules until later.  What will 
happen then?

Alan Stern

>  Keep interface
> modaliases and the driver teardown paths unchanged.
> 
> Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
> Assisted-by: OpenAI Codex
> ---
> Tested on x86_64 with Linux 7.2.9 and an iPhone (05ac:12a8). With no
> Apple module preload, the first insertion after boot loads the module,
> keeps configuration 4 and works with iLoader without restarting usbmuxd.
> The current usb_uevent function also passes 18 source-extracted cases.
> 
>  drivers/usb/core/driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 3c3bbaf89..29d1acba9 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -954,6 +954,17 @@ static int usb_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  			   usb_dev->descriptor.bDeviceProtocol))
>  		return -ENOMEM;
>  
> +	if (is_usb_device(dev) &&
> +	    add_uevent_var(env,
> +			   "MODALIAS=usb:v%04Xp%04Xd%04Xdc%02Xdsc%02Xdp%02Xic*isc*ip*in*",
> +			   le16_to_cpu(usb_dev->descriptor.idVendor),
> +			   le16_to_cpu(usb_dev->descriptor.idProduct),
> +			   le16_to_cpu(usb_dev->descriptor.bcdDevice),
> +			   usb_dev->descriptor.bDeviceClass,
> +			   usb_dev->descriptor.bDeviceSubClass,
> +			   usb_dev->descriptor.bDeviceProtocol))
> +		return -ENOMEM;
> +
>  	return 0;
>  }
>  
> 
> base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
> 
