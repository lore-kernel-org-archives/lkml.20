Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103306;
	b=IoRZwOOPQnUMfRGlY5cKSn6p2DUpaHZww7tsCnXtUa4xZFMFOKHruWy42MuxqHcKKidD
	 TGCqIM49w9LSxONiefFyuQvkpjp0sVyR1EZQ7EV8+lY773xHfUvXAR6/oOk/FCWSB7S2T
	 8iqmZF4Upe98+Ssk5T9QvyVx5Oj8RbX8T/TAM2YR/S3QJnGReKNC7HqaO+Hvb+xJgv0Jw
	 cAfFAtuD6MM78Wukx/dmkZiYxOCojB0pF5z9wr83UwaKcDzxJDHZCtgf8+1W1AQtVy0dx
	 Tvl+sETJ4PuBs3cn1eqUdgnBWdeabCoxjqjEJBbiwY1eOy1mFb2rQU5hHxlhh7KK3bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
	b=sNbHH4xFl7TUCwAbCItsI5AAGakxkaae4IFpS7PpMD3dMYTPDeBifUc/dPfVs4vAFMQM
	 IpRijJBwMUk+QCsXg0H/KupIrdP0wl8HKNYfPmPkD7us1Xpr+M0ZdehtwPeUQuU+cRtBo
	 11EXEl+y3x22lHQlb8OrRzqVt5mvW9BCHqwWFU0tJtHT4XeySiOJ7ODbBc+8Ql6OkR1AM
	 C/HkHrJrEZ3i7WkXRZAxBrVtE5iTN3U0eD2xadQE6PEKKTTvGwK80jl8mdRC8YQ+4ETmy
	 FPrS6xMUpmCV5FEONkq/aVgbUb1GCPWPlsdcjmEnndM+HEQO69Xtl8K43+Oady9bbgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91960A6F4E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D91960A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwgWJcIC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=earvUgEV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3X2432382
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=; b=iwgWJcICdcc6gV3A
	qe0suHdChWmHmOKJsdg1kL1rZzjhWhOVWIGk9E6CtdYtKM35tb5ZgwZhL8sLnpID
	RfEnkAUttShz5+WVJ11jDGTgVP2LyGM+FxxxhKTnLK5g3PONLtzL/sAOu4izbKHc
	NGwAiq3tEy4lG8Ch5K+vxfaCTQVLl5fNwFGZx9IysMNinK/hI+tGYo8w5Q/wLzYK
	FTKLGf0FAdxr9F96r7F0bk06GOZCpBbt7isN0TP8Pl+cGykH89kf1l7isyFZACk6
	uiLWCcX/Nk0SR2isRw1YEqls9hn+Yovvd6v91ga3xC28qtnEYLthtExGZj8TL+hn
	7s+MrQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kqav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:15:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso205847137.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103304; x=1793708104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=earvUgEV45W4sQyW6cT4D9W69MCVM/ofR9SAHYeIs2efFlqa3RnqT5PWx9vib5PNJO
         xZESJ2A4LjAU6QBI6ySuBmFBygHQI0Is2hOWX6i5o7PmpFc9p4Hr6MIH3d02O6OA8qk9
         giW/yTZgMtmm7dSx6F7HnrCpxKtE0HuANkTA4KdxaWk0DP1+RmFgyp/XqHOI2zny4sME
         rA+aTEn1K5HfBnMZWdi32A593DaTEvsYnMB78ybv1bg9wSx1mvhOHPFGkhOuxfewYslr
         /X1hxTrm0/AEivOaUIt0hV/REJ2D3qbpnLgsK9329ssXMabckKV+HeDnMU6ZT7brrexP
         dgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103304; x=1793708104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rykTonyFAeLEAfuBPMPvdjyS9K7dIu+izpb6Sdbdk18=;
        b=UL4Rc8EXMX/KmHEzXmeGVOQ5TxgPxJyyfaH36RG7kiQIZDoV/hIWygGkF/cW7Bh2Ax
         QiHc4kPlZ87o1H/dX6NR4WYbmR+C5E8Ei8ul8sGOM2zS+xxnF7OO0gpYG+iA4KgiVIKA
         +EP7bCPbeKQjWNaQQJxJomiEsHiMcp6XHvNicq3MTDbQMUqgv6NITLAwzCph2qOVf+TB
         o0xDc5OXLDONgCR3kHkajcNrLPftzOk6WBoJ4jmAFRupfRZ4d8sF4pgNr+L4errNnBBj
         OExK++kJeo8HxVrgEHrC7vZkOOhmUnIabusNvpaBilOaUefH3wg3GVqcSiudZXcjhdPp
         /aYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8EEMlWrasOGoc8OJSOdWxGhgLFV3UGdDbaQe42jT/hjkG9mOSx7hTPrSeXzZX+yFv7bo8vjoT0NoRi7E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHciVsNRlX+h1eHoMaOEa+3wP/Dw00dEdkSKG7naPjNa1FvSga
	Te+jQtQnDisB5r/M44xFobE7p+PqeYlPcdvWhpBsKPfzTIxse9DEs+cWYmlFI/NxlvsObqIzP6f
	BPMdN6ZfOSIPLreiDk4/UwyzMr0MKEpBtHEOnRhK9AUqMzDknqzo1PdPCFvctUi3Vmzc=
X-Gm-Gg: AYBFou3iZGo6aGV5pZBVGYQi6q9nI9g/lZPEYN1X95nkc7VkACNy32Ty6Aziys229Zp
	DWmYP7HL6iAslhprZqnJJUd6oCBT8mL3ACmBCYXlorCtgGX4l10/FP3e6uQakV5JAW4oiZwBwJA
	oa2hz2kMcf0BbHl7NsRTi58P/iwo7r39fTp0zyD2bB3o+U7SSzOjPKXOy1MslJmHtl2fC888bck
	SHSmMHQXc5Q72k4QX0V3wxiyGUAh/WVd5fuwwTzj8Lqsscjh/4oRhhAd69K7As1Rl4FMS5fp7Xk
	vF9wA+RWZrhHU0tU27GCM3gu3QsaSQSxT5w6c5QXyFWkdPK4msgqUmbcqwdXkT5D/E5XmZ4ClEQ
	IucgzGucJlBVr2zdeHBjUGA==
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371767e0c.0.1793103303834;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
X-Received: by 2002:a05:6123:5cf:20b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ec23954451mr3371755e0c.0.1793103303398;
        Tue, 27 Oct 2026 05:15:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89dbsm432825166b.18.2026.10.27.05.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:15:02 -0700 (PDT)
Message-ID: <c0c38ce1-7491-47b8-af5a-d3968d755085@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:14:59 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
To: patches@brar.si, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX+unpNlYYkCzK
 9TxIB1W4qklZSgxaOCSYmatHh5L+2YNBtBrEFc/eowPbukbkhHmAr8Jtjb8K7Wqd34O8j5scpHL
 Ot2Wu2Qnl6BywBdNhhgKmUo1ncKu+kI=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae095c9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2zQhOlC99_H9tdcWL1cA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: lAvjUk-v5F01vNJoXWJnbCFEjVIXGgpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX7PWuUv/0GYgE
 2ngC0zvRaDeCZSfhjSWHlJiOO2BjQDt3ZVBf7YxsWk5jhRzwdr916f7WlBOKKOwHghyykw4qvi4
 ltrDOCyiJ2zAkAIjeJHJy2QjJye7hPQOVHG4gAvZ1G5TwE8o6NnVcDsZe+Jzf2HgA+INIoWSpGk
 nrD27U0HeirDTEm/z5GjqIxaAascc20r1ugb+sFF7gTyJbpMyvL00taaaLXnAaJUsUv2ugTM4H+
 W0DqD/POLcTR956gxymh4gvMn5Kk64cbsY9KEIT5EvgN5y9WDvpF009sBTiUfieCL+YVelbP61p
 tZGBEgSF2xRMIWL1pnn7DXdPtTyTQPISCzfvubSih0RVsnWt3fIyaMTIEQMqfJCaANj9xSVa5gq
 sP/hZHrHWngSeHkJTwd1WoE58ZyoYMFkHcObxDSTvYoWLQer+Zb9sgG9fy6JYePYKUJczBJK68L
 FnpJd5L10o4QmmrUqwg==
X-Proofpoint-GUID: lAvjUk-v5F01vNJoXWJnbCFEjVIXGgpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270048

On 10/27/26 5:35 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.

[...]

> +#define CX_GMU_CBCR_SLEEP_MASK		0xf
> +#define CX_GMU_CBCR_SLEEP_SHIFT		4
> +#define CX_GMU_CBCR_WAKE_MASK		0xf
> +#define CX_GMU_CBCR_WAKE_SHIFT		8

#define CX_GMU_CBCR_SLEEP_MASK		GENMASK(7, 4)
#define CX_GMU_CBCR_WAKE_MASK		GENMASK(11, 8)

[...]

> +static void gpu_cc_sm7250_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	unsigned int value, mask;
> +
> +	/*
> +	 * Configure gpu_cc_cx_gmu_clk with recommended
> +	 * wakeup/sleep settings
> +	 */
> +	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
> +	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
> +	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
> +	regmap_update_bits(regmap, 0x1098, mask, value);

and then here:

mask = CX_GMU_CBCR_WAKE_MASK | CX_GMU_CBCR_SLEEP_MASK;
value = FIELD_PREP(CX_GMU_CBCR_WAKE_MASK, 0xf) |
	FIELD_PREP(CX_GMU_CBCR_SLEEP_MASK, 0xf);
regmap_update_bits(regmap, 0x1098, mask, value);


you'll also want .use_rpm in the desc struct

Konrad
