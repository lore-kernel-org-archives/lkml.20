Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597949;
	b=BXBWgjlfXglB0ssBSi9DfvGe3vHBKUBIMALALISYc3CtyWYNk41ttEV2IzrDmZDSHOCT
	 ORdyIGyjKY3F6p+3WS2AQbtgOSPzn1sKhWmv+gJytCrPOjd6wRPJQ72toMMOwYg84o5EL
	 uF8b8hfQWd4bOYI3/ovPQZ8XvjJ+P3/lCg6lB0ud3kKUbdP9xS/oNjjx/PEkCryXFz8sB
	 bDYtY9CX8ABVe4LWysRLbBIO30NfEBd1SjRDa+evuGvG4eOpBvSlTxTS2/tTAyCxbkBnN
	 uDOKhyYE/81Tjm95cEuw1Uc6n+36BkROIuTitznx1DkHW5dgI5+QR0axzRFKSzBD13g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
	b=k29we/zqwfU3faIhkUNM4ryhNcPYWbglro3qvecJC9QhpNudVOV1D5p75p5SuFljE64f
	 V4J162izTN7VL2ZQfZgjAL4S0vspxWNM8mUqKArTb1U4XstvEKwQFa66AAjHZhRBLn7FN
	 mJhizfYoCGlSW1zVDdhUbcrzkFcPsvqy5vDR9HIHD+cranK1uXJS8Ksmw7P9ryhgxMqUJ
	 UdbH2AEgdyZw3aJXsxRHOyklTazPq2MmBTTzMck/aM9JTm0CUwgobeOaYZrghQOFNl1lg
	 yu+RujTb+OOVvHo9zJU8d3U1MJywsCZhx+KsEOkboLcWxEI1D3RV376ejN7fxgSWqPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C09606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C09606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFToNE141134
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=; b=X1JkZaaMrgTHS06M
	o7AuxubVAHNYAzDNoSeEZL7PJ8n7fdXBQFkiLgF7WtJ2/ov+PYwQneQBBkjh0NLC
	WfSNd8poJWwVZ56WkR2BJ45KPIORIWZS0/vfNsltIzvoPJNs/VfiNqPuH/zX6da4
	/48UV4Zar3SZ/QSaH6ySYnJdw50tmQf4tcpzsntlvEkD/tSp/RzyEi73Qyl8ZKbv
	Ic1Z7Ko783ll+iL6fmOlCCOtBIkmv4MvR0p3uY9ypvyBonzJxsZw7yuH2Sy3B1xy
	9oqq7kFjeAfSK0kndMy674r74DOW8SS5WZh2+3lgEEDFqDotzAsPcZTnldI6S7bH
	o7B8MA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex588pa7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:52:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36696c9f55bso921254eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597947; x=1793202747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=NbdbjfEkAUJfnEOgZvzihS3FCsTQ/Eq5luqXC2kqzy8XSIUgB569FdxvJQSc4ZsqlE
         q7YhhPtgkLq5Q0x3tWf1iFCO5/pb7hZJqv+UpyH1EeNJ7PrZ1O6+Ah/6PeEDtAjGromG
         iJrVKqTQo7z8UfQ7A14Sih7KFs0twkd6oyiP5RjsKGnpTPye77eKNEVm8/qBvrJSd3LG
         5bLMnICoDn3WRFtnga56XiWB0lfVJ3BSm0fw41YAQfHDUu61T5kpwFBBln3jFBAn6uDu
         8ichDtqGCgcYloL3/2QLB0DRzdLqm1mz4Xj/6feijC8WD/8TFK5eVtk2dcV5jH05Fyhp
         kg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597947; x=1793202747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=uuh3adK9zzcQhaCoCurjOzD9r20M69F8rnB16ak4SD3xL51q7RMcOKdpc7+HZhuKwT
         vBVsdP87A107+9IZqb+0XeTrlSCyhIukUV4d6xP/qncRcAg5b788XRPrh6ixdO+meFqt
         gz0HEwPrzUCLyIkEMtHm3OeVrrEGEVt7VkLEDdZCkt7uLOzNsLHJgO/i5nLshNBOh8sX
         NtEBZWPyxpPJrqz5ZCv+DqdPBpynnJ5At012ToFzwClgJm2QaL8rAG8mrEvNgJfP/H2w
         1QY5lwUeOVNkNiYUbJXoBrPUzo+jcJsxJ3VEWpzV0E0ftN8QAtx4COYTlj04nWYc+jKv
         dEuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDoisU2nL4R4cv94f8gWnKEjbfT8T88pEIUmplsq4lUU0eOSfgo3SUwvXRpFq7HhvSz+ML42EnMib8iW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgfYAr2mVWC2WkewtZ+Mdude/KfXEPA4EfJkV0RHIx8NrCCY6g
	XkO8mcY0okUDWy0UDIxvnFAsPGynQZtw3mmfJ6+r5oZ40jwdjwnTTGvAk3Ag/xwzY0Jv5oftPFs
	uT5Yo8JUPzYfkLSktayuWWPjlGHY4+NjGGHRbXR1WiF/6LxnECO9AQr3RUuFbBaJIU/g=
X-Gm-Gg: AYBFou1Gs4G5mGV4vBrSWPPi83xGRxz+AMjcU3jRkDA7lRZoLP9QZDjBwQPXHNUXUaV
	+nVYtz3SfXUKJ/EG9IiIZ0vkz2tyQQXyclliZz5QgDv8z1goEYEI1xQfE42lRi1u2boxgVkLzGt
	zBEJ9iA1FnBO5z52wErTGcpYpjl4/vKyk01WAX05egIJnUJFoyqTLYZyABAO20UN0QHFXMuLU2t
	qRntYIW1ys4PekUM4sVtw1IzJdDzzCfanQCreP1bzRWsWZ+FdN3u0SUnkh9lYH+Sbol+J/EjOCA
	wD0fRbTHGLBqih/DW3tzUxzLjor0kmuSNzDb8WRCOFMVy5QZONJWL58x3GGmk7q1D3tggq+P5kR
	v23HU61hGjjuSmt5btkV6BLmIgEfN0cqhLTNrj9iz+oSa
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3321006eec.10.1792597947121;
        Wed, 21 Oct 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3320967eec.10.1792597946485;
        Wed, 21 Oct 2026 08:52:26 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm9445801eec.25.2026.10.21.08.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:52:25 -0700 (PDT)
Message-ID: <d163db9d-5b0e-4bee-aef1-3fe8b7f1fc08@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:22:18 +0530
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
Subject: Re: [PATCH 3/4] dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650
 apss clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-3-fd4c2b3cbdea@oss.qualcomm.com>
 <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX8aG53L1lh069
 jR21q4BTS4VTUxeJV2/gPP+chPRQpxO1PBQre6kt8RM69xwlAxXBMsUFg/47QpNc7y+qoflXxg9
 rlGa+vvaWKJW2j+vGO+0DP2qhiv855M=
X-Proofpoint-GUID: 6u7AQ7y6KwUpw27SW5voOFh6N54BXTpU
X-Proofpoint-ORIG-GUID: 6u7AQ7y6KwUpw27SW5voOFh6N54BXTpU
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8dfbc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mdBYyscGZtZr9QMU3J0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX5SWHo89gefwD
 bSFFD+ODEOzz6ua9QdLCfdgf/03OqHG1D/Tjwq/9wjNdXwIL8MG5GAPdCfel4usEGsV9oVxT/xG
 sJRqVPH7fpc1zpoljZgo3beUDIhyEL00wx559fosSW1vS4TbYP6zUAoH1NzHGyd8nojDaXJicAS
 qDoA6XdW+OrYNSd5E7FNsMNI9otKg+29H0/7lxdrBN6Saq8oIR4ounIc507YQeUneVxXAhmT2zM
 d58AZ3HNiMve7Co80hfY+V2v9OsLw0f97MUZcnlOYJClV9LbyxcJIby1Xn+FWEVPVBJT1DxcoV1
 E5qo/aqx3N3VFDgbD/QMd7OQu+i/QhMjEEDZDNElvMn2JGKIllgeQ6VpjakN9Q5ZtscBhEQ34ZU
 k48cZjvfs3bUPHBFxjSEuIIF8xn9Dy8qWL2oFGJQBBu2LFjWm1gG/wDr2LJQEFL1Wv5MNu7tQ3Z
 u2vPIrJV2q/3kSmt+WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/13/2026 12:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2026 at 12:20:46PM +0530, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks and
>> has a register space separate from the GCC. The four Cortex-A55 cores,
>> the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL,
>> selected through a glitch-free mux whose parents are XO, GPLL0 and the
>> corresponding PLL. The L3 needs to be scaled along with the CPUs, so the
>> controller is also an interconnect provider.
>>
>> Add the binding, the clock indices for the Cortex-A78 (gold) cluster to
>> the shared APSS header, and the interconnect IDs for the CPU and L3
>> nodes.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq9650-apss-clk.yaml      | 58 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,apss-ipq.h          |  5 ++
>>   include/dt-bindings/interconnect/qcom,ipq9650.h    |  4 ++
>>   3 files changed, 67 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> new file mode 100644
>> index 000000000000..6b47183edd56
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9650-apss-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm APSS IPQ9650 Clock Controller
>> +
>> +maintainers:
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description:
>> +  The APSS clock controller provides the CPU and L3 clocks on IPQ9650 and
>> +  has a register space separate from the GCC. The four Cortex-A55 cores,
>> +  the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL.
>> +  Each clock is selected through a glitch-free mux (GFM) whose parents are
>> +  XO, GPLL0 and the corresponding PLL.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9650-apss-clk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Reference to the XO clock.
>> +      - description: Reference to the GPLL0 clock.
> Why do you need a new file? Looks exactly the same as existing
> ipq5424-apss-clk.

I kept it separate because the IPQ9650 block uses a GFM instead of an 
RCG, but that's internal to the controller and the compatible covers it. 
The binding interface is the same, so I'll add qcom,ipq9650-apss-clk to 
qcom,ipq5424-apss-clk.yaml in v2.

>
>
> Best regards,
> Krzysztof
>
