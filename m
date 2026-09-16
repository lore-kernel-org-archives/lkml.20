Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A7E4AA3F0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561091; cv=none; b=ikLU1eBm2p+yD4SNm+Aiw+k37Fkz2VMFaMgSmaHcTbd4m6v/mvywABm4BdVF3b7Dzr4uDwpyZ4/LCpk5dmFcnz+UiCm0DvW3ZvxydHRsScDA/qJfTbnCyBgsS4Rido+SWZEE2bbG2UTjT3i9AhGzM0Madmmx5+6x531VsuuNqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561091; c=relaxed/simple;
	bh=XUlmkcZ5RWVZdPh6nzmGjp1yFPSyzH5dobkGwv2oChw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2nK01mBkmE9zvC+K+gPg9UgdGtrAoVHR4qhpcxXmBSywrvY4AiOD3czFsooVo/QR4IcDPaIlxVpuiC32ZxWmNZHBacSmywtLleRU1sXcLftalTCQIcQ8hYBP4jFeYuC1Qa6ww5M1Z/sY4gDphrBtGw+j8aP77J8J4d7CHabU0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvGe5OLk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgmpHDqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvGe5OLk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgmpHDqV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GBsATJ1963750
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btpq+GMkcN0fP8tlXTzfdclT
	vfX1VTNaQI1C0weG74A=; b=kvGe5OLkoa/Xv2QpWYixqouDqZYE5/tvPF7Mgwxk
	shYz1m2yyUODnAF5mEbiaUWk8vAl9w+g7WmEjP1chk8l2izKak0Hu1ly1pMFk1Jj
	grNqUilAVgf+E5ZVz9BjwCmj7xd3gQQ3ivTQL9UwYzCubEP5nG+RFT5ZfD3m4RKf
	P+K/4GmBxVSTeK6kQ8CMbQzlNGPcHAj7Bx30rfdV2mR73tfv/byCs3emZAhqn/L3
	ru2ub21KN2K9HtJp8jO+pqvLqU6PDW7JGkwB8oFOnIbFTtFDtp7Ac93ip0nD2IU1
	pZq2jCwICPxM7N6eHBeaoydwI8sup2sniV0VS4DMorR2HQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn502r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:18:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso1970981a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561087; x=1790165887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btpq+GMkcN0fP8tlXTzfdclTvfX1VTNaQI1C0weG74A=;
        b=bgmpHDqVIRPRazxMegizZ3D6++KMDVeKn7nTK+LnazoL1sSMzuCcoAsvKdfWwOjCzn
         t5e3TvoRAo3sSxk5z0MTIod/cKSiSPXc7+j9QgKjkeCHCl8W/t2vslgsiIpXX/4bKrcs
         yWKAHMu04Iwg6b7x5BG6YdaxTjJgMO3dUIQo5tlW0t+nF6xV9b86tHtMsxHzxlbQBOKf
         RpE3rrmlEutuu13aFYt3RvKyQ7/HGtcl7kb+OGUXdWJJXU4MVTbO4YpewK+Fcj6lQc3G
         rb1cYtKDiji0C2DF05JgYMwAt+/fmbeR3G39th0liYC2hRyG2Y2+HpT/Z8ODcW+qdxIH
         NiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561087; x=1790165887;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btpq+GMkcN0fP8tlXTzfdclTvfX1VTNaQI1C0weG74A=;
        b=vA87MvPQOBmd9hLjFlhsUXnotP350AQVcu4ysHSR2eC3b7xM6jvs7UGF5TSLZo8gY5
         dantbLb/UM0nXftHQYHiA0L26Wqf8pNLBYPM0sR0wTmVs2HPy3c6DP08LLE7Y5mCH+ou
         7J98k63rr+STm9tXuQVO7d085thduaUL0q2mI1qWBIU4dUOGRblanpnbJLsQWSDYtJX1
         jDg6SGS2GGJ7xsQ9KRNNmEEgRMeELHHEqzGvPnwcfu+UGXWc63yVTRfBlUxtnFn9RbNy
         5qf5q4P/G3GMXYizwJFWfKJJi7/d7y6C+URTtREayGLfZE3LgQ8tFP3Xx5jHdo/SIm9E
         7Szw==
X-Forwarded-Encrypted: i=1; AKwUvBwR9M6+I8FEQr6mTYY8Eg2TCHiwQkxYLTMgqgCeDBtOVyYyXCk5vUALm1xmvVG3B9u8/ikXsTwAJxlccTA=@vger.kernel.org
X-Gm-Message-State: AFuF++lGtJzOkJTpjRIEkby1InjSdwG3yj47wqNa/q+RB0J6B7hImoJa
	LI6O65q5YuWKtgGzDSQ7o+c5ypQLNQiYHCA5Pn5czjb/+k0iYIok7TdHlmDdzYf37L2vUxVLjiJ
	d6E1UID3jawbeEi0LeYmlkP0B7v+VExM7zzlcr3pYU6uiqpgI4v2/qrWCavi98wT49Kw=
X-Gm-Gg: AYBFou2qCrMNL2E2QB0+9XDWvXWql1cHW5DQZtG2sc/IY84tVZA/m65G3TvenDqXOAZ
	DHVJZDijl/EveE4Ccpaz5//n06u1Y7vsv53CILggAHEBxXGs6z2eiD+pQBBHD8TkzVGTULwKXmh
	Y6xIsFuqSyWzDFF5g7ogDrPikDOIadJvL/bR5Y1caZoBf8qScioaWlVMEVvNXXCbiY2ujKJcpzU
	xMUymINMhH6HomfWB3SkpvACvkCGRvSTh3xJuWz9qbHwzX2xTcgTa+5LFJnBXzGbveWiNXOJ0Ut
	6ae4WCcYLle67+reATpKEFIfjaWOkYJ/rjQ966KBEX7yW4c11x2Vk+FNT43NAAF5+oPOXgdsng3
	IWsmc/4odCFndaw==
X-Received: by 2002:a17:90b:254b:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-39e1fb45010mr2698944a91.0.1789561087157;
        Wed, 16 Sep 2026 05:18:07 -0700 (PDT)
X-Received: by 2002:a17:90b:254b:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-39e1fb45010mr2698870a91.0.1789561086513;
        Wed, 16 Sep 2026 05:18:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bc26a65sm4761643a91.13.2026.09.16.05.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:18:05 -0700 (PDT)
Date: Wed, 16 Sep 2026 17:47:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Thomas Karpiniec <tom.karpiniec@outlook.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Choong Yong Liang <yong.liang.choong@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/2] net: stmmac: qcom-ethqos: advertise supported
 SerDes interfaces
Message-ID: <aqqI9wOnradk9d7K@oss.qualcomm.com>
References: <CH3PR11MB8413FCBA598F7FABC04ADCFEE4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
 <CH3PR11MB841353E5708DDD7C5E2EA1D5E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB841353E5708DDD7C5E2EA1D5E4B92@CH3PR11MB8413.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfX6BHFn6zKpNPz
 XLOATXhp44Hh4wjczoG5PrWPx3+JmuabLvoAszjePSdFDUsIsnmcpL/wuPWZYq3Cs8PzR01WjBe
 /YUOBwuPRFWjof7zPZYIBuaA/cf3WvtBtYojHJTJ2cf9btfHG4ZAHcwGes79Ks5d0+YMBkdG9b4
 21f/8cqHnsBVU0p/K021umPbZ3rCUCQOiMxGCd/Pq4FO/0gEsugKGZg4sSjWvzoQFQpg8WEGWxg
 W3i6bowjGrFmracc7w+ZBSz4ZKKJ8s3Z0yfqq4WmypBGVPukWDo9wGvhYEJNQaPg8gsQ/sPHmwZ
 TlSkC/tzxg+fT/rw8wmJyMpxc+jEUPhEGxkccguj+0BCQLoAov4x7TY0FJjVDnIV+AGbX2uTnOp
 gDg63aWyL0yD/BONKNm1b3PFE+asUlLh+4tA8xXqkUmpxkO2+eSB392GZqt47PX67lAIXMt8+0q
 ym9ZonM+1q+gzTx+LOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2MiBTYWx0ZWRfX5zynJOb5QDrO
 qNiXzbBYYe2aU3EERWSVDkdMTedY7CiVWcCcOf3wHQchZCZ4QSOSNIimQGhRxdaRKzCeqJRnqj9
 ObpTD4fjcyNDh6qfLTp+zkHT8JTsvNw=
X-Proofpoint-ORIG-GUID: T0JYDhAcDoeBmKX0fWkLYSguWxX3LhhA
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaa8900 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MoAyQRu-XjFdVeW2IIMA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: T0JYDhAcDoeBmKX0fWkLYSguWxX3LhhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160162

On Wed, Sep 16, 2026 at 08:39:50PM +1000, Thomas Karpiniec wrote:
> From: Thomas Karpiniec <tom@wendy.sh>
> 
> With a QCA8081 PHY and phy-mode = "2500base-x", stmmac reports only
> 2500BASE-X in phylink's supported_interfaces. Phylink consequently removes
> 10/100/1000BASE-T modes from the PHY's advertisement, preventing a link
> with a gigabit switch.
> 
> The QCA8081 uses SGMII for lower copper speeds and 2500BASE-X for 2.5Gbps.
> ETHQOS already reconfigures the SerDes in ethqos_mac_finish_serdes() when
> the PHY changes interface, but does not advertise this capability.
> 
> Provide a get_interfaces() callback for serial interfaces. Add SGMII and
> 2500BASE-X when the SerDes validates them, allowing phylink to retain the
> corresponding copper link modes. Leave the existing stmmac fallback to
> the firmware interface in place when no interfaces are reported. RGMII
> configurations are unchanged.
> 
> Fixes: 61e9be0efbe8 ("net: stmmac: qcom-ethqos: add support for 2.5G BASEX mode")
> Cc: stable@vger.kernel.org # 7.1+
> Assisted-by: LLM sparse
> Signed-off-by: Thomas Karpiniec <tom@wendy.sh>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a..3493e090f1a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2018-19, Linaro Limited
>  
> +#include <linux/bitops.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_net.h>
> @@ -564,6 +565,26 @@ static void ethqos_pcs_set_inband(struct qcom_ethqos *ethqos, bool enable)
>  	stmmac_pcs_ctrl_ane(priv, enable, 0);
>  }
>  
> +static void ethqos_get_interfaces_serdes(struct stmmac_priv *priv, void *bsp_priv,
> +					 unsigned long *interfaces)
> +{
> +	struct qcom_ethqos *ethqos = bsp_priv;
> +
> +	if (!ethqos->serdes_phy)
> +		return;
> +
> +	/* PHYs such as QCA8081 switch between SGMII and 2500BASE-X with
> +	 * the negotiated copper speed. mac_finish reconfigures the SerDes
> +	 * accordingly; let phylink validate all modes that path supports.
> +	 */
> +	if (!phy_validate(ethqos->serdes_phy, PHY_MODE_ETHERNET,
> +			  PHY_INTERFACE_MODE_SGMII, NULL))
> +		__set_bit(PHY_INTERFACE_MODE_SGMII, interfaces);
> +	if (!phy_validate(ethqos->serdes_phy, PHY_MODE_ETHERNET,
> +			  PHY_INTERFACE_MODE_2500BASEX, NULL))
> +		__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
> +}
> +

So, I had proposed this exact change a while back:
https://lore.kernel.org/netdev/aMgootkPQ%2FGcdiXX@oss.qualcomm.com/

As Russell noted, this behaviour is due to the messed-up integrated
PCS support in STMMAC/QCOM-ETHQOS.

I would defer to him for this if he's around.

	Ayaan
