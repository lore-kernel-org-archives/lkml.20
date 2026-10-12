Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F6048EC82
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817319; cv=pass; b=ieMqYKUurplP+cRBHGXT/6vR3fVuhAwvw7NFvqsvnFQO3A/zk141xv11UQw7sGA7rZNjBSBWvaPugEiVxiRVX1H+U3nEPCe6GWfRAk0KadKqhK0z/dePhOWHSaajOdpe0lEt4bfGXdPo2y8QVWhKCi9wLXtprmz5frXIy95TrWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817319; c=relaxed/simple;
	bh=cOwreW6S5TABEHJlwZlMIIHSrtzIZn+nQff2XWEoojc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRevYt1SWNf1IoSUbxa7sGHO7sSIGASuNhRx/ZerkKFRs+CAjJSbKnLuRhgit0KbkCSAKM0obab5ioWbPbuhpyzpLtBzPMFKzDVHgfFdE0xqGC4juvYAnqrngdHif9Mq3EDI+Lm5bTQXib1esolUrLTd0XNrb5qW9aBcB6c9V6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuFZLJC1; arc=pass smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuFZLJC1"
Received: by mail-yx2-f1.google.com with SMTP id 956f58d0204a3-6792fa2ca24so793973d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817317; cv=none;
        d=google.com; s=arc-20260327;
        b=rahC2QTUOJGMkxIn1kVCYXrkMC1JwQiHryVzI0eCOO+d7eoUsYHyOwbC4kR6l9cIGR
         jFO93VaV6VjvyLZYPJzDpB9/aD6QhJYJxKoqeLnVkh9Fz0RV66Od0YxzNpwD/bY0eBp0
         MeitSLGB+HbXnfOegbEmN1SOqI3wocZ34SYgqzY0pIKjgvBx7dQl/VAJmDAF82nbyMyD
         u3j4ihi8Vf3K8qeGXU7k75UnD/mCqCvg73pILUevlQorCtZm4MNkrwa8EUEzKPetwxRj
         fUF4yQwpchEprGnPrXvLLmQJEkUns1a4BcPdQw/VmZdMle7YPxv9ChIwJeYv3QFzQfEv
         qkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KIAMYnoVUBdUzXVqQqDP3VFDzLpC4xBDzQAPsFXbvk4=;
        fh=bHjz1j2gSxkB7RqoUHB6TpQ0Dv2IkkDkkRS9jkctYEk=;
        b=L5oUktCqIm0nDFFWOBkh8e8wBPmc9aBICFu9ccKkmary+sM2PjPj28YtYK749rmIkT
         KeAbibgTwJafu02EZWhwY4rs+1WjX0m06vhh2jdUH2thS6/hvm1bkVpxahaX2j6KNuV6
         oc9opt7t9wIyyRl14cTnRDPvB3eMPtQE1dsISlqqGHMBajAZQrA8plZ27GLwueI+Oxjo
         hTiyOOHoGAchBgp/HJCL2dS9raabuUoq2fzmIrllHhPvsx9YMzBL0oBXYbsQeqDWL6yZ
         qZA4VR8DuVh+B4VT2wrcwx24VwUuZJlCWbIVCkTwxRdRCLArf8nLwiUtiUBznI33fGFo
         mggA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817317; x=1792422117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIAMYnoVUBdUzXVqQqDP3VFDzLpC4xBDzQAPsFXbvk4=;
        b=iuFZLJC1n2zDBGrbnsAjhS9nMpI5G4uIyjFF0sdpnfaCs9CaPfqzTaqM/6SqDxbJ7z
         VHvCa4nQCALItIJ7NhIUmdfKwdsVOMezH4OLgp8FMg290SMe1CxKrhTh2Pc3Rl6FInDE
         BAqyp2uoxF4jojWK6c0JK6YbtfLEMoliCff4DhwPvt+GTggIYfZRWfuSh7s38zDgeJne
         VebJdofkYVMBsyXSzbcVzeZ0f5OdXSGYHKuGGngWB5lUK/tlNA7UjSRsulqECZMYJ89S
         UX9a/4Qkrc/dNMcTKFBv65GKC6zZujtLnpEhMfYR0BwwE9+EP/SsF8y4jRRu6PImrAMV
         gLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817317; x=1792422117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIAMYnoVUBdUzXVqQqDP3VFDzLpC4xBDzQAPsFXbvk4=;
        b=Sr5V8rtUGBWM9vBLm5/AHOg+43Z4+sLd7p8M9wGH3B4Gy7SmNhUToIgVszNx54bQKz
         TIQonrnZxwMWexkWyMXfnZQvO4rO0FcyL5MIGf7r3JajOQSkMtdtZJlRCZh/g4McpB12
         qzNFVI8LrjUG6kYSNRgWRoQoi/+mVhzzh/k5LEcDS03MXz4ih5/7LpUrbf/dS3cwkG73
         j+mHEYq8v6L13HDiyKeNU3PKuZSDsgb/Tf+IoV7ifaFP4a/ssXhPmNUnS0/wN7iHUagM
         RLC1Fy48OaK3zJ8WiaW3BXgtdKmCeXr55TAfXjczBroOBE2ZdX9SUlts1j+Kvn/ChGfY
         ZRAg==
X-Gm-Message-State: AFq9FYLA6cT4iPj0ef4lwpNORtuWEyZc6xgIX/n/4IDoDXr5g2bVp3Hz
	ur5qNkcIw2FGeAb9CA3ANhJt2Ju96PGH5l8N4ZSPaCTWc9fmclOXMVc9Tyx/4q1uR79uw353+ba
	72ARx/Fp6jevx/qo628r1Y3Sk5M7gPJw=
X-Gm-Gg: AYBFou0JKBnaeX/OPOLsCrdLCsKfVsIgm8w65JKoPsrTSO7diSJqZ2ZUBKHbRWcoeHe
	i84RkbcxPsyMHQ3JHr0LmP0UeiHZ968QfYDVBnpn0uLNt66b7mvu35QFDgOBNKDIViJAFI+Byd2
	f9LVt1ma/8WxMwa6pHwEjT6TwHusx2xzwDFGoWcW5WXBK/1YEGrgjbbn8Ss3o0URF2CsMPBSnXT
	2kEMR3x2jkzPLu4GcsRc5hsaAFFCmy0t9epe/k2OlQYpuj5D2XHoSjBVi1l9NFArNT/sNZ58y8e
	IqAw+/WKIS2h0oPRTaZGFcK6XpCb2cX3VSAbzEE5PqqJE/bAhJ66Fw==
X-Received: by 2002:a05:690e:169f:b0:677:ab1e:92a8 with SMTP id
 956f58d0204a3-679369840e4mr3810866d50.28.1791817317057; Mon, 12 Oct 2026
 08:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011132017.31131-1-jianyungao89@gmail.com> <20261012152830.5406d532@jic23-hlaptop>
In-Reply-To: <20261012152830.5406d532@jic23-hlaptop>
From: Jianyun Gao <jianyungao89@gmail.com>
Date: Mon, 12 Oct 2026 23:01:45 +0800
X-Gm-Features: AclHuK8D_Mlx_jmV0S7_mwmzxgLO6vaiUUSAFEJ32lGeOuz-LFaYscxAPVUV5CY
Message-ID: <CAHP3+4CC1DFcUNrWDG7Xg0yi26zQb5DNEp8BLgVyh-Vo5yUHjg@mail.gmail.com>
Subject: Re: [PATCH] dax: fix dax_core_init error return code
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-kernel@vger.kernel.org, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <nvdimm@lists.linux.dev>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <linux-cxl@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Thank you for the review!

For the goto err_fs change, I agree it's unnecessary since there's
nothing to clean up at that point. I will drop it in v2.

For the return 0 -> return rc change, I also can't think of a reason
to deliberately swallow the error. I'll keep this change and cc the
DAX maintainers for their input.

Best regards,
Jianyun

On Mon, Oct 12, 2026 at 10:28=E2=80=AFPM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Sun, 11 Oct 2026 21:20:17 +0800
> jianyungao89@gmail.com wrote:
>
> > From: Jianyun Gao <jianyungao89@gmail.com>
> >
> > dax_core_init() mistakenly returns 0 on error paths. Change the
> > error return to use rc so the actual error code is propagated
> > to the caller.
>
> What is the user visible impact of this failing?
>
> >
> > Fixes: 9567da0b408a ("device-dax: Introduce bus + driver model")
> > Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
> > ---
> >  drivers/dax/super.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> > index 45f84b0eb909..0f35f65363ee 100644
> > --- a/drivers/dax/super.c
> > +++ b/drivers/dax/super.c
> > @@ -723,7 +723,7 @@ static int __init dax_core_init(void)
> >
> >       rc =3D dax_fs_init();
> >       if (rc)
> > -             return rc;
> > +             goto err_fs;
> I don't see an advantage in this bit.  It is a fairly common preference
> to error out directly where there is nothing to do.
>
> >
> >       rc =3D alloc_chrdev_region(&dax_devt, 0, MINORMASK+1, "dax");
> >       if (rc)
> > @@ -738,7 +738,8 @@ static int __init dax_core_init(void)
> >       unregister_chrdev_region(dax_devt, MINORMASK+1);
> >  err_chrdev:
> >       dax_fs_exit();
> > -     return 0;
> > +err_fs:
> > +     return rc;
> I'm not sure about this one.  Will need input from the DAX
> folk on whether they were deliberately eating the error return
> here. Not that I can immediately think of a reason to do so!
>
> Jonathan
>
>
> >  }
> >
> >  static void __exit dax_core_exit(void)
>
