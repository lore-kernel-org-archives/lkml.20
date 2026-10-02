Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607B360ED1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977877; cv=none; b=i4AUuevL2UGbFLXNMp7dJw3USCFca5pbsGgE4icb10PA73zJk5l8lTTwABDkF0Apwxh1Adpn4Nnx6dny7Fnz42Xkc6vFobVd2SxaxeIq5rY6a30hYiJGqzC+DwfAshVlARpkC2S0sjFib1rejws+obb04hcxIiLL0H+oeUJPGXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977877; c=relaxed/simple;
	bh=DSZ6+7Z1JtgKXTPRpNOyPTvNSJRIeYIs57Z4SFa4lxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sngnuMUgbtrgpkxGteXyytUunS7facJy58kcX9ILay7d0rMn7pT8B41diejTqXi3PNwgvjdOXY5TulaaUsMhtjUX6sEn8SqXzmJg7FRDthhfi/uzXoCgrBSuvUiN5n74w1GasDLLvWRoMUvIULrj/BKklMMdZ8E9M2kjR01yDeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR/JA4QJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYG0aTCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZR/JA4QJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYG0aTCs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692K9cic2490678
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 21:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sMU6MKK0FAn2tWerO0qAxkcyuX7YPsGW1OWnSkMW9Qw=; b=ZR/JA4QJys1qmmOd
	sfIWHMrxeW9MurI4dn9r7upLneBy3rfUJbJ9K1C6mky3KbciGHyKYo4mKNgxo4zE
	GqyVIQzl4rzn2N6qaE+PpttUxhALuM73OgyK2DoLB1zPpzwK2NzaVacab50uZci4
	7b+0MM/NiV+HRnkrszmt0OI9dwM1nibJKCbP+aRCw5Alp7DW/6uxAC21dlxRJxHn
	3iuKmXgHcSrDJHDhJ+DCuI64RIBPDEmzB5Gatvf7t4LIuEqdvVXXd7BqwD0NKcGp
	qFiVq+lZWxYqxUbB+WIcsKhWg0ZlswUNTEAiHLNQeMEYmAGXd+TaTF9Jkar9vLUg
	aiSASw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvc0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 21:51:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso71764c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790977874; x=1791582674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMU6MKK0FAn2tWerO0qAxkcyuX7YPsGW1OWnSkMW9Qw=;
        b=VYG0aTCsyWsNH4BpqC2Q9ilJVDNBivSqHxXyv4vSgRVXxPENVksvODhzFjO4aqcTcv
         TsYzebWFGw5gO7Ep5R5MYXU3/5lYnpkEe4rwS+LRIAa1HeI5ofJIxqtcHK25X5AWVd7U
         vFHBarjSsCTGqtiSwYL2wgTn+T6+W78NubNcyv88Jnhvn70w3X0sfUo5t4ySNcbNCszP
         6o1seCbT/wbuJNHe7CyKC3DWrbzMYQVQSPoXwqYtMSFjXcRp5UyiVGRgZafv7VF65txE
         nLkdQHFi94ZRn4iqrtj+YBIdrc69mf8kja6PDKfch9ONjCLohIGkxJ21JdigkHd7w7P4
         lUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790977874; x=1791582674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMU6MKK0FAn2tWerO0qAxkcyuX7YPsGW1OWnSkMW9Qw=;
        b=Y9ebxkaJn2RDXE7VK+H+4Th6eLnkCWvV+DkXP2+s/Lq1LG43hxmKKSEI1rAclOVQF1
         YsE2AbK8fpJ7c92f5Em4GUMRUgjCueJhwEz4llFEXWeaBruAZoKBmK1cO1nXz9HPBjV8
         5t+djc6hYVnUC9tEzwOlDYfVl2mDdp6FiJs5byGHHywVTR21ck/XRB79ww1ATGwp0opz
         lK5k0l+kyM/7kUjuERAcBe0MpMT5Qfet+xr+nbMqx+gazDcp85X6vUL+YV1oi96Lg+pe
         AXCJqu7lst6ozUnV/vT385qBPeEvVvrl0AD/FdiBzQanh9K1vvb2sCYq168q7YmJBNzj
         HkPA==
X-Forwarded-Encrypted: i=1; AKwUvBxK1tmhvd2nv3A5TUG9fQG9r2c+pwsAIllU0a9j63UTnSFkZKjLzsyzKnnN9uEJPKHF9TclRhGwjXdm+H8=@vger.kernel.org
X-Gm-Message-State: AFuF++kOJl3kSnWwMksZ0CPLvvzy6PqebAqSzeupeK4OXYSli1MgROWp
	SWwqOGO4Ks0Fc0DsZeluEX2Kef172X8yjVuptHalPHYHlauAhpAlHOsXs2S4M6Fds/Q9wqfYfsv
	7RgjzvS2/slgLwtb9uZOUqIBRXSgy+62TOtmR5n32oi3im348GAUXNLauhcQaKxpcECo=
X-Gm-Gg: AYBFou3OxTLQsxT5Dl4E8tteKGO2GY0IolVJmImM8pbq1MIE98k1DrF+LD6up30Gsff
	jKm16nAjbjcp5AnQK4gV86mAkZyqpyjHyMjowZmmPvfseRlWrrC80ZRYx5lGfG81jU8hrZWD1NV
	3m/XgOeyD4UKQkfzVMQyZSzDfaWSFN6cp6RRXwunDATVQcDRAtCA7Ec/qIOSSyfZZ1FYMq5OuPy
	zSsl640jNbu7J5RepYsCVaf9uN2XMC5hb1oxTh5IAfT/E9qa21VWSvAQersFBkYps6pps6pQvBu
	7xAKJWxFL5u5Vhea8jpexuwKEl76zO02ltuIey4OJ+3NwdtMiKGlRs3gYBsRNCAbqxBWUGEEY66
	PPbfl0ISj3+INJFvh0UolIA==
X-Received: by 2002:a05:701b:2513:b0:13d:31c5:815e with SMTP id a92af1059eb24-151c32d97cdmr825135c88.17.1790977874109;
        Fri, 02 Oct 2026 14:51:14 -0700 (PDT)
X-Received: by 2002:a05:701b:2513:b0:13d:31c5:815e with SMTP id a92af1059eb24-151c32d97cdmr825075c88.17.1790977873258;
        Fri, 02 Oct 2026 14:51:13 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c2d1sm11715212eec.4.2026.10.02.14.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 14:51:12 -0700 (PDT)
Message-ID: <9355acaf-60a1-4fc0-a27e-8195eda3aac4@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 03:21:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Bjorn Andersson <andersson@kernel.org>, Oleg Keri <okerixx@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
 <ar_AuRr1eaZzOfw9@baldur>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <ar_AuRr1eaZzOfw9@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PI1sLAOwObENLW-sMXn8dGBoFx5ECy6X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA4NyBTYWx0ZWRfX7jUWpIQTMgg4
 27flx5a44NfrWVDsJ+hv20qautVpCGMMzVQIXkXE7dVm/jwKZEM7UOiGHldpoDl/UIvgtu5jW7x
 L6oQI1SxcqxWhKVpbtvVvGuQl7ewNUs=
X-Proofpoint-ORIG-GUID: PI1sLAOwObENLW-sMXn8dGBoFx5ECy6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA4NyBTYWx0ZWRfX+wVanBQskr0W
 WkghHu5iMJ4Lix1k6wKWvRWdWc4nDbnjmPiHGkn7QIh2WjJ0oShG8c6PViVI5+2P+iiFfrL5Fvs
 c88ZW5z4mwVa6srUnYfcAbUsMCMoqhZisDaIzaoz57O+DEPuBAL/hnyezYtV61YFnpTXag/Ijkj
 4vOCQyraVY0ehStN/3eKYjRE5VrMmTDvPEl+yPlPAnrMywcG2DHmx6rj+MoF3sIjuBbd2DgHLe/
 0VlZp3H93Ps54x8XXngWXAdCVetXZXBo3u9PccgOJTQiLgC4c1XO/tD6s4yz1SzIwiAkwUJxCoP
 c51FKMAxpk05RgYg/2TR1Gl/IEVwDLV6hsesNH+3c3V0egDGJD8VbD9B5EtaIsxD1YvOrBg6FHb
 J49795Ob5xt3TQmQGLPlRBwk4ENWfYoJCNQlkiIzifVKMhunAQX22vBCXNl+ChWLMSBjsNifPzR
 oJBKvD9ibCE6vSn4YQg==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac02753 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=AE3SQRS/NFwxibvl9JJKcg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BHwv5AXLfuIp9uWDur0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020087



On 10/2/2026 8:08 PM, Bjorn Andersson wrote:
> On Sat, May 16, 2026 at 01:37:51AM +0530, Akhil P Oommen wrote:
>> Add the CLX domain table and the IFF/PCLX limits tables to the catalog to
>> enable CLX feature support on Adreno X2-85 GPU present in the Glymur
>> chipset.
>>
> 
> This patch landed in next-20261001 and while it works on my Glymur CRD
> (COB), on the Asus Zenbook A14 I see the following failure during boot:
> 
> [    4.843643] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
> [    4.853804] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
> [    4.853878] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -110
> [    4.863980] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
> [    4.864038] platform 3d6c000.gmu: [drm:a6xx_hfi_stop [msm]] *ERROR* HFI queue 2 is not empty
> [    5.128548] ------------[ cut here ]------------
> 
> And then as one can expect there's no more GPU.
> 
> Reverting this single patch makes next-20261001 work again.
> 
> #regzb introduced: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")

Could you please try this fix?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..52cd60272870 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1241,8 +1241,12 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
                        goto done;
                }

-               ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
-                                            QCOM_SCM_GPU_TSENSE_EN_REQ);
+               u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
+
+               if (adreno_gpu->info->a6xx->clx_tbl)
+                       gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
+
+               ret = qcom_scm_gpu_init_regs(gpu_req);
                if (ret) {
                        dev_warn_once(gpu->dev->dev,
                                "SCM call failed\n");
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 86 +++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index c503912a61c7..9ad13eb173de 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1799,6 +1799,90 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>>  };
>>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>>  
>> +static const struct a6xx_hfi_clx_table_v2_cmd x285_clx_tbl = {
>> +	.version = (2 << 16) | 1,
>> +	.domain = {
>> +		/* GX DOMAIN */
>> +		{
>> +			.data = CLX_DATA(60, 11, 0, 1),
>> +			.clxt = 0,
>> +			.clxh = 0,
>> +			.urg_mode = 1,
>> +			.lkg_en = 0,
>> +			.curr_budget = 100,
>> +		},
>> +		/* MXG DOMAIN */
>> +		{
>> +			.data = CLX_DATA(60, 3, 1, 1),
>> +			.clxt = 0,
>> +			.clxh = 0,
>> +			.urg_mode = 1,
>> +			.lkg_en = 0,
>> +			.curr_budget = 100,
>> +		},
>> +	},
>> +};
>> +
>> +struct a6xx_hfi_limits_tbl x285_limits_tbl[] = {
>> +	{
>> +		.feature_id = GMU_MIT_IFF,
>> +		.domain = GMU_GX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 1,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 12,
>> +			.mit_time = 5,
>> +			.curr_limit = 18000,
>> +		},
>> +	},
>> +	{
>> +		.feature_id = GMU_MIT_IFF,
>> +		.domain = GMU_MX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 1,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 18,
>> +			.mit_time = 2000,
>> +			.curr_limit = 6000,
>> +		},
>> +	},
>> +	{
>> +		.feature_id = GMU_MIT_PCLX,
>> +		.domain = GMU_GX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 1,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 6,
>> +			.mit_time = 3,
>> +			.curr_limit = 66000,
>> +		},
>> +	},
>> +	{
>> +		.feature_id = GMU_MIT_PCLX,
>> +		.domain = GMU_MX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 0,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 6,
>> +			.mit_time = 3,
>> +			.curr_limit = 18000,
>> +		},
>> +	},
>> +};
>> +DECLARE_ADRENO_LIMITS_TABLE(x285_limits);
>> +
>>  static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
>>  	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
>>  	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
>> @@ -2227,6 +2311,8 @@ static const struct adreno_info a8xx_gpus[] = {
>>  				},
>>  				{ /* sentinel */ },
>>  			},
>> +			.clx_tbl = &x285_clx_tbl,
>> +			.limits_tbl = &x285_limits,
>>  		},
>>  		.speedbins = ADRENO_SPEEDBINS(
>>  			{ 0,   0 },
>>
>> -- 
>> 2.51.0
>>
>>

-Akhil

