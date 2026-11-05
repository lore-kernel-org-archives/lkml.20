Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890904;
	b=fRTs7vVl+FOrBdPFMqHdhIs33cT6zXGkCGPFUvuHlCXiZdhfcFFLtWyFRveeyiHmIyRt
	 elV4PFxa0Z47D5nAJM9/OeEeiJ46IOD8WIwaTMEeNddyOKsApNUAPvBzlpsMF/53CtDQ0
	 85Sw+wJqgRP1hP5PJapiSHS8sLf6Mjzvz+A0x3g3pa+Zki3ZqybgNmkvlJakeBKS5izo5
	 N/Qpmi1O++YH0OE0JMBIeKYjeJU3cwsCj/HMg9H83VeOf2Kdl4RkBpYlVTl92+GZakAiG
	 tjjuuisMjFRpPgkbP2N8M9NreIcWYq1g2umwzeSOpUHh308MEQ+NrAL4Y+MUr9taMmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890904;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mMwNgiFqS/fjPiXuqloRBJtiMm6ycT8nN8GDDLAnBo4=;
	b=ahdug2kRfXIIeT4zCVG6+GCBrhprd53+Ptwmc0ORvahmdEJI7ssDNFm3XtItdsbXAc/B
	 f1ocqbFd0HL8G+tSqyGt3foyETgy1K5czdNNOlotcekp8zZBw9d7ngRGCpaVLROlTem4x
	 rsOAvNMXngFLS86kkxlCx8lmbHoLD69brevZ4Fk01MLBr2OO9/dEO5BQ5dqJa+x2FHBdn
	 IfwerbEP+kUlnC3iHVfsYGQIbuNI2PIAoMdVdmNmI4rAJdbUPzzDeBZt/EjFkQmV9Bkwq
	 EI6fcXzi1M76Jqhowdpwgqyn6W7q3NqIrslhovqeoaI51JivLwbiH7Aqfv1BRZvL9kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nrsmPyc3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYgr3pgN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FB4606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50FB4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nrsmPyc3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYgr3pgN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQIrx2004630
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMwNgiFqS/fjPiXuqloRBJtiMm6ycT8nN8GDDLAnBo4=; b=nrsmPyc3ojS7h+Nj
	2SkD8Y9QyeBJquijpVunHjntEzl4PE/3EkuPYx6C0KHzndFm20YcPdRPu7mhfv5Q
	hDRHtyXQaRQ5EetJ4qJbHdZGbHE4tZ/SBe/tFMt2fXxhScjpDr1+PoxBfl5+j40u
	Itu5zoVs5vxWuDfVZAk74ij3TIuKz1qjT8ld+5mJHqXwprvztdnAIIFT/IQ9qsFj
	jcAB7qimdnkny36ksZsb+RAmQII4loxan0Vql0ziDTvu0zerC8UY6FAH+Syoqqtw
	gLNlxsoWmX9oTUucpQnw1O3uRhX5q+AHxxGl8p/oDC4V6QfoiNeGurctuBrZwDJz
	d4p+Iw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1881-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:01:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so2960543a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793890903; x=1794495703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMwNgiFqS/fjPiXuqloRBJtiMm6ycT8nN8GDDLAnBo4=;
        b=hYgr3pgN4qVYIBRMB2dksoEgK1qOH7qf8liLvpcYEvJhVt3FiiE64KXuBRBJUy85vs
         hH5SikSZosKG9DXWsjyEd3mAhKidDreUJigC/TBvb5GjYKLHgu/YuZTGCp0sF46YGNSU
         BEwkSv+ckMJVKkPwTSEyMoQ4pArcCBZBnfqmT5CCIJvku/HZ6jolK9h9ANKihmFdx1It
         ULZbDVNy4Q0zzD6GrwE6qw6YXrcYNSWq5ha4+tzlV6PAxN/iuvWZSBHJzLIrPJNHIi45
         D3I58o0kJDKQYXKv1DMhXCObEQ2RD34nIaYYK1zkVLk62I4FFRT4xC5XeFvpstYvg09p
         iRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890903; x=1794495703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMwNgiFqS/fjPiXuqloRBJtiMm6ycT8nN8GDDLAnBo4=;
        b=ij7gI7FNuN58C0Ys7aCSmJys7edx3Cg5ka94QeTkIay2gExlt4cnS8GJP59fwkz2dV
         cgTA/4kP5nHfY66Fhm73y//kmtPx0zdmNSNpP7kOasXqTxCsQ2a7X8pY8b1zkyy54nI/
         Be/p/CJR6S2ipNyrAuSWqqfiWLhdRVdsIT5bBfgO4iQDqhUo5JU1fAO4DgzVx5AmB/YT
         JHBwEMG2yLpjeiSMFg9bOc5ujj3kWLGfQCpFXIyb9hjkPFOT+vfgVZ64EVVV4G73D8LH
         J1hVupmCDCGHhNXHb+6Cum9lwUYDDD414LGltWJjacRrXCITqGiYwG8CUao2wL3Dc0rU
         9gng==
X-Forwarded-Encrypted: i=1; AKwUvBwmiJGqgf5obYnCaBDJzUCMqOiW457p4k/WMuYk+EieasI0vxhSwf/eKCrYx/Y0WOuAS0nPM3dF+aDOMSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ABlun3Xt/MZFzXiPJhVC2TUloyJPYhh4GUzm1zmeXNBAiHBbR
	ssh4dSs+Em9QM9t/p8uJ/4VVEhjfAX8a5AeYzytcgOm2MDy/iYsKRqX6goMUKGZVOn/FtIw/jOi
	toweHdvYQebpdPZZhltJ68VBkdbX3wQTGvV3Prej94aqAvCigjAHfyKPhutwM3Hki6NU=
X-Gm-Gg: AYBFou0hg6eVcbsS/w1UXyczBT3gBZCkgKpDVhxmpiAMYxeQMGrOnRSomZHKzKtS5un
	pUV21jsgfnff24BLFesg4CIQ8aGawk8nfLDh/x95m+vxYS33+6EuGTKFJz/aap10euMGYauuQ6D
	DjNWaA7/JrGP/aLCscojFzsfIGADTWE482UCwsOaOHv61peJalWQtiHNnZ8KQQJIU/YIcdygAf8
	5yRNzNJsT+n7Z2PS/Vf9kinQU9RnUXpIwRmGhW5Ex0hselzfIJR45tTLM/25b7JNusGwgNImv2B
	4elgUHbyk4BI6wZ00hcWC11EWgYbuEU60CF3F6rFIufh/hcuYABJx8I4jXdK77RNd04sRxrv25D
	YmNxiLmSiJnSwyzLcqt7px2N6ojcbviSFrQrUiSLnuVhw38ZSv4uCkQo7m3aY7iwHfYZ1sGl5lP
	KjYjQgcoS5S7jUQ4wRmqK9xiF2XfUzoYhlbU6ccWMLpVWD
X-Received: by 2002:a17:90b:5808:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3ae895743ebmr16831853a91.3.1793890902804;
        Thu, 05 Nov 2026 07:01:42 -0800 (PST)
X-Received: by 2002:a17:90b:5808:b0:3ac:aa8d:19de with SMTP id 98e67ed59e1d1-3ae895743ebmr16831799a91.3.1793890902227;
        Thu, 05 Nov 2026 07:01:42 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0969b35c7sm4179157a91.3.2026.11.05.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:01:41 -0800 (PST)
Message-ID: <663e799b-9cb9-4e31-a6a4-5488d30ad14f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:01:38 +0800
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
To: Christian Loehle <christian.loehle@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, sumitg@nvidia.com,
        zhanjie9@hisilicon.com, superm1@kernel.org, zhangpengjie2@huawei.com,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261105090311.1026648-1-christian.loehle@arm.com>
 <20261105090311.1026648-3-christian.loehle@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261105090311.1026648-3-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1OSBTYWx0ZWRfX/Wz/l6N3V8D6
 pkpiiUJtZ53VvxVq2Q6SV3l60FcAy31PHd4Drl/IZnrFrA813uks6bn2J4eYgroyXfdZcPxMnrC
 FPYCL06cu6tITTeZ3jSTAeZTg/mmyLc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1OSBTYWx0ZWRfX53R1PCtAj2GL
 28Jj6dMrSqQSOLGyNGEish6x5k7Z7n+HgV/1X1Kc1yD/BOc4tAt+akuKiG1QN0mzYaVnu7p7RKY
 kCaK+lI5JQKDAqFOff+CtBBvJZqyB6ASrEi5/Na0HYA3/JwS/a4QUvFZjeb1OynDBM9KjYnb3JB
 +LNXkmK1L2CsMVvlOsSTmTbgJ4zAflitY9YnGGRjP6a5SeQao4ejVEKUUGBrYAQyHVj40dQCJqh
 LgLIkQsxQ1f6za6v2fvYZi0r1IrMfS0nOWUyLE5Wid7t7hxTvoDRrL8B7Idmn3bwuyVhPSW0G/Q
 kSZ6aUsM2dMX7JaYKSDzR9s8ln5bz+dJebMIj4lp4Aqwo4JKIqfYMv8j1C71Om17bgO5VaAbr+E
 1VhQykHEeo5LmB8OJEjhdz/QBcNgjtcqYrBZmFdUMBcHdzdsoR3M4Ywi+Fst/CveRPP3kbEvobr
 xWqYr9hCBNLUHJLmJow==
X-Proofpoint-ORIG-GUID: y1LmBVZXjNZoJ8yIzOqTGsOKn_K9q7D8
X-Proofpoint-GUID: y1LmBVZXjNZoJ8yIzOqTGsOKn_K9q7D8
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec9a57 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=lRSh-j1tXNIazO6Y0zgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050059

On 11/5/2026 5:03 PM, Christian Loehle wrote:
> Serialize concurrent global boost sysfs writes with a mutex.
> 
> Fixes: 6f19efc0a1ca ("cpufreq: Add boost frequency support in core")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> Reviewed-by: Pengjie Zhang <zhangpengjie2@huawei.com>

The change looks good to me. It might be worth expanding the commit
message a little to describe the race between concurrent global boost
sysfs writes and why serialization is needed.

With that minor comment:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/cpufreq/cpufreq.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 23a77f5524df..d95c849f79c5 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2810,6 +2810,8 @@ int cpufreq_boost_set_sw(struct cpufreq_policy *policy, int state)
>   }
>   EXPORT_SYMBOL_GPL(cpufreq_boost_set_sw);
>   
> +static DEFINE_MUTEX(cpufreq_boost_mutex);
> +
>   static int cpufreq_boost_trigger_state(int state)
>   {
>   	struct cpufreq_policy *policy;
> @@ -2817,6 +2819,8 @@ static int cpufreq_boost_trigger_state(int state)
>   	bool boost_enabled;
>   	int ret = -EOPNOTSUPP;
>   
> +	guard(mutex)(&cpufreq_boost_mutex);
> +
>   	/*
>   	 * Don't compare 'cpufreq_driver->boost_enabled' with 'state' here to
>   	 * make sure all policies are in sync with global boost flag.


-- 
Thx and BRs,
Zhongqiu Han
