Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868591;
	b=4w3zi8IuEyh2IWdn0/o2bICfLd/M+XRRgGyfGcfVrGIb5WMUxXNr2e02c2+P7Lp7jwdh
	 /7gzPgnjfV7i430R1917P3LanHLWUrPOtCYwbp/3qZevx3Z/UlJgL094abHjDZh/GCDEH
	 fOj/FDkJ9KoSplJHZ0g8jTmdQ6bXy4heMEI9IKy4HR9RtSIHga8YV1h6QDU/t/qW/5jp1
	 TpfMYtHUhbtG3WSb6mKM3DaZg0LWh1f3YLsAwR4MYNFfLovEXXikPe/eYHZ/puGlrz84o
	 08X5WlsLaPtTxMvBsv7KVk8y8KwXCj5KplJF9lVYvMiMbSQ2r7Gls0yOHFuFhg8xing==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868591;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iXIfKUGJGkEnqn9QRpsp+DcwEv6yTAPnOh0Ju3Orv/4=;
	b=eNbm/KWkpfllyuU6/R9GQ9AfuLtdh+jKn4EBsU4fuASCBoeQa4olBdLyPfEroIXMpjfp
	 B2uMSO5ssDFzwxk4wBfB9adVKFkI9wxOCG7twaBGSBBXKH6RHsK17NU7QBe8f+Ffyxlqe
	 O3p6sxWwPNS6Rbm0rzZEc4PeSZRJEAgkKmDAXqQB1z5g14/W+wGF9pqfzSwydpTuxjS+z
	 B3WaRN/5En/CzA1Ct/DIGE4PJMVW1slICliqaFe2V9eR9dlhDCxqM/qsiBPucBEEXX8tC
	 VKeJvXzKQ0Lr6DfGvswZ2WEJzoIKZguRgLb81masN7slWky8yePW5DhALb7wjCjsLrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReL2UJWm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3989606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ReL2UJWm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602481F00A18
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868591;
	bh=iXIfKUGJGkEnqn9QRpsp+DcwEv6yTAPnOh0Ju3Orv/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ReL2UJWmNZ5TxcrGIpbnhGyNp15nEgfXjZNsOeS5W6sHxs5USw7+ZVbdKsZy09F1z
	 pRSB/TuMSFPtsXMNDG1SsTLvPYkJZ0TsGP4FO5x1zVQgyB2mNOZu7nHyRKg0r2l9TI
	 tWfYU/iKpxdFgbSDSfiBjvDXCoGYUKXe3cLUsYxx61v/U6cVmrY6/2l4dA2FZIfWZA
	 0sjsdkJ/VvgkEU84ZRXCtJkq2gbT7exadCn5Pv9/lT9A3S8Hxv+7GKSMPeOLtyqz+z
	 uJWk4bJnyJP7sadqT0trgPRv3UduGH/blDEYxmEGmQwQ9nqXW/rBCNws/cuGIrKTyi
	 7URlnRPbQGTVQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1283323e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:49:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxJ3S8S+EK/9rAyztdkocJNdzufl5/p5fu0rzN83385OyCDzLV9G7cXMbZxf/pfSQdgCetw4JuShMkb0dc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Va+sImKqdWSCAGJ/JwJhtLarYFdblhwd+oDIA5a65DmoWjMQb
	S870tYFchzPBPCeRh36BUQjrol/2mFU5z7YiDGzNNDaKKnkZNaRxTePDF6ZEQIcquUZs3mALqhz
	W3cSPc4Ii9z2OqztkfiuE3u/AZPI36Bo=
X-Received: by 2002:a05:6512:688b:20b0:5bf:e4e6:7f78 with SMTP id
 2adb3069b0e04-5bfe4e68c03mr2745563e87.39.1793868590127; Thu, 05 Nov 2026
 00:49:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103104242.1373883-1-vulab@iscas.ac.cn>
In-Reply-To: <20261103104242.1373883-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:49:38 +0100
X-Gmail-Original-Message-ID: <CAD++jL=YuYS85WFBv-dHJLqMW1VMgoTo3YSnDU8Yqg1Tp3Vd=g@mail.gmail.com>
X-Gm-Features: AclHuK-DqpeWMThWze48WguFPTy5w3muiNn0JsxnoY0aN27dGfjAgVQWa0g9Prk
Message-ID: <CAD++jL=YuYS85WFBv-dHJLqMW1VMgoTo3YSnDU8Yqg1Tp3Vd=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: release the NS2 pinmux controller on detach
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wentao,

On Tue, Nov 3, 2026 at 11:42=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> ns2_pinmux_probe() registers the pin controller with pinctrl_register()
> and stores the returned pinctrl_dev in the driver data, but the driver
> has no remove callback and never calls pinctrl_unregister().  The
> controller is therefore never unregistered and its memory is leaked
> when the platform device is unbound.
>
> Use devm_pinctrl_register() instead so that the controller is released
> automatically when the device is detached.
>
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadco=
m NS2 SoC")
> Cc: stable@vger.kernel.org

??????

What is regressing due to this?

Don't add stable-tags like you add sugar to cereals.

Yours,
Linus Walleij
