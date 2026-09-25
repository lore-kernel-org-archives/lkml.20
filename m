Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461A497B88
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332637; cv=none; b=UqDH8O2APW8X1V0gJdBoN70oek5Fh4BaQrslLRPpaUPavCY0KLX3jVrYjF6YD7gVIzLFzqgi0SSkS+xkvJb2kzq1F5YCB/e9CutKbIqr5nD506WKZx3LxUjVxm1lU+FkemYYuv0GSocw4xf9gWzENHFHcvsk9fQHBm+7ftLpUC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332637; c=relaxed/simple;
	bh=+nUN6rz6zzeX1HgQdsA2louWR2cCdGehoJ2jFGP13JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2CWjRVKyAbeE5BuY4PiZmazhTq5V0axs5E0jn9TlV0Zw0VHQNg8lsz1qXczwf2U/CDEGVFuke+bNLelQ8QDnyzHNX182Vw53eeh18bnpm+XJTCJBxc4KTCi1bdEYX0P8DK4c0t+qXAvaCOV2M5hedLbgCZrENz2Dqb6coM6pzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9lG1xZx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XJA9KsIG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9lG1xZx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XJA9KsIG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JPC53628311
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dc2b3E2dU/PKCiTvrUVIT4Jv
	Egyr5BpHbH25kJGzFm4=; b=P9lG1xZxSB3Ijc1XZQYp/LQOQ3W2Ia8/e0e95mf8
	7q05Owzr7wbi94CZiKaOiieiMHEupmEL3RZXt4EVkRng2Ag868gpiusquMeXI+8f
	XNV453o7Alrt+BsIDS9BrL64pQigfcNqP6OfbSS9QuvqGCeCjq4q2/kfqfJ7sCYz
	lSYL798rceJnSWjIXIfE65x9nCXlKQ35AQo/uvMDGveaQg/Qj7STDYWFG3uHUMCu
	fVN5OTC+fOOgNRWtsmJqKwuSbIHKyOm7VPY6z5MZAwJDCuDMqI27LOgpBKnDKBml
	N7TBL7nh4ikEz2aZmAomlxTdlQ/+q32i7qT2WCS6ib2r1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq38yap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:37:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso205509385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790332634; x=1790937434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dc2b3E2dU/PKCiTvrUVIT4JvEgyr5BpHbH25kJGzFm4=;
        b=XJA9KsIG2pEjtc+f+EzD+9zcShumsQX0xONr6qx3VNph05LgPaiBylk+OJRPNOVBvv
         Q0zjS2qV3fb5jMs8zVps6k4wrbmvbbFNUYjxtbHI+eUZQKvSqkJqZ+d7/F+fsZdRlRUH
         y4PPzwYOkCMK16QsVnvmteIGXE0v4x4AmbzVNIXb3BahLIbQVxXPIkSPzNqWKj6nFMnT
         XcsMIxSg8XPTqeazCSZTUzOGA/oPIRUhEvNEVVIiTxr2URQ8U1lpFWnQeeb+P6V6xRqr
         JMfU5fqQo+K6FKIUYunzzAfFMMss16r/9yPYxsjQUhKRArTQmn96eET5Sbe8uYANPacq
         74wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332634; x=1790937434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc2b3E2dU/PKCiTvrUVIT4JvEgyr5BpHbH25kJGzFm4=;
        b=WwMWt/Ubd2Q0ez5SU5/qv4u2ANuwNPt4RD78j0U1+k+aUTTsWBxUkEQGQMegNhkcY3
         AwYOR9BEEWLS4tUNZSCkzNw5iaRaPv0BR3q2w72Q9yCv5Pw1KZRNFZPBL64JU1bPz3Cx
         +8QK1X3iF5bX07mgzOH4Nbc5RkeoES1XVY64uDltPX2nZX7bz5ZcwXjkgzr0cCnLOPMS
         /TcysAOA42jMJJjYYDo/uCoEw06xXSjC8OKC3Agg9Hv4mspaGEGCwFP0dINzIeIHygn/
         iFIV/rU3+bux4Z9HIiBqOGg32Nod09ThKqApyD1xt6S9HP4vTXl/jPK5SwQpW/tiY9Wt
         57lg==
X-Forwarded-Encrypted: i=1; AKwUvByxERudfoRp1aQBocMuOHNxIWTVrVMGsJZK04dtLrtE6llgigBedtIFBQOlaR0OOO+g0jM7RVrfXprGn7I=@vger.kernel.org
X-Gm-Message-State: AFuF++lw0vykday4Koh1++Gs1BW4TuVDzw7E/ZHdynaF1vJsxXC/b6Qo
	840CLTF5w0p/cMAAES5yMIfkVJo1NIEXyp2GzCWWxnW632tgxoQMiZbv+c7Xho6BszcA1rCTyZa
	+9FZdAtIxwKgoIzPOBxShzApo7kMOHwWTfntZZRTiStzEozdrZX8SffRkiY3ySfbc5f8=
X-Gm-Gg: AYBFou0yU48D6Io3xmgQXPn0gX+yI9wdEy9gdUKi4U/0Hfo1ioNmfVQK+FYZH7f6vTQ
	DaozxcLEeO6pO4usezlRJZBgY+EQ04KmeMG9TlxNbMg0LLpJPNCChrVuQxU8u6XDtTPUWEkcoWu
	EEpsr62BjE2luhK55g47lqmIJv5PXyqJN5v3KhXp/L/G0SdP5sGcvz62lxV/BeQXoOl71VCZS5p
	xbIDmNmYBkw/JGwbjGMgR/3IdVxP4UyziXG8YEXzMePe1cQBu/fMNaka2dY6VmIFBz511oy7kTV
	Gt51NdIhs6+4Irv0T0xjvT9qFhHndBLKi3hAQ0W0+UlSJbb7grWqCyTFW0vwq9HntBhAeiCfNXR
	e4WA2R51ikmZJEA==
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c43cfc87emr347683985a.19.1790332633388;
        Fri, 25 Sep 2026 03:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c43cfc87emr347677285a.19.1790332632792;
        Fri, 25 Sep 2026 03:37:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a2acb4dsm6202787f8f.0.2026.09.25.03.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:37:11 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:37:10 +0200
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
Subject: Re: [PATCH RFC net-next 4/9] net: pcs: xpcs: add Qualcomm Nord
 platform support
Message-ID: <arZO1niyhIEnAv5J@lore-desk>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ySQnkYGEMas/aZSk"
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MiBTYWx0ZWRfX9fNCvsHAJxHP
 UuhLwrLndyyuJzcZHWkP7ayJKFQgU8NGnYKskSNXKp6PsX6H/rnxjCBDomL8AcfrqkIi+GnMTRT
 ByFSkamS/6ZtMcry/Ude54gfN4W9pZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MiBTYWx0ZWRfX+CL+D6BKoVtQ
 wwTXDOeepBPxRSpPC/oxAvq91j/m9NT0N5S7BybLzGZzjsNuD4D7GKMKhq18Ulln/r8+6AacuQ4
 Cujoq5Ms0G2zuqketW23Xv2yINBoKxVNxAKKs3eQskiUViMK1VJtGTrG86RiAcpWrJ45jbyi6Ck
 7m5VmYXh4msz07M7w7UQKQOWYA+2HCCvyXQV2qbEgoueI3B95I5ZNBE175vlJkkNXNjnXEZ/pBE
 YaQOdzjgqeSapkB1EFlKjllXIGMXmmUOH8Sn2DJLa19fu9Sw/oOoYgh4GPoWQAEamIBk52xe3hh
 jrJu5ldjmM0c3v6KWHS6hFubt6AzeawhRijFGieZ9zs1l/jLmOceDP+1tM56JBJZ53b2Ksq8zFi
 Q7YuZGIeUOvqfkNAMHhoNowqrP8rk4HHBn/4btVXjVIjYCLO8cXWuYzj1IiupXC7EQI+MkKqGdI
 r4CvHUIctBa6jNO0TtQ==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab64eda cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TBIoFk-jyhqgT34sUlAA:9 a=CjuIK1q_8ugA:10 a=6T2aJRpNhVgXhit-X0gA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BrYWxiRR7hXvwV1cUPrLMjtgaGC9buSb
X-Proofpoint-ORIG-GUID: BrYWxiRR7hXvwV1cUPrLMjtgaGC9buSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250042

--ySQnkYGEMas/aZSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Qualcomm Nord exposes the DesignWare XPCS register blocks through
> separate direct-MMIO windows instead of the standard contiguous
> MMD/register layout. Add accessors that translate MMD accesses to the
> Nord windows:
>=20
>   MMD 3 (PCS), standard registers: SR_XS at 0x0000
>   MMD 3 (PCS), vendor registers:   VR_XS at 0x2000
>   MMD 1 (PMA/PMD):                  SR_PMA at 0x3000
>   MMD 31 (VEND2), standard regs:    SR_MII at 0x4000
>   MMD 31 (VEND2), vendor registers: VR_MII at 0x5000
>=20
> Each register uses a 32-bit MMIO stride. The vendor bit is removed from
> the register index before calculating a vendor-window offset.
>=20
> Select these accessors using the Nord synthetic XPCS ID, allow its
> smaller direct-MMIO resource, and add the Nord USXGMII Clause 37
> compatibility.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  drivers/net/pcs/Makefile        |  3 +-
>  drivers/net/pcs/pcs-xpcs-plat.c | 17 +++++++-
>  drivers/net/pcs/pcs-xpcs-qcom.c | 86 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/net/pcs/pcs-xpcs-qcom.h | 16 ++++++++
>  drivers/net/pcs/pcs-xpcs.c      | 13 +++++++
>  include/linux/pcs/pcs-xpcs.h    |  1 +
>  6 files changed, 134 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 4f7920618b90051e839a74a7101aaaf055a77f74..3d7cf1a5cd0783078edcefc6d=
fec626af469495d 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -2,7 +2,8 @@
>  # Makefile for Linux PCS drivers
> =20
>  pcs_xpcs-$(CONFIG_PCS_XPCS)	:=3D pcs-xpcs.o pcs-xpcs-plat.o \
> -				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
> +				   pcs-xpcs-nxp.o pcs-xpcs-qcom.o \
> +				   pcs-xpcs-wx.o
> =20
>  obj-$(CONFIG_PCS_XPCS)		+=3D pcs_xpcs.o
>  obj-$(CONFIG_PCS_LYNX)		+=3D pcs-lynx.o
> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-p=
lat.c
> index e78a233fb198d940951064a71e8597c6c666bc9d..e013a5253a22651220e62352d=
03faabc3a3c3658 100644
> --- a/drivers/net/pcs/pcs-xpcs-plat.c
> +++ b/drivers/net/pcs/pcs-xpcs-plat.c
> @@ -20,6 +20,7 @@
>  #include <linux/sizes.h>
> =20
>  #include "pcs-xpcs.h"
> +#include "pcs-xpcs-qcom.h"
> =20
>  /* Page select register for the indirect MMIO CSRs access */
>  #define DW_VR_CSR_VIEWPORT		0xff
> @@ -239,8 +240,14 @@ static int xpcs_mmio_write_c45(struct mii_bus *bus, =
int addr, int dev,
>  		return xpcs_mmio_write_reg_direct(pxpcs, dev, reg, val);
>  }
> =20
> +static const struct dw_xpcs_plat_ops xpcs_qcom_ops =3D {
> +	.reg_read =3D xpcs_qcom_reg_read,
> +	.reg_write =3D xpcs_qcom_reg_write,
> +};
> +
>  static struct dw_xpcs_plat *xpcs_plat_create_data(struct platform_device=
 *pdev)
>  {
> +	const struct dw_xpcs_info *info;
>  	struct dw_xpcs_plat *pxpcs;
> =20
>  	pxpcs =3D devm_kzalloc(&pdev->dev, sizeof(*pxpcs), GFP_KERNEL);
> @@ -248,6 +255,12 @@ static struct dw_xpcs_plat *xpcs_plat_create_data(st=
ruct platform_device *pdev)
>  		return ERR_PTR(-ENOMEM);
> =20
>  	pxpcs->pdev =3D pdev;
> +	info =3D device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (info->pcs =3D=3D QCOM_NORD_XPCS_ID)
> +		pxpcs->ops =3D &xpcs_qcom_ops;
> =20
>  	dev_set_drvdata(&pdev->dev, pxpcs);
> =20
> @@ -285,7 +298,7 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *px=
pcs)
>  	else
>  		spc_size =3D pxpcs->reg_width * SZ_2M;
> =20
> -	if (resource_size(res) < spc_size) {
> +	if (!pxpcs->ops && resource_size(res) < spc_size) {
>  		dev_err(dev, "Invalid reg-space size\n");
>  		return -EINVAL;
>  	}
> @@ -452,8 +465,10 @@ DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_3g, DW_XPCS_ID_NA=
TIVE, DW_XPCS_PMA_GEN4_3G_ID
>  DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_6g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GE=
N4_6G_ID);
>  DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_10g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_G=
EN5_10G_ID);
>  DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_12g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_G=
EN5_12G_ID);
> +DW_XPCS_INFO_DECLARE(xpcs_qcom_nord, QCOM_NORD_XPCS_ID, DW_XPCS_PMA_ID_N=
ATIVE);
> =20
>  static const struct of_device_id xpcs_of_ids[] =3D {
> +	{ .compatible =3D "qcom,nord-dw-xpcs", .data =3D &xpcs_qcom_nord },
>  	{ .compatible =3D "snps,dw-xpcs", .data =3D &xpcs_generic },
>  	{ .compatible =3D "snps,dw-xpcs-gen1-3g", .data =3D &xpcs_pma_gen1_3g },
>  	{ .compatible =3D "snps,dw-xpcs-gen2-3g", .data =3D &xpcs_pma_gen2_3g },
> diff --git a/drivers/net/pcs/pcs-xpcs-qcom.c b/drivers/net/pcs/pcs-xpcs-q=
com.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..63c95c951454819b62eb3fd00=
abcc6b529e2004b
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-qcom.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm DesignWare XPCS platform helpers
> + *
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/mdio.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "pcs-xpcs.h"
> +#include "pcs-xpcs-qcom.h"
> +
> +/* Qualcomm Nord direct MMIO XPCS windows. */
> +#define QCOM_XPCS_SR_XS_BASE		0x0000
> +#define QCOM_XPCS_VR_XS_BASE		0x2000
> +#define QCOM_XPCS_SR_PMA_BASE		0x3000
> +#define QCOM_XPCS_SR_MII_BASE		0x4000
> +#define QCOM_XPCS_VR_MII_BASE		0x5000
> +
> +static int xpcs_qcom_reg_offset(int dev, int reg)
> +{
> +	switch (dev) {
> +	case MDIO_MMD_PCS:
> +		if (reg & DW_VENDOR)
> +			return QCOM_XPCS_VR_XS_BASE +
> +			       ((reg & ~DW_VENDOR) << 2);
> +
> +		return QCOM_XPCS_SR_XS_BASE + (reg << 2);
> +
> +	case MDIO_MMD_PMAPMD:
> +		return QCOM_XPCS_SR_PMA_BASE + (reg << 2);
> +
> +	case MDIO_MMD_VEND2:
> +		if (reg >=3D DW_VENDOR)
> +			return QCOM_XPCS_VR_MII_BASE +
> +			       ((reg - DW_VENDOR) << 2);
> +
> +		return QCOM_XPCS_SR_MII_BASE + (reg << 2);
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

This seems to be the real difference with respect to the
xpcs_mmio_read_reg_direct()/xpcs_mmio_write_reg_direct(), right?
Maybe a different approach (simpler but probably less flexible is to make
xpcs_mmio_addr_format() SoC dependent. What do you think?

> +
> +int xpcs_qcom_reg_read(struct platform_device *pdev, void __iomem *reg_b=
ase,
> +		       int dev, int reg)
> +{
> +	int offset, ret;
> +
> +	offset =3D xpcs_qcom_reg_offset(dev, reg);
> +	if (offset < 0)
> +		return offset;
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D readl(reg_base + offset) & 0xffff;
> +
> +	pm_runtime_put(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +int xpcs_qcom_reg_write(struct platform_device *pdev, void __iomem *reg_=
base,
> +			int dev, int reg, u16 val)
> +{
> +	int offset, ret;
> +
> +	offset =3D xpcs_qcom_reg_offset(dev, reg);
> +	if (offset < 0)
> +		return offset;
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	writel(val, reg_base + offset);
> +
> +	pm_runtime_put(&pdev->dev);
> +
> +	return 0;
> +}
> diff --git a/drivers/net/pcs/pcs-xpcs-qcom.h b/drivers/net/pcs/pcs-xpcs-q=
com.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1084f6a10a96baa8ba0d192e=
e64cdaed90da125
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-qcom.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __PCS_XPCS_QCOM_H
> +#define __PCS_XPCS_QCOM_H
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +
> +struct platform_device;
> +
> +int xpcs_qcom_reg_read(struct platform_device *pdev, void __iomem *reg_b=
ase,
> +		       int dev, int reg);
> +int xpcs_qcom_reg_write(struct platform_device *pdev, void __iomem *reg_=
base,
> +			int dev, int reg, u16 val);
> +
> +#endif /* __PCS_XPCS_QCOM_H */
> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 7f5c7a275630f2b064e4b9abdd6c3619e9346cec..1f556b4f7c44f06f24a2f7247=
34d3a7d71424de3 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -1571,6 +1571,15 @@ static const struct dw_xpcs_compat nxp_sja1110_xpc=
s_compat[] =3D {
>  	}
>  };
> =20
> +static const struct dw_xpcs_compat qcom_nord_xpcs_compat[] =3D {
> +	{
> +		.interface =3D PHY_INTERFACE_MODE_USXGMII,
> +		.supported =3D xpcs_usxgmii_features,
> +		.an_mode =3D DW_AN_C37_USXGMII,
> +	}, {
> +	}
> +};
> +
>  static const struct dw_xpcs_desc xpcs_desc_list[] =3D {
>  	{
>  		.id =3D DW_XPCS_ID,
> @@ -1584,6 +1593,10 @@ static const struct dw_xpcs_desc xpcs_desc_list[] =
=3D {
>  		.id =3D NXP_SJA1110_XPCS_ID,
>  		.mask =3D DW_XPCS_ID_MASK,
>  		.compat =3D nxp_sja1110_xpcs_compat,
> +	}, {
> +		.id =3D QCOM_NORD_XPCS_ID,
> +		.mask =3D DW_XPCS_ID_MASK,
> +		.compat =3D qcom_nord_xpcs_compat,
>  	},

I guess this part is supposed to be part of patch 2/9, right?

Regards,
Lorenzo

>  };
> =20
> diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
> index 4ea995b70150e33e1e1a47cc7aa324c53742fbdc..0f69e14b2a4c8d17b59a570de=
bd14a77ab040182 100644
> --- a/include/linux/pcs/pcs-xpcs.h
> +++ b/include/linux/pcs/pcs-xpcs.h
> @@ -26,6 +26,7 @@ enum dw_xpcs_pcs_id {
>  	DW_XPCS_ID_NATIVE =3D 0,
>  	NXP_SJA1105_XPCS_ID =3D 0x00000010,
>  	NXP_SJA1110_XPCS_ID =3D 0x00000020,
> +	QCOM_NORD_XPCS_ID =3D 0x00000030,
>  	DW_XPCS_ID =3D 0x7996ced0,
>  	DW_XPCS_ID_MASK =3D 0xffffffff,
>  };
>=20
> --=20
> 2.34.1
>=20

--ySQnkYGEMas/aZSk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZO1gAKCRA6cBh0uS2t
rBWpAQCWF+cS4RIEIgUz5tLtSpKvBFgHeyoBfhSvBs9EIH2WlQEA35iDZn/bftHZ
vU+Kq52oiCfQCvVfHwNGyP7zLB+vcgw=
=5a1d
-----END PGP SIGNATURE-----

--ySQnkYGEMas/aZSk--
