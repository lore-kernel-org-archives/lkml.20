Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006472;
	b=v1SXvEnchLauVxITPstB9FqbKX+Z5aHdKMmm5oRMO7gf2i2k9Zxfi8zzkt+g5YaLDxE7
	 CtnLRE15xbIHTBcui+zv0VxF4+VCBat7djSVNaxJ10LrWz5NGDoRKZ4aRPBTKjzNc3VyI
	 1M5eqItMRyaA3i/crCKthhbbn5/X5x0so3+B3e9EEHlN/NYiq94SwCwH0HXM9akin4eJD
	 1HvfAPbcGjzWd1N0H4XvmS7DuQyIbsKGa1L1KP7Uw/VGDhDwL9m++r4MCWAaQ2SOsiWnk
	 lLby2mJ2f9SKUGGlaZ2LcNUkDydt1/rra84MdsB91O8u8bHUDjAqW/ifXaZbfTcUwPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=;
	b=3r2TwCQwR5VZLAPI12zvlzIQdjjOEWpUAmDytrybfIASch8WNyAvVwJ2Z7FicCg1Rt0E
	 Vfk111ATKs3kiMp4AkhvglHnWQr5OQpSGvxQHRwXgdbYBF8Ny3Y7oBvnjhzfoIultAPsB
	 wRtKG0M/xXlMBivXeP1XnuEppFsuDBJMPRaT0vm/oPdxT6fJOWONBlQoT+nhWoTAIvkLu
	 4gA9r1pyjFfGGjgMmD/NdV2LqCL2Ie9A/erKl9pWo7nEpdYM1W60uyhuXLUmuB2TJF37J
	 4ElJQpVf3/ZulCWCm9MIhaDpUX456ju8ubNZj96apDdmavvt7rNm72SVG3DjgLlD2Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h6Y0oEWA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6PnV0xR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC22A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC22A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h6Y0oEWA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X6PnV0xR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b85A1908167
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=; b=h6Y0oEWA0ENairNF
	O1YRQJwuTXnKRSqGAu4ITnPg5XNsSEgeBHRCuP8GxMUL0vikQ8kCgR0ntF6Imybj
	oNrLvXThJt6y1gbvrB3uqu5Q1rvYyorZkSL0bFIQs1kXR6IGJOKv7D+bGYUFYgZ3
	Jeq2hgPafQaLfS/Wz4kvEMqNNwgO8xBSCe9jWhidUdueJDzTzZ3HULwfBYaNjHf4
	PkYL6iTf4G7rvwzs4Jr8b8/MjEKO1x3eVJhz34fiWxMA2fHdKhYVfnlhw6EjkJPf
	Lz5pPO4pjIryofSl6wX3ZqsGDtaZzkMeuxMTwcJkD+6U6cax9BgtQitN1GdK+7IM
	WeJ0Qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gnr66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:21:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso28047285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006470; x=1793611270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=;
        b=X6PnV0xR9woVRNgSiO6dCHb2ehUj3leZFWLD70JovJu1iAB2YlriMiTpl0Pj61242g
         eaoXkC+YLdS57AZn5CXtBuxrxl8ccNpQXDabTe2yhqBA2kKqMqRr9cDbgoeuNjfkqgM5
         pCdfr1l+ulLTK6YM8jar0DExhwR5CqiqJJZVaiiUZN1pCspm3/Lk8UCVqK/inhvAAK85
         Z5S7gZBhzO4YMmcSDdFjGgVjHZEREgtkEdSisE1Ng5iaHx0KFlVw+T6Xjuiz0Csgo4HJ
         ECTIPaEX7g70nBTYD72LidsiEW1+lEG3XmIW70QZiz6m+SfniOU9iOspH2rKifI4Cijv
         ccyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006470; x=1793611270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYl7nG9VCZ7POIwjt2f7CoGn454MZk1gl17DIn6O5n8=;
        b=W8GaBY5T6ZVvGP6TCz9aJ8bnIQ5rhrLTrAYHjMmuQNtejS2fGHwNgEM0klOJ96knqS
         PbqXCIH1tS7aSJLFL5vdjsbHznGMxZDcnoDIi6NfrfuhkL5kgJtpNq9o/1wXnoFmrLPG
         b1pbmS7bAf4VmSc5E8qGB9Cxz7sYs3iWvEZEHx62JlOcxJxguBJx8oW3MVz4eXdZ7//u
         xL6fbRnI+xrB8to3nwD/B6nr9o4p7QK7w81DnpjkZJdsF34rUp6bLdAwm1g5FqN0GJnX
         mth8NFOr4JAXFeEh3o1dkHfbz/KHHjos8fF1eJITY0JMxNsLoTC9+NSZ2jc0T5yngnYv
         Kfcg==
X-Forwarded-Encrypted: i=1; AKwUvBxYruk+RjMBPCaiRjoBVXHEH7jzli5ff+cFaX5eiGZ2W/eA22vepUDk82rXzdoHSrYN31bEXO/uP5pM05I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/b+uYjujEE4H6BBB/7CHap4tCtirV8DMYkbEkf20lCms3lHqg
	o3A5V9PybSPDnYweDCPS5O4oQ/PbdLuTfprf/XlFFUIoLzMrHbXv4I8aVo+vfxm+VmT2qxraNI4
	Ry28WTtlu9QoSdFP5gZzfapHjO2vWGppPcFASNOoyQyKMDRgBcSDGXY8oIZ8oEn1pNiU=
X-Gm-Gg: AYBFou3gVAHKUeHvfAv3LxVWgllEgu6u0hi9M/i1SFNvO8Fe+jzPbebSUcBECcNAmnP
	s3zMVqw++aQ2GMR+ABs5ZdhYtNq3wr/Z1ojn6dssiHeDTGmzBN1jhTJYS0+QL2/ZdDqntKZRVlA
	BewgYNUjLiHrCmNUYHDxEsN8pSlf8TYMNeXEkZiGOqSFK03zzIFgJFX1tom0cnUlhs0X2RBtoB/
	QFJ3iSrgD+Zyr+a8prkZnHhZIaPqdqZaZe3ItKd92GFQw/Me/LB1uhHsU9Y7UIzfalJqQgqvHtF
	r9XaZO6ksT57Ju9R1vUBzXbrOtZfEDpX7V1c4eIGaI0SK/vAo8mCcygwpFWz3MDM5ISDqNsojCK
	bLlygWxHmqN5apKFzHgdZUQ==
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr952636685a.1.1793006470019;
        Mon, 26 Oct 2026 02:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:8703:10b0:93a:14c:329c with SMTP id af79cd13be357-940ef7c179dmr952634785a.1.1793006469588;
        Mon, 26 Oct 2026 02:21:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm294029966b.10.2026.10.26.02.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:21:08 -0700 (PDT)
Message-ID: <f932be26-d911-4c77-b958-353001929692@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:21:06 +0100
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
Subject: Re: [PATCH v3 01/14] drm/msm: fail the snapshot init when its worker
 cannot be created
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-1-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-1-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yb6IyZ_c6Ykq9f3yf2_8HPpUpr-5dhxw
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adf1b86 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=O4p-ns5tyOGKaCv9pfgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yb6IyZ_c6Ykq9f3yf2_8HPpUpr-5dhxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX7flIRFJ3WoRN
 BJc9CEyC67ff0xqDPAVIuRVX6sCQ0MCTwFZ8Ztw3dFVg8iaKrrcFh4JIztpY0ykxHFzPOMrZKz+
 iGLOAZ5ZPZ3ZCieSRKW1ftF580iHfzgyLCuYAOym1oKplQOShvT1rcU/311GbUB8xmg56B31Wmj
 PxhotRG0qWVQAxwq8PDyRROFetdj6wMTPbJLyRt/IxoyfqLAkSd7SQZ1yyrfKViiiapL7Nv7gXE
 e8n7KK1sJN8WlXi0jpAoELKZA1mRpiF2cgKKKwUj20EOs6VMSJwWoNc0/kqdmq2I7AfI+PYcOvU
 3z7G/cxZdce3qFlorCXqspv1bRYoYv25XKJJg+F39jKoeVUqYeLj71HNELMPtedDhhkZljeUugP
 MyPaISQzqUB/DnF1Sp1xl0St7sYTKVEXaQdxfG8ugYq00fUjzBxZWiNnKhtIYmZIh1VTLGCitVS
 5l6HzmxU7E/QjVFYL6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX7XgVCUnZ2JBc
 DplkmxZDrXHzTdcgOPicLqM2r6Wnp1brkAVJPrwCGyemrE27ZYfKAg72MM0Lm/soVRrPPv55kOu
 5jXUV2ulfNHOvy7Q+eojfEBgTZVuLCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
> returns success, leaving the error pointer in kms->dump_worker.  Both of
> its users then dereference it: msm_disp_snapshot_state() queues the dump
> work on it on the first display error, and msm_disp_snapshot_destroy()
> only checks the pointer for NULL before passing it to
> kthread_destroy_worker().
> 
> Clear the pointer and return the error instead, so that the KMS init
> fails rather than leaving a snapshot facility which crashes when used.
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> index d99771684728..d1b10656e41a 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
> @@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
>  {
>  	struct msm_drm_private *priv;
>  	struct msm_kms *kms;
> +	int ret;
>  
>  	if (!drm_dev) {
>  		DRM_ERROR("invalid params\n");
> @@ -110,12 +111,21 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
>  	mutex_init(&kms->dump_mutex);
>  
>  	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
> -	if (IS_ERR(kms->dump_worker))
> +	if (IS_ERR(kms->dump_worker)) {
> +		ret = PTR_ERR(kms->dump_worker);
>  		DRM_ERROR("failed to create disp state task\n");
> +		goto err_destroy_mutex;
> +	}
>  
>  	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
>  
>  	return 0;
> +
> +err_destroy_mutex:
> +	kms->dump_worker = NULL;
> +	mutex_destroy(&kms->dump_mutex);

LLM:

The error path calls mutex_destroy(&kms->dump_mutex), but
msm_disp_snapshot_destroy() runs later on the same failure path and
destroys the mutex again. That's harmless in practice (mutex_destroy()
on an unlocked mutex is benign, and the debug checks don't fire), but
it's a redundant double destroy. A simpler version would drop the mutex
handling from the error path and let the destroy function own it

Konrad
