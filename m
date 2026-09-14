Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4E49EC61
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390236; cv=none; b=GWq9R6JI0baSGV1OQr2udFFHmDzt58f76hYeHbmiJcwAkEVX/yBZRQHlZ1jx9CgPxnIqgFPB9IOvSkurwkooCxU8lQkVkVKdmUIuFANpKQuYcf5iGltdpXfJdVODd9LtHqcYdQwiqiPPezUCnHpIKnk0v5GJxKqpo84CssrdYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390236; c=relaxed/simple;
	bh=CMYe6CzVR1lQ4POVMp/udjPhXuoEKJUqjohFpdJjIHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MZlDvPtUFr2boLRpE4/qdyK1iXFB2FRKuov0vduV+nfkyoicQDYw7ZkBmFWMP2E7LGwHpCA2K8XabR4RLWCbQHqhx4RZ8gu/7RJWIydgd2tlO2w1HgMIYVHFjZ9hZkeMYI8BwpQr6w+1Mht2Lr2O8yufAWC6Oj3urvYEdrvQVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwftJ+Wm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwftJ+Wm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482ea739de2so2208281f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390232; x=1789995032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oFP+vIzlMYUkbBxuUWjprqiU9MvG3SgKEPUqZyew3x0=;
        b=qwftJ+Wm2ptD7ylDhNOtdkE1Uj2os+7n04pLouNVH7M5f5Av1/kAkU2U4iYYkSeuM0
         5/mCUGu/t++YubOarRkrTE19zplY89GpR8ngwIAWuQfJ+BIa54UI0uR8rmYiQVtgr7Tn
         8EKmW4Fp0+VdNlxTtykwMY1tYDTEoUhbh+/nDO8LelGcz17nJlxowD72zYeUdIY5olmf
         veHorqOWjPWNQ5DQGqvhPiimJsqCqz1YiKRaF0VriUfDhwT9iL8DQy/KymliF9GL0k1Z
         MrN4Gvl0oyBd8O2qJK1h7J2xYLeUt+c0iAa5TU/RBhFNzn54gAn6fe/YkSEvoTtpZXs/
         7Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390232; x=1789995032;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFP+vIzlMYUkbBxuUWjprqiU9MvG3SgKEPUqZyew3x0=;
        b=LQeCkLWZNnbqTOPdCptpJ8z2o0hdJrKbTq77dYJUZyhJQD33nYfKgTNFtRT4xa0rC8
         RfTAF/0z8RqoUWDyEsB9MR15pE1QFYbi1MiZhwb6NSFF95E/fmK+oP6y7SzNVRGY+GVO
         XHR+ih92JoN7UlLj9rFvy7D8K3wLdu1rFXDs6AAz2sdyJ9/ma3SV23xxecdVeH0eKJKA
         EGLksBmk5kWw78Q88yPZ1WjzFPST0IUnFSrmWV64tumKVGkbp99FjWLFmupJt4b1tmB+
         HIHbbIVqDFTQe7wN2+KotvI6Fu5PVn3DNl1ZTS/wYlrsfJnFiAVnEGJppT1bD4zPXa/9
         DuVg==
X-Forwarded-Encrypted: i=1; AKwUvBwT3V7lld/3RDRtPRU+/08D1euPaZnnID9CskU6oarzKWnRTNOxhqvHaPEcQlCozSc2QDdm1KDJq+ynVfw=@vger.kernel.org
X-Gm-Message-State: AFuF++kXkQ2tRAocAPCrMePOqEbw6PDr6MdfVQ91Ln2To8v5JXKmxCFG
	7tPEmCSCbsrmE8QZX1mQKoJRSdKJ9MyhlNIQvYRnDZowXSY3a2WQ9bNi
X-Gm-Gg: AYBFou3fy0qfJ81Ap4FNwblJFelGAMhVihyIcBrl5cg5NGmDGL0qinhKZlV6VV6PDvG
	CqXAenxH+XNfb9YCJqpHTGqG+O42MCIfjlEoSOpAiJX0DaWCXse9K7XZI4hUqAW+MEY+NPvN9Tz
	y90gGEE9QIU+BpUN39GVdT1jZk/anGfCcqbu50cIswnYM+f3iJo6JPiaPVkYTsewxlHJ0MPcuoY
	2wRWjXLunUeLqUBcNgGycGvfIjA6dLmFrQWFKOOL7DjvcluGfNDTzVfTwRwJ+Vs95FNf0sCEfxF
	vzevqh9lQF7QXrfi1CCJsJ3PxmegCA2lNhINw3lOc+2ZPf/y4/amPCziXB1ICs2l6UZzHx5h4Sm
	xQp7LMCLUaRsBgqFpWoVzcXvUipHyl4/zxzQRaHbMGMMBqplepXPp234BQIBvX4KipT2WbdbHq8
	85GSfI7aq+rwlWVR/d8m+f3DE7paNy0HXSAW47D/WtJu3AoX0EBRMWzD8Fu0mQqAxk3oHNwrb4+
	ELGO02q8S8FDqb+72wy5HxghlNBZK9ui9tAkLaXA7Q+B7YMMOa2en0qNwFjFZa93LK8NzMUyd+2
	cKkpkxY7WEj+lYPixNH15usSVSVSolXg90KCUeTpphTVwWuwNC45k+QSvP3o9cNj4e3NpSGB+2L
	umvSsoRkIszlP6PBub101rqECK8ZsBa8KPq6o9woZE9OhvLLI9pxkykQmMbry6hqU9gI+xd2Q+m
	afbmHv
X-Received: by 2002:a05:6000:220e:b0:485:8c16:a357 with SMTP id ffacd0b85a97d-48702b2ed22mr2693304f8f.47.1789390231445;
        Mon, 14 Sep 2026 05:50:31 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm28119004f8f.21.2026.09.14.05.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:31 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:50:21 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 (The Capable Hub)" <u.kleine-koenig@baylibre.com>, Siratul Islam
 <email@sirat.me>, Pan Chuang <panchuang@vivo.com>, Irina Tirdea
 <irina.tirdea@intel.com>, Vlad Dogaru <ddvlad@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: accel: mma9551: disable autosuspend on remove
Message-ID: <20260914145021.00006863@gmail.com>
In-Reply-To: <20260914112447.1686972-1-lgs201920130244@gmail.com>
References: <20260914112447.1686972-1-lgs201920130244@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 19:24:47 +0800
Guangshuo Li <lgs201920130244@gmail.com> wrote:

> mma9551_probe() enables runtime PM autosuspend with
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
> Fixes: 6da93a6710a3 ("iio: accel: mma9551: Add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/iio/accel/mma9551.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
> index 7e01427fd9c4..182f488edab1 100644
> --- a/drivers/iio/accel/mma9551.c
> +++ b/drivers/iio/accel/mma9551.c
> @@ -500,6 +500,7 @@ static void mma9551_remove(struct i2c_client *client)
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
