Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A6C33556B;
	Wed, 14 Oct 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969695; cv=pass; b=hFBD1/YhFzvFuG7LUWCrI9s4jfYTDwrzWwjS74FO7IItGBDBTewthK+JQr6smQfohxSILXfLv7Uadk/SHbu73g71Tu+fPg+7rUM/lilSRLhs6lmC8aplq/yCwpCd4w2W/2hidDgQ0eQinbnEJhMiCODZXZ4jfVnCDxowRkxC7W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969695; c=relaxed/simple;
	bh=vA8UhhoscoIdqb9kU0tT0rcvRN6wRnsukhp05bZu/6M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZtiGZd7h1am1aL8ZSJShJux63x4FdawS2JUBVC27646fZ8uH6bfkNOYv3c0ZiPu9bf28fPjqwMwWtWpq8IPpWlOGTS02L1rt3jJtNSIHbpeUqKfGeFCVZ3Ngv8lc0VNrA5lDYx38hmtH7PCzPV9MNFCATNUoR4AOiDuUn7H9CRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=bn36ga2R; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="bn36ga2R"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A44962007F9;
	Wed, 14 Oct 2026 11:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791969688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfE+HoszBW81JfpKZ8ADGrOXhCccZkZmZbnezmaZz3g=;
	b=bn36ga2R/Q/f3RzbVzI3q6AtPXo0q/3b0o7HWyn8C+bupqoZyNda9UByXCzx1v0D5MUQ+K
	puzo8nkZ671mWby9XmipkAeHsgg3usNnzWXTtP1iQ5FY1H+iSKyO4WEuBfvhne/kQSGsRG
	b2HotNgEutFHg8HXZj3EORPlylvMPFvTRHa15kcWk/+itKu2byobqUZEnv9v71Cp2tymIh
	dV+JSAWEYey7ZOg1t5MVT18Nhi/jpytrP8oRvQapB2FdUCa2x/sc1f1ztJUkTzGXLLj+J5
	+dnGneohYTjjzvVzclxoFCFsxr2MOM6H5Tu9TlRBImTJDNqrBADddVhv2zbx7A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791969688; a=rsa-sha256;
	cv=none;
	b=f76UA6F/dBELSiSpxsm8I9Zx8r4qVCdk44SCMOTX0qXGz7BiNDSPqxFM31uiiBOfZxvV0+
	qN9mpsNugI5BjbGQ8urd1TpZsARtMcccbLXxl6hMQ/bA5zS2gQRrA+JWMJZDPR/T8rePQs
	LQlUW/K08XuyfWsHy3zGxDc0ma/V1T21ZNK8Meioha/6UWHuQwYChZDy7X+RQFY8b+kt6D
	ZfdT6lO3jvfcmhOdUpsYOVW37xSlQqWGem4oC0VmFePYB1Z4HwQgXnrlek7XTy1Ou39fCL
	6syxLCVPlsCw6QcUadCnWwJ+7HBo+a+I0/DcntyNoPeF6TTTIBgOHVC+L32/mw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791969688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nfE+HoszBW81JfpKZ8ADGrOXhCccZkZmZbnezmaZz3g=;
	b=CdLwJjGT7nw/4fkVzcRRKViVB3mBzOdNNMW1YDXoFf9cYzPtc1LCzNA7lFIIxa+c1DYhpr
	cW5I1NdRis8TLoerZtgQ7teQduhQle2l57CP4xLYpzGkaWzcb3kBrR+C5WkoyJ9vfHDaP3
	cAJ1V4l04BjWfqkDyt6GDk5SigrZyJcBUadH/cPvVVXGogIBKGpbC3D5NwJcFVt3+5FZR/
	XpjD81IBqnyq4f1/diU7XoPbXbeqcWFQhDeAjf40pwdF4fT5vjHSx7ss+g+tEGQ031oL5D
	a30xD6fKClvEJqL5iW9Lnkf/LvCj8oLAWJLICnf73nAeHrXPhbwBnXooaWG49Q==
Message-ID: <c54ea6fb6adf7b0c944c47bc91f564af9ad1560b.camel@pengutronix.de>
Subject: Re: [PATCH v3] usb: dwc3: st: balance reset ownership on deassert
 failure
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Pengpeng Hou <hppiscas@163.com>, patrice.chotard@foss.st.com
Cc: thinh.nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 14 Oct 2026 11:21:28 +0200
In-Reply-To: <20261014031920.8390-1-hppiscas@163.com>
References: <20261014031920.8390-1-hppiscas@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-10-14 at 11:19 +0800, Pengpeng Hou wrote:
> The ST DWC3 glue ignores reset deassert failures in probe and resume.
> It may publish the child device or access the glue registers without both
> reset operations having succeeded.
>=20
> Check both results and unwind DRD setup failures as well. A shared
> softreset provider failure must go through undo_softreset: the reset core
> has already incremented its deassert count before calling the provider.
>=20
> Track whether this driver owns the deassert pair so suspend and remove do
> not release it again after failed resume has unwound it. This is referenc=
e
> ownership, not a guarantee about the physical reset-line state. Resume
> itself needs no early-return guard: the paired suspend callback clears
> the ownership state before resume is entered.
>=20
> The issue was found by our static-analysis tool and manually reviewed.
>=20
> Fixes: f83fca0707c6 ("usb: dwc3: add ST dwc3 glue layer to manage dwc3 HC=
")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
> Changes since v2:
> - remove the redundant resets_active early return in resume, as Thinh que=
ried
> - keep failed shared deasserts routed through undo_softreset
> - retain the independently needed suspend/remove ownership guards
> - rebase on current mainline
>=20
> Previous version:
> https://lore.kernel.org/all/20260922004312.3589-1-hppiscas@163.com/
>=20
>  drivers/usb/dwc3/dwc3-st.c |   43 ++++++++++++++++++++++++++++++++++----=
-----
>  1 file changed, 34 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
> index 5d513decaacd22de15825dc061c2747cf09fef07..1a2f38f9407ae0aea25edd616=
f8d77f953b3b404 100644
> --- a/drivers/usb/dwc3/dwc3-st.c
> +++ b/drivers/usb/dwc3/dwc3-st.c
> @@ -84,6 +84,7 @@
>   * @dr_mode:		drd static host/device config
>   * @rstc_pwrdn:		rest controller for powerdown signal
>   * @rstc_rst:		reset controller for softreset signal
> + * @resets_active:	whether this driver holds its deasserted reset pair
>   */
> =20
>  struct st_dwc3 {
> @@ -94,6 +95,7 @@ struct st_dwc3 {
>  	enum usb_dr_mode dr_mode;
>  	struct reset_control *rstc_pwrdn;
>  	struct reset_control *rstc_rst;
> +	bool resets_active;
>  };
> =20
>  static inline u32 st_dwc3_readl(void __iomem *base, u32 offset)
> @@ -242,7 +244,9 @@ static int st_dwc3_probe(struct platform_device *pdev=
)
>  				     "could not get power controller\n");
> =20
>  	/* Manage PowerDown */
> -	reset_control_deassert(dwc3_data->rstc_pwrdn);
> +	ret =3D reset_control_deassert(dwc3_data->rstc_pwrdn);
> +	if (ret)
> +		return ret;

		goto undo_powerdown;

This behaviour of _deassert causing workarounds in drivers is
unfortunate.

Maybe we should add a reset_control_deassert_get/put() pair for shared
resets where _get() decrements deassert_count on failure and _put()
returns void.

regards
Philipp
