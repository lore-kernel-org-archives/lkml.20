Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8100E4825A9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041627; cv=none; b=N9rsw1Tw5DCH/VdXomNN7WshmfrQKVyvHe0VAjFLvsdQthrfNyy4NQInrsG5eDBpDjE6zVWbDCsq/qDbGbGtLiZyGNQW7GdtT2HMxVekAAecFmeMxNdcYuYGrkL/gPRpD3/HPIrbG1Vq3ScfIMShNIO7HwHVWg6lLuIkQRjLjYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041627; c=relaxed/simple;
	bh=SuCYwE5oknKNsTLVxdNIWhoLimR5fxgpi1LmNTb9Y4o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AdnFiuxBEcOdzbM/UqClzdbQEWHaSbLSGJ8Ns48RK+097GDvHF0gHCD0iHreMj4Fa66T7zDpd9hOb4MdztOgz52s0wH1ZcWizYnFqAtIMqPzjZXTpX8RW9ktvaGmWhIVupkPGe2OCLHNXTS8JpVDN/c1/vxqIsK5LdnoLmKKpPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZPq0Xlx/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HBD1njNH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZPq0Xlx/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HBD1njNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789041624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ALPxfFLzOB6fxKhlvV9SFvjlK6DXyJ4C78Re9ntQdk=;
	b=ZPq0Xlx/uk/Z+XgAk+xXbfgkX68QsagiOHskq0y/zCi0mLw4P7un2Am6HWajsyXHmIF/f4
	yPvVeoy+mlCOlLDTq5bNr3/5Dmz0i3UVaYeVcF4HziqUKw62W9xYrHS/pg7gO1qeT32onm
	SiFvNLfGR1opbqwjCaJXotxWlLx0lVU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Rx17nq7kNz28HmYBB_-3Dw-1; Thu, 10 Sep 2026 08:00:23 -0400
X-MC-Unique: Rx17nq7kNz28HmYBB_-3Dw-1
X-Mimecast-MFC-AGG-ID: Rx17nq7kNz28HmYBB_-3Dw_1789041622
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-485866e0066so3858198f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789041622; x=1789646422; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ALPxfFLzOB6fxKhlvV9SFvjlK6DXyJ4C78Re9ntQdk=;
        b=HBD1njNHNcknFxteqxh96T7PXPNru6fy9VOyHxHCoA12mVTbfJdt6GgdITCRu04MEB
         Of9GnWYYREy6seRhERb2U4Pc8ddy9SsCT24L4uVi2i/hhr730jQW/4MzyFU4tZxePrN7
         dkU9iVaTt+9BWFbVKRztIGVQilk6EE9VFoSOqT+CwvNaHWCKuE0h92PjKuRdJZDirGAU
         fMvK8NTjStI2i4sR+tTewOkyAjPNCcHl6Rj2cuvO5e7b8eZs4Vs7Kr1wUi7XRx3hMGlg
         a+0rejLSarMc/vZQDR9H5Nivhm6hzPHMlvvrEkvVh7c4IuyZso7jX213Yyk1KrPqV54r
         +mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041622; x=1789646422;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ALPxfFLzOB6fxKhlvV9SFvjlK6DXyJ4C78Re9ntQdk=;
        b=WhiNLJFbrfAExRMKM1Y/Dm3glxm+u6wfoUOncnzrrVg6WnFUoWwHbAEv+CJvLYfdDD
         N/zV1kcUWQ6pxOy34ZHFA687imJeMKqdjldp5oUhUy1JGDErUyB6M+S2vNYDXe76KSnY
         vIOUtIPFla8Zc5zUQWOMTrlio6ENfIedeBsA9zY3sHCAdHHMqpKH5lLNwq0j3TF2+43O
         dLxS3jTXtU72QMv6cdW683CROmtCWuaAuo/NR+wf/RhO8JWHhUpl4FjNCjMvv2krskcH
         Trp/ltSk61ZRIJ354Qc/VqWSWl2qvkk7vFhBDhI1vpt6jpsausr2uE9xhczdiNja4R+R
         h+bA==
X-Forwarded-Encrypted: i=1; AKwUvBzJN4tekjG1Pjmy7iF7aG2RZVWoOM5ei2ljyJENm66LQSO4YM6vN4au/dbQwV7271npeK8IjNb2d6rchG8=@vger.kernel.org
X-Gm-Message-State: AFuF++k+2mUwrhSi0/demVobpz4hj9hT5OeDD7HffUy90+FZXZbTiCxg
	w8K+sV1WHNiUySSfnGhg+nQ0kFDE67m47uWAXYMtn2gimgJvRaC81y7zoWnYYcZ9Gc0gnVS6nod
	2QlbaIpvXxmIHEuZiDISpvPiwSzoeWyAcnvdUfN5QYZuK1ZFrP4/EmoEFPu2CneUDMA==
X-Gm-Gg: AYBFou2KxfRfwFhpDNMXWmB8wWRHkV8bofyDxG54SMPNfrHzdjtS8RwqHfnkA7DFCZk
	n+T0OMm+T6YKYs3bsSUmA1X1+EJdGpwlnLrQYmlvNYzPRU343NaJA9JEH/RKpDLtSWu9+s/2/BU
	BOpm5g/VkpGQ5gu6eRWYYMA8+KIPgpEoTIDK+mDicd7GAbEUEYLtTTF3fI6rRCWJytK/NIpWSUU
	fbuZpR+dYd7uFaafGZbluv1xuzTBzw9L17c7brPaxudUY3MjpsIDHBVCRplivL+xTEYEItUNc1w
	siTvSSlI/n90irsGHiDG5WJ73o96KkETJCEUwWqn3TjjrBIJIY7s8nuH7mniaVff24A+2s6wX/1
	NIaPs3ndXgtQBLHvU5LLdzx1blEwknPKdxet2s5n43n1piywBSP7BTsaLCg==
X-Received: by 2002:a05:6000:608:b0:485:8e4b:3d34 with SMTP id ffacd0b85a97d-4858e4b3ed7mr39816598f8f.5.1789041621538;
        Thu, 10 Sep 2026 05:00:21 -0700 (PDT)
X-Received: by 2002:a05:6000:608:b0:485:8e4b:3d34 with SMTP id ffacd0b85a97d-4858e4b3ed7mr39816517f8f.5.1789041620938;
        Thu, 10 Sep 2026 05:00:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm56930489f8f.12.2026.09.10.05.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:00:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com, holofermes@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amit Barzilai <amit.barzilai22@gmail.com>
Subject: Re: [PATCH v5 6/6] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
In-Reply-To: <20260823111959.17029-7-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-7-amit.barzilai22@gmail.com>
Date: Thu, 10 Sep 2026 14:00:19 +0200
Message-ID: <87tsnxl3jg.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> The Solomon SSD1351 is a 128x128 RGB color OLED controller. It shares the
> SSD133X pixel layout: one 65k color (RGB565) pixel per Segment, written as
> a bulk transfer once a column/row addressing window has been programmed.
> Add it as a new SSD135X_FAMILY rather than as a separate driver, so that
> the ssd130x plane, CRTC and encoder infrastructure is reused.
>
> Give the family its own primary plane update and disable, encoder enable
> and backlight callbacks instead of teaching the ssd133x ones about a second
> family. Only the callbacks that carry no family specific logic are reused
> as is: ssd133x_primary_plane_atomic_check(), ssd133x_crtc_atomic_check()
> and ssd130x_encoder_atomic_disable().
>
> The data path differs from the ssd133x family in one respect. The SSD1351
> only starts accepting pixel data after an explicit Write RAM command
> (0x5c), while the SSD133X enters data mode as soon as the address window
> has been programmed. Emit it from ssd135x_update_rect(), which both the
> damage update and the clear screen paths go through.
>
> SSD1351 differs from previous controllers in the command protocol. While
> the opcode is still sent on the command path, the parameters are sent on
> the data path. Introduce the cmd_params_are_data flag to struct
> ssd130x_deviceinfo and let ssd130x_write_cmds() split the buffer in
> accordance to the device specifications.
>
> The SSD1351 also needs its own init sequence (ssd135x_init). The remap
> byte is fixed at horizontal address increment, COM split, reversed COM
> scan direction, BGR sub-pixel order and 65k color depth; rotation is not
> supported.
>
> Contrast is calibrated per color channel as for the ssd133x family, but
> the three channels are parameters of a single command (0xc1) instead of
> one command per channel. Add ssd135x_set_contrast() for that and use it
> from both the init and the backlight update paths.
>
> The SSD1351 is SPI-only, so only the SPI transport match tables gain an
> entry; no new config symbol is needed.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> ---

[...]

>  static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
>  			      size_t len)
> @@ -271,6 +310,17 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
>  	unsigned int i;
>  	int ret;
>  
> +	if (ssd130x->device_info->cmd_params_are_data) {
> +		if (!len)
> +			return 0;
> +


Can len even be 0? If that's the case then I guess that makes more sense
to check and bail out early regardless if cmd_params_are_data is true ?

For the !cmd_params_are_data case, the for loop will be a no-op anyways
but still I think is cleaner to check as the first thing in this function.

> +		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cmd[0]);
> +		if (ret || len == 1)
> +			return ret;
> +

The len == 1 case is for commands that do not have parameters right? I
think that adding some comments explaining this to make it clear why
there is an early return.

I'm happy with the implementation now, thanks a lot for bearing with
me and your patience iterating over this series.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

