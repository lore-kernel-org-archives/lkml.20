Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566543;
	b=Y+Oise0q8vl6f4hw89CbiGCNMJ3zZq+hrdCE2633fBXUEyOt/E7NDv5Y0gunPcpxD1+I
	 mt6nOmAh/x5mqxw0dKa1zKy0bpYJNK1LKHRCIdbxV6JhmTRSARIYpCS5xdoIGFzVgTu6g
	 9Na1OosGOO/ND3hvpVE7Zt4zQ2tIjascrBiZO+G5aaleBSZZ0z5cMTAT8aLNlhzQWkdd4
	 Uo6sVybXhv6e2vE3QtSFZKC+WtNn7Y2+8+MW579OXKh/sDLnaDVRJ0wudsSncF93QhoUc
	 hyDg00F+NzYYy68Z+SwNT0o5d7g1TaXXFyhfXOYwpFYpGOEkeQraWD5oF3A96LqJIOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
	b=hdhoYYW2CLSnDfylOvs/pj5Z1fF7rkv3bk+jORjUD8z9V5u+P8cYB6+975z+KvdnNTVM
	 4zET+ofj0+LbbFIQLaUW4hjROtHYVxnLLrFuxjWZ+b4TrbCs8NXwdw79R+TS52riQh1bB
	 smJRk25lQrOvlJbQN4Bqk0A02cEMgKuYgbh5byxedhvN3y7CCaUf4u0Dkzw8Dtawif3m+
	 yMk+pjL0EqX26HrJMvvICuSwl2gSJr5m0rtCXQhpkHt+gxwnIZIM4m7VFCUsJcWKcJ1eC
	 KdOkT2ITwvhS1t9j3l0XsDFMsRIt5+kEO5s1AG239tYqReHQ7gzjTQ6mj47jtb2VBbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lyx/avOW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CneAYCpr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFEB606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFEB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lyx/avOW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CneAYCpr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VVQg1527823
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=; b=Lyx/avOWN/Gzjezo
	1q2AESFfytV5VIPa/TFcWve/Mxfl/V+aCOt9f8aw3eNMHwK0VaiLSqaOxgmdBKTx
	AVDWT3kGjbqmV/Js6jh38h8s0VKLEBlnvSQTetiltKShQnuuzdn3tTmZ0Q10qy7c
	4a8RhL0pqt1jbknUii0S+rcLSTFW+SYa4urN+MPCDD02uqWnkP58g4QfcRz8G0cu
	5UzleEEAuvGCadrAoXU1Ya5Q8vbv+yFJNwfEUNKHvgwpIJwK7cNP2SNSju+wL3Ha
	i1waVTAMPVu8sSjEe2InKqDe1VC00uYQvQTfA26sKweQFrPZHUexdAcb2LEDsx7b
	K4DDAA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8uy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:42:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso3814120eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794566541; x=1795171341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
        b=CneAYCpr0wMIDCWkKRKF2h68KOh3+YP2yTmojV37gyu+EBAjGdLKaO2LAsYhraspMd
         e9rdZR0ALKH/1XI3jlGW+7b5xFxhmhFmRcLpU2nqk2b6nHSJMxanqn6eEyzWuOns5F7G
         i+BWOLykmS4cke2Ek9nJ8LKizDIt2CsU59BjtZw63WrP7l9hDI7uPD96yaLP00hFlDH5
         DRAffQXIRqtJt2ps6Yfb9zO2DyCI4UsgEm5BHl9MWknjoCVheMDxIq12eZ6TdZS+EPZH
         eypgHFmxVxmOzMmFLUZ4CsjwRXK5FHKUrS7q1PaaonGMih+VN9fDBMW3YStu0bMbdnEQ
         5dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566541; x=1795171341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZrSqa6J9X2gCGozWEGsXBsDcpp0b5wmHfpwSMEBVxs=;
        b=PunWF3a/fU66sPSuPsImocMGf6iX3vVmmMy1SshGc705I3ckiDBNDv2IzG55mBJ0BA
         3pnm32zGU5hhn66hJ4CzFR6Iqw+dVRhM8tWRrdwWRaZEP9wKknGG3/7BO0FA328IWuyK
         w4UP1TF2aZuMUsUXC7uJ9OBMEwbhAN3dSyRw4Ih2BTEJJhObGl/J5dqaNDsSSV0p6ghs
         44PCdzKZlNlfPec/Q+A1fYZEqvNPzBQYzl+aDptIuL91ToQsaXoTomh8HrwpVWvGkrc0
         LUxE89XkjeZINAXhNSzL3AdcSie2t4OFSg2sNgQK6r5HS6ywS2Gbw3lUoUEBhJ2NNcBa
         CuFg==
X-Forwarded-Encrypted: i=1; AL+hErHvqrUORYXTclk3w4+Y04+8ZxoMEiHQREEkMo4XK7x2rxIbmriw2uSzdUWGxkklPnY0Rsy0LzU2GjlAs4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9knKiU3QYdtlz7X+EUM2fEANQBDACzfeDP1JEqYMBF36QxGFpj
	G+d2/YT1BZAkxbtcLG3NjGt45D4KajaGZjnJaGEb9zvjy5b4KiPEbuP92+pO/FU+MNT5RKXqcys
	+L2x48aSpFB09ZV88JSBglI/SmW9V5Fr0gdCJke4v/SGlm42NNvuJL1FhtD6297299Zw=
X-Gm-Gg: AYBFou0WvhsF1n90PrD7N485FUWnCJTwL61takIvRqV5V3w65o0PJlmS7iWmN6fhcjU
	Y5E+6Ly2hqUAgLCa6/L6aEDzgrSYdwzcktEIdqmYw0yN7bxEqPXDdqxPl/85aUXXd9znDkZLg6P
	rdTU1nSGzeuL2MpCLgmHxH0Q3KM4/UD8l6OSq17dfYXoqXd2Aq/whmsKF+jPMsukGl1LcVelWqI
	qJHjq97huIF2id9OqwzkWy5PGHATzoFnpdZFW5IKzclQP2b88J35aULyKohGWrNP2ItKLkGecdK
	BSR0B376bBR04aA5qrPBxHsCDm3pwPEtyARjGQOcsfnqCGOpaAyOkFUZR3J0GSAXnNR6SddtGtG
	9WoBQ3pKyRE5l5qXfvS9cXiMHZTTKOcHt1Jo6grFJrMt8lSfwjyyC6hk0SLWiBIwseeAfGbE7JV
	5tKw==
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr2219910eec.34.1794566540537;
        Fri, 13 Nov 2026 02:42:20 -0800 (PST)
X-Received: by 2002:a05:7300:c594:b0:36f:a72d:29f with SMTP id 5a478bee46e88-37967ae6bf2mr2219869eec.34.1794566540007;
        Fri, 13 Nov 2026 02:42:20 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm6363256eec.6.2026.11.13.02.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:42:19 -0800 (PST)
Message-ID: <ff2e0234-3e9a-4ac0-9fe2-277735c8b1c2@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:12:07 +0530
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
Subject: Re: [PATCH v2 01/10] dt-bindings: ptp: Document the TSCSS on Qualcomm
 SA8775P and QCS8300 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-1-d5f575010427@oss.qualcomm.com>
 <20261109-qualified-pristine-newt-ba1c0c@quoll>
 <f2b119c7-ba01-46fd-96c4-10b918f98d53@oss.qualcomm.com>
 <2cd4da54-1dd2-424d-a9ba-e3e4fdad502e@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <2cd4da54-1dd2-424d-a9ba-e3e4fdad502e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX0dz91++vhs5t
 GkTzIAxBdV/vhLuu0D/eyth4izP4DIY3xVZ5VKOlCY60Lk1JphJnsthL4DZRiuVZDTdk+9pT5Ri
 ROEZuaTxuiBhPF6U3NOT6vobQ75GdXOJC2GF2S3Z010+7NqMtyw4hmWIW9Vac00Ii0Sc+E1FfIG
 8huzxifvO+oFbdiHc4vz7lHRR0+DT7zVwKwghZ1k/BICMBKk78XIRu/t0r1W1crkhrpEDB5vY/k
 NYzlsdrCmTZoB5QPrsWHlWUJr7velILuLlI0Lspjj/4TVK2WX2+UJSchAf6pD1u1sSKpKZuoNYK
 Lhe052DaKdz0HyycMmvNXjcZZgDm7dkfubCISAvLBHa1azTpNXjGvkAf+GAnxk9hFWYyb2WCcTW
 z/hn2go6tr/xrSZWQC8YlPpPMxrMMGpWlnfQGo41sS9jHeougQP2swVnNrPDy2gfjPtjHZdqjWC
 WUQxdqYwLUzLyELS2BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MiBTYWx0ZWRfX6SMQ1TtVXEKP
 461dxC47fKs9SYDv+hTpN59+isBPIvCb6oEsMOZco3w+gqT6Y3qh8i/+3M5XnIyJ1LJXTm6rNx3
 DTbQs7oaWh9qSfAs8IDdup1nNZMVNLs=
X-Proofpoint-ORIG-GUID: Mp5KKNDySDcRci4KGfu9AmGBAZyuuIrt
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6e98d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=A8zP-s-B-IGqv6UKJQEA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Mp5KKNDySDcRci4KGfu9AmGBAZyuuIrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130042



On 13-11-2026 12:33 pm, Krzysztof Kozlowski wrote:
> On 12/11/2026 10:31, Imran Shaik wrote:
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        reg-names:
>>>> +          contains:
>>>> +            const: etu
>>>
>>> Reason for same devices with different address space details should be
>>> provided somewhere, preferrably in description. Assuming in the first
>>> place, that this stays because how two devices can be basically
>>> identical (same compatible) if they have different programming
>>> interface?
>>>
>>
>> TSCSS is a single hardware device, split into two sub-blocks - TSC and
>> ETU, each with its own register address. Every SoC with this compatible
>> has both blocks in hardware.
> 
> This is not what the binding said.
> 
>>
>> What changes is whether the vendor/board actually wires up the ETU's
>> external event. The ETU block captures a timestamp from the TSC block
>> when an external event fires one of the ETU slices, which are driven
>> through board-level GPIO/IRQs. If a board doesn't wire any slice,
>> there's nothing in the ETU region for Linux to use.
> 
> This is not what the binding said. The binding said there are different
> types of devices, one with etu and one without. Look, easy to spot:
> 
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> 

Sure, I will drop this reg handling, and add all the register spaces
support by default in next series.

Thanks,
Imran
