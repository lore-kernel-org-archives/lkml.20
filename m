Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D24A6CF2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344812; cv=none; b=X+X591huwaVRoMs/7KwKcIt24ZxchWb8QbmMzFWEWZf6LHPLBkmdegOsys+KmXBwG8t5tXewrREhkBo3MZGvbkkl010a049mcdDOIRFQUL8Zx8tsxwyITMWbf1yiFogAIqo/72qQYEej6m184MMsacBg0j9VffVKMvYn9A6ijIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344812; c=relaxed/simple;
	bh=yQ/Dk8aXF4aD6P9wkVGBzXmsmAUMXUtGrK1E3NP2qmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijGmIZ6knx7Eb00/Ns2dqrBLyRyqWG4RBpUdmDgaT5MCrLEcs486ZtzkFtvVXSXCaiQS5d037rvVva7+IKvQEcs6xReJnAQhZ76WG9wOHP3EMfsZZqgNku0St5hNYaCyXo2Aj1f4YNvHO/P/Wkzqwk/SaTJmTi22CKnTao3gD0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQiWJRg5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+UwspYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQiWJRg5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+UwspYX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDuZJ5600490
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0vRdpOZV+OQBJFXZBPtwbCIB
	39x30DrAZNUMd3L17Fk=; b=lQiWJRg5X4lfJXyrFkZHB+0VnkSuDRjD2f+fF3hk
	9zL0SR/6lM3EgGVuJliNke9KXm2cSeXl38QeFOAaKtQb8R7BmyNu53FrmdF0HTRx
	RLjH5+jNnhYuggEzcep9PkeketTxp7cgfBtwtmiQqlXFgbIOhSPxMfMlyjNdsxna
	SlQebidhiDaO454qUfBHmmODgTx6/7NfwhwSy/sUuuLM7A72B338Z3uDk0GThXg8
	TsVe5EAh+cr0EPBM30tBJ2PFhE5jnPvwMbEY7ex6oaJEJPKQi7IeY4CICkzPSTnC
	bpCSBXcdt9gkzNofV/v3c4ZOfahZ8B58bBKS8KYC1A6rvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsjw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:00:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so173510385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790344802; x=1790949602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0vRdpOZV+OQBJFXZBPtwbCIB39x30DrAZNUMd3L17Fk=;
        b=F+UwspYXx35zAT+0WXN1QJoS0slXkxPQdbIWyQxGM7m1vsC/o4QWfaf1K2ZWMoqq7Z
         degTAYZVFwByzTLwcr6dUwBak7IOsVVyTDRCaV2sb1dgI69lGQtIKqVPE4zbyyaeu4fx
         GOXXMmuBNPbouhVnwB38OwRzgK7syZwEEdnPHEnhCzekDR6Fmh4cTYhpvtyQC8jqzfdu
         92qI/UHMp0k0COMOu/HYQoXfX3Gz2SlUHw21mCUAfD4V6tgx0nW1X1XbIssf8i0VE2Rx
         ahOjQscrc+WZ1pRCiEzlaf1z22bQS7JvkY2mZbYanJFupfxasgY6Zh7R8hKneOZIf09E
         Pj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344802; x=1790949602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vRdpOZV+OQBJFXZBPtwbCIB39x30DrAZNUMd3L17Fk=;
        b=C4VqhqMz49qircwpLW1JQc6zIO78BMq9yN/CDB3v89IpR8RS2ZeEwCdemDv1iUI8aq
         CIpmj0h/UK7e82vHsC/+3lO/ygsGV6+LBJ0ivUJmvr0qL7sfAxcylfN3EL7NYtlMVhZT
         x68pk20IrFe9C3hSn+AzhHroHj71fpennDNq1PjBBG3vhFT9bSkoPYdknNIuhZsuSyJT
         Zqoy9w7HLZrkt13qzNSmfj81RJLjvxPHAY8QWkm2tcRr6IqG5Gdf7hVfkYyZdAi8Uqv2
         07DLRqW1LVPsFin2ggEXtl1O3bvydbkaHJo1cc2Z9KZPEyBYbU/xswzr2haF55BIlDZf
         T22w==
X-Forwarded-Encrypted: i=1; AKwUvBxrTXQ3G6txxsJg+LLlmHE10XpgOpQ/yCMVW4qI5G78PWf1T8llEpQ99z2KHg8VJpeddEqUEwI94byf8T8=@vger.kernel.org
X-Gm-Message-State: AFuF++kT8ZCfLfMVSlLrivwAzgjuab81jW9vLOTzNn2XGQt4a/stR991
	ckqSQEsX7MsrjDEd6A0426hSQiJEM9Q4t4Q7Dbs54jZfKcUDfMbE7NYmkogBudgkkdGB/e7KjsA
	uSJG0QIPW4q+EMBsoPjIf39MWMXhnlp3f8K1dJtN3/wPgIqSoFbMhv3RhUhRuFFswjGI=
X-Gm-Gg: AYBFou3ICB+O9pgRjJkjWF6MB5aGv2oXcf5ZEddf8pSCW3YWqaXwuy+Dy5btyYCj9nh
	JBYpRn8gMx5gsDn0luOiJzBnWXBwRVaA2dRdLf4PhnJqWyKTuQHUeuk9CqAA4w6lz0c7U3RI5Jq
	XFhkxtqutjRAXbi+oFi1LPr80J2Y39JWB9CchTDe+OPpL3MlbycxwdsWEAdEYFkULQpGJBTfCQG
	q4O6s4Ifz3DhlXlzCk0DAEdrN8WIoHZkQSQbip3NB+b7kDZ++SKi4hGPBJqOf3hNc2ZvxceMei7
	ybkVSkUyGKUPP/waQpXAF3yQQ53l6aPnngGG6py3dz8V+mxEu8EAG2rQswkuIEZ5hWq3z9eESKn
	j3b9bWTkV8NJ09g==
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr476357885a.15.1790344801503;
        Fri, 25 Sep 2026 07:00:01 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr476351785a.15.1790344800860;
        Fri, 25 Sep 2026 07:00:00 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff0f1f2e3sm100590805e9.0.2026.09.25.06.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:59:59 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:59:58 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] phy: qcom: sgmii-eth: add Nord USXGMII support
Message-ID: <arZ-XuvT4k7WEEXy@lore-desk>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2XDQpEu8xY3k8Vcu"
Content-Disposition: inline
In-Reply-To: <20260923-nord_ethernet_serdes-v1-3-f8ac1c487882@oss.qualcomm.com>
X-Proofpoint-GUID: YYvF9g6zcwgAPm4qYki0p1ZytPagaH9r
X-Proofpoint-ORIG-GUID: YYvF9g6zcwgAPm4qYki0p1ZytPagaH9r
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab67e62 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BkA4KBjybXbzwsDY79IA:9 a=CjuIK1q_8ugA:10 a=PwvmhATc1fTBx6D1HasA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NSBTYWx0ZWRfX0fFshzegSYrR
 Rquc9u7+14WdPQr04mTgcc2pmUWCRS/r0OnHAfiyjfKusQEEgScVConS+hfDwJCE0zR5iEsFYw1
 zJgdKAxptXZCjqenhXQyHC/dNtgIuW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NSBTYWx0ZWRfXxxl9rXXfP1P9
 fktgBVbdx7vGIai9KTo4mN7HyM1ooLmJgxK6waY6q2pXfpWGAdQY53fBC+h4uPcRhvvNGXTqJni
 5iaCxGa6VFKqZPbgiDhFO1ZbbFab/H21pDSDhyNhmbr47t5Oykz7s9cPpGr6XZgB18c3xm3MLlV
 taSzKPnO0e0Ski5kVoefs32AdwGjnEh4qXhRSJUscJ1uYm2Okvf39+Uc/FIRh7YOfdzcIaNu1P9
 hvSgrVXarUg+tmZzh//sa+UHlXE3Dygkx5pfg7PfNgL/rZPvxtW08LlRxxaN2jyTIJ6SJiJqOEU
 T+mTSF8Kk4xUQmt9cnHfgeW3kpDbeG0xK1iEytE/rPwqHHAs/En4KOyYCi3eC0cbxSTPf7QcecA
 QLPu3rzBWqB2E8EfVSZi/c5MzG/CTkyUPyi/SMfodNPQgKSJ7Ldt8ACWpo2ABTucTQRXVfYZPDc
 6r1Rtm6iRP9u6olAHWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250055

--2XDQpEu8xY3k8Vcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Nord uses a QMP v7 SerDes block which is an updated version of the
> SGMII SerDes PHY IP.
>=20
> The SGMII SerDes PHY supports multiple operating modes by programming
> different SerDes line rates. The driver currently handles SGMII and
> 2500BASE-X configurations only.
>=20
> Add support for configuring the SerDes to operate at 10.3125 Gbaud,
> enabling both USXGMII and 10GBASE-R PHY interface modes. Finally, add a
> driver compatible for Nord.
>=20
> Select USXGMII as the initial interface mode for Nord. phy_power_on()
> can run before the consumer calls set_mode(), so this ensures that the
> first calibration selects the 10.3125 Gbaud programming sequence.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

just trivial nits inline.
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h      |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h |   2 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    |   9 ++
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 166 +++++++++++++++=
+++++-
>  4 files changed, 177 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h b/drivers/phy/=
qualcomm/phy-qcom-qmp-pcs-sgmii.h
> index 4d8c962f5e0f52974f3edd5d1acdd8da535de200..67ab2fe085de3d90520cfc43c=
c0ac7abaab1f21d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
> @@ -10,11 +10,16 @@
>  #define QPHY_PCS_POWER_DOWN_CONTROL			0x004
>  #define QPHY_PCS_SW_RESET				0x008
>  #define QPHY_PCS_LINE_RESET_TIME			0x00c
> +#define QPHY_PCS_RETIME_BUFFER_EN			0x018
>  #define QPHY_PCS_TX_LARGE_AMP_DRV_LVL			0x020
> +#define QPHY_PCS_TX_LARGE_AMP_POST_EMP_LVL		0x024
>  #define QPHY_PCS_TX_SMALL_AMP_DRV_LVL			0x028
> +#define QPHY_PCS_TX_SMALL_AMP_POST_EMP_LVL		0x02c
> +#define QPHY_PCS_RX_SIGDET_CTRL2				0x08c

nit: can you please fix the alignement here?

>  #define QPHY_PCS_PCS_READY_STATUS			0x094
>  #define QPHY_PCS_TX_MID_TERM_CTRL1			0x0d8
>  #define QPHY_PCS_TX_MID_TERM_CTRL2			0x0dc
> +#define QPHY_PCS_SGMII_MISC_CTRL7			0x114
>  #define QPHY_PCS_SGMII_MISC_CTRL8			0x118
> =20
>  #endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h b/drivers=
/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
> index 7430f49214779855df1cf40acac96440957f9e6d..e8b4a26b361adab6e2b0bd3c9=
1e719f84d1ffbc1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v7.h
> @@ -58,6 +58,7 @@
>  #define QSERDES_V7_COM_CLK_ENABLE1				0xe0
>  #define QSERDES_V7_COM_SYS_CLK_CTRL				0xe4
>  #define QSERDES_V7_COM_SYSCLK_BUF_ENABLE			0xe8
> +#define QSERDES_V7_COM_PLL_EN					0xec
>  #define QSERDES_V7_COM_PLL_IVCO					0xf4
>  #define QSERDES_V7_COM_PLL_IVCO_MODE1				0xf8
>  #define QSERDES_V7_COM_SYSCLK_EN_SEL				0x110
> @@ -75,6 +76,7 @@
>  #define QSERDES_V7_COM_CMN_MISC_1				0x184
>  #define QSERDES_V7_COM_CMN_MODE					0x188
>  #define QSERDES_V7_COM_PLL_VCO_DC_LEVEL_CTRL			0x198
> +#define QSERDES_V7_COM_BIN_VCOCAL_HSCLK_SEL_1			0x19c
>  #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_1			0x1a4
>  #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_2			0x1a8
>  #define QSERDES_V7_COM_AUTO_GAIN_ADJ_CTRL_3			0x1ac
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h b/driver=
s/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> index 6ab943ff57ff666e4f23f4ad0b4eff211c6dbfd0..0c38d62284e4d0e64a27fb82c=
468f47aee3760bb 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h
> @@ -7,9 +7,11 @@
>  #define QCOM_PHY_QMP_QSERDES_TXRX_V7_H_
> =20
>  #define QSERDES_V7_TX_CLKBUF_ENABLE				0x08
> +#define QSERDES_V7_TX_TX_EMP_POST1_LVL				0x0c
>  #define QSERDES_V7_TX_RESET_TSYNC_EN				0x1c
>  #define QSERDES_V7_TX_PRE_STALL_LDO_BOOST_EN			0x20
>  #define QSERDES_V7_TX_TX_BAND					0x24
> +#define QSERDES_V7_TX_SLEW_CNTL					0x28
>  #define QSERDES_V7_TX_INTERFACE_SELECT				0x2c
>  #define QSERDES_V7_TX_RES_CODE_LANE_TX				0x34
>  #define QSERDES_V7_TX_RES_CODE_LANE_RX				0x38
> @@ -35,26 +37,32 @@
>  #define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW			0x3c
>  #define QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIGH			0x40
>  #define QSERDES_V7_RX_UCDR_PI_CONTROLS				0x44
> +#define QSERDES_V7_RX_UCDR_PI_CTRL2				0x48
>  #define QSERDES_V7_RX_UCDR_SB2_THRESH1				0x4c
>  #define QSERDES_V7_RX_UCDR_SB2_THRESH2				0x50
>  #define QSERDES_V7_RX_UCDR_SB2_GAIN1				0x54
>  #define QSERDES_V7_RX_UCDR_SB2_GAIN2				0x58
>  #define QSERDES_V7_RX_AUX_DATA_TCOARSE_TFINE			0x60
> +#define QSERDES_V7_RX_RX_TERM_BW					0x80

nit: can you please fix the alignement here?

>  #define QSERDES_V7_RX_TX_ADAPT_PRE_THRESH1			0xc4
>  #define QSERDES_V7_RX_TX_ADAPT_PRE_THRESH2			0xc8
>  #define QSERDES_V7_RX_TX_ADAPT_POST_THRESH			0xcc
>  #define QSERDES_V7_RX_VGA_CAL_CNTRL1				0xd4
>  #define QSERDES_V7_RX_VGA_CAL_CNTRL2				0xd8
>  #define QSERDES_V7_RX_GM_CAL					0xdc
> +#define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL1			0xe8
>  #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2			0xec
>  #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3			0xf0
>  #define QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4			0xf4
>  #define QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW			0xf8
>  #define QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH			0xfc
> +#define QSERDES_V7_RX_RX_IDAC_MEASURE_TIME			0x100
>  #define QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x110
> +#define QSERDES_V7_RX_RX_OFFSET_ADAPTOR_CNTRL2			0x114
>  #define QSERDES_V7_RX_SIGDET_ENABLES				0x118
>  #define QSERDES_V7_RX_SIGDET_CNTRL				0x11c
>  #define QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL			0x124
> +#define QSERDES_V7_RX_RX_BAND					0x128
>  #define QSERDES_V7_RX_RX_MODE_00_LOW				0x15c
>  #define QSERDES_V7_RX_RX_MODE_00_HIGH				0x160
>  #define QSERDES_V7_RX_RX_MODE_00_HIGH2				0x164
> @@ -75,6 +83,7 @@
>  #define QSERDES_V7_RX_DCC_CTRL1					0x1a8
>  #define QSERDES_V7_RX_VTH_CODE					0x1b0
>  #define QSERDES_V7_RX_SIGDET_CAL_CTRL1				0x1e4
> +#define QSERDES_V7_RX_SIGDET_CAL_CTRL2_AND_CDR_LOCK_EDGE	0x1e8
>  #define QSERDES_V7_RX_SIGDET_CAL_TRIM				0x1f8
> =20
>  #endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qual=
comm/phy-qcom-sgmii-eth.c
> index 029dafacee7853648ef24afd0d9c4b83a549badf..3c68bfe0ea443ef5cf7f17cea=
d4974862dc04884 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -15,7 +15,9 @@
> =20
>  #include "phy-qcom-qmp-pcs-sgmii.h"
>  #include "phy-qcom-qmp-qserdes-com-v5.h"
> +#include "phy-qcom-qmp-qserdes-com-v7.h"
>  #include "phy-qcom-qmp-qserdes-txrx-v5.h"
> +#include "phy-qcom-qmp-qserdes-txrx-v7.h"
> =20
>  #define QSERDES_QMP_PLL					0x0
>  #define QSERDES_RX					0x600
> @@ -221,6 +223,114 @@ static void qcom_dwmac_sgmii_phy_init_2p5g(struct r=
egmap *regmap)
>  	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
>  }
> =20
> +static void qcom_dwmac_sgmii_phy_init_10g(struct regmap *regmap)
> +{
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_POWER_DOWN_CONTROL, 0x01);
> +
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BG_TIMER, 0x0A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_IVCO, 0x0F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_BIAS_EN_CLK_B=
UFLR_EN, 0x07);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CLK_ENABLE1, 0x0F=
);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CP_CTRL_MODE0, 0x=
08);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_RCTRL_MODE0, =
0x16);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_CCTRL_MODE0, =
0x36);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_INTEGLOOP_GAIN0_M=
ODE0, 0x1F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_INTEGLOOP_GAIN1_M=
ODE0, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_EN, 0x03);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_SYSCLK_EN_SEL, 0x=
1A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_LOCK_CMP1_MODE0, =
0x23);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_LOCK_CMP2_MODE0, =
0x43);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DEC_START_MODE0, =
0x43);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START1_M=
ODE0, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START2_M=
ODE0, 0x38);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_DIV_FRAC_START3_M=
ODE0, 0x02);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE1_MODE0, =
0xE6);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE2_MODE0, =
0x01);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_VCO_TUNE_INITVAL2=
, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_HSCLK_SEL_1, 0x00=
);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_HSCLK_HS_SWITCH_S=
EL_1, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_PLL_CORE_CLK_DIV_=
MODE0, 0x04);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CORE_CLK_EN, 0x30=
);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_CMN_CONFIG_1, 0x1=
6);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_CMP_CO=
DE1_MODE0, 0xD7);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_CMP_CO=
DE2_MODE0, 0x0F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V7_COM_BIN_VCOCAL_HSCLK_=
SEL_1, 0x11);
> +
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_CLKBUF_ENABLE, 0x0D);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TX_BAND, 0x04);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_SLEW_CNTL, 0x08);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RES_CODE_LANE_OFFSET_TX=
, 0x09);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RES_CODE_LANE_OFFSET_RX=
, 0x09);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_1, 0xF5);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_2, 0x06);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_3, 0x3F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_4, 0x3F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_LANE_MODE_5, 0x5F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_RCV_DETECT_LVL_2, 0x12);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TRAN_DRVR_EMP_EN, 0x0F);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V7_TX_TX_EMP_POST1_LVL, 0x2B);
> +
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FO_GAIN, 0x0D);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SO_GAIN, 0x03);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_FO_GAIN, =
0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SO_SATURATION_AND_=
ENABLE, 0x7F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_LOW=
, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_FASTLOCK_COUNT_HIG=
H, 0x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_PI_CONTROLS, 0x81);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_PI_CTRL2, 0x81);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SB2_THRESH1, 0x11);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_UCDR_SB2_THRESH2, 0x22);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_TERM_BW, 0x03);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_VGA_CAL_CNTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_GM_CAL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL1, =
0x04);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL2, =
0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL3, =
0x4A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQU_ADAPTOR_CNTRL4, =
0x5A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_TSETTLE_LOW, 0x=
80);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_TSETTLE_HIGH, 0=
x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_IDAC_MEASURE_TIME, 0=
x20);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_EQ_OFFSET_ADAPTOR_CN=
TRL1, 0x17);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_OFFSET_ADAPTOR_CNTRL=
2, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CNTRL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_DEGLITCH_CNTRL, =
0x1E);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_BAND, 0x18);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_LOW, 0x1F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH, 0xBF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH2, 0xFF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH3, 0xDF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_00_HIGH4, 0xEF);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_LOW, 0xE5);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH3, 0x14);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_01_HIGH4, 0xB6);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_LOW, 0xE0);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH3, 0x3B);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_RX_MODE_10_HIGH4, 0xB7);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_DCC_CTRL1, 0x0C);
> +
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_LINE_RESET_TIME, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_DRV_LVL, 0x1A);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_POST_EMP_LVL, =
0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_POST_EMP_LVL, =
0x0B);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL1, 0x83);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CAL_CTRL1, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V7_RX_SIGDET_CAL_CTRL2_AND_CD=
R_LOCK_EDGE, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_RX_SIGDET_CTRL2, 0xCC);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL7, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL8, 0x14);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_RETIME_BUFFER_EN, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
> +
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
> +}
> +
>  static inline int
>  qcom_dwmac_sgmii_phy_poll_status(struct regmap *regmap, unsigned int reg,
>  				 unsigned int bit)
> @@ -265,6 +375,40 @@ static int qcom_dwmac_sgmii_phy_poll_sgmii_ready(str=
uct device *dev,
>  	return 0;
>  }
> =20
> +static int qcom_dwmac_sgmii_phy_poll_usxgmii_ready(struct device *dev,
> +						     struct regmap *regmap)

nit: can you please fix the alignement here?

> +{
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_QMP_PLL + QSERDES_V7_COM_C_READY_STATUS,
> +					     QSERDES_COM_C_READY)) {
> +		dev_err(dev, "QSERDES_COM_C_READY_STATUS timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
> +					     QSERDES_PCS_READY)) {
> +		dev_err(dev, "PCS_READY timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
> +					     QSERDES_PCS_SGMIIPHY_READY)) {
> +		dev_err(dev, "SGMIIPHY_READY timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (qcom_dwmac_sgmii_phy_poll_status(regmap,
> +					     QSERDES_QMP_PLL + QSERDES_V7_COM_CMN_STATUS,
> +					     QSERDES_COM_C_PLL_LOCKED)) {
> +		dev_err(dev, "PLL Lock Status timed-out");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
>  {
>  	struct qcom_dwmac_sgmii_phy_data *data =3D phy_get_drvdata(phy);
> @@ -275,16 +419,19 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct ph=
y *phy)
>  	case PHY_INTERFACE_MODE_1000BASEX:
>  		/* 1.25Gbps mode */
>  		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
> -		break;
> +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
>  	case PHY_INTERFACE_MODE_2500BASEX:
>  		/* 3.125Gbps mode */
>  		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
> -		break;
> +		return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
> +	case PHY_INTERFACE_MODE_USXGMII:
> +	case PHY_INTERFACE_MODE_10GBASER:
> +		/* 10.3125Gbps mode */
> +		qcom_dwmac_sgmii_phy_init_10g(data->regmap);
> +		return qcom_dwmac_sgmii_phy_poll_usxgmii_ready(dev, data->regmap);
>  	default:
>  		return -EINVAL;
>  	}
> -
> -	return qcom_dwmac_sgmii_phy_poll_sgmii_ready(dev, data->regmap);
>  }
> =20
>  static int qcom_dwmac_sgmii_phy_power_on(struct phy *phy)
> @@ -340,7 +487,9 @@ static int qcom_dwmac_sgmii_phy_validate(struct phy *=
phy, enum phy_mode mode,
> =20
>  	if (submode =3D=3D PHY_INTERFACE_MODE_SGMII ||
>  	    submode =3D=3D PHY_INTERFACE_MODE_1000BASEX ||
> -	    submode =3D=3D PHY_INTERFACE_MODE_2500BASEX)
> +	    submode =3D=3D PHY_INTERFACE_MODE_2500BASEX ||
> +	    submode =3D=3D PHY_INTERFACE_MODE_USXGMII ||
> +	    submode =3D=3D PHY_INTERFACE_MODE_10GBASER)
>  		return 0;
> =20
>  	return -EINVAL;
> @@ -434,12 +583,19 @@ static int qcom_dwmac_sgmii_phy_probe(struct platfo=
rm_device *pdev)
>  	return 0;
>  }
> =20
> +static const struct qcom_dwmac_sgmii_phy_match_data nord_match_data =3D {
> +	.default_interface =3D PHY_INTERFACE_MODE_USXGMII,
> +};
> +
>  static const struct qcom_dwmac_sgmii_phy_match_data sa8775p_match_data =
=3D {
>  	.default_interface =3D PHY_INTERFACE_MODE_SGMII,
>  };
> =20
>  static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] =3D {
>  	{
> +		.compatible =3D "qcom,nord-dwmac-sgmii-phy",
> +		.data =3D &nord_match_data,
> +	}, {
>  		.compatible =3D "qcom,sa8775p-dwmac-sgmii-phy",
>  		.data =3D &sa8775p_match_data,
>  	},
>=20
> --=20
> 2.34.1
>=20

--2XDQpEu8xY3k8Vcu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZ+XgAKCRA6cBh0uS2t
rESSAQCakesvqPhtMa5Q5oa2k/hqwakQfWXzwA3lu8aSnrijgAD/R0yQav8uEmuC
dQ8UMvOKkGP+NqUWTM+NjM6tlsWERwk=
=NCur
-----END PGP SIGNATURE-----

--2XDQpEu8xY3k8Vcu--
