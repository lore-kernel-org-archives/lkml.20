Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E73B0ACB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788021290; cv=none; b=YoFoxz7yZkxGGNw/u6oXfCK3POZaQt6GdxJhNgGLEvEiQij4XUH9n3WPp3Vvhgi3V1mI3Ajfvf3VRtSTksZlPV9zanCN8jG0Dogs+cynqLJqzpivjdRUzvjh+YxO41LIxIBx4ZxNcYOFWjo3UwF2f7taEDInM840Z0DPxK4lsGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788021290; c=relaxed/simple;
	bh=hVExYRrLgPRcRJFEdHlm/lR6vy7PMGHxSW/wkJhOTjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrFXc3L0vv54e2gZ9A+5vRacUOBImOKQFOGSZ2xWm9qDYUCkY064T8ztRWDIGdsR8G66kQ5Zsm0E7sGLiuwJxrm5xsu4Ure2b0NiCV1Fo2ZeszDc7bOoiYxv2W/zYrc5qZmYVr1+3Ycov70sMRwb/MdvzBcK0Hy8SgT3eC2ahT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uu5klKV5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uu5klKV5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso18144875e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788021285; x=1788626085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZEugiUgDUntzd2j7JleFMnc4ZUpEg9vc3iXITyX7q0=;
        b=Uu5klKV5qRiu0hAyYLvZsWq0BQJXiyHuZ2mECKoz9frWtMCj2jJX3CpZbUi73pgaEr
         bhYsYciWlfDjYc+qqJwBt1sAD9dMnXXEahIlMcW6aNgwZW/dSJF38YapjvHM/ba1vQRN
         rTdGPyfgh8sV3tjPDRYSuZphr43YiM/0mkmBQqRLMPFVJftosQGM5SCzECaI9q/pJpX0
         t5ymyLIu10geK7rW3k1QgDT0iyastsz7TrXymwtwlrr0MtZkE6zBUB/ZuS0DqQtypE/A
         MWyLnapuY2rh+MI9UPH+uUEJmwWfGBFC9NjBD735wT+8UySN2LDGNNE7Ch31BK3XhAJo
         pK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788021285; x=1788626085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZEugiUgDUntzd2j7JleFMnc4ZUpEg9vc3iXITyX7q0=;
        b=i3RyU0xVpAf1ESSWcod8bHW0eX7MIhuJW0mZm2hxsa2moEIsWg3wHTtKSubFeipLuz
         JGJiXAMlvLX/dh0fKybZuahC8Lq4iS4dSXLp/AWtzivwrd1iRf6PtdYHgSlsT8k6iVXu
         Is8pw8qJbr1/8+tVuIbnJYMJo0+lV3lghvcPi8W+glA3meTX9w2+OnUF7v4QLjchEZ1o
         p9KVaA9348d+3cOOU9lmDpD9ISWOmuVUQzVEWl/taJOPFMYDws7QK5oGO7pqx4XSSjO2
         cmMkFBPQjRkMDGQEWIWW7WmKPiON0Uk2hldevkWKRg9dF3oVN8yuFrDSAJLUyF6WL6zI
         Ps6A==
X-Forwarded-Encrypted: i=1; AHgh+RrPXbNSjtbhDVKwbe/OD3nywIPiAXwoA6fGfAVdfwpOSP4pOpaG2aIN3H3pv5KBEAw3yB0Hk/hdZB2E7js=@vger.kernel.org
X-Gm-Message-State: AFuF++k41s0lBHoHoM5I+sNlGnyBE0hk6zGh5PvJngEUu6JCBXDz1Dpb
	OxcTz3EYHiYVr7WpRlO8HO5T0uOH/cRGXycdNrULaLFZp8l1X+BzY+9G
X-Gm-Gg: AR+sD13ZHmLJu/ZOXpxk+Di1yrWcnNqaIYmefvL1XV8OOPjgrLx/GlIqNrEBd6yieAk
	VIGH+vQDecX/6o5mzOfC9Cy9Nh5eP3aMOaDW82mGptOgjrMnu0N0fW+YlJxGqd6IYa75UxJo5pg
	/H341IXKsd7HNh3ZCtPKRoGArMTJvpKvU8gdaSUeJKWwwLtnosEKs/4uLF5UHl/kHaWulSX7I2s
	6D7TWQ8JVpLBXMZDO+mknCTnak1clNKSuvt8AH+NaRMkvX0byoIosPnU72J+tdbLLgwvbINuJB2
	3THDP7oKbAypW8kEpIYWU9spi8ETJb5UoLXAlJ5srKZ3VjvsgJCLpIKBuPa4h46ZBTlQoY/Nz+s
	hUtgjGiQL4ms0hwf8F9YMTHF5uyZ8YOnoE9wLw1o3LAkMaimZCKPmXHZIW/u65qsiZ9BaJX7COo
	Mfw9bUH7mCUKl64zA5VSP0iY5yXFWx4cVC2dq2nJ6/dZYNTayC2kMHG3aMHDd1vo/Xapla0vlVn
	wBJwcBoPcke/akQT543iHinRC1bdP1BhD1qWUe3DZgHFTxQYNnQ6ncXfK5D66Bn9iA6UYXSQlOe
	on9qVlTtsrJKWTRDcuBZq2DXTKGHQfBgTwucKspVL/swJHQhBO784M3lJt6I6q7euJ0pre1KOtf
	RXzXgRBXPYA9ISH1e7W+x
X-Received: by 2002:a05:600c:c08b:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49b92027118mr191962305e9.6.1788021285069;
        Sat, 29 Aug 2026 09:34:45 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm233169495e9.15.2026.08.29.09.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:34:44 -0700 (PDT)
Date: Sat, 29 Aug 2026 18:34:43 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Matt Ranostay
 <mranostay@gmail.com>, Andy Shevchenko <andy@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: proximity: pulsedlight: fix iio_device left
 registered on PM setup failure
Message-ID: <20260829183443.3b5ac19f@systembl0wer>
In-Reply-To: <20260828105909.2425439-1-congnt264@gmail.com>
References: <20260828105909.2425439-1-congnt264@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 17:59:09 +0700
Cong Nguyen <congnt264@gmail.com> wrote:

> pm_runtime_set_active() failing in probe() jumps to error_unreg_buffer,
> which only calls iio_triggered_buffer_cleanup() -- it does not undo the
> iio_device_register() that already succeeded a few lines above. probe()
> then returns the error, the devm-managed indio_dev is freed, but the
> iio core still has it registered: the sysfs/chardev nodes stay live and
> point at freed memory.
> 
> Add an error_unreg_dev label that unregisters the iio device before
> falling through to the existing buffer cleanup, mirroring the teardown
> order already used in lidar_remove().
> 
> Fixes: 4ac4e086fd8c ("iio: pulsedlight-lidar-lite: add runtime PM")
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>  drivers/iio/proximity/pulsedlight-lidar-lite-v2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
> index 400477b4c740..8a9ee21f2bf6 100644
> --- a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
> +++ b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
> @@ -294,12 +294,14 @@ static int lidar_probe(struct i2c_client *client)
>  
>  	ret = pm_runtime_set_active(&client->dev);
>  	if (ret)
> -		goto error_unreg_buffer;
> +		goto error_unreg_dev;
>  	pm_runtime_enable(&client->dev);
>  	pm_runtime_idle(&client->dev);
>  
>  	return 0;

Hmm, you should just return iio_device_register() here instead of 0,
as that should always be the last function called in any *_probe()
function.

No need to add a new label then.

> +error_unreg_dev:
> +	iio_device_unregister(indio_dev);
>  error_unreg_buffer:
>  	iio_triggered_buffer_cleanup(indio_dev);
>  

-- 
Kind regards,
Joshua Crofts
