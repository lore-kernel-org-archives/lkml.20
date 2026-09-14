Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC1390205
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412577; cv=pass; b=QiRP2I6ajlEH9NcebnAPPP5wqB6n2XIYAEzWOODxRDcF3+G9dldva3eYJKe4+KqICFYFk6pVuV4QQwShVMmD/dB2omcyQ4kFciKfwVk3JgL9b+YrFOHy+1ADfLLzePI6cL6UwqAr0efyy8Q5Fljpar+PYW7QeinX40/T1jdDqHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412577; c=relaxed/simple;
	bh=Pk8ifrY2jMwV1DujJO6R2GyjaiFkRloGcZw5szvKzGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ua/6mrKX8uAHdFx1/rqWX38YrkhbrnNwqZ/+Y7SsPlYUYk7TXF/e5EGySx3KexIgFwb86qNqFjsKbuC1/NnwqfQ81UXC6WNIpHyIpZJhNiyl41fn/AG5wSuBtdWgNlEYPqB0vgV5rvFMa1ksjG83OBCG76P8CS6J1lg/z43/+PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pELO1q9T; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pELO1q9T"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de0093c42so3464463f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412571; cv=none;
        d=google.com; s=arc-20260327;
        b=m85KvseYyF0NSianoNuxWrWMODQ7kjKN9R22FqT9vL8VIwng4bTKt7d2WW1jS0ITk7
         CB7VdXqT3WWC1Dw8m7GGbvdV0XI+RLvr0n22Kqgu6BcWZ/xDfN2aMmKScI/WnSZ0Bprt
         92K0ZsY8RXhG2wXr8MEHydJ/GppwYL8Fi9BczQ6txBvTToAd4TahaJpmGi2BgSYzvFBN
         k7FDex5TyelYSjghl+mCcR6VJkkviYHFNW427ltcpLhCycmqFeso8/VlO82WJ3Wt+GCY
         UziRpQMZNRJV7okt1mM7raFd1qtiPisTzVV06gOLaKNAWlD3dJL93QN9ZvCvhMUP4oIE
         CmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zetP5fNnd4Ik74pn4yYhqWStmsT+30ISyz9oe8Z/6rA=;
        fh=sPOHh1Ei+IpV9CNqGDY9lMCRe9mcZkkKFEp33JE+jWU=;
        b=ewRwRzInmt7R6eaOnDxpOCUTq143vNA7SgHi+kp5/HoA7F8/UZNtzcks1RX9/Re87L
         7CINFZPtBRQVfFhdKAcrf702UyQ6ihS3iK8vJY2nZDgmRapbNRV0o0XWnq1DhR54ssb7
         urNuW/qzIYiG0FINcEEYNJfhAZOGzcBzRiuvMrX5SpIhxm75MDvS4HFdWxtLWbnZjeQZ
         ZbLY3/q21522qWEmMygNkCbl6aRnTqBtxCwN3SsGyNXTC0kE8vYdUKu8mO1vmmFI1T4P
         pm7Q9MnC2TNsJtyeK1qgTKAJNQKvZl/BRSl8dsXD2Hhy+OOwouqBdZmVnh7S0PreFxMK
         oiBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789412571; x=1790017371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zetP5fNnd4Ik74pn4yYhqWStmsT+30ISyz9oe8Z/6rA=;
        b=pELO1q9TXIm+XKLHGZuEb5grsGXOqUezLfy/S6Ei39hAwzno8AY1rjbF76FjA4c4cw
         v/sh604ZH9URiQ4g/EfygtgiaD6ubbLXfpNzWCSkT4EFqQLHWnIuZD+5w13348iGUUG7
         80rvRHNSRUbJfR+dOAVJGgdmKGmDru2GV/Kl0vjt8GB0kVjK+StKMppbpq6C/Ye6dl4Q
         oYGphTi0bSfEN/BC52muSyJJuIsJLH8Cq2Vv0MFUXf5t9JKj+N7NDDg5sZCsdd4Zzfus
         bpxCpSQvMo7T9L/7ZioiXxCgDvtA5UfnwoGNOYfQwh1RD5AUHJyjsQ29eoj70c5mpx4l
         HRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789412571; x=1790017371;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zetP5fNnd4Ik74pn4yYhqWStmsT+30ISyz9oe8Z/6rA=;
        b=kg3eU49sqFoKQQlVqohJDgtSbS6lg3Im1QqOGOWNu3/1U4dlHjh0TH4Ot/WRwE4Xjq
         R+EZ7cgPMvHn8YLFiGKBriESyc5V/ZXz+e0qQT7qZ8+/4dozxB4oWJr6Q7DQ1yQ//qSE
         h29rf+5qIdJh0FYh3Rhqu+pPqfD2A61L4T8LJYuhyd4+fUccdWS73wbLmByCbdtOWNGN
         p7fUBuWG7lxuoM97HZG3q/CuKyqHC+Dp2BY5EpEv7gjaZbn+yQQBKYHyC5JL7gIVMD5P
         866eeAdi7tU4LrkSfdIcmweUs9PVdVyAHXsP3gEf0ee5MaaNYMExn5Di/BJ/zRnJVj2s
         AABg==
X-Forwarded-Encrypted: i=1; AKwUvByplJ6cF0DCBX3hSoXDvbFTvoL/4RVgc6p6k/o0U4rtbT4P+CbsBWtkW6q/FEuXzshtmZCA4F83gtVveRY=@vger.kernel.org
X-Gm-Message-State: AFuF++lqNs8TP02WJFXGUp1kWADCkTzNrZSuvIVmqHYQqiKZsUdBPib+
	NVGvuJXSKk2/bFSyjT0sTQ4VPjv3eBkwD8kMC889NoG3Zwz3iOtIVmhRnfGEaasumYtf1lsIAIh
	PX9pSYBceNm79yZl+Yrwoy9DNqM7ugziFMyFl
X-Gm-Gg: AYBFou3ImW+3jiFeCxXTIaJMWt90SPuzDSYBY86rYes5cuaYWWZbjvutk4BvKwYr/S5
	4sFlc5djETkw5uxli9JSeL+avHezZk8/PuH6umBePiKArp4lWs+wDMbbrTwbr4SaE5KtB0VOOpO
	ulami0mpJSNkdyQxsxJ9VkEUC7ryXC0PD9y3LcSSicEVu3N4rYtJoEheiQv1Q3wfKlSCGrVK4T+
	nTcEIX09NCHDUDAUuFByqA/0XS2CROcuQsAXHWarFh0rBO4wUPTZ7M5Hu+32AhTg3CRVN1FwULQ
	7PmPTDOyQ7h3c5yOUIGDRrngUIsBMejPMVh5NNDRxZkBU1H3p1u4u7PKrBN6nMVQa2ZIn+y44zJ
	MfmUBgHH9nFjNSVQX/SgjlooKybqPDYntthgTEz3nu1UVb+ZccJVJlGyiSt7WLTBnPwtqU4+OMR
	jS2nZhcQA4ioZGUMyJl0Hag/7Cna8/na+KwNtGriDX6uSuzldXVG6Nhlmdjo3YG7WYpnkjTdcKp
	3FXcWlXoiuKwy5zhVpy3Q5lhUqVVwFtsy9iknKeEvzXsl5iTemcbITLjw==
X-Received: by 2002:a05:6000:985:b0:487:1fa:17f1 with SMTP id
 ffacd0b85a97d-48702ac0dfdmr4594588f8f.16.1789412570476; Mon, 14 Sep 2026
 12:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914151145.1328-1-joshua.crofts1@gmail.com> <c737384a-aad6-8ebd-a633-4ab354991c28@inria.fr>
In-Reply-To: <c737384a-aad6-8ebd-a633-4ab354991c28@inria.fr>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 14 Sep 2026 21:02:37 +0200
X-Gm-Features: AcwNN1W8r7b_khgD2SdSD1YPse46l-NBkfyyMg2BuWraYp_tGjRdaVQ10OIEkCU
Message-ID: <CALoEA-zGPk5sHhzhKRVE3uvFotyMTPRtkf-rCAgU2cosfe3w=Q@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: api: add a checker for pm_runtime_use_autosuspend()
 usage
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 17:17, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Mon, 14 Sep 2026, Joshua Crofts wrote:
>
> > Add a checker for ensuring that pm_runtime_dont_use_autosuspend() is
> > called in a file if pm_runtime_use_autosuspend() is called and its
> > devm_* counterpart isn't present.
> >
> > Without _dont_use_autosuspend(), removing devices causes resource leaks.
> >
> > Assisted-by: LLM
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> > ---
> >  scripts/coccinelle/api/pm_autosuspend.cocci | 62 +++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 scripts/coccinelle/api/pm_autosuspend.cocci
> >
> > diff --git a/scripts/coccinelle/api/pm_autosuspend.cocci b/scripts/coccinelle/api/pm_autosuspend.cocci
> > new file mode 100644
> > index 000000000000..2354396d9344
> > --- /dev/null
> > +++ b/scripts/coccinelle/api/pm_autosuspend.cocci
> > @@ -0,0 +1,62 @@
> > +//SPDX-License-Identifier: GPL-2.0-only
> > +//
> > +// Confidence: High
> > +// Copyright: (C) 2026 Joshua Crofts
> > +// URL: https://coccinelle.gitlabpages.inria.fr/website
> > +// Options: --no-includes
> > +
> > +virtual context
> > +virtual org
> > +virtual report
> > +
> > +//----------------------------------------------------------
> > +// Detection
> > +//----------------------------------------------------------
> > +
> > +@has_use@
> > +expression dev;
> > +position p;
> > +@@
> > +
> > +pm_runtime_use_autosuspend@p(dev);
> > +
> > +@has_dont@
> > +expression dev;
> > +@@
> > +
> > +pm_runtime_dont_use_autosuspend(dev)
> > +
> > +@has_devm@
> > +expression dev;
> > +@@
> > +
> > +devm_pm_runtime_enable(dev)
> > +
> > +//----------------------------------------------------------
> > +// Context mode
> > +//----------------------------------------------------------
> > +
> > +@depends on context && has_use && !has_dont && !has_devm@
> > +expression dev;
> > +position has_use.p;
> > +@@
> > +
> > +* pm_runtime_use_autosuspend@p(dev)
>
> I don't think you need the position variable here.
>
>
> > +
> > +//----------------------------------------------------------
> > +// Org and report mode
> > +//----------------------------------------------------------
> > +
> > +@script:python depends on org && has_use && !has_dont && !has_devm@
>
> In this rule and the next one, you don't need to depend on has_use.  That
> happens already due to the inheritance of the metavariable.
>

Thanks for the review. This is my first time writing a semantic patch,
so it's a bit
rough. Additionally, I just noticed I sent the wrong version...

--
Kind regards,
Joshua Crofts
