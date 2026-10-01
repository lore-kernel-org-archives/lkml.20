Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A408B3BCD1E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832554; cv=pass; b=rUFYuW666Q2KxDPwcuiu25CVjEPJDe8KHxAbMyM7pBVU+Doc/D9ftjDv7Tsrdt1H8Vy4DFR5gS65i/kFlAiJCZkKD15qbrAreMVAu9kLRKqf/5y/U9d+w00YKyq+31vBJIIHq/mJR7Bh8GJciCVgJZ3i/eR+tjlX0irE/NrlMCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832554; c=relaxed/simple;
	bh=iyH4XmChuCIrSHjq17pUFOv3IOKIb+u7oFkVPS6lsQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Wcjy3il4e57FOtaye4Hc6Fz60rG7s8zeUJJdvOzNPWFjQ9rG49XOPYHkQG5UVm6QzDsSUhi7WmvpABiBhtlkRY3HBbDre6okb6laqpYfozuV5kV/kFuU/myQMhwoztfs/TrkdzimMvfZYNErpL5oS23tiSaGERPtWA8whH1O0Eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osDYJEBd; arc=pass smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osDYJEBd"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso7406776a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790832550; cv=none;
        d=google.com; s=arc-20260327;
        b=hPqqAafNJaLidAnlnRgNm/erUjvXNsmPB90/1KFHSCGbQB8ulTnmmg6a1uBmaYAsmH
         eBQLg95CHn3ah0B19qJXIIRe6qIaXHqbE8INbDsMm44hbKaqR1p8Mtk5BY2h3SiQeu/8
         jKNdizuT4KrPhBJKZgcceY2xmqTseFG6NJWa0y1btM+aCUaESlYJhqSIr3Y4aERJLhNN
         5MGk9XSHksjX2bLmZty8fMuEEfYzVKasOxucySKY5+SNVB6gK4YzReiUiVdNd+ycKap9
         JPONtbjwryI5Vt7hdrI/VqfWjKj1P532l9Aq6h8weCgsKMR+LebwHaLw2kG5znEn+meG
         hckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        fh=MOmT/8+dMjAlEvMNcNcTDNv9LWrb9kE/oRJhzcxZONs=;
        b=JX5D8WvvNovhHCW5Oidu8avoE10xjN+ukNCumUZ89h+k8dIxNUs2riDFeF1M05kEC9
         RLEnBrq9URHoEwvH+AU9dNAzKR2KN367nZ8ejP8o2fqiuVc4QdlZ/oFuVP6esAvnuVeG
         Dn8E2Fnofc6IqwzvD8LQLHa0LhPl5aairL7VNM9DiTJeTM4CaJefTAK6R+3PIvoMRUUD
         7htlUTTqAx+fN13adxpGOncaj9SY+1HByUxZJuq9oLuGMlpTRAYKOOcRpS6zTn/VQkh9
         h9n1RUoPVzhs1kyixisDy7PCF78Agp2wIZ2zSQZZ87JEJCzBVFjpmN7zh/meZaE4zdM1
         F6kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790832550; x=1791437350; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        b=osDYJEBdSquqTH4ZFXpMUHX2XBr3nOEgG1h8rZyrujLdLCVNRxl9RPOdGTRH9DmyPz
         l3ITIkRVULsPCqWaADStaEPoZoUY442sUyEh3MUoEBZ/dlPpdiXKf+PbY3N6dFOwtzsi
         jPtKhfP1YbdErbdskHmZkFDbE5BYOfsL8/ZZT8Vw0X8SXZ7qJkuq6/b9s7L3r7qWdmPT
         90aS+lptcxezM5U/C4ni4Cl8hoxNfY/UXpJodKYKzlLhXyyKKth82yeJH4K25tZKUlqD
         TtssVuIXRsIAP4l5SrN4Gah2XAuVCE75YbjpqamLDpXjtDj27m2fjwmHm5teYeGFEf26
         MOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832550; x=1791437350;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGarxBDiXUXvFqBOUfn28UY9mkYR4GFN16+AwUpnjOA=;
        b=eE53bagaQhJaw1l+9l0dsd9InOKbHZEB1c+W4He772alOFpH92JdgaJBBkRmf8tDdv
         aksAgFZIZ5l1R74xpRWskzGh6trQEelFURc9hI65SLy9cFH0FVNXVGvcGEHb6WVWhiky
         9VIAdjHqJRq+r76dZzrigOZI9FkQP+teIa7etlmsc2Yv1GDJIdcwd/rg2Cv7bCRdprAL
         B93qhxB6Ek8rdgka94ZWrJ7qmBIFjFwf7ktCk21K5Tlbty4osZBrpJnm/wPDeXuEzwdq
         kujxC2VF05k0I25/t9URJDVatXLqKtQ95VQXsx8AhLkUUPrjRyhc6XRc0FjQeuk8KxgJ
         2Yug==
X-Forwarded-Encrypted: i=1; AKwUvBy++6+1MpCVBjYmDWJ5kTshCeSozqyAqi2Sk7C7YMoqfGUr/+m83zTgT0WUgTxG7htAISSgmiwrrjrReXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+RzkhuEzNzj5ozGf928QWD4+wJTYHZM6AzJgzLTaPqxWPbbGH
	dpp3PtUkGcm5/nx3ydfFk5+bFNhXNLshSPmLdN1i/S2wNZTOciKSPbLgvKv635tBWjYbPxP8Pii
	bF/3FMK5yUqekQMgik79FfVSNOta4e5M=
X-Gm-Gg: AYBFou2IAaB6fY6wJynaA9kpzro3gaNOleRmTmVDGNWA985e3/xhDNq915yM6Vaa155
	WGbMfX83sL4yk8EuZ1RGeRG/acXeNPQKtEHIzutXORUaaq8N6Y93A5eIaXrTzANCTlwZzYGPs1m
	GzlT2mqNNbAF6fRFbY9gnT+3ef29oFjSkbmhAC7B3bG8PItaOWBBwzuSC1UGT7hZQuTxD/zjefL
	tWNPqj8BkcXXdZAgI0dfZrMP/KQ4vaAHpXmTvxbnBSvGSsGmY3PUYtsUJnBI5XzutJ3Uyblz/So
	gQH1CZcSK348JovTZOUT/zj0+jLDzqF1DD39Qa+VUrY7pWZ/JXYvIw/qMMYUD2CH3A==
X-Received: by 2002:a05:6402:1906:b0:6ac:73f8:2e5a with SMTP id
 4fb4d7f45d1cf-6ae199853d6mr2960704a12.41.1790832549463; Wed, 30 Sep 2026
 22:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923211816.89954-1-lsa.uz@pm.me> <20260923211816.89954-2-lsa.uz@pm.me>
 <CAKNG7X8CTnp2UNYEKOt6r==WdP2v7oxW0nUZ_MANtCCgpghP+A@mail.gmail.com>
In-Reply-To: <CAKNG7X8CTnp2UNYEKOt6r==WdP2v7oxW0nUZ_MANtCCgpghP+A@mail.gmail.com>
From: Andre Gilerson <andre.gilerson@gmail.com>
Date: Thu, 1 Oct 2026 07:28:57 +0200
X-Gm-Features: AclHuK-VbD2xvscLLOhBugu82UCpNYQ2zHUF3TP2o0zojNR6k3K4mn-rv3V3V-A
Message-ID: <CAKNG7X9NkbXSnWGR4-79akJ7WiVeGa7D0mC=p1Pz2gTFO4npZw@mail.gmail.com>
Subject: Fwd: [PATCH v7 1/3] dt-bindings: media: Add Sony IMX681
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everybody,

sorry for the late reponse, I was away on holiday. I was originally
working on the IMX681 driver as part of my efforts for running linux
of the surface 11 pro intel. Thanks for Sergey to bringing this to
mainline. As Krzysztof asked on v3: I am fine with being listed as a
maintainer here, but i would include Sergey as a Maintainer as well,
since he contributed as much work by now.

Acked-by: Andre Gilerson <andre.gilerson@gmail.com>

Thanks,
Andre

PS. sorry for the doubling the email, the first one was rejected due
to HTML formatting

On Wed, 23 Sept 2026 at 23:18, Sergey Lebedev <lsa.uz@pm.me> wrote:
>
> The Sony IMX681 is a CMOS image sensor used as the user-facing camera on
> several Microsoft Surface devices. It operates from analog 2.8 V, digital
> 1.05 V and interface 1.8 V supplies, is programmable over I2C, and outputs
> 10-bit Bayer data over a two-lane MIPI CSI-2 D-PHY interface.
>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/media/i2c/sony,imx681.yaml       | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> new file mode 100644
> index 00000000000..6d2e4ddcee9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx681.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx681.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX681 CMOS Image Sensor
> +
> +maintainers:
> +  - Andre Gilerson <andre.gilerson@gmail.com>
> +
> +description:
> +  The Sony IMX681 is a CMOS active pixel image sensor with a square pixel
> +  array, used as the user-facing camera on several Microsoft Surface devices.
> +  It operates from analog 2.8 V, digital 1.05 V and interface 1.8 V supplies,
> +  is programmable over I2C, and outputs 10-bit Bayer data over a two-lane
> +  MIPI CSI-2 D-PHY interface.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx681
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Input clock (19.2 MHz)
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply (2.8 V)
> +
> +  dvdd-supply:
> +    description: Digital power supply (1.05 V)
> +
> +  dovdd-supply:
> +    description: Interface power supply (1.8 V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO, active low
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera-sensor@10 {
> +            compatible = "sony,imx681";
> +            reg = <0x10>;
> +            clocks = <&clock_cam>;
> +            avdd-supply = <&vcc2v8_cam>;
> +            dvdd-supply = <&vcc1v05_cam>;
> +            dovdd-supply = <&vcc1v8_cam>;
> +            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +            orientation = <0>;
> +            rotation = <0>;
> +
> +            port {
> +                imx681_ep: endpoint {
> +                    data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <969600000>;
> +                    remote-endpoint = <&csi_in>;
> +                };
> +            };
> +        };
> +    };
> +...
> --
> 2.54.0 (Apple Git-157)
>
>
