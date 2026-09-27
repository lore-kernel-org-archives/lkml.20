Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD43B42D7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790533534; cv=none; b=rp6F6+DzDGYXVniVWIJHjHxevgxwP717JBl23WMeQtHRlC2mpwYzS6parkmGdriEbA5X5qTCJ7kKmGQnhheQ0HH+F2twopUBFYMCNyWu200l/Ozsc8tXJ0aljJjDXShIeMYvwCs4UidvLgA0biXhyecxBZfvPV9D3Z2BhCZEO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790533534; c=relaxed/simple;
	bh=aXfyzzxMn15wcJM59JSZ909Fa2u2VlwzaGtsLMF0mRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chY0wHxBrhVkf6lwsyx3/zRWg2/egTfLbrJT0bgpu0dGUouZHE7FoYtX3vBvz75mwZoyqrd8c/z2gdb97Rw7rvAw6JVxdqem/1aYuMD901YVDDUSfbgg4nAzdXYuKR3NR9sWyz6lkNPwpBzv5xyGIee/LF381MrzWjpfAkZtdZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNH+Z5N8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bl03St0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNH+Z5N8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bl03St0W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RApb3Z2376652
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=psWMezYs962Qvz0Ag5XK+ISQ
	ZvPQmczAqE5pDosFazI=; b=QNH+Z5N8jUyspqYuNpVyU+/wu8vt/eYQlnwGtLe9
	KmeTHXX+Iv0FS0L8+xUikLc8PenTYw0/SX9vGRQc/58sQUvdAWgkSCZZc/6VcENo
	gmGGoDJIAJTOHj4DJaCrJVxi4wv2w3Ve5/pT8xE/wpLJu3huzNBSNFme2QyDEzBo
	K2RUXYa63P312je8cEeCWPJadlQ3iCaC/Pve9DUdAd3eIcC7gKUCIJWuLHLXyDZw
	GdS6AkPRELO8vLhOO4tQN9AZCYSST/KZB3X1EaMU6FqPVkKt+rW/orQnZ/OJMdL0
	qpLHtvoo9Aa5jDC4yKIwyAalAZkKKYlUpVJK7GowibFCDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp3sja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:25:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso503519585a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790533532; x=1791138332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psWMezYs962Qvz0Ag5XK+ISQZvPQmczAqE5pDosFazI=;
        b=bl03St0WoNz/GaS1Xm7DJGOgPYhZe8f82jME+7vhzGN/dngJ+bbKh5m5ld1y1Y2r1I
         N3y+lJOi6EhesMMgRf5u5xIEPeHFWg9OewslXrJ54xCrgZJTitljOp8sMellpGP66zuO
         7bqI520wFewoTXJrlQhSHeaZ4VtwId1ZxVTN0Jje+T3+2IwM2+ehGmeduopDbKHTqX0h
         DhlisK6um6qKRTEuypwvR426224UXUpT9vG5Feb9X8qKviDl5Qs8uyYmUXhDzaSZVOMB
         hRUjeHr23A6n36DGj99Mv5SYZ01+Xq2m2CBdJVpUYeCKF2oQ+/4qndDyqVhewXViyS8n
         IKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790533532; x=1791138332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psWMezYs962Qvz0Ag5XK+ISQZvPQmczAqE5pDosFazI=;
        b=1+Kz2L135SEATn4XMhKMykqeU8Fltvb6vZ0/HpCt23KKEPFtzsU+efHQw32uYAvcYA
         qHly996fe0X5IC9YG3X4N7yldmnDeG0C5WXyb4b9GOWDzXad+27zXQ1ffBmBk+4SmaSE
         oVKugB6XuZ2WeF3f1UNQoa/PAaK4exqcSLySrhfYV0pJZp1Es7jBYAjc7TZmQvnhH0Dj
         bJsi5WP0WuOAlwVAUAuAXdPzUlTjIwwnZEjXU4AmGbto8CGOzgxEkUKUaOIvRDtMTPn8
         QjCjcuqIpH043iOwZflh6rP2lM8KHB5d87r84IPLLHP6OanSDqnf5xsXVAUDbXVQqxrq
         yhwA==
X-Forwarded-Encrypted: i=1; AKwUvByH+fl1UhI+a4d1UyG1rbtv4fwm5okvo/12pZzUXKmhmTEcFHbgeleS671Ne5mPZ8/afhCwVqcqwQQkuUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mmgx3cnOM3C169MjZ/UWljsSLo5mzaa9hU0GTAP61EcV4sqodQ
	Ho4/9+7N2PxCtRQC9kgxlcTdLAkZNBgKhCbaoo/p3aUt3u5NhojtBkuewK5h8K1UvK7VcCsv1MG
	Mv6SFpujMRuuSHM3uBJX16PB4hwi+ljGtLXqVDMixYUM09/Dn5iH9oFQJpypVXnJ7Vbo=
X-Gm-Gg: AYBFou0ANEV79fkdgffS08PtpRa9Qf9rNwEaPCQwNcbs4uD6qDwA7K6+/FHeWSqEnc7
	twUfC/Y/cqBpM3OlMlYbn8xcnxpVDRoYCMvacc7BPZcKnZzfcc4iaMwwZWSYRZ+UlEDP/wHQ2MB
	3ACe0+bFKssyOIvxTsgb4VWiPWwKjTSZu7IPEZYQ6dku18h6ZT2tgZr9Z7QAQ2nEgz2rS2pRIJQ
	lMY0L7kGwU+bvwApavcgfHu95N+tewtzFyz5N+JWaIi4Z0NuwJr3T4kh63zZWuyDo47Nllr8sCo
	Dv8k8uBXX0/j7Td6Zmu2B85FUV1zkFp77vQ4W5NMGJMEmY5RE5+6H4TC7vmPzwU1KQB8zIs9CeI
	qKCLndI8fqvim1y8tkDyp0USnuazjpNtWgzf66yNeAvZIsU27Mf435iLEMYBWIPJ1GNkSrwJHRE
	urgXvzuUt+5n9T
X-Received: by 2002:a05:620a:2547:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c43d17a10mr1544161885a.16.1790533531565;
        Sun, 27 Sep 2026 11:25:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93c:290e:9e9c with SMTP id af79cd13be357-93c43d17a10mr1544159285a.16.1790533531072;
        Sun, 27 Sep 2026 11:25:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b0e9bdsm1994006e87.70.2026.09.27.11.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:25:28 -0700 (PDT)
Date: Sun, 27 Sep 2026 21:25:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] media: iris: add support for vbv delay
Message-ID: <jc4vctqyyrh7gvoxv7h7ioqnrv72t73trgesscx3xpd4xwpj2m@m6no5tnmet5s>
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
 <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfXzl421lxFdMcU
 lus1mND+6lujhAjENQAllUPnbBeb09Dn8MvUUi+kVTiFWqv8TEHMaz/iLMWaDaI3pAOFLmKSOIq
 DURJm2nb3bl9zS1oVFmHALbEnc9Fo1ZvrgkdyTVdXMUOhgPD4cg4UrvhAbfBcjQoGV+o6G5GbuU
 bO/VpQJZCI4+Ul1z55IrDb0ZQXZDFHmRqynwIT0f1VyVNx9yEFlPqT06HAKLPGbzLKEH5ivE/ou
 BiHUchmHC5G3NgTDpA0u44ThlQRTRPablaC2xFcRgJ3U5KV3PowSyFJvgn+EBQzwlitjrf/zybl
 4E6NIwcN5PCNIearzZdzHq46ebHPxJUqXgg94N1gSz7hdF5NYluuqIgJD6nvPC8AwCUv/Hfb+Fg
 vX1IOsh65sO4NuIpBeSR6ScH6QFhD76q4eCe75RToVy/icQzNWpAq2uHKn7qtB8j7RjreAAukHH
 k3/PD7ppJDb6cQU/pDQ==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab95f9c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=h-tNxE82WNmto9AfkSgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XQ-05d_-Qh_58Gwkbg3u_Z-OLA0deEs3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA3MyBTYWx0ZWRfX6q1xQ5yogeFe
 KdXn4L2v9YwnIkQlgZwq52/5zjZ1KtpKF9/ySG/fjvsc11eagbaV79/vonHN3yh8vfNqSP9cVgO
 JQeE8XaUuwFdnWw4+JemRwNXD4dzlXI=
X-Proofpoint-ORIG-GUID: XQ-05d_-Qh_58Gwkbg3u_Z-OLA0deEs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270073

On Sun, Sep 27, 2026 at 09:27:46AM +0530, Sachin Kumar Garg wrote:
> Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
> exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
> HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
> is only meaningful for CBR rate-control modes.
> 
> Low VBV delay values (34-100 ms) require the encoder to run
> with a single video pipe, so extend iris_set_pipe() to force
> work_route to 1 whenever the configured VBV_DELAY falls in that
> range.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  5 files changed, 50 insertions(+), 2 deletions(-)
> 
> @@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
>  	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
> -	u32 work_route = inst->fw_caps[PIPE].value;
> +	u32 work_route = inst->fw_caps[PIPE].max;

Why is being set to the max value instead of using the .value?

>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 vbv_delay;
> +
> +	if (inst->domain == ENCODER &&
> +	    inst->fw_caps[FRAME_RC_ENABLE].value &&
> +	    inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
> +		vbv_delay = inst->fw_caps[VBV_DELAY].value;
> +		if (vbv_delay >= 34 && vbv_delay <= 100)
> +			work_route = 1;
> +	}
> +
> +	inst->fw_caps[PIPE].value = work_route;
>  
>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
-- 
With best wishes
Dmitry
