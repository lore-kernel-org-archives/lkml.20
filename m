Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F503624CC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787773; cv=pass; b=tmzn6MbZYOnxp5mZJzX2fEyFtVTP+VsZlHbDDwNDKNgZ0+jaIo6soQw9okZoURbRCWJN2GuNQBpBAZIqIhVmIaNYVmocBoeF90RCepBICGr9vMwQJ3hGepSvFP8lZ9uecE+yujIqQ6Y5whEh9Em6wrI2df0AoQ1qDW/pLNW6O2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787773; c=relaxed/simple;
	bh=TfIyohKk0XTeZ5qcNnxmX+B3sZQEP4z3RtyF50kq1r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aa3r5gaTxbZC8jGQR8weKoKzOYNSmlTc+CbU6Mc/n0JpBqrwS941C2BRXZxzopJWb8Cc+JVE+j8ZGn0LMxphZBfYW/eN+Dc3xvfZ0JOOu9MVwRn+UErkeGJMRy/D2dk4pJd9ULPlNQ/2MUdRvMIqHp/KUn4HHmUY1J7NF6WxHug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP8yGhNu; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP8yGhNu"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8917c712f32so623276b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791787772; cv=none;
        d=google.com; s=arc-20260327;
        b=Q1rxFWrHk9r7KpGknw17MIiJHBIHDC4UPpl5/lyoRWkUt5qW1bu6LIwmzhzzNgBvli
         ubzNdlQ1lNri8cuSAc9+2gqefgRTHBOR/pyjN34Q+PsKYl40ttAlYGvgp0tiAlp0T671
         XRTR/lZudlKh0f4bostuVIpqgwbzOUbb1jfnPff2Ma1mx0f3kLkd8ixqvwHAgMPB1KE/
         jeEX2UXqIaxL2s7hWvofCnXMWotYmpGrWhpl8FACCj8PeYafxoykPq0QtVlVOBkPFetd
         eu7RQbNx7wQUP3cV1y1qnmow7XOgala1ebJ5kwGgG2dE3NC5u5mOahbfe/L2s8isqakD
         jfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pKGaBssfbVs591S2Q3WkY0U64OVMmVV2L/7skJ0jnBg=;
        fh=lNL5OTzuyz85uZsWsjh92uk2SafGp8Q4Nw5n/B6pHxI=;
        b=CGJhe08KakBGHR3SvMu8sT+X5M+F1FPXDeHVcnHB+a4o1BKdSICw7qRRke4NIFRV9A
         GXjN/ZuKrx13Z6es8NzrwNeBgqD48S4DmT+VS4unxlSfmGBsmQXxtHp7U8py/93pVr+a
         uhFTQ1rljMAi+krmGsOHFbzCjFiUXscxdlw3yJlOTFKDw4AVw+s0XoNPchihvhojMyOF
         EHCMtA3i4Ti8BbZvHRZfmCQ+7pYS3qyeQczciN2l5IYpC22Sz7LEO2pOUdNFdTVLqEQE
         wCATOLrs+cyRnnv0oPNV0m+Xbn4RPqmt9Nlca5Y9CAl4obzuc5himHBQjaRja4hdDhOK
         ciDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787772; x=1792392572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKGaBssfbVs591S2Q3WkY0U64OVMmVV2L/7skJ0jnBg=;
        b=ZP8yGhNuKZgCgauojKN/FqY1DZ2H2/Hyy4JHI2cD9dh409WltYUZqq7J+hvCLer2/e
         7aifVbOx6xC4MXWW9q3XlIQLG2Gi8lqsA4M2vxwNQB10nVTF+APRZHs6SkervA1IFMOb
         KG1bzU7Er+I4w7ds5TLWQcyLeVDOMa1BpGagzBHHnPWtdrP0cr32k3j8UyFN3sEUI/ww
         UsyF1t+huPxlwe99q4kW0RXAXh+AF6MGmizFQbo8gFE1b20evuJ5dXpedPFs8LNm7K6k
         Ly46ZCQTNdbnH8/8grQEsl+mkaCx1iUb+4ATqzTx6K4u+6PhvXlyB6W2Tm4BQlSyCoNP
         lU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787772; x=1792392572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKGaBssfbVs591S2Q3WkY0U64OVMmVV2L/7skJ0jnBg=;
        b=eRfj+WQ2yDvBWiWUOnES+cWHZKq2pRGGpdAmIhe4QbmD3B3n897v7z1dF25Ki1fLhM
         MmTcVCeAP/lhHe2hGg35p6WIRExblyykmsA9KeF/tOPEQxrnZxDIQmeSmwzqae9exggQ
         4ooihmd4T7Doo/iyFbkycOrUKmGxK/mZKAz01pywlMxnAm2YdOEsI1/hMTlyjWJEw2jj
         HFUN+SQlOWTtQSnySFcRB3JQkD8X+zFcnlWciNBKWrvUJ+rlG+GSj9mUREL988rMBcTa
         kPK0XeU+7Uc7BUp7I6AOTgZeyNbaNt08wctpwb5ODZEq+/6e0YwZiPAevAV2MdVfYHZg
         JVSA==
X-Forwarded-Encrypted: i=1; AKwUvBw4Q+SzLg7UIAi7t5gPIZVVkXMrL6gGNbOApofNGTCPtIK99wjEiMP9I6FyeHH3nMSBX0KOWeW8HZ8rVWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLemWAsHQ713NKAye5zTzUzXzj2vTs61rLni7tsoVbQu/sDuD5w
	zy046MHg4qBSxAcDyPCTTpSWeuzUmNX34/KFzp6oZDQ9a53czLiJoks0EDpSKy/wyfiJGSRYM17
	gegDTF8nwycva5XqVzbO3EeCcfnIWq/w=
X-Gm-Gg: AYBFou0hzHNN0T3QMuWmY45U4vAvNb/pC9zr11seA46u4SIblWOXnEZO1oM6xgEx23t
	EF0irYgdwv/YXGKuIj2y+Ba2dc6W0lcdrrH8pTRwtz3nRChJEu3XwM47ZLydD2GTA9v4ROKXh8m
	5n2ZCqtWMP3wHmvATd+GK71m0ebjTwUtpnTnVF/EjeODawaKleACYNB75cyMF9gjVH+SAW5VMRM
	Zv7jzcCaNaUxuPvp3gChrNzhCgkNeAfir6aUYHaPzUXFoUaWb0DuAeCV+KFOADtVUxbL6z6tWrN
	drCudWCzgL5v1bglj6ATmW4qbgIe1F8NnZpdcHGrUhH02gjfton90ko=
X-Received: by 2002:a05:6a20:a105:b0:3e0:b937:8849 with SMTP id
 adf61e73a8af0-3e16bed4c88mr7053863637.29.1791787771794; Sun, 11 Oct 2026
 23:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010084058.2365291-1-shengjiu.wang@oss.nxp.com> <asqIvOi1iQrIkB3w@analog.com>
In-Reply-To: <asqIvOi1iQrIkB3w@analog.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 12 Oct 2026 14:49:03 +0800
X-Gm-Features: AclHuK9V3VZ2fy03Q21gRqiwbgRzcbFZbOC6EE29a2VUKpjHaSklyWXtD_neAC8
Message-ID: <CAA+D8APebaDpME+025EUnyAtLrAC=h9WSMwpWtFX-TdooLTdiw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak4458: Check reset status after deassert
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alvin, Philipp Zabel

On Sun, Oct 11, 2026 at 3:05=E2=80=AFAM Alvin =C5=A0ipraga <alvin.sipraga@a=
nalog.com> wrote:
>
> On Sat, Oct 10, 2026 at 04:40:58PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The reset line of the ak4458 can be shared, for example when two ak4458
> > devices use the same reset GPIO. In that case the two codecs may call
> > reset_control_deassert() concurrently from their runtime resume paths.
> >
> > Only the first caller performs the actual hardware deassert, which may
> > sleep (for example a GPIO-expander based reset controller). A second
> > caller merely increments the shared deassert count and returns
> > immediately, so it can continue while the first caller's .deassert() ha=
s
> > not finished releasing the line yet, leaving the device still in reset.
>
> This seems like something that should be fixed in the reset controller
> framework. In fact the issue you describe seems to contradict the
> documentation of reset_control_deassert():
>
> /**
>  * reset_control_deassert - deasserts the reset line
>  * @rstc: reset controller
>  *
>  * After calling this function, the reset is guaranteed to be deasserted.
>
> ^ (1) seems not to be the case as you have found

Agreed. Looking at the documentation again, the guarantee

* After calling this function, the reset is guaranteed to be deasserted.

does not hold for a shared reset control today, so the issue is really in
the reset core. For a shared reset only the first caller runs the
hardware operation; later callers just bump the refcount and return
immediately, e.g. in reset_control_deassert():

if (atomic_inc_return(&rstc->deassert_count) !=3D 1)
return 0;

So when two consumers of the same shared reset (here two ak4458 sharing
one reset GPIO) call concurrently, the second caller can return before
the first caller's .deassert() - which may sleep, e.g. a GPIO-expander
based controller - has actually released the line. assert() and reset()
have the same pattern.

Rather than work around it in the codec, I'd like to propose a reset-core
fix for your review. The idea is to take the existing per-control
rstc->lock across the shared refcount update and the hardware
.assert()/.deassert()/.reset(), so a second concurrent caller waits for
the first caller's hardware operation to complete. The lock is taken
before the SRCU section, matching reset_control_acquire(), and these
paths do not take rcdev->lock, so no new lock ordering is introduced:

if (reset_control_is_array(rstc))
return reset_control_array_deassert(rstc_to_array(rstc));

guard(mutex)(&rstc->lock);
guard(srcu)(&rstc->srcu);
...

Does this approach look reasonable to you? If so I will send it as a
proper patch and drop the ASoC: ak4458 change.

>
>  * Consumers must not use reset_control_reset on shared reset lines when
>  * reset_control_(de)assert has been used.
>
> ^ (2) isn't this rule also being broken in the suspend/resume path of
>       this driver?

I don't think so: the ak4458 suspend/resume path only uses
reset_control_assert()/reset_control_deassert(); it never calls
reset_control_reset(), so this rule isn't violated here. Please let me
know if you had a different concern in mind.

Best regards
Shengjiu Wang
>
>  *
>  * If rstc is NULL it is an optional reset and the function will just
>  * return 0.
>  */
> int reset_control_deassert(struct reset_control *rstc)
> ...
>
>
> (1) being fixed in the framework would solve your problem.
>
> But (2) seems a bit more intractable. Shared reset GPIOs have always
> been a pain... I wonder if there is a better approach?
>
> Kind regards,
> Alvin
>
