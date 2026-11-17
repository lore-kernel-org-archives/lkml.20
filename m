Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893292;
	b=IMaDGfGfPGQCD1TVp9wUHnJtmv3TTwiI0d7s2V43NFEmH6s3IJcVMbDOPAplaX71jwmB
	 1rpaQFOqYHRzO7dNDAa1N8WpziRZoLSb1FcerhpBme6kSj8Nlu/6psehsW9ZFwqLu9UZS
	 1YRHQ4hx7e3uLCIKBzJLtufYAUeOHCWFEsCSNy1CKpjuFT1+RK9dLz6kK9ga0N8KpFmTR
	 tifvkqS8krWvls4c9/m+q0/bTES8v+wc8W34PDwwmBPLMxd0kuM3Cva8shD6ifUPxf1I8
	 2WUTSDrsT88h45UUcbRh88UmT6ljSPrNi0kM9EEq+i6mDviTGEHzaXMTtzdTZdz6jPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
	b=5LnPBSOvpPGBGRSbKkxxYpFF/Yv5F1g20rJRDX+WFVIJhy1b9Dgxqszua8oc31saX0Ul
	 sYoxqy/opwn3amuQm6ixkwEHdwAvfFqPQ9cI3hAJIeoDwd2DQGXDFqN+Bhvk6BYCf79bt
	 wTPt9r1O4nfQ2GsiAN6gigdVD+VBVRWfE7+/Gx5jmiTY8TKHVSuRcGDWPdnn3Id4lCyjG
	 YIx4r5UB2KiyE+hMoSARWyo4zqPUbzsjGg4oNKPPw1FPSbvr10IfmzHIYx0bg3u89TZGX
	 JpccOokzqR52pBnHwkD1YGMB8Zf1aOzEQRXkmFBTGzGxJW1/RgbG2FlKecGXaNM8UKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MAu9UYBl;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D3606A884
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 737D3606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MAu9UYBl
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644b28706so38205851cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794893291; x=1795498091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
        b=MAu9UYBlDEJ1BEaRdw6FPp+jAt51qQy/3VwFUA3dJ3HJS/4v3w9g9DTiUEhevIhmWO
         0IhQ6aX2yXoP0OpW/IdrmHjcSkg0EJ4IMEgHjBXEfqLxzEyF0YA+MJdZYFaC9jpsQbKv
         j7JSoXiT5g6TEPUgGZ+mEaZ3S8nqLilXzw413dadzSL+b0NcWGjUny79vl2gKmh5oiVJ
         L70Uk6ImuGx8MCuV6/64/LD7bITi3KqN4e1LUUcowj9elQvw8CFV5t+Op3Id37ek5aw4
         SRDS93yn+OxXZzpcaGBTjkEzIfbWLSOevUFkUhRbnXSs/jQEPPvidBxWe163DaVJ9rDR
         CHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893291; x=1795498091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NiXyMdzo/anqEnQBYGUdLPU8J41tqXReCV4OWaoYlKw=;
        b=gh1HI3QGmpfexQXqVwngi/cegJm+EJqcGIXbk7/70boY0no6NGXv4jzg+u4POFaaPq
         KjgiehuoJucglG5WElcW5FH4tkh9mV4Mo4BKaSSAQD/VmlHQMfO7We71nPRJQBDPblpY
         KRIEQA8e1J9xKsLVCBzP+fQIKAg6BCjD4RLFSdpExwkeCVxcSyMlgpweaK4ePC+7CCyk
         kVcmtViCc7P4J9c5rWEwpmfUZTupHSefWVEimDM70wXrVF++5rjO6dGnoM7Hlek/+NDd
         qd84EBxhZ4peQ8hrrMWypjQCa+ZfTRyjGCeyv22JlrRkXBljbMukJ5t1STZUg+nKq0Vi
         7n+Q==
X-Forwarded-Encrypted: i=1; AL+hErHzlxitPjPg2qAoAnJYFufyjUz6ZecywGsRY/Am9Bh1mNRUikI1co2LpBWs5QZPo81k1+PQ7gqfQMxyLFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LsATZMLqYwcLUawGW+HY5vs5qroRGpcaOBkOZU+l5CXI6ZukI
	kIeJCwrXBi2K+M0DtRtiUaUhdqs2bc1b16Srayc4dUb1l1oKFJx/L634FD3NCDL86uxkZN/USJe
	Y7JyM
X-Gm-Gg: AYBFou3f8MnEWjacvZMglc8T7KVSGwLTExo+nxO6s6/rYrX+Pei8U+DPJsMa8abS0be
	ed8Kfc7XIQKSO7mDTsB9OQ+fJ5YdaVe5HxGLSWD49pwWRmWxhoCUkFNaiENytNN96UVQQ8uvjAL
	RUOEEzDxBPpQxAt5purYLgZnm3bvsAFU8wVyJ+e3DFJuddJMNxTBkfqbvdBsDOw3xXMY9Do+0uV
	lQ1Sv0nklyeYsr0RpnZVTZlWeQ5b2aQJ42oosEZowS0uJfOQ/W52GcxV4nJHuQ4cX/lydadEwyK
	sYEyE5DtTsjmcH26Mpd3qk04KhbOxVtvggfGBY96UBoMmJADpXuTilAcNPbT5MPdTWFuDcFyVOh
	b9GBnKWWAf16PNXIfN3rt8BLDN3UXI1UEGEGUb5ze0qSri7frYY0gex9NejIsiQFR0NrNr0BiXs
	NJfARSz78C2D8uw9bLV31AwyZD6Z5OW0YKSf2pd+XwStvzhyFmwZjCX7Y69B4uSbus1HfSquVc4
	ampNtmTkGiC/qn3Y7MGxpz/r4gOwo7UNCFtInmD/fzqO1mUzpYIgBFqFcem8pSUCoK7W5eYedQY
	5WbnlndP7rTWHrXNNDv4mnVlwuO+zg==
X-Received: by 2002:a05:693c:88db:10b0:381:93eb:9529 with SMTP id 5a478bee46e88-38193eb98e5mr451811eec.19.1794892841137;
        Mon, 16 Nov 2026 21:20:41 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm39990857eec.14.2026.11.16.21.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:20:40 -0800 (PST)
Date: Tue, 17 Nov 2026 10:50:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-cpufreq-nvmem: Simplify
 bindings
Message-ID: <avvkJSN9zh8tnS2x@vireshk-B250M-D3H>
References: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261105194606.772346-2-krzysztof.kozlowski@oss.qualcomm.com>

On 05-11-26, 20:46, Krzysztof Kozlowski wrote:
> This binding selects a few top-level compatible machines, but since
> commit 389de9c5a677 ("dt-bindings: cpufreq: qcom-cpufreq-nvmem: make cpr
> bindings optional") only qcom,qcs404 is present in  "if:then:" clause
> which enforces specific OPP properties.
> 
> For all other machines, this is a no-op, because there is no schema here
> enforcing a specific compatible for OPP nodes or any of OPP table
> properties: one can switch to standard OPP table (operating-points-v2)
> and this binding will not complain.
> 
> OTOH, this binding has complicated "if:then:" blocks so is not easy to
> maintain and causes false positives when regular OPP table is
> encountered in matched machines.
> 
> Drop all machines except QCS404 and move the subschema to top-level.
> 
> Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/cpufreq/qcom-cpufreq-nvmem.yaml  | 78 ++++++-------------
>  1 file changed, 24 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index 547265b8b118..dfc7a27a7bdd 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -25,22 +25,30 @@ select:
>      compatible:
>        contains:
>          enum:
> -          - qcom,apq8064
> -          - qcom,apq8096
> -          - qcom,ipq5332
> -          - qcom,ipq6018
> -          - qcom,ipq8064
> -          - qcom,ipq8074
> -          - qcom,ipq9574
> -          - qcom,msm8909
> -          - qcom,msm8939
> -          - qcom,msm8960
> -          - qcom,msm8974
> -          - qcom,msm8996
>            - qcom,qcs404
>    required:
>      - compatible
>  
> +properties:
> +  cpus:
> +    type: object
> +
> +    patternProperties:
> +      '^cpu@[0-9a-f]+$':
> +        type: object
> +
> +        properties:
> +          power-domains:
> +            maxItems: 1
> +
> +          power-domain-names:
> +            items:
> +              - const: cpr
> +
> +        required:
> +          - power-domains
> +          - power-domain-names
> +
>  patternProperties:
>    '^opp-table(-[a-z0-9]+)?$':
>      allOf:
> @@ -48,10 +56,13 @@ patternProperties:
>            properties:
>              compatible:
>                enum:
> -                - operating-points-v2-krait-cpu
>                  - operating-points-v2-kryo-cpu
>          then:
>            $ref: /schemas/opp/opp-v2-kryo-cpu.yaml#
> +          patternProperties:
> +            '^opp-?[0-9]+$':
> +              required:
> +                - required-opps
>  
>        - if:
>            properties:
> @@ -62,47 +73,6 @@ patternProperties:
>  
>      unevaluatedProperties: false
>  
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,qcs404
> -
> -    then:
> -      properties:
> -        cpus:
> -          type: object
> -
> -          patternProperties:
> -            '^cpu@[0-9a-f]+$':
> -              type: object
> -
> -              properties:
> -                power-domains:
> -                  maxItems: 1
> -
> -                power-domain-names:
> -                  items:
> -                    - const: cpr
> -
> -              required:
> -                - power-domains
> -                - power-domain-names
> -
> -      patternProperties:
> -        '^opp-table(-[a-z0-9]+)?$':
> -          if:
> -            properties:
> -              compatible:
> -                const: operating-points-v2-kryo-cpu
> -          then:
> -            patternProperties:
> -              '^opp-?[0-9]+$':
> -                required:
> -                  - required-opps
> -
>  additionalProperties: true
>  
>  examples:

Applied. Thanks.

-- 
viresh
