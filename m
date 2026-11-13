Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574910;
	b=BY1M8A/ESIQfZVWvKr1ZoFq8kGsG/G9G9AdXtwm5x/a8rq+1fTZpKjZpGEBf1jH5gKPO
	 AMDQttzbsfGj5ZUjxKIVuwBKbOfPbGX5h99zWgWCWwaX6asjy7TxYg3JOVSuZGoDzJC4d
	 5s26pWAvo6sKDnfafsL60yApneyvPD5VpvPw1x/xY4Fntry2DFHIebV5/oYZCjrbIiUz8
	 qWEGCOkJF43Ji6DCq88THOpMqfOOrawtVzXG1wIgfS/6xG+xrdb3FBhp6JEx6Wer2B+Vu
	 HB4onTNmUx+cjkLZuzk0LTfAliIXzYE/ltU0BtaFrHb0PMKphKFGAaIGq6JbsEo9Tog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
	b=m12yiLlEGTB2W647COFEr+6Gnec5nF4HzCMrDSRieiVit8x8OfFvxcEDWIGiz8vlDELz
	 nTu9CGHS8D83yCqP+iHBi3TUkPSjliT8zPP8Dq33umEAXqPWcBEhEdtuRpTNG6X06XHq+
	 Xq/Rt75rTcc7ASD+FILo5f9LQIVBhyzprg4eVGhBXwqP82XXgPF8wBsmHCQjZmLGAEhxH
	 ++BbRjQImzaoOvNx4Iy1EAbY47bcZSqY8FQhSCF1rQWeQ6elccisAkINaeo4+3tBthtK3
	 m3/XY+NKCOKqLRdzO64NQF9YahZn0CanLxja2B3bKEQVQv/OzUosqDRlbXs9W09pf5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB44606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB44606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so2066961a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574908; cv=none;
        d=google.com; s=arc-20260327;
        b=pCSbYgnDyWiCplIGQCZDkXa16E9cEUDkQUBeeYSp/hIE/Q07qu+Spu2IEf1to42+WZ
         OJroS8mv92Muufdf3qM3R/dMDSoryQ07rzRxUWUpVsRK+qYW2M8numC+wZolhqMla0fZ
         ckS0M/gmDfJJXjf3ea0cvUPfsCe2NKBh2Nypkl1QDJ5DuWd3gkBtVUJNNsLOoyKoBuOY
         QwYX/UTnmrjVU7VBt5EQiEnTJ23hDMKIvr0Gr6hMThhsZd2DRZlXS1UlwRiCbmHDWZko
         PhFRb8c20172a0msDElGkUG4Okdg0k70oWErCJ5pbmgtoZXTXIPb7pPhGblo6DXgipG5
         DHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        fh=wwnKJXeYmfwauklOQw98eAeE3ee4QLR0rN6878St9iQ=;
        b=mHxCkMXEyzWRtlDurdar7EQk8HL5Y6Vg9yEwuxab/GCgjyWhSygBJC14woodLa/G/C
         sajOB7MXVKIDRUxeDmdUUfNKL2UsGScdiwaRTBRREw4letTAXmqVMgve0hlGRi4LX4EA
         a5HcW3w4xv1jOi/PsJpNlqWtty9mBjen1I0y/CiFjHo2aUtg52xiP8sQCLcqrwKoylqz
         A/VMZ9+0a7QQgfJIihNCdMcvYJW4kSDdwyUrv7e7vFeNVpGIkWhIfFuifVQlic0Vi/i0
         RrSn3b1RkWvp6Qp0Vqh92WGsKAWwJ+yJmKDVJZEVTlIJNsk66s0if8RWj02+lhQaTgE1
         q30Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574908; x=1795179708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=Yg2aVHZMqVneHiwckm8fshswVKEjDDg3fGYweaRCKQ1LB9kEeHc6ZUBTWrZ5zrajdJ
         J3NPx7N1IBwiFn3kf/z+OWrivkdXO3HXB3dfv5rj+U4TIcjbk6cYVuzy+P2MV5ekJJwu
         8mbKTjvtDFhdMaPe73boK5BYZG2vc1ztHGioC7fHt9PF4VWSHzLLJGHNtTIXK4kQHSE8
         G/Q1J5GPEhayhXwyaqWCVR6Br9Mr5QQ4Iym9DA2hCmJbB2UfCfdQ/gNlywTUKQJ3Dmw2
         1GFDfHlzu1UeX+VxcENlq/ApQPoKOzw4Nqa86TH8RiHalCLTxsl1w6jY7JREjRcZ6tCg
         HZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574908; x=1795179708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=jOYRQ8eUBTk4O/NVE74zduvMMW6pR5rZzzUKZNXaXpaLbPNStP0gS2jrLq3FzNgBY5
         9XICK6Kfu/5pmaVl4NqLxysDlVny8Gli5CKe8rKD+w0lNoirFPc0bciwoKydtV2aA8kG
         z9fcJs1UWW2fWIBapbXZX+Ct9+kfyWN3hpbxVOdjOnySVLHc2vsAWkPo/iRXCquuZtLS
         0Ew68h7stGQ+eTiGl3+634GPs2pKUSanVO4cRVQr8hrWT5+fHvJo0fDTUuPbU7YcL7Ky
         gvMkevTPd9Wfg8IMN4eATz04vxjl1YmBWes4pLr82mmi2QozYaw9YlLxqgNFKONFfV5W
         JCvQ==
X-Forwarded-Encrypted: i=1; AL+hErHV6wtOxEcnd6VrgCgW5M1EplrCOq4YgDtJVeLJL0epkBsXkRVRUyz6jRxFGe6vedvSmM37Xpxicd7PcjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vRHVTMHzHJc2RjKJfTpxfz9fs3vGWwaQejlMJ02VJvgiTCDhE
	RfDJ3OiyR2eCCBEB9GYdwcfvHdFELtHV/fHcjdTqmNCKM/6rSc3MPSiOIH/greRC3VE8VPI3UqI
	wRMsHwJGtIh7qZmqcdFz/eAizY7C0d421kGq9FPha4w==
X-Gm-Gg: AYBFou12T5UsZqbYe9rebBD1foK2AqaR87qMiZmwhnmEtyQSaGlfRXSIS2YXD9TejUe
	r01xAC2hOUGEdjAzCKuCQ0JagFtJMiMXV9HulL5xVgtePUg9yjO60EYlcypkv3bjmkUsNlF/c1E
	0lD/PRSAd/TzGTeGm1csFEvRjStm3TMVGtOqt6KAAndez3vt/QSuqUQpp6aEXF+Z+se/wfcBm++
	c7NOhs4OZEQbGn8GgVTUXPTHIraa+ajm7OgQtXMWqqtjZJv9AmQnzfTSXAM5pND5RcXE18vBZVn
	DoHDm0+tzi3W+LD3lbp878X/kXkAz07g8vc908Hh14MpGb3zaQC27tIJLFvsI26PZFakCXYENCr
	Iu7lyTS45SH7+zmeJK8oZAACsAnd8N/DP6KgzMVG/KUvwMRTKJslnvR99NGaCqEjlDSYmNw==
X-Received: by 2002:aa7:df02:0:b0:6b1:e4cb:a23e with SMTP id
 4fb4d7f45d1cf-6b7c0953c22mr1651047a12.14.1794574908159; Fri, 13 Nov 2026
 05:01:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-15-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-15-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:35 +0000
X-Gm-Features: AclHuK9jDSyMiIFILSiBUttwKXmQ1n1NCQzZgnrbYNenJcyQXOWeJVgUA5tGPQ0
Message-ID: <CADrjBPrA1WZO_7bjV4jbOGB6MRZMG6=8UTTAtf-v_ZRq06MxpQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14 RESEND] arm64: dts: exynos8855: add cmu_usb clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_usb block, while at this
> add sysreg_usb which contains bits for DRCG and MEMCLK
> which are used by clk driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 3dd7a4c4c609..dcf1e58c6367 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_usb: clock-controller@13000000 {
> +                       compatible = "samsung,exynos8855-cmu-usb";
> +                       reg = <0x13000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_USB_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "usb20drd";
> +                       samsung,sysreg = <&sysreg_usb>;
> +               };
> +
> +               sysreg_usb: syscon@13020000 {
> +                       compatible = "samsung,exynos8855-usb-sysreg",
> +                                     "syscon";
> +                       reg = <0x13020000 0x10000>;
> +                       clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
> +               };
> +
>                 cmu_top: clock-controller@13900000 {
>                         compatible = "samsung,exynos8855-cmu-top";
>                         reg = <0x13900000 0x10000>;
> --
> 2.34.1
>
