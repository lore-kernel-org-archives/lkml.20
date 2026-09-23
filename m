Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC1E3DCDB1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156537; cv=none; b=bfHUjV8Xp5i7Cwf+ZvlEoNkkfuvJ1SD209x+CV6jlJ5evPM8CqAGZEn/TxWF+2BO/B8E5gFDTXYwZ6E9ufxVUGqmQbLYjwNyqHt9nmFSUn3PHEOv7gwL/dXO5UBU+Rj1Ql0fZOmWdoc1mDeCNcZ6Sf1U6cxCD6tj1tJm5ANFdSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156537; c=relaxed/simple;
	bh=BujUuQDfVekCTjQYxnZ274Y/mBqoA8yucwSuWPHk9zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRDBOJ7MX54nyg7wKEPYHrf9IS8mvabgFcHxxa6Ucd5QmbGbO95Ji6+BeKF2kr8QpWxYS6trNqBTjkbgbqS/Q6SM1zu5A/9cJ65W0qfL++GUy6y5dl78+O10F68qzix/fC9LPNCBjxmHCMWoQWD3s4VqWmLwHMlnCs1Uzpacv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso658555e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156535; x=1790761335;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ki/L6uAzwSlL4d976xkfrPadyRlvh6KDNvRFETqhN1o=;
        b=q9+QCxftJwVvKbPVbdW6Nfv+PggJMgpp2JFFz0oElVUEjiINfBDB9NDovaYIpw7Q4+
         AGm6iL6ZKLhHORwFtmNpInuj7ZY28bY1JEW5A3/xQJ0F+D5LfUckAj7qIXFxX5fo4Eh9
         qBLdFy94ghThOjAYXn6tbpCaX1utjYUNhy2h2HTpztrZV09BEoRlepl+gsDrlkrnA/m7
         45Ixpsnv4Tg1CyHK5HWB78T3wWyzdvNEbGRc79MRePmpowMNLZD7fHDh5k2uNYG5cFqh
         Eds53eb/zWmcxzQPU1PfKAbjUuBeiwrcpJ6Aav7gVgD31vmUAN0SYOKL5Sk74SFPz70z
         Z2DA==
X-Forwarded-Encrypted: i=1; AKwUvBwqFH11atz0zisQcMnNrz8PcHrejWEbn3MwOIA3686eTKsWXgxi/RaJB6CG12WtkZhibEXwGXuZkkPXG+E=@vger.kernel.org
X-Gm-Message-State: AFuF++mGj0jDYwThKjRIp+ttjmIPMuBRXJ8W2dBYUaJOGFvoHKjl13wA
	/IzyG2TrD4RL63pH1qOOen0HCAT4U1HqE9KzXxTzcKha43d2KNlIod98YdoYiZ3XHRc=
X-Gm-Gg: AYBFou0Vr9mANRh2w9jIgLMKfGc77uVppLuP9BkBeN558dWK42zdn13prU+KLGsN/7L
	Eig2Op1jYLzWOTCm3g2fn0OGCfGyHNRqTNMtvN9y54l8vpugFaXI2fuswsufLX6hoGPZeh6CmGH
	empGXXkODPaar/072n3Ac2IIc9/u+z3KzjYqt3QLKJgb2DO+ikUYw4UMJaodzrXVb91DD5I4Xyz
	4KFVnTq5ZtpXlTy7bZXEDgUom6Iw20hu91dSkxIJnahw1dBFOwjmiq5OCzGtfdaVnKwkDWw2dAT
	SqbRkiLFub4RwfG45RI1ii0hBL8gL+zViyBGVB2ovfQUnViUbIq8j7pBGX+wZqWzYKVj9QtnUJ+
	ycaPLvDXoiHpiYf1k2PgK81HIrVQxhyYc1L58+hJBrpeMlASfsszeF3yZbhE3+fcHLEkvYGO8Rr
	nqIje32vZo9MzanOJF+PqfcBlLBSgcxLpCgjTnmtFyh5e2FY7rM+v96ifCDpw5SIZH06wCz0SiK
	6xXkea4z35vhLUcmJbD3kelmAH7s1taJ15+2Q==
X-Received: by 2002:a05:6102:424f:b0:7a7:198a:c2b7 with SMTP id ada2fe7eead31-7ac1d4dcc62mr1893671137.31.1790156534668;
        Wed, 23 Sep 2026 02:42:14 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f5b93sm2625386e0c.8.2026.09.23.02.42.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso399394241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfNQvaj1P07zxsUUgOEvs7vp41rwX4oN3M2qcDKL2wn1YCyCGLkgA7P3SLlJ5cxvfgqp994vzwW85B8oM=@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:7a5:2427:ecc1 with SMTP id
 ada2fe7eead31-7ac1c998ff2mr1923273137.19.1790156533341; Wed, 23 Sep 2026
 02:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <d281677b5759f15ced1f59fdcb3eb7ca29c72dd5.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:42:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjaTJfe7P3+w7P40K0evj4SvdKtTS-QLqK7Rhd8c=3-A@mail.gmail.com>
X-Gm-Features: AclHuK9FXFIal8yiY-Qs9cVDiOssigpeQqL3VZL-ls6OCUB1RtSj6-ENt-hknTI
Message-ID: <CAMuHMdXjaTJfe7P3+w7P40K0evj4SvdKtTS-QLqK7Rhd8c=3-A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
> and 1x channel with host interface.
>
> Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
> in R9A09G047 SoC DTSI.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1773,6 +1773,130 @@ usb3_phy: usb-phy@15870000 {
>                         status = "disabled";
>                 };
>
> +               ohci0: usb@15800000 {

Moving up to preserve sort order while queuing in renesas-devel
for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
