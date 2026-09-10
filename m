Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A85435F61A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789014562; cv=none; b=rS1hl088LCTPW0oBBWbUkCU0XRVF1upIWNunbk0MkW3ZaGylS7UySc28+UUKBz321WeRiNdZITuJAf4lQFx+TurYySovSrPJjBqtsnumA0UM+r85m/SbrFkgK6A3IJC2rF/W6KqQqhk+p/Fn71boIW5EKyj8+wbYQNlJSX2q3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789014562; c=relaxed/simple;
	bh=etYLqBtbtQ/QbDvkr5y44rLZwCU9/T1eFnC4UZqHJ04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODzEjNhcjDJxc56InoXAly47j8TU4m88wqmkXyYBISC4TEmaL+wY0i6gBqDJ5HlmNKIXkngG8rFh4/Wp26CYJXgWrmGVzfd2z/dduvt2suTCKkWFqJBj97Z00JOJlmyiWH7S/A5kdEIrFvMLqj1JmiUzJuIp/wX3jZmNRFHVPCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRV7rRfD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkvLktQP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRV7rRfD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkvLktQP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lHMA351771
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndLB57wgKTMycdqJejHo9vG1t90vJv+zegrkAOlz9YU=; b=eRV7rRfDuUZmZTmY
	ItFzm279SmZx7EHSVFqIQWbevyNiYUVTXJpMi+1v5r3bXLuDKBOYKuM+fhiaD4Gd
	WYcK9hNu3eTyjrURVzdr1TTaScs5F17XnXOcPPUJEb9f5+85+kN/Vmd9Xe0dcien
	zFlW+whV65xdGmC/2FpjRQHHp8htxM1Y5tYE2XWb21OZh5cqxWIp07Zq8JB/FDak
	X8KSza+uEwVUxLp3HgWv/jwYmM8q6C/xM7HGn6bFgO1P8GJ45fwJa2V+HHPfBA+3
	TF29ayr6VTDPYFPfMuhs4fxbStcdwHxpHEtHJ2EirItyWWCqXkV3dJQ8HcZ6T3sB
	d5wsgw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydj1r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:29:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8633c0d7353so4633315b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 21:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789014560; x=1789619360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndLB57wgKTMycdqJejHo9vG1t90vJv+zegrkAOlz9YU=;
        b=jkvLktQPmvTNtu5FZmXPzPjMC55XpNeQjfkuvr4I6jwVwyBD3cn8JwKjEHtLbS3T1H
         7K6FbmTI74NEiNihuHj5Y8qALGzNZx2HZWXsGe08cD80JN+99/zTYjRhC5yv5QHLu+Mc
         NAPhoC1jHNJz4NhdWLp9P/1cgZCrdhlasiGbOGSe2tfdeftetCaxGinMsfgxXx4a4QOS
         6EulHB7Uaseanzli/E5agD+2w6f66GF4y7uktcjd/sbjefDpH/AC+oPnKx41oDNyE0pd
         qymlXf1rrSt9Ph5NPyJ69biknjsNy/pA6ysKgEaM/D+vdSBNg9NUEke/7P3YoUyhnFTL
         f7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789014560; x=1789619360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndLB57wgKTMycdqJejHo9vG1t90vJv+zegrkAOlz9YU=;
        b=eDkwCT4VmRwlfrXdEsviWF8VspkcaM/dKVOIiEcssVv5GNhYUKfjVDw6VcVXKZrApk
         pGMyFVD56K2wsP1tM6VHQb0o4evAYPy1YtGk46MB7itTuYhWXyAcH/BtgohHItC0yYFE
         PDzZdW+LQNavEEq3jNr6WR2R3xJQE8jPa23YK1bE6856QqTM0nRsgNLa6iJ62g/shH8B
         sMvNQ8lB5X1k0FMyYp3WxIj32cw5EQ0bJayll4KjK6zgHN9KgW1pMzc2hJ176LUD/eRM
         EQxPXPSyoLE/r9gno/zzkRk88WyDZyrNnARpSMkeQQQZv46KiFQ3uwtknEsbbuXuvioW
         AB+g==
X-Forwarded-Encrypted: i=1; AKwUvBwGKajC/AJE/WlPcmZJSUY1JVSjdP6QjR1jTxUdbxMcBj1X4mPLUMcPpmSnA5KdnitOb+q2uW2+Mydno9k=@vger.kernel.org
X-Gm-Message-State: AFuF++nX9Lqo57EcGVTI8Y4g1u5Uy1WU5BWQSSQQkVoNSrG9LI2SItb+
	CYUAoLQMfHiWvx0PgTNHQD22UBzFrLsJkTPw6NCc7Wn7VUwitcR1Q0y8QTMgm2OLqs1gp4xG4t7
	rurbInf+ElVFrX/YRYl1KAQBfyFSSOZz9P4kG5ImFVhYbq1j9GxNguxhkroMJ8liohj8=
X-Gm-Gg: AYBFou0ZpLZLzqXoNFuOn+K+3RDiSKZZFMHbevidoTx4YnmlyYv1dGZS4aWqOg2tkSx
	EhxcGQDbbUxPIhQkdcUrcjJcdxP37BtJtvqQhTMD4HzoxBzWFw/HiZVxzAJ/GyrJL5zy39zz+xz
	LQ24dX/uldkbGqBOL/8MgbzJ7Gw4rAfTmYihkQqB3mSE9NhWqbKkFY44l6rMJyvd6iJBMi5tVgp
	m9n8/Mx74Ke69txgDVKrefSGC5wAHFbVxJQYnkOCqc1Aq0NoshugkG+0C4Sn2W4ySFBhM39s+hS
	+f6Nwyvuc3Az0nH2uKu+li7EXyr0BPdXGkPqOWfVp6PfdQe9OgOj1J2sZfb7OCTDLmvNESCOoeQ
	vUh019b80mCr052ZjGwuKUy1YcL82pSV6kq/RqS/shW0ypE4gMItJgsY=
X-Received: by 2002:a05:6a00:1915:b0:848:30c3:45dd with SMTP id d2e1a72fcca58-86168785ffcmr50432715b3a.11.1789014559595;
        Wed, 09 Sep 2026 21:29:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1915:b0:848:30c3:45dd with SMTP id d2e1a72fcca58-86168785ffcmr50432654b3a.11.1789014559029;
        Wed, 09 Sep 2026 21:29:19 -0700 (PDT)
Received: from [10.133.33.71] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86343e6dae6sm5950975b3a.11.2026.09.09.21.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 21:29:18 -0700 (PDT)
Message-ID: <cc166331-bfab-4fbd-81a2-60cd3362121b@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:29:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260909105049.1317985-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA0NSBTYWx0ZWRfX89QvDFZopkjh
 McX1o9rRMmKaFgbQ/zDaYKT9B1Enj5oItjV1rcTaIpCs47wy6cYAFWujjaQMp7cKDkGkrqAJPXp
 m9G5S8uzrbkPBjFTT+Ds72kM19OJiUM=
X-Authority-Analysis: v=2.4 cv=UJNIjyfy c=1 sm=1 tr=0 ts=6aa23220 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PlWavoXkOeM9YJf6PKwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: XrtfsUin7EKbHQOkhaH4OIpS2gYC3Yy0
X-Proofpoint-ORIG-GUID: XrtfsUin7EKbHQOkhaH4OIpS2gYC3Yy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA0NSBTYWx0ZWRfX4mMVQV2OYjUn
 3xGEr3VMAV825iGEplR8qDBbUslFUnndSrrT8gID/F+/nzM1GQShaUJRnAl6Kb4+zUZam7DZB5t
 NavwbjtxKLDe8yZZnfDKc9MthkLTh7clb1uMgiqQSMNgwizk91+cS6VLUmIOOIbtH0GHa+tEnsN
 AbFcbwd0KPSJGGkblUKny21ugbwW/2m2nI9y0ORKvGE0esFIdD9BleNm53j0gbMJF7caHq9qkND
 v06RpFG2mpZSK0PWZCkKi/nMZiPGnU1AhuQdBxAuwunq2qHFR2IhNMsrRQ2wDQC9pNgs9yM0wap
 1fEmPBNiN7p6CwLZK/H8uJpWop4IdqkS/SkhRnBdtdQ6GD+hKhsnpb3gskV/DxLQ58Uz3bVod/m
 GPJlWf28BIklgL0fYPbU+l8i1wpVjguyezmqjzHwBnBWJEEyPYHekiTjBvsgbBP9nu9vbRNLUW6
 16Jr+hquGCY4SKUjAQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100045

Tested-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

On 9/9/2026 6:50 PM, Mukesh Ojha wrote:
> The proxy power domain enable path requests INT_MAX performance
> state for every proxy PD. On Hawi, the NSP proxy power domain's
> RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
> INT_MAX, mapping to their maximum supported level.
> 
> Introduce a proxy_pd_performance_states array in qcom_pas_data
> to allow per-PD RPMH levels to be declared explicitly. Platforms
> that omit this field retain the existing INT_MAX behaviour.
> 
> Add Hawi CDSP remoteproc support with the following proxy PD
> performance states:
> 
>    CX:  RPMH_REGULATOR_LEVEL_TURBO
>    MXC: RPMH_REGULATOR_LEVEL_TURBO
>    NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++--
>   1 file changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index c163e66347f8..8ac66db80193 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -28,6 +28,7 @@
>   #include <linux/soc/qcom/mdt_loader.h>
>   #include <linux/soc/qcom/smem.h>
>   #include <linux/soc/qcom/smem_state.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
>   
>   #include "qcom_common.h"
>   #include "qcom_pil_info.h"
> @@ -51,6 +52,8 @@ struct qcom_pas_data {
>   	bool decrypt_shutdown;
>   
>   	char **proxy_pd_names;
> +	const unsigned int *proxy_pd_performance_states;
> +	unsigned int num_proxy_pd_performance_states;
>   
>   	const char *load_state;
>   	const char *ssr_name;
> @@ -79,6 +82,7 @@ struct qcom_pas {
>   	struct regulator *px_supply;
>   
>   	struct device *proxy_pds[3];
> +	const unsigned int *proxy_pd_performance_states;
>   
>   	int proxy_pd_count;
>   
> @@ -167,11 +171,16 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>   	int i;
>   
>   	for (i = 0; i < pd_count; i++) {
> -		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		unsigned int state = INT_MAX;
> +
> +		if (pas->proxy_pd_performance_states)
> +			state = pas->proxy_pd_performance_states[i];
> +
> +		ret = dev_pm_genpd_set_performance_state(pds[i], state);
>   		if (ret) {
>   			dev_err(pas->dev,
>   				"failed to set proxy PD %d state %u: %d\n",
> -				i, INT_MAX, ret);
> +				i, state, ret);
>   			goto unroll_pd_votes;
>   		}
>   		ret = pm_runtime_get_sync(pds[i]);
> @@ -879,6 +888,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   	pas->info_name = desc->sysmon_name;
>   	pas->smem_host_id = desc->smem_host_id;
>   	pas->decrypt_shutdown = desc->decrypt_shutdown;
> +	pas->proxy_pd_performance_states = desc->proxy_pd_performance_states;
>   	pas->region_assign_idx = desc->region_assign_idx;
>   	pas->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
>   	pas->region_assign_vmid = desc->region_assign_vmid;
> @@ -914,6 +924,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   		goto unassign_mem;
>   	pas->proxy_pd_count = ret;
>   
> +	if (WARN(desc->proxy_pd_performance_states &&
> +		 desc->num_proxy_pd_performance_states != pas->proxy_pd_count,
> +		 "proxy_pd_performance_states count %u != pd count %d\n",
> +		 desc->num_proxy_pd_performance_states, pas->proxy_pd_count)) {
> +		ret = -EINVAL;
> +		goto detach_proxy_pds;
> +	}
> +
>   	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
>   			     desc->load_state, qcom_pas_handover);
>   	if (ret)
> @@ -1804,6 +1822,33 @@ static const struct qcom_pas_data glymur_soccp_resource = {
>   	.needs_tzmem = true,
>   };
>   
> +static const struct qcom_pas_data hawi_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mdt",
> +	.pas_id = 18,
> +	.dtb_pas_id = 0x25,
> +	.minidump_id = 7,
> +	.auto_boot = true,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mxc",
> +		"nsp",
> +		NULL
> +	},
> +	.proxy_pd_performance_states = (const unsigned int[]){
> +		RPMH_REGULATOR_LEVEL_TURBO,
> +		RPMH_REGULATOR_LEVEL_TURBO,
> +		RPMH_REGULATOR_LEVEL_NOM,
> +	},
> +	.num_proxy_pd_performance_states = 3,
> +	.load_state = "cdsp",
> +	.ssr_name = "cdsp",
> +	.sysmon_name = "cdsp",
> +	.ssctl_id = 0x17,
> +	.smem_host_id = 5,
> +};
> +
>   static const struct qcom_pas_data eliza_cdsp_resource = {
>   	.crash_reason_smem = 601,
>   	.firmware_name = "cdsp.mbn",
> @@ -1833,6 +1878,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>   	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
>   	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
>   	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
> +	{ .compatible = "qcom,hawi-cdsp-pas", .data = &hawi_cdsp_resource },
>   	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
>   	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },
>   	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },

-- 
Best Regards,
Yijie

