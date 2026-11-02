Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617586;
	b=XR6vTSX9Cbg3cDJ9MiU/ImJK5vPCGCOviQbh5UJMyv16MOF+A2JAkw+ofb0VuHDgECre
	 xw/hNHj5IDf/vN4J6yviEB3xWABkmgJCDbwuOGVsrYNfE2vqsMzz/2Hj/9PTpCz5pCXgd
	 omFM3+6LZh+Z/IJFrjo8yXE0ZHlbvMC0DKUMtSu5LyiDCd8RIDJWCBcesU/Sn99/cUYr2
	 wWOBRJVms1u6Zk9vLm7CB4MZjFJM57FDFHnjpDIpSWldwfgy35Zjwd5Zl35EIf+pUkbVs
	 9NAKGzjYZN/WNj4+QuIC8gDxor+JipS7nkMa/kTqfUZoRKT3ifD8QNITTgnbB7WZzRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
	b=l3MBU9rZrY/oQD7YegIS/AltIZhc/WuQLHnBAATBPMdCVUID4NblMXd8G/s2peFEXEuh
	 mlVYN3LdeZkobvQ9c3UwW9sNASGu1BHUXSv3vbV+PtezKrz/qz6zpI0c2jT+zEP9DIEfb
	 qrHyEaF9ppLceKCzYWfZbbJIL7EyhnYkU3p1UXmPA/mJ9VgibAwFbmYVsswv7Rd+myGiQ
	 xrDVX9pHbYTJfsDRYz5F5WGNtriC7f8dwxjtXsc9isvHPfPokFwEqUoxm5DUyPMxisNda
	 4SomPbAsDbcPE6Bjylp0bM+ZHWfqdNayCkrGs2BCchCHEaCqplWxHBB0gi5b8ECStJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhmbEf33;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50AC606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C50AC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhmbEf33
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2sQd076850
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=; b=K4P9gBfNFfYhga8t
	CbQutxvofJsoWF/CvkeWYKvREfH5CcZEasccFLS3yOtqf+/MKUyPQpEO/osDuM0z
	YjyAwJ1nfay16y63LbsIRRkRwjVZ8BPi3qcBiMBSjtPSObrx9Tg3Kyt/a1+4Kw56
	pI/Zafkf7QTAdF/Hl1gyjq8/k84nwQtA6Jb8xgNC4bSsw1CohiQNdtWzKxDXGd6U
	3BQN+0oOiS0EmZNNlEVPPvoXIrFcB8jVcGaVfpwpHQEdTlTxp6NA0FvTQUB2mQBR
	lXWq2GuoXtCjxJpDlpO06hCPYzv0eI36aWpuWzTC9vJe3yjhjQEzY758piT6ZWhi
	ebFttg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r0h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:06:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so2099113b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617583; x=1794222383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=HhmbEf336abxUMbX+nncxu1QPp/LvR0T07PbzQG1Z72O3pp2wlKY7kAxPbb/JcwkXA
         FOx5T+LqCTTzwMzWmW08nAJW+uksUbaxA/26mBx49NoJeWa3RMkdEYYVvzQDRMvPX/qQ
         Hc8YRZ7rTscMIZV9Xrl19qfYW33IOmBou1lPeKmKKO3VT71R8ZrV508f539iBFmPIQlp
         jF2cW0SIYBMYQghEN0Qx6y0XZHhATufcvy6Fv8/RA0oz3dlDi8E3o+0SOo1etUqGPETg
         8GYTNObaYgwdvua2fvtygcPSZJhHgJ1zaoS3gEYVRNde3RIZPGADjW6TE6l723gzLurs
         0ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617583; x=1794222383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=H9GB40ZXMmDTmrxpObphICBcrbaA/64ykdKIcHPYodqjAOGONuZcUzbLU9lgvIu6w1
         z0rpg1GlKJeLcvRNCpzHR1HpmIbI4jCs+4sCB8A6YQrQrRdXlw9U4xfUzq6abplyR2XF
         aKCq7j0UnJ9NGnKQqnZBAHKnpZ1KG1fZbZrwLLkNsu7X8s9yzM49n93FGNgdZR9FNYiY
         C3Ocf46KeeuNlz2RVKdbxelepfI9O232up4x83sXAsmwBVr6QQmjM8ToDLz4YzFoVNLd
         7opBpVEMW1AYGsFEeFomgyPB8dNt+m+f4udnrPT+54fX2Tw5cdgmDi3lpjhWnKECqd3P
         oYxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxA6zJNnd4dyIoG3RGLqxKPmb+Ar+dYiLII8j34k6z+a5Lvn1dQHSvf9u2x7j1wxHZ+bmyHOGuUhYjLwOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FHYu5IJGj/Qkk6HeJuY/sbklu65gEuyzg0rSuZVKrYQShjAhk
	rNGkUrSXO82Y7RnH/fjZ25XoGzoGpMyXamNm1R1oizlk3NDGX+aFUncblm9MbWbABQ6KP6Q+4ms
	foABPzHnksUaF3SpVIshddLP0mq/NsVq7ZwTcbhEbAPvGoE/FHOLfz+JuJlpfUc9bGM0=
X-Gm-Gg: AYBFou0VPlwZ8i37LZuxbqV74nfKd/I8PHw1urSSFZ3e3vLpdmJcxAOfuIg9AyI8/Ak
	s0Znle95IxcX6ro5g9w5qZvHbP2vdnmiJ09dys0/zDmQQga3UP4KzDQEQQ/+tzWgTwa7GNRfY48
	WJV4087vvTGA6S8KRYbyGrS7LqYuqdx2+/v0DEcL6OJlUREII9prJZHX8nC4lA7cJwi5FSKo8iP
	xxmAI5fYLVHR+bXdZUrlR6gzTV1qYJ5YmDDF3KLxFxK4RNdmUOxFmt4Cxmy2C4YaMDNz3OjTUwc
	sqmPytQA01cT4JRBlQT/6A/EFsSl3ggnPgCX1CyR0EXMgiqvZJyNRjg35bJs6y5h2h9oec/YUTO
	dfUePXFvqHQ/tChpFmw0MZ7019JW7o8199jfJ2Zk9j9vpiWmoxmqlJ4RWyHoaK+24BRVYfs3kHQ
	Se5fIi3Q==
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142672b3a.26.1793617583577;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142622b3a.26.1793617583012;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
Received: from [10.218.27.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cf90sm1795605b3a.16.2026.11.02.03.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:06:22 -0800 (PST)
Message-ID: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:36:16 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXxXaj97XVODrm
 3mrS48hsq6O/9hIQMzSdZ8IaaUNXrzNcCtlfJrR4DFmB6EElZvNV9DE39PG22qwb97I+lTInUsc
 2QjLqwg7Kq72C+1MD5k/GROybBEcnMcHJ4IDGT4Bjouao8nlaUQpQRs1IqWmS4rtnN1RVfnotSA
 JLk8DCac58ZvNolQ7ApAyf72NXtoCWr5g0OH3XLk9f/OBtGOXQ24sR6xVCBcbXo1VicX+HjfsdS
 3IgZXz/mxfk1jqJFJqQoOGPjisqrKmbWF7sydNKxpGEwXsit+K1EykmRbW7TBw+2W98K83xwjDQ
 Rar8MqerDMlyX4xaHY/XN0aSxQxvWhmchj7ptMzN2ICqu0/W/OGF7IkA8PWoUf/w9s9rScX66xx
 XrtDMctJZMT3r2yDBaC708T68pF8E16IQJEbn/YlZ/UY4JKLBEJoR815iJU2d+pH4mu1iz9j+2Z
 3+x07Gfvg4MLYBiRwVw==
X-Proofpoint-GUID: upg5cUS-iSVIMzVkKQlbedS8Py5ZkJGx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX8oCHbRdm1Bxp
 x54mRQyqtcRVPcVVVMDlRNnj1R3iS4tp1+x/1EnSG8jltZimFQ1+rrlgDynsUYAwkaGcaoxxUL8
 XSyiqohszl6iDpJHfjjzhk4kKzmZe0M=
X-Proofpoint-ORIG-GUID: upg5cUS-iSVIMzVkKQlbedS8Py5ZkJGx
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae86eb0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7-sR13JiO9-Nskhq_G0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043

Hi Konrad,

On 10/29/2026 2:38 PM, Anvesh Jain P wrote:
> 
> 
> On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>>> Add support for back cover, keyboard, and SoC thermal zones through
>>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>>
>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> index e27c697e3170..571c98124a40 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> @@ -594,10 +594,12 @@ &i2c9 {
>>>   
>>>   	status = "okay";
>>>   
>>> -	embedded-controller@76 {
>>> +	ec: embedded-controller@76 {
>> "ec" is a super short label, perhaps let's spell out
>> embedded_controller
>>
> 
> Thanks for you review, I will rename the label to embedded_controller.
>> [...]
>>
>>> +&thermal_zones {
>>> +	ec-back-cover {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 2>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> This is *really* hot!
>>
> 
> The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
> Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
> lower value if this is too high for the keyboard and back-cover sensors.

These sensors are intended to be controlled primarily from userspace by 
the thermal governor in thermald, through the powercap sysfs interface 
[1]. We do not plan to add cooling bindings for these thermal zones.

Based on discussions with the tuning team, we agreed on a hot-trip 
threshold of 90°C for these sensors.

[1] 
https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe

Thanks,
Manaf

>>> +				hysteresis = <5000>;
>>> +				type = "hot";
>>> +			};
>>> +		};
>>> +	};
>>> +
>>> +	ec-keyboard {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 1>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> Likewise
>>
>> Konrad
> 

