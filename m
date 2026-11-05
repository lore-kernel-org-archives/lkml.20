Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915895;
	b=OcToHIQS4vxJSgX7britZK/YQQ6uugfnvUaHlQZEXRkEP5354dI0DNW/XbnxGWjjGHta
	 q7wxhIVWGbiJ3wGutYq7+qGFQupkG1xteSIEDeBAsNt+zp2D3aJfZLjm2kpkWygPD0oWJ
	 dS/dNfQ7et++0p0RWrW5GGPo6iD6L1krGCsoEn/vriZ8hfzYRWqgp28w8LB2EATbFKQM1
	 iPDEFrMLQIHUtGj3DPbM4sZ9zjc6SEPC0yOXIIybl+4ykePEBdKIhmf13hm5wURpi3OMa
	 Q7+ueRMsLEJtAX4rXPOjIkK/hY0MEebql0yMq7Jb8/ywOAUCFHdqYu9Lg8DMfAdD46A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=;
	b=Ii3/Kmvy7VuDY9LZgN/EYlU4pgi+6l38voCc74SDk4Sj1VjJ3cLzPat8qGFI9yVfJd+w
	 WK1L1pIn3JD8JspPngf/R1q027tcaipAkH03uyQSe/z8gciEWgah9dTXJJFL70V8DwA4o
	 5gJ9URGcC9JpBkSoxJwojduYGw0EaVK0Besey0mwD7SWdHAtTtCUoAyPVezmFtUQAOxj5
	 1ySBMSh/1EC0jNTL3RDoLXE9H891n4p0rmYZJl9weAfHWq84tBOWMGlQUKMCSKLlM2Rba
	 D5Yb4SMMgqNGtlVwY24C6SIwNxT1tdi0rAB/Sj8d7IXpjFOOVQAE4XoKHPwG+i3Clhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksW5kuTU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQ1TFO62;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8854606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8854606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ksW5kuTU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQ1TFO62
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L67791585845
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=; b=ksW5kuTUtdme20pL
	Q4rm5o9B+T3Gq9tLowI20h6thiSKw2uAPDiIHNDyyn/+/KCYtuwj3cVZo0e91rxN
	KVAB57ma03rSDSU8RrA1muxaelrZFB69qP5riUKkNkzk5+IieBhxvq1BT7Hi96br
	jThd0cNAXIYbASnaEI+txk9Dy4PyZJp/l23J0uBIZxXK7dUghgyFsc9+4+MQCXKr
	w/9t6SKIDOA/yalWiWOj8U2mWEEmdgEwXusjYFo2sQqY2KskO12THKv/MXV+AUSK
	KWgXItncDQOH0l7xfcqQNcbSLAJZ22ALKvBimumAeWkzNmPj7w11Er9nrJoOU5Zf
	bKuAGA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs0wg8aej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:58:13 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso64340c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793915892; x=1794520692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=;
        b=YQ1TFO622J8CW1Cg9yFhOZCWvDpH5s6EwclNjpZLIPLAEEcoucUJvqJgat9zNX5hNa
         YUOlJy5h8KhEZEWe7soR8N4febTG9u7s+KOwtUR0wyZjrwigsK1e9A6TPXTDl+oFHPnh
         d6YWw9DZ4hgDt7oXS/fZjTn4ooCuRdcXM6uzHAps/4ZbMU0YXY8GYSitBKMTCEd7ennf
         KBYp47YQxHN6EdSA0Tg2A9G0bX33coQW3/ePcZUobrzG6UFW7FC935pdVvHadnLrIqBt
         AtMANldwk4pb3V6W0lQ58XqVvBYBTKm/s5XaRnsBmdR4gooycuw5eGM3EiAQS11MKWMj
         48sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915892; x=1794520692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=la31nE+r5Wjkc5I+4kvYjaUy2Ab5etDtNmr/mKr9EWo=;
        b=ub3oHJY4RYPv4ICA0DW/4wRBt4DDykzVSgzzE5LYhfuaB4DySexJrAgQVkd7hsRvQd
         2HKxSrgrobRnAUCKWPYMdSKOx4tOeUDiH++kq/Nv2xACZL4+45NyoaDR+OrtRL5s4Ux2
         1O0vTCpNzMl2O5V7Of8pu8pNWTLJh5kKaTROZtjfcE0I5dsaBm7ERPkxKPvcaatxXfqM
         WH66RSr/g0zfwYca4VqVYS1vtnItq7AnYnbloE23wTT0Jlyko0qLqBZoQDNYqloVPH9v
         +PaFpO9P/T2RxVPjHR4JpWSUrpLQrL0JZ1jHBb2RV2mdImFMDKBMq38V6pqDmhWP8D4t
         ftQA==
X-Forwarded-Encrypted: i=1; AKwUvBzXMjXKMFh4ob5Yl4W3bYMKlWDe5zFbw1HhK1roVbrKXXDz+m2RTI1XOmfyS/+sGbn0ibzqiyH+wCa9ZU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s6974nWgaGoM+Cer9Wz01e0fHESwKX4TYd7u19hML/cv6uXXf
	160Z57B/QPpkNtd0NXqwI6VW8ddVnTSstvrGlphYZKg9zw5FjgOkM7vlyUvEM4kk9n1LU0eMqX1
	Z8+mIKADMbNSFdnCOjPMDR5cT7vCNfNdgZoK8CtATGdiOfRQQV5YOaA0gu9qVHq4Ov8A=
X-Gm-Gg: AYBFou2oQvK68bb1gR4vzgcM+0IQQ32K1aOmfYl4nVwOPnVFhunwTBikGVn/Y1cLQjj
	PvoYqevYW3WPXmvKXwf/CQDOnCMa/VUzawszktgalddydUElM6xxHeXhh35d0/IVpnSrqpCFoGC
	dPNka5+oraQCeUmT0VBfntSsMh72MNjwjfSVkyKpx0b1RKszlH7fPu9+/OhABCvREmpKejYPcLD
	/3OyEuPv98QdpWWbWSRXnR0oyq2laIawDAaF57ifeHRpHNPeHfftB2dlH4cxwqTg3ux/9Jn/nba
	5TQZWO1mQ7C/OfETjWTR/pwYLn0at0U0lZNbdeqwO1PHoQQqnjPqcUeOTBMbKBgDwCL1deEHrx2
	bjLEsley7/YJa3yIIj9+TStKtWXs9xw/5FHczFtTSAuQQVnPyzaem/K6qzMflHjT1LPnEPSo=
X-Received: by 2002:a05:701b:4281:20b0:165:90af:a25f with SMTP id a92af1059eb24-1b25d36e618mr419908c88.41.1793915892348;
        Thu, 05 Nov 2026 13:58:12 -0800 (PST)
X-Received: by 2002:a05:701b:4281:20b0:165:90af:a25f with SMTP id a92af1059eb24-1b25d36e618mr419857c88.41.1793915891501;
        Thu, 05 Nov 2026 13:58:11 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm23076429c88.2.2026.11.05.13.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:58:11 -0800 (PST)
Message-ID: <0d7cf70f-cc16-4d9f-a53c-7f2f9e3e509d@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:28:04 +0530
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
Subject: Re: [PATCH v6 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-8-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V7PSEUr8TQNbBLnsh7EO_0su-HxvP14V
X-Authority-Analysis: v=2.4 cv=Ka9HIgYD c=1 sm=1 tr=0 ts=6aecfbf5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QD3LnjK7qLuM3IoIZgoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX+7EXx8aUlGq/
 2bd5ZfrswnOXO2gxnbDVytYaJgq66PWtucMSJG3zfgPnQ1Ck4bDk44KbT8UJv/5SA5Qnw+lNyC1
 nBp/W6/PRuasMxXIP+NvQU9dCovMizC9kU7KcRFoh5J8zOWsSg3qJrX7KSpBdXMz2tbPXlqrreB
 XLXYI7FrTKAliRH7zjNJQuOCGz93QyDGG85LRzEp721CzzvSFOrLb1oARkVp0pfZq7+TWyrJ/x5
 BfgtmOW4BbWgC7htFiaj9qpPsiVWqo07n/MzOrp8TfS4xSvdy4tgqyvq7iAJccEBJgQ8haJMtYK
 YhJDaUfMdwHKy4Lni4rHhTMTbZhBoUjAgECo3t134EbMNKA/qpQMSM6JPnEbu7QaLHr6KEslE2F
 eXFhZuZEap4sUlrVUKNHZBiD3ATGNpphsI7TpYopuvvO2bpnH5GsXmRecKUxmVMa0f7v7K4SysN
 F4pGJbB4W3nVag1O+/Q==
X-Proofpoint-GUID: V7PSEUr8TQNbBLnsh7EO_0su-HxvP14V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfXwNwTErXULUsh
 EQ8Sel9WfK+hf1CIUThT3npGpumkJgMruYlfp3+BNebD8L6+C2bN+8f960rfHFq1Eghbzv34vn3
 cuB25vJzGbuJFb8uEARdpFXa7sbySUY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050087



On 11/6/2026 1:59 AM, Rob Clark wrote:
> We can just simplify things and calculate the value, instead of manually
> adding it to the nonctx list.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index dd1a5ca91812..6c5ee227243a 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -27,7 +27,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
>  	/* Configure number of outstanding transactions to 32 */
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	/* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitration */
> @@ -309,7 +308,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
>  	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> @@ -483,7 +481,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
>  	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
>  	{ },
>  };
>  
> @@ -709,7 +706,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
>  	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> @@ -1102,7 +1098,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> @@ -1161,7 +1156,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
>  	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
>  	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
> -	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
>  	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
>  	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 59898b49a201..f65bf82e5c21 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -370,7 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  		  hbb_lo << 1 | ubwc_mode);
>  }
>  
> -static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
> +static void a8xx_nonctxt_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
> @@ -390,9 +390,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>  			if (!(BIT(pipe_id) & regs[i].pipe))
>  				continue;
>  
> -			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
> -				*gmem_protect = regs[i].value;
> -
>  			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
>  				gmu_write(gmu, regs[i].offset, regs[i].value);
>  			} else {
> @@ -638,7 +635,6 @@ static int hw_init(struct msm_gpu *gpu)
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	unsigned int pipe_id, i;
> -	u32 gmem_protect = 0;
>  	u64 gmem_range_min;
>  	int ret;
>  
> @@ -719,7 +715,7 @@ static int hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
>  
> -	a8xx_nonctxt_config(gpu, &gmem_protect);
> +	a8xx_nonctxt_config(gpu);
>  
>  	/* Enable fault detection */
>  	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
> @@ -838,8 +834,8 @@ static int hw_init(struct msm_gpu *gpu)
>  	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
>  	 * non-secure mode
>  	 */
> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
> -	WARN_ON(!gmem_protect);
> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
> +		        (adreno_gpu->info->gmem / SZ_4K) << 16);
>  	a8xx_aperture_clear(gpu);
>  
>  	if (!a6xx_gpu->pwrup_reglist_emitted) {

