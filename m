Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EC361965
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534564; cv=none; b=RzQhJyb/zMCQB9gHMARdEghRcvWI9jiRbB+o9F9lb/9MAe+NDbN2QmnpoizaEX9fvF8SM34NQ89fvaCJ0czyunuXH+iNuiaAQLwR3ha1L70u3pz03/LlA4jFjKsm2kGTG17pV7QVF6ehA1BHYcoFdtB5mPSmVGTOxWg4q+RqQkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534564; c=relaxed/simple;
	bh=/y3E593iRUA37jO7B38pBXA7r37+dX3kgWb6Dllnr30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1jlel8HWpEOMQqW8BXar/TLgO30zrIN9m3d5NIECExISluMaE3JnULTtuSOEdeghb70xwwnN6eYPzUpbp5bJy6ma8+iEBDp/gWUYG4L5yZlVrqm1nthSPVaIptuIPFxatUfG/qLGToZZxm7gcgYqkNbYqSuHm8bvN2DkxhkdXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw7jm/qO; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dw7jm/qO"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so4668475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534562; x=1790139362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NH5SR9jg7eNT12/RBDArov96uanRr4HR7KrIlDgUX+4=;
        b=dw7jm/qOs+Zdasl6A5QzGg89Jluc1GsMiN3uCNh4DUsqJhagQh6gabpmqlyS4vTMyF
         kXQXxPlM6IU66Pctwrxbwanvrv2pRXI4uSU/kINNH6zFKUGcQiAr+hfXojoif/xRTpZB
         XwTHrG5+XbxSWmF4CkRZj2gKV/MD3tXHinD4lgLLjX2eujiLC+1CGFVXvq2JqN640M6H
         0LAV4DJneQFVCJEuaCAk3UlF/WqA+zEpEBP9zQtoNZWRE0mFQTt9dMhwcxr4WuF+voKt
         nGALsx8JvOl3cTmpBD0Jf3Zq2mLoHZSIOjnGKygG2ghcgYsS57mSiYQ0EhEwmSWp+46s
         YhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534562; x=1790139362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NH5SR9jg7eNT12/RBDArov96uanRr4HR7KrIlDgUX+4=;
        b=UC61fueTYCbwELvuvqvBUOEAinZe9iGbkGzrV5W0st8qPHTFB0oG4WDHGMP+uKT1ox
         wCHDsab4h6Eo7I1bHxJ8zEogM7Pths7Dt8m1MWMnddyhkur5ShHPh+nwWQIQYR9aZTHx
         V0ud5KHEpOOHQTyLGlErBtG8m7vrr6xQ2D2WcqkjArej96To2AfNwoEw9J7ySPGcw0Wz
         euEnYGMNJ4HPhxJZR/44z9DddqVxzq2VAcFI8Don12BgukohZC73pUkmyGbZUal44N8p
         Wpa0jYlc8FuwzoRRtJNYDFPkPbv+Vh4KqwFG/LV8T6FL+SgVRWB34rraCzXTaXZk67Tg
         1log==
X-Forwarded-Encrypted: i=1; AKwUvBwduJD+ge7PqPQ3YpLSCKHBFOMRjzAGEWHNOGsTfWSn1qQH6Vvb0XuhHd3pxQ1S38f7mIxlLqBotlFADgk=@vger.kernel.org
X-Gm-Message-State: AFuF++mvxGfWF48tmOf9EIMa3Sy025gtNp5awhjJPcuceIEL9EQVnQcW
	vXLKg/BAQxM1rGLUa4GMTQLbo8SIC9wJyreufg1yHhy0hcYphEUdeLSn
X-Gm-Gg: AYBFou2e6RMVWPxYXABYTI/tQJQOyZtH5b/ViZoYSd8Q7rc6jdlxW/eDIYeQh7z06SI
	k5Pt3CaolHx9MiEo+JQseNcHDn0II6l1HkcHRa/7MFAqgB9btAhEJOcclOn1rQbJKjUfmbfWZfK
	nMNwv/ECmmyfSVUIm2RpVrc3MhNahb9kvytmLJwVFM74weLu/S0fwgaiNwbzqx9FbL71GAzaYLL
	w9liTTakZT3bhhMrVsrXAVA2UYqzab6kJweTZPIEplLVY2An+6Gs94BVecSDdHUi+N8WyoRNCG3
	15WEznFdzo+YkC2erCrpilbsEyUVL4gcNyMwYYaGnkh9GhDqsOf4uLUDPgEt4cw/+oBQ7qZanEz
	RccqxC/lAAPNwPAMCVHim8b6UfIl/uMVqtR4tmus+ftlS1VXb5gZEbR/lmynJkSngx9yomeSiRW
	CvAi/npB46aAwzn/iZdOi1s5EG4auhy5SDxUN68KfL5Fg3CtEy0c8UB+15yufbGkHLLkAL0m5Bs
	/r5ezfNFL3UrSDjjw==
X-Received: by 2002:a17:903:2f91:b0:2dd:9112:c4c9 with SMTP id d9443c01a7336-2dd9112ca94mr10220955ad.7.1789534562517;
        Tue, 15 Sep 2026 21:56:02 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm9261930eec.23.2026.09.15.21.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:56:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:25:54 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl, lkp@intel.com
Subject: Re: [PATCH v2] crypto/amlogic: Use devm APIs for clock management
Message-ID: <aqohWhV8HLW_J9AY@kernel>
References: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>

On Tue, Sep 01, 2026 at 08:12:52AM +0530, Mohamad Raizudeen wrote:
> The driver currently gets the core clock and manually enables it using
> clk_prepare_enable(). This requires matching calls to
> clk_disable_unprepare() in the error paths and remove function.
> 
> Switch to devm_clk_get_enabled() instead. This lets the kernel handle
> enabling and disabling the clock automatically, which allow us to drop
> the manual cleanup code and keeps the probe function simple.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
> Changes in v2:
> - Dropped the devm_crypto_engine_alloc_init() change due to build
>   failure reported by the kernel test robot.
> - Kept the devm_clk_get_enabled() clock cleanup as the sole focus of
>   this patch.
> - Link to v1: https://lore.kernel.org/linux-crypto/20260821151303.8150-1-raizudeen.kerneldev@gmail.com/T/#u
> 
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 169c6eeb51e5..6f4c62ddaf89 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -243,10 +243,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  	if (IS_ERR(mc->base))
>  		return PTR_ERR(mc->base);
>  
> -	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
> +	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
>  	if (IS_ERR(mc->busclk)) {
>  		err = PTR_ERR(mc->busclk);
> -		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
> +		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
>  		return err;
>  	}
>  
> @@ -261,15 +261,9 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  			return err;
>  	}
>  
> -	err = clk_prepare_enable(mc->busclk);
> -	if (err != 0) {
> -		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
> -		return err;
> -	}
> -
>  	err = meson_allocate_chanlist(mc);
>  	if (err)
> -		goto error_flow;
> +		return err;
>  
>  	err = meson_register_algs(mc);
>  	if (err)
> @@ -290,8 +284,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  error_alg:
>  	meson_unregister_algs(mc);
>  	meson_free_chanlist(mc, MAXFLOW - 1);
> -error_flow:
> -	clk_disable_unprepare(mc->busclk);
>  	return err;
>  }
>  
> @@ -306,8 +298,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
>  	meson_unregister_algs(mc);
>  
>  	meson_free_chanlist(mc, MAXFLOW - 1);
> -
> -	clk_disable_unprepare(mc->busclk);
>  }
>  
>  static const struct of_device_id meson_crypto_of_match_table[] = {
> -- 
> 2.53.0
>
Hi, 

Just following up on this patch. Please let me know if you have any
feedback or if further changes are needed.

Thanks,
Mohamad Raizudeen
