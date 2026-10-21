Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564552;
	b=Nzvybmc1JU/rZm4ItdFc4mdqpXUweDmkWL2tU9sSc7KV/YEGXcMgxCs2y9Gd6xCWpvaz
	 qlBgnyy2REbm6h3ffnrh7s8AgKAvCPZr9XZXNPNhDZPXH73yi44mBffiUxEI0exOwT9eY
	 EluBqrAj7zelb8OeNcuJy0Oqa4GJBUqNNyK09ljagY1oF+s4unSgedhhIRQwHbMYZIiVQ
	 SB1c0csUTSCWX5BA29xMQisvhjCQeAwrm5PFrvhPpM2AQkNM9ZDW0v8GkAlmQtxmru26e
	 iDeg+rZf/tH0y5XMugU+65EuM85Kym2KwZu7ZciM201Zds9pm+Q3jF4WRlhe1Ib5c0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=;
	b=AXnjECMlr7gG5MkUa7ZlQliobYDkIZXJLz6QUhQ0iz/wLFXExUSFdzvuBqaa/DBUyhm/
	 uhqLAeG1nYIM4Ldu9J+kZ4wVpcr0GTwf/ksCrAGefAG0H9Dk3BCp5x9anYtVyJJR6JVZS
	 GZCMMflgpJ6JYULWU+MrhV55+Ak5BJhFy83i3957xS4h/yedeG4YvKqqIiyebIOf/sUtP
	 k5bmTHbXLH5zxwh6d5DzZkcGf5MtlCPMPod0jBHisURa3yREslDkremyjaPS9LmVE0fXV
	 uiRQ71kBClZ977ChZCP8wYzRKKdyYGbJRkVXAC3+dKaHZUaHpHL/nEMpPLACkZESkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhQtrWrF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjzEJhPV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860F9606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860F9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JhQtrWrF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjzEJhPV
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L6PtJR3966789
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=; b=JhQtrWrFB03Lqiv8
	+cT1E2OATm7piuAfcVqLiPA35Tbzku9cv25le9rrXSoqImK/9H+kRDH7RZ7uWF1E
	lSIdBokzciN4b41XaBVR4pc0qdz0NiDCjzrNznqkr5GaqhmkkxH/uw9ABQn9DDhL
	dIcEpCUX7rpOMuI9PbQ5yQRWq+WFkkjuvMdPVDvycTl1/9Eaw3aZWPXi4/MFhUIi
	sGILMc6zERyxcbIPjX8Sl6rW/t/Q9IRW2u96rB1fqcNCfefwBGjqHI84+YHESvXn
	9fJMFVJgev3/H8an815xsR+r7TH3DTCqGALvG/3nHQsLKwI0ovhQfZ9rQHrVc6qr
	4gyQWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1ey3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:35:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so627777a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564549; x=1793169349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=;
        b=AjzEJhPVLkxs9IFKt+NianqO1Y3W6p6yPrbGiL50Pc6/7EnIBPar1h1k4r0oJzoGVV
         z/HDZQ0qH6a9FKs1SETlM04pBekOUnRBlwG44hv3Sp1djRVjWi0kCcJNBICRm42SrvE4
         5JdAyc6EZOJirWNmJb6fAiF2x0X0tNf5+xaZqNMYNlvJEFi05+s0FbUybBUFLeRzJKBF
         OhCEelYJv/+STdmXZODdACwyBtE/kBIH1uWyaaXPkj16VtybLYdBFPPAyM82cB8Mm9fY
         PMYpm49ARKhQ/aJOK0t4m6TyR0mxcdeCfPqnPvx4YGwwI8zmKDmMOTlQVyZ1ydCNY7W8
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564549; x=1793169349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWyLjZTx2QEPzOKTEXZ9y+UB3VwaeyrXqGnAqBHznkM=;
        b=m+0J9rz6AcJCFrkI/dvitrJbACcFHX9F93aOs8rOZ6UKkaqHLCLX0eNKVzeEN7ahET
         oImMNyV9PB5/BDM8gdK3TOGiey0KDAEzRizC3rloMM7NqXTYPwwgOQoD0q4OffCYnmH7
         cOjo4sX80GVIdnPE3K7HVSgy8L53A2yeHdupOIgDUdsoMs+oPq9+Sj/4FzKoyCBTJfab
         V7uKWiJqwJ5tnUQqN9msnZ3sOvnTzRVm4/7ECQ5+ShN8AYLO6gvAztPMg5n9KeVsODgA
         OCvNr/SoAbiejT9b98jQToE5m78c10CwzQeIokBuYhHicqUXZT+A0QyfIuAh4EmT2dXJ
         qEHA==
X-Forwarded-Encrypted: i=1; AKwUvBxB/WgNVMWp8EZLTy9H3u/CgCkEoFaPOFb2oZixtURd7yYwkpXHwI8ds6CKAJLhcbXTYMEJqEkGukemlBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM+BE4ffSIS5i6vgTrIvu4sk6J4BoCCkVVuTCOgsn+em3LSnTa
	ENnR7zPaA3RHU7T1Fe8soYpj6wAKjPv7zrUwVIXPJbMQIYwaB2PrUbaX7IRsundb/bUs8697meF
	L611KfMTHMNuIIm3idrGC2q/092yPMrOPJ54KXnPeahI25RSuMmJ6DSN8UBEaSdD5Jzw=
X-Gm-Gg: AYBFou0so122Sqq5f0MHf4p2BOlGmDgxZ9tXswsLjlD4zmNDBW/60eAsEbfkVruIgxs
	2Ws44bXkz/zKijLrJkoQEU/tskIQ1Iw6Ec+jp+YOT2pi+vroGIjfvR6rNDgJvGW+YlB1iNjNKZQ
	as0dNf3VVddhTISwaVA0QZ2n8+oABc9xdYvLeW6gqdU3uBKpm7Or3ysS0Tu3U+yPNQ7YghLm/iF
	xL9OHH8Rwmc20rJ0hNw/tKkslimdV+T5Xc/I58U4iX5u5wr3saeXHIIZ13ZMf4sUPHtnIo9yC4l
	x6QIzA4xdp20hajfmXcZirB92ZIKwRwXnM59aCIxV0WKiNiCJzPht4aKBmkAL+x7p3MEqFjyFAF
	qqto0kLR8OsO+rM09w6Vc
X-Received: by 2002:a17:90b:1808:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ad86ef0854mr701245a91.21.1792564549222;
        Tue, 20 Oct 2026 23:35:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1808:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ad86ef0854mr701225a91.21.1792564548696;
        Tue, 20 Oct 2026 23:35:48 -0700 (PDT)
Received: from [10.216.19.242] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad812c565esm2727456a91.10.2026.10.20.23.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:35:47 -0700 (PDT)
Message-ID: <610c2dd9-641b-4358-83cd-2f0f209a23c3@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:05:42 +0530
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
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc
 DT support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-1-4d713d316e9d@oss.qualcomm.com>
 <atW6BKKehHJTbGOn@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <atW6BKKehHJTbGOn@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad85d46 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=a6GiBE6abnfRvAsHYC4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: EIrvgMTwJriBYrPdyu1Y6BRRQTVboR2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXy0o0lvZkXKOd
 cVjp/OJLAUGZODckQJHS8FAzONn4srr27URLmQhl1Ac4YpvlgNqHISrJAquF5j6Y9DB3YyeDk7y
 yBBo5RzhtCOGN0P59PjRc+xT8PxUFu7CAILKwFg1R0z5X8MY8XpJOyT6ewpbNqgV2Jwg3ZpOGLD
 Cyios2TotXdmdLvfPXNwRhCiK3c95IbZ0lHlwdx5m7uQKWYs88Y7RkmMrAk7zYwLO6bakpUM0s9
 ItK5qxMzElSPb2L6kY1T7dCtHPuC6ZqdqVBrka4yIhr8sfaFNT88scX2+mwhUzb9ph4tkB83ozQ
 k/wV9y+dGdcZQanXg1nPM30momcxxfU1fDZetCynI5DPavYIzwcqlgxI+Cu8FOj9ZOEOlu9Il3Z
 guV7SPylrWXyxrkYMz+bdw3abdUkC8YCe87nUDT3R/Ao8gauWQgLymFUFxFdVeHtDQDrAFkfDT2
 +5zplL9bVJ2XWrGNBMg==
X-Proofpoint-GUID: EIrvgMTwJriBYrPdyu1Y6BRRQTVboR2G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX825FXmlyRb9M
 deYQ9MqXbFbxOjH6Dq8+uFzOgV+B8UtFDYhcaj8FCkaiobQWMZj88BtJ3E8nCA5j0zAMCZ9XZ2R
 FElXVFdb706ufNL5yZEROyrrzpidw/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

On 10/19/2026 12:04 PM, Shawn Guo wrote:
> On Sun, Oct 18, 2026 at 12:46:46PM +0530, Anurag Pateriya wrote:
>> Add the SoCCP (System on Chip Control Processor) remoteproc node and
>> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
>> the clock and power-domain dependencies shared by all Nord embedded
>> variants in nord-embedded.dtsi.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  9 +++++
>>   arch/arm64/boot/dts/qcom/nord.dtsi          | 57 +++++++++++++++++++++++++++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> index 6dc4c871f41e..e21b9ba480f5 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
>> @@ -430,6 +430,15 @@ &remoteproc_cdsp3 {
>>   			     "nsp";
>>   };
>>   
>> +&remoteproc_soccp {
>> +	clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +	clock-names = "xo";
>> +	power-domains = <&rpmhpd RPMHPD_CX>,
>> +			<&rpmhpd RPMHPD_MX>;
>> +	power-domain-names = "cx",
>> +			     "mx";
>> +};
>> +
>>   &spi0 {
>>   	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
>>   	clock-names = "se";
>> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
>> index dfbbaf94a7ae..827531fc1276 100644
>> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
>> @@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
>>   		};
>>   	};
>>   
>> +	smp2p-soccp {
>> +		compatible = "qcom,smp2p";
>> +		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
>> +					      IPCC_MPROC_SIGNAL_SMP2P
>> +					      IRQ_TYPE_EDGE_RISING>;
>> +		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
>> +		qcom,smem = <617>, <616>;
>> +		qcom,local-pid = <0>;
>> +		qcom,remote-pid = <19>;
>> +
>> +		smp2p_soccp_out: master-kernel {
>> +			qcom,entry-name = "master-kernel";
>> +			#qcom,smem-state-cells = <1>;
>> +		};
>> +
>> +		smp2p_soccp_in: slave-kernel {
>> +			qcom,entry-name = "slave-kernel";
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +	};
>> +
>>   	soc: soc@0 {
>>   		compatible = "simple-bus";
>>   		#address-cells = <2>;
>> @@ -1587,6 +1609,41 @@ uart13: serial@a98000 {
>>   			};
>>   		};
>>   
>> +		remoteproc_soccp: remoteproc@d00000 {
>> +			compatible = "qcom,nord-soccp-pas";
> 
> It causes CHECK_DTBS complaints for nord-ride.dtb, so we may want to move
> the compatible to nord-embedded.dtsi.
> 
> Shawn

Yes. I will add this compatible to nord-embedded.dtsi in next version.

Anurag

> 
>> +			reg = <0x0 0x00d00000 0x0 0x200000>;
>> +
>> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
>> +					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "wdog",
>> +					  "fatal",
>> +					  "ready",
>> +					  "handover",
>> +					  "stop-ack",
>> +					  "pong";
>> +
>> +			memory-region = <&soccp_mem>;
>> +
>> +			qcom,smem-states = <&smp2p_soccp_out 0>,
>> +					   <&smp2p_soccp_out 8>;
>> +			qcom,smem-state-names = "stop",
>> +						"ping";
>> +
>> +			glink-edge {
>> +				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
>> +							      IPCC_MPROC_SIGNAL_GLINK_QMP
>> +							      IRQ_TYPE_EDGE_RISING>;
>> +				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
>> +						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +				qcom,remote-pid = <19>;
>> +				label = "soccp";
>> +			};
>> +		};
>> +
>>   		rng: rng@10c3000 {
>>   			compatible = "qcom,nord-trng",
>>   				     "qcom,trng";
>>
>> -- 
>> 2.43.0
>>

