Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481544C2242
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951572; cv=pass; b=nha/xIyifRFyUqBVv9J9hkUAg1F4y5WWlXtFKHfxiFsu5gkKXBJdwU0yILFPFnJiOLUz1G/U0MEg2GyOublve61xZvMM7s2HdS4OeE8fW1bL+p29w+DCL5tJRaF8+9EB7b9KRfrDFeoDDlAH9+CsN6RaWsq7jL1Pq3/D7P9MCoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951572; c=relaxed/simple;
	bh=bZmAl6ztxWgtImD9IPg8gArzLJy06elWJ/9P6bULdpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udGfzAbUjWPFgjBYxTWkFCxktZqopiBKsm/ykxkBI+U2f1IMaTTnzqoFft/yFKdsu1vVvDOa4uJBeMSLDzl01xuLbXwnCCpowT1Cs1HnX3RaCuFSbz+Vi34WlMjyUU4z0f/tZh43AzsVvnDY7Zq0VoE4Jl6Dj8sIOdZLCEyeqrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ql6oXgmJ; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ql6oXgmJ"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so4523268a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951569; cv=none;
        d=google.com; s=arc-20260327;
        b=CLxFXGM9uxYPTNK9FL+GWwBhUQ/MLrqghERfmyyrOOMG81kP+VdhKVU6afSBdQpfvT
         SVAbLxrkairh+z9mED4dbjrhNbGzTqgrlz69jZ0BLLbw5QVDfwBHy1Ub9Wvbg9HEBkel
         m7PYPttbsAA5asAgCsLtWW8FmqXah3oG4bgS1ZpfZr9DgkKfjH01+fHEMdi6Uykq9DHA
         8afSls/gFt16sMcio0XLLcRUOxxQVr3nVDXbYc4BW9sLZTcLWdjFqsQxN41EGamGyByG
         XgzjAb+GBMsepXc6ZCTfle5XhQSSuzfhDlOjiXrPt8FJqk4Nvpysuf/nquPLRMmKzXog
         FC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        fh=fAmCmaa1+Q7ZhUEG3GGsg86+6mMbJVrgwXJh+YZzxUs=;
        b=RvGcb5nPBDS7JykM1KR496y61MoqkJxr8Kr41ODxKIo1SMwEX5Na//0q8t45PvRNM3
         FC5sXU9XRsZbu5ws/4Z2vgL8IsCNrU12OrLZk1agNBXIZOplPF24hw+vuKXyBratTKZl
         abkASrkLaePgLbSATKbuQsezkTd/HArrEEW/v1xNqSkpnUqaw19SCrE83T3fZ54lCHdH
         YoPWCC34iZSkwtakKbeJWia000qyD4F/rvyoEsEwFhJgsGwiFehfEKoi7q7k2BStBRr5
         GWlyn9LQ4TrBYMinpCmxZEF12QEvCM17vNs1iH+ZneRfExhIpbLHm7rcsFWvhZpor8HE
         XFNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951569; x=1791556369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=ql6oXgmJM9iQfN4Vl6JClWkyeDmHrS99BDRebg3wSUSBZ/4Icllt0SjezxKw9fEXP8
         i7rYiI9wU06tpHB1bSFmznJUzwjUir5yHQGypE0QOWL+SPF0x4aulwQh76qe2MyVCFlb
         Zq4c6VcWPj2RRIqMCVDkcnQjKN8suo3g2TlWoVt2GgukMCkh0/JHJqcvzw6rNIoaXcO7
         zYYMf+8pwFF2WTrZPxYCHogXKW42s0mb8FX5FtPN0VkbP71r91+c3MaDYhAVbtNAWP5d
         9vmUYNTz1jlgAsyEKZ/uM/g9IbN/5sgElzuk4zUwFv4F4Ebh/GYLHPeuKDfv8i6Y/3Jn
         ZSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951569; x=1791556369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=gWxbBLF+UBHtO4pnofrReh+5VNHoEDwDhH1cE8ga8I+k/2o0elQvpV3Zck/E+UZYhx
         +SqKfAgEI+1SeQWgVPxsWVXyNzmW7fOkEs0RwDu3tLlWVazXNsb/vIuPa0aO/azF91bB
         4lrNeTsYuF2bIwBQq8yLURun44mLW32A5so7jkgr208FolHQzqP56vk4Hz0YicUYnosr
         paQ0PyWmcQBbdLPMC04oCVVojrTipz3qMcUafiAGjWzKmLv4cwg2ATi/8bUZm+TVEjV7
         X065Lq4OWmmXeLjOpIKFxnXmv33hOQjo+dez68UZ1+OmYQHNXxDIIUVgltEqvo3UgzN2
         2uHg==
X-Forwarded-Encrypted: i=1; AKwUvBw6rK/XXSl3FmCFRfy0ST0D7DFLvXAq5ktEVe1b0rLYvdKoHmLsvB3r0IS8Md258muMKPhtutXTUBdp13U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIreUIZhUPZrPdG9k0AoxrbN2PdYWWbKC19mhE6QSDEs/N/6kEq
	wVnUVssmNCkBH+35HNU9LWQZ4V4fk3qyEOKOKaPW0kNR6A39Wdm6sXcM2c1BM7VlaUzJ0wtfCaf
	FjD7EhP+Vjjl3lI1Q5pM1IeYkK8/rx6nAc51YCaPbjA==
X-Gm-Gg: AYBFou3L/Gh5zJiY96/xBqfWue/jqSo70Oz1+OFUV8QT0c9f0/ilkgQFupQo2r40Z+R
	W46XExd8d+dhIDUzMHn1bQtNBZBgYakyhJGRbp8vPUcYo8AqDWbiB504QuES+lhSldUx+EmD6/y
	A0Qbo2pI0SHlpI4JX1abO+Qr3dRso2Q23zwPHq5BjOPyRhazYJoiXyRvhqqXsERuPKbBNtchxL2
	UTBLaraZ3VMsQEAjYwUjLfc3R/eygSMG0zUl/7+tfpAhK6ywEHQ1U5fN0wAgGJNvSrixP5w0R8D
	da71+J9zX58d0hXytyX6yIOIQsz+K1DrjcSBVFxkGGeWX3jm+F9xF5ulmUPpquezx6QoIcLXs4P
	jb6uGQTXmightgg==
X-Received: by 2002:a05:6402:27c9:b0:6af:9dd5:f524 with SMTP id
 4fb4d7f45d1cf-6af9e312059mr1764408a12.37.1790951569540; Fri, 02 Oct 2026
 07:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:32:38 +0100
X-Gm-Features: AclHuK8RgbuTKFPwHvZ2diSbOtgklcZExTKeCVUevkgRzFlX0CzGjFVcTRb15lQ
Message-ID: <CADrjBPpOcpgLeRBYaf=RtLecjBEWK32icf8DcY5d1F4GQJ=WVg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: exynos850: add ADC node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 04:09, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
> Add DT node that describes it.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..eb87225a756b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -355,6 +355,16 @@ cmu_cmgp: clock-controller@11c00000 {
>                         clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
>                 };
>
> +               exynos_adc: adc@11c40000 {
> +                       compatible = "samsung,exynos850-adc";
> +                       reg = <0x11c40000 0x100>;
> +                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +                       #io-channel-cells = <1>;
> +                       clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
> +                       clock-names = "adc";
> +                       status = "disabled";
> +               };
> +
>                 cmu_core: clock-controller@12000000 {
>                         compatible = "samsung,exynos850-cmu-core";
>                         reg = <0x12000000 0x8000>;
>
> --
> 2.51.0
>
