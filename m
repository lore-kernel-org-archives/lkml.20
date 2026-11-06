Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975988;
	b=0cxS/vwMNTmQZLS3UYh30KaejPBxgwmh+1a3D+ndefYFdX+3VXtkEwwEdEjMsgB3D2IZ
	 dk6w21h/J9tfEjXnJQq2/PyF+1vTUHFDtZdgVoBBgzl9Gr1W/GTzV7tMox6stTar4hHXR
	 KgU1UfTu+ikW/LvVif0u9VhqVDbgTpa9oO87Z1p1mHwDGv/xTg2TrsjUggFlfFWzZboRU
	 PyYBgmjRf/KSL4W5mvtxDLItGBSOWRIhB+ZhIr8z52+fqyCNAYh0BdmZO+GA2ar8xN4dm
	 1rVfkw6wnYXBykqbYiAEINsfEQAUvet97WlZO2r3JTpPr/tZsbrI0zxL4bhqH2fleJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ApDnH3pFxBWP98MgBtsP9HN4PO7e1RUuQTYY+krhQJU=;
	b=qWRmqnF/KektdZui4hX5qeyEGwAnQr9xxb+k+RgWoY7Q0gzYUzjzAQ5BqPW/g2eH1e9B
	 SwWxHsAg3W8nHm2OkSwaf7yQUW/4nTSErjnB6SBB4J35aPU+3Z0KH+9uQ6e4PBB+duZdl
	 QmlnHlONMs9HUJW+1E8P8LZsFBWAVXj02eFcnpSjUFIB0x990iZikfr3QEHI31AqrZZvn
	 1SBDrCvu0BGfRLwoES9mEni1LKHb0XYt33IyycjKETABHaJ3yhA7ucA5GzQqvzJO2ZWPy
	 BceGzgwq+AbnuKya0hFLVwryOQ3YufVIq0Btu62yiDxYnHgXEle9I6c2eOaW3wXO7Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HMuZsBwp;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60181606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60181606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HMuZsBwp
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e4831c028so727210f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793975985; x=1794580785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApDnH3pFxBWP98MgBtsP9HN4PO7e1RUuQTYY+krhQJU=;
        b=HMuZsBwpcfAivI2lXFwbYHDyA3Vw6WCNBWtFOSYGJZoCHxfz1OymiMRSlR/lKeaMFE
         aluqYsF1IKKMjWhqmjXTz7ptCe7e8VnCClInCxGQDoYD6iJl4CgqWh+/Zu3LCi8Ded3U
         oBYv7EuAjYNHWLeKwOx5QNNK5ZcVXBY9ijAvS7C5ca4YfusYRBQQ0V3iV7vEyBFGHEov
         MhSaNTw6GLWepT/bzLxyu8n+Ub8DR/jwgAe79rSh39mDQ75t9uatpjkgSEsxRajw2V9A
         sw3hssJwDR6o3RpVUdlTnejAC+7BirubMtZDytWchhQ7mRA7aZAQFP0h9UXHHTe2FWZU
         IcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975985; x=1794580785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApDnH3pFxBWP98MgBtsP9HN4PO7e1RUuQTYY+krhQJU=;
        b=xOmS5upw2CVte/jxdDES3coRjAoLCUIJo7EV8//Ep2OxgBhyuhXr/Ice9mHY/wNwM/
         ov2cj9lzCucmT2uQLCA+DTa4cs98c4pVYCjj6+dHSV09lo6AmqLRqesx+mj6yq0yH9RF
         qrVcKztXsseJP2pnik+iOWWW7MWtgVPuF+9VzRBlrLHk3npIYGzgFOZsThk7E5UAP83U
         V1ZWsDykmAmOA+3WEMiclDuoel4WUk3kmMha2mTrnWbpm+b5UZcsA66PJgNotpQAY94J
         ON21iYLFKAEgSR0IG6tH2B5JyfaLId5wNkub9zvhkl7n82XJV5vQ8ac9dgO4BdMEJyjD
         Nbeg==
X-Forwarded-Encrypted: i=1; AL+hErHhZ1Psv8+lzfdow7CC1kpGCcrxCWoQEAvqN9f1MUrxWF/3d7qV4xPWnyv7fBO4Nv9pC0WelaW3dgLnTe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7q8dLZOLUAB5tydQ9AHXUJE8iMR8ZwsWdFzcLtj15QdiXJOpB
	EbaBEnrbfiLOljGyGWxcN4Pov9eg6/EXOc7GmjoHZVWHyO/P6CKItZTC6hyKNYApQwM=
X-Gm-Gg: AYBFou0ugbXACB9v+/H2BTeTgUGcvmIVMjaZxHwXZXnyR0MTxWyki3NyVmjGVGX7b4Z
	foyLnVmfFdsPwtXCvGkJ7YuSOuy+2pvhmc0HeifoRtZjfnRiK5WulrsSaG0AT2orkQEzUm6hG83
	nRFcbdeal7advNnrvHkyulB6Vc5vda0zua4T8twH+yJiQSafiSwRlUlLnNpa+L6sheGPtcC/p4I
	JOjGYO1P/5SHstvKk1QtJmFNayPgknZK6yUGy+aT1APQpRmAOHd9yACI1e4JNfebajrBgmOUuL3
	KaiDjLmdbVw4evrpXUwtNjLBZ2gNbnVApJnW0j2nFvySVph3HunwPVFB6jop4HQQOOPW00dtHLu
	ok8+andB1zpoQfm3URmZ3tJyal/p0SdIOu0L77MX1Lv/ZlWI0nbPvZhua3pRB5lnyZ9GLmS22r+
	QUsb8JcrWc7QHLCn9Qmm8Zmq1+6NfYUtys6LkVHIS/irE+MIc+cWAjkrdLLddROauXk5xY+10j/
	CFlsv7Y6h7JuUhNPXSrYJKml4scaTV4fLdJc3uLT4iUfhqj6BDdLXlqrpLBQ9jxAIO6V7epaG3Z
	qQrKzlk7IaLdRLY1JgNkTGwXPFJIP4nmx23vzj5OmjzSpftm25UskD5/snqOfMU=
X-Received: by 2002:a05:6000:1861:b0:493:803e:800f with SMTP id ffacd0b85a97d-493803e802cmr1981879f8f.29.1793975985393;
        Fri, 06 Nov 2026 06:39:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:30ce:e69c:9ae:c94a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d6382dsm3633050f8f.19.2026.11.06.06.39.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 06:39:45 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Paul Cercueil <paul@crapouillou.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm/ingenic: Add a driver for the X1600 display controller
Date: Fri,  6 Nov 2026 15:38:27 +0100
Message-ID: <20261106143827.15926-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <0a2e8ea782fa819a547e0a3075303bd74a7fde72.camel@crapouillou.net>
References: <20261106112000.1612-4-olivier@mgcrea.io> <0a2e8ea782fa819a547e0a3075303bd74a7fde72.camel@crapouillou.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Paul,

On Fri, Nov 06, 2026 at 02:34:08PM +0100, Paul Cercueil wrote:
> > +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>
> This bothers me a bit, shouldn't it be using 'crtc_state'?

Yes. v4 takes the mode from crtc_state.

> > +	writel(readl(lcd->base + X1600_LCD_ST), lcd->base +
> > X1600_LCD_CLR_ST);
>
> Not fond of the writel(readl()) nesting here.

OK, a local in v4, here and in probe.

> > +	writel(val, lcd->base + X1600_LCD_DISP_COM);
>
> This whole block above looks like out of place. Why not do it in
> x1600_lcd_encoder_atomic_mode_set()?
>
> Bonus point, you wouldn't need the 'bus_flags' and 'color_order' variables.

The controller only takes register writes while its clock runs, and the
clock is off when atomic_mode_set() is called: on a full modeset the
CRTC's atomic_disable() has stopped it, and atomic_enable() starts it
again afterwards. I checked it on the R1: with the clock gated (CLKGR0
bit 23), every register reads 0x80, and a write to TFT_HSYNC is lost,
the register still holds the old value once the clock is back.

So moving the block means starting the clock in atomic_mode_set() too,
or leaving it running while the CRTC is off. I'd rather keep the writes
in atomic_enable(), next to clk_prepare_enable(), and look the bus
format up in the new connector state there, so the two fields go
anyway. Would that work for you?

> > +	if (pixels > X1600_LCD_MAX_PIXELS)
> > +		return MODE_MEM;
>
> The max resolution is 1280x720 so you should check mode->hdisplay / mode-
> >vdisplay individually. Otherwise bogus resolutions like 1920x480 would be
> accepted.

Right for 1920x480, but 720 per side would refuse the R1's own panel,
which is 480x800 in portrait. The manual only says "frame size up to
720p". v4 can bound each side by 1280 and keep the 1280x720 pixel count,
would that do?

> > +		spin_lock(&lcd->drm.event_lock);
>
> spin_lock() can sleep with CONFIG_PREEMPT_RT so it looks wrong in an IRQ
> handler. I *think* you don't need to lock it here anyway, as the spinlock is
> locked in other places using spin_lock_irq().

On PREEMPT_RT the handler doesn't run in hard IRQ context:
force_irqthreads() is always true there, and the IRQ is requested
without IRQF_NO_THREAD, so the handler runs in a thread, where a
spinlock_t is fine (Documentation/locking/locktypes.rst).

And it needs the lock: drm_crtc_send_vblank_event() wants the caller to
hold event_lock, and lcd->event is shared with queue_event() and
atomic_disable(). Their spin_lock_irq() only keeps the handler off the
CPU they run on. armada, omapdrm and malidp take event_lock the same way
in their handlers. So I'd keep it.

> You enable it later in the probe, so you could just use devm_clk_get_enabled()
> here.

Probe only enables it to stop what the boot loader left running, and
disables it again before drm_dev_register(). From then on atomic_enable()
and atomic_disable() gate it. devm_clk_get_enabled() would keep it
running for as long as the driver is bound, display off included.

> I saw a patch from Maxime replacing these - you should be calling
> drm_mode_config_create_initial_state(drm) here (and handle the error).

Will do, it's in drm-misc-next already.

I'll leave v3 a few more days for the drm-misc side before sending v4.

Thanks for the review,
Olivier
