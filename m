Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DA53DB326;
	Mon, 31 Aug 2026 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167266; cv=none; b=dsvHDgrX3sQhhQnc/tiHvbHI3FaO69rJeOa6QHGLw/vPpKmH7RJq+9fd15XiIDI5lxMzB1P/60jjhQqJB39qrWO+WudGFTBrVzDlIx/hDQFELrZUFMuk5YZYfEjPgzb6EwPGvxhh9DDBT74NnJP1qM83bss4uVZz9JKbJ0YIgAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167266; c=relaxed/simple;
	bh=EclJe4R4fVUPOg/O+AGO14Kizjoh1sVIDPDtSbQPVYY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opSePPLzellXT+uKFk/dmbwlYXEpgFgXgYaW0A6+Uxc05O9rhsVzzKcOGe9NI5NVOfqFuwPr2aO1aeXYS2X5AOcD13eCfty4h8YSnBP/wRAU2Y14GtitNK646mXne55ml7HlPDP+CjwyNa5xoh2ynddamthbupNIr3SSBvqyNOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2EC78200444;
	Mon, 31 Aug 2026 11:07:41 +0200 (CEST)
Message-ID: <cd6db5def6d08ad435facebd16479a6c65de4773.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] usb: fotg210: use the common EHCI core
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, Alan Stern
 <stern@rowland.harvard.edu>,  Daniel Palmer <daniel@thingy.jp>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 31 Aug 2026 11:07:41 +0200
In-Reply-To: <20260831-gemini-usb-fotg2-v1-2-8a8ee12c4b32@kernel.org>
References: <20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org>
	 <20260831-gemini-usb-fotg2-v1-2-8a8ee12c4b32@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-08-31 at 00:24 +0200, Linus Walleij wrote:
> Replace the private EHCI fork with an hc_driver built from the common
> EHCI implementation. Configure the FOTG210 register, root-hub TT,
> speed-reporting, port-reset, and Gemini timing quirks through the new
> hooks.
>=20
> Keep role selection fixed at probe time, while cleaning up clock/reset
> handling, interrupt masks, Gemini syscon setup, VBUS sequencing, probe
> failures, shutdown, and system sleep. Device trees without dr_mode
> retain their historical host default.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/usb/fotg210/Kconfig        |    2 +
>  drivers/usb/fotg210/fotg210-core.c |  276 +-
>  drivers/usb/fotg210/fotg210-hcd.c  | 5672 +-----------------------------=
------
>  drivers/usb/fotg210/fotg210-hcd.h  |  689 -----
>  drivers/usb/fotg210/fotg210.h      |   26 +-
>  5 files changed, 338 insertions(+), 6327 deletions(-)
>=20
[...]
> diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fot=
g210-core.c
> index 7fb4d4715e9f..a6f39306fb19 100644
> --- a/drivers/usb/fotg210/fotg210-core.c
> +++ b/drivers/usb/fotg210/fotg210-core.c
> @@ -1,37 +1,50 @@
[...]
>  static int fotg210_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	enum usb_dr_mode mode;
> +	struct reset_control *rst;
>  	struct fotg210 *fotg;
>  	u32 val;
>  	int ret;
> @@ -141,62 +193,112 @@ static int fotg210_probe(struct platform_device *p=
dev)
>  	if (IS_ERR(fotg->base))
>  		return PTR_ERR(fotg->base);
> =20
> -	fotg->pclk =3D devm_clk_get_optional_enabled(dev, "PCLK");
> +	fotg->pclk =3D devm_clk_get_enabled(dev, "PCLK");
>  	if (IS_ERR(fotg->pclk))
> -		return PTR_ERR(fotg->pclk);
> +		return dev_err_probe(dev, PTR_ERR(fotg->pclk),
> +				     "failed to enable PCLK\n");
> +
> +	rst =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "failed to get reset\n");
> +	if (rst) {

No need for the condition, reset_control_reset(rst) does nothing if rst
is NULL.

> +		ret =3D reset_control_reset(rst);

regards
Philipp
