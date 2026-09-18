Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8794FDA5A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744173; cv=pass; b=LS//fZjcNz7KUYOai8jsHzmGg7ZpZ5AsbE8Ix5+0QKbqUcXHq/SO3/s8U/pM9J3SVpLm0ZKv4qdN8/SFPNMQ8C/hdZM0T2zEtzjL2NtO5vRwd7iQuQh6hKP4bg//mlFBBww8piVhtvMCc6NWL0BWxFcEIKJBQ9UDwa0IOIgxh04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744173; c=relaxed/simple;
	bh=Zy64POVp3cHToa/Y34iX2wiBVKCmqoeRskHAltBrV9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bd0BDozumCvF9CIBAjAInPCSBTlcU//j+VuOc2m3s9kO9x7V0P4v2OifT2MK4t/RJ/HuqdOmcL8xVIdKPTaHGdxNUdxcYdcqf9pObSPKLYAkENvoMPf2Viep629y7LHbTvQLo/ON/mfqVIqUgOocTT4yCiQJ3bmfUlZl6uT+9D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSXchQP4; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSXchQP4"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b4ed2so449618241.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789744168; cv=none;
        d=google.com; s=arc-20260327;
        b=BjuBcUqcfvPv+t+ELPNj6FRjRo1J4bSnyDaOS/1A7clKYrjxxl1+oXUfb/8FYbJqRc
         zB8tDjaIrHkSqPAwp1/ocWIeBetvaxTjTeCVWdkj/tSjU6SILYgYdfu8F85rSKYAlkxS
         Iw47ilD6aKF8eaEJW0nCCVWpxDHU1/yqQGAdTwTg/D21sz9wAZUsCHwWDjaKPI7FZFBr
         yKzQ5A0BCACDcJD8LIQk/gmfEYsrNQxZT1G3hnLirEil9fI229jf7wBnmQfoudabsc15
         NTJyTgi4zFIqEykfC0qUAAaOm4+RaxqgK1KqDhhL6XEXgfD26AV/bg8ae6uEq8P+Ghsw
         QM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        fh=czhvaZtBl/kpkEZ/ViGW0KZ4mzKD4EeL0dE5EUs707Y=;
        b=lNY7W5EnfIXGJp5uQ3Th7Um9bhCVCg8s/1C6zMi6CJ9aJhQ1GJwypanXaC+kJPXmQT
         3Ea0UHOyPV8DXB7bpQYYhq8M12SsyXW2ShhXeL5We+JLvTA935wb/k4PWpwuPsoabCBl
         yZSgpUBE3A63+YcGBVC/Zs59TyNxxouKIriyrC8oQHwHtSeiVfdLq0kAfKfRHEC3n4th
         YvaUn2HNZ9oSWdEcfUCzrLDF3V38iKYJcCbawdxj/qpUsuI4Gs0Y4rIRHkezN6uKPVKh
         oGy9ekldDTNYrQ+Qi5+FOGHRQ/p6Nz+Z+mxS9YEJdJxG/BxO1vfPyrjXYIDmQ2Gv0smu
         elrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789744168; x=1790348968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=vSXchQP4kSDNl1xzfV7H8dpr9ng4g/JBcRXwjGNQ5zst+1xWLMkGX1HJdharDV698B
         mM7iKVrFaZJg4qO4ajJHvsVmADHPdFjUCRpczL0XO4vzCTrfba7vkyZ+y4aUUl88ZbUi
         bRAjUUxc31R9glBztAvmfuW+3AyzqUcFNjkOwg845c+//f4CeNwUhyZhqrCBPKoUjuvE
         AeznNSjiloxhU84OfHYKw2tJxWF+6Jf1SHaSl8Ra/vmq7at+FVfC2msrlCpPbICRKAdX
         uSfzlN8cIaqH3GiEOdhaaCkyg1L6F2XG/jXvr98ZGzfHMvR5xwxNwtpU5/TxL+tJRBvR
         +U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744168; x=1790348968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=cWThvNGkQqIwoBMoa5yI7ELXt5J7O6SD9RmhkIG/zLm+pa+9e+vlw4fQqUntVMde53
         3Lq2Erp4FNfkkXmnSX5xYODWZPX/4KZ9A1spbZfQsjXbJhPIMYYebyUvHPwrngdP+2Ms
         KkWzVUn60cbLGUiB8nZKl4bDvMZBkDmVOANdHB0Lrjh/uQDRJq7lwEAL+nK1xoVbS4fy
         lGMJmBqz6U5U/xPrMG+z5X3kh9r56Rk5/EU4vu7RUlRQznPv8JLINeeZTrtpKFlaghvi
         mjjL5P3I7VDuxeC9pt2ts03K1Yo3AEhZcrAlObWB+V0h56+vOl3GzPT5TYiUwKxpOIGS
         yWwg==
X-Forwarded-Encrypted: i=1; AKwUvBzKO7K6Jcx+JXFLVC7D83QuXg8P33nZ9Td8amOCPuk9eJsITNX6AjpwT/h/xjyBovbsn6WihfygqN2nKEI=@vger.kernel.org
X-Gm-Message-State: AFuF++lEfE7tPV1R+T6oyXi6mesFVxtCin80TiKOYGONUhZ0kSXQWxsD
	s2/omRdPInMLFgub743mgwbsp5AMaU3OkhGE8Pu/E/3mU0eaPHP5EjIpemg/HQTF7tJedhz/K6g
	TshOfW66dEsC3XRGvn3we2+M8p4OsXyjhtK5+4C9SLw==
X-Gm-Gg: AYBFou243N7Z2Blr7ivyjqWO9J+xydnlq00XTEJp5z0zndUvSzraAFmtJtbFuW4Ro1z
	+FXgOIFspE8VUw0DRgREqBgp6idEL5F6WxvSEBn4GJdhZD66ti6dX8UXQdvbfc89LUdlQF24bZ+
	bQeh0gNdF5EZZgpo03jKq8dcBMIWsipbmMpQrTbRlEi+DIo628dblySIhjOD1iT0sxJlKr7w7jR
	SmdD8/WYeAsRPqNDprWE9eK94Y7XizN77ETvh8R10uuX4RDPi6C3hHxU08C8bAF4hF9ExWAuQrC
	QZhanBOMdt6OseKr3A+t3DAwz+XCRv0/UCM0a51WcEChePxdVZH5XN4HsXWeGwS1AKZhNVLp+0Y
	4tsbJuavyKXiSK1BmP7P6UNVO
X-Received: by 2002:a05:6122:d89:b0:5c9:a60b:e5af with SMTP id
 71dfb90a1353d-5c9b59d5fedmr1460675e0c.17.1789744168196; Fri, 18 Sep 2026
 08:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
In-Reply-To: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 16:09:15 +0100
X-Gm-Features: AcwNN1WbCgmZ6KBoleiDGX2IyJqTG4BFE69tG3w6kSQzgb-TPyozGD3DKfdtb2Y
Message-ID: <CADrjBPosa6tyVCrEh9vsUoba9tWBbqa-kG2emcu+L1t48QmjSw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: gs101: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 11:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - All other patches in the series have been applied,
>
> v2:
>   - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
>     EL2 virtual timer interrupt") in soc/for-next.
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index bfceea5486f46686..9e17f36e1fbb7ce2 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts =
> -                  <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
> +                  <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
>         };
>  };
>
> --
> 2.43.0
>
