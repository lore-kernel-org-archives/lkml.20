Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F0A59C999
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988891; cv=none; b=P8O9fd/Gqhyglhb4BAPddRhDSk7AUse/W2/sAQMJv1V4cKhVTRuuLKigzviWrsIe2w5kDGnvf/7q8EhNA2cw5foNO+pPje7oeVFy0sAo5Gg7I+RWRmzMjLNPNelbZndTeqpmRhIuCy3wyTvy8iIG9YiB+c/NcP2RMHUHFWgbXOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988891; c=relaxed/simple;
	bh=ceVz0o9tcGe9MDsynd1j31znF+EjiAmRfe+cPrmhdBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhhkLL6eAMDSWFapxyYVyYd3K9Giznbv4V9/xxafO1pXgky2u9FWEEWdr0tbSquOIZA5BUde6C98+pf61M8YFT59HG7qH6BB1si7VsKMvwHWOCLuQVen9KaF0RSQl1hPKaZmavOcRx+C0lkoeOAn4mFnpfcLDWxTIm1eibwskyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DF3PisIq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF3PisIq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d8f265cbe6so54743645ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788988888; x=1789593688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3NLjqteAOb4BfJa4KMZU3dUwkT0UPcgIQHkE8qwI7Gc=;
        b=DF3PisIqRZ6arvqqSHFB+ChEJo3kM74H0XsO/x5oeqBE1CLO+WcMykD2H/M7vhoBx/
         JKW0yTVae8S8EjbTumEZY+PQFU2j0p/nGEEptIDei4neI6f4aWbi1l4LSdRp2GyRKvUk
         az5juxStAY3bRmm6hKqvssF3nhWzS/Me6aFXZ3HuDoSPgNbFjIv54aaVm/sIomdqEr93
         wXvCrB1GgqMo4DZorzKesv8VA2j7d2tVhp9cGt/i9LI5mWK2OnToY1ZyVojmpfdVFrDw
         tkYFxSZmuB23WYuoj6Z+12OFMfAWy2Lm3FjFXPlCLvcAbpojhCnww1k+7vFVWTBzZ7D4
         xRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988888; x=1789593688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NLjqteAOb4BfJa4KMZU3dUwkT0UPcgIQHkE8qwI7Gc=;
        b=AMHslkyCualCrY5giaPJNTPOlcXsdqWizcElKwNEaBdAAnkFJ3N+7GAKTHcjBkGW1x
         n1hJ7sA267ji7zC4k3PTo3Kp9vLdTtmsB5KxS0Z8fh1fuDHui5b6v5DJkNrmPkNyJiNT
         YE9B+Pna62XVxOFoQ6xuR/LWSOtBHgMlbyuAzPJdYYE+0fjx+yds1PUn/jksuYcm2XjG
         SaF+EseZcLMWLuop84S9AM5Habq1GbP6DHciHI8pbgy9M14EWVBp7AqzQAOZnFw3grBd
         WbsmlSvKG8ZLfMYXFTgAdw+uRITd7jUvBFS0O9/+8+1afu1Cov/ssWCRkfm7PyizU/aw
         xe/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzUye4c3tsJYpC7OCQbvHPQk/G14MfQbTBGnFV6ysGjVRMHCQWnxfAe4bQRPOqN6olLirPGBVE/bEje+N8=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ/GixUf3O347HKRi3Gic27LrXsSC4KQiDlMcn52dD4eVEsGd2
	KJmfoPOIeIx3GHBvOb8eMY+DdlhyKhAeLjG9rppqBVsDyvDAw4o6MIK8
X-Gm-Gg: AYBFou1ZFh/SroRoeJ2qbEyVNvcoO2+kk3/RuBs9dn7bLerj1MwJHiZtMNIkE0xPhfl
	Lza6QPVafWgdeUsOEUzBCmySctKcIRAecHOQgMm6HGkQHZxxVO87o8GE8mpQF2xIvFFC9F7mYO3
	9Hw4e87egG8gEqNUXdIl41WJXMtrz1FwpRyccQt8Xg2RBB1LSuKE77Ztr6MpLdleHQkFVP12PRF
	Kpxx4yPCfUCCbfdyGzRAKm8DAVMYLQjYPTDLEvtsT6gnidNR++IXaTRM+31jSP+7l18c1P0Lqr8
	RppO6iQQ3IMNnAr8guUzwx9BrlGLFN/Bp9UfXMNDR3Tz6q371LQ8qADd0IUG+Qqi9WGALzkz+WS
	6NZXQ/Az6fT6ecdob1TYoUzc+iqIzR2tKUfg/OUaoHpeUWIJr4oXJv9sgwby+0ygxAunINxlNM+
	9pw4vxy/KxxVPg1NuEazpXUU/uzR5WsP0iWakNAtFnzH5qgWI/5g3u96e1oObK6iuVyQ5bkQf4K
	GyxQ1On0/OU
X-Received: by 2002:a17:903:4b4b:b0:2db:2376:6e8a with SMTP id d9443c01a7336-2db2376762bmr460512055ad.9.1788988888276;
        Wed, 09 Sep 2026 14:21:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1483d6absm79424625ad.1.2026.09.09.14.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:21:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 14:21:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] watchdog: msc313e: Propagate error code in
 resume()
Message-ID: <5b12bba9-79b8-469a-8a4f-829b55236e0d@roeck-us.net>
References: <20260828161348.13212-1-tzungbi@kernel.org>
 <20260828161348.13212-9-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828161348.13212-9-tzungbi@kernel.org>

On Sat, Aug 29, 2026 at 12:13:47AM +0800, Tzung-Bi Shih wrote:
> If msc313e_wdt_start() fails during system resume, the error is
> currently ignored.  Consequently, the watchdog isn't running without the
> user's knowledge.
> 
> Propagate the error code, print a message, and explicitly clear both the
> WDOG_HW_RUNNING and WDOG_ACTIVE flags if start fails.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v2:
> - New to the series.
> ---
>  drivers/watchdog/msc313e_wdt.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
> index 4a5cce2a16b1..6af865750ad0 100644
> --- a/drivers/watchdog/msc313e_wdt.c
> +++ b/drivers/watchdog/msc313e_wdt.c
> @@ -191,11 +191,19 @@ static int __maybe_unused msc313e_wdt_suspend(struct device *dev)
>  static int __maybe_unused msc313e_wdt_resume(struct device *dev)
>  {
>  	struct msc313e_wdt_priv *priv = dev_get_drvdata(dev);
> +	int ret = 0;
>  
> -	if (watchdog_active(&priv->wdev) || watchdog_hw_running(&priv->wdev))
> -		msc313e_wdt_start(&priv->wdev);
> +	if (watchdog_active(&priv->wdev) || watchdog_hw_running(&priv->wdev)) {
> +		ret = msc313e_wdt_start(&priv->wdev);
> +		if (ret) {
> +			dev_err(dev, "Failed to restart watchdog (err=%d)\n", ret);
>  
> -	return 0;
> +			clear_bit(WDOG_HW_RUNNING, &priv->wdev.status);
> +			clear_bit(WDOG_ACTIVE, &priv->wdev.status);

I think Sashiko has a point here. Please leave those bits alone and
just return the error.

Thanks,
Guenter

> +		}
> +	}
> +
> +	return ret;
>  }
>  
>  static SIMPLE_DEV_PM_OPS(msc313e_wdt_pm_ops, msc313e_wdt_suspend, msc313e_wdt_resume);
