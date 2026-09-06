Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FB432B118
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788702940; cv=none; b=H5gX9QKV27lpi37NSF/GkXC8ZZjPsTmzpSfb21cFDXhJ6Wb4+HqDcy0uNnzfebaENgOc+jSeqYcEHSwSZEhrI2w5unfmFft32ooTixo4e4Lm3tKx6jSXa9OUwpGbnDeBnU9Lto1ewlnRLi3WegK6yVlMHABQzF3isL4+KPJmHIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788702940; c=relaxed/simple;
	bh=9AbHtUnyJdSad1+pPE4S5Q1Qe0SJtnb1F3HJ+4VOdHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTf/TdOJNtCNl2ZL9Mc6cgXuD6qqWyBj6CmNzuBw3zLT8CWpSWCJAwPcZlGiVfI87eRtHOkPbpkLLd+Pp0t0/LGB5UX6/Rxjc29oQ2MODEtqIZsiM6QcEmP2TCT4O+MrmtmuDyKcxo7sUQDlXrU565VdbgZkCP6Sty0bwb5x5yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgXjUoWc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgXjUoWc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so5930635e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788702937; x=1789307737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AAkt+WsD2x5mubq2SLqxrx2zGJJKOZ40UAK2ergnfnc=;
        b=DgXjUoWcxBUxd79f+URJCQ1Sj6f5u5bxv1RjUbBWyCzCg4klDK2vnn9IDxWc2+Ywo8
         MFi3bduJYfjs1Dw3vBDJ122wcnS3YeU1Uh6bnbh8j1n3f+tUz1lqMrrhFw8nPMM5QmJ6
         bcrBwb5J5y+UZ23Y0upefkVYRkWqxG7HDGl9DDTXG9dq4f3bCwEKwXrL2FJ4ZO65JPld
         kiKw5Nd5bgNUPN/Efrpyy6Yc67Q+bnS8/60HijATD/Uyie28vaNl0GaMVIRe8K/Zc9I2
         sWh9yA3sRdMCrMqPewlZ6Bh+8Oz6tHWd3ROYKTaqdrlKafUc7DBpbfvXL69fxYWgg6i0
         Bddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788702937; x=1789307737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAkt+WsD2x5mubq2SLqxrx2zGJJKOZ40UAK2ergnfnc=;
        b=pQQBPwXRWMj6LDo2Pb24vJEUGc+qijuJ4tqiIeFZiq4+FJ2HtclBrLPlu4hMWbcax/
         fSIiKXOFcbjWbQKIXwVjVWn3lH6ljqR32AGvu6Vn+bgjd0fOqWbh9i5xqLk07N50Z7Ht
         JKKAbik8rQnwiwzBtnbL3THLy6jkhq9rbRJAnZeT4CEbnLIbWC9X0yN0AqRdaP5bODJq
         jcX3LErSYb1UFjsrdEYj3XDbxOtWwC/YPsnvacD8+dI5vlin7qEK5tL9fYVxOqFniRM2
         ysRgqgQRbQG/F9J6s1C2mwskZ3+wygHoEcvb6Zp9rfo9d3kTV2JxLJ9G9v2fqgH+O73+
         zzkA==
X-Forwarded-Encrypted: i=1; AKwUvBxjgG41VUahECkPGT/V4q/JYqKcaSOr4hC7YQcmaSqW0MQ5Db9drlQdaL5BzSDqMnJHS3rBNKKZc514gwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n8K7cUC6w2mfx031rPO0vE2X2OWxwfWnRPjcy95Kquf+dEXOnr
	9kBTATjBJLQMECcyNbM7OLqtIHwpI+V+f4t3OAYxBdkUoSChlQBtSS9/v2xma2Lx
X-Gm-Gg: AYBFou0edXRR9t4LMot0/Xu0lDEn5D5CLKKzeVD4vvvwahv56LqH8hH6fXZEVxxeVwH
	r1XSuvZ13a3th8JpTNKjQFVV3y+CDz4px/3FKQWKCNjogX3reMoE6kLehufUNw9wLaHHDLzoERL
	+M0OoYOoDEySUGNXDeM1vQN0X5oMXVTh2q9tk9B9BhQi/vUgmOKlWq31fHtZzkgd2MnAn565Vnb
	Wic2C4S/JttkcEDM+Cig5e6q7+Cgm25Vnqh6yi5uPt/UuNCLKKRzxlkRNijQ5rC8TIwvwo5Jy7D
	VWOGlf00U638m6+JvVvgXDofr8OZD3FAgSViDulTagetumQhNoT/fpFnhCQMsBDDcchv3bCNQzv
	O4Hy3DAslNxgmtLPmB0/hoS4UkE3DNBT/1OaqhFz68DDjM0o5zR6A7AXTf9H/Gy+B3uqZfLsxKo
	pMCqML2NTY14nwfI5eoUYeLQnmZKczrCPd3/FFvhMphvOFW28vDDot+z71Qucjym3fIyqsawOij
	1A9AtQWJe+o5+gZhx9uo/MZSwhYdqJdEMXEyabqvomkRQfy1+SxNeAKQxssZMaL14o+C4IgFZXx
	dg3mKT9nWkKI0O5Sxuofa28ucmXq6m/2QGfsBg11nFT/1ERFIi2zLyLmCR9cUmaUEkwP+6p8yHI
	rIfqDbkLsXqMqEC22OsoRSKCZAVLlNLRh5iu+ljgnm7NhSTEfCDYde9mgIF2znJKhu+9atTHM37
	qclgk=
X-Received: by 2002:a05:600c:3550:b0:49d:7fc:5dc5 with SMTP id 5b1f17b1804b1-49d07fc61bdmr62766225e9.1.1788702936623;
        Sun, 06 Sep 2026 06:55:36 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07b371afsm123925615e9.9.2026.09.06.06.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:55:36 -0700 (PDT)
Date: Sun, 6 Sep 2026 15:55:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabio Cesari <fabio.cesari@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: light: isl29028: fix runtime PM reference leak on
 error paths
Message-ID: <20260906155532.35326455@systembl0wer>
In-Reply-To: <20260906131203.125407-1-fabio.cesari@gmail.com>
References: <20260906131203.125407-1-fabio.cesari@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Fabio,

On Sun,  6 Sep 2026 15:11:40 +0200
Fabio Cesari <fabio.cesari@gmail.com> wrote:

...

> Found by auditing IIO drivers for runtime PM acquire/release imbalances
> with a Coccinelle semantic patch that models pm_runtime_resume_and_get()
> and pm_runtime_put_autosuspend() along the control flow graph, flagging
> functions that take a reference and then reach a return without dropping
> it.

I'd put this paragraph under the --- as the Assisted-by tag already mentions
coccinelle.

> Fixes: 2db5054ac28d ("staging: iio: isl29028: add runtime power management support")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5 coccinelle

The standard is to use "Assisted-by: LLM coccinelle" to prevent free
advertising of models.

> Signed-off-by: Fabio Cesari <fabio.cesari@gmail.com>
> ---
> 
> Compile-tested only: arm64 (native) and x86_64 (cross), defconfig plus
> CONFIG_SENSORS_ISL29028=m, with gcc 15.2.0, W=1 and sparse v0.6.5-rc1:
> no warnings. I have no isl29028 hardware, so this is untested at
> runtime.
> 
> I also have a version that takes the runtime PM reference only where it
> is needed: isl29028_write_raw() validates its arguments first, and
> isl29028_read_raw() acquires it only for the reads that reach the
> hardware, the sampling frequency and lux scale being cached. It also
> stops propagating the pm_runtime_put_autosuspend() return value to
> userspace, which fixes a second problem: with CONFIG_PM=n that call
> returns -ENOSYS, so every read and write fails today even when the
> access itself succeeded.

I had a whole paragraph about the functions returning -ENOSYS if PM is
disabled, only then noticing that you already mentioned this... I should
pay more attention :)

...

> @@ -392,12 +392,11 @@ static int isl29028_write_raw(struct iio_dev *indio_dev,
>  
>  	mutex_unlock(&chip->lock);
>  
> +	pm_ret = pm_runtime_put_autosuspend(dev);
>  	if (ret < 0)
>  		return ret;
> -
> -	ret = pm_runtime_put_autosuspend(dev);
> -	if (ret < 0)
> -		return ret;
> +	if (pm_ret < 0)
> +		return pm_ret;

I'd suggest rewriting the driver to use the 
PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND macro, as it automatically
increments the refcount on use and decrements the refcount on scope exit,
eliminating the need for multiple _put_autosuspend() calls and manual
checking of the return value of these calls.

-- 
Kind regards,
Joshua Crofts
