Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799186;
	b=4+Tf/q/OLRLQ4S1WHuxpNTm/QpN80MVP6HFiGKvlEbeL3Wod8segZS6bVNKOQ/QcGo5R
	 eNDgXLYNt20F6xy7c+tTEqnDsYFNDoTF5TtcZI1FS/k/9bQoKPxwXscpR+pxJ/mvWWz2S
	 ojHYgeW8fTvzfk5cIvyep7g2kUnj0aD8wgpYvj1DAvQWbfA6NAgDJLVGoDhxNsaT9NEmX
	 10dlDBBk9CgehtxX7NT/fwWSiCAc3aBu8eGC/2gEFDNOuem3GKY25QWJrCKPhGHeaQrYO
	 uyWiitJ6Ec185vT2sCXluU98Gb4t+gvMAoinDnouPqplSXGSdpJhGV/uO+t4GVqJ+Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ViJ80SwzMdo4x80FNiQKAybVKAert5P6AfecpwXn3xA=;
	b=zak5q8Mv3CX9zkfxlJL2JyCYDS3tvbAw6DPiFj9fPl4VV2X2XWcJvuIFPjUckSpOytB5
	 eZEU4T5IzfKvHp94XZUCuyMROQ+m2P1u9hbTTrKVqrfinN/z2E/kgIsqCK0HM+hwXhPz/
	 d43a2sI32LEy19Q6bTcIRuNJ+lVIAUa8yTJufAYpSv3KDnTdgOb0Rk4xYp/GK6U5bZFCc
	 0h5hwGZ5iQZ4rY1t+1QT9uksIKG9Vfo90s5Js3m6PK/VYWipxvq6AtUmBxaIC6oOMvzq7
	 W4G34eJBmzEfuDgOuJT/Q21ZSx7gIFe4wsV4id32qy/h/3AWQ1XfEZHPXwCTSN7WZiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DjrrJ5Sv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GGSs/R3b";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B048A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B048A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DjrrJ5Sv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GGSs/R3b
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvAJa4006316
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViJ80SwzMdo4x80FNiQKAybVKAert5P6AfecpwXn3xA=; b=DjrrJ5SvEG1Q+kO8
	ud+fYm5Bwt6UizQEvpPtK22Yyns1FLyTblhInamR7tGHk9/NRNfdRdwsqWF+FWEm
	iCZ16AEBdFj05qwCNa+yDgNYsD11Z2qQcrBevyO6pqG+O5Tn3YC09/u2RWDwyK9E
	AT/Eos6vj+Hv3vXfBocFgEfwmzjAGR5fGICYRjeLjjKV8jYkva7+uLwR4rZl0teS
	O/sQqKFfbcTLvx9UB5E19P8z0z6+rZ21kEfEql0lbxnZOxjheifGKKS4Hunu1pcu
	p5iVoePIkKi4ZWiZ+UK0iNcS4CtcAHdbRxTWJBs+X4QiZcM74Q/ozG7QSZQkfWri
	dN3yMg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn27u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:46:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2415058eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792799183; x=1793403983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViJ80SwzMdo4x80FNiQKAybVKAert5P6AfecpwXn3xA=;
        b=GGSs/R3bOC6BmI/eacTV5moJf28nO2/GkLERYPPWpSL+It2dI/3eEtGivlHnxVs9+Y
         AqxDZKvgP3aCQdsiowwm0kXUThQSpVKxe4YVUyjFCe7JFMQD54XUN59qHl8HJdMj6BaX
         IC62cQM2XfmDJr1dFRBy4SmvtP+QEKJV/S89PedsmpA9YUucEBcnONT2ADzoT8XFPWm0
         pFKO+LsHOe3Wyt0EOF9FzRT+K3iuXzr9HIlLF/J/1F/U8KF2MJIpfqAQ0ur15Nxe41OU
         bCSAqo73Xsjy/snvUYn/vCm3pzOwfUSS/kFd/ZiToSzGpcbuw1jfNlKMzvmo/cBb6c8s
         eh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799183; x=1793403983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViJ80SwzMdo4x80FNiQKAybVKAert5P6AfecpwXn3xA=;
        b=u/Zg/gUpfsJrncYrFWJ7xMd32w4KDWl8MjbQlq62ylk4gvHuSBlwvMXEoHUWrazw7S
         eOR8uf0BbLHb36iFBt37kj+cVnNcOQggtaLYDaembOz9mir8o6zhUeL14Z9DFNvSuzyV
         6xoGvZJiiVYkNTFy5gH7fM8dRymS37oAzzNQrOc85Y7oZbKyvpUSnZf68yGJqFKU1ELR
         Bz4pjyCTeQahKg82epXdEOTmKThI5yAGpHJ3owsHo4iOnIDd2tv32sk1uqZqS7dinyfp
         cG8yqhnSw3HASHVFEXBNeggrQdXeO5zw6ALXTX9Fso/7uSDeY+EVuonatNo6bXCwaM2F
         c84A==
X-Forwarded-Encrypted: i=1; AKwUvBztSpGSo28wdCSdpYoBjEQ7XVxjpzfgTItBdebD67J/U9b12DaEwcHFh1nuviNkLyCtFzdDu4vZJNntxSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO+uxrhF+EHT4swu8hNGVNhDt26ZVebsZpfq084VyQg8YZ9gdQ
	cNRvRGEefR0hE2pzsbPnFVmS3gxE0uwqK1w30/CYjzMpxm+dAsxjBEfUNpoN+gZfQeTFzzPZ8q6
	0mJPx/X7r/pP4Zwd9EZ0RHzyt7cKGrSjSsx08cQzUek/rOLsbyKNFK+ugnNknE0xpAqY=
X-Gm-Gg: AYBFou20rwURH7JLN5Cr1bP4EmK0QW8xrFdE2HxO3/Zgld7uhkQSADxnqQE/qgU4/FX
	orndIVNN5G05mVziBW6GBgbcMPbZHONbW88KKAE8SihIaMfjzAEeNjFHwA5UT7siCKZEcY8L+FX
	Q9/CGL1BWlM0ukciI1x3QWCr7uot3a0PH1T1sY+7l0/dpKJPFFpx/Qgg8VyPoieMfej0sZ6jPpA
	3QzX9k7He2OUMeHbPop26+4lhaDfzvXy72jz8Su7nIjIrV0KcvEtoCOOm4a3d2EjDlG3oE0A9NL
	myWvntzaDAvHkdkedFp4kLF5PySuzrZuULFYl2PX0aq2HoHz3/tRGZyjiGZpN44/YflU0kY4I8i
	oYlR5tOOfsydn6BTvJsnfYcsJiZwC0M/9H5JfUdjz6/njKrM6wvs2xrrdXA==
X-Received: by 2002:a05:693c:880c:20b0:366:5ba9:9752 with SMTP id 5a478bee46e88-369e861aa5emr1087270eec.25.1792799182562;
        Fri, 23 Oct 2026 16:46:22 -0700 (PDT)
X-Received: by 2002:a05:693c:880c:20b0:366:5ba9:9752 with SMTP id 5a478bee46e88-369e861aa5emr1087222eec.25.1792799181664;
        Fri, 23 Oct 2026 16:46:21 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm2293715eec.25.2026.10.23.16.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 16:46:21 -0700 (PDT)
Message-ID: <feb5aefb-5e20-41b0-9f0f-fdbd57d68176@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:46:19 -0700
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
Subject: Re: [PATCH 2/3] phy: qcom-mipi-csi2: Add sa8775p C-PHY support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-3-anusha.nandi@oss.qualcomm.com>
 <6ae313c5-a6a0-42f3-ae2f-741c0f9a5f5b@linaro.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <6ae313c5-a6a0-42f3-ae2f-741c0f9a5f5b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfXyrmb6siTZqk8
 c1D8BMPFNLewxCiUQ8ZC/K6n8Um+QF35W+Ca78ZlFCyRxbTl3CxRSMA52DTegAI8of6nql+/SFA
 HCGPJErBVHAG9A9EEsUEi7XEjjizLbfoIVapAUc4XwagGxtO8sIDZYiUcGEtLtRLAijYywSz9qG
 hztjPnbaK6AoBmN69NXNrqILqEvgw335/sVOxrwgKZbvjOW/nEjFvxZSxacHfTP4k3IM2iCo5li
 EDok8R+7xyfUjRfoY1bS89/PwDwkSpvh87NQ2xu9KGHHtKQHL6NKztQSKPJPa7X8p80vkHCjw1D
 L5rF+73BLM5Ug72Iw4GbRcqBmnGs7W0rj/ZQfiZT2enuCnxIOsCWuofl22nuECJz2YKPwFxcb9H
 AGi0ppoHjOcD/XOPWQhHSao3TcDFja8WOcI0+JtmzJxnKREPVUYRw0WEo/rbKC8F5fzM4MfjGzb
 2Lxq4PNy0lawbQE93nA==
X-Proofpoint-GUID: WlYYNrd6MKPyZ_-wu4iins3p_PVnlg5g
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adbf1d0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aUA2CjGkFf16Q2x8hRwA:9 a=WRHi3HQLIFbtPAFV:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: WlYYNrd6MKPyZ_-wu4iins3p_PVnlg5g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MyBTYWx0ZWRfX6+ZVI3V5X3Jd
 o1z11Pe8YI3T/rHjsr3ehpI0UJ62PN6Zvji2IKJqcmOQf1CzK6msvWNzzQfpeX+OVDezXn6UJmh
 uIwtnRzxvacQioSHHk771RrC06ClY3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230093

On 10/17/2026 4:19 PM, Bryan O'Donoghue wrote:
> On 17/10/2026 05:17, Anusha Arun Nandi wrote:
>> Extend the generic MIPI CSI2 PHY driver with C-PHY (3-phase) support
>> and wire it up for SA8775P, so the same qcom,sa8775p-csi2-phy provider
>> can drive a sensor in either D-PHY or C-PHY mode.
>>
>> Unlike the driver's D-PHY mode selection (which is set once from the
>> consumer's phy_configure_opts_mipi_dphy in the original x1e80100
>> series and later dropped in favour of DT), this driver derives the
>> phy mode from the devicetree bus-type property, in
>> phy_qcom_mipi_csi2_parse_routing() at probe time:
>>
>> - bus-type = MEDIA_BUS_TYPE_CSI2_DPHY (the default) -> PHY_MODE_MIPI_DPHY
>> - bus-type = MEDIA_BUS_TYPE_CSI2_CPHY -> PHY_MODE_MIPI_CPHY
>>
>> phy_qcom_mipi_csi2_set_mode() now validates that a consumer's
>> phy_set_mode() call matches the DT-derived mode rather than accepting
>> any mode; phy_qcom_mipi_csi2_configure() and the power_on()/power_off()
>> lanes_enable()/lanes_disable() dispatch both pick the D-PHY or C-PHY
>> hw_ops/reg_info based on that same stored mode. lane-polarities
>> parsing also branches on mode: D-PHY has a separate clock lane
>> (clock-lane-first array, matching video-interfaces.yaml), C-PHY has
>> none (all entries map data trios).
>>
>> Add the C-PHY 3-phase hw ops (phy-qcom-mipi-csi2-3ph-cphy.c): common
>> control programming (CTRL5 trio-enable mask, CTRL6/CTRL7/CTRL0 in
>> their C-PHY values), settle-count calculation, the odd-bit-position
>> trio lane mask, IRQ-mask clearing and lane disable, matching the
>> legacy in-tree CAMSS C-PHY programming register-for-register. The
>> software-reset and HW-version-read helpers are phase-mode agnostic
>> (they only touch the common-control block) so they are de-staticised
>> in the D-PHY file and shared rather than duplicated.
>>
>> Populate the SA8775P C-PHY register data: the base init sequence
>> (lane_regs_sa8775p_cphy[]) and the five bandwidth-keyed datarate
>> override tables, ported verbatim from the legacy
>> camss-csiphy-3ph-1-0.c tables, plus the full per-trio init for all
>> three trios. reg_info_cphy is a pointer so NULL cleanly means "no
>> C-PHY support" for SoCs (e.g. x1e80100) that only implement D-PHY.
>>
>> QCS8300 shares this exact CSIPHY and is bound to the same
>> mipi_csi2_dphy_sa8775p soc_cfg (see the "phy: qcom-mipi-csi2: Add
>> qcs8300 CSI2 PHY support" patch in the companion D-PHY series), so it
>> picks up ops_cphy/reg_info_cphy here automatically; no separate QCS8300
>> C-PHY patch or register data is needed.
>>
>> Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/Kconfig                  |   1 +
>>   drivers/phy/qualcomm/Makefile                 |   3 +-
>>   .../qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c    | 447 ++++++++++++++++++
>>   .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    |   6 +-
>>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 133 +++++-
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  30 ++
>>   6 files changed, 591 insertions(+), 29 deletions(-)
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
>>
>> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
>> index d802e63ad74a..7fb08fe41a8e 100644
>> --- a/drivers/phy/qualcomm/Kconfig
>> +++ b/drivers/phy/qualcomm/Kconfig
>> @@ -37,6 +37,7 @@ config PHY_QCOM_MIPI_CSI2
>>       depends on COMMON_CLK
>>       select GENERIC_PHY
>>       select GENERIC_PHY_MIPI_DPHY
>> +    select GENERIC_PHY_MIPI_CPHY
>>       help
>>         Enable this to support the MIPI CSI2 PHY driver found in various
>>         Qualcomm chipsets. This PHY is used to connect MIPI CSI2
>> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/
>> Makefile
>> index 4b5e6640a6fa..07670425182b 100644
>> --- a/drivers/phy/qualcomm/Makefile
>> +++ b/drivers/phy/qualcomm/Makefile
>> @@ -8,7 +8,8 @@ obj-$(CONFIG_PHY_QCOM_M31_USB)        += phy-qcom-m31.o
>>   obj-$(CONFIG_PHY_QCOM_M31_EUSB)        += phy-qcom-m31-eusb2.o
>>     phy-qcom-mipi-csi2-objs            += phy-qcom-mipi-csi2-core.o \
>> -                       phy-qcom-mipi-csi2-3ph-dphy.o
>> +                       phy-qcom-mipi-csi2-3ph-dphy.o \
>> +                       phy-qcom-mipi-csi2-3ph-cphy.o
>>   obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)    += phy-qcom-mipi-csi2.o
>>     obj-$(CONFIG_PHY_QCOM_PCIE2)        += phy-qcom-pcie2.o
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
>> new file mode 100644
>> index 000000000000..f388997390b1
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-cphy.c
>> @@ -0,0 +1,447 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0, C-PHY mode
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/time64.h>
>> +
>> +#include "phy-qcom-mipi-csi2.h"
>> +
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)    ((offset) + 0x4
>> * (n))
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B    BIT(0)
>> +
>> +/*
>> + * 3 phase CSI has 19 common status regs with only 0-10 being used
>> + * and 11-18 being reserved.
>> + */
>> +#define CSI_COMMON_STATUS_NUM                11
>> +/*
>> + * There are a number of common control registers. The offset to
>> clear the
>> + * CSIPHY IRQ status starts @ 22, so CSI_COMMON_STATUS0 is cleared via
>> + * CSI_COMMON_CONTROL22, STATUS1 via CONTROL23 and so on.
>> + */
>> +#define CSI_CTRL_STATUS_INDEX                22
>> +
>> +/*
>> + * C-PHY common control values, per the CSIPHY v1.3.0 3-phase C-PHY
>> + * programming sequence (differ from the D-PHY values for the same
>> registers).
>> + */
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL7_CPHY        0x5a
>> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_CPHY        0x0e
>> +
>> +#define CSIPHY_DEFAULT_PARAMS                0
>> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE            2
>> +#define CSIPHY_SETTLE_CNT_HIGHER_BYTE            3
>> +
>> +static inline const struct mipi_csi2phy_device_regs *
>> +csi2phy_dev_to_cphy_regs(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +    return csi2phy->soc_cfg->reg_info_cphy;
>> +}
>> +
>> +/*
>> + * phy_qcom_mipi_csi2_cphy_settle_cnt_calc - Calculate settle count
>> value
>> + *
>> + * Helper function to calculate settle count value. This is based on the
>> + * CSI2 T_hs_settle parameter which in turn is calculated based on
>> the CSI2
>> + * transmitter link frequency. The calculation is identical to the D-PHY
>> + * one; the CSIPHY settle-count timer is not phase-mode specific.
>> + *
>> + * Return settle count value or 0 if the CSI2 link frequency is not
>> available.
>> + */
>> +static u8 phy_qcom_mipi_csi2_cphy_settle_cnt_calc(s64 link_freq, u32
>> timer_clk_rate)
>> +{
>> +    u32 t_hs_prepare_max_ps;
>> +    u32 timer_period_ps;
>> +    u32 t_hs_settle_ps;
>> +    u8 settle_cnt;
>> +    u32 ui_ps;
>> +
>> +    if (link_freq <= 0)
>> +        return 0;
>> +
>> +    ui_ps = div_u64(PSEC_PER_SEC, link_freq);
>> +    ui_ps /= 2;
>> +    t_hs_prepare_max_ps = 85000 + 6 * ui_ps;
>> +    t_hs_settle_ps = t_hs_prepare_max_ps;
>> +
>> +    timer_period_ps = div_u64(PSEC_PER_SEC, timer_clk_rate);
>> +    settle_cnt = t_hs_settle_ps / timer_period_ps - 6;
>> +
>> +    return settle_cnt;
>> +}
> 
> Nope - why do we have identitical code ?
> 
> Identitical code should be shared code not cloned code, that's a blanket
> statement for this series.
> 
Makes sense. I will move settle_cnt_calc to phy-qcom-mipi-csi2-core.c file.

>> +
>> +/*
>> + * phy_qcom_mipi_csi2_cphy_lane_mask - Compute the C-PHY lane enable
>> mask
>> + *
>> + * Unlike D-PHY (which sets the CTRL5 clock-lane enable bit and uses
>> even
>> + * bit positions), C-PHY has no separate clock lane and enables each
>> active
>> + * trio at an odd bit position (data lane logical position * 2 + 1).
>> + */
>> +static u8 phy_qcom_mipi_csi2_cphy_lane_mask(struct
>> mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +    struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
>> +    u8 lane_mask = 0;
>> +    int i;
>> +
>> +    for (i = 0; i < cfg->num_data_lanes; i++)
>> +        lane_mask |= BIT((lane_cfg->data[i].pos * 2) + 1);
>> +
>> +    return lane_mask;
>> +}
>> +
>> +/*
>> + * phy_qcom_mipi_csi2_cphy_pick_datarate - select the bandwidth-tier
>> override
>> + *
>> + * Selects the first entry whose bandwidth is >= link_freq, falling
>> back to
>> + * the highest entry if none qualifies, or the first entry if
>> link_freq is
>> + * not yet known (0). Returns NULL if @regs has no datarate_regs table.
>> + */
>> +static const struct mipi_csi2phy_datarate_regs *
>> +phy_qcom_mipi_csi2_cphy_pick_datarate(const struct
>> mipi_csi2phy_device_regs *regs,
>> +                      s64 link_freq)
>> +{
>> +    size_t idx;
>> +
>> +    if (!regs->datarate_regs || !regs->num_datarate_regs)
>> +        return NULL;
>> +
>> +    if (!link_freq)
>> +        return &regs->datarate_regs[0];
>> +
>> +    for (idx = 0; idx < regs->num_datarate_regs; idx++) {
>> +        if (regs->datarate_regs[idx].bandwidth >= link_freq)
>> +            return &regs->datarate_regs[idx];
>> +    }
>> +
>> +    /* No tier reaches link_freq: fall back to the highest one. */
>> +    return &regs->datarate_regs[regs->num_datarate_regs - 1];
>> +}
>> +
>> +static void
>> +phy_qcom_mipi_csi2_cphy_write_regs(struct mipi_csi2phy_device *csi2phy,
>> +                   const struct mipi_csi2phy_lane_regs *r,
>> +                   size_t count, u8 settle_cnt)
>> +{
>> +    u32 val;
>> +    size_t i;
>> +
>> +    for (i = 0; i < count; i++, r++) {
>> +        switch (r->param_type) {
>> +        case CSIPHY_SETTLE_CNT_LOWER_BYTE:
>> +            val = settle_cnt & 0xff;
>> +            break;
>> +        case CSIPHY_SETTLE_CNT_HIGHER_BYTE:
>> +            val = (settle_cnt >> 8) & 0xff;
> 
> u8 settle_cnt = 0xFF;
> 
> settle_cnt = settle_cnt >> 8;
> 
> == 0
> 
> Can't be correct - probably a copy/paste from the existing code, buggy,
> mine I guess...
> 
> /checks
> 
> no this is a new bug - so please fix and make all of this generic code
> common instead of copy/paste...

Nice catch! settle_cnt will update to u32, so the operation for higher
byte would be correct.
>> +            break;
>> +        default:
>> +            val = r->reg_data;
>> +            break;
>> +        }
>> +        writel(val, csi2phy->base + r->reg_addr);
>> +        if (r->delay_us)
>> +            udelay(r->delay_us);
>> +    }
>> +}
>> +
>> +static int phy_qcom_mipi_csi2_cphy_lanes_enable(struct
>> mipi_csi2phy_device *csi2phy,
>> +                        struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +    const struct mipi_csi2phy_device_regs *regs =
>> csi2phy_dev_to_cphy_regs(csi2phy);
>> +    const struct mipi_csi2phy_datarate_regs *tier;
>> +    u8 settle_cnt;
>> +    u8 val;
>> +    int i;
>> +
>> +    settle_cnt = phy_qcom_mipi_csi2_cphy_settle_cnt_calc(cfg->link_freq,
>> +                                 csi2phy->timer_clk_rate);
>> +
>> +    /* Enable the active C-PHY trios (odd bit positions, no clock
>> lane). */
>> +    val = phy_qcom_mipi_csi2_cphy_lane_mask(cfg);
>> +    writel(val, csi2phy->base +
>> +           CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 5));
>> +
>> +    val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>> +    writel(val, csi2phy->base +
>> +           CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 6));
>> +
>> +    val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL7_CPHY;
>> +    writel(val, csi2phy->base +
>> +           CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 7));
>> +
>> +    val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_CPHY;
>> +    writel(val, csi2phy->base +
>> +           CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 0));
>> +
>> +    /* Base C-PHY lane_regs init sequence. */
>> +    phy_qcom_mipi_csi2_cphy_write_regs(csi2phy, regs->init_seq,
>> +                       regs->lane_array_size, settle_cnt);
>> +
>> +    /* Bandwidth-tier overrides on top, if this soc_cfg has any. */
>> +    tier = phy_qcom_mipi_csi2_cphy_pick_datarate(regs, cfg->link_freq);
>> +    if (tier)
>> +        phy_qcom_mipi_csi2_cphy_write_regs(csi2phy, tier->reg_array,
>> +                           tier->reg_array_size, settle_cnt);
>> +
>> +    /* IRQ_MASK registers - disable all interrupts */
>> +    for (i = CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++) {
>> +        writel(0, csi2phy->base +
>> +               CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs-
>> >common_regs_offset, i));
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void
>> +phy_qcom_mipi_csi2_cphy_lanes_disable(struct mipi_csi2phy_device
>> *csi2phy,
>> +                      struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +    const struct mipi_csi2phy_device_regs *regs =
>> csi2phy_dev_to_cphy_regs(csi2phy);
>> +
>> +    writel(0, csi2phy->base +
>> +           CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 5));
>> +
>> +    writel(0, csi2phy->base +
>> +           CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset,
>> 6));
>> +}
>> +
>> +const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_cphy = {
>> +    .hw_version_read = phy_qcom_mipi_csi2_hw_version_read,
>> +    .reset = phy_qcom_mipi_csi2_reset,
>> +    .lanes_enable = phy_qcom_mipi_csi2_cphy_lanes_enable,
>> +    .lanes_disable = phy_qcom_mipi_csi2_cphy_lanes_disable,
>> +};
> 
> Please separate out the enabling works for CPHY and the sa8755p.
> 
> - Reducing the size of the patch
> - Making the commits more logical
> - Making the commits more revertable
> 
Acknowledged. Will revise in the next patch.

>> +
>> +/*
>> + * sa8775p C-PHY (3-phase) register tables.
>> + *
>> + * Ported verbatim from the legacy in-tree CAMSS C-PHY driver
>> + * (drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:
>> + * lane_regs_sa8775p_3ph[] and data_rate_settings_sa8775p_3ph[]). The
>> + * per-lane-block macro addresses (CSIPHY_LNx_CSI_3PH_CTRLn_ADDR(n) =
>> + * base + n * 4, base 0x0100/0x0300/0x0500/0x0900/0x0a00/0x0b00 for
>> + * LN1/3/5/9/10/11) are expanded to the literal flat offsets used by
>> + * this driver's mipi_csi2phy_lane_regs format.
>> + */
>> +static const struct mipi_csi2phy_lane_regs lane_regs_sa8775p_cphy[] = {
>> +    {.reg_addr = 0x0168, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x016c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x015c, .reg_data = 0xc8, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0104, .reg_data = 0x06, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x010c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0108, .reg_data = 0x00, .param_type =
>> CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> +    {.reg_addr = 0x0114, .reg_data = 0x20, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0150, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0188, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x018c, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0190, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0118, .reg_data = 0x3e, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x011c, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0120, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0124, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0128, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x012c, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0144, .reg_data = 0xb2, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0160, .reg_data = 0x02, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x01cc, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0164, .reg_data = 0x33, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x01dc, .reg_data = 0x50, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0368, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x036c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x035c, .reg_data = 0xc8, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0304, .reg_data = 0x06, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x030c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0308, .reg_data = 0x00, .param_type =
>> CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> +    {.reg_addr = 0x0314, .reg_data = 0x20, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0350, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0388, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x038c, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0390, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0318, .reg_data = 0x3e, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x031c, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0320, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0324, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0328, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x032c, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0344, .reg_data = 0xb2, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0360, .reg_data = 0x02, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x03cc, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0364, .reg_data = 0x33, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x03dc, .reg_data = 0x50, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0568, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x056c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x055c, .reg_data = 0xc8, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0504, .reg_data = 0x06, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x050c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0508, .reg_data = 0x00, .param_type =
>> CSIPHY_SETTLE_CNT_HIGHER_BYTE},
>> +    {.reg_addr = 0x0514, .reg_data = 0x20, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0550, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0588, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x058c, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0590, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0518, .reg_data = 0x3e, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x051c, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0520, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0524, .reg_data = 0x7f, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0528, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x052c, .reg_data = 0x00, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0544, .reg_data = 0xb2, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0560, .reg_data = 0x02, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x05cc, .reg_data = 0x41, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0564, .reg_data = 0x33, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x05dc, .reg_data = 0x50, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0984, .reg_data = 0x20, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0988, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0980, .reg_data = 0x61, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x09b0, .reg_data = 0x01, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x09b4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0a84, .reg_data = 0x20, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0a88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0a80, .reg_data = 0x61, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0ab0, .reg_data = 0x01, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0b84, .reg_data = 0x20, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0b88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0b80, .reg_data = 0x61, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0bb0, .reg_data = 0x01, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
>> +static const struct mipi_csi2phy_lane_regs
>> datarate_sa8775p_cphy_1p5gsps[] = {
>> +    {.reg_addr = 0x015c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0168, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x016c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x010c, .reg_data = 0x24, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x035c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0368, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x036c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x030c, .reg_data = 0x24, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x055c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0568, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x056c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x050c, .reg_data = 0x24, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x09b4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
>> +static const struct mipi_csi2phy_lane_regs
>> datarate_sa8775p_cphy_1p7gsps[] = {
>> +    {.reg_addr = 0x015c, .reg_data = 0x56, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0168, .reg_data = 0xae, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x016c, .reg_data = 0x65, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x010c, .reg_data = 0x12, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x035c, .reg_data = 0x56, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0368, .reg_data = 0xae, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x036c, .reg_data = 0x65, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x030c, .reg_data = 0x12, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x055c, .reg_data = 0x56, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0568, .reg_data = 0xae, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x056c, .reg_data = 0x65, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x050c, .reg_data = 0x12, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x09b4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
>> +static const struct mipi_csi2phy_lane_regs
>> datarate_sa8775p_cphy_2p5gsps[] = {
>> +    {.reg_addr = 0x0168, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x015c, .reg_data = 0xc8, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x016c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x010c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0368, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x035c, .reg_data = 0xc8, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x036c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x030c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0568, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x055c, .reg_data = 0xc8, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x056c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x050c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x09b4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0988, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0ab4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0a88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0bb4, .reg_data = 0x08, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0b88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
>> +static const struct mipi_csi2phy_lane_regs
>> datarate_sa8775p_cphy_3p5gsps[] = {
>> +    {.reg_addr = 0x0168, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x015c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x016c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x010c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0368, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x035c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x036c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x030c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0568, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x055c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x056c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x050c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x09b4, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0988, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0ab4, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0a88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0bb4, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0b88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
>> +static const struct mipi_csi2phy_lane_regs
>> datarate_sa8775p_cphy_4p5gsps[] = {
>> +    {.reg_addr = 0x0168, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x015c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x016c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x010c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0368, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x035c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x036c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x030c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x0568, .reg_data = 0x80, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x055c, .reg_data = 0x46, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x056c, .reg_data = 0x25, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x050c, .reg_data = 0x08, .param_type =
>> CSIPHY_SETTLE_CNT_LOWER_BYTE},
>> +    {.reg_addr = 0x09b4, .reg_data = 0x02, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0988, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0ab4, .reg_data = 0x02, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0a88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0bb4, .reg_data = 0x02, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +    {.reg_addr = 0x0b88, .reg_data = 0x05, .param_type =
>> CSIPHY_DEFAULT_PARAMS},
>> +};
>> +
>> +static const struct mipi_csi2phy_datarate_regs
>> datarate_regs_sa8775p_cphy[] = {
>> +    {
>> +        .bandwidth = 1500000000,
>> +        .reg_array = datarate_sa8775p_cphy_1p5gsps,
>> +        .reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_1p5gsps),
>> +    },
>> +    {
>> +        .bandwidth = 1700000000,
>> +        .reg_array = datarate_sa8775p_cphy_1p7gsps,
>> +        .reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_1p7gsps),
>> +    },
>> +    {
>> +        .bandwidth = 2500000000,
>> +        .reg_array = datarate_sa8775p_cphy_2p5gsps,
>> +        .reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_2p5gsps),
>> +    },
>> +    {
>> +        .bandwidth = 3500000000,
>> +        .reg_array = datarate_sa8775p_cphy_3p5gsps,
>> +        .reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_3p5gsps),
>> +    },
>> +    {
>> +        .bandwidth = 4500000000,
>> +        .reg_array = datarate_sa8775p_cphy_4p5gsps,
>> +        .reg_array_size = ARRAY_SIZE(datarate_sa8775p_cphy_4p5gsps),
>> +    },
>> +};
>> +
>> +const struct mipi_csi2phy_device_regs mipi_csi2_3ph_cphy_regs_sa8775p
>> = {
>> +    .init_seq = lane_regs_sa8775p_cphy,
>> +    .lane_array_size = ARRAY_SIZE(lane_regs_sa8775p_cphy),
>> +    .common_regs_offset = 0x800,
>> +    .datarate_regs = datarate_regs_sa8775p_cphy,
>> +    .num_datarate_regs = ARRAY_SIZE(datarate_regs_sa8775p_cphy),
>> +};
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index f3d67d75105e..41664a593f91 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -168,7 +168,7 @@ csi2phy_dev_to_regs(struct mipi_csi2phy_device
>> *csi2phy)
>>       return &csi2phy->soc_cfg->reg_info;
>>   }
>>   -static void phy_qcom_mipi_csi2_hw_version_read(struct
>> mipi_csi2phy_device *csi2phy)
>> +void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device
>> *csi2phy)
>>   {
>>       const struct mipi_csi2phy_device_regs *regs =
>> csi2phy_dev_to_regs(csi2phy);
>>       u32 tmp;
>> @@ -199,7 +199,7 @@ static void
>> phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
>>    * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
>>    * @phy_qcom_mipi_csi2: CSIPHY device
>>    */
>> -static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device
>> *csi2phy)
>> +void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
>>   {
>>       const struct mipi_csi2phy_device_regs *regs =
>> csi2phy_dev_to_regs(csi2phy);
>>   @@ -490,6 +490,8 @@ const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_sa8775p = {
>>           .lane_array_size = ARRAY_SIZE(lane_regs_sa8775p),
>>           .common_regs_offset = 0x800,
>>       },
>> +    .ops_cphy = &phy_qcom_mipi_csi2_ops_3ph_cphy,
>> +    .reg_info_cphy = &mipi_csi2_3ph_cphy_regs_sa8775p,
>>       .supply_names = (const char **)sa8775p_supplies,
>>       .num_supplies = ARRAY_SIZE(sa8775p_supplies),
>>       .clk_names = (const char **)sa8775p_clks,
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/
>> phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index fca67d3625b8..79e002c94ac4 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/pm_opp.h>
>>   #include <linux/phy/phy.h>
>>   #include <linux/phy/phy-mipi-dphy.h>
>> +#include <linux/phy/phy-mipi-cphy.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_runtime.h>
>> @@ -96,11 +97,10 @@ phy_qcom_mipi_csi2_set_clock_rates(struct
>> mipi_csi2phy_device *csi2phy,
>>       return ret;
>>   }
>>   -static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>> -                    union phy_configure_opts *opts)
>> +static int
>> +phy_qcom_mipi_csi2_configure_dphy(struct mipi_csi2phy_device *csi2phy,
>> +                  struct phy_configure_opts_mipi_dphy *dphy_cfg)
>>   {
>> -    struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>> -    struct phy_configure_opts_mipi_dphy *dphy_cfg = &opts->mipi_dphy;
>>       struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
>>       int ret;
>>   @@ -119,24 +119,73 @@ static int phy_qcom_mipi_csi2_configure(struct
>> phy *phy,
>>       return 0;
>>   }
>>   +static int
>> +phy_qcom_mipi_csi2_configure_cphy(struct mipi_csi2phy_device *csi2phy,
>> +                  struct phy_configure_opts_mipi_cphy *cphy_cfg)
>> +{
>> +    struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
>> +    int ret;
>> +
>> +    ret = phy_mipi_cphy_config_validate(cphy_cfg);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (cphy_cfg->lanes < 1 || cphy_cfg->lanes > CSI2_MAX_DATA_LANES)
>> +        return -EINVAL;
>> +
>> +    if (cphy_cfg->lanes != stream_cfg->num_data_lanes)
>> +        return -EINVAL;
>> +
>> +    stream_cfg->link_freq = cphy_cfg->hs_clk_rate;
>> +
>> +    return 0;
>> +}
>> +
>> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>> +                    union phy_configure_opts *opts)
>> +{
>> +    struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>> +
>> +    if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY)
>> +        return phy_qcom_mipi_csi2_configure_cphy(csi2phy, &opts-
>> >mipi_cphy);
>> +
>> +    return phy_qcom_mipi_csi2_configure_dphy(csi2phy, &opts->mipi_dphy);
>> +}
>> +
>> +static const struct mipi_csi2phy_hw_ops *
>> +phy_qcom_mipi_csi2_get_ops(struct mipi_csi2phy_device *csi2phy)
>> +{
>> +    if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY)
>> +        return csi2phy->soc_cfg->ops_cphy;
>> +
>> +    return csi2phy->soc_cfg->ops;
>> +}
>> +
>>   static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
>>                          enum phy_mode mode, int submode)
>>   {
>>       struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>>   -    if (mode != PHY_MODE_MIPI_DPHY)
>> -        return -EOPNOTSUPP;
>> +    /*
>> +     * The phy mode is derived once from the DT bus-type in
>> +     * phy_qcom_mipi_csi2_parse_routing() at probe time; consumers must
>> +     * request the same mode the devicetree describes.
>> +     */
>> +    if (mode != csi2phy->phy_mode)
>> +        return -EINVAL;
>>   -    csi2phy->phy_mode = mode;
>>       return 0;
>>   }
>>     static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>>   {
>>       struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>> -    const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
>> +    const struct mipi_csi2phy_hw_ops *ops =
>> phy_qcom_mipi_csi2_get_ops(csi2phy);
>>       int i, ret;
>>   +    if (!ops)
>> +        return -EOPNOTSUPP;
>> +
>>       ret = regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
>>                       csi2phy->supplies);
>>       if (ret)
>> @@ -194,10 +243,11 @@ static int phy_qcom_mipi_csi2_power_on(struct
>> phy *phy)
>>   static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
>>   {
>>       struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>> -    const struct mipi_csi2phy_hw_ops *ops = csi2phy->soc_cfg->ops;
>> +    const struct mipi_csi2phy_hw_ops *ops =
>> phy_qcom_mipi_csi2_get_ops(csi2phy);
>>       int i;
>>   -    ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
>> +    if (ops)
>> +        ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
>>         clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
>>                      csi2phy->clks);
>> @@ -291,7 +341,14 @@ static int
>> phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>>       bus_type = MEDIA_BUS_TYPE_CSI2_DPHY;
>>       fwnode_property_read_u32(ep, "bus-type", &bus_type);
>>   -    if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY) {
>> +    switch (bus_type) {
>> +    case MEDIA_BUS_TYPE_CSI2_DPHY:
>> +        csi2phy->phy_mode = PHY_MODE_MIPI_DPHY;
>> +        break;
>> +    case MEDIA_BUS_TYPE_CSI2_CPHY:
>> +        csi2phy->phy_mode = PHY_MODE_MIPI_CPHY;
>> +        break;
>> +    default:
>>           ret = -EOPNOTSUPP;
>>           dev_err(dev, "Unsupported bus-type %u\n", bus_type);
>>           goto out_put;
>> @@ -312,14 +369,24 @@ static int
>> phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>>           goto out_put;
>>       }
>>   -    /* lane-polarities: optional, up to num_data_lanes + 1 entries */
>> +    /*
>> +     * lane-polarities: optional. D-PHY has a separate clock lane, so
>> its
>> +     * array is up to num_data_lanes + 1 entries (clock lane first,
>> +     * matching the video-interfaces.yaml convention); C-PHY has no
>> clock
>> +     * lane, so its array is up to num_data_lanes entries.
>> +     */
>>       memset(lane_polarities, 0x00, sizeof(lane_polarities));
>>       num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
>>       if (num_polarities > 0) {
>> -        if (num_polarities != stream_cfg->num_data_lanes + 1) {
>> +        unsigned int expected = stream_cfg->num_data_lanes;
>> +
>> +        if (csi2phy->phy_mode == PHY_MODE_MIPI_DPHY)
>> +            expected += 1;
>> +
>> +        if (num_polarities != expected) {
>>               ret = -EINVAL;
>> -            dev_err(dev, "clock+data-lane %d/polarities %d mismatch\n",
>> -                stream_cfg->num_data_lanes + 1, num_polarities);
>> +            dev_err(dev, "lane %d/polarities %d mismatch\n",
>> +                expected, num_polarities);
>>               goto out_put;
>>           }
>>   @@ -331,19 +398,33 @@ static int
>> phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>>           }
>>       }
>>   -    csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
>> -    csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
>> +    if (csi2phy->phy_mode == PHY_MODE_MIPI_DPHY) {
>> +        csi2phy->stream_cfg.lane_cfg.clk.pos = CSI2_DEFAULT_CLK_LANE;
>> +        csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
>>   -    for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>> -        if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
>> -            dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>> -            ret = -EINVAL;
>> -            goto out_put;
>> -        }
>> +        for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>> +            if (data_lanes[i] < 1 || data_lanes[i] >
>> CSI2_MAX_DATA_LANES) {
>> +                dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>> +                ret = -EINVAL;
>> +                goto out_put;
>> +            }
>>   -        /* Convert data-lanes = <1 2 3 4> to bit positions */
>> -        csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;
>> -        csi2phy->stream_cfg.lane_cfg.data[i].pol = lane_polarities[i
>> + 1];
>> +            /* Convert data-lanes = <1 2 3 4> to bit positions */
>> +            csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i]
>> - 1;
>> +            csi2phy->stream_cfg.lane_cfg.data[i].pol =
>> lane_polarities[i + 1];
>> +        }
>> +    } else {
>> +        /* C-PHY has no clock lane; all entries map data trios. */
>> +        for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
>> +            if (data_lanes[i] < 1 || data_lanes[i] >
>> CSI2_MAX_DATA_LANES) {
>> +                dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>> +                ret = -EINVAL;
>> +                goto out_put;
>> +            }
>> +
>> +            csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i]
>> - 1;
> 
> This looks wrong.
> 
> In D-PHY mode the monkeying about comes from the fact that data_lanes
> and lane_polarities have different indexes - data-lanes only pertains to
> data-lanes but polarities covers both data-lanes and clock-lanes.
> 
> For CPHY there is no clock lane so there is no need to offset nor to
> check that data_lanes[i] < 1
> 
> Indeed CSI2_MAX_DATA_LANES for CPHY is not the same as it is for D-PHY.
> 
> Also just copy/pasting an existing check instead of functional
> decomposition of that check would be wrong on its own too...
> 
Yes, you are right. As mentioned in the earlier comment, we are going to
remove positions and polarities for C-PHY as this is not required.
>> +            csi2phy->stream_cfg.lane_cfg.data[i].pol =
>> lane_polarities[i];
>> +        }
>>       }
>>         ret = 0;
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/
>> qualcomm/phy-qcom-mipi-csi2.h
>> index e2a346bcec89..af8426af2ae3 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
>> @@ -47,10 +47,31 @@ struct mipi_csi2phy_lane_regs {
>>       const u32 param_type;
>>   };
>>   +/**
>> + * struct mipi_csi2phy_datarate_regs - bandwidth-keyed register
>> overrides
>> + * @bandwidth: data rate, in bits/s, this entry applies to
>> + * @reg_array: register writes to apply on top of the base init_seq
>> + * @reg_array_size: number of entries in reg_array
>> + *
>> + * Some C-PHY configurations need small register tweaks (impedance,
>> deskew,
>> + * timing calibration) that vary with the link data rate. A
>> + * mipi_csi2phy_device_regs may carry an array of these, sorted by
>> ascending
>> + * bandwidth; the hw_ops picks the first entry whose bandwidth is >= the
>> + * configured link rate (falling back to the highest entry if none
>> + * qualifies).
>> + */
>> +struct mipi_csi2phy_datarate_regs {
>> +    const u64 bandwidth;
>> +    const struct mipi_csi2phy_lane_regs *reg_array;
>> +    const size_t reg_array_size;
>> +};
>> +
>>   struct mipi_csi2phy_device_regs {
>>       const struct mipi_csi2phy_lane_regs *init_seq;
>>       const int lane_array_size;
>>       const u32 common_regs_offset;
>> +    const struct mipi_csi2phy_datarate_regs *datarate_regs;
>> +    const unsigned int num_datarate_regs;
>>   };
>>     struct mipi_csi2_genpd {
>> @@ -62,6 +83,9 @@ struct mipi_csi2phy_soc_cfg {
>>       const struct mipi_csi2phy_hw_ops *ops;
>>       const struct mipi_csi2phy_device_regs reg_info;
>>   +    const struct mipi_csi2phy_hw_ops *ops_cphy;
>> +    const struct mipi_csi2phy_device_regs *reg_info_cphy;
>> +
>>       const char ** const supply_names;
>>       const unsigned int num_supplies;
>>   @@ -99,4 +123,10 @@ extern const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_4nm_x1e;
>>   extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sa8775p;
>>   extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_sc7280;
>>   +extern const struct mipi_csi2phy_hw_ops
>> phy_qcom_mipi_csi2_ops_3ph_cphy;
>> +extern const struct mipi_csi2phy_device_regs
>> mipi_csi2_3ph_cphy_regs_sa8775p;
>> +
>> +void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device
>> *csi2phy);
>> +void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy);
>> +
>>   #endif /* __PHY_QCOM_MIPI_CSI2_H__ */
> 

