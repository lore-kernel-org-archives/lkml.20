Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880143148A7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228778; cv=none; b=TTEGirQtDMlaRH2OZxCRbVH4my+2cN8K9flshdmT6fM0dMeAh7YKFedjnr8UTjbJzXiW3m+zP4oTEsfeaiYcODEMLvhgjvWAScvP11DwMCrs8Z2YNUXtzTNEocw3cc15fQZBWWKSwaX/j/cZ24icAMyr4vP+JRR7nx9ZjyQVVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228778; c=relaxed/simple;
	bh=/az9wwtwzNUAm+umPMS8X6X6XbGoBVmRWn/PzdN+a20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpT1mYQ0PlufQcvA/fHqZ7J7OGdoh7fF9dzZ/II+Cc1nVZcqEwUL4cyjxmTZcQ6tDgaNC7/vTb2ONOQQZ5VFB3GnOOy6U1IuSLk0hg2k4fdCh6+6+BCubKSIqHAMqfTO6zDFRe8hxpKDAOByTOiTSs2LeaBaspiFxrr68zO/wGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOuSwrVR; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOuSwrVR"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81f3b227a4aso4727677b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228762; x=1788833562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lRjUZEJS6BcJ/ykufOuQV9s1kDgTbH3LbjoGvDl9y7s=;
        b=LOuSwrVR2EaaMlQT0E4Avizoj60krgCt40m701UpxbdrIDCAc6Lqozgj165v6BPfr2
         sFxwHUchIBlETOsvi6ZbKWc2t09TsFLF3PRN0eyubTWxmtoxY6DvHd0XNkAl5z+VeG9Q
         /bB/atdSpqeUHsx94gstJiIeepE5SYDYiT5qErWcN45wYWbO0skAVMDFkXLs80OmD4NE
         d6oVCxUZxlZVUwOvF8U85suFhSPsUtaHriuGXNnnl9i47GtoE3N01cySCgeW0IPaINAA
         JsmBOCDv/bASbeYIJgCx82U9hIwXZX5thXiEQjRgoWNEQ5e7XJPelGI/WW1WVqI1Ul/o
         SlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228762; x=1788833562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRjUZEJS6BcJ/ykufOuQV9s1kDgTbH3LbjoGvDl9y7s=;
        b=mHwfS1zDFFTJPoKl6irVMEc8u6SU9KynA91TAG//P8lSUssFm9YbaPqVFBKdu3+KZA
         z3ESsSN9qVzuQVAJzEbjdkN0z/icUJoc+dEWQ8AzMHcqiPIYJxwxIIWhvLISvzicDWX3
         HWdJLq02Tk72C3p2T8ss43DQSjNxFkFmgXF2I8zYMDngkEGWb5ojHrlTZ2NrTAa7IUrc
         QRK5B6ON1OCnT/QtLSHIPI3lDEH4uwcAItZbwdx2h813vj0N7yJc5GPz7P0xs2Z2y0Q7
         t7XFLyHvT9zlpJ0JXBOkWBayJtc6ksra4vjM9yyGqSoloWP2W0YLgtyZ6D46MCJs9G9a
         HDPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVW6w6Uf+C/fp3OdDbOQyw8pdjFOz27iMERFY+KSp/0qKJrpCC+Oyz+c8/U79mNNDNsewOYUPRcHNtMAw=@vger.kernel.org
X-Gm-Message-State: AFuF++ngoYGeRWIveAMhtGPNCeKhcpwBk6QftDG5avoCD2kUWhNGswyE
	aqGJ8rMdr+8N2AceXf21PZJEUZeMsZ3RfnnEbxwp9e4Plis8q9LFU2mg
X-Gm-Gg: AYBFou1dRlBvcwvY5P33YMtXMEZ2uLXshKY7h6EI8qGcOX3JbC3hgSFsqQvMVaBQh7U
	QJcGL6suX6ZGRVy7qPxJsqz28tga2A/LhdWpqqMwWwWpZ3n94hA+c3E7vVQabdaAmAdysqqdAav
	H9fIeiDtRVNT1PJzLrFvtZ4uL8YIYncj8kHcf8NMJzUn7uLvw0ZOhdhqgDyiwj9fREndlF5DHGD
	Hmod8bd/KkI6i2Q0rA6V449sTyNzjmiCdKs5iIOv6z33CHZn++v6Y17Abh8H4CyMGEWvhgvNxoj
	IYVOfnKwtPio8IV/+LMFttgqEzlDd2I3u1Raa13fIRm+gkWwO6QO7GLLPI7/nLYgVhpOwUUEzUs
	PUtH8rfMP0r2xnKr23i/tu/hwrix37ZXuwqOEUj1yy41F/ETKTBnYmI6/WZY5v7cZGr76mVx80Y
	mpO5YGEu+mWWuYnr3YCRmewCyH0pOuDpGKwpTIuF42vo/pqLmYC8Ut0531UeGjkzPLZuCF
X-Received: by 2002:a05:690c:f14:b0:81e:9826:942c with SMTP id 00721157ae682-85d625bd769mr118991397b3.0.1788228759485;
        Mon, 31 Aug 2026 19:12:39 -0700 (PDT)
Received: from localhost ([2804:30c:94d:7300:da0f:c2c1:1aa6:43da])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146f8sm64998207b3.29.2026.08.31.19.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:12:38 -0700 (PDT)
Date: Mon, 31 Aug 2026 23:13:28 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] iio: adc: bcm_iproc_adc: use
 devm_iio_device_register()
Message-ID: <apY0yIA2EX-n3wl8@debian-BULLSEYE-live-builder-AMD64>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260830170919.470974-6-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830170919.470974-6-mdshahid03@gmail.com>

Hello Mohammad,

This patch looks overall good.
Two minor things inline.

On 08/30, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Use `devm_iio_device_register()` to automatically unregister the IIO
> device when the device is detached.
> 
> This removes the manual `iio_device_unregister()` call and makes the
> `iproc_adc_remove()` callback unnecessary.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index 11f2bc12c19a..38a153d6fc70 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -570,7 +570,7 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  	indio_dev->channels = iproc_adc_iio_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(iproc_adc_iio_channels);
>  
> -	ret = iio_device_register(indio_dev);
> +	ret = devm_iio_device_register(dev, indio_dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "iio_device_register failed\n");
Optional change, the last return check can be skipped.
	return devm_iio_device_register(dev, indio_dev);
>  
> @@ -578,13 +578,6 @@ static int iproc_adc_probe(struct platform_device *pdev)
>  
>  }
>  
> -static void iproc_adc_remove(struct platform_device *pdev)
> -{
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> -
> -	iio_device_unregister(indio_dev);
> -}
> -
Now that we won't call platform_get_drvdata() anymore, another thing that can
be removed is platform_set_drvdata(pdev, indio_dev);

With that dropped,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
