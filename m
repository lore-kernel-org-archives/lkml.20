Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824018;
	b=cuV9yHJWDgvKYoIbePDGGPheSj9MLl+LjfM9UuPBw+7aWklIbCARs2qiHuo2QLx0jDRO
	 WluO3mXTYGl9KvuTVW0jGt2HfL/todReKUa/ZnYxno567Vj0eT3yLz37aQLrUCJVKh0xP
	 WzIn4VVlq/CO/UUeIqis7TQccY2PtFgS7G91x1yAIQxNZCCYdb0Bc3k6tJqH5s5vF8BLu
	 OdtpUqFPyxDqBbUZOXn09pA3dtkuwuk7cLrrhhBDdisXVu71RRMiJC5bZGr7W7TzNXZX6
	 J9Vkpunj84xxD9lgbP4JXsjqAczO5sJLF16CzkIYDQwgIeWlwnHE8w8u2JV9la4parw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824018;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dvvN8xAjOZj2qJ3T0RWutZTar0lZaTKJFlwYsylUpC0=;
	b=ReXddFgAo7ipFqxGnroB6N2yTcNFhkxiwhHewAqgVQKwyx9MdlNZvsrRj0g4EHixOVrA
	 WYOQ7ZeV+SGPerYTQjhPm7WMMCH9ZyBt0nFkc3bFq0H/sgIHHFy8KgzLtTAmw7Opsp1JQ
	 tV95vMFX6QOacizOHnDp5wY8RBpKX2qX4nW2AbJVaCd9IbbqbGncCQRzaAwFVjsd7TyyG
	 MPXgKk7mA5qfbTpWUhcHUv4T8Tfl2pPwZAJbn+IxmXLJTSV3ZJKhk5Ybdg5nGnHogtoKM
	 lgb6+KK1Z1RUQTxRreuzLjktP/R2kYIzebmKUU2s+Vngv5HxtL0pM2Oxz2yJWiCDSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHwg3Zwx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFB7606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHwg3Zwx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865221F000C7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824018;
	bh=dvvN8xAjOZj2qJ3T0RWutZTar0lZaTKJFlwYsylUpC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LHwg3ZwxbN02r6fIxteD1RvNA6Y9pOXEzqlzC3sUB8AKvy7RcUsl3uIzeTc/fD063
	 2P+KJVBQFEj+Uv2PFLCu04PqFi6/Q6oMHpn05+JBvjbV32bART7CHGqJnaX2tm+nBV
	 SPoqccwRAJ3Z2+3cAPz/RXYoENpQ7U103MANOoTLswJKtdn33JceG58bN0ha4Jjlvj
	 8VOYndx5KQnTeZdRcJkXfBjroGNaMQ/hrI7AidEfOFnFLtxApePDuAnfmVp+0Vr9mm
	 zupozQ/X0NirjLDtd+2jC9D56BkEqWPZxMdP0YkDpG0Fnl2SWSvuRjAomX3EHKVUI0
	 QCal6pu/6SgCg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso33051951fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:13:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFrNu1z5F9zZXkfdI74MHan7jwbjTPBXWD7dpxr8CltNam2LemQ3sIaM4xYySPfJ2UW0EDJYlmQP6fz2r8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KQU0IRzEiESoTNE/j0kvKuxNy4zem7XLtNI2AkI+klMz//Ltb
	P5WD1rJaHOYwK/otHUNe5uZszJsQ6JzuJ5Ysmu78TWGGEPx1VFRiE04XbuudSomwIywoIOSHaFh
	djhpJhd8YL9sHEMDC+DirGM6xivq9WvY=
X-Received: by 2002:a05:6512:224e:b0:5bf:d000:bca3 with SMTP id
 2adb3069b0e04-5c170b20ec4mr3464665e87.49.1794824017275; Mon, 16 Nov 2026
 02:13:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116014823.3132576-1-jic23@kernel.org> <20261116014823.3132576-14-jic23@kernel.org>
In-Reply-To: <20261116014823.3132576-14-jic23@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:13:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLmz=30ptZ12qZwP6_-3Xbv3nta_VBg1Zb1QA9an3bOfwA@mail.gmail.com>
X-Gm-Features: Aa3M54oi56LPPit1kNG3TyrHHkUySoftJp80E4lui0_LsVjTYMRYknwsXP58xFU
Message-ID: <CAD++jLmz=30ptZ12qZwP6_-3Xbv3nta_VBg1Zb1QA9an3bOfwA@mail.gmail.com>
Subject: Re: [PATCH 13/35] iio: accel: bma220: use default_trigger
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Gustavo Silva <gustavograzs@gmail.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, 
	Ramona Alexandra Nechita <ramona.nechita@analog.com>, Tomislav Denis <tomislav.denis@avl.com>, 
	Jorge Marques <jorge.marques@analog.com>, Petre Rodan <petre.rodan@subdimension.ro>, 
	Dan Robertson <dan@dlrobertson.com>, Jianping Shen <Jianping.Shen@de.bosch.com>, 
	Gwendal Grignou <gwendal@chromium.org>, Maxwell Doose <maxwell@maxwelld.cc>, 
	Tomasz Duszynski <tduszyns@gmail.com>, Esben Haabendal <esben@geanix.com>, 
	Narcisa Ana Maria Vasile <narcisaanamaria12@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Vasileios Amoiridis <vassilisamir@gmail.com>, Abhash Jha <abhashkumarjha123@gmail.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Nishant Malpani <nish.malpani25@gmail.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 2:50=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:

> From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>
> Set indio_dev->default_trigger rather than taking a reference to the
> trigger in probe(). The IIO core now takes the reference during
> iio_device_register(), so it is not leaked if probe() fails after
> the trigger is set up.  Whilst this patch closes the specific
> bug, it also makes the ordering less fragile going forwards.
>
> Fixes: b7e17ca10793 ("iio: accel: bma220: add interrupt trigger")
> Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
