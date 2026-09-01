Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D235E1BC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244875; cv=none; b=sT807cItCmyvhP5Wk3ri3XeELDD2bmT7K78nMM4BieFY9OhDXQBQixi+d/iHRPOUIqrTbLRs9JU3f2Q7UWm0QccwjO1mrUi+/xKW6OcbCZjnWGdR6RnCVeo2wwJ1Kb3Q/IMa+WJsUZW56Aku9lKsGeVYNw8JKBcftdSPPjXEWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244875; c=relaxed/simple;
	bh=Nb7nnpOYf1jAazbBX2YmplIIoTz9NkNLhf+a62QAAks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d93X/4j4rNpenbFLhOYzZheM1uTXneY+hWJVp5x6RhNfvd4u7+yxEyERHOvTE8+7YiQwQk4fI6bLsSaRBzvE1XgXsfupYdrgYSa6D1NRtNeDE3tsUZ3V48yJjFQTzZYVqgFQUay0H2iz7kY8OnKsNsDN4gwIwo+hvO0mfcTQ0XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbdtShYb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MbX1IJRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbdtShYb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MbX1IJRz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6811punM585046
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCxRflPRsBNSeGfm7gnnOClfsmfdJ2iQRhF61AtDWtU=; b=VbdtShYbBc5IebkQ
	bX/yvUe4fPrdCojh8Tik/GKq4E7l/wmWNK4ncKwla5b6VsboXF13Ebl+hMh65N2Z
	s6UATJL0qx1Q4NkmoR4Jx2vo63y7Bmn/PNx9vYsVtAkoxbzy3Fh5yET/FZiypHE0
	AybMT/jcH63/gtlN88UWLTzIKQHA3jDoSOVbTPNLJaQImAR9JI5Z8aV2jKW6JLgX
	SFOmIzRggZHsjk2cuFibP/yxOgihm1mIG4AoSHsClxCxKf2+P7URFCAJc5Ccu95I
	FtraRZ/dk2Zif9f/SDhw957+vXYEKAHRQFZjeftn+a/V0/mTEQYc9QrcGB5UE7SX
	FIm9Bg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx90es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:41:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so877523a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244872; x=1788849672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCxRflPRsBNSeGfm7gnnOClfsmfdJ2iQRhF61AtDWtU=;
        b=MbX1IJRzGn4vWAhD7ZvecQgP8YD91Fkur+76VDFpw7R1c5hd8YADF40TEh3QB9qhtI
         xUXQQI1A9mE/mSXjczUa+IxkDKXcgsq3pZnSQti7810vw1oOgR5m2DWUJyad74JbdYJs
         GZyIDqOhMpm8eoz9B+l3YDamuMHeFcHB979u2kOfi3KlDl8EMooHn41dwm+7jk8bnYoQ
         E67qyjW5jWbLXZKeFM0PTW9gIol0TA1hbZc3nRakj1XKzGaK4J7HJjRTJJYnGR2BgklK
         QbTlZMxBshhYggyd1DYa5BJOK1C+P5puGaHkxtsv4lor6H3PfCe5lYqgOnct84xPKmrf
         kp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244872; x=1788849672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCxRflPRsBNSeGfm7gnnOClfsmfdJ2iQRhF61AtDWtU=;
        b=tZPKN4Srnb5AUuZaixBWR8GQmgiM8MTHrlC9Ln2Zkwf34hZ4OITWSbyYhfx5Msu2tC
         aqTHqjBV5K5XJD62wbXfHHVe0mSV2iSQ7AB7CLuJqAaEtblfV+OBkCSti5Kt4GXdRKVw
         Rum4JpxPAd2D5nD6ZEjZfTkCoBZ8OzfUgMUvnWhPuI5xbQP4FmDVWVV2ClBOK+JrRdFV
         bnfQe9c2FHVaTohRwG37gxTNif5BxYOfSWuC1viaP1SN/zPBhzXrRUC7F4q+C8G50yJX
         zoC/ZKKx5b6uN2CHqiNlwkP0VTdaP6FZzoyCqspMn1Drw25VPJhh7E7Z9ArsPYhEWOIs
         N7Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwJdl6YrdWf4rijpXnvLNeesr+ada2qNpZNs0V8KIVq5/eGO9eZNk5ghwVkhgQ35MWPYGW6YAhZiIlPMI4=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Ae1xhEGl6kjV5DuoGp0SrE9dLCwwMjU0R5NE4J2zBbWVQciv
	1wHO9l2OVboYH4rr6wlpHQfsq3ZJmUZozArtA3edgw9ArIOeJ6Wy+2H9Q7OeUxT3t4+4f4rbBH3
	Mnx+wjsBfc77OcctD6kzQXO7RHN/M44EoS/t0gxiOxeDebEF8J5ohymaaSv+pr3O7NyM=
X-Gm-Gg: AYBFou1rUUXcaeq/LGFKjKk7c6TXxVAccHhk9hyiaiDkC+y2N3919ipUZUSQm42mpX1
	MkZI9lCRIDQwXftoWKfQLR5b+LcTVw2xD7ZwEOwOM3x85C3gVxEZGGp2JuSujTwhK50+RnyxmKQ
	D0yV0GfDWgwYtav7R05QScOPGZwYDNMzOIqAKLle6E4plIkTsCOf5S8iLsAKihs4kbQvqKI2PER
	ldt5ILv592HH2YcJ2Qg1dqCvNNPcMv6IUmPS8Ib/SuSQtrc7ZJeK+G+J5lZh+CInhRCVhPC01DC
	5M6Z48ipc+OLj8uD0RRSUtGODV0sX3d10t5TdfYTq99goS4C0qrE8AB5HMEy6s1oXLrHYwOvSwd
	zEKRkbNH66Nn+i2Xo+9YxoT9XVSoe
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr47808806a91.8.1788244871679;
        Mon, 31 Aug 2026 23:41:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr47808744a91.8.1788244871184;
        Mon, 31 Aug 2026 23:41:11 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d499811sm4566091a91.10.2026.08.31.23.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:41:10 -0700 (PDT)
Message-ID: <9d1c5451-f665-40d1-866d-51a53fba27f6@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:11:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: lemans: Add support for TSCSS node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-5-beed14e72510@oss.qualcomm.com>
 <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <a93f11c5-d0cf-4acd-a959-53fecc996e5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bM8uPI_BDCR4lYzbbONvHrkjuJpcgSzZ
X-Proofpoint-ORIG-GUID: bM8uPI_BDCR4lYzbbONvHrkjuJpcgSzZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX6WrMe2tWdX0L
 XBsDqUXyFunV98C2Ax6uoT+8jvkfe6p86nar53m2/tOF6QiPI+Q565NHm1BlPjNTeNUywI0WRAb
 f+tDMxoBJzNITP53Be1Qq05Vp2wIwsI=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a967388 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_qMGny95FC9WgreSDIcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1OCBTYWx0ZWRfX/d9KQ8NpZH1z
 8xaWrTCpFDlJzCoSdwTzee7srG9fCips4adCFzrg2+vtk8vY1vy2+0p7cIzNTQK+59DowazTTN5
 gB2GTr6hjcJ6wCwx9KR3nHSTs+uDIBV1mXb+otXacp03MVdGHy+LMqqDHmry3A3ZAge66y7w7Ta
 waTfALAnqMOlD7OB5Z5L8kdU5XNPKgw2JV/nxDnv9iey5M3eKeQ5vBxVgqreNaV+ZJBbxqmmJO+
 KZtZhQ7CS7ZT41jBSMzIJaAUDgngpEpAE/aoluRSYA/2doEqqpjNHzfXpbSLKmTj3VXdJBQwaPr
 EVeWajraFbM6XKQRCqgnSyox9YyZMZV+gxotIjTvBRmQIPCkhgwGvOB11cOhHBN447srOBDIAQm
 3iG7dsfM1ZM4C2y/GCC1v/KxwlckDaNl5wVlxjoofYIHMn7MkB3LDenE0HD7xCGOZ+QX2loqBYF
 yoVfnhiot3hQXE+jHHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010058



On 27-07-2026 08:14 pm, Konrad Dybcio wrote:
> On 7/27/26 4:11 PM, Imran Shaik wrote:
>> Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Lemans
>> SoCs.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 3b0539e27b5192582e0bc9ea248f1c0382e05030..e225292a1e41a5a313aca188ca04bb12474995e8 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -3023,6 +3023,17 @@ pcie1_phy: phy@1c14000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		tscss@1c80000 {
>> +			compatible = "qcom,lemans-tscss";
>> +			reg = <0x0 0x01c80000 0x0 0x2000>;
>> +			reg-names = "tsc";
>> +			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
>> +				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>> +			clock-names = "ahb", "cntr";
>> +			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>> +			assigned-clock-rates = <15625000>;
> 
> I'm guessing this will only ever require a single rate - do we
> need power-domains pointing to one of the RPMHPDs and a
> required-opps reference to match?
> 

The power-domains/required-opps are not really required here, as this
clock's rate is at the lowest corner on the CX rail, which is always
kept ON.

Thanks,
Imran

