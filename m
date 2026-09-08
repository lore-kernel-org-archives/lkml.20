Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4359534478
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874299; cv=none; b=rOs1VZdlk/iw5OyTIQx2se7FS+xotueYZHUSSydqq6oJsi64XE2Q31TO8laAsuSl2WB5UazzVSx0cSp50muWSWZs4XVXBVcqmnaBCz/8aRavkk03Md93z2WRg0pQyqU1qFxrRMaJXeqH9p1dySQEBXQys5J2Agm7H7lowh2pagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874299; c=relaxed/simple;
	bh=yu9OZgfKfzPNFzxIZHgRFCy5pcqiTq5Wq62oensSFpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVsQyMtQce7mlBKlxGINZUOdXvgM2HQ/tRvbwqmEKmpehMcgxRpdzBh8IlWpqRgIYRFeiEBkWOH3/AiMayf9zxYs9CYyGEPchxdGiPRN70Jmcw0R6LzwsiCuWxlssxfr8qSAxY2H9Z4fwMQWaGzZ8XZDrZF8m5UAZ1iN31AOHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so6132238e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874284; x=1789479084;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwjnLI9Ep/r7gZDtAe178FX2I6j4lZ75aWazhYEJCj8=;
        b=jfcy3fZTukE0sDKtBey4FIEnf2zCZC8Rc930MbPxyFONGl+aoSFXl0keCCrlCHouhk
         I81v1iucYiXwVGfhVZkJqiSRDsqWKeDnU+8UPJdu2JU4yxtxDWQsCgp8Sh48grz/XJKn
         Ho2dhf/1R2dvTEHhqP+32/GWnBNJ9VL7+pX69/JzKFTfpi+UyYBomNaWwAWBRMaoymOs
         xqfxQVFbj7xO88mRRrxgPIhXM+wOLVjqU0T0lhK4R1ebX0B6BymSSVeoPGfRA02ov9aO
         fsw/ZIx0fEUE+4nSwNcgobS4dEiTyOnRhAwwAoUtnPx6bT/HwDBBr4EKq4HbOURvfv0U
         9Lpg==
X-Forwarded-Encrypted: i=1; AKwUvBw1NexZUbh/CD7n1wHE+OLn3DwJEAAEQ16bqlhznDMhKay+Gp+pfJlugD5A3MTdek6K9MjZ6Bq013dVf2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mmVi6huWHLldku8SGjzN+YYrHB2uddT1zb96qKiNjvU75E2TiQ
	KdMUG/Byj7wQB21X2yzAqnH0DgbnUIV1JR5YddZFsbNGEYMk6pnMC4zbsNQVh8rY
X-Gm-Gg: AYBFou2EkOaBchg32oXSEz0Ypp2s8gtfnJlk9X6TOr64ODQSzRYrrpntHXBGyY6S9Ru
	JNGJUXhwZ/hCLWVmhYM3GiDhnNCM1j1mxSn6Xd2fCLApcysYhpSpBVLYtmTtSfY3jBG7sU+lKMn
	1kven1pVK49eX56E0nz1p7pXE9Em4ZzoAopElnXgzf3Etwmadei8D7hhBfzjCjl/3gjlaaolIQf
	wlbVYInW3fFkV0v1OUgxUVAI34POcqJcjs4HgyBCBQcbb6gz2chrqmEJK+1Lj7ETh6eKhGdmp+y
	AUj2uatNjA9akuWa23unqw/XFTMziCrHIbUAmOYyKih02IRpFF47+dGqcnWkv3gn2s3/sP8J/LH
	+kArakbD+P2Ydg20TjH3YbwdrfvRTu+XXQfR75YD0VholJLtJwCklC2a4Te0Of4WllqlguZb7gv
	42KMmWtvhDrL8cbK2p0jV0PTuiqxsFgKPvCjxZsFkEU4UT2aM2H8+JmuoOalLPrDXGKyhpiSuzZ
	3GqTnVnFpJtVRGe+v2AG1DChTRVLlH1EOakOyUdzdCgfbDb
X-Received: by 2002:a05:6122:6b83:10b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c7dcf71bf6mr7537441e0c.7.1788874284313;
        Tue, 08 Sep 2026 06:31:24 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm10073365e0c.12.2026.09.08.06.31.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:31:22 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-78a66ef3468so2264228137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:31:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+HMcJ256p3zKHyE9ZCvJEawHAv5N5CFe0qejQT4jPzHRsdRusIIyayz0QX5+3PdnhdoU6jWfPpmWWoyk=@vger.kernel.org
X-Received: by 2002:a67:fe50:0:b0:78a:5bc0:4b7b with SMTP id
 ada2fe7eead31-78a5bc06bd8mr4345758137.21.1788874281039; Tue, 08 Sep 2026
 06:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-14-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:31:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
X-Gm-Features: AcwNN1UocVhmKEZQcX_zmxc5OTroh0qtOuTM2DsW1-WXkXKuXnRy_MiHk8uuF0s
Message-ID: <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for the
> RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output via the
> ITE 6263 HDMI transmitter.
>
> The overlay enables the LVDS controller and the display unit (DU/LCDC),
> and configures the ITE6263 on I2C2.
>
> Update the Makefile to build the overlay as both a standalone .dtbo and
> a composite .dtb (base DTB + overlay).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0

Any chance this can be "(GPL-2.0-only OR BSD-2-Clause)", like all
already existing arch/arm64/boot/dts/renesas/r9a08g046* files?

> +/*
> + * Device Tree overlay for the RZ/G3L SMARC EVK with ITE6263
> + * connected to LVDS and LCDC enabled.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
> +
> +&{/} {
> +       lvds-to-hdmi-out {
> +               compatible = "hdmi-connector";
> +               type = "d";
> +
> +               port {
> +                       lvds_to_hdmi_con_out: endpoint {
> +                               remote-endpoint = <&it6263_out>;
> +                       };
> +               };

No DDC?

> +       };
> +
> +       reg_1v8: regulator-1v8 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3v3: regulator-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

Any specific reason you cannot just reuse the existing &reg_1p8v
and &reg_3p3v?

> +};
> +
> +&du {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       it6263: it6263@4c {

hdmi@4c

> +               compatible = "ite,it6263";
> +               reg = <0x4c>;
> +               data-mapping = "vesa-24";
> +               ivdd-supply = <&reg_1v8>;
> +               ovdd-supply = <&reg_3v3>;
> +               txavcc18-supply = <&reg_1v8>;
> +               txavcc33-supply = <&reg_3v3>;
> +               pvcc1-supply = <&reg_1v8>;
> +               pvcc2-supply = <&reg_1v8>;
> +               avcc-supply = <&reg_3v3>;
> +               anvdd-supply = <&reg_1v8>;
> +               apvdd-supply = <&reg_1v8>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               bridge_in: endpoint {
> +                                       remote-endpoint = <&lvds_out>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg = <2>;
> +                               it6263_out: endpoint {
> +                                       remote-endpoint = <&lvds_to_hdmi_con_out>;
> +                               };
> +                       };
> +               };

No audio?

> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
