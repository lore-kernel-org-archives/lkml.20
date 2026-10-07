Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EEE455600
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373382; cv=none; b=tffrMEDG2FJSfYjXdkSt9L2GkIV1DPl1w+63bqD6aaw8083xTlMkTlGP51xYLCiMXA9AQWkmmoaMfEHmCbVwWog1g6lDS6Rpx5fjZrfCptzvAMg7U5lmUEKWoHzISO5eaiACb+uae0J54D9/tFKxBlY+olgFXgcixZawq5cmLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373382; c=relaxed/simple;
	bh=r4gea6dVaV+pJlHZZUkUTN78DK4gqSCobp9kI7mnfs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDxwodqaEmUsxQX9ta0hk+mvGV3aGUw6uBgLyX5cDyeIgDk88mDc53UtHZfJ3BsTqou2nnk3glN6vk6S82b+OppWc0IK2G73sgkD/FCK7qLUxrpvBhyBa9SHHAeronWVUrFxcJhXxLRjwxB5sTSVzPVDI6uvtUFKaeZ1b1+7Ezw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZLQH/OE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZLQH/OE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674E21F008A3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373353;
	bh=r4gea6dVaV+pJlHZZUkUTN78DK4gqSCobp9kI7mnfs4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SZLQH/OEJH98cZ/qo6xG6O6X1fUZJTqQDFPyi/kxmSOHy+9Jz8pXY9ldGyGlMwR+Y
	 dIh+PvylgLo+zp1Zm7yS7NwD3BY0S6spMTSs3Yv+25rSdl3/H8caYzwjndXbENTbR4
	 89CFYpfN82627PT+CJctBv+bBhRghWnCO7v4z1LNfNOz805GByJi0qsvz6lNlZqL31
	 RER49kLVV2mavo4+6BjXh/Fl6Se1ziUn4cC0NYuUavC3Xac9g0fMvoghHUZ61gO2lc
	 rX3MdGICW9BiZFAgrr7ZUanvylF3tBTVv4+WB/MMYohVSwEulxMnh7/bp8USbloCpV
	 QYPFYHCArZc/Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a808f09021so28878841fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:42:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKtWDswkYLBoJjXSUzj+/fHvJKVzIS448t2HayhVRtSyNSV4mE/tTp4WDxUa/U/1qtG+Zip45P8oCQ7dA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUUurpnKe26rG5nCmG3O8kda7sbjFXj704LcvNupIrs0EPjmiO
	cEvTPDTmxZYGB56XRYTG3pF+kmOtiE/KQgLd4bOXAEHUW+URCo9uck04uV3xAWZi7aCt+tywRDw
	UqqUU3xgwoQDJqUxgiZFhVZSUBl6Do0o=
X-Received: by 2002:a05:651c:1602:b0:3a6:6f3d:c804 with SMTP id
 38308e7fff4ca-3a9a2cc0600mr4595861fa.19.1791373352182; Wed, 07 Oct 2026
 04:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-9-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-9-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:42:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=PFhz-99kM+0K-g+xNGbcwds6oEUa2owRS__rzZoz52g@mail.gmail.com>
X-Gm-Features: AclHuK-sWswIxgClINF2jGtjRrgaftdNbg9RcmXzfCzhKd4iDM_Uo4JDtA63Z6k
Message-ID: <CAD++jL=PFhz-99kM+0K-g+xNGbcwds6oEUa2owRS__rzZoz52g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 09/10] ARM: multi_v7_defconfig: Enable Cortina
 Systems CS75xx support
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 8:17=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Enable the Cortina Systems CS75xx platform and its UART driver with
> console support, as used on the Securifi Almond+ router.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
