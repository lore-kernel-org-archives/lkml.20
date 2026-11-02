Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793627977;
	b=PqsxzH9L2CpQSljU5WQ4T+P7nPFRSCVAooH8oelfRabuYc6moV+ayDK5HrcHWbAM2+EC
	 EdRU2bAwASK6OTo7cstM3qmjz+fiOsisIUP4qFRHskZ980dCkLFKMsBT3d5728q+rRhxz
	 rfWlh5lCL8+nheth5XpHBWMyP+pw0yd1owBG2P57OT57cXGroauq0vU+81PBR+P6WnC3X
	 xvr4u5GDDxjE09kIUp7Xp28yXUNUvHVLqlD7mpl4h5e+APtRIcDJ4oI715GGEW73L5IxZ
	 pgxiYpPlOwIkp5U3s9IDmEp8kCqWQ1a6w6pVSpEYkcPTvBxWVVKwiFJ0M54L2BvFu+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
	b=jhwIn/dgur1DF9zmmVEuqOHhk/huVfUHf9DTvZE5vHEI00j3EVEhTJRTG5aKgIWefLw7
	 B8zmu8TncEXFUbtz2j5es/lEjvwfXj1yVPQuZFxDMY2qMwWaDJDhCDnU3MHQU8FOWXbGz
	 1QiC/Aj9Pbdm1+LyEqFzyt1VlIvMyKZC6UxEfEX6597/kJq47QQhbv0s8EgP8vho/L3os
	 ZgMzjhXbPJtYCZkmSfkcyH3EQXnNC8luG79iXnHGCLnWOAd5wWsc+5/euK8O5KjZLON9z
	 u7KW17SkrLVWxDhMQMi6PJlzFd6kzY/iyfz8xf0MXtsxc9gCUQMl6CWwStqYTRtXQRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIxp1Er0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmqXbTnj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1B060A3823
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1B060A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lIxp1Er0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hmqXbTnj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dq6vG3717200
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=; b=lI
	xp1Er064GspN1zRmtcdK4p2Qi4sukyRxlwgpRBqOgFRzKduF6DGyMMK8+iXG11Rx
	fVXUmc/TgtHcTEpfCaSulV6sGd5kG2Yzq7roDqP5GTWGTGGfDae69TQ0JJ39qEou
	FP3P8+CyxSKQcrxKD9idZjUMViF1MeAvu/P1H0Q7vrvpk4xBSuTuw8gKIPBEaT8j
	NOvockeNnuEGkA/PivqHw063vsouEWMqtch0Uz+JywTj3DuCS/KIAE8UVbEf5fcw
	Uti627fooofEiyh0Q5P0GqPTII41Q40bPrPW1t0GTjBdaPDMBPdgxzqxrVbHCM83
	pWGOExnQ2xfuDdGmibsQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka623hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:59:35 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46a5954cdfcso3055908fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793627975; cv=none;
        d=google.com; s=arc-20260327;
        b=IBytKRWg6GyIVh6sY3KcPNHie3XdpXMnmo2YYOdbVQpMRIUAzegX5LV2XQMelNOWAo
         Zy1KhRRwmC/f89OnJo4X5IHqugsaCGNIKtTALB5hyzaAlIKIWQTJlEFX7Uu7EFKPAf6C
         MioViTnz+YZFu7him+KhwLthLAdKRmwgxiTVYvy7pW7Bswwi7vxP5g9w2r1bW+70+xHw
         TAJNsr08AE42rEk43fgHilOqXnnzPGEwWQdfNA2xWJardz167fBwZbKxO3j0BRBlIduB
         kdjmlnV/mXUIctGVzaVDoyMg8mTBYw5/b2ago60dihxz7wYQ6wkB7E5qP+OSmqqS2RHH
         CbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
        fh=dgYprsN9BlGR/3T44UwHPPIgcmiswIaB1ys/U4QGbDo=;
        b=WWm/6a3HeLcumTooOtk4EulmwsZDgfFqjkWiQNwDRDV7tyhejgOJ5U0byYfVRqgsUP
         YAbUMGIXsTuYJrktsroKYGvaJ/+wlA3wEI+RWgxai1vkqGTYVEccdgv3t3bxZqKm6BK7
         n1W1rNQQuW2p/d4WzAPFfF2mhmckhIkg2dWOTwEwSbfXpZlcfkEOQsmXobUounwiUo87
         UgYiFskqQ5sUMtUrmEEwbzpF2pbTGM6Gr325FbLBEB3Hs99mceBholIf6RmZtooDzn7D
         aJZBp1GODtCeAEs/0aNO9WGoQWkex74dveU10c5MVuWwCo/GA2s+tgBVf0/a3a/Uk7pl
         VptQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627975; x=1794232775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
        b=hmqXbTnjwykKq+bvQ/YgHENijMr5r0p2fK6Kjr6SSe0+UtSJkIZaPwbVV5ltONI2Fk
         I1aRkAVdUlD1EcSAKRx3U9eHfGof+YQZtK9fb+ltpf+z0InUeSwcnvYkiR3koe6Yx2IU
         WuwSnaRyECM/OeX52Mja/XTQuBeeRfC6MgNcLl5Hdzq6X3pTKtTIIoBsirWQVPBSu6vY
         1NkKzwIISb4FBD0RAKFlo6WvMjmdwXF86wF2J5USwWj6LUYqfsQgWXJa+cuHeu0Piose
         MpINZ11cdantYLAFK+1puGMWZXO+hTqNyCFBqGEUsklWqTN6/OlEijou1Wz8ZBFdJKIE
         eubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627975; x=1794232775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDl1jeBrkJUqNUFNL16OIVdN8brVJ67X9WbVwmdzaFA=;
        b=sKeO8CzfvQaY5ynV463A43AY7NRjRD62sqKg+FvpCrlrlypkuRamPRgDK5y+C6rKmh
         b80O3JlzvzIRW7KrPCYfPVKOnMzqhSJKV0dgMjsMXKrk16AgQ6Uzq0OrfdiZl7SwfjIX
         imqIzMMXkUbSZwKM1GnM6F95t5CKK9tCc5oRl10rXPtcrA6J0eGn8wM49KGx9s75Nf5J
         56bV9QCsDR2U1zQ356qWB4UmDikYsamiK15dpO5QAzfU81MCeqivEaJrKMgEgAhbs3z5
         uUPNzBGLtW6o5O2mH/SRKqpNznP8gw5sFgsUHVAlhMbGcL2cixnyq+6TLg6IOtB6fIW8
         d9ug==
X-Forwarded-Encrypted: i=1; AKwUvBzfseQLnHGluPhbKzkVFiuHgeOdwVmEQCfgJAn6G+eNmIq9AL2QUYAiwbgO2C75P926eISWZ7ZtRC/GJz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQmlhcjZ+egrLFPH/0h/jRolXNxpn8IAvsuIqigPmw+yVDnlpG
	wXIcF1VQjgatc9GCQYLQlW6dGOWfbW4C3gHjxQ/dFOvBkEcFGL7/BplZjXRQNlIaus34PDmmf5S
	UU8Hh5WyXN8HzqaVtlAxcDMwttMiDWWzLrc6eomKOzgmH0urjoJCj20GNAQJjY641ubJN8m8wY6
	jxFT85DN17IdjEsDMIW3Yw8mwj4zXtG0L5IFIAf7mZMQ==
X-Gm-Gg: AYBFou31Z9jVIi+XagPTAMkyNqYNjykbJNQDLf2gI2yGeZfZJm9k3F5sGh0TcEJ5aae
	OI0BsLiSSH0GI700mZAimJnGZV3ZHmB8/SDh9h1aO4dfbHzJxSESuPxRgSdP65e1VScfrTPnpRz
	jl1W//ZqZ3zO3kY8KXD4zL9+07/eB9TJ9tufscOdMEYWZxv5C5ES5YGnbXWg==
X-Received: by 2002:a05:6870:5ba2:b0:4a2:4c6c:c9d5 with SMTP id 586e51a60fabf-4a90729ac7amr5634869fac.7.1793627974592;
        Mon, 02 Nov 2026 05:59:34 -0800 (PST)
X-Received: by 2002:a05:6870:5ba2:b0:4a2:4c6c:c9d5 with SMTP id
 586e51a60fabf-4a90729ac7amr5634852fac.7.1793627974121; Mon, 02 Nov 2026
 05:59:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com> <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
In-Reply-To: <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 05:59:21 -0800
X-Gm-Features: AclHuK9ZhLwCfrUX-9m8aRznRVSHUF8x1JBC9wm-I47eYmvAKPX_Cth1Jx0xGxw
Message-ID: <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Azvubdj3gN9cZAxCMNwzR1emojcrTDRm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX3DjAArvOHXfj
 iKeK0JwEqCmwtAAPLUKFJJzUCwc4nGXzbt75PdbfbGUmleqBNVjFdGeG3LixC2q84KENYeZ4lVA
 oJJZWGRO3qxUl8sD29PDFwSViSVGt4E=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae89747 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=NaZcOW_h6FOph8AvsZMA:9
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX1/gma/w03q7t
 rnWGortJaBavNX0r7z0uC1YQKDVhHmQttwoEvfQmjC8ixF3bNzdqB9YRI6XYN1Kh1LI6MWt+ibS
 qigGNfjKFsl2qRU8U2BMYfIABcU+BxHPBZnWPvJqDiO6prZ63530QNGR+DtCjVI4eROG4Oxehah
 JwvioOiHCWgLu/b48qNfkPTgR5XcdFkQcEK3y497yo5Kiav+57XQCI9THTB/O6vFSDIcOljapzk
 w/gFt3FeA0or8U8jCwDoggzFaBbpUE1kZMY87o37RJ8TWJODuk7x5fTZUxErkPIM/Y2CZgST9K9
 nXh82l+Xd6mrxsBIIeesJVfzMMY9JTyDfES31kbayBkBeQlVW7tfxlQUcQoY6dwe4Sf4rM5kLt7
 KBPBglXyGPZUnW9Yeu4CK4ML+Z3+zRaXChpMJp14Gy85MIMq8zAi7jhzodPwVf0dsap/kRLFwFK
 AcTbPUbQYtDR95gvlLw==
X-Proofpoint-GUID: Azvubdj3gN9cZAxCMNwzR1emojcrTDRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020055

On Mon, Nov 2, 2026 at 1:40=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/1/26 6:49 PM, Rob Clark wrote:
> > Use size_add() to guard against overflow.
> >
> > Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validat=
ion")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/ms=
m_gem_vma.c
> > index f687a629629d..16b3870d5e90 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *jo=
b, struct drm_msm_vm_bind *args
> >               op->obj =3D obj;
> >               cnt++;
> >
> > -             if ((op->range + op->obj_offset) > obj->size) {
> > +             if (size_add(op->range, op->obj_offset) > obj->size) {
>
> GPT and Sashiko are unhappy about what this does on 32b

Considering that we can't have >4gb BOs on 32b, I think the concerns
are probably unwarranted.  But yes, I do look at Sashiko's reports

BR,
-R
