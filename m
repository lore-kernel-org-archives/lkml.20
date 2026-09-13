Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250738332F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789343891; cv=none; b=mqFdyKfXYVRoeoe/z6S733S7YdO+38VcKpNMxYXK6oLRkgoHYBMIdHLgFq72DoVj2qPuNj4FRZnChnZzPcZ/k4dUit6gCYwliAzUpMJo6ywuV61QYpdz9DROlVdi/JWvfO7+r8bREFLAQSitQ3A0420NOHIvCrJ9RtuIU0f+SXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789343891; c=relaxed/simple;
	bh=NI3vFkLPM6fB4QCNrO6VWVzL8tRKBp7ABCq4XIArNBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZT3W2WTG8FaNNdLSSwG3dE2jhblj9SWP815uDdavJDVMIgNpcaJnkFza5bAdBKjrArHuWWxmyeILoIO5nUPNh51DS+dsGwqm2wim1KlV59KO2oxs80HNvfaDdPJZK2c7xXU/i5OB/cqCryw7YMlKl3j6YTzau32PNH2oUgqx5bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FkRM+T5s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKDFHrDt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FkRM+T5s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKDFHrDt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DNZ2KN2962715
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FDBmdktdlLUHhDlg6uE58fcH
	cyrR9lGGu3jE4lq6oo8=; b=FkRM+T5sbuz1jXUjWOTE+kewEZ6RHwSJ9mZ4QqD9
	yiakrA8NhqWb8EUsreZp3Qi+ly3i5wWSVjcwqRHts0gw2fxY4YNDO8qMDLb/CTcg
	2RIMA2SimlmBlkl+H1hl71enAnp5vf1iv4EfvLTQAaacAVWWGK30llcslfK0b62B
	zSK5K+jTYIutCamRepU7rlDPZ/jIl7BtrDGeevzwcFDUd5UlO6ABh2284EzK9GfF
	EOK6Yd9ZnfrjnPJSCMyhOlQnjq+XAE4hqyOYYqTjhVqhnHWEwo5pmRmei1jg6Odn
	/Piq0KNwXAGYy1clYyBFFRepvL82/n3WvFdwTG/PsM9XnA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dcbtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:58:07 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-790376c9f8cso665656137.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789343886; x=1789948686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FDBmdktdlLUHhDlg6uE58fcHcyrR9lGGu3jE4lq6oo8=;
        b=SKDFHrDtE50uBllbfH5Om0PTQv0+2glLEk3wzom22s6pKdhTQAD7NlHcQszk9E1+AJ
         hwvkcYGcelSEP5CWn/3KaXdZXI3dlCeBnutxkWVpo6hM2Gzc1O5qo7l6NowuiQse4ITN
         PduPPCsDqPItgCc3XOCaIgTNrU52UdH58Iw4A4y0BdQLE6ZiKeByB9n90xxg2ytajQju
         amnPAnYKC8eoF5YqI7jTjUo8KnOlZbwImjkbAQrQVaaRHcs4yZyLPgleUYv6K20R9+Bt
         PasAjCFyPfOtD0FDB3/FcyH132+eEAgbhGsKslBHXgAByj3To/Bfyxd6hDxy6SBKtzkQ
         vkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789343886; x=1789948686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDBmdktdlLUHhDlg6uE58fcHcyrR9lGGu3jE4lq6oo8=;
        b=nO5qapZEemMzMDckO+M5S2PE0RR4rajxky7kk6msJak4wUpDsdv7bYAVXsl+lax2el
         KIS82Nh7zxnA4HHB8q/gZBbRiBFEdE6MYjQrrnRgMq1LDQTxj4r06aiaVPrPXJoWBW1u
         FjF5ZQdtnKUDtLol05c3Aia3NNl4a78jLj2IDrYKXXn8veaIVCZ95xFm0b7JYDACdbxp
         vUKYJsSIG+Z8HcqYYMIfk7/Ai8TNWTQUkqF1mG/SjGNCwEQMT526IUswWFoIwa9mdcKP
         VGQE+B5QyNTci81cwqk8xLdvZXotWR+ysLQF5eOzwoKTRXsj3aAsQdatc7jeE5R6ZXE/
         Mr8w==
X-Forwarded-Encrypted: i=1; AKwUvBw5vW18uj9Cwo0VPUfZONSYMVD6e3Kg+YXwJXvZ8Jv7C+oZUsgqiF+Qsj1NHmSSNycqkKevthl7DMCPhH8=@vger.kernel.org
X-Gm-Message-State: AFuF++luPy1ydYKpGbeFJq5qvV1lsX0j/9LGfvGSAdleVn/8iXoNAvr2
	U3c8T8F8SBiI3yaA8EzN6y9MDkZqCcP503+Z5iQ9nuR8N7rUQ15g+L/XHc9/ESS2zYthocGdiyf
	qJhlZucb13yN74AbOLM03BH//fAPci1oMGAdncXOIg+0MoW6TY+ZGw5gIDpVq0vXKuHA=
X-Gm-Gg: AYBFou3cfT5JcrV03cZeiZSAXrs5UAZ2beW9rbFu4qNJnYOqtHIVRJBB4vHKds97pBZ
	ZHLZO2XZZcQBaWpyof+yDZvxG54THM6NV2fJ91GZ7werON8Uf0tpNAGSkU1WNShqafj7ODzzBQW
	3V+UKCD2Bc7VGTflWQvKrKzlSkFbz68uuFc3v45uuOHgh3mTHMkWd+G0rC6Du7/FfCpAGA1SNth
	GhqsST/BqY5a8uADMP65DJC1iZviSqbnVtjag0VYzpnvrCgeZyWo3H6iTKTP8xyPKbsP/WGoshG
	yvZL5W5FbA5bDOTQIkXMtT6QalZdnPtzm8j+68PBFbFKkkah4uZroBc6gSx3FFPHDslsbaJFQ/v
	uFGyJGyEQJMzrxrv+j/v3xe+fg+DJQU3eK3KHNj4EDuav1c6lxWqMGlPPLxUbJ3rHkxkFOusMsZ
	9Tq7jpzZGKSqH+
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr36585137.7.1789343886551;
        Sun, 13 Sep 2026 16:58:06 -0700 (PDT)
X-Received: by 2002:a05:6102:149c:b0:791:8f69:b802 with SMTP id ada2fe7eead31-79b5992c78dmr36574137.7.1789343886082;
        Sun, 13 Sep 2026 16:58:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263c7sm21510611fa.21.2026.09.13.16.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:58:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 02:58:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 07/17] phy: qcom: edp: Add Nord-specific register offsets
Message-ID: <t5thwekhz7wyhmyq3nobm37kag6n7ef2z2xpuwrqikv4aqniwc@ha2pjr32ecrp>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-7-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDM0MyBTYWx0ZWRfXz+GFGA7bY1Gk
 H2BJysdcT2pXDTlI0IhoRX2AL3TIoT+3U2/NQHSfHM2S8NE0cBKSWPmVU8wzoEjyUXrvCo+m6q+
 24194NuR3vfbka0pS5UJwz+rxTdA8ERj6LdaGYLJWtiXnnNn2/IhrcELB1IJ+XyqLN9iPghnhLN
 9YoXXclDHkATsx79rsWYWPR5u6iQQzTVw+BB+cR3bHgeakRIwy3mRA7IfhP7N8dUDfieaYeFqPA
 M3EUs3GC9Bb2+G2WS5Dg2I8Gtns+PWbz+JsmHOD2UetWI7ZHkVuI3JjdErXPp3zq+S1yQhnGM42
 c0WlOek7dFwtTj4tJZgosX+umib0wPD2gnGM6Ih8tlWeUUp7AX4cUxt5kggfh7zCxT9DS4Ee9W/
 a91eMy/T0fAlef6Psspeo52xeKB7Ko4ZIqz7v1scrwb6rtk96LqX5nJV2zk/I8YYH3UdZAgHPFZ
 0uZf9tuLxoveIi8sQkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDM0MyBTYWx0ZWRfXyPIbDJ0wdCSX
 XldMAKWXpe3TCOJJD2LiEJy1WsieONVWxsjIyJ2JYdIlkJ5y1Cx0nRdQ3MnKtQFouHyD3nFv/rR
 AnlGrbXsTnVffEsKQ7xay7RhL7uBQjg=
X-Proofpoint-GUID: A2tkA_VL5TfnutYVI-DsOVgCT5SOmdd8
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7388f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=y1iHI6lx7uGyBqjubtwA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: A2tkA_VL5TfnutYVI-DsOVgCT5SOmdd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130343

On Fri, Sep 11, 2026 at 09:06:38PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord relocates several DP PHY and QSERDES v8 COM registers relative
> to existing SoCs.  Add Nord-specific defines for the relocated and
> new-only registers in phy-qcom-qmp-qserdes-dp-com-v8.h and
> phy-qcom-edp.c so Nord sequences can reference them by name.

If the registers are reallocated it usually means that there are other
registers being inserted (or deleted). Are those the only registers
being changed?

> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c                   | 10 ++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index a3c893f72908..bf8a17336c7e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -41,9 +41,19 @@
>  
>  #define DP_PHY_VCO_DIV                          0x0074
>  #define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
> +/* Nord uses a different register layout; non-Nord value is 0x00a0 */
>  #define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
> +#define DP_PHY_TX2_TX3_LANE_CTL_NORD            0x00c0
>  
> +/* Nord uses a different register layout; non-Nord value is 0x00e0 */
>  #define DP_PHY_STATUS                           0x00e0
> +#define DP_PHY_STATUS_NORD                      0x0110
> +#define DP_PHY_LDO_CFG                          0x00f0

Why does it not have a _NORD suffix?

> +
> +/* Nord-specific TX lane registers */
> +#define DP_PHY_TX_LN0_DRV_LVL_NORD             0x00e4
> +#define DP_PHY_TX_LN1_DRV_LVL_NORD             0x00e8
> +#define TXn_TX_BAND_NORD                        0x0024
>  
>  /* LANE_TXn registers */
>  #define TXn_CLKBUF_ENABLE                       0x0000
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> index 93edabb830af..008b17222a8d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
> @@ -48,5 +48,8 @@
>  #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
>  #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
>  #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c
> +#define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD		0x17c
> +#define DP_QSERDES_V8_COM_CMN_STATUS_NORD		0x1d0
> +#define DP_QSERDES_V8_COM_C_READY_STATUS_NORD		0x1f8
>  
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
