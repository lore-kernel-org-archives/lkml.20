Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091727;
	b=KWeasQIYnm/BvLeWGC5HOGCggq1rfpeOqcPccOIaApeh5u24Ddxh/FHhhtH3yd9FNhDg
	 Y6YUuURxEw/c5BARDcfWbzUfLtwHlqQH/oHcowDt41DX9gEM3e/7S371XujG0hamT81hZ
	 y5Gagbs/+NxULLHbHd1d7AN9in7qzmCCfQsCwpWU1ZeJe0zkAGIK52RjQKuD1jleyLBrF
	 G9a7IY6EU3hHv7e/okzlUB4hmCbC4kZRSvpT1erD4VC33ofmHWrcOws1hmbEv5sQslI71
	 iBbrNh5MlyLiv8QLLUY06nhgQUWHZfKxXyuTJDvSi//g5dY2vMebCznBr4Q+lKrTNmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091727;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QuLhFEvmmpbdFe5TBed4DD8fUH5b/6o6JMrvceQqWs0=;
	b=fCktvf/CGcni1m65seuljEIoDS30tDaTGexsqU5U8GPajXzvJZFjIiiAEutNLc6IZXbq
	 RyNevPXvi/SU2oeLOURbocQFhg1NDPVe4waXZQii182TzEAZFk1fglzbRfWz/GarXJ3pJ
	 dfjPODygXqMuIPOHFA82ulB/d2A+kOMfYVKlFQKVVc0zMahR8hIhLLeXaqAA4NmlbvbPi
	 NjlWWOWW1cm0PUQCVUQqEXREYXToCy37xJ0SLZZNOCT0cmWcYXjA8xEREzC5uEwK9HJ/D
	 m+h+fYxrgRhyBQ71rh8CFO4nRhliNW4fXpXVvq08dbFCTOSuu5y8xRr81PiFdcpVnrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHJdESOf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F49606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHJdESOf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723C71F008A5
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 22:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091727;
	bh=QuLhFEvmmpbdFe5TBed4DD8fUH5b/6o6JMrvceQqWs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iHJdESOfGkXUhxi+nej8FX8ZZVq7o3gGEAX9jKFPXoGubpeHyJqqMooG0NG+yeqO0
	 KJTkGkUDnh3MrkPRD2JWUAzHOz6hLip8FKVeA/SxiDtn6RLkYs9mFYygIOSJQWEJDv
	 ahKpcMy92jx8GhxTuoKVy0vsyHToqnZoDkCBYoXyowaJ9KNJfFscbClVLq9SNadxzz
	 YISPSKjQdhbC5c525MeY8zTRB1PHxQiUpIOGtvVPJ7cB2crSiFYXuHnI71acuPTeh6
	 IeC7IVxDxBf1iiMtnvibfpH3azhzoUvB65/uTkfKAa3CA4znN/rvHDaFAo5J3wzOfJ
	 qn7yCHXQ2zCWA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3aca0bf7fd0so437861fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 14:48:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFOwBaCB3krCiBnthAvTDimVM9Fm+x1rAOne8yoMZpDXkBEyHb4SN3res/f+bCgrJs+BPVGK2IhkU9PvCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y1wrbvhuyqd/FJIC2WqhfoFloap+gaFKOQxgcpTlrkYrJvYxM
	0m70b7WYDwNyZMadkyd/Gxl5wviyFbeMhrDrdX+zHPFArWjyv9/ho2nUiwuweUBrS1Y1iZQaVdt
	FN4fp96hoJ1DlABPrADqzylwd0r4SaPI=
X-Received: by 2002:a05:6512:1048:b0:5bf:cabe:23b6 with SMTP id
 2adb3069b0e04-5c003a9c26emr1737966e87.33.1794091726181; Sat, 07 Nov 2026
 14:48:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
In-Reply-To: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 7 Nov 2026 23:48:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=xWDA=JsD+JmX+1i6fs3dRXztUk13mcTvKcnO9Lq7tqg@mail.gmail.com>
X-Gm-Features: AclHuK-twRwCMVL7cQuNhWiRM9_Y2ubKODxjVoSRNRTWzU9h1XAiKR4cV_MVtR8
Message-ID: <CAD++jL=xWDA=JsD+JmX+1i6fs3dRXztUk13mcTvKcnO9Lq7tqg@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: fix potential misconfiguration of hogged lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:37=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In of_gpiochip_get_lflags() the local variable xlate_flags is declared
> without being initialized before its address is passed to
> of_xlate_and_get_gpiod_flags() when processing a devicetree gpio-hog
> child node. If a driver uses an of_xlate() callback that doesn't update
> the flags argument (like gpiochip_fwd_delay_of_xlate()) we'll end up
> passing that uninitialized value to of_convert_gpio_flags(), potentially
> misconfiguring the hogged GPIO.
>
> Initialize xlate_flags to 0.
>
> Cc: stable@vger.kernel.org
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Closes: https://sashiko.dev/#/bug/linux-2bb44847-fd6e-406c-878d-9739da2cb=
8b5
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Right! Good catch from Sashiko there.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
