Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928419;
	b=zH+qDfDuS9SyLvhfNevzeHhavblloQaDfAuhKmPVijcIuAiINidmJWL6hBuG1MxWDcJE
	 xQDu0PlnvIlNOce2weLj4agi7Ccq+P8U+HsW5ojOS+iLqCq4BZAqJ/QiAdWsVZW2Ry1AX
	 UjN0lDhs2+71ccKVuF+HJXnPEw0HyzLZtXgOUMER/PdjJEIo86R2HiQBMP9wyswRD5+wB
	 jfI5vtl/CYEU5IJmIZ52khYx7d+mqpzQCczge67ngjWnZ/Hmbz0n0t7ban8oEaLfj884S
	 AN3vBA30eJ7NRG2dyE8fWtBOwB5JmLcYEGdPaEZYyx1OwGM+uacjzWpserRjIqx1W7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
	b=5RhuFr1TShD8dt0rMypqXr4eqBF1HUJREliCo0w2cwS+tFuLh2IU58fcSumgA0sbq7LR
	 H4gdBKGz34J231kD7TNEgL1VK0S758QA6uOSGzOGxr4RymyiCA48//8SelmMHdKiLVNTk
	 am4qVl9vmJYcon/Y/+bJsyAXNqHAQ2wA25dywlQJpTfK9QMnOqXOTBmrx4NyojktL2z+r
	 iC/ikYj+BWlq4DvUlHqAyz2ZN2BNSK6q9TxJnAeSS53+iZeYjyx7fjxnGnS6j7pnGT3fl
	 9rUged7cPab0//pK3B7Z3TW7crTi9qKQq9XAiTWIp3Lp+D0xER3M5zHRFdur7I4/rEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hw8wn4b7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUhHkUfs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D348606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D348606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hw8wn4b7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUhHkUfs
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1wEd4187988
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=; b=hw8wn4b7vlXPbNBb
	3ELc5vkyLGpCe4P5F8dc1zRe7dK/4lxN75fsIwO/hK4FtcUyVCCCqbCx8Yxzomp8
	cl97GeEu/WxdPNdUJirMLnByyTtIN+XhzSXvRaQzfaWGzgplPkWPHYjadzykE0LG
	z91DkaELUVH13hueRYheUj97SmaUsKr3/oQ6J8Rh2QyLQr2EKjUjcCFKovwWOl/g
	okl4AhPKF6LowSkhwOZAFdTDjMptx29x1xFZoGliV3NVUBoWyIByij/oqCjixIwC
	63DsPZ08qxEsGqCOiL58aO7DbHg1DO5YY5FHVqKB32zkglAkrXq6cbihI1g5HF3J
	ipdeRQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0btfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:13:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac74b0596so2484884e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794928417; x=1795533217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
        b=ZUhHkUfsm2kMROOMLXw/McLVLTUz3YT4yK8KdMHg9m1lt0s3isER4bbUPcPM5Al4lZ
         uWKzsg67C3EVj689qpAhhnXPXnEtiN/1C2Q4mp5IrzDwDkuboAnAtXkor+zjr6xb83bD
         aI/dJcrUdw2mSGa/oarfwifDxwUsjY5V6ddqN6j20UFi6Gt2abLSah2VrvwkYRvNwY5Y
         Gv5QTziC2F+cfhIaZ79jrMRZe89ekM0AGdK356oL6dOptzJ3KrWdePklK12oyd7u0bcQ
         xiDWTKH9ad3XCO06krGlluHzTljxNnCCehkphmrP4767FOiRCCnpWb+0+5KeX2sMRHVj
         TwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794928417; x=1795533217;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lx/UDi9wR/Ft+kPyQK4nI2B4fjoS8MtgwlCtTpGfX24=;
        b=zbgGVB7APvfHrg3qy+gQcJWgjTcCT2ADSmMKtVMtaq9EfXgKAg3VF/iqBMxRPuZmpA
         ktDWCBB9XVeQ+WyLZNUdBWoX+/8+YNv7JFVdAgxeYFpIIV4uxH2MMVxjsDWOJvKDjT2u
         fRDFSPNYtvgsMKn7kwGGh3lz8ZKqsIh44vDWlywVRde5WvyvO1jVY27NvGoO1AadjOwb
         +BWmY8N2tcqrb/RVH7RSja632vW47l4PbQOoks8yn3ayu7yMkHwCDITQWn/pZT7YeI1a
         7TyN6rEKli/AHeruTZoJws+dgPfuB9HhsEx4mB9QMiYwReoLbYc71B8YIlnBID394Ccn
         sRAw==
X-Forwarded-Encrypted: i=1; AL+hErFkErpuWWyGIVxM9q8dP2oeHnIe6JHhGSKMhQIYqZOE53REoKPABEQ3kWIqFlM7o6Ed8kr5R8pXeriBRaM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tRqO1gEpAEgTEfH3seMgBz3FyyHo8UQ0qUXqOxDcN+M9fEZWq
	8qmzJ17ZtgTvEnXtYNiDCIfdN39zGgj5ZZwkrtrquXiRCJzfAkvwbJlDvFEf7A2/oXsIJCfpGgN
	A0MlY6ZKu3X57ze2LDqM4S2TAgM4bCATxQbHKfZnMcWKeoWHwL6FHDviRNE4jUIDD54E=
X-Gm-Gg: AYBFou3UEHaTzlDlbB6pPPyu4TKiuCp9u/zBBkY0slp/jWeB2oEoLlmtTFwYt1jsmed
	XFmIenNPNb4mrqSUhPci53/UhdlKaLB3nlmXNZEBRql65M/QuJ3UdufwsF4uvlotnUntRNS4vf/
	2jqQBI2Pe2dVpLLm/bJNavSZOJ6qxTKkRpQMUvJSinBdkkSD9ZPfWhgpojdGrMrTElzjIfBfMNr
	H83Jlgdq2iB0XTqj0gJOlnP/NP1TUXy9nq4BGRGWgz5oQoe9XlLGuMet0ofFC+3Trrj7Y28WUNa
	SCw5jS9JH2MAaUXTfxnG3zj8jRFjv02tagK4GQjZw1EOrOfNIof1Antm6Vbr1kodIx0mZ1tf1g2
	lvEDtwoAvjv3hBXoSGDBiVlz7rmF4Mjkc2jf8357iG8GbmIOPUBoqzqsGFFmE2x1XZuwX3k5Bo/
	E=
X-Received: by 2002:a05:6122:21a5:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee34a469b0mr5819019e0c.5.1794928417441;
        Tue, 17 Nov 2026 07:13:37 -0800 (PST)
X-Received: by 2002:a05:6122:21a5:b0:5ea:df96:c394 with SMTP id 71dfb90a1353d-5ee34a469b0mr5818968e0c.5.1794928416943;
        Tue, 17 Nov 2026 07:13:36 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm108262885e9.7.2026.11.17.07.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:13:36 -0800 (PST)
Message-ID: <93acb3fb-98ae-4dba-a3de-fcf1772239eb@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:13:34 +0100
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
Subject: Re: [PATCH] arm64: dts: st: stm32mp2xxx: Remove undocumented,
 unapproved eeprom0wl alias
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
        linux-kernel@vger.kernel.org
References: <20261117133747.244933-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ac1a1214-98dd-48da-b8e1-bc8ef9f09316@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX5268FWa1yRvG
 qbcvhbxEx/LMGoovA6lsssPBQBVZITRVV9EmrUeq9Ty2juKDiZJ3TpBfM1B2fd0qM/jq5Mal+HV
 t6BssRDfIPn0t0ecbNZ3fQj/XEUq8dk=
X-Proofpoint-GUID: Sle41gBoP-8uScq-p_lXR-Bkrw8Kelki
X-Proofpoint-ORIG-GUID: Sle41gBoP-8uScq-p_lXR-Bkrw8Kelki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX+X9e7/q7vNjn
 NmGndx1yvw+oZ0Ls/IB2La6+OfKmHeDBS9EYgZKt+ygEBsubA0c2f+bRl3fEUAaavK2qOChY4KF
 o/eCl9xmwOltQzX2tZxBqnZCwf51Mv4jU3YueBLHB99NpXbXRfnwvFU4ucPo8TudiN2n0EtvpM4
 mgfP2a8fi0pFfeItcIaciClS80n7L34m/+pS1nYveuIWlDNBgJHGnBidDrhef/8s/d0341upyR+
 L6PJqhCVDHulMyuErDQ+lyMkazZJDHwNYcebE2dfUyc3ulLrKA0mfYbonPgB9NtKLQ5mZzSX5Rp
 RBvNHbdzUwe7ljWklmx22iZYfCcmHDIA2MGorLY1R9cEP/oymfZHCZI64vWy8M6Uhdh+kJIH0vM
 3nIDgg5YGFYwH+6iRTqs9D0oiLN/FA==
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc6f22 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-9-fYqzskX8NnebTxdYA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611170060

On 17/11/2026 14:41, Marek Vasut wrote:
> On 11/17/26 2:37 PM, Krzysztof Kozlowski wrote:
>> The eeprom0wl alias was never approved by Devicetree maintainers,
>> because it was never documented as actual ABI.  There is no in-kernel
>> user of it, although there might be U-Boot.  External DTS users cannot
>> rely on undocumented ABI, thus these are pretty safe to drop.
>>
>> No new custom aliases are allowed for years now.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> index bcf63e2ea989..5795b352fccf 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
>> @@ -10,7 +10,6 @@ aliases {
>>   		serial0 = &usart6;
>>   		serial1 = &uart8;
>>   		eeprom0 = &eeprom0;
>> -		eeprom0wl = &eeprom0wl;
>>   		rtc0 = &rv3032;
>>   		rtc1 = &rtc;
>>   	};
> 
> U-Boot depends on the alias, so please don't drop this one.

As explained, U-Boot CANNOT depend on undocumented ABI. U-Boot is not a
user as understood in Linux kernel policy "we do not break users".
Especially that U-Boot does not even consume that DTS! We do not break
U-Boot as long as it is about documented ABI.

Here U-Boot won't be really affected, because updating DTB in the
kernel, does not update the one in bootloader. It does not go that way.
It could go opposite, so from bootloader -> kernel, but not the other
way around.

Best regards,
Krzysztof
