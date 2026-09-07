Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F16352C3C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757545; cv=none; b=T20N88d3ALzkITTtdcqYkGcTrqD5gxxpgMirKWG2I2Key3eCezFMUhHw4JIfX9EHVszWiOWV2dyQiOiNMfN1lXQCy8NCvxzoxHU7OuOPqFoAdtSD6dZKgOu+C3KyKU3POA0NbTTZGMViAtkXxv7/6c4WwmZ+BloZ7lEyOhu338s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757545; c=relaxed/simple;
	bh=WabYORvD+LOGTdj3VELPHQl++OeHox5ejDwdc2FqqqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhJQ+LzyzX/xj6t7P+yowrANcp/phKZykKPTV4UpugN1hukwiwxzyfFAaJ3qgyPmnYYfOoYmWgUqxyrddVIujiINIzNHCqJd3jRTgsOrmZFBABS1ZaTZXrO6t3Fbm8SYf2LCQtKXLdkKQMJ4vhWBqswhqRDztfHZLWS+WZruTXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfxDBEEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bG+q/3rR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfxDBEEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bG+q/3rR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873ktt32276303
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 05:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WabYORvD+LOGTdj3VELPHQl+
	+OeHox5ejDwdc2FqqqQ=; b=dfxDBEEM/cGpHFRB6YoMX3CRESHLQ3IIwxBq/Ca/
	8uijCny08UR4Xgpb/+Z52fGPJSbk7d1bnFXXqmV30LaBXBvF0MAHp9q781n5mOZw
	la+FlGG3gTYovKfS16CVRJ1NnnoT4HxdZwKNCi90wTiq21ShQR1lCmMAy6yXw5X9
	JEUiTWBNXfbNMzg/iqptgT8AaptoB2HMlv3lbZCUABo74bSszMlFZ/zlpBMKJdk6
	kNEpx6cTKlkxF8rRbRv1EonDOCr9a2dy4ZYN+7kzE09Wl6dFHlW8qSPJ+dDkF+bt
	yt1AKjiSIKCtypAU+RKcUz3JqZjaM/E3/44AhxQmjtXeBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxkrurq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:05:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc2229450b4so3116352a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788757542; x=1789362342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WabYORvD+LOGTdj3VELPHQl++OeHox5ejDwdc2FqqqQ=;
        b=bG+q/3rRoS9omuekn7rGA9hRizuwjFKQkc0p8HJWwGTC+lRPSKb+GeCZvsSSYNbTY4
         q6/07H/wmGa6vpVTE4RpjQjjnSNKISvW4DcjnyCpkx+pjQLNAxrKHUg1liUpLtQEqyHI
         Ayaza6XdCv4zAsE4JTcJBfADFPhcJ7Ubco3xNUcscIYiy14Jy6V7j4DK9v3urafmXirr
         fbymYvHJeXiRQ7H8j29x17mnZEZckWjihx2O4Yy7FwUdDO7MzmC4w4RhYe99eT90pgSG
         nSOhm0CJx5Ttgd4sFUAwPN0wD6o2ku1wim+Qd6yLLd+12xvixYYLVGn2W2gAtWOk/7gl
         +F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757542; x=1789362342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WabYORvD+LOGTdj3VELPHQl++OeHox5ejDwdc2FqqqQ=;
        b=WMoEkU6WHG2ZW56fLKy+/FZYbdhswmJQIWg0hxGVy7mO+zJJJsYprtqtDEoD3yCk6D
         tuMPkG/uMcswXQJJ3FbETUKJtajlgupuxVG15jer6d5M5CFMtS4N83B7nVcuH15mmdn0
         xTnV07HG0j67F5W6YJKVSrcr5DrH9CziiuvWa/H/YGmRfQXudChPmnZ/+hW2kyOUb85j
         PNHiHMg5zFXnZhnTYbH5Ucsxox4FvrVrJUfSMeRCBEeac5ChYh5yRRQtm2HLs/PlW+d7
         jSmS+P1O/tgYu6dn+zEvnP+3fKj9CHdYvasxJnXJAXnths7te0JlbEDASpNow0aJpnmz
         cAVw==
X-Forwarded-Encrypted: i=1; AKwUvBx/n3gsVLDMttmRQXJuT/xXRLsr8S8lj4Zj5A3pcZu1TBTsE952Whc3nsWgMfCyyb7yXHY/qF6EeS4B8WQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kuAI278Ud4hP8CfwN8qHTDekxBoK7RiBc4xaSGOABpZMB+RO/I
	+G3lgT/GWpez2G1wepoOo0wjM/zhSTRuRqgUSE0aWdk2B58ESuGsZtNAtY7Rc+WGSZTECQT/5Yf
	PODB7zCoV9B4XgekKnqiO+YQmJv9u3dr5SKcadpO4GDXLfefYzzAiEkp5UGMjcw91+7A=
X-Gm-Gg: AYBFou2xnwnWBqAIqxwhfGvfZIYoyAB79O9guMg5Jt+YdY66CBLcj4X1GzZ7PBT7Eup
	SehYNNI2F093o5eV8Sx3NrrGPjctZg1w8erFEBPmLY6DX+oNh8967A6+GiKts9lC/HOYp4YjKPz
	UfIU+avStKse6y3wzfy9Y+wsen8N+rzrIPur/ulemANGZvdsSQFzyvkMlkS5f7CCgCAEg/3Z6Al
	6Dff+niy1Nr0YcKjwthyOzCgU9nq7kgb/9715sKBDJ1BOyr3FrXos+W9uu+qfF/TyiwmS384xL9
	GB+D9BaIChp5uNreprfuugImHsHMV4RLMEbTc5ofuFUCEE3aiiQi7vWAUsffEotIQ1bZB+C20qf
	JL11g5huCcgWVUXbeFZrs7tCoW1AOppwbcJy8km54axc+ag76P9A2WUuVP49aTPcisSxzA1rCUb
	h/QWHxnijcyOQpywXx5bkemUZCyx1VGg==
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr33412197a91.19.1788757541886;
        Sun, 06 Sep 2026 22:05:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr33412085a91.19.1788757541240;
        Sun, 06 Sep 2026 22:05:41 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm22004832c88.13.2026.09.06.22.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:05:40 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:35:33 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] usb: dwc3: core: Allow glue layer to pass
 reference clock rate
Message-ID: <ap5GHUJAW/8uGHUA@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-1-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-1-13e4e0f63123@outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1MSBTYWx0ZWRfX1Zqe0xwkPeK+
 Qr9vkLTCg2D85UTU+NModXkrmwyXJwAZwZ9QbCO+fmnSzTzv5Ti/NqpiXXpuoT3kAbqYVYx/B+t
 olb7ipFPPDuqTDKseC7t4C+M9z0cML7LoT+4PGcKn/bTL1+PJTYpoVX02+5PX5Vt/TF3gdIk+5y
 68q3v+nEjc46qQGaeVs02ZCzVzW/kfRibRdaDmb4W9SlkU+bOQtvEx7z/24Jet2klDRbGbB4GJe
 VaeO7U/f9lZTYUO5SxVNA1/zaHzhbHFZWpol4RYo4A7gE58o7pdnZCpBF2t4MErp0eOcFAC9+Qv
 Kk+VD0SQBDbZD1yvU7P2bhkT7a6xdxsT3Udv3SBD+KTr7Nmd6Pdgn6egnTgXSpasYnKi0ufvj62
 76anYGwQNpPLZgfYq2z0+mTbCpYWMph9t7b0XM/4IAHMJzkbOP9fOCboZTqUr7LaJa6pxj/Sy2p
 4Xdr+9x/a1wQSXklt6Q==
X-Proofpoint-GUID: N4vz650bRbrTcZMLThkeTOMbm4W_0NJK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1MSBTYWx0ZWRfX6Z/1322I/7t0
 cDu90u9DQik6UtZSZKeiY7Gc/DWSnXkN5kmFYcJ17I7DZrzpBzKXSLMF9BCI5/rtig6GrFZX7Wv
 LTN7tJxM1CY5e1aPytRXw9PK5bN0u/Q=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e4626 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=59Yo_YLqCPc3mkuWIEsA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: N4vz650bRbrTcZMLThkeTOMbm4W_0NJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070051

On Sun, Sep 06, 2026 at 08:46:40AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add ability to pass the reference clock rate from the glue layer to the
> DWC3 core driver. The core calculates the reference clock period and
> frame length adjustment based on the reference clock rate.
>
> In the flattened snsp-dwc3 model, it is currently not possible to pass a
> reference clock that differs from the default since:
> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>
> The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
> flag in dwc3_probe_data to true, which disables the core driver's clock
> management, thus it also doesn't acquire the reference clock from the
> devicetree needed in dwc3_ref_clk_period.
>
> There's an existing DT property 'snps,ref-clock-period-ns', but that's
> been deprecated. In addition, basing the rate from the period is often
> not accurate enough to derive the frame length adjustment value.
>
> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
> and IPQ9574 with a reference clock rate that computes values for the
> period and frame length adjustment different from the hardware default
> from moving to the flattened model.
>
> So, add ability to set the reference clock rate in dwc3_probe_data, then
> have the core obtain the clock rate and use that to calculate the
> required period and frame length adjustment.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
