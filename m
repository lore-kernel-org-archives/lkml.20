Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3EA4734FB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388938; cv=none; b=a2eCNDtoFZf4okdNlB6t3nF6GSldsZImuYODd/rpJzLSVxkzYi43TI5/4OzSFDivWA1xlROK28C/zMhm7DCF9RFAbNcvZUPRf0v7s5HeAK7g//Mxvvyvcc+dEvOqjr7SooJW7rT7eLIwC6nr97w+D9unD7alzUDW1r7BZluozr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388938; c=relaxed/simple;
	bh=PNm5ThoBhQTfuRajdPniX5QsIR0yF2ykSwtXSu/co8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBS/sLtVXUXdCIdJvMlotViz0AgSnztzPgoKTOv/SffwT5TIj3v/BjwIogWMGRdWjwi/8+2yr5hME9ayJdvt98jOTcONl5xiI5Pc6cZlVIqbLKHyHdH8rKr50rQa/FxhBvlKmPxCv4tlXS8P9Ir5qq3EwG4yO+p8ob697XxVRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNb9mEf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MSGVOrU8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNb9mEf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MSGVOrU8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8wv530985
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=; b=dNb9mEf3FNT1FZnJ
	+sVnJIgxvoWbjGGQX0oStfXksLgwdvzXZt6Qok5USqDmNrvEZMCi0aJNLHQZQTYZ
	Xvn5iDsBlu3Xb37+Fl4KVvGdUi7E7Wx61xn5xEXs1x4eieVodpq8F56F60xq5zPU
	hBh+YR7S8CRYbjwlCA2aj16eV3/LIl2QeHOY1vk1ywCmzH6yHPUd7BV9ju+Dtsjy
	dDzQjdPodmyrWzKQ9+0QnmU65ph57ovYS6p8Rl0VVecg9MExLk4K4ch/pwmsliTV
	1qjGt4Eg6JNXKItSM9OzmsE2EeBZlPA4Y+jmVKE1bP9PACVyKEb0xILd6T4edfxX
	XU/qBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstdff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so89099285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388936; x=1789993736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=MSGVOrU8TLn+PfD0i4m76qlZTaxSHWNxWtUZ01jTc2VBePM808GWtoIAmo5r+MWcUP
         Osn6hfJq9bPSr2d66Ww7Yd3Lw8GUA6C+4XvIs/cAs2y8/464WtokrDdfRuWaIUlub+u2
         MJ9okSD4Wo1ZxTYTACYNZxmRoXi8JSR61/51B6+rmiRBPVPJVfUXYYKKkvybW5CKnXGq
         rn9tSZ4dDU/+JI/RBivSgYpuGS6PBZyUF8rxiNdazxYxwNI36M3vYwEoeKCpFmZaurkr
         W6BvwDl652boRy2BcJdA7/G0VjecJXMglo84wj9JnsAnyleJaRggwZxe9ulHz1ZKseQX
         Jv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388936; x=1789993736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ok88jN6tA+bS0wPG8NA+wgvWUCzgWt64lfwgR84wwPM=;
        b=SwUiRGCtX+q1E7PBiaE2C2XS2YAKRaUIFbt0mYRMoZW6ue/M1/gOEOJQa+cDblJphx
         5L86I1dqa8jGvCYbrOhRTEMNRmideuJM6QSvr4ubny08G0QXCQvzlOTvEUgOeg//TgCg
         DJKyBhb5IXXr9Q9kcUkGqB84tT0KUbWN3wLQG9hNsAB142aaaQuB5k+Z4RejyeZT88C7
         VfQwZrHHRVjV/bgIraukzpfeZttJOCinyM6iQh5kXiWyocHEDSrcqtdfNtt8kVvvk8l/
         Bi9AYcH6KOPey+CAjy43WOfQtqUzMMCj4J6NNYy2XRchw+sgK29BB9JdJeUhXlNYdNrm
         MuwA==
X-Forwarded-Encrypted: i=1; AKwUvBzPd05vIWGKF2KLgmURmNDmbRaui3yhLWR4f2SJIutgwW25oWt9H8XnO9EVc0KyhRMjWEc2T75wyO2uHUw=@vger.kernel.org
X-Gm-Message-State: AFuF++l8lEoyK4blhc37r2qIuhlInPhtTVUr45FcQ27vQAdfMh2mQJJ+
	0KiKVLQIoyOcMDNRXFvnjfIJy04pvbPVeFKSur6gL5lClMc6KUsHao5d1Pgha/PbO3mzLNYp80v
	e7LEtsOI6XDfKyMTuTTHYu8cZvoZwMkeombg4pPFTZ8xNtyP9Ux2/3uZujZvXF0eDGm0=
X-Gm-Gg: AYBFou3vXNJINGMrjwvoE7XBfy6GxQPrV3DWsVY1j9TNi6UbbXXghdmzWioEXV+AIWb
	SzydXio/aG9jiOSNbn3pVT6xuEzU4nVBs86MpMrL1r7rhHxdDwj+iQpMl1Z1RV1NrO2ZOPAbFVf
	iYkbalS3Mdr0QNWjgD99W3enkXdmNH+uTRtcDl3UmvGksyrTZOVnXXp8qs/UsPxvhthlfsTGX1U
	JKR2nWZcssOm+wiRhMG4Ta1ytPK2+NKqXI/pndy4H6mBLY2uH/neN4zWVxy9A6eTXoatxvsWWAo
	bII+ZiayKid6VfDz7ioskz/wZsCUNlbnny5bwCme3oz5ldD5YppPMDDx85B6eDbKtXZG91rpk+3
	unsRKjbKR3+Mf2rFiZrqzuQ==
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr225505285a.5.1789388935492;
        Mon, 14 Sep 2026 05:28:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr225500485a.5.1789388934693;
        Mon, 14 Sep 2026 05:28:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296605b438sm419224766b.26.2026.09.14.05.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:53 -0700 (PDT)
Message-ID: <09fe8d04-002f-4b9c-93f2-a933be8e875c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/31] arm64: dts: qcom: sc7280: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXyYzvwwZHN3h2
 rCOJ0+2ox9oo03LV3tsPydJ/LVHVp+FsibCkj4wv6Q+92hqxf0+D6Ut2p5pmLmijOkbu+YbCyMU
 dZeehNHyEjxgAmcXxxTXUurPcAfeMn3uE8ltss7oxUTWV/Yjj+QsGsw2JjuaUfIwa/j6JY/cWmH
 OEKpSHI3Nt1egEsYbpfVTgkkrvzHXEXxUrYeND0AJlY9ylXiV5KQSwmTixL09o5GgFA8qsLpZa1
 rPrddnda0We6uEz0al+KLQisBqzg1KQDbCUnHJ2JBTnAYX3C9zM/ac9oebdR60ZoOZc7b20q/dz
 menUhWz5T9+g5PBhy7pbP2FMOlSnxRs2czohQOtATHa3jpSpYYbgyWVdH4KiLeS2qpa+XkYNM8K
 nW+bjy9GBD8fOqwHOr430pOtZ/Uvvi+q9144Z29SGNo+LLWwNxgrMNRWc0AGHsVTPQUyWPLWVb0
 N12D/4WYILwURoZXQEA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e888 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZMCpwbGJsb11sXRiomIzDV_2PyCN5t5o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXyLI8GDGRbpwx
 bTPHmZM3TCoPBRTwmjjJiM25v3C+FgHBmeGThUa4aF1iUzAd/XFE2KIvK80K7ns6v/2xwvdsYZn
 6Zw0YMLf4IQP5cvPnOJD0y7t8a68myE=
X-Proofpoint-ORIG-GUID: ZMCpwbGJsb11sXRiomIzDV_2PyCN5t5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
