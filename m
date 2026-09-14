Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3BD4A33F2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390284; cv=none; b=mV+StGFAY8gAK6aIPuN8Czoe5fZrG4U26Yus7J6pk/SLdXE/GYogy+ptDhO2Tb+7DVYWgOeGYOsdRglOijUip70Z+FFrpyGTOr+ozRTj2kPF9fWrhXNAoad+ivPP54AzWUz0xmheXLMg1BEH1a672fhYR/jzZojFktEX0VHvQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390284; c=relaxed/simple;
	bh=RUOT7D+R6XRFK6ZDB58sR8ABaVNr55aigsppqxnh9T4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2UFJyubZ8LhkOeVcGrXScPvvdsYh82dvepJZ3d5eLvPlK/cgBdiMFXPfGdZ3k92s6OCqTHg3B1vNV6v5FAX9QgYaW5WXj0qyllDe1i/iFHqKrI9q2e61pBezNcKUfV0XtUrv3zftvSYhr5oD/waL0nY+oLqfWd7n/WdGpcH3vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y00wAIrj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y00wAIrj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-486955ae01eso2740988f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390281; x=1789995081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgQC1Yl5RhRkFvfEBoKl0QIvsiqz4jd8a1ncnGvXLCI=;
        b=Y00wAIrjzP5NyVDNPzPu1Kf6i+gtyWosj4TxHuzUwqGnwuw/GoY8Lt15Wggpq2lCd4
         /dtmKKIWNehNh7YOCucMxSGDXYisJh8JX/CTnG8AhfzCsP621g2bprgA+zWSLsURJui5
         iWiEavIHoudV16OSUufIfmaBxNEFrMVm4lDN6jrg4GPiyFsEdP2k3eg3vEUnKssV1K34
         Fu3ZzFw7Ttd7qz21XjYJACIbCxgJvPW0d1Dr3+ZdSnL0Cdqc8yDwC04qGeXy1iDTm9Bm
         EyoYljHIDK/8Aa44P6j387hELQEoHCm30v+IdsUIRAHFOF2Oe3p8v74MTQtYi5qi8Y4g
         ETPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390281; x=1789995081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgQC1Yl5RhRkFvfEBoKl0QIvsiqz4jd8a1ncnGvXLCI=;
        b=SLmwzF6S83j8ibpBWSc5er21fI8FH1qX3c81NTcTOhYlkn8JJ3c43qwhVNJ1EhVmk/
         DIPkOD3bTc7+X6W1G8M8A/qLO3TNdJ1mI37Kjg1PHfHp9HzE9LQuKivYt1aRkpLqYLOQ
         rWJ/2rBTzLuMkhCkGLaYoLn2wAph20uO63Odrhus9Zdn/PzNXLslLZ6PVLQ/yXegtM/o
         YZiEOmg9MRq6BxBDjmUBDAShKk0iHyElIPaIzYqcdIpaZLb1KmERMtScXQ/suAM6sVmp
         glK6l/YpnogiBQmFgzvIkSOR1YGe1dQk30VpegPjtSwX/hZ8KBGIR21+8lN82V6XBxlP
         tvPw==
X-Forwarded-Encrypted: i=1; AKwUvBxdEgCFhk4tqryyy+wvE5wzpcndxVvoMIzjIyOudcGwhFJzuAJxaTE8K3Nnbj6ADSccyzTCB9ns0HWLKW8=@vger.kernel.org
X-Gm-Message-State: AFuF++m9LSfLDr9+jnUBl5U/5yjI+yPCZwv76tz4JhLoGRJ4/fiNPmU1
	QIp2BG0ntboyPd2dJvirmDp8vk45yadORfbvSVLV3K68etONVo0WHpe2
X-Gm-Gg: AYBFou2ZvBKN16E6MeP3JFTJAtnfGZl76BJG3qE4TiuHoh9ytSTwB6MF9T/HzHr4MDL
	ED1Uur9uG0S89zx0ks8tgoIpryJCA9O33Z2LInRkp1HV7s90XOCiw7lJmbE9GhtiMXU3XpiUu80
	znJPEJvw3cyMKNbnV08/nYscHnn73Wqs9YFp+ogWlXU7KVsPBFD3xST6xkY2QnsPAmp2vCDkYfZ
	vfyhK8SBdtNzUOWTCxlGKUcK5WxyVHLrgZKEEWRJyW+hAJ0BIqZq5HAq8NP8zt8IwVs5l1XQCuO
	7ReBgt7RnHYLMmIsgB5EslyHIWnQort2g88xt6lksJ6WaVFNiadgu7V16jYXwsWUBNSYcuDpCkC
	9vgYJqZecL4uOgdiPADv/vBVnV7Wo88mhgcArxpgeOZiEWXhczLjkdOTLakxrjdA95ZvgaQkAZR
	r16HO5aFR8DRrjbYxW4LIGCmrir00u6254StsJEu6NhEy+i+SPCxhxWXwv99DIWmzT2ZC0ZwtrP
	uvoLoS3W1b0QXSijbEYyZ+EBC2JbdWOzKgHSt/szynKlhJJS8qWw0n+OhyVyGssj9OJntLDhYBU
	ZSMBgNmqJbijuqSOCafbutuWF0EQxgW28jVzM+YwCnLKvbKKLiVPQ94TQgmcjhdap37/YjqkB3Q
	uwcHtP1TPU/Tk7lkeJNXFteVHSL4d/42CmmIKIg73K0Bhna3qcHoeVIQI7jKeY9mDpWAZhWnPiR
	8GSKSP
X-Received: by 2002:a05:600c:4f41:b0:49c:cedc:3c36 with SMTP id 5b1f17b1804b1-49e7a685a1amr32353785e9.16.1789390280541;
        Mon, 14 Sep 2026 05:51:20 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm378995405e9.3.2026.09.14.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:51:20 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:51:18 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 (The Capable Hub)" <u.kleine-koenig@baylibre.com>, Danilo Krummrich
 <dakr@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, Pan Chuang
 <panchuang@vivo.com>, Irina Tirdea <irina.tirdea@intel.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: accel: mma9553: disable autosuspend on remove
Message-ID: <20260914145118.00007445@gmail.com>
In-Reply-To: <20260914113012.1688043-1-lgs201920130244@gmail.com>
References: <20260914113012.1688043-1-lgs201920130244@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 19:30:12 +0800
Guangshuo Li <lgs201920130244@gmail.com> wrote:

> mma9553_probe() enables runtime PM autosuspend with
> pm_runtime_use_autosuspend(). The probe error path correctly undoes
> this setting with pm_runtime_dont_use_autosuspend(), but the normal
> remove path only disables runtime PM.
> 
> The runtime PM API requires pm_runtime_use_autosuspend() to be undone
> with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
> was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
> set therefore leaves the runtime PM state incompletely cleaned up after
> the driver is unbound.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 40cb761306d6 ("iio: add driver for Freescale MMA9553")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/iio/accel/mma9553.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/accel/mma9553.c b/drivers/iio/accel/mma9553.c
> index 8e7aaac89d47..5a36d415a837 100644
> --- a/drivers/iio/accel/mma9553.c
> +++ b/drivers/iio/accel/mma9553.c
> @@ -1136,6 +1136,7 @@ static void mma9553_remove(struct i2c_client *client)
>  
>  	iio_device_unregister(indio_dev);
>  
> +	pm_runtime_dont_use_autosuspend(&client->dev);
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
>  

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
