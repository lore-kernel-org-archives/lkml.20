Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B514F3B4E9B
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728209; cv=none; b=Ppmgf6+B+Rygy1Lfb/G+phavMefi4vpurzbMcodha6TMDAnc8ubWnM0/17PCNxZwju2N2c/mK0EVvVao5/jsSKFldixqG5bqrc4ZpqTyDziMPDT8S8buojYTSXitIBxTOAfz7Jxc6cY4X7QeD8jJwyuPIMoo+xXnVfvJ1nFck5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728209; c=relaxed/simple;
	bh=W7FZNSRbWo6VxKmxkMfSfrz+K/NtHoDLIImLCIZ7IhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZzMUd9FOPXqpsUo4IE6m6horPM6PEBL8fuP+pYbw7/fCH2HRQvAde7WyRRup9TK5cGlukE/Ga6GabB/GMPMambLPL79f5zI4ulSA7iie4jCvMdFa+f1FDMQEsk9Rw6oScU/2dkPkiPkUCLdVbRW9VoopUc5kO4mqRCAEmwww2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDsrGf4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvoNuLmt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDsrGf4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvoNuLmt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B857Q82381401
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2N1+nLpksf0tEB2SxFBndBmGIzIOlWOd60HbVRm1fA=; b=lDsrGf4CP7iNuKoJ
	eqvpShDixlPtH7LO9lT4tgDs70zd+gIiEMKDQpF9GIjAW6n23e/L2m0fijRff/1y
	Lb2vMCz/Yt9y/yzQQbOoaOILdChgwudSBcfAfQVjoa0srSWjE3iUJ0OY0ebEpda6
	dK/g9Kb2I72jGbxfUjCsgOoV0hVq4oQI/Yc4l9IjbNICyXciKBo/b8aijQTeEj2x
	816xxFTDazdWJjciaBvUxPf3BIKcL49cZSMoPo/CSLfQ2ypSYfQoDhZVK00owE8+
	B9kn+cbgQXUdhH2/uEKFjtTiXah1UJJhL7TRFBDJVSNbSkQHU8xh3xuoB/KP8dES
	1RMN1w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4eb13d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:16:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-897bfd32c95so1046963b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791728206; x=1792333006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2N1+nLpksf0tEB2SxFBndBmGIzIOlWOd60HbVRm1fA=;
        b=dvoNuLmt+6X7kZWSo5M8MNBHMRgYTEOkTqHUzoyOYJxyy73hn19mEb6r4JUZtGDPEy
         Y0yHq1IP6rak7i0ccLV3siT6EgMdFFMtdGXram0ceM4J02daYuf4Q/kq4Vec7cyo3+c+
         QEcQjbz7uUrFMfBvEWNhXjBho/esPFsD5ICSAJEreilM/4el+N32LxKN+FbJFGZ2VHxp
         MOc7HzK3+Ptm/rFOkOFslLBDY49ZxdVBk8nRx2y9DiY28QjWruNbOA0l6vGiy5WVeWhQ
         8jzvSAJcxnOTF3Vj3n2siOP21T4P8GjPGqM3CMPo5Nny560AqG/BC4Mc4S1DHWSI0dUr
         VhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728206; x=1792333006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2N1+nLpksf0tEB2SxFBndBmGIzIOlWOd60HbVRm1fA=;
        b=jdK9A711SXKXYOnv0n0tklnuaYF/ZZA7J3ofxHdw9b7HFU/Q1EHG0jCWHpxBKPVQlL
         F9YkvUZnoQA5avmSvpTPdWzYrIaU41IWoQ3pDevTaNHF31RCiANJeho7BiFEZdWy2ZbH
         20K39TOQ/yo/WrbPsqyFGSsI92+Q0sYfauZXrAhGQbt39bxF47bh+KTrmiTlZd+nTOCJ
         VwDVdt3Nn7YXJriYA6XCzAV3LayW22ImlWp500gNKwSfRBoRFqfDa71CuUsy27hfjZIR
         2v7oPIq1AlrzFFDJYIwBZivezjPavQIugq9D3z/KrupS2Pqyw8BpQFwxEtJQaoLY/A34
         L0fg==
X-Gm-Message-State: AFq9FYKCnLZbgS1OrzDExsfQSFWfYfwj0uqT7MeeP0HJPbpnJ3NIUWFM
	W490ar4Xm4YM3lrNlbsZI30ZWauHbJ7s6RMk16nhcRQG4K57JJkO8jL1/0/gbUV62EDNvViVhzc
	X81seqF5DKSa1NAMl4sukrzRCMaL4KQ0ATBQP40hvyz4lbVjbCmrFmclRZ5ZCZhgIIzM=
X-Gm-Gg: AYBFou05bAQdtgB4u3bi+TCLDmWQd390bGcj5AagjrNcIGQp27xenQyyNrq8Jqj8G9Q
	5WwP6I5SBqcOnqchvOzz0wdzuyeUnI9gBGSmYK0FsGhjnTDPd5ULXxQTq4QfFIkuPXLcoUK0KaV
	DfD5OEesilFH/0ZR5oCLldLnjGnk5jed0BOanCyOkj6W0Gk6neq+DP3+Z79bqj7M3xgj0gXprUb
	D2mcHm04ufL2oMnxqkHoSXJMDlnTliJAJfW+0UXSk/7QmoFYpI81RP37NkEZRFPWCh801sukv4l
	orvOJptiLiUxT2JLJgriPxv2xVl2xOy+ZLPc6II+g6yz+9jMkWwLgrEc900BBRff4i1LvsxPyvl
	xMBPFdRqGzmXU8vNOZxbMPlLFwLzuy+8uPvAU3H8kPdRzKhIRLHCaXABemAldYvU=
X-Received: by 2002:a05:6a00:4209:b0:891:6d3e:3999 with SMTP id d2e1a72fcca58-897c701082bmr5887956b3a.9.1791728205961;
        Sun, 11 Oct 2026 07:16:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4209:b0:891:6d3e:3999 with SMTP id d2e1a72fcca58-897c701082bmr5887934b3a.9.1791728205389;
        Sun, 11 Oct 2026 07:16:45 -0700 (PDT)
Received: from ?IPV6:240e:400:e20:12c6:a578:1ef6:8335:64b6? ([240e:400:e20:12c6:a578:1ef6:8335:64b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-897fb87c459sm2827960b3a.50.2026.10.11.07.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:16:44 -0700 (PDT)
Message-ID: <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 22:16:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with highest
 available frequency
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>, zhongqiu.han@oss.qualcomm.com
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1NiBTYWx0ZWRfX2ARr4Jaq/jYH
 GHXFkGeCJMU2sEIubJFCrf1KY/kIdIf2H6bPsz9QjQ72Vr7zOxmXyce87Hs+GEm59xCnHTsprUB
 ANF8orGq8ATqIBn+MTYW/ZQaKOi/QHTyZL98etMJA2xDh2BpIbOn9cL0EPj3jdCUlcAcKnN/B3i
 j5dMHevy1iGNecRALowma4Z8gtkPZZ+GtqjoKQI+CQy53pM1kNnjJuryEprFLTNk+7EA4JBdxWK
 84LEOZ/W1pWVbdGHsz4/SwWGwKZmDWreV94bPi2CUsUMaNMsdeluaF78qnG72C3jpaNlzMz+EcG
 ogU8KOsRpjVBV8Bv5yYNaPzy20t9tAhRvc7rnefNJU5rXUlZWQ7hLEHKZBvUdwU7c4S+vfa8V6m
 g+U0IYS91nWJIzQ4NzI7QOD1tGoMCfLfnZzSbeCw9Henk4cZdmnkwZJ38ExQ+dJ7Am8yIux6hwk
 WghJA9whHA2yRX+Ejrw==
X-Proofpoint-ORIG-GUID: QfnuAYuzaZXhZfymbjd5HI9l5bEK3kCe
X-Proofpoint-GUID: QfnuAYuzaZXhZfymbjd5HI9l5bEK3kCe
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acb9a4e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=mPL7UwSLHth3KX_UYEUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1NiBTYWx0ZWRfX6cWLDJFJf4U+
 Gm9qO5RZXPcHAiGF1iJI3g5tmyVHlw23U8SsUoWsiQ3zkW83ieggvkD2N20PWzNIu6Y+HHxdC/W
 SK1vLe0WvkOJjm8ei7vRH2xIZBaJZas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110056

On 9/29/2026 7:38 PM, Ananthu C V wrote:
> capacity_freq_ref, the per-CPU frequency-invariance reference used by
> schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
> If boost isn't enabled yet at boot, max_freq reflects only the
> non-boost ceiling, so capacity_freq_ref never learns about boost
> frequencies for the policy's lifetime. Enabling boost later raises
> policy->max, but capacity_freq_ref stays stale, leaving schedutil
> unable to scale utilization or target a frequency above the non-boost
> maximum.
> 
> Seed capacity_freq_ref with the highest available frequency regardless
> of whether boost is enabled. Runtime enforcement, still handled by
> policy->max, is unaffected.
> 
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>   drivers/base/arch_topology.c |  3 ++-
>   include/linux/cpufreq.h      | 13 +++++++++++++
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..92966be712d5 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>   	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>   
>   	for_each_cpu(cpu, policy->related_cpus) {
> -		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
> +		per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
> +						      cpufreq_frequency_table_max(policy));
>   		freq_inv_set_max_ratio(cpu,
>   				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
>   	}
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 35ce665edfd8..f048c925fd98 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1107,6 +1107,19 @@ static inline int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
>   	return idx;
>   }
>   
> +static inline unsigned int cpufreq_frequency_table_max(struct cpufreq_policy *policy)
> +{
> +	int idx;
> +
> +	if (!policy->freq_table)
> +		return policy->cpuinfo.max_freq;
> +
> +	idx = cpufreq_frequency_table_target(policy, UINT_MAX, 0, UINT_MAX,
> +					 CPUFREQ_RELATION_H);
> +
> +	return policy->freq_table[idx].frequency;
> +}
> +

The current implementation looks correct and works well. That said, we
might be able to optimize it with a simpler implementation as shown
below:

+/**
+ * cpufreq_frequency_table_max - Get the highest frequency in a 
policy's table
+ * @policy: the &struct cpufreq_policy to inspect
+ *
+ * Boost entries (%CPUFREQ_BOOST_FREQ) are taken into account regardless of
+ * whether or not boost is currently enabled.
+ *
+ * Return: the highest valid frequency in @policy->freq_table, or 0 if 
there
+ * is no frequency table.
+ */
+static inline unsigned int
+cpufreq_frequency_table_max(const struct cpufreq_policy *policy)
+{
+	struct cpufreq_frequency_table *pos;
+	unsigned int max_freq = 0;
+
+	if (!policy->freq_table)
+		return 0;
+
+	cpufreq_for_each_valid_entry(pos, policy->freq_table)
+		max_freq = max(max_freq, pos->frequency);
+
+	return max_freq;
+}
+


>   static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy *policy)
>   {
>   	struct cpufreq_frequency_table *pos;
> 


Besides, could you comment patch v2 Dietmar's comments? It seems that 
patch 1/2 exposes a pre-existing ordering issue. On DT systems, 
cpu_scale is normalized only from the CPUFREQ_CREATE_POLICY notification 
of the last policy, so the cpufreq pressure of every other policy is 
computed in cpufreq_init_policy() from the raw, not yet normalized, 
capacity, and stays cached until the next cpufreq_set_policy() for that 
policy. So far this was harmless because capacity_freq_ref == 
policy->max at boot, so the pressure was 0 regardless of the capacity. 
With 1/2, capacity_freq_ref covers the boost frequencies while boost is 
disabled at boot, so policy->max < capacity_freq_ref becomes the common 
case and the stale value becomes visible (102 vs 79 on Juno R0, as 
reported by Dietmar). Perhaps the limits of all policies could be 
refreshed once from parsing_done_workfn(), after the capacities have 
been normalized?

--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -454,9 +454,27 @@ core_initcall(register_cpufreq_notifier);

  static void parsing_done_workfn(struct work_struct *work)
  {
+	int cpu;
+
  	cpufreq_unregister_notifier(&init_cpu_capacity_notifier,
  					 CPUFREQ_POLICY_NOTIFIER);
  	free_cpumask_var(cpus_to_visit);
+
+	/*
+	 * The cpufreq pressure of all policies but the last one has been
+	 * computed before topology_normalize_cpu_scale(), so refresh it now
+	 * that cpu_scale is final.
+	 */
+	for_each_possible_cpu(cpu) {
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =
+			cpufreq_cpu_get(cpu);
+
+		if (!policy || cpu != policy->cpu)
+			continue;
+
+		guard(cpufreq_policy_write)(policy);
+		refresh_frequency_limits(policy);
+	}



-- 
Thx and BRs,
Zhongqiu Han
