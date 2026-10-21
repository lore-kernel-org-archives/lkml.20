Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582941;
	b=4FyAjr9o0Kh1DsOet2zQwbjThPsqaWYonFaikPOSS7SEl8Rf6lEL9RKctf1Z5HhUxPqg
	 yrb24n/EUqfeX1hYtiUNQ4AENJOsty23Mnpb4RLChnWWrCdEC2R+jj4BMw7AYby3J3HzU
	 GE3/cRc7XEqe/MXfFrvRnAvN2w6XfnnqHq2vYY3b9bWBDGcTwodTigryrzXEcgl6z76Xg
	 A6ZL4JKE9KvsuvkGC7ms3QJ8N+GAzuiLHfwx5RKjqSTjGUcmoC/W0ngXUUJgnR/hev2QZ
	 Q+fRn0VGsjCT5fU1KwN+ewN3BlbltnoJRDLKl8LLMCH9rQBmfyIdZNnPr4aQ1Y2Q+eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=;
	b=3wHBWHnlvsJvoMCPftJRKjgTw7Jmnc7E2K6bIyQl7TxBfTuMq3dfW02WwocBcPJZKsHn
	 a0kmpL900K74KXUS7M6Epx+MI6r3EfZqhiDYho7exrLNZ4CHQYf4LnwftQXuxK+xpdpBY
	 cqvhNXtP0jX0hXRvPvVUGGMPK+aFoJ2dMPTyMxROw0jQBgeaAefnhxHxfufXloKLakna2
	 Uk125NqUCRt/UUfpLcNopJrkFZKH1ywcJiBbASryteGfgKFSGR5+Akd4itPJCkLiZCoh+
	 GWN/o0nNjHzLdyrHJNrimeTw4fYjMJF0Jp2vxzEk84AzJMh+PJR5GXptlclbaZ4TB+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Por4fM2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITvGRnsx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E891E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E891E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Por4fM2Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ITvGRnsx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgB1S325180
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=; b=Por4fM2YJC0uCsoj
	Vn7DrYVVF2tuw9hdNy4BDPmQ4LlFsB09cAeIq7IUwA112MJrvYZbFKQco2rU0bVi
	kgh9aiUqxf49vPzIyP94DIe9+VlgZZdNFxGB0JeEZlLAIEYgxm2H1cSUfdLJn0hH
	W7xA/L8uh9f96jOcnlnw2pWu0vnyKHa+ocA9G7ZJS0bqncBQykkQAfD6gowONhoC
	YIbUEkyOSbgKKI2H/KxdduXOVN8HHmoMXQJCiJOtdZX4/E2Q/BjHaE9uTebymC/e
	6Ztm6/+LIBps6duqAU7DCxjvRaN9UQahenjrNdboMC1aMPB5dXwVmdGsag+GnftE
	YIQxTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3rpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:42:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so8281315ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582938; x=1793187738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=;
        b=ITvGRnsxhWn/5sCmJgbI41egCLyfp1/rnGmhiKjVfiDcT+lVer5ezeChKewPIEGy1f
         jEIZbtNbkkJ1n8iFdIl9dkFSX3qYPoe+NU5yWJgledbB7+Ho7ojIeTw4RALmu9r2UNGb
         DHz5GuFyOSr7wjJ6op81a8LmjauBIbrIBU7ZLBAl/qxYKT1WAcdsMx37UA8gRvLGE+S/
         LXoRv/95utO2lKZ6j1inrCY1NaSTcIFHrkP70RJm3hnKuKOhUPKcmTqxZ1q8r6jy1yvd
         DMrg18K8g2a6ufKoL3Aj018jtq7FWhXJASS8tUG7mhTJZ56+lnpZmJ03w1q6R1As5Pwc
         FRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582938; x=1793187738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/GfvzbAUAClHbLW5u+kloXy8aTuazubWTlp5Yod8NHQ=;
        b=HEmESJ3gFL3kDNUorsczdVjrGGvocJbHsAlvrnu34lmayFUvP9XkxdBeuskVgUIkby
         c5t1rRcqkEKsWA4zw22/grWLitkgrjng2Zr80Emgir4/hNyBnDUFFqpNDDWFNMqIqnf/
         0BfnJY3qt5QWutX/IrPgnX3yVUybwTBtAcPMcfaK6EWg+5ui+L0HivGbSHlyUET5cq24
         DC1SqpYpjbOi/PUCywOhFXEql015E+NkSXv4omsaIiefiWEBvXr7nCYqHGWwkScaUIns
         ZCk/R2n9WhEAzybUIAm6xxZ2f7I0KVKgtb7JYl9jtOmKvz8obHbUaTlyFXjTbv3Ouv9h
         Mp+A==
X-Forwarded-Encrypted: i=1; AKwUvBzri2T7cE1m3MwSnzkQdv6uK1dmv2ZspNd73//xOrJteXhlY/6w8fIb3yYcvpFyJGIMRSF11+JGNrjFx2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGGLaY+wWRj+Zpg/4q/MbHKjc5FaGcaCK59iCEGjM2NY3QX5W5
	N2bCxKf1nh+/tfSrkrL4IqJNY/0Lxbbb18jsvZerCRmP/RSzrAwHZeDaCJvdy7gB9rK+Cfw44Fz
	x4Y8OuXWT9DfWnPqKDPNBNG4+5Y/IyJRYgmKvu3CBXSHEfK1v+NVxEohRZXx4xtGgmdg=
X-Gm-Gg: AYBFou15LjFBvkSUh9Bd+FH1ufeeARa+dlK9YAgbml5arrRJvYXCx7h0W3nL0Eh/QhO
	f8eoQOUeOsuwy/+qxlPefSMw/pNucmHaEP0pKV/DyCaw9fH0kBhUEWvXmPNkwyO3fAmdfBmIPsC
	kG9Z5eHogfIIr9llK934x6SAZs1CiQN3No7rlxhefzQ5+cxUi70VJmQNN78dd0BxVC1aNEuf65j
	yKGG3C5JZa4C5Lv8ZKXBBKOPZcA7hcmuoBFUyaN9vd/DvlUeoos2+gObe1Q3XIvk33xeM/VXFN0
	gJdUFz+PFKvTzQj34JXp8wxfH8CssZscMIhDqvnpjvYM2bwO1GYVaNqUmYKqYLYu9nYIkd7Qjdz
	uAXmX93QL52TNwzzgpyar0XzrKLDBIw==
X-Received: by 2002:a17:903:b4e:b0:2e9:60fb:5e41 with SMTP id d9443c01a7336-2ea43d546b5mr14770445ad.50.1792582938540;
        Wed, 21 Oct 2026 04:42:18 -0700 (PDT)
X-Received: by 2002:a17:903:b4e:b0:2e9:60fb:5e41 with SMTP id d9443c01a7336-2ea43d546b5mr14770255ad.50.1792582937887;
        Wed, 21 Oct 2026 04:42:17 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4108a9sm10462325ad.21.2026.10.21.04.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:42:16 -0700 (PDT)
Message-ID: <194cdf44-059d-4d03-8cef-d674ba37006b@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:12:11 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Drop CPU critical trips
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-shikra_crit_trip-v1-1-730c48fa998e@oss.qualcomm.com>
 <xa4gmzdccrububsmervkbtwqpddsbikubvgsqksypqmx5oih2q@q2hz6tadbmu5>
 <53c6b966-a6ff-4b91-a2b7-d7faee5a6605@oss.qualcomm.com>
 <3a87d077-8b8b-4bcb-9f5a-03920ef3d38b@oss.qualcomm.com>
 <e3de4383-f530-4968-a177-288162cd34c3@oss.qualcomm.com>
 <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <727ru4mlgn2bf7ta42ww7772mekk6bea7sni5b2h556pk3c6xw@4atjqo2ygylo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX5B2lp5REnPNE
 DtxmQsGq4WX1tk9W2XU9W/8Q7l0XoQX0SZ63Man2tXT6mmIIO1WmRJalccqhqq6Jw1kBvulhPh1
 Jm6TAJR6WdOqIBpfOYc0TYdtNr5A6A4=
X-Proofpoint-ORIG-GUID: JRAGUB-mLoUHuPKWKJ_lQ-kGMFU_qEyb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfXyOwRZgvCal5j
 HXjAab+EZxrn0kClH+/NY5P84BFz3CGD4UtTLPSEEphU70PIQ6eJVkT27xG7BCzc/GrYnAM8Axw
 E6IWjTyuryYkUOVbwHLq49DwTyU9UhSIXLEMR05KNtpH54c1iZTxTl1i4BbtDlA5S2Pw83a1cUI
 fMz1dM9b/2ZiOSaspjfMRvEWOAqeavX0RGImkjdtruTSHS+tCRuarIjuXW82xOMOO7hiZy81yK4
 PKrM3jg45PC3oPU5SYqtTHtjyltD5aheQU5mi7Edw8pPC6LWSK9I1Pgp3bpprkcLMfidthfzOc0
 7VLhLnTJBWGy4NJcVYXPlfpap43rQbVhcU5b5cKg7cqL3G+R/JWYZJBTVEKIuvjsPHhbK6S8EmK
 Bgd5pf/6yhko6Xn80XtmGD0GK3mkZtwbgwH2GxvviYFnwdqbSwHGdp7mUSMWVPNDGIv7gyJal4R
 Y76fgtOO5z33M19Mqzw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8a51b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=MAucDEMgGkwSF4ccb9EA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: JRAGUB-mLoUHuPKWKJ_lQ-kGMFU_qEyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046



On 10/20/2026 6:26 PM, Abel Vesa wrote:
> On 26-10-19 20:03:47, Gaurav Kohli wrote:
>>
>>
>> On 10/15/2026 4:43 PM, Konrad Dybcio wrote:
>>> On 9/25/26 12:24 PM, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 9/25/2026 3:13 PM, Abel Vesa wrote:
>>>>> On 26-09-24 19:52:32, Gaurav Kohli wrote:
>>>>>> Shikra firmware handles CPU thermal mitigation up to 117 C, while
>>>>>> Linux CPU critical trips trigger at 115 C. This can shut the system
>>>>>> down before firmware reaches the end of its mitigation range.
>>>>>>
>>>>>> Drop the critical trips from the CPU thermal zones and leave the hot
>>>>>> trips, non-CPU critical trips and GPUSS passive cooling map unchanged.
>>>>>
>>>>> I thought that was the whole point of having the critical trips set to
>>>>> 115 C, so that the kernel can gracefully shut down before firmware cuts
>>>>> it off.
>>>>>
>>>>> What happens if CPU gets to 117 C and the critical trips are removed?
>>>>> How will firmware thermal mitigation handle it?
>>>>
>>>> Thanks Abel for review.
>>>>
>>>> For the CPU thermal zones on this SoC, hardware-side mitigation is already available at 115 C and 117 C, and hardware shutdown is at 120 C. Because of that, a Linux critical trip at 115 C is not very useful. It overlaps with the hardware mitigation range and can trigger shutdown before the firmware thermal sequence has completed.
>>>
>>> Does the hardware mitigation just pull the plug, or does it signal
>>> to the OS that it's about to? We absolutely need the OS to be aware,
>>> so that e.g. the filesystem will be synced.
>>
>> Thanks Konrad for the review.
>>
>> The OS is not notified before the final HW shutdown at 120 C. There is also
>> no useful margin for a Linux critical trip here, firmware/HW mitigation
>> starts at 115/117 C and hw shutdown is at 120.
>>
>> So 115 C overlaps with firmware mitigation, while placing it higher is
>> too close to HW shutdown to be useful.
> 
> But having the 115 C one will allow the kernel to take all the necessary
> steps to bring the system down gracefully, while relying solely on the
> firmware will just kill the system before kernel can do anything.

Thanks Abel for the review.

On this target, 115/117 C firmware mitigation is throttling/prevention, 
not shutdown. The final HW shutdown threshold is 120 C.

The 115 C Linux critical trip therefore starts shutdown exactly when 
firmware mitigation begins. Moving it higher also leaves too little 
margin before 120 C.

So this patch drops only the CPU critical trips. Would you prefer 
keeping a Linux critical trip at 118 C ?

> 
> I don't understand why you want to reach firmware/HW mitigation anyway.

