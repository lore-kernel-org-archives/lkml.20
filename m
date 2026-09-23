Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A057C729
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194455; cv=pass; b=q9Q5qSo7HgrEPUIG9mVze0n6HWsnWB/lAqRFWM6zIpy5rGBePNpKpYjg6Lbg8puXCgxOckzxl4GXbtzl9Fv01R283GfC0Fa/SgFJDjoQhFw7TJUjbNvSiSNL1ltJ8+iRuKzW8Sdf2DsdlTyU1kHlaG8UmfScPYs2uBK+l47llWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194455; c=relaxed/simple;
	bh=qOYwtCPr1PxjrvDGfh2AOArCnIzBjh0iMMKj+uLMXjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRPVXOdJ1EPjhUpgAacyMstCY1Fa9/seSxUfKkG8BlTKGY3vUfZJEFcKalG/gExSg6QdyIADGmCphvSfv74ez4zYGOaRakCmyE48HAE9ohA0NCj/afbGPIftTUAMqe5/w/8wVLSXwaJpEkjlzQbk+AxNw/BzS2U7TaDkKGnv1Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=saSnNjWQ; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="saSnNjWQ"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-785643199baso515318137.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194440; cv=none;
        d=google.com; s=arc-20260327;
        b=sPb3eOnBrODDB7vmdz/6/7+AvNQbNr/d1ONCu3FWhLWPFFQkqS+IaLHddj6mUSo7Qy
         8EajUQ84LZ2P80T9c2FW36lUOpwL8tcyYmBKtWXOM/FEn3aovXHiA6d4DiE9YkFGL5tA
         hZDmFJxj+9wkzst7VDqNWlMFu398OgSf0mnjKjkYciT4p4JbsQ0xhUG4XYm4/0ubXgvB
         qrpDw6kecq3YZnXTvq/mJJoTl0GiWhGT/Z5gIao9xfW8d88rLE1RuuSAYVvP8gBlBY6G
         Yuy8zRzUohce7L0DqS5qmIW+WoIGkp5Maergkps00TjjYgKtCouNA12qpifKLCfqGizP
         SVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        fh=LVOiS1Q2KY+mLWsgv+sk/8kDQ3tg3ICLLQbrE/bjzpU=;
        b=R4XlVwcLb64dSEzBoESCii+3a6FiXllKgoqd5sAatbLgXJ2o2xSGUjxIQDi7N48hM0
         CocAVOGWK7muu0wFCOQq0+0W7Hu2+2ftqn2NAa6LlT2R2UGWhybuOLbT8qi2CGM3klga
         ygzxifzUI4Kx+wP/BA78KXpbsTcU9aQmJz9Oo4YPlAUnnR08zsyV6Rvw+iDtmjrykhaq
         Ogew8s5P9pGRO1KK7ayT5umEijWIcJBozag62nB2kv1M+6cE4JDxwOcemL13d1TPmEJF
         SeZW/tq7k4gzvZdWIGSrhGr4keIPhyXHIH5XzmfGBhK2kEdXqNBT+amF0ob3+Wn4uvhH
         9kXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194440; x=1790799240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=saSnNjWQniJW2lT8LE9/W3Df2C1igopjCUZcnweu2hnNSFCjmSo9YjkPxILgLV9Vw2
         +c3F87QwQBrPQ/p5wq6bo5IkasgYRye/lmGoz+bosXL4ZqsgZtX2Yotbti4RgXMr6nMK
         WNt/AR5Wi46NelCfGZAvxniaWKCFDY8QvmnV8LgQtj79RL+oZZ2llbjMd17u1xvWBKDj
         Kwr7G/bT5qF07iofvMg2Vw9b6Tj37U7ybl78FyreZDOoAwI7n7MGXoC8+P5TgCwnE8WQ
         vlifTAoJCHCxO02zvxPRk4Oc6Zn6U46nGpWFJK5/0iLJPjuM1s/ou87hsMxVTZ/fybvK
         IG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194440; x=1790799240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYhzfOA6SCO7uTNbvN7IrLA5gsM9sl+9GrMf5cq1964=;
        b=CLknp7VBSIerbbsmjGn32/DoqOB9kFh0ibh1Tk9jJWPCzmzwl8Eq5QLm9WDabMSFvs
         GFll+csf+kXnCSKJE/LF3y2lB2OmD6zvglCa+i4Lp+UgZHMR1JmETHB+UArVm32jAqZr
         yw7G6b74CLSPsUeFWtzwPCJsNzF/XNlQVtVW7LhqYmGYt1k1KP2Fua2PNCYbMJzzUFRO
         Jyai4x8/stLfBxZQat6LUjRXUiv2Vx+OYkljZKxShaSAG0fUPemSE4DQwbbHd3iUjKbt
         5XGvl7sLgYaTsgZs0jg83l1pavccl8CPK/Mhd3+0QqXkPdjnamQTHhft6Gx1bvKE3r1A
         SSEg==
X-Forwarded-Encrypted: i=1; AKwUvBzP/C7AjKa0PVAPZDjN0TZXi4j5OITWMGYNX35IlWIEE/pcifWASLZO+qLOf5LEvaVGKkkAGwPpD73UntE=@vger.kernel.org
X-Gm-Message-State: AFuF++kfP6WAKLboq7NGF4FBID+Fos3am7BfZaS9z3Y8maA8O0kkmHyL
	lE2iW1YChGshPg6rByAZAwIn+WYDAh2tgygvjahEaP1H8X50G1bwF/I1MSa49KKWyJK04k+naI1
	8zbM/bFWbUc7geMBV1yj9lHB0Jy0Mi0s=
X-Gm-Gg: AYBFou2AI6z10dgsGTuGDyIxReQgOGwBGtXSCXMC+INh0mcvFalt0CwUP+bvNtYxXCF
	m/e56KYJP0dGI7LfzV1km+dWTNPQ7LchkIHFYp6cZoNhsl/Hz0AcHsQZsxq/2Fr7sOlRqBMIOPc
	6HG5xMzzp1HFmrBHlEt7E5T+4swJZTazGWKD96dEg5UxNyrJWZ9y6I/dTepAsAIyU97650wXAcE
	6oPqlgyD+IYYmkolKgoo8arZmkrknqJJiAxB0a1I1DZAn89+pmtlQp+8SouFVnc6Xbco7f9edio
	/s2DeSnCgAGe95pUH1Y4/INlbiRDSIpXbqcekG2KauQ2UgTNA+NjwjHblRaaUwe+PwtiOH/noLM
	fsvTwo6aYuUmvfq0JI0gLgkz6gzbsLw2yMzMf8l7wa/aPQvk2Z0iv++sbyMTv0lIdTpCP2H479Q
	awdFWwKT+D4TyDOuDhhSLXyZKFC3+A3fw7Iqis/dzkq6P2
X-Received: by 2002:a05:6102:548b:b0:7a6:d11b:16ea with SMTP id
 ada2fe7eead31-7af1c7a036amr305798137.6.1790194439982; Wed, 23 Sep 2026
 13:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com>
 <20260804-h616-pwm-v8-v8-2-db37ab8624ae@gmail.com> <arFMta6PPwmzSk86@monoceros>
 <CADvTj4r1sFjPko7G5DwrPUw9x1tPzQspJhCUmHSMtrudn7SXEQ@mail.gmail.com>
 <33e760ca-2bb4-4f1d-a736-7e74a97e60c4@bootlin.com> <CADvTj4rBUNF6EaKXbsy5t1cS0iakpWVdpQ5sQF2qLS4YyHM2aQ@mail.gmail.com>
 <58145d8f-dd16-4cc2-b2ea-d475462241ab@bootlin.com> <arOif-bN6JgLeWd3@monoceros>
In-Reply-To: <arOif-bN6JgLeWd3@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Sep 2026 14:13:48 -0600
X-Gm-Features: AclHuK9uNvVaV2VJoRguaZ7pkecy04Hwe0dR9Nt2OWuOrBNW9SpmIsO_os_jzFg
Message-ID: <CADvTj4q4G5doa-br_SvvcuSF0sMA6Vb3K8ogZL7xe=auEd_s+g@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard GENOUD <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, John Stultz <jstultz@google.com>, 
	Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> On Wed, Sep 23, 2026 at 09:16:28AM +0200, Richard GENOUD wrote:
> > Le 22/09/2026 =C3=A0 17:46, James Hilliard a =C3=A9crit :
> > > The resolution tradeoff is real, but the waveform API currently speci=
fies
> > > the ordering: choose the largest period not exceeding the request, th=
en
> > > the largest compatible duty length not exceeding the request, then th=
e
> > > offset. That's the ordering implemented in v9.
> >
> > The ordering stated by pwm_round_waveform_might_sleep() documentation i=
s
> > period_length_ns, duty_length_ns and then duty_offset_ns, but what abou=
t
> > duty steps?
> > It's not stated in there because it's not a user input, but still, it's=
 a
> > quite important value for a pulse width *modulator*.
>
> From my POV as someone who cares about many PWM lowlevel drivers, it
> would be ideal if there would be a generic function that only relies on
> conforming and ideally simple lowlevel drivers and work out a good
> period that makes the required amount of duty steps available.
>
> When I designed the requirements for the round-to-hw function I had in
> mind that it should be possible to find the next higher possible period
> for a given lower bound (and that works, only lacks implementation).
> Working out a period that has finegrained duty steps is harder but
> doable:
>
> But something like that should work:
>
>  - Pick a period P
>  - P*, D*, _ =3D round_to_hw(period=3DP, duty_cycle=3DP-1, duty_offset=3D=
0)
>  - Either take P* - D* as a measure for the finegrainedness, or continue
>    to research available steps using round_to_hw(period=3DP*,
>    duty_cycle=3DP*-1, duty_offset=3D0)
>  - If there are too little steps pick a different P and retry.

Thanks, that makes sense. A generic helper could build on the existing
rounding contract to select a period with the required duty resolution.

That looks fairly involved to get right across different controllers,
particularly defining the resolution requirement and keeping the search
bounded. I'd prefer to tackle it as a separate follow-up after the H616
series is merged, if that separation sounds reasonable to you.

For this series, I'll keep the driver following the existing period,
duty-length and offset rounding rules. Do you see any remaining issues
with v10 that need to be addressed before it can be merged?

>
> Best regards
> Uwe
