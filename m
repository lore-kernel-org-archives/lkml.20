Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378459;
	b=FYo5xLYTUVWR+eiFcCyKawI6u6FnTNB2hUKixURsSwkl0yk/H9VuJ2VZtW7NakLSIMlG
	 0LBR2PIL29NQRJTGTeabQLXfyGpM9ZAmuCt+ujEGKW67ye27QSDpSQzBrTtZiyOfPSsoD
	 NYfzZsPPhiNZJJC2iVrsG4KNVQczU44YKLpde0k/hkTf3t9TJB5kA54kr0EFzHqvMfJz/
	 QeIGpLRPmip/Ub7+D/yD0ceKaRfgK8HDfJKp4YPAstD/UkN4t/Z3cq30GhCJ+XcuNgICm
	 xV/WI0Fn6Zlxg97J6ZpL3LGXU7MXT1KkeovppV6k/NyW/98Xqyz48JUzAwWNnaWvkdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5m+I6rYXBG7EhF+vMUUKhGoNrZYiSUxlZhibKxKxcZ4=;
	b=DKHum3YUKpfvJk4l71ifVnV8Q98JNeBOrEUcMMaqAApHAh9AyLWtOK1BDZgQIrfj8JOa
	 bvP7PiH8qNQDs2jH5HaBWoj9poDnqEnmatZEaKsaxHMg+qPrAz5YO0Y05keYnTnXv0Fbh
	 GJbXQxIwo6qs+6pA+ITdO4Hj6sInjKTeAUOA2uIjdHO4Xk/Rkbb2Bxp2f/Dbu0RGxsZVZ
	 VLw6nlUbuF64tqNr2i17wZxBmSuTA4WxzxwD5x0Kxtb45WGJjprZsyft9/BkcLgoRYErW
	 /fxvlddgSC/ELtvsyyLyeTYyDDomkkHt3fBxTjeWdEjEYOlqoi+UK+G64LGFyDAIu6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9X0lQw4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180C606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F180C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9X0lQw4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8491675e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793378457; x=1793983257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5m+I6rYXBG7EhF+vMUUKhGoNrZYiSUxlZhibKxKxcZ4=;
        b=W9X0lQw4SZf4yT54C8AYi8FwKxsLcslJtoO1txlZUg42yAT4Gs81viAZNw45ENsrJP
         1AvSfjHM16AS0fXeBjrTmrSN86oPyYo8Uo7qAz0NW0vDo9Y0+3KyH/aCkaRngScHtrXT
         G6Eg3gPIyckVYZUaw5osNAVY5U30HoHYjgEKV175wA/M3ZeA44e+CkYYu/B6UG1ZHu5m
         mF7HN6vWlxRhH93u5imxWx+K/ClGWlm4l7gK9meXFXvdHBcXbcJAWhR1u9mBY9fe5byW
         kPHp+6D6fQuywAlaTYmOsd0jbr5MdEBf0hyEqe0MDeVI5YjLZIdM7eOGsRbpMmZsPPxT
         ox4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378457; x=1793983257;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5m+I6rYXBG7EhF+vMUUKhGoNrZYiSUxlZhibKxKxcZ4=;
        b=bCSHmdd0bT2P7EceYGV3qcQOmFx1xkOUdNXFUB3DXSoJDd0tin80JGKlfTrL8eGhO0
         A/KVhZCcjAIi/S7xzaXcfqvF+wPCdRyEqY2NeIycODGn1tLNaZy3Jo1duvN7xe3oZZnG
         fcjhFW4BcweU2N78PssNalq9MIwMCd2NiG3S/j4YddNkOE7bqdRLw54U+qQzENpz1TNg
         vvpTpmOVzINlighwRPtWMUR7upK021mkwBbLHTejwVnRFa6Deb96zzakuXztfzhOrVII
         W/fs+H6oVWdaCtdFP9fqVqIrUJTvOyOPfVzZeSUKwKUXaHdDh0wUXW0gA0a6Vp0F3HlU
         qKXw==
X-Forwarded-Encrypted: i=1; AKwUvBx6klwMdtj6iGUxahss62djjuwfenN5osaKV7TafDuro7NSOn7xh7jIQfycMYbKPo+6e0hZOTav3ZdF+9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0H012271f3X9IxPo4p8YYSxIFD7ZTAGBDc9M0eXITaPBWfLiJ
	cQXhlWAOdGTwQSMgrwtF+3H9GaZ9PD8YOVjo6X5a3gqpz/y3XAR/Iqed5yxrzs5f
X-Gm-Gg: AYBFou2dJ7ce+EGbgKahMl9j66CSAYg+nu9Be2V+LPEPYN5IZ/W3Xevy5fiqdyMtFvv
	qr2RNxQAVjkf+MKli3fVrlPVKXIwcYOr4ZoDt/Djxpv0QvagZJn8hepNVPpani5uiu2/fd3voni
	gW4eUoi3VtCl1N/Trsy6XDc9U6IwtJOQboZ8Cu0XU7hA9R256u8KXAApWwiKN8AcAhSX9msuNKC
	RqzHXxp/p63WUFybyM3yMmamMwcTOkvg/Cy1RjVu8XG75vMGUa2qo4AjafIVgkprZtVmiFVfivB
	EkB/GnqH/pQ3iUUl2gwDbF8H0JRS9jPtd58IZh6YoAEHfnQxrzMuf++AEMbtanDbv62f27RANlm
	IiJO+WtLJ8DKTYro7bn5B2YAbiF8SrZMnez9GcTTlUWLFIOZ/6mzYcVRXQmNKRTkSozC9o7xzX4
	GcBDZ8PeL5FJ7lhqPw93Tri5+KLBJFLSiXHgchGQelMj1xUg713YPu4jI35XVOycAeOK01zgBiJ
	Xf4UBlD2jQmu8W9WHeRS+O6Qg8hnq6QXGeFstUdoPnK5F1ioKas+9ozv7y8TyZvfk3TG9GCZdGn
	tCruZTrK5Hb9C6pCldmVtO4bbsdS0t1VkfDLQ5pnWITp73I4JyE+aCk6tzt4iahQag==
X-Received: by 2002:a05:600c:8b66:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4ac1793f8ddmr66810645e9.14.1793378457283;
        Fri, 30 Oct 2026 09:40:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm74032325e9.10.2026.10.30.09.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:40:57 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:40:56 +0000
From: David Laight <david.laight.linux@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/12] rtc: abx80x: use sysfs_emit() instead of
 sprintf()
Message-ID: <20261030164056.395340bf@pumpkin>
In-Reply-To: <20261029132339.925021-6-alexandre.belloni@bootlin.com>
References: <20261029132339.925021-1-alexandre.belloni@bootlin.com>
	<20261029132339.925021-6-alexandre.belloni@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 14:23:29 +0100
alexandre.belloni@bootlin.com wrote:

> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> Use sysfs_emit() instead of sprintf() in sysfs show callbacks
> (autocalibration_show and oscillator_show) to conform to the
> recommended sysfs attribute formatting guidelines in
> Documentation/filesystems/sysfs.rst.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-abx80x.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> index 1c69d0e2f940..a0d67818eb58 100644
> --- a/drivers/rtc/rtc-abx80x.c
> +++ b/drivers/rtc/rtc-abx80x.c
> @@ -442,11 +442,11 @@ static ssize_t autocalibration_show(struct device *dev,
>  	autocalibration = abx80x_rtc_get_autocalibration(dev->parent);
>  	if (autocalibration < 0) {
>  		dev_err(dev, "Failed to read RTC autocalibration\n");
> -		sprintf(buf, "0\n");
> +		sysfs_emit(buf, "0\n");
>  		return autocalibration;

That doesn't make sense.
The return value is the length of data in the buffer.
So there is no point calling sprintf/sysfs_emit and then returning
an error.

David

>  	}
>  
> -	return sprintf(buf, "%d\n", autocalibration);
> +	return sysfs_emit(buf, "%d\n", autocalibration);
>  }
>  
>  static DEVICE_ATTR_RW(autocalibration);
> @@ -490,14 +490,14 @@ static ssize_t oscillator_show(struct device *dev,
>  
>  	if (rc_mode < 0) {
>  		dev_err(dev, "Failed to read RTC oscillator selection\n");
> -		sprintf(buf, "\n");
> +		sysfs_emit(buf, "\n");
>  		return rc_mode;
>  	}
>  
>  	if (rc_mode)
> -		return sprintf(buf, "rc\n");
> +		return sysfs_emit(buf, "rc\n");
>  	else
> -		return sprintf(buf, "xtal\n");
> +		return sysfs_emit(buf, "xtal\n");
>  }
>  
>  static DEVICE_ATTR_RW(oscillator);

