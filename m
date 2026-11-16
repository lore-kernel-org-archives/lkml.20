Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823969;
	b=OF/+DPMbU5hiB0cGgTursmIPBr5haSec9Zhnm46E4Ne0EP/W190cL6wj1OLwvPoNvMZw
	 W8CnGIyjLxuzweYcPY4qPikik9kmn34i0iByc1OtpUPSNAMRqgshgeZ5Ys1KhqnfHNqf3
	 QFZpGn8p8c1sRRvcUwzhOdIpECalpkO6axLXESwTxoucwJsAexts3W9tB5B6dKN+3RG8L
	 lyhyCdGa4fFcidnslOuc+3mF5x2rL58RUfMBMP4rC8Eacy3puRiuvXL5iQ4euUDa82rZt
	 ACpk0SiqqPLSOTNcCCzqlzfQ6qg/r7D6rJCpuPTgq8ae9rorehwHjmD/btkWnzZmMcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823969;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IwTaEG8wRBKoK9MhpvFuHAkc/QJiMSw/2nRUmjR+2Dk=;
	b=GanJnabicyBHsTOH+cy2nTJNpK64Z93WSny+xfocfnTWOXNMMUmIrk6hz+htW4FLZ7mN
	 oe0qvhi2AJlgGc5hBF59hj6+a5QFmuWcISPEqBGrtRL+q4iTqa0pz+uQ5HDckxjHFmDBM
	 IBca7lR+Kg658xx8rHtewGNzS/+JEmuImSHpLNiRZuQnqw40wRMmrXHd1BrqTa3a4q4wk
	 K1qfBAY/Qch7YUtgvaNxet3EAamx6hA5MzueqpcI+ebqss2Nizsl6nIDu+rUW53WvLCHX
	 L6R2Nuz14Tsremd4ya6vm5l0bRVeZU+hMGH6US9VzCFNDaKSAnIohh3UleDJtNkCf6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiwUfSzP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A753606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KiwUfSzP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567D11F000CB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823969;
	bh=IwTaEG8wRBKoK9MhpvFuHAkc/QJiMSw/2nRUmjR+2Dk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KiwUfSzPoIIzbkUvQDncL5MEXQebfjbfLOqPkXCHBk7rzG4Nc9Ro9ADE2c+bo1BIJ
	 mw0oaG0vTxzXljvZ8lC15T37PB9udSWS1Z85CO2WjF1SSPIGeJLk/X9CzdQX5UHPw9
	 nS+tZgb38kg4E3eIx36Pj4fOigrZTcUIw0lum3Ruk25xaWnZI6moXYrVnOM8WnTPvl
	 Zo1Finr8R1aLmlGu4ldqINfQ/+WwgS5yKKX8Jz8Ibni19VbumG1qzf45ATEOr+V5qW
	 wleHd1RaAUcbFL/iUnty22f+mONfhou9GPrR57qmbAwG21occ7fp588DDNxOZU/IvC
	 QD+ZaIeKdXypQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso2874458e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:12:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEeNM3uVUxrQpv6REpmK3OZ/K6TIlh8o3n828P5IM4+OSIq2moejnp6pDihe45U3HalIDEvg74Aq6I6J3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pxLnhCWO9Cly/n3bgJxxdBE2xTOpP7A53oD1JOwUXJ52N2Ze6
	DkDc5kuELj+OMs6K8o4tQmzXTA12BYZPwIOBvgHuIgZgTsP5jXPjIqsva385HU58J9iH+nV6tPi
	xgeSHUzuoSoJ7XdRO8aBgeNz1TwQWFsw=
X-Received: by 2002:a05:6512:65c9:20b0:5c1:7c6a:ff03 with SMTP id
 2adb3069b0e04-5c17c6b044dmr1458650e87.29.1794823967992; Mon, 16 Nov 2026
 02:12:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116014823.3132576-1-jic23@kernel.org> <20261116014823.3132576-24-jic23@kernel.org>
In-Reply-To: <20261116014823.3132576-24-jic23@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:12:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkEDfGi3qRWW=3nVOj9jG8DfDYb4=oEu=c2S1WwVY=rvw@mail.gmail.com>
X-Gm-Features: Aa3M54pln9fm0V4dyCaKo4rrIvsBJ2lI-ed5cb5Y4DejM-X2frgFrQOHhJ3kCm0
Message-ID: <CAD++jLkEDfGi3qRWW=3nVOj9jG8DfDYb4=oEu=c2S1WwVY=rvw@mail.gmail.com>
Subject: Re: [PATCH 23/35] iio: common: st_sensors: use default_trigger
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
> trigger in st_sensors_allocate_trigger(). The IIO core now takes the
> reference during iio_device_register(), so it is not leaked if probe()
> fails after the trigger is set up.
>
> All users (st_accel, st_gyro, st_magn and st_pressure) allocate the
> triggered buffer and trigger before calling devm_iio_device_register()
> and do not access indio_dev->trig before that point. The interrupt
> handlers are passed the trigger directly.
>
> The ordering is such in here that their is no leak today, but in general
> this change will make things less fragile going forwards.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
