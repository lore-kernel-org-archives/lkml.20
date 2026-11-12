Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503486;
	b=jK+tq9OK2yqSAeN4QVRFRxmA5je5wN/XTNRD5claJmj2pSfrMLFAGKwJB0kGZmZ+rCh8
	 eMi/1chvCMR5bYezCzOCZ1K0BU3uxUUuNZfEW2tA7Q6fAYYshk6Hwk/NMjmwDFSXsts3+
	 3sm4OXQaDkombB/53AaOXwEp86uFGlL4KtbKTb7J0x3z52dgaiWct+nO8Ytvz3ONiIyfG
	 Ed91+wdbEK++sN4gZhzVuifuOfeeLBDWzUnOUh0+3E0x67T3QY20TXunpbYvPxyUf7dv/
	 MQXQQslUHI7noyfrT95ZcQkdoDNhlwsASZBE38tuSEmCeoTMQ7YpbfKn/1vCU7ox93A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503486;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=;
	b=rrc6wq0pKzoDCuFSxY1xfpDjmqt5sOGnC+K87Sx4xK2TkgPBRnwMqQNFhlNWD9Aopsiw
	 qT3IDAiWyCY7YlgFOj+/lMbq4I0XQqhIKlXL60HejNF3O98427DYKWxde00P23Kj21av7
	 p0xNx1lD1i+K4XDM6ueUDB/MIsNI/+kOYbe5agLSstnzJbAElpDOOmaudDtcRKdt+EUyf
	 c/Gai7j+OfWFMa1HxbjNd82TkfY4le+9rJvAZ2BdgGEzDrUIny5Srk6YMmIIfv26xK3Ai
	 8m9fTKsKI+a0gu0qqSml99zMnm1SNhfU2E+xDafknLo1zoqhj5z7n85lBOwNhJ4f/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmEmWX3C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bd7CDcsW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16839606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16839606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kmEmWX3C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bd7CDcsW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaN9b1593450
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=; b=kmEmWX3CTFSw4zXm
	pzDf2Px3M0dU1mFLa+zvrIF36MuvRx3f5o2EP1zTQHeoz7N3waemRZkZ2j3yLZFb
	Xctwo2Sy8Jt6+UBPNZHasctgJZ32BlK6g8KOPHQ0XrAMJO/3bJQnhgFLVkT23xjy
	u54Mm/EHv4toIxPADDc15bKjQZ01aAcNImdlYc3zite8xq6jn0KTPk0Rf6F5CnhC
	UEv2Hl9jEvqRu08/YZeOCC9lCnZY0er2hFSvOV/gHAp0ftpY9XbE1AZ0VYEUNnKo
	jU4fAPgFSM28pup/r2lyW5LPqqqWsuyofj+9smGeMN4xkkNiGPj2lsgohNXzL4RQ
	LHhOfQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8kw02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:11:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2617265c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794503484; x=1795108284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=;
        b=Bd7CDcsWopR4rChFRxXsKqsPzFmzQw5DX2cE8x3XQfcakZYbs5GE3zUFJ2k9E6cyYX
         Z1bTJ2HAVIbxcMlxTxBxnCFp3mzbsV7y4Sj3FWEdPhXpLkhFA1WKA0IYuZpLLLLPvIMg
         5paQWirPjmoo1xFjB/IZc+zNILQ4+FtvVlWZxbCV0ZBuNl99KSUD80QDaHrXhp6lBlmJ
         iduQUuxdzJXaHYgFpMHI650vGc+IwIAxCVgtExoqw4D6A/uUUUIHp9c4fh73YLJ0gKLY
         gRza4VtwC9OxlnHM1mXxeXQkIXZggm+ArSEtl2LeJhLZuce5b+8iakmhRNpQ988a3GMX
         R/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503484; x=1795108284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6okjxmAoABig3FVx0l9wQb8oMylLxVQ65k4wFbZ5YOo=;
        b=2D6qRxWpbYv0n8rK4QnHRh2fRsNDnhw1/7ylQcdA0/A8tE7EhQKxFaRUcZRHUauoA/
         i/Y1Hg+QO1qzKqdYcJzDZKbXOiofci+JhkaCwF/qZUmCBVGXwwWqUYFaPfjPQjhMHnp2
         u0JplVi8do6qy/o2UxgjVtcoOR9aj9cG2qYyVYPiXhT4VOhvEEXMsSYJYmPuVnnibICV
         Gjvt/bahgoHLvXkfqm+zzsQWsbRIQZCgb4PKHOT1TH9z0NfzmrHlE6y6ms72s3Ocmx2c
         mX71ERnmCb9K+MNXC/stm5OP7cqtvBxGJ7dydCx9rS8EODj+1vL1CK2AciutzZl8XBng
         mdPg==
X-Forwarded-Encrypted: i=1; AL+hErH3oscG4du+krt7gerYwtqulxfr59RN5u2UZU2YCWYGoB9nYIvL8yc0UsHKujW+KgJW5y+sDSMxFlH7cik=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AnViz4zb+Z6NwNggRjrm/Os9eUmJqLpD50rvPeBOKB7SwBAG1
	miRERqAovm2dmBge+tdDemGu6mKV2PeLsHZBENyVDY4e55YVfNmmQ/px4ehNlALuRmPDp2MhtPc
	ZqP7QlxZD9J1j6nGzEnl75v8GrwxF8zCB1H6pHfLUkEzlufZYuKvMengiQKMaAIeyrRE=
X-Gm-Gg: AYBFou00Zrtu7VkYPDPDB/dOTc12lQnKoYj9NfuHlBADw2ezt9Kr+v0CAe22zd0bp1a
	DQKQGtwhDPLn16rgk+an4HF+asKkph4C9TT3EcbBVFwMRHqlvuRYAzwPDrQLm2jb+oK4jxqQOV4
	TjHkT8aM9NpjN+tgxpK30hfiJKRbOc9B1rEfLnVLXTMeBpuGuV3tnpmmQgdGbLdRqQQLDz7xOml
	i7oMtwJkIowG5cMcqB/hJYuSmG+j2nsm29DPpe3zWplzhwDXYaRkhmuvNvxZNkbXNVg2RyL/gpK
	GUtENGjD9w3JMImz5C3PrW5/PaY9z/B2JyOmUfiXL3l+2GukbjNBtFB9/7XrNuPHzKAtuxHr9Vf
	usDtHgWvJyZhi+lX+HK3QtEPzTfnGKlxxpyeOlz+bgAMDgrgNEgLC+pxZbEfrzZMwS1xjWoU=
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr138533c88.27.1794503484477;
        Thu, 12 Nov 2026 09:11:24 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b50318d7abmr138502c88.27.1794503483708;
        Thu, 12 Nov 2026 09:11:23 -0800 (PST)
Received: from [192.168.1.9] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm456200c88.5.2026.11.12.09.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:11:23 -0800 (PST)
Message-ID: <4f5ad34a-7e4f-474f-ac82-08098895b884@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 22:41:17 +0530
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
Subject: Re: [PATCH] drm/msm/a8xx: Fixup hw_err_irq messages
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261112160706.387641-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261112160706.387641-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2OCBTYWx0ZWRfX3UAyXKAuFScN
 8zYNRA+efV+qJdUQO30bP22VAyylX8lyVPgyuFiUcBFI4529QqRx02M6upiEXDN4aLAZ3/dX+Kr
 JiqSFetdC92KFR5ONPrTSvLfhLAlxGU=
X-Proofpoint-GUID: dJ4UTHADomt2NS3ougTFW6vVWR70Hywr
X-Proofpoint-ORIG-GUID: dJ4UTHADomt2NS3ougTFW6vVWR70Hywr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2OCBTYWx0ZWRfX44cwemNXcTmX
 7kGg+Y3B8EmeFotE3MOK3K6Q1cF9ty3xgHmn7QbMdHKg417kMCIKTabIzh7i+36WAuLT2XDl/6R
 QogmeL5+8PRZiY4ZgFQudbmDG9ZYnxMgJBP9ERwJucbl4rK/IZa01GWuMgDRYbNAg4A1FciKEeh
 bF3V+Q1t5Mu8paA3c+SDBhB7pBURklp2a9VFjraNwWGUgor+Tw6BNiTldjeIF0EAbIJNHCi7eny
 J9grXqUbPYWJ2AUkl7wcBzHYui3j2vowjQs/+9pSrH2DqEWlsiAikzz+bj1SYFPwZHomwLHZhSa
 /eUi17qHO6OvXCV0uAeiB4fMFKut47SlPz+DuY+oDRL2474jW3hCQW+Hl9ZYCuLIRfVAx4wTCSN
 Nta8of9tONOcDiB00PAvxKJm7JUQ5Lx+p0i3i0moiiMr3jSnzZUIvzIPdY61iG5xfjA7869H1J+
 RRXHFhdThom6QAcNiCQ==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5f33d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ARhVbqjvJwDEIoiJcc8A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120068



On 11/12/2026 9:37 PM, Rob Clark wrote:
> Handle all the pipes, and don't clobber 'status'.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 58 ++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index bbf5ca4fb6fc..a1747990e10e 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -1048,24 +1048,37 @@ int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  
>  static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
>  {
> -	u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	u32 slice = a8xx_get_first_slice(a6xx_gpu);
> -	u32 hw_fault_mask = GENMASK(6, 0);
> -	u32 sw_fault_mask = GENMASK(22, 16);
> +	const u32 status = gpu_read(gpu, REG_A8XX_CP_INTERRUPT_STATUS_GLOBAL);
> +	const u32 slice = a8xx_get_first_slice(to_a6xx_gpu(to_adreno_gpu(gpu)));
> +	const u32 hw_fault_mask = GENMASK(6, 0);
> +	const u32 sw_fault_mask = GENMASK(22, 16);
>  	u32 pipe = 0;
>  
>  	dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Global INT status: 0x%x\n", status);
>  
> -	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBR |
> -		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBR))
> +#define FAULT_MASK(_pipe) (A8XX_CP_GLOBAL_INT_MASK_HWFAULT ## _pipe | A8XX_CP_GLOBAL_INT_MASK_SWFAULT ## _pipe)
> +	if (status & FAULT_MASK(BR))
>  		pipe |= BIT(PIPE_BR);
>  
> -	if (status & (A8XX_CP_GLOBAL_INT_MASK_HWFAULTBV |
> -		      A8XX_CP_GLOBAL_INT_MASK_SWFAULTBV))
> +	if (status & FAULT_MASK(BV))
>  		pipe |= BIT(PIPE_BV);
>  
> +	if (status & FAULT_MASK(LPAC))
> +		pipe |= BIT(PIPE_LPAC);
> +
> +	if (status & FAULT_MASK(AQE0))
> +		pipe |= BIT(PIPE_AQE0);
> +
> +	if (status & FAULT_MASK(AQE1))
> +		pipe |= BIT(PIPE_AQE1);
> +
> +	if (status & FAULT_MASK(DDEBR))
> +		pipe |= BIT(PIPE_DDE_BR);
> +
> +	if (status & FAULT_MASK(DDEBV))
> +		pipe |= BIT(PIPE_DDE_BV);
> +#undef FAULT_MASK
> +
>  	if (!pipe) {
>  		dev_err_ratelimited(&gpu->pdev->dev, "CP Fault Unknown pipe\n");
>  		goto out;
> @@ -1076,31 +1089,36 @@ static void a8xx_cp_hw_err_irq(struct msm_gpu *gpu)
>  			continue;
>  
>  		if (hw_fault_mask & status) {
> -			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +			u32 hw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  					REG_A8XX_CP_HW_FAULT_STATUS_PIPE);
>  			dev_err_ratelimited(&gpu->pdev->dev,
> -					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
> +					"CP HW FAULT pipe: %u status: 0x%x\n", pipe_id, hw_status);
>  		}
>  
>  		if (sw_fault_mask & status) {
> -			status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +			u32 sw_status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  					REG_A8XX_CP_INTERRUPT_STATUS_PIPE);
>  			dev_err_ratelimited(&gpu->pdev->dev,
> -					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, status);
> +					"CP SW FAULT pipe: %u status: 0x%x\n", pipe_id, sw_status);
>  
> -			if (status & BIT(8)) {
> +			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR) {
>  				a8xx_write_pipe(gpu, pipe_id, REG_A8XX_CP_SQE_STAT_ADDR_PIPE, 1);
> -				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +				u32 opcode = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  						REG_A8XX_CP_SQE_STAT_DATA_PIPE);
>  				dev_err_ratelimited(&gpu->pdev->dev,
> -						"CP Opcode error, opcode=0x%x\n", status);
> +						"CP Opcode error, opcode=0x%x\n", opcode);
>  			}
>  
> -			if (status & BIT(10)) {
> -				status = a8xx_read_pipe_slice(gpu, pipe_id, slice,
> +			if (sw_status & A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR) {
> +				u32 prot = a8xx_read_pipe_slice(gpu, pipe_id, slice,
>  						REG_A8XX_CP_PROTECT_STATUS_PIPE);
> +				u32 addr = FIELD(prot, A8XX_CP_PROTECT_STATUS_PIPE_ADDR);
> +				const char *mode = (prot & A8XX_CP_PROTECT_STATUS_PIPE_READ) ?
> +					"read" : "write";
> +
>  				dev_err_ratelimited(&gpu->pdev->dev,
> -						"CP REG PROTECT error, status=0x%x\n", status);
> +						"CP REG PROTECT error, %s addr=0x%05x, status=0x%x\n",
> +						mode, addr, prot);
>  			}
>  		}
>  	}

