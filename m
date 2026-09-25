Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58464D6C37
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351403; cv=none; b=eu9HoADQIGTK5TbNn7lQlQ6oTnqo5y4G1Wiyr0MCi05OPME0DXmC0teY9qfGEdhNn/z+9smC2g31IJZt0BU14i82XFTXgtFK+mwzPfqQcS3WfWfUBXz1TIYDg21M1Fz9JQfCAqie0of7gk0SzrHazWRf9j+WxxAq6PUb40ATSWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351403; c=relaxed/simple;
	bh=oL9x51PEBLfHmQbHRNyTBoADFNFh07BHQ6Ff44okLJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZjfx+xaYwzLImpb+CUfivQOM+RTNV+JFxe9920V49G8kovZJx1322O9NTVllp5odQaew1Lirf9e499PUQsE9sV0OTLV6Do6Gp1g6uOcUqXY1x7TUpop3Bh+CqExcqRDa9rxi6iszY7EJzPNzkeEJ2T+GHHgoGJY8UKn9RTgzDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc9Ss/sk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcW4QnRq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc9Ss/sk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcW4QnRq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Nhr609372
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=; b=oc9Ss/sk7qbHjQ5q
	JHgqGn4+8Em1lxpk/JSyqyKbEbRGvdqiRudnjMIhGGUtUtLxWbPdV8W6xkQgijRf
	v2lBDS5PfIs7KmdPuORa4JMtkGKlxw916AI7ydcw24YL8Bmz0aptz3Kss31CMbIG
	5urCg4F1vjx58uy8+rO1A9knIvvdJ/tiSMK1HgSPvK6RxBBgyS+79CCeY+OfR0ds
	YTDOCFjZI1YSJDX+A00sJR2umL+GbM3V6lRBqsU3wmPn6JTPt6c+3vM9HZMsL8AF
	vkz4MYm/1ONavTjxl9Z8Wp0XAepXRIqSp2YDcAdoXw4DbN6wA6mkYl58wP+sNDpL
	LHUYkA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns5mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:50:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1618307a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351399; x=1790956199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=;
        b=NcW4QnRqMrchHn2s2VSXeCvM7GpEdB7jJdwmoCSIBfbessfWGQCmh58OnIHbW5QeKK
         LyFxH2V1GFH0cOEx8PVRkExZrEI13R24dZHBkC4O0oQ3JvtFXoK5oRHNCOOPzpMsAiFm
         Pb8Se9WSn2sVV8Fe1BVxrTJqkGxCjDFkyGVhveR9CX8QciGH5fiS6xi0fLLG6yDxFP3w
         SZGk/9dljZCCKZEZVkK42sp40dK+JD2LE3MeuOaobt8QWdkh/1wxaDLbLwqkkLIpbCWm
         p5IfMOtzt06MUHH3cWYfOlyyl5KxjYuxHfhUrXKnuwwytMYGfSQNK4K4VM0uPOqRuUOJ
         z09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351399; x=1790956199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=;
        b=kt3I07+EAwfYPV9p6JCr8Xc6aQpqCS54rm1FYdWiiK0SOcrnge+sqp7zNbvsNXSMex
         UDKJlvj6aIl2d2OeaDs9Ha/Nrp/3/aWmX43ETgvn7/g9/+es/oKbFVYWgFZViki3wzrf
         5Z7BeT9MKyOUWZnwV9/k5MBQ50cTMXs93hr2Kej1DNPLTB5elCAl6/YhVankgytDMbyl
         zEC6GNxJt5t8bVS8n+MiDzO6ez2UdtRErDr8k86KXp5QSIjchKOV1eiUS7NI3Gn81Nfi
         2IWpxdIPq9b7QKXwQAO0xGXTZD0TLS+NOMYqatwZMoiEoWD9dy4UTnTxhi0Nri73x823
         8IMw==
X-Forwarded-Encrypted: i=1; AKwUvBwXyM7aVA3Hs93KPcP/lJIcTVzBO+4r0cyuHe2KWgdKjuuskbK3q/xUqEO6jx0bjV81qMDU7jrVkTgjA8A=@vger.kernel.org
X-Gm-Message-State: AFuF++m3+EHNUlNJjI+cfE6n988EREAfd0CVIHyHGIcMW5y0m/10tRIf
	Qp9B5PSFXqYRnWrglNkPKnK2EBOX96yzh5Rm+QsNKOysrlg5P2+bTtcsqmHbRuF77JUgCI5qQO3
	GrUdODHNNa4IPWsHZ/0E410QsWfH2LwxBODVWmQ6bbRV2oYjWr/cRgMBUcEW1KNelcHMj0SkGOs
	o=
X-Gm-Gg: AYBFou1SVpuKeiFQZ65fBJaXZGF5X9QtnYTfKcmgGQhi/M+QFCHQvL1gL56WoUDYvQe
	nl39DRwiGppGM6ifawyiK3dTr/JlM++hp/qPAQtUffWR4F4tdWNyyri+ll7Knd/92hWKSOMG9xm
	+3DvFk8Y3irgJlTuNFS4mP+Bz14dWzDSgiVYTLxW7XW+KRwI+G3tVtMaC/fRkiUKq681ZYSmOE1
	X+fwijMKIYSPaTqmEG7D7bUoc7npOVvoJtkH8nwuvkdJgfomjYde+xHfed+Fl1Y04+dlMbARUsD
	BqjiD07LC1OaSGL1OXwpkCUeWYEzw8vmLxIO1FKdfz/FkYW8mIN3M6fFZUT+jG9TUdkZqxvh8EU
	VIv+X8m6Cc6OeuPGX1E+Y7Yp4j7AeLr6x
X-Received: by 2002:a17:90b:4a86:b0:39e:6a82:afd3 with SMTP id 98e67ed59e1d1-3a098feb5c6mr5878779a91.37.1790351398850;
        Fri, 25 Sep 2026 08:49:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a86:b0:39e:6a82:afd3 with SMTP id 98e67ed59e1d1-3a098feb5c6mr5878751a91.37.1790351398188;
        Fri, 25 Sep 2026 08:49:58 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.242.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9357f64sm5541774a91.3.2026.09.25.08.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:49:57 -0700 (PDT)
Message-ID: <0e80efa9-9377-474e-99f5-d458d81bfcde@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 21:19:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oHFO9dXx76IBb1ttoxqms8mh3xRxlvVP
X-Proofpoint-GUID: oHFO9dXx76IBb1ttoxqms8mh3xRxlvVP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX1AuRV2sGEf3q
 23Kn10sxngMtYtFWPI3JSquyQ0usZ1g3ZzCWJKl0VyPVXfJCOIqlFs4punrFDL/ZAslUjK7gMN9
 ruE9iLYONQBOiueZHglWfbhwy3Jtjuw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfXwT7bfGpG3lTt
 uGrMMGvpsgZ0Y6LEIXh5RusTrnbk8K0Cv3tUueC8lrr3/nwzQ0YOntsg/DCmAj+EoPLS6w1C+yg
 E8llRYhnt+PuB4PKyoxF8a+HVwVSk5XbbfeT+TEArjI9lajnbuF4jIIwzwqYsuwZS75dTLI5vqF
 FTq6jDvrpq0T0jR4Es/ZmJfwH0ha7TIBTk8JQgfj+hjp7XpbOk7vAlHVOZe/AQoze9XxKar8pka
 b+js+XzHCG1WpYXtIkTvutQCKUCPfBjDAoER13bKHpPjiGs4sBfSIp4Kcsv2psjb3oDyKfpb5Tl
 Yhzt0ibDPCYIuQjwBBwbIwcCB9XFBdeAq2aSdyh7g5m9aKQZDB8DYSOGo0Bebkiimux4w50Xqvo
 MEzHA0HtTUak6PJRIJpvbtysihJWT6t4PCxxy1IZFDZdo6LO+11yLq+VW4vpo2ndclCPjc+dX71
 MIndmOlRPLc6gZO23OA==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab69828 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=c6pmHQ1/mDMFVLCaehS4aA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=cRXVm2DszLkgEr1CbDgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063



On 9/24/2026 9:41 PM, Shawn Guo wrote:
> The videocc node supplies only the two XO inputs. videocc-glymur.c
> expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> parentless in /sys/kernel/debug/clk/clk_summary.
> 
> Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> is listed in video_cc_glymur_critical_cbcrs and is therefore force
> enabled through regmap, bypassing the clock framework; the sleep source
> simply keeps whatever rate the bootloader left. The orphan still blocks
> any future rate management of the video sleep path.
> 

Hi Shawn,

The sleep clock supports only a fixed 32KHz frequency and does not support
any other frequencies. Additionally, this clock is not currently used or voted
on by any consumers. Therefore, leaving it in its default bootloader configured
rate should be sufficient, and this change isn't really required.

Thanks,
Jagadeesh
