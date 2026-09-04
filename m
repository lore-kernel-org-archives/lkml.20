Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14239233947
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535779; cv=none; b=NYYwMOyLZqgZfK6+dwKyie0seZ2nr45asMkyz+3uUc3Jy+dUZhrAvlRK2/Ip5PRgKipdGmoDWBJDYHWy55XqewmasulWnHKV8n7uz5h8wqf5Ib3IRy/cTb5ubSyAdxUp0G9S1yAVjBfBSg2+NP0vgGmPZL5Hnm1KwDuEvCPWPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535779; c=relaxed/simple;
	bh=xuRqAUdvHsG4BxcDdfuXSf+SI6WrEN2MF8ZgZw7jyWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rarb2qjJO7JUdrQumzB7/7eZ3KMtNjkldptzbnaOOsyqm2iJ99UssOvI7rlPZLT7e+I+LTZCwwr+C2zQ2XqwObd6X/CRGxzmQLMeFGTRhs0nLFEZDncLI7ayWbmRRWQ2vPEla07p8FGClH6p18ixahnGDO6719uIUqMX6bp8NVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso2193411e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535777; x=1789140577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qKx60bz5SuKi9YOnfZ7Xh4JH5NN7Tn78TsaIHZikv3k=;
        b=aEd0hqwgXsRHpT647YMcz0rS+vXI6vQ2MRLfR90E2Ee4ZGKcpSCP2sjMKKoHFWyWdr
         a5XC0bkaFzQaB19ktN3ZtPoFUXSjGPgbB+oCQLuPiREI6fQ3Zo2v5Ocnr6tqhUkBH7xC
         AmdCO3iLPwGdPoLrvdRDXILkoJZ8eMQ6gs3mcP9xxcIrXBeGuFRwhvZZUfd+uv2zBTry
         IhgQiAKarlQP0IYvZCXoneY+eu6poDubg4v6WxRUuEMqOlVJGc0b1etVPQqkJPhT1L7C
         hoZoAooLrUl7h+lzB4gKXz1s/QVI6CKZCE+KOVAA0eGlTu3M2lcAUPfRQR1UD8yWMnBv
         wtoA==
X-Forwarded-Encrypted: i=1; AKwUvBxI1Mjt2ppKOEsMketbzTsOYmF54INAkxYLdPRNCPf2b8A37r/seD6nt/z246zCf8IBdhIDF7KcNsCSHzI=@vger.kernel.org
X-Gm-Message-State: AFuF++k142RxLCFA7HoVpzAT9HkrFxjEx76PdQH8vvx8qS+CupMcEcNL
	Ifhgt62GVRoTXTPPpvqTZqHezSUb/9MUPmV9YogrOxsXgjqPeANIeFM8HiASlMMh
X-Gm-Gg: AYBFou2FFSLXcbo/cUkVlbzGYQdszGhQqPkSqSOC7hCb2t9f5uwONZjjyN0ZemBJIml
	pN3EyyzBGEbBvWsCHog9ShxyE9tr2CaBrfaKEDcFe1jSMc5i1ap97/NBlSodbwLqhbbF2VJQoYx
	+DnM+PXq5LbfyP2i6iKUUNUMpf9zsu+OojzEqBzGQt4ICic0Q3Kr6WAc+X6TEtRbCESv5qYmnLh
	PqQFOypZ01VuRxKNu1EKFQTWulz0hjgkGGsdX6MM8kM2dmayoJPfRpMpbqo/WENKekk/RrLMPHR
	0TawppvTXuwsMZ6yy34UwGXrX3FukKBO422gPVv252D7dh0/+iWLZfUwGdDD9qwAcIGuEozEDgS
	4kOVuZHXRDGojJRZkvuu0F54+PSsv6yUBYBtj3Eo5Nr8RmaK2FTlu/f8mE+nHXYT7katrCH7mvq
	V2Aj1+GTD/O5VEqG/7UL7vpEi05ZN1L0dNO5p031b9+RvYt4XdTp5TJ+EjCSUh1vlf2NboK+wJz
	DNAt/ezsyzTYtun1tRvBwDDMw==
X-Received: by 2002:a05:6123:59c:10b0:5c4:4ec2:971c with SMTP id 71dfb90a1353d-5c7dcfc6d14mr2785270e0c.10.1788535776861;
        Fri, 04 Sep 2026 08:29:36 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm2317716e0c.9.2026.09.04.08.29.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:29:35 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-97cc72fe0f3so1485619241.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:29:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByzzBM+cVV/6Yu7huq0d/UWh1R671x6Ep9pDmcPzTu8X5ttBDaacu5paR2Em7tqfLWxz4V9oXZK+1REWqw=@vger.kernel.org
X-Received: by 2002:a67:f906:0:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-78a2ef8049fmr2629622137.10.1788535775319; Fri, 04 Sep 2026
 08:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
X-Gm-Features: AcwNN1ViLT-nOz1SKiDYeBMSJtbLrC_K6YnJyCHi1MudTORPs1tGe-hfANcJPSI
Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0

Any change we can get "GPL-2.0-only OR BSD-2-Clause"?

> +       soc {
> +               compatible = "simple-bus";
> +               bootph-all;
> +
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               cpg: clock-controller@e6150000 {
> +                       compatible = "renesas,r8a774a3-cpg-mssr";
> +                       reg = <0 0xe6150000 0 0x0bb0>;

No need for odd sizes: 0x1000.

> +                       clocks = <&extal_clk>, <&extalr_clk>;
> +                       clock-names = "extal", "extalr";
> +                       #clock-cells = <2>;
> +                       #power-domain-cells = <0>;
> +                       #reset-cells = <1>;
> +                       bootph-all;
> +               };
> +
> +               rst: reset-controller@e6160000 {
> +                       compatible = "renesas,r8a774a3-rst";
> +                       reg = <0 0xe6160000 0 0x018c>;

0x200

> +                       bootph-all;
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
