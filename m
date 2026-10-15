Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4043ABD90
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052958; cv=none; b=kOcsW4HZB9lqi7tVX5C167SBCLs98o1MtPfSTdEc16Cs64ys25+5D0I77YcNt4EL2ZBcMN3KiKZCRL8W9/BBTeNXTJTZq05ozuf+fQOz4OqD60tg8rVyOiLQTGXy3eb4aafixKjqfPwjNawuyfohJ4wNL6vreJ7UmZRFpFUBC94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052958; c=relaxed/simple;
	bh=4yHo0jxkxzwvqa4dyNy+s98uCpIdE0kge3qev5EKwt4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pA/Lwg3liYVBsMtfnEg1nkx606vXZY6VelQjN/m2P19HbpziGV0WSf1zjlSbUF/6adb4l8hsrjn3RZKY+uU0jDu/+vlYDBgF7v38C/t9/ClgVhUsyv2XlrNV02x5S8cibO1JdRQIfQ7LwTOF2SaEbptxtFbfouDPoXwTDI2jzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R1QFZbqu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oyDkiZUO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R1QFZbqu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oyDkiZUO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792052955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6fmAA4pRjLkz/PBqarAT5jgfTfqNf/gcx018ODCtjo4=;
	b=R1QFZbquFr6i9kTkoKJpTtlGy6CmbWagFX4PTb7KPo0AtpxN39KYH0w0GlaOhzFyln9Wiw
	2xmsfcD2GKy3iuY/tiLJJl6YPfJifh2RjtODe4g/H16lGm6IrT1e8fhP+C7xN4Z7QVc07b
	ddggdyQWLDtGglTcIMhvXYbqwTEKeM4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-fmKrL3gWPyWBYhrqw3q4iA-1; Thu, 15 Oct 2026 08:29:14 +0000
X-MC-Unique: fmKrL3gWPyWBYhrqw3q4iA-1
X-Mimecast-MFC-AGG-ID: fmKrL3gWPyWBYhrqw3q4iA_1792052953
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48b01a74792so3287021f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792052953; x=1792657753; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fmAA4pRjLkz/PBqarAT5jgfTfqNf/gcx018ODCtjo4=;
        b=oyDkiZUO/YdQ+lKh732baFDWkKs6LOrywHSmsceGA/m0CbXrB5eJ1IepNsrthH6KRf
         nqJwQ6Rr0Y0JVBr8e1blprrIzJ3tJkELcUCItMju58Cbqc+HOEjrD4szaaiNKNSPVxRv
         3GgS4NBFTQsoYTt3cPQV2gSB6SNpGi8zNbtA1FRLT4fh4Ve1nQC+3OABjg71IsizdEuw
         HviCJZRvOrBVDzE9ezZpKQmhbr1cvf3KFVI7Bof875+9wjIJZJcQf9i23wh2snZFXYim
         vkBOoPEi7H4FOXE3ELN4fhX6fju+RhVWHivDhPXH086uMSfrNBNPo6BLgygpNTvCT8QG
         yE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052953; x=1792657753;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6fmAA4pRjLkz/PBqarAT5jgfTfqNf/gcx018ODCtjo4=;
        b=VsfHSDxfWwH3TwIFAhkPTp//17VgrFypSHvlDRs2iSmwU7xPHTIB9WN5vHkh1FAd6O
         4oo9f/csDp/U+Og9ZRQ9LhRClbwLEJGOplKwI3TDppDv2A89fXTnLHrtWlwQ1YdEDuGQ
         63t0/R28VhPoTcSvqLL9C5D0xoCnzQSqoWoZHPT4P0F3EDEx6xzNVIdd+2dM3etB5Imw
         L3mTTUQC+aMPMX7ZYr4h7kjR79nCIbh7VWwaySvHk4ZNIWpCNPSFdtgXSs1mGrCphtju
         495t4TX90XIpAWgjAYCczunxFYj7MtPWyyOJn8b2iM6De+w+axfSqsATM/64LR+0ted7
         KYBg==
X-Forwarded-Encrypted: i=1; AKwUvBzckDOwLajMQ4z373dn/SNmuI0wlzNbWKjXN9vAnOcXAeYumsB4Vp3wIVF/BrBpBi0zKe7dpZw+aQlc9j0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlTkuzfPTFhvCoEMSmglhgjQaneTCq0UbewsKmw1f6tv7ZiKuH
	XrzwKgw8jZyTC+mowSVS79BZwxNS6J1KcaU55AS/hOWkHsaP25FKARjk/rhw6iMnn3DNhzLb3Wf
	lAk1OBHmhksBbhgCYEo1MfLZ2YROlQfAKOZ4ufDFgc2R4WtEzTsU3DBvXKvD3yGrm8g==
X-Gm-Gg: AYBFou2FAAgZdHWKEdvoJNRFr79NdjeKnWv7rp2aoa8o2wiSX+7XaleTB4ezacZSyLZ
	4Y2bDxreOxgSS6Xr2FDfXw9R0XSUB7H1uwqCyAZKoCr1Jpp9bfWwRHwljKZU3ufgW9VjXEexAN4
	VaXe5x25+G2GfqzXPCNLbt97XDFGOsovz0Ndiq2/OucfQCz1GbnwQVX7ujRGt98Z5y7QmjEDPJd
	hw4SVYgs4E6pLcVAArb/Uy9PbiahAMpgZ0mf51aeifl8bVR9LZh0V5xpsQqLfhzD5c+EUlC2JBi
	rJx2o18BD65pKBjzKOzLX5cFYMMaKjLRbV/5s1zqDK33b9fBGKXGwUZ/NBGzgjkMeDJuuOS0lRJ
	Sw/F2AwbLBD/liVtbUCjre61p4NQiZuVwKrw=
X-Received: by 2002:a05:6000:2085:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48dbacf126amr34728396f8f.47.1792052952397;
        Thu, 15 Oct 2026 01:29:12 -0700 (PDT)
X-Received: by 2002:a05:6000:2085:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48dbacf126amr34728336f8f.47.1792052951831;
        Thu, 15 Oct 2026 01:29:11 -0700 (PDT)
Received: from localhost ([62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df758258fsm1459412f8f.17.2026.10.15.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:29:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Julien
 Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/bridge: ite-it66121: fix silent probe regression
 due to reset timing
In-Reply-To: <20261015-drm-ite-it66121-fix-reset-v1-1-473038e06abc@bootlin.com>
References: <20261015-drm-ite-it66121-fix-reset-v1-1-473038e06abc@bootlin.com>
Date: Thu, 15 Oct 2026 10:28:59 +0200
Message-ID: <xlv14iengyes.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Luca Ceresoli <luca.ceresoli@bootlin.com> writes:

Hello Luca,

> Commit e02b5262fd28 ("drm/bridge: it66121: acquire reset GPIO in probe")
> rightfully added code to make the reset pin really work instead of being a
> no-op, but that change introduced a regression making probe fail most of
> the times, at least on some hardware.
>
> On a BeagleBone Black rev.D the IT66122 silently fails probing >90% of the
> times. This is because:
>
>  1. the regmap_read() calls just after it66121_hw_reset() to read the ID
>     registers fail
>  2. there is no error checking for these regmap_read(), execution
>     continues silently
>  3. this results in not matching any of the IDs from it66xx_chip_info
>  4. and this results in silently returning -ENODEV
>
> Empirical tests showed a small delay after de-asserting reset fixes
> probing. Likely the device needs some ramp-up time after reset. No such
> requirement is mentioned in the docs I could find, so the amount of delay
> was chosen by testing: 10 ms worked in 100% of 25 test runs, so setting a
> 20 ms delay should provide a safe margin.
>
> Fixes: e02b5262fd28 ("drm/bridge: it66121: acquire reset GPIO in probe")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> FYI For items 2 and 4 above, I'm sending separate patches to make those
> errors not silent. Those aren't fixes, so they would be for drm-misc-next,
> while this patch is for drm-misc-fixes.
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 51fc68ffdf8f..692a85e1e2e8 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -356,6 +356,7 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
>  	gpiod_set_value(ctx->gpio_reset, 1);
>  	msleep(20);
>  	gpiod_set_value(ctx->gpio_reset, 0);
> +	msleep(20);

Maybe adding a comment here mentioning that this value was found by
testing and is not mentioned in the IT66122 documentation ?

In any case, the patch makes sense to me:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

