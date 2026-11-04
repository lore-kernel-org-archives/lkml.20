Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799936;
	b=Ezs8nVxGH0ofEE2t46FTOONb3V4mzqNg0WfTlBmIbzLI5AyHdgVYaqP2cAnT8m1Zg45U
	 dBZCUMHt891n2F2my+mJVshX2Jn3BuioUlxwrx8AZvbsTWWvcDIMyaqXhmybr4HLxQbJY
	 b0lkgBYYD7r0Z9F8qQwUguSY2Da0QUhfc+NSgu/sPJVWfxiANFrCHjDOta8nlMprNHN7c
	 LhzInlXm5eUqnF1JiaEqg7o4i9YuJWLK6N823Lhhy9fp2to+FdZt1hf+AhR6FQI03i9iH
	 5e1+Xp7bR/8mPpVik9n3otXABDxAHXI8AQ7r/I4cCSwiNQa2Jt7DEFm6zxhqqDsr57A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799936;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pZa1DyQ5dhNm7IcWztDUNPVGU8LXVDzTyG5czYuorX4=;
	b=vExItjUK0jhuJXinSaDrKJAEZs+uAaDMxT+PuseOjPk5XHWGY3rmnJya++ln4SZxxFoV
	 xuufwPP7uD0afUaaIonwgzXliNPDe2awx74lwJgOgPWM/uMX1JIXmgLSlKXKF0wOc1IpX
	 7JxnhtlUQZM/IOe8IDvcDB5+qMVCteTjNmLvf+jlrRIPBs+hpQVTcllVcrayBO/n/2PFR
	 8cO3fRMXgy94sNuVZ3lvvvxdMhUpJGXeMZw2gO1HY5K32r8JXpowCwo1DJXbYcta1RTyx
	 2I9kXIqD8/szkQJOdDVwhN3qfbulJmQpj/NTkgNtYvohT8MwrBh8+qKtblFu7wHrlAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lu+/V23W";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A4606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lu+/V23W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26521F00A26
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793799935;
	bh=pZa1DyQ5dhNm7IcWztDUNPVGU8LXVDzTyG5czYuorX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Lu+/V23WSycXM249y8TFrnUl6pnNNAczyEkfJCPCcFSEDGnHvAN7R47uN0Rm5YOlb
	 ksG0DWFJDoGQ+XKsxZoHcJhImNa1vUI5mxCJtznQwwm/t4wIw5e0tI3Yg9k/G5Q2L4
	 fFOeO1onHFqwKzLY6BOr+KyXDJBhmwRRPEGZsgexcP7HEkhp7/CMW3ntJanVhf1YZo
	 5WyloPwOjAsMwCQDPkAohS4CsCRQgv2FQ37+rA546fb0XUaQ/t5gQkWVarjo16xSYG
	 5NARaUAeW/UeaP+rLZbakxwAbDsZ/H+MwVTMzvs+TyERdbiaZITZCeOw5ej/Jq7sIA
	 PvV9EmRDWCvEw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso434665e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:45:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzLH+js13dG8VZwLlLNp8tP2UU58Fx+FEJ4wGzT5LTPoKk1YmEGt5XOXOhcNaBlZaZDlcb+OKQ+83ay+KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SAoNjF2OMpUrfFyYarIMJ7SIdE2LR59rpu0B/rSBKo7RKLDVw
	1RCuICQl/iZdRuv24X1nnXNwy3SLt0pzApt7hxcerIfvWHB+UI5yQtDCP/14lOgxObZCNLxjJHP
	e6EkPYeqQfh39lt0nYd0xzvzXzAm6ze0=
X-Received: by 2002:a05:6512:3089:b0:5bf:f559:2d10 with SMTP id
 2adb3069b0e04-5bff5592d49mr943044e87.63.1793799934435; Wed, 04 Nov 2026
 05:45:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20261026040230.22338-1-xiaoleiwangxiaolei@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:45:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLk9BUeA6KEiER16ZEemBkV_k_EdUDmbEf=DLjbSsyO=5Q@mail.gmail.com>
X-Gm-Features: AclHuK9G39re6JxrJ1z-ZGqu808jbf6f0YNR9rG3WzY_Xw8qXMct9UAID3GD4J8
Message-ID: <CAD++jLk9BUeA6KEiER16ZEemBkV_k_EdUDmbEf=DLjbSsyO=5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: scmi: replace custom dt_free_map with pinctrl_utils_free_map
To: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, Frank.Li@nxp.com, 
	ping.bai@nxp.com, kernel@pengutronix.de, s32@nxp.com, s.hauer@pengutronix.de, 
	sudeep.holla@kernel.org, cristian.marussi@arm.com, peng.fan@nxp.com, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 5:02=E2=80=AFAM Xiaolei Wang
<xiaoleiwangxiaolei@gmail.com> wrote:

> From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
>
> pinctrl_scmi_imx_dt_node_to_map() kmemdup_array()s the pinctrl configs
> of every pin into map[i].data.configs.configs, but the driver's own
> pinctrl_scmi_imx_dt_free_map() only frees the map array itself. The
> pinctrl core releases maps through pinctrl_dt_free_maps(), which calls
> dt_free_map(); the duplicated configs are therefore never freed and leak
> every time the DT node is parsed, e.g. on each (deferred) probe attempt.
>
> Replace the custom dt_free_map with the core helper
> pinctrl_utils_free_map(), which frees the configs of each
> PIN_MAP_TYPE_CONFIGS_* map before freeing the map itself. Its
> signature matches pinctrl_ops.dt_free_map(), so the driver-specific
> implementation can be dropped entirely.
>
> Detected with kmemleak on an i.MX95 board (FRDM-IMX95).
>
> Fixes: b755521fd6eb ("pinctrl: imx: support SCMI pinctrl protocol for i.M=
X95")
> Cc: stable@vger.kernel.org

No way I'm sending that to stable, it's no regression.

> Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

Patch applied as a nonurgent fix.

Yours,
Linus Walleij
