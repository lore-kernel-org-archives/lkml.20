Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A799D4848AD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671606; cv=none; b=gGERoO/Dcd/5bGMjgziwM5NMtAMZKmJhryQNKCvxiu9XFncGaZMqsN9XUisXtXmAhrRun39tzCfRfeiL3fj2BzzoLux4agZnDaVYTKcbfbgt+wVHgVi2hC23ef8/CUcj8iYvAUhBWcGA5S6ECvxk1X8ulVs/KR3BMRoFJc82WY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671606; c=relaxed/simple;
	bh=NH4s1SWYn6fo9GjxuFogJLV9REdmr0FVcmwRn2mbUs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1YuyPuCUhuhw6qDzYVewq3yVtzLgqwy76vdwadlpwVuiWixjX6ZW5ZNiQZuVzZe5XZN0RJtUQPm3yml9nMf3l+8S473LRkbn4oM/K6xKCs4JzB9MhcqXGEXcae7AhQzIxDE0R1MuzqZ19S4gMgXymBpGWUJTOhH761rYFycouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlK9Suhq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vu5BOObo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlK9Suhq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu5BOObo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U4fw3833998
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKNQVnhogHvJ9Iiq7rPTbsN/SrZ7qlj7dmwTnmaWVcY=; b=hlK9SuhqeHIHRR4E
	tgCAqi27vqwIvTu16Vu6dSlK46JjhquepNiZ0LlvOAqO9pFuf3YKhzqLQIMIdRdG
	/23E6vlrOkfnEhJFSLs5ekqP9mB9xdYhxIQl64AsWbbyOmD3Fh0DdAnhFgFXc69s
	F/OcwoH73+CG3AfGLtL0Z1YKQLrGCP+LGN1Cy6BUMnFd59EU6rL/oj13BJROLu5+
	h1fjd8ESKXrKgZg+y1+MQkwwrLOVfhoulaegbKBGEXY6V7cjzHqQMke1SJ/iNyjy
	6Rh/VnyS9XCd5Jvxz/mzZD7zGF2AU1QlE+9UuRjFD8XTvvUzMtRj+SNdXkXzQ25T
	tkRmNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkhvcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:46:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so1118154385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790671592; x=1791276392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKNQVnhogHvJ9Iiq7rPTbsN/SrZ7qlj7dmwTnmaWVcY=;
        b=Vu5BOObozXhw0hmj+9BUj1AEig3A+c9cOh6AL64c5s67bboZRuXHGpK/RFArDdgEm3
         432r+Zw63yKRpg25BsyYo/YiCDqBa8thINOVPXgRKsL950EYszuoGyBLF0Z72ph+uSfA
         6zWpRT11PNWBXKk+X6+PX7JGgPxHsmzaqX5D7wpg82uSNLXxIcBZDwqR1X5JT6dKfswH
         yBOBJIaNtUtUjy3zw6wCKQGRjPPzE4opOXpnR98+8TCafcdAOpJ3OYo1sctBqdfqygcu
         88oPLQGA2Vab3A9yBqYqu3/81lDG7MzbVpNTTEU6gWNvzAE0FXi3wBo9/WN5B4dcImnQ
         W/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671592; x=1791276392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKNQVnhogHvJ9Iiq7rPTbsN/SrZ7qlj7dmwTnmaWVcY=;
        b=2ImYyawl4/sQv2UufurF24Vfl9bgyR7MhhK8EFxzbbAJwwgRiGT1msR0f7A1K7AzjX
         +ezWOBBfqQlFb8SfAV1VTMdrVNMewMqXZ4Nhlgq0fqWdWRjzALhT0zejH++lS4JrWMh0
         cnG1KQyMMtvE7tl2fSU7NPrB54nmEqmyyjBcxNYchoVYbneV6AQshPi59SDI2OeaMGNY
         BKZg/bZjVNeev5GXBvxy2fZpO6mYTeTgyLTSgeCl+3L+Z+8HPD1lJ7M+g0QDQyeDM7uf
         Y2lK27+ZdNZssqB/7riKi0ii2oBjs/dBdUpXGIYMPGaiir66I/wDIM9e3sDxTR7Msx/3
         A4Ag==
X-Forwarded-Encrypted: i=1; AKwUvBwsnyrBrCuaH14g+RDl5SrcXVLwDjKLcWMgggLqEgDO2LjguhXOz5zTyD8CMMiigK89UTgmUhdFCve/q8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kao7RwNt8C2phTJvFU2AX1upIGqx7njbdVFqCXG+2TvJkeFxvC
	iOPTX8/a9uwU05gvHJGNedrKH4tuhLQvZDEXC3U61Rt0YU1CeyIFQnCM/000y30QCcxDg/Mn0hD
	2xqhEK4uvXWYRgJq01UkI10bifJLVaiwCTEnyq1kgm9/x7AQ7J+oLnNs8cu56DO8/PoY=
X-Gm-Gg: AYBFou0Dxm+8DYKSqPtfnrfpYcqnvqqD62yY60O/Xf6xEW17W643QfERg3rihoy4Rdc
	Ru38UG/HQn5Nb72c/fH2ai02N3LNXo3Hf7bUwOuljMWkc+qWysaTB0x+76Bkuzbpp8dKCQ4i6o4
	XPo2luTancGy4ZHzWddjcS6Z63u545/joVlsRMkpg6Ei8EUEmX18x27OPQk7SovOett+G0x55pX
	YAB+b0Ujfr/lIAiNPWjD8YS3vD2H1KgEpUCBSbQWMWGYspa8LWKjNM/+FgKh+BbsnOdMhV0W+lY
	XMHQAMJMf9mzFttd7F4xqpU5JGocc4p3e0BMQGWSg9IOdzhVAuAOQFYFRGfgN9fSMzPtRS47DPE
	N946lae/fecWg26liAxPGouGxAdCOEy+YV878kl0xsRjRathQOHRDJ40kNtsqcg==
X-Received: by 2002:a05:620a:17a1:b0:939:6de8:43dc with SMTP id af79cd13be357-93c47501d08mr2453023485a.48.1790671591528;
        Tue, 29 Sep 2026 01:46:31 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:939:6de8:43dc with SMTP id af79cd13be357-93c47501d08mr2453020085a.48.1790671591013;
        Tue, 29 Sep 2026 01:46:31 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502f79dsm2420041f8f.6.2026.09.29.01.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:46:30 -0700 (PDT)
Message-ID: <2c521063-9f79-4c6f-a9cc-c1128066aa6b@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:46:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/sprd: validate the sensor id from the
 device tree
To: Weigang He <geoffreyhe2@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260926042757.2109927-1-geoffreyhe2@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260926042757.2109927-1-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX1aElQji46FXj
 4Rvz04uYA12HigJPPYWVoqE/VQVmH+pb/FrdTEZWyrqaEkCCLYedJE24+/dp7GOjzFCarAy8AlE
 /g2UGA/OSgqLNY3lNSP4Zy7IsbdbxM5Na1e66vW4ftwuw0z58a3FyHiSuEwt/alf2uZJio90ASf
 IUbLR3RI0yrt7Ifacb6A6ZYFFtxYKVx3/91eLGX8LToPaf4CaslstNEyGibF/05RWxsMwTmOYsC
 cQmBqHoR5UCRsa0ARjr8nk//AXPOq0q0Hz7v92r/nwokQMGIA14iLcKTqiJxY6UN6OKT4HTqMWQ
 m3bnxY0OLoxRdW1FE6YvmMBQNwN3Kaq4Zrv7jHMT24CiY8sWwZNaX6RXKqzQpt74FcM855++yM3
 enxiuvpi0ADRNxxZUUA98KP24rzxhS6BtoNY1t9vGbEHhBUMW8bOpVajtTgT/26KDmlHiJ3lyKv
 RaDehVhcSx5FbnlWTtg==
X-Proofpoint-GUID: z7XHaLs9D79CoxhcaQHfYz6pCAqGoUro
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb7ae8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=2j8HJEekVYGnh1E_RN8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: z7XHaLs9D79CoxhcaQHfYz6pCAqGoUro
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNCBTYWx0ZWRfX/0VDLO3FuMVk
 rz3LlgO2JyjpDH3zR7VoxJmEwzNlROVlIqSnJeYHroAfvZ5RvdjLdZ5ycMlzyOiSP/wg1yAB2Wl
 q4IOrEWFpPl9UGGpJcSrZTwdMITq9d4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290034

On 9/26/26 06:27, Weigang He wrote:
> sprd_thm_probe() reads each sensor child node's "reg" property into
> sen->id and uses it without validation: to compute the sensor's
> register offsets in sprd_thm_sensor_init(), as the thermal zone id, and
> finally as an index into thm->sensor[], which has SPRD_THM_MAX_SENSOR
> (8) entries:
> 
> 	ret = of_property_read_u32(sen_child, "reg", &sen->id);
> 	...
> 	thm->sensor[sen->id] = sen;
> 
> Only the number of sensor nodes is checked against SPRD_THM_MAX_SENSOR.
> A "reg" value of 8 or more, or one that is negative once stored in the
> int sen->id, makes the register offsets point outside the sensor range
> and the final store land outside thm->sensor[], overwriting the fields
> that follow it in struct sprd_thermal_data or other memory.
> 
> Reject an out-of-range id right after reading it, before it is used.
> 
> This does not address sparse ids, such as a single sensor with id 7:
> they leave holes in thm->sensor[] that the later loops over
> 0..nr_sensors-1 dereference. That needs a separate fix.
> 
> Found by static analysis tool CodeQL.
> 
> Fixes: 554fdbaf19b1 ("thermal: sprd: Add Spreadtrum thermal driver support")
> Assisted-by: LLM codeql
> Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
> ---
> 
> Notes:
>      Compile-tested only (ARCH=arm64 allmodconfig, W=1). Not tested on
>      hardware, and there is no reproducer.
>      
>      The CodeQL query behind this report was synthesized with LLM assistance,
>      and the fix and changelog were drafted with LLM assistance; I have
>      reviewed them.
> 
>   drivers/thermal/sprd_thermal.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/thermal/sprd_thermal.c b/drivers/thermal/sprd_thermal.c
> index d683fcb0f8ab8..b57277e2eac01 100644
> --- a/drivers/thermal/sprd_thermal.c
> +++ b/drivers/thermal/sprd_thermal.c
> @@ -396,6 +396,12 @@ static int sprd_thm_probe(struct platform_device *pdev)
>   			goto of_put;
>   		}
>   
> +		if (sen->id < 0 || sen->id >= SPRD_THM_MAX_SENSOR) {
> +			dev_err(&pdev->dev, "invalid sensor id %d\n", sen->id);
> +			ret = -EINVAL;
> +			goto of_put;
> +		}
> +

Why is there a mismatch between this check and above in the code:

         thm->nr_sensors = of_get_child_count(np);
         if (thm->nr_sensors == 0 || thm->nr_sensors > 
SPRD_THM_MAX_SENSOR) {
                 dev_err(&pdev->dev, "incorrect sensor count\n");
                 return -EINVAL;
         }

(note the "thm->nr_sensors > SPRD_THM_MAX_SENSOR" instead of 
"thm->nr_sensors >*=* SPRD_THM_MAX_SENSOR"


>   		ret = sprd_thm_sensor_calibration(sen_child, thm, sen);
>   		if (ret) {
>   			dev_err(&pdev->dev, "efuse cal analysis failed");
> 
> base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
> prerequisite-patch-id: c5a3be8688fd8e88a00352acb1374e91fcb52a03
> prerequisite-patch-id: 67693e2c08624df0841619cc085ce9200f4385fc
> prerequisite-patch-id: f3d73f7c19be7e952aa8061303f53f9a08576a88
> prerequisite-patch-id: 541e578709d048f4c8115f1d926be2f2c03ecb0e
> prerequisite-patch-id: f23f8e0693435497645805822d98a92e57fb46f3
> prerequisite-patch-id: eae82895db8ba67018a777a91a283ad6bc4a55b2

