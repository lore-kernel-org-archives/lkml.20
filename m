Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D38493D4A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946282; cv=none; b=tpfNanzbPygqj1gDm+DqiCBczY3mrPcmL9tNrOeVwW2fiuLP9yCk8OSNCYyX6oOawj9usWcIw7hbNC3c6UR4mVBLzrwslrXh7moGhDH4TlwCj3cfok3wjviS0wh5PGfEmuc89umAxHJYlaXBUZUEK9cg4/ytj3mY0EqSqETZ9+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946282; c=relaxed/simple;
	bh=LE21Er5LgBMHtoxp+XFH6YUALhySAAW4QWfzMht/7MU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHGw+imb1n+XFrwUtJG9MghepR5yMrDu7ETyuLSYjGa+ZYI4kJEvGkwLoVkn176Yp4qj51Ph4efon4Dk5knFXiMXaIALHADMvW2ZfdISVZwh5wORK5XE9TDWu0E7sjboNPBoYZ285eruaeAMG1dQXpjhC+AaVsS2v3C0+wELwlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxgkNy87; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxgkNy87"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so57313055e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790946272; x=1791551072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcKwMMClLBKjo8sc4QYgIFN0itGSVJ9653Hu+JKLxpE=;
        b=OxgkNy876cvqk1hxJCNNLXCsjMlp83kOTdwRmhDcPaUQnZh7aAe6xV950V2jSrmOnr
         Y59qTakdnxS07K1euAVOWRrchZXMZF81Rc/MQsoRaanv1n76kcstrUHjj0PlyE2s4YBY
         Kv3vKbOop5kRDiBdFdV/YqxKkKMzTsdpgoZUhGqBOtcZdh9K5j9zz5gUJ2mNLj+z5Yvi
         ti/+9mHLyZp3CkG9tXW/am2N1gJV9G5HIwjPP33QBM2jAs0UAdYNoQj7mtbdci1lamg6
         b//deamRrYVxjAIO3+R9c51HmdfgKOCnwKidn7Hx5a7BSWBGNILo/glxZg2pV8DTZcbt
         HnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946273; x=1791551073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcKwMMClLBKjo8sc4QYgIFN0itGSVJ9653Hu+JKLxpE=;
        b=yVlrYDRWrgaw043RJo3glrtQbx4Zz5oakQKK8UEsa1dCyzf7OSth3FILXEd+JKeXWl
         Gq/X+CdhFL8XL+jlInYQz9TKN2wjX23vdJiJUJdGPAMjEP9BOOWuYoDh3YWJAajMtB4l
         J5dk6KmWprOOP1HtnnhtxxtKmhY1beNNtRSKUEZZoUkny8+msVh5OAGY0gsRoiAQDrmC
         rPQ3vDZBqmZkOQOBo9lggkMY2P7XtHYYIA8CkDFTH0nL+q4Csq/pOmrbXmb4FEbrBc3h
         BTNOBryseH5er9eNTUIeWH250T3gGndoHupwD/mbAMeUtAz3aVotr+EPDzsRNSyAsUjv
         syyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIzuuF7pcqs2HZwR42vrngMd7JLvN0IRSOf3p/eMAWiRcURHD6aPd6q6L7r/ELjegX6xn9uMajkpxiJ9U=@vger.kernel.org
X-Gm-Message-State: AFuF++ndVqbQpWbt47A08eF6FmOcVKbZUAZLvzOQIhPE72lkPboebjj3
	3V1xV7Nv0dxBlJLU8eENnlrG0D0sQmqajG/Ny+Pn9A2qyT/THNYQXX4Y
X-Gm-Gg: AYBFou2a4iUfSYnZOo1HuXGWvzfRe/ULZGEw+eIKyGiE9+DjpmZ/aHVVf0CqMjFrcOK
	IvgBNYI12tUAOPdmdhgge6BuTFYmuorzYD4kRNTySRetc79b24vd49HWRUXv0eAuEIlNRWKOdUx
	wfplv0D1LeR4BaLeBynbyBw8xCRZQkjOVcbChzdaaObTXMnX2+LPqWirG7aEUrSahfGviD5g7Ys
	YyF4vjVtsC4ylFnY+RQSy+xiScKZ3/ZdCqekVPT1qV/hoCjJsnBOA6AmNlOBdid9XNIupShxKxi
	lDcKdRENgfsGOdSDTjVU0CXRav7FD3H83baQnzDpq+TTCMAheutA/LRc7D/k52sqHXvC7sWWDKL
	QMLcCYr6IznQuvNmGq8mGR7SZaLhPtgB/D9H7DOLCCdyROiL2oAsGcBA2QZn7a5qDAyoBJ26Iqh
	Q0DL3mY65j8yvw0J5oq7JbLlzt/ao79ms9r+VzCdJX4rhuEUVo2Cqm4LZ5jjy/hzp5l8y4Se2Uy
	112K6vBxoEJz6tT2O1I+YBrVvKxohJoP8F8L+2bBYy1bA1Os+76OT1RGcHRJpuyrm5wSxWxjhyZ
	M9SCFOB37/ht2lyIMz816r/o56ENyD7MLQ9yzSbUKQS7EeWqL/+Uyi+ZCjKdjkkJtq+h7Y2LOWI
	0PxnUdq81VFrkfp7wSMtgaPp8dDW3fGUAscB6mbk2HctLCw5mIUyWHialKcMaIeCSLHzb5KtHkO
	gYYLnM
X-Received: by 2002:a05:600c:5306:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a0275863cemr45486965e9.30.1790946267381;
        Fri, 02 Oct 2026 06:04:27 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm61064485e9.4.2026.10.02.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:04:27 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:04:25 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Jonathan Cameron
 <jic23@kernel.org>, Liviu Stan <liviu.stan@analog.com>, Arnd Bergmann
 <arnd@arndb.de>, David Lechner <dlechner@baylibre.com>, Andy Shevchenko
 <andy@kernel.org>, "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Pan Chuang <panchuang@vivo.com>, Shi Hao
 <i.shihao.999@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: temperature: ltc2983: avoid -Wstring-compare
 warning
Message-ID: <20261002150425.0000286a@gmail.com>
In-Reply-To: <20261002124902.3703019-1-arnd@kernel.org>
References: <20261002124902.3703019-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 Oct 2026 14:48:51 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> When __ltc2983_custom_sensor_new() is inlined into a caller, gcc notices
> that the string compare can never succeed and warns about this being a
> possible mistake:
> 
> In function '__ltc2983_custom_sensor_new',
>     inlined from 'ltc2983_thermistor_new' at drivers/iio/temperature/ltc2983.c:1079:24:
> drivers/iio/temperature/ltc2983.c:559:29: error: 'strcmp' of a string of length 24 and an array of size 22 evaluates to nonzero [-Werror=string-compare]
>   559 |    if ((index % 2) != 0 && !strcmp(propname, "adi,custom-leak-detector"))
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is a false positive warning as the code always works correctly,
> though the strcmp() is a somewhat elaborate way of identifying the caller.
> 
> Rework this by replacing both the strcmp() and the is_steinhart flag with
> the sensor->type that is always available anyway and identifies with
> code path gets taken.
> 
> Fixes: 3dd0c048409e ("iio: temperature: ltc2983: Add support for ADT7604")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Makes sense.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
