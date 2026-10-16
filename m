Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FF481A9C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158747; cv=none; b=b60NxVtTawWeOF5h9LZpu2Xbii9N/R8lyUU3PwCPA73o7R3OTLCBLofYmRpgY6xYjrCAvHr9tlje7HuvfPQ2kpFhYaNyS5DMiOOK27mHzWhBHiERTnz9mvByayIDNdBPEAAFhdF0S91r18WOA/A3DlGpIIQ5zgIK43ib1LO7LBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158747; c=relaxed/simple;
	bh=MHO3LECZcEweI/doUlmKSgCO016jmc/EpAtBXq32j/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoF0gD92uvG2zBlP7a4go3chqRQN937CTJR2d9bYGR8ZSEVPVcHjheZOL8EmxpHtEPTUZWphJ8Bb313TiEvKhbFTU/4OWFTBnfgFjeyN9FzJKbgeuubvQgbtjMuF0Ekbbd1JoNvT0TtjMlP6mMZJNPopiKhRXWPe+PLLtIAZtvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUtbpD59; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gERNHePL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUtbpD59";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gERNHePL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GDEF292802816
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLxB7J/nBOK8LYeIBB5tLp00PP2z/rgyyGfBPU2+HMA=; b=hUtbpD59cnUS8jwj
	4bVBT2MsUQ4gInT6zUwX+tS0YF7Le3FXDFoKKpLw/rpSbloRgm6B5Bu2k4aXE/vC
	oZNhOMcqBV8M+QX5tmg/oF9KOsZOi5Xo0HRdNhEmL2NouwnJVTEq3osoIc/AEror
	2zasqoqEOqcUmFj90LPQENLsVTRCOIp3kmVEpvSowFRWMoY6Hbl03rAKRBuzIlix
	l1IgZppnuXb7sAMrcSMcSBO4mC9nK4IVHgB/96yNH/CZp1lfHoBXUNPQ3JJ00rFh
	26srT0SQMUbGjmg9LXFA+zr9TLoGhEJW9KBTrEBrA3BVwkD+/VXmoxkaHhjcXkcD
	F9aoEA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbmmq04sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:52:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5d44237e2faso357273e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158744; x=1792763544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLxB7J/nBOK8LYeIBB5tLp00PP2z/rgyyGfBPU2+HMA=;
        b=gERNHePLi7IUS5l0Ys57EFWm3wx1JSUdNShzJO0MyIDj6IQsSINHvGeaRHfYrU0mCA
         H+LKFfXBGM4aOaP0RpLWTfq+0B1bd5aeMSQICDtVH8ZFdoWqA4Y1Q7RtfE229k9AfF+1
         LREIjUpzl0fHIP31Ff5+IblX6i9I6LXgbO93YfmkO8LrZS+N0AsZiG/YHnWbLxt9Vgxj
         qJvElHB23DUaeTe/CFoPwU9jaai6i6fhIQk8q+88DiwNp2z4VLFKrJt7r95YOP/X10Do
         2TGHvRUm2GC/meajaVmavSni/Et85aE5IYKr8aJuBJHiRPdQ/IZZt2zTsjkiKW9ICHff
         w1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158744; x=1792763544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLxB7J/nBOK8LYeIBB5tLp00PP2z/rgyyGfBPU2+HMA=;
        b=XVHpbtkhrHazFjK51J0HP6TBz3InXreLfc/BMIgAzqHMRIz0TOVAJcZCt8FYCktwIf
         HZIm1UuBhNjEDnzIC1bobkrUaB/sl0BP2PY5zD4rkif6QkNFcF7bs3d+ECPDsVXItxAs
         hq1ZUwGmyUvwofacsPNKwGgw5TPAcWcGL7YvVaHGbrbSx84Urfp5AH6/N/Nfj1h2Zq1c
         Ez9rUpR4JLglSJqf4QIn3hMG59xcIeWK1lEUcFX06jVRAoCSTeFbXJvwqW3l/LGu3E4E
         rnOVg8IGuvIrI3N5kA38Ut2BuDM0bzRsJJzfo6JAuUSgY8lfUKcOVAMYIHL0RVqP3VM/
         ACmA==
X-Forwarded-Encrypted: i=1; AKwUvBw3sGEc9aY1c6eH+KlcLRMqn+xeEpFHsXJGibzGQDQ8pUhwWVtu9amQqDIfnpHPRgdyLhA6IsGqM115N5o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvvpHC9BY5s6NJ+uvrKSuT6vfsruh8L+0NO4bETwiqnZqYWGVY
	2K2XniStM9tg/yhQ3WLkGFxJMvk0JnuiP6o6YgXfhdV2RUh5vUTBwXuMJA/DX/i0jcb4aBBPoE1
	jGuP/lUETpKMP2ozoadJGrVp4LvyTDFAvdABYIvoFfDOOKNBHEDXad5NkItlUhi7OZZ0=
X-Gm-Gg: AYBFou2ovgSkxZx6dfosbdPidPkXzTZmT4NO8Nf2BQldH5MPZATbMpOdXYZ67CY5dUt
	gG9pV+BLOh20fBCFToJhf7XdOBdZ1octGGI9btkiWxYvUJGLOFX+CNVivHNNiNVJSsS/FZLKLn/
	k2oX/iOEMFk0DPlaGgebhDnO9eteHMN7DFK6HR6JiMObzuQ9hlDEMx/yDBmXpBWb6cFJtC2F+Hm
	e+X4irNdO3pQo/nfll4aS00FPMcQQ/dBcnST9vVAgjvp1e2PzsDAgghiiOW575LKZmMYHpNn0XH
	MAbc4vIx3SJjUQv2LuoWu1gE+G6njNncWCY3ho3CCT0nZ7NofpZ9puoKbeIQdNo0paWyKwfnn1V
	oOt5TcKeuFDP7XqQjctsB3A==
X-Received: by 2002:a05:6122:889a:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5eaaa6a1a9cmr1890e0c.5.1792158744175;
        Fri, 16 Oct 2026 06:52:24 -0700 (PDT)
X-Received: by 2002:a05:6122:889a:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5eaaa6a1a9cmr1883e0c.5.1792158743730;
        Fri, 16 Oct 2026 06:52:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40914c3f00sm70474466b.48.2026.10.16.06.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:52:22 -0700 (PDT)
Message-ID: <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:52:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock
 controller driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-4-fd4c2b3cbdea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-4-fd4c2b3cbdea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX9HO19O6UcvOu
 KBuRmBYWN3zfqTfSDhLmcNZnAx3Lrf1JCLqpoNmr5q60HfeiK/D2KNf/K0V0Y7ePWAkVj7tXCKy
 6ofyK4Uo53x9X5RvXsOdO0Rpn1OQKyo=
X-Authority-Analysis: v=2.4 cv=P9uvFSAu c=1 sm=1 tr=0 ts=6ad22c18 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=YTQOkCY0yVHAAEeTYYAA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX+HEFdz7oto1k
 mR8hCyUoWWHBKck4+RVIVlyhf6qahl/bTVf5fQ2Y4RCnVkXE3atVqlut097PM+PNLc9E7qZmZcn
 C9FfCkX8PoX9jmtWAPFSIFfu+2DN1x/oNZ8JZ+H3d5uyMxUXCB57p/SfO9WKzTzLSjXyfzqNBsV
 rTEcVFW2cUnA9EPWPKk7FcW7JvdVWoJEbdCQvv2HFUa1p4K3m9aFJrFZaTxssy0N4KcLA8Leutr
 vaPOSVTA+p52zN+M+9GaNQiq0U3M+ZO+JknvuSwJvMKlgee4VsQODAvjML1i2djJAcFLEkLp7T3
 JnrVa/MXZv4WfgyP8Wu68zGW2xpHSF6CLel99zFP80GTOQ2JOd5v09RiwT0hbFN9nvKQ/4i4nFv
 jSmSTcJOZvACJeAj3YT3qeleLFoNquTFdQnIFj3hBElcy2RA/HWzT1+Cy9z7vjBzCU2ZM/QBvSl
 PyqSOizWgr2QkFJ3GAg==
X-Proofpoint-GUID: 60m3qfslcCnOOb-bF5b4VMfJAvi-Muj5
X-Proofpoint-ORIG-GUID: 60m3qfslcCnOOb-bF5b4VMfJAvi-Muj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160055

On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks.
> The four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the
> L3 are each clocked by their own Zonda PLL. Each clock is selected
> through a glitch-free mux (GFM) whose parents are XO, GPLL0 and the
> corresponding PLL. The gold mux can also select the PLL's post-divider

[...]

> +static struct clk_branch apss_silver_core_clk = {
> +	.halt_reg = 0x8c,
> +	.clkr = {
> +		.enable_reg = 0x8c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "apss_silver_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&silver_apss_pll_gfmux.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Do the clocks have to be enabled even if the CPUs are offline?

Konrad
