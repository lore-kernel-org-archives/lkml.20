Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026024A9D6B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551763; cv=none; b=ByDwCs7qvZUBNBZLb4H3cRJb2HuSXVJzy8nF7LpMqW4R6ZHXSjuTnmG3xMyUN5K4T2LVuBZ/oVJLnelvRSmBzrevVK9XIQKpl8SuocgTwHFKS7+LYjFo/uS2GGs5MRLG/cY7e9Fs47SN2Eu7WwITCbd0OBchSzezZyDsS43klhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551763; c=relaxed/simple;
	bh=cqFwpLQ8DQqnuEuDbC3MvqV/smDD3aMRxr/k52wr/tA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9V9XJtXNyEUIPUaMjCS/+aMLoxHFl9X8ag8WrSJzgsjSK4Apuek4mWSwCbvyWJCXI6MVOlRud4lAO7j+Vg9BiJli5pVs+ptZsE779+dhsHnUProp/e0V7F6faiVBir9iBplMQZ4D4DpiAUebFIHvGjDTxqlXBxoWspp5U+sKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7eU4G/q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7eU4G/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F8E1F000FF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551757;
	bh=cqFwpLQ8DQqnuEuDbC3MvqV/smDD3aMRxr/k52wr/tA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=V7eU4G/qrJYsraslV6xwAcefnxEd00KhIxhPEEXG0ZuENbAkBucxaFewyR2UTGxa0
	 9ydt/ClWnz185qyQ7fd4yeJrwDinu2SKt7ryBVdt+c0McLlNcCYV1Bkv/sZ28uttnK
	 KZbkvPrNlGdv+B3qYqkMPq9M3rU3YQ1L6yCOELVnQ2TagAwNUVShxFaue6DWqChOoq
	 FDIVvzekshgLL9so84s+ideUO50YTnopKWCytdGygPqghQro1DMSIPsNcEfFaj4Mxv
	 LL6ah6mijWVBZxMoMZxZIE44e65n7I7cL2BDpmSeynGgJ5CJvXKdFZ3CB4cNfE6fP9
	 0py1tNBKuJWoQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b6840edcso6310781fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:42:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx99yUFgDtN3HN/0Lb6skCIXTfNf/qyNhhBj4ZAdRbKtEyAbtDDW6Aeo2vvZFYFcQlga4k/l+r08EOwaBI=@vger.kernel.org
X-Gm-Message-State: AFuF++kRyZCICkLrSloiwZGYMb5NFKiRI/ETcWY1aybRr2+8XW47hMG5
	n7xTLjUHJ56MPjhTu/6fLCVrgKq3wWb1FZmtL8Co2lKlHmrkQW7kz5xfcqhF6PQ9QSHQoMhmwBx
	C/Yk1bZjKX4oUwr8wiyrCHiceqnZ+B0F3T+E4SjOTNA==
X-Received: by 2002:a05:651c:a10f:10b0:3a4:9881:8ded with SMTP id
 38308e7fff4ca-3a5dc9b4b1amr5756261fa.5.1789551755778; Wed, 16 Sep 2026
 02:42:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:34 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:34 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915080501.329424-2-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com> <20260915080501.329424-2-mehmet.fide@gmail.com>
Date: Wed, 16 Sep 2026 05:42:34 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md5hu0ec_vNOy4mK8F4cw7Rz6qONVZ5jRH87JaRbjMLiw@mail.gmail.com>
X-Gm-Features: AcwNN1VnRspipPNfEKlhy5QnZsTJ24KTRx6W07m7ha1B5smjeCWweV0ATyt3qGE
Message-ID: <CAMRc=Md5hu0ec_vNOy4mK8F4cw7Rz6qONVZ5jRH87JaRbjMLiw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] pinctrl: make the CONFIG_PINCTRL=n gpio config
 stubs return -ENOTSUPP
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 10:04:58 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> With CONFIG_PINCTRL=n, pinctrl_gpio_get_config() and
> pinctrl_gpio_set_config() are stubs that return 0. The getter reports
> success without touching the config it was asked to fill, so a caller
> reads the packed parameter it passed in back as if it were the pin's
> state; the setter reports success for a configuration nobody applied.
>
> With CONFIG_PINCTRL=y the same callers already get -ENOTSUPP from
> gpiochip_generic_config() and gpiochip_generic_get_config() for a chip
> without pin ranges, and gpiolib treats that value as "the backend cannot
> do this" and carries on. Return it from the stubs too, so a kernel
> without pinctrl behaves like a chip without pin ranges instead of
> claiming success.
>
> Suggested-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
