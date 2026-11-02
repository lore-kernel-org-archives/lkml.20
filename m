Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614226;
	b=ZKnGFV7SXGzrp76cd866MbnyKlJ9NHI7yvvrFd9qanrxxzc/HlLMLjspXHCxdOiTWNu+
	 y1ffk9mP2BYVQ5Yrql9WgwIRdN+wpF7OSc0L1UzzmlkJ/+wvMSk1RriJfUDkSihk0QLHL
	 BnHHUcqE1Yq/YM7LEsk2SAO2K0x3w62n8aU7yGaUD/Z/X80YIGBW+zQtqLm0tBKcDvk7A
	 KrfMaDqxZXe6tbx6GoGB5b0BUpkomXFRjLFfMd7s6/amJTw9bmybt4Je1Q+L7MJvdJhmR
	 lisRJu8Kx0T4FtinHvfU06wLSxUUZFM2RuBypiS/JRAqCfnLmAugqIfuQmdo8cOO3YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RSJYmaISXsmdeU0k7vVhoRXjClhB0xd4jwuJdTsnvJo=;
	b=d3Ycm9Q+AQrqucY3ZxxRBDhqLAvR1k5DcxCsx5Jib59LCJE1L5nTtK/gOTKRHnHkee6Q
	 SSkM4vUHOHbfmgkJUVizPByoS3daV09T16V/2ZfDKUNbSrqHJiM/ZGtOmGp1aEP21Ufpt
	 K+Qg3iaExIIKqJU1NDFlHaXYu+ndpcSKKdaqIqO+VslmzMIlsFnyjEPKRSzKP9IJF1K36
	 sX4YVI4/Y2BO+mHryiGLgYnGvYaSkfu+r6GuLI0pZFWNq2DJgB6ALrNhJSB6laokMDVIS
	 XYiL/HuOjkSQm2GU1GIttPhYJ4i8/1wuRc23/aNhdM8SdlZKSTs/jOaQVwsRf21FfEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pjw+Ekos;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6EF606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF6EF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pjw+Ekos
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso21489075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614224; x=1794219024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSJYmaISXsmdeU0k7vVhoRXjClhB0xd4jwuJdTsnvJo=;
        b=Pjw+Ekosqpjil9Ujkz6gDujlvkioE1rjXDOcEI57C9dVybzaUxMIVDh5xIqD4lXSOY
         nJs4PAzDIU56SRCob9N//o/URb5AtTb1siN2T9A+lKtsCuhawH1HiASExLHqd7UBSP0a
         ioDAYOdTNhwbfhyoGKi3v9U8mD1drZ+Sp5mevYtPcrFWMi1Fu30NpY6NSYIUZCrwCfvC
         et0QmaRnb/RfsVsg80tnu4uAN30pBnR4uszN1UKvQEAB1rrcPSt+qS+9dDX8VpFR+Um1
         fyENeAVhU80o8j7ymRsx5/W+CNJZMRR+vgGTFuMZQumxezqry2PnleGqXFLRbX3gCul/
         ELdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614224; x=1794219024;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSJYmaISXsmdeU0k7vVhoRXjClhB0xd4jwuJdTsnvJo=;
        b=fdRqc3c6sC+SD5ckT2Xhefd0PjSKcp8oPGP54j8v+nsvg08kCPJ8tXI12uDG/LUdm3
         pFsnyVURPGlpFgBzOq0AGgsVEwIuXvjNNAvQfx/eg9qB694b/n1h/kbDw3psUia1DY56
         05wPFjwRFrE5dsj4iawSdQHqwh6K207f2LKqJWFC/NHzaa1LX9DIFuUdsbk0Lj91vN1s
         iIT575/mWZzCx5gyME0/m8d+mh6U57On01yjUjDa/ntjOnr4FJooWsQQ+pbaIwa9Xo+Z
         CIeHhIhes9j6C5TlCXXAtobNFzV8R/7dmWuexP5TxXd/LBgIzcCYSIdhtemzklhVS9O3
         jwoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRIbG60iHCb/ImkSfnZfJjQk8WbkFSzRPaMCc0IPeIPQYtBOGsoXO4ASn3NkSw9MSsmpSfaexP5NBbVx8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMqA/PEiyuIkCiUYLa3B8tK+3oP5ZPQWMTTwQclOFTOoaospD9
	+b+TLTVGQoBYb87G+Qw8M1dSa8piQ2ygiyqxbDMBc6ZevuWjMFSl8exhyeNtwA==
X-Gm-Gg: AYBFou1Z16BTp7D9KAHXOE866hDM2Rkt+KO76j9vqmikJxRL+UOv7ygEwpXz3wyKJ4S
	djiRl9U5JIyUmD33YQlOukySnjsuHmsOVPoWQFEuMA0HFXB7Cs38TdbHtX/nm+7IsmpgVS+CCQv
	OwEqYuUnoZKtskRzEA3Zq1ZzgnQnKx1mPqtHoBFTaa5shBbY6oCRIqWXDgu37takwvGDaj2Gcfq
	3ZitIRc/MeU4LAvocSHyRoLX9sfr/epekeR8DHLmZr9VXkuCCjcKcBj+vakkbGkImoY9Jj0iS58
	s587eOEiXetebKeN9gIMhVol0+GRUyLQtB9wn1VcwokDjDWllQlYMGEbHlr1ftxq5jE2WpKguDw
	uif3bi76CfzBc5gHzGqDx567bxKsAaEBJjp2CL2SZm0I1BDZxzI8OgH6SqMIByrG6BZPXBfB6nY
	ibssVT/ieqrl28SdjaqXknztFR52pxMzTqCG/zi5XHykPq3CljhkSaEPuMFJTjfiqitXO8U6Rlv
	4D6t2NNJMbGG3724M01uUFmVoMRHAP1dmL3yMm/9VvEp6uzgtDHuiT2kZAEYL2iNFqYDHt7ox4J
	zIOLDpcwRdRLrxjGII9V+725Ju94+YXOZPdQgUScbYVMXUPa7eRdBMIbk54pC8R+CwD9Cb2M5MF
	L/nIDWmIQiVm+u2ZReUpx/Abz32z987QjquYVj7jIoPiPbH/bgUHjkX8QSqO+P6FzrJhosLV1Xn
	WvEVwymgIizRPjlggoFms6PgR/xIiQpmKXWFIw/G6nLD75gFFytG7M3w8IXc8Xei3LyM++xEykA
	C0ACVuca4b7Epwqc9oR9V6XPuIe1TmWHqr9uRM=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr202981795e9.0.1793614223900;
        Mon, 02 Nov 2026 02:10:23 -0800 (PST)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe885d91esm192351215e9.0.2026.11.02.02.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:10:23 -0800 (PST)
Date: Mon, 2 Nov 2026 11:10:20 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jaakko Koivisto <jmatko@utu.fi>
Cc: Andreas Klinger <ak@it-klinger.de>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] iio: chemical: sgp40: Replace manual locking
 with guard()
Message-ID: <20261102111020.00000194@gmail.com>
In-Reply-To: <20261102091258.247402-3-jmatko@utu.fi>
References: <20261102091258.247402-1-jmatko@utu.fi>
	<20261102091258.247402-3-jmatko@utu.fi>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 11:12:55 +0200
Jaakko Koivisto <jmatko@utu.fi> wrote:

> Replace manual mutex_lock() and mutex_unlock() with RAII-style
> guard(mutex)().
> 
> Extend the lock in sgp40_measure_resistance_raw() to cover the
> I2C send and receive cycle, preventing I/O-errors if the device
> is currently running a command, or clobbering the output of a previous
> command if a new command is issued during the sleep-period between
> i2c_master_send() and i2c_master_recv().
> 
> Signed-off-by: Jaakko Koivisto <jmatko@utu.fi>
> ---
>  drivers/iio/chemical/sgp40.c | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/iio/chemical/sgp40.c b/drivers/iio/chemical/sgp40.c
> index 3a239fb6847f..080d51f9f53c 100644
> --- a/drivers/iio/chemical/sgp40.c
> +++ b/drivers/iio/chemical/sgp40.c
> @@ -148,9 +148,8 @@ static int sgp40_calc_voc(struct sgp40_data *data, u16 resistance_raw, int *voc)
>  	u32 exp = 0;

+ #include <linux/cleanup.h>

>  	/* we calculate as a multiple of 16384 (2^14) */
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);

Blank lines around any guard() statement. You want to emphasize the fact
that guard is being utilized.

>  	x = ((int)resistance_raw - data->res_calibbias) * 106;
> -	mutex_unlock(&data->lock);

If only a segment of the code has to hold a lock it's better to use
scoped_guard() instead of regular guard().

>  
>  	/* voc = 500 / (1 + e^x) */
>  	exp = sgp40_exp(x, SGP40_CALC_POWER, 18);
> @@ -172,7 +171,7 @@ static int sgp40_measure_resistance_raw(struct sgp40_data *data, u16 *resistance
>  	struct sgp40_tg_measure tg = {.command = {0x26, 0x0F}};
>  	struct sgp40_tg_result tgres;
>  

-- 
Kind regards,
Joshua Crofts
