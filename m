Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381110;
	b=hMi0IRO0n3th0mq+8BH331aJWQUpAxfIodt1j+PsY6tnQHvrzhkyDYPMQ8cscweibX7f
	 dbzdYn8zdOZSbpWapST5cr9NzdYU+NJgIe4Wi/TO1tYGIkUaeAaDbQ66Y2afN8BOYLL5J
	 2sP38Llw/OAm/Jh5beEphncmuF+3zy8z9PQQZnaDBW+jXeERmbO9c3G5av+WGwUtFh2hZ
	 ug0fxMVA2W471IyQwcWQbVJw+xyDQExgD/ONDiVdLhToxqTE5RJI5SLCAIJKqbMdVBWgx
	 D0ieF8TvBNJh34ZhHUwV40bnGmuQuU6BdiQWBR2D+mY2S/vwmP/Rg9cmkjEIvbGxs7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381110;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Virus-Scanned;
	bh=TWgRr6dGegLQCk4Xg1ASGzoaWbkBcIsmmAMCVBN8r5k=;
	b=WZ1eE+38n1pjZ17yyOkV2kRWCSW8Dur6jgtSwJ6df2Eq5Bx2DtrXpy+1t8xz2cV2geIm
	 Qmi5Z87cMA1pQBuMdsCRz0/Ub0lxEphagdpPghkRXEiBULnSFij3jSJzwBdp5B/21tugy
	 RQbxZrGiuELc7rb+FxDx6sg1+UWb6I6xi4X21FJZj/41gc6J0YXiJeQeLeK7PYIvI2+wz
	 /kHOstAQeUJiIdhxzfeZcFKe/zXioX6YTMKftcWARHxYksgK7mtt8iNpVqNzjrs0Zs2Jw
	 9EapOsgv1kVEjBQHnyOtz6zqNO8/4Fsl9ev8mZApxDyks1/ScylhlXKIFZBAUzUmIAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b="S/HmSzeW";
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4694606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4694606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=S/HmSzeW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=TWgRr6dGegLQCk4Xg1ASGzoaWbkBcIsmmAMCVBN8r5k=; b=S/HmSzeW+ek28+5Hk0MZeAozwr
	i0N1P+wQLiJ6DdPz+oj+NFYyCp8Kyz8LPx3JvGydxi1ZS26Cf9vr3mXgeKz9+0TGrp01rlMHu/xfT
	ulex1IGOv3ze8p/aWYd4GmOgJKeqY+eOMqM+Uhf0xfK8ZZIgrmsUHGLQ1wi+z0d0G++hqLgRXtORn
	wBxPUOPkVUsTGz2gHU5aaiF6Bf+9HI20F2JVRw7MxSy17Ghd+pyV9zZZGnzntpnDjq6lF/CJAybtq
	R5qvqCocsrHLGCuLmNxuWc6ti9cr2VWH3y1vuNAxT0rFBHEYaxbVWqjzMS/aFLKWYFKTXNog4p1wk
	R+/l1jhg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR2Ue-000N8x-2Y;
	Wed, 11 Nov 2026 08:11:40 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xR2Ue-000MIx-12;
	Wed, 11 Nov 2026 08:11:40 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 Aristo Chen <aristo.chen@canonical.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Fabio Estevam <festevam@nabladev.com>, Lucas Stach <l.stach@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
 linux-kernel@vger.kernel.org, Aristo Chen <aristo.chen@canonical.com>
Subject:
 Re: [PATCH 1/1] phy: freescale: fsl-samsung-hdmi: initialize default rate
Date: Wed, 11 Nov 2026 08:11:39 +0100
Message-ID: <13219248.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260903054811.9720-1-aristo.chen@canonical.com>
References: <20260903054811.9720-1-aristo.chen@canonical.com>
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
X-Virus-Scanned: Clear (ClamAV 1.4.6/28179/Tue Nov 10 07:26:51 2026)

Hi,

Am Donnerstag, 3. September 2026, 07:47:58 Mitteleurop=C3=A4ische Normalzei=
t schrieb Aristo Chen:
> The HDMI PHY clock reports 74.25 MHz when cur_cfg is unset, but does
> not establish that rate in hardware. The common clock framework caches
> the reported rate when registering the clock and skips a first
> clk_set_rate(74250000) request because the rate appears unchanged.
>=20
> Consequently, a display whose initial mode uses a 74.25 MHz pixel clock
> can leave the PHY with its bootloader register state and receive no
> TMDS signal. Requesting another rate first avoids the issue because the
> set_rate callback configures the PHY.
>=20
> Program the 74.25 MHz table entry with the reference clock enabled
> before registering the clock provider. recalc_rate can then report the
> configured rate, and a skipped first rate change is safe. Also enable
> the reference clock when restoring that configuration on resume.
>=20
> Fixes: 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY")
> Signed-off-by: Aristo Chen <aristo.chen@canonical.com>

Unfortunately this breaks my platform (imx8mp-tqma8mpql-mba8mpxl.dts).
With this patch applied I get the following errors in kernel log:
> fsl-samsung-hdmi-phy 32fdff00.phy: PLL failed to lock
> fsl-samsung-hdmi-phy 32fdff00.phy: error -ETIMEDOUT: failed to configure =
default rate
> fsl-samsung-hdmi-phy 32fdff00.phy: probe with driver fsl-samsung-hdmi-phy=
 failed with error -110

Reverting fixes my platform and HDMI as expected.

Best regards,
Alexander

> ---
>  drivers/phy/freescale/phy-fsl-samsung-hdmi.c | 59 +++++++++++++++-----
>  1 file changed, 44 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/f=
reescale/phy-fsl-samsung-hdmi.c
> index 0f25d81de61b..41addd4ad414 100644
> --- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> +++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
> @@ -44,6 +44,8 @@
>  #define MHZ	(1000UL * 1000UL)
>  #endif
> =20
> +#define PHY_DEFAULT_RATE	74250000
> +
>  #define PHY_PLL_DIV_REGS_NUM 7
> =20
>  struct phy_config {
> @@ -489,17 +491,6 @@ static int fsl_samsung_hdmi_phy_configure(struct fsl=
_samsung_hdmi_phy *phy,
>  	return ret;
>  }
> =20
> -static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
> -					 unsigned long parent_rate)
> -{
> -	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> -
> -	if (!phy->cur_cfg)
> -		return 74250000;
> -
> -	return phy->cur_cfg->pixclk;
> -}
> -
>  /* Helper function to lookup the available fractional-divider rate */
>  static const struct phy_config *fsl_samsung_hdmi_phy_lookup_rate(unsigne=
d long rate)
>  {
> @@ -520,6 +511,14 @@ static const struct phy_config *fsl_samsung_hdmi_phy=
_lookup_rate(unsigned long r
>  		&phy_pll_cfg[i] : &phy_pll_cfg[i+1]);
>  }
> =20
> +static unsigned long phy_clk_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct fsl_samsung_hdmi_phy *phy =3D to_fsl_samsung_hdmi_phy(hw);
> +
> +	return phy->cur_cfg->pixclk;
> +}
> +
>  static void fsl_samsung_hdmi_calculate_phy(struct phy_config *cal_phy, u=
nsigned long rate,
>  				    u8 p, u16 m, u8 s)
>  {
> @@ -640,6 +639,7 @@ static int phy_clk_register(struct fsl_samsung_hdmi_p=
hy *phy)
> =20
>  static int fsl_samsung_hdmi_phy_probe(struct platform_device *pdev)
>  {
> +	const struct phy_config *default_cfg;
>  	struct fsl_samsung_hdmi_phy *phy;
>  	int ret;
> =20
> @@ -664,6 +664,23 @@ static int fsl_samsung_hdmi_phy_probe(struct platfor=
m_device *pdev)
>  		return dev_err_probe(phy->dev, PTR_ERR(phy->refclk),
>  				     "failed to get ref clk\n");
> =20
> +	/*
> +	 * Establish the rate reported by recalc_rate() before registering the
> +	 * clock. Otherwise CCF may skip the first set_rate() when it requests
> +	 * the assumed default rate, leaving the PHY unconfigured.
> +	 */
> +	ret =3D clk_prepare_enable(phy->refclk);
> +	if (ret)
> +		return dev_err_probe(phy->dev, ret,
> +				     "failed to enable ref clk\n");
> +
> +	default_cfg =3D fsl_samsung_hdmi_phy_lookup_rate(PHY_DEFAULT_RATE);
> +	ret =3D fsl_samsung_hdmi_phy_configure(phy, default_cfg);
> +	clk_disable_unprepare(phy->refclk);
> +	if (ret)
> +		return dev_err_probe(phy->dev, ret,
> +				     "failed to configure default rate\n");
> +
>  	pm_runtime_get_noresume(phy->dev);
>  	pm_runtime_set_active(phy->dev);
>  	pm_runtime_enable(phy->dev);
> @@ -702,7 +719,7 @@ static int __maybe_unused fsl_samsung_hdmi_phy_suspen=
d(struct device *dev)
>  static int __maybe_unused fsl_samsung_hdmi_phy_resume(struct device *dev)
>  {
>  	struct fsl_samsung_hdmi_phy *phy =3D dev_get_drvdata(dev);
> -	int ret =3D 0;
> +	int ret;
> =20
>  	ret =3D clk_prepare_enable(phy->apbclk);
>  	if (ret) {
> @@ -710,11 +727,23 @@ static int __maybe_unused fsl_samsung_hdmi_phy_resu=
me(struct device *dev)
>  		return ret;
>  	}
> =20
> -	if (phy->cur_cfg)
> -		ret =3D fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
> +	if (!phy->cur_cfg)
> +		return 0;
> =20
> -	return ret;
> +	ret =3D clk_prepare_enable(phy->refclk);
> +	if (ret) {
> +		dev_err(phy->dev, "failed to enable ref clk\n");
> +		goto disable_apbclk;
> +	}
> +
> +	ret =3D fsl_samsung_hdmi_phy_configure(phy, phy->cur_cfg);
> +	clk_disable_unprepare(phy->refclk);
> +	if (!ret)
> +		return 0;
> =20
> +disable_apbclk:
> +	clk_disable_unprepare(phy->apbclk);
> +	return ret;
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


