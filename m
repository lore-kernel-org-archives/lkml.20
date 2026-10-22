Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657109;
	b=M4fjX8ZT2N3ijzNdb7fC+YQly+/sKlWjjNhB6KQ/wyq95ecYyON+Jt+t/W83rM+gLrTE
	 BqAxYhG/vsYYHzMxV6JShL3B96IGg+bCNl+DoEhUyyI+V2dz9kGx8fOdJxFiUjcZBul98
	 3zul4oqZNtS9od1EGJifYzc73M9DR+cB21nFiX7Wbiu4OxlL/mifhQOSIyhJlIFTZXsNo
	 /WBym1NUJVKcirk1J1d7qtPHTeJ1V/exasL3RXnDjVvB59C31XgzbdAnc7vxqK+EWNReb
	 1IRqnf6H1fBbgP7l0AwKqSytMQNiMHnVvKVypbZE/Xls6dhUXKtEw7c0Jy+mI/UVAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657109;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=yhLXfbJ/1qVmAQNxqFqMtZacc2QMaokkAVZ8ZnC2ZjA=;
	b=bjy0OrhoDwq1dM+Xn84rnQRtyqhrB2XYipXWEq22MsQTJ94xUpAm9Iv50ly/rBPKeXP2
	 dzk2CUMcDg8ybC5DrWCRI36nMxptGRiWS7CyQSy5aLsYOkKAvNzUs6z10CA211eYD/cxt
	 w0SRTPE4n2IbZ8rS8GbIVmOlwVGzULMyqyQ3HBOinfoF3QotFO1lphc6r8F7DnEKzVAtS
	 D7lP86eWqpIUEvq2m6NjYql5IiDBtLVVEHnPEYy+3d6vNss0uKzhna055uCwbpv5FRD5J
	 jwmQuhl1fkktHzrN0apGK+QCqKi8wBJ/uW+TocCOJxtEBpbgU8otKCTdhoSLzAGm7ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBno0kRT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6005606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBno0kRT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431901F000C2
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657109;
	bh=yhLXfbJ/1qVmAQNxqFqMtZacc2QMaokkAVZ8ZnC2ZjA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aBno0kRTfc9w+XYhaf8R9aDI0Iq4Z7q2xj8QmoWpS804a5OI67R18dj8WP/jYLOQS
	 2GDcMfPEuNHUibXPKO4xoZ/9hWirTZaKVUICzhfbEh5wqKGpuemLtXLipJ+5CqvGm+
	 0hSCc8bGrVH4cV+8PK68Kt6fPce5MRfGdNtcw8n60gpDMxuMsAvnSfg9mQBqM3JG6d
	 JLouwwbyAPSs3Ze7FURAbHgNBqgqX1xH/dW8IRO1zZ21rmLlaMKo+ZX525NYComEnG
	 EtnXWC9h+aFlhREDFoPAqJrJ3Bl7P9fA9uPAPSt1X4lHqbkANqP7ysXE5AxC9sRVGp
	 X8AD0yNl6u6Ww==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfa686881fso61068e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:18:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQhnWBtl3wCxuq7bNouWMWL0FGu8bbYkA67O5CY2u0zPv7KysUlrulV8vHN4DapiQKrP5h/ooPk66JBiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1nALpEUyZpuoKGFYRUv1Dq9OTqi7Jl9ykkQ5VL3GRNV4SYgEa
	48OWEHHgaBPXA9AhffrhFoQsn5pyygJB1sh4rir4gEPlbXBpyDKWIFZTs4zLkaFATaVkIu0w608
	8ejPzE4k9+TvPIJ4VS3TSyXucb7BRAR9IK0Ngbad5ew==
X-Received: by 2002:a05:6512:23a9:b0:5b8:f453:b0e with SMTP id
 2adb3069b0e04-5bfa1bfcd89mr1596728e87.35.1792657098927; Thu, 22 Oct 2026
 01:18:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:18:17 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 01:18:17 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021145543.567959-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 22 Oct 2026 01:18:17 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfdxqmmV_rLbc2q5pFzR2527-+hVEuF00wJBT1V1mWNcg@mail.gmail.com>
X-Gm-Features: AclHuK-VWc-CgR9YOdeMtdh45PTw7D68pexvIikFGsCdBeBjT8WB_hOX_rsj-i8
Message-ID: <CAMRc=MfdxqmmV_rLbc2q5pFzR2527-+hVEuF00wJBT1V1mWNcg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Put stubs in order in linux/gpio/driver.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 16:55:43 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> The stubs in linux/gpio/driver.h go in a slightly different order
> than declarations. Put stubs in the same order.
>

I see your OCD is worse than mine. :)

Though it doesn't apply on top of gpio/for-next.

Bart
