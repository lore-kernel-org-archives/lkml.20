Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A92F4A2052
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290797; cv=none; b=hhUOIYY5y7UZ0xkDQ78zvR7j52qtm3KFpemhhY42WzdjiELY/UHl966rDnoETQinWwtz1Rz5uedKm7AO7EsKepyv4LNRR0bvn98C/wNzqsfDkhedoqi2PHWxFaNFZIe5BWwBizEGaINrqeq2zrkFFH6jV8/BPPEubDFCUZzh4Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290797; c=relaxed/simple;
	bh=Phr/lyT83N6DYL7BdtQd1/VdiLOr4iWUkwC8JFgGLyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHMTr6lAOba3flG3dGYXjHl9p5wRurQxi2u1RnbGVTof2JQ3ZErdYirrfePJ7Jr5+AkJVHMqtDO7aCTvFLg5DzrxjS6iOCS2Dyfi3nafNUMZfWTi/u9psUsmC3cFjqFsXpKQuZ4vEd9aYmq6jUVYzbPCWepXZiAdHIDlm3xiJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb0qJvel; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb0qJvel"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso288627a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290793; x=1788895593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jZowfmyKxOguFaJuZq/Bm4rZ+Os6TFRN1DcxWsiy2Q=;
        b=nb0qJvelweh72Eh8xFecIIJGexpOlBTjJnA+Vd56Q5a+sPXa+vgsPG+IWtqei3h9S8
         mI2vZAcPE7GDz07cpSYuIK0BkuNduXvajSkpiEvZRJpepGwsDkM5PwQyzGjwrtjKFSSA
         8h+Hz6JX1sZOlk3hHQO4oFgKu/I7+E+IuCzWhEDGHA5ILfhmtNEBGH0jQIClV/IoYj1p
         Ocy6MwJFaIRrm4CRpFt7eVZyGhNGvAomWh0jiatmVP9vlBjoJLyj4cBtfb0gW8CjtB2a
         CgorVoJsVasH/F/3oCZjmRkbIEAHr1iBICVhTGW3ibHXs6PoUiLytY1SE5srW+rKvtic
         HWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290793; x=1788895593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jZowfmyKxOguFaJuZq/Bm4rZ+Os6TFRN1DcxWsiy2Q=;
        b=JsOtEvH2vkkquFzRMByENj1KnylyMSUGfal/VJJ9aWvpK69twmjeRK9Ng8CHBjyl+N
         ozwihV+KAef+u/ahEkI0oF/slozRxrhFKBfe77/ZMXYPz1Wb+I0JRr2KsnHaSjrU2nZk
         pIgRah0wq3n/wPc1P7kkWvGlx+ZtEE9dHSotV49BBlqWVLVbf0bEsjzIFRMfkAX1atIG
         onx47rAXtJOrRlsd2ghpnd0v4r2C2g7Fvxll8PO1tDT/OQxoTUEFpl9q9VLO6A+XzUCL
         rX34mdHG0NH1IWsZWP/kq+HakcfEQxuQpuwTBtc6wehzeNTsIr2JgPePxhHrDfy3VsvQ
         E1zA==
X-Forwarded-Encrypted: i=1; AKwUvBxBAMJbV0+jiGZlRhP+F84u/Zy9oTKttVxHHNuKR/s4tVRrashFTrZzxJOOZY3Zyk4loXeolGI0UJwqlHo=@vger.kernel.org
X-Gm-Message-State: AFuF++nCa5M66Y0ZpvJ19SP1WfmqIlC0+DrBYbGCLLezW6QuU1bdVSEI
	lmvvD5nOAQjicJkW8SGC0Ydl/ou3euOd3+pgi7Zscxedf3AmXwWKMHWs
X-Gm-Gg: AYBFou3xHpl2ciQ3E3NIbEeU2VWl7SyWZuiaMHGIawFwh0o9yqiBiRylIQQlfJWjOtC
	sLev5YTLalZEoCgZYmc3v/mRJNaxWhU7ZZHidmD/QQj+TM74SHIuzsapwbCv27LG63+vyWwsV9p
	j59rTQfGrEZoDAqeAjLa3R2GELxzk0WOZXy/cZ4q0/5XOI32GyhpczcU8q5mrOEuIO6rV74PM3u
	lUzoZ8ByfUDuoG75opB2BGhOxUQXiFVK9RrT206FOEJuP6UeDBezF91owxcLEiM/E+VS94QzeSA
	9ngA9dioRqQU+XYpWkSZKRYSBDkqzkQF7ifyz5h3u4W760WlKke1kGdajaYoLcVlU5drQuJfT11
	ZyyXVIQOZ93X97TldS1XQUenXuK+TzRCVBipZTb6PeQHH+0nxa0OwEqjCDdo8bg++cIzBk+Wjtg
	XW8VWvLzmLrSvS8SmBkOG7vp/EfXI4jqK78FNzTWSruILd1UfV8DwaA0D6f0e4Ww==
X-Received: by 2002:a05:6402:5305:b0:6a6:757d:6311 with SMTP id 4fb4d7f45d1cf-6a68257c1eemr63061a12.9.1788290793582;
        Tue, 01 Sep 2026 12:26:33 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:33 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v3 1/3] spi: Preserve preset cs_gpiod in __spi_add_device()
Date: Tue,  1 Sep 2026 21:26:23 +0200
Message-ID: <20260901192625.1497791-2-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192625.1497791-1-khalil@rentman.nl>
References: <20260901192625.1497791-1-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__spi_add_device() unconditionally overwrites spi->cs_gpiod[] from
ctlr->cs_gpiods[cs], even if the caller has already set a GPIO
descriptor on the device. This prevents drivers like
serial-multi-instantiate from pre-configuring a GPIO chip select
acquired from ACPI before adding the device.

Skip the overwrite when the device already has a cs_gpiod set for
the given index, allowing callers to preset GPIO chip selects that
aren't described in the controller's cs-gpios property.

This is useful on platforms where the ACPI _DSD cs-gpios property
on the SPI controller is incomplete, but the peripheral's ACPI node
does contain the correct GpioIo resource for its chip select.

Suggested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Khalil <khalilst@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 07c572e1df..fbfb9a1aa2 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -924,7 +924,8 @@ static int __spi_add_device(struct spi_device *spi, struct spi_device *parent)
 	if (ctlr->cs_gpiods) {
 		for (idx = 0; idx < spi->num_chipselect; idx++) {
 			cs = spi_get_chipselect(spi, idx);
-			spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
+			if (!spi_get_csgpiod(spi, idx))
+				spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
 		}
 	}
 
-- 
2.43.0

