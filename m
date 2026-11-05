Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868109;
	b=yLNGglULTGPWM5+PliFcVFAQ/aj2oNBv5c255ib5UDo5IumUs1G9/A3+mbwco5p4VdEZ
	 WOlql0YzDod5v5a6qt+o3AhGQKlFKiO3NgNCHzd15UR+ZtxhnSVVdFnB5JNsY5PaJ2Rtr
	 vOWN8hRdD5tvh605u1eZuAYjKtdxoz6FiEtyHEKi7hSdFzFqeXbpXh6OvwaCGb4V10pRu
	 kx6U41Guu46Jbo/t803IZHPxG2hRYk3XVWP23PQAkxL3IdXySXGyosX9CjXea08M0GW+5
	 TLFk8jjjENhSCp9E5jPJqIlIDeheHVbrRhDpdzeaIQVq6vtXxKuaV/v6E1oiVKqKBAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m3UKyFsZezrC0ZQ+2C1mCsyxnFD+fA2IDV8sxtO8Aik=;
	b=ZueNE80Et/cRH6HhsZhRSK3r3GnlBcvFHFvwYYgmu1K90KAi7VzHac2dCucjagrgixoF
	 7ZYWr3tVedJn6UiY1gzkv0nypZL7z10pzFhP/CWc+2+Bk4Sq4EITPWpO3HruBfvBqxUFp
	 j3CtePyB8wk9h4EhsqpFlL6zajLrtAKL9bSfa9+wY97MOiJAnFS7x4hdsvB+d2Iy27JYm
	 ZvBNUKdT1Fto3xeJQRJ9uK5a0Dg8EH0xy9VY0zPrhSQCYufYokDHie5rZG1E7h/1tdiZ7
	 d27ylguoGDK8DiicE3L0BMpFVMbq4TjvG2/7NdOJ6AVw4TdLjn6GSUgp8jsHmtm4f0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5cEaOjk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cbeBoS2/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57BE606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5cEaOjk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cbeBoS2/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UDhw942036
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3UKyFsZezrC0ZQ+2C1mCsyxnFD+fA2IDV8sxtO8Aik=; b=A5cEaOjkZG6jeKoW
	iUiHCSTWhVprmAbUmI3yFaJ6LX38TxM9gQ/VzWGCt1sQgNvTvwvWoN7KG0kpwp/m
	trV5+jGDk7X69utliI84CwAx6EJbSsNGZYjavXf+O5ssfGsr5+VslBzFYpaU2TVR
	9DRxhVukkzqwB9CM2+qoH43D3Bu0JBgp5kZhxjFB3sh6fmoSZmD50iOYgtmEGgDT
	aaHYPkog0C2GwpiKx/spI7TrQYX5Nqo70eT758t2DQva8jrcc6OXVac61AkIJq9E
	QmSgDc8Q5c/zrJUBrbrdUoYuyo8CQPS57cmVnCTwR1zFsfxQFdomVdjxjN78M4Jv
	BuiHmg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj41tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:41:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e942b1cc86so19401475ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868107; x=1794472907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3UKyFsZezrC0ZQ+2C1mCsyxnFD+fA2IDV8sxtO8Aik=;
        b=cbeBoS2/yZ1g9JbmZFj98awnPr8UaNlHWXc9YXhamUt6ivka0u3MGmlInJjKZ10+eC
         42LRaBqX0x/41ih33KFeS0RGAvB6pXhfVUme4CaUTerKJNPkMCMej4BGTaWWlbEuSfW0
         lRXX+i6D8Gty7GiSGkHU7VRLrBUNLdyYWjHYqaIZmZrgPqdva33P0lumiuL1laNnIvj9
         E22jCuHF5dqv26T/PSWdSMi+xTxnlO3TRODicOMznl0KFmspGQsBLv1EmfRWoMYppYjr
         dwORHVwdlMRTRgT94RwyMPaCpjP4HPFgHD+Qr93d4ntGUwN+DgiYAb+j7PR6E4s09MA8
         Fv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868107; x=1794472907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3UKyFsZezrC0ZQ+2C1mCsyxnFD+fA2IDV8sxtO8Aik=;
        b=xV6Hyhwr2MV0n3ZjefkZI6fvAO3iaSmMNxe0ABXqho2cwO8qyY/3+JGgtHaSMwemGk
         pIyfSp4FQXMOmr1M2NhCaJDWnrUrdRV3HHYPbPHrcGPlz9pZuI3oMcsEhRFHSFpH+ZC+
         YDpq+OsS9964+XwxRYEqDtnKwerM/0Ynn1f0h0XNlFIknR0Pay9iE2/zG1Ae0nBPw3ul
         M/pNXJWSE3ITM20GyYCqMDzKqbmIbqIjjdlSN5L3FJhzgO3dexcTWv8wgO/F9/D4xeL3
         WLxv0i0lWdCZkfugeR7yj0LJ4tg3BoPMH8WlNs2EI94dA9NguYsk8x67H/+4Zs0tCgEk
         hl4A==
X-Forwarded-Encrypted: i=1; AKwUvBynjEa2rHlLCZdMp+S76bv8OgaTSp0azJxnOQywrnzozUbCRl6ixC6jDi/ibv7GJD/NL5IUxxfKtz9Q3LM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CZFTf0euPKQ9lGNwMswkHOlHg7j39TeixoSVoH9toEdWw/UXi
	Nka74+YOMQFKJLTF7zIS3BgVYD3qrndOmLZwO8bCglCHytUjHYtCH0G0FbwhhFNPHQEn6HTPEnb
	f2zo5zsGrVbnY6rj3tJHYz/x6cJGFschdDC3HE0aTDi+kGPCLuYCs9a4e9SP9RqRUyDk=
X-Gm-Gg: AYBFou2PjGafuA+ww8vaj/pdS1GyjjW3RCzZ618gnPL62eLpI4yzAFBCeBoVHfQ7HiH
	1V3PzcBREA1MBWI+/cCKOEVYZV6f35jilQLBDlxvDLWPSua+0awv7Kiyf0plj8tka6vmbiZ7R27
	wCFhCk9kSP60KglVONyrEiHzzsR+gDm1v1Ma+VL7JFGP4xSruM94bn1Zz27sO3AQM3jTPrlJNmQ
	iS4x0ImhDg9DtvdVGRaTtYFN8z3INHEN+YCukN9nOLLh8pqnfTgFlE61UlKIkEPIU6LBnsN5Ko4
	TcxN+x8VdaJgTXCObIGGgCz/nyjLFc5qwSpnxe5XX9r0oJB9dH7OQPJBzZSshjsVEFK93FnooIG
	FUI2A3X7BB/Xp9set5N8wXX9MhrN36HDbOD32xZ/qCNyzcPAQPAl8NCF1qFG4xrP+gMXcPPZAm0
	5I/NookKBynZ0nT00Jg7eERoLAYD1ZQh6ZexTMid5uEKFp
X-Received: by 2002:a17:90b:1a85:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae89736172mr15307618a91.21.1793868107150;
        Thu, 05 Nov 2026 00:41:47 -0800 (PST)
X-Received: by 2002:a17:90b:1a85:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae89736172mr15307600a91.21.1793868106642;
        Thu, 05 Nov 2026 00:41:46 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312e45dsm3486678a91.3.2026.11.05.00.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:41:46 -0800 (PST)
Message-ID: <2291138c-0e2b-4625-b982-8d72a43c23be@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:41:41 +0800
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
Subject: Re: [PATCH] cpufreq: Preserve global boost state on failed updates
To: Christian Loehle <christian.loehle@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.gupta@nvidia.com, zhanjie9@hisilicon.com, superm1@kernel.org,
        zhangpengjie2@huawei.com, zhongqiu.han@oss.qualcomm.com
References: <20261104161657.546370-1-christian.loehle@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261104161657.546370-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX+gBkRDIW/J2w
 yOVGJr6AzcRAjMfugt1HzkL9tWPqPM+JxB7XtRMMOBpGJ91BNBQSpHgcIp3ujg1zmu12kKIEI9a
 l9YkJ92lCJe9ZCs9DTpkM6JylszVvT2oJUT2PPiGr0WP9R/guHWeJdgbW8Pwpnv8Mo7V9g2NIyQ
 GsdQvhfOQLBgxB2thb1M3VSugo3GsdI9RmteFLh6k8wLj33Ko3DJKPD3WEE9HiayWncObnJNCvq
 q2lgC9Phcm1YCnM17in9tTlb3Y9Tqe/XoXEWK8IzhS8b2Kllk3eL0PKHckO096A6Is+VSfAzeWD
 ohkO9PkgCVWR/O/5KVSoocVebQBoASnQfViAAwMaKp8gh/MYbt6MjHHic6HoFNtZtECyVDRvy84
 aLwovVIyChALSeNVNhWxcJCY+CLtBQ7k4BrPJ96dFGM4yEg9ElKy4mFwPL0QrvwrWhA6j3ixMsR
 moA+8ZxievocYh92Vgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfXxcDTzVTGL55+
 a4xeyPMX/fVyJA9MV9SIA9saATyTn6pDIeX09uKzx8ylaAoly22B4VpI45TvngEtK8Ek7ISHI1T
 45fovxPmz+J0FiGu1aJk9wNTGXWxnZk=
X-Proofpoint-ORIG-GUID: 4iPQ2R1AF0mzvjkeYoBk0m0ymYXKRCIg
X-Proofpoint-GUID: 4iPQ2R1AF0mzvjkeYoBk0m0ymYXKRCIg
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec414b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=pplq8beJeo5HEFBEY2cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050034

On 11/5/2026 12:16 AM, Christian Loehle wrote:
> cpufreq_boost_trigger_state() restores the opposite of the requested
> state when updating policy boost state fails. For example, a failed
> write of 0 when global boost is already disabled enables the global
> flag without enabling any policies.
> 
> Save the original global boost state using a mutex and restore it on
> failure.
> 
> Fixes: 121baab7b88e ("cpufreq: Force sync policy boost with global boost on sysfs update")
> Fixes: 6f19efc0a1ca ("cpufreq: Add boost frequency support in core")

It seems the only appropriate Fixes tag here is 121baab7b88e ("cpufreq:
Force sync policy boost with global boost on sysfs update"). Commit
6f19efc0a1ca ("cpufreq: Add boost frequency support in core") did not
have this issue, since it returned early when the state was unchanged:

     if (cpufreq_driver->boost_enabled == state)
         return 0;

so restoring "!state" on failure was equivalent to restoring the old
value. 121baab7b88e removed that check, which is what introduced the
bug.

Also, is the new mutex meant to address a separate race between
concurrent sysfs writers? If so, it would be good to mention that in the
commit message or using separate patch?

> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
> On a platform without boost_supported the unfixed behaviour is:
> # cat /sys/devices/system/cpu/cpufreq/boost
> 0
> # echo 1 > /sys/devices/system/cpu/cpufreq/boost
> echo: write error: invalid argument
> # cat /sys/devices/system/cpu/cpufreq/boost
> 0
> # echo 0 > /sys/devices/system/cpu/cpufreq/boost
> echo: write error: invalid argument
> # cat /sys/devices/system/cpu/cpufreq/boost
> 1
> 
>   drivers/cpufreq/cpufreq.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 54dde8419bdc..d95c849f79c5 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2810,18 +2810,24 @@ int cpufreq_boost_set_sw(struct cpufreq_policy *policy, int state)
>   }
>   EXPORT_SYMBOL_GPL(cpufreq_boost_set_sw);
>   
> +static DEFINE_MUTEX(cpufreq_boost_mutex);
> +
>   static int cpufreq_boost_trigger_state(int state)
>   {
>   	struct cpufreq_policy *policy;
>   	unsigned long flags;
> +	bool boost_enabled;
>   	int ret = -EOPNOTSUPP;
>   
> +	guard(mutex)(&cpufreq_boost_mutex);
> +
>   	/*
>   	 * Don't compare 'cpufreq_driver->boost_enabled' with 'state' here to
>   	 * make sure all policies are in sync with global boost flag.
>   	 */
>   
>   	write_lock_irqsave(&cpufreq_driver_lock, flags);
> +	boost_enabled = cpufreq_driver->boost_enabled;
>   	cpufreq_driver->boost_enabled = state;
>   	write_unlock_irqrestore(&cpufreq_driver_lock, flags);
>   
> @@ -2841,7 +2847,7 @@ static int cpufreq_boost_trigger_state(int state)
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
