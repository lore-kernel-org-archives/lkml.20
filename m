Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8973E49DD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051180; cv=none; b=OTgek692QHOjFF47B0K7Lv7R0djKP9FxjgQHSJj/wHB6mgkES9bxTupf8qfq5RFoGAQ85KF0nhcCed5JrE26XHOW2lzqcy3LkkCduWzPDiFUu4a46A8L7HCW7kXWzvRlBsPuwV3k9ccoTcfdfglGmKEgkEW/Df8b+hKZCYzVXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051180; c=relaxed/simple;
	bh=5x6DgSrKV2/hlp0HHFPmrZvte+Zh2z1LZIewo8/NzLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQYHSc4sOTsklMiAOwrrWpB6VAmu/qeTEj+3ShxUCKkcuD/D0FFtbs3yJuDS1F7qDFNQnKhq4M+rj4Rx0PpOIKl9bRx6nflwFg4CFA/1r4HLC8NLwjsu5gKwNhSxeYaL5LPrCHtMFc6wglL2M2CtTyP0wjEnX71jOEqa6elQwe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akvYb8nc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pooj9zLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akvYb8nc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pooj9zLd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00D4U3840475
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=; b=akvYb8nc/xB1yOJa
	RjvETW+LBi7P8iCn3VFoiP8AvvD7mWrissADOaqLA4VjTzsTYQWaPICW3fOJ0sQS
	noBEAIXzEwIpP7oksvnCYdzASejBwMRDjYXkiTLGqy3OGe2VAGQoFJbM2ag2m6mi
	6e8SsLgdPMviNJbHzF7kmRkaA6wcrJ2Vtp8Ke5hTawahuLTUJ9bq9odf0hYXYESc
	k2NRcpLtM+o6odpMukwVFgS0rBDZTyvfcIjaDqEdwzKEvo7+f9Pkve8sRX94DUdL
	xRnTaOe/zHcJOVONzDD1f9vz8GVpQIWV8wcHpPDQuxYd9o/ckW2Vjzv+GKZ6ZAG5
	nE/e+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8v525j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:26:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d94a158dc8so65776465ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051177; x=1790655977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=;
        b=Pooj9zLdVYUY87fVH6aOV2aiM4MAef8LLC8MmpYjN9UJs7IDsvujEQ4dYf0ZhkLvdI
         WNV8pDBrOY1xA5Gn5kC8cB9shuu5LjjXNaR6CVA9VrB6hJbCmvdeCeUhJAL43Tiu8UMd
         y84a2ab4/C4uYmJ0gqcFRPVJIj7TYYQ7ncWwzSU9KlzW/8vSvGgXVAJb/eKSwhruGNT6
         HB/VdxSxfp2hUVbNrNdmunbIOfg5+NOz4+0YSVMgVeesCYzaImaTBRIOoUmU5VtGcn5J
         hRCs9EYJ6R85mRL6iaeL5jEz2UeQeDD37yDqFwOT5kYAMn2M9DwtSVHHl01jxev52ieo
         yQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051177; x=1790655977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REcT7GpoJk/zgvrjat3xAPdg5wUsQTnHiK/QOr1Gnhs=;
        b=DB6/aP0e4iUecfR9Rg2nT5Hvi3oG336MwRMYu26FyXqv2Q/0o/ckiKeJzBMFHFj/lj
         Sir08P6Viml6zVrx25Cnyb27VHGndwYQA1pEgrJdMYkzrO7g4E50QvJBvRUxpxDYCM8Y
         i+2Kg1Ncnal9Pn4yLjZrRQtz1Ag5Vsf7K1Lop93I573uLdEAEsIgF6yh/iNxRs+Fgh7/
         Wfi9a2gLRXgWQNHRdcUQLuY1MGwT1sLRshV1YuxnLVpqBod/qQdt7VSJR0+24/9hJN8q
         9jJSjsRJ6/34C0x835OMI7HpSpHDV9PyDorA76eFZJEyfijRWeb5mrxHQlAygBywuaMB
         il0g==
X-Forwarded-Encrypted: i=1; AKwUvBwSqevbj2mtbglzjwm3NHbMfy4owyVAZJrmVdjzTKalTORv/AbAzteeMC8QiEdSKvOw4O2MIEd6rj6Z5WA=@vger.kernel.org
X-Gm-Message-State: AFuF++kmb/VjI+/+TiVzoOAWgVJt5EyZw6hLMIkeUNC95glx6qURqlfz
	DnehlymLDDELOt66T5E6PmiWXOrt4Tl2TqIe2hlAgyusJdrtoNKfeCtXXExIcNZWqiNRSnp4mov
	P3spSCp/5l3wBfRWLzh5Bk1swCGwuhY6gJSYBZpIJt7W7tjPVsQGCLcswedSpQcAabuU=
X-Gm-Gg: AYBFou2EiAK5ZTZoNf1bq8HZ8/NsQhI2Qk3WQfyfd4f4ryHm6FYk5i2TinIu4ZNwOwL
	mQxOaPnp6XCCeXKdx8w0wvgWK0Tx921n5ex4BShMUvQv7Mm0MSIzL8g0zHWVCZq2Lp+yDXiEfrt
	mJMA37BW8IwwA4rC723lMSg6qmgTgLbwfRnAD47DnGg36t5LXzgjlsgpxG8L3lvpx2ounXA4T6E
	ORjIMtOm0p7ekAzL8obiRV4qULvUB9hxZ6k2EydrMCBdIW+nLOyqP8R9vsIsebuoSI5vw8E7av+
	bu8iiupTyeVxJODrw8SVfeLHwD8VX9PtRFaFwEZtjjpYUdLSOxitJ9DyGTQug+3mN1yZpL0NnrQ
	NssRCZtnp0DXzd7z4NeqIARjZxiJq8sUDlBJz+UEXbQkM2nhlGWLCHUTza3n2yBT3R3cddZ+F
X-Received: by 2002:a17:903:19e4:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2ddb1ba35aemr181420875ad.22.1790051177241;
        Mon, 21 Sep 2026 21:26:17 -0700 (PDT)
X-Received: by 2002:a17:903:19e4:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2ddb1ba35aemr181420605ad.22.1790051176726;
        Mon, 21 Sep 2026 21:26:16 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0308ccsm2592795ad.42.2026.09.21.21.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 21:26:15 -0700 (PDT)
Message-ID: <641a111f-ad07-4a40-9fcc-6af2f7f98c9b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:26:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: scmi: publish perf_ops with release semantics
To: jaidevshastri@vt.edu, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260921-mb-scmi-cpufreq-v1-1-934da6400a26@vt.edu>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260921-mb-scmi-cpufreq-v1-1-934da6400a26@vt.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RITQhVtnDopMVlGwx2vUdmNfFqRLa2Vd
X-Authority-Analysis: v=2.4 cv=B+0sQ+tM c=1 sm=1 tr=0 ts=6ab2036a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cw3u0DvnAL9Q_YTEX8oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MCBTYWx0ZWRfX/dZymsiR0bFU
 5bdF2iSC+18tX9sfyIwjXfxevTygCHc5uAeZmUKlye8sqYSSvgXn/JUu5LUQYEUn4lbMx1yFPIw
 IuReD+xe9rFjKx/i+Y2r4ooUYgSLPPw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MCBTYWx0ZWRfX9tmpxK+NCLgL
 IwIwMMJ04+KLiJlJ9/8jgzhBZb0jTHXI5f+XkWbdvuhkj/tYi9kVxrySh9XOfsc8P6wmxyDFugJ
 dYel7WHlrac/W4zeE8IOQYiReZS7mNJQ+tvxpHx+sNmsHJ29N4WnpeAfXRfMTkVhFmmbHOTzpZn
 2NJDL1zXnX62MRbNib9WyKZ16SUNTcoxXN5KMuQrAxQct/Z7ql2F0CKZbtRApTJH5WzRkufiHiH
 MuqpylnYqSJ2SHbAXE950enjZya7S4NC47925Fxwz9sIHqXP6HXAzfYuy67xkxMnaS6HZIHNLEw
 CQPemlB1RZEHVdJ4ehe1/v7Q26BDtCaWlbhBbFbhoXsqLVdBAD2G/pxv7z356YDMY8BxE3Tav0f
 OCL049xdEnXVDKWkNIyX+Z+vT/dHcGF/h0I0gzy9zM/vbg/i8iyhBjSYjhOxBsIFwXqfHjqiK6F
 /oyd6n9BWOKw/YrV7Cg==
X-Proofpoint-ORIG-GUID: RITQhVtnDopMVlGwx2vUdmNfFqRLa2Vd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220060

Hi Jaidev,

On 9/22/2026 9:19 AM, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> scmi_cpufreq_probe() stores the SCMI performance protocol ops pointer to
> the file-scope perf_ops with a plain store and then registers the
> cpufreq driver. The callbacks read perf_ops with plain loads, starting
> with scmi_cpufreq_init() on whichever CPU brings up a policy.

This doesn't appear to be a real issue, similar to the case discussed in

https://lore.kernel.org/all/495a47a3-ac6d-4002-abe3-23b85b2f2034@oss.qualcomm.com/

> 
> Keep the pointer in a local, publish it with smp_store_release() and
> read it with smp_load_acquire() in scmi_cpufreq_init(), the first
> callback invoked for a policy.
> 
> Found with MBCheck, a static herd7-based memory consistency checker.
> 
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>   drivers/cpufreq/scmi-cpufreq.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index 4edb4f7a8..c394f63cc 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -197,6 +197,8 @@ static int scmi_limit_notify_cb(struct notifier_block *nb, unsigned long event,
>   
>   static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   {
> +	/* Pairs with the smp_store_release() in scmi_cpufreq_probe(). */
> +	const struct scmi_perf_proto_ops *ops = smp_load_acquire(&perf_ops);
>   	int ret, nr_opp, domain;
>   	unsigned int latency;
>   	struct device *cpu_dev;
> @@ -252,7 +254,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   	  */
>   	nr_opp = dev_pm_opp_get_opp_count(cpu_dev);
>   	if (nr_opp <= 0) {
> -		ret = perf_ops->device_opps_add(ph, cpu_dev, domain);
> +		ret = ops->device_opps_add(ph, cpu_dev, domain);
>   		if (ret) {
>   			dev_warn(cpu_dev, "failed to add opps to the device\n");
>   			goto out_free_cpumask;
> @@ -293,14 +295,14 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>   	/* SCMI allows DVFS request for any domain from any CPU */
>   	policy->dvfs_possible_from_any_cpu = true;
>   
> -	latency = perf_ops->transition_latency_get(ph, domain);
> +	latency = ops->transition_latency_get(ph, domain);
>   	if (!latency)
>   		latency = CPUFREQ_DEFAULT_TRANSITION_LATENCY_NS;
>   
>   	policy->cpuinfo.transition_latency = latency;
>   
>   	policy->fast_switch_possible =
> -		perf_ops->fast_switch_possible(ph, domain);
> +		ops->fast_switch_possible(ph, domain);
>   
>   	policy->transition_delay_us =
>   		scmi_get_rate_limit(domain, policy->fast_switch_possible);
> @@ -443,6 +445,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>   	int ret;
>   	struct device *dev = &sdev->dev;
>   	const struct scmi_handle *handle;
> +	const struct scmi_perf_proto_ops *ops;
>   
>   	handle = sdev->handle;
>   
> @@ -451,9 +454,15 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
>   
>   	scmi_cpufreq_driver.driver_data = sdev;
>   
> -	perf_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
> -	if (IS_ERR(perf_ops))
> -		return PTR_ERR(perf_ops);
> +	ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PERF, &ph);
> +	if (IS_ERR(ops))
> +		return PTR_ERR(ops);
> +	/*
> +	 * The cpufreq callbacks read perf_ops after cpufreq_register_driver()
> +	 * below. Publish it with release semantics so that ph and the ops are
> +	 * visible together.
> +	 */
> +	smp_store_release(&perf_ops, ops);
>   
>   #ifdef CONFIG_COMMON_CLK
>   	/* dummy clock provider as needed by OPP if clocks property is used */
> 
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-scmi-cpufreq-cabfeb548027
> 
> Best regards,
> --
> Jaidev Shastri <jaidevshastri@vt.edu>
> 
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
