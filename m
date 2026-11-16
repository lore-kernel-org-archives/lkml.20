Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814765;
	b=Uef/ziU+pLiyKc2bWxa0j+QFjQe2vISELJd1uIZLwEmcFzH1RkmilgPu4oM8yUKkET55
	 zVsnZkLDsVj//6o1dzYUJiSaBa48QqxEBo5vqtGcU858xRd3xBknxzP2D4UwsCdZqzeKE
	 USqHW20DmPU0Ki4BxiEKlJeuzaWZg2sAkWAvO6/SGDduCDTueuSdYSsu90EGb9NuK+r32
	 Pmnf6fpvwsP/trp6EwSVZvmVmC9hMiampb4X3XNu87an+M4dHq5Z3+Yrh+BjxAjwqIZYd
	 tnRG5WGhGTJAdtXDXj2YMsbg/51eyMd/p50pa5XGPgBYiocC1QDmBgDTWIR6XfoVLwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=UeZc8ScP5phq/mylPhGfZEPbU2/5SkeiQIEf4wyfYM0=;
	b=IEnWA2GqhgNNSySB+DgXmsxyEyE1KuETPkDJYoJU2ayXg500yd0ZdUxriXohJj2VqWIu
	 i2htQuwImPSzPk+a+ljAyDzw0dtk3lFjiJUWWc0BFyQBOnaiKPdObDS0xflCqK5QQC3ON
	 eLZzY1reKvfjCI6GOVztnzt7iRRRBMpS74sFuLvkLBKwokfKsmx7p+Qyl+V2ggJh5A5lp
	 A1n24Qdk6RTjBSRk8DEt6zyJ1EhU7ftYzGfjb9dCPHwyANPvh642GyJrbf6cJMje6nR8z
	 rhpMbOCsdzj6ZHo0gg4iZT5SUv0+CjJSqtRGMzxfF5HtUut3JsbjAkZIcSLpxPsst9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8QGPVGc;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D3606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F2D3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8QGPVGc
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so4961735c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814763; x=1795419563; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeZc8ScP5phq/mylPhGfZEPbU2/5SkeiQIEf4wyfYM0=;
        b=e8QGPVGcIJk/acexgXCbZBKNJeoKTJHpMuSwfSvBT/KOSejyR+U62mYzuQWaSPBTBa
         iIDEPKn7VTw6QtMDRHsmsU8v0MrG7Fra5bWFrvZAg7uSJcnhJKd2LypSeyFZ1Cl4g3cM
         wJOyBPFZclGXxIz6U3vw75FTJgfkZlYV54hNfzN+93CquaRDkAwWJjbMB9E1lrD1PWqH
         x0v7jfDrPPWEy/jgzDzoOMTtWpqeRh8RfOHXDJZ3ksAYSmWiOkuffs//aQefF6Ydh5/m
         2mmEZNA8saFLtaimpJxc28yeWaf7EhDQ0SMDCPoA9T2KMP3ujHXh4XvZ8UmywiM8yHJs
         ZfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814763; x=1795419563;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UeZc8ScP5phq/mylPhGfZEPbU2/5SkeiQIEf4wyfYM0=;
        b=JzaMrXe+S5Qm7/mO9cfWyBaRL6qFDu0CWXRcXLhLS4JOvictSsG0lQNRhWaGzgIXe2
         rzHbLShZU50a2PQuJBT/DuyVcU3qHEJ29JFYa7fVAg2BjkOZjC3CEFyOIFkVqrjCXbr5
         ZjQT8Xcsudq9rUtdWHij7PXGvO3NO2WatrNwhVlTSl9xd/pJCTX7R4Kt3QIXhfY4Mgia
         t/92ZJ7ZyYtlW/BgK+japW2lVRFZMcgZup1pkJK1yR2+MSmqA8DekCG9c7OgMYRijkpN
         jn49F2FnwyK7db4GYyhnW/Yrbie4KIv7F20RNuA1R5vwqZYUmOGC4Z8oVZYTRLGVxwsj
         HBPw==
X-Forwarded-Encrypted: i=1; AL+hErEBX+O4IDeOaGQ6MDLC0pMwhhMgoOfH7f7UTZCoWVrWTcN2ZfitdvJcKoumi9O7DA+GsevnUcL5fA9/lq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eBVzOlFFmhInv/pU9pa5E0IrAYSvblGSimRH3t/GYePDS5Glc
	3UxolKBUHoSQ8NdsqCMqmCBLN5k+zCCxGctvzSGI/nKd77tIZS2t0wjt
X-Gm-Gg: AYBFou0NK8BPK1Hwl8Ei0HBS7kAfPIu3ztA0FB+XpXDVhYwt9AgSucEyx6adC4spQ8a
	iXvD8PshHLoz4cMiOntb7MR4X0gZy3d+IIG31pquT/AP/t3cCp5ll4b1RYFizgn5MHDY96bbqYE
	7AcCtONZdjz4BgOZoGpwTYaANHyMQDMI+ufz5O5wl6AwWu5HNaz5zEcIPyhcfAvwbY73Hupw+tF
	bazm3xBHuJf6JUMYKLhvurMXSFZJEVJpi6HyxTfafD1xnQ+67RLOYEqYBq+IbHTXwrENXKglbok
	4dMse4cGZv+Q/vQqt/ANq9nWRMwqRTenEXWxpQ0H8BRBUHn31Y9FNsLq+xZkeg26ibMgWU1Z/DC
	7YE4uGHlcLHpH09F6h+fjfTyNRHNtG/yZ0QNU5Wt9t2QuW6SzqSHrwXdcw0q6ZDFGBSLrcD3h6+
	Vpp88v1bJCNakcA+sIxa2BSXqqF/BEC4VB+vzk57YV3Uh7IQBA7QOZozeYbuzSHKw2o+rNBGtfu
	Le6LANepgBRCREJws5YSUp93IsQcxdyPUt+WApJsIp4Sn9JFwwJKVCA5oL2+UsW7AWNpL9vzZNQ
	sSz3naP4ip1bf8kKIvHam5wtEyYneqyUVL/8jTqurrM14UDBpF0kDgBwom7Vak/U4ray+OnelBs
	vU9sqj0IOzR8McZpH
X-Received: by 2002:a05:7022:f4c:b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b50315622fmr8755891c88.31.1794814763158;
        Sun, 15 Nov 2026 23:39:23 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm26795070c88.13.2026.11.15.23.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:39:22 -0800 (PST)
Date: Sun, 15 Nov 2026 23:39:21 -0800
Message-ID: <9639a3578bf1cae847b4b0cdddd1a0e0@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: axp20x-pek - support the AXP313A power key
In-Reply-To: <20261115150903.16855-1-jernej.skrabec@gmail.com>
References: <20261115150903.16855-1-jernej.skrabec@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jernej,

On Sun, Nov 15, 2026 at 04:09:03PM +0100, Jernej Skrabec wrote:
> The AXP313A MFD cell is registered as "axp313a-pek", which this driver
> doesn't match, so the power key doesn't work on boards with this PMIC.
...
> +/* The AXP313A has no AXP20X_PEK_KEY register, so no timing controls. */
> +static const struct axp20x_info axp313a_info = { };
> +
>  static ssize_t axp20x_show_attr(struct device *dev,
>  				const struct axp20x_time *time,
>  				unsigned int mask, char *buf)
> @@ -193,7 +196,26 @@ static struct attribute *axp20x_attrs[] = {
>  	&dev_attr_shutdown.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(axp20x);
> +
> +static umode_t axp20x_attr_is_visible(struct kobject *kobj,
> +				      struct attribute *attr, int n)
> +{
> +	struct axp20x_pek *axp20x_pek = dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	if (attr == &dev_attr_startup.attr && !axp20x_pek->info->startup_time)
> +		return 0;
> +
> +	if (attr == &dev_attr_shutdown.attr && !axp20x_pek->info->shutdown_time)
> +		return 0;
> +
> +	return attr->mode;
> +}

axp20x_pek->info is only used by the startup and shutdown sysfs
attributes, and we do not have variants that support only one of them.
Can we drop the empty axp313a_info structure (leaving driver_data as 0
for "axp313a-pek") and simplify this to:

	return axp20x_pek->info ? attr->mode : 0;

?

Thanks.

-- 
Dmitry
