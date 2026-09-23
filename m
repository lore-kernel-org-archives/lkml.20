Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73F744160D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156154; cv=none; b=tFcSGLD+dGfqCuyL4q1XyI4nJaW3UtTgD9907VsLLAm3WskzvAFG5Mn+TfLyQykCxqYGm//LxAl0XYACQOl4FYLbF9LhzEN5i+p3FUkDnoprdvNIXYG/z8IdaCLttUV4iLDjjMXoQFyy1tCRVRpagtsvUgVojDBJJpOF/spktcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156154; c=relaxed/simple;
	bh=+KW56/m1f0LcGBEwpVtXeMLLhYTnhtFmQvwm2VQM178=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0NHlSRRCXm2fPIHcAwKXn6tK7Ie2zgL08QoF78OgIT+C2T315msMbDb8j5JGCBPLV21ROyCaW63uC31eg0VH3lR1Fe5VqTMy/qI8Xuv2tyTyQ/kWJl7FevpJwGDI55kRdsM425F6VwObtZ456oqKkbHiO/fMJMffJW+nqCwjls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+C/TsF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDvSxJGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+C/TsF7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDvSxJGu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JZMr2719109
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/a7Kn8oE8KuU854oCdPtjGIYeAUtLJH8vkgql5qoro=; b=c+C/TsF7cSGi9D2Q
	X1+ySLNeZJ3+T4oMFCW2pyPq5LDZmZTgBImcmKCK4TwpWva/teTWpRWGjXIacv+I
	R5OfyyESvvu/OfjanPzg6VIWeNdhcE9RY9391/M/fKUlsY1Ls2WgGFn7CYb+4Y9c
	hZib5Fuu/VC3QYrBjCB/riheYb/BgXR5fvzrharNjmkraZueaOzbaVgs8rWNV6QO
	ynKLHIKSE5nBXdFAWzJa6LxTWa+DHMnBQM+sC1/uW3JLyn7+z0MsOwlPfT9Lg8GE
	DrrcbRe4UjSdpjiP+Upj53PJfe3GR8QRkaPNw77bEwwO8V/OYdDnhHXnWy5FUglC
	Ug39KA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qt4cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:35:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso1044928c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790156151; x=1790760951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/a7Kn8oE8KuU854oCdPtjGIYeAUtLJH8vkgql5qoro=;
        b=iDvSxJGuO8Xi68VsYVDDIQD+rmmJfJ4PXk1/Xuwm1Erw/SuhFxbpbKMBdKHSCxOvGD
         kokdMkRicBx4YCAGaGCEdoA6SbU8vVcDdE3L9jUyeAoEdeK2pkyVfqKBwXymRg/2tocq
         vpN5e+CC4gvKSqjofszEC3TQZ2ol4h82HbTHC+J0bQ9NWVapwsYRTzBp6js8k0N/dpbV
         M9OnYk/9gY2TTVxWm/il3JbpFB0nIJoot2B3gvXlbLDwpzTuUdbfVPmrg2X0HMiEzK+y
         OhoaGU4Prp+pawptK+QELZC64lgKktiYDe5MPRMn15eRfyxaLk/bHP8pqTmURzDxpHOg
         aKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156151; x=1790760951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/a7Kn8oE8KuU854oCdPtjGIYeAUtLJH8vkgql5qoro=;
        b=1o1gOUroJHq6QAxfbkK4eEScKCWa+VwgXqs73sEoMwBNKLoG9WgDwTk2MA/Rsi0mB2
         nECcoxM7pZL5trQ/FU+GlXKJ95dUCVzGX6QBePdc7D8Hhl4U4BvvCZovSisNP/fO++G+
         O0irOv8CXiOWgQBhbS7xLxKyQ1rr9TqcjHl4uuSicVY7s0uW6+PnJOFrElAVGi30bKso
         YB8BdlxSLdt7F8zpMLL5jyrA6NECrnAdEvEu13nl3kFb/PNO5GHFnq1daMYXsoKlfWSb
         F+6yiAsTsHp9GePLn2PLHOx6TdT0sTJKuBIoci9a3G4Wdu0tvnbUdy/mRDvyIrYpt0xd
         egQg==
X-Forwarded-Encrypted: i=1; AKwUvBzrEI3+/rY7mxxeZ5aatLPSqqFgN3rK+iuFgkXYaKb45d405I10/yZOPNDYRcUJWf5uSI+vRa9So/Xw6Cg=@vger.kernel.org
X-Gm-Message-State: AFuF++l9TVLHGY4azMUjYIAZQOoyhJK7Q7x9wj8cDT8BZHgMAIE0Srrb
	DLzBElysedL3STk1Bll20VVGS70OL2DmqW079Nh/mKus7hqTKhASAJJAZo2IhW8b8uzm1vyVfGD
	Mrk/eDx++N7DpqcyPtzl1CFvpu/LNVypMZHuhlc9vX9npVjVHosolWTJTy4DZt2dwAn4=
X-Gm-Gg: AYBFou3DF5xeHm2MXrwqo9DGTUuO/Z8qGF9ohj9c6PM4nPoYhO0FLWqKxZVxAuj30EJ
	wj26+UyfVjZhjqDy3L43ZZqWZdr5fhWypT6R5IulER0l5kQYBfTI0zQCE/xXdxKjN+faBmpxhRW
	7MK3hleo6sZtqD+3TLNebWh5Myf7IQVLSd/6caEeabiSyy6lDFDVYj4k63auMF1lrvGtbWQZlXz
	DzVhY8GQrlGndWYzSycwOMZgd/2ccdnITdQbZMQasQC+QBjEAVTCX2QbjHWTXJHpR1MHJRYDouZ
	9Bq2N2fXVuFhWZvYopIodWA1qePU/C/ZY7ZGo99ENCG2IthI5Ko9QPllCpSyllOI3teo+T3MPxu
	tPtYFaCZ/PiIaN8g7kTvMYixpGBJcsf5q
X-Received: by 2002:a05:7022:f902:20b0:143:298c:924e with SMTP id a92af1059eb24-144f92ed2ffmr1965390c88.45.1790156150573;
        Wed, 23 Sep 2026 02:35:50 -0700 (PDT)
X-Received: by 2002:a05:7022:f902:20b0:143:298c:924e with SMTP id a92af1059eb24-144f92ed2ffmr1965365c88.45.1790156149790;
        Wed, 23 Sep 2026 02:35:49 -0700 (PDT)
Received: from [10.217.219.38] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f982089fsm5080325c88.5.2026.09.23.02.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:35:49 -0700 (PDT)
Message-ID: <7a452005-ad63-4687-8cd2-6dbd054cb4f3@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:05:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
 <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
 <a3eaf9e3-5c18-42ba-a645-2efdfe161fd5@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <a3eaf9e3-5c18-42ba-a645-2efdfe161fd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab39d77 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qXHdgDUTi1Lqi5hRQc8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: EXACUMOE0nXMemoMbCwRKiXXrlOvhDvC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX6cXRnOVdrlfP
 Cp8NJRBiz3bfe84/5fOx7YwwJhF+7WrKeZwJ5INMuuq/wSBrYDON6rrtt1He1Y+zICVyc3aRb/5
 Z9yDOD7tLQ/F+8gLSbc2dyCCylKsgJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX8DC+mZDmQtm0
 S8iY44yosM8w+LmUUvBMFB9fpam7kWaHuS6UdH17TQADLlOMx6G4ovg7OlHHOVwFlWzC1MC7xtb
 MjEulF5vqDCBiUNpNK6OhiBSUQShzghzBRiGWxLf68S9zW8dUWUiXXfnEkwoYwaP6meu00seJf3
 AVQp9Kr4DigwfGFSpuXQfdBO/22UIQtFj1RDY0tmZZej5FNUH9v5dW9wj5kUDixdZJ4U08jVvN/
 pBt8csyD74FHIEBj0mouz3XJ2mnUU2BHYyBwrnzDd4OhBVMCqR1wZi4RWfvF4A2Z8bwa54oNSaa
 gGZxZreDC++Gcu1q+RG+TtoHPZJCjNN6tVpWfarhrI4PgPcx4mrrffARXEqLDBTxHp/YFXBJBiE
 ZVtRHCXlam/1vn5iQ6JrYuJzmh0YLqwT9SKnXjle463I90A4dlGBQwzEajCB5u/0kdqRXGOEtuB
 VcVvEw6exn2SKaaEBPg==
X-Proofpoint-ORIG-GUID: EXACUMOE0nXMemoMbCwRKiXXrlOvhDvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038



On 9/22/2026 3:40 PM, Konrad Dybcio wrote:
> On 9/21/26 10:28 PM, Mukesh Savaliya wrote:
>> Hi Konrad, Apologies for the delayed response. I was waiting to verify the changes and ensure all the suggested updates were properly incorporated. The effort was further delayed due to some slave-side setup issues.
>>
>> I have now addressed and validated all the suggested changes except one, which I have responded to separately below.
>>
>> On 7/18/2025 2:21 AM, Konrad Dybcio wrote:
>>> On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
>>>> Add device tree bindings for the Qualcomm I3C controller. This includes
>>>> the necessary documentation and properties required to describe the
>>>> hardware in the device tree.
>>>>
>>>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
>>>
>>> [...]
>>>
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,geni-i3c
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>
>>> In another patchset, you expanded 'reg', can you coalesce that change
>>> into here, so that we don't have to worry about backwards compat?
>>>
>> Do you mean as below ?
>> reg:
>>    minItems: 1
>>    maxItems: 2
> 
> No, I meant that since you know in advance you'll need the bindings
> to be altered, simply squash the two bindings patches together and
> submit as one
> 
> Konrad
> 

Sure, will publish full dt-binding describing I3C hardware including IBI 
related information and accordingly update the commit log.

>>
>> I did it earlier to add support of IBI feature, but i plan to do it later. Right now, i only want to add plain i3c controller support without IBI hence.
>>
>> I shall add expanded reg while adding i3c support. For now, its not required. Please let me know if this is fine for now.
>>
>>> Konrad
>>

