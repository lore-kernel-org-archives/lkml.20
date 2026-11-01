Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793540503;
	b=GPFHFg4Nl+KZAGHXNbewdGAqGx8NYJrieDLrjAvzytZsJULVcDn3NolugMDMNw+NzKnq
	 o7F7pQbaElRGPEP3Sezs52nzJ7izBjHj0lHvKdfQDW/Q9+sMxQ4FpGBBPCnypUuioWesg
	 ts6xvt5LYQngvk48klIHymAgxyPzIRg9hfDrkU9RT8zUNYcb8n6AQEE7agzsBttyXBfPk
	 udoY1lCcgQShjx46c9a9k8ZR1i87tq5OjEk4mua+rK54huDoEK2QgMBjoAMfWnypkepNw
	 hJwmOoRSbbmi+kzYohbO7RsvEqkz3cudqo5vmOfSvESlJJ1OuAktDbbmzZ7tlbbeFZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793540503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D9SuAAhicfGEowYvG8qAtgOKnV2KMOsPr8uS/Jwlz2M=;
	b=KzydznZJ4AxIo86JpvNGYBa14z+txy/dZ6aSeMkiULrJ0KGzN9aQ5Ij80yPhDOBvNBM9
	 S7x+jRFku3HdIgCVpdKyPuwS3li/SAqDmaAggh/QyUmgTfAcQbt66UTriWRQYEWyE/4Lv
	 5i+Sa26WQlA3Nd09aXoqd1GJm9G+5pQDJvakPFRTd8vt7p6GtHml7gd/giXHvLn0JEKeQ
	 T778XYlXuFGWyvb8IMcHjfxzIQLOuwIf5cOIjWtf176l5YFGeg4pyX2vjR5MTlFcV8tjb
	 aGwHjk1jI4osBeXb//Xvp///9wMPmutI9cDKJhINxuBYJefxeE8aiAFhdizq2q3tqeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnBwHmkB;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C354606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 13:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C354606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnBwHmkB
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8b20a899fso14660195ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793540502; x=1794145302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9SuAAhicfGEowYvG8qAtgOKnV2KMOsPr8uS/Jwlz2M=;
        b=TnBwHmkBJcfx2omypk51rDF8gsLIEFeSM7osdJ6QXAjKOddxtvEBYLseofQY5eATis
         yg2y3pAPEQ8hQp/4LLvFJKAqvwAnTCI5LzPZwvejPMGUaMGdSfTIriwzWvnoDRtezCR8
         +J9WV987bbhGwE6BSqE3Vv8mZfLl2ntWStNv83mYE2PpeulC3ptKKEd2JUdO5ed31qYL
         TbFwlf6foIj5OCRjFpXLG9CTimh+UnKqttveSHFYqvO2XZ1nkxddXXj0wemtWVdYT7S3
         1m8DI0lZd0ZjILlbOvxxa6QrLTzmfiaZrCNtK+F3YSGCncmbw4kkGjQ8Cb3atT3dwCO+
         w0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793540502; x=1794145302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9SuAAhicfGEowYvG8qAtgOKnV2KMOsPr8uS/Jwlz2M=;
        b=CdUjzyCVMP9i0TBfxBstWxr5PiZIGbm0G4tl1IUXgKjvCs4jvPFhz7/IMWMV2enBhF
         fHC9ua94TtDcUhQbOwTOlBzdGROF919MeZtDrMDA7SxIbmefuGb5cb6FOJAUGtKwAVH1
         E/G5HAZ2bxXkfc/lNDxk3OLzxJB0ZV7bgnqkB4zBU9XWGknLh/iC0Xp+5qfarOPvA8AF
         GvyDKtRFXzT+ZpizZe5kPve6S97AMboe3fNZzvEM5culkCNCgT17FoNaqdOnVPiZKOqa
         5y1RghU/H1vM5TdKt4P3p/AX1S9LEGNDO8hxrzu97wNBbI10eEVjRzQITmhMmrOle9D4
         tazw==
X-Forwarded-Encrypted: i=1; AKwUvBxo099W6nwfdrUTxMCg/lG/UhIfhRgvbMIaAo2EKF3zSz/gvCFIGx0xI+Vq40xiMPgHiO2orTsTeFuA37k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NB2zQ8fV9MXrPuUNuo63+dbYgY1vo/Qg3HlGYEb4GZ7QpV2Ko
	h6uN8bqpOuOy7KZ9YQ6ZgHVc8PY33FRT0CYBC4WPZveud3HfEzvoIlS3
X-Gm-Gg: AYBFou0IdPSaL6Ai+qWvp+GBFNo/v3GVQHtfn7yDE24t4BQZvcYLexYJJ7dZnXwVvPd
	zqZWVqsYBrfblAYd1LzSExmv7gt0ECGKsZmeWO5iusZi8oqADWZvJ3ua5okNpdyuWkgkjCFNNk0
	N2KR9+YX3efJGWfCe8jfJXWRlRC2hrQAuz458FfIK+sgboQAU+dybaEoFnLB0FPCDcNF7Lu2W41
	DWbh5adtApaFg6rndB3ye2S6uFwB5APCEHoQxqYkNBpJRAxXRzRTognRpF2NPYF57sNpIYI6m68
	lU+i2Kq8SkzQWRmYYCeWJ7ujX6ZX6EEi+dbGwUcaI/JG3MiuVp/nWHR1Z5p/j/obLEwPyOAhaNh
	jaOZr5sXeVeE38Tji1t6CB+qNYnUbYi7PXBQmbEJkCnmJSWE394iqzYo20ZkFWuhV2jME40BlP/
	8EgixKI9JUTBEJG6lbqFe54I9kI2pdI1xTQG5mZ6kVBnwnUey3O9YBEE1Kok4a7l1/wc3WXbP33
	FT0wplYcnlr/+vExzowLglASuv/fZtYPRd+P7l4aJ6+vsFwvjD7tYNMvWt14oaiDK2hveT4Fsm0
	cChrL9Y2cLE43QCHkIhSqZVeM3WvgZwWNpf5A2MlttvqTk2J591eR4PcTjiptWmf8Qw=
X-Received: by 2002:a17:903:1b05:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2eb364005f0mr64610475ad.8.1793540501905;
        Sun, 01 Nov 2026 05:41:41 -0800 (PST)
Received: from KRHW1CJW23 ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927ff6bsm18769675ad.52.2026.11.01.05.41.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 05:41:41 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	neo_jou <neo_jou@realtek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kalle Valo <kvalo@kernel.org>,
	Hans Ulli Kroll <linux@ulli-kroll.de>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw88: usb: stop RX work before unregistering hardware
Date: Sun,  1 Nov 2026 21:41:17 +0800
Message-ID: <20261101134116.30404-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4a555879477e2c5b8eb2f2cd430157adef580461@linux.dev>
References: <20261028141904.8707-1-enderaoelyther@gmail.com> <4a555879477e2c5b8eb2f2cd430157adef580461@linux.dev>
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

Hi Luka,

On Fri, Oct 30, 2026 at 02:51:43PM +0000, Luka Gejak wrote:
> As far as I can see, rx_urb_work can't bring an URB back at this point.
> rtw88 doesn't set soft_unbind, so the USB core disables the endpoints
> before it calls the driver:
>
>         usb_unbind_interface()
>           usb_disable_interface()
>             usb_disable_endpoint()
>               ep->enabled = 0;
>           driver->disconnect()
>             rtw_usb_disconnect()
>
> After that usb_submit_urb() on the RX pipe fails for the rest of the RX
> teardown, and a failed submit only queues the work again on -ENOMEM. So I
> think cancel_work_sync() on rx_work alone already closes the race, and
> the same change would then work for the older stable trees too.
>
> Keeping disable_work_sync() doesn't hurt, but then the commit message
> shouldn't say the work can restart a killed URB. Or did I miss a path
> where we get here with the endpoints still enabled?

You didn't miss one. usb_unbind_interface() is the only caller of an
interface driver's ->disconnect(), and none of the rtw88 USB drivers
sets soft_unbind. Before rtw_usb_disconnect() returns, only its own
usb_reset_device() enables the endpoints again, and that runs after
rtw_usb_deinit_rx() has destroyed rxwq.

rx_urb_work can still run until then after an allocation failure, but
its submit fails on the disabled endpoint. The commit message was wrong
about that.

I'll send a v2 that only adds cancel_work_sync(&rtwusb->rx_work) after
rtw_usb_cancel_rx_bufs(), with a corrected message and without the
3e3aa566dd18 Fixes tag. It applies unchanged to 6.6.y and later.

Thanks,
Zhao
