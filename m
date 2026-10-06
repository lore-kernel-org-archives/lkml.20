Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ACD39F165
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269038; cv=none; b=A+y0Klc5rEfwKFBJP/sPZAL3oLL1r8JzJ5xx1kuO4i4bE1tdfgfzObeozxatvv/VkYDqTxsPlF9tlcJfXyCoE8jQwGKO7s+epRXEeNQpmtlC8Dz01syhPG8TxjlvmZ7r5jerDJFcBUdJ2W1ZeUfp6r3qTT2WIdV+9fad2r7nCIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269038; c=relaxed/simple;
	bh=J41VmjD4EFgYfzl/7VgyVDca9LLRoFkhtnzas6rTGds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFvBsfKhoBmm3ujNHOMek0Ab/MgYu5U7OoNFhqOOUGj0P5roZFnHjbeAXby1UOV0nrxE+KHEYuHe/QyXbySk5AM66NvZ1qPdMu8g5wONIZ94DkTwYwK8OCgdb5ys3D0xejnOIPSdplrnfmKJ6YinrqfsL2Gf3PeoYk68S/lHPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djiHs3Z5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djiHs3Z5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so2451915e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269035; x=1791873835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCBQ9OSiuHfTq4KBApOUdi5q97pueuXHIVTklJDANJE=;
        b=djiHs3Z5Y7QvwNVYxBx9grq1YFmkW2qIfiEqe50mCx7F4WfZmCvSrf8T5Dd8MfqBOU
         oN0xqYux6Z0Nc90aFiX0De/gdt0jY/sECK/MfJoLcV6ABk1MCN7h3KyNu/mrPSi3W/Vw
         9ebOk/3sHG+zT+CNE1rPu40/icnkT0S0L/XSlRYuSDlJSM3+3svaSqpntFKAK0DhmaGY
         T3XePomQHZKDZjjsklUDZZhyxu5gLjZtw6ZZu2vkBvDmmVFapbg5XEImTxqRs8+a12KV
         TrAEMwUZNxZopN6XAhWhDB3Cw2c3kJvU+zDDdeuzJEcdm7/y9e76Y3dvvvQgMD8UMe3X
         k8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269035; x=1791873835;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCBQ9OSiuHfTq4KBApOUdi5q97pueuXHIVTklJDANJE=;
        b=U3OStxdAuR5sPXTVWiZKTfB3qtD5nz6mz85hLY0NYqlQMlOPKBtoX82G6xFHMnQupH
         LmsUXoStrvy0O0F6huidBmnazRFKDbOoYgxnw18hAyiUYoPJHYCsfVLrmsmUiwNlcNhL
         hbJ8BdNtVfFWsSVGcVMrcqts1mSanxp9hEgJ0LhCctPyXejz+GZA7jYcZuUtiOt+PDa3
         /xSW19MD6P/vr64ScGYkyDf2IKiyxbbMfGET7iIqlFr7mAiCJn5b1+8DrJVyEgv3+lBo
         ZJyTuNvbnqVnl/2/Nel9g/vfnCZCXjwF8o3aPPha+PzQPOiFMtTrQVZX+sUtuOzhePHI
         yHaA==
X-Forwarded-Encrypted: i=1; AKwUvBwnUiqfV89PnKojWOqS4uWKfYPiqpD6hOk0UV8gl56DDbvx2/xoBW534dA8sdRSZI+brjR4zcjujntqmQk=@vger.kernel.org
X-Gm-Message-State: AFuF++lThbMpWSo6aogKmcqTMom6g5uLaYP7/ssRneStqq7I6dhqa3hr
	sFctpKi0qu9eP4+rP6bahKI0X8IV3vbKkI3WIHxf+zNzQN7HfKTSKoRc
X-Gm-Gg: AYBFou2KC/0FXdploXOdgbicdMwC5/M7wYatljtoxF3j9mtRtINM/zMpvkXyo/eNn2g
	SdzsNW96vtPLBIk4KlK860j6W4i5ScC6205ZnorcNgz+Iou20SoSDuhM1u/VdQGQslLPLkoOefG
	65fJZHjoCThWgDfo5Q9apn67TK+mrh9H8ov8RlAPjPeHanNskoMhy4K///DKC+yZAhhiePplFWs
	RBL9k3HVrhndMdL3Ms0I0H0yDmRnngNY8jlPeuZb3kXH+I1Znf9FFVUWthmCAwkS4UQyLbH8ThF
	GbxOTO1+spaGmRuZNk5MoftNTymeHqYP28vJ/9KHcvDwUGEOt5llo0DVIMq/2i1BLP7tv0m3jjt
	ZtrRuK3jmNgFgXyJKKgnA3YiU7x0bDsbrevn20Du1pg45/Jh2Zmv4H5+/DdLw8LHs6Qb7ubO0zg
	FxgVFzgmNllcH1cAFSkxU1oJnGcVrZgpwo7Jcux51NA4fBmRjApCxOInWM569CvWVBC6L6EYv07
	dc/+ZPWB92GC5ZlP6D0C5d9T0wgKvK/5mJa5FRrFglH+kbWK5Nlb0dG7vRxcWJPB/4SxxlvYm59
	mQff2Pa8hja/6YaKaawhlkLMMv1nUeSExdLRHmPG0IYYpw9zW0xHQ5EjUkpCLEe9fjjs//SBKk8
	MhWP83tZf0uk5Oz+JdAXtYpEDsvoA0Qsi958lYY4lABc/IvsYCKUfL12sIfthQA6RVxm1eWVup5
	+cWqRI
X-Received: by 2002:a05:600c:3c8d:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a17b53dd1dmr8467765e9.12.1791269034997;
        Mon, 05 Oct 2026 23:43:54 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm327658955e9.4.2026.10.05.23.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:43:54 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:43:52 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Leonard Crestez <cdleonard@gmail.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] iio: trigger: Return an error when the trigger has no
 free irq
Message-ID: <20261006084352.00006689@gmail.com>
In-Reply-To: <20261006034147.2370-1-kmehltretter@gmail.com>
References: <20261006034147.2370-1-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 05:41:47 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> iio_trigger_attach_poll_func() prints an error when all
> CONFIG_IIO_CONSUMERS_PER_TRIGGER irqs of the trigger are in use, but
> returns 0. The buffer of the extra consumer is enabled without a poll
> function.
> 
> Disabling that buffer calls clear_bit() with a negative bit number and
> drops a module reference for the second time. On arm and arm64 the
> clear_bit() goes about 512 MB past the pool bitmap. That is an oops if
> the address is not mapped, and a bit cleared in unrelated memory if it
> is.
> 
> Return the error from iio_trigger_get_irq().
> 
> Fixes: 995438233579 ("iio: Fix error handling in iio_trigger_attach_poll_func")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

A 10 year old bug. Nice find!

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
