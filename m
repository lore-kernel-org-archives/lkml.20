Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AE4EC65E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787471; cv=pass; b=WitC+YZZvg/cr8KYurN3EtZcabuyTU9uMwrVpYf5W8LA8VAOOaLtYnCiquVxkuT0HMzHaJ6VWyebeiWq+JhAuG8+pJgQQKkUkKgChey4L00RmsKjHJCyFyJLkarct4v28iz/YHL+hNP/OPaFwU8PRerencRGb6+Pr+0pUmTLl0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787471; c=relaxed/simple;
	bh=p60aRWtIYjOoFTL6Ml6pk7tZl8zZ1c8Bsqt9/cNXsHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ado5knsUakSNYcDXkcZb1C6P/MH5A+2YhtUaaCcUkCaTusVQs/yxIMtQZA0l3AhOSMGIHEBSd1WvSSSFy4ihfg4TiMyhqY91SAkxaOPJUiSsjR+DO46osEc0lKPs4fTlXs0SbJfb7uGd+BslX836yrYDATtPTZuqxWQgw+SjNAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Cqgewg8/; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Cqgewg8/"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-475920b9ca2so983646fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787463; cv=none;
        d=google.com; s=arc-20260327;
        b=Ir06UgMBtlzXy7hs0Z8c3uNu0G6heNahTrP9Lg9QtA2fuGXA0KRAOaDiPBbvhobJmZ
         l0bbp776pGZwVJEibO001VthQjWoSjBxX9932lddgyUekqe0FYpRdSzrDMv1xce1wA01
         CScwuyqTaiaVNaUUSRSTS7YB0mRRSaHkAyNqFMBUiBRIdMzELZ1KsJJeX6Dupk8HuvkX
         oOBjphaCXfkwRLdadtyiOZnsS2Vr4U7msDFNuK34v6sU5fMNKWoH2NuXg2CrvzZrsK5g
         lrv4qyMSL3BOCcsmCtafeBxjYxOpmUTQXd9szYI6QFyYDTMiMNlA6P8pW3R20UCtI6As
         54pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        fh=6Q9ltzPYze1JqzV5xXZZLFTxWrGBGbVUoxv7zflJV5M=;
        b=o0hH4oovaAzL4ojWLFUTCk75GvORj8+1mupv2+nWXAAgJ3oomm29rsoe2ZmpTsx4RK
         /dFNAtAEhq9mWkqws/JMrQh0K0KPPTTqrug2LqRi/cNhv2VDQMslv+Wpf9mY4gTZnNoZ
         /OPI4mNQxQdoFf4ANN/A5GoRRZrdSWRkLcFZEXdqOBCk/KR5z8wEzx895dnGmE8M1/ac
         VvN69wyL6k4mJDbJPX3CRP6VtppkccSd+v6W4DouSgxyBQGE6rf0glRsMkS6wqfgfO7y
         F+p/PImdPcQe73dp6qx/sH2TIo4vMlJCLAatBvVvHoKteDgK0sHS6YYv3rzHReLWwUEQ
         GqsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788787463; x=1789392263; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        b=Cqgewg8/EvAXPUwM/MBqOK9csMLhIUTIbuxFUIFXSPIPHAStma7LUzCa+EL1hpq13w
         C74q007AC0wceHPkSoOksM6YtJrXqcGk4nEFi1kJgXcHq7tEXmbylQFS5oqJXpod28/u
         CnHWZyUZfoGzlFZLnXGb6qqREAsnLHJEkCvF9EDpPTfrfvYt/vTwmn5oRZ4I0/GlGPbJ
         8AMm+P3o5mGeicKcMqQOxQ4JSaRM6jiWs+VInUMa/F8R3yG6ioxtgycouWvjn2XR8ta/
         jUnwbdimb7eZgm7BHo+eWyKLiG2OWO3Z3YOvw+Blhgo0jmDcfnKJX2Am7gc+7EVVK1Nn
         P74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787463; x=1789392263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kScf4waPHG6h2otR6IMWANzB8JEMbk0QA2ux6ikTJ0Y=;
        b=lFwK9T/3uuMHgrR2X+VqhjWjK6g1F1KSgDRpPDkHV0rD2gMLEmDflsye3WBRWKU8HT
         PLXwpLyny1ubosEIb/b0CcQJKVGngpeehoEcb9cxA0svhiQcQ5FDFKQmpf+uLaNkUONy
         5PhiUsmwpdv+LWl+lfGXWwwPD4zR6Iu68uRhOPZAxdUq6R4ALpMLI32eadNMH/DAfPyj
         smdMP3CbklUz+mALZ6hz+fSB3R536eg+mfwrBHq+2kDYQ7NI2H0XgV+OwfV7SPU6Gavg
         kOfkWvaRHwEmrUgrvwSd9hj9zmFoRjLFz9SkCdlobDPPu/tvvA25usEsJX/e2f9FMWXw
         Ns8A==
X-Forwarded-Encrypted: i=1; AKwUvBwmhtNp1nLzgykxwXmnt2P0KoHMdU45P6V7YJdepp0DocVXb+37pG216MzxcGz8u+Qg44LakL/MiRq6oBg=@vger.kernel.org
X-Gm-Message-State: AFuF++k2WCHAjiulJlujj24tD7SAaCr4M6XFaaTFZ+GyGp+pDX+5qoB/
	G0epMb4sszmwVTVEDpF/0I88oGw15rKoKfDcAKSDNwThRCP/aXTUYB/tN6StlNELyfXD3BjhTRB
	+pWUUYMIU+vcCTUfWOiQpWaZn/aDFUo+8ySg1CCTRCg==
X-Gm-Gg: AYBFou3uMd2J+8cd7KQ3y5AOHi7jTauBZ+G8NoUpqBV6rXf5qJJfGN+WBF9jK+KRDSM
	Fp9zpa/4WL1zDZ72SrnZ3DjWk5m2+sEkPUf6tiE32cIE70j+hA8KaJTjRWY3JeTs9qg8EVLyyAK
	1UO4v7OBY8DQPuh00gcCbGy6D+XAKR8RWucy/ptKpaBWWJL7LMM97/9LCbARO4Z/maSdtO9cTSX
	2iX3UrSjFbPAWvj62B7l5SX6Nr7vGdpV7LXFkUuDO+cTTiz1bhGACRicMKEGENw49JwmQ/3Kfng
	pVsZerIwTSN0+wqj1HAKmkKyJtLJQ/IxozybkF/cpvnTWLlCc8I9ot+yk0sR1p2IrSqgztZJMLx
	6VGoeIvjTqdgniE1JZjJUL12+G1LqjslXcjaBC0NgCDqT7sU1E1QzT9GNiD2W
X-Received: by 2002:a05:6870:b01d:b0:46a:deaf:5915 with SMTP id
 586e51a60fabf-47551591688mr14531947fac.9.1788787463608; Mon, 07 Sep 2026
 06:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com> <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Sep 2026 14:24:09 +0100
X-Gm-Features: AcwNN1VtJNaQAhgZmbN25VVX96rEB3Wn69gfnD4KGJJXrfRYQ9eR2sFIrX6o3IU
Message-ID: <CAPY8ntCF6e3FZPx0BwZKJimACwdUKwNSP+SPjNUE+1DgQC1=Qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add required
 vcc-supply property
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com, 
	Jessica Zhang <jesszhan0024@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Shashank

(Apologies for the earlier HTML version of this - I thought I had my
mail client under control)

On Mon, 7 Sept 2026 at 06:48, Shashank Maurya
<shashank.maurya@oss.qualcomm.com> wrote:
>
> Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
> regulator binding and mark it as required. The panel controller MCU
> needs an external power rail to be supplied before any I2C communication
> can take place.
>
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> index 37b9ed371b67..a6195e53be16 100644
> --- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> +++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
> @@ -35,6 +35,9 @@ properties:
>      const: 3
>      description: See ../../pwm/pwm.yaml for description of the cell formats.
>
> +  vcc-supply:
> +    description: Regulator supplying power to the panel controller.
> +
>  additionalProperties: false
>
>  required:
> @@ -43,6 +46,7 @@ required:
>    - gpio-controller
>    - "#gpio-cells"
>    - "#pwm-cells"
> +  - vcc-supply

Adding a new property as "required" breaks all existing users. Adding
it as optional would be reasonable.

  Dave

>
>  examples:
>    - |
> @@ -55,6 +59,7 @@ examples:
>          gpio-controller;
>          #gpio-cells = <2>;
>          #pwm-cells = <3>;
> +        vcc-supply = <&vcc_reg>;
>        };
>      };
>
>
> --
> 2.34.1
>
>
