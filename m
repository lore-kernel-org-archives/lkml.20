Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF71F4FB9B8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536193; cv=none; b=rhGrYiRN5x7Qj9urSluLUsSR2ggg8uQwEa+EkUG8Z3hD72L6cx2NXO6LYVfhlzq6cI3k+dCmv/tNuJ3vT8zWdPu76riv1CabWgk/2UQ8mI8pd2C82EWICgr46ezxLMUHbm1CvpBLbOM6fe7xBxcvGINnrAqbYE+43IfXIpIffkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536193; c=relaxed/simple;
	bh=4bEAll6bJapZukrKkjXZtk1Cgl7yrbg5PsFtTRWvy8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shdXK+/hTVPlmDuHAxMH9MT3JnKVRwIEA1E1RdJg1//io5ibeI7WNT951WbtSmG+yI3TY9d9IfP4k6uRDlSMAKUwoqav9DWur6grcYtba1/C1pkZGG/PrIJTFgm7aUGSKTpkTaGr3ngPavk42k+H3bJDPeTUKQl7pd5r6SL1VnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so1528307241.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536190; x=1789140990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hzE9a7y7ZZDe66bPxoXer0uMhuOeucoXHc9TRbP+CZA=;
        b=sKjzTEZWZ3pg0GEmuqdcuWqfKTva/d74IgV7SbqWZJG9Jl44QQK1nFNZBpd3nJCX3s
         pwS40b/iuSFcywpvRmOxtnujpSf2XkRzazXFTKDKVcNv4ManBMzSAX+fWVeX+WawY22W
         rQEHaROMatA/eFMI/l6Udi7ffA8YUWtszkXA7Kvyj9jv55rQySdP8Wh/5BN/DZPKz7AB
         ShM0W8rNgxIgR4RCRfHDOB8C9UKOrcZw3BUNjcO8XHH4oqD9wZcmGMKCpWz1ciH/xZ20
         l1llvCLKmyu/6wzHpkauaZ43ItS2qG9wxCirloOhg2fJjU5edAsgWPmEvQy1gpj16w2p
         ksBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfIWnBVt1KE4WmJJVgzWrEVpuTEjb/KlLePZ6r4k1/XH2Q6J+5M/2IgKn09MOLHH7raTPEz990xpdcVUA=@vger.kernel.org
X-Gm-Message-State: AFuF++mRR6sfsNGJn/vEnai0+SXsgj07jpOAeCCMmm8bybATcG2j87y7
	eaIdTjbIqp7X657IhsZaeqdkA0+HVLI8YOeBjeN7wtsIS7y/mCOPRhHCx1P0qdCz
X-Gm-Gg: AYBFou3n0GaDCVUUm9V1kgjNB3DfwiYd63lSWp1PB9oPCsFuSUg8m9/CTGPu3TAccsx
	n9KT2yKH11GKJJBnTf04eUhzdRky/EHtPSuJyIy7QUZEQpRbtBX2EdhL8pjNooX7tC5iCPM/iFP
	flg4foZB2kqwQKL+buLbcaPHIMrMHkr2VPlb9oqCxK4OrOEHFXc1aRYglce7FTQ1Ji6DW74vULg
	aMHuM47l/dxS8BQKRVH/kQOOnKNGf+/XcDVjimXdUlAeewOlYl43HUwnUxTCtMm37LwRyTbgHv3
	0POZKXm0aCzRVNVxoVDJS1jbW3r/t5ilLXa1wEcA2HFUQsHZwI3ocA6q3H7Sp2QQlYeSCwjcgPD
	F0g7H603Tkq8zrYZC1ssg8wPgjuqlOEVIBf8lJXZiNs6b77/lJRn7fOMYCp3RQwR3gSPgjZnHBG
	YFjXSXgL3WluTG3xxuUdV9OQVwYO3RObLODmC6GzGJ18M5zZ9I6cZETxqsKCzjFWr7/I4Tau0Lv
	85VdCyWbMX4bsfjbuWiRcDxIw==
X-Received: by 2002:a05:6102:4193:b0:785:8ad4:57f2 with SMTP id ada2fe7eead31-78a4a5392f3mr1284307137.2.1788536190125;
        Fri, 04 Sep 2026 08:36:30 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b56bd3sm1971233137.12.2026.09.04.08.36.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:36:29 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7894670be7dso475892137.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwr6KftVhEy2yHm3yv2HfFtL+itSZGr60G3bs/S+mxSrfEgfeBdX/fui4lmbA5NNWzU2eoUQZVqvOt7q38=@vger.kernel.org
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id
 ada2fe7eead31-78a2ef7b044mr2760248137.11.1788536188830; Fri, 04 Sep 2026
 08:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:36:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
X-Gm-Features: AcwNN1Um6XH5hlFEECJFpWec4doGqp3W45Z0eEeDzho30JjiEWI3GGf_1U5A2yE
Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub
 board support
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

Hi Ayman,

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC main board.
>
> The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. CAN, PCIe
> and ethernet) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only OR BSD-2-Clause?

> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC sub board
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774a3-hihope-rzg2m.dts"
> +
> +/ {
> +       model = "HopeRun HiHope RZ/G2M v3.0 with sub board";
> +       compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2m",
> +                    "renesas,r8a774a3";

Please replace each group of 8 spaces by a TAB.

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
