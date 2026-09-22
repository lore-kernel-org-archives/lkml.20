Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEC55292D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091243; cv=none; b=bKtfj6N+GtESwA2liX33QtWuuziM7NsZWWJqvnbDmUKuWAwIVeuWOY5J9SW9XJ+lIp+6kUkAx/uVZ06TBSxe01lAuW0DpGAAFnSmV85xS6ae94pJyZ5cbhLP2W1lslCJAjD3MC9rs7oBhBjbjH7f80qNbxKXCP2PmAeWp/+crio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091243; c=relaxed/simple;
	bh=M44KejLjN9PzhtH13UorzrKXY6qmkOaI4F1rztr/4YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tT6TTT0q54E3WB/PlkTsZWhYQYiHD6V3FuTWAMVix/aYeEhFU2cyvlKTMf+yXuGdJRHMAI9dwA2q10bukZs3VsQ+vsRudggzkeqQhsZMjBzzMpYJ/myZcOBqQsZLNIeVHkB5ArE6EZjlp+XO2vqyIENZ69APunFIJJTTCs4FzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBTfh3+n; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBTfh3+n"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so38764a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790091241; x=1790696041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MX4YUTICf0RtvgphPrSl6xSOkCeNscfqMM3Oh4fbG54=;
        b=PBTfh3+n7dMkYJhumMwoaJGqRYFJBmPd1gUDooELvF1sLwX67eBa5lTtmiGAUtDie5
         6XdtrCkPKDW1fj9TQ04s71zEekfznfJ1YLFhB1Bkc3zhprPXh55joKkQaSotfOMPIKFP
         kGYjgI4baQfae79j3s6yo1kSvI10hPOTipSVK2ArnheTkn5pWYewmdFlW+v1+4iieQj3
         vEu+7OnoPqOKDoMndz/Vjr8wEYerHPHBS6qFHUOX856M8yP0WpMiulp+ruyGCSRQgnCl
         ZSgNikuHHmPviBrMAWpxJWKMdUVOXiFq7Had4wvQO9Fw4fO35koVm0sSL/Nya6hmya/5
         PA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091241; x=1790696041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MX4YUTICf0RtvgphPrSl6xSOkCeNscfqMM3Oh4fbG54=;
        b=S+28nWgc03ncR2UPjLxYqRV6eEcmckByFDuTv+FrpOlLO9Pb/ypsLkVsVQNnFKJTko
         FOr/erNJKMKM8FO+TKM5j3qdi+Kznl8FbnChyKnGnssYpVCkBRYo29QWj+Q+M6ehPG0F
         6tE/ui5jVMhWUseIt9FRob8ar19fdmEOsgE7X16YEHPfydxZBBZtfMSS5kWbn2ftsghC
         itgVg7bpBxbzPP7SYKGATkyuA4akBgygJUBBBLCO0tt+Al2B3aW3SR6DXYmLuojKLUqI
         Rt6dTqWzva7VzUx20T4911EZQNYbJ0Tm6/ln2C3muWM1kcLXL6s/xmLPSihev3bZdKLd
         f63A==
X-Forwarded-Encrypted: i=1; AKwUvBzvpExdfhogga9SG67OU2FoB+K3MwjP/YXvqEqfTmiWKezasAViQrJhXzWsZ2NYtzBU//Z6UXqul46E+ag=@vger.kernel.org
X-Gm-Message-State: AFuF++nyoA3EYFCGPrI4Lq/dqEBnBeUCt93FKLFvhEt9Sgk8FiDtFWnm
	y1vuWWWb7R0X3ogBdq3qMfg1kIvLEDhSCAvZ0Ek8kpxXFYRXl2hG+vLc
X-Gm-Gg: AYBFou0VhaCCDKW4sNWbFiIVqGkB94rlZKdjbCvlzUp0lVVonP4Yz1pn5qbfxh7XVhf
	4/dapRsevtInifArEYq5BNPQp1VFE1XIO5cHV8lknXEOAeoUV11iyQK4V2EAdtJrd07b9IeQgCm
	OoPlk0AT//T4ueqpzN0M3hOsE4RkadRg2VBIW/cTDdWWfbnd8eciv0cBi9i1eMNIfUPKjBxeWXV
	pENZX13DdVLZU7IUQrl6+z61dspzQrkTFZiQzhIBML3tdUJ6hwRPRYUSkzp+sAKV4K6qmEAvZA8
	W0l1yZS8twDPZeqcZry8IdWBXj+rXvqtEhU9wP4Wpvmk7K7pY7Kl6CMeloMkjgTVe3D+jXUPjP6
	U3nTyO3RseR/mK2D75dFzeLvj1b93UvWmZYIRLYyPUao99Yo9JjyPVffBMgqkHKA3WHXFL/XiXQ
	VrFt89xx2O0NxJEaf4bwceHSu6XlFJpYHvV6AtOddxYgk+9eMROAmvNmGNQ/wr6OsdtPVF7dsDo
	x1FGJZUTpc76eiADaCyvKfhai6JPXSO0lp3pA==
X-Received: by 2002:a17:90b:4c47:b0:39e:6a7f:1dc6 with SMTP id 98e67ed59e1d1-3a073201bf0mr1653263a91.34.1790091240806;
        Tue, 22 Sep 2026 08:34:00 -0700 (PDT)
Received: from eggarch ([152.58.24.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07d48e8basm130683a91.17.2026.09.22.08.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:34:00 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:03:24 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Roman Stingler <roman.stingler@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Erik Hakansson <erikhakan@gmail.com>, 
	Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3-rc1] HID: logitech-hidpp: hi-res scroll mode
 forcibly re-enabled on every reconnect for Bolt devices, overriding
 userspace
Message-ID: <arJs7GjCP3r4IaM-@eggarch>
References: <20260920094508.39682-1-roman.stingler@gmail.com>
 <arAe2iRkYh9p98Rf@eggarch>
 <20260920205058.11958-1-roman.stingler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920205058.11958-1-roman.stingler@gmail.com>

On Sun, Sep 20, 2026 at 10:50:53PM +0200, Roman Stingler wrote:
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 1504de32b1c8..ffc7cef49b59 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -2044,6 +2044,7 @@ static int hidpp_hrs_set_highres_scrolling_mode(struct hidpp_device *hidpp,
>  #define HIDPP_PAGE_HIRES_WHEEL		0x2121
>  
>  #define CMD_HIRES_WHEEL_GET_WHEEL_CAPABILITY	0x00
> +#define CMD_HIRES_WHEEL_GET_WHEEL_MODE		0x10
>  #define CMD_HIRES_WHEEL_SET_WHEEL_MODE		0x20
>  
>  static int hidpp_hrw_get_wheel_capability(struct hidpp_device *hidpp,
> @@ -2072,12 +2073,10 @@ static int hidpp_hrw_get_wheel_capability(struct hidpp_device *hidpp,
>  	return ret;
>  }
>  
> -static int hidpp_hrw_set_wheel_mode(struct hidpp_device *hidpp, bool invert,
> -	bool high_resolution, bool use_hidpp)
> +static int hidpp_hrw_get_wheel_mode(struct hidpp_device *hidpp, u8 *mode)
>  {
>  	u8 feature_index;
>  	int ret;
> -	u8 params[1];
>  	struct hidpp_report response;
>  
>  	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_HIRES_WHEEL,
> @@ -2085,13 +2084,14 @@ static int hidpp_hrw_set_wheel_mode(struct hidpp_device *hidpp, bool invert,
>  	if (ret)
>  		return ret;
>  
> -	params[0] = (invert          ? BIT(2) : 0) |
> -		    (high_resolution ? BIT(1) : 0) |
> -		    (use_hidpp       ? BIT(0) : 0);
> +	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
> +					  CMD_HIRES_WHEEL_GET_WHEEL_MODE,
> +					  NULL, 0, &response);
> +	if (ret)
> +		return ret;
>  
> -	return hidpp_send_fap_command_sync(hidpp, feature_index,
> -					   CMD_HIRES_WHEEL_SET_WHEEL_MODE,
> -					   params, sizeof(params), &response);
> +	*mode = response.fap.params[0];
> +	return 0;
>  }
>  
>  /* -------------------------------------------------------------------------- */
> @@ -3910,8 +3910,16 @@ static int hi_res_scroll_enable(struct hidpp_device *hidpp)
>  	u8 multiplier = 1;
>  
>  	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_HI_RES_WHEEL) {
> -		ret = hidpp_hrw_set_wheel_mode(hidpp, false, true, false);
> -		if (ret == 0)
> +		u8 mode;
> +
> +		/*
> +		 * The wheel mode is persistent state in the device, so read it
> +		 * rather than overwriting it, and scale to match. A device
> +		 * left in hi-res still gets the multiplier it needs; one the
> +		 * user configured for low resolution is left alone.
> +		 */
> +		ret = hidpp_hrw_get_wheel_mode(hidpp, &mode);
> +		if (ret == 0 && (mode & BIT(1)))
>  			ret = hidpp_hrw_get_wheel_capability(hidpp, &multiplier);
>  	} else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_HI_RES_SCROLL) {
>  		ret = hidpp_hrs_set_highres_scrolling_mode(hidpp, true,
> 
> Tested on top of 7.3-rc3, installed via DKMS so it is the module loaded at
> boot. Results against the same device:
> 
>                             stock   your patch   this
>   suspend/resume                no        yes       yes
>   solaar write sticks           no        yes       yes
>   module reload                 no        no        yes
>   cold boot                     no        no        yes

I didn't think of this, your patch seems like a better solution.
I think you should format and send it.


Regards,
Lovekesh
