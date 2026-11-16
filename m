Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824004;
	b=gVrhsldMP5QFrTZjtwF5VOq6UYImWGGzRKWTZpQXscbGk3XmB/Rshx7+Vu2rW8sAFqc9
	 VV/2CnO+lztvPu09A05zyMFTgesqSKC1ehydY1hWEsh3IVV8iBPcycm+0dVvKDZnii5AH
	 utlc2qCiUb4eALYBfvPeyLEKuyTodE+SGOuTNKtRPFGRwxLpr4qPyVH40LlYkFfISLchQ
	 V2PneLuReW32rthGhUzHW0CfvdUoyYIm7SKuDVmo7uOTcbQ4MhDZ3c3VXdGZ342kZJWX9
	 95sbqCE06Y6IB18LMQNVE4ty7lmsid76iasfkjeQ8j8yCc+PtZtijBZoWXbL8NQ891Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824004;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SJqlZUMi4mTvpiqmlF5foK7DBZyPnlP1pzywr9ZuMTU=;
	b=xuxEAhX+PrJHMwt2Mem8zVHIl5jcJWBTMBG9u9/RWGp+PLg4pwLCusvGgZgES/i1760V
	 Uyte2gvEIFlW9XWmmptW4u+d5BOCuJPg5XHiPvxWyOvhIrYAS8aih0AwswBTZjHTwnVEV
	 MVJdiVgftuCqZrhW8r9SUc69ydTrgcS4KI3Ldv3/pVVJVI+8NoZ9X5vZOurWp9FPne2s1
	 Z2Yn+OKiwaMdJgw6VDTu0TIahjtHuw4manrELH7SCxNyEjNv2caVb6YQgL2iNk/EaS0DB
	 NsF7TC9wlqg3KPO3cR/Q3xdQGhLTaOFWJxm9IPCiP6PFF05mvHM8/fIO9ILV3MtaglQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bP/Oyt3X";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20884606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bP/Oyt3X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E561F000C9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824003;
	bh=SJqlZUMi4mTvpiqmlF5foK7DBZyPnlP1pzywr9ZuMTU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bP/Oyt3XHLVeklt0TtxLW/1T/CtdWqVfDIheAJGtIOgCNZ4Z5E0SDM3J5HSkkfptU
	 8zRsUnYLmIWqS50luVwgx0o4A8g1wlzGbTFqbpr/nDFnnR9Mf/dIKW4YE6QWQqxV5b
	 JbptnxtmhvXGZUstSGXghGREaNJzWEiYslR03RU3wr8uBZLnE6vagiR74o5KCG/Jel
	 0/cI8X8ivU7o0zbpOSDZsQJTgIm3k1GrJ1fLLHtLuXb2NKEzuxbxXfin6I2zLb0M6u
	 RT5LlkGL2K/fxojnLV93WBvBZmlwQc4hPfYx18kqXw4b+hYAccqmliO2AZy8aOa8HF
	 UKuWoIxXIP0IA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so3267348e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:13:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEwK3Q9RtwbM64pU7S/HS94WrHgfIg5T0uH9szVyLXfnLwJSEdNaXRlyJoij0YIWf0PPNjScKKol+/Kme4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bb459RFdobDCLlHt1WvBHpHIQeLfMqViqiZgXoNJflF55ux+O
	X9topUrFlKFSqzdB/BC9PyHtPPRy6hoAJ4LX5hWj2G85rXeLQLy0t6H8VztstDjfWkSNLvj7Zdc
	TiL0tx9yZg3u0Rt4GYHOMSBMIniIm8lM=
X-Received: by 2002:a05:6512:b1b:b0:5bf:b7d2:c7d3 with SMTP id
 2adb3069b0e04-5c170b51016mr2856791e87.39.1794824002564; Mon, 16 Nov 2026
 02:13:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116014823.3132576-1-jic23@kernel.org> <20261116014823.3132576-15-jic23@kernel.org>
In-Reply-To: <20261116014823.3132576-15-jic23@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:13:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLnowMOL8ocZwYJe+ZhVFWFA0RGHVcx7AQJRYz5okdpjJQ@mail.gmail.com>
X-Gm-Features: Aa3M54olxlOrJTw4ezYb1O0T-yaijVkbM6ru0n9yjK_DqXWDbLCO-yBDZivhOMg
Message-ID: <CAD++jLnowMOL8ocZwYJe+ZhVFWFA0RGHVcx7AQJRYz5okdpjJQ@mail.gmail.com>
Subject: Re: [PATCH 14/35] iio: accel: bma400: use default_trigger
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
> the trigger is set up. Whilst this closes a potential leak, it
> also makes the ordering going forwards a lot less fragile.
>
> Fixes: ffe0ab6a9698 ("iio: accel: bma400: Add triggered buffer support")
> Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
