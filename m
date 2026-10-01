Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690EF3D34B6
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850038; cv=none; b=L8TwLmr3u1zdBJX6edrYKLaqSg0NoxfxgU4f7rEn56O0rng1UghtPwwy4/wVEcA4bdiWleS4NbiuZbK9shw1/E2RR11cbjNEButlYP8hEQuPGaFJeGJYOvTZHZNOHWPXKNVKjqG/BFChm+uR5035BdJB1EYKb1SUggA/yL1TZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850038; c=relaxed/simple;
	bh=1mf4MTx9Pa6vRhpupXXbUv13bWQpU5GBXn3uItBYgmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAiZF1S3cHRPqdJabubR3vKmXcCIKR9bNLHRe7NxHzdBKYPo4/jlDdqRfQXUG6Pr2GgTYn9pRnNj25Qphm0TpeMilvmWcZA70OVrRLWumyD5liV4BAGK+/W2Nl+aapgXJYd5jERnnOobppmgzfU817CNL0ZDiSYkr8fvXrDcIVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6JutMV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdlXIQki; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6JutMV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdlXIQki"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLat1932294
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 10:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSpCcHH8wAjeJ5TdtmF8ldo16S+gbqqBxsDCYAsOOik=; b=V6JutMV+QAWbmB2+
	NtsLjsSsxFTIAHk6oRgWmXUVQHKtZaW99MV255ZBzAuUCt+VebpaoDzugyp3x9wq
	bQ3w2qn45qMdyUllmpAUPhshHhFjgU6p/J7PrAM1R3FqssiPH4RDb279kLMmI6ME
	wgltB5/WMtGb6yNF6LLWybzh9j9HTslD0Ut/xKxJsbtckkws+MSQR3zmE6HUCcjh
	6WkagWHL7rgrBYf8t0JZh7BnHzGqO8lVnbYL3RtTagI2B2Iuy1O9vRix8XT9YJGH
	ndht++sGaZkcoG48QdqcXEjx/hCEs/V1EzErl4rMlZUjNL/zFshQ/7h0/+QtHxGM
	hPyB9w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5adb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:20:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so1701656a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850036; x=1791454836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSpCcHH8wAjeJ5TdtmF8ldo16S+gbqqBxsDCYAsOOik=;
        b=PdlXIQkibM1lP+SuHXk84kZhN94vBgkzk3D+bSR7gb9JAxvVMFae7yuPmCRv/9YNhL
         4HHWoXHsVdzabSSYHJA6QY7WqgIolJSYhOUZyfrDuK/jRACSkpuIrHcX+4JcC+8ueGhV
         4t63YiurgUX29FXyYf5TzXhTvRTiFV6oD261C+RKuUmBJABRZvFPgcdF/AXUFjraNkLD
         ixYIktyjrlCojOUty/fRbNQM5srEryFZLGAIFb8DLRXUuljxB9ANs1Q8N4em297vhheu
         Ib86Pgeh/vkgXYiB6CQo8bzR477joPigNnYrscvShBkVBmQm2e6+t9bGG8awMeO9kifm
         9MVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850036; x=1791454836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSpCcHH8wAjeJ5TdtmF8ldo16S+gbqqBxsDCYAsOOik=;
        b=tPK3z3vjtm0GUdVKqYM+eYrSTj4DnNJZSGSj87vcSKK8HRt1ee8tC/MQHPSOrd+Dkw
         cN/kk36FJ7DZ637wqZDwqGwLaTggx1SRBo0wz9gUYmPpUJtWNvSYr8mmKiZ1laNhE7To
         Z+pcM6bNfo2oZ3N0sToXof1MMQoHT7KN6OhOAjIPysnHr45+Eg9P7rU75YdyxV5W2cGg
         c0aPgcqztiJHgvZZMb7YbzCzU/OKkuTWHJQEE4DAGCuQ6aOCZvTnTmQER5tM24L7CIjl
         OK8KNq108fsrsP4XGqoHHCWCbaWWJ5/hVmgTFjhWS+M8IhWaqGBSs3Iy/9b6tsdGUZZE
         arYA==
X-Forwarded-Encrypted: i=1; AKwUvBwTrJHOl3dR8p9psvTQUJqv4OGo/WY2VLX+7+uEU1s5whV9juw7j0zsjLORGDa5esoKifG/RM00B3+QVC4=@vger.kernel.org
X-Gm-Message-State: AFuF++mRkY3uvJYaQvQzzYIR7FTXwnTtF/88vKoMWRtRIOcqfTgk/4pS
	uQKR7pSeTNNtSEcg8xJvMZ9Eci+Bq8xBjFaoNd69gnUlqqiMGn4cwq+rLg0bFavFEZoml0DkTkc
	+uMXfIZliM9cyKizsrEb7sz5rBv+dhA/fZR1pkLB88eYFhZtAWklYt3xg5IQUUPm7q1Q=
X-Gm-Gg: AYBFou2eJhYRzwFD739753Vciv8jJY9NKcSDWZYjJDRAUt1NpJYuEvr+rkA7J+4cf3h
	pZFZKG0fDS/Y64avwvkVvnpHye6UVZbHZQL2ilrDdvybEJwZBv3g6WBV4wbddJroPLS9D3or3gF
	RbQwYTkIRsFmi0tgxt5ZnfLNoWGRtsOdjEXbaUqRRPcdueFBHj0DPgroQnhOMBXbmZzBy4GgpxH
	Uw/wJPDSP/Ni/BbmQJvamqMG8ZejpB6NRs7niJzL+9GLpj1AHE0XZOWRlwWKz9m2+n1umH0oK6M
	Rq20zpTmVLZQoTVhAZ+z4CurkLVdnQDjV4SNZ7m2RkLLgWaVNaIcEEiNAjt94b/vGWHfKkrlKiQ
	EAYrnvcdQKXqXHoDnoEO1l8/48yvjkg==
X-Received: by 2002:a05:6a20:a12c:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3de9e6e23ffmr3870949637.11.1790850035853;
        Thu, 01 Oct 2026 03:20:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:a12c:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3de9e6e23ffmr3870936637.11.1790850035415;
        Thu, 01 Oct 2026 03:20:35 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818718205sm876406b3a.17.2026.10.01.03.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 03:20:34 -0700 (PDT)
Message-ID: <5edb42e0-1fad-4383-a215-5ca90390e2b4@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:50:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
 <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
 <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vPaJmuTBoyHZlt2J5ZXi3PTb6Omcswgb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfXzWKbhuS8yL7Q
 K41YbKS5JqP2qzwYjzohvAJNid6W6yJpdlpDM1Nvw8HMdvzWvSmnESD1cbRaKWES8vENF5yYG1e
 mbo74xGYvCG79kAiViRKYLGYp1kBK8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX2kdi0TPadLKr
 bslUXInwDrp8wyNmrZoFFPD9aWEYSUsgCJuiAtbn2t0sgDCLpfk9iGL86e4ps52n64qkFEg++l+
 Hyn77jhQJJsSbzJ8kgL1pGMhCGtLZcEMn8Xs0eFsjsWyl6GWisvSQ14or/Um8LXjb2vQQsxAsaP
 bQcK9dEVvUWIIpeMpXhhLvKJJ3w2QlVMcrWojfew2ycWYiPhjYghJuy4ueZA+Tv6NHYIefveGcg
 TMVlE2y7yUsmy1aJOHYIe+ZHUzR7tZwrgp3hxqAEukcUr7lkotin6TdZmwDYYTyGtSnRxX919bF
 a0jba0pgVg3Swl4j5OFclOIUcyUD56b6Oqu0ojWCavGVYkRlccF7oV7eGersrmOTtVYbN3yDhnz
 HKWEeeq3DPHSygJfp3euLJc4Txc/wAcaal6D0zqKUbRUfUP9Md/rBoqL70f5lqxyRGq21/tGjoK
 dKV0zb00vWTof6ZkbdA==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe33f4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=C0Wm_ytjJX4dORp1m8IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: vPaJmuTBoyHZlt2J5ZXi3PTb6Omcswgb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010041



>>>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>>>        { "modem", 605, 1 },
>>>>        { "wpss", 605, 13 },
>>>>        { "adsp", 606, 2 },
>>>> -    { "cdsp", 607, 5 },
>>>> +    { "cdsp_nsp", 607, 5 },
>>>>        { "cdsp1", 607, 12 },
>>>
>>> Is cdsp1 not the same as nsp1?
>>
>> No, cdsp1 is not the same as nsp1.
> 
> It would make sense to explain the difference here!
> 

Will add comments to explain this.

Thanks,
Navya

