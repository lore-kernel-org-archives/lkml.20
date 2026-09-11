Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878722FDC28
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088208; cv=none; b=bmItJs5BDt0draqLKT/r71tSKfe9+5zWSkagQ/PPU5Adyn4iUw+Q5+4Ll1O55ZSHmrGzbsmSraHXacKdYw82reS26lDQD7WT0tVY536ROTk5Ph5q/358aDL7SvBMWngSP48RuicfwrAui3bU7jp6+/Na6cErVHgL2cAroKqH8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088208; c=relaxed/simple;
	bh=nKNuesHM0VjAY9kiLoRrBVVAoGMjPhKuxQKlQzK44GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDOZ8P2QPZolcNXKlQaB3HznscWTuvjT+J7I9/0yhSSm/h1049Xzw1HtQSukGTmGwXaqp4MIZHrRmkmXJcjrggVYjkhFK5iYg6OSu2bLcZpxCHDNsJsA2ONfHejpYQyTZZpIThpxZMo5pfdaJguF0gdrAHqvCkSjgHMSOkTVrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTQrcI7M; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTQrcI7M"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6d28aa26cso2392575ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088206; x=1789693006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ogc/WBlD+uYeOl0wYLOQ6BjMKr9zLaEHN9sUG+KrTjY=;
        b=rTQrcI7M4rvzowPDLuCFIewU2aJshRdTX8R4MF1ECs/rm6Q6XUOrKZrwZImHV3c+Wh
         4faHXTrKkFOx3ztHoy6ymFYEHEri+5mCXsMYAV6i6S5spUsSiD2HFYZyrLepdUdXq0YE
         w5X4R/UL1NGgAA5cB/6OwRkw3Fy9mNCuMa+jOKkqEBcew+pPWo1tSpZeW3ckn4fDc8lC
         sU7HGK2sgte3c/3FKK9/yh7OWRuR6Y9rW5dKfAansN0jcHgztpLCQ+hfNG3EpwI95H/D
         7caY4/zY+kheuzxz+1KmuSH9okkRkx8uEOviHDCG91fcX26O20bzA85y9/smNGE9xSFE
         mi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088206; x=1789693006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ogc/WBlD+uYeOl0wYLOQ6BjMKr9zLaEHN9sUG+KrTjY=;
        b=TF97T22DdDXkXe78Tzq574GCCtohCF218rwFAhyxqFXpEIeB7heHj0nCvbIRLMmeFu
         D9zvEXCIDYk+VVXUwevNfueSxta5kCPfdDrvZIzN9BB6Ht9P7nuZZ3FCK/AXFBZBQ34c
         E9BWzjF9ghKBKWnYjH9eIjCYNanfBKyeuziQ7SzdxZ+nfFyIgZnBmQBdzL7TFyjNsVV+
         f15GZvuKDtBgZGFQ6zSmYGaenRauvD0d3u8gfv/Sg0/G7mTTfQB58EliCDMk4Uu4Tq2B
         K12Tv56D5fU9DGdK9hrqanSmMoKqTKCHEbv9K0sni6YRGuSEk3bLfCuMzGMHZdgpgNrS
         KJ7A==
X-Forwarded-Encrypted: i=1; AKwUvByM0Gf2z3y/zrj3wwlNpERE4+HXkmdHSli26SE+fJQ1nRrHBXv5yL/4VHnHMfZPGbiBGA6/SzQ2n1GUxnQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kGSZuwQ5NWeZAEd9wKETWoIYGheti+2lkKa1P51cMyi/IHeWoi
	6nZMWW7NK4ZSAA2mPol1pLX2sQ9CQSWqB5qyEjl+zkK9C2a3JKoRloUZ
X-Gm-Gg: AYBFou3rys4+3Tt106XHV8hWBySn1Qdx/0V3YP8rKMD3tSf2oQidFWI7fWKFtivAXfH
	uUuuji0uSeHvStC1j5JUs3K/xptIvdNatZx9Zmp0JTW8Ve50En1Ypw5SD6G+Uu3Hz3aSFtg9E1f
	5qApXyKiL6xqJ/Tzkq5xrPMaDG2YiGba1FMbyTcHOEAcdeL5+hxEnR2dm32l+GHUk72ZYhxARVG
	tPyw/VGBXt3hhQKKZPpY/DhO9jYeOOBHpRkOs4V9jsekGour8py59aE86q5IDg3RIT6tbxSdt7h
	0svLMV4ue60+BjGtzuR3UsmMAbsK9lEML0pOEF8jY9dpMLta0esszTo0usCY9ss3uA5C6VbtnKg
	Nm6MNUyn+0JKNlE/yv28obery8tdtcRA+Vmoagq/GSojvU9qhs89vewEjwoZdwr97aRA4uWC3Sd
	sOsHgMZbZRIWrX+svss+ze+jIgg0ivtkuNl3u+1YwPHG4FprVpvv9K1F5WjpkgUD/+Fh1GJ0tfk
	gtHS/NhVipG
X-Received: by 2002:a17:90b:1d45:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39d9c21cf40mr2318273a91.20.1789088205743;
        Thu, 10 Sep 2026 17:56:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm2006097c88.15.2026.09.10.17.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:56:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:56:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: arctic_fan_controller: dual-license
 GPL-2.0-or-later OR BSD-2-Clause
Message-ID: <c640dcbc-784e-4847-a5c0-ec6ab42fde49@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-3-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-3-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:04:00PM +0800, Aureo Serrano de Souza wrote:
> The in-tree driver is solely authored by ARCTIC. Keep the existing
> GPL-2.0-or-later grant and add BSD-2-Clause so the files may be used
> under either license.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
