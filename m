Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE007440643
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394080; cv=none; b=sXbWuLAW2oajtitai5OsjTLL3L5y7c4UksYQn1vB2lpK3RRk4FFoWuwwAStyh3qx+gcCmQjExZXGFoEAczu/1xiXqXLgF0+rxQYeJaOKRB6ONcewkj1cSbGryJt9XSOW6l+P2vY+vxrkpSAEMDijIpRyCYGRdOMRItiHVX/AKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394080; c=relaxed/simple;
	bh=FO6B7ZAaXGZLfF5gxpyIHscYj6HA8lcMSG3+bwdUkO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGSiCWijRLKYLaizNXD8LzAisAbJus1VaUr3hkYM1UVZBC2tqqzzQCFkVuJQgbY0FU86Y+sZZd83//Uc9JMm8ffLYUTjOGbOzuKfhKlxkomXAdEjtZL8MH9xHttLR5vjABGjqddLjUBW7ForMcVmYU07QIPql5n7XRnm1/1eKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOZhbNET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkxZ3Mxh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOZhbNET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkxZ3Mxh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Xpn4157628
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tof0ENhBw4ELkanr9NwB/h2C
	JnA1o7lWbEmswvGyBHU=; b=YOZhbNET4jdplSRTsO5/v2ZvDkRcb6X+TmtY55TO
	vq2F1u16kAiron6NM+K47sZWVHFcM6ik4OiZpw11bph8Hpubk80KCw1rpVzM6X/t
	3ePdOIW+YthBMQo+fWg1QxgnzkLHvUlCFOYifY2/rF/jnBaHXuWwOB97pWBTjDsA
	2SrTN/OjIaJ/1rS7UOfTlPKujGDvFLIECn7KbxdaX+vXbLw1aSAus3IUK4crgMhV
	d1TTg0xOy1kR7KJ+7JbD9s+RLLcr1XyNd4bjbpmcq1CEyForAjhF7NGEXY315bHp
	NMHNRhLlp9g6w4yjBa6iX7NiYM0HfTUnm9QNfvPqcWiFEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f1943-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:54:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso491275885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394076; x=1789998876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tof0ENhBw4ELkanr9NwB/h2CJnA1o7lWbEmswvGyBHU=;
        b=CkxZ3Mxh3o53L94NYdcawb2aLB4U/X9Vv0+lTgfhntsRRviA7e4DhgqtqHH/rhTiQ4
         l6JXQLf7M9SjGnkksFg7qGyBa5B07AIs1Yd+/YnlNE+mATKfX8zyPBm323ao3q3h0v7R
         MMXj3ow3dy45mrhG5+Y/IAT3nYEyYvcGHw3F68Cuofn4PoVIIStE76EnvuS9uB1QC+i8
         lkfqRbvWs1TYwFt2AWQhgyHxhpy/fS1eSOExji/B4t00nu+ei2oF2PYByPKZhJFy4YPG
         Cq8deZF1NbVzsRe9NL4yOwmJUr0EuQKGx7eM5drd4b8qpbfdUk6mB1sw9npWKNnWvv03
         FM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394076; x=1789998876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tof0ENhBw4ELkanr9NwB/h2CJnA1o7lWbEmswvGyBHU=;
        b=QMnM5elMBAn4+1xuILL+VOAXzMRCg/iBFKBgN8/Dc7yFYLa0r6p9LlZW/mNb0POfLh
         +13wUVxwG2+DuYBMWaFfPDpqVtHGpRTjkCEopKURhXHDci46SwsoutB+MFJYfLrIHP+D
         gfVmIcwMko4jMDBtoe1wxZnExZtwmuCb05TGmHWi7GxkskB6bKNoPCsUR6oHZZJxQxa5
         WB4P/1l+HpGjonm2mD3hEIpLvdRLQ8HoTK/ZuUzZYPE0f77zLh/96U1JTgL2jGPW9as3
         2oEh6eAad4/wH5XeBigu/wAAPClfGlX69H/rgr0xLrm1uxZbPd1/MjuJStWlRkOQInMs
         GQyA==
X-Forwarded-Encrypted: i=1; AKwUvBxDGTjZVjpLqT+bLByRFTrE9SjB39Nf50HEmZolfIiMwLMHkIyq4IOk2jrcXM3ljT9BxOMe822ghWddAH8=@vger.kernel.org
X-Gm-Message-State: AFuF++lBA08tmMcu5OcpAu811TKxTd5dxC7j9vXxQeT4k5Or4zV8rRf7
	ZKmj/yaUmQn/mykrvlfpyroCb9av1V1QDTcZd2bFT8Hmr0lRqwYKJC1Lsb/JjL1B3bT4XNkOBxX
	NmcSUrQryP260LtQTPa+Qcj0EVHlEOE16MvrQfuxoJh11U6rS7MWp8DwolTa+PeFK8LI=
X-Gm-Gg: AYBFou0upESLN7rj8RQyiqiXQp+RLU6HYG/leDZH17uN4OMW45nyvdTDEkz0bChSDMA
	rv3N4TIS0oz1fC6ftuN73njtdkFjhp/Ht1chjUNbJia9Am9nz3eQWRy8Z3ML7sAnsjAbtetZRMD
	N3esIUODbet1sw0L5BFntMD+4LECaCk4tpzOlsMACt7jknZdOkditNmPh/0dUbzAmDDJ7E/8qjn
	jG4Lc6bVKi0yNhRLnUw8pnj5dQXLZGAVnQFFWthMXbSXiZSNmsHJJLtv8k5Uap1nUPfQU+ekXca
	L7L5mKvVUCsuURo9uz203lMEcytKK2EO98P6h5FopGpKlnC9LmziaIAkswI8wNCvywkmDGQ+gCK
	2wKAIES3YNbNt/JY=
X-Received: by 2002:a05:620a:2702:b0:93a:abf:8163 with SMTP id af79cd13be357-93a29a05868mr415533685a.36.1789394076137;
        Mon, 14 Sep 2026 06:54:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2702:b0:93a:abf:8163 with SMTP id af79cd13be357-93a29a05868mr415523685a.36.1789394075329;
        Mon, 14 Sep 2026 06:54:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ac411asm304604975e9.8.2026.09.14.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:54:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:54:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: nord: Add PCIe PHY and controller
 nodes
Message-ID: <zpf7ndcqomayydr5axoim7rf6brenhs7nkexw32gkyo5cuamxi@g2hxdgle2h5p>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-2-shengchao.guo@oss.qualcomm.com>
 <aqeigXZC7w4CmMl6@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqeigXZC7w4CmMl6@QCOM-aGQu4IUr3Y>
X-Proofpoint-ORIG-GUID: zo72LirsQ2QTZ-ntNYgOZ7Du4UQMEQ4P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfX1GrDcLzJ9c4q
 3O6TGeI1ZQma0nmTg7ikAHA/aoO2jzLfDOEfdg7rOGxWOTuf1vpdsDf1yCGw3qUriKZdVtACNJw
 lKlu4wZnlTP9yLB9pfPyoecpMTLeWhc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OSBTYWx0ZWRfXxb5WMN4L+Az3
 7SyH33nOw9y1jqhNYeu1UA66EzIDg0Jsu8lY1C+AtjaApVzKOvua56/dZA6aYChm9QDVdBD5+9F
 VCwCEZoygXgpD/j6V1u19X4fMz+tDTlMC4XcRxDREYRkb3Edj1Psh/baNVZVDOr+AzHb5HxX5vI
 0EoZUmoYH4txFBztvnb2UK5dn7QoeUHzCZ1/r1CW3XQLgnFgohMMlUkSaSMKbv3DVkg4eHj6GpL
 rxPsqI0ZP6wzQlGVEHugrU3/gpxzNQ6dXfYB3f4fJebzfz9jtNAO35A0zK1JUX+SA6dtBJYGbTt
 sqt/NIl3BQvNAbXiLcGY72ofSrRcg+80PWydinuQe/sNmmvtFrExi60IMI3wclkdLLnEDa7cr7D
 ovv76LiYVgKbaq8Y1Yk55WDG8zxSpIZTjUD4BMS+GwGNtxB2vydNxZ4VyPxi/VndMmZquM4xzSu
 ezn34b8UDWHVBhVljtw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7fc9d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UMe-PY-mz3fTUZ27lzsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zo72LirsQ2QTZ-ntNYgOZ7Du4UQMEQ4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140199

On 26-09-14 15:30:09, Shawn Guo wrote:
> On Mon, Sep 14, 2026 at 03:19:40PM +0800, Shawn Guo wrote:
> > From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > 
> > Nord has four PCIe controllers backed by a single quadfurcated Gen5
> > QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
> > can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
> > topology in effect is selected by firmware through the TCSR link-config
> > mode register, which the PHY driver reads at probe time.  Describe the
> > x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
> > configuration the boards ship with.
> > 
> > Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
> > with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
> > and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
> > also become available now, so hook them up as GCC parents in place of
> > the <0> placeholders.
> > 
> > The controllers and the PHY are left disabled here and enabled per
> > board.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

With your own comment addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
