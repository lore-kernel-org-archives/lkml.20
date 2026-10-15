Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7F399003
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078038; cv=none; b=OeyU+r+ngnezfu+PLuh1G0Uh1MtzhLRmYHCdY5cEsn4zxbwzhOBpeg98wg6fR4WTrDbtwJ76tD0aM5a1ZmKf5+mFNbpBJdbXKZOGifeduyaL/nd/8g8DDlBaDngD0rkAFWPQxnPrINXCCOtv2RoYW2VJgVgLujZuM98r1Y5lKME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078038; c=relaxed/simple;
	bh=EuQqwIzivivIRRr4Xjl/XAIJQ0ZaWwbl0Y/qlRDUkN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTJJgFCUdZBG15yokArqqbvlpVa6HBS+oox4iurVUb+CM4HvtjYp1+k9hIucfl+SqNgOe1PjBWLJHFeWCl4BORAbkZ1mc1+9krVB8uEv38CobbkRG8NdHmCF6UTs9WCyWzpbnYsYHPj0r4ND7ae61L4FBhayotDLk51qMjlu90c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9nPLvdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8rOJbOI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9nPLvdh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8rOJbOI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFOS7K2114210
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xpnGk7FPC+VKE9mp5pQv/hve
	zQu7wPRB01zE5pjxB2U=; b=i9nPLvdhblTcgWfaUZrTDtWUj8gzjr8OpZ9tHwks
	ljt3Im7IRjr4akjgALjbqnBCfqa+o6KmUa5VfOGx9eRW6BHsRlOtouRRGEPKYL9t
	c/lvBQwXHtOumbtJDMulm/lO71c7d1e7/YkeV0UgMfMqIB52vVjqT/ogoVi5h0d8
	oxV8qdx7+en/Ku784epf/KvcpQQwZasfxHndMOoSq38eyynCOH4ikaen+SoJwNTT
	zhZ0i9VeYtqf6z+IJLA88aXDeuD/7xNlHN6zc9LAjMtmmrvn1qDI3WAcRN7B8ji5
	3YnAi54oErcw9EIn5yGXKRTiWkDlDEwvWKjaw5e15Amk6A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmybrx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:27:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6e08454f40bso155994eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792078024; x=1792682824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xpnGk7FPC+VKE9mp5pQv/hvezQu7wPRB01zE5pjxB2U=;
        b=j8rOJbOIWyOeRRl6FzDgN951X2iEAE1pOk24BP9chn0bBx7QeRhSJ8K+k701pzzYB8
         m6+XYtLsnfE88DOLEjGfJygXuXSB2d2wyKFskaqN+OmthLwgzreuTN5nBZ0/lQH2B1CQ
         izM71XVGUYy6MTD1J3lm4WRDiE4XJmiQGMhoegs8Lb10Cme13OFNyPRWyDypksyAKsiO
         pKx5UOwKWxe+mAGQS0eszwsZ3+PA6efNXts/T0Lk3eD3lS9OPvVAmgz90bOQTkyxEhVt
         po++5TTzjpxv01qlP0lClzXX800X0sSS12Au8ooO/zqXrTpmi6jKB5+PT6OY5jFxsE8T
         06aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078024; x=1792682824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpnGk7FPC+VKE9mp5pQv/hvezQu7wPRB01zE5pjxB2U=;
        b=VW9qLYLPjhBbHuoWyLtKd0dm94gpga5ad6JaPnmRtiBwcmb4uX14mLFZnYiq4AT0gR
         8u8RvOy1YFtjX+iF9eS7Cs3op19QL9DpwwWr01GpoSBybjIdKPGB/1yfTOYSVY6Q15gx
         9XdDZRsIe7vMAadMtZPnmHWMq81jeXWL9IPgxusJRE4Nw5FaZjdKyR5cIlFpbjLLGzge
         Udu5DR9CgIuoo/Lexh2CwDhZygpvxbU47sQTJ8rA7zHzSCQZMq2jL/zCOpTkXqtl+OuU
         HUd6xPoE80puwljPKy77c3ZDbJuwdUNFEMOKfmrb4j6LFBEhpElWScUuCuxPixFWryo/
         JMrw==
X-Forwarded-Encrypted: i=1; AKwUvBxe1s9TKB91QI+fvimvgM/z8p5NiBmTj0t4rMFERh6cBn2hE19ycStGJSIwak0IrWkQASyxrxyPy0ZR1mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiy0Ogs9p6KGN+57zKGFg7dWklnU6Z63eVD1ME2d8DLEP8jasK
	t53pUqU9WcyKtXqm1qdPkehxrsX+Oj41LjKBz9vskNpO54t6HjjUsaE8+7iKQMfrj+v1CmqUEiH
	ncM1rm+12ycenWFf2S0au0gcfQzUwZ79d2ps6vqSjyqyq4ajvYLwoYo3mYHL6hVdTJaYxp3jY3/
	I=
X-Gm-Gg: AYBFou21UayLxIa/9Z4V1RAPUvQBT+r6/n+y+LznMq+DTJtty5BbftEdHt+OkVDt6eB
	hjoLReVeVNtRxzqgqUGb26vtdz99cM+5M05czox1d4kmqSshmixVAgyvp7K6L0hJjEVoqNG6jVP
	BqK+yhDCD7ef7XPc/Ue14tR10I4M8uqqWjUeRCX+sOkqpELRgYaC2ZGES12b1QB2U0SVp1IZRaB
	gbP6oi24C44oDxX60cYo/wtM29s0othQO3xJRiOu0N21LPlSorMsYz3sTZdtwtdXR8npQXO1AMM
	yUjaMdBSD7kVZMZS56/cUTuntQT/4HwUfWv5DfH/W8ltFJ25mthVPD3KgPKY91cKTMwK9NPumHv
	A2PJvmtpmJTkYu9ekeQXSLu6LCJiLZ9+D6SGPhFegapDO0tlM/CxhyIXKoo9D2vrRhTCuPqVVQc
	TeFEbDPX4Am3ui8a6mXVg=
X-Received: by 2002:a05:6820:4a8a:b0:6de:87d1:a1e6 with SMTP id 006d021491bc7-6ef0d224eb6mr18485389eaf.2.1792078024301;
        Thu, 15 Oct 2026 08:27:04 -0700 (PDT)
X-Received: by 2002:a05:6820:4a8a:b0:6de:87d1:a1e6 with SMTP id 006d021491bc7-6ef0d224eb6mr18485313eaf.2.1792078023578;
        Thu, 15 Oct 2026 08:27:03 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7013ae54701sm72109eaf.12.2026.10.15.08.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:27:01 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:56:52 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
Message-ID: <atDwvO1ypm5ik2u5@hu-vishsain-blr.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
 <ecuc74jw2pmgeijojvqayrnkntukzzyjlx7iq2iutovr7x2xkz@uvf2bd4o6pxi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecuc74jw2pmgeijojvqayrnkntukzzyjlx7iq2iutovr7x2xkz@uvf2bd4o6pxi>
X-Proofpoint-GUID: e1j3JSur9yGYCV-Tjpg5hGy1vYgv9etB
X-Proofpoint-ORIG-GUID: e1j3JSur9yGYCV-Tjpg5hGy1vYgv9etB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA2MSBTYWx0ZWRfX0XY5cFh56PBB
 oOb+LiIUFuVKcPbJLk74Lh/4MAPaASgIF+Q6InJG1mQHh/MQbplZjx8xSLBWYmq6XcsFRhrwvVW
 FR3c6hy8GlirDGycEDQWqIa4DrXr388=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0f0c9 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bWtSzjqMPnwURQZuJgYA:9
 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA2MSBTYWx0ZWRfX/ZYAOC8cXQS4
 YtmV8+dCaYD8DiIB1QpM30XIH0NLHDuwVoShyMaRYANGKWJHJqB7duDToE5acp/ag8aRWijTYx0
 MHFSMiMXHz9y3/mK4zLVyJI7NBTMuPSHEOIzQGdWF06VDL72wLODQvXP0BkyVht0IxV00tTCM7D
 HRe4Iyb4WUTgoQuiW1Sld8mSTreru8LPklczm43NqO7rzf3tw9xG9gRVmbJN6mdDWSFBce7EYk5
 qFiCJGGvz5l7x63QuKGW1EvV85wrS2Obg8GYkSzM5O/qb77vgRPavsM2UqC+Wz2uiCd5kuFe0uy
 oplYAIsZ9O8jRytN8kd5FOD+r9gRp5LjzR4e5Ko1p9rSyHuBIbvKIHIwQfCi1kmL0NYxBlIMz73
 HOqELzZQU4wx5MffqhzBPTrIkjOuKEKaHB8HXvcouqPG20mLwTD3sCUV1EiLmi9VJEroK+FadTa
 ScO5xmNkarNZwnyqKPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150061

On Mon, Oct 12, 2026 at 02:59:46PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 11:46:28AM +0530, Ruchira Revdekar wrote:
> > From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> > 
> > Add the device tree for the Talos Lyra EVK platform which combines
> > the Talos Lyra EVK SoM and Lyra carrier board.
> > 
> > This device tree adds board-specific peripheral configuration on top
> > of the SoM, including:
> > 
> > - Native DisplayPort output
> > - GPIO expanders on i2c5
> > - SPI-attached TPM (ST33)
> > - USB host and peripheral controllers
> > - Power and reset keys
> > 
> > Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
> > Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> > Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> > Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> > Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
> > Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> > Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> > Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile           |   1 +
> >  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
> >  2 files changed, 138 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 88230c4e00ea..2f25575e6efe 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -456,6 +456,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
> >  
> >  talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
> >  
> > diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > new file mode 100644
> > index 000000000000..cfb563658fe0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
> > @@ -0,0 +1,137 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +/dts-v1/;
> > +
> > +#include "talos-lyra-evk-som.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. QCS615 Talos lyra EVK";
> 
> Is it 'lyra' or 'Lyra'?
> 
> > +	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
> > +	chassis-type = "embedded";
> > +
> > +	dp0-connector {
> > +		compatible = "dp-connector";
> > +		label = "DP0";
> > +		type = "full-size";
> > +
> > +		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> 
> Why is it being declared here rather than in the DP controller?
> Declaring it here would bypass DP controller state machine.
I keep it similar to talos-evk: https://lore.kernel.org/all/20260331060107.501561-4-tessolveupstream@gmail.com/
In next revision, i will remove hpd-gpios and use DP controller state machine:

 &mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
 &tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio104";
+		function = "dp_hot";
+		bias-disable;
+	};
 
> > +
> > +		port {
> > +			dp0_connector_in: endpoint {
> > +				remote-endpoint = <&mdss_dp0_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +};
> > +
> 
> [..]
> 
> > +
> > +&usb_1 {
> > +	dr_mode = "peripheral";
> 
> Is it going to only support peripheral mode or is OTG going to be added
> later?
> 
> > +
> > +	status = "okay";
> > +};
> > +
> > +&usb_1_hsphy {
> > +	vdd-supply = <&vreg_l5a>;
> > +	vdda-pll-supply = <&vreg_l12a>;
> > +	vdda-phy-dpdm-supply = <&vreg_l13a>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&usb_2 {
> > +	dr_mode = "host";
> 
> Same question. Is it host-only or will OTG be added later?
> 
> Is there a separate VBUS supply if it's the host mode controller?
> 
> > +
> > +	status = "okay";
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry
