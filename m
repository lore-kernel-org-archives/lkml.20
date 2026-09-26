Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4105335E1D1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393205; cv=none; b=nfqJJTGFq3yAmynICxoH5NIdUkVkyVKkGkfyQYRe/HXskigqUl+DtkYB3HGyIgiurnd7vncM9owUuHrrtJNxQ+MmeDavoSf+y6GRLqlS/HUN7gS6ZoyMG+eM6JKJUsh0Ob//z1Ylmk/cJ9JvRK4m7o7+AFMXHIPW9+gL3eXAecQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393205; c=relaxed/simple;
	bh=EMq+CT5k7M/Cu8J/DMy0Hw6p7g2pRBF7OkWnLRHY0Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnLttA6YVMO80+lAu9P59ofO9zSukCxyYZA0JZoCPGEY6KChiSSJ8wsRZ50kRXd17OUcXpaK6wmn0Gv23+hrkSfA6RJN7tXZMQWt0V6T0gBK/dJl/e0N8s/s/+PDuEUwAWBGa6ItyICK2/PCYSirbm/HwmVcwzLeOu/yavFDKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eK5lG8g9; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eK5lG8g9"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1140600a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393203; x=1790998003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AUTbzwoy7+m0eppodGhDizq5Z+d7wwUlGieKv0/AF08=;
        b=eK5lG8g9qAAsoDEXz/ICcJ9Ws0d6lFKZjFwE3B+kKy+1KwcQAYQLPUjhlp3Aut/DoA
         KTk5B87U0lxbK8Hbw4hSQymy+5CJ4fyn8UlkTexcibCB1eH2XsGx0uucOqWcunZOqVN0
         /VFg9NTP83oTvjA+agT/P5opVt+oSmhbaF4pOfPO8QGfKnk5i2MJI4bYflWIHn3924ug
         JGSL7re8+OTa9fdRg/aAqGnWLm19WD5UJRXAH7LyuhFqDlpU1qNe/P8gkme7IvSyuZ4H
         rYeToZzt8K44c5/bkCH4HiUmq2BYfuxPFyKToubc7gp+SPOJL01Ij6D+p+EhgtSgbiVl
         rD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393203; x=1790998003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUTbzwoy7+m0eppodGhDizq5Z+d7wwUlGieKv0/AF08=;
        b=HHbmARAI+XR+27CIMmvWMO9AP+XL8W4HUN+jkhwAqLTb/7auaV8r16FV3fCFdeTkhL
         UWdNgfSDiHRXNlwDThVeN5ljjs3RrCkj+SMs5Wax7BIQB+bsdKtxlzdNMOAttDZqSSe6
         vOJ/zUuBi8Mn1A0ecRvhRICz12/8i7SqZMQEGgqTVhxwc1dtxvpa4V9vnlatNmM6Ocvj
         GH4XVy1iITIK0AvMVqF6ebMiNBEVEUu2wO37DgECnlw+VrKeu34u+ECGSq5aNwMmSSU+
         LnZIAibhOqKAOk73c5oFpHzaHohARFmPzhQQlzM+PLWTPCY6q1JCdxAHX6HFbmAvuWyQ
         swjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkt1jFCxbIJgIvgIoS7pRF48rDcVBKqJmIIO0rWNIRVc1+O+pfb6VkNblIHvb5I4kKr5xogsmgWZdG0HE=@vger.kernel.org
X-Gm-Message-State: AFuF++nc5RNJ3EJ7wCBtjy2dfZKUYrWTMG/vXEm6+7zWhSRiy9sJUjW0
	luIVHwOGMFkVl9d8IwmXjKCDmn6dva4CAnH/TR62oM/g22c9p+vP2MPpW0cG6RyH
X-Gm-Gg: AYBFou2r5/M5dgqVAPsxUU9WfA5DUMeLKwlUgBys92Vv8n6KGODFxDZafoyWuynaSmJ
	vYHz0Syv3xzVZ6hDbPYhP3BBEJuzhJPnN7bCXa9oZd+Rbi+pr27eXvB+H8kCX2ShfjTaqPOCu0T
	mPtmoVPlcro+c2/WPcIeHCJXZ34l8oWZ8cISjNcXSGArRXRoGBcrcXUhcatLSB6yvtxYStxKao7
	7FCGnTbZ0gSvAJraSgZKX/rp+TruvBRwrry02LZ4XGMkbx4/uWqsQ9IjTu8Zxv306sZ2F+d4Qbg
	/Ep0aaPfEs/9IynGFBVGlHIZ4M2TVRDa82S5FpY58ZoHtUidJ2jK8JhvI0XkONRDV61A7khl1R9
	hFG7Dg8ilHgKO8GKgIjVZQRFTYPhXHGhBnZHD26BTMNsxrklthOhWfNwBN2d9kJkJp9c6Vxx5k6
	e2ZGs10WCr7tNLYzaN+5uKKYjpOazDMVkM3/LkgI19Fk+Csm+WDgqyRYYuNqXNzDMio076tbTfh
	N4UxkKhLgvlrvC+v8PHSR4=
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr7151512a91.43.1790393203358;
        Fri, 25 Sep 2026 20:26:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm13617688a91.17.2026.09.25.20.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:26:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:26:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tom Verdonck <tom.verdonck@inspiral.be>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, John Muir <john@jmuir.com>
Subject: Re: [PATCH 2/3] hwmon: (tmp108) Fix jiffies wraparound in
 conversion-ready check
Message-ID: <1771fa8b-7b5b-4bf3-a7f9-ef1db4e080c1@roeck-us.net>
References: <cover.1790358356.git.tom.verdonck@inspiral.be>
 <525fa49d8c50922344fa53e22be5e6133c9bbb62.1790358356.git.tom.verdonck@inspiral.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <525fa49d8c50922344fa53e22be5e6133c9bbb62.1790358356.git.tom.verdonck@inspiral.be>

On Fri, Sep 25, 2026 at 08:23:23PM +0200, Tom Verdonck wrote:
> tmp108 records a one-shot deadline in ->ready_time at probe (and resume)
> and, on every temperature read, refuses the read with -EAGAIN while
> time_before(jiffies, ready_time) is true, in order to skip the initial
> conversion.
> 
> ->ready_time is an unsigned long compared with time_before(), whose
> signed difference is only meaningful while the two values are within
> LONG_MAX jiffies of each other. Because ->ready_time is set once and
> never refreshed, jiffies keeps advancing away from it, and after 2^31
> jiffies the difference flips sign. On a 32-bit HZ=100 kernel that
> happens ~248.5 days after boot: time_before() then permanently reports
> "not ready" and the driver returns -EAGAIN on every read, without ever
> touching the sensor, until the next reboot. The continuous-mode path,
> which sets ->ready_time to jiffies with no added conversion delay, wraps
> the same way.
> 
> Store the deadline as a 64-bit jiffies value and compare it with
> get_jiffies_64()/time_before64(), which does not wrap in any practical
> uptime.
> 
> Fixes: 66e1c9171339 ("hwmon: Add Texas Instruments TMP108 temperature sensor driver.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tom Verdonck <tom.verdonck@inspiral.be>

Applied.

Thanks,
Guenter
