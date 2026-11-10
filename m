Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297402;
	b=N9wmUCoEKRJV9VM+KPvovDXvC/cOYjwjXAhWdqIZAOpxLysOR6CiUjiIofm3q944JhbR
	 TAXMFnz7KyNoJI9KO6WSAqsMj+PNwxV6C/zdEPpj48jFVJSITHMyOcSbWE7rOYLjgNaQB
	 dwvn7ifEfvzH5We8VRnPVLz7CDPxqmSmJuRaZeMezmS/58Xh4Clx6qsVpDXnqbLo/ArUO
	 cS025HFYlSjqY2LVsVTljvXQxjS71J3uhs7a15fW82EorThbXEM72XxDGVRVYuts4a0SB
	 0nrV+3yOqZp2ONWFbmLSfuvObW7ZgEgzeCFfBsHXPj/yBDMBoAIob9oobR+yMmjoW0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297402;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=;
	b=Zrca9ujcSYld1vLid+MUpFV9ousxgovS/Jvs9oyDh5ipbYhn2lBJuy/NxfzW5V9mFNTz
	 qw2zXn2XbFnAyzYlngGDzk0ya9Gxd27lhgJttzHXw/AJ1rJFEpepFBI0IUvf3RQXMB22A
	 sG8kqpsNaK2cq88oYhLXYddSTtq4W2M7LCybbxlLZKarMhe44x6aF6O7xYKx/b2Y3nehA
	 bYE93q7MbFsBtb8YjfGp+qJmvgoHnLNhIyMXf5i6adPLw6ZLu6KPxzvdny8jADD9Jw+Vx
	 jAjl4utfKTvtJ5ogynNwYrSgMvp8YqeVuvh6oT7RFK36bSwTgvnskZ/g/s0946KDyMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljsfuuc2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKmQbN1y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D9606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ljsfuuc2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MKmQbN1y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4F21681291
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=; b=ljsfuuc2KsWw7B5T
	3XVxHovOvzdWxvYu/9bBcn0MoJ0t+dWQqYKmmU2roIv5RIOmmZfnul+3Kf7FTLs6
	Gkk01m8PNpMuMFsJ+sIESX6ko15V8MVNBkUN0X6z9qB48/GRqexjzFXy3YEiL+lG
	pp/lK7ZT/2PgbQcz3SLo9toHIRXvuqFfu2M84yyXIPLEJP6Xy8W+GQ3tc1EoLBxq
	VbKRGAoSTDQwsc0lFA8Of+bSekvAcg3vSSJxB8zlqhGzq0BOoIpjKZ+gvS0ybocV
	KY/45zklliNqyjxXQ8mgEjiTxjH/3hCve0Deo0lHU3rzOeRQOXOqVH3uWSWKbF+D
	7C6q0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkj5jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:56:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso48189285a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297400; x=1794902200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=;
        b=MKmQbN1yfUraeTtjcm62G8ToVfjapv4L2P9iFBZ+bv24wUb3MwQ2a3CezouXEwUj7L
         Si9Wdzt4SztskO4Ug12OimpI+X0mfFnVpUUnQPNHzMGEW3+DnNI7FD7q0k9fxOAAyD60
         dGXTkp9s09INwfo7DWk9vPGdmGd0O82RvhjVk1JproaZ7u3efGPZCSiCMwJOiZYKCv+d
         n7e8PucvZ4v/4cEsOo4xPk1L1PQvSzsZwnizeqtTr2SuolYZAIzCMMBX3j18av0flYSt
         g+iAkaI9Mih+kQgNMP+x/EVLNZh0c4KfBoFjk53ibD8d0vvwK5t1qkdX/S2usJMdPdDp
         xATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297400; x=1794902200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olis6PpR/EgbjTfN230nB1ZkvAvMps4evVW4Ka0nkMI=;
        b=pmmOvClEclHCpsgjBE8NNfBRARDi69QnP3+D+vTJ4VAtwvSRIh12J4qk8j6aBN+fNQ
         MuagCx87owA8+0fQNwZ1+F+ufN0oKTIotD1Ee80HL2Y6ustDmNINkDIZJp5WWNDLxZZ3
         0XbxGmQmQ6YBG9V2HnX/KVKFCIHwRA7VevyvPVkX7EDKD5vlNthGvtYcgU58anO6cNsN
         Dg3VpWq51TlDClm/p8nCOQN83TIlg7R06HtxpFFrE9mZbFzGiydDA8OQTTe9PnCMgIWd
         mmy2Sa24CK0aulfCSPeK5162ZJPWt8Nrs8OWdIQc0kN3eXUP+08Pi3XrMuFRLMhafq07
         y8hg==
X-Forwarded-Encrypted: i=1; AL+hErGfdTYycUBV4UIV3UVkxSDzA+ELw1xcbUEJ+EIa6yLv8JZja0bj29fNmfniUrQLBQ1H+m2OIJh1UXdB8t4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5L62tRRPxXMVvHnpXRS1yBOh7MIo/6Vw5hVH8P1OzFmiLlBcK
	HzEco2/wxTKBFeNJKjIrSQS339hpggceyvST5Coc0NWRsBx3mC0Y48vrdN4HyJUjorcmUh7zYkB
	XMnbtQ1ms+mwfrDXHaplm+GULrRt7OOcqQQxiSVGJiwetZQEIeBLLM43pRoTJ4dM0zUE=
X-Gm-Gg: AYBFou3E++6mdchU7PqnFuaCjwMbOchMGeiqkeeh3J1+BKn6VzbBWeQfAANK8Sww1wA
	vc3Ch4AHeEHosNyOM+hpPs67vEj8jY4C50e0AsBYtDsmXxiV9rgjTL7Y/OxSB4ZlpJovEe9pVDn
	KxNlSUNg6Spsy4jvVcDIKJ6+fxBN8l4WahDAo0t1detfdnqhsiXbI2lpnHwNEw8MDx2i0x7xP5G
	bOpqPY8NO9E9V1m7d4dDJ4dpQAW9O356jbX2sb6jAv0dQCq9I1NdooVanqbBsbk2dvGesRh+F5l
	T8a1UTdbPrvA+kU0weINjZZWr8Erfxcu0q/9dYm8iXVE8l5XfVQbCxh8fjF+0gAGWe/WN0sjCCa
	A7i/nqGMbUcXQV40iI3bfZHzylA5seRtdFjDl8asarMsG2c/VLhTmE0smAXb8naBHfz52gm0=
X-Received: by 2002:a05:620a:a084:b0:93f:740f:5a62 with SMTP id af79cd13be357-9479f396038mr301512585a.6.1794297399945;
        Mon, 09 Nov 2026 23:56:39 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:93f:740f:5a62 with SMTP id af79cd13be357-9479f396038mr301510085a.6.1794297399490;
        Mon, 09 Nov 2026 23:56:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm824139a12.3.2026.11.09.23.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:56:38 -0800 (PST)
Message-ID: <6e498ce7-01c2-4c68-a152-c0f86dc1f4b1@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:56:37 +0100
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
Subject: Re: [PATCH] soc: qcom: socinfo: Add missing PMIC identifiers
To: Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-topic-socinfo_pmics-v1-1-ecdb6cc6e40f@oss.qualcomm.com>
 <qcxc7XsXmVOXMH3T-UIFGOexo2Qh1KtJspYZ15UrL2Tu_Jg6Uq6-PfJYTlJoipYPZnMnpNXN6wbs6pnJkkLTiQf4O9uOnp-NLJc-13wxigI=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qcxc7XsXmVOXMH3T-UIFGOexo2Qh1KtJspYZ15UrL2Tu_Jg6Uq6-PfJYTlJoipYPZnMnpNXN6wbs6pnJkkLTiQf4O9uOnp-NLJc-13wxigI=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r9u9OtSUwoXTKZZgBB0I3bHeHlMZRiFg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX8kcpaWVijOCQ
 JuF98ZbUinO/rk0o1HgjA/8BX35lQgpTYODH+pgHKNc8W17ofpiSpdWn81i0bFj8xfzXvg2h8CO
 3U8j91Udkv7Kx9c7as7o5Yt7LNux6YI=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2ce38 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KowMc1ZSYTFx3OMWIoEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: r9u9OtSUwoXTKZZgBB0I3bHeHlMZRiFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMSBTYWx0ZWRfX/daacQH4whne
 NnotLaTv3Kcl31ABAQxy6wKG11wwlMl6GCff5XoiHMMT+PDrCYyzSSAvfY4kV+zGIW9zsh00Muv
 SeJHxyAoRAyh9kQjbMvdJA9SQGxJpQWJaGG4kjsp/NkG/M3TKzl7R1GnUwmFuSiI2lyuYEUEkIF
 J5DDWO+IKzzTu3kQMknuEYqA+b4PSLz60FsXL1IzZa4yqQoTSjWOSMQF1mz78cdavagQ75teRrV
 YjE5jH7jCIrd0inT5N7YYNoz6K5kGtji0gkgg6yLY06/tbyLeirTFiDxWZdg/6/C7zjJYJ3btxs
 P+cdzG017HfnSzzgFeHSrK4hswtY67Do2OOd8KN3/uAW6OGkgRp2ApVhvV8fn6AmRbMJYnx8MjB
 cBvOB2XTOU89B5cL4iwbKF+XIFleqoTSLi52PBgo3TyE9A9fJByBQ2XJsIl43YlakfFUkXygoFY
 6rUNF2JPDWZ00vzJ+Rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100031

On 11/9/26 9:42 PM, Alexander Koskovich wrote:
> On Monday, November 9th, 2026 at 10:39 AM, Konrad Dybcio <konradybcio@kernel.org> wrote:
> 
>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
>> index 38efc5db7fa8..6ed8a4686e2b 100644
>> --- a/drivers/soc/qcom/socinfo.c
>> +++ b/drivers/soc/qcom/socinfo.c
>> @@ -154,15 +154,22 @@ static const char *const pmic_models[] = {
> ...
>> +	/* 68 is unknown/reserved */
>> +	[69] = "PM8550VS",
> 
> Duplicate?

Indeed, clang didn't complain.. thanks!

Konrad

> 
>>  	[69] = "PM8550VS",
>>  	[70] = "PM8550VE",
>>  	[71] = "PM8550B",
>>  	[72] = "PMR735D",
>>  	[73] = "PM8550",
>>  	[74] = "PMK8550",
> 
> Thanks,
> Alex
