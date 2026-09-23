Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D4C457E5B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157880; cv=none; b=R4TqGsNA40GaQpr7mo235I4PqUh/sEva4n8bUoqp0z57cHS8MOoHI5okw7C4dXyOnJqAbCAfCCAkxA2F8u6UGylw9tENUvc1iIN7ihtRBHfaKjg8Ng8xt2t5nGguwnJlhCr5kXaNCpTTLXPZ2X9jahyncQm9fIu1JruzLCBLPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157880; c=relaxed/simple;
	bh=FcAC2kL5ib53ysCba7eguY2e0KmUYIG4Q4SdHWnMupc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dwe3Z/S822RUWVgFkCR342drbCC8VC+epX03bMDvpNxVlLadFRhIDJmbTJIaxbm71gecGxL/zwDeogZdoDsBy8HLeBue6mN1QZ6xXKBWdiMA9JTLR4MJ5DAU9r5IZKKZMvpv1D156GLanuy3lVwnft5439Px/sWWPlV427M2q8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSPNKGEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BP5uNvXM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSPNKGEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BP5uNvXM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA31BI4087761
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=; b=YSPNKGEiQizfoukY
	R2LU2Ai+RmE3DNItr0XCdVGKUL3jv6CXJKcn+1Qk6OY3BM/MXdTBBiRfJTWIEXUO
	xayVR1qrISBnzNlANEMqG164nCrAnLFL/ebbdnAbiTJuWOPE/UzWQDO4sucIlOZn
	/XN6QhQcvMwW0jZEP1+IS/SkYrOEZ4ZiA/WFSF/LuPwrjo3JKp4Lemto9kbFpd41
	Vm5CN8Njq0BhcbS8tW+GaVWQzeLxycQ5n7qtM7tfJCAU0rVDrffQ3HPoqsxth85X
	kxGRE40s9UHSwXMgu7q7ZqbI+v9cJpUEGjX36Q3PzMs35RC8aj0HGX54SJgONMzr
	eFNhmQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3spm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:04:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d522a20dso2229031cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790157876; x=1790762676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=BP5uNvXMYpEKSD3oNHgNlBBMcpP2ChCh5lVHh++f5cVeLWNTS8nY8mlKcEod7cbxfd
         qi4TownxJQjWIGNavfGg8a+mqJg1NMmhKVESP9EuhWZTwWu46EWcJBiDzju4PsPpntbH
         /GwyzsvTzFbkcAsdZNuqfOZJ/2uxxlMRO4rVFWm0pa0bTzvSPRkFlFQVf+rYsOXnx2Z4
         AVDveQmi8ttixAcv8O4cewXJd8UVuYWBQtppOQPvkkFPjFDI+VPMH1i3jK1/ov4zKrjP
         v5KLwZlfSIlEsrKFRqtBB51IOfXuDwTaQRXc0eG5/8k9mhOQEwL4ArFCUttCLCRcRa3B
         oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157876; x=1790762676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIcAJjWyVPWk87cq5e+oRvWxXeEjdLFGt91qD/yNc5w=;
        b=GIr+BntS/FWyS/TO+agivsMfKFDlOgTichcF+FA9oB7z2JFfkmF3WDyrGAXhZtwsyn
         pgah2c/7RXAG7ryMmzxPX8gcEe4ZBWJ8KAI1p2VnfahpMQWYPVVWo2j8Qp2FTVOaKGrM
         9VUx6qHHtBqN6IoKK829cxlztn8RIRWP5nA8x+e/JQHW4mcmD8DJCP6pTKcjB6olRZfX
         5RJ24OtXySm49OieLb0LlNV5c/1bqUs/h1yorhACzEwGIB3BFdGxoIRUi/d6aQtcSoJR
         OMOwdy0xToS98bjOkW8hsXdf1Gg/iJfZ78UIxdEg3Ntc5uEffWulvV4egeYLChlVk9+Y
         wxpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxckBjqjZhGNvtD7gDlt7LmYR6RgCBnegaco704xmLxkN3Xj0qpQhn8cXLgEAA6iCmbnQXFQhD9WqsWDuw=@vger.kernel.org
X-Gm-Message-State: AFuF++nwDb/MYOMOSPistjbRZnbxAGl+sByvqB1VKMIs4KLmVu4zlLsw
	UJrRufUxAdFVy0FEvnHlfJuY9REHltPbtcieyuKoup6d4Pg/GI5KNPxoxYWLx6bAOsQSlUQ9p6w
	fGNUHRa2SQrtQrKFQq2jiFaYcbrBKmHirdJpZDGCYgVrFxdeK9FtGInO9JY7+eHhA4+Q=
X-Gm-Gg: AYBFou1Aojp7BA7mrH7NdXr+1sBi1K0O1M//KHNY8CCQPd+n11kQ+ReZ4FpXIu2ZJvK
	ag46V76tnkYkd/CbsjPIhimUxJXaca3xeRiBjtDfWW/awqcIhBZZ5Uqt5fwggpstr66aAcEDNKU
	qBImpz/bYGT69ZbSqouMm15Q0l7muHcg6y4KvUCdo2W8Znr3mI+2u8Hp6fNPoag20SMpkLKcqhg
	8aQ3DFzdOr0NPG1qJKMWtS9Q6yHEhGVK5+iCv8r8k7PRCRD/e5Ir5x/08VIKFCzQsEDXGK9IKaE
	2dYZ7OEwtRVloXHsYBW0PMii4s64gdreqWpkl1wSbZ806uV1eTMD4IFnCKjQiuUstWSJ9/r66pQ
	NqpjE2QdrHu0LJuMHnEy81A==
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27443126d6.3.1790157876182;
        Wed, 23 Sep 2026 03:04:36 -0700 (PDT)
X-Received: by 2002:a05:6214:8624:b0:912:3334:f40e with SMTP id 6a1803df08f44-9140c50a449mr27442796d6.3.1790157875672;
        Wed, 23 Sep 2026 03:04:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33fd11sm84954966b.7.2026.09.23.03.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:04:34 -0700 (PDT)
Message-ID: <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:04:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add Embedded
 Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
 <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXxl0uqh3ONI4R
 UKgIbKIRMIKgLw8udLzjhECKV1GEMgwnyleSPpnRwUnFIE3kCebINcqXQ/m9mYKx9Pisak2z+9f
 3zfflA/QY9OBzA90t5+yip2aeIKa/8Tqmksb3P3tqTYJuAGJoyJ1yPmDXvUkTPJhI721tKN0QoJ
 Nu5gKwxYY4eHpXhwlz5ormaCIajJ8Lw8xZ+xHmHjCtdbJrCX4ttD52cDYy6IMX7U2XlKl8ySTUZ
 m04Ig2VErB/6zIYIpjjzPs2ARExL626hHeXgD4bsBtIChes3q8ClaZMBA+oTFuQBFusiHWeLUFG
 r7qoPpUi4lMtWtd0T+iEEypzuie1he+ECy55KP/TH8wFtj0axviR9PQJJ8j55ZXGImuGCFvUq+3
 pSjMmIAvdXuem1ojGL21xdn+v4CLGWAUqo57dZOH96iKhAxPImdzIoClkfStZWqYEHEh7Rcf1RC
 OUxjTBdo4kHywoLZRhw==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3a435 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SILNe5Qj54eFSe9Pf8QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dh5qzAJysaiZkg8GWo7UtnX5fpVZcR0c
X-Proofpoint-GUID: dh5qzAJysaiZkg8GWo7UtnX5fpVZcR0c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX8/xMXIqLzHCf
 CJLUbDHpN75+x17h3PauNShM3PTy0W9gmnBIy+NU6rh1lQqG6HrFjPbW3mjV4xELt/9zTRfslzo
 5UHC6SYNo+oBpjm3i4fu/cvDcbFgovU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/22/26 10:31 PM, Abel Vesa wrote:
> On 26-09-22 11:33:38, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Glymur-based Zenbook A16 features an Embedded Controller running
>> custom ASUS firmware (which is loosely based on the reference Qualcomm
>> Hamoa EC one with a lot of modifications). It provides keyboard
>> backlight control, additional temperature sensor readouts, fan speed
>> monitoring and a number of miscellaneous functions.
>>
>> Describe it.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> index 40433dc2d6cf..d3356fcd25f0 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
>> @@ -670,8 +670,19 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	/* EC subdevice @ 0x5b */
> 
> So what is on this address then ?

The driver spawns a secondary i2c device there to service some
of the EC communication

Konrad
