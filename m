Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793352865;
	b=jHjkzGgSSkST7BHgc3nuwCO62Uj+1Z1THjEgzCN/jrrMYPhVHdwGu/LsjjzWjJCoVGLL
	 kCRyayoALkIJajO8RK1E7m3nz2/RXhbX8iOctOkGkuXa/KnEjf+9I7+O82UUsYEudXUJc
	 k05BfgTt22nhqK2QzhC7RIX/6pXqVKTZCU4ZuC5uM/9jnUAM/Oy+4lGl3CMoZgxeKFxc8
	 TMkY8dj8DYU1xc4tXg0R+Jn0OOLhLj6CIgOo0aVsRrhJXTvHij/llbKDGptbyt20YV4ZL
	 6IJSr9cQ9NpaiqaUZYooI3noLK77Z1m7WS5GMC9VQoCXMylrKiOwQ9qtB+ZdjCCO6og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352865;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=zR4cq1CC/Zi/N7qHUu5+m00lSe1k8x2uAxJhMEWb2Ms=;
	b=VotK7TqGICXsy+hMkKp9CdCgGy462C5LNOCuJjkuwEj+L8LwrQj0PjTna6Qy2UQsdbPM
	 RLoq2XjzwXhMwPTD6DHsohyTLhR9pniVk4a4nVK34F/dU5dgTbRUrWJ41w90eb45rwIiF
	 BNP2slhyaso2YFG49poXXtdzw1PoRSfbAwuhWUllPZc2+ht+vBqE1gLGEJsFZ5eyKoLNM
	 c+MpAmbiDEnzMnSYsNR9uyL+HRzabTmiMz4w9jv96t4KlTcNMFMc5wq2m9ZQg62WaX77s
	 Y1bJaB1jkAGUlQkXeWqkf1bq3eMIlHPp57RvmlrA6P+cuzAIl902QeQ1vWGkWTTOp0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PwjGgKbN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46540606A31C;
	Fri, 30 Oct 2026 09:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46540606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=PwjGgKbN
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 587F5202043;
	Fri, 30 Oct 2026 10:34:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793352855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zR4cq1CC/Zi/N7qHUu5+m00lSe1k8x2uAxJhMEWb2Ms=;
	b=PwjGgKbNJllpARDZ2IJbT3+vuUrcwZbUPPf4QEn6LLmbuLz+vj/6RaOT8REhBFwt08RuN+
	H5JLDjlEQ/GedyaMgiAKheVPgkCrgpD233H1PY5yj975YXBwY83uEYjC78mzP8y95sO/RT
	3a/hA6TzCTjXjlwTAnhiNUogV4I3HfQDXCSut4oL0fT/xrsG41evNzwK/yZR/96eOkWTPH
	w9QIHxy6OTDFRVIqX8VnnCjK3sSe7x8I+F4JEYO5Qr2nIm/fvt6BlaevNgyaD+a1NivaXa
	E9GCPnE/DNsU6jEahLrKtjoCtmz5Ic1Q7Zp5OpXrXrSmBvCqBHAcZV9iikGugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793352855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zR4cq1CC/Zi/N7qHUu5+m00lSe1k8x2uAxJhMEWb2Ms=;
	b=KoV7Vy9Aj7idkM6KLiaBaEJ9qzSzpgUR0Tk7u0Bmam5ubd9Vdm5kWjBaM8P88ZeQX9MCsd
	+azqZ3o2/cI7ElOHqo8xw2XvAUfax3tBo8qrzxnPsm1sTQhYQIPa6siAoXckyLhIr6P0kV
	1UXggfDQmZ9b0ERetYYtbdukfojr/wlp1/S5r96p2YaWrPyVo68UEiPOAjvZH/RKfBU3Yi
	LqRmjIyuXbDJITKTD3+REcK0JEPhO9BSW6Zy2dqfB+QCl1XpS6PSUInQAZt6HBDB1Rv722
	upeYHlBhricZUpWZmp5YZVKf21wAx9HTgYr7alA/nh1zDbYsj4jb5fB9aXO9OA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793352855; a=rsa-sha256;
	cv=none;
	b=IbwBeD24Ii1O3aW0mCnsGP4cs2D/bG+F3J1+8KFAxd2/rrdd84DvBGn3HZsqT5j1/IMF+D
	XSvnOPBcZQyDLEJq/tbVtgIhKfSkX7ahAcv4+XdFhNilhcbuLoJDmbKEBIjhwFoSd1+FoV
	B11zcgUWTP0LmoflLQ0xJnOl/i1wQ6GMVW5dR/FV56oNW1LSNuUl5aWQHgspGxqy8S0UNC
	cI9vO7R6jutcC5wJgH1sLjJWECR5kmZrrPMYHJYydp927AtMejHjdK1AbAEtglXcegw4SI
	PuVAgOvxPuo1Bqkt2vCKpgF5IiiWB1TrG7bJudbZajDol8Ltmwbwuje0vnSZDg==
Message-ID: <0d097a5f7cf0e71245f8e87d5a0ea377af048d0f.camel@pengutronix.de>
Subject: Re: [PATCH v4 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Petar Stepanovic <pstepanovic@axiado.com>, Naveen Kumar Rajgiri Bassappa
	 <rbnaveenkumar@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Krutik Shah <krutikshah@axiado.com>
Date: Fri, 30 Oct 2026 10:34:15 +0100
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-6-c5267b36a777@axiado.com>
References: 
	<20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
	 <20261030-axiado-ax3000-usb-device-controller-v4-6-c5267b36a777@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fr, 2026-10-30 at 01:10 -0700, Petar Stepanovic wrote:
> This patch introduces the core probe/remove functions for the Axiado
> AX3000/AX3005 UDC driver, and wires up the directory into the build
> system via Kconfig and Makefile.
>=20
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  drivers/usb/gadget/udc/Kconfig            |   2 +
>  drivers/usb/gadget/udc/Makefile           |   1 +
>  drivers/usb/gadget/udc/crg/Kconfig        |  16 +
>  drivers/usb/gadget/udc/crg/Makefile       |   9 +
>  drivers/usb/gadget/udc/crg/crg-udc-core.c | 723 ++++++++++++++++++++++++=
++++++
>  5 files changed, 751 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-core.c
> new file mode 100644
> index 000000000000..33be5c920ebe
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
> @@ -0,0 +1,723 @@
[...]
> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
> +{
> +	struct device *dev =3D crg_udc->dev;
> +	struct reset_control *rst;
> +	int ret;
> +
> +	crg_udc->clk =3D devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(crg_udc->clk))
> +		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
> +				     "failed to get clock\n");
> +
> +	ret =3D clk_prepare_enable(crg_udc->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk=
);
> +	if (ret)
> +		return ret;
> +
> +	rst =3D
> +		devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);

This can be put on one line.

regards
Philipp
