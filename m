Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321505;
	b=jeMnRSEyedYekCrkQUZ/sJSkv8SoLzrc4LZ1buYXKqjWQwGselWImjEamM4nLbYPnfNu
	 ImY4taXgjJQgmix6HvlgMVLoZ9xA3gx4zPmOjwDYl+Pm2E1xU+jx/wtiZj/uwXPbo54q3
	 WyF8pIUuz0LstK9y7LavbVVNV9iwr4/Few7UXmPs1ZLrgCEIYtvG5Ds+WmJy963PkvJdp
	 n0GJs0tpPNJLpDCHVhv0tqqS1+615vDGB0vb0+/OJba2pzsrjnZzmA6wFKwcfChs+Ic/w
	 Rs97PnGfpY2SqlC1xmM5iCHev0CGSCvD9QERyuI8jWkbZwcmXhiLFIhTm0J+7ud2dWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+IqBot1PtwDYqDn5RWRuc5xaq4SMIIwOUN97ZyFcYvk=;
	b=JdOurSNPZXp+zHjjs2GGJnNmw3/0/5LCNG0Wee0yYhR2A5uF7UlnirvSwq8Fg/HFGBT9
	 A7ZmgCpzCKbUK4KCh08q0TLDlbj0R7Zkk41uIMC7fKLe7cgkXy0nxneDjThXQc2+T0NnB
	 aEw1j5mwD2vFw8S4BhHrKcVoPsgRQLt98dB/PXqqZbtsNk8IPrMdMqFfpFy6I5GPRYHWF
	 HwX1PksTxMMMHVW1DGmysLnxpiZkOLE6ZvQ8GNe8TJJr1GwaBTRKKc4QBqVfaeX/75MEE
	 9uzhKPeTRbQ9qfvFjaFviJtkMYUXiAIgnTV7cQd2vmjLfrir7I5Ju48tD2EgkeGONqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vag1rzpr;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445A960A382A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445A960A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vag1rzpr
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b147e06befso953826a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794321505; x=1794926305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+IqBot1PtwDYqDn5RWRuc5xaq4SMIIwOUN97ZyFcYvk=;
        b=Vag1rzprQhkSiNFjjYcq/5iTzep1Ypv9nzLUaeUw2kzFZA5cHkvUUF3ptb3YT0DetE
         m3tTH03/sOwGsyIFQjg8orJE4lhT7PKnB/MHaFLbmpDsi9+RrMgf741Jms8wtX6lYwpt
         JOlob3lCStXyft0sEX7TclHUMxkuApbA7cZHZjlJCTZw55KIW1/Q0DGZ7ZBt/AH9FnI0
         xMG5AXtjL0XS1QdELQ2U3FISuepUigDub3rAsBSPLPNlV1rtNtKis+NcBEPTYYsnOIV1
         5N42yTZTn+iwDitUvh9662NpwYC8r/Rdk4zXSWhvVbQ8J5jZlFQB/mnqiHzac3aOhaQu
         GPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321505; x=1794926305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IqBot1PtwDYqDn5RWRuc5xaq4SMIIwOUN97ZyFcYvk=;
        b=TNk+3L1cd0ZH4Wmyd5F9hhx42lkUDEOtYYVFBUXi/5EqnRp0FELCKcu5IU9tkGpDnq
         mUhqhRlKxyihw6gIyuSkvfIjewzuPwyzNVA4T0X9ZWpZexnK0Jg8i66sWCro6XcvMsVL
         EIlbSooS02la0pzH0xrLE+oei2gVHlywk+FEKClhJAb6zet1lzDOYKbt4kIkiem2LlAJ
         TPFSH/LQERd0CY8qmHybxrjNH66TIRB5fM7RKLO1xhQ1nNIr70FzVZyIWuLn8tCsVIib
         y2pzoasuwbRbKT0TXYfxkWf0PasblM0denrYuNCND3a89075Q2IK0H/jFeTOV9PawFB5
         nHEg==
X-Forwarded-Encrypted: i=1; AL+hErEFQlng/dfb2k23/TEPWkVxliIHPsA358Lj3XV4mxmlru5g2splXkK5p1hsDr/4WEny8+iqLKKQb9s2QM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tgKRJLJN/yA2oupndLAUtIk63CeK7xBR8KTiyZfm7EVBl2gju
	HyW0gyl2JfFqM6oEinerYVXqYROS+2PXQTOZtLeNYch1PlS7uyfH+P0wPTnnyqig4zoZCl3gSos
	IDrAJ
X-Gm-Gg: AYBFou0OfYsrOAvesLMBvRjwF+DP/Nmy/mewn91IgKj7vnK9rRXIpNpjQcOtH9Hvntl
	D//25unNQLgff48K1HxAoC942+jhjo670H1OGJDpCT918m/R9bMOMR4v/dGfbUZks9rdre/WTlT
	xSQeReAFfWQReatuJF1+Jl27IjY7jdSWm7+hknSYvcE+JeMpKMjUyfQ2L0Shg+qBmya7oq34b6y
	x8tMmkCYCmYUxqTZVyOfSmQcX4fVMzqK5pHI/GjcUf7mHUwh04zfrdki7vxGadA523jEo49WsP5
	p2ULZwo0XoC8fJbmTKCS69EmmccOhZCggQor18TK5v1XDeCLVq7K3pNMKP1Mn02uDFgqZ+Yqavo
	LPmdfCjkvkBXRrtXB72iX6DIukNx8w4iYxr9Ir+3QNHS1VMhuh/oOhdP4tdG2TcgVYa63/v3gia
	6U5iOH3+2Nd/xhHd2L6u+E69M9ts6EV7sRwaRx1P6R5d/X1mKNcn3js4mpH/ClX8dfLYQufJjtq
	oVbJ49uoNkya9KbzjcEJyJLeI68Yf9Sdb0GykelUldAi5mgtUPVg3DxhwFa706Ffe7aRj+05IGF
	ca7s3plgQy7eP61zbuP/FV1NHmpYt/zD
X-Received: by 2002:a17:90b:55cd:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b166cddadbmr2410116a91.31.1794321503970;
        Tue, 10 Nov 2026 06:38:23 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a917:5683:7f92:9eda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1690eb517sm1867517a91.4.2026.11.10.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:38:23 -0800 (PST)
Date: Tue, 10 Nov 2026 08:38:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Nishanth Menon <nm@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: reset: Convert the ti,syscon-reset binding
 to DT schema
Message-ID: <avMsXdwyw4FsQtZG@p14s>
References: <20261109173112.4111810-1-robh@kernel.org>
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
In-Reply-To: <20261109173112.4111810-1-robh@kernel.org>

On Mon, Nov 09, 2026 at 11:31:11AM -0600, Rob Herring (Arm) wrote:
> Convert the ti,syscon-reset binding to DT schema format. It's a straight
> forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/ti,keystone-rproc.txt |  2 +-
>  .../bindings/reset/ti,syscon-reset.yaml       | 58 ++++++++++++
>  .../bindings/reset/ti-syscon-reset.txt        | 91 -------------------
>  3 files changed, 59 insertions(+), 92 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt

Applied.

Thanks,
Mathieu

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> index 847552133633..94f4508c8b0c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
> @@ -46,7 +46,7 @@ The following are the mandatory properties:
>  			managing the resets for this device, and a reset
>  			specifier. Please refer to either of the following reset
>  			bindings for the reset argument specifier as per SoC,
> -			Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +			Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
>  			    for 66AK2HK/66AK2L/66AK2E SoCs or,
>  			Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
>  			    for 66AK2G SoCs
> diff --git a/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml b/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
> new file mode 100644
> index 000000000000..1cbb2bf88716
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/ti,syscon-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI Syscon Reset Controller
> +
> +maintainers:
> +  - Nishanth Menon <nm@ti.com>
> +
> +description:
> +  Reset controller implemented by registers in the parent syscon.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,syscon-reset
> +      - items:
> +          - enum:
> +              - ti,k2e-pscrst
> +              - ti,k2l-pscrst
> +              - ti,k2hk-pscrst
> +          - const: ti,syscon-reset
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  ti,reset-bits:
> +    description: >
> +      Seven cells per reset, indexed by the reset specifier:
> +
> +        Cell #1 : offset of the reset assert control register
> +        Cell #2 : bit position of the reset in the reset assert control register
> +        Cell #3 : offset of the reset deassert control register
> +        Cell #4 : bit position of the reset in the reset deassert control register
> +        Cell #5 : offset of the reset status register
> +        Cell #6 : bit position of the reset in the reset status register
> +        Cell #7 : Flags used to control reset behavior, available flags defined
> +                  in the DT include file <dt-bindings/reset/ti-syscon.h>
> +
> +required:
> +  - compatible
> +  - '#reset-cells'
> +  - ti,reset-bits
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/ti-syscon.h>
> +
> +    reset-controller {
> +        compatible = "ti,k2e-pscrst", "ti,syscon-reset";
> +        #reset-cells = <1>;
> +        ti,reset-bits = <0xa3c 8 0xa3c 8 0x83c 8
> +                          (ASSERT_CLEAR | DEASSERT_SET | STATUS_CLEAR)>;
> +    };
> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> deleted file mode 100644
> index 61a0ff33e89f..000000000000
> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -TI SysCon Reset Controller
> -=======================
> -
> -Almost all SoCs have hardware modules that require reset control in addition
> -to clock and power control for their functionality. The reset control is
> -typically provided by means of memory-mapped I/O registers. These registers are
> -sometimes a part of a larger register space region implementing various
> -functionalities. This register range is best represented as a syscon node to
> -allow multiple entities to access their relevant registers in the common
> -register space.
> -
> -A SysCon Reset Controller node defines a device that uses a syscon node
> -and provides reset management functionality for various hardware modules
> -present on the SoC.
> -
> -SysCon Reset Controller Node
> -============================
> -Each of the reset provider/controller nodes should be a child of a syscon
> -node and have the following properties.
> -
> -Required properties:
> ---------------------
> - - compatible		: Should be,
> -			    "ti,k2e-pscrst"
> -			    "ti,k2l-pscrst"
> -			    "ti,k2hk-pscrst"
> -			    "ti,syscon-reset"
> - - #reset-cells		: Should be 1. Please see the reset consumer node below
> -			  for usage details
> - - ti,reset-bits	: Contains the reset control register information
> -			  Should contain 7 cells for each reset exposed to
> -			  consumers, defined as:
> -			    Cell #1 : offset of the reset assert control
> -			              register from the syscon register base
> -			    Cell #2 : bit position of the reset in the reset
> -			              assert control register
> -			    Cell #3 : offset of the reset deassert control
> -			              register from the syscon register base
> -			    Cell #4 : bit position of the reset in the reset
> -			              deassert control register
> -			    Cell #5 : offset of the reset status register
> -			              from the syscon register base
> -			    Cell #6 : bit position of the reset in the
> -			              reset status register
> -			    Cell #7 : Flags used to control reset behavior,
> -			              available flags defined in the DT include
> -			              file <dt-bindings/reset/ti-syscon.h>
> -
> -SysCon Reset Consumer Nodes
> -===========================
> -Each of the reset consumer nodes should have the following properties,
> -in addition to their own properties.
> -
> -Required properties:
> ---------------------
> - - resets	: A phandle to the reset controller node and an index number
> -		  to a reset specifier as defined above.
> -
> -Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
> -common reset controller usage by consumers.
> -
> -Example:
> ---------
> -The following example demonstrates a syscon node, the reset controller node
> -using the syscon node, and a consumer (a DSP device) on the TI Keystone 2
> -66AK2E SoC.
> -
> -/ {
> -	soc {
> -		psc: power-sleep-controller@2350000 {
> -			compatible = "syscon", "simple-mfd";
> -			reg = <0x02350000 0x1000>;
> -
> -			pscrst: reset-controller {
> -				compatible = "ti,k2e-pscrst", "ti,syscon-reset";
> -				#reset-cells = <1>;
> -
> -				ti,reset-bits = <
> -					0xa3c 8 0xa3c 8 0x83c 8 (ASSERT_CLEAR | DEASSERT_SET   | STATUS_CLEAR) /* 0: dsp0 */
> -					0xa40 5 0xa44 3 0     0 (ASSERT_SET   | DEASSERT_CLEAR | STATUS_NONE)  /* 1: example */
> -				>;
> -			};
> -		};
> -
> -		dsp0: dsp0 {
> -			...
> -			resets = <&pscrst 0>;
> -			...
> -		};
> -	};
> -};
> -- 
> 2.53.0
> 
