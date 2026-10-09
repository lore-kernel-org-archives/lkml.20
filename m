Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1523F9F30
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535549; cv=none; b=qiovvqFPvutfxFEF1JqF2gJf8mV2JbmAkzIbNQAQUKrPrbvgU/9da3g6HAzgvIK6DC2UJjdAZ/7leSiPU1P0hUIChICSsKO7LkFQolQuycfOQg7AOBk792NIU8gjTK6E3wLI2xyJZsfkme75IUHeT2E9SPCm5mn5vBxtlVHX4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535549; c=relaxed/simple;
	bh=BFt+HHVErsZcnh/Y/wIax4idNUB4yL3NbnaeoV7ZDOU=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=aZ0Yri0x2eEunZ2H37LXHp0sA6YK8LLXchrC0knASxHH4vqK1uayw3qN1VMoEPX5cGyp8uLzoJqi81d7w4BY2QmmjuzFWDeXsNDaKVRY7SOZo1X4IX2Trw/2r1XUEakxSddx1+39oQrER6EULmZ//xI2tBCRyQ2VuPlWvGlCts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bpcetjdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeG8K/Qh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bpcetjdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeG8K/Qh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KkPS1253043
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 08:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=; b=BpcetjdysSKzyQ1Q
	N65NXKdsDRcU3J346n7NV392I1xmA+ZfUF/Bq5zKnyV6Y3UGWlOXAHO4oTcWexNm
	JjMzfrUU4WJzr3FXdYahPYsfLQIc6FCqXlL+ihLUQgffGqo14Q9XGQgfdjZaCslr
	fIs6KUZoTmSQTDDCOPpjLBmrfxX+a58fkgctvzChxLzAMmiLj7zVVo7hZo7alrrJ
	EzWsAxDM8mVeHsERCTIqXJE3NtQo/Q16H/HIBFGfIu7t4epHU532QApzht/njoY7
	RuIoy5MWZwRKVKwXnW3YTFZgLolF/Zh8XkJi8TlDtuQS8j5GfM16cM5MIQSD7lA6
	EGw3HA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj3x51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:45:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4888146a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535546; x=1792140346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=MeG8K/Qhisn1kh9+jzT+bjgqfddz4SwTksc4j6Mh8SWny7UaP8eRop8FdJitOpcLbp
         fpO9yLzXsdPmrFiIMF3+SlyIqyRemRbnTfqJ2Did/FqjUTADTOO30/K4ufIQLSGmXgZh
         VD3LkgKMN2lGMI4MJYBEnZEIQ9cL31kuDtXI7TO41oUlxGPT7puwXP8l92AV/7tGqHkj
         QaoHqAdPWvruAC8Cj7ScCeMAREnLqLTh+1px7iewSxf0KAzQ0RidIILFcO3Zenfhn4tx
         2ZhiVnXVw+WFhBlDhzu/JHZ0wdai0HcSzCAc6GtIYgK2ndwgGLgg+Iifut+MPOq+Ss6m
         jKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535546; x=1792140346;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=zLeFDKIwHjBz0S6dBiosEvjMMQQeKAATknXMPg4KIvOZR3Ozv9NJt5vjTdYkwEGHcm
         NqoWQsJ+BpOJt0Upb9sxUAu35mtDYgwbYzb6CYF7YKjmJOoG0ruccSsZuPiRyqqYk/oX
         LVcuApgN2fvgpOg0knKFfixncv7Xj8R55fWoEesGQ0L2d8bu6LZUCY9FPMmxTNNAS/Bs
         wF0TR6YCO+Gz50SNwkzXYtNUhk6GHkbAEeV58t8xhSkHSRUbwtZnnhRvq4f7Cmv3220v
         ct3iZpQzz7HZOBgk6N840NOQQbaLEj3UHsIkK/gET11RYHbKknuoX0b5UbSRkdFtR0EF
         EIyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMaN1PigYi5aAo4O481/uiN/Yqk30GpZ8KiGszJlv9HJJKshT7iADwfM2Ewl5hmEVJpMtEOceJhBgS15c=@vger.kernel.org
X-Gm-Message-State: AFuF++l60Xe2SaPiMw0K/Mw5IMKWbUBR1HxOquycRUb0RoKuo2kDLK6g
	74M9Ylk2N+40puHmRpbApSQdowLdYY67ZebjH4sU9a5QNCOnrQDqGut3jxHSaLXtU7PzQFXCgvS
	5nSOIQHzdpjTu7P6Us1BFbQXGl4wZdj6BATLeIJlNmIEg7WAJCdlZPN172gJr47lVrXc=
X-Gm-Gg: AYBFou3XO/0YgR1GrAQaK3vH22FKSjdTHSqD1+DeI6GOXL9MoiKBoqwaNQ6rjcJ/B85
	w/IAyPpn/0IhcAkspZdw7KzePxV4e88YMmMSZxa51bsTH+WG71JmWK2dmuuRXNPqIwYBCAvsT+w
	a5MAb4LomOQ7AzbbN1vh8HzQFadxnIO1+KC2ilS74Xvk9yXptLpw4wGTf+68eleISFpTPXk5osK
	/Z/SZVxImEvq2VHJdRd0Scz3GQX1GfHPyityNuaRqmAImCBt74AOOvqnUufnM6d3LS6OePFYbze
	5NYs6fK8FJP/xLz1r/33JSrrRKYpJDbHMhmQvIY6XsTQ2UeGF4hStPNcmDGvj4t5Z2SsRWLTC6C
	NHXiAuoGznV4i50GFUlckTdRYy3bbzOVFz72ZQIBAMw1mK2TQuaBS5WLIkog8mrk=
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023342637.46.1791535545435;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023320637.46.1791535545012;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d492d7sm599567a12.4.2026.10.09.01.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:45:44 -0700 (PDT)
Message-ID: <78ef7040-0284-4199-8468-8d7cca7eb4c2@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:45:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v19 10/12] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
 <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
In-Reply-To: <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX0/yeR24+MpvW
 drConmolaDg9qmyaoMFy2IVAB0puyyLQTbKx01R//wTJbqU+eoJJQbjlZUP1yrWf3L9FOCBq1rG
 rnAH/NQUAJclztEzJ6PDEPMXLt2rYMFKKmceWbU2kGysOfnU9CNpw3nH6kjjdDgRLWObboa836+
 zm9aI6ZhN5KGuIF4biN9UL/ycM5AOd177dFXZbeZLx+Vbns+NLE/v9pxFMgBUWeazHndWFBZLhe
 MXFqXjMOUaiJcRPcZJcg6b1DO2PwQhe3e1oDmHf+oqdsfViDG+6Nt/RBWu6rLlPdIxuuU+L9EgO
 J4rT8aFfTMrArrtKITGMEKGflhzbyACscBQ8XrqqfSK/3LGygAOmkcri2BiM5oRWNcvKgCJ92yO
 KuXaCOoSGnaL1RG4TLQrFcnX+M6ULrAsy21FtG1cNQBcaqF15bAmKoNWN3bhnk84Cy6VbFAICXX
 gt7Nb/ebbxrbJ9A5c+g==
X-Proofpoint-GUID: 53PQQpSR2BwwmupmpyqopuJjXYzsLg48
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8a9ba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=N5TnpenYHa_lGfR9nhQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 53PQQpSR2BwwmupmpyqopuJjXYzsLg48
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX73xQNi1aWjVf
 M6rJ74p22YToKNp+5ic2dazLXndPKkn7PO7afFMPteq0VabU3cdaV0Kftd6F36DKqCKSmIu/DKR
 G8IO7hxK0Dxsb3Cf2YM1mT0mKYk4vlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090034

On 10/9/26 4:40 PM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 08/10/2026 08:14, Hangxiang Ma wrote:
> > +        csiphy0: phy@9523000 {
> > +            compatible = "qcom,kaanapali-csi2-phy";
> > +            reg = <0x0 0x09523000 0x0 0x2000>;
> > +
> > +            clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> > +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> > +            clock-names = "core",
> > +                      "timer",
> > +                      "ahb";
> > +
> > +            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> > +
> > +            operating-points-v2 = <&csiphy_mxc_opp_table>;
> > +
> > +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +                    <&rpmhpd RPMHPD_MMCX>,
> > +                    <&rpmhpd RPMHPD_MXC>;
> > +            power-domain-names = "top",
> > +                         "mmcx",
> > +                         "mx";
> > +
> > +            status = "disabled";
> > +        };
> 
> These PHYs should have their ports defined.
> 
> ---
> bod
> 

Ack. Will follow the Hawi/Maili tempalte in next revision.
<https://lore.kernel.org/all/20260923-hawi-maili-camss-v1-7-cbbb42e534ef@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
