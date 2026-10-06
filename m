Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D83B6C15
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275557; cv=pass; b=Bt9nw/iWrgw1S+ZRiT81CWSxV18+TJUL24oK7RW/GSR2eP1ZDQeJ+my3Ds+mV7wZyw4ML5mVXaAWLuSfZQpk03viYxhqXE5QUp9VPzvTBETAcGFCMieTg3/wxabG/T/Cw6u1n77BjR3dUs8EQg4z9Cbep7y4/x+UNkYt9ElSYk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275557; c=relaxed/simple;
	bh=IIIQqSLM52I4Dl3J6UVq5jxv5UJfW0trkx7wlCIr9I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gF8tKkiw4GOicNwdgcF2IAAtgJpPOxc1aFe+jATnEt3kiYxaYiTJkawBjtjMWoRpxmxFmkoZdSKD8bXWXzijY2xUDO4Ifgkon2JXig6gjr1IeDt2+HoMa91NLi3xdjDn+wtnZdxuhB50mBAHupOVwIdLzfzUh4WQaxkR4gu4bVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cU5yHVWW; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cU5yHVWW"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so2338691d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791275553; cv=none;
        d=google.com; s=arc-20260327;
        b=RhnengKlKvTbXFKm1DWiAlxa4W0n2ESWxRcJb7qqo/2h1JicNgJf2BShgck6mYf+qG
         s/zdDTL6ArY99EzE+cYb3hlzEii7HPpY1udQ0ROorkhfn0cGVH1REd8N+iNxG0lTZ2sS
         9byp5DCyOV/AOqsF8QnerbATxLx/cznVKWq4CnnD5mgkkqn5zlFgUU9PC5zyRPM4K9m4
         W+mP1vRPo1bogUXZH3S58utQltiu0PJ0taFv/MO+m7v6rMIZqHp6buFG6+HhCuc1f0CM
         CYhiC9xeFF588xSHfjuyS37Z0LC51hpaPzZlWFA2d0IzkRDkVYtLNms/wuxwDvTmDPqI
         V7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        fh=JQLSUzt6m3z7PlIVkaWOqBN2pdqP96OFxb8kV0JMwx4=;
        b=tAwq6nnnXC6m0C4/y96Us8dxJbklyK4jSnTPxnDtsYUUzoOGGo6Kxy+HaBHcVCvBVH
         9CCi7jMk+TtaUWLw0MF24IIjSFssAiLJXY8630PZXkyzeWxWUD5CVxyciPrLZUM9L1nT
         aE/M7JRSWhqB5AFVE7Ix8Cc+4x4yy8YSkjPwaWZpRl1gsoyZLYbeMQjjYTwkVHNLLhAU
         OC3zGJnHBHEIzYC87TzxHwM3+YqoGPpMpUX/bLT2vLCawRLts+HBgo1vjdlnDwEnQ+oH
         lizzfvbvaCOHRpXX+ZBUWV3SBiJ5nCO/mvZqyAHVljCedCNK9IHrMedalBDofbPZc5zW
         paqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791275553; x=1791880353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        b=cU5yHVWWElFKjYhbMwU/mbdMyhpVpYOBM+dGuxrmyRaF0Eoz6isB839nJ21VTMSrrt
         7QHqItGtG61MiGg7wsxKPqOO/cPsOZKqTmkuXOIt/84FWNHWpjSmKtVv378LwD9W5GvX
         9Tv9MxuUqhkRoOIbnpRdvbhd1LqyWLaArOZV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275553; x=1791880353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3shV/IEEj+NmVizCeUDHMNW1W3PTgtTr4WQ4n8BMHxY=;
        b=WMElgHQClFpPjXJHRv+bP5QUbiAc57bh2P5PRpWyN77uTXb0z4bSjOkpflk9sxk459
         pyNCekpmWCvOk2q5a3av5I+fVhFmWx/W34QUDMrtlP3OZhgTf7ROdxzfxvpZYwx9l7oH
         NWVB+DpYdKLxsrR8CVFk/CEEQUQoazsQq7HI6ffC2gcFnDqVCZG3pw9nVpa0U5gAACFp
         j0PLLnDs8WGjG+8mnl76ZmWyvOXKPOFkz264SlWp9hQBVFJwaL236QQnYqyUs5K2OI47
         NCr43luqev++PwQq4KNcDXlc+yPR67+J8I4pPw45or+gTKrii7ArH6HGg0Tn8Qj0ddlA
         pILQ==
X-Forwarded-Encrypted: i=1; AKwUvBztTODxr4oIS/P5w5JGqetVosXf6P+CbmaDIhUSWHakBBb3OhtzVIzS2G3CGA4vX/nqQoFFTJ8U7MdijNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYInPdtCT2V4bliHpbEEilKy/MkYYDC1tpUq3c/qnB2wvgKMH6ui
	Oy7uq/S7GCQfEUD5QooCWZaWR0ScfZsbF8oHCriQQ4R6AwPVUmVFEXAKVqpMsfnFktgv96qAg6/
	wKCrbRIwyLMnp4jDJoluz1tBd+D87wamRlK6KSh57
X-Gm-Gg: AYBFou27DgBRAcNw7hTe1waLzZArYwve4SxRv3Z5NEuZn/vrEqjv0cj9WpilUoV3dhR
	JnDoIg4X30fAAxePtdLobhLCT4WFAy+XCXnA9a6kh1SysMSpfPa+URWuj7ldV40pQZetkczgfYK
	FZZEFDPjCTeiieRbhWYHsZNAN2pFNF1Gvpf5m193ndfi/mAzQ1IpDX85nHRz5wh31m8NKkuaYeW
	Tdyac+uxUZ8Epw+CAfiOeagUFcZWwH1pjF7TdtXmCxVTRXhY5jcfVkQcUmqSr6sDEXcO8mVdK86
	WFYAs8XBnFzvkuIlHqfDNwGeojPw+aqi6Y3E9fGNpuzI/0eGViYSug==
X-Received: by 2002:a53:c0c2:0:b0:671:7b7f:abbb with SMTP id
 956f58d0204a3-677bd39aa4dmr2469021d50.59.1791275553415; Tue, 06 Oct 2026
 01:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006025410.506443-1-nils@buechner.me> <20261006025410.506443-3-nils@buechner.me>
In-Reply-To: <20261006025410.506443-3-nils@buechner.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Oct 2026 10:32:21 +0200
X-Gm-Features: AclHuK8Gx2HsVGfCjYPgfM4FA2K14FiDyp_XESIE_p6YvoUuSuzEHEzfn-CxmWQ
Message-ID: <CAGXv+5F-5b+ESeUXBMYfKU=wUF9tAioyWOjWfYXoz09_-P8-bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: mediatek: mtk-svs: Don't fail init01 on a bank
 whose buck is not at vboot yet
To: =?UTF-8?Q?Nils_B=C3=BCchner?= <nils@buechner.me>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 4:54=E2=80=AFAM Nils B=C3=BCchner <nils@buechner.me>=
 wrote:
>
> svs_init01() moves every bank to its vboot OPP and then immediately
> requires the bank's buck to read back exactly vboot. For the MT8183 GPU
> banks the buck follows panfrost devfreq, which has not necessarily acted
> on the OPP change yet (an idle GPU stays at its lowest OPP), so the
> check fails and the whole SVS probe aborts with -EPERM, leaving the CPU
> and CCI banks uncalibrated as well:
>
>   SVSB_GPU: buck voltage: 700000uV, expected vboot: 800000uV
>   mtk-svs 1100bc00.svs: error -EPERM: svs start fail
>
> Poll the buck for up to 500ms before giving up. If it still is not at
> vboot, skip only that bank: restore its default OPP voltages, disable it,
> and calibrate the others.
>
> On Acer Chromebook Spin 311 (MT8183) the GPU buck reaches vboot within
> the poll window and all four banks complete init01/init02.

Were both drivers (mtk-svs and panfrost) built-in, or as modules?
This would affect the timing.

> Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
> 7.0-based kernel (the hardware is not set up to boot mainline);
> build-tested on mainline with W=3D1. On the device together with
> the auxadc_thermal per-sensor zone change: all four banks complete
> init01/init02 at boot (CPU little 1.99 GHz 1050 -> 1000 mV), stable
> under 60 s of full load on all cores at maximum frequency.
>
> The change and this changelog were drafted with an AI coding assistant
> during a debugging session on the hardware; they were reviewed and
> tested by the submitter.

This section could be moved after the "---".

> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nils B=C3=BCchner <nils@buechner.me>
> ---
>  drivers/soc/mediatek/mtk-svs.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-sv=
s.c
> index 99edecb20..2598a1ccb 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -16,6 +16,7 @@
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
>  #include <linux/module.h>
> @@ -1439,6 +1440,7 @@ static int svs_init01(struct svs_platform *svsp)
>         bool search_done;
>         int ret =3D 0, r;
>         u32 opp_freq, opp_vboot, buck_volt, idx, i;
> +       unsigned long skipped =3D 0;
>
>         if (!svs_mode_available(svsp, SVSB_MODE_INIT01))
>                 return 0;
> @@ -1542,13 +1544,20 @@ static int svs_init01(struct svs_platform *svsp)
>                                                       bdata->volt_step,
>                                                       bdata->volt_base);
>
> -               buck_volt =3D regulator_get_voltage(svsb->buck);
> -               if (buck_volt !=3D opp_vboot) {
> -                       dev_err(svsb->dev,
> -                               "buck voltage: %uuV, expected vboot: %uuV=
\n",
> -                               buck_volt, opp_vboot);
> -                       ret =3D -EPERM;
> -                       goto svs_init01_finish;
> +               /*
> +                * The consumer's DVFS (e.g. GPU devfreq while the GPU is=
 idle)
> +                * may not have moved to the vboot OPP yet. Give it a mom=
ent,
> +                * then calibrate the remaining banks without this one in=
stead
> +                * of failing the whole SVS probe.
> +                */
> +               if (read_poll_timeout(regulator_get_voltage, buck_volt,
> +                                     buck_volt =3D=3D opp_vboot, 10000, =
500000,
> +                                     false, svsb->buck)) {
> +                       dev_warn(svsb->dev,
> +                                "buck voltage: %uuV, expected vboot: %uu=
V, skipping bank\n",
> +                                buck_volt, opp_vboot);
> +                       __set_bit(idx, &skipped);
> +                       continue;
>                 }
>
>                 spin_lock_irqsave(&svs_lock, flags);
> @@ -1578,6 +1587,14 @@ static int svs_init01(struct svs_platform *svsp)
>                         if (r)
>                                 dev_err(svsb->dev, "opp %uHz enable fail:=
 %d\n",
>                                         svsb->opp_dfreq[i], r);
> +
> +                       /* A skipped bank keeps its default OPP voltages =
*/
> +                       if (test_bit(idx, &skipped))
> +                               dev_pm_opp_adjust_voltage(svsb->opp_dev,
> +                                                         svsb->opp_dfreq=
[i],
> +                                                         svsb->opp_dvolt=
[i],
> +                                                         svsb->opp_dvolt=
[i],
> +                                                         svsb->opp_dvolt=
[i]);
>                 }
>
>                 if (svsb->volt_flags & SVSB_INIT01_PD_REQ) {
> @@ -1599,6 +1616,9 @@ static int svs_init01(struct svs_platform *svsp)
>                 if (r)
>                         dev_err(svsb->dev, "%s disable fail: %d\n",
>                                 bdata->buck_name, r);
> +
> +               if (test_bit(idx, &skipped))
> +                       svsb->mode_support =3D SVSB_MODE_ALL_DISABLE;
>         }
>
>  svs_init01_resume_cpuidle:
> --
> 2.53.0
>
>
