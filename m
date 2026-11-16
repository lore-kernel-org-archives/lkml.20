Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870816;
	b=hOqu8FjDTvkrWoGG5xQs1KmTJmb4kHuFh6ovpioEV2ZK0sqbAY/NKecd1Oep2g4yAmeo
	 1+5d1g0WPRsg9YC66RKyHcm9Q8jAWVgWzyNPRnhKbFPRi0lgCkqmLBtk+4MeDYEZyxnaU
	 Ry3gJlOawMekAqeUd17bQ4cgOyPJi+xRK9K2vrUxXSRTRrROe4JrVVQ8BLMrPu0qLwr8Y
	 Q8zpRE8tvLxHsJ0I2OEi5E3scvChdF0Gf3dNErlP6xl9e9NId0sSOY5mEXaXvE8KRrR6f
	 ywlnwbjOxGcPig0QZXdYmcAN4Kr5HqMsaK5Ys/kOYhyDhueaLQxDxvJ57RTXAgOHjiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870816;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OmfvxRXQ0BHi/BQTK/TG5VhiqB2b9cF2okAg5Dh/I2k=;
	b=PDDvqvn5w4xluZCYLhAw9xiKk6+4snM/8CejzVcIRHWtbbIlWeuN3JjaG995dYrZbon3
	 VAdOnlzl02L1jZrEZGk16soLEP6hYhpcKFxXk7/ufgrM1CJ39i2952xvoCKknCzgpGwH+
	 ZoZs3Gad8gX0HGc6PgqjIEM8HpPVnu83y3qUeOQgJ7QngUNJrZEcX88sSRmOX+vkGe10j
	 EuPs3xR1TMGgrNyZCmP9jwZ0u/Ti2QHGgJBahA9DY6MfsolELi1MFfA7THHOmySv9lFB2
	 mHsmawi0PZgZstiTweCuEKLKml0m80Wn48n1cPAnSQ7/WacjE2mU51ZfhuDUcOyQV3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3EmIUPm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC9E606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3EmIUPm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB2A1F000C6
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870815;
	bh=OmfvxRXQ0BHi/BQTK/TG5VhiqB2b9cF2okAg5Dh/I2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b3EmIUPme11fl9s8JuDtxMD+KcpjIu+fDbakRGpSL6GeX1GGeU2ukMB+LW4XK+raf
	 HZcC7LfhrJ7nATCf/iOfAh5R3pfCrXnkBFO4PCLOYwvwYO+fG2SoWZfd6iLB2oxjGs
	 BotySNGSlcFEum2LCXByJBbrrJn4iP/4g6GEKEJgQRG+Kr4t86VV6eWl5Q3X00hDt6
	 t3GRv5YLR0DtVEd2veD3Hmc97xOHqOl4NRRC8Cbhy2pRrnjYh5SfAaQLyj4KqiqYyD
	 OeBMvTE869MPAQ6mEGIfhtt7a5/BLIyys55dkjgF4IgVZ40jnFxt/l0SevdRajHy1S
	 ewll16ylQwK/A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c126f80426so3705530e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:13:35 -0800 (PST)
X-Gm-Message-State: APuU4Z9psYTjj7Y495ZlG7Swkh/HdI7wVa2A7Fn1YR2TRgcvrTksMdFp
	cWjSIlx6pdMpClQc0Oq5u/8Q/Ft01yhma1hVxZphEqNaLfnSTLdbdsNojVMG6foJnpsmF/K0NZS
	cAYw9vtEQYGHZsxvsUbkTLn8S9joR5QI=
X-Received: by 2002:a05:6512:220b:b0:5c1:4a42:fb19 with SMTP id
 2adb3069b0e04-5c17075c320mr4769343e87.16.1794870814365; Mon, 16 Nov 2026
 15:13:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avsf1H1sTOSsGe6C@sirena.org.uk>
In-Reply-To: <avsf1H1sTOSsGe6C@sirena.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 00:13:20 +0100
X-Gmail-Original-Message-ID: <CAD++jL=D-qo9h70QxY0E9Eb_MpUYNVP=RaKqM4hMzU95FmsM8A@mail.gmail.com>
X-Gm-Features: Aa3M54oxe1VCFrM5ItPsNcgXorHb6XWIgHwWrhtrQPXZMDUD97T8sdnmnLqGXyA
Message-ID: <CAD++jL=D-qo9h70QxY0E9Eb_MpUYNVP=RaKqM4hMzU95FmsM8A@mail.gmail.com>
Subject: Re: Fixes tags need work in the pinctrl tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 4:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> In commit
>
>   58a755c16c452 ("pinctrl: bcm: Use pinconf_generic_dt_free_map in bcm283=
5")
>
> Fixes tag
>
>   Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl=
  binding")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'

$  git log -1 --format=3D'Fixes: %h ("%s")' 0de704955ee4
Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic
pinctrl binding")

Is it a single space causing it?

How odd.

OK fixed it up.

There were also two fixes tags for the same commit, strange that *THAT*
didn't set off the script warnings.

Thanks Mark,
Linus
