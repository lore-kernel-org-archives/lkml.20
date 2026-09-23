Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE83E0245
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181366; cv=pass; b=aPnfA2vcy16pwx7NpEa6JOk815AMNE2Zbc/exvtCqovnVN1B/opqwipSpjnJY7dQQhGJKXHmam0wzQ1ubqte/tovRxGDcGaNy8vd1dSea3H4bQl1HuJCGKY0pt357rrPBxuM5upE6kigl/s+q4qPFil72UP8S+q4iL5jRfG/Lbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181366; c=relaxed/simple;
	bh=roLRqtmK30tWGOrCTtb0TpnBW/NPax114iO2NAggdfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHJiPNgIJ2+fQUk3xu+vl0XUWBef5oQq6Kx9SG5CrcwYY7F4ofmPpbEEqxoAl6D6uoYP6daOh9w6rKW2CUW7yzcsaI+l5SMD4v8i9wPELh8IlW9NZJCpsmBM3zM1BvR0RaV4DK4hqO6pex9n5DI/WeBE3B34uyTR6DWpcJqhj94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZklBBsP; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZklBBsP"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb766bfd8so10288451cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790181359; cv=none;
        d=google.com; s=arc-20260327;
        b=fLtMqSrbqjd6dTTAzudNU9wSdaUhxk5GnPT1vmZv3AKLHZTYkSRrdIrrBF+blURbvq
         2H3lKLsElFZiuAdn1ByXmX2AS2g3N25o1DoODitryBQJbhNcA/GsICbtZV6UwZ9r1qvv
         /C2MSEsmB7KeIzVzlIouRZdfLtEegOAUP0/k2n3hiYk18eSLDYmAJlNcSINjwUjFTbhD
         Kyiaa2r5UC41tsozIiNISjTHk324WY5GSYnO9o6kcnqTIe7uS6XHgqaHIc4Cv8aJutWP
         b74Q5KIHL7hmHt7p9RxgefX+VH82pyQddqb/ns9KoUdRscntCLEH5oZndvyGURGWz1Fz
         rc8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NqUG2jcYNXCjwbWYuITmLObIVZqMjnboowMRH3b6/zg=;
        fh=BIE+AexXkmxNZ7NYGf+z8gK5KbhuRQNswjOPz/uT9D8=;
        b=o9wktOCuyYDOoQ8yMF09jdwqCbZbj3+TNltP4v1CmqS14jAIOrERGynjkAhkN+tMnW
         omQZUld7VbERZZnKosQGHpwE1NJ581wmJ1XMRMPlCm9RO+gPewPdYFZm5lJHCciIKt1d
         Oy7pMf+HOTMPwupEc2s/kneEUROM/uDZh8nO5zsvjz6ToU41PwDvaT3sTHDs7IYSzElg
         uRNNNxaj8dzi7EXVfgH5AGhHTL5UGowbi7qD5q0xA+M/fGO7woC4m1AVNMZoDZidUt3O
         k1mJgkegqopBtZwKxpgssWkQbvKMG2h+XbUxsS32Kj9z9N1uYrwsREVGCWsm3nrvISYT
         QOXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181359; x=1790786159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NqUG2jcYNXCjwbWYuITmLObIVZqMjnboowMRH3b6/zg=;
        b=OZklBBsPkj6hfOsnDKrghsOnExclEGlIRg9cb2bmhJCxZiA0FDnpMYrKQGJiOfmrXu
         jW7W+sjM3dllQwo0vNRIfIE+was+zfoYlxDVqjaT3lcjv774lqo6dXdCYGspb080Wk6P
         M8uC/XrRctdDPr0EmqKJrJL2RFz9YKawC8WReyrg/wznKkvTJlggqfPZB6bRmu1AB5RL
         eg0CsMtG0g2q5u/k12FuGV8EvpHEK7VTNwVYMQlXrPLZPhB/vS/vys6z1sA5UGAp5Zur
         0QWXXGFgpFt/a4X6c3auBxUm9DCKefDaq3zmd9Ns5kiAHahRhZIi9Vt7et1GkOw6WyaS
         iW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181359; x=1790786159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqUG2jcYNXCjwbWYuITmLObIVZqMjnboowMRH3b6/zg=;
        b=HN5yjCAiwolg5uYc6V+TWS8NZJXc/i6CC7kWI1FtddD8xlaU5HrKdvDEl/Q5XkxvWC
         rEbv89GrTELoP2uyA9URv7TFLb1LWSxGi9wpWN7B7Nm2/hOusBxeFJUGVPvPMDE04Iua
         dKrOeP+9an757pEAbXj/sf6cZTUcoSZ0ucz0InVKyvaN9GUxKdCsvG2GO5jsWmZdXx9U
         uGekQp/Oy5Tr1AteMIo04BU5zO34DAwP9jBflDaPI7cptW89SjtX/unrOuPGRutfpa9s
         3YjY0/n0S4amIdX1zciLwSq4C/jTSdUyHA7Q8ZzHB/lCRRXeA7N4N4/6J+mL6DSaRc9w
         /dLw==
X-Forwarded-Encrypted: i=1; AKwUvBxHEoYrQLvGMn0cv98OglxJ2H+kEgd6LkfBfHDHFChOWMT/WkceoKhoPI4vEsYMkpVrT8n5nSzpdVj2Dsk=@vger.kernel.org
X-Gm-Message-State: AFuF++k1K0xLLMLz3Kjnxh7iMjeUomIOy+Sqj8Ztm+SJKRw93434cCI4
	kLRBGcGS3F+CibC3ckK1Q9E7SqPMbIqdmaEDvvg1tGg76SrVVWesn1LQK4/Hi9/NjlxHz9zziLa
	4RelqFDuDu3qUi5roWmvuawvknfKKV/E=
X-Gm-Gg: AYBFou0ZOKsPLGsiP/ISJRXGqXRBDys2gJ2x58osHL4RLqJ3VlifrhqegRV6TeujkLg
	FTIesluzkWYSWB8jnu/HoYhuaQip8m7cB4jCGftqz/EU5yMkmkoWkTS0eTuC+i4WP4isJItI2bW
	zwM70cePlVBvj142ycyL4dl7ZRGrK0sKACOBgoei9OXmDwvZrj9zY+m5Q4V32o6VrJbUdz+kvBY
	OS/r4Rfdk5YSw0wz5+necP+SO+49tsc3D5A9LHVg8URqIgrCuxrgE0iDRdUHrwd3wOXHF2Z3sDJ
	yCej/jjfmHMcrF+KHsN66qjYXWjuVKrbc2ro+Qc9ezy7YckcPVWRQp91iW10NGKhw0GmuA43XKL
	gtkJDgk5khFeIlXj65AXx5m2NCLjMn7bjMDkQ6uxI/sJ7yIJ3
X-Received: by 2002:a05:622a:1185:b0:530:3cde:b8b0 with SMTP id
 d75a77b69052e-532eabb20a6mr48549181cf.13.1790181359041; Wed, 23 Sep 2026
 09:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917235925.44185-1-diegomancera.dev@gmail.com> <bea461d6-4ae9-451d-b6c7-5ac7bc144651@kernel.org>
In-Reply-To: <bea461d6-4ae9-451d-b6c7-5ac7bc144651@kernel.org>
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Wed, 23 Sep 2026 10:35:47 -0600
X-Gm-Features: AcwNN1U34VXKrFuYRGQT-tb2Y_0kpMMPgNyhZZEEZJQIbxLVfy69eVvfPsKtllE
Message-ID: <CALruWrUYnufzE3Lqm4=32_nSJVSVRRR9oeU0fGNhLfr7uyJoaA@mail.gmail.com>
Subject: Re: [PATCH] memory: stm32_omm: fix child clock leak on set_amcr()
 error path
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Without st,omm-mux, of_property_read_u32() fails and leaves mux at its
initial value of 0, so the "if (mux & CR_MUXEN)" block is skipped and
the child clocks are never enabled in stm32_omm_configure(). The new
check is then false and nothing is disabled on the set_amcr() error
path, so there is nothing to leak and no unbalanced
clk_disable_unprepare().

The cleanup uses exactly the same condition that gated
stm32_omm_toggle_child_clock(dev, true), so this also covers the case
where st,omm-mux is present but CR_MUXEN is not set. The earlier
"goto error" paths are all taken before the clocks are enabled, or
from toggle_child_clock() itself, which already unwinds on failure.

If it helps, I can send a v2 that states this in the commit message.

Best regards,
Diego


On Wed, Sep 23, 2026 at 8:54=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/09/2026 01:59, Diego Fernando Mancera Gomez wrote:
> > When the mux is enabled, stm32_omm_configure() enables the two OSPI
> > child clocks via stm32_omm_toggle_child_clock(dev, true); they are mean=
t
> > to stay enabled for the device's lifetime and are disabled again in
> > stm32_omm_remove() and on the devm_of_platform_populate() error path.
> >
> > However, if the subsequent stm32_omm_set_amcr() call fails, the functio=
n
> > jumps to the "error:" label which only calls pm_runtime_put_sync_suspen=
d()
> > before returning, leaving the two child clocks enabled. As this happens
> > during probe, the error is propagated and .remove() is never called, so
> > the clock enable references are leaked. devm_clk_bulk_get() only releas=
es
> > the clock handles on unwind, it does not undo clk_prepare_enable().
> >
> > Disable the child clocks on the set_amcr() error path, mirroring the
> > cleanup already done on the devm_of_platform_populate() failure path.
> >
> > Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com=
>
> > ---
> >  drivers/memory/stm32_omm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> > index 84eb23c824f5..3599683ab04a 100644
> > --- a/drivers/memory/stm32_omm.c
> > +++ b/drivers/memory/stm32_omm.c
> > @@ -274,6 +274,8 @@ static int stm32_omm_configure(struct device *dev)
> >       writel_relaxed(omm->cr, omm->io_base + OMM_CR);
> >
> >       ret =3D stm32_omm_set_amcr(dev, true);
> > +     if (ret && (mux & CR_MUXEN))
> > +             stm32_omm_toggle_child_clock(dev, false);
>
> How does it work without st,omm-mux?
>
> >
> >  error:
> >       pm_runtime_put_sync_suspend(dev);
>
>
> Best regards,
> Krzysztof
