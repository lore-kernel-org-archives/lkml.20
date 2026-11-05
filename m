Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882334;
	b=UIAhUnWh6S5jiefO1Y/UWW2P9nqW1g9cXgbP3JamYbXXQLkqRRElodqKoCZ6jO9sBhmr
	 x46SF1SZEXzL+cC4Vws/1wpTdnbszYqbkHhrN29aaGdOTn0s6m9i8YJ13FRqVCoXMrcUw
	 Bz0sk+TK0Ql10/cXzAvK/lXIqfV9C4zutqw19eTtTsfjuGUtfvRlmy7/sY21SctdB7dVY
	 Sl5bpckGWufpR39vlfdi16nbB98V5rWdPCgd7nhuJpEceRxkccl1I0RC+YSJ/duEWgXGG
	 XfBO883ln0gEJjfOd8ilN3vIqFIhPwlFwV/0zNXuDls4dZToOfVxxe+iciInGgOHG6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0vGWXmg1itow1losLFRnU/f5R3wkwSa21eMKz4MdddA=;
	b=B9s3rQK1sroXbdgwsrCGjFCQsvf1JOCZrlRycsIZ9DQppJvLAjCObYfzPcUTKUuyvyyf
	 N/pGqHUc7URiHHSl+QIvqBpdx8mkiFjp+69vEB/51eYJ/QNdk+i0mSH36RxiEgxbmYvQf
	 eHV05MqqhM+g3uD0gaQJAbsuqcxnnYz0XBzwFUAYlo+cyA8KZbQq9HGZXh4LQt7OStx1x
	 bnSFy63Qm8nuY1XpS1bmZnH0GqEq/GdkYuPgSo+iWH6/Qy4PG3Uyx2jceNpuAubPhA5JT
	 3CvUD1gNLCBL7/h1/vMv6KKogvVCpPAZbh777G/RRKsMgeirvgKCyPA8QTe8r3e3n4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nvuwQMiV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bhg6gbKA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54109606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54109606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nvuwQMiV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bhg6gbKA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tPAP433303
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 12:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0vGWXmg1itow1losLFRnU/f5R3wkwSa21eMKz4MdddA=; b=nvuwQMiVy3FMNKIC
	1mUT9ynZD3oO2NxhwX/O1AJvLxJfzaB3zxVjOtL/1f14o2lB7OejhMzicbqSnQxI
	wKenOhhKu6i/tGEpbBPgXYTaFLKoIgoquB1XEIxVy1VO4p/ruRpqaytwZp7u0ig4
	A36cb7VNs8SbIE8Dlu9UOvImMwMLoePZYJtGpdTJjuSXkkpXoTA58vG6wbMO0Rxt
	LwwPWoaY7l4BRpeRv+aWPVNc56pS+xWi/KbX++1WfqcceDy7jLrkggpU3FovSX2A
	quJpMxvj+YDTOG6OHwG+XirJC+yX6NQHXKe71RawkE2PcttwoXnPCEObRH3TkAAv
	I+pTcQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd9hnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:38:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2057674a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793882332; x=1794487132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vGWXmg1itow1losLFRnU/f5R3wkwSa21eMKz4MdddA=;
        b=Bhg6gbKAzgjSlP7nWQca0FzkQTkYtfwITf////RZz4BJV2I7Gg7THAjlQg7bpda0fi
         rr2QDKQKbpQfl0GH83CyujfHfeSRE1ExAuUxs/39u0pXIgfjvy5yIInKxSQZAFEDRuRE
         ZN4IXWywjFW9A6wTvP0aaxM2Q/1DVsgFZf76QZP9aG8s9VlaxZqV8O+Vv5DDCHtMaUiC
         HfoGGg8mSkEWi4gAiqNHFwPTcTzN2zSgZ/pD1JNvwH4J++BVAmoRhhJqs2bZmYPWx4IG
         XebU8WQ4CVIKOj2DhoF9rT907ixMa2CKlrk0hsU5qDLs1eggoaItfbMhtu7fRvUwMdgZ
         Op/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882332; x=1794487132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vGWXmg1itow1losLFRnU/f5R3wkwSa21eMKz4MdddA=;
        b=lBULC+dsTgk6YYMU7CCGJCHbof/MrBoLyde1rT4qtX/HoVXDsH9TndULGPLEhs3aqd
         7/eMV+8nDeTN6u1bvb22vyCuSLtR0nySvfnQ1VQvg+eWPwa0tyXUqWAHFngVkFphaC94
         XuqJNUWNnIkWoVTzq8pbkIavQMrnkghlPkOcza7HZ8v2Ie24eauQ9VOd8RQSnoFeelC3
         LJ3Z+zraPb5pkmWKwdLGYTQI0SvzaoTJKsY+dWNmuCKrGbHc7YYv/bzgknOZxkRGEhUz
         2OuYh4GrBmgZQr3zBCSi/urP+WhCI0Kdfni7bsWBGvEmOO/er67AXy78/fPLkSicbGzR
         LaqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwASOZ1Lf63B1/7OV/0gVVOIk/5sxuIgoIWOt5C3pWklswESbpO18RQlO1tGIpzTklCxRz7U2JJERMoGwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TweIcO3tvfdyZefsgpHtsOEnKqD9q3igTfuMb3LTVz9FS7h/k
	2mM7q2GOhg3autvvlETnk3kLBeonBiDP5yGafgxLNNZtcje8EoPnfK13DMXTitf5B3hKKfx9p/e
	9pNG9a1NoOjvtJ5JA8pYkJrX12Pw30Yqpw3s9DKFFtiZ6YjXblI6g657MPb+XyuTIG10=
X-Gm-Gg: AYBFou3jO6tMcHr3w0JpsKPoaKXf+JZA0qunzMrnDx/aP52eZIUnBBaEC3Peh7iInNW
	R78/QVrppO3JvK1jo2V3Z+AMSINEy3JqXnJv/l0ELLbea1G5A3KpDE3DvjRbhenT84hyaCHOOnn
	5yKdSwoP4ZeyLiqP47ZzYOoqT4G1x1rT0e8Ye9cziNJWac0tLQ8nEADiaDF7jLdStlFp7X8p0l4
	ovnxIriZ/kMwlBtIO1SkzMjebLfakeYc0DsfSWyt0haaPc1KzlqwjRVohVlo4MhACfKTcmJnDAv
	Qd8OD22qcBg7+7hp7q//AuaxhRZxECtl5qRFotBVFhMmLUZpwxZtZknADyO3HNJcrMz/pUrwmC7
	PVR/RvWO/hZTXVSOm8C4SvsvhzDAIbRTj6HMzdrnzkVHLEjzv3w+ZpsTTpKBBi1srwftJbSSkba
	XMVVuOhGV8Onyz+VyBqxnmSqNGnTVzPQbmtQ1VKslWRsc=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b0a38a68dfmr3664185a91.59.1793882332097;
        Thu, 05 Nov 2026 04:38:52 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b0a38a68dfmr3664161a91.59.1793882331646;
        Thu, 05 Nov 2026 04:38:51 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312e45dsm4573531a91.3.2026.11.05.04.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:38:51 -0800 (PST)
Message-ID: <f3db86eb-9101-48b4-b552-c6ddb927a134@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 20:38:46 +0800
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
Subject: Re: [PATCH v2 1/2] cpufreq: Preserve global boost state on failed
 updates
To: Christian Loehle <christian.loehle@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, sumitg@nvidia.com,
        zhanjie9@hisilicon.com, superm1@kernel.org, zhangpengjie2@huawei.com,
        zhongqiu.han@oss.qualcomm.com
References: <20261105090311.1026648-1-christian.loehle@arm.com>
 <20261105090311.1026648-2-christian.loehle@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261105090311.1026648-2-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec78dd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=PbuyZ-RghgUmf8ib_JYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 7sdbKPPJ9PtB9XcGJUpyb_LRqP8xhu8h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MCBTYWx0ZWRfX7Y8ZOvH1Y2EQ
 /8H/bmxIqOtNLoKX7cBabrjsuuZIyFdTeqt02X6pHeMP2GGcmSk389dg1hAY85Coleq1IPBy8qq
 cK9lYioUIgE5bCPl8Qr72mrkvxuGAI4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MCBTYWx0ZWRfXyaqc0M9dc7SK
 gzQXPLqYVZrDgO0lfc/etDEKB5J22VqoeS0D1ufprDxvLCUgH6OFk+aR15rtof5uh+CCf+LcPUv
 18p6J0Q6FExc2Y8qf6G7/OS8+QVfwwhKY4VnlKhdT/Xixa68WcaPinISdxeTvk89GwRuIGAhe54
 BPuc9eqa1/ngpAbu7lI7XSi3QhBpMsC4h4M+d53j0AF6NH7t8Z02dbWSYapuO1reMP5bWlfP0v6
 bb3vKsimhsJPuBhFXIvKpxvcLjpZvKvk2+VXgP4k9sVCD5AXNa8cHZm+xk7h0sqvkI+lcCqzBjY
 6NGRfFMtJEqOdQ7DvKxtsrygvGdx8g5WJ11ReDmCaWz1MzSdcv5xBR7dU6O1eMozzw9V8Yt4V/P
 v1wH+8NDzwoMZFntocp0W9GxbQiETlNyKQsFf3yIiHGeQpWqWY+j0R/vAYZf/6CXxU57D+PV96C
 0y/HMHY8TQeAsMRBhYA==
X-Proofpoint-ORIG-GUID: 7sdbKPPJ9PtB9XcGJUpyb_LRqP8xhu8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050050

On 11/5/2026 5:03 PM, Christian Loehle wrote:
> cpufreq_boost_trigger_state() restores the opposite of the requested
> state when updating policy boost state fails. For example, a failed
> write of 0 when global boost is already disabled enables the global
> flag without enabling any policies.
> 
> Save the original global boost state and restore it on failure.
> 
> Fixes: 121baab7b88e ("cpufreq: Force sync policy boost with global boost on sysfs update")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> Reviewed-by: Pengjie Zhang <zhangpengjie2@huawei.com>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/cpufreq.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 54dde8419bdc..23a77f5524df 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2814,6 +2814,7 @@ static int cpufreq_boost_trigger_state(int state)
>   {
>   	struct cpufreq_policy *policy;
>   	unsigned long flags;
> +	bool boost_enabled;
>   	int ret = -EOPNOTSUPP;
>   
>   	/*
> @@ -2822,6 +2823,7 @@ static int cpufreq_boost_trigger_state(int state)
>   	 */
>   
>   	write_lock_irqsave(&cpufreq_driver_lock, flags);
> +	boost_enabled = cpufreq_driver->boost_enabled;
>   	cpufreq_driver->boost_enabled = state;
>   	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
>   
> @@ -2841,7 +2843,7 @@ static int cpufreq_boost_trigger_state(int state)
>   		return 0;
>   
>   	write_lock_irqsave(&cpufreq_driver_lock, flags);
> -	cpufreq_driver->boost_enabled = !state;
> +	cpufreq_driver->boost_enabled = boost_enabled;
>   	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
>   
>   	pr_err("%s: Cannot %s BOOST\n",


-- 
Thx and BRs,
Zhongqiu Han
