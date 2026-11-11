Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415996;
	b=qJDTmzlCc0qyQuU3JpPUV6bNDxAA9BfuD/3dOyT/kICWVIFqdVS0TqhY6k52aDz3Xjrc
	 1CSD++DXRgkOjsIE8AcXxQbn2ZPZE6pTTKsxwOQVk2/Tim+EJZnQObJv5LLuV1+qSgCTH
	 WFw/G8DfbeG24TnpwAqmnwmIx0LBmZ5+6ww+Qhuwo9vo5jFsL08Z4YTLiJ5dMnBB2kAsA
	 0w5gOzyBuAKzS9q/yaY0knAKr17JYwksWUPY5+5blEjDLzIwuKvw40ShzdD4ReXkM7S0B
	 hgmVDVzMKFIYU5j1PyGU2ARgVd5ql9NajAigWzvELQRcyotI4voAnuah3xNSVBU57LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415996;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7lWeOV9IjYiGNbkklH7++lsoUrJceNa8llVVsVssTr0=;
	b=nWrfr0NbwaG5IQLbQ9X/4rt6jonPnjhxQg7zvroNJa6kSFBEFVT0rIWnck8FTU6pnfhL
	 4tLf26BzdEV0x+yRdplYedhvQTp4Zzr/GL/it/AS10B4dQ4EeVgTCEP55YGuZ1xBOYOAt
	 fqF3wmIc5BKcCMOdjB7Ez/qeL6zGJPpU0zjMQSlMhVcdT/Ab/xpC+JuZTG+GNDIY7+BMB
	 Ea+9iSv3aam/4StCbTsjnZoUZy3htgL4B+lKlRp8l7blzoT5RuBiXFzYbY09N6ogddKui
	 58WQTjnKJo2ETQ/u9cncvlK+bxuGjgnAAErbN56icg9UmLfLa9CHHytqSHya+Jy8Efg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJU1cLp+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aTCvjUm2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0E0606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E0E0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJU1cLp+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aTCvjUm2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0WiA2594095
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7lWeOV9IjYiGNbkklH7++lso
	UrJceNa8llVVsVssTr0=; b=WJU1cLp+YpPvMnX+2WrEqieAhymCJI3DZsfYb6Ik
	dIWfqHO4uDNn3KEl69NPcN8Mg2gOOvHcmEx7hmGyjWoz6lLqMNUjmqxomwUwfOk+
	qNCVtL/ymnON4otGXKP2V3TRL1YAbQ+38Gz2LrkcI5qRZNhMjXInNapxaeOXuinB
	SO5bggvMNmf80PJaM58kA+atFEU2M/3d17lEYg2USobLR7DT4P7R8FFuT/sQSbm8
	3ohbrF5bb9HsvZT9WBrnbxLbTDjdM038jfzO2pRAx+q/MTFH/EMnq2epa84xRD3G
	7ma2abWVuJyoqbDBADjLs/h3Rppl3Es9euHJGGsx5K9/sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma7d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:53:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so613475685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794415994; x=1795020794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lWeOV9IjYiGNbkklH7++lsoUrJceNa8llVVsVssTr0=;
        b=aTCvjUm2GbXxhJufG95LMv2P6KWW1CUWtdGrFD63b6gkw/u94ag4D+A48Cm5ephM6O
         AzAV73zGH6vhCYWLXU6zEfkzaYpAqzBOkz0z/tnlI/bidtWuIBvYRnsCFjYo1/+TQHy6
         UW3hrynqBibAmqq4E7EMIb3QnnD8YWn3QpbPihoMMkm/j6J7AxGlDpaXPMgsR2B5qTPo
         Z6fpQzNnNW8FcurPt2ruU7sop8MztJyM+hRNu6/raaBiVobMfBb5F+fshyqg6E1qP9bd
         0XKvzuoK33PT2eRaxwOKi5em1aTfewrzFO7os3hdrRz+7iZugzLWmnhcn/NUNRT7M1al
         Vkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415994; x=1795020794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lWeOV9IjYiGNbkklH7++lsoUrJceNa8llVVsVssTr0=;
        b=gWVwM8eGmLQM5bjMAIxkWqHKasj9fREjBEStYd8CvwQxxSTguJmdcQiU+znqc8boME
         R9emObgOQFOily7txcFaOqr+SG5QyrmpdOT+QnP7/l1NdkX5G2yceF/vJNmRmQA0oxrU
         ZtDOdKMbvQx0cDOlQiYkugPLtsuia1im19Mq9UdafkrjuSfCFRW7RUZz9KEGB4IMBZfF
         zW1WU0C8PLRvOn45aabTuwwzTEXUxzRn6wcXQhEiSu4flfizl8p/8mplUlOoSg7KVDQd
         25UwXvGS+Y96CpVOSafcMmKDhb+oGKwARuqPvGqxXfNYgYaBolSjvBxUGATQCLeV/IMx
         imnw==
X-Forwarded-Encrypted: i=1; AL+hErFiSL4C9tuKaqaLk7hZbOOCiJJMcCGpm+6a5fgCxhQMfLeAZnMcCxe8HheGsUCaXacFknJskXzJnMam9rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WoNGhum4d4Aun1ocpqR1NX7CsiPSQIIRomhPizcNiCXtw6TjT
	TwzjP6MhTX3xJfGiqD/9UFlV8353JToHjTNuouR1Kvq9myo3onM0AzqcNIz7vOIer+bW3qa6sU2
	D5KDGccQL0jWs9kNqFtuddiT/T4fA/zuXA68nErUQ6oUm1k4hxOoAQKxIA4GKQiRluNE=
X-Gm-Gg: AYBFou3J/oIhQ+3tlhDZai81qKKuhCAYoIaIuSf5TJxOulLi0D5OgyilC2S/OIYEftP
	S9MFOHUzCaDhtbgD5jIP+oSrDxe/tZxX533hkaNmw7wuIZdUW2F10kuc7ZpQvrDnNYl1IHmPoTe
	gnhrVTb2n75Muhu1uj4z6i4ChGPZEG4GRvLD4EgyW2xawvq8Jn0RC+hmUNncm7wiD1yBhMebipz
	pEY9z+4QG7DViui3xy+NsXXAtVhsOrjYsxuP/d+UvTEvYmQBJ09XN3B/5anEo7Ms4sVFls06SpT
	MduNsMjIDxIS5V5vEulOhiK/fR/GRYEnz5GHfh5m0uyDvSQW/vc1GsWHCI55JPvjIiO6X9kXThB
	TsnlK5Mkqu7+XOGfFZYmbF1nfSePH5w9fE0xTNh64PRU6FkJfScUVLdUeS9FrkQQNXx9BPZKG8p
	1nj77iW9KguhKCnVNeht8V6yRArumHAldX+a7aspA9GdRx0//Mrt1fjiUwzVEYQg==
X-Received: by 2002:a05:620a:1a02:b0:947:7691:7316 with SMTP id af79cd13be357-947b00317damr467214585a.81.1794415994367;
        Wed, 11 Nov 2026 08:53:14 -0800 (PST)
X-Received: by 2002:a05:620a:1a02:b0:947:7691:7316 with SMTP id af79cd13be357-947b00317damr467207285a.81.1794415993546;
        Wed, 11 Nov 2026 08:53:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0922925fsm12779561fa.15.2026.11.11.08.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:53:12 -0800 (PST)
Date: Wed, 11 Nov 2026 18:53:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/msm/dpu: add SSPP op to program the source split
 order
Message-ID: <3b2yzvkwzveujzg6kyedvqlcddiqqmjzrumagiinzovhwqttsi@q53rugd3zkxk>
References: <20261010-pipe_order-v1-0-9d8bd29fd78a@oss.qualcomm.com>
 <20261010-pipe_order-v1-2-9d8bd29fd78a@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010-pipe_order-v1-2-9d8bd29fd78a@oss.qualcomm.com>
X-Proofpoint-GUID: aqm5oK1TcWZ4AaIDOd7lh2CmZs9p6Sd5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX+jW9+NKRvVpq
 jPS/E/1AEm3+oyY5tOvozXR4KefsZbiX4FzhAUzr+RE8zoQfkrPjH0MAye0Ax4K/20swcyvVffg
 PZPWXEOgQHh75pGV5D07V7bVwhZb00WHYWLqMGm1mI0iQHKfkJ77rd6/U8C8Xj5CnElP3OgGPyA
 gpz/eZKPlrf/tlybKAzOmzmAlHcryhwMnAz0yCDdJoGy1E2U2HxDsEDkRSqc5s+06M+y2g2K/Ee
 ARqo1LZjCi4iTeL6Qt9p4hlJEq8mc4G9mfhC0NFN8vLs8ONPCGic6SppvSGGxBmHbgTo/uLK4XL
 O750ttnQ2g+9Y1M9lZvtU7adqe40KP3r35LOW08yB+qRkAk4T1WQEIBPMt/42/occZc8PZVbUom
 u8KJeEtvEMW+0gJhIP9NyNunYEVwGA1hvv2mXTARBMRtYAAnNPZxns9yAgVWNGXjR8sBTfhmew3
 UC+WY4hQIeausO9MJYw==
X-Proofpoint-ORIG-GUID: aqm5oK1TcWZ4AaIDOd7lh2CmZs9p6Sd5
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af49d7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zXlURQC4rpLtYXS3vwUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX2bQs7Xcd79RA
 r1l0BnfQ9ZQDK/M52jL+XpcJJ2Zwi0UrLVR/OAoCpVLreZwZ71VTdHgJS8tkoEpahjMmbzCKrrm
 WBh5NnLoLp2tku81n3c1esiHB8oKz1U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

On Sat, Oct 10, 2026 at 07:08:22PM +0530, Mahadevan P wrote:
> DPU 5.0 introduced SRC_SPLIT_ORDER in bit 4 of SSPP_SRC_OP_MODE and
> SSPP_SRC_OP_MODE_REC1. For source-split pairs using legacy CTL routing,
> this field identifies the left source with 0 and the right source with 1.
> 
> Add a setup_src_split_order() operation for the SSPP register layout
> used on DPU 5.0 through 12.x. Select SSPP_SRC_OP_MODE for SOLO or RECT0
> and SSPP_SRC_OP_MODE_REC1 for RECT1, and update only the ordering bit.
> 
> Assisted-by: LLM
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 35 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 11 +++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index b5e50fc1916f..f6ec883f9066 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -84,6 +84,7 @@
>  #define MDSS_MDP_OP_IGC_EN                 BIT(16)
>  #define MDSS_MDP_OP_FLIP_UD                BIT(14)
>  #define MDSS_MDP_OP_FLIP_LR                BIT(13)
> +#define MDSS_MDP_OP_SRC_SPLIT_ORDER        BIT(4)
>  #define MDSS_MDP_OP_BWC_EN                 BIT(0)
>  #define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
>  #define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
> @@ -260,6 +261,38 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  				 ubwc_ctrl_off, ubwc_error_off);
>  }
>  
> +void dpu_hw_setup_src_split_order_impl(struct dpu_hw_sspp *ctx,
> +				       u32 op_mode_off, bool right)

static

> +{
> +	u32 opmode;
> +
> +	opmode = DPU_REG_READ(&ctx->hw, op_mode_off);
> +	if (right)
> +		opmode |= MDSS_MDP_OP_SRC_SPLIT_ORDER;
> +	else
> +		opmode &= ~MDSS_MDP_OP_SRC_SPLIT_ORDER;
> +
> +	DPU_REG_WRITE(&ctx->hw, op_mode_off, opmode);
> +}
> +
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 69d68cc916b2..9b9ea2e00a00 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -236,6 +236,14 @@ struct dpu_hw_sspp_ops {
>  
>  	void (*setup_multirect)(struct dpu_sw_pipe *pipe);
>  
> +	/**
> +	 * @setup_src_split_order: program the position of the pipe within
> +	 *                         a source split pair
> +	 * @pipe: Pointer to pipe context
> +	 * @right: true if the pipe fetches the right half of the pair
> +	 */
> +	void (*setup_src_split_order)(struct dpu_sw_pipe *pipe, bool right);
> +
>  	/**
>  	 * @setup_sharpening: setup sharpening
>  	 * @ctx: Pointer to pipe context
> @@ -349,6 +357,9 @@ void dpu_hw_setup_multirect_impl(struct dpu_sw_pipe *pipe,
>  				 struct dpu_hw_sspp *ctx,
>  				 u32 op_mode_off);
>  
> +void dpu_hw_setup_src_split_order_impl(struct dpu_hw_sspp *ctx,
> +				       u32 op_mode_off, bool right);

It's not used outside of the original file, drop.

> +
>  void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format *fmt,
>  			      u32 flags, struct dpu_hw_sspp *ctx,
>  			      u32 op_mode_off, u32 unpack_pat_off, u32 format_off,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
