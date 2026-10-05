Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89D4A8A29
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210473; cv=none; b=AlwrI7wQa3JPwP/WXFPY0/aZLounsb3DuFUOowszPFEhMgNs9e0jiPEeBoTiEpDlqdFuW9AQCp1zjP2NM/bBEj3V508HsUQbchXRu8tIw+u+cZMVVxevFxnLHYIC7qfC2khg4/JZKGG0BHBWR0rDIcL+nubl5LXXpSJzSzU/wMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210473; c=relaxed/simple;
	bh=NRu7J4NYxclsy403NiQBS3+9SXKidUTOhMwJxWH8fP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J8HP6kGYuePwnM/JPhwWgJfP0yzoetXC6s35eGPkMa0cpxbAVr+JBXHhCcoqpsCeroTOj/wY5oBr15SanhQCZ5HLD4a7pYDEY9Q20ZELZovfFjfeulbqmg80EffWIHuifBPtAo+et/Ld/ji9EtkcgeViRirdS+NddREvfQ6Key4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VDvAt7da; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VDvAt7da"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a16bc7ad39so3626975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791210461; x=1791815261; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SMh/wrH0eouNlX+QzH0eHRPiSn4jmUrEiB6WQs9PRg=;
        b=VDvAt7daPuTxliM72mxvq2Kzv32VDdtX1AYMKR3cr3EfYL1UcUMqurcs0zzKmpASXD
         /dQBNALQ5c/yLjTmJ6TmCZ4rmy7dWaoeGSbwrb9sYHgHgpysJ+qvttACoJgR7gy4DrMy
         2lk1k+Cvvi2U0TNkz7Xm2Dx4yi54y8dvanqSus2c41OH4P+3ItsZEPny/7NSdyjyjdqn
         FtEtHTgARJvkRvvTzgrT2WK+MAVH8PpKhVNTiISzES3TR8e+es96LQswiqJxsXGcEDFo
         A+tuVYfAw4S3fBH2Mx6hH8eNMqLUHxDt0HS1xBpdon3slkXAeU5HWRmRV00d8RXWnaBt
         M3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791210461; x=1791815261;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SMh/wrH0eouNlX+QzH0eHRPiSn4jmUrEiB6WQs9PRg=;
        b=k//Qze2zIHCkH3ghHP9ORbWdlgMympGNdok/SzomQlY9zeiry1Zu8EPGesFlVOkfUv
         j5VU6h5cSvQzigPHPW0il7IZQxJzslDN99HQxnAOzBWFUKMD2cDqnmOjGufCV7Yb4MOQ
         M5pJzu0I5sMJCGmCSK1hQs2ltXwL7nGuoWwMzDEO+BkdPMWvCivNQ5cgFe0+wHnNdJ+O
         96JhsA8USRoZXJXkeRQm6efSmO2lIA/R/gKwxsiyKomr64m1UL88lC0NJG0pl2SR16mh
         WWaWgT9x1kvYMPkP1rlfBuQaTe5+0l9ND3Q+mQH6O934AgTvrWjXrVIL1ciKHJQgK+G2
         bokg==
X-Gm-Message-State: AFuF++nf4vRyGRyFJg3kG4s+BCqX06oKbNGEnsm8w62uAmmXbPaO0X0n
	Od13djnpWz1RRJzCsXNanxI5KXxhofdhjYmcKqcoPj+Zxy7KP7FS/m5+vua2WHo0bvs=
X-Gm-Gg: AYBFou0poyThpydVDtg+RvIPaYOQwmIzByVDKLxP8dASqW6ZztGAz7PzUuudVY8JNb1
	iKR9uPX6qKOlHIVOuiolKgnlSAYGal+SATnbMWrDi3no+o/Mjn/Tv7WzD9SWdVaEmi3U6J6zQ7L
	goREwOBXx9HbC9LpNCcTW+qT1CilsVxZIj7pXl0otWPN2XgGsffPMCcfPqmrntu0wnoE9wIS0t4
	PD8BPsL5Kaygs5/Qv6XzopYMB+5nWzIrrH/u2Ci8jEpLIZ/Zx/WJYT48FQ5EZzMsUupCwYfk4IP
	vgPkSpzCldBtA1e7eTq1LqrY2+Qb+T1DxZ3RMR+Uh7oxROjLuiBvwZvflay5jMpAsgv8tQgHKcr
	3kvann/Bt73MnrE4b3yLogzx7L2QugtEAwcpExXeuwhlxv4MXKI1h3oAPzOyT7DQpHbuGA84N0C
	n5YbvRNC0yzhPy6xzd81Rh51FlNw/s0nEFduO4ym13RdyVVSbFcUOJt37nXiv844HjEqzxQjgrj
	YMzqPQx1V6vBHg=
X-Received: by 2002:a05:600c:190d:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a02753fc8emr188561755e9.8.1791210460694;
        Mon, 05 Oct 2026 07:27:40 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm325870355e9.15.2026.10.05.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:27:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vyacheslav Yurkov via B4 Relay
 <devnull+V.Yurkov.EXT.bruker.com@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri
 Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
In-Reply-To: <20260927-feature-clock-guard-v8-1-630938e302a1@bruker.com>
References: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
 <20260927-feature-clock-guard-v8-1-630938e302a1@bruker.com>
Date: Mon, 05 Oct 2026 16:27:37 +0200
Message-ID: <1jbj986x46.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun 27 Sep 2026 at 14:59, Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org> wrote:

> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>
> Extend the binding to be used also for gpio-locked-fixed-clock.
> A GPIO-locked fixed clock provider exposes a fixed-rate clock whose
> availability depends on one or more GPIO lock-status signals.
>
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is
> locked and producing a valid output.
>
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> ---
>  .../devicetree/bindings/clock/gpio-gate-clock.yaml | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6e..1ad87c8b36b9 100644
> --- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: gpio-gate-clock
> +    enum:
> +      - gpio-gate-clock
> +      - gpio-locked-clock

I think this name does not illustrate well what your driver does
anymore. As I noted before, locked if very much PLL centric. enabled ?

While the driver sits in the same C file (clk-gpio), I don't the binding doc
should. I'll defer to the DT folks on this but I think it would more
approriate with a different yaml. clk-gpio-gate and clk-gpio-mux have
their own binding doc

>  
>    clocks:
>      maxItems: 1
> @@ -23,10 +25,29 @@ properties:
>      description: GPIO reference for enabling and disabling the clock.
>      maxItems: 1
>  
> +  enabled-gpios:
> +    description: GPIO that indicates whether the clock is enabled or disabled.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - '#clock-cells'
> -  - enable-gpios
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-gate-clock
> +    then:
> +      required:
> +        - enable-gpios
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-locked-clock

I think there should be a property in here to express how long you are
willing to wait for the clock to be enabled. IOW the lock timeout.

> +    then:
> +      required:
> +        - enabled-gpios
>  
>  additionalProperties: false
>  
> @@ -40,3 +61,10 @@ examples:
>          #clock-cells = <0>;
>          enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible = "gpio-locked-clock";
> +        #clock-cells = <0>;
> +        clocks = <&pll>;
> +        enabled-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };
>
> -- 
> 2.34.1
>
>

-- 
Jerome
