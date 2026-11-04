Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796028;
	b=k75LwOAh3ClByC3/YO9AeThod4CVqx8o3Nmi8zvMi+bsY2Ay8Ap7yEEExT94vqe+qMw6
	 VJ/e89IRYQeQKSv/P2c4ReTYaMgx27efP4t2fNBPZzFAlOC6rcr4roPNKO89iG5b5L2pp
	 Ygfz1MUo270iLrerc4lnpZ2GLmv8AtTREmmph7zyuU4Hb4d7U2psUg2lPBGxf1KwAh1o5
	 W1gsDw0AHIzgE/pB3gxierBln5RNDggYhF2xlu/eSQWx7MxVVCiz0vCnhyCce+1HhHnRe
	 gYr7kUnymw+fONeEou6BbettpiLcq7zxhYhRTu/x8OiSuKuvxVeZtTt8SND0VyQzkjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
	b=ZRtirKKyRy70BZMVda/JVSCECNaYcPjTMCO156KG0CmvxDwe6m/ZSQCw64CDM+W7hPJh
	 nXIZcTOdQsKenVXnz/L+1aYEFRruR71TAvNgFqBQ8j2LZWH/GMezPRIzgDCT8Ca83h83+
	 1STxzVNBeiGX7DCWWKylt0YmVNlFNbFN2JbDvYn2w9MHpVosvtOYWDFLhRlVyNa0LvAOw
	 u17843KMIoIN19+5BeL7mjkcMKAX5ofiBQUvt8MisrpopmP6bNP8NFyfJTfTb7QJ05Q3G
	 a4D2qnmB53RfNWvFCxw0UtKylYwvYymhYCF2LvHkyQ7u5kG1EBcO2p57LolUrcsXCvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwNMbCnV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqCcLWzP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7E0606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7E0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwNMbCnV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqCcLWzP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba02k1149880
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=; b=iwNMbCnVEl0qopmM
	z26LlSp/6onxPzfFrIGHpglgjNeNDGufF9VXPf93ENI+VyvjD9pF29uTSDT1XaiO
	lz2rCK2D8eIjdEZ8do4oxZyV/YxdxJKcPGsfAXU9cUsmkxKQVPatRYat/4steeZd
	FCPo0mFOC2nvDHg+nD9FvIoN6VdK+7qgaVIRWu60CH62c38fg9CLLhR5jexEGg2k
	SenFpC1jxWAd4oCysGV+rNVRxv/qKg0CTHLLIpIV76buG4Lu2OJaUpBHcpigcrA9
	Zf83vafsU4zKsKCUnyITXUGrWlCBXYXL2nwoK9mN9UQP1kgzn361F4zIYNY6FKFv
	AhMwKw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y3s80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:40:27 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-843c6807307so736866a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796026; x=1794400826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
        b=HqCcLWzPcOh3EzSlHDcXplinyJKG0GBnwxFKSXylRXXdtpQgDCaUudXgGAZCa5p+jV
         AfvJchX7XlgXyYmccpvT960jDMvmPnaf5oLm7M5X1v5Jwc9mvIUBnJ1Y6/acKcMQBPix
         JOfnMVeNXMggSKTSgzmC7HSPW+kfdEh2T91yThzsqY7f1j/uz7VYkK+qVzbO2bdr1Yxs
         HQncNpi4OYEqP8S6Mu7gANXGmtBSiLBaIXALBtm6UiBi2coYQpudD5QHw8NoSk7lhoCm
         GVwiiDvE9C9FvxrLftvnm82wOymt2G7k3vjYbLqGOfUhtLKFA3Yr83LJNEIwdzfJKvgy
         xgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796026; x=1794400826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JK3zLqAxgD4t3oDKY8+G+aUNHzEUIyP3YZKLoNRsEg=;
        b=ok13oLxTP1BrZmKqiDrvyY9s8+9YJLtEjuxzg83FHauDxZB54dRpgTcJRqeeoTtJX7
         aLC5GxbbD1PLGmOxBWhcVG6qUXF2MKHrSooBEGcy7oZ5J5j7pxLXTRTR8ViFClgvGTRE
         zsmm9VZQgjpFXK5sXycvEn9H6MEumeV/dtdN0r+BVOzzuHN7+NZK0G5l192oP41yXOVM
         WyAdKFIWFmttTLIyi7Ax2H4IQUv6e4jSmpf3nXl5FzAkF2Z5+pOe/PzVAiVIqxY2I4NA
         SoKwU2+NP5GlliqYpCVw3PUtE7KtX17DLl+06Vvd/rZqd99aFVdS2ib+NwGwsKBeso7m
         v6Wg==
X-Forwarded-Encrypted: i=1; AKwUvBwXc+ouRu4TZ6spkgQbqXrc9yczcu4x4+AbA8UUjR8ymgnEPvSh3K+YmSsYcNa/LzAUHw2L3/9OiFo/HnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/U5G1g4ZOOOE0QHTYBufU3sRbo/0uRaYugCd81/YdmZBRATewE
	0uHAKlI0wMnlL2hbtxOqvgZJKQzhhnRXRS/ZOrujYOOzSNzi3yflJ3Rw9f6ufG4o0LVDnX9qecA
	4oiiXj02Ufa2BnLtVAKGl45Y7RTKtCQzcvz/WZTTE10aeabMxcCeLAjRqOKb0G3C5OO4=
X-Gm-Gg: AYBFou1SBmnCwjhLXVHo/PBVw+B9A1j4LLjMWce/uNmYCnrymLQIWJOBeAvDycqRV3m
	j+uE/J3ls1vxmiXmM/Ti8wfUnVXmyihh/n15ZK7/VqT/m+tGKw3lyPOqrGSYp9qct3QX5q8Ikp9
	rPY5pkF3AFr+Dj6b+iT/PYvQ6OwNEqZ/ofG41msS/lTZi9IEongxHanjXVTfERSgFDPXB87LnXv
	3dTlzQvpMsnac+wr9L7jM5Mw9+7kC6YNWfFBb2bFroTcPHawwOCsHKU6/Kt3rjRvjSgWjoQubrr
	2RYM6IXUQuX9DOu5PibqqURw8d2+OQvsnDj7GoeX6SwuUvTWSL+WXH2NlF+AT3VhnamtuoaQCbz
	/AZy35NnK+MN2pHVV4WKoeAH9Lvg697Qb7RL3aUg4fbpHNxgp6/k6R8hDwN1pF+mhHRGzWFuMeF
	FLinmGLQ==
X-Received: by 2002:a05:6820:55c9:10b0:708:ec28:6fd1 with SMTP id 006d021491bc7-714f256cde8mr6042779eaf.66.1793796026373;
        Wed, 04 Nov 2026 04:40:26 -0800 (PST)
X-Received: by 2002:a05:6820:55c9:10b0:708:ec28:6fd1 with SMTP id 006d021491bc7-714f256cde8mr6042773eaf.66.1793796025883;
        Wed, 04 Nov 2026 04:40:25 -0800 (PST)
Received: from [10.92.198.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12d1f36sm1517007eaf.8.2026.11.04.04.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:40:24 -0800 (PST)
Message-ID: <3463f5b6-e498-4d06-89e7-8b0fb873f3da@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:10:15 +0530
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
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
 <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <43a57f69-caa2-4943-90a5-729e0f378b21@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pCI6kpae6a4v1FVXmC5RU8RL6ipbds_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX1nhMR+L5Mbsi
 4rcpvNmx7Ii1xJ/8pqChmSL6pIVybmx/GUkrnOI2Xr9TiM6LtSaPw9VieOBt68tZB7dN2txGhv0
 Qnm8THxYj6lr0fZvvt0JOHLncwaYZdpzOvQ28d0OZ66e6egUL7uk3jVouZYSyesxBBlFRDeJDMO
 QMbFa0c4NoL0wXp7YQ4Z0teseK9TRpx4M3LfEEd5HUfvu1nqSeWb06f08ks39rHTycm4Ww+PTMk
 oT1h366pR+i/hxqLH7yApr84iwWr+bwR9TCyGPjfCUEBvENhsgTY/1gxUMECtDYvC3gd8fo1OTu
 x/yXUwmh7Gr5K9UMRasB8zldsBrwdv0PMypq7MiohD6LdKtRmqt4xApt+C3VumaFRZh6XSnknLs
 JSGGbuM0hUf5KCrzNjMPBycGCedaGlI5d/fQxDfJBKD2mSDp/FR83FIA0+pqhC1Rln1cbS1ZB7w
 wIJ1I3gm5TggZSbw/IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXymy7Q6q1U2XH
 t6aNrwnhRveREJRCY8VCW0uge3kmtF64yYcNkZbRPYERW3P+ZaoNOlVwOwPaimUeXuPEQ8sBQZf
 lL3wGP1WYQD6hdZrx1GNDg5T8yttX9c=
X-Proofpoint-ORIG-GUID: pCI6kpae6a4v1FVXmC5RU8RL6ipbds_l
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeb27bb cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IhMxsDTVYy43m0kJnUIA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

Hi Konrad,

On 10/19/2026 8:21 PM, Konrad Dybcio wrote:
> On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Add Battery Current Limiting (BCL) hardware monitor node for
>> hamoa-pmic. The BCL monitors battery voltage and current, providing
>> hardware interrupts when configurable thresholds are violated.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
>>   
>>   		status = "disabled";
>>   
>> +		sensor@4700 {
> 
> Is it not there on the 4 other SMB2360s?

No. The BCL peripheral is enabled only on the first SMB2360. AFAIK, the 
other four are used only for USB functionality.

Thanks,
Manaf

> 
> Konrad
> 
>> +			compatible = "qcom,smb2360-bcl";
>> +			reg = <0x4700>;
>> +			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
>> +				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "max-min",
>> +					  "critical",
>> +					  "emergency";
>> +		};
>> +
>>   		smb2360_0_eusb2_repeater: phy@fd00 {
>>   			compatible = "qcom,smb2360-eusb2-repeater";
>>   			reg = <0xfd00>;
>>

