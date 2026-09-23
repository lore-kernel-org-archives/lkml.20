Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D2147FB04
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158428; cv=pass; b=pwD8AszjFa+I9Qvcf77/wOxdg2006G/k03FSr22FExo8LuusojU9/ZNV+znkdhA5iksuFacGXSuhqPOA+LnYYSooboqGjfCJWCZ7Fk23gtpoZC8EyEkJbfMS4dL7OXjUTrhH2H+hjXoxu+/EGU0LCyclFmw3xcfHB7KwwHyOioA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158428; c=relaxed/simple;
	bh=6hNoicvQ9Qh0NY5PAdLmWCgVT7I2KnZ8VwidqirOaVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FO3xtOs8Vp7mO6/Ufo93QLRjIb56IErXItDzHxlPYGyF5/7XqDUcaJjqy07DfTRYekWkGeGJZlJ0asRn3c4cRmtTMRJd+CqttaDTj7XRNL99Hp5E3cCl13gm8RgiK6Ncvr4glZh1LXR0udFNejWVFNFkrXDRSfqb5kv2cYQBJiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImiwyYv+; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImiwyYv+"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85a4329731cso427759b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790158411; cv=none;
        d=google.com; s=arc-20260327;
        b=DFD38QW7Kgbac/l5zoDyCfTrQJqnu+WFpj0h6uR3etmIuBsZSeWOkC3LUfEILgIXZA
         XKW7KElpeO/iKBMuFSQ8C43OLuMo6DF3w2xmpywXqVV1tpl8XDMMEdo86HcJqzIVjrQ8
         kPpUaLh3OzIR6ApJOPjxBFaMia5yD5wPMHDXgS2HERPlpGdQ/F8P3LfryZx4Rm98BqCJ
         455DK3amXDZ3MoD8421fdgi/mZkmY6a7rTI1iptb/RG2ZsxA7Ud4KPVQgfY6Jy808Th/
         If0PoHhjf/xkw6JCa6mA59UtKM+LM3FDE9lhH/Vgf+afhnksMQ042vCPVhtR+8g8S76v
         NSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8UPdY8cxlA6aoPjewzNTQu1SQVA5gFWIlU2oGV5oPs=;
        fh=EfbFLs1FA9wtGWki36bGsUHiPwdFlKIZdLAQEQrwHWo=;
        b=Ve4/4xqP5sTacWO5sOK6q1bg2zXldsZimtybxxOi/LBps/oJOinpOzGfpMza3+auwP
         LDL8N5pbmJXbdXeHMSSuriQah3jyeNECkB+b21VwlZ86IOau9nW61eBtOlfTL97GDOnE
         VoRjxMhs8OlFtB2ya3TnLfD/we9dIc1TqKx76qg+wYmC4z4mydGrw6xKY2hw0X9yYDh8
         vjnUYhiMI4lgcKINs1BvyQNFM0cR6GCcUGKAthYFIlb1nbYmwquKtUTJ7/i2rxn/QOCI
         oeGlpE/4IW7N7i21+5fYrZ3xRPI35uVWFeh9JfUn7XZFSnct+6xlaUHYh/c0nCWmjWWU
         Ejgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790158411; x=1790763211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8UPdY8cxlA6aoPjewzNTQu1SQVA5gFWIlU2oGV5oPs=;
        b=ImiwyYv+Szy9sBOTxAaUjzR7tF9JDGlVrujEaLSCmW+oKqiEeeyf19vKH1938mB4Ai
         qcTH+2z/VZ88uOi+Q5eM9rml09l/OqPv0YfqHVF0siVgsKDQHSZnOIRFaLdGRAEqcYud
         woX3dF6MUhHv8Rl9uQuG1OyGcWeAuYzmnvM1lRBctLw0lBr1MVOhMijAA0K559uVHXbO
         aJioCmi6Sqk4Jb0/cgD3OpwsMVcjB/BO7x/gQKTF4/s7jxYgo+ctcGcuT98pN0BOeOLJ
         qw74NpXqxq0D/fZojv1q60r/+3eCGAKaWLvqdRB4cWTUaeuOx5J6viMUdUlcdx+olQ7c
         /IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158411; x=1790763211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8UPdY8cxlA6aoPjewzNTQu1SQVA5gFWIlU2oGV5oPs=;
        b=vRJ9u9V1z3AflxXoGZn/9eNGcD9eiCCH8in+XPTwaAAJ+1EIrM/vVTAOGo89JrkDgR
         L8nbgf8JzPM52mxlo8RlV79RfRK4tOvBSe4wnYEm9BEtE2QowLpZhKc9E91BCb/Hr2mc
         HFsN+mxoMQBVUQ3R6uSjaMUGWcMrCdcA38Nk8fo1HQQD6Z6ENsO4ZpzsUkooVCkZ6Sq0
         +hoPbqxvQCWU4kZWWd+7KdAn8Gz6BXELl3UOFkX/m4umafylMy/LU3CCJtBps2Q0sdYs
         0XgoDX4C9ka9IilAZPrdNS3AHvjk4tukbDl/G6ueUBBE5i3GSFYSEnZvWW5M8vDCfv/M
         Se6g==
X-Forwarded-Encrypted: i=1; AKwUvByOBTV5BU6vRwjYRTSRgiHazu4PKxykWdIrluFDMh2T7N5T73N8ZzjDjUb4cILSg4fIZHvzA4bLP/OsEc8=@vger.kernel.org
X-Gm-Message-State: AFuF++kjaQGKDV4JRp1sR2ikWLa946LPdLR50Y8mPv4BXZYGpyVetsu8
	wAptDDQHyXMZeK2zwDyEufPTtSg0yIGrMYsYVgKOZHgpKhWLDE08UMimqca28RNk03YgbaFRYsy
	lThPzWLZcnwMQPu6blh0Vub+sDP8xe7o=
X-Gm-Gg: AYBFou2EoNWyBWgK3pj1RgZdjVIBxZhrIYQ1/WoJPD9vqrAWrvuzujJbIdqInLMSNIN
	AJyvAefwicD9nDYCbGQ6l39lrTK87POIiREEfMNnbg6GKIOrukAe8xqLA/gZdqFocOMdVJKzenJ
	icnERQ+IyEdbkDcbYITlSaPzPbgo0kAGKTxuVaajlzxxRpWbD4qg1VHcUXYNxlwlWQLgE8vUh0k
	8XxE8lN7OCK/1FyzDzNoY3MA1aulQV6ryx42QqGxJVQayrtuYuSAUI3EQYcyiEad7RsgHho9VDG
	yUkRBzQ/B496a4ASAMIuLoPVi8ytcSu74TiPEm4rikQI6r/52l1orHAqTd1ZtFhyOA==
X-Received: by 2002:a05:6a00:1489:b0:845:ba94:a56 with SMTP id
 d2e1a72fcca58-87d1a7ade4amr1946462b3a.5.1790158411345; Wed, 23 Sep 2026
 03:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923054017.93553-1-mhun512@gmail.com>
In-Reply-To: <20260923054017.93553-1-mhun512@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Sep 2026 18:13:18 +0800
X-Gm-Features: AcwNN1XtFHREsFLdPRUiEqLGtk9NvYoAB2IZLiGY3P6QqpB_FT8nAPCPpRvlyaw
Message-ID: <CAA+D8AMQLkprPdOrT=oYR0dMmy0TqDdy1rZ3nXP6nPoigdsBuQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: free IRQ before canceling reset work
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:40=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> irq0_isr() schedules work_rst on a preamble error, and reset_rx_work()
> touches regmap.  remove() cancels that work while the IRQ is still
> registered, so the handler can queue it again during teardown.  The IRQ
> is also requested before INIT_WORK() and spin_lock_init().  Probe
> failure does not call remove(), so freeing the IRQ leaves queued work
> running, and an earlier interrupt schedules uninitialized work.
>
> Initialize the lock and devm_work_autocancel() before the IRQ.  Failed
> probe then frees the IRQ and cancels the work.  Unbind frees the IRQ
> before cancel_work_sync() and pm_runtime_disable().
>
> Fixes: 1e5d0f106164 ("ASoC: fsl_xcvr: reset RX dpath after wrong preamble=
")
> Cc: stable@vger.kernel.org # 6.13+
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 9828272..29929df 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -3,6 +3,7 @@
>
>  #include <linux/bitrev.h>
>  #include <linux/clk.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> @@ -57,6 +58,7 @@ struct fsl_xcvr {
>         struct snd_aes_iec958 tx_iec958;
>         u8 cap_ds[FSL_XCVR_CAPDS_SIZE];
>         struct work_struct work_rst;
> +       int irq;
>         spinlock_t lock; /* Protect hw_reset and trigger */
>         struct snd_pcm_hw_constraint_list spdif_constr_rates;
>         u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
> @@ -1617,7 +1619,7 @@ static int fsl_xcvr_probe(struct platform_device *p=
dev)
>         struct fsl_xcvr *xcvr;
>         struct resource *rx_res, *tx_res;
>         void __iomem *regs;
> -       int ret, irq;
> +       int ret;
>
>         xcvr =3D devm_kzalloc(dev, sizeof(*xcvr), GFP_KERNEL);
>         if (!xcvr)
> @@ -1705,12 +1707,22 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>                 return dev_err_probe(dev, PTR_ERR(xcvr->reset),
>                                      "failed to get XCVR reset control\n"=
);
>
> +       /*
> +        * irq0_isr() schedules work_rst. Prepare the work and its lock
> +        * before the IRQ, and register the cancel action first so a fail=
ed
> +        * probe frees the IRQ and then cancels any queued work.
> +        */
> +       spin_lock_init(&xcvr->lock);
> +       ret =3D devm_work_autocancel(dev, &xcvr->work_rst, reset_rx_work)=
;
> +       if (ret)
> +               return ret;
> +
>         /* get IRQs */
> -       irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       xcvr->irq =3D platform_get_irq(pdev, 0);
> +       if (xcvr->irq < 0)
> +               return xcvr->irq;
>
> -       ret =3D devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr)=
;
> +       ret =3D devm_request_irq(dev, xcvr->irq, irq0_isr, 0, pdev->name,=
 xcvr);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to claim IRQ0\n");
>
> @@ -1751,8 +1763,6 @@ static int fsl_xcvr_probe(struct platform_device *p=
dev)
>                         fsl_xcvr_comp.name);
>         }
>
> -       INIT_WORK(&xcvr->work_rst, reset_rx_work);
> -       spin_lock_init(&xcvr->lock);
>         return ret;
>  }
>
> @@ -1760,6 +1770,8 @@ static void fsl_xcvr_remove(struct platform_device =
*pdev)
>  {
>         struct fsl_xcvr *xcvr =3D dev_get_drvdata(&pdev->dev);
>
> +       /* Free the IRQ first so irq0_isr() cannot requeue work_rst. */
> +       devm_free_irq(&pdev->dev, xcvr->irq, xcvr);
>         cancel_work_sync(&xcvr->work_rst);
>         pm_runtime_disable(&pdev->dev);
>  }
