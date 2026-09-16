Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C515501F2B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569601; cv=none; b=HTYdOY26pMPwMfZ2fq2c+f1LtLFyvNmu2djFG2iJkg1hXgUEL6aJD4yXyGzW5+7rW2CzYs2YXXlx/N+teBYes8x/G/0I9bUu41IsjFIoj6Vx8y1gdRliXOn7ly/reXBHVoBw+h9m1XmlqXcQAXIIfIUBq+zoc0W+PD3jLjYvr7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569601; c=relaxed/simple;
	bh=G+np0cc0It8i302KUloDocttjC0x6BgQYbU+cAG/nt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWR8Cxjn76OQCuD7Sf7WAEItUtyPp6Bz28lXp1CHYT9byGroTTKgeUGyBUTb9SjdaMXGEVfznTfugjVkdmK6CwvrOCjCmn/gzug8O8XxcyFMAFZpoLUhbVxRP6TSqb6RWU30xOYOr1pis4kgD1MCn8AoDh1iyNLg8tWnADTRHYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmbpbGf6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDZ6k1F3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmbpbGf6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDZ6k1F3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYk8T2449039
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0oZAvYtD/3whDsCwaeMTxLwk
	6ROtRTkdevulCwSPy3w=; b=fmbpbGf6d6GKMkaSfdm+GsDbA4+vxi6oxOUStNxB
	a5CXoDbNwnIVIK8GjpT78iyZqM1N4LYRmu6tcst4CyETZENTH0+4N/xRBleb5EwC
	AGPi7jhmo41dPKqiz6110CUg89EZxbrCohzXClrRo/2t6S1gvbbfAkXo/WNzt9LU
	nPHpuZfiLEUlmZqRZsKR3RGqXv4GDwXR+xv7/ePF2hgy8rfk2adv7LZ3MictB6fm
	s7fwmr3umQgyGkoo9rwLYOf53q4NPFP83jmYqa6mikJ2aXCYJ+khY4YwuhUVHrAs
	CsGltqHtTCnW4v87EakeM9UDlzFuXwK3ldiXQUhHExcowA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb0as9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:39:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso4851294a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789569599; x=1790174399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oZAvYtD/3whDsCwaeMTxLwk6ROtRTkdevulCwSPy3w=;
        b=VDZ6k1F3pRgvZpcxW3VFXlXxgzSO81RwsB3R1Pkb7bRtuKO9A4Jgdf074bWJWx0WLL
         8BeZ/lDtv5Szzk28pIJa9+CZQM0HXY6EgOX6xL7R5wutyXT9hWRK3kgemCyj+/D8FEBy
         /7OxRCxBXErsHbsYPOZHjomnkjNI8Ihs/g3T5K9Hj0AeGrKELRrbQmLRciemR747dGyw
         8fPEk/ditzrY7+vgJ0W9KEI/wuY1hJD5AYssZW9DgdqKYD53uIii988pCKFiO4mGacpB
         XHgrXEua/2mjGG8IKRAferHxEjzpq261IO6BRbYNx+7yHozrhjRx7sAEo9saREpSujq9
         bUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569599; x=1790174399;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oZAvYtD/3whDsCwaeMTxLwk6ROtRTkdevulCwSPy3w=;
        b=Bb1uckwa6QTwfkuQW3z7dpHD6W8zDAj8xFEhEw8R+xkQkPYxidoV1e9D7+W4Ys8mD3
         Vke5f/6kWd5rDpOTuvWoMIxMxQpKaGURqXBs0vbxTTMyyrvtM95d4wGNGmZSVvC+pQic
         4nCsIW7M0CeuYYanJkVXgbojn+CwsbuJmlQND/YI4bWXLybgA0s5FoOQ6BTzSUSvKM7s
         E8DAd+cD5Ge8k00bjuwaM7rayxOMLWeL/HXCM99cOwIw6p2jR4NeGUzidswOqVv3qH+H
         0Kyds82r5+OByeq+U3pqGRQ+6RsObY4+FoNaXpo1IOhsuQ/UHelNgrQ6VSzsJZ82ha9k
         KZ2A==
X-Forwarded-Encrypted: i=1; AKwUvBwPifa6WSUgCtvTIaGzfvf6tIxAj3uPYuZjWXO5H3nEQ41hm97TO9cvg880P9rTCtjsNK1133gmhKWRXmI=@vger.kernel.org
X-Gm-Message-State: AFuF++lz6QPgXUJCqB2XqY/OqN6LRLdkVWTI4RdRUBYz9oz09e7LADaH
	stzI0agXklw61jCqRYo2RRDNoTuYaHXkfzHg/ZbyjOqS+i8ijq6qSCTqSx6fRBn3sTzZF7lZyrI
	zRF5ZkNCZP5IGxCDl6CSToaAE4mGgVPUReff2kfzm0TU6ZkLCLiEeCEWeUAGKA1hyrLI=
X-Gm-Gg: AYBFou1ukXZc9y7edXIMiQj5oiWHDEYu390dR1426jyhEzYFOuXlsj9hK/HxpE3faLp
	Shcj2WSY6fnoATKf5CrtAKdVh6q6RQ0IS26mKLIs2B0ft5eHi7/mtJxY6Zuw4fPuiY3H9MPx4HG
	A4ZDvuiWM99xwZ4pFvh/GcDCR8EFCB+bDUg8baEdOPWB9mOqOxQckPpK6ablfxB0k95kCwwr2Ga
	m8vWfGzcPljs01GESsnpUjGzn96AQKMrICLgITrLhX4/d1hCu7tJOhLnnktFj7S3kKkOiohM4mO
	FyIavbKkCzxaXUHbR0i0Rchi4Rr/vJfGRn/i85P/d9txfpLUQAfTXRUZgIrjl1wSFkL0oPa+udj
	lH7Ti2LETBHBbjx3VfTYnwFmota01WESGgsNgdZlSUYk=
X-Received: by 2002:a05:6a20:1603:b0:3d3:ae1f:d7f5 with SMTP id adf61e73a8af0-3dd5f74d9b2mr7229569637.21.1789569598975;
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:1603:b0:3d3:ae1f:d7f5 with SMTP id adf61e73a8af0-3dd5f74d9b2mr7229498637.21.1789569598494;
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50aa9b03asm1782560a12.2.2026.09.16.07.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:39:58 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:39:52 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Message-ID: <aqqqOMS6QL3gxF58@QCOM-aGQu4IUr3Y>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
 <f04ee103-ada5-41bc-88e7-7380b2b38e98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04ee103-ada5-41bc-88e7-7380b2b38e98@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aaaaa3f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=SqxCJjNS5mIqFQWAgecA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 0FiRDSQSqEaV9DmruTydJ8VW12Q2ODGP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5OCBTYWx0ZWRfX3NJ6akn8PCUC
 NNd0hBrVBrruAJj/zYLPfZlGcwQAHZ/lrsz2rg6FqhiTGWW5rJeRhX7dVqh1aHsSEPaBdO4qopK
 hQJduVWWY/bVWh4QXQRk8u7YQd0351z9Q6QARRY+Dz+Gekq+5zlvDg5ZIoo2pQnwinmlHuHfPll
 sG/5V6CrdtYE24BZ+6y/L24+DS11W0STUQ8RTu5NLEeVAFLFnk464RjBSmk0wSlBeirUDUPTLj0
 WoYUEOwNmC/2gESDgKFRDwiB94PxNmFpWI7TAt42f/9/ijNbQwxBQltJ0DKlye/BBvxhUyQsN0t
 XaN7EFv6wpAMNxCLcfYfbiMEAkDZnxQp+otNjIkRT649kX4xnN1S3/KU2n1Hj4K07rfwRoaXht/
 CSJ2ZdEZUek2ClveQ4NeDS7NB6y4i0vd4bSjH8Cxz+TRY+lu8TcxARSWGAXZ9mVwHbNbl3z8MCz
 AD8nIUVlM0P23HCU75Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5OCBTYWx0ZWRfX/s+c6bf4H48m
 q1YE6nQSkOQlMmwda1qg4crZEATEV5sXcItIozJyK96YBgfZkQebcMZKb9F4sw49J58zUOnTipj
 NjwPWEYKF+GRoj9rAo2pyRyR/jt0uHI=
X-Proofpoint-ORIG-GUID: 0FiRDSQSqEaV9DmruTydJ8VW12Q2ODGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160198

On Mon, Sep 14, 2026 at 10:33:06AM +0200, Konrad Dybcio wrote:
> On 9/11/26 4:20 PM, Shawn Guo wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > 
> > Add the base nodes for the three DWC3 USB controllers. These carry only
> > the SoC-invariant properties and are disabled by default. The extension
> > for the embedded Nord variant and relevant board files will add the
> > platform resources and enable them.
> 
> [...]
> 
> > +		usb_2: usb@a200000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a200000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq";
> 
> There's also a hs_phy_irq @ SPI 908

You are right! That means the binding for "qcom,nord-dwc3" needs to be
fixed as well. @Bartosz

> > +
> > +			iommus = <&apps_smmu_0 0x14e0 0x0>;
> > +
> > +			dma-coherent;
> > +			wakeup-source;
> > +
> > +			snps,dis-u1-entry-quirk;
> > +			snps,dis-u2-entry-quirk;
> 
> This is a suspiciously short list of quirks..

I will double check.

Shawn

> > +
> > +			maximum-speed = "high-speed";
> > +
> > +			qcom,select-utmi-as-pipe-clk;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_1: usb@a400000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a400000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq",
> > +					  "ss_phy_irq";
> 
> hs_phy_irq @ SPI 919
> 
> > +
> > +			iommus = <&apps_smmu_0 0x15c0 0x0>;
> > +
> > +			dma-coherent;
> > +			wakeup-source;
> > +
> > +			snps,dis-u1-entry-quirk;
> > +			snps,dis-u2-entry-quirk;
> > +
> > +			status = "disabled";
> > +		};
> > +
> > +		usb_0: usb@a600000 {
> > +			compatible = "qcom,nord-dwc3",
> > +				     "qcom,snps-dwc3";
> > +			reg = <0x0 0x0a600000 0x0 0xfc100>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> > +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "dp_hs_phy_irq",
> > +					  "dm_hs_phy_irq",
> > +					  "ss_phy_irq";
> 
> hs_phy_irq @ SPI 131
> 
> Konrad
