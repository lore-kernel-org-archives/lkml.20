Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECA4AF69A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266379; cv=none; b=UPkz/BndguUqI8hnpsc1MeSnclN3YDFxf+YTlvYYTb3xwxUo1uzYmxnBlXyH15uClcm5Z+4DX3gT7+WOG+UsH+l9CITwo1+tzofQOtE2IawBZCMS8Ys734kcmV6Hr1mTh+CYhjZ0DOnGLQFTyU7SbOcogW93wmbCV2HW2gkaKhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266379; c=relaxed/simple;
	bh=kDYLFZJPxTJMzn8FmYfHN54E/Y+7dtsIoP5THCuRkNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YU3+vl1UPtsfj2MZoejEW/agWs8LMUdDZbcDKwQuL07Pq0aIhPdSGlfn7w8TCBUivFGam+kqEh+qRSyp4zxM826SBr51ivgC70WKvGZxm1+udaWD+MWcdFNc4M9G8k599X3LhuX+CCCEEg0idfuplWNPcxHsOgmh6sB8OpUps3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/uvwxpu; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/uvwxpu"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso40609b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266368; x=1790871168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xGGTqz2aZKsHPcNK1Wt2KAGCnTv0BbXSbSraW+Q8OuY=;
        b=Z/uvwxpuIfJjm2CSjfE6ZbDS5iYLaIOXXTK6BV0B59uqXXxi5OChTUQKNFXx2Ccm/k
         yr+jw5NPY7pNmiQDlZPiO0j5K9LZvgRipmKiN4afra+XGc5TLVvsr528ODvtTtOujAmv
         EJ8Cz0e+tTunBVV0wi0fC4woUsGwN4luOATpKUVh+pzdObEuSEO3/nPr8E+X/UC/9Iwt
         uRPOfNFv/XxELWRzTpGZQTAwyftaZ+lWMTb0Em2KwWokatuKp1nUG7YXSjtyVOZKYEdY
         tKgmv5C6DDov2DNCxdnWTrR97dEsdUFkkQapX31XZTELSr01BrgpYzUbA7vpbJAkcdkN
         s3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266368; x=1790871168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGGTqz2aZKsHPcNK1Wt2KAGCnTv0BbXSbSraW+Q8OuY=;
        b=bNSYRS8OFVlOoaOdGANYQB9ppPbjqQpviSdcjqPoit3PaAeaGQa10DW787CpEOcYUh
         6nK+jec8fWkxWNSrf3tjnP9oQbAgkizkS3SSqdyCMPRAPfVFLwKLUFxJK+6SBuT44f7+
         hVGNTgWOGum28SPNiwMbizdft9ZwbqjIgYwto39ThvS/Oc/NzEx/vCOPBKANBQYE0WGV
         LUAkLJm4gFbJShrcB1eqUmivx9LD7Wbr17zh+a90Bo5aDYTbAoJ+cZUXnhxz7NLZdEcU
         q2fCQK8Txk6y+hpabfy82TADpYjHdF2qLVvJXy4kBkmOljP+7VJz8UG8STHvvJAh3wCy
         b0eg==
X-Forwarded-Encrypted: i=1; AKwUvBzeV9fKI2wVAWvryTCV/lpGugiBgRIj7oyrURwBUWlYzeh/mpdF8gfern4vzVdF17pfn7MDpziRi9GF+mU=@vger.kernel.org
X-Gm-Message-State: AFuF++mdRnEXFWQ3x1Lkv+ISYawn+JulYQXHYs2HU/InC9/sS5agOW7D
	eEmV3Ic3Fw+/k2vulJ7bmGFw27VMw6RkBja/bmJkGotqmm9NFHUxXa0t
X-Gm-Gg: AYBFou0zcTF9+ZcKESUH9Z5t0rCorX+6DA6iXEAR84oSWGWANhWajyHkfJ/FeIwKp4f
	yfGMPwNsXYm3dx/K5d1UtcwpW/osJcBShd9IunE77fT1qcc0ZFV55iiY5ApRWSIRJ2wCTT6/ix4
	h5H7e5pGOpfOvqE2k3RRox3bJ1DhJUiQucoggu5pn2JvL5klPdKOy/jg9F/sl5LEFouwVqT0rQK
	m5PB0t7uOmmUkZLTACQfOTiwJCv1HxSUdjv/ez46ZYBwLH70IRbXwWbOcPMUZ4VjUK2ry6vJuGh
	8Zdrvxxou1vHmWaWd+eiioENLr3OR+rwBYWAD8NwxydFU0pH5hrXqbKPkTl1IaHG5HinQr+wdYM
	C7lCWsoGYIEVTtEn89QFw0xJQiuNTlIKfQAQK1+F3FmHn9+EikoP1SblYkXr8d1YN9hdkdygDPY
	FN/kbFgCTPhN6zzOJX6D2/ZPdAyCQb0lPkgSYrY2bl9kxSGByz+XURAzYncem4O+/5lqQ5ATLx2
	xWvy1ntUWTgfrp77M08DI8=
X-Received: by 2002:a05:6a00:4b4e:b0:879:30ac:c161 with SMTP id d2e1a72fcca58-87e9c63a4edmr2723587b3a.49.1790266367643;
        Thu, 24 Sep 2026 09:12:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e1f5db6sm3312081b3a.54.2026.09.24.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:12:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (gigabyte_waterforce) reject short input reports
Message-ID: <5b8b6c95-693a-4472-93c4-c54d22280b79@roeck-us.net>
References: <20260924151133.1233860-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151133.1233860-1-yaojiale02@163.com>

On Thu, Sep 24, 2026 at 11:11:32PM +0800, Jiale Yao wrote:
> The HID driver raw_event callback runs before HID core validates the
> received report length.  waterforce_raw_event() reads the command bytes
> and then accesses fixed offsets for firmware or status data without any
> length checks.  A truncated report can therefore cause out-of-bounds reads
> and update hwmon state with data beyond the received report.
> 
> Require both command bytes before identifying a report, then check the
> minimum length needed by the firmware and status paths before accessing
> their payloads.  Commit 47669bec44fe ("HID: asus: refactor the two
> workqueues and init sequence") added equivalent raw-event length
> validation to hid-asus.
> 
> Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/hwmon/gigabyte_waterforce.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
> index 4eea05f8b569..9499cb274cbd 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -257,8 +257,14 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
>  {
>  	struct waterforce_data *priv = hid_get_drvdata(hdev);
>  
> +	if (size < sizeof(get_status_cmd))
> +		return 0;
> +

The return length must be > FIRMWARE_VER_START_OFFSET_2 in all situations,
so a single check against FIRMWARE_VER_START_OFFSET_2 would be sufficient here.

Guenter

>  	if (data[0] == get_firmware_ver_cmd[0] && data[1] == get_firmware_ver_cmd[1]) {
>  		/* Received a firmware version report */
> +		if (size <= FIRMWARE_VER_START_OFFSET_2)
> +			return 0;
> +
>  		priv->firmware_version =
>  		    data[FIRMWARE_VER_START_OFFSET_1] * 10 + data[FIRMWARE_VER_START_OFFSET_2];
>  
> @@ -269,6 +275,8 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
>  
>  	if (data[0] != get_status_cmd[0] || data[1] != get_status_cmd[1])
>  		return 0;
> +	if (size <= WATERFORCE_TEMP_SENSOR)
> +		return 0;
>  
>  	priv->temp_input[0] = data[WATERFORCE_TEMP_SENSOR] * 1000;
>  	priv->speed_input[0] = get_unaligned_le16(data + WATERFORCE_FAN_SPEED);
> -- 
> 2.34.1
> 
