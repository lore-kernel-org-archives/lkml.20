Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794197858;
	b=QnnOk1Vyvp6pzNlxCSJGqWa2gOBmgwtj23Ula/L83766gDpoqYEEzCBSVoFFZ32bKa4Q
	 NLj85QmoCDb6FUP0X44aVJVODJ6Oj2RPZntthoHRn37ttrcgKaW8+3HMWRvMNdzWN4nfi
	 VZzi4OkKj/4OWTaA3kxn9j8YEfUV6NXXlt5Ht2Jiq0qyTGebk5Pt7vBzN7hMO6QgIf/ET
	 bSiEOhnRU+AUZahbWqd9eyMTg6R/26AUSIEhK/RGMgbdblUiCQwtrR7YJ7jA4YPTew5tp
	 ahoQIoPUyupLuChgGOMS2YD1yJIHm0HSvcdMDopdg9lMv35wdlJfhdFHjrCEoSc5LJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
	b=LWOjvAXLCHN/Bv1mS8yBI2TfkcW2VwcpTRL3YROhBYdGk5W9VWcyuBdM0I/+7Low5oWa
	 bdLF55OKprxgf/lyqkPf50qDl9PKv/ztIrNl8fCrCgYFqYwFgykrAnxiYWV8049hkBFJa
	 CmhnhSJZC6HDPeNSphdtoeHyqitp2bsFtbwajTQ42jjMMuLiBDZw9oWmLJcqvMtrsWj4e
	 5CFi+AFwolpw4DBLEU0YS8dismnGC+xUIN3MUKKB73jirBI6tICBp4MGWgrjrjzMNrKMC
	 QLMUTGTY+DAoKDO5UsTmlF5Rn0+e8sTPwSgyKr4qseUF3hAQmZQ8NbKO+yaJbT5v0QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmSN4ObZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBFC606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDBFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PmSN4ObZ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3fd91337baso74623966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:17:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794197856; cv=none;
        d=google.com; s=arc-20260327;
        b=YI515Zd7YE/8BkbjOL8/bA4XsRh+UxtWvB/xkVYQAT2JkBafRxSdKQsfhpiRilSU+p
         KYajTeIDDA3sxJ2KUfFOip6iZtYcfVZUXP1g46m5CSalzHYQ8MYvShFEO5e1GQb9Zw04
         BYv3gvgdh4hnPGkPzxrGtqVfvlGyWZ7DAEjz8YbDy0/9GvBcCYr33fV1E89G3qBuO+l6
         lGxF+f53QyET5eSm0COrVCKoZUujwq58XWHqkr8QfC1NMRwGUpWD6tBXntyFy6t9hgIR
         1a2is9xc8G/i35WOIu2ILF+fHtYV0ItHn0FVhH1vqlk4vOgbCW6g0GnIq5CJT4MNQjLp
         f8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        fh=V20HMceS8CjDuoH9rZOKcEtNk4nj7uNEksWZ4EMRlaE=;
        b=PmRs2zgPkOBNRfY8ss+O29YhyRUc1AEyDzjAntW4EYacZfGuCH3cQ1jeWLY28VmUsk
         27mBtsWpCxBvwNewZS24s9nUncv7zbRr/WqOOWksb0H8wZKQy78ib7kDVYXW26ANpXa6
         y5tHlZzSiiWzp/gFkqoMeprS8y2hv/j7eCoaxB1VFXYVAwwghxtal7Laiik/s+p9NXJU
         uME1GcY5XcG66SLZlezF4vL7+5GVVIKJeqA2Kg6Q8wnrOyob8PyrsnhdRwgrtW0XJwL4
         nj//awRyK37rXSbF2mz5/JqEdMzcQjI/g96QiQAN1mabgJdNEcUoOnRMFdD8T5ASocby
         C8aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197856; x=1794802656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        b=PmSN4ObZyYPLpgkLPob3BwxwnjhSSVKm6R4cgQb949Q/3+WwiXY3ZLG4e9hWWLi/9i
         jjMDRJMsyYXPFhPouQqoxSM5R1SdITIPKdU5G17DrnXMpFhT0BEoz7yV4jGeUndhqEbK
         A5oD0TgnUtevbcbdl+X6a6drvERlZQUaetOig8Pw/zuZFNbfOpsVbJFwjjeXw0PVOQdz
         r2CFmSAt4CB96uopyN2+LyaE/g/8eh1WYvK7qoZuWL3hTY7TuWxYXC0rAzpP+/Z0J5uD
         AeznEtoSkPaz8GMYkamMZORPU8DuLMZ5w54cJyxhAqviPtqqigmjejH6S+br6KiejkWM
         uV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197856; x=1794802656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoqW5deJGeRyx4LL4mvcaMizyiaP0FzBVvAer8RqNLI=;
        b=Mbq3Z+VGdbLVEY7DJ5luDvzbNvZoUSYpNAWnZa9vO/R4vRPA2GwvQ/d3T1nwZX7C/4
         uMTyvMlfP/mc+vCQXLue8M0vX/6PedM/8NECmpI7YR5ENeaxDuf6THctPHsqK3s/jShb
         +djUUpk++l6QPBVIY0+japK333La/f8ImH7SGzjj4+yERz3BhNI0tA4fN+ZoXcGiwTHc
         +/4biTOSiX44D6spLEpb52Dn5KhnzsWRAB/J+OJikoQd87CB2Aa1OYsNOdQu4RgLVVO/
         l1ysWz+i9wi7Cf2SBnSdZou/svvdYZzryrbRuD0XJkMc9BhwPsSmXtgoEDHE6O1VfIo2
         5mkQ==
X-Forwarded-Encrypted: i=1; AL+hErHsTgqdmljnZnOEXy798uhKZfTvnvYVau4D+u45jaX0FWRNqx/jdMstB28RGvM8ormG8mpWIpSTearQdoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oGERBbGXs1okpJS6GvQVpUBGYUaWi+o+bwSZtq3e5gXdU5q09
	qZJjUFaACJgDwj+PMSLW+KeadMddKETdQy4LakoyI3QmrbVXlwXGq1aD2GhtxJnB8yLThZM5Vul
	Dpdpha2aT3F5PTo0zjIIPcVrHd+FaBjk=
X-Gm-Gg: AYBFou0C1aBSOiK6bI9RwO6C42oN+IEOT6twfXKkXTgW5NiGfInrC3Qw2ITl+kw9JmM
	y/aByFe6kmtvC7bzxMOWKHCYdL4DIZjobEytr3KIzl/Mj5xwfOjimErNnT8QscUzvYhHh5Sg61/
	x4zj6/xch/Yw0+cmhhO6ORV1LbExz9W6TpBk9jyawHCsU19cA7j0gfEaoKEqHFqBlvoF5k4SjgI
	iP6v58zdNhUT4AdHznEQGwO8TnRII4zI8HH+sHQIO0RR50ETfg4emvrvq3qRs8iF5li7KRlyw+L
	EZ8n46QQfyQ8tIvGEXsCW/f/qr5udIqoUomLBvllNswBZ6DwO7JOYX3nMCgg946D5gn3VFdbECq
	xcinAEXDOBXfZL2RQNFMl+XfZRyafeQZItxIguzaWzT1MnrAItnigxb8ruwp7kLlBsig=
X-Received: by 2002:a17:907:6d1f:b0:c31:7495:e5b with SMTP id
 a640c23a62f3a-c4d6d4a3b57mr182492066b.10.1794197856252; Sun, 08 Nov 2026
 20:17:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003080927.430719-1-yaojiale02@163.com>
In-Reply-To: <20261003080927.430719-1-yaojiale02@163.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 9 Nov 2026 13:17:00 +0900
X-Gm-Features: AclHuK_-J55s4cWgSUjxGa52TLLl1osPNTJb75kFDeEkQ09-Bw0YuPtbJyTYZXU
Message-ID: <CAAQKjZM991J2BoFkqnsyP35Lv91FYmmdpN93vqRVxRsTV-pu8A@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: handle runtime resume failure for DP clock
To: Jiale Yao <yaojiale02@163.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI,

2026=EB=85=84 10=EC=9B=94 3=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 5:13, J=
iale Yao <yaojiale02@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> fimd_dp_clock_enable() ignores runtime resume failures and still writes
> the DP clock register and updates dp_clk_enabled. This can access an
> unavailable device, record a state that was not applied to hardware,
> and later drop a runtime PM reference that was never acquired.
>
> Return without changing the clock state when runtime resume fails.
>
> Fixes: 5d91394f2361 ("drm/exynos: fimd: Guard display clock control with =
runtime PM calls")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/e=
xynos/exynos_drm_fimd.c
> index b6abdc4f2b0a..ea2b961f0cbc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -1049,12 +1049,18 @@ static void fimd_dp_clock_enable(struct exynos_dr=
m_clk *clk, bool enable)
>         struct fimd_context *ctx =3D container_of(clk, struct fimd_contex=
t,
>                                                 dp_clk);
>         u32 val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
> +       int ret;
>
>         if (enable =3D=3D ctx->dp_clk_enabled)
>                 return;
>
> -       if (enable)
> -               pm_runtime_resume_and_get(ctx->dev);
> +       if (enable) {
> +               ret =3D pm_runtime_resume_and_get(ctx->dev);
> +               if (ret < 0) {
> +                       dev_warn(ctx->dev, "failed to enable FIMD device:=
 %d\n", ret);
> +                       return;
> +               }
> +       }

The early return on runtime resume failure avoids accessing the FIMD
register while the device is unavailable. It also leaves
dp_clk_enabled unchanged, so a later disable will not drop a PM
reference that was never acquired. The change looks good to me.
Merged.

Thanks,
Inki Dae

>
>         ctx->dp_clk_enabled =3D enable;
>         writel(val, ctx->regs + DP_MIE_CLKCON);
> --
> 2.34.1
>
>
