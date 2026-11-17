Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901125;
	b=1FOqje48cdrP4dlByaftTH3tEe+SU1gizA8QNHAWpZRDfKZVEec9bElJahkdgXh0rIhm
	 lmcHPlhoVOG0kvTjoXfq6nYGM/REbihXpNpI8a17h9LwnD5iRd+MfvYNQ+XebWTyv36CG
	 isjzMHbX1hYcnK8GEjUIE9Wc6PYJFFcaEfw5F7W0zrE4+tyExhmEaS5FkOITiCCFRtPEO
	 z5oUKpCBD6b6IqqHcnEzmLWN/EO0iVVHgmi5Tou1AMgRkPwGC2nwIkYuEtDjWm5E4dTIY
	 /wP1ibr17wOw+A599pHin52SgaQnVzSczP6GYm7bAw6jBQ7HQRH3EnSEfEC+l9TPaYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901125;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Virus-Scanned;
	bh=xOJDiEXcFpxOS5c30E0pkIfQF43ERA0iuDBf8HC0LGo=;
	b=OU3MPTwnnQP61EMLFVMCtoqKeDW4e4HhCYxOXd+jaPsMvblb9gaVudQQ4XXj4dCoG1xI
	 suI9kkdS6Z8xX0pg4yYv7CsyzkQeNHJg51cXh3aO/+PwTHWiKwvqxHvBpOkTiYnY8R5fj
	 mi2JwfmUO30UkKsdHNpwwDgBu1Z0eyD/Z6XZo0LVhcaXhiffJY/82Ai8lzEZc3ztsWv/Q
	 o0oaM3DIkh0AMACrwHEcGWtK+aaP1RmWihuAVLl2WGiM9nRt28y0s+C5uMpmlKQ6fezj1
	 1deHRxiT+G0/1UU1Tij4HsnzFQbiDF3lRUMmoIWa4bM3k+XtzTm8uCVn6AIAgehewhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=YqVKJH+6;
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0258606A88C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0258606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=YqVKJH+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xOJDiEXcFpxOS5c30E0pkIfQF43ERA0iuDBf8HC0LGo=; b=YqVKJH+6uvohJsdTtm2e445Z0K
	s8/zMskdWIDGCLTFX79tu1PUwzXhfgmielqhtd481p7PPB1TcVcFrOW3DnKflBhHmZvg/u2k4pzC1
	7xumzW9+au5DLuUtyt39i0kAjExuJNV3ioN+0yRFi2GTynLETRd2kT1e/RgaLKduJ3Cz9UohK8l/s
	NXjh356qV0O61ES/v45oO/UhO0gv25Dy0UDvxZHBkzQLtUGY6KPSy44L68ar55OtyPMO2kab6+X08
	UjWaJ+OhIf+x0O3Tp774lgKcDO6O8ocQCa3Ay0qKEyPGTloo73sAQhJh/yJDRq7op4hpZZGY6gea9
	uQaChYeA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xTDm0-0006XX-1f;
	Tue, 17 Nov 2026 08:38:37 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xTDlw-000PZI-1f;
	Tue, 17 Nov 2026 08:38:32 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v1] Revert "phy: freescale: fsl-samsung-hdmi: initialize default
 rate"
Date: Tue, 17 Nov 2026 08:38:35 +0100
Message-ID: <6728394.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20261116162409.218059-1-francesco@dolcini.it>
References: <20261116162409.218059-1-francesco@dolcini.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: Clear (ClamAV 1.4.6/28185/Mon Nov 16 07:24:29 2026)

Am Montag, 16. November 2026, 17:24:08 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Francesco Dolcini:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> This reverts commit c01ccf91b257741e9edc374a465126bae9ae4711.
>=20
> Programming the 74.25 MHz configuration at probe fails on i.MX8MP boards,
> the PHY probe aborts and HDMI is no longer available:
>=20
>   fsl-samsung-hdmi-phy 32fdff00.phy: PLL failed to lock
>   fsl-samsung-hdmi-phy 32fdff00.phy: error -ETIMEDOUT: failed to configur=
e default rate
>   fsl-samsung-hdmi-phy 32fdff00.phy: probe with driver fsl-samsung-hdmi-p=
hy failed with error -110
>=20
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/all/13219248.O9o76ZdvQC@steina-w/
> Fixes: c01ccf91b257 ("phy: freescale: fsl-samsung-hdmi: initialize defaul=
t rate")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Revert works as expected:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 59 +++++---------------
>  1 file changed, 15 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/f=
reescale/phy-fsl-samsung-hdmi.c
> index aaa651abcbc6..d7418c2197c9 100644
> --- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> +++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> @@ -44,8 +44,6 @@
>  #define MHZ	(1000UL * 1000UL)
>  #endif
> =20
> -#define PHY_DEFAULT_RATE	74250000
> -
>  #define PHY_PLL_DIV_REGS_NUM 7
> =20
>  struct phy_config {
> @@ -491,6 +489,17 @@ static int fsl_samsung_hdmi_phy_configure(struct fsl=
_samsung_hdmi_phy *phy,
>  	return ret;
>  }
> =20
> +static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> +
> +	if (!phy->cur_cfg)
> +		return 74250000;
> +
> +	return phy->cur_cfg->pixclk;
> +}
> +
>  /* Helper function to lookup the available fractional-divider rate */
>  static const struct phy_config *fsl_samsung_hdmi_phy_lookup_rate(unsigne=
d long rate)
>  {
> @@ -511,14 +520,6 @@ static const struct phy_config *fsl_samsung_hdmi_phy=
_lookup_rate(unsigned long r
>  		&phy_pll_cfg[i] : &phy_pll_cfg[i+1]);
>  }
> =20
> -static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
> -					 unsigned long parent_rate)
> -{
> -	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> -
> -	return phy->cur_cfg->pixclk;
> -}
> -
>  static void fsl_samsung_hdmi_calculate_phy(struct phy_config *cal_phy, u=
nsigned long rate,
>  				    u8 p, u16 m, u8 s)
>  {
> @@ -639,7 +640,6 @@ static int phy_clk_register(struct fsl_samsung_hdmi_p=
hy *phy)
> =20
>  static int fsl_samsung_hdmi_phy_probe(struct platform_device *pdev)
>  {
> -	const struct phy_config *default_cfg;
>  	struct fsl_samsung_hdmi_phy *phy;
>  	int ret;
> =20
> @@ -664,23 +664,6 @@ static int fsl_samsung_hdmi_phy_probe(struct platfor=
m_device *pdev)
>  		return dev_err_probe(phy->dev, PTR_ERR(phy->refclk),
>  				     "failed to get ref clk\n");
> =20
> -	/*
> -	 * Establish the rate reported by recalc_rate() before registering the
> -	 * clock. Otherwise CCF may skip the first set_rate() when it requests
> -	 * the assumed default rate, leaving the PHY unconfigured.
> -	 */
> -	ret =3D clk_prepare_enable(phy->refclk);
> -	if (ret)
> -		return dev_err_probe(phy->dev, ret,
> -				     "failed to enable ref clk\n");
> -
> -	default_cfg =3D fsl_samsung_hdmi_phy_lookup_rate(PHY_DEFAULT_RATE);
> -	ret =3D fsl_samsung_hdmi_phy_configure(phy, default_cfg);
> -	clk_disable_unprepare(phy->refclk);
> -	if (ret)
> -		return dev_err_probe(phy->dev, ret,
> -				     "failed to configure default rate\n");
> -
>  	pm_runtime_get_noresume(phy->dev);
>  	pm_runtime_set_active(phy->dev);
>  	pm_runtime_enable(phy->dev);
> @@ -719,7 +702,7 @@ static int __maybe_unused fsl_samsung_hdmi_phy_suspen=
d(struct device *dev)
>  static int __maybe_unused fsl_samsung_hdmi_phy_resume(struct device *dev)
>  {
>  	struct fsl_samsung_hdmi_phy *phy =3D dev_get_drvdata(dev);
> -	int ret;
> +	int ret =3D 0;
> =20
>  	ret =3D clk_prepare_enable(phy->apbclk);
>  	if (ret) {
> @@ -727,23 +710,11 @@ static int __maybe_unused fsl_samsung_hdmi_phy_resu=
me(struct device *dev)
>  		return ret;
>  	}
> =20
> -	if (!phy->cur_cfg)
> -		return 0;
> -
> -	ret =3D clk_prepare_enable(phy->refclk);
> -	if (ret) {
> -		dev_err(phy->dev, "failed to enable ref clk\n");
> -		goto disable_apbclk;
> -	}
> -
> -	ret =3D fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
> -	clk_disable_unprepare(phy->refclk);
> -	if (!ret)
> -		return 0;
> +	if (phy->cur_cfg)
> +		ret =3D fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
> =20
> -disable_apbclk:
> -	clk_disable_unprepare(phy->apbclk);
>  	return ret;
> +
>  }
> =20
>  static DEFINE_RUNTIME_DEV_PM_OPS(fsl_samsung_hdmi_phy_pm_ops,
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


