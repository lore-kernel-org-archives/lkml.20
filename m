Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BED3BB115
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304144; cv=none; b=Bx/Kumlh+SWW3utO3V05uPCjzY8wmKpxfgLBkOel7MtmXl7iQIzSLBUUEjVjOl8dZxo39mppWGpOAbCyN1CyIenFnm2ywQUCb7nVBLi3hAhNJDmXIT8Sp5eciFo/s8zx4fmZ/rmYijXYwilvTqyxiuQ232gKRbbCqA0bPxESm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304144; c=relaxed/simple;
	bh=gx4KnzVAYHb61libMRKwX4hqkb/vxxdKW/rTXXY9ER4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khRBcMMY5biaLL2uH9utE9ZWFKYvjGmhvLoOgDKsPNny0eF+PVxJIFcNz6kKBBYReoeZUDRPQoyourTV2ehseK+uoRoDJ99R98JjHfn/oKB950jyb4v47or7aazV75iuo3Ktj3Vb1VsGwRsZlS4mTqeLKYhQiyl9uPodQxWi6rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5naOo1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eV6o2EPD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5naOo1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eV6o2EPD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5sw5m4186772
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZcc2HBd9fJGE0u982HJSvfnpRwonL+IcSJdNaL1XJA=; b=n5naOo1n2HRVtO31
	CC6CHtX8OCmsqEkC5gRzGXzcDlj2ADuY0J5BDUlvfYyvccb6/NskhwKxeSGnTn7h
	FL92y69GNeibNJY67Chm0cg35xaHQUBcMVK6dB0ar3LVN33V9V0fTHdCR0qGVxdT
	ZJV+vxEG/Gxw+h/ivSDwrn1rXnrSabdOnP11gqJq5chJO9Y5rXv0Rk/rqDP/eMzU
	6mbSEz5EtLTelVWnTK30/oRvx5dn+BcSu8mBLrRzfp0ttU6DQlSZVsamLQEnkNU1
	aND/eOH11yAMn/keaH60+Ll8qFXixYz+qC5Wnb8yHNRG12N1R08zmD7SXnDLkkPY
	+HaZCw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys2nv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:15:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso3323241eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792304141; x=1792908941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZcc2HBd9fJGE0u982HJSvfnpRwonL+IcSJdNaL1XJA=;
        b=eV6o2EPDYrju4k0giXGHTWgE/8SkYy1jLHwTHtP81AKLUQs7Ea9Uyi7M7k9BwjCxHh
         BKLRtaiuu0MbHXokbOgaUo7IBaUDcf2xejFytSoEIM39jn/cV9oY4J18B62+x8OMdT9k
         IVofghzqBTmryV2xc09uZIhGoDIT7HWcgZt4km97BedcGfOUd7dc+n/RgVvSyKdC0peW
         vpHAAv7aCiINQzyJiAs11RmI6ssL6U+K9b1PkkTH1XRzAoYejXhHAmtQf7Z4TrVlPPxO
         aBYGr14jSvV4MHv3VtUBfyTSxEXf6N8kGQYS/uH/3NVlHcjC/ITo/kQXP5R3xu6QoR6b
         zrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304141; x=1792908941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZcc2HBd9fJGE0u982HJSvfnpRwonL+IcSJdNaL1XJA=;
        b=FyxupFuExXC6L77Ku46tnG/+7rpKLlpg8J9O8erwUFrhw1H5CicNxb7sv8x8FHqabN
         9hSFKGoBMAaK5mHbqRZHSOyIXkU6TA1CsOPrlMvXBKYgkaY7xQivX8UGrSsZ4Idd6uuo
         KB9B/Bvp+H2JQv/Wu+nX0Ydxbe6z8BCzOqmZGCE5ANo+o9F/61snJPzXaBQfv/v3em22
         yGuaPdXJtsCjgPzIs1lge8yBOEsP5VcUwi1EWM6f7e33nQwdP+Pvcu+0X9Ox0kM6W1sj
         /H7X3/YE9y+QdJJT1zrmb8EFoyX+eBBW/uXMXS1QjbEutfP/zbMA1AcSql2NShDMY3iq
         uw/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnojb3pUr5sJ3GSwjqcZ+SIj1iRg9jOuSZOfd6Wi4itBEQ8Kt8f3XT1hqH0aRGbI4gD9cD8SVbFKYD/o4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWg7EKJ1Nk+TLVCRd4VnnaFCM/LCPzMV7jHdJnc3704UT1UTn9
	Pc2A9dRe2YB/c/bMOkpCYGJjsp22JWeBRfDYEgyxtD6d1NqSlKB0ci1bOZ6jK0BnfyDD0PWbUHm
	GNPuYJOg0jDYLtqTCOoLBsU0T84mHUe/t1oDbeICiJadCtQF6PrxEaOER2bQl50svvjc=
X-Gm-Gg: AYBFou1Ma9GLA4/VeBL07KME5Kw4ILOr+P3pTvwVtSTTJc05ncgC4iUFl7uA46+oeiS
	KBiVqpySobK7uz43bRYYHh1pqHWqhQgLoANVtQrJtxvBLjjPGFGO/0Crt4bBF9LppoqMPLdTLRD
	q+xGrhAmicIcTjvLv/rtx9kmQGHVa+/jwgrnmZMF3umpuHE7L2O59T0EarkrfVTjF6GWMjwJXgE
	QCUgfLgo2Y/Y+lZsGtaMQVaytfY1uNwLwJXqZ7SeqgGrezCGDacVMgTdsBlSbdJwHV5FbnIvqfO
	ggjd+FwoHzgn14JsVgiO/OegdK3WwJ7JNUFwR4cKZ/gUIMFT3VZ5yd9ArYIcGiam6f9iMsy3jWt
	RLTVPGQAMroabwkUOP2Ih4JyBgaxyDKz0rw==
X-Received: by 2002:a05:7022:7e0d:b0:166:f097:6f10 with SMTP id a92af1059eb24-18258376404mr10743337c88.11.1792304141018;
        Sat, 17 Oct 2026 23:15:41 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0d:b0:166:f097:6f10 with SMTP id a92af1059eb24-18258376404mr10743296c88.11.1792304140438;
        Sat, 17 Oct 2026 23:15:40 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm19153933c88.9.2026.10.17.23.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 23:15:40 -0700 (PDT)
Message-ID: <2b9e00e4-05c9-4416-9ee8-b1dc84777f85@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 11:45:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
 <sgqypoylrjwl7da6vsd5bkxxyfziv2ajxc77p6qgn6ted5bwnf@mctm5rfwsn26>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <sgqypoylrjwl7da6vsd5bkxxyfziv2ajxc77p6qgn6ted5bwnf@mctm5rfwsn26>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfXxBQI8SPzwEIc
 2FnvWpu+w3A7zqCtlUPik6wJuvBuM6anZ4/ZDcon8zthTLlGBT6dX2Ly+Wx75S+VMNdJQ6AF+1N
 Zxvq5nRm2SoPFQMgOG2ftmHgzgV7dg0T72BUIj0U/HYX75Gn7FJ3eFzq30rpgtQTbuOtpa143tT
 vggeXeBp0GQPc7FeaZpYA521uHtWEd7KylwL7Og/yxxcZowq60P5y+iFBLrnDKIGAwHw6OjMOw8
 g7xh0aqLLTnUdOvyUqbWM26fQ8FCBjuNIdqYEuqELSAhOq6QHLmrV8vYqJFXYLPfOm0yMymxN22
 rWm5OTiQg0sRQxtNyunIYgsRL0j6PGGvEATwQ93CgUxju1Dxt8xEYsbaflD0rgOt3uO+lMWoo4W
 CFvE6Kr93BdsgKiUD18ahxtyOvWAkd/48G9n8bQhSwTzharw37CQmte/OM0GbAFHzxA7b3nfCsB
 FvgY598XCoe8v0k4xUw==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad4640d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=2a2+ae0sWwZdsBobmU+nRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YAPKfHnlDYbKqGIrVI8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: K0TPD-a4J24SIajWQoWhOczDfL30HO-l
X-Proofpoint-GUID: K0TPD-a4J24SIajWQoWhOczDfL30HO-l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfX2SpfOebnQZ8F
 VYqjHv3xbp0YIjQa75zKeUuGGwuKKDekvMCLtwh/V7BA2dx9nK6BeNM45JOP0dmwdIw2AWb41V/
 AHH+uzZq4Hg4UdFEZZx75N3iLlIuHB8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180024

On 10/16/2026 2:35 PM, Abel Vesa wrote:
> On 26-10-16 11:09:54, Anurag Pateriya wrote:
>> Add the SoCCP (System on Chip Control Processor) remoteproc node and
>> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
>> the clock and power-domain dependencies shared by all Nord embedded
>> variants in nord-embedded.dtsi.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-embedded.dtsi |   9 ++
>>   arch/arm64/boot/dts/qcom/nord.dtsi          | 126 ++++++++++++++++++++++++++++
>>   2 files changed, 135 insertions(+)
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
>> index dfbbaf94a7ae..53c594281f6b 100644
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
>> @@ -1587,6 +1609,110 @@ uart13: serial@a98000 {
>>   			};
>>   		};
>>   
>> +		remoteproc_soccp: remoteproc@d00000 {
>> +			compatible = "qcom,nord-soccp-pas";
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
>> +			status = "disabled";
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
>> +		bwmon_cluster2: pmu@1014400 {
>> +			reg = <0x0 0x01014400 0x0 0x600>;
>> +			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
>> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
>> +		};
> 
> This isn't supposed to be part of this patch, right?
> 
> Same for the ones below.

Yes. I will remove these changes in next version.

> 
>> +
>> +		bwmon_cluster1: pmu@1015400 {
>> +			reg = <0x0 0x01015400 0x0 0x600>;
>> +			interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
>> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
>> +		};
>> +
>> +		bwmon_cluster0: pmu@1016400 {
>> +			reg = <0x0 0x01016400 0x0 0x600>;
>> +			interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
>> +
>> +			bwmon_cluster_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-0 {
>> +					opp-peak-kBps = <800000>;
>> +				};
>> +
>> +				opp-1 {
>> +					opp-peak-kBps = <2188800>;
>> +				};
>> +
>> +				opp-2 {
>> +					opp-peak-kBps = <5414400>;
>> +				};
>> +
>> +				opp-3 {
>> +					opp-peak-kBps = <6220800>;
>> +				};
>> +
>> +				opp-4 {
>> +					opp-peak-kBps = <6835200>;
>> +				};
>> +
>> +				opp-5 {
>> +					opp-peak-kBps = <7603200>;
>> +				};
>> +
>> +				opp-6 {
>> +					opp-peak-kBps = <8371200>;
>> +				};
>> +
>> +				opp-7 {
>> +					opp-peak-kBps = <9657600>;
>> +				};
>> +
>> +				opp-8 {
>> +					opp-peak-kBps = <10944000>;
>> +				};
>> +
>> +				opp-9 {
>> +					opp-peak-kBps = <12748800>;
>> +				};
>> +
>> +				opp-10 {
>> +					opp-peak-kBps = <14745600>;
>> +				};
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

Thanks,
Anurag

