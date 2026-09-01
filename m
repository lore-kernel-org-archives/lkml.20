Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94B43B7772
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268067; cv=none; b=S3z41MU5w3hKUQ5fZLdBk+qE2AGklrx+TJ5rbf0ThOA5NDVZYO/pHC+UQ2hH1P1T1Nwf6oLPBL7HA0ymMkXG1OlFHLZTpQItvmnxgmX5/pjli9rtfLcdIq00UJ4jqN/C/X+hOSQQQ3ysiLctn+AwSW26RZDL2ZCGh6LY1F7oNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268067; c=relaxed/simple;
	bh=ACq8O6kTrFDyWuzB9wUnBK2bCVmEEPua6raZFlQp/mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRSdXmZ4Ax8shR7QoM+JtrW7w7E5M7dXva/ee2KnbYHl3577N1bhhYB4bWfpQwarLDQobaSaQ2pnJCPfuCiHPEnyJbOWwfrcTgWOpB0Gc5WqzWbPa/3Zjud+E1QJ69A/+MgSBSKdSBSDBvoOl0M8wGkig7+J8s28isV89k27atY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PW5BiVvA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZCJqjBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PW5BiVvA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZCJqjBs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcBd2406422
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fu/qT081YpZrS/2ylCLv9AxqLXBYVMrV8WDC+n6KfHY=; b=PW5BiVvApoKbw9DK
	6y42INfOHSiEO8MVV8KcajnkDGwMGKy26Jufms5NF6j6VyWxpEmR8PAY6Fk4sO0i
	9ENz5JuYYIR9XMvFXbzSHyUyJj+JYH+tpraWuO9No2lmpA2dh+XwqwjJcyHpYjjU
	HcjTMLgdC7ynLTzeqavkj4Mn0cLhNCMc48zUFPNW/ng/Tg7t9o/BWXWAYzboYjD1
	oKN53pjUCKz9FhXITLa3lLD8C/1hKsJ7URnw2n0XgkDTR6SBT0+iSkGi1AFVTSpZ
	IQso4AHA3qMNb44hJfw5YrhK8deC+SpeEUlfxZQwqXpB7UEXb6GTKlktjjDHYZup
	N3uOwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2e7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:07:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso5282339a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268064; x=1788872864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fu/qT081YpZrS/2ylCLv9AxqLXBYVMrV8WDC+n6KfHY=;
        b=gZCJqjBs5pCjBgV9WgOuGg3k51HI9MhfdcwBKO7VY4BdLrENKRMqxUV5LCeZ+NrW9l
         mHa3Tz8W1OWxYX+aUqHjLntPQXbQ50JerYgY/wr5ZbiSKuifxnUqmLVccow5+c2g+/9W
         ZpNGdrSQaOj422RoXBE/bYTx+ucyJQy/+sVzq1lqTTunqyAXlw4AVj+O9lXENhOfUgVT
         933ZrAJVG8WbXdljiNrvS0wyCs501mZAFdv1R50Nb9pz54UBOC7EVqMKlDsESMfafhK+
         SmOfSZMR8Q1Iqa0CjuG/CITLBYotzz0giElNAqLUId6zn5zUma5KHqQKzl1lumlI3Sr0
         6XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268064; x=1788872864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fu/qT081YpZrS/2ylCLv9AxqLXBYVMrV8WDC+n6KfHY=;
        b=RmV5bLoNPqjbfkBmtSQWsmYlEudOSVYAgMK2vEUSxPsupw6y6Qu6tNAyCWgCYKy4Qj
         4Wgnhhc+zJPi6MhPaUgy5nNfSbKxVq9Ej4evk7rHQEiu4J4F/9GjRdFe4998ZuP8j1g7
         Rxzt0hDGFL13oMuTW8dWxay2NBvgvz1T7ehotN60Rtfpk9WC/bpXdyN7lLfLFCC+bvwJ
         hpFmUmmcHLpQlMNUT9pDK6yo04e0b6vI2MZTvyb1CLV4ZNF7wuD+7A/FHESgk2olsx02
         DSGP7PFoJBUoZA1aqhEPSF6dglYfyJLoibqkwGlK3vt2xVweOJ4GRYlghrEPe4Do/QZ8
         Auzw==
X-Forwarded-Encrypted: i=1; AKwUvBx0eiv1SMJ9p/SX/TJxY2H8IKK3SlC/GLHDzavcW54RTrHTbwMODiWc763vWMLalO+r+dvj2tdXTUvKO9o=@vger.kernel.org
X-Gm-Message-State: AFuF++mMy00XkRPEMksgfixMSbXe198d1eKEtCloa01Ayp7l9pG5x15P
	MmKBcyTKW/09oGHRufc4FXEmQfoTBOGATM324EF0t2kgBnCiZy57SsMd0R95xT+zdn28ZHwNl08
	9F6Mi+S1O4a7UT63sKJCL6RyYRW0VX/F2WQgi2tojtcicJsD1vjawyE/Byv37mdkbPG5M2OSiwn
	J52A==
X-Gm-Gg: AYBFou0wxawwiZ2PW/cAJbgxrBaQS/2AJK8KQAzArxxLdOF/FEp9ZqJAIOv1FlXifJY
	5/IbFneLERYKc+uHdD3OhkgXRb1+XxD7aQseWdOKSq4D5jVk6qbVXUqpgY4DugMl7r9XIWC541N
	Vk04X1rwZZGrhUw+4sHa/KZHMlDNk9IF0K+MKtSC6UvXhu5zRVqTueX1mkTBmfrGLpRds/QDLdy
	AISc8aQGltQeIhUTTFpM4CchSahL6Y248TrSiL46GTLYvGXh7N4Wkm010jjy+8KH98MTssd/e1p
	VsnPvw2DqAqS/jYA6ZtWA8k1vmdQ0abnjuZ7eRfjJnp6HCuRus+zXQGm55agnsqWU2lovT+Zije
	zMSLZ6sPMEkNqdtU6jTpVzqUbcEwEtTB26LVNG25mAFyvfnhiZHLMRGeLKjMAf17y+msclVKz
X-Received: by 2002:a17:90b:53d0:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-396d0ec7afemr51415863a91.5.1788268063271;
        Tue, 01 Sep 2026 06:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:53d0:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-396d0ec7afemr51415272a91.5.1788268060923;
        Tue, 01 Sep 2026 06:07:40 -0700 (PDT)
Received: from [10.133.33.203] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d7759bd1sm6750547a91.3.2026.09.01.06.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:07:40 -0700 (PDT)
Message-ID: <36d2a431-a1c3-478e-a001-936d25bcb9e1@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 21:07:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpufreq: initialize policy rwsem before sysfs
 publication
To: Runyu Xiao <runyu.xiao@seu.edu.cn>,
        "Rafael J . Wysocki"
 <rafael@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Jianhao Xu <jianhao.xu@seu.edu.cn>, zhongqiu.han@oss.qualcomm.com
References: <20260830155301.2713780-1-runyu.xiao@seu.edu.cn>
 <20260901121950.3279176-1-runyu.xiao@seu.edu.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260901121950.3279176-1-runyu.xiao@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96ce20 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FxTtqrLrjwncoYGlF1wA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNiBTYWx0ZWRfX2KahgR3RLcQI
 c+Blgip1yUMO67KkPmQsgVkv0hti7FCdCVSDkZ5Iv817tzqTUnaQ6ObitkEo3xoBYNDmuRq3YR2
 HvJFOoJsz4JNetyfc9YEwpV3ey/hBe3ZM6V+fl7oHPph6FWEcnwYUPga3Yf3Who7enggaqRpRHG
 91UUq9VgewG3orj0b4qPZpJ08qyYl2Kkr3AifnQLEfOn26M0MbAoUTR5l3GPq8aqgKrwU1Evx61
 y5PGPMB/odEKWEG5mrnseDi7BMY9bnoLEH9gdCuZJcSEwjpjFh1P754OjNj9LBCmexLwyAu4cGX
 oxUEOUDFrRBYGxoCc8dSA+yUTA/EH/h2NCT72hTqrpTkBiLEcGPLkr131rMwBdTMs4MUbkJOJKd
 crNYy8/wybsrmQcZPVvTkeJlFmqhKYrxw15U2AHuATxtcc0ROdCnqYW8Rb+sETfKueOXj/Ek2Es
 s2O08qyVPVRBS1P9fSw==
X-Proofpoint-GUID: RIulDdGFMNcu9MZb0FhTtVZY9Qf1GTx_
X-Proofpoint-ORIG-GUID: RIulDdGFMNcu9MZb0FhTtVZY9Qf1GTx_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNiBTYWx0ZWRfXwcyTsmV3d6ak
 U0lfXiPpe/CUSkWK1WakVUonVBZO5UpVZK1qGbozTWIBzohYiwlOqHvzJclmWSHZWS26ZXtD0Av
 8YjmBQqVZc8jtIExTKL6BQR4Wqb5nNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010116

On 9/1/2026 8:19 PM, Runyu Xiao wrote:
> cpufreq_policy_alloc() initializes policy->rwsem after
> kobject_init_and_add() has created the policy sysfs directory and its
> default attributes. A sysfs access can therefore reach a policy callback
> before the semaphore has been initialized.
> 
> Initialize policy->rwsem before publishing the policy kobject so sysfs
> callbacks always see an initialized semaphore.
> 
> Fixes: 2fc3384dc75b ("cpufreq: Initialize policy->kobj while allocating policy")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260830155301.2713780-1-runyu.xiao@seu.edu.cn/

Nit: It points to V1 Link, but should be okay according by https://
docs.kernel.org/process/submitting-patches.html#describe-your-changes

> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
> Assisted-by: Codex:GPT-5

Nit: Sob tag should always be the last tag.


Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> 
> ---
> v2:
> - Correct the Fixes tag to the commit that introduced policy kobject publication.
> ---
>   drivers/cpufreq/cpufreq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0d0df986f..9efbf5b17 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1258,6 +1258,8 @@ static struct cpufreq_policy *cpufreq_policy_alloc(unsigned int cpu)
>   	if (!zalloc_cpumask_var(&policy->real_cpus, GFP_KERNEL))
>   		goto err_free_rcpumask;
>   
> +	init_rwsem(&policy->rwsem);
> +
>   	init_completion(&policy->kobj_unregister);
>   	ret = kobject_init_and_add(&policy->kobj, &ktype_cpufreq,
>   				   cpufreq_global_kobject, "policy%u", cpu);
> @@ -1272,8 +1274,6 @@ static struct cpufreq_policy *cpufreq_policy_alloc(unsigned int cpu)
>   		goto err_free_real_cpus;
>   	}
>   
> -	init_rwsem(&policy->rwsem);
> -
>   	freq_constraints_init(&policy->constraints);
>   
>   	policy->nb_min.notifier_call = cpufreq_notifier_min;


-- 
Thx and BRs,
Zhongqiu Han
