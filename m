Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936732;
	b=t4Og++LCNVCV8JklGLN8h/p8erVgwTNqKsZhTh84MpM2X9BIBCrI3wy/vIv0iJLnli4M
	 TgonD0Bg4wgqA2y6UeKm8Z/W2sK0rEL+A3OA5PE7hQLDtzq+Ms3QgfDDSsflApDycZfHH
	 McycJ/yrMkSV7soQQPAKb8MycWKegP9TYOfmCEbGAQ3eGw8/080jbDdjM9yldjQMMuEOf
	 47nCWx8xpa60MAx0JY9izDoLmYRWkjyx0bKAwoRFcdR/xU9mfOmsxaYMcg75nxS/EazMS
	 1wDjrotyvt96RKXRYd7eDUNLpmgdoRygkz0SMxQ3+QCm8pu4JViiH+gz2m49G+Pz4gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=so8lfUIk2kpbn92EQdY+sr4PHE6OnQZjUslmbfm4DwQ=;
	b=zkiBwE1VD8eiKEO1+CKFRIZ6WXGpvyPgf4dhGa3onSD17oHJF1PnavpJSLrZQkXpyfqC
	 +I0g5h6PkewfD5TjSTolXRnXsIvMVAP4U4+kbewCPzFlyCSbiDqquExkyaHt54ZIZClUO
	 6an8IpfjZrVO37L2jT3s6OE/yb/VRdnk6J9hIC60FYfHZsJOPcU18jDeDb78L+hfH5U3i
	 4x/1FXpGD4PFGtg1iOUR/CBNvKIpTQI42X2eBvVC0mMUVYXtuL3hfoB+kIalDz9GIAlMz
	 5MbcHMP2PWKjNWJBCbod1klRaw2DJK23UpE5j9Urfc2Z+f2ucMM51IDJC829bh1UbZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="roEio4p/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E4E606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E4E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=roEio4p/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso14374455e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936730; x=1793541530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=so8lfUIk2kpbn92EQdY+sr4PHE6OnQZjUslmbfm4DwQ=;
        b=roEio4p/SNDt1lLBBpyDRgA+J7X49aiBxo0+pbSw7SD3P7aDyAJjyw9GQ7VCwqZ8hm
         Bo9H0wgpNLrpfWBiYcNqRGKCVBaILlPji8KqTZHY943o52QEEomGAyNNuM/8i2gZs8xg
         Pd0I7l+B7ZBxgxyhNBrUqcI17JBeHr+nl/d2pRPIIsudVuJ3p55qCIjw6G07CPmDSU1X
         lMRum9TYcZA4bBO4ulSXWbkneSrKu33N9VJwSxBW3pQuiHODrfMvDoEohcEKnyXfzbLq
         3C8iNZQHi8EXAc3CYSlYqqZAjDfZ6s1C7Y2Wt5JConmNy/qvMXicIe+6tJuYhcTD3LAp
         C+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936730; x=1793541530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=so8lfUIk2kpbn92EQdY+sr4PHE6OnQZjUslmbfm4DwQ=;
        b=QVOwAUYt+jZw6hPaefZUc1nePDKgYSjKb42PxOpL7T2RSRAs9U7fm+NXSPFt69eWVA
         CZf1eZ6bLysZssCwVxu2WSCORYTjYuU/18/1PzTeDGplsDOCQ9pQH+vGI6tdxDoFsnkY
         3UwmbfaJ1KJRqauPVKxHNG1eR5bPZTleOwipmEcVZ7gcgDEfxruZC/6cBoPxnyxLcodZ
         IyV9WeN8Bpd1w6utL0EFfrO2TDqzTuGLACfsgYrR6kPLg8zpQMW/IW81k3jloINuQ9Nh
         EHUgZWWIu0onKevyn1SSdOkjKglCxxOgxCOupuoYslAMuehu8xW8/ErzWTwJXTL9Wt8P
         7FXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxMaLkwdJc24Dc66RhYVt+Q82YmT1X8A3GmGzLLY/lDAx9tnx/9hUsxiaRvFLPu5FS+nCooUuHwX3AjmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzBBKKYFbfJjIKzFbeD+uBG8sWX2ODVMkY8Ve0ZykWgQiGS44K
	wx70RSYPMjdxJDGE8fqeTMJNsDmRwjEYR8QMV2rLUtaIsojEHJ0RAs2I
X-Gm-Gg: AYBFou2WMkF1Aiig5TqqSLGHCGaEEX42MDVVpQd4l+GTiG4IuSOb+BTh9E9rjorgHOn
	UBfbqXHVTj6khZNltjycBf8BqoFLOZmTyPUk270fCyJd8KoyNBcs19F5Vr51oRpyl6utHUeYMAQ
	qMOgPRE3F4jFABEXVvkpDU2osbVDPmPisaOzlG5YcOVJOatEAfOAayFZeXb8Wi1RTfk1V8krKtw
	eVKCWhptTmrhKEBa7h9hhUOnl6W4MQZuS10z3HPRmfPxbOnLkga1gZIMw1cJ9dHI9e4FmATOxxj
	mu7c/fAt95dUCfQU4IM2Zvwf4uzfnrhnPClRRVoJtwLMQox8k1+WldEHuT8Oo2xbICPqigxUn2h
	7BlPtPdHU2a/9Q/B5Jld6MpoFB/nUk/F9izO2P1V4O1w8Oo1UblbHkFSiq0AxMNhIuLF7j5yErV
	D9nWe5+Os0WqZ1UG5ypJXVC4BG8buG94+k3mCLDu6T3NEARLA1g2/nAuykD0Sn+mINOJAgt1xPn
	UxC/YqOHWiNEZ2XYOffEKmivysJ8XQsp2vtKt9ujbBnxAEXq+kHgeW1YKCQiTZRzldDvaLF7Q==
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr75846955e9.24.1792936729550;
        Sun, 25 Oct 2026 06:58:49 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a09434esm123575575e9.0.2026.10.25.06.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:48 -0700 (PDT)
Date: Sun, 25 Oct 2026 16:58:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Haasham Khan <haasham93@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove unnecessary goto
Message-ID: <at4LFOUt-XGzBAgS@stanley.mountain>
References: <20261025130258.10747-1-haasham93@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261025130258.10747-1-haasham93@gmail.com>

On Sun, Oct 25, 2026 at 01:02:58PM +0000, Haasham Khan wrote:
> The error path in hw_sm750_crtc_set_mode() jumps to a label that
> immediately returns ret. Return directly and remove the unnecessary
> label.
> 
> Signed-off-by: Haasham Khan <haasham93@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750_hw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
> index c4358d3e5091..22f93277e91b 100644
> --- a/drivers/staging/sm750fb/sm750_hw.c
> +++ b/drivers/staging/sm750fb/sm750_hw.c
> @@ -272,7 +272,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
>  	ret = ddk750_set_mode_timing(&modparm, clock);
>  	if (ret) {
>  		dev_err(&sm750_dev->pdev->dev, "Set mode timing failed\n");
> -		goto exit;
> +		return ret;
>  	}
>  
>  	if (crtc->channel != sm750_secondary) {
> @@ -332,7 +332,6 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
>  		poke32(CRT_DISPLAY_CTRL, reg);
>  	}
>  
> -exit:
>  	return ret;

Change this to "return 0;"

regards,
dan carpenter

