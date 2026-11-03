Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699147;
	b=MxL5Xx03BCrXEy7XYvBP5VLhsGGOSB/VmeXnyrBawf2pa8UkktfwP0xYifEyaAmkoh+t
	 gJgfKkd+x5/alTDR8+4oVbjMJF0D1XTRwsn97paelv7YYvKS2STtSAyNUyFMA6ut7yvJw
	 tHumRhK1c95AmktWc7LDxvnNsVsm6Ga67wpWVYIKnoeS2YPboGkwTEAGFpytonYXgJmm1
	 Wa26UqfVgvsDRSqaCkd/UHG+LkNPVxeaWmaMbjJB6046FujYShpBER0zWoIrGfPvYr237
	 fwT3zGhbfLD06ohJTIxc+FJiO5Fd0ib/88dWCkQ0rOzXYB1mcmgl77v7uHIzWaj/ZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
	b=VIu1y2W4nhIpSHZ1uHO3lbMXCQIYptYVotwr8mgsV3v/rXMHG2te08l0bd0pk59WpC60
	 zcLW2J0lm5Pewu14I8oAq2wMIlHHwzALFQSGBAsmh3R5JgZ8Rbk4U9RDyIMo4+XiGrhf3
	 n8K34yKi9NAAy62/7UtPYp+JEvVamlhXvWp8K0V3/W3IVv5d8itjMArO2fKaIvc2tDTUq
	 0T1FP19Jm0MMjrNqfpp6MZuDxwrDiRrHXVqXyye0zaTIvtF/5UGRP2noKWn4TscpMfOgv
	 nqkIrJjGSJiWzE/sXWEHteQM857KgC/g25pLD8GU2gAo9HYS97jIqfM4mI2GBz3jYUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fom/uN9J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5C606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B5C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fom/uN9J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38G3Ci1434174
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=; b=Fom/uN9JKIhHz1B0
	mZDkLS6DR6brE5JpHk4qmTzxX4+ts65C7+kAr8BmO1VKNVXxxMWko2pyxly1QL/y
	yA6/ZPYOLqUE1642Syd+Wed00Pti/DAwoQ1fQ6snCDfHq8zjUi/VLf6dsDvJNKoI
	chWhvzsjRoD7PEDStUM/TCvpxocx7/uShEpNOB1/Mc+CL6pkzQVIQ4qeqTX6TaQA
	nSOeOvohEfjJXfWPFzMILkCfATfCgSmipQS3q9AhJVxGYJ2oDO44mVSnzS2nHhEF
	RXEs6rkCw8vF3L9PThXHBqOnpzDg2ewiZgiStyHoyNh0faUw3jJ2WjXrKQLojs/o
	tE0a4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjgfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:45:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9821ca96fso63044295ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699144; x=1794303944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=IzKArjKrXiSJUGeHRy1S63+WyyjzqNrLX+8THr+ned7T1hGmHOB7+bWqSGinK7YKGc
         XpBPvrZgFeRTvcK3w5ZZlzsJHI2Yya2R2iZgWQyr1pY6HyEb806LLQ9Xgen28eK3598c
         7TxFRa9HioCxC+BDBgzhO2spqnxABZL+IeZKlP2CNvIUc9Ar7gwW1gqSMNPMLp5JtpCN
         QHvUk/UJXC9MX4Uw7OF2bV0ByYG6J4yi8PJlrUShc5GdwC3cFSNGkz0rsESmrFR+c/Ok
         cYt8kCUyI5DvWlkkJHL2t2Ja5fqwV905jLdO4lst62SBFJLB0pEa6aAeHwR60ZFd109w
         W7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699144; x=1794303944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=Hc03JvRnEEaExTjnBXlmJ7gdSy1qXNFgjJ1FBVLeYcyk/iW6HBElBEYCn3xFMu0/8c
         qVx3LGAso9wyoSe4JEbH53o3FeHqJVLdrpeauUlISj0RelxcJFnti2Vh4n4h4RBF6BPN
         +crOG6TlAk4FAdCIsbroItlMlWyEQV8kD/Af1nV+gwK2jUH/6M01etkbOsIOw+g6uu1U
         bYkkWiDH9GD8m464HhkCmkxs0eOiMFhegpJveb8TjlT40vIxyk7kqPrUM6gJvp5QHU+i
         zv9/7O83Sk/51n4CyYvq2gi9Rq4WKREWlAZL4jSiceJp8xkGpKfrLIRHYCT0gDOKMo5B
         BgQw==
X-Forwarded-Encrypted: i=1; AKwUvBypEatBldQ72aPVqXC6BSxNoEGCvu7Fni2SOm4IJIBmKHIgOdZDMqTb/Y5YrnzW43c0UiWbGoMTLf8SBZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nWx7oRn98LuTdVybEdUl+DtTuNreSkArNREMHJT9PuZimHSN0
	1DRNccFDilm80AHQYuB6kbiAriL6k724LTbuVWlLCXxAUYIGjLC/CzYB7mRWhwZ/Lcu16lQiMjM
	wG40UHs/zXSV11TLkW5u1HD8o2+suhzqZ2J1Vav/IVVXWCfXAsXsSTJ1ZbJqe1+Kf5g8=
X-Gm-Gg: AYBFou2eMFazi3U0K7zk1S0KrvfJea4RRHIuMxaeU5/QZVt78bVrIxrXKNyCbepnUfB
	Cl6aunszKHU4EmkiQnmBUBSijN8rlMW/fZmYa/+gqhsA6NmQ6SSAG+2Snw/B7E2FmAnpjMj491N
	ee/HJEHwDn4z5bo+F48DEEWmNhOPa/frKf3gDEgcLDT4NSm1kxrpu9+yDM376sukzYe4E1IpcUp
	nkIFSXTtEiJGdrkgs/HLPaHO+qkSUn40cUOQ+2yHxp/G8vXxmrn2spD2Ys3kwg55+qXw9mpPXM5
	s0m8JUR3Ffg/GyzRwNwSFE2LizimaMbQRjJL4XSgBMfU6WpSmhBhq9U0HRp9ngPca+tygUFtOYD
	PDQjShZ1bl93+jd1d9aUljUk1688+q4WnDsWaa58XnNe6q5rQrr9r1CMHHlmtQLTDELBqXHCWbt
	A=
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119895925ad.58.1793699143763;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119895795ad.58.1793699143296;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
Received: from [10.218.22.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927e856sm37288925ad.50.2026.11.03.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:45:42 -0800 (PST)
Message-ID: <20e8628b-4664-4b61-bf4c-bd25d7cd6775@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:15:35 +0530
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
 <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Language: en-US
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9ad48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8PPq-ilK-3aRn1NlK84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXxyJ71MzqducN
 SieSBaud8Dh9LFmO1TX2zbxVe/MlioHHpkICO8xJ5488gf6yXqlsy3USSwOB+pLjpgF6IvVhLy6
 /8q/IHNxMtLuGJzBXRmQshF/PD8onsZ9FT8we1dZwl+zUHmvcvPkYPShUHgFSFKg/KHYERBsFa2
 cS02rBg97u9iqoOKarHkxfwnf6mgKR8ThTaEm1FqepM6NuHNlEsfU2eOx4BunC+D7XQ2pqc8j2R
 2urPJLuua0D+p7S38vT3sDuH9G2mMMkFGyCxefEae+RV856cQSZNi1mEQ5Ehy9h+nHYuFR1lVoK
 b8/f0vHQTzw+ZDJlyDQEmyJ16yFnXS63x8K6QpUBc8hujNaxeSIXub/Kt1qk6OQolPR4f1mmuAD
 ec3hL/fTo+jvqO/NyD/raraSg1lvVz4jQ+I5WyOAU/Bd3S7A10A8ZSy1vwsBcrQYqaTuLwQKq/U
 j2arhtoqwwZQ6b3aEcw==
X-Proofpoint-GUID: Er_t67fOaHeHAzmcVc2XN6bOlF9gVAz6
X-Proofpoint-ORIG-GUID: Er_t67fOaHeHAzmcVc2XN6bOlF9gVAz6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX+HibswIAlbb3
 /8zPAYsrYx1O54X5DHF6HrG8VAi+BbGUztgdBy4WKfTloBBw3hNN4fL/L0MGOWeYEIuOy+1PrMi
 UKs62D/x8+CmoPqTi+LvlChV9LMKXDs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038



On 10/20/2026 5:29 PM, Konrad Dybcio wrote:
> On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in shikra.
>>
>> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
>> reach 115°C using the QMI TMD cooling device framework.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -				nsp-critical {
>> +				nsp_alert1: nsp-alert1 {
>>   					temperature = <115000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
> 
> No "hot" points? And no throttling at all until 115?

For this target, no throttling is required until 115.

> 
>> +
>> +				nsp-critical {
>> +					temperature = <118000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&nsp_alert1>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> 
> Please align the arguments so that we have:
> 
> <&foo bar
>   FOO BAR>
> 
> instead of
> 
> <&foo bar
> FOO BAR>

Sure, I'll update the alignment as suggested in the next revision.

> 
> 
> Konrad

Thanks & Regards
Dipa Mantre

