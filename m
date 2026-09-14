Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D3F47DD77
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399819; cv=none; b=jxMY8kZENT46V1exiM8PYG1e5l0piF8zN29lf1nVImuVVsWRtUdTcl9WjEDRHBioTD4MKbcorMjI1jgIlgstbvy6f1yQ2zm+21F+Sgk1QT8SLCHWCXf9Cjigylp1wZQjm0do7tm0fnbVuEbycwrIDZwaM5FkVEMc5FWclFqOHIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399819; c=relaxed/simple;
	bh=h/wDH6nToVf/TAYvuwPjg2RAFl5iJ36CneD4aSoPqTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJEkNAbVlylJpp8OR9Xd3+Ap/lsSgdnwWdnTJ2IkrjsvAfNeTiMYd4e92PGETP/eHmIk8/dxe3gfCpbcm0FB4eQU+KrNdrEAcGxt7EO2MXDx4n5wAnw0bEUptedEXcFIo1VJxBcrsANSljAzxN48dzW2MD7GGjKtu4xEUc95oGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWEKv4fk; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWEKv4fk"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so30429875ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399817; x=1790004617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Az8tNuJvyLtzVr3TXGzXDdP8iMuPRIZTqheTTOwSHa0=;
        b=dWEKv4fk4ZwbkYulN4HVXxzUvwe80b3iGC7osKGmhrxiWUVUjYjuTExddjCwWUXrph
         paCp/xCBnvIctXgHtHaF6/1NnuVwQp/dqoW+wpGfZ/I6UvyrYQiYUfMNxJkcv6UzBQDw
         WI+I+3M2NWgqsql5EIICGdLOPJ8Xg80Jdb2IWWm8EWUQrQy4W89jjqbXTwem9zUlabS+
         nB2WEcAFbRq0msiSpdmBDXkd0l0W6ok29MGf9bZ9DjZJFgv4y2WDg9BUKXQ918AQ/0SH
         mZramtUEoiP9z8zRo+NPymU6NqUa5MZfRM/EsxIWz/ARJBOWo43BjoFhRd8Kds89Bm1T
         /QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399817; x=1790004617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Az8tNuJvyLtzVr3TXGzXDdP8iMuPRIZTqheTTOwSHa0=;
        b=cUuLLG6jQEgZ/vfgyI7RSC/LgAVktOhbcc4woynI54F2i9J2YDpB5uoo+Se9lpUgOr
         WJf4Rc1ZeVyN0g+fNmE5cBEebBFFquGKRDAjNTrGVf0AKmrL2d43daemdVrxBDzGAcuF
         cVRRhHchKQ3vv3RoXk2OWZjXS+0V7izIwpdPWfVBPYHbPkK9hpjn1SzODoo2n4jNoNv/
         rxx51w8US8NFsA/AC403q59J+Bu5ZmO0Qt8K+4RUUvHWDLbW097m7FUacUR4cxlrPayv
         2ULn/OvEklsOQ3TOAalDmECSgg1kJCKcl056r6CIm1aXCJMwwtDb0lf1xDszxVhmcidQ
         p0zA==
X-Forwarded-Encrypted: i=1; AKwUvBwvVUqOk/I18Np/n7Gazt4bocZTbMIbcGv3hGkKTfCgskyKltbJV2sZ0YejgKST+DrZyx3bLme4rZiUywE=@vger.kernel.org
X-Gm-Message-State: AFuF++n1PXnaC7tXSWfcVd4mpDQHV+ymrYBWwrDsvO7f6WrcTYmcD1yR
	uul95mN5VAvbbWuNzhg8TKj0T+Uub65oyFGKu6u2y9Fnkmy/Ps/vVkw2
X-Gm-Gg: AYBFou1NwP2M+IC8bcRMExi/EXUUjTREHYvtmmNmbLFQM8IOIhB7u0r/vDqt3f58Qur
	Qm1Z2TR4pB3b+d6pAhDT123rLomAPqJzxZzXyDpEmRGG6wKSUodbcV8IACwpRPIhoSoUDg7tbo8
	vbDyrUOQLPOkalPUIW+f13LcyKAQuulbFVLnRX5hNyTBGz/Npk9mcDz97dqvZionEoZ+u0SSNzS
	4oUM/UhxdIqP2AlKRJ5nqzJbX+AvoMH3EzzherFjRI4bJQV67Q4TG3/PZMkJo6clUl7IDruImRH
	7E/UxyImOhQ0xbhwajDxnyexL0gvLs7oT8ZhUKHXBu3UX7eKaXDQ90d2xk5XiDMUMTfJ2ogvkVL
	mgYTztvFzQr8sm/zaONFjXlD3xRV4WpqeitznjaKtJolDXcEuP8x89lcymooZc7UjXPxKAAhj4f
	+TsCN53NK98JqyALTJ8rSoV1MPcFRxV3JIj1kTYaXF1Lajv8hXenVXfPnKZMu4TFoHW03eDUZvs
	zX9S4PGX9eQsw==
X-Received: by 2002:a17:902:f64c:b0:2d8:d4d1:3139 with SMTP id d9443c01a7336-2dd6c6fef53mr67714745ad.16.1789399816489;
        Mon, 14 Sep 2026 08:30:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce92ea4sm51503935ad.20.2026.09.14.08.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:30:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:30:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>, Jean Delvare <khali@linux-fr.org>,
	Hans de Goede <j.w.r.degoede@hhs.nl>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
Message-ID: <c5416dc9-f814-453f-ad2d-497d21dd8dd4@roeck-us.net>
References: <20260914062809.1650538-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914062809.1650538-1-lgs201920130244@gmail.com>

On Mon, Sep 14, 2026 at 02:28:09PM +0800, Guangshuo Li wrote:
> When the fan/pwm 4-5 pins are not used as GPIO, w83791d_probe()
> creates the w83791d_group_fanpwm45 sysfs group on the I2C client
> device.
> 
> The probe error path removes this group when a later initialization
> step fails, but the normal remove path only removes w83791d_group.
> As a result, the optional fan/pwm 4-5 sysfs files can remain after the
> driver is unbound.
> 
> The callbacks associated with these files access the driver data,
> which is devm allocated and released after driver unbind. Leaving the
> sysfs files behind can therefore result in accesses to stale driver
> data.
> 
> Remove w83791d_group_fanpwm45 during normal teardown as well.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 6e1ecd9b8f13 ("hwmon: (w83791d) fan 4/5 pins can also be used for gpio")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied.

Thanks,
Guenter
