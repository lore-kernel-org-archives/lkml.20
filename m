Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824059;
	b=NImhEveV2RJLlHsW2n/v1kcwGnbNaZriie8/Kwz3e6MKfqNL2wsnMDX5XqcNyqjfKB8r
	 7llr7+OPM/kfzraS/FF2+kYV56+Q+HoV/E3wIuxN9+nV1lqNZSVh/+vA/V9XpMSs0LdQ6
	 5km5rS7gWnsgkIxqzRwM0erYEwD+VA+4BaxfmSeco92WLvBV0kKEIDtIwUD8rlZmfCiKy
	 WC5hfhi0PPpikcqV/8hBnU+vxtaYJbtSBgqAojc6febasR720QURqqRB8vnRSLBGqZf+A
	 QxIT4fAahQ3/2/wGn93uLCSXQsG5b+2AD9qF03uwWLiOlZIEo8U3sc2uzdP4gdqeXdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824059;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BZzHsumxcgOWtim9VqzUNbgAn5hXsFY8z0Dp1dc6OzQ=;
	b=knW60yAEW3R1cKxVtAs5TvL/s/7lQmrlHZtL7HdU5SU1xesahX44CSkMYeAL3IzTo72w
	 ptjWFddiQsz//R5cPLsitq+dNBaSavJOIABSHlYCLoFhISzE1K+5uh2NZJtTxWF9GB2gQ
	 dEz2hw60vZ4lDTjxkTXSaJwHEDYPv4lX1AT3Ya0vTcWbYBJRT6keWkAInsRDckOuEJzqE
	 Kh0v3y7cYna6zqUPakvH/iKS9kRQbzpbaMU4K6PqKJ1xpSgroxWgQzA0vxsxKZ+DX9D1e
	 BQdngzMBhkG82Bj5amzOZkP8dewY4KdvkfRPpp/oDM+27jY0WaJwpW5qqYz93SqeBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oezlQ5JP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00C6606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oezlQ5JP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794601F00939
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824059;
	bh=BZzHsumxcgOWtim9VqzUNbgAn5hXsFY8z0Dp1dc6OzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oezlQ5JPj4CYiV6ain908larzCb/hez4Awd0ILTk49jaVy/RMRZtx+AaF0cbGt0Dx
	 4wAnOMH+Tb8WjCzjUOoLKo6mxsMg+VdPm2nXDBXfZgJDk7zGoTKXeaqTCxWyy53g+y
	 eYSH02Mjz9rqwg5rqdHPOqUgWRGXPW+d2xmfnofgowFMFXTONIM66CAzOGCJr1h6j3
	 +hiT6Bi5ryi7rUNrRvY1TTa4ETy7eKiU7fUWATcS+PXMWuhGUAMhsAT/ZofEm4LObf
	 2KSa0E/JTgcPP9mPJK2vXt7NDeanTt1NVibXyAMLkz/x9gYtqEP389b8wBbyMg0C2Z
	 i7x3aZ6TKNL7w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acf82fdcdbso33059011fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:14:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE/egig23GFROL08tX365dm72Vg7BR2erZI0PtiPPKFh9MdpYuB/IYk0NBAWAgTlc6iF55weIoB0AMevrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/isuoOPVDpAVR28z2CjZf3d6OJNritBdg3bG88SIHUQbGPnSDE
	kINYsE3G3RFOKfQhEy+OBZHImb/ZLiwaw/9RGqEqMO5jveuvDjP58IoHFu5AmDUkQduPFH5TRsL
	TWyK6BRMaIrclOhSjRrKMhVEztm+tQ64=
X-Received: by 2002:ac2:568d:0:b0:5c1:597d:aa93 with SMTP id
 2adb3069b0e04-5c1709f4d9fmr3837170e87.24.1794824058184; Mon, 16 Nov 2026
 02:14:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116014823.3132576-1-jic23@kernel.org> <20261116014823.3132576-2-jic23@kernel.org>
In-Reply-To: <20261116014823.3132576-2-jic23@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:14:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLka6iViPZetASEx-P1EUM2o+rK7qf6hi5gMV1mowGGArw@mail.gmail.com>
X-Gm-Features: Aa3M54rZ0ybcg4V5aKB01QbjbOok1gJ1DSyW-SPRyEtOWR9BL0YJ1PmZWar8GsY
Message-ID: <CAD++jLka6iViPZetASEx-P1EUM2o+rK7qf6hi5gMV1mowGGArw@mail.gmail.com>
Subject: Re: [PATCH 01/35] iio: core: add default_trigger and take reference
 in iio_device_register()
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

On Mon, Nov 16, 2026 at 2:48=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:

> From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>
> Some drivers choose to set a default trigger in probe() via
> indio_dev->trig =3D iio_trigger_get(trig). The matching iio_trigger_put()
> is in iio_device_unregister_trigger_consumer(), called from
> iio_dev_release() only if indio_dev->modes includes one of the triggered
> modes. If probe() fails after the reference is taken but before
> INDIO_BUFFER_TRIGGERED is set (e.g. by iio_triggered_buffer_setup()),
> the reference is leaked. In devm managed flows there is no simple way
> for the driver to drop the reference on error.  Whilst it is possible
> to have enforce strict registration order so that the reference is
> only taken once conditions for tear down are met, the requirements are
> not intuitive. So move the point of reference acquire later in sequence
> to a point where cleanup will always happen.
>
> Add struct iio_dev::default_trigger. Drivers then set this without taking
> a reference. The reference is instead taken in
> iio_device_register_trigger_consumer(), which pairs with the existing put
> under the same modes check, so they always balance.
>
> Also check the return value of iio_device_register_trigger_consumer(),
> add an error_unreg_trigger_consumer unwind path for failures that occur
> later in registration, and clear indio_dev->trig after the put so the
> subsequent call from iio_dev_release() does not drop it again.
>
> Immutable triggers are a little more complex and left for a follow
> on patch.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

I like the concept and reasoning here, and code looks good so a clear:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
