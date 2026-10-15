Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B32D94B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058244; cv=none; b=Jyy72MTD7C1JRYdDpOYaBy6JLoSsUZ4FCzBnT6sQYGVGN0uP+og9K+22mqljDlaxdtmxRr0ia3pfIQKvqdmddgdPobuqHi0F81lCQxXVxkeB+0utYjcB96oB4Ny8F8BsW0l1prdq3pe/JmQ4YnYG7H0pJcEW5OtYenHeZZ1c4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058244; c=relaxed/simple;
	bh=Vcpg5Ng0i/EHdvmmrvArRIEvhgYxHv9Uj5mRnOW59Ag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IvVWqWrhtG9hl8zdYpK1POJH6d8uAPO2XBe/ef9IvQz+e4/Vp8kSKj6+jmEp/qkz9alYM4+4kjp3zU9aop6ukA5nykvD17ScpE7wdFi3JXa0YvkX2ScYsub0E/2oyiMy2ObB5hxfKCj5j17ta0ORES06fOPWicQJS0Y6VpzJOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VsTzGSRH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QwmZfgqS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VsTzGSRH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QwmZfgqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792058241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/QMHA+JTRfz+5hNc6KeHMze6xpzQ1+15CGj5JBUuffw=;
	b=VsTzGSRHqvsMfrriWMeiHbi7zvo3HeF6GZy/9YXpMr829XWjYH09AZzEq2Y31xb3AvV48A
	qj4m2aHv9O7re9oNWtD1p81gwpQ26i64XKuL8MlYFMmqCveQFTzJL/5p7Jw4BdDyHfkNtY
	d1yfzc2kLpjC59Q5OjJMWLh8QnKbNhI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-V8hiC85rMrij9laU1N8Q5Q-1; Thu, 15 Oct 2026 09:57:20 +0000
X-MC-Unique: V8hiC85rMrij9laU1N8Q5Q-1
X-Mimecast-MFC-AGG-ID: V8hiC85rMrij9laU1N8Q5Q_1792058239
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso4111329f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792058239; x=1792663039; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QMHA+JTRfz+5hNc6KeHMze6xpzQ1+15CGj5JBUuffw=;
        b=QwmZfgqSpf3K0+TGN5FzLL4mqyEwbDLfbce5eMX0fkRXONKngQc26EJGdCFOH3jewF
         PjJVdfWA04SLmNFRnxqW9DNurG0lMM2sZIi/NiZc/HyFnoKhWXlTAhJQvKUIQUkOFFKC
         QRtQEzozE5obNpgF0nO0CWlM4EpFVaOjrXJeBoBGCxoKXRTH8ZmfOxAqmeRq4Xy+ms0j
         hEGlpf20QC291jfhKhVUwf85Dv7zVmBcUn5L2s253qnXiJvEEMhLPe2Fy5Lp/aci0ERP
         zJVYDJSOZn0kY2ym+WaJ2hCZcEhreEXaiJJGxZBUGjhlPt6O+v+glT5fAy0xbR5z+yuU
         kftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058239; x=1792663039;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QMHA+JTRfz+5hNc6KeHMze6xpzQ1+15CGj5JBUuffw=;
        b=STrBy0hcXaMrE8EknCA/w3aVnYOFvNCs00XT05GUYRtAF9ipGjvVyf6n7/PeoIGIRv
         Wfr2tFyshDVDW+DTiMR+tNnhFL7+Sdlg9RgnNae29ot7LMtNI3H6naaeyheViqjbmcnc
         /mr+Dx3rfOK0tBk7oE8mOiEE3pBDdU2onb0cgp1hf2kpsfEoBAR/BAKiziX5+BtU2j8V
         3jm4QS6YUtolQSyh3Fz2l5nGQ4RG8xs6Ns2iTi+Q2QHyhOqJQXelLkWI4hQMs2ujAZNn
         Aa6PcVGwGALzUQY7VXoH7ndYX3y09CiGSZEPrMFjQej1K1y4Hn+pvF0ySsCurA+GWHYn
         cjhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJkB/FrSw6eeqE1rW42etLojSasLZdVQ+L4EGLnDmUQGyrNtGF9pGani9KyD+F8R3S+dtnYUdsLlA4SMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsUkb3Gh7DnSyj7PDBml7FYtqzj/G3a0c4exFIvGvgb09fWIoF
	YY8PjfoN8QD7+hL7CRT1vRCftoUIKxJ/X1t4MMav5Jc9MsnzaznYjUFIvW20yF0Or09BwDnOcx9
	eU/32s8/lXZ8GWk7jDUOVFg9HClxpQuThO3Xqy3BsvAtjgNnU1kSSepJnEg0O8cMxLA==
X-Gm-Gg: AYBFou1jESokcUj9VSXrQWYuhtk0mHf6P6h4t/4r3sBy2jgvoNSdS+cVHnuQye/Nmtt
	DRE4zWR8pYjV9+N/nFXqp0klAes1pb0pwb0zWxxEEq++pDBYC5bQk+eQufcUd55Sn2oKRbJyqn2
	0Uyxz01AtO0S72SaIvCqVoKU3RnhAoLpi/6IId2H0e4HsoCZzYYtncya+QZchUo1ZHE7sfNBuMi
	thziO0vIVwpicApHHcg9lsSw/1xTYQr75x45JZHTD7J29KRCjJmHNcPFrJjLlj58edB0Dm3K1Eq
	1Ek+BtLdl2vuMjHBxHOA2Q599DvxJaS7GZB2soIr7nP44GuGCUUMNQ08IadaGUO+BGhMiQNwouj
	6mbxdVFoGQ/WAvQAGmhOsXmfbXUMEzA/VTFno/wHS+Y1gh6u+FXrfv1HpCfYyEtyR7w==
X-Received: by 2002:a05:6000:288a:b0:488:8568:bb02 with SMTP id ffacd0b85a97d-48dba9e6727mr35188923f8f.23.1792058238731;
        Thu, 15 Oct 2026 02:57:18 -0700 (PDT)
X-Received: by 2002:a05:6000:288a:b0:488:8568:bb02 with SMTP id ffacd0b85a97d-48dba9e6727mr35188855f8f.23.1792058238165;
        Thu, 15 Oct 2026 02:57:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm18236816f8f.51.2026.10.15.02.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:57:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Phong LE <ple@baylibre.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Andrzej Hajda
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
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it66121: fix silent probe regression
 due to reset timing
In-Reply-To: <DM5AEKBARGER.2N6UFBKLU5AIH@bootlin.com>
References: <20261015-drm-ite-it66121-fix-reset-v1-1-473038e06abc@bootlin.com>
 <xlv14iengyes.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <DM5AEKBARGER.2N6UFBKLU5AIH@bootlin.com>
Date: Thu, 15 Oct 2026 11:57:15 +0200
Message-ID: <xlv11p9rgubo.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Luca Ceresoli" <luca.ceresoli@bootlin.com> writes:

> Hello Javier,
>
> On Thu Oct 15, 2026 at 10:28 AM CEST, Javier Martinez Canillas wrote:
>> Luca Ceresoli <luca.ceresoli@bootlin.com> writes:
>>
>> Hello Luca,
>>
>>> Commit e02b5262fd28 ("drm/bridge: it66121: acquire reset GPIO in probe")
>>> rightfully added code to make the reset pin really work instead of being a
>>> no-op, but that change introduced a regression making probe fail most of
>>> the times, at least on some hardware.
>>>
>>> On a BeagleBone Black rev.D the IT66122 silently fails probing >90% of the
>>> times. This is because:
>>>
>>>  1. the regmap_read() calls just after it66121_hw_reset() to read the ID
>>>     registers fail
>>>  2. there is no error checking for these regmap_read(), execution
>>>     continues silently
>>>  3. this results in not matching any of the IDs from it66xx_chip_info
>>>  4. and this results in silently returning -ENODEV
>>>
>>> Empirical tests showed a small delay after de-asserting reset fixes
>>> probing. Likely the device needs some ramp-up time after reset. No such
>>> requirement is mentioned in the docs I could find, so the amount of delay
>>> was chosen by testing: 10 ms worked in 100% of 25 test runs, so setting a
>>> 20 ms delay should provide a safe margin.
>>>
>>> Fixes: e02b5262fd28 ("drm/bridge: it66121: acquire reset GPIO in probe")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> ---
>>> FYI For items 2 and 4 above, I'm sending separate patches to make those
>>> errors not silent. Those aren't fixes, so they would be for drm-misc-next,
>>> while this patch is for drm-misc-fixes.
>>> ---
>>>  drivers/gpu/drm/bridge/ite-it66121.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
>>> index 51fc68ffdf8f..692a85e1e2e8 100644
>>> --- a/drivers/gpu/drm/bridge/ite-it66121.c
>>> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
>>> @@ -356,6 +356,7 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
>>>  	gpiod_set_value(ctx->gpio_reset, 1);
>>>  	msleep(20);
>>>  	gpiod_set_value(ctx->gpio_reset, 0);
>>> +	msleep(20);
>>
>> Maybe adding a comment here mentioning that this value was found by
>> testing and is not mentioned in the IT66122 documentation ?
>
> Sure, I'll add in v2:
>
>   /* Post-reset delay not specified, value found by testing */
>
>> In any case, the patch makes sense to me:
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks for reviewing!
>

You are welcome.

> I assume I can keep your R-by with the above comment, let me know if that's
> not the case.
>

That's correct, yes.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

