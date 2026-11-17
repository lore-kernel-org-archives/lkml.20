Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930820;
	b=kftiBXtTerm5g3WU3Hay9vaUExwDgvu0yj8K41pUHaUMtlVmLpDQwfVLrk7An4wD7xCk
	 LBvUz7VyACSvemrK2W0ahTpPbbc0dBob8gAdthgjlwvVUPMC7IopCrzvMLipsiCSaZgtg
	 LECBK1zcTUghVkic6YoA+0orS0xVfu55+/l2Q1dZlx2V8cklCe3qn8KRJkfsrgk1JFwth
	 nDcaLGcQ5s5Q/Zk/sGa78hwM68sVSwHhFLOj7DxaxulsErGgEChVU+w5HeRKK0aIImeqC
	 Uxj9DxFpAhk0i/cNtF0TUncaKxrNNEGm55DqsfwX3f4pOGh9Cap3kHYg2+19d35qX1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=;
	b=XxHh56e4PIGq846aILq20RrjxSoTfhC8PcCLgk4bLGSexEgw5RTPTUvPkQbVLS2lDhN0
	 3LxiP/UHcnMw262FPWuvaZPg+/0LVUZFxJkISSG38N1ZYVl5XWkryKvI2ozZ3XyNPxDtj
	 wPK7GFUqhILYyjXkQ2jYcItA0R1Do8IGrAmqzU1ahps2IxUFFxvWUtzYaedt8sGvIlw/P
	 lwpwWoapN8pz5HYI5YCgWff2t4D6Iy72QJThH88M7lYqA0hEj6I/PIVGac0fpwLlmHlUH
	 145QrmJRXj2x+kBzSSON4KmpjsiGO95PnS4lqEheBMzthoI5yOK5wnyKrQdOtbthxfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9TG3SCW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MhiXkOYi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42D606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B42D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9TG3SCW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MhiXkOYi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQdjP995092
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=; b=I9TG3SCWJ6lkD1NR
	pUxWMa9d0lcG2X6bj2TbToPcltL1ru8l452fZfi4Erb8sl/1l8pQEACc9xQSrIQW
	ekDh0qCEb0cgMl42yqXr/te5CS9YWlhGBWGcIcTZErGDYkdZUOiocd+DlGq/28xG
	D6LdlMHPELugGS7gN6BxduVu3nmcZCZGvDJuDUh2COwd5kY7tuwoNhU8s0ZvcyFR
	K4e+N3H86zyCS5OCaDntRfREwKYVlT5/pI84NiobWRewqyNe8q3T0TQ4xD3p4K3J
	tNcUarnBm6uVkaf6yMEkiiDygKa/A651EU4ci5clv+qrDzpuer8Dv9AOS4/g6HRk
	ohxwPA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd29dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:53:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2cabc2086so109041137.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930818; x=1795535618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=;
        b=MhiXkOYi1L4ndX2ZhnZnTsgoXr6/d3vPWAkzw6Q6CySjxuxwQ+2PhrIJJ23h7e2OsM
         f35XNr5lkHpwsgH0mR9/CqbQtVPPEvoWx1R1GwQg5EMShKxwJ6rII/jbYihpaIOp9m7w
         sQE7XUWI8i/9u809aZXxre+10d0xyo2JAELUnuuMqYyhRPybVJ3gSAdvqIB5xU24W0qU
         /nzVkKyPz4NEEV2XqN3YVbVF4eHQzZ6drOx18TkBUjp5bhk2moDeVrhLS41dPHx9paJh
         IXD/hXN+LqKftUZc+MIjVeiUKjXx7OOZNFpr96YPZ4r1JgT5xJgq/feOwUTLkRXT1i1l
         4kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930818; x=1795535618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=;
        b=JCV+uM+HTA0BKJANt7IZ6z1H03QzsbQs9jWCoAt+Z0qN8hqek4iS1dCxd9I/vZVfZH
         uLJh5osXo32zbCFaROoegaHMURheouN7TkrAkphZdPAVyTiOkAinze4KGujuhPlUvbtH
         60H/g2AmGVW7W+6YRIV9jnsBx5bFatAJf9NVobfHIvtZjG3SIh96YVgOEOBKy7o4MZkC
         ctDijUFxfgnA0d96or3dB3n3UPbp4KFVG3/pruyhCbn5JfIR4VbrVWEqhAxrc8hU2+lG
         PACjZr+FhuqyXZ3MMtef+rEeWovfO4DI8cysLKkj6msBxkQSqr6loJCMrby8yOytPEJO
         edbA==
X-Forwarded-Encrypted: i=1; AL+hErH9DAR3O1vZdF/CbSFNNGohzB/T3lTeuNxtYMmC6kMzIedOZreemyp7giB3sQi2W6gKFT0WnlLVsUDWkLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GNgAMSSIRlcn2rc9xKOKYKwZ1+PXnE97fvdgoXsy0CheeI9V1
	CjhhFnoWJPwV52e4BwR82cS+IUqaUdF7Jya7e0C5XrHeKQHtCDoYwjGEJenO2A9qpddoRm9t9sI
	S1k0kGscxjtwG+3FZQm8GvEkp5gXSgbv62PQeQoqvFu6uIS1oPNXJH0M2CnqQ59noJ1c=
X-Gm-Gg: AYBFou0CuXaOGrfYTHqulx89jEqySuLdpGrmpmvltmYbcu/ybVZeM0BZY8ERJe09XPx
	GTMbpCe+r8sO1KT80EatTvYRV9RtNz8vrbkLMFKEzmOIGpLfSOnI45hK9pHyNw6ww6xg2Zc0rIG
	HfFhX6+bLSOkSBGDZrsPvrxhBE127Fu+Le1IyyaigyooKhGxd769B9Guyurkp7FhVc2cKboTjNf
	ELs8A9fCqc84EWn/Adp5bQaPCwxog/Ff97dulcLnSNGYHxkMJ60fbhEmLWvvVtRlEniAeEy1DAr
	RYYkQdZEa3v5+veDarg2P1DKbWbZ/MdCov4odclL0PB9t4dkhmiV8nI79Z1MzPflKZjCaBi+0w0
	+Ro99G9X9UGLXVHys/xFzeKT1nrG6JcXCbaCqECF++OsBmrLKkZTkW+M/Lkvit69EAkd/Q4ObH6
	PtVSs=
X-Received: by 2002:a05:6122:c2c5:20b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee34a7da4emr5532923e0c.4.1794930817563;
        Tue, 17 Nov 2026 07:53:37 -0800 (PST)
X-Received: by 2002:a05:6122:c2c5:20b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee34a7da4emr5532897e0c.4.1794930817117;
        Tue, 17 Nov 2026 07:53:37 -0800 (PST)
Received: from [172.20.97.52] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm47416065e9.15.2026.11.17.07.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:53:36 -0800 (PST)
Message-ID: <079897df-fa2c-4ba0-bd45-7b357783b0a8@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:53:34 +0100
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
Subject: Re: [PATCH 1/3] drm/msm/a3xx: report CP protected mode faults
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc7882 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Pyg9J2lIzH036oXokOIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX0O9WP+PsBdgi
 ajYVK9vxDVEt5QkkmhSVQmsxUs0dd4180Lar9pW5czbDko17oRJsVdFOp+r4KTI51fPNnJ4MvMP
 UNrufNIaCEqZOxSK47tjVd10NP3a1bs=
X-Proofpoint-GUID: f0831Yt0dKXsumTnAAU7d27Ri2MgQO1g
X-Proofpoint-ORIG-GUID: f0831Yt0dKXsumTnAAU7d27Ri2MgQO1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX5fz7teabpipk
 wybnwcd7bTRYRBdW9hwyjusDaDR66aCjPIDJqz1cic/a5FhdP/DuPrSErUB+BmbE7Ix+95/A3Jh
 K5gh1nOWebbRYnBZQOdUX3UQiP/rVSrU3JrNO0RWuC6FgTki4yc/vKjQC4LzVsZpJxabZcNwYlY
 ADZ7OSOqutLZvPF9glSdsobM7T92dA9nx58aMrhBqP7RKS5TVDep8ZUg3LvcUqGReMNV/dx6Ilj
 dZNVRMnZdlrvH0uVgfQ2v5NSz9ds2/29QcB06zV4OMDARh8c+j1ArHfzSj7zn9wSpbNWskPJvm0
 HPMc4YdSaI+CtyCoDcdZNoIMtRciKjuKmU8fmqayyQrQNZhJ6RQKERoD4+qIXoG99FkI+lWUtGG
 /V8L9w8Xez9CUrg2vNMqFMFS0plMIdkISMGShKgQaMqE9NkVxYhQt/1d1QdSTm5ROjYgZ75Zovk
 ZuQwNxjraWVFczzr2DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170063



On 11-Nov-26 14:05, Dmitry Baryshkov wrote:
> a3xx_irq() acks every interrupt without looking at it, so a write to a
> protected register shows up only as a hangcheck timeout with no hint of
> which register was hit. Print the faulting address the way a4xx and a5xx
> already do.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 160d302e16a3..7e03b7305493 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
>  	status = gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
>  	DBG("%s: %08x", gpu->name, status);
>  
> -	// TODO
> +	if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
> +		u32 val = gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
> +
> +		dev_err_ratelimited(gpu->dev->dev,
> +			"CP | protected mode error | %s | addr=0x%8.8X | status=0x%8.8X\n",
> +			val & (1 << 24) ? "WRITE" : "READ",
> +			(val & 0xFFFFF) >> 2, val);

I would really like BIT/GENMASK here..

Konrad
