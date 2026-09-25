Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3812049B21B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341368; cv=none; b=YSW/OWuhWVpwUfCDIcj4ZbaezhNuD7OjkTunrTsa4B90l7kYsfe+HRFB6WMfSyl3Ko/8As5zmnIUCRVaN2tncWAdsAzG+2dZXNX8E9LSb2HOzb/6XnNo/Az/RY9yRnV9olhVPn8sOjwCohor+zKd6J8CKWTMw6vlNflQIZ+cKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341368; c=relaxed/simple;
	bh=EFNDn37Nq8ZyAIz1yn3RuGMctznQybAj2YzLjUiOgt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqAdPUBnFoSCfSdXcIPT7CEhrSWKhtUZ4SvwUD2MWQ4IpYXJDSQgI+k1nkOZJ4xUkcfR37pJpILy/f1hBOl+AEBQOCorO4I6G6AAT/iW9zjIEwro537XmC1GBK9j5hZeEL+k1MtE+yofdnkJu1NQhP+3IYZzmN7yOlKffL0RyBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8hgkaFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDLbEVMj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8hgkaFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDLbEVMj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YoJl1194081
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xulAFPPPche1O/2Oisas5xRI
	pfEnAJndmN74oRnPgYw=; b=m8hgkaFgq4sUDXfKGEMllaorfE0QCAZn+oK4c1oW
	v7dSKnn3Ok4WXTPl97lWJYaWLosYawMkv6ihSpgHHTQ0Jff+S+sxO6OUgAho0LUu
	ctCwEQPSLR29SNicrQzEmvPTi307asuRZEjaShp0cJFQMES2vgPU6Z0g8+n3XusF
	hnrwmB3gnTGAnB7hdWv7pADM5yeopvNF+YBV1MwHXx1zryVRY7gHHgSsvD3DleIR
	CZ0Kdrjxxf1/u3LYy490Zag/H1hjrFWfjo83YCd0jSKygudt0D1bxKfU8LFXIjrc
	vjTTkha6Bzhhg1pIv2JdMV3xq1go2OWlMGmiCRqjGebOWQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874kfwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:02:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785827e6073so198999137.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790341364; x=1790946164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xulAFPPPche1O/2Oisas5xRIpfEnAJndmN74oRnPgYw=;
        b=QDLbEVMjwf6DWBTiOgo+d22EMkuEBFio60aeK+7PDK6X5BRGh19AiOsIUnjwqlgG4L
         9/T3Xl8k13mMWtvE577Pha3z+Df37GUuaDYqJQYq6/ZS0iM/OaGtBErci1r/laUu/zFM
         LURjCYcaBjORcTQoI/Ty3tBiNdJnxbMsQ8DUCejhOt+WbJ3vnlDcLOF2MqC4J/LXrure
         f57qoPDoIdcBWsW907kAZvD6eVXTzMutVKaMQzV8DupxEbUhx87eVFtzOTR8/4rGu+So
         UDcG5Xu/9gOpF54pMINgOWABXItGST9LyIGkNtdrJ5ZjDLX0Z2Q1mAAd8/6lBWSH/l+y
         I9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341364; x=1790946164;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xulAFPPPche1O/2Oisas5xRIpfEnAJndmN74oRnPgYw=;
        b=wVCB3umyaRyC0SSNcZp21uF8ODNMsRUdqlroDfIEF1slihk0cbms+68YATxO+9LEge
         gK9m3N/68qy19mGkzwgxQAcMF4dQ0QnNaaG+Yq5PgDrC82DfrDo6tSZIKYaV9x81NwXw
         Do9T8QBbQ/jc6rVr92aKkqYwOeIY0lkIiTv7enIdwIVdWFOKE6CD+TXfZvw24b5m6OAS
         LheoCw1sMET3ueHXT74KiCvEYim4Lc/gWgCbwmPELDrJC+hN4lgeIRutl5Ww+swfDLTF
         94Uq4A2kDnbVqB8I/u03lsjqJ9CbHt+I0OVS6NXDdg+8u+YRZPOj34+IAKIGWBELfpJm
         JRIQ==
X-Forwarded-Encrypted: i=1; AKwUvByBB2H2xG9x3URTjFTre2fiPGDT8jnepk5zDpXYU1dDyAPoUa1XsgiSbKaFIOtrPE60SAIHonIN7TQxRKw=@vger.kernel.org
X-Gm-Message-State: AFuF++nAyKOgBS6GPNIARvQ6U/UjOvj1vRjeWcg04v1tXbT2njQk4LbI
	P4VkjJuAbjtfCSSbb4eV4f97XT5BssoBfPY8SJ2Iywth6Tg3dziyAZP4aPYG7SX9Bif4IOt6knm
	c6iy+ZHIlrpokpf3JAuQ8tmtVyPkHCWROnXVJCX2xmvKeAhxy5Sf2bIn4s2wpIH5U42E=
X-Gm-Gg: AYBFou076ZhRMgJpyf1gPO3TcCu8k09Ff3BDrhWQiK5S0z8wJimWPomYuqEKvuwC+MA
	vpz3ytH8BjIqJ1cnvaJIROKG2X14+u6cfIPlz4+5q/srEBNudwpyDR76ca6Bjy2mfHv9VuLh71/
	NLvSN9dQCd3zBzfI/4cwajgxkDnfLNsinkn+5VZzxgujY1SQ6smftVhelTt941eoulwjXPO4CGD
	MHB1U9lmePNxMPBneCyk14cuWKscnn4KH2rACrd6XLmJ1dvz1+DEpun24AH7jh7BY2KlbKPYOdD
	jTwC26abVar6VIGnh51KaWbn0Aj1ren1O4Z94xdngH5kErxxpA/asf6tDO4ztDw4T8Fu/mU8YOo
	S1XIPxS1X4KN4yg==
X-Received: by 2002:a05:6102:1627:b0:7a6:f970:27d6 with SMTP id ada2fe7eead31-7af1e9f2d0cmr2085528137.20.1790341363833;
        Fri, 25 Sep 2026 06:02:43 -0700 (PDT)
X-Received: by 2002:a05:6102:1627:b0:7a6:f970:27d6 with SMTP id ada2fe7eead31-7af1e9f2d0cmr2085501137.20.1790341363099;
        Fri, 25 Sep 2026 06:02:43 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm7334222f8f.15.2026.09.25.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:02:41 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:02:41 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 9/9] net: stmmac: qcom-ethqos: add Qualcomm
 Nord support
Message-ID: <arZw8YAPXdQMWpOS@lore-desk>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-9-4b1c682af70f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evnRWEoWu//8hjkd"
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-9-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: C_TFgUXGPtPysDlRNMP2QJpLgX_QYlSh
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab670f5 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5OcTG_3slrMx8LD5SeEA:9 a=CjuIK1q_8ugA:10 a=db5jTQsCUi3hsAQFeVEA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfXwkBos6+xiQcX
 amzWmk8YYeJy4+GEa2V9T+zFSYUP7vjh88b1sHIazjCPpSD8oxdj1a8MzQfz65MghPhDi1L4PcQ
 Pj79RUa8L6grNg5bJC/T6ZSsDcstUO9cJT18NCvHVfTowNbmOhmIRf/3HrIJ3OKFgHtPyPGwnr8
 a/y5jWEFFUe5ljU0csboYuUBLDnyrWH90wYPw7oahYyJKFwQ5AydZWanAWR6HfXuCuivy3XFhR2
 /eO3XXde4z5/1kVz6YwMq6VOcoe1DqxKY9x+81Ni5wIKfDb2LuXMtn2V4gdTnkrIJwEA50bw217
 4qnFal9gZyyWZUhYPjZjFqKs69JpdVO74nNtxvJQ1Gs0ZI5dQIcUJD1ZIgI8zYGb9xrVO0eq7ac
 FijWqV8xFAd88mVgZhWfNUrQA6nVK31QEpzDdKCyEN3jsG5t2pjoggssoFT8tvvE2nbNAULzrU5
 Tq8tSFfNMPvvunLTNOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX3hsk1yrxt1D5
 Zso7yE98RxOgxqumP9AA5RuC1zgbYWyo2fUnm6rJRlekwZUiFOndpFw/JeuPvaF2ej/tajcOir4
 6cTEra6rd2jgTmkWYGqCWVr2ySmGHxQ=
X-Proofpoint-GUID: C_TFgUXGPtPysDlRNMP2QJpLgX_QYlSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250051

--evnRWEoWu//8hjkd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Qualcomm Nord provides two ETHQOS controllers based on the Synopsys
> DesignWare 25GMAC IP.
>=20
> The Nord integration uses platform-specific MTL queue, DMA channel and
> timestamp register addresses. It also requires wrapper programming for
> USXGMII operation and an EEE clock vote for PCS link-up.
>=20
> Add the Nord platform data, select the DW25GMAC core, describe its
> register layout and configure the ETHQOS wrapper for USXGMII. Also add
> the platform-specific loopback control needed while the MAC is being
> initialized.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Hi Mohd,

some nits inline.

Regards,
Lorenzo

> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 142 +++++++++++++++=
+++++-
>  1 file changed, 137 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a99a78880c0fb7858e90b6212b37ebfc7fccaf84..a03c8e203920a70238deff9f1=
f970d29d1293893 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -23,8 +23,14 @@
>  #define RGMII_IO_MACRO_CONFIG2		0x1C
>  #define RGMII_IO_MACRO_DEBUG1		0x20
>  #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
> +#define RGMII_IO_MACRO_SCRATCH_2	0x44
>  #define EMAC_WRAPPER_SGMII_PHY_CNTRL1	0xf4
> =20
> +#define RGMII_IO_MACRO_BYPASS			0x16C
> +#define EMAC_WRAPPER_SGMII_PHY_CNTRL0		0x170
> +#define EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4	0x174
> +#define EMAC_WRAPPER_USXGMII_MUX_SEL		0x1D0
> +
>  /* RGMII_IO_MACRO_CONFIG fields */
>  #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
>  #define RGMII_CONFIG_POS_NEG_DATA_SEL		BIT(23)
> @@ -77,6 +83,21 @@
>  #define RGMII_CONFIG2_RX_PROG_SWAP		BIT(7)
>  #define RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL	BIT(6)
>  #define RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN	BIT(5)
> +#define RGMII_CONFIG2_MODE_EN_VIA_GMII		BIT(21)
> +
> +/* EMAC_WRAPPER_SGMII_PHY_CNTRL0 fields */
> +#define SGMII_PHY_CNTRL0_2P5G_1G_CLK_SEL	GENMASK(6, 5)
> +
> +/* EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4 fields */
> +#define SGMII_PHY_CNTRL1_USXGMII_GMII_MASTER_CLK_MUX_SEL	BIT(4)
> +#define SGMII_PHY_CNTRL1_RGMII_SGMII_CLK_MUX_SEL		BIT(0)
> +
> +/* RGMII_IO_MACRO_BYPASS fields */
> +#define RGMII_BYPASS_EN				BIT(0)
> +
> +/* EMAC_WRAPPER_USXGMII_MUX_SEL fields */
> +#define USXGMII_CLK_BLK_GMII_CLK_BLK_SEL	BIT(1)
> +#define USXGMII_CLK_BLK_CLK_EN			BIT(0)
> =20
>  /* EMAC_WRAPPER_SGMII_PHY_CNTRL1 bits */
>  #define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
> @@ -88,6 +109,8 @@ struct ethqos_emac_por {
>  	unsigned int value;
>  };
> =20
> +struct qcom_ethqos;
> +
>  struct ethqos_emac_driver_data {
>  	const struct ethqos_emac_por *rgmii_por;
>  	unsigned int num_rgmii_por;
> @@ -97,12 +120,16 @@ struct ethqos_emac_driver_data {
>  	const char *link_clk_name;
>  	struct dwmac4_addrs dwmac4_addrs;
>  	bool needs_sgmii_loopback;
> +	struct dwxgmac_addrs dwxgmac_addrs;
> +	enum dwmac_core_type core_type;
> +	void (*set_sgmii_loopback)(struct qcom_ethqos *ethqos, bool enable);

I guess introducing this function pointer you can drop needs_sgmii_loopback
field since you always check set_sgmii_loopback is not NULL, right?

>  };
> =20
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
>  	struct clk *link_clk;
> +	struct clk *eee_clk;
>  	struct phy *serdes_phy;
>  	phy_interface_t phy_mode;
> =20
> @@ -111,6 +138,7 @@ struct qcom_ethqos {
>  	bool rgmii_config_loopback_en;
>  	bool has_emac_ge_3;
>  	bool needs_sgmii_loopback;
> +	void (*set_sgmii_loopback)(struct qcom_ethqos *ethqos, bool enable);
>  };
> =20
>  static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -201,6 +229,15 @@ qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *e=
thqos, bool enable)
>  		      EMAC_WRAPPER_SGMII_PHY_CNTRL1);
>  }
> =20
> +static void
> +qcom_ethqos_set_sgmii_loopback_nord(struct qcom_ethqos *ethqos, bool ena=
ble)
> +{
> +	rgmii_updatel(ethqos,
> +		      SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN,
> +		      enable ? SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN : 0,
> +		      EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4);
> +}
> +
>  static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
>  {
>  	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
> @@ -220,6 +257,7 @@ static const struct ethqos_emac_driver_data emac_v2_3=
_0_data =3D {
>  	.num_rgmii_por =3D ARRAY_SIZE(emac_v2_3_0_por),
>  	.rgmii_config_loopback_en =3D true,
>  	.has_emac_ge_3 =3D false,
> +	.core_type =3D DWMAC_CORE_GMAC4,
>  };
> =20
>  static const struct ethqos_emac_por emac_v2_1_0_por[] =3D {
> @@ -236,6 +274,7 @@ static const struct ethqos_emac_driver_data emac_v2_1=
_0_data =3D {
>  	.num_rgmii_por =3D ARRAY_SIZE(emac_v2_1_0_por),
>  	.rgmii_config_loopback_en =3D false,
>  	.has_emac_ge_3 =3D false,
> +	.core_type =3D DWMAC_CORE_GMAC4,
>  };
> =20
>  static const struct ethqos_emac_por emac_v3_0_0_por[] =3D {
> @@ -252,6 +291,7 @@ static const struct ethqos_emac_driver_data emac_v3_0=
_0_data =3D {
>  	.num_rgmii_por =3D ARRAY_SIZE(emac_v3_0_0_por),
>  	.rgmii_config_loopback_en =3D false,
>  	.has_emac_ge_3 =3D true,
> +	.core_type =3D DWMAC_CORE_GMAC4,
>  	.dwmac4_addrs =3D {
>  		.dma_chan =3D 0x00008100,
>  		.dma_chan_offset =3D 0x1000,
> @@ -286,6 +326,8 @@ static const struct ethqos_emac_driver_data emac_v4_0=
_0_data =3D {
>  	.has_emac_ge_3 =3D true,
>  	.link_clk_name =3D "phyaux",
>  	.needs_sgmii_loopback =3D true,
> +	.core_type =3D DWMAC_CORE_GMAC4,
> +	.set_sgmii_loopback =3D qcom_ethqos_set_sgmii_loopback,
>  	.dma_addr_width =3D 36,
>  	.dwmac4_addrs =3D {
>  		.dma_chan =3D 0x00008100,
> @@ -485,6 +527,47 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqo=
s *ethqos, int speed)
>  	return 0;
>  }
> =20
> +static void ethqos_configure_usxgmii(struct qcom_ethqos *ethqos)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ethqos->num_rgmii_por; i++)
> +		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
> +			     ethqos->rgmii_por[i].offset);
> +
> +	ethqos_set_func_clk_en(ethqos);
> +
> +	rgmii_updatel(ethqos, RGMII_BYPASS_EN, RGMII_BYPASS_EN,
> +		      RGMII_IO_MACRO_BYPASS);
> +	rgmii_updatel(ethqos, RGMII_CONFIG2_MODE_EN_VIA_GMII, 0,
> +		      RGMII_IO_MACRO_CONFIG2);
> +	rgmii_updatel(ethqos, SGMII_PHY_CNTRL0_2P5G_1G_CLK_SEL, BIT(5),
> +		      EMAC_WRAPPER_SGMII_PHY_CNTRL0);
> +	rgmii_updatel(ethqos, SGMII_PHY_CNTRL1_RGMII_SGMII_CLK_MUX_SEL, 0,
> +		      EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4);
> +	rgmii_updatel(ethqos, SGMII_PHY_CNTRL1_USXGMII_GMII_MASTER_CLK_MUX_SEL,
> +		      SGMII_PHY_CNTRL1_USXGMII_GMII_MASTER_CLK_MUX_SEL,
> +		      EMAC_WRAPPER_SGMII_PHY_CNTRL1_V4);
> +
> +	rgmii_updatel(ethqos, USXGMII_CLK_BLK_GMII_CLK_BLK_SEL, 0,
> +		      EMAC_WRAPPER_USXGMII_MUX_SEL);
> +	rgmii_updatel(ethqos, USXGMII_CLK_BLK_CLK_EN, 0,
> +		      EMAC_WRAPPER_USXGMII_MUX_SEL);
> +
> +	rgmii_updatel(ethqos, USXGMII_CLK_BLK_GMII_CLK_BLK_SEL,
> +		      USXGMII_CLK_BLK_GMII_CLK_BLK_SEL,
> +		      EMAC_WRAPPER_USXGMII_MUX_SEL);
> +}
> +
> +static void
> +ethqos_fix_mac_speed_usxgmii(void *bsp_priv, phy_interface_t interface,
> +			     int speed, unsigned int mode)
> +{
> +	struct qcom_ethqos *ethqos =3D bsp_priv;
> +
> +	ethqos_configure_usxgmii(ethqos);

I guess you can just open-code ethqos_configure_usxgmii() here.

> +}
> +
>  static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
>  				       phy_interface_t interface, int speed,
>  				       unsigned int mode)
> @@ -625,7 +708,8 @@ static int ethqos_mac_finish_serdes(struct net_device=
 *ndev, void *priv,
>  	struct qcom_ethqos *ethqos =3D priv;
>  	int ret =3D 0;
> =20
> -	qcom_ethqos_set_sgmii_loopback(ethqos, false);
> +	if (ethqos->set_sgmii_loopback)
> +		ethqos->set_sgmii_loopback(ethqos, false);
> =20
>  	if (interface =3D=3D PHY_INTERFACE_MODE_SGMII ||
>  	    interface =3D=3D PHY_INTERFACE_MODE_2500BASEX)
> @@ -647,14 +731,24 @@ static int ethqos_clks_config(void *priv, bool enab=
led)
>  			return ret;
>  		}
> =20
> +		/* PCS link-up depends on the EEE clock due to a hardware quirk. */
> +		ret =3D clk_prepare_enable(ethqos->eee_clk);
> +		if (ret) {
> +			dev_err(&ethqos->pdev->dev, "eee_clk enable failed\n");
> +			clk_disable_unprepare(ethqos->link_clk);
> +			return ret;
> +		}
> +
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
>  		 * ethqos' fix_mac_speed() method is invoked.
>  		 */
> -		qcom_ethqos_set_sgmii_loopback(ethqos, true);
> +		if (ethqos->set_sgmii_loopback)
> +			ethqos->set_sgmii_loopback(ethqos, true);

I guess you should move this above the comment.

>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		clk_disable_unprepare(ethqos->eee_clk);
>  		clk_disable_unprepare(ethqos->link_clk);
>  	}
> =20
> @@ -738,6 +832,10 @@ static int qcom_ethqos_probe(struct platform_device =
*pdev)
>  		plat_dat->fix_mac_speed =3D ethqos_fix_mac_speed_sgmii;
>  		plat_dat->mac_finish =3D ethqos_mac_finish_serdes;
>  		break;
> +	case PHY_INTERFACE_MODE_USXGMII:
> +		plat_dat->fix_mac_speed =3D ethqos_fix_mac_speed_usxgmii;
> +		plat_dat->mac_finish =3D ethqos_mac_finish_serdes;
> +		break;
>  	default:
>  		dev_err(dev, "Unsupported phy mode %s\n",
>  			phy_modes(ethqos->phy_mode));
> @@ -756,12 +854,18 @@ static int qcom_ethqos_probe(struct platform_device=
 *pdev)
>  	ethqos->rgmii_config_loopback_en =3D data->rgmii_config_loopback_en;
>  	ethqos->has_emac_ge_3 =3D data->has_emac_ge_3;
>  	ethqos->needs_sgmii_loopback =3D data->needs_sgmii_loopback;
> +	ethqos->set_sgmii_loopback =3D data->set_sgmii_loopback;
> =20
>  	ethqos->link_clk =3D devm_clk_get(dev, data->link_clk_name ?: "rgmii");
>  	if (IS_ERR(ethqos->link_clk))
>  		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
>  				     "Failed to get link_clk\n");
> =20
> +	ethqos->eee_clk =3D devm_clk_get_optional(dev, "eee");
> +	if (IS_ERR(ethqos->eee_clk))
> +		return dev_err_probe(dev, PTR_ERR(ethqos->eee_clk),
> +				     "Failed to get eee_clk\n");
> +
>  	ret =3D ethqos_clks_config(ethqos, true);
>  	if (ret)
>  		return ret;
> @@ -778,7 +882,8 @@ static int qcom_ethqos_probe(struct platform_device *=
pdev)
>  	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
>  			       SPEED_1000);
> =20
> -	qcom_ethqos_set_sgmii_loopback(ethqos, true);
> +	if (ethqos->set_sgmii_loopback)
> +		ethqos->set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);
> =20
>  	/* The clocks are controlled by firmware, so we don't know for certain
> @@ -791,9 +896,11 @@ static int qcom_ethqos_probe(struct platform_device =
*pdev)
>  	plat_dat->set_clk_tx_rate =3D ethqos_set_clk_tx_rate;
>  	plat_dat->dump_debug_regs =3D rgmii_dump;
>  	plat_dat->ptp_clk_freq_config =3D ethqos_ptp_clk_freq_config;
> -	plat_dat->core_type =3D DWMAC_CORE_GMAC4;
> +	plat_dat->core_type =3D data->core_type;
>  	if (ethqos->has_emac_ge_3)
>  		plat_dat->dwmac4_addrs =3D &data->dwmac4_addrs;
> +	if (data->dwxgmac_addrs.dma_even_chan_base)

it seems a bit odd to check dma_even_chan_base is set. Maybe it is better to
check core_type is DWMAC_CORE_25GMAC?

> +		plat_dat->dwxgmac_addrs =3D &data->dwxgmac_addrs;
>  	plat_dat->pmt =3D true;
>  	if (of_property_read_bool(np, "snps,tso"))
>  		plat_dat->flags |=3D STMMAC_FLAG_TSO_EN;
> @@ -817,8 +924,33 @@ static int qcom_ethqos_probe(struct platform_device =
*pdev)
>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
> =20
> +static const struct ethqos_emac_por emac_nord_por[] =3D {
> +	{ .offset =3D RGMII_IO_MACRO_CONFIG,    .value =3D 0x00C04D03 },
> +	{ .offset =3D SDCC_HC_REG_DLL_CONFIG,   .value =3D 0x2004642C },
> +	{ .offset =3D RGMII_IO_MACRO_CONFIG2,   .value =3D 0x00222060 },
> +	{ .offset =3D RGMII_IO_MACRO_SCRATCH_2, .value =3D 0x4c },
> +};
> +
> +static const struct ethqos_emac_driver_data emac_nord_data =3D {
> +	.rgmii_por =3D emac_nord_por,
> +	.num_rgmii_por =3D ARRAY_SIZE(emac_nord_por),
> +	.dma_addr_width =3D 40,
> +	.link_clk_name =3D "phyaux",
> +	.core_type =3D DWMAC_CORE_25GMAC,
> +	.set_sgmii_loopback =3D qcom_ethqos_set_sgmii_loopback_nord,
> +	.dwxgmac_addrs =3D {
> +		.dma_even_chan_base =3D 0x00008500,
> +		.dma_odd_chan_base  =3D 0x00008580,
> +		.dma_chan_offset    =3D 0x00001000,
> +		.mtl_chan_base      =3D 0x00008000,
> +		.mtl_chan_offset    =3D 0x00001000,
> +		.timestamp_base     =3D 0x00007000,
> +	},
> +};

I would move emac_nord_por and emac_nord_data definitions close to the other
ones. I guess the code is more readable.

Regards,
Lorenzo

> +
>  static const struct of_device_id qcom_ethqos_match[] =3D {
> -	{ .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_v2_3_0_data},
> +	{ .compatible =3D "qcom,nord-ethqos",    .data =3D &emac_nord_data },
> +	{ .compatible =3D "qcom,qcs404-ethqos",  .data =3D &emac_v2_3_0_data },
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
>  	{ .compatible =3D "qcom,sm8150-ethqos", .data =3D &emac_v2_1_0_data},
>=20
> --=20
> 2.34.1
>=20

--evnRWEoWu//8hjkd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZw8QAKCRA6cBh0uS2t
rBGbAQDENisIMPUdsKTzTz4SkbAKvt9/BoLBSEcXvlbQZiNJKAEArbPRlzxkI0eh
8i6aeVcDVxIMmZO77bkUSq01p5UYrg8=
=PoKU
-----END PGP SIGNATURE-----

--evnRWEoWu//8hjkd--
