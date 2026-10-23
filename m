Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752562;
	b=Wklmx/lmLzyO0WT6xt8QuvP3s5OMEHUDYGXI6/kbqhUqJG9A7ZOasu0oSqa0Sr1TK6Vm
	 wDzzqbt+OvyQcNp5Irk6ykjfByEhY7ivjeAbl4uVMCnTz5eWIvoRJz+dN9O20huh7GekV
	 7skPgmmNEy8iooQSDaXZsLEpoOyIZzleyDtLZQ0sGrOqFYQYEosFHjmqfbZ4Q/PbzoU0v
	 5UQ9G7AvEEx1CL3UZP/zgF9tV1O1NZ+XPgUn9lcz/jVkyS+h8l/bTZ8If4Gz+L2knwmgP
	 bai1SVX/J99H9NkyFz4bndXD3VsLZTD0AGcviZHFi5l5p9jK2UTLLjmslKKVQD0L2rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
	b=awCrcWpPE8JJoMgiLQk3fH0is14XMytxFuzM+otdsPdu1ehtTzaKsrnXp/QKCaPQboPh
	 HXYSZHPeLfgK+ZSmbU+zAIz4oiPyxIhxppJjLGkCezX/SipavI8ijtWsRNSOD7NloETz7
	 iOeBxCHoHEth0ava95G2Ns/iqMwcAD3RoM5NQu7oiVB79fjR1UUG1wgM9AcC3GjKrP1Cu
	 GvPmYgJDGjiBzNRm14Y6bciYtU7IuoPamuuFKzISs2b+7q8gEah0TKEIcNi7ONxZk6BLQ
	 iRxR2Vl4Nf1ZVJ2os2Vjc7gnsu5P+Iw3Jd68xvhxV5FHbgSZNx5g7K75bCmmgD0tCOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBpHfLcZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc10VNay;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF539606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF539606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBpHfLcZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc10VNay
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAX872489807
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=; b=NBpHfLcZLEzJTtxF
	l3MprFIzMvt6CSzQX73ZK7PUCrx6178LHmXAYHBQ67grkua+/C2kPaaQ2vHaPg/v
	QpUuMmdj9zOFu2AOK0z2Pw26PrXuJgOx8o53lmLgVQKSyVIZRE6h53fpmkEaukPd
	1fPyVWOzvomnoFewq2JF5z11lniSknx9DnD++5RQbhlKCIlrCQq5pLUiVS71dkOJ
	aO28pX6nPbxwsAjWm2UgCijj9xtc4VX8aK0eEOZ1sUFQUezkWN6wlQXTI+Oa4EMb
	wJEDV+SG9tbwJOwEKiiE6xN80K8ov1GB35EO9p+2Ma/owRwyiEmP7r5L2EDBQCO4
	eRvArg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygagv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:49:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so137714985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792752560; x=1793357360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
        b=Bc10VNayHO3vSP/nvk1Vg/3giS21EEKxaNiiz4h98NjVTjNPFcSnIn6rrl7piXPHDW
         VCDV9ITzg5zF8Lae6VXmwGePaxSYG3Pzs3sYHGRs4eHMdAl+fLhMKLONuIV9RzzBSfU0
         Uegrxv09Cz0cJvGKL0N35S4L5//VUPzH8j2StBD28Me7N1aNgA0xDYFp16UgPrDD8oug
         2jC3HInYzzHE5/k+vuP2NIQEIVyNomVR/5andRHZ70kSUuAXu8lMR6rQ3TKoPSzhX2vk
         UniMg+OiIxHbn8L+hH0MQXPIq/t0h9/ITAtUIOk39GWhWUwa6c1f6WOwbka1gDqRux2Y
         o4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752560; x=1793357360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
        b=IXcqNT7wZi7a6/WeWPLlTrDdQagboVy5/B1StQ2FHT45AQVD0tK9w6eqJQkwtsY6H2
         IRzyjx8pjlkx6LuGymiJktwEhSz7odKdPNAaIoWqgbDbcOZWwqhB+R0EjBI5B+2Zd717
         cOMO+ecUR5YKAKCx1uUHUmAFQtYwdt7lFpG372GbfbcfbgxhCl2DaoGdodEIS5QNsgAR
         FD7RC0o3dhyF51SKFO58RnsAVnQZ4cpMjWWgN7ySx/i8cTK/JrDa7/Mjj5UjE4UTNP1S
         7PwjjkESaSz7WJyyBdyuaQKvmSVspxI8gEcXDxnJRVcOgRuj2Ca8PA23zbTHISYcQTia
         rk7w==
X-Forwarded-Encrypted: i=1; AKwUvBw2z3zQJJ4iqNdF3x8Zm83AVTWJL9c2ElyD7n4nWNmpo57ebnNFOw8XKqouc014t7kYrYW0hb7gNC9f0HU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKvNV5zapip62Zsph42xfLRqFVBTfOuprMV9End6QBs3e8g2aK
	DQtvG8Zkgm6qHekEBDPG+UYqHaMWaZzOuT0C7V/jHcUn2ODA7Hu8yr+0ns47OQr8miAImjBTcqQ
	AiSOeBUvlWdDziCjaCZJHUC06fqes//62QxGY0kYztiQ4J2Su0Awn5Z0yo19KQ4w9/ZE=
X-Gm-Gg: AYBFou05FXOW+iQN+W/cy+6smbenDyHn65qD1upfaYJfJQMBSUr9ceyE+6Na+Lp1S80
	UK11cIiQgfKKbWsfJharr96o1n0LO1skLYYVhjv2nHisK3Ip6CkzcQ9577/vNp7LxahHYzvBNOW
	o7aidvHt0l7yxEonJCKED3KiQvHxjnTJBd5ofj0DdXN3mV6wSgZ3QMJTvr5hGL7Cac7xkGFv1Vx
	VOodNLU3j5+nv7X+bAydK7u+w7LTCWULoUpjHzF4QX05pVp5TWqvmVC84SDwuqPHBMPH21tbVlt
	OAO4kXYt3Zo0lyhZIMp6SatuntawlBGjqYDqRdCSDqJt6buY8bZMtvPflTfcSQfhVeF7dgeisWf
	hlW0YTV/jad3Xxna54vIWpsx/g3eIrdSyQ183AUn7xKIj5OVAJiQwdnP0Ph9K6Q==
X-Received: by 2002:a05:620a:2b4d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93f6f85dfc2mr320615185a.47.1792752560143;
        Fri, 23 Oct 2026 03:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93f6f85dfc2mr320612785a.47.1792752559716;
        Fri, 23 Oct 2026 03:49:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3802610fsm4407066f8f.14.2026.10.23.03.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:49:18 -0700 (PDT)
Message-ID: <36ea62e7-2dd4-424d-9326-1b5f270da00f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:49:18 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
 <atsmQqSOuqp1LKw8@linaro.org>
 <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb3bb0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=agzqCfvS8LjcRQY4D-sA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX21SknOuJh5bT
 tDK/CLusoP7KDF5vI6tHua8zE0VwCMKJ3bIGlBITWvRAWCJFVCxSpqyjgn/a4SVqDMy0ijzihjL
 XsZJaghyUGPlB2cHdaAyP6lWHyi8e6g=
X-Proofpoint-GUID: CoNjdS43Dkvsabgw8AiO5LdSSbz4HEEB
X-Proofpoint-ORIG-GUID: CoNjdS43Dkvsabgw8AiO5LdSSbz4HEEB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX/YqK1mFJ8b7Z
 x473n+NyoiMITIMWtSgdfEWDvCp6m+lrCG3xCKIjP1FSWuY5TyJB1YK/stHDkkca2NaYQuy9Hqv
 AwEbOqdZLNriRbVqx5VrxzJgipryVAjaSRUzu+6Q7+4+Hpj8FeRZX5IBHfbHFq1093/PLtwLilJ
 1Q2oLPEZTnFYv+RO5WHgfxpSibSo6VG4aC9eOmzMZxJ0UH2WI7qM4wCwtyUI9TcB4MNrTAQycal
 ydZQzJONj32fFvIHVt8WKXyTBqVqYvnveMdbqWyvP05G/Z4J0jjX7SGoLA/yi1Jo8mOaLEPRUyD
 p8VMTXUPEiYge5Ve4XljLyZ7eYqCfXV9E9784pUsCZDHSF8oQYDJJfEyN1cRAgMcbuqKFdB0Exd
 NxILxQ6h+/Bu3M5rLbZ1dKWowPOb1ne4CKD73YMJ/MvQKrhviMY8RSnMartEIS+IZHP7KrjrOTo
 i9MsjQHkjTfSWGW4Caw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230041

On 10/23/26 12:47, Konrad Dybcio wrote:
> On 10/23/26 11:17 AM, Stephan Gerhold wrote:
>> On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
>>> The ThinkPad T14s needs thermal mitigation under sustained workloads to
>>> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
>>> monitoring is not yet supported, so use the board temperature sensors
>>> exposed through the PMK8550 VADC to provide mitigation now.
> 
> [...]
> 
>>> +		/* Sensor near the CPU PMICs. */
>>> +		cpu-pmic-thermal {
>>
>> I'm a bit confused by the node order here. It's not ordered by the
>> thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
>> ordered alphabetically either. Or is it still the old order from the
>> previous revision?
>>
>> I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
>> order would be our typical rule.
> 
> Thermistor index is what I'd prefer to go by, I think it makes the
> mostsense

why ?

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> thanks!
> 
> Konrad

