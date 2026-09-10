Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682D53AC0E4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026542; cv=none; b=GT4EDyHvRD/b0NPTEbpwqa/S8L1gwFybQB7GMe8DPp9sCSevajqqvJ0VptX4dMoG2DXxCLzWAzinOXSfyubRzqnafPyWHdwk8DvoK+Qmfwj7bJH7qa1OWpOthtoXLA731aNpMoAsVUUPvQxta0uvUfAUPoUYw5w/f+d3WGFHhoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026542; c=relaxed/simple;
	bh=THTDXskffpUZ9JZxziWLBF3Q9HrUMawUCCalagYpmp0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPc85wgFmA0lAlz5O4juDn6/BDtIXTCM5fyUjV1vFonBg6EKMSmDEVaZ+PC8ZFmajHk5ovOBQvs0E2nNsz65GpIGlcHLwe16pGI2DKloOWuq1MqdPra1++N1K4ld9fzPym2TXQHlGgbDl+2lYyXQKoMBqyRC44ULpQoW7Riaeug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgW7XdoG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgW7XdoG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so52205645e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789026535; x=1789631335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncoEJh5U1cN5FlCpWJf8WOmw4w7aR5yyugqARzW4Hgo=;
        b=XgW7XdoGXg1sUGJgy5TeD4Cb1b8NbQM7u2VKXc0WE9TkpCr5c0e3BbLj0nsvL+0kX8
         SVuMRw+MUnabXZkm9JmvF4QUwy+IZMB3X4pcvH3F8GCIzMUWgBVZ/u8HAVyitWpz+Hr7
         Yjud+fB7XORQBEqnGtmwIC0eWsP1bQXPPvzAdXt+u/Wyl05YAR4zZ6mU9mdIyKjZUHAG
         T8i4LHvJaTcX/g0isl43ADp2/pGG70kCOis/cboXW/vR/htrKVJvG9YANt2EqUxKAviP
         7D8gSAjT70v+R6rJf+wLtu6CFYqUOpvnClOZF0EzM8C2QDeLozdT1h0zpSLG6GKP5c8E
         LGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026535; x=1789631335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncoEJh5U1cN5FlCpWJf8WOmw4w7aR5yyugqARzW4Hgo=;
        b=jdHsi+BsaAnIZcZsYDwYEWlZumjWE2Yx+YG+75c09QLYzDFJoE5Mx6tlbhqe9jNN7Z
         8z4yN5PDo/Rpfhjpnfdi2VeYlKBCQZRoNttTo+SY89yGSK2Hwycfww83+407dt7MFkOi
         Ug4KeW3JMJVJreE+PXoZjsL1O/yb4pGfz+BHHwuT+pYneDRwxy/IxWKQV5n/c5bT7uY7
         ejOy6LPfxpV57I1rCOg5VUgZ3tChKR/0e5Y3ykjVpT4iTUtiNtsAaGaANc+SfXoFCm9p
         SIcso5gCgQ7kVQ4s6xDGvZam4yHc4Uj6Pn3fmE/Ml755N/B5UXn9ZGFy94eQqGrfhY2G
         iTtw==
X-Forwarded-Encrypted: i=1; AKwUvBz9cJo4EAuvbSh3UumcJq7U1oQkKlv20LbkCH+7YSnuIdaIZkpUIs5JECM/zzfAY87kcqCgk38ncuoKj5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m0ChpTsBwDyS50eDN0JYLP3Nzjvqajt1pMPe7U/DF9L4QXeQXe
	86ZU1+jpcZWoFqDj/IVzKcACQYpltGvrXZQcd2TAa7V9siTg6DGZDBD8
X-Gm-Gg: AYBFou3vZtcm6rS3H3gic7GI/3qPJrqtbxaj0VryQj0IUBEUIzzGf3jX7nGlmkaU9mT
	MEziU4oEiECqdTmosaljVvcKwYO5wekMrpstzYQOrnri61BoGmBS+e1wdJu0BXP/yLuZHbhq5bq
	Qv81YIqeCb8DJhTL2M8YgAmPzaNPhMOesNEoQzFX+d4q8hU7H9TGsxij5A2VMQSvpVdk/XQhHzh
	BR3me4dqoWPmSzLRdJYUc8gifD7Ng3g5xBVdldkwwm8dCTgu/9bbq11RF+idY6/w9AjGMOzUnwP
	0e/YNaowx3iQ/sH94BMvG+m9dM3jEr7YaUcEyKzcAJZOiBt4n9PVL62drN4+l1qXpsXcGDoI+Zn
	Lt85qcYPhW+iyL26Ii0OtPVTNfeQJGTHpoRHG3fIqE4U6BvSpWf77RRFLTWHGxtyq/V6iwNVGl3
	i4jLFcUovUTViYZyhfRjxIAC2uQLDCjtFM+ck1IaMbjpwJll9Kby7wgs8DBwTx+3Y8F+AGfM8u3
	plBSDu7+bbqh8yNtiW55mWvZWVHjTciUim/liW5S9BaJAxQYDsKza+n5Iy7UN2MKAWjcRVpqO6y
	ioW8Q8iZ0fQAlVIanieZpC5ojJnyYethSrHfO6h9ybHmrdnQ6WQkbSUB8zAlSshX0TfaJcsGytv
	S2nRW2wlFGYwDZGIZh5gpDse96iVjXEECPBTTzBKtHgFX906bMnqjCbljyUMn6wS59PER/zSMU+
	MTMhVn
X-Received: by 2002:a05:600c:620e:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49cff2078b8mr379128155e9.31.1789026534498;
        Thu, 10 Sep 2026 00:48:54 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm10381195e9.1.2026.09.10.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:48:54 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:48:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Fabio Cesari <fabio.cesari@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: light: isl29028: fix runtime PM reference leak
 on error paths
Message-ID: <20260910094852.000052d2@gmail.com>
In-Reply-To: <20260910062449.331749-1-fabio.cesari@gmail.com>
References: <20260910062449.331749-1-fabio.cesari@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 08:24:35 +0200
Fabio Cesari <fabio.cesari@gmail.com> wrote:

> isl29028_read_raw() and isl29028_write_raw() take a runtime PM reference
> with pm_runtime_resume_and_get() but return directly on their error
> paths without dropping it. The usage count never balances again and the
> device stops entering autosuspend for good. In isl29028_read_raw() this
> needs a regmap access to fail; in isl29028_write_raw() one rejected
> sysfs write is enough, for example
> 
>   echo 200 > in_proximity_sampling_frequency
> 
> which is outside the [1:100] range and returns -EINVAL with the
> reference still held.
> 
> Take the reference with PM_RUNTIME_ACQUIRE_AUTOSUSPEND() instead, so it
> is released on every return path.
> 
> This also stops the return value of pm_runtime_put_autosuspend() from
> reaching userspace. That value only says whether the device could be
> suspended right away, so -EAGAIN or -EPERM turns a successful access
> into a failure, and with CONFIG_PM=n the stub returns -ENOSYS on every
> access.
> 
> PM_RUNTIME_ACQUIRE_AUTOSUSPEND() exists since v6.19. Older trees need
> the manual form instead: keep pm_runtime_resume_and_get() and drop the
> reference on all paths with an unchecked pm_runtime_put_autosuspend().
> 
> Fixes: 2db5054ac28d ("staging: iio: isl29028: add runtime power management support")
> Suggested-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Cc: <stable@vger.kernel.org> # see patch description, needs adjustments for < 6.19
> Assisted-by: LLM coccinelle
> Signed-off-by: Fabio Cesari <fabio.cesari@gmail.com>
> ---

LGTM now.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
