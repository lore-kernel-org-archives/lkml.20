Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792D459AE6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792459; cv=none; b=m1m0NSf3JRlvmWUShXKt9IZAEup77M61EZdEYAKxKD3NOH1PmVn51Cg/OzPjb/BwkfTjs0m43Xq4b++Yq+BrzVhawwrEYBVeHJp9VzrydRMZ4jOlDdonmt6OAtA/KUeZFYmeTScjdRD1vuQPzdYOsIoh6kFaEbRdve7EjwXlPiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792459; c=relaxed/simple;
	bh=E+MeBfcTyMEV9OSx8wYUhiX3tACuQ1SoFRNY0klEmXg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVZHwwrK7p2XqRvxT/WKZASt4LEHbTu6d+k11ur78NbeGOMBD6IhXMEnQ4hefz9XZvQY4KZmjB3hrixVnR5sEUIj8GrQJufKS7iv8VIPpYwZv4yf4zXosV9SLCWoTMX1OzGGQK7TDWZnaPMWXiv2O0IamiZkU8PGMSVL0pA8N+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lySrdM3H; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lySrdM3H"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so35812215e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788792456; x=1789397256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yFrcnbH5MykHypbL5/SQUfD+utrrwUHZtQrV81eIR8=;
        b=lySrdM3HMYnaM60f6QQIrtGJiZTJfUfnHNY85vVypqubQ7Nfj4dUyQxxkn7USHPeBb
         EnqMBxfRxGtduofJbFK1O/ePy7r9wxVpbKOZsjnSdyjYzXe3JIr2IOeR1zMkQa2tzVyE
         qDCy3PrTM+H7nCk7a57sj4ZmukL3dk4UdDzhKtrRyDiGKbxjHsby/mTkQ8QqVTvCj7XD
         H7dRs5SiVwkKjQtfh4stFlJeoTx1Cg6Y0IS4zWseJM3onH81QLME2D25x7Aw4qVcuHds
         Ptb1V9xN/qILugyRbM8N+133z97aAbTv54kjHOluwbKGvT7SRPsvmm7rNmUZMq1qgMTj
         p1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792456; x=1789397256;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yFrcnbH5MykHypbL5/SQUfD+utrrwUHZtQrV81eIR8=;
        b=D9zG+ZMiXHVBmkjUGWyf1n0QwJa+Qw12ubxo6fGvYYLOoAd0QkpAi8ZC8VntXSAXcP
         DDPlmYy/pK93hM/FHuTGFywBVXKtfCvzZ/pGvSZeiGrL4XJhiF8sfb3ywdDjN4eLNFS2
         xwrI2V4UpwrLzXsktPiywfGe6aArl+4sAIiOtmSM9BMSqkqUyP0maZnoVJ8DGV+qOzSV
         EX1wQkqUpJIERFCtik1WByLzDf4q1ZsDT6NdH5qoncmxHzlHBiB0AUuTh6Cb2EFRRpbn
         I7IemgJVUCsXaHajmcWmkLrc6cKFq2zTiqTQNaitIEakOtql6KL1Mdm8QgFUCF4+hnfd
         UELw==
X-Forwarded-Encrypted: i=1; AKwUvBxYQdtTVCRMNGG29gmDELEv/uL1WOjFPIWyPTkGja7nJ3IGtjth3JolNE+wRD+gdObQrlPGSI9lY1ciJxU=@vger.kernel.org
X-Gm-Message-State: AFuF++lX4tswKpp7jZX9VHUuo3fYMAF6NBFHLSPLBuLlDLF62IZHhPoE
	2D/5npC+PBvPgNcvxQnyvQTvU+rGMEZbA86Kiugs2dopeSJoLi9LwtWe
X-Gm-Gg: AYBFou10wNCe17kp7nq3gMG09YWSRA2jbjDQi3Xy7Smw7GwJvPCCem0tmWIW5tJLCTO
	rmKdZ3uk6cke9aFj0/aVFVKgXckoISOSuz5D87PPINroV07YoDOT/q7AzuQXscRl7KqMaTB8i4t
	d0vUt8hD2OmKEvU1BzWS35t+17jjv5QHuBgzoNxuu2yk8U2ju7TcVQifPSU9u/KsbiV6K5S1Fr7
	AgU0/WtshkcYzhBOLc6g+T19WvaL42GKTprqQi41KihQIHxSD6bUqactVEsZnclPHk2pSXidLS0
	MM7Nc7G6dWCzHnOZGqv8J8h76VFex5TvSSOjRpuq79kVAPhvLUJ8iZQhrrDhE6PpucrjZrS5TzG
	xGzzxZAhqlWrwADRI9OKPuH4fH94Qlj602QDo2EJzjiI88rJ213WCzCf9vdfuK/63SRjCUabO3T
	YlMxOz9vYIuo+8EQaiXyuvEdToAKJSWs8RL8kGoLHVGE7M0XC15ex24ln2z5xFXcsOiQalLnoGz
	b99u6HKqoD3cdmAgCs2UPy/DppJPplvk59SGWUsLh82ErnDPEQ+ZTcLDL0jHzjo+4WWJCSF9E6M
	DRCoaz/wwS5PxbmtMqf4Aq/UvnOTO/h9NInvDZs5xptDqoYENYys6IjT2PmcfClEhwRgEtU1ddY
	OyodzDBsCjgTsacQlZZt+o26bRLDyoL+ZPGm8VEJGORllZVQdRhRAlI6lUtkqThOou7JvzQ==
X-Received: by 2002:a05:600c:a0a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49cf81e6cebmr413588155e9.4.1788792455654;
        Mon, 07 Sep 2026 07:47:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm28494015f8f.32.2026.09.07.07.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:47:35 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:47:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: temperature: tmp006: Fix endianness byte swap in
 trigger handler
Message-ID: <20260907164733.000066f9@gmail.com>
In-Reply-To: <20260907082216.52821-1-salah.triki@gmail.com>
References: <20260907082216.52821-1-salah.triki@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 09:22:15 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> In tmp006_trigger_handler(), i2c_smbus_read_word_data() is used to read
> the VOBJECT and TAMBIENT registers. However, the TMP006 stores register
> values in Big Endian byte order, while i2c_smbus_read_word_data() assumes
> Little Endian.
> 
> This causes byte-swapped values to be pushed to the IIO buffer on Little
> Endian architectures, leading to corrupted sensor readings when using
> triggered buffers.
> 
> Fix this by switching to i2c_smbus_read_word_swapped() inside the trigger
> handler.
> 
> Fixes: 91f75ccf9f03 ("iio: temperature: tmp006: add triggered buffer support")
> Assisted-by: LLM
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/iio/temperature/tmp006.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/temperature/tmp006.c b/drivers/iio/temperature/tmp006.c
> index d9f6449ec0d8..f3b3de0bf221 100644
> --- a/drivers/iio/temperature/tmp006.c
> +++ b/drivers/iio/temperature/tmp006.c
> @@ -256,12 +256,12 @@ static irqreturn_t tmp006_trigger_handler(int irq, void *p)
>  	} scan = { };
>  	s32 ret;
>  
> -	ret = i2c_smbus_read_word_data(data->client, TMP006_VOBJECT);
> +	ret = i2c_smbus_read_word_swapped(data->client, TMP006_VOBJECT);

Sashiko has something to say:

Does this code introduce a regression where sensor readings are corrupted for
userspace clients reading from the triggered IIO buffer on Little Endian
architectures?

Before this patch, i2c_smbus_read_word_data() returned a byte-swapped word.
When this was assigned to the s16 array in tmp006_trigger_handler() on a Little
Endian CPU, the memory layout became [msb, lsb]. This implicitly matched the
IIO_BE (Big Endian) endianness declared in the tmp006_channels array, so it
worked correctly.

By switching to i2c_smbus_read_word_swapped(), the value is now in native CPU
endianness [lsb, msb]. However, the channel specification in tmp006_channels
still specifies IIO_BE:
drivers/iio/temperature/tmp006.c:tmp006_channels[] {
    ...
        .scan_type = {
            .endianness = IIO_BE,
        },
    ...
}

Because the ABI still advertises the data as Big Endian, userspace will parse
the little-endian data as big-endian.

Should the channel specification be updated from IIO_BE to IIO_CPU, or should
scan.channels be declared as __be16 and populated using cpu_to_be16() to
preserve the existing Big Endian ABI?

-- 
Kind regards,
Joshua Crofts
