Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601581;
	b=S7EJIk1s9YU7sYSoRXt3hGWHDF+J58GyjhQheK6NSb0UaW8ROV2QSUgq97d7ASALmb0T
	 5ozg+v7StADYU2/H/qvFB6TwiOf5uld88FJHz/45Fx3L/CrlniArRWFhS4BOVN+kZRrmO
	 qL3ZyUmT/q2si7kdTZjv1PYAPiukMLzluMQzinTTZ7oV8kuKp0PDtMa9ob5g7BD3pL5eu
	 BysYWAalb+Z8fetwJh2mJrJxU6npyEd5GnZvPKz8HfHMfMoJ1u7v8f4QAZ+gos2CA4APv
	 MjEvUT63PQV3MWgdw13PXwCpiF6ytqEAHMVIu/9pPe2TlbM1GK3T461TvZDWKj2aXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pKVlIvSF3bgj4NKmyst/GQOZtuCqamm6OCIrIl39yS8=;
	b=soI+bitxb+9Ec+slAI9MoKr5W99CUzdPLB0fIxEmaGeKEfHOm0zNfRQ5LK9LxMyYvHYK
	 TC1oRY1NhVFgqrGdJnzxTAKFEgnKXag74TV6fjdLIw3MDBOvnI1OL4G2+zk50APM0n45t
	 I9GE1yhZd5dNbJrl7MRw1U75t2Zg5nGw664LicmnUYG8OBgQMnh4TIm8ZD0YB9upNBzh8
	 gdyfLdmEJc4ExA/Bq1F1rWipqw1fYO4JnkqObO/aOjR31rfM5MqoUybstL62kUmRVuGwQ
	 2ZY+b+HpOowIGh3ZhZI2KF9pUkvK9OeGVJmT2Es2Gs9k1zuXZn5karNsUL0K+bONjug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qmbwvlpD;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616FE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 616FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qmbwvlpD
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so1193697c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601580; x=1793206380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKVlIvSF3bgj4NKmyst/GQOZtuCqamm6OCIrIl39yS8=;
        b=qmbwvlpDjjnvN+ojyDVZMh4S/iXYFHextf/p4m9ZyuKDJw8yp4XS5IVGfxc7T0kIwz
         HBuaORpQGk3pTdC1lnVV0qHf/leap+KQONIw/DTJpmbK40VFfvr0Pq7U0GS+JIvTgXEG
         2YquSH2LTMrcpTsI3MreKRpqLGekFDCqH9eVgfchdHPNBQHlWsB+cGebsi/zY+9vSlo8
         rJJxdvmqHFAk1xm0RwcKaKhslv0n643FcuctDdz9lZgj6/Lu7IZjhMO6EW9HPjdXR7Rg
         HlFF9KYbxy96QZGw6Mrl1K7YoL5YKGEwyI/Rjfgqu/FynbzUzjspX2rWXDL4KgmmIyac
         Wx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601580; x=1793206380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKVlIvSF3bgj4NKmyst/GQOZtuCqamm6OCIrIl39yS8=;
        b=KpznF3C/dh+nGn+H8QBpmFK1PWjDmTS0NqrG7I78gu845LJ6+ATLN491PmkNqp0WzX
         s+dtztp3Ta0RsFGRfA4dLE8ruQ20Aa60KjRMmKADRu7W+S64nYKVXEWp/XHEZKt6jvDC
         SC+H0OTUHtvxJ+AaDFJe4Hnn6g+nvgXSw1eGmlspYwX+bm2zWp3n3LFur5/tumfOYrBp
         s+TxJ/d4bY6vU0aeUTFknZrHuV23Vm4ptR8ZtTZOWQovGW0IJ4mXyzcy7f7fR6DO+h7s
         YNNqMT0fRYCeUdHmeBVqLivOJVbRtCPZ+AdKOfCxLNTouEcVVx9+CmrPZ6CjOAz0gn6U
         RN7A==
X-Forwarded-Encrypted: i=1; AKwUvBwlWTx3onUY3BubrK3oLU4hRQCAlRujdCmsxZcolCwPYDPx8RQ18EJidWVBsivSsTXodKQPfuOeFm/lVQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCTiPlyGxkkPeuvI4Zd+hYA2hepJQdNca62J9vH7eLJp3twJx4
	dInf6XAlWy+U8/ivAOOX8djSnM/SF7uwxYtnIWjNxq/j/shfxLKmCz0W
X-Gm-Gg: AYBFou3cv5pzljxMUm5n3EpmNf2RCjiiyeFngz/tc4JLU9/MZVzaIOTJ7tGdm5X08jf
	CdjlKknnJwUYFtA9ZxRywBHSC/K5nNDVVwbFvaYJUv9aJhdcQ2Q78GyOSb2/J+qgMgxl/TUid41
	FQi8he0fKlYIM1bU/J7KrsJIXC+lNgjWYNnmahhh3wCEdb35Mu3Nqr713YmWdIb2+n60MvIXizn
	Z00lR7ds9muTomnmF+wu36qKOkqtqnUcTKmUE3oxSWD968ZbXbB0l9o0NzhFJtMbCyBr9o9rMYk
	YtTovR1iHHAwDG4HoKlBwL4qleoBPS8asuHJah/yBIar+KpF4Qn1wdvYBrcwXppjnyKEeGz/+P8
	Q/0ibQwum5DbKkozsQwSuH3kynDUJz6D4kcd3DTVgxJb+x+SwTHaL8dmhCSMtFGQLoenMX+Wafv
	Klckp99N3Y87uH+ApcA56bd4/bhS/+thy/wex4Q8TyU1zDfAnbGHnioa0J/J1jBawNUKU25vzD+
	B6GJt8rfsZm8JZc7V6e8aSpgPYY371HiUpD82pJuKqXdOyUtGI902roBxMPbARRgKrw7yPCdB5H
	R3+hshgYXupDQKJBbu87PA==
X-Received: by 2002:a05:701b:260c:b0:18a:6c40:1a35 with SMTP id a92af1059eb24-190a4e0f52emr2922497c88.20.1792601580385;
        Wed, 21 Oct 2026 09:53:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm7779991c88.22.2026.10.21.09.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:52:59 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:52:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Shi Hao <i.shihao.999@gmail.com>, Rachna Patil <rachna@ti.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev
Subject: Re: [PATCH 28/28] mfd: ti_am335x_tscadc: Remove redundant
 ti_tscadc_dev_get() helper
Message-ID: <atjtywLzWKxoddD7@google.com>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-28-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021121245.3111563-28-lee@kernel.org>

On Wed, Oct 21, 2026 at 12:09:50PM +0000, Lee Jones wrote:
> Now that ti_tscadc_dev_get() is a single-line wrapper around
> dev_get_drvdata(p->dev.parent), remove the bespoke helper and retrieve
> the parent driver data directly in the child ADC and touchscreen
> drivers.
> 
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/iio/adc/ti_am335x_adc.c           | 2 +-
>  drivers/input/touchscreen/ti_am335x_tsc.c | 2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
