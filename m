Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3E331EAE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303904; cv=none; b=ilAl+AFEzEUisNhXT6DNGFi9ek9vNT+YWor8DbbowppgDupPekP0jlwvt6DgQCgM5y3CLW1LJsW3zew8rBfQ5YxXB1RCKYlRVrMhHkzld54EAxYLjxejnlWJo0Tu5TeS5v+9V85CvZTP8xVkywM38HJE9RS2CXcPnq5WjlwTI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303904; c=relaxed/simple;
	bh=8XpfWXCDXS2CJRygX5XfmpeR1LP2DCo+tZE+0FMNqs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CR8PkZMSRdSg0BHRN/OcP/UstJlaCdhsxT4kxlIbjleh4G4oFulWV1lRDnLueOsdIsWTb1i6rdRo6SZFKzdEkY28L/hi2R+Qxlznz3Vw4on2ao7QmDOzYF2CHXb6MRFpHx+/dzpj8wBYobUMe4cF9Wk4KeyPcjjPfrKsKMvcedQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCX0xaoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5gDUg7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCX0xaoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5gDUg7T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tO7H1669655
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FIb88l+wv/pEzS/5h2Pp7tFbtq8m+I8sOs9BeqMsps=; b=SCX0xaoOa+z1IUxs
	ELqoEMB9K2VjYSTEtYrLZF/tky+QJhefGBzS4wobjk6GyDlr7sAvmRECZj98snJA
	pjV2pHua88CyqD6SPtLlMsnRA+psI03yygGcrg+nu8hNfWWFRo588eDLrxeQ2prt
	eFSESnrHeafLX8js1b8qv59duNXkff3i2QjikRdt99fkFzKuXfJOR3EtkqOmmSCd
	bhxOhGDgJqzE6BFor3tEeXza5LR5LTiNeLZu2mReQAFLculZthgw/eYO5vbcYpN5
	CL5cDN3Q5Wx2xgjhFD8OdShoOrA5JDrUGY/FnogLBF6srVn37/BITI/C1+JSnRLQ
	0c0jmw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k2cyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:11:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2237182eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792303902; x=1792908702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FIb88l+wv/pEzS/5h2Pp7tFbtq8m+I8sOs9BeqMsps=;
        b=M5gDUg7TpFHTpmYwt34SE8JxUnzrzE+OXEFFlicsh8JaEdJP0TGlotoiBLcMX3rP+d
         d+zmtLjpe6ZlbM3MD1gBrC7mv6zjD3BEpS5gyWOGFrNwCwLwycwoNNHpo1KBBQRh7kQj
         t+YQ/9zsmgZTu8rp8tpFqEDS9uTTNVW7mjehlNdLb+dr0J7kcYLoDDYYqiKmDe4yLUp8
         cwdyLCPCeNaQ0gkqzNZ14AX4xSzHykA4M1AJjTSHCVnxu7bwSYs6Y9iPDFiyS+G/k5o0
         JSh0UFKWCZXDBekMt3Wc+rirSzT7rupaI50jJScXiI3ltMVi2oLDvvj1urTm2BN8Az3N
         VLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303902; x=1792908702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FIb88l+wv/pEzS/5h2Pp7tFbtq8m+I8sOs9BeqMsps=;
        b=MziPrA/36akV7BYpxXCtJ7zZEI4JtXNcEgxV2tzsXXNltDL0KAzzPqLIPJ7jN5CmN4
         /8UI+jdjnET7p3fombmgkJ0QjfZXu4KvMQR/ZtGWbgdpkaD9kb0ahXYUSqldiVYy/prx
         0amN8HsqR91pyMQsdqvaDC9fz4zKedfs8x9oDoL/P9FfBGF36tlmeJQXJYA+GQxpxBYL
         Dk56t6mDweG2CGrnyg9d8TWRVRNFasFym0uuw6sSt6N2nCXZWlm5RUddrM82kISdxD6g
         vdy/FReavQKFRb2hoMqYmLi7ep/DjMSbl0SMXjij8Cr6wLymkgb/CrMP1x1HJ+OnCsQF
         GE4g==
X-Forwarded-Encrypted: i=1; AKwUvBxGAFp0C9MzbLhQsyDXbb1iDJi9xAqjqwmtNISlGcKx+Xy0tia4eZtTrXsy1tYnpll8gtUAxrbrCg0U2lE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqKv2z271xOfOPf/bbMeAomdOrEyfLi8KYt6igRECHD3j5bDLs
	ETw7s/OyPQbNlbTEYpFpcHDpLkVgL7dZ13dm8iEHYlLIhUhX241OQvPKEPAxjXLipZFYzOtsCRv
	7hSfPPJr7bAgxH7tyTua8AJiUowIpkImm9A07xadnlEfCe8tUvajOydWVVLKUOGyGQvQ=
X-Gm-Gg: AYBFou1JIWAdEqAl0F7+Kd9iJV/yJkGaq8OOTc9f6aEmaWlCJeAFvUrn0x2R9AjY/Pg
	iUMhfjsDwcQy0nKQLX5QmC4y3f8QZ9Pv4K7WDjzpSf5WO8xg6OnZn5tmRaf0lgrYdmMwGY8NAVY
	Qu4oEICWM3P6efbQXcp6k1jQyGx2xPCObwtlA9xc5Mp+QLNqNvMcgZgd65l/or6GMR0GkMg1S2c
	8L0Tib5D5kx3e87MjHYVW5o47NJ5epv1aVmmO6T0SOd5EodZ7+Q1CP97Qm3EaG3TA7TbZ8U4SUJ
	m0j+Wwd/v8yVWY+D+r+2OMslTUNTjaYef1ukLWX8JO0weEp+lv8h0fuM43G9H0ECz8BrghXwxfq
	th4m7+zKiTKFOuf4jlqO6fdgswWXMuvvBgw==
X-Received: by 2002:a05:7301:6447:b0:35c:3941:c7bd with SMTP id 5a478bee46e88-361a136ac8bmr10130411eec.19.1792303901600;
        Sat, 17 Oct 2026 23:11:41 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:35c:3941:c7bd with SMTP id 5a478bee46e88-361a136ac8bmr10130371eec.19.1792303901042;
        Sat, 17 Oct 2026 23:11:41 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm23938029eec.6.2026.10.17.23.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 23:11:40 -0700 (PDT)
Message-ID: <0324a8fc-fb08-4ace-bfda-d65cefaf3909@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 11:41:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-1-ee13aef55d8b@oss.qualcomm.com>
 <3c9b6695-f292-4bb8-a69d-9de253e36f80@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <3c9b6695-f292-4bb8-a69d-9de253e36f80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfX/Vy7APhyThL2
 yOqWVHBn38XDbtCUusEmL4IWEU373dzZPqXwiErxmQa0X56U3iSTzyg84h3vKhmreoX76WWtGvQ
 PEHTc5sPV5O7F2TcmyAe2tsP/03eHQoi5Q+dkVoipm5sknTHITtFhBndZ8K4pJ22C0kOmiXNXL3
 EV+WH8juzjgS8hn3s5erYweHPbnVd+mspx3C9hAJ6X/j/6L6mA2lG/1r42Al5ZeQgrh/8ciCCwp
 n9E8lBxdJPvJwzPHOef12NOPSVQ8XllduGLn+W3QqOtArbtwGqc2EEmg48X74rbz+jq+PGR5EJ8
 maM4nJaiSEPx4JCdIn/b0Ltp6Ide8G2PI31SvRTjyEBsWGXPUF25Zy9NJSCckjL+iTrE9E1K7cS
 sVUJZCecsyTatwjabEAWiVxS9Z2ommeWh9O9B8UoFQ26fgzZuL8V0NsoQb4fmAZ8b9JS5tYKHaJ
 nbQRpQj+Bq2imAXcrkw==
X-Proofpoint-GUID: _c4zw2-xQxyMHsorRi_z5oQ7bVJb6Ur6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyNCBTYWx0ZWRfX4miWpHrkPHvj
 fmldsOdPK4CmkOr4WoR1YB4MGvsJU9j6ulvP2V6yxGlUc+uosfVwxUltdb1EBLymJ3C/vPwnh65
 qPSXvLAk87x1NfC8baW6OFYJCXA8eHA=
X-Proofpoint-ORIG-GUID: _c4zw2-xQxyMHsorRi_z5oQ7bVJb6Ur6
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad4631e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=2a2+ae0sWwZdsBobmU+nRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-IL2_qV8O3SeHg2FUYIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180024



On 10/16/2026 2:22 PM, Konrad Dybcio wrote:
> On 10/16/26 7:39 AM, Anurag Pateriya wrote:
>> Add the SoCCP (System on Chip Control Processor) remoteproc node and
>> its SMP2P configuration at the SoC level in nord.dtsi, and wire up
>> the clock and power-domain dependencies shared by all Nord embedded
>> variants in nord-embedded.dtsi.
> 
> [...]
> 
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
> 
> The SoCCP should be always enabled, especially given it's left on by
> the bootloader.
> 

Ok, Thanks. I will enable this in next version.

> [...]
> 
>> +		bwmon_cluster2: pmu@1014400 {
>> +			reg = <0x0 0x01014400 0x0 0x600>;
>> +			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;
>> +			operating-points-v2 = <&bwmon_cluster_opp_table>;
>> +		};
> 
> This is somehow present yet not mentioned at all by the commit message
> 
> Konrad

Yes. I will remove these additional changes.


Thanks,
Anurag


