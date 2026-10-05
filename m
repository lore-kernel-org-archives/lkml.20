Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B991F12FB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162312; cv=none; b=kT3T7LEtKGPsLnOz7baqTldZhHfdhh55prCoRoyywp8+2tgEhn/qPOhxLLeCHwvzjDpIvLOt9qGxI7jOQTBr+JyFl3PJn7N/BNVAydSHCF0Uk1s1aJEpxthnWrLiqeLCT6NqaX44jWfm0h3t9yi4gJ8+AI4W43QD3bAcTaguFlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162312; c=relaxed/simple;
	bh=HzobHuB97vln8orF4P76Yesl4HMPmBN6MNE38k7GSuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxnPXwg86ZXQwGoAOroZwUZtb1t9DGlJQ6IocnggvUqYcIVWDAvMtLz35GfewTqnHTgM6ZGGzgfKrhw++UMHIa5KG80aipy7kjJcXcQaPOhhQcA+wZdM0VaDNT5256xGoCJ0e3HSDy4ntQWC0L6NhQ8Fz6GD9eRlsxk3/GRgnhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHIl7WMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LC2LdyDK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHIl7WMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LC2LdyDK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6951042o3688190
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 01:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+4pnXRuP5CcnmgcmUqfYx2/q
	Ua4INOWTnjZBnXUGk14=; b=CHIl7WMcpYP1PU+FDQHLoT6+mprWCeWMYCUVHH/c
	BUNZOoUx6dIMOqmiBd9BBo5FN6c2ZYYy0B8zQkDLtSGKiJpaO7w6yz84LqpbBeGw
	47fnTybdS4ldS+E+a11p0GovalhEcTHVJ4m9xT14gMFAD/DArUqVc6qnNUfT2Isp
	c5mn6s+IIjDXLrZQ7Sc+XredfzjTPdI6joZMM8vhmLNgXoQap4gN/kuaIPpBQoFL
	oMo4jHHXvP9fNk20VcsrXJyW43frcOECg/6MRSJ+33JTSYu/wfKGwczrLg0fQSde
	Zisk8lJgVi5pBT2lOKwz8VvsLUpE0kV5dPVmA1Ea+OqsiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfhyyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:05:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so124386385a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791162309; x=1791767109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4pnXRuP5CcnmgcmUqfYx2/qUa4INOWTnjZBnXUGk14=;
        b=LC2LdyDKqaJnx6kN3T9EuBAr2hVWyi4d3ebiMsWH4r8U9YJG9bTwmdR4GgN/iCp350
         ZhvLzEbl8E5E9f9iYDagBCds4CtuzMZwUf8ZrVoitbvSJjtOd1ahJwOw94bl2Lxi4P3F
         CevGyd7X94CuSBTvhF3CRZBrQ0f5EE1NoXSJNGhIK8CF+3r659Y8W469UCzAF2mFrUig
         vbXTgVrWwE2X3GKvzBZHubcJLHtPY74IUFesdYlZ7EnFnCB/iTbRP65RSH66nlMdFRDk
         8IhwdpICLC89V3eM6clp12gp/4T20YNfLhcQSp2/HXiy4B+KufJr0O7h08Pu8ES7Ja8W
         yAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791162309; x=1791767109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4pnXRuP5CcnmgcmUqfYx2/qUa4INOWTnjZBnXUGk14=;
        b=q0EG6YwG/0ZavWuF29PRrwqOjQj1L8gYRhxrUluufzh+n4kGG1etLiEMptp1IuJzUG
         20m0oZMrJcUgaeeBdOmqBXq5WAevPVt3tEBpkVeh/dtg2m5VSpqT3t9WI93HwJ3hTaKL
         CTZcL3IsLBFEa9vpzTdGbW63tcuwtP+8F8dxZ0hI0ba5dNjwan7r0QCcIWSxzNcMCYn9
         5kQ3wh2fJqBRKDJYxOpmh0HfCjKEhgopndMY4qjcUaSHchNGvll2c+jlK2fNKN4xJ2IE
         2mHXmqrZCKVxAuorvm/pDZvN9C2Oo+vqjm+HW3qSUlNLRQjbGr84SkNd0wMVnBPGIenl
         f4pA==
X-Forwarded-Encrypted: i=1; AKwUvBwRPJUFUB2sguqPPckwHrzxjgdHfF+jFaUD0ZXSh3yq+mGSGDlfbgl0iugBVJNOkkUd3xZIKUQrLVzxgA0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+oiXq3m5YFf0pcZhAJe49m3KPS20rgEc2toVNgIC2Vy5cvZfQ
	uzBONzmNKFgf9vjQ9+HrzpPFOY6JRMmUB4RsF7ATevChgj8OJGK+QkSpxlxBt35HmHAf5v3BGE+
	D5e2rzQVjCF0+vdJakvYt0VlL8HFzxSH9t7sRTvcYdzJIYKyGGs3x6mEEtn8P6ydigPk=
X-Gm-Gg: AYBFou2SXpVipYROJ6UjufkAInCsdhGr3+biDoR5JZhGZwaua/2ljLwckpjR2BSg46L
	tO/F9Qqe7FATGdJMzcCyznHlPvgnvuZb/Xx1Q83yMoEsBamAyvs+wspXStrjicmJjWcvFIUHHdx
	9JPHNqg05YzBVF7/cJ7ACvjO4G/52mS35qikpsEebRstgwonvsSG1wPFcllCSTQ8u+2XxkrNUvl
	d5UqM7P4/cAOz0rhRRdWcXB0yQPA9fMUIbaz40EoZUPUucyM6OwGys40v09P69P/ZmXwo8FgwMw
	FbIbuF9dToHrDsLoG/shtBsMgBmMqvfc+XZoTxoB2I9TbWKLawqE9zyDxmPf3hGooHqUALP6JWH
	9n9/RTXd9pzvEIqEIJLxaRqn9JTg5cvXBfeT/yhe48tZdHOY0RjSA/KScEYwdTDOcg6aIIn83zX
	PEPYy+GdT86694
X-Received: by 2002:a05:620a:684a:b0:93c:70f9:8961 with SMTP id af79cd13be357-93e51122d54mr1195941285a.61.1791162309044;
        Sun, 04 Oct 2026 18:05:09 -0700 (PDT)
X-Received: by 2002:a05:620a:684a:b0:93c:70f9:8961 with SMTP id af79cd13be357-93e51122d54mr1195935985a.61.1791162308512;
        Sun, 04 Oct 2026 18:05:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c78bd83sm2760522e87.14.2026.10.04.18.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 18:05:07 -0700 (PDT)
Date: Mon, 5 Oct 2026 04:05:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/msm/dpu: Attach INT2 power domain alongside
 MMCX on Kaanapali
Message-ID: <4nmgi3mec35nnvxuruonq5zx3npr5psjicdn6kgxy26t3alwa6@oz2csuuzwpbf>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-2-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-2-9157237b8382@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4xL-IyUPfb-Gsoa4Ow0pcdrAhTABaYNE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwNCBTYWx0ZWRfX3WMQPsdzI9tg
 CDaUHxs0o475nXgV/4s64rUvb8g5JeRU80jz4pcwE+cacv16zj/V1L9x5BEJsrSeJ6rQxE7aAt7
 6ddyP45IKq2QiOrWJrnyjuhfta4N4Sk=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac2f7c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8KN31ognrfrXisba-IgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 4xL-IyUPfb-Gsoa4Ow0pcdrAhTABaYNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwNCBTYWx0ZWRfXyFj4zat794Lm
 dv7YbxnJcg684h3eIc0DacSbmUaSeUrnwXk/OEEr88LOLg8jrjTeYlqvtATMyskwr5C7RSX0NJ6
 LJBRiIn4wjPbnECWoXrF0/tPvma169Dzu+LD7M+xahipAoZOXWrVPLQXcot8N2/sdkmHOcPmiZp
 ySMino8go4vqckDEgB5vQndR5PI0Qa9U5aC7SFct+oTFLqBxpc7wUTp+dFGS6caNZtLIOwjtUBx
 1idXFJ1Sl2tZOwCbV4xP15OmiODKmivSUSCSMeY0mWzPnIF3UQG4FS8qDdn1apTfJp37AKI0/g3
 I6qoQNwy/e6jAjbRWk+htF7vGlIdtcgFEDOqLeGJcrgZGOm09MpGfHMiJHUcKyFOomXTQEG/Z/9
 c4E3pb0hsT+H4gXZlgeU+gUQ12RZq2qUay8dv+e8wPu6aT7ShMK7dt08jztylEA0KMO8sgzLQUz
 ZJJOPWi+UQnttdF8unw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050004

On Tue, Sep 15, 2026 at 05:27:49PM +0800, Yongxing Mou wrote:
> Kaanapali's DPU node lists two power domains when its DT provides
> both MMCX and INT2 GDSC. The power-domain core only auto-attaches a
> single power domain; with two phandles it leaves the device
> unattached to either, so attach both explicitly.
> 
> MMCX keeps PD_FLAG_REQUIRED_OPP, preserving its existing OPP-based
> performance-state voting. INT2 has no OPP of its own and is attached
> as a plain runtime-PM supplier, via the device link the attach API
> creates automatically, so it needs no manual pm_runtime get/put in
> the enable/disable paths.
> 
> Platforms with a single power domain are unaffected and continue to
> rely on the core's existing single-domain auto-attach.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
