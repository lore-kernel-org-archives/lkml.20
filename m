Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416952;
	b=jEX6xnkvJ6g127SgQPIChBuqwwqSjp3gw7P2JiogXui+u6+e8UuS78cG8UTgfGLBelhi
	 jIjKCdHL+kPS0v2YKKOcyPVqLrNPVnrWeX+AtfY+TqqtHrqSHdQT/ZaLK3nMZh6txM4Dw
	 JaAr4OSp/z60SPa+daGpBm6rXfJvhEGzAVAbMzVP1dEI8SRb9IYiF4Yd9chjO6Tl069xB
	 2RQLB3Mx45sntHp87vxXtCA80ISFVLhogJR8sz/6MAEuQmlJivMubrbDhDp+FtJZe05T9
	 fEht1hWicmR2+qRmHGJgqmNOUAVkOao0wtA4rny4CVrv1tzzrMkQ0U8iPcEu8xmq/uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tVcctW/oKDuxTt7DrKIQJLMMmlpeEMy6Mr9dwtxp8WY=;
	b=yBhp97tr81vkP3xkLoMto9ZgA+T2PZFs6pN0KEVtwKtq6ThvTs38VabrkWHW54gSuF85
	 dT6nUaf6vEEZU/DKmA09f4+xvcBgh3iGX5+8c9qeIeFKke0hCSVnA53dNyLERNycXwaI0
	 m12vmWCsVurErSGQBjo+6ma/8anCT+ryjIhTKsSLP6Zo6jf2PG677uOUlaM90qzIdyJUF
	 qDluSusr1gW1eCyVvHBdfHjFGISc+dBozB42NOTPPxj7WcriAnJ+H3JcfeRkY3Ar4SHxJ
	 ApWYCh+xnmJQrMAuludPHf0VEYv2uhQKgtbMT/JMNRXKq/LeI+BG92q7sFDiKG5NRrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1djNy02;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WB/3UJnL";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 384C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1djNy02;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WB/3UJnL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF19OQ2115748
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tVcctW/oKDuxTt7DrKIQJLMM
	mlpeEMy6Mr9dwtxp8WY=; b=S1djNy02soVsnM6zgLcxLwbTC4mKwOQot0aMq5SJ
	svQ58fBgLts9WD/bnLtpmQBZaz+5SN+YHJVUWm5vGbCtlDNA2lEN0awRmnJfT/Ek
	qmaqwyfT2sbuGxL+alvXmY73mfehcdLC7CclqIBeqnZ2U81QKb7bjrEnqfjAGBRp
	7nDfGjbUAQ9a6QpHSrNryZ0wUnmzOT6/ivbJc7Is/qesQ6AUTgU8afQFHSmZZXtQ
	ueu4z4Rz2aHdnEPHY/roYhHbNiOz1wiHrkVJUulvtamN5Z4IHM42eBBNh0QcRc42
	Y5e8zvnbJsZRBdwYGODw9uVDY7BhdxAjucBsntxv+AiDnQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawk6wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:09:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so1084603e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416950; x=1795021750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tVcctW/oKDuxTt7DrKIQJLMMmlpeEMy6Mr9dwtxp8WY=;
        b=WB/3UJnLNP59TawUNQ7dHi9Nf/WOEjaC3DKi59QRPNBjLJeCrxQUBJsIhU6YuXiYRm
         qg/fTWer0GyL8Hscqft33sdeieL0AH2zcZCJDOJ/hWIHalLE06dc9jIaSEevg0iLs4Pu
         wJfB1oEed308yjWFhkGpavYYHLNA4Ge+f2s4sWTqrmGbiX4wLT1XaMODbci9x4jCKH9b
         hk4F57FAxq/Xrly3CwvNO9BVku39FNus7tEV8nnFCXbbQ1YfXfmAHIT9kYd7XI73heyO
         Fu4BPbSFl3D2gvSx7WN6untKccZp4F5NtOM4YeM4U8IHcqj+aYugb9xskLgIla/tpV55
         EiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416950; x=1795021750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVcctW/oKDuxTt7DrKIQJLMMmlpeEMy6Mr9dwtxp8WY=;
        b=Cb5VXGHdfa6ZCvGa9mfkd2ObIgFl0+uqdWaVE4ZOC70zLruHYr5KwGoMwaeKVdI0A9
         UpXmYqQ/u7GdA/PzgMecX2132XQGD84aa5ML2b592kVZoKLPTqcKe0dTezUnqxuqyDqz
         NFHGd9cAo/RGuSwnH4CUzdoSHKNPYRGl6XIAfEvbNHmF0P6lJhoajxn7smOZr+b9VywS
         bM1WQL6FvTsym2i4NMeZSAuGZxopZVd1apTgKwFMmHsGq6ZPR+bRSzuf7dcaCNnqrPtH
         OggKGt99iOAKHx5iylZyurCtiqbVLoR4yPcMeVGxGydYXRoPcOzITXdc00qsxJgutBon
         MDpg==
X-Forwarded-Encrypted: i=1; AL+hErHSW5i/VIOrtuRwHitpAdx386+hmc0u1AR1xNRh8G8RYZgthcuKGNmSZmVx8STikN9pfk5qiWW0WgHSfFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aCaSV6vCHK6b6XHx5bMBYszBJgBeFy4Gf8WQRu/n4+cytUcts
	NfFE4IoKzLjKFFyqjsCspMFwRyBNUG1eZSYI2E7U4ql0878+ByNZuY4sk33IVZ8q7Wmv1rE6Zbu
	ihlGRcDpg8u+N+M7YwqncBP5qjrqv+/CNg5eicr+u5e6ZtKulAf5MGRsduKvQEZ9FHHA=
X-Gm-Gg: AYBFou3uWWzZkC9XzZWJ07zBYvA1jaN4VfpeKPJMEEuZfSXypnhMdw5tIQJxAO/7Yyq
	aVMIeIRpcV/GvuiJmyzigygLXR7erIZrfkWugGojp7yYawxuaRK6Gu96PEzyojeoKoxO6j2dj0P
	ORXDhMtXZoAPQ4jmDXo6lpNqfcaG8ribGfj3P3MhM3iUSYIa7wHq49Xk8iufFLe5FVpd+YgXJet
	HcjtWWFcMWfipqsdSU4PG4Ynkb749ElGBGLrwqeokBHbHyBE5wV8Xx2KzU4KQgiOvMz6FhH2Ehv
	cxbr0MPoZNaxcgwrCzOkfhrUS00/hDz9gsZ8CgVTrSZR0COH92KzBVi96QEMmGgpvPdKsAkQTrD
	nyZIKIl3UGmxEcvPWp+C8SjvhT50onbBAt2bplA3le9nCEKya9uqwq2jXcyoKbr2FTC9RUBwZq0
	9TJhXvJWD1WH8EjnjAymxOPG0KhCtf1AH0M21cn4fG/RnZ+QkwgqvjNMo+gwUQaQ==
X-Received: by 2002:a05:6122:4b16:b0:5ea:b9b5:8c43 with SMTP id 71dfb90a1353d-5ee1c480a5emr1354771e0c.18.1794416950279;
        Wed, 11 Nov 2026 09:09:10 -0800 (PST)
X-Received: by 2002:a05:6122:4b16:b0:5ea:b9b5:8c43 with SMTP id 71dfb90a1353d-5ee1c480a5emr1354753e0c.18.1794416949763;
        Wed, 11 Nov 2026 09:09:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a0dcsm1105809e87.5.2026.11.11.09.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:09:08 -0800 (PST)
Date: Wed, 11 Nov 2026 19:09:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the first
 PHY enable
Message-ID: <e4ul4zxjta4oyo5fpjjzwkykb4gicztcn7yrgjw7aer6bqowkw@6nx2arhvmyca>
References: <20261019130041.305805-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019130041.305805-1-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX7w6KImXMCPTH
 gBHAJz6amGSZ9sIVmz0hi5L5CzDQhOyBj0Morlv1gi2qhHM2Szt+u2RK0oUvvC/jNr6OnNk4K+1
 D+RY7812Q5QDe0HC8bSKk/euRdzgh0M=
X-Proofpoint-ORIG-GUID: 0bjFKinKDV8Y38f7ZQcpUdiH0L9XobsV
X-Proofpoint-GUID: 0bjFKinKDV8Y38f7ZQcpUdiH0L9XobsV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfXyz9KxPS/8XT6
 wLHHqHHS5XRktstantzIz0yqfHnSgmtZCST9GTScbSpZZpUR9nbYRMklEaQrPybM6jO9wX5hC7m
 0rxLoN4PniMrZvGnlbP0wRNa8kcyTjsilRXyMea2STCOfxgc25EaakKqG+xG6yLZ0iFj2UnHSOy
 pjXOIf50xlYmPSq0LEoKrE5Jl2DUDB+Uscks5Ee8oDhWQBEKDEAPUVPby4p0UGsPY5G+HaS94gF
 r9OiffUDRu/SqRhe4XyD86Z75zS3v8Kf4Q/+25RR8YgmlDrPbqx/Nm0DOkZs9VWeN+fihSHccLW
 NxuytOC/NIiHLuSlW9VSRP7iotZGA6uZQDI17G6jVKbXgFAL99uVSysFevjj8Z1tY3fgmOpIn3k
 yZHqsvDGs+gZYGmAxf998TiF8xsjZyIi/p3RY3fmdGyYdV3QDVR3xh3CBaOQgsBLD00TmnOMxpO
 iZo8D7fDVw1oGbggeLg==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af4a137 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=InjWm6lT3iDBAsjdKxMA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On Mon, Oct 19, 2026 at 09:00:41PM +0800, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> dsi_7nm_phy_enable() pre-seeds pll_enable_cnt = 1 before calling
> dsi_pll_enable_pll_bias().  That makes the bias helper take its
> early-return path, so its PLL_SYSTEM_MUXES = 0xc0 write is skipped on the
> first (bonded) bring-up and the register is left at 0x0.  Panels wired
> for bonded DSI then come up with a blank display.
> 
> Write PLL_SYSTEM_MUXES in dsi_7nm_phy_enable() as well.  The write in
> dsi_pll_enable_pll_bias() is kept for the warm re-enable path where
> pll_enable_cnt is 0.
> 
> Fixes: 44784327815b ("drm/msm/dsi: phy: rework PLL bias enable/disable")
> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 1fc3b4f0c..5dd4830a1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1144,6 +1144,15 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
>  	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	/*
> +	 * Program the PLL output muxes here as well.  The pll_enable_cnt
> +	 * pre-seed above makes dsi_pll_enable_pll_bias() take its early-return
> +	 * path, so on the first (bonded) bring-up PLL_SYSTEM_MUXES would
> +	 * otherwise never be written and the panel would stay dark.  The bias
> +	 * function keeps its own write for the warm re-enable path
> +	 * (pll_enable_cnt == 0).
> +	 */

This belongs to the commit message rather than the code.

> +	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>  	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>  
>  	/* Assert PLL core reset */
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
