Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792956208;
	b=N6mMuRfST6syM8IwrJOFn9VlL/K8tAIgXEWUMcAMjr+wLtRDfHtnoxU3lULoPCrpgQUJ
	 kVGrcOQa+kwqLwZEoob32zGPMIJkg4cDU6tD4sNQfcfuQZoVgYON8LeFTzgF9kKJu2nvD
	 QpTK7Acvf1UFQd7HfV6dfrwpsg/k+/rKeMObUH3vNQyQlJ2IlcmZfq/p0tY0704kKsqFs
	 ZZIDyMVersr0lNsuFhYxrO2oCCG/VngiaVP4/BdIrFUowxyllsDPH8AKgBttipWuV6DoS
	 3Syodw0vS8Gu5j1WX3XVV/Y2t/DleGh0vziLt2hNj5V5OOnkpGZqkHGO/qvw2lJLDZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
	b=LIkbA/fvOiQ9447NMSRFfaNctMbKflPZjzooNyjWE81f3gaoWE6FkVaRmFp0xMgRCtYe
	 I49FsVpdudLAAlZSRo5ElHH7MlhX5ZNdTUGEtkcWF8P9ASYYW9Pc7JvsqJxFMiUun5LPa
	 7388aZh4XMDnUriyf5v/yJCI8Us52deu8Ak8EVqdxgmThOqKljuB0DrLWcEgLb+SpYH/l
	 lhYOLFiDZTfXokaypxc1R5VvW1QrU4Nj4Lrv5yysxAcZQRr0yCFOWaFikdTYRh0srdW04
	 y5ASNJ2MpzmaZ+eys1bPIr6W3SlYMJfex/Off4IUfK9iplU/L1ePE+ZMXnuwsDz4qIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QPCc7BEq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC0606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3EC0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QPCc7BEq
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so3752034eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792956207; cv=none;
        d=google.com; s=arc-20260327;
        b=H1W01ITI/P51JfjYLITLn0qkgbh1jJnygN0qQLTmNT21K6o79RHnuee4iRH2qq8y5l
         BlNR4ljO5ZJKuSkqU3HbIAicmPxz5oPIeUPiJdyiH94Woi3rM3ASN6FjfOPlDpaHXRkF
         tu4FgrqFwqRMpFBH6AY+RPLmL36aOIUbL5iExXVfeStmme/nt/QVy8kJeEln0T8HbNpT
         sKHRGGCpPWOMDdoEKBH26iYIqHkU2RinQzkUFYagtpspSRBzu4RE8266maJ0uREFt8Zw
         LW1pSUJDyh2fd46vqF9ujMFs1EOWamSz8EpVQ5sYI3YOBeTC7VWIFINVFtikECk8Ymvv
         13Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
        fh=g+NPvj/Feoi5/bz3A3yNnE1PeAf/LLCinUcnpRrYYLc=;
        b=kadGkYDL8K/uu08HX4jZYzVqktJGqnUGpSejEHO5t3YUeqGjyXiBJq6DvVMDNtaFTy
         2VaA+WhP1iMSZutrByBOOpJaEIEwvAyPdV+FCyS9IXWjX5eD68FYEfCHitg+ysPcwCEK
         zHtefx5W57kS4v9wCYRJjPcA4h38hMWeW3Tu3MnEg2fKLbWsBhjC9631BBsWI759hneU
         brI+fUDWCWKdv0/iQsjGpbp1TUoA3SNZgLPll3FeDbA9FEheO2tP1dEJH0u06azYptJF
         L4jLbbX1tbZlh4bC95X2rRl74npdsEH9HofmTERQcligiPEQdXF9oMWVC8WjmDW5BmZb
         xdFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792956207; x=1793561007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
        b=QPCc7BEq9KXx2y/RIsLKfcRLZMdo3brn6SPmqADoaghTlwyYv67/UtolSB7jN/kEr4
         SA+2K6yxCogZR1KfJ+V0Gp3NdHOsFH2ZDZbvyrpfFmjFe9j1cBYG6okCnw6ai/zZO+Og
         zoN2Vr7pNicuXETdyO5ubLqU3VBQsF/8Zer7/bzH4lzljsnso2cRqUyAhiqkBsYz6KwH
         oVG0pvppS6H2Pt+/jKjUz0yWp7y1ZF/mNzRa2QWclXnTqWT4BxyBa/TWteQycrzvvNbk
         OAjToHiZDnmqJTLgdtf45FfBcGoK1VTbRDN6PAHGswtWfjqTlVTT3Zchrdj1PspfS6yV
         bpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792956207; x=1793561007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEEx0Z8e0R8jOgmV0CzML93QklpW+Wd99NpO3WBEWOI=;
        b=br584xbmXT3K1WvAzEu7lMBqkUgxhwLrSg4U9JvhWFgcFAJqSuD44Ym5YhAvJYYbT1
         AW8hyHOB0Z3vktA7ePmlis36oqi1afi3DJ0kevJn3jSYBYagche86lnM4dJio+voxgna
         aoOLJm3ASMfoziA8vKBIjB0UNhEnaTb01rBbSbUffYnXFBzdkEK+oQSve00mAusn0Uqs
         FJap5hkP20fp4KK5d0P2c5rlkp9iUn4+F9LjHOflnWwSZxgj86Fcsex6ShPjVq8GjeFM
         qNyjzajwwuX6nhHnZKVotvOxkE+P9HbDMzHRB4dTHbClPrZOJpvwex+OpXHVpCHJDGOL
         HyTQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/KDso0cok7OoQsvd0BOxzYttR27c7DGqEivR/UvuN9ZgLPi7rIcmYSphX6X6Hhjah2pbeG3SRHBXFt3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLMjoZ3U8GzKeqVSDmtpFfCtTD/u8QWpYl/WtFEkSuJWbLR1Ez
	DoJwnSj8eAP0x3gZLwaF6HhPbZDGyuRVMaraynGBRAc7le50oBV3yi0kd69KvTuP1DcF3W/kG3q
	LoGQv73Lqxm+YgoBKdVFrWw2Umtq8SXU=
X-Gm-Gg: AYBFou1W7Ri8dxpJ4MDy8a6jJpCMO9mfvyxCxl9HuorpgTGUhA5U7O4lGmR69o72R1V
	7A0B5jAULuKvHhWxJhFWcE4pq05dWJg8FuKe+NukzwKMe3K+9tr07CvM1ASm4nZc9X0oB4RxJ7J
	4brn2kV/7yysIgqw57f8hF8dGIsTh7sOk1241kK2+y2WXNDv1GnRj/TZCd5/laDqiTt7gzsZM6I
	KGrKSeqQVpcgsZJ1yVyVKnnvRClmmNjxP+j2J4EHiwvoCOZpg7cOB1q2fG0uPTUQKMB4RoZ12Ah
	aUqPE3PSl79GM1btXQunhZTwNlrqs93VYmiFP1KO5jWLMfoI4qlr0rWoncRLYnf5LP0BMfAx+Nx
	K/HF2BHrSRiSY8On4w2qzoWLT4mNhiCPW2L911q31aem12uIl8A7/HUGjvj+h2ZTpWDV4WQ==
X-Received: by 2002:a05:693c:20c7:20b0:366:83dd:4713 with SMTP id
 5a478bee46e88-369e84a7306mr6781233eec.30.1792956207049; Sun, 25 Oct 2026
 12:23:27 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-upstream-host1x-mipi-clk-v1-1-6bc6e755b4cb@tsv-stahl-riesa.de>
In-Reply-To: <20261025-upstream-host1x-mipi-clk-v1-1-6bc6e755b4cb@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 21:23:15 +0200
X-Gm-Features: AclHuK-K26bDtKlF8TK70dmoPQF0DUHOztv0f_rqJCZ78HeF95UHjNUfbNmTXk4
Message-ID: <CAPVz0n2+Gbjm21Px-wexG6atRt=Pzi0VJ+fyK_EhKxV88Bj2Ew@mail.gmail.com>
Subject: Re: [PATCH] gpu: host1x: mipi: Disable clock again after powering
 down the pads
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:1=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> tegra114_mipi_power_down() enables the MIPI calibration clock to access
> the bias pad registers but never disables it. Every disable/enable cycle
> of a DSI or CSI user therefore leaks one enable count, and the clock
> stays on for good after the first power down.
>
> Add the missing clk_disable(), matching tegra114_mipi_power_up().
>
> The leak gets more costly with "clk: tegra: Fix Tegra114 MIPI
> calibration clock parent", which makes PLL_P_OUT3 the parent of
> mipi-cal: without this fix PLL_P_OUT3 would then stay on as well.
>
> On a Tegra Note 7 (P1640) the enable count of mipi-cal in clk_summary
> grew by one with each DPMS off/on cycle of the DSI panel. With this
> patch it returns to 0 after each cycle.
>
> Fixes: 15372d4be7f0 ("gpu: host1x: mipi: Power down regulators when unuse=
d")
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
> Mikko's "clk: tegra: Fix Tegra114 MIPI calibration clock parent" [1]
> fixes the MIPI calibration timeouts on Tegra114. While testing the same
> change on a Tegra Note 7 (P1640) I noticed that
> tegra114_mipi_power_down() leaks the clock enable it takes. With [1]
> applied that leak keeps PLL_P_OUT3 on after the first DPMS off, so the
> two belong together, although this patch applies and makes sense on
> its own.
>
> [1] https://lore.kernel.org/all/20260930-b4-dalmore-fixes-mipical-clk-v1-=
1-0518be6c7979@nvidia.com/
>
> Tool use (see Documentation/process/generated-content.rst): this patch,
> its changelog and this note were prepared with an LLM coding assistant
> (Claude Code). It traced the clock enable counts from my clk_summary
> dumps and wrote the code change and the texts from my measurements and
> instructions. I reviewed the change and ran the test on the device.
> ---
>  drivers/gpu/host1x/tegra114-mipi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegr=
a114-mipi.c
> index c084a09784d1..83a43a5e33af 100644
> --- a/drivers/gpu/host1x/tegra114-mipi.c
> +++ b/drivers/gpu/host1x/tegra114-mipi.c
> @@ -197,6 +197,8 @@ static int tegra114_mipi_power_down(struct tegra_mipi=
 *mipi)
>         value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
>         tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
>
> +       clk_disable(mipi->clk);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
> change-id: 20261025-upstream-host1x-mipi-clk-867edad177b0
>
> Best regards,
> --
> Patrick Fischer <admin@tsv-stahl-riesa.de>
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
