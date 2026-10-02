Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE4D4AB1C0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964749; cv=pass; b=nlSI5rPcb+dilUR4zAC7CRA6EC62C8z6II8EACZTc5nBkMnoKcUwjP40bLN2HR72kQAQtv+g1g5qkneg4kO64eOsCDupawMb9bK23qT97p2F9bT3dU7wNLH7iwXgoc+RSEdN+VZwyHUDxirF943noAQ2kHpRShf0ucV26MTaB6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964749; c=relaxed/simple;
	bh=olqnuNuLfhNSbTMlRj084yoEjd7JnAYtZyXcGN1R2bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKDOjkUWESxH7DJeu+Sk47Fo1wLDdQtzRIh8Ujo+15kK4cqWuGCPIjjqA0tBNRni4dZ84a9uMHP57qMvgP8vDTiP2V2mLqcPSGgXJWrppLcYm5Kf7NfevpouXBVGBShQl5vCSbpGIB6/SXAvg+UyykGJGaZPHx7h6mN1FKwNWYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrVDpYW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=he4jh6rx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrVDpYW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="he4jh6rx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692HcJE91198117
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 18:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=; b=Xr
	VDpYW4tG2obycAgp20TaucD8Vlyh2tE2ttwyxMbJfYFbQ3bj76r85LAnMm9+ONuc
	aIWOb7wmSr0krUoM2GvgQbwoclukaXijDnpdIje7jub9D8U7XJdtqAFarz5wCoSi
	EHpeNM6FgfcdOcX4KY2s+4qNoVtEbkT329pF4/6ZYBt4YNEGJ6lJpHWZp7lv7KTg
	ozklH6x0iRTsC4TQn+TBExdaqjUd9MRUUz2gJRH2Fd2q5b3fBLK9Y4MJEGfqg98b
	zHdL9oNCTt63yJUIfmj6Q2pU7ppqfdnvRHFd48KptMxSrtsKkZ7cc/w1QKeiNv3Z
	g1Ssx6fHfgHFEvM+V7kg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v034u2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:12:25 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-451d80641efso275904fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790964745; cv=none;
        d=google.com; s=arc-20260327;
        b=nXGUEVZeX5q2388YxXQdZ9y6cT8blQf6/ufvJRJgZS6KNneE1S3LXoe4uqm5pUiY5Z
         hq06Fzs3yaa3oo2jiM65fH9Kb+oy/hKgbXYh+1nd1fedy9+dkkZZpFRHG1gEMUww62yt
         klLAxBoa5co6o2/L5dXYIQEYziiL3gs8wTCB+AbepPv/n0vsuN39dH88j8wQ5f2E2fGa
         da17lSvj9MDqYDEXjbHFDHHk3HshSjhOsS+vl/bYM5LTaFu/Ztt2WYVJjrz530I/wV6y
         sn3RA1QmdIVi2QaThPPmJMUc425BumctNdSiEp2Fefqtqfsa9/e4+J0q6spNGZ839BKL
         V8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        fh=OZM2xCTfbgjrcm4YNRTAS4J+U+xl6gbZXP0hgl04SKk=;
        b=GxjPDBFqyEtSYEc1Z1CKRI8Pxs6ZYzdkQ/xAesWpVydxKEbQ0aZhyTutOVxygSvhsH
         ULRsIIbu984QQtMyI4qG4PHcvxNVKntZ3+tzC9TpSqSLsKr0XPpT5kWtRM9ikf/6nRQS
         5ip33zeY9rl12x6B4c+5+T949PHwBKtnU+BBIILORq9Kl/s5dDCKBpEG3KakGj/kCaCu
         +fStpaVfnBTgoEjYXg42hMKfA4Tehun9lJlaZB6hylrt06V/HCn42+o1ovKnrbm4fntJ
         CBLCvsQ4+B9DEYbPeNH7e1MTsBJWQTeqgqk/zsAQN9mDetaIGWbkMpkMbf3HxoMkYGeA
         3dcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790964745; x=1791569545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        b=he4jh6rxWPGDxr7LV9gpZVh9/41GY/uIClEeKNAbNIX70sRQmTXdA3Lf4k5m/Piftm
         3lJV8fb/BZRZB9NN+/S4nN/KK5OrvkH9dZMcJhTMxyazZcD7u30gCyoa6jDZHP1Vi6fk
         67ngki3FpDcJZvgZp+qABp9rxSxb+V2r0DPdqoE+xKNyYoh3cKPSL7TM8OaDkFH2n5/C
         zycH+YLMxoM6bWP7tKXQNPGu/27PXUtwQ/iuqLdK+zAF+wg25V2T4c0tobS6xxP2YieZ
         cvMKlP6mMQZRj64HmoWh4OfK1EiJZroorDm4mVBxlmd5KRQWWhE9ZNKfZRoJEoKLnyEI
         tf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790964745; x=1791569545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        b=2D/Ix0y9IHaIh3AoiF2N/LRXgGhqjXPU4mP/jdJnuRGQjkpoOuTv7BjPXI40U1u6yh
         xQW5sBR1N33ZHYDFBGenHS7evBD2LwLz/xwTjvyO3Yi6kiSutoVZ44Sc3z792x6Hjsi3
         2JkPUQR+xHPJLDKBP+/M97dIBwZiBZ7h5J2n3PD/fOg7Ay9lt31BE4blMm99KT3Z371c
         WgTBl+J9K6oVZh91ZcQMta/fWorwQETtrJX/nwnH7WkJlV2ALg2noncV0HKdiDO2V//Q
         f5Evc00nOgNLPqDAuuooo6rRrvbc28UBSvWNs8UJ1MCQxQgrlXuPszV2tBDejX6qjioi
         eLAw==
X-Forwarded-Encrypted: i=1; AKwUvBy8RCzgkRLtEAmvEMXgSP5Lw9tJqnEgL9o0S5KtXqGW0bY7sMOvPqfjRv8x2IVbZlytgVE7l6Ai8IFklEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKEsqIxCJ0Lq0EgH1HtFvvzDVG6Jov/03TqhLNY0tYjiizqmt4
	KdsbcU1G3ZU6/Rl/B7O+EvbPZRd1zwwS9eEY1PDcVsZmM9nsS3Z9cYcPjQhsNvFjkBl3c/aSsEO
	tbF+vvPS2l/SoV7iHnGM4wKkdC/KUjcQfY/4EALdeLgK2a/LA6evJBwfq4WPlTlsU7DZrfi50sz
	pO99LD/e0nMC0Dj1pQSqoP7apmjMYOTtT/v/ElhmS/7ujZ0WMNSA==
X-Gm-Gg: AYBFou2xYaYy4dnfIDtBeoAgnl3IZLz4UmvA1galbs0/VDTH3EA/Tw3li4oRXkjYhja
	o6BpaYJC966cpMyq79j3HjXsqDSIW0bSOR3psLLdJUPDTbspBcB3rEePqDn6IPrJXn2za9NGxY0
	KJSzmKQgusVnrRjHCtfrFilj8shHHV+UhNZoNB+sDrkAKkHjoWoOgtZO/V
X-Received: by 2002:a05:6871:c941:b0:49d:e1d3:e6e5 with SMTP id 586e51a60fabf-49e15ead8e1mr2700813fac.43.1790964744559;
        Fri, 02 Oct 2026 11:12:24 -0700 (PDT)
X-Received: by 2002:a05:6871:c941:b0:49d:e1d3:e6e5 with SMTP id
 586e51a60fabf-49e15ead8e1mr2700784fac.43.1790964744129; Fri, 02 Oct 2026
 11:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar_AuRr1eaZzOfw9@baldur> <179096320161.1973.2852858792260211089@gmail.com>
In-Reply-To: <179096320161.1973.2852858792260211089@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:12:13 -0700
X-Gm-Features: AclHuK8o91bLNwt3TjoUBHpVEYotMXP-4T0PZxyf-cMbJnzFu-NNTFKBRF7Wws8
Message-ID: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3MiBTYWx0ZWRfX8W1ArA6hR90y
 ta8ywdrX33L6zPWaiDk+UHmu34MS85lVjZJih4QNzXSBrFZUF8ICizLg5SltsbvsCecd15HH/yQ
 5+OzvY9n3U8jUP53nelGZxiLbfbAuvQ=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abff409 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=AHIf9BOdGwd-gaNHwY0A:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: NRdK4GNrZAoUUtzezzs1m_syRbm-4QQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3MiBTYWx0ZWRfX47pTi8ysEpqO
 vx3srJWo9WsGya3/FVBraQP7x/wQY5G4V4hlFSbqh+Nt4bkRGEP+4GBsZxUCbep6jq29GcpXwl8
 XuglkPECF+Rfq0NIrw18LlD87ZaT7kixHjkKAuAsichaSbHxOkvqIB6P6euaOSXXzHWimbniwIA
 qa2G70rGt7Dhbp1UpgcbRIEda25RrgKTkq3Is94xgsNx7ELpr867pWN13ZMBWBXh49X9OBmfitJ
 6uKo6LrzSunSRCLpbNhhRNtk6TpLtGnMMqUHJo5xRfwIJqUQTlLUu6lRwYl3uROq/nYZ9CuCEQ1
 DVy722pqR8/Ck91HHnhzEImOCnILURlMUIdi5OLrqCSdI+cujLytyF2ocCc4rRFO7C3BDDqv+CK
 IcUO49sHO9qnc/krQVSsTk8/bwaNmACvIM/Cu031z0jRo0tVXPssQoKYJ9t/ZP3V1Qz9SwpAnW6
 5SIwPyxc5t5B6FcBWPw==
X-Proofpoint-ORIG-GUID: NRdK4GNrZAoUUtzezzs1m_syRbm-4QQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020072

On Fri, Oct 2, 2026 at 10:47=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote=
:
>
> Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
> firmware v5.2.38:
>
> [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt=
] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for r=
esponse
> [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeo=
ut waiting for GMU OOB set GPU_SET: 0x4
> [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* gpu hw init failed: -110
> [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU fi=
rmware initialization timed out
> [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* Couldn't power up the GPU: -110
>
> Compositor fails on the first start and works on the second.
>
> Reverting this patch fixes it here as well.

Interesting.. I'd been using this patch, but cherry-picked on v7.3-rc3
(on glymur slim7x) for a few weeks with no issue

Can you share `dmesg | grep drm`?  In my case the initrd is missing fw
so gpu is initialized later, I guess when the compositor starts.

BR,
-R
