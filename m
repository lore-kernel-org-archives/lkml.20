Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109322BEC3F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048916; cv=none; b=fYw6Jkhfjf4PpC8cvQ18weHlTgueQok/uCcOkf9XCwO+aQpvN2oOtztpbhyYSJ8gEjNhCgIzepZ0+K42DfE4fGeXHn/3Qs8MeMRMdcF1aUbANAbAiAQdql0v1fnvhJXgVYAE6dJpHlQu0RnIwQ1E5g08CFBsxtJvZXJcWK2s6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048916; c=relaxed/simple;
	bh=4hoygNQoHLisXaQr1qmPxvhAeUeG/ON878NKWttBA00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJdJDyJyFHC07Uldb1jP+Kd7FcUh8scxBcJuKSZ15JnClhUyN8aAl7D5zWscTZNOZzpQTtFYyeuRxivKrLRGLpoa+AQzHkQWtQMJVfT7H7IGSaP0B4V80JwcgbK+EE+Lsvt2z7fb8CxCvygBJMY8gNBrec7PmRjNgOjqafa3yjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FavHGOcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSObMURD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FavHGOcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSObMURD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00Iqd2165589
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+P4tUPyhPU3NezjUV2dp1RRkcsCE5jw+9E9ZGwbzTs=; b=FavHGOcdsCIBriaB
	MWpiaVpt/K8VPP+ZCahQRIgvuSojAJ22bYQkEQlH/cmCc0Hfnt2yuXYBSCbqmokx
	hZrulTNAVp/XSg5JHSO3xLQZxqba2SvArKFJQIsD6oF0mhzQukB7DoMeGLSOgfB6
	LMxp2xyxRp0ZEGmIEboCYkyF/ImxgWlO4bDUFwMARsg2nZf7BcqepnQHNuR7fQmP
	20WwksFpRwb5oA3F6YLRwBUDyvVul8u6G/pMNOzGW8etvHz/+huNC+I+4u8yCYYq
	3rJXUHFpsYuUCNNTW8YMe1IEU4k7ETNRLkjmLIBYeqU2RWRF/4I4vxsPjpL4PXlG
	1gQMKA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xet0ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:48:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so5430733a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790048914; x=1790653714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+P4tUPyhPU3NezjUV2dp1RRkcsCE5jw+9E9ZGwbzTs=;
        b=dSObMURDTgBmt35PULszUx9t2f35hUBiz+2ztuUXmthcxNqxoDFsJVzpFI5D49f1Vb
         R8no8ikralaRxFgQAYm2B3dIWJWYAuimeO75fl19cHfRMuHwq01+CSU5p/JeftAdOf2Y
         J2ba5LCJJSk6b5DJOHBzFvtW3d0259BWEPvJygX90fZWhmYfd2mdBKjcRvbs+sdR+HTz
         ph3t8JDpvAerJN44PsLbpddAoGxqZul9keoUL1oVGdSc6BnTybUeTa90YZdfUtSIwpcb
         PkcfGq/O9U7vpK2wJWuGBFNJyXbPEHIQmhNobz56464p73wsBc5i6rXhDCwxpm2g325X
         1N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048914; x=1790653714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+P4tUPyhPU3NezjUV2dp1RRkcsCE5jw+9E9ZGwbzTs=;
        b=o+o5TRAjzyZH08GIdapP1HDLtpmDovummBtXnakdOoRs8lukBXOYMI/N38VeWwWwmU
         vwKtMuD5ki15itneWc5cEcCUO1Qdjj/bi5q1UJtZ3UoPIBUM/tV4BgZrZim3tV553aGf
         Zi4w0I8DmwxmmNcWKdYGmzGE+lfzS8lzJgNca7/BPisAH6tnspVjrTyvmq1Q4Ng08Mp6
         sMbdUKwPVE3Rj3Wx0y+gtiPw8yKCP++eLtI2DcfGCKfpcATc0ZViyhlBd5JJ+2js8dQy
         /4cTtDjMKyhSZfDAWbZtsUSN4z5nC+gye6xJhUal3adtpLhsGzXEZS/0vkW9AAV2cEtW
         cIjg==
X-Forwarded-Encrypted: i=1; AKwUvByrW815Sf74fkhQRGgY/Ho9pNf1+RJlS0PGk4Htir1SRSY4ho4ozk/DIoy66HzG5TAgz/oFsQVUYskBcQU=@vger.kernel.org
X-Gm-Message-State: AFuF++kv4YEPTsNz1xazGzy5kfvTcSZCJK3DvEfJIN0Ahf/mWooYHohF
	5iiuN8/AllHFh5dPfWAzoi7jBBR9XTdIZpJ7fu87THpzdhDmmYjHH2Txgdd8UgahiIeOynvL2EX
	5W6csN0odjvM+ysnxRJZchWtW7h5D6u5ZGdmk+7Fm07kOHmASyK2JbDEOsV3DTidDjYY=
X-Gm-Gg: AYBFou1VZ/SmqQA8u+ZwsOKU2tCGzCtksX8yh+fpbX87qrsazw/zR3CqQvOqSUrfd5G
	++mMIMXJ8WahQgG3YxuGsc8Zu+nPDpwT0ARnpOBF37VnNVHOx3jQ49bpLZqNNqyYQq6S9tXU/w/
	Vs0neBLZf27CmNkrjVC9dHeWy2n+2WDwLMPoMcYXVzPMOXCc4Fsr4oJBlWNiZvMd9XB6jb+i3v9
	Q3sW+x8pTefh0mGhopuhZgZLrqUjsGl/tRnm55DbNwLINld8xBVkszdK5AzUKc8LXmv+XcBWz1r
	5ft8od4ED97fs9lOqa6FV3Lrx+4tLCs8xtkWQOzUZFJrFF4+2o7mpIh9P9GItYPhnd2XHL1jSJy
	EGN4mMbRPCqgC/UprQkfRoqMTxpnMWBjh73MBs7Uc7MUidhXWV0AY5PJGxdhA90sidEByReBR
X-Received: by 2002:a05:6300:68c1:10b0:3dd:ddbd:c5a1 with SMTP id adf61e73a8af0-3ddddbdd505mr1962276637.0.1790048913580;
        Mon, 21 Sep 2026 20:48:33 -0700 (PDT)
X-Received: by 2002:a05:6300:68c1:10b0:3dd:ddbd:c5a1 with SMTP id adf61e73a8af0-3ddddbdd505mr1962260637.0.1790048913060;
        Mon, 21 Sep 2026 20:48:33 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a317d7sm157989a12.16.2026.09.21.20.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 20:48:32 -0700 (PDT)
Message-ID: <495a47a3-ac6d-4002-abe3-23b85b2f2034@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:48:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: qcom-hw: order driver state before registration
To: jaidevshastri@vt.edu, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
References: <20260921-mb-qcom-cpufreq-v1-1-b5943c3fce18@vt.edu>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260921-mb-qcom-cpufreq-v1-1-b5943c3fce18@vt.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dnBlSabttvOHQznPeOZvLlawheQ8jwq2
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab1fa92 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=z3JUTzfoe6kKmln8kWwA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dnBlSabttvOHQznPeOZvLlawheQ8jwq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1MCBTYWx0ZWRfX8gwPA01J1sqL
 7JBj5ZkKbaZ010S7tkZbH2FAFT5T2aN23sAT4ZDEv0f5EsyWGvpKtQYkzqiybS9J56H3+HNjdn8
 z2RRgJNuBWhajf3hnsYyYme3Hr+Uj2pyYwck8h4di/t97wGYT6ufcs37rPDdGpbHUcuN+e5dv6k
 ZXBL4PXfmRkNy3Xv+WaHfy2g/dlcgFGmEBWkYBHDhXvd7E/ME/bTXof+t/ajGQ7PaHhrq1r3UEd
 d+HNTbDa4Q3VA3qCfv2sxbDl+wsLj/j1n8mKUB2VyBC0SIqVe6IleRvpE0/e0PYQ76kFm3/sSR1
 IMgH+VGwZ7wnyAQlwlGSAlX12dQjbt2k2RYVauvjBjkqRe8HtikZlkRl6oWsyRx7gRG3ic5kL5C
 0IHxTvPPFCniw+Gjuai7r1XnHg0ZAfMXDPhgRYF3/jeIV0iSgiZN6SsmkOL6R9orbg2l6ROYVM7
 EeNliaQe/dpZkYQUlvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1MCBTYWx0ZWRfXydPmqmVqaobx
 VK2HGzMBw0scSs6CRAVpnIoezmBitoxU7PwEjcfivrSE1b/gzJ8F9gHtXfJ6KLYW+SrnfKOfm+8
 cG1f81W6lkq3f1E0oXxV+c8ELsUf1ao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220050

Hi Jaidev,

On 9/22/2026 9:11 AM, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> qcom_cpufreq_hw_driver_probe() stores xo_rate, cpu_hw_rate,
> qcom_cpufreq.soc_data and the per-domain qcom_cpufreq.data[] array with
> plain stores and then calls cpufreq_register_driver(). The cpufreq core
> invokes qcom_cpufreq_hw_cpu_init() for every policy, on other CPUs, and
> that function reads all of them with plain loads.

It should be not. This all runs in the context of the same thread(no
other workqueue, kthread, or IPI), so I don't see a need for cross-CPU
memory barriers here. Even in the CPU hotplug case, the relevant path is
already serialized by locks(cpu_hotplug_lock).

> 
> Order the stores before the registration with smp_wmb() and add the
> matching smp_rmb() in qcom_cpufreq_hw_cpu_init().
> 
> Found with MBCheck, a static herd7-based memory consistency checker.
> 
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>   drivers/cpufreq/qcom-cpufreq-hw.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 874ff3fb9..62cc1f403 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -554,6 +554,8 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   		return ret;
>   
>   	index = args.args[0];
> +	/* Pairs with the smp_wmb() before cpufreq_register_driver() in probe. */
> +	smp_rmb();
>   	data = &qcom_cpufreq.data[index];
>   
>   	/* HW should be in enabled state to proceed */
> @@ -738,6 +740,13 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	/*
> +	 * qcom_cpufreq_hw_cpu_init() runs on other CPUs through the cpufreq
> +	 * core once the driver is registered and reads xo_rate, cpu_hw_rate,
> +	 * qcom_cpufreq.soc_data and qcom_cpufreq.data[]. Order those stores
> +	 * before the registration. Pairs with the smp_rmb() in cpu_init.
> +	 */
> +	smp_wmb();
>   	ret = cpufreq_register_driver(&cpufreq_qcom_hw_driver);
>   	if (ret)
>   		dev_err(dev, "CPUFreq HW driver failed to register\n");
> 
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-qcom-cpufreq-42f15afbfa4f
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
