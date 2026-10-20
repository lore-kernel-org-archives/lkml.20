Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459505;
	b=DbzUzdS9z6KvX1oQjQ+WcYsjFkgpbBV5zOFlrFExotkEGqqgPnRQAJ3Nfqu+H1KJTRU4
	 N4CoZhL7+y4DsyxXL0Bccy517ma/8njJUg92+8LhCsNZ9Roe63e7u4Ukq09yDNUgUWRd+
	 Lw9M1OMaVI1MobKyDFrJbCCWhwWVLjWw68Nq4/uxKoHU+TvufA6mgJEi/eCfOHjMTX43x
	 ey+3V6Mey+h/Q3+jRp7lv7UCDELsN9WcTV2Dfws0Q2QUucMxlbP/IJmr27E7zCZLCb2Wu
	 hOXPogAnhcclLvugjuEiVP+q4PfL9AqW5kedWNA5HUnuKH4EdI+KLqvecVpvsfuWy1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
	b=Z7vNjlGh0TyflkOh2Sh6XDmV6WCd44se3le7Ha6lNsA5bUiiURBtjlXosD4+ES4M7wWG
	 +VpJwVJ48vyt8/S0C8zPCUsTCu0ypVBF1aKWJBo4V2y5suUbISVeGZCPl2BGB4zbHi2om
	 2PabP+JpJl2ab/1qL9GBg96Hcllj6Io1LgtZj3kFAnO7LEuTaDUVJUhrfF0ifxZFz833v
	 snC6u1n6+8HKjjNy6IjG2VER4UJTPT+EStHM7RAfDGIqNrSM6p8lxdgdkhVK+D5CbMgHz
	 6FahQ64lJ5pENjzz5SpSu1Y8Q5ydXz1DKhnUVQJYxULPdNCUzTwfUDe0AbLuxUHWtQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkRT5n2e;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D0B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GkRT5n2e
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e901e114fdso13213815ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459505; x=1793064305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
        b=GkRT5n2exhVq/bZWWaWrZfPBL5AwA74qNvh5AAr/Cgsx40W5miy0tb90dSrybPiAoA
         KYS5YrJMDwOJXQVm76DgepdKqhnCx6Iqsq4sLd3shwUGNj+OzN/wzokmuCk94+5xm1SN
         G2jJJDfuyh1SPZWyN+0RBm6NMNTfrQ12kcYn0FR2vl2C3JS3yLPcfijVc77wQLPIm6vq
         0pp+oKwJaT2ebEfzBfEgJGVN+hRbpSnPAW5glKNFeZaeYEtDVNk1g9RqbjKbqRNL7hXS
         Z5BfSnwFx/NFDkivzx6gPW43iJAAXPY0qzt+svke0gxc94DfosSykVf9sF432y8JhxHn
         aWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459505; x=1793064305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8hApdbjB2FWFRs0szr0ee40pXh05s3I5KLtI9DczSE=;
        b=qMm05x0FyijAwwcMl9CeLFLDvwCUnNNvYvcE7OQzxbvvZYiBK+zgCfZTrakuNRxD+L
         JC20eIznvNDHakqHgQY/ZsEUN99ukQORQGxM9pz754d3lJyhgMH4CTJAGJIb5f0e0nTM
         KlATvFqwA4WNQNIs4cNx1dqrLIjqo3i9Uu25K3b6mtazJEbsqyPoIODbqKt0hgJaTDY/
         OZWr+aYW7td0amQGk3yJM6DVWknG9bqkL99hHie1qycS8WJjtov6tvA2MJI8SRdaxEhP
         Nkeo6yFqqL05KA5X4nWrSOhyqbIqtlR3ynSCksJEKjw0JED84e4qo/dx2l48gOwqxE88
         XDsA==
X-Forwarded-Encrypted: i=1; AKwUvBzSfOeHIkztHpLGEyeuZGCbTg4oruuvtrpq5ssb4NX2lwkCSFgW8oxC3YgXDkRrGTzcXJoTLKAVx47wy6Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiMoO+eQv9EcJX1lIFLiEkDSN3C47b/6wbntsXlpmEnLIbf++A
	/LK8bsE/7Px2lqg3dRKndexd8xy8W+vtIbElfQlqkopj/XfjApiAyT6t
X-Gm-Gg: AYBFou1vzBUH+a7XAIVuifjDNJpZbD1e8/gGPochSR4kp5OkSq0cHyDCigE7OUGHmVZ
	JRajQAbvAUNoymR6llZCbEhRfRha/w8UDS34cs60q05v34l+eTr2jlbCJQFWQ/Q4bDuymIuZ7Pg
	MameT8d0eivsdbJWsyiMtIuSGPiBNSWXHxoE7+H37l1Eq9VHAluERgfCKSg80TDz+W7zpapwXdN
	mqc4Hs42mW5AWMYTgFsRiLnkFQ7IFX1D+NFIil/OnOfBno/m9XR+Q/qF6X8k5R/DgANUjgiSji0
	GDQU6yDZK5qpRubIp17J58kmPs+vbakJIPS6gPvNGdWK4SWhsIEH4UO52xqPoG4iEkyOYkoe4kZ
	lpvHTvrzgt1HPWZv0UTlS9HxGpUk5f/sTJtFDBXOwCLMubfLwj27MM7XTtHLz/e+qW2xa2DBE4y
	AskOPi9EpCs/Je8A3GE2JybLw/dWOXmqEwS3N3Rh8/WbJH0hPh7qokdCFczeMfNPRuTOoAW0YGA
	9tZ3gTxQ/GM
X-Received: by 2002:a17:902:f706:b0:2e8:2f95:764d with SMTP id d9443c01a7336-2e9a6f57a2emr77436145ad.59.1792459504698;
        Mon, 19 Oct 2026 18:25:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea14dec6f0sm6844815ad.30.2026.10.19.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:25:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:25:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	hajun.sung@samsung.com, wim@linux-watchdog.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: Add Exynos8855 watchdog
 compatible string
Message-ID: <63cac66c-98a7-4174-86c3-68c1e2f15805@roeck-us.net>
References: <CGME20261006160157epcas5p37b8a0053c489b051dfb415c9b72ba178@epcas5p3.samsung.com>
 <360067785.01791340382096.JavaMail.epsvc@epcpadp2new>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360067785.01791340382096.JavaMail.epsvc@epcpadp2new>

On Tue, Oct 06, 2026 at 09:50:03PM +0530, Alim Akhtar wrote:
> Add the 'samsung,exynos8855-wdt' compatible string to the Samsung
> watchdog device tree binding documentation. The Exynos8855 watchdog
> nodes use two clocks (bus clock and source clock), require
> samsung,cluster-index and samsung,syscon-phandle properties, similar
> to Exynos850 watchdog implementation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Applied.

This missed the start of the commit window, so queued for v7.5.
Sorry for the delay.

Guenter

> ---
> * Changes in V3:
>  - Removed comment "for exynos8855" as recommended by Krzysztof
>  - Added Reviewed-by tag
> 
> * Changes in V2:
>  - Fixed Sashiko review comment
> 	- [Low] dt-bindings: watchdog: missing comma in samsung,syscon-phandle description 
>  Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> 
> base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> index a32c47831577..37d9fc9b68f4 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>            - samsung,exynos5515-wdt
>            - samsung,exynos7-wdt                   # for Exynos7
>            - samsung,exynos850-wdt                 # for Exynos850
> +          - samsung,exynos8855-wdt
>            - samsung,exynos990-wdt                 # for Exynos990
>            - samsung,exynosautov9-wdt              # for Exynosautov9
>            - samsung,exynosautov920-wdt            # for Exynosautov920
> @@ -52,13 +53,13 @@ properties:
>      enum: [0, 1, 2]
>      description:
>        Index of CPU cluster on which watchdog is running (in case of Exynos850,
> -      Exynos990 or Google gs101).
> +      Exynos8855, Exynos990 or Google gs101).
>  
>    samsung,syscon-phandle:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        Phandle to the PMU system controller node (in case of Exynos5250,
> -      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos990 and gs101).
> +      Exynos5420, Exynos5515, Exynos7, Exynos850, Exynos8855, Exynos990 and gs101).
>  
>  required:
>    - compatible
> @@ -76,6 +77,7 @@ allOf:
>              enum:
>                - google,gs101-wdt
>                - samsung,exynos850-wdt
> +              - samsung,exynos8855-wdt
>                - samsung,exynosautov9-wdt
>                - samsung,exynosautov920-wdt
>      then:
