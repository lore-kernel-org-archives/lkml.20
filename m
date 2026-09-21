Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F21E44F57F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978362; cv=pass; b=WwBga5dzpQ6Q7Bv2p4ZBInv8YZATnUUosrFBgZ9rgNlCDtBbt4xKH2+oJPFQVeZPJzhlbEkTeDS1dDXSixh2CD4VOOb/8vdtqO34oWkv+tfOjpxaYfXHsB3DRBDgBw7pA/PZmGKCXgbvMSWlbRrPrnW1zlWz4HX9IJcafl15gu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978362; c=relaxed/simple;
	bh=4zQQq5eKKjqi9TjSvjMNrXcJkXocK5JzF/OCYT9LqTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCKQgcABt/D7r0h2T0n+kRrjffjwYNjtkNOE72n3N/KVW/g7KwfuJ+IX6xeffjjjkxqOC2G0ApqqTMu9SCxeFqmMsiPRXhjFMyfBCtk3e33YC1L6aOPmL+xtLX7NH4CQ2YKTIfJAfd0LAdCbaVHf+Q0a3BSmURuSYzo+i3UXgy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCkG9CFw; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCkG9CFw"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4aae314aso1946914d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:12:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789978360; cv=none;
        d=google.com; s=arc-20260327;
        b=HhbFV1WQCIgZC1Rfk1R5iScv382X42mKOwVUUMDmDsA/CWAbd4sKAbX71ptkrBmQg5
         97chI4LLnB5utp7/hatK+7eJiq19BB7SEhFJuFfHt55SbjQFMdTx2Q0oppxaLbx/xP01
         pVkhnzovd560qKnU6YKycPL5w3hPdJniv4zjTWqrMDLVfFgmZK+wAH7Sye2j+rkdSyjl
         6QAQ5lBjL1wQeEPSjBaO8GxzPRjR5mBz+3GVUxqcGvpSuu7RRVVIpRB3lcB5NGecKokg
         37h0TFWIdDF1rPNg0BAsxfCi3i5vZuEsqI+L3cr3mgv2OlzEJR/oOeOR++Y8CFqDQuQa
         2qHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2iqujM79yGjztEGr/+fVKOMfP5+oEqBbOqmgpHVP6Xw=;
        fh=ufzLeGYWTpujt5M9xPW4K08ljseHcXEn6QJOJ3Z80yU=;
        b=RjMRkpYc+wJnXQH5vBtIEvHmvxKhooHbbyBH6XXb4akXcXLIt1+qzkUYfbX8+oHuB6
         qImeIQCn+Ms+VmuHJ4orKsBGxMyvObmEhq3OCCDyQ19w06nkfWEw3lpMbdRZtdz9Q0Ud
         s2TwhXV3y8KDjznvWdhF3VCi1SJFHumj9yVaWacn2vDv1DwARuNAYxgQ1BdHxBcTyf6Q
         1m25ITNVV58zx2YKZXKAO3AziSCrTG1DYGTFrPwk9fucW8luUfDpQXaeyL6Jtfk9hiSf
         yUZmANOml+CmDjtITO4INUT9wPLp7CbzYGrtnahkSRGprBp8Dj/MpWHsbw9cEjSTvSdk
         Ntcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978360; x=1790583160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iqujM79yGjztEGr/+fVKOMfP5+oEqBbOqmgpHVP6Xw=;
        b=HCkG9CFwd8B3YTzjO9d2LghdoR6zPGkRVXBK4hwBIdSLTiccoARdEGtFAPdj96fidM
         Ey3DGL9hWnhgoRXqK5I3NbpIEtu/zeKRx9wRbl3upFdmXV+vZ/Pxcj7Xafz5D3hxUyvE
         j7Sn4yF0Z2y9garqZQaKMBHE99M8FmQFrlMzfTyxQ8pSNEPDSpOlXvZMdxIou16uh/6m
         6ER6FTT7rMW0IfDfHvOoNXIYK/mOxheFYng4Rc1A2my94ty88PcSTM7qwkZqTY57Pl5l
         LYYHplOP8LyGjiMBnwMu4njICxc5d3Iqt24qvsWGlBoGO8c24XgJmyzLTvY5QtPT+t2F
         SQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978360; x=1790583160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iqujM79yGjztEGr/+fVKOMfP5+oEqBbOqmgpHVP6Xw=;
        b=B0A0N2kuBWZ5wf+QZKu8XElWxPBClfUYrCPwSp3KdbR/I+0G48hE1T/ZUfhoN7YDQS
         xMfsJNrLuwgH7eHKDCUIOUbmueCU1xf2YLXznG65kgKMXX4uOYVGTla21DPIJYCgASHr
         MiPvUVzs22yeBc2/PSd81BI9JklOBe6rlzAxkeMF7Ej1LbghlqCbbwdsdnw2CVLu9dV0
         CPxvHdHSQgwyq3T7CmxQ6paOFEJLx+IQIo7K47SqbV9K3ZqDwFgr7H3eNZGl/5QRAM9v
         Ui4hQhhE62e/C4lLesPzL1FKi8pbzYjqR29lBVwFEf6y4RJUfTDu4E6Lo5fixUtE3C6Y
         2vMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwovC8ozkCY8/PwtX4x+HMmw1cFDu3aPLjXq/qR/liO4Y4nj6PkgMeUmij1YhRNNJtjeehqv5sCAwrFVyw=@vger.kernel.org
X-Gm-Message-State: AFuF++nEaql8q8h/i7ZooMS7da7zOsKOTQR95LSLHuIbolhSCWkpbWO+
	7n2lBRE00E1b/NCKgXUR9PJTDJZb/wQv4yrJKmlRaD1nM4+hVQv08uuaMsxKEb6VM3gkGopq9T3
	pLiFzzho0Z7QqmmDgyn1D5bzKqvd6Hr8=
X-Gm-Gg: AYBFou1hfjrUIW4GFBq1uEF8pVFKjp6gu5wrK6FgqfOP5MOoqpA3T9DqGXsYkkKBBcv
	fmUK9/SDS/irC4o/9PAMmI53I1Cp2Nvce9Fo/hPsEJaW009otc7qyjdFyLtJSeD2FB40bqJjyoT
	FCr/pT3vRyoOfYlHw5sUkNF8CSG+gq8Xqsn/d3PUkgaCrWnrbT1MD8w7Bhx7UJxq+OyABJgqN9e
	024ZpoEFlrLXRN9y/p89L1OUuGaTb9QBu+AwgZbqIog4Ry9wylNAZ05zuin4IQQihAlcC8PhzYg
	mit4EtEl24/xi/mSCY4Jl83FF1y2mRp13qAuhXtdeybGhXumfvD0WX5FsA==
X-Received: by 2002:a05:690e:12ce:b0:671:70d1:d6d0 with SMTP id
 956f58d0204a3-6717fdfb97amr2457382d50.66.1789978360315; Mon, 21 Sep 2026
 01:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913120227.1559129-1-lgs201920130244@gmail.com> <UqvaHP03S_-FFGTtKijH0w@nvidia.com>
In-Reply-To: <UqvaHP03S_-FFGTtKijH0w@nvidia.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 16:12:26 +0800
X-Gm-Features: AcwNN1XgCXWlbGX--RVpkbgMM1GXMuJYBg88G-h-KhzxE_R154h9ZeFi1-ayk2A
Message-ID: <CANUHTR9xhXwfAmk+OTBdLyUjd5CXZm=aMQuEkH3nwsxd_tQ0Og@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix runtime PM reference leak on remove
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Osipenko <digetx@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikko,

Thanks for the review.

On Mon, 14 Sept 2026 at 13:39, Mikko Perttunen <mperttunen@nvidia.com> wrot=
e:
>
> On Sunday, September 13, 2026 9:02=E2=80=AFPM Guangshuo Li wrote:
> > host1x_probe() calls pm_runtime_resume_and_get() and intentionally keep=
s
> > the runtime PM usage reference for the lifetime of the driver because
> > host1x is not yet ready for dynamic runtime PM.
> >
> > The probe error path drops this reference with
> > pm_runtime_put_sync_suspend(), but the remove path only calls
> > pm_runtime_force_suspend().
> >
> > pm_runtime_force_suspend() disables runtime PM and invokes the runtime
> > suspend callback when necessary, but it does not decrement the runtime
> > PM usage counter. As a result, the reference acquired by
> > pm_runtime_resume_and_get() remains held after the driver is unbound.
> > Repeated bind and unbind cycles can therefore leave the runtime PM
> > usage counter increasingly unbalanced.
> >
> > Drop the usage reference with pm_runtime_put_sync_suspend() before
> > forcing the device into suspend during removal.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 6b6776e2ab8a ("gpu: host1x: Add initial runtime PM and OPP suppo=
rt")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/gpu/host1x/dev.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > index d2c64728f804..bb6a1647e4db 100644
> > --- a/drivers/gpu/host1x/dev.c
> > +++ b/drivers/gpu/host1x/dev.c
> > @@ -729,6 +729,7 @@ static void host1x_remove(struct platform_device *p=
dev)
> >       host1x_unregister(host);
> >       host1x_debug_deinit(host);
> >
> > +     pm_runtime_put_sync_suspend(&pdev->dev);
> >       pm_runtime_force_suspend(&pdev->dev);
>
> After the pm_runtime_put_sync_suspend, the device should always be
> suspended, so I think we should also replace the call to
> pm_runtime_force_suspend with a pm_runtime_disable.
>
> Thank you!
> Mikko
>
> >
> >       host1x_intr_deinit(host);
> > --
> > 2.43.0
> >
> >
>
>
>
>
That makes sense.

I'll replace pm_runtime_force_suspend() with pm_runtime_disable()
after pm_runtime_put_sync_suspend() and send a v2.

Thanks,
Guangshuo
