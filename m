Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19991363097
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791738767; cv=none; b=YbkzQHksyb6ZIvU6w+iRpbzg6OmsehrMXJTOFVY4yphBI567v5gG4GZg+1PgPlGlbOSfc/CWMTn6Xi1jTzLGsiyqlBsoCBhadsq/2cIQ4u+fqqe5RsdPCHQBAQwtvHv/qD9NWZ4ilZXNByL6hxYPtzJm807Mo8p/huRRVlLl5Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791738767; c=relaxed/simple;
	bh=z+1ZpdTDW56EA/XM7p5CM05JDe5+3pamXAxQ9H7t6HI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oewohHSVnaOiY/daKknTj8R14YL4brizB1GftXLLlOOWFEsFw+1JxmPf/8XR2z+MLj53tS5qzMFWD8mMfczPoCOufWDuYBd+pi3P0Rmf+0ShbpGWac10en5KzNOyGnf/80Gn3x896Mvo/c6FmpcnPjLaB/VTDOLxt6ZAJN/4gdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBvIBoqp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBvIBoqp"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c411d6615so681683f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791738763; x=1792343563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79Z91gLy0Qj3P7l5DuL+kEPlg9n1xATGDeuftWENmqA=;
        b=KBvIBoqpgZk02w21878+tfHeJmiq0VjXiM92RtI3bPmRrKwvVNPJNBigcoHdSRo4nV
         ELH86d6RzhcPKCmixanljp8H94jpIdF1wvnxXDyXjG2Da7HLGgCdGS2MGVI4FxB2RAvP
         GsxzJ38erhXWyYn32iwiB71KI4VCFVur3mELk4ty++MNobi1zUaonhr51ilvpI008Zrm
         ToKmC3+MAt/VUPaqosjo60CBazW2ubwJRmVEriS1pq4Qp0fRdPyckwDsrLOOXeY9pckS
         Ynd+n9cac8iLki84QTHhiK3WkDO5niWcHOgGKfMuRbneWb1m4rBS8dOGN0+PeljZf/jd
         cVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791738763; x=1792343563;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79Z91gLy0Qj3P7l5DuL+kEPlg9n1xATGDeuftWENmqA=;
        b=hoahJSNH/VumhfVh9R42n++42ritjgvbR3RnOlIrRODj4GJ3FSSQJGYNWrcTb9zMc+
         AzPdbj7vvW/zBXzOWLdlESqecyeNgmhVN7EbqSnyFE67bcZl9BhQv5ntUiD/LqpGUBUf
         4abTysB6I0az5C+Oo27N8lNj98vW9gaUQWwahvpv1HIEATES/3OjBsw1Wzl0V0jCNCNL
         seGR4dnwmd4dRYhUiaabgujMYnbN3NQCBoE7LI8dkKdPppCIGiooLtvuoBK2+i6ag23Z
         Cj1d1jNqmfTYgyq209dz1GR/BOzFaVyTca2ukxJJckLp5j3dZWc8RQSJ3vQFjE+IAGiG
         QytA==
X-Forwarded-Encrypted: i=1; AKwUvByTToKxmKoyWdXpN1IRpLYr1flduQW7l5INDIXDLlHrkSSYM4WJodxnFLAZTSq9OIWDm1TcmmGaODX1MMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFGFLuPpK3zJws1n7wCywRQ0XyOtscQaJGi7iYIizDFbtJGH1i
	6KfI6/a4s6Ub1NUUKKIL7aGMhDVJpdE/VgOST+ReUJUdOdC9cBTCX+od
X-Gm-Gg: AYBFou3WUhEAOOttWu/v6kJ0rfNgUa+xNvDKuHxjVIizewGbNLzAOhE3xQU0g2S1dSL
	P2phCLpa5MM8as3pL1W/jFH+Pp8BmHn78hA461TgjRNHchBOpfyRBoRfp7Cd1JVzJ+jkwfRe89s
	HDKSunGbYJ9zldlaxObTK91kGSZog1vFQ9rSwvyS/J1OKm3d3qTLNwb09oGK9Ak5ZHgS9RVgffu
	6PwS9fL1IZRbZ84kUCbgGw3Z79nsmw+JSIC6pFD4QW6AgLFowfcjEGUr8eKZ0EU5MlU3wsv1IH6
	lS3xycFSNDRXzAy9ebJo0zandqS744sVzNOjOUnRelU45gU/SFcVEQc9p03Bnl4O5vVft56siGn
	wXZB8xZIShFmzfOSZQX0pAfyLZFpVYFFoyJ1MSX8CuT8G5517UDFiw0sZ4OEajou1KIXqv/XPWa
	MdDN5kR+sTRXwPiNA7VM0R6G5gJ2DsiUE28MS3g4FTSvxO9T4SufAXMUHNjNtIiSD7RI56/j5Vb
	R0zw3IiYKj6VbZcP1MgDIU+BjyBv9/wUfu1iKOwGCT9qzaBI6owY2d1wI7oq7QAj3rdpgJCYoQ2
	1KHSGHybuUVEojkHz5ctLQt+kGN/Raq4n8QJAt92BxGXef6rQnKdikbUYp07YU/pP+Hh6GIVE5B
	Qc5tNYFwb1DI9rqmd0ol5OOg0hjMK5GE=
X-Received: by 2002:a05:6000:184e:b0:48b:10af:f85c with SMTP id ffacd0b85a97d-48dbaceba34mr11528014f8f.37.1791738763113;
        Sun, 11 Oct 2026 10:12:43 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm15337433f8f.21.2026.10.11.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:12:42 -0700 (PDT)
Date: Sun, 11 Oct 2026 19:12:40 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Dingisoul
 <dingiso.kernel@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] iio: gyro: mpu3050: add missing trigger cleanup on
 remove
Message-ID: <20261011191240.5a2ba4f7@systembl0wer>
In-Reply-To: <20261011-mpu3050-fix-v1-1-f55b0d138be4@gmail.com>
References: <20261011-mpu3050-fix-v1-1-f55b0d138be4@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Oct 2026 17:53:01 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>  drivers/iio/gyro/mpu3050-core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Sashiko review came back and the issue doesn't seem so
straight-forward. I'll probably introduce a local pointer
and then assign it to the mpu3050 data struct.

Attaching Sashiko review below.

> diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-core.c
> index 07c0f9011c63..096fd0dc608e 100644
> --- a/drivers/iio/gyro/mpu3050-core.c
> +++ b/drivers/iio/gyro/mpu3050-core.c
> @@ -1260,6 +1260,8 @@ int mpu3050_common_probe(struct device *dev,
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_disable(dev);
> +	if (mpu3050->trig)
> +		iio_trigger_unregister(mpu3050->trig);


Does this unconditionally unregister a trigger that may not have been
successfully registered?

If mpu3050_trigger_probe() fails (for example, if request_threaded_irq()
fails), mpu3050->trig is allocated via devm_iio_trigger_alloc() but it will
never have successfully completed iio_trigger_register().

mpu3050_common_probe() catches that error, logs "failed to register trigger",
and continues. If a subsequent step like iio_device_register() fails, this
code will call iio_trigger_unregister() on the uninitialized trigger.

Because the trigger was never registered via iio_trigger_register(),
iio_trigger_unregister() will call device_del() on a device that was never
added, and ida_free() on an unallocated ID, which can lead to a crash.

>  	if (irq)
>  		free_irq(mpu3050->irq, mpu3050->trig);
>  	iio_triggered_buffer_cleanup(indio_dev);
> @@ -1278,6 +1280,8 @@ void mpu3050_common_remove(struct device *dev)
>  	pm_runtime_get_sync(dev);
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_disable(dev);
> +	if (mpu3050->trig)
> +		iio_trigger_unregister(mpu3050->trig);

Can this cause a kernel crash during normal driver teardown if the trigger
probe originally failed?

Similar to the probe error path above, if mpu3050_trigger_probe() failed
during initialization, mpu3050->trig is left allocated but unregistered.

Calling iio_trigger_unregister() here on that uninitialized trigger will
cause the same teardown issues during driver removal.

-- 
Kind regards,
Joshua Crofts
