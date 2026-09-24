Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522B415B6E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273593; cv=pass; b=Kp8BSfdHP7WaZZuaZYaJOVw/mdwym7ukQhRcylDcwVuVT4sZsryyc8vAGR/2K4D3+se0E5MbXT5QRzooX1RvYy42oH57b/nMce/JF9OqS1RQaPfB+4vXGUrnX1OxHrcfbURxk4DKy85hlN/pQQZKpMUyUPw8mMoUqxq/Wh4BjTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273593; c=relaxed/simple;
	bh=obM89duV/YDQdOLprqIx6ewSPHAr0cjoNZPC7dSU81A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEU4YtnVSvrLrjDcefUywZaMxaZom+A/mEKPnGOZL3LYE06EkqZrSDxM49KEVag9/UCoFeDeF/ORTKP4RZDakg+ha29x7Pige0NsAeFB+uGj4C1ky36ry/++jqgEN9fqukpJMhd2ck4g0yipAphuPMSoWZ5VITC0YSMUad+iZp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbvzXo7h; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbvzXo7h"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aa8d881so341385d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273590; cv=none;
        d=google.com; s=arc-20260327;
        b=VeCaiMN/cCYsXoeKweioZU5F7PYESUTxaH61GhZjY34F1X21Hpkl2kKGMObPyUTUjm
         GQw0trmhHt3IOcuv3ijyvZ69dkLArvXMsEGjK6ym/HhJ2er0Mk3H4WyxoS9ftD7IAYu9
         eWzdaC+vwB5HExEh3TfAnS6sZlJWelAzuvR6P/OtpcIjPTALImP72Yvr0u6S0bSGcgTn
         6tEHf8xAG8tOHrep33eje+Skh+6JrRUxP6sHauivk8T8DOVVrNFq5bBNkl6ku6IcSOw8
         R1uzbZZocpKstRsJxbOnbpbEdu5x/bGav7eQuCRpP6liMHxS0l9sC2PJGgbFZSK8QboC
         oEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        fh=AFhrJL8baQ0CSUnYDAd/LeNhWVHHXaExf7RvRfQLwXg=;
        b=YF/W6jh+t3xUB0fOox3Zg6YMrBAl7XUp+zFMHF1uZc3hMwsLC+hthCAa0C1nXIu0U/
         mVTu8HvB5gmDQ1JrMghIFlqADVbP4yU6lZLUFhzdtIf948iaORONUj4SwW5weg8PqDC/
         vmgDwtmLX+xPZw3r9W5Xv6/V0dr1CTThxfY0InbyvpjkMOc7wEethiNM9foz8aCB5Uuw
         waHdR2jEevDY5+Vf7M0oyOF1p0UN322BOaCyEJpqjPFXtnQFXnSZQlAKkQiEnTlJcLCM
         j2Mj/b5ZoPsmrtpkPHPtcs/cyq4R1a0OxBU9t3iFRs1K9yrB+LPaFyTirHsEpZV+x8Rb
         KHWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273590; x=1790878390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=SbvzXo7hrk0G6IauEmNn8RcRTFDhXSYqND3iYB+yTSkk/RWTVAJUMeNbgREjaGaJht
         dlN1Eg/3m89JfwDHLE0FluvYhAG3q3xdg3l7jNZUUJrO+l21ou8qZFzxUfbvYJvzQXOg
         5/+ygTJVT+uaqLti+EfJmQA/N2W5pjkKps/R6ID31PGjFY4W5cJ8VvClXQeU/Ck/ZqAQ
         Y3WpYCjClKYmTsfxbbDWMvEQMJKv2FtuUgZQjWqydKctnyzYsWgzRtVwS8KSrcokkmr6
         KIqzntdUUlJs5UMpLtcBj6DmlwlgqYUD+4o6vaTavK6EWNOGL++xcPWaQBtsgV/s5fPB
         y9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273590; x=1790878390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=IFc1K63qCY34TIMtjQBkGabaZJSaovE/fYEdtVVBM65f/7NdbpW0ExGHvkwkAsgjX7
         QWK7Dtz1HQ+EqHAL94obKNRI83ZOmK5di/rWTpW37fRaWcGShvQcvo69M5u3QVC59BQx
         DlUmcU/dI4dMfXPzmYGrTtCv6An0aeedJfp8bW7h9ri0fUiUMxepH+1WLYZwNmvnIZTD
         ikWFxuIT/LBuoPaz7wg4BDojYTpPGfH9Ksris1dF0B/ogJP/tospGxb7SsPz04/kn/jg
         cXIxbseC0H0+C7U7gSHYIA6Ld4gyb1ojmvfk7AwybtNWVkHsqd7c4Ur/a5qcjOZKST/Y
         OjFA==
X-Forwarded-Encrypted: i=1; AKwUvByrrIE/AQ0gSqxp5RnVUjXqwxXrcxUB+lvrWr3WdHbOMSFk9+uv12TdKP6bE5PNPxVkhyM5rJWiCkcK/Fc=@vger.kernel.org
X-Gm-Message-State: AFuF++nTrf43o+aa0GCSY87Ih9LS3gV5MTBkUhv6q2QKOeVT3fUDCyvt
	6E3PRDa9+BuYGZvONx3rigAcpukmQnLcK9CmfXWiu+nsbiDrBVp+0KKyIR4t7mSk4aZa15+E+9F
	ZKNGRn4TDE1N4VhaHPZNwQFFH1ePyqTM=
X-Gm-Gg: AYBFou3zQOrpiLr4k65fIIH826BnptUzUf5M4/+ulYRC5om/bOhyf+bNhTIaFoE7R3h
	QsrPEolwNnYz0we0hMzeRth06QrKNuqRM17x3B1CX/GBXzJADoRgh4TBJI3NE00z9a2mwozaM9W
	McfUE4V2pwOiaMUoztbcC5aE0BoOW25Kip8LN/aMwJv6thQ1WKOH1hwsP2GfhZJBqDfW/+d0avl
	7PpRupfTITvGt0No2jZnUBdC2skT7AM4DyKZmEdObQ7KSETsBeYiiJ/LhwY8lHNzqrmHtDPzEug
	6geuS9jNIiTolVoHHQgaJ26Qi3zGwkBCCSlY47u/+9tE49BzC4djX4Ur
X-Received: by 2002:a05:690e:418b:b0:671:5ede:96e2 with SMTP id
 956f58d0204a3-672ed2603d0mr2064645d50.8.1790273590483; Thu, 24 Sep 2026
 11:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Thu, 24 Sep 2026 23:42:59 +0530
X-Gm-Features: AclHuK9xd3dlB_Cgp98d7h2ns81HK8suGpMur6yXKcYJOLZ9LOtfHEkjox28BFY
Message-ID: <CAJ9orWTDrTTRLqwnwu9YMQQKt0k2g7qZEpH6fDcMFcTbTs55KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
To: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org, 
	kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 12:42=E2=80=AFAM Sumeet Pawnikar <sumeet4linux@gmai=
l.com> wrote:
>
> This patch series is a cleanup for subsystems under power management
> (linux-pm) that converts several instances of error pointer printing
> to use the `%pe` format specifier instead of explicitly casting with
> `PTR_ERR()`.
>
> Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
> print error codes returned as pointers. By switching to `%pe` and passing
> the error pointer directly, the logging subsystem will automatically
> print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
> `CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
> numeric value otherwise.
>
> This change significantly improves the readability of kernel logs and
> dmesg traces during debugging, without introducing any functional changes
> or side effects.
>
> The cleanup has been applied across the following PM subsystems/drivers:
> * powercap (intel_rapl_msr)
> * thermal (cpufreq_cooling, devfreq_cooling, qcom)
> * cpufreq (bmips, cppc, qoriq, s3c64xx)
> * devfreq (imx-bus, imx8m-ddrc)
> * power/supply (various battery and charger drivers)
>
ping for review request on above listed changes in this v2 series.

Thanks,
Sumeet.

> ---
> changes in v2:
>  - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
>    for *_probe() functions during review of v1 series. This will be done
>    in different patch series.
>  - Here in v2, reverted the changes for dev_err under *_probe() functions=
.
>
>  - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4l=
inux@gmail.com/
>
> ---
>
> Sumeet Pawnikar (5):
>   power: Use %pe to print error pointers symbolically
>   devfreq: Use %pe to print error pointers symbolically
>   cpufreq: Use %pe to print error pointers symbolically
>   thermal: Use %pe to print error pointers symbolically
>   powercap: intel_rapl: Use %pe to print error pointers symbolically
>
>  drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
>  drivers/devfreq/imx-bus.c                  | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c               | 3 +--
>  drivers/power/reset/macsmc-reboot.c        | 4 ++--
>  drivers/power/supply/cpcap-charger.c       | 4 ++--
>  drivers/power/supply/intel_dc_ti_battery.c | 2 +-
>  drivers/power/supply/qcom_smbx.c           | 2 +-
>  drivers/powercap/intel_rapl_msr.c          | 4 ++--
>  drivers/thermal/cpufreq_cooling.c          | 4 ++--
>  drivers/thermal/devfreq_cooling.c          | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
>  14 files changed, 25 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>
