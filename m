Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BEE4E80B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534555; cv=none; b=IQHxbB4ovZ+Fq3+bOdwHPbDh75ve82xHULPiGjecM5SfvLfVsvbpU8b114iz87EMEmsRmc0ubM81SoEVMs+zAerH2yXKSWU3l1XVSFBLBEljU/ResDp6w7iNzcgnlu5mvRB7sCjV4f2m+Gi1ls6w32eV8rvIH8JVkfFAi5n6vMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534555; c=relaxed/simple;
	bh=OVpDaLi1lD+Takpp4uvA66C8HI92i7f0cSJulK2KE6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5Dqdfzed9Cs737a5rV01TZZkAREkYUHa44yajhAGZBGHiGlKHikQORkSxaiWEwO8cTQdi8tPLxX2KSXp5GbpLJSXoMwBEJYYnXEWfbabCACfeCN4ACN3QFjyfgEQh5nk3g9RTsDJEJjCmlE4qCRselOQbel95mndmYyBWtUkkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9103be3b3d9so16193706d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534553; x=1789139353;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qjft24L+Kray3Ujvp0X5j4rTQSYixQ6JGAbX73Xi0TU=;
        b=RrWxvn/wX52UPaJhnyyaJPA208uJayARnVFAUNtbNjqtB6BPMMAprtCrCNYXNfzGDf
         Py2tZXI3DQWS/QB/HVCHRyKuOCD2OBSJFyQdBEr7sCSk2MZJi4vtjk+sR/RZ8+L8e6gd
         MlhwgLGH9PfjrN9L58HW1duEh9U93fxVm9HixPz+CnGye0Yzsg41tIMPnTs2elDmrM7+
         BH+TB7LyLDxYlq/qnCdhODfBtCR+t9jsj2AIlwbRthe9Bpyyhzwz6rzwtv+vflAhbn2L
         TUOKyJgZBzTOoKe8VJRV/e6Cld07DW6GI1muuka2Nx9sn1HenxAymZ3LBtVf8VYBGLlk
         YnTw==
X-Forwarded-Encrypted: i=1; AKwUvBxBg1OiJWgSXnb/DXo7PCaZOfMjRyfHk3wFciM9GSeMHHkCluGMrPnlu+wmrtw6fH93T2MSRPrTPlJsJbo=@vger.kernel.org
X-Gm-Message-State: AFuF++mjeSKoV2lX6gatpeoe8JTTHbHCOEw4M8Votm4w/5kxXHlz5kLa
	Y5hlah+5ago3AA8OVI0RgFF82XNE8w7dFxtwnK232+LGFsoDCNPgiZfKliXqrqRo
X-Gm-Gg: AYBFou13dyswYn9v1umrscBtxNB8pDabz5gpFCKbLiefM53VK/a6HqxwBIrEEJMhFhC
	MvwUhhkQF1+MOhkw3OGWPNRLu1rkwzG/4h1/sSFTJRSAXJF5CYDCH/KczhcUGc0dtsV4tMNajAj
	eUTA1i10Z2rCH+G4gERySEPbXoIzCxRno8lYZipakGpwpWH2gboazAlcsHmZJzJHRJ0lRHadMV1
	FEcY7iqIvN8ZlfvZq6Irh2Kg/SwbJGln4nLTkc+xfiSmLpdeZVMQwKbtM2fiX5ECQZXNgTyBTaR
	G252P56tnXjrturzUMLThjvIeFPlc1gXIL/aO4LjWm4zb1aaFcD4JxpZicQBrCFPvN2lm6geRL6
	q3Xv/e7CPIDWDZHSdOgdOwPypKxujLObbDAXreTG8nZDUJghUwgVPAbzYAJAFpAbFj7nilc5oiF
	A0VsJ5ZWz5Pq3bf1hlj3MJBjS+Uu7aI6MGzzd3zbeQd+sdF5vhGQokt9/wjpAKOKTVuTJm/4TDW
	tUxltb9AFkXGhlguqNYHksjgA==
X-Received: by 2002:a05:620a:2604:b0:939:4e49:4d3a with SMTP id af79cd13be357-939806da015mr675992985a.27.1788534552547;
        Fri, 04 Sep 2026 08:09:12 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb6a200sm232295285a.29.2026.09.04.08.09.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:09:12 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9103be3b3d9so16193496d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxaBX4HGRCGCJOOlo3mDuzuu2JCXmjfE6PcGY8S7LdeD9FVBb5cCwSN2grraq6Vs1MnWqhSEjAokU2R+8o=@vger.kernel.org
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id
 71dfb90a1353d-5c7ed81a4femr3374662e0c.7.1788534167484; Fri, 04 Sep 2026
 08:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:02:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
X-Gm-Features: AcwNN1XqgKT4w_HXWtn4Y9fm8kvbc5sNYhBHCQ08jgA0R_r3KSaIYmzU-ZXgbgE
Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
Subject: Re: [PATCH 03/10] pmdomain: renesas: rcar-sys: Add r8a774a3 support
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

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G2M
> v1.3 SYSC, however it lacks the A2VC0 power area.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a774a3-sysc.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2M v3.0 System Controller
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + *
> + * Based on Renesas R-Car M3-W System Controller
> + * Copyright (C) 2016 Glider bvba
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/power/r8a774a3-sysc.h>
> +
> +#include "rcar-sysc.h"
> +
> +static const struct rcar_sysc_area r8a774a3_areas[] __initconst = {
> +       { "always-on",     0, 0, R8A774A3_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
> +       { "ca57-scu",  0x1c0, 0, R8A774A3_PD_CA57_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca57-cpu0",  0x80, 0, R8A774A3_PD_CA57_CPU0, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "ca57-cpu1",  0x80, 1, R8A774A3_PD_CA57_CPU1, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR},

Please add a space before the closing curly brace.

> +       { "ca53-scu",  0x140, 0, R8A774A3_PD_CA53_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca53-cpu0", 0x200, 0, R8A774A3_PD_CA53_CPU0, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu1", 0x200, 1, R8A774A3_PD_CA53_CPU1, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu2", 0x200, 2, R8A774A3_PD_CA53_CPU2, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu3", 0x200, 3, R8A774A3_PD_CA53_CPU3, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "a3vc",      0x380, 0, R8A774A3_PD_A3VC, R8A774A3_PD_ALWAYS_ON },
> +       { "a2vc1",     0x3c0, 1, R8A774A3_PD_A2VC1, R8A774A3_PD_A3VC },
> +       { "3dg-a",     0x100, 0, R8A774A3_PD_3DG_A, R8A774A3_PD_ALWAYS_ON },
> +       { "3dg-b",     0x100, 1, R8A774A3_PD_3DG_B, R8A774A3_PD_3DG_A },
> +};

For the content:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
