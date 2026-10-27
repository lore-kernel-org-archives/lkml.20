Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119960;
	b=GxpRu2JltmZ7211qd1JZGHHAEx/4DB/GmfwkXpqc1VOea0btiLKCciaHz58IlIXR8/oj
	 /l6G9UFewmPqacUzd/WztJN9ctQHl3ns8cISNoWiYYuz1D/rykRl+/zll/7hIUy168wfI
	 Zucq1xo4kjA5qznZApRGh1yBt+PzIqarGLFxEc0m0dYTEi6PEgmk8dvjQXs025yjtTAFw
	 w3Lqfg3izAHCDpviMEHEobieRaYNDBCYJWu83yIbhBTopQHZ7U+yEt3XLtCscWAXZYCwb
	 7UUNb0p5dh5EDlwas86nUX0Z+lrt6Oi6z+p6udaGACl7AY2LeW8UsWF/cTH6irIhWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:Cc:To:From:X-Mailer:References:In-Reply-To;
	bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
	b=AM/ED3TEesVvfn7riLzwZ3Cuw7sLUZfxu9Babm9rUfX0lX6/gqTXNCMr6Q5J1psYbwq2
	 lbcavOhOokTnl4oKcOH8yTFlvSMxW8Ubg8SMNtzlJkzLEy3fg1E2KgphIRdpbzuaWgOBG
	 8AOj0TpsbY7IxroJ11OM7PUu416fyr5MZuxdVlBO9DAiEIE9iVFKe7TWWRFdI4krmTnCW
	 fExCFDaY0WlNX9zpkRTqDMm8gQqyy18N6FwzKKSl+RFBvBUYYzm7LeOvFhMloSUaSzr+l
	 +tGiAQ/gK2exRl02NrG7Agar6/NowY5ZOHh2cu+YOTsmCgYhmedVGFahbUzFSAy2s5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcjtgjTX;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2711606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2711606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcjtgjTX
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798d4ab549so91573d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119958; x=1793724758; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=DcjtgjTXtEdgC1bhvRAnyTPZma5OI3VE4GrINbe/kwo65uZfS8pthPj5h9S6qxE13S
         1W3r4+mNCNnWztUjUx8kR85VHvB9QEJcnxYNBBvXygSXWpm5BxopqumeMaCqfZf4sTOw
         GU4/QAcRk5Rne9D/p0QpbBEmO7Ezk7ck0iR/4t83S6IqgJgxynokhs6JXZBoZRaSvL9L
         MM6LpL9+OcsV44QoNIjOndAbdR77JAQm68NRn4865j/Ky/wQ8lNHx5WJkgcWe1a51Glh
         lXpZbphucm6YwvQ3MQbGOvAhhMOrCk5v/WdwpwrrIShf+VWFpjZvHiEIW6LtszDxxtRq
         kjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119958; x=1793724758;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbsd3smpsKE1xqx27K/D3zo9SvefwIOkhzZEOizfuio=;
        b=LdCbHTBfGvxorf35pnGpVVNRUeQcZ8468JQS1GUKCZsKxhtZ6SgJwAFWZaTyhoKfJ5
         l0sgIOnFaJqElmm10xWVp0UY8koxF1yUoI/zmqct+Nsg1pdtd/mexXAlnaCYv//3eJ0p
         2zngipxkh5eS1xOWEENOSEMpLUAK5C7Ol2Tq7rV6/b4nPqnzQwBTcI9VMZS8f/Od+CUP
         AjZY7IV1ppw54YQOipiw6W0GSPsulFlMHcFjasnSySQwI2qIjBlwHvG1GZz29/Y6WVmn
         mYFgabtV9/odjZD31htvQtiwfL8ayeyUISQm//BMVZya1zXeDUKuo70Xaoaeowxqb6d9
         DSqA==
X-Forwarded-Encrypted: i=1; AKwUvBwUOrE632stnVNwfzAVImeWtjxWPqrqZqcGUh2w9XITyq3NFjlBV4+MJFmy2JkUBUanBq7MrdWsy+yxfLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAsxz6UWnU/cQFh8V6SM5nkL59pEqaQJw1+Fy+N9ANbgKFqbcN
	Y7ZflpxGSpggnHRZ7k+BycgYVTfo91IYH5zyx6bEVIYbB3KROjG2rqoK
X-Gm-Gg: AYBFou2smhK6BMP3nSzQxAXHHGduzFzjLpA8/gSM0TXdWNCXbAMUP/K81aE/kdbDvBY
	ayzxRVxQy+nTLCocAS5OhafAyYkF4O/CeqeQD2ZH85SOmURjV0GWn3mfFdOwkXB5Ifa5KcfnpCC
	1USE1ADLb0YXeEzP9b+4MuK9XsvxxT+Jgl+TN6196WAoHPJNZ315krGsnMBgx/XpsHKIYnoxbrP
	V61F0bZuHpl8zQYbgDsumHW2dHiUh6/2XIi83wrT39FJMokynoelPcS7p3o2vGRuxDjROzLiueI
	TDUtzKGly32mcU9opdXdemf1OrWOXRabuGGdzvRzPbiEWck0GaBcm7cUdpc1lnioO2DmVg5C+c+
	51tVTLP+DE8kQMReOuVgaaZZYUdP+slNCz2aBUrNkvo9Zjw3pH1Wd0z2p069Q9qD+vc1nqxOvlQ
	uWwwmxKx3QdsxjlnMPav3mLK8+DedoZQZrwIEdrYSVCzIVyAv4X5MRLTiZRI962oK+iGSKcCI/j
	hPPfJ9Tl8xiZSZt2b6SodphjfqRLKRIAVz+LQZKownsd8UBfrskMH85zX8AsDaxxiYkQF6LztBg
	EdWLsZehIT6rf0gYgIyynTTjuro/Ru1W0I90tLglmaXzTb7+FbRmG2mnVR/cWGwvuXliqdHtSo2
	QsOBro9XTobUY
X-Received: by 2002:a53:e7d0:0:b0:677:c8af:d149 with SMTP id 956f58d0204a3-67a7bd1804fmr61705d50.74.1793119958354;
        Tue, 27 Oct 2026 09:52:38 -0700 (PDT)
Received: from localhost (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a080d4csm425545d50.4.2026.10.27.09.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:52:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 11:52:34 -0500
Message-Id: <DMFRZ3B3A6CH.P7SKUZSQR23T@gmail.com>
Subject: Re: [PATCH v4 8/9] iio: light: veml6031x00: annotate the event
 enable helpers
Cc: <chrome-platform@lists.linux.dev>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Marco Elver"
 <elver@google.com>, "Bart Van Assche" <bvanassche@acm.org>
To: "Rupesh Majhi" <zoone.rupert@gmail.com>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Andy Shevchenko" <andy@kernel.org>, "Benson
 Leung" <bleung@chromium.org>, "David Lechner" <dlechner@baylibre.com>,
 "Guenter Roeck" <groeck@chromium.org>, "Jagath Jog J"
 <jagathjog1996@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jean-Baptiste Maneyrol"
 <jean-baptiste.maneyrol@tdk.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Jinseob Kim" <kimjinseob88@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Kevin Hilman" <khilman@baylibre.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Remi Buisson"
 <remi.buisson@tdk.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-9-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-9-zoone.rupert@gmail.com>

On Tue Oct 27, 2026 at 7:49 AM EST, Rupesh Majhi wrote:
> veml6031x00_event_enable() and veml6031x00_event_disable() call
> veml6031x00_set_interrupt(), which needs irq_lock held. Their only
> caller holds it, so mark both __must_hold(&data->irq_lock).
>
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
> ---
> Cc: Marco Elver <elver@google.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
>
>  drivers/iio/light/veml6031x00.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index f6308498e422..476ac3717f8e 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c
> @@ -784,6 +784,7 @@ static int veml6031x00_read_event_config(struct iio_d=
ev *iio,
>  }
>
>  static int veml6031x00_event_enable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;
> @@ -804,6 +805,7 @@ static int veml6031x00_event_enable(struct veml6031x0=
0_data *data)
>  }
>
>  static int veml6031x00_event_disable(struct veml6031x00_data *data)
> +	__must_hold(&data->irq_lock)
>  {
>  	struct device *dev =3D regmap_get_device(data->regmap);
>  	int ret;

Thanks!

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
