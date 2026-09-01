Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769372DB789
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244322; cv=none; b=Ulk7FeBOGzV3YFsXyYMW6ROD00KXygOOd5QgxshUcK70bkLbPvJXWsWPH4zmOjGx2IzZwmqzFfAQ4AeFweUZmL6fPwaVI5E26RFzWq06rHDOHVGUYLSuUaRfQWo+9NIKSc7bHFoaujxhp5s9vpiUbEnSfIV0sQu3T9EkjQ7bppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244322; c=relaxed/simple;
	bh=dQ8SLE497iwC0DArYD177oqNcp5Fug/EARLixjeSte0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X8IT/RRXIBkift2B282AVZgK/3+eAKKKs2XyRcLwWU0jk4tyDc1CXsTlM7xSM59V72VCbNzVQyFXkAjvcr+lRzUQDoeIWsIewRdsQuHGvjFX2qwVpVzbNcs3CV9rpOta3nBQG6ZnoPmSZwDka8zHmG/FzRKnFjOGb1SQPzZwsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pH8wtk0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGuPtHtL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pH8wtk0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGuPtHtL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810p15x979404
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cX5HNKxIBAWwbUlALiWmXjsVapEiRZSrc2PP6beZxU=; b=pH8wtk0hyAhoI306
	u+ULz1hrwveakP327Goo0bRhCDredi48wX2KfEAMyYZckB6Rqb6fECslMSSG3dy7
	GOOxKeB2vzoY52/nQD62I0a5Wsu0xNKbG5/k/PRNQSMfvs109bZX838HZG8LcTTj
	j8CKy2jc0FiH0NsKSg7W16mRYzaDPpuXsVJcNLVNiHPrUuR3JVpVqp0cOkaHvip4
	Z4C8eiLtfRSvS86BWjNslo61UBlU6kPfMLbLcUXP28Rdm5FIUO7hEEbVamYERxSl
	RujrAVdQEpHJRi2F/Cp6QszApeJ5aYMdZQEywO2hxnLgvHwgR4elbltat3My/EgN
	NnUAqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dua0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:31:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so910159a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244318; x=1788849118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cX5HNKxIBAWwbUlALiWmXjsVapEiRZSrc2PP6beZxU=;
        b=JGuPtHtLJUfWV3X9rJ4+dkt5duBqOAfH7/Gu1QB7UUmmiaw1sx2fQDmr49HAO3nWs1
         bFtTi4JTzuK80INAj1afLNBF8phIhe+FlNSYO2FqTkWE58wKWstkQ64T9MyeKYJWZZ62
         qKCoFZ+P8gytShkHAf4g6tQWf98GnsZp5r0IJTC1pNW6qSTrd5tbnXgxKACYxo59+zCw
         eUz/C+0649X0NYwkLR5d0+64X8fG+TjAO88V3ks8u4A5JN+KyWZfjuzlDYrrJoquXlHr
         mtHVwgAu3/9S8vhjXfx09dJWfhXQL0CUygN6qBiFPQJKm17SxJlvqr7EzjHATuzY6Huj
         NxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244318; x=1788849118;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cX5HNKxIBAWwbUlALiWmXjsVapEiRZSrc2PP6beZxU=;
        b=pi2Lp3u2UAV29AFHH95Vno5/wF8eZGJ2eZXgeu9q4xUgvR3iFYZpmMXUe6lJF5H9m3
         W8GdO729R9GsFU45lEaTP4f8WeuPRT7JLXVQyPZf40Ek4DiiUCnl6yBsZGJOnvk1SY1N
         jXP/u6f6P5rZPJIA0q5/CR01KEHIhnTRLHJVWMorLbgTKMlTfSaxfVJ2Jqeb/Ncc0rDO
         i/zSYpTAjJlWleVpwggFhv1QqS4q+bQEQjJE642u7rxIPiKV4ZLkfcMFfmf8DPH0FlZY
         fYHjm8lvMaEeCFmK4g6J5p2MRq/XLPg6YtGm3slFzTSlJKCD7lWaPlxIRoNtbtD08uOJ
         V/BQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2frPa/mMipqW+429evyfLqvlrmR1zk9rx6EK9FqLP525aGpD95I4GD5ZmCGHvSOXSNgn6S9Bbqqd4BIA=@vger.kernel.org
X-Gm-Message-State: AFuF++nqNFUWjV7IImMViJIM84m7gRV2OciI8UOg9qlS7Epzzjq2us4k
	OamNlhB+SMWbi6mUIUQRPgzewhR6PHrqRe2wdUmBCW2kwBGXx+fBpGglKOjHU+7NIphF/dkj7yk
	/KKOGb3JGGfy09emSURc7M1COhgWmtya7BtG/s8UdayVoak0aaBem3JkvGhQY2CojY60=
X-Gm-Gg: AYBFou1vJBqXvcm2B8X0Yp60wIGlfKYmrSp+KpE2+7/3bbGggXNVjN17x3VuPZHdeMB
	zeCnR2CrYkFldhwSvtcY/GCHCyrA5hK1HiIAO4M33yuhrCYYoZl1QFBz9HVTYGzkeYlSFRhzlqq
	j93k22/lLkXbZwFfvmzN6SUwUQqd1Nno65Ou4NpRvLsPXIkH2l4v7fyY52TZ0QIcMhjmaT7i1LK
	j12finguwUAljK31vuaOcta2kgNpHDy3dMnDgu7MK9pCPjHjxw+mq0ARHA3/0MGfjkSn9GC09fQ
	+2Q0kDGb/VP6PGlhPlIS1YhQMtm0UqheWzgqvuN8mlBAmHNQWtxe6hlfFAtK+Azj4CgNaywU2V9
	aCPrDMK+xNhU/ZSwwS2rVvKw5yav7
X-Received: by 2002:a17:90a:da83:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-396d0de796fmr49247625a91.4.1788244318110;
        Mon, 31 Aug 2026 23:31:58 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-396d0de796fmr49247516a91.4.1788244317572;
        Mon, 31 Aug 2026 23:31:57 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm34010711eec.23.2026.08.31.23.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:31:57 -0700 (PDT)
Message-ID: <87244cbb-53b4-4deb-bf91-d5570879db09@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:01:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] dt-bindings: ptp: Document TSCSS hardware on Qualcomm
 QDU1000 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <20260727-tscss-v1-2-beed14e72510@oss.qualcomm.com>
 <184d7977-891b-4d18-983f-7d23a7d9ff83@kernel.org>
Content-Language: en-US
In-Reply-To: <184d7977-891b-4d18-983f-7d23a7d9ff83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a96715f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VFrjYgP8P-MpaLTDB6EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1NyBTYWx0ZWRfXwXIuPvmr5ST/
 o8+86N4l6o69AU8SmOuninarDBOp9CEn74/gH20MSolhvpD8mafZYTHg8d95udy8ERRi7Po9P1S
 LBpuoy1+676U63lGj4T+FstkHn31HPclAt9bkPk3wDKZbcEKnKWKgsyK9B8A17AIHaJZwhuGA1z
 VHWf8plbE4G88kaIcBMmlWe1+BTadr/q+ukbYw7gALsN3X3sX9//rhk1XEe4jRzcLALrhFW57zt
 BodBCcJHJrxh3vZ8pAIUWo6uGkCjX0FgZ612Kdh+o4tK+h/WxmtH9ssjVC/ob6sBNzHitOdh1nL
 KNKga9kfXsBrKPZjxBBEf3nqePhSTurH5pETW3TINAshD3sSwlGyGxC9NRGHaOwDZFWXSbSXkIh
 p2VRBMoSAj6gvh0csmEr9MNlJsyNnx8WKkh41tDoOlYZWij6sYGRfRIdSqxwFJ0kwNW3xB+VyNw
 MhTPqpqydr32Fz5mMmA==
X-Proofpoint-GUID: V59FxxeYWfmDsU5Bx64xO0pyhIaLnRTj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1NyBTYWx0ZWRfX7+lHNcgB8rV9
 kAaJuwuDMSZ7+Um8m/3ox7qJcgXYxPuCOgBfxWGXug6e6SQE2FbJUI5nEMGkvDOlhEUlZNoEFA/
 OdZ7JuILWuWiST2jOd5QIcqz25RI42Q=
X-Proofpoint-ORIG-GUID: V59FxxeYWfmDsU5Bx64xO0pyhIaLnRTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010057



On 27-07-2026 09:21 pm, Krzysztof Kozlowski wrote:
> On 27/07/2026 16:10, Imran Shaik wrote:
>> Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
>> on Qualcomm QDU1000 SoC.
>>
>> TSCSS is a time synchronization subsystem composed of two main blocks:
>> Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
>> provides a continuously running counter used for timekeeping, while the
>> ETU captures timestamps for external hardware event triggers.
>>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 187 +++++++++++++++++++++
>>   1 file changed, 187 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..39387614ef8939b7840df2f0d5640b9e142fb4e5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> @@ -0,0 +1,187 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/ptp/qcom,qdu1000-tscss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Timestamp Counter Subsystem (TSCSS) on Qualcomm QDU1000 SoC
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm TSCSS is a time synchronization subsystem composed of two main
>> +  blocks - the Time Stamp Counter (TSC) and the Event Timestamp Unit (ETU).
>> +
>> +  The TSC block is a timestamp generator that maintains a running counter used
>> +  for system timekeeping, and is functional with just the AHB and counter
>> +  clocks.
>> +  The ETU block is optional and captures TSC timestamps for external
>> +  hardware events, each ETU slice binding a slice identifier to an external
>> +  event selector. Support for the ETU block requires the additional ETU
>> +  clock along with the per slice interrupt and slice subnodes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdu1000-tscss
> 
> Why do you create a new file with exactly the same binding?
> 

The QDU1000 SoC TSCSS has the per ETU slice IRQ lines. Where as in
Lemans/Monaco, it is summary IRQ line for all the ETU slices. Hence,
kept two different bindings for both the SoCs.

> Anyway, all comments apply.
> 

Sure, will take care of those comments here as well.

Thanks,
Imran
