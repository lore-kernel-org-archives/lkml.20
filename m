Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530285;
	b=0T1yq8Gj1GUhueaYfRFO8srG2l+uYs4V3ldzzajStvKocqowC8TCrUUQ3+Vt6qcX5GYv
	 RtwOXEgH1bfyHlbttpDiO+k84z989qeqAEfxOMwOlLZqpKHyz96xMo2/x6oKJu33U2Pr9
	 LH80NOilEDPTcYbG8u2q1TpGbARaf+KVoRF4JZI5FDCha6rV1hLpmTUxdbvucvn9ClkJ3
	 naIzMiaT2MmgmzCrc1tiKK/I/mRBtq8mEPNxm9WDFfyiBJbmuYs5HbdQ5k0MVWk/O+u4M
	 EGq2KiIIHVM3QbEGla7RwSJaccoKgO66Rj+SOP9frp2u4E/fG9x1GWdphYLY5brWvFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
	b=CSyv2x/SbPmUHXOrbkvsFe6/7SuUBo348cGGCsZ1SCIp7UjCHrDmQ0EAAcHRrGftn1y+
	 /GTbIXrP2F7yaB/vPju18VZY5T8zyVNXbHCgaVQZP0Ox4xxguqwpKye2eZQ3FJLAgVF5p
	 3P7hHGuP2kcIad6WdijNLm1QiLluhCeeEkSTgUPDYM42q9EoiEhes+f1rkbiqyNpkPbhy
	 gE1rqrzPm24roaLPl5JB01WzGOn2wlk/nMpmbL7Fd0vjSsldtHElXU8pmDJT/rxFFoPDq
	 i5xvmXEMw+eDeUyIYXEWxvuqQd/S+cA64hN/RmtygjYN1UrfIT7cjC1R88rkyWKnwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JBUDaYQ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5DA606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA5DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdEK5b0u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JBUDaYQ/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtc0a3818474
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=; b=OdEK5b0uuDC4pl1H
	rNfBFMks4raI2FTAL83yd+QaQu12fO2psfxpI+toA/wXxROva9zEopDXmpWT5h/B
	78RDs+JmsgRaQIS+o1S07XMwyndu6UuJ8KTcYyn4TQ8/Tjj/Yi1GZD4qBEhnKxb2
	IhPHLAiB5/zjJi1btP/IkvZ7Pt832Jcixk8FSdC89XcekOjN5L+kaZWLy9L9GLiW
	F9FPWhPX+mbwURIA+levjeMClatWVGcyAHCI9htozT8qPM/7LGWy1VznoOeyiWLL
	rjllWMgN94URv029cnS5fN2dSdbK+mPghpjqX0Ol28T8QrUmIFN2qHkDY1rKZ1l6
	6a7nbw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4rk8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:04:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso77409c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792530283; x=1793135083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=JBUDaYQ/055iKTXH/cMyeAur64PaANtLKJOAUexn+Z7eIbYGq/AEJhW3K40RVUfQyg
         U+32qMtxHr1hXkCxfXCQkIV8cDgSJtEbfkqU5WHVkjBdGKGSk7seppH4WVXzF0bNC59m
         daoyWPTNNH1gsU0J7iWg/CDG+E/jjCoD4ktbgx3xHH6+x69nDPszbWj+fFnAagixW7RY
         8RPFMEBV8Qu37UiBxWMhKM7jAfq7HNSHdcYAjMcuCivIAT/VNbsNUZH+JwcwsS7oiqAo
         QOqgeqEgPEDNZPhSld5ze7ZnTBEQWdvTcYzGlHKepbv662rA1w9JbKt5kJmq5g7MMZtX
         7Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792530283; x=1793135083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0kb4Akw+bn8BPFIkHjW3CrJjYWME/XFWI4jMhrgN6c=;
        b=Yn/f+4887heiiemfasmankTOEkIB4xp4Trd9uTLA8QNDQjNrrTUKrN+j4Ja/3OdUbw
         5TyygQllHvizOYPqLuAiEqzEUrQrXWd7aPZut5eamVUmLf1clifCAQgZ8z2o96Kc5YTo
         15C64RZMYuOZXv6XHlilpxFsZc5Vzr2kOl4iPm3Gc5n8Kmuv1w4YGkas+0t316RdvouL
         BaJVbCPAhl944B/M7KUL2lE+VOPhc0FL935NMJd3KdmhD64dp1e6M0rtm4pnaq2kgEPu
         heqVcbBoAZm7qnAz2fAGcaY+DHa3D0wiQ9K1JndR2DU6ClTHAG+ct4IiualqLtCOOOie
         MHXA==
X-Forwarded-Encrypted: i=1; AKwUvBys1WZFfwvBCGd4tR6Q9vIFy3zBhAQBEKX2GC5W+FrFcrXAY8I3N2VM8mQ40vYKoKj8QnJXA2/qifUcu7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaepHJXUoRxB3Sei6mpYvE2uiaBYKV5UcDHwOoPGcuc0tuK/+m
	LdCWg4ES9s9tIIAwJ+RtrAphZryXqWSIeAraV0kCfwMH6nGb2jaWBB2MFb0IrQ8IdjXLQI7ZlDC
	dfL/nuV97J3EeMW5Ef/QGyQfeO+0aNb0Q1LlxWA1y5mZNhAbiOCiL3GNfIjVLgJY8y7s=
X-Gm-Gg: AYBFou30ZS7idwB3SWIsuqUK99uHuW0MD10kqVWFULrWmVZcxMgSFZ3bAyKtNRlcfd1
	SZKsPt/Fc/adYaCBs2XGEEY77BvWNNfE2z8Bm+wZHdi5FimBmE6M63Urq6x5Xjeos0LxqvMOU96
	Y+r/vgL+PjZxn+EdX2twl+NGNnmEuFkahn/1gmzpQDkwMH4SSztOYOn21hA6WLvsMT6rFTpJZdf
	AMctrOQgHackNjg3aBKI0t+mfcO90y3HDhCvwcw/c6f1ZuDGjVS62J43J8+aD4tXgxpP3RimdSz
	pq9CeeFovE9E18oJMT7rrVk+sH5xVkuuVbgro6PCOXKO5f9doFEdq8GYEdMoRREHFjRDo/ozTyE
	vGgXnD82Xuk9R/p0u8Vugk46iMEKwjdKosovHatyxo3nhZHp+Z31ocCqDrw==
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60054c88.25.1792530283106;
        Tue, 20 Oct 2026 14:04:43 -0700 (PDT)
X-Received: by 2002:a05:7022:691:b0:149:d501:b990 with SMTP id a92af1059eb24-190a599a59fmr60003c88.25.1792530282524;
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm1009238c88.22.2026.10.20.14.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 14:04:42 -0700 (PDT)
Message-ID: <0c6b0b6f-af1d-4b7f-8494-01b1990b2d52@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:04:41 -0700
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
Subject: Re: [PATCH 3/7] dt-bindings: phy: qcom: Add qcs8300 to the CSI2 PHY
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-4-anusha.nandi@oss.qualcomm.com>
 <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mNjmAlKD795m79ZlyA3S_y5is3gftXzb
X-Proofpoint-GUID: mNjmAlKD795m79ZlyA3S_y5is3gftXzb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfX1KpXdkpouWMA
 iNJieVbh7/j/Y9DBOZc4a6wFiVB1U6jck22XbLk26YNElxB5HCQ0Pew3389r3vqZqDUByf3xxKI
 83ftHaUJlslLDTC35/8lFV4QRPBzLPc=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad7d76b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Xvw101RpNOGDi7fnrawA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NCBTYWx0ZWRfXxsHczs7zoBlT
 Oyvk9CwXUxFrCoR4aVm93V2kD5v8GewwnLi9PPCS3gDnRkKHCph3h1oosm55CDzlo2qGt1MSgFJ
 7Z2nZlUFHmYT8NchYr8UAiLqfzt/xDt7Ncxl7LO+AqMf87bfTm8ZJhk/2xPl6ivsftEOtOD2w7I
 McnXOAou+VHYVOAWcyDCL0QJWFAG64ItphQmCZXkvjP7p7B+hAFHXP0IJXm3Jeow0t8JDY6hGzn
 fy9cQMbHfmH1GXgOqDySgX5Qe46FQi1qBsxt2KL8aXrW3b2DxxTVhfU3zgcxQfwBJMLHpFnkmQS
 nGCK0gMSQUY6LDL/IQmEm90dxT/RcVTgUS7E54btguOi/JwTA5hS7hB3qZf3Vae/bqUmdEGBjEH
 YdzmHSLfXv/nkuGFBVX56VedT4o392xTy/G57vFYhk58Sm3IUBJrI7GjEqxFVzHKNN89b6g13EB
 XumTSqv9iFHwjsE/EbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200084

Hi Krzysztof,

I can drop this file if there is a generic yaml file.

Best Regards,
Anusha

On 10/19/2026 12:18 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 04:54:58PM -0700, Anusha Arun Nandi wrote:
>> QCS8300 uses the same MIPI CSI2 CSIPHY as SA8775P --
>> identical D-PHY register layout, common-control offset and clock set.
>> Add "qcom,qcs8300-csi2-phy" as a second enum value in the existing
>> schema rather than duplicating it, and generalise the title/description
>> to cover both SoCs.
> 
> Just squash the patch.
> 
>>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> index b66ec2f14189..8e60ef0714bc 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
>> @@ -5,18 +5,21 @@
>>  $id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm SA8775P CSI2 PHY
>> +title: Qualcomm SA8775P / QCS8300 CSI2 PHY
>>  
>>  maintainers:
>>    - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>>  
>>  description:
>>    Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
>> -  CSI Decoder on the SA8775P (lemans) SoC.
> 
> You just added this line. Changing something you added means previous
> patch is not correct.
> 
> Best regards,
> Krzysztof

