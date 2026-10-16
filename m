Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A234041B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141870; cv=none; b=mLErSKZAOZVROs0a7pDxsuiO0oJtBXLSktqFtN42ErKAp/+0tDSDwdlR6NPmwjHgrrkuvatKKV8M+fWuMdGbTSLnYerrEuTkjESWibTy5Cgn7OqsYZORKsDR5S/Sz09o4mnLDUccESLCBm3aHzmdk/+MXETo0KDGb/6qy/+IhFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141870; c=relaxed/simple;
	bh=ui6Bd43itbPmjDYfgjpB4sJYquNsVyCGU4xYMkeRH2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geYNBppGophDXWbtxrE+ZRIXq3f82mlBZTGBhXdJsXL7YCg0iuRzJwFy+x/p1Aal+jnJQstP4afl8McLQPffoGTRVKxTE+21nSSX6MGx2hQoryHT0dEV9oRCBrecxieVADdmBU3ybly7yUTYBys8IsNMnzwK+TdJcXLx0WLlYes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mO1EusKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApVN/73g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mO1EusKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApVN/73g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lVtn2885489
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=; b=mO1EusKON6JQKbrg
	dwNjWV0Z0zHVec1VDd0Qwkn03nRBvGXbbG++qvBxjK1rGs/ZDAxT4bpQE8/EOOqB
	hefaSQyfs/qOWf+hNJ+mbdWf95Lo/lDzP8dVA+eXcmiBcqrhu7e3qRB8JC/9Vf9H
	m7XQM9iaqZc89S6tCLzyZRN2xL/p/BObKeTBi9m9D/lQXflPkx3W6xOZG/R6IjPI
	dz0m37f+Cey+mUWrh318vbQ1eTtLGjYK+CP4gNSSfzI584O6VD/LJlhQZUt3atnU
	7KwxR2FO5ui+Edo0JmrmppKNbhX+y0VmMLlipeZnG0hxWP964/DCJx6Za59R0wME
	1tVEhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261jtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:11:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so122478885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141867; x=1792746667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=;
        b=ApVN/73gGE6oqQP6YWv5XVIEzCk8Ofeo3H7/nQF+TtVWVGt5eDrX68n6ShIt9O9cPk
         9zFnqwm7hDd/IN14YJjBEBlBLuOTsYLcM3KTVLFeTSLvwuF9zJ8FGYRhGe/knFYKYxPa
         0KWQHaA8+rLNMDdJ1bnLWV4winTbKJy6vW8mTsW6T6vKHHSb7CHDsPtwzw8ZawJyvVSn
         45T7umiVBygVUUMqaG+TOpmz5GFKXzgBEX1WOomW69Vg2QTdTXxi/yS3wFplvS+ErEQY
         BzO1YCWZMrorx5yY122hrD7bvTbdx3rIFuVeptTZbjhtapjEGObUMRfxlS2lXom8ZC5C
         8K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141867; x=1792746667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QIOZtlc4H5WdZ+JHF5mX59cxfjXnkubowR3t/yD78FI=;
        b=qVkjlQZTFoD7MZlryMGwvbjj4mV6FKD7uC7rpjj60LHCs8pXrSQOjfjfiV35IKkHvQ
         jZZvrUge5PjP5E7Fvtaooh3Nhee+eFWXigbM3ZQb0Aoa/OG+YXXemS8Fe5++wluBoxlD
         zrn+cFdZ7sSII+dBpFSyOf9voZ+wtwvaLtXSAC5lIQV2Uyk7ZKliT9v0XNDhbtSXnHQ2
         1qC2DzYXHzdafiW/MdTgga3dVhZp4Ie5xS70j5iMZPw3yNgxAOWUF9XKQPhhC1QNVtgk
         sYiWsFeYbvZUBrjpIgoRPGscrT6ZACf4G37S0On7fo9/H6KMBKdX5vm+Bxy9w8UxO72l
         u+hg==
X-Forwarded-Encrypted: i=1; AKwUvBy6I2IHjlQ+W3y9UFUqrlcf6C8/5EjEVVjJpQSgrURnBS/oInkj/HqCW//HEJVv2Xu62c7PeZSnOaYRgSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgx4WTUTFghANhjAuF258+jzWHRm7y8/f/5Dv+85Vmngt3x9d0
	dxXR7eS/idOpVA7AKwx/Jv5LC8VSmBSx4YsWaR9ScNlAMbZCVS2glTun4T5QR0/qEPPM+3z1zjZ
	rwHk7ABxW7wI/wCUSXH9EKiaKxFLdqE2b3UQfRgxAjTJZaVwh4NRi3plMV9F/ao1YPKs=
X-Gm-Gg: AYBFou2NJnGf3F89N8dxYaFWmWr7Ti21nc/fJqdhyDmCLkGIFUJGu0fShnKCGreYNn1
	STefwo78sFQWNiyAwCNgoakII9dbGq0qvWM/EyOXzpkT+Th72j9m9MKb53qaZC6xMG4lRxK3sfk
	yoGb/JugPuqacOiSeptsFqrQw6amIXB3jhFBWbDLgRMn1/dqHw/sAEYThSzFTQ78koZca3De1L2
	QKA/Jx2JyLJlyE2dqeg/JsW51I5AMus/q8zK2VqfrpRonQ4jp6yLqD6w0Jt4rYuF4/AEzkQc9QB
	I152gWwW6QLs8RDVYobMIx0WKu1HnMkbsBGJhokYyHg9p3rhfhAW4WHZXlFXqYGhAxzsRDYqQYk
	Pj5utqc0QWJBP6TDnBu+njw==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4105014285a.2.1792141867110;
        Fri, 16 Oct 2026 02:11:07 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4105008985a.2.1792141866485;
        Fri, 16 Oct 2026 02:11:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1c55sm54193766b.74.2026.10.16.02.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:11:05 -0700 (PDT)
Message-ID: <e7768d31-a6bf-4ac3-af30-9de313b16ccd@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:11:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-3-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1ea2c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dzNGixxSrynEd2cHrbYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX7wijrBKdnArc
 jqu1HoMdBZPLERj8svX9+ns/Bw/h+dEUNbbfDwYucvcYrrmpccOBDX+6QOUbD6qxJx16viJSZSZ
 chRy2zIo5uZ5ZFKLqiDR9PKGyxhHyVPScQ+ExU2EdlXK003V7CS1VA0bxdKRBms6NQ2LteNnaEF
 quLRdzGnV51pAsYGWKqtn6YrKrGKOOd+ihsxTjylbC0fhi6QG1QrVysF5dPQT1SfyX2m5x69MDw
 tFcYOxgeF6QiEMBb0TCbBKiIy70VO/giSzfW8Ys5EehikAxdUm3GnCQDDJKQauR6Nc7nyF4bMdP
 p2nAd8uJBtguzkKugkuqDeyg65DP8Z/K+h2eLy4Tz0rhFJ6/LMP62yJ7ieZ0kUI5kBzGCvGfRvW
 GRPvTzmT7G8Co6GnPl9iqsfVmODYodeGe4ry9Sl/p/T6PYzpOi7usUsYupvaaV6KNUkmOKRfklY
 RB7yJ9DRvTDn2G3/tEA==
X-Proofpoint-ORIG-GUID: cFRzYXEyAD6n_KQjBKSMmt_T_tvYoURp
X-Proofpoint-GUID: cFRzYXEyAD6n_KQjBKSMmt_T_tvYoURp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX/g7s9zNXUkz2
 HcPRghERosGYiyNazRBZ0oNVG65VrzIsKr7afLaWL0ljBvmh49tFMUt5J0mOV02OJtMfM1QxbE9
 otnkrRLH/QM8G5qWTrrnuW9BQmka17M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.

[...]

> +			mdss_dp0: displayport-controller@9ad2000 {
> +				compatible = "qcom,kaanapali-dp";
> +				reg = <0x0 0x09ad2000 0x0 0x10c>,

sz=0x200

> +				      <0x0 0x09ad2200 0x0 0xc8>,

sz=0x200

> +				      <0x0 0x09ad3000 0x0 0x78>,

sz=0xc00

> +				      <0x0 0x09ad4000 0x0 0xa0>,

sz=0x400

> +				      <0x0 0x09ad5000 0x0 0xa0>;

sz=0x400> +
> +				interrupts-extended = <&mdss 12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
> +
> +				clock-names = "core_iface",

Stray \n above

Konrad
