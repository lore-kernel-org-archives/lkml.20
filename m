Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727654C97
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437663; cv=pass; b=Z7wBsYNdlvlN3rVV2o41iuU+fmY7dWVORgsv6ZqU4hNXE/GdV+nIpfzzqJ4oAKxgtO9o2q5f2X4X1Ss9+6X74KlSQeMYmlkHmcfrTfb1DxF/4LqG0hDNFqAzu3Gd7DET2EzPMnu6q2wGC+5HvFxnJTfLGXwk+X+9YsyIebrELz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437663; c=relaxed/simple;
	bh=bja5dQBpSKcVggNbbhhqokEufX0ymW31CX2DChhuvR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHabkoor9ghCxq2Kls3iPY4usX2HHQl88bISfSEwwAsV0q/AvDWAzD20dyAjDcyetkWgX6EFjkzIyAFSD8PJDKTqq1XMZfbO8NsaZuob1kM9lpB5xUbpeg01GyRHcPDX1OtyMby1HoNPsEfG1mWCk9+/gN85v8ZlY8st68l8CbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fO7jfr7l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=in+PJaRr; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fO7jfr7l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="in+PJaRr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QDpPU23931850
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=; b=fO
	7jfr7lwRzdlPAXZlW3o5LbBTZrJPA0ZNCtEMuY8mBLR7J/Uz27vkKnTD8FP+KFE8
	fJQ+ZoF4ph4GuByFffW8/zuGWUILSkvS3B2RNwb+h7b/H0P2RgbU0+1WsjCyifxQ
	WOmYAPpMQYlcfv9YuASU2K7EhId7nlUTaue6lj/fRjdTO9nAOQqVMr9LCzsDHelT
	6C1rZ3/Z80FzeuKOyT3L3kqxdCnNe8wpxmcWGYibLMflEErw3DLrLNbbpTx2wCdt
	W6jbFVeBJbFExt4YS32LMLGrpITr6PQ0KaHQxqZnI3ji4rjeTqPNc3YysoCozCWF
	lPa7oOvZoAPfs3iFEmUQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5cgh9s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:47:41 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-469debb527fso2047550fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790437660; cv=none;
        d=google.com; s=arc-20260327;
        b=VZc3SQu38NXyPwYxX0ByFdOQhiUpEzotjd8bpCoE0ZjlYzBi2pHJcKpxidIcAuGbNS
         7odrIrNmmApYmKqhzg2etX3RH4vlG7RjS1vxMdts7Mr9H8VqO6invYkqYQB6qVToS4Do
         Jo8qOQDbOXEprxVb/Nx9dP1fsAhPVCvAyLNxNpcKQoHFozZfxgfTGa6Y3bv5emhbet2u
         3XdulQBA2jVGz3jYLKY2DIrms6dWdWZAda6JQ5Jd1SFCL8q6Or0p6/bRv5fZ/+chOhhw
         8pYm+O/OVQFNozyQ89cp5IWot+4ERyANzAEBjllqe86lWXKlz38n6HK7T6bDVUs3lRXK
         sJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=;
        fh=EYR9ZIJFf1uiv1tLAfDXyabkJELqAEsAiAA7baHdnWk=;
        b=MkjabGVWOcBRZeu8vOHXso/s1wJ7+1zGlw9Z1R72VWGY+wjO9YcnalTnZlWn4ReUSQ
         9BThNLmjm4Z1x+amYD6V9WyPq/H4+t++Is6xD/Zzxbi50ykypCIaxaLpcz7VMSX8JISc
         1AcOhync8+WMVLhISMhWLMYYOh7N0Ak1DDHXAMrKi8Lrs5cqzJGEv9f///6N88d4ggwa
         Pr/yU0zrErriejpZMvdnk8Sez8jz7SrLay+y9ioAnYY728IanEIaXH4o87LtfmDJ3WOJ
         M34B43QEYAPMn/fliOEEzP4Ou1s0pdJUYNlVDvNSBSPuRPo4vQrsxJgUY3OQWNjjz0/s
         pl5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790437660; x=1791042460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=;
        b=in+PJaRrNdJvRPAjohsPDVOyv8pfmat1xDz63bc3mLl9RRU8Xb+PZaRXrrnTAwfGAK
         kzKHevWsNX+k8oOf0vMhNHvpZz++gFwt7lIkg3Tx8jeRrY0PI9nWhA8NFAhlATxCJc+K
         uPL0UyXFciXAnEz1kC2GOtV2xcy8/dt6glfzDldbSdgro1uu2EsoSIW17wY4LwwJZTUB
         myrqT0/3SCZzPCXPsU+PDcHUdTYi9s9LSkMRx3DPZFrtSAEuf4QIqfGwRzONyWwa7QMF
         t5bjECyTvhztnJBRw205fEJIig7W4zcY/VJHEgVGoZIDGYUrOyhck2RGfsm6UGNGGjOU
         KDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437660; x=1791042460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMZ+iTCkhXTeqoblAjLsoVh6+/LG9XNCLdnREQCp/DI=;
        b=2bsDdcncLlY+eRQEM1Bto3nqwM72oPUaii0JTFrhC+6wyXvL4kh2v8cSjhpE2Te8jE
         ozIwlU1BiFbp2Uzo4nGBzTfH80prUum+t3eB79I6iN+pokaQck2JfO2oq8akCop8hYtc
         RHrr1+TZus0YEVWysJifSIbZVvYtsO67DYOiqjMKc2ODB63GKosM+3wVMqptDb/QXyZC
         mvzf/adkCOq6YR5gvtsLJ+r9mO2yPXMbTrzeOfcHIvEolEnuqjUivf6M04Wgw7x/Ztiy
         OdRtUINjU3DENhSxv8YFs4BxlXMAto/bgSF1nEZBt60upy+USq98bF1kCFi8VV2CalmC
         zNrw==
X-Forwarded-Encrypted: i=1; AKwUvByukKK4ujVfqFPT50gTq4aSL+S/uMjg9Y0xIYZQC9ID08Dgkex/AuBVd/2mBfCSbXlzf1lv68tQugz9ODI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLROioZIRN91IM3b65IZ+cKXENCz9SHr0V82JwAoMjxtmDLS2W+
	pg7Jd1Xc9SNIeCdj8MN28HKd8BU6LLFLDpp/A8PEjD3YEjT+5RKgSc6yNPIOTv3VfGdhyna0BZw
	xL041rEZKtIZWQxfG074hThGD893NFZW4UA38zJl03mlO0tNV4Dtp+NF+5of0SpIjbQspJbt92o
	ufa9YBmgvVlK1PUbsmgZgfj1DZGUWHv/R7xraQ2lcZbA==
X-Gm-Gg: AYBFou3176iVk91opuRuQ4ql+MBdkLcXJ0IciNCWsFmBOqJmuJtgRbaRTI1akymmjtp
	+iS+CDdDFVobSX196+xdz3ThWPxz/zc5f7+w4q3RNLTzbJCuNkLMxJ99NDgwSKBsNegSJpy4LF8
	xzdAtPqlvaJ2EpCgCn163zhALlMj0TeiqaglLknu8rpGNCgXzNeCqBp+Vr
X-Received: by 2002:a05:6870:f613:b0:48f:e107:3189 with SMTP id 586e51a60fabf-491e6ce18e8mr8561220fac.41.1790437660418;
        Sat, 26 Sep 2026 08:47:40 -0700 (PDT)
X-Received: by 2002:a05:6870:f613:b0:48f:e107:3189 with SMTP id
 586e51a60fabf-491e6ce18e8mr8561187fac.41.1790437659970; Sat, 26 Sep 2026
 08:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com> <20260912-fd-kms-fix-smmu-v3-1-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-1-a7ddc6fe2032@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 08:47:28 -0700
X-Gm-Features: AclHuK9cxghme6lV-xoFMmZbZ0mWJR0qaLuDqqfDUs6jVDEGvSERVCEWpuW5hG0
Message-ID: <CACSVV00XJ4Ad8AMr9C8hv7LjnjVXmG2JrDtJxsyqx=Gz+rZ2XA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/msm: serialise framebuffer pin state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2MiBTYWx0ZWRfX15TZZ6Db5tjo
 l5TBqqMnKHG7PN+rdOigiQR5yGlFYBYaWuIrMAmcV4sYOyzZV/KcD/BXVhn/okBuuHufW/9QxiQ
 POpGOglVTmFWuDwRGRIa4ZWa1X8ofJLMx6tCvkcTgYVPjhGqOqkxu21vL9LHxWxmalPNBLQAYNw
 iVlxD+LN3qUfsCR/HE1N4MZNB3HT40G+sdr4Yh1+X+64Xu/yQ+hfc7yFKGEfy1pdn3Xa9t9B+yA
 S1gv8smfz8lMrXgtMGEU6lDy56ls1kXM0+CmAxbWnwFPGt4kTZizQL7KRfrcX7NQ1W9HYCDSsQi
 s3ZPKN/sxqKvPnLLgAlomheoYx0EP403BcmNhoM9qyChDD1XYEiXRaSEhsMBreLEaIMaDf2GscA
 YXVO7eYNcWDwlKrto+1CRPsynT0k6g5JgSeBd5ikphbULJX0s/Tnw0YfklQnC2Yx0mj6mNQEHuW
 CCuT5BTfFhO30ASxFWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2MiBTYWx0ZWRfXy8xLvjhJLceh
 1bSigEXxizMvFyYGupcLBnl12fYztWlu5NLxL8UA1Rc4QSK9L0Vj7P2mpUCG6v3MwLdwy9I9XHa
 pBjLwwLTPtWSECAol/sSI/8MVoVZV1w=
X-Proofpoint-GUID: Oa_KyixWEm-nvBaRCa8W61P_hFIwa2jl
X-Authority-Analysis: v=2.4 cv=QvLLTlyd c=1 sm=1 tr=0 ts=6ab7e91d cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=LMo7-oU2RdcLhoRdf2wA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: Oa_KyixWEm-nvBaRCa8W61P_hFIwa2jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260062

On Sat, Sep 12, 2026 at 5:48=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> prepare_count, iova[] and the pins they describe are updated locklessly,
> but drm_atomic_helper_commit() prepares a new state in parallel with the
> completion of the previous one -- stall_checks() only stalls on the secon=
d
> previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
> in ->cleanup_fb(), and for a double-buffered flip that is the same
> framebuffer:
>
>   cleanup: prepare_count 1 -> 0
>   prepare: prepare_count 0 -> 1, pins, stores iova[]
>   cleanup: memset(iova, 0)
>
> leaving the plane programmed with a NULL base address:
>
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402,
>       iova=3D0x00000100, fsynr=3D0x3e0023, cbfrsynra=3D0x1c00, cb=3D11
>
> The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
> Refcount framebuffer pins"): a prepare which finds the count non-zero
> returns at once, assuming iova[] is populated.
>
> Both callbacks may sleep, so a mutex will do.  drm_framebuffer_init()
> adds the framebuffer to the object idr, from where userspace can reach it
> before msm_framebuffer_init() returns, so take the private state out of
> its way and initialise it first.
>
> Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_fb.c | 44 +++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 60c108d35d2a..77415302e6d8 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -22,9 +22,12 @@ struct msm_framebuffer {
>         /* Count of # of attached planes which need dirtyfb: */
>         refcount_t dirtyfb;
>
> +       /* Protects the pin state below: */
> +       struct mutex lock;
> +
>         /* Framebuffer per-plane address, if pinned, else zero: */
>         uint64_t iova[DRM_FORMAT_MAX_PLANES];
> -       atomic_t prepare_count;
> +       unsigned int prepare_count;
>  };
>  #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, ba=
se)
>
> @@ -45,9 +48,17 @@ static int msm_framebuffer_dirtyfb(struct drm_framebuf=
fer *fb,
>                                          clips, num_clips);
>  }
>
> +static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
> +{
> +       struct msm_framebuffer *msm_fb =3D to_msm_framebuffer(fb);
> +
> +       mutex_destroy(&msm_fb->lock);
> +       drm_gem_fb_destroy(fb);
> +}
> +
>  static const struct drm_framebuffer_funcs msm_framebuffer_funcs =3D {
>         .create_handle =3D drm_gem_fb_create_handle,
> -       .destroy =3D drm_gem_fb_destroy,
> +       .destroy =3D msm_framebuffer_destroy,
>         .dirty =3D msm_framebuffer_dirtyfb,
>  };
>
> @@ -76,13 +87,15 @@ int msm_framebuffer_prepare(struct drm_framebuffer *f=
b, bool needs_dirtyfb)
>         struct msm_drm_private *priv =3D fb->dev->dev_private;
>         struct drm_gpuvm *vm =3D priv->kms->vm;
>         struct msm_framebuffer *msm_fb =3D to_msm_framebuffer(fb);
> -       int ret, i, n =3D fb->format->num_planes;
> +       int ret =3D 0, i, n =3D fb->format->num_planes;
>
>         if (needs_dirtyfb)
>                 refcount_inc(&msm_fb->dirtyfb);
>
> -       if (atomic_inc_return(&msm_fb->prepare_count) > 1)
> -               return 0;
> +       mutex_lock(&msm_fb->lock);

guard(mutex)(&msm_fb->lock) ??

here and below that would simplify the error path

BR,
-R

> +
> +       if (msm_fb->prepare_count++)
> +               goto out;
>
>         for (i =3D 0; i < n; i++) {
>                 msm_gem_vma_get(fb->obj[i]);
> @@ -90,10 +103,13 @@ int msm_framebuffer_prepare(struct drm_framebuffer *=
fb, bool needs_dirtyfb)
>                 drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
>                               fb->base.id, i, msm_fb->iova[i], ret);
>                 if (ret)
> -                       return ret;
> +                       break;
>         }
>
> -       return 0;
> +out:
> +       mutex_unlock(&msm_fb->lock);
> +
> +       return ret;
>  }
>
>  void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dir=
tyfb)
> @@ -106,8 +122,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffer =
*fb, bool needed_dirtyfb)
>         if (needed_dirtyfb)
>                 refcount_dec(&msm_fb->dirtyfb);
>
> -       if (atomic_dec_return(&msm_fb->prepare_count))
> -               return;
> +       mutex_lock(&msm_fb->lock);
> +
> +       if (--msm_fb->prepare_count)
> +               goto out;
>
>         memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
>
> @@ -115,6 +133,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *=
fb, bool needed_dirtyfb)
>                 msm_gem_unpin_iova(fb->obj[i], vm);
>                 msm_gem_vma_put(fb->obj[i]);
>         }
> +
> +out:
> +       mutex_unlock(&msm_fb->lock);
>  }
>
>  uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
> @@ -199,14 +220,15 @@ msm_framebuffer_init(struct drm_device *dev, const =
struct drm_format_info *info,
>
>         drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
>
> +       refcount_set(&msm_fb->dirtyfb, 1);
> +       mutex_init(&msm_fb->lock);
> +
>         ret =3D drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
>         if (ret) {
>                 DRM_DEV_ERROR(dev->dev, "framebuffer init failed: %d\n", =
ret);
>                 goto fail;
>         }
>
> -       refcount_set(&msm_fb->dirtyfb, 1);
> -
>         drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
>
>         return fb;
>
> --
> 2.47.3
>
