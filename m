Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797751;
	b=2Gi99NnR0s1juEW0tylhqLNelCs0pAb/QTX2yZpAbXt2riUFnIftr8WpUQfmMVc0PIeb
	 fO6T+83IZpSYhzzaMhAVrWurUzhzO8HwWdo8t+0dZ4KDhOy51EBfzS6qrLV/Pf6ydeDPM
	 1M6eyVeos0ssoYclcwDsW6Zz+JjlYIPI5wUC94TRn3ltIwT9qty2JpWF31GKDHNy6c3gU
	 yrgLsTVI5bSh5YMDB5UuUqzIYGHLqu56W6fSHsHqsRur1p7J8P3P8PJy7vZ+0ZjwLR0uR
	 xAUCQZ5jd7SssYPtdegBtdxgy6wRjKSqlz3Q63HCNCpUBnXuAj5SBAfHhOXPXo6IvQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797751;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KjlAVVcWVXveHyufxrdkFc2AO6BhIKGaynfiRZ/UGJQ=;
	b=KMKEkEkYdToZ8bKMBM8h9OpfPENTTRdUQiel1A3PAFT6vx2WLdh0VOUG9/c/rsqmqJO2
	 5qgp0OPuhV3m5H166mN1mJcPpjS9Qvb7yomPXkM16ayFz+3ndAYZ9Jad9SgPrH/1gehFr
	 wRtMUoYkav6SMOiPTrGeLRpVG+EYqQU7fZBTcnZCBm7uIkqHhW0U9D7kdAPF81imPu6EQ
	 XqRXTUd2RnIxVmrHWkXCRBAJAyjf18dvrTHiNhW3cJKqNv7KainshKZLoqqxQhRc3ft2q
	 g6stQ4g7mqFD8zfWeMWZn9gLRw/JrAlQW/M9r29qVDEqenctEhLX3wQyY6PtgbLagWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMk+zH8X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E96606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMk+zH8X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0D21F00A02
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797750;
	bh=KjlAVVcWVXveHyufxrdkFc2AO6BhIKGaynfiRZ/UGJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bMk+zH8X9lrTe9Lk0kkJCalLnjYXgFO4txPw2WRe8b4MimifYg/3zHorYP8wNhI1c
	 rhpo/OAjEWgZF5REJUWQd3S109MCNDHXZQoVMGYefr8Oj4Dn8xExYwxj0gcThQQ7t8
	 E5zSj0E6nCvjU0de7VQ+bvPP4446iL0+6Tkh+75ehsG12EAWVfy2b+63xC32o9dpI/
	 uSIL0ZIqjrq695z1NMHgpkATE/QhI9su0Y/eEBqu0p4w7GKPlr9tjRFyCN5UPWuZ/0
	 ti9JvCF5hhdQN4NdW/7CAnJpjW1RE+iCDuVbO+uxRrHxBEBHMqdaXGgg5oNcGRsz8C
	 jBAcd4zHRDnGg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso446886e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx77m9YSeau79O990eDUWWEp7mueB+AIDMwsrKVbCf+r+btEvEgW0Gnubbqej7mI1Wo5vzGhWAk9TKmq/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oMk+Hbmj8k+ZKQiJXpxJ9Q4iu3GqQjL+bVmUTcntz4cXjPy2E
	h8Ng7eYcsNYhyanRCl3rkmLbx4jnh0EzHzlwnigB3lgOGNYyPzMBbR2oTWc021dMVZb+Nfwc9k1
	5XNUK8Hf2maJe8NGF6OEaoFeEJrohVjQ=
X-Received: by 2002:a05:6512:3c8d:b0:5b6:4b2:15e7 with SMTP id
 2adb3069b0e04-5bfd9569c3bmr5219158e87.31.1793797749625; Wed, 04 Nov 2026
 05:09:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com> <20261021190212.2237804-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20261021190212.2237804-3-dmitry.torokhov@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:08:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLk3E7YdcQQM5zFudnDxE+V2kVdKEwsn2YFYU-r2d7YKdg@mail.gmail.com>
X-Gm-Features: AclHuK-1q51saYU825F_YbdzVVQM0ey8zXoq5p643pVHMAlCnbWlwh_WWTlFa5w
Message-ID: <CAD++jLk3E7YdcQQM5zFudnDxE+V2kVdKEwsn2YFYU-r2d7YKdg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpiolib: add support for scope-based management of
 GPIO descriptors
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Add DEFINE_FREE() definitions for gpiod_put and gpiod_put_array to
> allow using __free(gpiod_put) and __free(gpiod_put_array) for automatic,
> scope-based cleanup of individual GPIO descriptors and descriptor
> arrays. Place these definitions after the CONFIG_GPIOLIB check so that
> they are available regardless of whether CONFIG_GPIOLIB is enabled.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
