Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915093;
	b=sSqpAEWvMWFemnRqlF6f04Ci4wCtIKbDFYu4t0u/iHouOayj5txB2YmTODT668VkV94V
	 Qlk+gOhb8pC60eMtEW1s2Y8fu10ChPN+lWpiIeaSWZ+EWeoG6+oyhy/srTGgZPv9xeYzO
	 CJ6+G79DJl4QE/yuCfCkZpCkdU8bUytQh7lHUwhASToNudt3IBcHBqK3VjyK4zWniH+MC
	 GIlmPyQJh3eDJw6JH+QpvxRdjcHJWnYT9ttfpAtzkJQA7u3Xj/lQnOQP8VJTbvuCxoSOj
	 NErfg6sNGHvrbAszKE4HOPqHbkUfCGONMAyTErwedIVqcFn9s+ijiWyO4fv2BciuJjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=;
	b=iCV9VtUr85vaGltJ9Sz/PsMqlCFuYmk2HufqBt8td43ecBi+7kXDmuiwLLgGNQoQD1mi
	 yHBwuSBf44T4RvUazgWfWsVRxM2UK62MV5iP+DnFdw9fkoJ23kfmX1NPL6eIS9f5K5yTN
	 jxW75jcVdYbqoq9qM6GdRt8R8GQ3rnaEozXFyDpV5BWQRrea+R+ocaqCI0UbG8SVzZIkd
	 QPwCud/RQHZjZywYivDbEmxEcRGw6NEbCMFtFguOLJxqfj4RqGTnC8PlmQwDo6gc79ZXm
	 kHkrqLgSzeyeEq3SIiu28AhLes6di5YZu8j/Iz14t5uhcY0XyUdEAv4m60HBx1++A6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DG5/bwH5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QeYqzf1c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F53606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63F53606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DG5/bwH5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QeYqzf1c
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L69t4844672
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=; b=DG5/bwH5XPJqkHgX
	DiYs0CYIam5V5Z6h6SQmff+AYwRnLjBxJhsrdhf9AVLr81NJbPd4laOvYk4f3oCH
	vpeVgv+Ayv4tELOxypZJyuwUsmeIRBOkHPvSmRBkEFtaatFHae/xrl+DQrbFTgAV
	XJE4PLDnPUuXkezUIKaDanxrhSolXB2Ss/7cXZKysk/KvDDq6+tPoPFq1MY9jf4o
	i/u47CF8oZ3/CsZrHn8TADr1AvT4MZL/NoiiPlYGIO+c6bHyn1mqxjnveCyqYXos
	xckrQggFTg6bYi+VplWPnU32mHOVWV+hskacBNeLkH93PFp4YIQ0VkUi80CkxgER
	uTVMeA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvv0jwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:44:52 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so58429c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793915091; x=1794519891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=;
        b=QeYqzf1cvDzcfOzw8rDrAbeGhCMn0gReoGALj2oM7SLC7Pknx2LbfPhC/svzE80+fy
         m1NmcQ0Xn3b4GTBw4Z7mXv5rJ0uO5Auj2PMy+nUZGd63JxMDs3sUTo09qwAPPYp9GUYY
         SH/cK3+4AFj5kqIVK9gDEBkiqVuvn8V/RElDalMVVbbhqZmEMUwf1RmeFOySKTELoeen
         P28s+1NiM95uDcWstc5k59NQc0TK9TGgd/AzcZdR1YEqierm3rRYw6JR9YNglp0/+scj
         LZrneyPq+cwrVFNZaj8f27CIqADz8du6kBYWZmt/UEuAq7GZ3FVaEImKNrmRA5NhDDoW
         D5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915091; x=1794519891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=;
        b=wVRRkBhTVa7onVMUYme4Xjry9o1fplVdHm+81yU/cD/e4QOsDeThrapwt4x418Bjnu
         c77XYubrUbn2d+FHC32ERW/crdu1ipftRSAp4NYZGsi+MlEEpzbzTlaJyq/cJ+97PCsd
         2I4edA/axFrdl/QgWnw7hiu9Fa2BloyFSRYjVdkVkVuGhT2U9IPo54Z0r0skIDEfQouM
         5S46s0i0+5mSFx1HiuDOZzVir1rCRV8PCub5iIRkp9caddjO62ZbKkI0A/R9LE3lf43T
         hxEPD45wimo5CsA5jsjX6aFQursobU0L+OvPxSral2b/NzW8nTPegpWBP3mnRFCYfFYN
         jk+A==
X-Forwarded-Encrypted: i=1; AKwUvBwANDSoS37FRGPNfzGWAdd9EsAFADbdPRoO6rbU8eN6lggpMEcXXMuhcbyWadTrX/pr8sRqbgf6nr9H560=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J1FtKF+4E2NRuRNJKsQX5XaQ9syI5hr66g/fTrzKy6bSyExAr
	lakJBugYAGS5cf2VIH+2C6bnBV++/5my4Ad96ZfTe1zVO59C0o/vmv9NpO8XBMoHgm4uwf6xwp+
	GI4WPNwwzzgnphazLgIgBHKUGCr+X27M206jmm2hH2EM0lT4hHo84COzUGvgXZHK9Lf4=
X-Gm-Gg: AYBFou2/hZXNufdczPCtpvtQnQXaoMp06+Em/rHNVrkojj8zk/kDKx4wDai6AGg5s/1
	BRwBKaoD8hDlC9LFiASjswnL7+mmvDANZQiiaZ/8hpWXlkv67EZ8k0Y+fyBTzyXiOiNE09H9AC3
	HBtzkuNA2T3gNeiqJf8tZMDXQkw64ZdDcMT/W/Hb1DhX7TrWQXDouc5AklyYzwnU7YK1fI0X1jF
	BH4KGwxakiado9wWNs+U0wzxvrr8s6iwipA3C5tXquACpppVa3oquWs+iCYxMzuOeMfzA4R47r4
	RmlS7wGFtdiipoYk2pvdMBhit2RPe+qWBUK1kLowIGTmvVfZC44Ttn2N9XvwFFNlgUEEfWQMbPy
	e7MESrT1n60DZsPAVAtVYEiS9s66brlS5NCmaohNzacNh6SbSp6D2kH/0GFi5LRYJMFAVGY0=
X-Received: by 2002:a05:7022:1007:b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b25d31dcfbmr434115c88.31.1793915091140;
        Thu, 05 Nov 2026 13:44:51 -0800 (PST)
X-Received: by 2002:a05:7022:1007:b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b25d31dcfbmr434065c88.31.1793915090303;
        Thu, 05 Nov 2026 13:44:50 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm17925920c88.12.2026.11.05.13.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:44:49 -0800 (PST)
Message-ID: <f7757478-1d34-4fc8-8798-6b5863b4351f@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:14:42 +0530
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
Subject: Re: [PATCH v6 06/15] drm/msm/a8xx: Allow nonctx reglist to include
 GMU regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-7-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-7-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX+R68nd8war1E
 Ltela39nGBJme/UpeEBQbZE+jYCHu0EiU/cO+XuKQFCgKfZD1GBEkScUJYrzqYt1RaVJbwM3Bpn
 ZS8oSD+IsvCtwMLq1C4aBBez6fGDqTg=
X-Proofpoint-GUID: j_IaV3RAYZ8ueW0QpCPuKE-cKOcT--VS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX3AIv0bp0EfUE
 zehXJMLSOAAiUvHrV63tj+FBvImeqGhie3/RJoVI0BYsbJ92wM1VuVR6JXwN/wzDrYyFzk0i6Rd
 NSZgPWW3IbywyDjHnlleBi2Yq2D3O12+LjPAnA3i9ctdmB0SgJ1z/GtcNcipZ/6rB5ECqvAkKnr
 owyAvYqvwAlmbDsHqc8cxemvQB2rmHQ4pGiAN+L0LldLE/M7FOANCwapiafIdMdlB1df9xdMlvC
 u6HYKbi6HRfoQmALSjaOlZ8AT07Yj7/xxzIB8GB+3u165IqJJ8iiRmsVCl7B6M9aQVAtz0d2icK
 fjYVPJccQrYxJa6wbTZduhQBMP1/sv0YgUub/vAw8pl1/f94pOr5Hcw7Zkd3W9rA18dMw4E8EAh
 T2UXfdN4ybSsZNwGvJe/RYUEmfxmliHoh1iP+zwnxc+5GmQpdGffuvH5LlYjz6WB8bCDlhABDRA
 Y5UjpZDFtUMOHCbfNIw==
X-Authority-Analysis: v=2.4 cv=dKUzC+Zb c=1 sm=1 tr=0 ts=6aecf8d4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2Kw845l3AHk4TKGYuZwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: j_IaV3RAYZ8ueW0QpCPuKE-cKOcT--VS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050086



On 11/6/2026 1:59 AM, Rob Clark wrote:
> From hw PoV, it's all part of the GPU.  But from dt perspective it is
> it's own device with a separate io space.  So we need to detect this and
> direct writes to the correct place.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index a29f8149493c..59898b49a201 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -373,6 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
>  	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
>  	unsigned int pipe_id, i;
> @@ -392,7 +393,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>  			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
>  				*gmem_protect = regs[i].value;
>  
> -			gpu_write(gpu, regs[i].offset, regs[i].value);
> +			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
> +				gmu_write(gmu, regs[i].offset, regs[i].value);
> +			} else {
> +				gpu_write(gpu, regs[i].offset, regs[i].value);
> +			}

Any thoughts on a common IO accessor that can handle both gpu and gmu registers?

We had issues in the past where GMU offset was used with gpu_write(). We can avoid
those confusions with a unified routine for both GPU and GMU registers.

Anyway, for this patch:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

>  		}
>  
>  		a8xx_aperture_release(gpu, flags);

