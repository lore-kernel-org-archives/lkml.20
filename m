Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9C3C1D67
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478204; cv=none; b=LiEh0ndz0e2qpa5Q5cD+98sgRBUjL7tcUqk7aN1v2XY4D6YK2Tn5TAPIR38SFlFEhKYyI+74Jv0P7Oz/32BgA6zMr6tw8qZhFEwHsnBvQt1i+YIWzSOP9ZtIXNFJ+nkTup4SYMS0q/CNV2s4mrutlel/kJrYciVBPWrjW8rQjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478204; c=relaxed/simple;
	bh=usQ6otGy61tea2/+SN0kWeGAn4CCH12vYdkTnhTHXWs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8VIpLezMRUBzbO++q1yd+OI9V6yUJ5r9CpkhVQEx7pt5gWXvIQ/rNqwysae0hAuZM+8mUs9FLkklnxFFawfRQiNC9DLaLkv838WtSMIsaM2NeP3w5bEgDzK1JdT08LE3m43dxOXwkUf13fTh/OvAJtfinmlhpeIhjrB9Ie7AJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJnhYlRU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJnhYlRU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso30727415e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789478200; x=1790083000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOh4YxsUy9cnJP0mnCeYYmhsQkJTthFN6MeVe5U5BCY=;
        b=UJnhYlRU/5gIjw4B+i5fNFyGDdvGac4qD0oSJLTa1hxb32IdKLnWoG9AsEEffHOwFS
         bY5ODFPDQSWAycunF7gGXt+RUDrxFjcaRZxFo1aJb9UngFYcDVXTa5GVdIEhunjscQt7
         EKm6yVag/XgVqX3t/d6xLjxaTkGJ0VwSeGBZjRB2ip/TogwMfe3Cnukb/pDm/+HVEZn5
         xlamzWwZW5Tn9LzXNd0xi4PvVS2g2Lo4rbd5CgxOBY2nrihyER2QKB1d5lKkFrFXdEFO
         AlkLzFmox/Wank1DwRPAelxSeIQMl9mU6LycvQyPssLMF9e4MQoqgyv8k22H4CJ8lby5
         PCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478200; x=1790083000;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOh4YxsUy9cnJP0mnCeYYmhsQkJTthFN6MeVe5U5BCY=;
        b=pbT4H41sK6Iv6rajgB2JfxqgJyN3O3XaQ1RN/l6V70xJnK4Oc8EuUFz6EzPyeza8Nb
         lBndjm8Tw2clJsenNAMFBf+bnacG904ti+iz21LXzH69WcfgYY/ON+3la/7qbqxqEb/5
         WhQsWiH80Sq0wknH+WHkYvPGTPujFXufXmdT4tDPLHN2wqSIn0dz5iORdSOzJZqCbW1d
         nld123h34rXKTdyV57isWnVQGSWzDupr50inw9BGhUF6MNV599aqpnae71s1a6uZzrYX
         gW9E7cFxC2cp6u4TO9biS6GyYmWZswH95mkVOo6Kf92XXS6tEpHcq6ESa00bGIJuJX52
         429w==
X-Forwarded-Encrypted: i=1; AKwUvBxs1qS71Ngxj+iLH5Wi8DZ1bGlJPD0EtM9X3q7Mt9KciKm8u1eId7Mc2Kr7ItFnC0hP1LNOPwNtoNkphgc=@vger.kernel.org
X-Gm-Message-State: AFuF++kCLb1i+nWRsnQZ2Ml+xvnggtyDNLP4Y5ULP7YSwKvsI1WIJGeV
	OiOdGJeIFehtdeO76Z+bktjH/2Hv1n3tfCIuzwoxBvhApGEC3hf6SHmQ
X-Gm-Gg: AYBFou1rVWZmBcVb6gb3IkSs3Z/7gx9B7tWKDoFc9Gw/BhgRr73DxCE/uePLEec7Yx0
	VoLF9v1uHgkp1OX706WxTytCJ5Y9/lYPjaY13dW68IU2vsNxz0AQr/hfDRFxULj/nnrS8hyctD6
	zb2lE5gCNA4UljciYxDdACsKdpzCmVXXQPwd7BZnoEUeSvYlTVoz3b+LkiskIHq75IMYimINntc
	vFJpPfze9arUrvDHubS2FF40EYcIyHmPNiQMnfSKOmeCrhIQ6iOt3SleHo7yH85fLQXQabI74g5
	p2ifDYAfjyAcU7nG0173ZdrnY32Z3fSMG6ZuCMcLwnFTrXVrhbZ0NaeO4+AmOnpho2ySGDTQtxO
	hV9/DEenjlFJkVRz6HiX/CBmdbCpzozftD+tV7zZU88zAexXa/W7CJbNMsWOnq0o31zHUztziLP
	/btGAYWFlyFSy8nhdZPETYg+Tj0gD4iAqsvMlxydoLz/eRYABaNc1mQrLZw7qoBOPcmMIPTIb44
	8Z9HTgEgAcBZycqntN0n2P+2/HfoCVFpfbTNinvXv2NjfOEjrjINyUHHglHhbGu8B0ZDd6WAWxp
	fBZtgA1XL99qys56Qxhais8ghOd/63QEQ3cduFr0FoFu+PdVBLKwvbVU+SfWU6wBkkymIt2AGNV
	A0m4pICbSrDUX1cljW9Tk1LoZ8KqgkPktLqDa7YCwBNcTeUeY657v9K8R86MNyGfxQL2b31jgpm
	Mk1HKS
X-Received: by 2002:a05:600c:81ca:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49e7a69ba24mr89660425e9.33.1789478200316;
        Tue, 15 Sep 2026 06:16:40 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef735cesm65466155e9.6.2026.09.15.06.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:16:39 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:16:34 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] staging: iio: adc: ad7816: Serialize SPI
 operations
Message-ID: <20260915151634.0000787e@gmail.com>
In-Reply-To: <20260915075939.18180-3-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
	<20260915075939.18180-3-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 10:59:38 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

...

> +	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
> +	if (ret)
> +		return ret;
> +
>  	chip->spi_dev = spi_dev;
>  	for (i = 0; i <= AD7816_CS_MAX; i++)
>  		chip->oti_data[i] = 203;

The patch in itself is fine, but Sashiko points out that the mutex
could be added in the ad7816_store_mode/channel() functions. Nevertheless,
this patch only focuses on SPI transfers so you could add guards to the
GPIO functions in another patch (I don't think you need to send a v8 though,
just another patch after this series gets merged).

Does this newly added lock also need to be acquired in the sysfs store
functions?
If a userspace process concurrently writes to the mode or channel sysfs
attributes, the GPIO pin and device state can be modified without acquiring
chip->lock:
drivers/staging/iio/adc/ad7816.c:ad7816_store_mode() {
    ...
	if (strcmp(buf, "full") == 0) {
		gpiod_set_value(chip->rdwr_pin, 1);
		chip->mode = AD7816_FULL;
	} else {
    ...
}
drivers/staging/iio/adc/ad7816.c:ad7816_store_channel() {
    ...
	chip->channel_id = data;
    ...
}
Could this concurrent access corrupt the rdwr_pin state, chip->mode, or
chip->channel_id variables during an ongoing SPI transfer, leading to
malformed transactions or corrupted ADC readings?

-- 
Kind regards,
Joshua Crofts
