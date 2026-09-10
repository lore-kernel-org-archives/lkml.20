Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C5B3DCDA4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031979; cv=none; b=GTnCjQY9U/aCYQa/Ez2Z1s53caDTfXmi5TzURR70aKt/A7c4MVRBGs9XlMcGZ3iu59FtJUPPSUGAfSIp0XTZBEO5oNZk4bqZxo7t5euXP0FXrTqmfWKFveZILdHcBb7yofi5pdLl35ehjpW+CCYnQYrDvWZ8+0H//+L6CmgtxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031979; c=relaxed/simple;
	bh=ESXLYzb3JTJ09wZ1b2tTlT3LLVkVF6VqP9DwTjEEhjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek5X1VsrRFJK4co+mtXIS6D0wSEcgEwufu3M9SvNV0TMByE9wCfl+uCYb79Iw/pU6CsGCU91Nld32RWlcUwA2bjpYA7MWzeVWVALRixyQPVzmhEWhBCC86UXv1GmrQlZKkrw9oOXp6OgQiscZdI/hlzK5zsCmArqkOPCeOkgilc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHhhVjrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpzQ527J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHhhVjrN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpzQ527J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8xP6m3468652
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=; b=jHhhVjrNUw1iOuwP
	yx9xHNU68EVXImp3wcBTnlUMPowCBALxxLu6a29zK+eRU2e5Rm6255/lU/M2YnMh
	0dtkZXQ5iLZozDI0a9TZC225Hip/C5slJdg3c+j+EYKVntEDA10rtL/D6smDpSgC
	C2xD+0wdCfiXGEKsE5rMXEgdb2sMKzhE1/YUs98HO1PAdpY1htoxjElG4uMnYFua
	SsO9aV8pGlm6/3twZ2PG1Wvua9e6x4iMwF3ySvg4FqXj8WYqhhAqtmHUZuu9uKXm
	1QSyhq4CRUf+dYbJ4aHu/80efzlJxWWvLCgG/DQmOWCjtCkrJHp/0oHcg77SnbH1
	MnrA0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8r3ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:19:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so139572385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031973; x=1789636773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=BpzQ527J9stfrRoG0DvKFlrtnnAPmE2MQiGbBKdg+5Tt07+C7bQlpUsTIAmvWvfUXM
         RWwsFq8nEm/9BOPiyBP4xjADjLMNwsrPELv/YOS/RAYk1yb2/7OhIu89ENzg9vDOBd2n
         RysS0mZpkSv2wRR0b7bbKWANV2RjQkWVO4/T0v2xqw2T9NsX7W4hx/hqjfy20Dszr5Dq
         /lAiIwVKqD6IfuMkfQvboHaUx7whR6gzMDX99d7Xgb5c8sXNEXAjga/YdKAstZc6rF9k
         cYodwNsaKFVttIanI8fHlk52P+J8K4AD4wPoPmK/QJHEHzBuHXa2WSqkm1tGtXoNpT94
         jmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031973; x=1789636773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QSQXHI3QYarOdmhfnVpu2s+zpnaMUxIHGX/duCfLs=;
        b=bjf7WwDWyMCR1jt3HiwBzgglMM9pFKEfIX8QJ7s0Wt//nBgkkmC5PYSchlx9GPTfci
         yA0xJClfjeCO9Zcrmnlfjx8IPCrvw1BLhKxTAhRJkkt9w6wflTGXHz/Szr6QDAwdsIAE
         dTJFzDZ/C81DLQzM/Li24QUBcpSVP5FtqKrSxu0RlxKfCev5BlvXRLHYB4rESyWh1CJC
         pc/o6kfcXpeYAnt1kMVP4PqrCg0qsPVz2bMn7I4Bsw6FCdRJ/PBzhVqRk2rYWBfLdLn/
         8hhFtR/zxGK1BJMhrXiGx4gWgbJLYKLzno0PTEqhJNuZPaKGE3Kr9oLT4XbsGVdZs9Jc
         L5KA==
X-Forwarded-Encrypted: i=1; AKwUvBx8NQL/uLfyW1XEQDfFHPP6xznwBI7WBtu2qRNLj7L2TkbIjR7ONPlLdf5cUP6TQGkYfwqNd6OUulT2RoY=@vger.kernel.org
X-Gm-Message-State: AFuF++kCiK1Xe3RbbMPa/nsTDDI205D2Y1n7ruM1aHvQFnESgFewFFqk
	OuIp0DHKYLN1tDYY30431lOG3iyPEczQstDxGcGcrXhZcRukcVET3YUmHvtVRvbaq0QZA6fQ9jU
	71VJLfkQaGWbWihiHlI9/uKHc+DUifgblNCmZId7aOnOh9YGU1TT9haZ7NzgstvgS7mI=
X-Gm-Gg: AYBFou34+7NfJJAMEPhB7WgUxsdKjrJgXKGrEhgrkjqV+ky8choTOi8TVz+ikoiSLQz
	En9SGhcUqTSYiyONFQ+Dk5Iev1cmy6q7/mpzpH5SaEyBTXwI0Eb+Hp9g5Hx4jkRmjftVyRxXAlo
	gRwyu7YCnV5ao1Htqv+H8LV7lKaK8IolgiturUvxLKVdyUtfF7BdKR5OqrPBonDiXvQqaF/ZYoR
	9nKu8/aQtKfO4sNKZNvkDJT2jJ6PRJu+qayhpRsZYUje3/ALTecUm42Q8GAi60PpqQxFMCK7FfC
	XUPwqXUAO5gfGH4FaQbfvXp9MlRW95etlYEK198tRuPQFxkblKhNPNvVzrfNK+Ufo5s/1oCXtu/
	OzQM77O5Kqv66gG7nnonZug==
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425483685a.1.1789031972855;
        Thu, 10 Sep 2026 02:19:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:939:7e96:d296 with SMTP id af79cd13be357-939d828e0c7mr425479885a.1.1789031972468;
        Thu, 10 Sep 2026 02:19:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98505ec28sm2830486a12.16.2026.09.10.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:19:31 -0700 (PDT)
Message-ID: <6435193a-caaf-49e0-b219-ba91230014d8@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:19:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt
 line
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>
References: <20260908130745.2545-1-okerixx@gmail.com>
 <178887481187.4612.2819576206036967152@gmail.com>
 <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -3Q1oEODCu2vdP5E9mtlJXTtrEJ5ylFj
X-Proofpoint-ORIG-GUID: -3Q1oEODCu2vdP5E9mtlJXTtrEJ5ylFj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX+bmui/WAXkLE
 m6cah1mK1wgTEbJO6sd6JjeOEZJeZ8H/K6oe7B/nO0X6maL46iSGbh0Bk0Tk3Aa/gRt/UoSKo71
 dcWAx/KRp/+VW8m0TX+EIVeS+l61Ap5cBc3pTl/O1bqNIjXH1GYsJ43Q2Wgm5BSkIqNy9V5hjn6
 AfkWmXnXtzo3Dwr45gcc3Wt3kL8fklqk5Jd/QDQ8NdOwLei0If/Ad+v87kwfTHDjzs8EWsKGoZ/
 MWRYJzKC5jwIcM/yzFkSOMQqCzoRnPCWnRyEsF7kX8zigRunB6porq9KM2zY+KzHxsMbAmvepg5
 Sn7KMO4ImHe3vpnBeX43Dfe6mMlfVntV75zANcgg9o2NT7QS1TOGkfaPeoBiwvWgAqGxkif/5yN
 cKhEqQgdDAR9g5544THYTSIN8r/b10Cl29fl4Po7KjOKXVBPA9ybB3tqLlCKzkmvumAdluoS48t
 uQnlUNURJKFVWkntD5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX+y5TSX7be/Mo
 Kbuhd70uI3Ebd4RDfaGNdsM7gS2OgBcWyasidAEQ7wBCOH3K70BqWJtgPnUYqNo20GH3NlYWMW2
 IFkgdEPXSSNhtcomUFHrLLxKz877ymA=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa27626 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=oIgkIcNInMogrUYK5KIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100104

On 9/10/26 11:10 AM, Jishnu Prakash wrote:
> Hi Oleg,
> 
> On 9/8/2026 7:10 PM, Oleg Keri wrote:
>> Please drop this series.
>>
>> It duplicates, as a strict subset, work that was already on the list a day
>> before I posted:

[...]

>> The camera works on my board today despite this, which I would treat as
>> luck rather than evidence that it is harmless. It does mean your series
>> fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,
> 
> Just asking, have you noticed any boards doing this currently ?

Not upstream, I don't think:

$ rg qcom,pm8008 arch -l                                                                                                                                                               
arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts

Konrad

