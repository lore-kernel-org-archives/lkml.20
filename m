Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792809241;
	b=kT/8iZq/FwdSROS4AhQ4hNGJozXOd7VRSiq73Lw4QVATsdHyXSMgKqYyp6rn0GivutBm
	 uXEmXXFvrSoUF1SpBDzEHlF+a1EjpEpvGQh5selCx9Y/kGJJF/YBV71+MsMeEcbK3KHlz
	 5PbA5kl/2BoZMSd3c51fKlQaz3BK+iMpQcQrEdbh2XtAJOS/k9N+Qpz70TP9kXcRwhPJq
	 XUZagHQtanjFwbLl0NoF1SLOQsi0DqSYRUrlS5WI7z35CG02V7eGUEAbbJyUQrPrhcxK/
	 sqva2T6popUnLHPPSvs1ZUigJLjSpsteuy9zF9vOGu6sM8/GswEw2PSJgEENiypqh0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
	b=JnYVVcIgZNF1DniGdGIKzUV/vdHGDc5BhVk4ZKZZs1NWyuzoVZxkttlhp3qsMJZmGkhY
	 /SeLFYO2SjSE7/PgBrTe20ddZJXA8fOI9Rd46GJy9jXDB6kZsFpBTtaZLF/rKLN9AE3TO
	 yRT1vsBMZCna8vJyHGrSLVF/9cTLpRTHMdl1jx6fUfCqfKDzXN+XieoVUgOdZnZfTNemR
	 MOcEWeQH1cuJ9wSIiNB71b8eNcuAgJaNR8JE5l7PdSkUbxL5eMpYQ1JcBn0OwbgQFJDkj
	 3Zo1IoH7xXZHnZQFDaMOyHPrdJsrx+plJb+EbcxnFKi5NmqAE0hn0iCauSfomPKoo/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNWvplRj;
	arc=fail smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B2C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZNWvplRj
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2395719a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792809240; cv=none;
        d=google.com; s=arc-20260327;
        b=mjRkr4ZASvxCuHJx5sNWgQgocvEPFF9t7VE3L3/TPs9bwifPHBL7t4LEaU6J/xrB0b
         ZS6ysqLcaEnnjxXPyHDGYI2zK/23ZWRzocXUTeMa5BpNVvWxh3mz5SGanfVTnSjWzXy7
         Dzf1TVuMbS9ejdx1NcmWhLvhnzlmc08HMVy8cggVrwT6fVSadXmoXZtDrVgd83CtppU6
         kVR20714IdwHxUHXr6ctWC6oNF3Ogymm06w0QTvoHChzGGV6TkdfMHlZWIiDqpH/U9m/
         qiEFfCubK86HQzGPJz8SyI2RYzqEx8JvSiVbdKBRyAk5klShvgiHuJ+/wxNUXHfiHENz
         J5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        fh=ORX4HUDqeLvdSpj868exn2CRLpp9mHq+h4QMGaiNi5Y=;
        b=oUUxTfbn6uMrinIYsL3J8dM6jhYeOQCsohYKmfnqOkeZoQQ2/xOuDgCZ7vPuPQcqam
         IWftBfvTNSc8/ZgyadU2YG1sk0PH3FM0YRkXPzbMcPTly45Ez/YiVxejjPV9t2adPDKS
         oWQXS6mj4cyMx1J7uc9VlNsCu5ttXYlWlhxJIQdYbaFNqMwmlauQgtb44TkdV3sQzVWW
         YYgwZfIXG/BHGxVXa6H0Khv4ktEObb5A52ZZ9ILTGnQj7emkEnaEwETjIW/YkmrsJAD9
         NadsmdQjCTg6J8vEFDKFQsBYE6YMwzt8ou3M29ASex0er2h8A6JKa2/UqCaVZi9VPP8g
         KkjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809240; x=1793414040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        b=ZNWvplRjO+I1horpBlo8J9/L7pCEpW8hMtQMPU2a+8lZ7X5bNp9yChxqm96Bshw9Dg
         dkhaYKv3i9l7YjPCad/Jw6ERfjTUYxjj2YQqO9wxme4wu6YIRvXoZpdJQwdRuBuXDPp0
         9uEwpFDlzZvSs9XluYQZYAQz4+t+F8VROOpmmmPmYDe5ujIlriUsiCyQ2ihN1yaKKR32
         0knsUYy+dDxJdbiRNHxVg0IC1VCtOKkJWC1YulNBpanU4lgoESJHLOra/rAyZnDzQMJz
         YmCYdyLj6MIIGINi6YYvfiwtqm41sJjRz2BxfiIIsv1hVGFod6tJf6QmppsY8DZpm2C2
         jWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809240; x=1793414040;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOvydlCVwM5PXFqKpBEvvD6ro2jGwhMV+E2WExIceR0=;
        b=Kseu5bl+RUEJxlwY108P/u6cxNACAdrOYMQ8Yyn7WGbaXKvdlJxkCsxmmaqFlVI55+
         DEuaId/pxBP5/TC4oyLAdkj0wija7CAgZmUFFbCQJ7KQwJM/JpWJa2XKESXI87fRV0cT
         qxC80BCGKHx8x+Mm+BHyrJR0C/EHaXmRMgswAQ088WeGY+gaYfxlCfy/k0O2fd19n5cl
         uJSlTnrJ0NBrjwegeDtRyNa52FRF1L3jkp5CZjS6i07nd7gtic3hL/vanY37CiiEgjgS
         GMPm6165mL/9q1ouuKj8Ml3ERM+VG4oyfF2vtiNp2x6a1LaygxKeIhzs/j66s593oL1O
         JfzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjwNbFdrw1TPOQ4kOGPwpG54+auUrp/gUFY2KdFJaHBDOLHOMiNBfXi/J4Idee2zsb4Ou4kvvHE3ObGxo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZSfp60LN2MWYIgWe5Vf0WFOhbzm41ne5rVqpivNqMoLkNvRKw
	UDoxjbxpEjCqCE3hd4uDZnVxENhcakWn50xoBj2a4VOwjGMpmPypiwImDI05EHMeM2sXyZoC6Z0
	vinxLg/idN/oq+Nsmil+7d/XJ8NhsgQ==
X-Gm-Gg: AYBFou08nBF2wxrwN9SRw0nEvYCXDp3xgC+O4bMDWTXjWau1uKPvoxwtpm3dYxlSSWD
	ciu5e1MmW79A6+zb9MOJyJ5n7HOvNGYPi94vycKk9jKuAXFg3HTD7TfBpJwn8/vT9oMSx/Z8WkA
	Nso5Nn45rkOfVPRDdhU9+WXPs/cf8IVkIcZ4TyFjUXLISN73UqV9D/tlSCCSUEy4e1iXyYH4/jc
	mfiklOVevKzXJKMUrPsiE7mr3rXD+mod6jt5otPBFhH7ZzUXD5buskoK1jWAnEG7ZtocobChnIZ
	EtsEXng+0UTi6oOARKEP5D4Es3nYbvqgnUKRtNScFqUt3UBWXhe9oU3D7JThbsKxgodkriNVdrO
	Xm1CPgGAv7Tj6IMH6DSUyw+Pj3twiwzD77hL8SNtGRFsaxGZ0nIdZwfl6TKY5OBIGqIojPYmh0d
	ERVxk8Gs35DYZ+u4ZBPrVQ2vl5xXy/0Dttvv4othtP0gW2Eyx5KA==
X-Received: by 2002:a05:6402:2491:b0:6ac:934e:a9ca with SMTP id
 4fb4d7f45d1cf-6b4429ff463mr1127240a12.0.1792809239498; Fri, 23 Oct 2026
 19:33:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925191653.3144006-1-mhun512@gmail.com> <20261001175502.4045853-1-mhun512@gmail.com>
 <IUKxO70u7tuzfobwy7veeNHbvyK5WtlYFOliAToGsdPncgmwXfbd95-SoyBBUj0AUENfcYLnsh4qaFj4AEkeKA==@protonmail.internalid>
 <20261001175502.4045853-3-mhun512@gmail.com> <74c10fee-bfb1-4225-af5b-fc2b3ce664a9@kernel.org>
In-Reply-To: <74c10fee-bfb1-4225-af5b-fc2b3ce664a9@kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 23 Oct 2026 22:33:47 -0400
X-Gm-Features: AclHuK_Cs1i4iiemFtAKcWSfw5YUpemoD4SHO0r3M9ta6g3IG7c7Sepq9ogxnl8
Message-ID: <CAGEsz8GZ9QR=L9skNierVog8_=o-vBObqin=+dJZTDcpOa1TYA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: venus: disable recovery work before HFI teardown
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bryan,

Thanks for the review.

In v5, I removed the disable_delayed_work_sync() call from
venus_hfi_destroy() and kept it only at the start of venus_remove().
The work is now disabled exactly once during removal.

Thanks,
Myeonghun

2026=EB=85=84 10=EC=9B=94 1=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 4:10, B=
ryan O'Donoghue <bod@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
> On 01/10/2026 18:55, Myeonghun Pak wrote:
> > venus_remove() cancels core->work before the IRQ is disabled. An IRQ
> > thread can queue the work again after cancellation. The work can then
> > access HFI state after venus_hfi_destroy() frees it. The work also
> > requeues itself when recovery fails, so cancelling an already running
> > instance alone does not close the race.
> >
> > Disable and drain the work at the start of remove, before other resourc=
es
> > are dismantled. Do the same in venus_hfi_destroy() for paths that bypas=
s
> > remove, including probe unwind. Disabling the work prevents both IRQ
> > handlers and the work itself from requeuing it. Drain the work before
> > disabling the IRQ so an active recovery can finish any IRQ based
> > completion waits. Then synchronize the IRQ before freeing HFI state.
> >
> > Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper=
 functions")
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kern=
el.org/
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >   drivers/media/platform/qcom/venus/core.c      | 2 +-
> >   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/p=
latform/qcom/venus/core.c
> > index 7087af32060f..6e495bc04691 100644
> > --- a/drivers/media/platform/qcom/venus/core.c
> > +++ b/drivers/media/platform/qcom/venus/core.c
> > @@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pd=
ev)
> >       struct device *dev =3D core->dev;
> >       int ret;
> >
> > -     cancel_delayed_work_sync(&core->work);
> > +     disable_delayed_work_sync(&core->work);
> >       ret =3D pm_runtime_get_sync(dev);
> >       WARN_ON(ret < 0);
> >
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/me=
dia/platform/qcom/venus/hfi_venus.c
> > index e7e4e78a186a..20b8ba1e62f1 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
> >   {
> >       struct venus_hfi_device *hdev =3D to_hfi_priv(core);
> >
> > +     disable_delayed_work_sync(&core->work);
> >       disable_irq(core->irq);
> >       core->priv =3D NULL;
> >       venus_interface_queues_release(hdev);
> > --
> > 2.53.0
> >
>
> You shouldn't have to disable the work queue twice.
>
> Does a path actually exist where hfi_destroy() runs but venus_remove()
> does not ?
>
> The commit text is vague about that - sure hfi_destroy() may be callable
> from the error path of probe() but is any work scheduled in that case ?
>
> I mean lets just look at venus_hfi_destroy()
>
>
> static void venus_remove(struct platform_device *pdev)
> {
>          struct venus_core *core =3D platform_get_drvdata(pdev);
>          const struct venus_pm_ops *pm_ops =3D core->pm_ops;
>          struct device *dev =3D core->dev;
>          int ret;
>
>          cancel_delayed_work_sync(&core->work);
>          ret =3D pm_runtime_get_sync(dev);
>          WARN_ON(ret < 0);
>
>          ret =3D hfi_core_deinit(core, true);
>          WARN_ON(ret);
>
>          venus_shutdown(core);
>          of_platform_depopulate(dev);
>
>          venus_firmware_deinit(core);
>
>          venus_remove_dynamic_nodes(core);
>
>          pm_runtime_put_sync(dev);
>          pm_runtime_disable(dev);
>
>          if (pm_ops->core_put)
>                  pm_ops->core_put(core);
>
>          v4l2_device_unregister(&core->v4l2_dev);
>
>          hfi_destroy(core);
>
>          mutex_destroy(&core->pm_lock);
>          mutex_destroy(&core->lock);
>          venus_dbgfs_deinit(core);
> }
>
> Your patch will call disable_delayed_work_sync() twice on this path once
> in venus_remove() per your patch and then again in hfi_destroy()...
>
> NAK - can't be right.
>
> ---
> bod
