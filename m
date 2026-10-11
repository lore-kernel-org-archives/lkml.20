Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D71B87C9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710024; cv=none; b=mLjdVbof4URS4dUTk3otbOcdRwBvBmiTHL/5lAyOL2ibosSIoR1t/7FGu5KhemVjQb7y8x2CpNk6jolBeTCKnjEsiGFh3XBUoqYwvI84yqewit+/KpWFGNOtRnkfEW0pdaEuUYRzC2l5Y2YNneLCl40iVCmLovxi5dYp3xHJ768=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710024; c=relaxed/simple;
	bh=QYwv8ZVGvQYe3i7iPcKGnjIbysXtDF2O7ZxyYhCoEms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pvlLSFcnTvtbSggIfZ275/PT+RjEI0dtfwW00ro9PBNB7viHtBlBt0R2RAhi1OFkxyVD7/DsaSY6GK6DBs/Rw1gHK7FkAnnjCstgFOuxbint+s/t3WX26eIhDXuDZ95hqWwKDUgEz5kmSAvlaPsiLfumpZKHBsNANrnw2KYUU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnelEC0d; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnelEC0d"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c411d6615so550698f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710021; x=1792314821; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z49FbKKlAmO+vgO/oO+bk2H9QeNxjgWLv5uy8+cQqVU=;
        b=XnelEC0dcyNudsIYkwDV6S/grGGqAPDUGxLxbaePZINn7tJwkB8sKZIK7ugTpLJFWS
         ERul/DgH7qIreg4R8nvfP12HszGkWFJFvjFLvwVbe631NzIa9MEfmYK3xUekq7+eedet
         oX9RXlE9dSq0RQoQYNnfCATzsElm/WdxpTZCfMt6UXyCBbx5GOa9HHezdkzoExa3vqZU
         p8yWiJp4Qb2r9sazPmfcf1LkzQxlTqr1lxnPGfwjGuNjtk1GN2Anq74Eo7crv2n99qO6
         5g/EOUcsLOfQWUbCIvDKDhThW0ub9+ltIlnfI+hrcFFTp7/JkbeY5pJayD7IPt3cDEtw
         /Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710021; x=1792314821;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z49FbKKlAmO+vgO/oO+bk2H9QeNxjgWLv5uy8+cQqVU=;
        b=kgLzQPXG4ijU79gvPmFcgYM/nqYEbHeu8QVSBQjF7PX5pjVIzyPyTfrLaujsxGiur2
         GknTn9ehd1Jg/1APg+qu0u3iP0uQ8ft4kr2A3ZXw1mvOPM2FFmRH2RV/vfU3Dx59/eoW
         4/Q+SkQalTmEpHjvJIL6iNhlNOwM9EODSBFbyCVB1CInW/q0KG0D9+jqZgMGXBUuR2lK
         S8LFONSOKVqSs4f3gesqWZV0PZQlXcmCvelmJxjRE1q/Iaicqr0vk/z755Yaciva6UsS
         zYF4I3a4h8H5UyQ8muE9oXqTc5c5jO/OmjvEqdgu9JH3bwnHTJYuT2TpmYP2xXs+hTNL
         sV9g==
X-Forwarded-Encrypted: i=1; AKwUvByqKW3+q7D/wzmSDxmCGOtkYC6FdSRIn/OyFojtm8fOUUq7L+2xr2yQPwQvQGEUL5IZ789VQMPyqhfxzEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2nCtqWlyUtuKalhXA8rpvLHY4TVL9EMlBoBOQqEN1d0lXEkin
	sHfE5ChjAUDTPyFFgBCeo2DL6oZZTchiX0w4vNH/mMTluxPm5/PPR4xE
X-Gm-Gg: AYBFou3hCJJ8/UPoXbKud42P9wzTxuNak8AaT/+NjyKE9FTU4bjmgYaZQX9TSKq3WDU
	knX5o5FfTfIMde1Wbr191IIq50Pe+NR2WQzuBxF1Xine0OxDDKH2mTWlN+5rFysrY/dqt2fUVPg
	0j7crabNgbBgpAcfaYrokswDcBk8Y+jDIY7iuq2HKh54daxYcYAiD2+Lv5h6rP5l5itUPbVGVjz
	roWYUWoywgT53EK0u7oShCJngxhqiNabuOkJ7xYmIpw4gDhYgxRlp0qxO1EgOXncaQqfCfJE3FS
	0NsK3IvbKn2MpdD0zrCU6WQ91a+WvnsK5GI+OZOt2vGH8+5TqBYGKYIigZdU4e39H4KEvP1+I4q
	1ha9Ykm4E7KaAYe3QsLBCfrmbpQsq7gzEJJbCtok08zDzFMGQrT8Q4xnlgwwiMDHbix+LCbT2CZ
	K3E92JN/0djD9QnT7sQHbU41gO1kHVQguTj/32JwKFtjn2qQQoUaFV85bbL3Gru/Enob864Ynua
	lM1N4nmucvryXR4xSd+5X3WLZOpGD84DpAe/nxOjc5Cc4xi4fjZEZRp3A==
X-Received: by 2002:a05:600c:46c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a18e4d6b28mr120874255e9.33.1791710020945;
        Sun, 11 Oct 2026 02:13:40 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm254023425e9.0.2026.10.11.02.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:13:39 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject:
 Re: [PATCH 06/24] dt-bindings: clock: Add ZTE ZX279128S CRM clocks and resets
Date: Sun, 11 Oct 2026 11:13:37 +0200
Message-ID: <7axmtiEnS5SDBrUzy6e6jw@gmail.com>
In-Reply-To: <20261010130024.177503-7-ghahramani.navid@gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-7-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartjpLtN9HcTiyHU1_e0KJPjQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartjpLtN9HcTiyHU1_e0KJPjQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Sun, 11 Oct 2026 11:13:37 +0200
Message-ID: <7axmtiEnS5SDBrUzy6e6jw@gmail.com>
In-Reply-To: <20261010130024.177503-7-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi Navid,

I don't have enough knowledge about about PCIe and the A9 l2cache to commen=
t=20
on the previous patches. For the clock ones I have a few points of hardware=
=20
investigation and the actual implementation.

Am Samstag, 10. Oktober 2026, 14:59:44 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: zte,zx279128s-topcrm
> +          - const: syscon
> +      - enum:
> +          - zte,zx279128s-lsp0crpm
> +          - zte,zx279128s-lsp1crpm

The advice I got for my zx297520v3 bindings was to write a separate binding=
=20
for the clock controllers rather than try to write a one-size-fits-all one.=
 So=20
you'd have a zte,zx279128s-topcrm.yaml that has compatible zte,zx279128s-
topcrm, syscon and a separate lspcrpm.yaml (or maybe even one lsp0crpm and =
one=20
lsp1crpm) that take the other compatible

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5

If you split the bindings the clocks becomes a fixed list in each, simplify=
ing=20
the if-then-that rules you have later.
=20
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'

Your topcrm should have the reboot node as a child. syscon-reboot's "regmap=
"=20
property is deprecated and shouldn't be used for new bindings.

This will either mean adding the simple-mfd compatible to auto-probe the=20
reboot child or writing a MFD driver that does that. Since you also have cl=
ock=20
and reset functionality in there the MFD approach seems best, and it is wha=
t I=20
ended up doing for my CRM controllers.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: zte,zx279128s-lsp0crpm
> +    then:
> +      properties:
> +        '#reset-cells': false

Are you sure there are no resets in lsp0crpm? Given what I know from my zx2=
9=20
board, it is likely that there *are* resets, but the ZTE kernel doesn't bot=
her=20
asserting/deasserting them and they come deasserted by the time U-Boot take=
s=20
over. (So either they are deasserted after powerup or the boot rom deassert=
s=20
them.

The way I discovered the rest controls on my board: I set all the registers=
 in=20
the LSP controller to 0 via a hack in arch/arm/kernel/head.S and looked at=
=20
what broke. It turned out that there are some bits that need to be set to 1=
=20
for the device to work that aren't mentioned at all in ZTE's code dump.

The follow-up check was to see what the impact of those bits was: Setting a=
=20
pclk gate to 0 usually causes the mmio registers to read 0, 0xff, garbage o=
r=20
just hang (busybox's devmem is your friend). A reset bit, when asserted (se=
t=20
to 0) does the same. The difference is that when you re-enable a clock, the=
=20
registers retain their old contents, whereas after deasserting a reset, the=
=20
device lost previous state.

Since most devices have 2 reset bits YMMV. One of them might not do anythin=
g=20
at all. Or one resets bus access properties while the other resets working=
=20
state.

> +++ b/include/dt-bindings/clock/zte,zx279128s-crm.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
> +#define _DT_BINDINGS_CLOCK_ZTE_ZX279128S_CRM_H
=2E..
> + * Top CRM resets: (register offset / 4) * 32 + bit. The USB 3.0 control=
ler
> + * has four in register 0x4c; what each one resets isn't known.
> + */
> +#define ZX279128S_TOP_RST_USB_B9	617
> +#define ZX279128S_TOP_RST_USB_B10	618
> +#define ZX279128S_TOP_RST_USB_B11	619
> +#define ZX279128S_TOP_RST_USB_B14	622

Please put the resets in their own reset header.

Using hardware locations (offset, bits) for the binding values is discourag=
ed=20
as far as I understand it. I saw a comment by Krzk on a different binding p=
atch=20
stating that. I'll try to find it.

It is better to give them logical values (0, 1, 2, ...) and have the reset=
=20
driver map them to the actual hardware location. This also helps if you fin=
d=20
out that you got a reset bit wrong. Since the bindings are considered ABI,=
=20
changing them later is tricky - you don't want to have to do it because you=
=20
identified a reset incorrectly.

Cheers,
Stefan
--nextPartjpLtN9HcTiyHU1_e0KJPjQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLU0EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiy9UQAILnMit2k2tNCuGxm+W4
RPJOXzI39DY/XBG02vuhvovf71wMXUwUmxhHJYYYlBbmQVuLfGDENx4mr991TWQ7
uTmRIYSdQVZzHcFCbfhiyWxMmtHlt9k5TlHPvgyehjVwv94Y4WCabFGtIdu2bJ0P
JOPn5EGwcFeeFgWl/MYCUzlkRtUGyoeXruJOc1cz6wQJFTHaMe77lgYcS/PKSWKi
ewmmUSVV0fuq5+CBDbp+iIR1qKUIPg6V/bnOlB4LUDmIO6h+46WGgJayrCgSgmGP
dKUH6l1rzLqhlGM9U9eLZ+gloSuRf9HGprGYoKkyrVVP9VQaUPR5369YGhsyioG0
2FPhT41fRKqyxqPxlRX7VBhviVGKd2SgXy0A6hRbjlSrHJ//ol54tCe+BXiyeYhx
piewX87U3IskZTfWaQpVoAKxtAao45UbbX1F2E98MApWqH9TSf9SYoK6ogKf4F1t
u+cCbJVb0tP9IrWe7cnBHpO3FU8H7zvT8ngwDYFCgteyipMvg+gasyTdVa+5uNBF
mdL7rF5pVtgNaEn3vvuuWiT+6Kk/JkTvgrDqF2b8wqH3uXh+WukBA5v/a2qmAtwZ
dD3bpeoZu7+ukku5lxfKs3vzcgC5f5h7ogYxkSkASTwoptZzoJZMDWPrLc+43778
9pYjseVNU4hoNEcRHMNh8cX9
=zJ1i
-----END PGP SIGNATURE-----

--nextPartjpLtN9HcTiyHU1_e0KJPjQ--



