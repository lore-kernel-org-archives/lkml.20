Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE4480320
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390168; cv=none; b=SUlnMd2vF/eDG12WxXPK4YBgVgpz3xLZAkqTbQz0oGgz+Opqciwr5b4dFjzSPRTMX7Mzf+bA1hX0dWn6uF4QNrF4qB5HlXg7rK6yRy26J9BINpmFnObdzjg9Lfl9T7GWrCLhOVJXgQAKD2n5qDro5mihyUk6oMyyitskdJPSJrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390168; c=relaxed/simple;
	bh=aQYzR+IvQykSVUn7rBpK3rQlkN9oxeBGlmz382e3/mA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFH9SjOq4mY8fr2HadPD6QQkqVQSkr1brBbWoH9Q+woXUg/llDSDeekuQdQqO1yi0KcDbPHAJw9aEVCJlRV7RvUi4wCAk1nzhsXzqpBIMnzc6xpIrea0jHkZm1RShkrJctzRON0RFj03+vzfIddo20D9bOnBzkJPAxVmXaPfoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9CnNKXI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9CnNKXI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so11209615e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789390164; x=1789994964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Gq+pmsPFihIMk5W7k1MUPH9S4la2uIzpj309XLReH8=;
        b=D9CnNKXI5nHcsFda0H2dor77STypOKXJblNRUIaQ+aR7vU/2XWfxiXlJTvFSiFovhK
         zcfrX4vgpXvi5FPPBbP5nf8wIkQNKdpvkwQDrdxB5MCByApPWtPLKL56wXxBj/qaPLH5
         hITKlnQXw3x5rRvlnyPB2TDduN/ct0b9l44CAgVatnP224tZepwmFf6a4ajXdKD7tbqw
         mz4Eb9OM5NouWpbYG4VxNDsI3XtN2KfwjsP/2tPdoAS0KBofb8uxlClrIqv1s4mxnNR3
         Ji0chWYxUrg6phuLvUBmlEaKzhpets+/aQ3kK4K3iLu7RgBsjlluveR1asVBsWbtGL73
         Jw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390164; x=1789994964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Gq+pmsPFihIMk5W7k1MUPH9S4la2uIzpj309XLReH8=;
        b=iXdbH9WzrA7tn4vvTsyfvBVJ3qDTIpopbAjpXSUh/7TjlMrhQ0NLzHzDdldFKl8Kbl
         wgMtkknRHvNxa9YwTufaQVylsfSxfKuG1MALva8ewIWd20RkxVPy//O2HMTHVJOWUgLy
         O+VIIHTVVbMSpAu79HMB6QNRkCXPVkQvRgRgvqhQ5dqQXq6OBscrkGy8vZIkbpe8pU6Q
         WcPOIfpYISVtKpNGj1CkHsmUE99GL+Vony4MMEXszmojc+i1xamjvkhG9rk39TNQ+F95
         rK0uLF+yHy/9JGQ174lla6yNbnVcyVGiFt4YFr0VEXnn0RZbe6yLFLt0Z1q0bpiyFd1l
         rSUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy1LKh3pSieffkN6nNZHeA7AoA5XIM8Wa5iKV0+xlxfSgV/IlR9xRSB5AqSGDeZnVYnO3TR88MEjc0IMA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+U9cytI+Jy9tYycKLRZuLW9dvh59nv4ys62QY15TXaenhCrV0
	BO4h5ZyBChSVEXj6L5ge/kIvf8IhanxQwh+rOnBa+VwnKJ386CyYRl29
X-Gm-Gg: AYBFou3SYhhy1WrS3fNbJM1K4ye22fKXmcsmZ7D4OtEe9owbsqxiX1U+HE4OrhyUXUE
	e48TuvdtcVnFb73A8IIarrm2LIEukGtP06T2Hk37a/MBDdBkt1FNSnOADxgBe1oJHB2tsPe9uVl
	jHPI55cKOdtvJWs2hX1Nb1d4vC/fyxyQ8rs5lT0GBjOYBgZIScLwkkDQfO7Z7xUFWweRxZ+KK5u
	DqGancl+S0za1gxiu/00PX1uXL5QLR14ozlJxHzKCCweEIgmjhMIvqv9BEFjWzomsMDTTbxt29N
	fMNCWSExWDNR3DqXvSpzJc9Eo7h5DvxtEpW8HawrcC83G2hdjSN4Q64+sFywSNvjjCTXl2CtL2J
	C/pG96hOiAXsdd3pEH0NOrN9MH9vsTBigHH2fO7rQhoEYeJPZKK8dI7VBaYGi/lG+kcnEBtJyUe
	Be1vKIbAT6wQnrFoipuRhJJ9F42vh3y0q/Ju98rQVAQveEKhTSjSf8i+PZSzuDcTLUXS+5dHqvP
	cR3U/rvPcb0yiJpx5lSXjjnUxcT04yNT7l3c/W69Wd9S1J9UX6jJZflqbNePOv/cgKQqwlPiicn
	RdcSzK/4e9hQMZHGDYsX4zA9eZIYPtJeqS+x4XnAm3+EjmEqrrCMUWIvKTmNuDW6ODYqQaT0hhN
	2kkTpBP4eJe+cksnCk5uEgftIvmeLSDcwVvuXB/Ohr79zILbr/dPfwMUbnyPi0BmGucth7eZoX/
	Um1QwZ
X-Received: by 2002:a05:600c:3589:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49e7a669271mr34433685e9.11.1789390163869;
        Mon, 14 Sep 2026 05:49:23 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e63c9a7c9sm527964885e9.13.2026.09.14.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:49:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 (The Capable Hub)" <u.kleine-koenig@baylibre.com>, Siratul Islam
 <email@sirat.me>, Matti Vaittinen <mazziesaccount@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] iio: accel: kxcjk-1013: disable autosuspend on remove
Message-ID: <20260914144920.00002f7b@gmail.com>
In-Reply-To: <20260914112053.1686061-1-lgs201920130244@gmail.com>
References: <20260914112053.1686061-1-lgs201920130244@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 19:20:53 +0800
Guangshuo Li <lgs201920130244@gmail.com> wrote:

...

> Add the missing pm_runtime_dont_use_autosuspend() call to the remove
> path.
>
> This issue was found by manual code inspection.
>

I'm on the fence whether this sentence should go under the ---
 
...

> @@ -1547,6 +1547,7 @@ static void kxcjk1013_remove(struct i2c_client *client)
>  
>  	iio_device_unregister(indio_dev);
>  
> +	pm_runtime_dont_use_autosuspend(&client->dev);
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
>  

It would've been better if you sent the 4 patches as a series with a cover
letter as all of them are the same fix.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
