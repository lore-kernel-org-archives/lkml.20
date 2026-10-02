Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB14F646E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956014; cv=none; b=lv6QjJnTrCYh/Frldx+EVYMhP40E3GP0Lvt9h71G6anqyH6RAA61Nfpa2WA5qNmxdd+uUw5tMHq6VcouM21Q7EgsN+sbLvJBqWC9oA5auRHcp4Fn0TWv3eEd3VpfnO5Xk7sfdJyczZp6N05RZZgT+JPTiQhF/U2R53hGOjPafxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956014; c=relaxed/simple;
	bh=LOP2gJ3M0Jz8R6JJtWos6vyUnc93B/qBgdAo8VjRyU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ac6r5t+5YhCLsMC8j7ltAmwrUNsYhDt+6OBzKeSEnHSwwqh4glu9FVvjGt2dLpF25k1ui/UAIY7RyfsuHHMS/25IY1oCbpLM7TjdbAxSbOGyat0leuObwValCBpijw6Wzcclk2TadVe9Jc2zkMpNZiU2U1vv9apLFKylkYa4bnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpbOv4DO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxgIytHt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpbOv4DO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxgIytHt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FHXZG897143
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AlHl3/yI0hICwJfrflSFifdNgfZhAObnwqH9eosbbk8=; b=WpbOv4DOBUOmRU2a
	TWBfVGMWS/qdVjtKLJBCVKt0kGROReNk1YZHDjtbvTKP7/Hhg2nZPY5u4wwkFhwG
	puuzATICBjdungJlpuo0kunz1eifTAEr/RQK6Goq0MX3YjtfvKK65QO7K3MvTu0N
	M2iU2AdnL4EPtcUD7RyeV0pOTbmmOnMJsPtYsUPYLjZcaBp4UHtNJIh+Ak9aeUsw
	Bv7tTm4jT+y4GnR1tI0URxkNDHV9NrQ0w3Z9HCz+RNXAuLuqINHU18mnf5Jb62yc
	3VI7NTmYFXYgEOUNhZYaXZ3TTNYkfCelKF9nYUstpvAn0RxPPNJWPi0X3wMJaSLY
	gTlZpQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v03466d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:46:52 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806756ea40so5573671241.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790956011; x=1791560811; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AlHl3/yI0hICwJfrflSFifdNgfZhAObnwqH9eosbbk8=;
        b=fxgIytHtQnijK9jQsIhGbdxbtjDtskz9i7bRUpfKXwWRUR57vvuYL0I66A/bqB/eRn
         X4BnFXTUSKrcpSfmBYzTBztMWVgTe7C2CM4TCqwgowoS8pcNE+1k6yPt4pV3HRQJTVgu
         jaFJxL+bLuWBhpzopdqgbUEFpj9HLL8sYHFPwWz2gkJy+s/vQf9oFl8NytUL8ENX5lGx
         eFB8jHkOdyKcvZRtnYicrRo/2DWxgD+1EnAr8aTeeq2+wBqtQJ/0pzclEMeTAgVBk6iq
         b9Ko/AouWDrDBNtcNMBLr9lUTpRQsZt41eQ69YiKBCEb/SIQhpeZKLMcXoYvLCEda/qs
         h71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956011; x=1791560811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AlHl3/yI0hICwJfrflSFifdNgfZhAObnwqH9eosbbk8=;
        b=KARmnoe7zDeabWfV09Ewli+TWYVcrqP9GYZdwcItE5EXcdSo3knTlTwrzxjodon8sU
         +bszLtLdaBWCRaOpYDZ8a3TWOtvCVHhnlkqOpH15mla94dHVUkmAO+i5K5D3IC2LBFO1
         sxp3+cZdbkw50X/XQFZ7EEGkDDKzqlQfTf9pipYuSHFARuQcB1Z03EqjYi27AJLoIzlx
         8vDuvtFVtvOjeeudX94c8na6EsU/CXdLVkP2Z0pzSzjV+W14u3S0u+x6v35D4zwP2f+R
         AYuLw9W4iFyXKGw67S8+Srg5GR5UBLgq3NDbjLH6wkOTQbFmiXX0UX0N9N/mBsjjAShD
         8Yvw==
X-Forwarded-Encrypted: i=1; AKwUvBwMR0DE3cOO9W6Z5skpZHq4Mrw5mPSB6fSC96P2mpEiMRHRgoPQvqnwcz1/oiBhpI95ppLKbdpAboMMUX0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYPNPesGkE3P2CDm8E6ZHzbXyDo5nGYJ6slY8/JUOqyOgRtXco
	bE+Y4/Z4+FqI86g6nZn6FHmgWDiiERbk6vwchbtFrTJiQd4FQrkh6RTEEpE6OizvNJcsXAPnrXD
	/oiyNa/dI5nldslNCVJaDydtFPD3yrFQ5WvICi9tBBWOXfYA///Kj6vtW6AEgReR+h1g=
X-Gm-Gg: AYBFou3r6IQMkPiIjFbqUGIGGutT12AUqO7awLG0dFR2Y8e6L7yIC8ZO69SVTGnulPf
	jRb99+TgV+4brxUDXmc9mMDxYQv2BTwu+RYWup+ZbBZ1P1K5kObWkp7h0AeBgjfOX6JuITWPzmJ
	zTND/TDdBF+7tXHAq0uIwSsE2xx/Aic1krGPxTV1Wny9GbOsbSUqyRA+rs4FJCEDu8SPj2TgMQB
	d8Z1o0xmTezFGw236rrdc/Y3oqf+RpAHfBXExF+8sGxEeqj36vDgD7/YCXIAkUmqa1mD0S8NrqU
	VA/5tenfVCBGarrRyzbjixkuXN+nwEy/FnPnvvB1Nw8npOmS8MLyEUBwntro5ljWh9DWLtA80Ax
	T/fDnTN3zeQzVXyfOPJ9rEzKqqkBJPBn+b8jNOMeZmJlcDe0lRDqI/B3nDvoDZ4GAGpcmZ7LpBH
	IZHMSE23p9UnQv
X-Received: by 2002:a05:6102:3714:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7c0f220aac5mr1002252137.2.1790956011444;
        Fri, 02 Oct 2026 08:46:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3714:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7c0f220aac5mr1002232137.2.1790956010942;
        Fri, 02 Oct 2026 08:46:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e333e4csm11331071fa.40.2026.10.02.08.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:46:49 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] media: iris: add VPU5x hardware ops
Message-ID: <bwyfzkqaqcn47zd2g3pdajczk7gq6rmll5sqb2d75qgesy3kwy@mu4xukntrfin>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-3-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923-add_iris_for_hawi-v2-3-016ec3d24b79@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfXxNBTw6elSjqB
 AYE4ZKm48MxZ08jaSYAHgt06aIlA8AUhYIlSNsuxCpDpu8q4RNkPYJFDGs97JT8ipsEDoa48xYv
 ukt5O/LL9k18hZiy2g55FGHnPEvH43M=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abfd1ec cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=EFuZvd8PjtwPdXvx3egA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: HL3_MkpvseBbGXd40CPeMjnKcVND-E4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MiBTYWx0ZWRfXzj8v9RpOSzk6
 TPfy59tlceo0pgwkvX619VdzyzMCSB9xkUAF2MM6ZIxOexzRKW7IerGeVnpBjfh6WSnEKey58AC
 7Xum5ny7M1ZqC9a46WhyZ5WF86mAJ2bQQqLroqlkLJSTeFcoYMpx+d/2Od+74ABnFB0UCIMq/nK
 n/GeX2JyKH/xiKO75jfD+mPIkZ28QX1y46V0lyLgriZHkH7Zc4bImY0GBDhN/CNH1/L2+FwPJ3X
 wnx+FxXMeLzWalXLikY6QCPSCE9EzPJP9pw7BPa3fGP+yIt2sU1GsB5pzi3wzXMawB5KdiCd1G9
 mUAOZojl2fbCaid0p2DXV3bxRbjENh7NmYGT3w59bY4vS+SXP6IBoSgjNJgS/UodYC0xiXX4cGX
 mR7sY+G81WENc06oSIxLewgnUbVbcOzzJ1bQLswOm5cRcl++Kl2meCvqfKn6EcMnxJJ20ZeZTqK
 +MFK1z3AGqzaDJgsB3g==
X-Proofpoint-ORIG-GUID: HL3_MkpvseBbGXd40CPeMjnKcVND-E4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020062

On Wed, Sep 23, 2026 at 11:27:53AM +0800, Wangao Wang wrote:
> The Hawi SoC uses the VPU5x generation of the Iris video hardware, which
> requires handling for two new power domains — mm-int for the internal
> memory interconnect and cx-int for the CX domain AXI interface — as well
> as additional generation-specific clocks. Without a VPU5x vpu_ops
> implementation the Iris driver cannot power on or off the hardware on
> Hawi.
> 
> Move the shared idle and core power status definitions to the common
> register header so they can be used by both VPU4x and VPU5x code.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +
>  drivers/media/platform/qcom/iris/iris_vpu4x.c      |   4 -
>  drivers/media/platform/qcom/iris/iris_vpu5x.c      | 588 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  .../platform/qcom/iris/iris_vpu_register_defines.h |   4 +
>  6 files changed, 600 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index f8a017d878d620fe1d82708624595583aa2ffd99..adaf2f4ab08984bcf10b8ca7ed424a21635eafbe 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -27,6 +27,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_vpu2.o \
>               iris_vpu3x.o \
>               iris_vpu4x.o \
> +             iris_vpu5x.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 61639d72bdcc9917983096e5b8f5905936784623..4529f52a30d7f2ef82ec846bced6f9b5aef16558 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -80,6 +80,10 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_AXIC_CLK,
> +	IRIS_CTRL_DEBUG_CLK,
> +	IRIS_VPP_GATING_CLK,
> +	IRIS_CX_AXI_CLK,

I thought that we were supposed to get rid of these enumerations. Each
platform brings in its own sets of clocks, so having a single enum with
all of them breaks the platform abstraction. Isn't Glymur patchset
getting rid of this enum?

>  };
>  
>  struct platform_clk_data {

-- 
With best wishes
Dmitry
