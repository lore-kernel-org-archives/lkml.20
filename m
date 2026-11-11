Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395857;
	b=X2J4gu3BddwGjqDcyJJ54ApTAszGsAgBs+a9zMqy0d33Zh8eOBwWf+RalK/QOCW/2UfH
	 fC5Ggjesxx77mQj9Wi0vhtN+KxSpEzyeZiErbBOg0iAY+DJ9azLDL/eeoJdTyocPUAmsR
	 x6eveux8xGNIAMYzcTQWgy1gsr1KelZublvZGoo13pYHXDCRWADBKoW9v5opB6Ss3pE6m
	 wNb4Li1fBVqXKAjmxWd3OyOzX4Ve0rVD8nr5gxwaYOsjzEX/7MwsEfvXsK4PnmZowfBwD
	 5luGLmFPt6KSCnYRVtyFyKSvLXS9Qh6uvaxVEpJg4TAFOJE6LhuO+c5bf1cyhXmmULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f5dZF2vX2WwRp/FVprc8N43I5ckqGSvz1h8CuNziLMI=;
	b=DSzzU8CZgy2WdTDduvwmAyzotPVjhLTbK49hTF0g4VCx2mj7IauqMY4p0tovpTo1LCET
	 sg+KVLQLC7i3Q9gwdtiXjnK4c5mr9l9FWvyE3I0jrLj/V1WiqBLYjqu9/S9y5mPiBsDWw
	 cTb83mRQwJURqZwqDVxI4ldzWmZ4zjUD350beW13yQAysjUMC6tldnNny/aP3go0qGP5m
	 n9uN4mKK5h93PU/syHa+zyX0Szr3lO9yk/jpLGY+O1SmoD57HPg9lgNgHx6PwnrngrHEI
	 rPtGcNish5FT9M+QmBl+BSxGCE1pMXL4YiIVfG2WWCgnDzNyINBQwN7sKAFft4hRxnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yS+VSfDO;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80BD606A893
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80BD606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yS+VSfDO
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490585eddfcso2378504f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395855; x=1795000655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5dZF2vX2WwRp/FVprc8N43I5ckqGSvz1h8CuNziLMI=;
        b=yS+VSfDOsq1WLdyrZwKIJxqv2qunddy0oQ0ymczjrymHt2ruUc1tPU0jkyFn4Y/E8Q
         vgqP+dxu3qNOcnGjWSR/DHGVuFnV0Akp4ZRHvF/nerdOVAiKxhAwphMT6X4YalB+qrrq
         QqizBOm5ocpf3q39ruO9u6pGBVL/BSVKKMxnpwjMD5SaeiLAvaCyP/S+761l3IDKp5zN
         cJ8H+10t0pPbV6TO37Wk36Z9GCpcQ/GZFM1RgQPj0U6jALN80usL22+15mbxQB5j+YoR
         jMGXU2rJqsZJOU3h9VSUfeQJKJMPDITuPgJ1uodOHyVVXaL2X4mCMapWC9szvsYJJ+rc
         sXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395855; x=1795000655;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5dZF2vX2WwRp/FVprc8N43I5ckqGSvz1h8CuNziLMI=;
        b=Q6wtFP158C+QDsoqb/6+Re/etnITw0Lql4JI0dmBS5w8oV/YwORZMdtWkqbZC6g493
         PyOmSBNg/BIK5jRZvO9GxyDkD3l6ISfIIu/JEmBV9XedRZJ63FCvqNn6Bq2copZxJE96
         wHQl/twFhfeclU7ue8Vhj4ywYDPU7gxVW8uRFOx873Utt4RPz1vs2/RACvzXOaorDuhE
         t5KCYrWpig0agmKaZYOXVHqH+qbwfvzf7XSkYsUo167Odb5QHXdc7YbCUqrrl8aFFMMy
         8YgG3qR+cnHuDH9Sg2IEWJXRfTXaxw0Dw0JGxHRnYE5B2guG3WEpWYkAv2Qx7ViDE33f
         MYeA==
X-Forwarded-Encrypted: i=1; AL+hErHB0zJiC99NU+XaxEmGbl44+Fazy5BemSPLjhMHc2P5U42dweybJyul46gr1Z+ZCHEudS44Q1zXHa7ApSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8u0tSVIo6dYpepk/YT8brknBuceaWMTcvoADi0RGz14tH69vW+
	qVnpn8TLUgSn3HY7EEzL1CPG22+zRythOUFPY3HyFwiRw8sSsgZytFqc
X-Gm-Gg: AYBFou0aDRqv0qYNowBCZhELuQ/CbG3tDybCIhrYZlVbUPjNH/cRUw38J+dDIRyHR8N
	zjmaE5OOc+5YgI7pND2NmBG5QlR9E3q0QNlRrTpB9u7UQb8H8La6wDSuJJje6jstKEDcZqH6DxZ
	xIqXJPwnuHAaiiAs27xEOzhMr2DlzMf845XwtcgJBZTZQNPmdbzDndbgpaMlS4a2FKE4pNmFWu7
	tRzW12u29wi1Kv2Qmx4wX30gUAdH0gdcCLEObKTVtMM5wtIrapbmyv34VlYudB7gyCzCr83a2xH
	YvPYCab7GFJr8T0r67KeMUt3nRvCknyRmRWAJD+FQoyzbsQdazuctsqU+SAamqKwVUWrywQ7vju
	LyN7i/SuSwE19MGsbmVjEmqQKN+8H90b6LgxJbLERGnxy24AasKqSCZRAU4gaKFtYuJi2b9Nbiy
	QGH43TxEQ/bxz2FJWQSptuZeNEGpLmqUq78E9ZlixHeqZScMB8K40WBkJovqWUNSMryI5gQkAXn
	09DjM/zM0bt4B9GY9PtFvIfJTs4KqSqwLOWQfw1oslfXKJx76o2Bpv48U5VLShE8iZn8vHszCMC
	PuyI1b86Bc/PTiuTD57d7OkYdEK6PzJBgeAC5OBN3lUvhfz9HzKClDI2GqYVXTv37g==
X-Received: by 2002:a05:6000:18a8:b0:48e:4115:f3e8 with SMTP id ffacd0b85a97d-499c70828bfmr3850067f8f.27.1794395855165;
        Wed, 11 Nov 2026 03:17:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm10587827f8f.10.2026.11.11.03.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:17:34 -0800 (PST)
Date: Wed, 11 Nov 2026 11:17:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Di Wu <diwux@google.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, bleung@chromium.org, groeck@chromium.org,
 tzungbi@kernel.org, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: use sysfs_emit() in show callbacks
Message-ID: <20261111111733.678199a2@pumpkin>
In-Reply-To: <20261111072608.3490763-1-diwux@google.com>
References: <20261111072608.3490763-1-diwux@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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

On Wed, 11 Nov 2026 07:26:08 +0000
Di Wu <diwux@google.com> wrote:

> Replace sprintf() and snprintf() with sysfs_emit() in the sysfs show
> and ext_info read callbacks. sysfs_emit() is aware of the sysfs buffer
> PAGE_SIZE limit and is the preferred helper for show callbacks.

Reviewed-by: David Laight <david.laight.linux@gmail.com>

> 
> Signed-off-by: Di Wu <diwux@google.com>
> ---
>  .../iio/common/cros_ec_sensors/cros_ec_sensors_core.c  | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index d03e40c91582..624d4b32b034 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -149,9 +149,9 @@ static ssize_t cros_ec_sensor_get_report_latency(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	return sprintf(buf, "%d.%06u\n",
> -		       latency / 1000,
> -		       (latency % 1000) * 1000);
> +	return sysfs_emit(buf, "%d.%06u\n",
> +			  latency / 1000,
> +			  (latency % 1000) * 1000);

At least two of those lines can be merged.
I think it is 86 chars - maybe ok.
Personally I'd split after the format.

David

>  }
>  
>  static IIO_DEVICE_ATTR(hwfifo_timeout, 0644,
> @@ -165,7 +165,7 @@ static ssize_t hwfifo_watermark_max_show(struct device *dev,
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
>  
> -	return sprintf(buf, "%d\n", st->fifo_max_event_count);
> +	return sysfs_emit(buf, "%d\n", st->fifo_max_event_count);
>  }
>  
>  static IIO_DEVICE_ATTR_RO(hwfifo_watermark_max, 0);
> @@ -465,7 +465,7 @@ static ssize_t cros_ec_sensors_id(struct iio_dev *indio_dev,
>  {
>  	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", st->param.info.sensor_num);
> +	return sysfs_emit(buf, "%d\n", st->param.info.sensor_num);
>  }
>  
>  const struct iio_chan_spec_ext_info cros_ec_sensors_ext_info[] = {
> 
> base-commit: b70566610b48ba49dec636019da4d696db64b085

