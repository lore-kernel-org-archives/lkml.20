Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714350;
	b=rW9gB+4s+tRnfqI47x246HAluolhPZWCHPcZYoyOwas1kcooARJKNzx8lu0mL1ygasUH
	 7fMWYBxY3FwhyVyINlRO6z9lfjfrIZHmJfWlnpG0nw6LrAy9ICHSfAiEeqG49wCyrBceq
	 bQSV5GSkzxw4oKVHXiasncJzpXEyMAuVNdrrvxteAaZxn4DcKVO4pA3yfpLpQhaV2FdQe
	 nlhwz/gMRxS0sU4xdSgZAVD/SYnRs+TJB0oK7ml4XUJyQBCdDgPzXycsG0TKlYx9juXqy
	 Y8w77w3If80cFnpBVaRLj2v8mTeis5qvvdzS563wZ7X/R+eKt77UhKEDOnsn2dkpzOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
	b=JPcHpYcnYEwg/T5kdhy1QB8GsnknvPhHvnCKJaze6GS0f1/K6TLaksJGVFfGBSzcurKT
	 HpoUrgfa+2GqlOTmqFyVeE9dqYHuv2mPFBoFoY5d6nkQX4hz21SLZTe5DwlNWv8mG8cQ7
	 /xF2gE6a5PXZjzGjC3lmK87niswkX78kpIQki+/ZAI7s/46WNohul3IBsQG0YY41z6qFQ
	 XjlGX1IwI+AA6HkLuds3557hgDZv3IbQfNCmBIsk2nLwInMqzv8Fp+d9OPvWuVXb6B6Fz
	 5eBpM3lSkMGHgqM67s9LXu1RNIbQ0T78zVUea0FxQX3rOMT7dGRGRHPH2/bCyFHgxMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGxC1mwP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevYvbuV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2801A606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2801A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iGxC1mwP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fevYvbuV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZQkv3003740
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=; b=iG
	xC1mwPptWpdT1D6vcWOrJT7YGbwYWQ16/+X/ZgA8NlyLZrknojkAvk56J5TtjwN4
	R03mflmufRMrN0D9uBf3UWl/2DpOp+fCWgqxTG7hIACsCWJLN+KFalD9KPfFrCUA
	gJY7ayiDA5zzx/hOdwJv3S+nGXuSCR4phizUb6BGgtjJcb+GugZRuzaU/GGei9MQ
	KvCepF4IfDGf1M9qsIBGtz2V+kNsymzqdGwuMdTZ6M4F1fyO1jfjqYQtE7+woGQK
	Hjjs+ovy5jEPVdGGQYFRg8uYc1OGCRyhQAOn9kX5NR9OhUrJuFlBHMi3nXiEJTW7
	6n6vTAKO+h622dolteng==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2ackex4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:59:07 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b0d864826cso7534248c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714347; cv=none;
        d=google.com; s=arc-20260327;
        b=UIrHTJflXVaHsSPi4qdSinDk5c5bICURt5rdLG5GaQ3rfpuNuU9oHn2rYcaZ0kyzVH
         TOz8d1H+Hp8pGoNSNUS1t64uiEOW2DTtEyRjrk4p8bHeqInFocCIy48N7ANgz9j/KIGy
         j3UKwdE0twwAOq8L/et00XpNAvRnBVJ42xf7J9a+97QePkYZSOjFwAh9jS33rfXMLzWw
         lqvj8TvAiuC8hCvVCzXZ7HFGl1AQdQT7213l31QduFFaQNPI94HmpX2hA7ROduXrzkFb
         awDcJ1gYFjycNBKotdsM4hGQ0PE3ZgMugGdf16sOtwh2n6JGDXxnnBO70yGzR7gYJMZE
         kEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
        fh=aIWIv+hStllHwV77SaoX3mVu5zjFICfSTqlaDO4qY1s=;
        b=kA8m+nh58/31ItVMzJLP61H1dUAKx0Z/Qv3gjkQ8x4izRbcH/9sO7GPzO/ytzII7lr
         kTzZJpnsF2+97C5pKrVKSaZc790cElQsVUpHUWcCVQLlMzxlWbXA1QPHcjRN0r0td6ir
         JC6+EFfvPctNyUyIN1Zh3a45h0h2/fpiMulf/i8NoNnjEQv+GmTIeMnA0r5VScLcf/sf
         RUvBdImrzVfaP5lhb4oR5s40pO6z5AzeGz2aZiyIS7EzRprPjtdbFmeQwT5N5KqxNHDX
         84iNQBIgoC0EnGGtlwkn1Gb21RIb+b5N8v0Sjuzpwl1Yx1cc6QyrcCgHMaHvBCXjJFs5
         JBMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793714347; x=1794319147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
        b=fevYvbuVMJ3gyVcUzz0g7R5tKITJDauycMQ46jrhwTKFoIn3VtxolCT4c/RGljRGhI
         aognUkMj1bvelrAKNAGswoIi9gIIdT6Fod5OCU5EucusX9FkwQHFdGuDPc8VGba7EOqZ
         XtUaU1XGJw08qHmMZvV/n3T9ZuLZWs3hJFdwy+L54LPYhVfFLTrjdIzMIV2apMwlL7Oi
         rMRsd1bJ6YxjOC/Ox/7ywUf8QNCohUeNAhM27Iz8MEn315lu1z7XvLtK4GkwR+jQYOQk
         VV18eSVt4oJistkplp+g03qrBvB02ykKK2qrAg/G73CK4AZl8poTTjIgUWrsxvaXpB7a
         mZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714347; x=1794319147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u90xeG6/S0yuMe7vObs+gJMuK1wiVaVYhBCszGbd01w=;
        b=KKwcKTnFuWu6vteEBe1zHuHw+SAUdci6KtooeMP3VFxbnE49IhDhLnwQewI13NLGlJ
         huIfa+t6ViBcbCu5www9h6JaanDtCe4GfNNJhkkm5+ZWZGWQ96ANGm59+0jvL0USkkH2
         8GDAYQKygUFWu8gTvHbVR9qZ+RWAF9QSxRulipf2VsNgYw7zANCUXcYeZtAzvL6FSO9f
         YPMMwfaSXVhXlIPJzEATdOH7ggZy/1JOu3KWh/n0a7GMuQI1sYV0qmTPp6dB869irQka
         FfbPhLrVIMy9+x6alzcT5NqScmolgTlFsgWVu4ASX92ZxVJiOtU9AVB3y0hoSkbk+h4U
         UexA==
X-Forwarded-Encrypted: i=1; AKwUvBwgwv9udYBO413sK4ZmDtnfo6LndP1/uWkkaEpb1YT3VQCJ8cidmLet7IuJwSyTdhTBaxQE5I0ReqgJKlk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8An6WvgodP6RJziO1DFixFLxWZsv2l0sKVmMHOGgKA0va74uJ3
	wY83WE5+72AYMWKcfonv1E4uSV92T66QcBrd+jJhxg1yfFzTsxl2FnoOnd0oNza02D2OLaRUFtf
	zN4HDr0CpdBBpbV96HRkad5DZRipjVmgbHHG05iI21YiyeJxTbdBPHm1lFWe1QP5TZBIEixQJz0
	JokjrHAM4dTBbafnaZ8yU0OKP241w9Ub7qbs3Ixq3PCg==
X-Gm-Gg: AYBFou2FCd/k17vVKtGa4+SaCumpTvezFDDPOvno7w4TkoWoEIud7mDLiKok/0RL1az
	VBTop/W2lKBEhlVj/RgB2JEVc1Kaw+L3s9Yy3H5g6fjq3EK4Bkz1KX8VzNttdjAzcNlpnOzsbAO
	XEuHeMhyxr47JZhc7kephQmP5eChWowkRJKcgnRlMSyqsc4/3zhpffNq/uFg==
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id a92af1059eb24-1ac9ecbb353mr16682678c88.39.1793714346782;
        Tue, 03 Nov 2026 05:59:06 -0800 (PST)
X-Received: by 2002:a05:701b:260c:b0:1ac:9ecb:acee with SMTP id
 a92af1059eb24-1ac9ecbb353mr16682661c88.39.1793714346238; Tue, 03 Nov 2026
 05:59:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com> <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
In-Reply-To: <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 05:58:54 -0800
X-Gm-Features: AclHuK9kb5ZKwTYoNlq61wHUgD5ZG0TonX0oq6CE970XUEKeSRMrykv6fVdNHLo
Message-ID: <CACSVV02mTpCPZ-JtyYrsTEsRXKyS3zuxTehx=c91NbxgQSdpUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9e8ac cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=dQossMmbW6WhV1w7_6cA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX07/ifU6+1Onj
 CJdPaff8+8jmNbquW3oLSwyNiHNREqE8lp4LpsK+LDrgX4la50ZOZs92hT7bc2QuKrBRFcPGTLU
 CSAa425qL6Yk0PAmR9pUntMQIi+aE58CZc2Pp7c7DbZKdK5L06kFbYk2XftL2oEssIMDByQyUxm
 ZOeDgS97Z6pWDKgL8am4O6ZVwxBZKUResFtphB6Xr4T5aVA1n4Dub7vnNYu3rz8CNdtGefIOAj3
 0q4ko/wLbHPYk6lnSynSp/1eLHrqplntCzLnf5M762zWudmCecw/4CnJ8KrUDRN2gHSP9t+j/OR
 yZ1dvUAgvPZVL/RwcaCyRYztz6lJDxXbp6jEOCarBy0n9LIq9C/n0HAKlfb4Q6DXPCYPXQYeCMB
 0gDDZ+lBiGtbbaJkV61B2FUHHxJ1AkGlJ4lsUUyig54Iq+1zUu48AUH7I5j8uiSaZShS6i1wv4T
 SJwDm4OLBALBMzuy1IQ==
X-Proofpoint-GUID: 0DmC5fzfASpOOmbDRScUrawpeFWt2Qy4
X-Proofpoint-ORIG-GUID: 0DmC5fzfASpOOmbDRScUrawpeFWt2Qy4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX77Wm45/EZ24H
 ORU5OunQSJ0Y0mjJhqE22w7GzDWq4QHJbQ+A1Fhm2IMy07CP3eHj1sHeMukSmENA8sxMDoyGO9P
 jkPH8S1cZaBLUIEuO6DmMWMB34gQ03Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030055

On Tue, Nov 3, 2026 at 3:28=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/2/26 8:00 PM, Rob Clark wrote:
> > We need to move the gpu lock around a bit for the next patch.  Use
> > scoped_guard/etc so we don't have to make the error path handling more
> > complicated.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
> >  1 file changed, 12 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/ms=
m_debugfs.c
> > index f12701e286ec..aa59b28a3392 100644
> > --- a/drivers/gpu/drm/msm/msm_debugfs.c
> > +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> > @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct=
 file *file)
> >       struct drm_device *dev =3D inode->i_private;
> >       struct msm_drm_private *priv =3D dev->dev_private;
> >       struct msm_gpu *gpu =3D priv->gpu;
> > -     struct msm_gpu_show_priv *show_priv;
> >       int ret;
> >
> >       if (!gpu || !gpu->funcs->gpu_state_get)
> >               return -ENODEV;
> >
> > -     show_priv =3D kmalloc_obj(*show_priv);
> > +     struct msm_gpu_show_priv *show_priv __free(kfree)
> > +             =3D kmalloc_obj(*show_priv);
> >       if (!show_priv)
> >               return -ENOMEM;
> >
> > -     ret =3D mutex_lock_interruptible(&gpu->lock);
> > -     if (ret)
> > -             goto free_priv;
> > -
> > -     pm_runtime_get_sync(&gpu->pdev->dev);
> > -     msm_gpu_hw_init(gpu);
> > -     show_priv->state =3D gpu->funcs->gpu_state_get(gpu);
> > -     pm_runtime_put_sync(&gpu->pdev->dev);
> > -
> > -     mutex_unlock(&gpu->lock);
> > +     scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> > +             scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock)=
 {
> > +                     msm_gpu_hw_init(gpu);
> > +                     show_priv->state =3D gpu->funcs->gpu_state_get(gp=
u);
> > +             }
>
> My clanker tells me we can't grab the PM reference before a mutex,
> as the recovery mechanism depends on the rpm count being appropriate
> to let it drop it (and kill gx this way)

Yeah, but we also can't do it in the other order, or more specifically
disabling ifpc needs to come before gpu lock or it can deadlock with
recovery.. but ifpc disable needs to be after runpm get.

Re-working that ordering was the whole of introducing cleanup.h, to
avoid the error path with mutex_lock_interruptible() after taking
runpm

I guess if you are hammering on debugfs while crashing the gpu, maybe
the first recovery fails, and then a subsequent one eventually
succeeds.

BR,
-R
