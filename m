Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D72F290A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402088; cv=none; b=hiWd85Bn9C6y2LZ+Gsz+oFpt7n0+tb/YBc+VMehOs8tt4p7fV1QGDZwHxcxZ6jA1CTqQzfL7BBrdDEVfWmGC5RuUN3TScONZwBhCSg865zdumN2Tkce1mvb2BA++VVXlTFP4w5uWx1CmSnvhq+wptwCXVao14fs+A+tpyglqKJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402088; c=relaxed/simple;
	bh=4JpqBF0U8ok2c1bU1R2ZgN0dtcOkgvd6/IXu/350qDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKEsfi0ECfyKjDQUPa6kWNV7KHGwVHAweS1F1K4Ph04wxfmHdI7EUmGY5zVooGKho3gxAlCVBttw3i5ijBn2uVhywmy6A2/IYaDUnvOQV+q08VGkmP1JCgah+aP7H8BO81QvhyH7xA/qAp4mc/yGgeg3zK6iro2T1hbWHBMhbLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HDPwWLLp; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HDPwWLLp"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6f5fc5so1175565eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789402085; x=1790006885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhBnpIqJR8cSwH8SLHGlHrOYOv2zJDR1Rl7Ewp9l8a8=;
        b=HDPwWLLpGuYZ2na7MhghRHTLBi1EVyb9huFu2Q1Bu9Uw54EfNn78S/40m8nMU8QlWL
         TAKnhn2aJrnzwCEXuSdO0mmPh9K5I5uFcGQ6tCYcXZEwoXD1Z5YDIgtet9agxZYOn7Sq
         4oTNossulTMss2sU1BqlSsfuQVGh/l55kbFoMzH6N8J2A6oekdgZqcCyCFijqfdQNFyF
         HKYIn89clAHd6tbE1n2mAaqCKiQmlYjp1z2KN418wtS6HBsSJmB+BLEgLIEo3YSqhIDp
         dSi5pRE/n0MCzJiUL2Q5DIGa9b6xSuyftQ7GtnrZBCm5+EM85U0ccGVB34leabNXf28i
         6/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789402085; x=1790006885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhBnpIqJR8cSwH8SLHGlHrOYOv2zJDR1Rl7Ewp9l8a8=;
        b=i4BWLNHmGPBOLakbWQkRi7W/2XBN1FMJtglhzBHx3wepsKIYByt7pLsEuutvE21Knm
         GYgeWzhx4mdhVmkr/MDvw705J9tPXoz+DldkiIplrz2OIrEzLt2Oo9p6LaNnBgxN5YUk
         tqO9kMfHLuUCxa0mYV2Qd8vLJOETzvRXMjtJfuz9cJheZjfZ01FQL+Gp96v0sT3TX/xI
         5a+N3xvJhpNG09VMoaHbPnu4cPiTb7iy4wCpN2Pt4a832iWqLdPmfc+6Wd4WGlEQhq0e
         SAY+FSqPaPHQy6pd78mtDF609KM5g4UEWtabYYU/lrXt1x+GJJvLSxNTA3bQ71rM1DF9
         fnXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjOSpzpG4KrQDCEeEhQAVP3b67cr75P1g8p7W0x/+gYEo/fPKDTjGfjH7fKyTL3q2BmA7TrxZd17IYrzo=@vger.kernel.org
X-Gm-Message-State: AFuF++l6hy7AfAlE/XCkEhOpj3kDxxACBVNeZvVtiSi4/iLS4OIQwKDU
	Tb4UxGnLPyMMMem07pUYzIVmPuYt2G00U5AsWfhOngqxEEcUbsjEU6yTtLWoWKC1RRQ=
X-Gm-Gg: AYBFou0jK+s/Bs3jZZb5YIuAsi4JZ0KVKvrZdD8OkDsrr1qEL6e5mX3wfUbeeJjbrX4
	do+ZoOOZiHBLoz22Yy317x4JOjrkgm+hmc0vcc3bxN6nGghS7GS5JmVzFU8Yry/EK1Dpxp51BIS
	aTE5g9MDbiK4QEb/T+LzOGysmjJa46wwsBTHdetKnHhMMWyjFCAgGZCqR9fOzV44T/yXpt97k2F
	s1Xn6QGnfghFko7LbiD8983tyUypv2OE33kNbSQYz4fi11cVPQtu6Rmri6sSZRJOyWor+TMEHLP
	xlzSlsLiXqKD3C7mz98Dw+RvkWwNxR700BulE75hYiezmghi1XqXD9CRWKgh4m2no4376YQ7CGa
	iWEaNBXZ+TcQDtBBIDwEuOn26m63BrvyIfpGEu8tchEUIQoCiZ7s1cJT8mLcHa6VBV9pdKbl/vt
	6JRiDyB2JoXhl2zqk5KTacLsjtjbfeOEhWXnoHIm6AUQjLGZOqmWIBC/Mis6MV/rOEmxweoNEEe
	8WgusQ4pB/EOl3XCdEVkvxxiiOofHQFzgZx3mR+DAUBb9evLg==
X-Received: by 2002:a05:6820:1988:b0:6c1:fd93:5292 with SMTP id 006d021491bc7-6c541d3ff08mr3216204eaf.17.1789402084949;
        Mon, 14 Sep 2026 09:08:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:d8f9:ae1c:d229:aec1? ([2600:8803:e7e4:500:d8f9:ae1c:d229:aec1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c342ec1ff5sm6543816eaf.14.2026.09.14.09.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:08:04 -0700 (PDT)
Message-ID: <feea59da-055e-4faf-999a-c275f42a99a6@baylibre.com>
Date: Mon, 14 Sep 2026 11:08:03 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: dummy: free software device on configfs release
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Kees Cook <kees@kernel.org>, Daniel Baluta <daniel.baluta@intel.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260914115404.1691763-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260914115404.1691763-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 6:54 AM, Guangshuo Li wrote:
> iio_dummy_probe() allocates struct iio_sw_device with kzalloc_obj().
> The error paths free it, but after successful registration the normal
> removal path only frees the contained IIO device, leaving the software
> device allocation behind.
> 
> The software device embeds a config_group. device_drop_group() calls
> iio_sw_device_destroy() and then drops the config_item reference with
> config_item_put(). Therefore, freeing the software device directly from
> iio_dummy_remove() would free the embedded config_item before that
> final put.
> 
> Configfs requires dynamically allocated config_items to provide a
> release callback which frees the containing object when the reference
> count reaches zero.
> 
> Add a release callback to iio_dummy_type and free the software device
> there.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 3d85fb6f8104 ("iio: dummy: Convert IIO dummy to configfs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/iio/dummy/iio_simple_dummy.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/iio/dummy/iio_simple_dummy.c b/drivers/iio/dummy/iio_simple_dummy.c
> index 19fcdbbc11c6..7d2ff1d4a06e 100644
> --- a/drivers/iio/dummy/iio_simple_dummy.c
> +++ b/drivers/iio/dummy/iio_simple_dummy.c
> @@ -23,7 +23,19 @@
>  #include <linux/iio/sw_device.h>
>  #include "iio_simple_dummy.h"
>  
> +static void iio_dummy_release(struct config_item *item)
> +{
> +	struct iio_sw_device *swd = to_iio_sw_device(item);
> +
> +	kfree(swd);
> +}
> +
> +static const struct configfs_item_operations iio_dummy_item_ops = {
> +	.release = iio_dummy_release,
> +};
> +
>  static const struct config_item_type iio_dummy_type = {
> +	.ct_item_ops = &iio_dummy_item_ops,
>  	.ct_owner = THIS_MODULE,
>  };
>  

Should we switch the alloc to a devm_ function instead to keep it
simpler?
