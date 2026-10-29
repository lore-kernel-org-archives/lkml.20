Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264935;
	b=eLrQ7HwDox1Y7IVYw2tU6eAy9wve4P3rZvHGGWGzV6kX8huHttSyL1PHLU0XSwqxayWK
	 ixjHX+a6BV9f5ze8uwv+iyLXZbO/hYVATJ47YGU8foofAiWKZoJ1irA/hdj97rCmErg5G
	 bT61O0JYFARTMyadaBu8yY0oYULyvH6Me2ewnuRFlZ/lFLq1rp/56b467IDsyrxYdKz/O
	 Ge3xocKxN7oUaU4/OIq/pcB9w0btw3NhJCngFsFG+1/Xe3Pphn/CsDuACb6YWGHawVUib
	 O8vOlO3lwW73mCzE1lx1OdNzy5xpA5jXc3O5VMDQJ3uz5QcQuveKSOKX3JLrq0tf2cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264935;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
	b=gu92tMRbqr2rXeZNIE0t3pYb5qCkdc8/7NxnI7K4gVbrqlusaxUqXkpzlHcRp2TPA3+Y
	 PPJB3Zf34+mwKQJGTjx0FdkTmIFjmxUkIN529WYeu/EAMLq4QOv84rkka9K3r44uxRwij
	 SHfchAG4MQ7KiSEUCNmhTogu6MSt4rP6L7Wh4rCt8oXUt75aUxSdj4/mHH4gpU0V7Gv8M
	 PfdtUpRwvCBDoT6na3xKBXLXGQEJ6qy/tm4qU8hgB7bcHEYsrQ5WDEFS7Hgc2w2HwcvOE
	 GdO/dTFU1Zk0I9vQuRCUcuygNkFqomOh96dW9CEbQRUDOtwQt4QKzsmmXbu1dH38ssQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D711606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D711606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfLpqT4E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJcgHsMf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vQMC3457723
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=; b=JfLpqT4E2z86BnrD
	rpjh/O+SJAZqd2RuxnUSnwHWbjQpSzdsEuO4rPVslqU81GRZPwV9M67X2uP39che
	+8IUmRGwImPFC8500NMG4G+ETcSn8jeyvI+ik1W3QQF/4114r5wdglAahfyz8C0M
	6T4KMrfAjpvdgfT3FqGQA8hIvfW3SepexSfKwevJLbI/hZffAEq0fhmIjQgm/pte
	Y3Vg5idvHPghSVexB5SJsUkfvxUCeY2o1+sBe6sU/FzCo0ZFxazdzCWkG/gLGTNh
	HWbKyMuTkhJ3DUZl9RU71C5MLG7qa+5ndmdGBhCQ1SUVFg2TuKKl7yhJHeZ5Q5Y/
	HMPe1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpb357-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:08:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1174756a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264932; x=1793869732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=CJcgHsMf5EX6+gI2yDqQ861uOiP6ReCSiXGlMgLjNq+thhc9dM9PdWlwPvLWTh5SRN
         HJPE7pUOibNEYXiybfcauozltWvvZqdhWnJLzMGKRltCSU6o0fpBVcFa+bCybTjePyvR
         CNc1GQCw3gzMGaau/w7yBv398MuDrgrzgbW51bWm5UR5SbBk6sAoPlEtAZtkIRNEf9cn
         vOozfeGJKTrMRKKMp5gTUlfuZrbBujdAZ1dj02GJOzlRaHnJWT/1mnhjBQg46abLrA/Y
         aBKhKGaEI681+3hSWQuIKvifKMws0+flrcp8VBNgW8GN2c/mWQiOlm5Zog8XhhqrTnDZ
         lWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264932; x=1793869732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOlAawHBxXeFHxrS7siTvjiMPfoJDvNSyTz5C4Jyf4c=;
        b=nnxze7D6Xa5u0TriqraXEgXIjssCb0i9cJUe68Yzt8kunmJG1bCtzsOGwDJLC1XqRS
         cIMoK537XGQhBqodvyxmB/PUOj3BBYbIdZqvod1ia6xpbxjS58U2PNrG9GSmhK1IXIZZ
         yX4PrtgVrTp/A7RyLfhtHO00DUEea0hAsaVW6hdAc/JyeUBX+gaFna0WRftgNMsCu5Na
         Hr8BWNWVUnunvjZ1V/VbdfZSWHQ+35i1FDxAt1VtEjqnkDIxarkbHCU6PIQ5QeigJiAR
         nH6+EBJOcHBog23UBqkulFsFuP8UynwwKGiIRSujT33qDZg3S76GamjAnnOMDMWXTUzE
         vxQg==
X-Forwarded-Encrypted: i=1; AKwUvBxsqCFPU2bQhUFcWyaxUKP7F69/QLDWENi/ESCmONtSAecCTCZk0CuSHZnMAqR0nGfObd3I9TpFzuE1ID8=@vger.kernel.org
X-Gm-Message-State: AFq9FYItzPPWcYdalFP17u8VE1uwm0qP3MId7XxKrCgElVJTdEmFkc5X
	DPb2tHDJaVNQBm7u5eXWN9uD4Ig8D4HREDGvL/mo7r5bVTnwwOkd3VbpUpRn7crvkBF00rVPvA4
	NCI2hhkQ9Tcv0SQc5h83sRvsdj0s33vI4e56OS62wvw/lTyoZTVFUrrSIb0WNwlibii0=
X-Gm-Gg: AYBFou1p8J5aZerJJnwqDVq6S/fzVsOcNkFM/edg7XjCeivM99tte7YFHKle77/w8rQ
	xgG7qKZxVurm2cS98UISU2hH/KmHRCU40hCDFq7EZc8+QFsu88r5cgzyEMLmKyXcqGEAg1F1RuD
	amhhqGYBaVwqrnuT9ydKzYxlqgh0K6s66my51GKTDFHDDrmCd4Q/hF0YYHvs0C8yQTiGft3/EBX
	1j+693I7kZwFkeWt5WGLTWccoGKrnZrQJAk/FrByd0ARILe8mKBoykqoFQX7iDUDOZl9WxaHKbQ
	ZL6QzS5ffshpY1x6frmwA3Z2LwfbmzJjr68NuhllMSijUdEu6lKTQIBbI5MHPqgUY4hAMjz+DD7
	rw8oZxt/Le6uyME3tpN6kgbRWeV7GHUungQv/AK0IJETv5LEFFuhAlsgggKlf36PP0CT2vTJl4L
	0awP0GEKcGS0C2qpZvYoM5f9XvaNmcHHIAiDSPjVbpGYgasTq0K06zsaXxnIqU
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036775637.38.1793264932286;
        Thu, 29 Oct 2026 02:08:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:3405:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3e90235b9b0mr4036765637.38.1793264931832;
        Thu, 29 Oct 2026 02:08:51 -0700 (PDT)
Received: from [10.79.116.57] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662e3a4sm2039697b3a.28.2026.10.29.02.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:08:50 -0700 (PDT)
Message-ID: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:38:44 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae30d25 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HxamSshyuiQp_YgWtbEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: SbMqucJEfB6HOJ-2EEY5xV_ehkOlgT8d
X-Proofpoint-GUID: SbMqucJEfB6HOJ-2EEY5xV_ehkOlgT8d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX8Om98UUtJHPp
 kP9Fr2MajioeVGezONnEdia8vBW0qM+AgyWcnraC20J0wwRtDSIoTLKCy021dAiTfGNrIELMbbD
 TrhrQFuuAGrHE2XRUmHJtYmAgD84TqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfXwmpID3CZMcKj
 0o08ADA0NdVBkh/fWAb2qtPCC1Y+ichiQk+BsPy6ClfgON+SMNcc9gE+/F6F93q2C6/f49J+p6D
 OhtcQ0Y0smGsnhCM4ntJ0zMZ7Ey9hvVyT/UYn956Bgb0hF/lOsI1i6qVm5Ykp2T7/22tuoyNfBR
 dbxpqg3eD3JdzXJ7ROqPuyODa5wMukhE9dq2NBLq4YnURLQ8V3q52jLnCoedv/4HzweO+bddd0L
 P9Iqocn/JfjV9MqXmccolxoNyXYMX56aguB2SRtgNowMPOGXEbLuTBZ7cPfES+aJEt//tZMilPs
 dtPjcvYlCi8syvaCWrASYFdCRcN7/6b+XRsh6zQr9DuMnH9jr8Ee3cvgW7dSja0NQVs2doDGZK1
 PyLqsSuEtgEq47eVK/OeT6FNmHTWvskl2h7qcobXGbhhcKASUr+oVvgo9CzVpCfpwWS5SI9NYvl
 hqVYpwBSMZLH3WEGxNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290035



On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>> Add support for back cover, keyboard, and SoC thermal zones through
>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index e27c697e3170..571c98124a40 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -594,10 +594,12 @@ &i2c9 {
>>  
>>  	status = "okay";
>>  
>> -	embedded-controller@76 {
>> +	ec: embedded-controller@76 {
> "ec" is a super short label, perhaps let's spell out
> embedded_controller
>

Thanks for you review, I will rename the label to embedded_controller.
> [...]
> 
>> +&thermal_zones {
>> +	ec-back-cover {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 2>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> This is *really* hot!
>

The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
lower value if this is too high for the keyboard and back-cover sensors.
>> +				hysteresis = <5000>;
>> +				type = "hot";
>> +			};
>> +		};
>> +	};
>> +
>> +	ec-keyboard {
>> +		polling-delay = <10000>;
>> +		thermal-sensors = <&ec 1>;
>> +
>> +		trips {
>> +			trip-point0 {
>> +				temperature = <90000>;
> Likewise
> 
> Konrad

-- 
Best Regards,
Anvesh

