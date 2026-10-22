Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665265;
	b=ALsem4MGbaTSbqX7DyywQwn+PuwnbWu7K4NA92xkddiAQjUTCn62NigGw1lUy332j+Vc
	 B/6VRmmVGglwNb1Ph4NlbRAh3uMiDrFoa5Cr75/bbScEGmh2kK+wohNpyPwizp8u1QQY+
	 x44XUNB/hxdsSzumC/zrlgeaFldjQexh4ykIcIpk7KfZEa3hwkmWABwbimmTRMVtyvH+O
	 W2X8390JbznPhPS++iS0ogncckqNMbhWHhV7w5tBJdCDTsJB/hV0YyskTVtJQYqCxtI7F
	 G5UAmi9UPGwA0BVt46iG+q0G4sPMfbjL7aX0UrabesVUsP5cO95sKjZxBMay1Jk5joA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
	b=SBk1tCCVuu1kpTTJeNPvpjs+ZpYcL3VWC9vLNMM1gYythH5qpUdAgWSRF4XJB+I77d9/
	 wwXgdc+q+wY3n5tS3rbJALnFqYIopc9wwcFeorKujOlAicwMGhgUAvrdhaeBJPVTVwabj
	 Iriyj8jGywhy4aZx1ZYUVFfYZpR2wTA8LCB7fP78YPNxPgkOu/PLNUSuSx/cgILIJKArV
	 bnFrLiGOC6k1BCeYuD+R5qMPldoqBAouIwDNt5CqOs/NEZAEM2HLClS0+EhbBvl+u7Ll8
	 dRPGOYLJPyURpl4IA9VX1DZBQDgNTVq5HJAo96NRWWaa4Ncl1bUu9HI9owxLK9iQOpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJyd3pRT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a1h/d/fn";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F18D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kJyd3pRT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1h/d/fn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA05bW3427015
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tuRL21Mz7vx7Caeva9OhHL4q
	0LwXFbBiNe+JziOrgzQ=; b=kJyd3pRTh6yzgD/CCAOI09SdT8zc7h2QRltA8RfD
	JSvIxeeB7bDIxaSj8OiKbzb/zZ9Hyj4+1uQirrMyFYD8n8dApAmPepP6SkjV0WUM
	mbPlAstvexd/bHx61ldrH49RPvOieLjD0HMll2rhGxFDBxa4t7a+5gxlbCbjxe//
	bKMoZuw3Aa2aL74jsxd0gyDFmE3NIJqJ3/hGX5pzAIBilHX3mDo5GwVeIJ+TqEKd
	w378gGs/KyRu/24pw7+nYxocy2dhWuGINEjmcJrci5Yhr+7QGvIPio8K42ivHzDs
	4KwDvODGxPbW4nblBvnEr8+U+LBb5SmwNhqJJ1F50utC3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0r8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so382800085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665262; x=1793270062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
        b=a1h/d/fn2xo9X3TP3HP2JPLu54P2NW5OgG/MfqdFbPTGO7grhMPMRSrz5ZerTgvGF5
         qBSoxsc/ppWMbhYfXhmwb/bm5gJvDNIXaktOWvHQ0CH9LLUXJcwKJwzxI9hmL9uYEDuv
         eyF0iO6AxEylz5gkRIyAyCIQV0NxYQLfPgJBdO91ib5nSNZzho6GYs8cLAS1QkdCdi8S
         jSYL/jMT1ceiz16/mM0HrvS4HzbclHS20RrodEwaxOn5Y3hZYnser4+Osz9PekG7IMn1
         T7yP7APKropBYssc2bYeNiXTyPo2dpK9dF5/gTUx28KhMi3prDjWPMbb0lod7smeImgo
         e22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665262; x=1793270062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuRL21Mz7vx7Caeva9OhHL4q0LwXFbBiNe+JziOrgzQ=;
        b=ASqoHTq+yHeusycoLRFJLQiF4jMz+YN/hRXU2LQdHEWPzr7I6cXQOiI6cykBuZ0V79
         jCj8xt7NC7Wsmvyq2AHHPuRedFJhJdXLLNNm1qeOP8QB1VR5ld2QkP213Q5YOYRydsix
         qu+ZEHTjb03jyOLgeE/V6VTjV5IOlfDYZiFDZisLMSFmYc8IFTwm7pEMv5AdkFkgEU4w
         WxpLqDtP0cRa7HkKKUkHxLDvP4brXu21ptTdcIgjVz5wdFhOaHXlVZbAPE6AXYBKYlvC
         akfnbTTr7heVHEAkRjbrEB+8nWmcTIenIpiW072eotllhCQE6uAat5JIs+QGPTh7oCVT
         EqsQ==
X-Forwarded-Encrypted: i=1; AKwUvByA1OfLDi9o68Ahveb+5hYKqVkgq+E1bXs8o/sDbB//oTtdrRIYuJ/wWm6ci0WqEZ+VtRLmplxkRf3S7Ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDGSEGICqI6b7y6jmqtkq1Y4aFENFOrGiSWmb7QLWUrDaDyLV5
	2nmxoYhRGZNOI1NaEoScE7FZft80sTyYmU3N24ytGdS2lo5BxHNQpPf5O5GInd5hHezS2itzNfF
	yhnmreKNo6v9ETJzN3BGKy580vsK9pcuft9cbGO4ceFY15y/XGEy2a557wkPNJi//ZU4=
X-Gm-Gg: AYBFou2oxVdjZgoau80guQ6jDoLNL3v+MP0+MZFM8CxOs3m52Gpot/W1qXKpVvJ+AIj
	QieTGC8SG2rr7+LogMMGlG32GxuFIG1TABOlD3iP2WkHyuenXWkBvNgQWS9FpGfwpOTFh9oHq9f
	JXR4hC2cxdxzdttvBPBGZIiZmCdtzu9MRkTZyvoH14d8XcDkXMYhFMtSL5GYc2/FC3Ew3Fav+46
	tFliv7VMJ0jG0zuB2ul6Bnal/Cy5XG2s4WDi9bvE4jiCPqw6cM2y/UBzihJyRB4KsDojeWb/rYf
	UFu5xhRM/l2sEiECe95KPRswgeQF4/p/7dNq9HJTcC1PD4VVvitoK62uo9z2lxfCgYDKbBURSa7
	R+o/8g+4WvdhB92orwV2lQY+Wu1xb2IGwNoWpNi2Yo+67ZyIonRvXxxGGGByjnFVjYk7W9LH6YH
	a3QJm4ML8SpCMo
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr868121185a.55.1792665262430;
        Thu, 22 Oct 2026 03:34:22 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr868117685a.55.1792665261982;
        Thu, 22 Oct 2026 03:34:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f4e0563sm7635571fa.5.2026.10.22.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:20 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: qcom: allow SM[456]50 HDK/QRD boards to
 play audio via DisplayPort
Message-ID: <5a7wc4hqox6gbpdkttgbtwkk4rfohe23lajlnydk3sl3f756ax@ywultzk2f5xq>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
X-Proofpoint-GUID: H3a9MGyU_JPFCwxQVTCk3cLnot8pH4Qj
X-Proofpoint-ORIG-GUID: H3a9MGyU_JPFCwxQVTCk3cLnot8pH4Qj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX5/BKlwgNjFn8
 eFg7Ya9cJYgUz5qlGAOkIkIpZhSGYXeJdLd1I36XlTTvgMGbnuaig/LJ+4W2lZYcJb+wTeLMCOm
 KF+WUpHK8msW7NwHbF47D4kH20J4n5Y=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e6af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=67hlTMCujxtZ4D9r8sIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MSBTYWx0ZWRfX5E9BNUNPPnWU
 q2WmcyAvjnShjgCRS71jG0OMVzvMmVwU7vcwAfjDTsc++QQh6BzBDLgcuURM2nuW1k1pfStFO/H
 xaol/MogbyiqSpl+VEO3pCN4uZ+6l3xoUs/QdCLVstgy93TaLn94P2MSBEj1NgygjOmVyKh/wiG
 xRG0j2ElbykLtWg/RMae+3Y7sggURtElbp5gd+uW8/XLghZ7QaatZnoBqgaPQg6bJIQzNx9b4at
 0+Fq5BI7erKK+QaRHhx4Vt99aOUz/xuclIm+WM4Ujy9JLD0IKOeP25t1pkT3q7ix8ljJQghROTs
 KjqUQlYSaxSQb0FhhIMk0aq/YP5sSo70oqMMyeDV7p+J9VGNWD6Pn8nnrmen6b/8+p0YzQTiQwe
 2XiAfDXuUYqcMLMnhaBZhz3FCFkT1y6PXEst5a+7nWJrcaiPnblWEAKPjF7sVPB8R6cEY+2DP8/
 Av3HWIShM4g+BvMPBMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220041

On Thu, Oct 22, 2026 at 11:36:20AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the DisplayPort altmode
> outputs for the SM8450/SM8550/SM8650 HDK & QRD boards. 

Does this need an update of the AudioReach topology?

> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (5):
>       arm64: dts: qcom: sm8450-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8550-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8550-qrd: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8650-hdk: add DisplayPort audio playback support
>       arm64: dts: qcom: sm8650-qrd: add DisplayPort audio playback support
> 

-- 
With best wishes
Dmitry
