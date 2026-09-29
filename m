Received: from mail-lr2-f11.google.com (mail-lr2-f11.google.com [74.125.230.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6554F5DF9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674200; cv=pass; b=uwmGHrkshQLkqpMBHc30TrS0c2kvWvxJ9/0CiWeHZ7LMoDTMsX+gdAzeA1jcfbGWLKJQgwlfx+E5K0ddsAKdunMmsOnrATb6UNbJLVkasUPn3pFYZ0F92+yMMT1V7i4gpcycMirGLVE1ueIjVBEBUhf/GUVwh+sIg/Pw6E8LfLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674200; c=relaxed/simple;
	bh=1XWJMMt7B+cfIhVaWu7WIPENvQrwiPRvcsMo92t2ja0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JS7AmMA2YiYckZZri60W/S58JS45DX9gUWizDJ7EtJv9k8bPTE5VIIu1Ss4n/dPVMMpF5Tka/EPI/9DVDOHI/MLZdEuTJx2C/iPjCO2XOiCBOAkIphWiJN3MOKKqTsbX5t5fJRAlhzDXEzjsf3nen2D0/Qo58g2rTqUpDybDQVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvgkwEQa; arc=pass smtp.client-ip=74.125.230.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvgkwEQa"
Received: by mail-lr2-f11.google.com with SMTP id 38308e7fff4ca-3a49e9e7cd8so30415691fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790674196; cv=none;
        d=google.com; s=arc-20260327;
        b=oM5ft4VEyaW4GePopH07tOkyYjK8ttl0w42EePOCMZKNQpc13H+qJDnoW4wJygrPcO
         uoGDhHmUFQ7fWQkYXXl3qj5iQM/Cny+lF+1QZoQbbHahoqMF/qxFmlsJGfKL1cEQO5Oh
         7IuBbLIQmJrBcTDkwOQW5azUh8lPmFcFcmK6IbA85M/tVAbQ0+DBiEn6DS5T9VfdV//k
         QruxT50K3SAsa1ZvUZOffx/IZD50McrHKeM1oQ4zh4rhsr5BPb9I51ewakkl78ZLALsC
         A6ed35PNYmB0CoUuEI7YziEnMNBRxZICpwsHmlE2HPNCKMgVZBEmmsMGST99GjAVfQci
         tz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhSt9RrDgclo++iTfJ1ToFjlbT6uO7QVlIXjkP8IcNI=;
        fh=sUNj2dhqbhpGM3e/Gr9c14F6vfmMqp0LmArsgPzmsDo=;
        b=OCH8pox5vCPQjt1vhVBgAZDM6EDM54pWdpvxfarTEQ4Ng4WyfhGTODRtIT1oz05ySi
         iDPHJ99uCFw89PFvj7EkTdT/U+VAXc/RoqScB7Iscv1XurP4kA64JudAUVyGvLkhRtSq
         vmJj6OqEhRHQptlt6xvvfttR94JtI2gaDTy3j0H3TL7nM21j6IwQuU8NU9K7N/ZjTMNH
         cxUU9fgGqCQxE1USFAETqO5BFr2nh0inrHbzsnzVm6tEwEOCZP6Es0/lhQRkaNVVIOfw
         haBsxIEFYuEIjxp1Cx/MlOZnJXIg1gkIZgris5XjWxKpQ+cqOQl02nodamGtGDlpoYJI
         /0zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674196; x=1791278996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhSt9RrDgclo++iTfJ1ToFjlbT6uO7QVlIXjkP8IcNI=;
        b=KvgkwEQatv1mEwliw8NohxNcZ8H7jeUSSshdgC7Q1DvjA4qH/QW1zukNmorP9Jivak
         uYuLtHdUhPspBoeyBvHLoEAl2vdJR6QXN8LYK+fHiQc3xMce1lS273ljY0r59dtXh3ym
         MkSXgvt3dOsG3sKNyQdxII+HYBDsKipoId48G+LcT2NyFp3Y3oFJAbvaOUqRhp9S1uEV
         nxGmvqMj1X2LWTpcWj9LRjpqo+AfsiekT8UxngASqmmRWDFj2aTLlfDFKN1RpITOyuMa
         T5FRdAye+zuiNDakTU9vBvkuTyvBEkYiC9ySdGhgkoHvYePYU1LKI6EScNYe8/5XAS5s
         +DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674196; x=1791278996;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhSt9RrDgclo++iTfJ1ToFjlbT6uO7QVlIXjkP8IcNI=;
        b=IYkfpL21RVEXrJrfUyCdvtXeVM5L4ih8iqWgPc3d4iNU1zMB1iU7zUOqgrU3q9Nk+3
         c20I3Cehj0WF6W47B55aJepjTRyLCc1jO1t24cuWlw182Ve4RSwMkc2nsP2eADmAkEcK
         esj+JXjNgzl9QbRVtdXrEzJUbbfpUF2Ga8SI4rQKKZ9R6cjNsAWYPe/KDGF9tyHGNNnx
         RvOfahDaHM0+d175F0DHrhU3uK7KbPsyj/3qK14MNG9vJNYYJJ80wqw2cdcRSe34cZwR
         2OFgsMEG8sTCUnwfd6LdiCB+rYty0ueOJ40hFejQJgmZU8iGj6DUYYXRjC72OYJbSPDu
         e06A==
X-Forwarded-Encrypted: i=1; AKwUvBy15DrGf9s34jzL8BksuynHsJaeSeAbrmERxv+DPoN+T10JCKcO7EiRstToVV4wL32QrlD/qIPSESkOKQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ/u+gpanwiYEMDpu47QpOt7mIgCnX0Jb1RBe1zu0APk9r2+B3
	loqiVdO9X1rBSvvoyUik08vBMjy0VwWVDVQ7WrweAT0E7hg41eHUY/ys2UyDMX2JWhgxTEedqi3
	iI62/xsOA69pZ0bfGTluy/+JQluaRSC4=
X-Gm-Gg: AYBFou3VNrT1ddFQ9a+lSF9rEbMuD6VXnr00zOrldKY+TkrLM/hUesUwa2bbjqYq6UD
	2EU8+kzgUhzlLBQHkxL7BQwln4HdbfbfDP1W7dImyiHVeUr0peJoqoKLgxhQTT5zJUUfTahOOdI
	Uy1UQdIPySEAYRuqmJrGoOxoTTS9OFzORO8uw1lWM4c6xJaYlBdEgWnOENSJTr1DHT6RtBRHpwp
	AVJZzUQLetCICb4UcLLbNKMzEmI1u4ea4iseUU7DNMdTpA3zEJVYvq9phBc92oYMy4ioBpZvK5g
	x5jrPocD+6mf1yN+oFaVFC2A6ZyB9AAsBtGXWRauIhBpd0HnrXYi
X-Received: by 2002:a05:651c:b22:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a66831753emr17447411fa.6.1790674195948; Tue, 29 Sep 2026
 02:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125523.43813-1-roman.demidov.nn@gmail.com> <CACSVV02h=c8KQoUT+18uXBoL4nkTzefu6AiTX=y6-W0rUrSSYA@mail.gmail.com>
In-Reply-To: <CACSVV02h=c8KQoUT+18uXBoL4nkTzefu6AiTX=y6-W0rUrSSYA@mail.gmail.com>
From: Roman <roman.demidov.nn@gmail.com>
Date: Tue, 29 Sep 2026 12:29:44 +0300
X-Gm-Features: AclHuK8WiNHB93l-tibJnv-74UuqCfijjfNU3TD0Xmz7yFxr3JF9kKuc8tDTO8s
Message-ID: <CA+KF4bJSyuhB4OGDU-31riOMZK+4ubtLSPpTf8qgkW3pt6nXrA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check pm_runtime_resume_and_get() during resume
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thanks. I did consider guard/cleanup here.

A plain guard(mutex)(&a6xx_gpu->gmu.lock) would remove the manual
unlock/err_unlock, but it would also keep gmu.lock held until the
function returns, i.e. across msm_devfreq_resume() and
a6xx_llc_activate(). The current code drops the lock before those calls,
and I didn't want to change that as part of this fix.

scoped_guard() can preserve the original lock scope, but the error paths
still need to unwind the PM refs and clear the OPP in the right order.
Doing that with labels inside the scoped block and a success label
outside ends up more convoluted than the current linear unwind. We'd
still have goto, just with extra nesting/state.

I also considered PM_RUNTIME_ACQUIRE(). The auto-cleanup for
pm_runtime_put() is nice, but it doesn't remove the goto-based unwind
for the clk_bulk_prepare_enable() failures. If the GPU clock enable or
GMU clock enable fails, we still need to unwind the previously enabled
clocks, clear the OPP, and drop the mutex. So we'd still need a goto.

That said, if you'd prefer I switch the two pm_runtime_resume_and_get()
calls to PM_RUNTIME_ACQUIRE() and keep the explicit clock/OPP unwind, I
can send a v2. Or I can respin with guard(mutex) if holding the lock
across those calls is acceptable.

BR,
Roman

=D1=81=D0=B1, 12 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 04:5=
5, Rob Clark <rob.clark@oss.qualcomm.com>:
>
> On Fri, Sep 4, 2026 at 5:58=E2=80=AFAM Roman Demidov <roman.demidov.nn@gm=
ail.com> wrote:
> >
> > The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resum=
e()
> > are not checked, which can lead to hardware access on suspended devices
> > and PM reference underflows.
> >
> > Fix this by checking the return value of each pm_runtime_resume_and_get=
()
> > call and properly unwinding the previously acquired resources on failur=
e.
> >
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> > Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++------------
> >  1 file changed, 21 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index f9de9329dee3..0cf205ea744b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2175,44 +2175,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
> >         opp =3D dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
> >         if (IS_ERR(opp)) {
> >                 ret =3D PTR_ERR(opp);
> > -               goto err_set_opp;
> > +               goto err_unlock;
> >         }
> >         dev_pm_opp_put(opp);
> >
> >         /* Set the core clock and bus bw, having VDD scaling in mind */
> >         dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> >
> > -       pm_runtime_resume_and_get(gmu->dev);
> > -       pm_runtime_resume_and_get(gmu->gxpd);
> > +       ret =3D pm_runtime_resume_and_get(gmu->dev);
> > +       if (ret < 0)
> > +               goto err_opp_clear;
> > +       ret =3D pm_runtime_resume_and_get(gmu->gxpd);
> > +       if (ret < 0)
> > +               goto err_put_dev;
> >
> >         ret =3D clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
> >         if (ret)
> > -               goto err_bulk_clk;
> > +               goto err_put_gxpd;
> >
> >         ret =3D clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
> >         if (ret) {
> >                 clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clk=
s);
> > -               goto err_bulk_clk;
> > +               goto err_put_gxpd;
> >         }
> >
> >         if (adreno_is_a619_holi(adreno_gpu))
> >                 a6xx_sptprac_enable(gmu);
> >
> > -       /* If anything goes south, tear the GPU down piece by piece.. *=
/
> > -       if (ret) {
> > -err_bulk_clk:
> > -               pm_runtime_put(gmu->gxpd);
> > -               pm_runtime_put(gmu->dev);
> > -               dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> > -       }
> > -err_set_opp:
> >         mutex_unlock(&a6xx_gpu->gmu.lock);
> > +       msm_devfreq_resume(gpu);
> > +       a6xx_llc_activate(a6xx_gpu);
> >
> > -       if (!ret) {
> > -               msm_devfreq_resume(gpu);
> > -               a6xx_llc_activate(a6xx_gpu);
> > -       }
> > +       return 0;
> >
> > +       /* If anything goes south, tear the GPU down piece by piece.. *=
/
> > +err_put_gxpd:
> > +       pm_runtime_put(gmu->gxpd);
> > +err_put_dev:
> > +       pm_runtime_put(gmu->dev);
> > +err_opp_clear:
> > +       dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> > +err_unlock:
> > +       mutex_unlock(&a6xx_gpu->gmu.lock);
>
> this does at least look a bit less terrifying than what came before...
> but maybe
>
>    guard(mutex)(&a6xx_gpu->gmu.lock);
>
> to simplify the locking part of this.  And I think at least some of
> the runpm stuff could also be handled w/ guard/cleanup stuff?
>
> BR,
> -R
>
> >         return ret;
> >  }
> >
> > --
> > 2.53.0
> >
