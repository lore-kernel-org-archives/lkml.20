Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890902;
	b=HuhKFDpg23jf3bYJPmAM2HD/Pq1O95gEKBjP7FdEBL6ZMiUz0sopV5CuR5CIAGyKsNi5
	 NLL5RymCxSLH50OHPan2MQSwz0IMhScoShJPhM7TzRoVYAB/J48QFP7M9rwfUzD8FMUZx
	 7FaayDSqzwJbs+e0WKK/VoqbrEKqQO8AQgl0nLS7fs4jVCyh9xbCErhFmdFt/R5t9ttdK
	 ldaadvx7uq9+lh3/syVhDYdvQsQq69u6FzCW4xS0xrIrMfsD9hjB2qPAYOjohVtX8746M
	 XPH/03nEbZK0MBkw0/668e0BqPp/bhtKDO4IF1TJ8v4MJaR6IdTvO7Ouk9XFhP+2OqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BlHDPlEpvTz11MD3jRqdyLcBMjXBE0jtvt8v3OddGFo=;
	b=j+40o9BEtA5BH6/czPSGFAefZEsXsEUOpoaG8gnkpfYffxX2F0HydNPo8APmivgMtjA8
	 k2wCezSPp6vrp7ycKOvwOaudZSN43ixfwc9bBjLL7/BQwTOwwBT5I8Vm4lHQqUOb85wLO
	 avmcD0rmNOkmq/i2mUngdTpjqhGkflmYO/bVtWeyYyITmZm9CbJs/6hNvrUdI6mqlxYW9
	 OmREnH471z6WHERf1w1DQn8KhceumiUFHD4h/xqwfwB0y2ecVyJruzBnfHNk4GLrtDFRT
	 EtMO1U3/UMka4iTQC52vmbvzDqOsMJ+yjxY7No2pBDZM03BBB06XoeGJJ7jJhrtdl7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEdU06t5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QzAuSns7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591E1606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEdU06t5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QzAuSns7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8se4134051
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BlHDPlEpvTz11MD3jRqdyLcBMjXBE0jtvt8v3OddGFo=; b=QEdU06t5mEtyrM2J
	ERlC8FGtVeONyCQFYjxlDNWPhEb+JYPIE3SUg8xPztDcWCZxRhn4wob13J/Zlr1g
	oOc3VsnF3IreT3f1A6hOYbH7ZEBjNlz7A7GhHGbmy+ADKK20apjSXbiYv0jHyVyZ
	lo/qjGdpvZWd/KnhurhvUVOFJSLu4jQv+a1e5sY8wmgzmSJEqykNDYcaBRpWFHn5
	dwYjuufESK1Jbmd062zUJ3bGKxte0mxIqpm2aQ071saJge7MgGueoTnqtl4NZ4Cq
	hmEmpr/7I7CsMTJM2MkQQFuJtQOBFOTkM/KY/2vP+zl7OHGxK+352N9b3Bvhjw0b
	Qtyeyg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqa904-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:01:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so1261922a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793890895; x=1794495695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BlHDPlEpvTz11MD3jRqdyLcBMjXBE0jtvt8v3OddGFo=;
        b=QzAuSns7mxdsdfjO+Zcr5NnOtApNOAbw9U2FA6WTiHgon3j+PBK0xXBynnb0EDKvVI
         zyWBtyzCE1z2ZU3R89h9qOGJMlhFP4RNa7AS2Gf2UI0exOlrZCk9sZkhqobm5JcPs41/
         wET74b1s3sEU1ze9uXGvsJls0iqIcC/RUPPJDERas1Zy/fmWnazX/r0fhw7upl0HTMpE
         wx85LEhjZuUtenZ7qVqcX39BRyRTGmTwHSEcmBUrBvYYom1a0QMYpJ5cKy25QcLjRH7x
         2rMibmk3+sUZAAmbE9MTiKRbdr6c7y+ZZemKix3DOpR953s4zCAz4hkS5qiBdvj1Xj0M
         77bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890895; x=1794495695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlHDPlEpvTz11MD3jRqdyLcBMjXBE0jtvt8v3OddGFo=;
        b=rn2JRfJ5QBXJloKKeVC0y3bWIvU1K8lumsS2ijKfrz9ktU5XJYFEdHqi+xJymMSX6d
         21oxCfIAMRpR2JmviBs3dO9PrbJpIFHgEsNXupL1oEcc6Tblody+xGKFuW+/ubz87yqQ
         w05oA30qgYAoVNDMHO079tYxT5RngjYBoBc3lSbI0AiUAQMnocAamH+P+F11zstU86/6
         E1fOA4aB8h7MVz9XCUftb3Yg9EnE4B46ovU2RhUZLJhWpxNAx6ycicnD1wPKy+zZihqP
         H6Bp9DDovSmK0M/hIMsw+X2/QuEGId49JNlX9jWCGnxmYX1xqfKu21v92f4mMGvjWMVs
         gOoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkwzjcDo4q9ZxOgk3+NWWn7/QSjfV/24zUVdBSlXMjbcReVeOl1zHP0oj0pX0JRYkEpb3XTYeEzLmT0Cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rRIiMa72BJf64vHY+x9WTgoLcQHN67sI9CbBW4htRfK8CpSkg
	u7AnmUktP2PdbVk2aeufv6BxY0pw62aSA1pWTPaLbkbzjaJ3cNoSGWGxT2OVSJtLQUwiUtiZatO
	0F57yHDyEezUqxkJg31goGcQb8uGajs0IICn9vm4NDOvv/+AsNN9qDTRKdo4g8TyM9tM=
X-Gm-Gg: AYBFou3ONrn1Y2EJNCnHmf/8u7j68PjtXDOdvyBzR9Yi4NwMXD2BzmdDrLr77GOZcM6
	0NWEo1vjSBxf/g4lkqpxzkclEK7i/LtDUE6ev223ecrX8pNyI2y1ShrwcFeGmV01f34IytizTGU
	OxkNYOGm7Ez0hDocxxVoyjGxfRxuyb5D/utNSY21h5qwGhzA0IgxwCzHNQqzjtn2f88Dzb6TcrN
	n9iMAJwHxDck38PyXXqYYuo6OuOogUwklJAoSod2pMOr0z7cm8oAkd0OKa5HirRBnGEuu8ZcMyJ
	9u6RXyd+JAXz/vSEeEDHlOcuIOM9TziSm/uUxmcAAdMLHgq+Yi15ZUohCvU8YAOHw7zsx9K9pLH
	qBJ2DkKR0I+WxEu03YWW+6vdAtIEv1U4bDHYFG8wT6EXCclGCtmUl1GlkinuP3UvIyriQtXybCp
	j4K3ZG0qTUEm3No5Mn/0iGp9N9x85rWQEdREj4x3rYJFr8
X-Received: by 2002:a17:90b:356:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b09183279fmr3992056a91.3.1793890894752;
        Thu, 05 Nov 2026 07:01:34 -0800 (PST)
X-Received: by 2002:a17:90b:356:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b09183279fmr3992031a91.3.1793890894198;
        Thu, 05 Nov 2026 07:01:34 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0969b35c7sm4179157a91.3.2026.11.05.07.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:01:31 -0800 (PST)
Message-ID: <4606b154-e372-4d41-95ce-57b17f0f1d4a@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:01:24 +0800
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
Subject: Re: [PATCH v2 2/2] cpufreq: Serialize global boost updates
To: Sumit Gupta <sumitg@nvidia.com>,
        Christian Loehle <christian.loehle@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhanjie9@hisilicon.com, superm1@kernel.org, zhangpengjie2@huawei.com,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261105090311.1026648-1-christian.loehle@arm.com>
 <20261105090311.1026648-3-christian.loehle@arm.com>
 <fd2b81d0-df9c-4a07-bc47-a2a6460304f0@nvidia.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <fd2b81d0-df9c-4a07-bc47-a2a6460304f0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1OSBTYWx0ZWRfX54uLbXDX48bC
 NSx2g60GsviNhxyxHjnhf66vza4b9ux38mJItUXqj7jo0Hs+LPtA+ygPsr91qaZongjtkFH93Xh
 A4SAExrkj6NAC0aOXR10dVutKF8VWjUJHA1CUPYxAqybCAdl0QsPZjRUGhCHb8hSWf/SM+55lXF
 c4hOkleO6WLL0miDmVe4mqGuj+pu4/Faf60ukma4STEeGkjOLrTfoVJmDUkLwmlE8YxKaiiu43d
 sUtGDiM5Qv1zZsVgKqul1Y/U2rNxLLZx53NeVKXjeLVeOLgQQe9kCF6u+425OeIQQXRPoFI3Cy6
 IAZJUforJMug7AtASgPE3GT5c4hfPux2upaWrLlT9GvI/okWlQUI1U7NlMrRpk9jR9ZaFmnily2
 3HACfNqQ/2mIfrFYksbMBgVL8VJC5L6y5hzvlegkZdiZmeLatL/SQwOJK9ELYyNrgR10DUx8tJ+
 G/wIunVNIr0FGqyj3Cg==
X-Proofpoint-ORIG-GUID: V_Q0jwFGlpf7o-uDe_ddJU-hBRr9U7hS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1OSBTYWx0ZWRfX+txRGi0LoFeA
 Ll0/c1lblOPtZ65L7LeZaohRlEicq4Na7JB0Jshb0/6DBkZnOWvWKD+V887divBgtQ7/9utGf4l
 qVairICJ3ZW1cZMobxWC8nt7Tul3lA0=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec9a54 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=i0EeH86SAAAA:8 a=Ikd4Dj_1AAAA:8
 a=doKhQEW8VQ38Gr0XSBMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: V_Q0jwFGlpf7o-uDe_ddJU-hBRr9U7hS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050059

On 11/5/2026 10:41 PM, Sumit Gupta wrote:
> 
> 
> On 05/11/26 14:33, Christian Loehle wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Serialize concurrent global boost sysfs writes with a mutex.
>>
>> Fixes: 6f19efc0a1ca ("cpufreq: Add boost frequency support in core")
>> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
>> Reviewed-by: Pengjie Zhang <zhangpengjie2@huawei.com>
>> ---
>>   drivers/cpufreq/cpufreq.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 23a77f5524df..d95c849f79c5 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -2810,6 +2810,8 @@ int cpufreq_boost_set_sw(struct cpufreq_policy 
>> *policy, int state)
>>   }
>>   EXPORT_SYMBOL_GPL(cpufreq_boost_set_sw);
>>
>> +static DEFINE_MUTEX(cpufreq_boost_mutex);
>> +
>>   static int cpufreq_boost_trigger_state(int state)
>>   {
>>          struct cpufreq_policy *policy;
>> @@ -2817,6 +2819,8 @@ static int cpufreq_boost_trigger_state(int state)
>>          bool boost_enabled;
>>          int ret = -EOPNOTSUPP;
>>
>> +       guard(mutex)(&cpufreq_boost_mutex);
>> +
> 
> 
> The policy->rwsem case from [1] seems to be still open. The per-policy
> boost attribute calls policy_set_boost() with policy->rwsem held, but
> cpufreq_boost_trigger_state() and cpufreq_online() don't, so they can
> race with per-policy writers like ospm_nominal_freq in [1].
> 
> Could cpufreq_boost_trigger_state() take the policy lock, as
> cpufreq_suspend() does?
> 
>    scoped_guard(cpufreq_policy_write, policy)
>        ret = policy_set_boost(policy, state);
> 
> [1] https://lore.kernel.org/lkml/20261030172745.2045743-4- 
> sumitg@nvidia.com/
> 

Hi Sumit,

Could you please check whether the following patch addresses the issue
you mentioned?

https://lore.kernel.org/all/be3739f8-e668-4711-912c-91459d77ed35@arm.com/



> Thanks,
> Sumit
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
