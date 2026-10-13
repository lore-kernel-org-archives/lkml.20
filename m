Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5BD3DDB07
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883289; cv=none; b=i+7ymHRjXqCJGiSpppbKJC5L2PcmVrOlMXx5N7P08bx4+h9z7pAgVtgZijwmuSsQKhwqnWerWFw1M6dDHXkgWSXtieu+Je7wLfqWRW1EIcSeFecgPcKkUvI4J9xBEiW7QYJlwfqQmELYU3+foFeAO+94C7V9rKVoIHs4tVG/GRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883289; c=relaxed/simple;
	bh=Ubf8cLOXbNHNZd1EmKw7FK53PoDTQ/y9kidZXM8WX18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvU9WInDB+asoVmD/YlmKWXE2QpZkSu64ql1p6oRscA+Pn28Hra4iu4U48YxOYUuE+oEPCBdILASTu2s98KNwBUjO+024gCOaw/G21/Edcu/BRkd3Uyvg6QPZw75BBtQKb4QU5IMvnre7tqUnBzUZgofm2bVGIiIx4qoudcVhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIZF7/R4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yr0oH4oA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIZF7/R4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yr0oH4oA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D943IA482992
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	biugcqyvHLpt32D40NfE8a18MS5CwDSrDjBXXfsL+zQ=; b=LIZF7/R4khBjgMfu
	1aJ2dNokHv5yXkLt3aDLiukDVQglNbI91akpsfcROA0SIAhGhdxXFruZUGZqM3kd
	s4ujplQMr0e9514qmcGgkT9b/HlZlAJlZi+HK528BtXhdE5MBUgyLYFGT1tl8ojp
	D+SHDNJN5rmsdoXc+KQ6TmW8GeNu7iJhg3nXbVtW2JJMmuJfrFo+9WgbD38q63OE
	ouuxKCRNC7Sv4oabsq0LeJDuSoF0dUSdMKXyyr6yHvYxeXoNijjIW+ITHh1ohYCj
	+5Pn+ggi+gTIlq2m/Id0xmZhbRdcevaqqZ17Dw9MqEh1WEaQHhf75ZFLkK3EUtM/
	2ioP7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg82fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:21:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc19d8e59so23335885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883286; x=1792488086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biugcqyvHLpt32D40NfE8a18MS5CwDSrDjBXXfsL+zQ=;
        b=Yr0oH4oAdkQOlEpgeRttt0UhNOuKgcFuWAfAMAZT/OdEOxWBtnz2ofuKWQMq0GVTsK
         MUbYG+OHhJE903jRv9hu2clmY6dwglzCaZYomdbLdTcC9jpm0Q/GcE7/43elweFhA8jj
         7F8f7m6OkQSXJYRxidqJoOQrTIJZFSHmbZnNVlgujF7qtjV4k/EQHmR41u0aG+JYaaSw
         53qo19pKxYn5/2TKmDwm56Euml7hdElini0nKJJdSphX5yNGkZauw4l456Vu8KHqcw1Z
         Zs9e7JgLt33DFSVLhjOg1nkTK8oKz+nCSosvd+XMVyrHVV/Sbmo7XcLpVDDr13+pF1Rb
         XSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883286; x=1792488086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biugcqyvHLpt32D40NfE8a18MS5CwDSrDjBXXfsL+zQ=;
        b=i3dg/XMAoHDcmh+lQKhdPxa3FihAPAoZOOZpTaFxpdOONy/YWzbMguoo3m2ZXqRxuc
         S7u2OOZx07+LYsy5kCeHTxU1/mstQUMHIKWrSmX65oomn0rawoDBAcMBvbO26pJaF5Fs
         9VnsyOq9z1EC7ecJzH5aEOsMgZwoj2ij1zHyMVJ4gT9lKad203bEXPYR7OLsGpflNrp6
         erISRHihUni5RNRvBOwXRqSCD/zZgDLevypuqehfY9xTStjaGAwWMkkD86Wwu5wHPGlF
         iDlPypVpC0C4HHS3I+Hh72cTpEUTAyLVjKZCsrbt2aBx7jGIEeA4k0FaE1UdL4qSvOCn
         y2IA==
X-Forwarded-Encrypted: i=1; AKwUvBwggzCcpXlqS7pRyo/gJYl97raP2wtf7AxNJRL/+4zECTzB79LRh/dPaRmGOrMJ4Cf6DJsY1jo9HZ5wamo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBqtNRvNXiUZV79xqkTT5lyeRV00jBC8oUhZSx+Kjau1mi85w9
	YIqvXZWsTikS8US1OZ9r1l4N1DXWmpzML4AdtsJJRKVjljBKI3ryydV0xizBtRYcIFOzmtC9MUm
	0f8p9cogzSvhUIKLfGlpOtbwtReTOlJTZuT7tFi4OPT2s6psSgGdfyXQ1Nvkme6yU7ps=
X-Gm-Gg: AYBFou3TgafvibUDSa2tsEwrb78J0uKcSoiEy+2+9eybbbRS8b9UuOEHt/tde9JGbKf
	lbgMUicuJZnubh3Vduisg5Px0PJGbgpdL/u+WodKSSYf7cCMQu9NtOQYgyKIzsm2AyZtgPaiKXL
	VGZbqDpGrqUSwjU9HWHGNr04lZ4NPQNpB82IqKZKVayF96KrPKJCO9sAtKwxVXUnyoFF/QStKlp
	VninBEyZV3H96FZixewQN2IoZoJUW2zLiYrvW/QAu2xWNNPHqnVg5dnsrOqS2dJzVSPFeA27Jgu
	B78E7O9UW5sBe69IuZznJt7ZQDMvy9W/0nJWTKX++fNg3Ply+SxeAalidYb7lC8qa6yQmUMUoGw
	+9+w321kp82z+0gw2CQ9CHA==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2200393285a.3.1791883286142;
        Tue, 13 Oct 2026 02:21:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2200390285a.3.1791883285582;
        Tue, 13 Oct 2026 02:21:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm565290666b.79.2026.10.13.02.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:21:24 -0700 (PDT)
Message-ID: <f6febe84-c7c2-4aa8-bb02-5b56c63abc6c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8650: Add watchdog node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-2-7d7f7d71d88a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XM6xPEZisQ29EoN6W9ztOFO4_2DYiCEV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX5X1Hyj2Ubczp
 OqM2XImDhxmFwwlwOSP0dWWg+hdlG0mpxadaZZ5Hw6pdMIrg1IOeV453+QIdOIvKjNWRDHwVoO0
 5TbedfqO9FQTRHbs0i4fQnx4Ia1PEO8=
X-Proofpoint-ORIG-GUID: XM6xPEZisQ29EoN6W9ztOFO4_2DYiCEV
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6acdf816 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=Wi9mCQfY_lelBk_q7tMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX0rpwfEGa+ABS
 VSoUUHmcR3UY7bQIB05PjcAtl1GUOdbup8wMVHyP30gw44vKU2HJ4KBT8GDW9mTqjsjR/wSfV20
 lD9HhzFJ4qnGEhUPAOt8jwpIkYAdJEuuHNUIlihc6lv3+SVVQorBDrLtnSJyd5LZIQnuZaDEVIe
 cVODUZWypvqZsyRpXcPb2KeCtzNleIrOS3MZ/+wNEsBQgTRB6rCFrPSGMFwvMPqvbEIQLZ1q279
 JR1JxrqhPNShLsGHj5mSC/RTdq5rInA2aWme6sH3F2PMlv0RGLmhWARQlroU0PJlPq5gfSmGhHG
 YsFX5JR4WbcuAgJgww9qM5+PjFsBkUnrPJthIZvLBjQMRJYoTx3HmmkvEIhLSiZleoXqMvjzqCr
 yiX/bhfGdYvPbySwmhwSMwSGv9XUyo37ZOut34VqMSp9jn1Hu4d57ySslLzxw7uq8INky1EKaa9
 dD9wacrhVjZcIqmJACQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130037

On 10/2/26 11:45 AM, Neil Armstrong wrote:
> Add a node for the watchdog on the SM8650 SoC, the node
> is marked as reserved since on most platforms the Watchdog
> is owned by the Gunyah Hypervisor.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Do you have a HDK or something with gunyah at hand? A couple months
ago qcom_scm_gunyah_wdt_init() was introduced to handle this -
could you enable the node and give it a shot if you have one?

Konrad

>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 86fbb0fd6472..f33ed7909a8e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -7311,6 +7311,14 @@ gic_its: msi-controller@17140000 {
>  			};
>  		};
>  
> +		watchdog: watchdog@17411000 {
> +			compatible = "qcom,apss-wdt-sm8650", "qcom,kpss-wdt";
> +			reg = <0 0x17411000 0 0x1000>;
> +			clocks = <&sleep_clk>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING 0>;
> +			status = "reserved"; /* Owned by hypervisor */
> +		};
> +
>  		timer@17420000 {
>  			compatible = "arm,armv7-timer-mem";
>  			reg = <0 0x17420000 0 0x1000>;
> 
