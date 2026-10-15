Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56104BD7BE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061272; cv=none; b=LS9k05EWNnZLRDX6uhYa6Cal3kmiwOhLKraLbWD64bRliPAV4fu/BpcuadqGGpkxwrndUUh1H0yUji/yGccZEpA/WajpQmkAr59lzx39I2Pfk4HRcx6K1Zk8AXbLgatX4zW8MN6BUZWdxuioLR4qf5Pngt6IFrnqH3NK9ke63cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061272; c=relaxed/simple;
	bh=o26KCX//GrYvp5CqNA8Q139+bK68gOk1qeexi9DuSJ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KpIgZG/Ypt2quh8yWbGnnn0jlq9K9slJ+9+MPB4ERz/aUGh2hPYKyQfLLS/sOllo6XAw78nqDLViqWBvGweiWKRkIEUcr2RxEKDz6OzrsaDswZN/y8EXrmeBswdUE0Ucq4MGGmw1eh8PQFAbjHf5XtxEJ5IPmuas2mevwEyRhpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B2/P3KZn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JbLLzBdR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B2/P3KZn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JbLLzBdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792061269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5s0adaAlZjmhtDx9aVR2qtB46fnKw4HK1vTEiIYxT7o=;
	b=B2/P3KZnE7hRF12t/3+Silc8u3Sn7DNRPUAkP5mxPkKZs02npXewa8LzvHpAuegx0+994Q
	AsaWiwCUketh8irrFC4F0djwD+r8m6OJyKjojjklHT3LMwFXpxAt7QXHEcOJxh7qCAz3lO
	rdLtmc5wbgWQwYT6+hWeRXX+2q6meRw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-uXuzU1D_MK2TjMRqFQPLqA-1; Thu, 15 Oct 2026 10:47:48 +0000
X-MC-Unique: uXuzU1D_MK2TjMRqFQPLqA-1
X-Mimecast-MFC-AGG-ID: uXuzU1D_MK2TjMRqFQPLqA_1792061267
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1af80b913so28160805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792061267; x=1792666067; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5s0adaAlZjmhtDx9aVR2qtB46fnKw4HK1vTEiIYxT7o=;
        b=JbLLzBdRiH51RECnmh2G6JDLBGZ/TQxAplU2CCprp2T6S98z5Kv98T3d1M4Fa5hk7j
         6V4z6yU1VnVHu7N2aoY3+SX9GG4JuikOE6rLv+R88VStYtPXJd7qfZi4RrW6E24/Yu4X
         9CH25rZ+AP20tKCRIyrK26lSCQjOVKmWXLzreO8up4l0stAbOdaV+CoHnAPeum0IkDXI
         eEY0n5SBhrNzFah7kidpkaRsW0IpG3xYu2cyroYPi1z+Uk1h8bQH8tRsBLrCpKoN6RqN
         aSqxOPPw6iNVNSOszhWUyAyhCg3jc9G5gNh1PkqSTjHdYwhdvtIXfAN4t1Pduwz6U+VG
         PPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061267; x=1792666067;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5s0adaAlZjmhtDx9aVR2qtB46fnKw4HK1vTEiIYxT7o=;
        b=xSo2Jz8QJu8iMdufr4ODDqQdZUNoWLALzUvxFlU1hYM3yz3tkoWLMJWsG99Usm28ze
         Z7oZkzKULpb4xGHzxkp1pgUZ8/jXfS6U058XxriwfGcRl2PwYiWXLBAc/TZXY57M/B4k
         Ra7vWdWcY9BILtHoV7RASYMNwlgLE8RVt03/Or6cI0p0xgZwDEicRu+pt6tpds9/X6kt
         7Cw/gzWmN544LEYED+e0JOSLzRbKiuRQdYleJ7p/SyUFWHhfk1SLPERbTs8xn7EE45dx
         7hkF+G9BkcenTcrVBfBISyyT2JPnHsOXn2wruU56KSKqe7HsHO862/I4VInULaoSf3g2
         UUMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKW6+rdhTTDa3IF9Z5c8a93uiWJOOfeZhUGqI5Rzwve0vLU3l41m+4SQfQDunhwA1Pu+SUxqtgXB94Ysc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVzBIxfKp7GUBT7+0GAijsBqCzHZ9BTfQLhcfYWh0h+aA+sSHu
	+7fRGlCFSNB4s1Jpl1ZTfoe2fW5nYBJs3DuSORZbICv8u/viHGgtFQ6vD01Fr3bfXOm5ubId5Fx
	O+svDxA2urc9NjqDUw7TtQQtZWWaN5zwdwKQ5q2B7PmrMoxkQT+eC9J+SVDwkcUM0yg==
X-Gm-Gg: AYBFou3QUz48lvps24J21ojViapAs0xE0BnXt1EUWIGaBvRaxdRB6rZ08VzGsGwYsaU
	oizkOl7Q+Hh0mw4LeAl2k+w2qePgTu2/V8zw+oIdymcvPfHvxbzY5e78B9uwwKS8Yav3ust5MEI
	04HwuXkIf7AIhFtKec0/2f8sr13F/fHm7lbHCQjdxOPSl/u2n0y8GCo13TEV4eldgszMg4DI7BO
	E1jb0Wq5IVRTS+g4m/TaALMcOLRDyhXQd3cNfz5s2jos4VWnvotfB4mCWFu/LYpTH/pNVP09u7Y
	kmXyGYmVMqtskSizXIg0+lQPthG2WpW0apOBZR1tWaMLu5C197kR+39pJi37h0+mdYgk7JY8my8
	NMEpiCyXE/9Ml0DkSvrp0CSHi3/zP3F9vmelQGVKIfGkzAt3VQnhv2q0Jr8mPU4/cWw==
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr367295125e9.27.1792061267389;
        Thu, 15 Oct 2026 03:47:47 -0700 (PDT)
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr367294625e9.27.1792061266913;
        Thu, 15 Oct 2026 03:47:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68585csm39353835e9.4.2026.10.15.03.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:47:46 -0700 (PDT)
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/3] drm/bridge: ite-it66121: improve reading IDs and
 log on errors
In-Reply-To: <20261015-drm-ite-it66121-log-probe-errors-v1-1-7fd6994e0be0@bootlin.com>
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
 <20261015-drm-ite-it66121-log-probe-errors-v1-1-7fd6994e0be0@bootlin.com>
Date: Thu, 15 Oct 2026 12:47:44 +0200
Message-ID: <xlv1y0bzfdf3.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Luca Ceresoli <luca.ceresoli@bootlin.com> writes:

Hello Luca,

> it66121_probe() calls regmap_read() four times to read the vendor and
> device ID registers, without error checking. This leads to silently
> continuing using invalid ID values when any of the reads fail (which has
> happened and is being fixed [0]).
>
> Adding error checking on all 4 regmap_read()s would be annoying, so switch
> to regmap_bulk_read().
>
> In turn a bulk read requires a differen data structure, so take that as an
> opportunity to make the vendor/device ID computation more explicit.
>
> [0] https://lore.kernel.org/r/20261015-drm-ite-it66121-fix-reset-v1-1-473038e06abc@bootlin.com
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 692a85e1e2e8..9b43456c67a1 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1580,7 +1580,16 @@ static const struct it66121_chip_info it66xx_chip_info[] = {
>  
>  static int it66121_probe(struct i2c_client *client)
>  {
> -	u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> +	union {
> +		__u8 byte[4];
> +		struct {
> +			__u16 vendor;
> +			__u16 device;
> +		};
> +	} chip_id_regs;
> +	BUILD_BUG_ON(sizeof(chip_id_regs) != 4);

I think that would be simpler and easier to read if you just use a
u8 chip_id_regs[4] variable, instead of the union.

> +	u16 vendor_id, device_id;
> +	u32 revision_id;
>  	struct device_node *ep;
>  	int ret, i;
>  	struct it66121_ctx *ctx;
> @@ -1644,19 +1653,22 @@ static int it66121_probe(struct i2c_client *client)
>  	if (IS_ERR(ctx->regmap))
>  		return PTR_ERR(ctx->regmap);
>  
> -	regmap_read(ctx->regmap, IT66121_VENDOR_ID0_REG, &vendor_ids[0]);
> -	regmap_read(ctx->regmap, IT66121_VENDOR_ID1_REG, &vendor_ids[1]);
> -	regmap_read(ctx->regmap, IT66121_DEVICE_ID0_REG, &device_ids[0]);
> -	regmap_read(ctx->regmap, IT66121_DEVICE_ID1_REG, &device_ids[1]);

You should probably drop these defines if will no longer be used. Instead,
maybe you could define a IT66121_CHIP_ID_REGS_START or something like that?

Although maybe is good to keep them as documentation? Not sure about this.

> +	ret = regmap_bulk_read(ctx->regmap, IT66121_VENDOR_ID0_REG,
> +			       &chip_id_regs, sizeof(chip_id_regs));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Error reading device IDs\n");
>  
>  	/* Revision is shared with DEVICE_ID1 */
> -	revision_id = FIELD_GET(IT66121_REVISION_MASK, device_ids[1]);
> -	device_ids[1] &= IT66121_DEVICE_ID1_MASK;
> +	revision_id = FIELD_GET(IT66121_REVISION_MASK, chip_id_regs.byte[3]);
> +	chip_id_regs.byte[3] &= IT66121_DEVICE_ID1_MASK;
> +
> +	vendor_id = le16_to_cpu(chip_id_regs.vendor);
> +	device_id = le16_to_cpu(chip_id_regs.device);
>

And here you could use get_unaligned_le16() instead, to not have to cast
when using just a u8 array.

>  	for (i = 0; i < ARRAY_SIZE(it66xx_chip_info); i++) {
>  		chip_info = &it66xx_chip_info[i];
> -		if ((vendor_ids[1] << 8 | vendor_ids[0]) == chip_info->vid &&
> -		    (device_ids[1] << 8 | device_ids[0]) == chip_info->pid) {
> +		if (vendor_id == chip_info->vid &&
> +		    device_id == chip_info->pid) {

I wonder if this could be done in a separate patch.

That is, keep the << 8 | for this patch and just do the regmap_read() to
regmap_bulk_read() conversion. Then as a separate patch you could replace
it by converting with le16_to_cpu() or get_unaligned_le16().

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

