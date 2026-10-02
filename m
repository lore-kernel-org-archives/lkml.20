Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879DB379C4A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944917; cv=pass; b=aUOWO+cr9P+dSpYbjE08d+r5pamJPkfRiI/lEKHZwpF30geEzYz4AAOiTJugq78ns+9OooUIaRSFCtNsrYunt11tlTPH3MyYEaGRexoRovTAcLHxIScBBTw2vGlEbiGN5l2ZdG0Khos9184Xjl2YgvHcZoQUGwMMMLC+I1heM/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944917; c=relaxed/simple;
	bh=ReEVztyiOkfCn3qjc+8FH6TucXrc4+FPvzJFCPedxsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaMEJte9Vrj2/o+mKFuqHKN+i/Yn5t5NmEE9OV/cr7RfkdQI+3e62nRt+3WLRfarQOGX1DUzpSrzWFDpNS3Gr78PQgQDpoNIazzbT8Rv0865iYvX6Ib0ko5b/MYDcDxCRfO2qH3kYnRkUQUiUNeeU8I5h1j5mrp3EHP/3oGmV5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjlpyWRk; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjlpyWRk"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6af9e2ecfbcso946007a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790944913; cv=none;
        d=google.com; s=arc-20260327;
        b=ZRYoQxWRm4+S24I2vtRpzF2XaI4pMlLDu7BeHmrQasMJST6HqNNOCw3UxcwyrqJQKM
         AMtNGtzMkAszzmg9Dxoom8v6kpnjPmtyNmE7dbh1ISVrWKZEuYuDNp8UlNYYRbn3ik/n
         mjJDamVDmZ4VjERe1+A2iY9o8GFS9IwBDiS7+prqmp8YwPzEWA5v5a21+sHqFNzUy9KD
         E3fqVbNDfcgh+nZdv2qduvqWGz7Ea8RMzAkW4gxmaULE6AC92eXWGjIfLBQ8rG444vKg
         xEJXl/4F3DM5l8v1LuKugPTVzrLaBE299lGF3iCoysXeHKljLi3y7RYCIfbqSMXYB7ik
         RcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        fh=B9ho6iLBFhu15jDXMSzMMzkycvO0An7fmtcgvRoLi2Y=;
        b=CFzEyXYRXgDotG1dXtneIVkwZWIF09elzwdpahHnCw0BSzBPkRpsfc3t9WEFRWo6tm
         ziQ2P4ScKsSLgiDkkReb6ysmpfHvJ/ygjNFympwmMgzeCemVHlZbZFQSM7qVZ/jOJpFL
         0ViKoyqvR2gUMgy51QsgKGV2km0J3cMVboJQBfklNqer0Q/slc0ZyBH8S8d17Qd5an2Q
         OXyk1t8t48EAUjJ+DvXxkvKZnNKQRYDv1okPKUmzQCnGdsDKnSJWonqXRqFCbrwiWVph
         cF4N7y7lM8thsxOONZV26ZsiHrZ3uumD0qpXf+mSNfukn+MtI63j1KsrpKw5MQiKtBfa
         InIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790944913; x=1791549713; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=vjlpyWRkZCPBNxjAqMUuYusyAC6TId2L+XvQXhfT2MkCFw+e9pyd0tamIyAax8t7xX
         C4MUcG728fTJmuEagPY+cGH1qKOHh0ZFd4JApdus+7cJOPwQbuzhLy0A8m9e1JFX6ngw
         URErfVHA5TP1nPDVE8QLTrl0HhAiVRwnYedXrmgBifNxUPD7D1/0Lrth4PyIzRwSu6Vy
         Ft6lU+oKpzugzc0Rx6rFXXPt9spBPjRl59pTSWc8uJGszWFHGrtou/g3rBYVd4Pzn2QV
         bN5E6NDbVnNF2h6DNbSwgEq/mNHJHx22OO59/09F26+B2E3dovzXKMoVALH7Ds3bJyEG
         dBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944913; x=1791549713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=AOsosMHpuSgxKZFLMnreH+qQ6y6NkM9dGE/SVMoLwZcX7N77oUH5cF0MUpf5/Ctdpe
         yGZyZ5udtRt0FoZRquzMN5bGtryn9VBQAcxCNkyFWGx3oBxlxuHsAh/dOE/kwGLuhIEU
         +OaHLm8K6XqmKkMKjBXx+L0IP+UGk3bE76OqeSK+vD9Qrfk8U8niNHbwAYgDMIwP+azJ
         iUZ9dggZWQiBUVr4iB8m7zzYtRrq+i8HaUHHQgEu0jqg0zj112Xh8iMs86K1tXCsqMjS
         xoIxmg8vD2CH+AaqRV77x3dnWAgMfj41ETjh6bVXxeEwos0iar7cfPHA/SMwOg5FoNyw
         bWIA==
X-Forwarded-Encrypted: i=1; AKwUvBzAtUDuTC1iSwHMigemVwBNJXwI9dLXstp5v6UigLRi+nb3FkeqPUwIjN62oO/MsO2/3mR2gnX6/vxz/tU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRjfBe2WQmUaDJh3sCm7FByAI8qowlXy+WzFcDUMCW329UCMR8
	EFT9b+adaqXg2qAWD989iQZiXmcZSJ8/0dehrgqjYK+r46zIx8E9W6aObHxsQXg59TiBi4LrLDJ
	hYq1jW2gLzG3+Ai4v/OiazEqbY9D35e3KfhEQaDAk1Q==
X-Gm-Gg: AYBFou1MJoRxUYFtgWf/lo0OKvJ7Qb/NMCB3BhX0ZrTYZNUheirIup8bMA4LizN3gmV
	C1EYsiNSrazSTadHXbyofHiUvSzls20S/GUUdz8VKRXtSHCny4xaZiPY7NPzqSWatkhWD21jc60
	xm3C/OhpaqyYqGTPED2O7kySVuzIQOWaV/USYC11fqGZ1AsLRVFaOpV6YBD9oR6oWMlSanVD7kp
	KrRtbApsNhbxFRUDoBEd1On6bvycklq8SCBoVr1vV3pw75kehCLwAAld7ezi+AGdaYFNB20Yg4d
	ZLFknBRNi2ZRzmT9o21MwNTHQZ1LcyLYTUzdQtEeuEIJwn6giUsiGlp+OzLtKucGbjdO1aP945g
	0N75Pr8GqQ5Dtvw==
X-Received: by 2002:a05:6402:5113:b0:6aa:f1d2:ddbf with SMTP id
 4fb4d7f45d1cf-6af9e335ebemr1728168a12.35.1790944912779; Fri, 02 Oct 2026
 05:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org> <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 13:41:41 +0100
X-Gm-Features: AclHuK_QyQlit6GQkvv90porbL6_8NAwZ9GwGxUXMwJD_qPCIZbSMtNOl5zyftM
Message-ID: <CADrjBPrm0o5scen0vk2ZiCzGW6kdTWsciPvA9K7JW_yb+Mp8PA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler <henrik@grimler.se>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 30 Sept 2026 at 01:13, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..803fc127d895 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
>                 pmu_system_controller: system-controller@11860000 {
>                         compatible = "samsung,exynos850-pmu", "syscon";
>                         reg = <0x11860000 0x10000>;
> +                       google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
>
>                         poweroff: syscon-poweroff {
>                                 compatible = "syscon-poweroff";
> @@ -248,6 +249,11 @@ reboot: syscon-reboot {
>                         };
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };
> +

Since you are now creating your own custom regmap in exynos-pmu you
should drop the syscon compatible here. That should avoid syscon.c
ever creating an MMIO regmap (with the wrong spinlock). I've copied
some of the commit text from my commit
a21d38b5e209c60e73f81e467cc53ad57b5d4080 below for the rationale
behind this.

   arm64: dts: exynos: gs101: remove syscon compatible from pmu node

    Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
    "syscon" compatible") it is possible to register a regmap without the
    syscon compatible in the node.

    As mentioned in that commit, it's not correct to claim we are compatible
    with syscon, as a MMIO regmap created by syscon won't work. Removing the
    syscon compatible means syscon driver won't ever create a mmio regmap.

    Note this isn't usually an issue today as exynos-pmu runs at an early
    initcall so the custom regmap will have been registered first. However
    changes proposed in [1] will bring -EPROBE_DEFER support to syscon allowing
    this mechanism to be more robust, especially in highly modularized systems.

    Technically this is a ABI break but no other platforms are
    affected. Additionally (with the benefit of hindsight) a MMIO syscon has
    never worked for PMU register writes, thus the ABI break is justified.

    Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]

Thanks,

Peter
