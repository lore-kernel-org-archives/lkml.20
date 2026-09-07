Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F88236F91B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 23:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788823258; cv=pass; b=Yilz5p5kcFhKwfo/rzKFnCYSeEykRuKkFUcNTryb2Xq2WOdZXsW72jDYsB91fw4OvZkWVGTW28JJcRENuBsJq08LbU6XQ9yKlF+EkWIog91BfYHa2FxtkuPh6+twhd0+NA9QDl+Weh1qfyw5Tueduub4pl+zEWQtXj/0m6xi16U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788823258; c=relaxed/simple;
	bh=G8t2aFRl5AMWi50Y/QX4sqca2qmYUkfkCXlvrA3GuDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oanEPd+JFN3sQKGOWvgE6LMMBbSgHJh29h6R4Qt2Dp1Tq5k3pkGKtMqdKXNvUUWZk6tTpQN87vnRH4nMguhlkXmTNdXayK/D+REa34dKdnCAs5GU/jHpPRzeBe0KvBbK6Hb5w1/Xd6Zt10ui4YBhAUbeiuhaTSNWBFOJQ2ZWtYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZTdbrzt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2daT4Rs; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZTdbrzt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2daT4Rs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Kl5MB1155530
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 23:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=; b=UZ
	Tdbrzt+oEj3L4P1sex6z7RsHWfouNMFpj0q2giCKwZfZ5WCw9k9R2whHio8prHku
	gaWM7tbWB46sO+m2k7ZDddAPodDstUk2jjay73Fq94ZdpeezjLC9w/2npPTAtTzG
	EL0rmmVwN5rQGBYR0GXT1tiFpnwF/CYqdJr5zoBHkdcgjiJ06Sc5WNJubElxv2Te
	j7xFIYZd/C8nd0wPRG2lJdtLWTm38IRxU7LGn0D99qzc6HJkYQJUIZwRtpIVktAA
	8HuWYJwVAIOBuwAk6Yg8ux6/WgtLxY5F49/GfhhGVx6YLvBcLcvudbOgs13pSE9J
	ffU81UA7W1YqMR5XhJFw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86u2mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:20:56 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1aa28c903so2228057eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 16:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788823255; cv=none;
        d=google.com; s=arc-20260327;
        b=nndWT8JOw5xXtyScGLUWEr7jIp10X0VyWjFemlzHzTDPwoa8GW9m9X0C/AJZ6vyJSO
         OpqCeMy2Ms2aXj2//NJcPm2o99qL1RBddMMozhL9Xn8tQ7mD94yzYGbjtV1VHKxVGvdT
         wnZ13+ySSQqLJNRVcRKQ5rnJhJAqFOdsKrIKKYfg6bhy63E3+Gc5gLW2ITQQBAzXdTvr
         QdI9TvfuVbWHABP1MxacxXSfbMHvkbbIBY/QfJF+7xtGe2xTJxBKuC+3NNzQoawnzQlI
         rjPtNQmurf4hK8vLngbtkCY/RwLNGQpKP2J7nhupZ4DqNHBjfRxJT9KKm1uPr2iWMMyO
         xq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=;
        fh=JbDROdcJyegMiu9XjdPm9OUM6lIo+D6uchd7MkTI8Ok=;
        b=olx9I4zaQlDiKu095QtcmBcpAFph5RRMmbWwUzOD4Hfry8T4X/gJ0Wkr7HYekh/QkX
         XIkoqozwAHUNpQVR89wj61BFg2PIXNMvCm/RmDL/9+GrZS5zmY06Nf99PpVpolpkRkWj
         66cnL0LifwLIriCLbE7NgRNrC9inDXbarRftwSUWuK+SV6DK/h+q5E9bfqLZkzzRPbfz
         x9A7wsLcG7MaN00yOhyKjthzEr5GrikRc03tLiA3fzrx6GZzAidzcoUsY5EWUbGSp2nM
         jCXLrOC6vPPUS7cMgqxi2xl3fiTwlpMj/hPuhNH+ZgRg7cXX1kNFBCrmhf2uMNxiWcnG
         kJ+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788823255; x=1789428055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=;
        b=P2daT4RsjxkkE76vuqVh7/ERew32FuGBiqh3F5P7uAED1yuJRDifUSvSRhFq7n/4Ea
         yfdvdzzQ6FTTtZ/b5OELRquAnaPr4c3gRJLAdv0/D8kxJK/fH1UmpzwVeDTdY+oF5hyy
         qm8V/3R+msQzO2vJwm/4hPAGr+914aTaQlosT6ZBLFIVw5WQNJP6uuf8AKYKMvc4Eq9O
         E1VtuXzXG0ka+8TM0uMd3gCIWKgYcW9om4KOPE/cdKYB2aNJuF8pjIMdHZU5WjMq56VO
         Tpw01wd0Y2zk44+gtXnxMiy8xrVbXs5Cd9H28sXZwW4TkN/1LqcrIS5wcPSpLbHTrmAE
         Hkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788823255; x=1789428055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kXpsFkhTZTYWV+8wLjoGpwSIYOZnfZDtRnu3dzmks8=;
        b=RjjTZKjICFtnP+MqhvqMcZOTMTB6uhPKjqflxecbDcPjdK10b9Qp9wMaZD42Sg45Wr
         AIXMco+uSZ8rxspp1l2EWVESIZ6tPhzWq6SnhbNVhSlVnyRCQjXr3BaS5VQD6sxH9v1X
         oOGIFEbkNYcb6w+ryiPznSEftSZ8tuoCgk2xyKfDjQf0lQds6gyBzEGmrYLlSlyR37SY
         Qlfmm4cX0OTvwNjhoMkMInlm1YhhS/7H1aW2FeDWXRgugBLCzTvcgfcagtBr9sFrnc82
         UgrvJswH0qIi7afgvs5S27MnJrgdaEy0TqUXEyM9sa7T0Mi84bPcdOcrAkeIIkS/+dOi
         TEpg==
X-Forwarded-Encrypted: i=1; AKwUvByKYMFptJQ8IkUFK73AZRrVqYTwzyVVok4PDBlqSc91nYazeCuFOgxsETQAXknRtAdvxslQE9iWaq5OtJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ3sif4oOG4GrgW05bkTAxQGQhKZLOmI+4bcasU0f7Lzsz74xW
	8PVXpvguYR3KdPjXImVniSmrJbxdYHSoPq6vlEH7l9jxJVumB+mxAYU2RoMeLAmEOXlliv2JX1+
	APNAy8r/7u1wOdqp5MmtHIy9EmGUHd/4KO6/P02L9sILVUgup5/XbXNY7HLY0DMSSW4nDrJt5MU
	WnHNGpg9BopndHO0joMdQN9X7em4VsE4S+dcV1pC8h+g==
X-Gm-Gg: AYBFou3fRRRGjls6BOhcpmlXqLBshIdaHbtCQrrS4bhIt9eT628la01id43psy/Xnsb
	W1UW32dT/TP0ANXTFykoXVTgksZf7QUPfyDe3MBJ2rvxIxpjWE4VxGOLI7RtPexkGVFPloX4pez
	N4mX3c+e3NgREkMGb4lpVe1mmP5KYafH6eH8if9BdkBVL7/SoGZ7guC9Hg
X-Received: by 2002:a05:6820:4b03:b0:6b1:d1cb:cd6 with SMTP id 006d021491bc7-6b6fcfd9588mr14080513eaf.23.1788823255177;
        Mon, 07 Sep 2026 16:20:55 -0700 (PDT)
X-Received: by 2002:a05:6820:4b03:b0:6b1:d1cb:cd6 with SMTP id
 006d021491bc7-6b6fcfd9588mr14080488eaf.23.1788823254758; Mon, 07 Sep 2026
 16:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com> <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
In-Reply-To: <CACu1E7GGdxTOsn+MRDT+7Guhjs-DDkZVx0Yet=RTxgQ4CNCKhw@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:20:43 -0700
X-Gm-Features: AcwNN1Vjgj-tYHtj6eTbg-Hki5u63lIX48kQkMC8BVBIy_zhePixhFmWvWpwWWw
Message-ID: <CACSVV00BtmA0CotRucd8jG=cQLQw0YmLKEkTOV70qHBx=sG0sA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: rhPBO12Um7zxbLaihB2GdkwufYLaMm20
X-Proofpoint-ORIG-GUID: rhPBO12Um7zxbLaihB2GdkwufYLaMm20
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDI1NyBTYWx0ZWRfX4SUJoIUB54Ku
 tjj0Er2BIB7mmKmJxRuK8v7LVuFDoTuJX9Tx73Uwp8ysLImXrCEyJFU7C7fnjhPKh9CDX+sHHie
 /EdmdAh6xlvaoOL1uPma7/vySqnQ6tw=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9f46d8 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hd7ZCrGOQM2Qc8NPfv8A:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDI1NyBTYWx0ZWRfX48NJhXvTA16x
 Bm5YMWZWhKeOsKrtOHyz2hg13ge6hPSX3GGkSnCSJPPbEo7F6hLNFaFlFeX6aLbqimYIR/FN5qw
 mgLi61pXCgd1LrL4EEaP6lbFQc85Eo9XlZB6blqyUaQAbwgklFDHsqZxnK7pMUUVODo076GiVny
 RMP5Dvnl4J/vPxNblZwZKn2gdOACHgewuOXZE+RGpLOeQyUJ3U/PEMhnCnaigP+uCHNorKXCfe+
 B9p3koTblzPvLJ4IeBsXHfBLZnLlUqKbRzEXx5aa2963Gy9l6TXPrtv+IENVdXA56FmXEH2JkOn
 dGXKTlNbZa6BR9+Fnowri4wXHdXKDOUKzgaQZwGkNWgurvwdP32awRubfZTdL2I0J7zvcTnTP37
 KeQYhVT3/8Q8lx/NcF3Ic6FSxxCNR4nnJRm1pDQY54B2kAFXYh33NBkTofltN7JFW5yVRsG9fpU
 oB0FyV+uYrWUk0O198w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_06,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070257

On Thu, Aug 27, 2026 at 9:07=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Thu, Aug 27, 2026 at 7:13=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
> > zero whenever the GPU is powered up again and the timestamp reported to
> > userspace jumps backwards. On an a702 six reads three seconds apart all
> > land in the 500..1200 tick range, stepping backwards twice, and on an
> > a530 the OpenCL device timer conformance test fails because
> > clGetDeviceAndHostTimer() returns an end time below the start time.
> >
> > Save the counter in the suspend path of the affected generations, while
> > the GPU is still powered, and add the accumulated ticks to the value
> > reported to userspace.
>
> This is useless because the entire point of clGetDeviceAndHostTimer()
> (and the similar thing in Vulkan) is to match what the GPU itself
> returns, and now you've broken that by adding an offset.

Just to clarify, the timestamp needs to match what UMD reads directly
from hw in various different ways (timestamp queries, shader_clock,
etc)..

If we can _restore_ the value (ie. write the hw reg) on resume, that
would be ok.. but it doesn't look possible.  Otherwise I guess we need
some scheme where an offset value is stored in memory somewhere, and
some coordination with userspace to add the offset in various
different paths.  But the kernel shouldn't be adding the offset to
what it returns to userspace itself.

BR,
-R

> Connor
>
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
> > domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from z=
ero
> > whenever the GPU is powered up again and the timestamp userspace reads
> > jumps backwards.  Accumulate what the counter reached before each suspe=
nd
> > and add it to what is reported afterwards.
> >
> > Measured on an a530 and an a702; the GMU parts keep their own counter a=
live
> > and are left alone.
> > ---
> >  drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  2 ++
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 ++
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++++++-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
> >  5 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a4xx_gpu.c
> > index 6392126f48f2..7d9dd9460f5b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > @@ -593,6 +593,8 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
> >         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >         int ret;
> >
> > +       adreno_save_timestamp(gpu);
> > +
> >         ret =3D msm_gpu_pm_suspend(gpu);
> >         if (ret)
> >                 return ret;
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a5xx_gpu.c
> > index f1df2514c613..c5552f1085e0 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -1423,6 +1423,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
> >                 gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x0000=
0000);
> >         }
> >
> > +       adreno_save_timestamp(gpu);
> > +
> >         ret =3D msm_gpu_pm_suspend(gpu);
> >         if (ret)
> >                 return ret;
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index f9de9329dee3..106cc2ac55ff 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2252,6 +2252,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
> >
> >         trace_msm_gpu_suspend(0);
> >
> > +       /* only the GMU-less parts come here, and their counter is in t=
he GPU */
> > +       adreno_save_timestamp(gpu);
> > +
> >         a6xx_llc_deactivate(a6xx_gpu);
> >
> >         msm_devfreq_suspend(gpu);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 3370cd44382f..f83960b31901 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -226,6 +226,13 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
> >         return vm;
> >  }
> >
> > +void adreno_save_timestamp(struct msm_gpu *gpu)
> > +{
> > +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > +
> > +       adreno_gpu->timestamp_offset +=3D adreno_gpu->funcs->get_timest=
amp(gpu);
> > +}
> > +
> >  u64 adreno_private_vm_size(struct msm_gpu *gpu)
> >  {
> >         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> > @@ -398,7 +405,8 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
> >         case MSM_PARAM_TIMESTAMP:
> >                 if (adreno_gpu->funcs->get_timestamp) {
> >                         pm_runtime_get_sync(&gpu->pdev->dev);
> > -                       *value =3D adreno_gpu->funcs->get_timestamp(gpu=
);
> > +                       *value =3D adreno_gpu->timestamp_offset +
> > +                                adreno_gpu->funcs->get_timestamp(gpu);
> >                         pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >
> >                         return 0;
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 114a40f79ef3..db080a6d515c 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -207,6 +207,8 @@ struct adreno_gpu {
> >         uint16_t speedbin;
> >         const struct adreno_gpu_funcs *funcs;
> >
> > +       u64 timestamp_offset;
> > +
> >         struct completion fault_coredump_done;
> >
> >         /* interesting register offsets to dump: */
> > @@ -610,6 +612,7 @@ static inline int adreno_is_a840(struct adreno_gpu =
*gpu)
> >  /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI=
 */
> >  #define ADRENO_VM_START 0x100000000ULL
> >  u64 adreno_private_vm_size(struct msm_gpu *gpu);
> > +void adreno_save_timestamp(struct msm_gpu *gpu);
> >  int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
> >                      uint32_t param, uint64_t *value, uint32_t *len);
> >  int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
> >
> > ---
> > base-commit: 140b13475302601368c0cf4e193e66126a49feb3
> > change-id: 20260828-b4-adreno-timestamp-f4c846391b97
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >
