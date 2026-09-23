Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1064BEE4B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164042; cv=none; b=kZ+IIm8Fy8w2r+qcIu3wUqq0MDsz7Lws/MepIwActy1+GQZdV2MDFqEGnRVhufdbMFO0h97zg7jJF4EstJuuwTgWtwKcAF+ipYVqPytb+Bp9uwpetS3AwB3cvfO+1In/dcllqttQ68XXpXLCwos6ZASBsM8dkscEzkbg2EkMiPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164042; c=relaxed/simple;
	bh=b4JaTkwpgWpFvEutTKRNoLeVewrcW54SZ1KMcM37Cts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3xLHFDjpWGq5j+zjkztEbSLx3pbakRD98brTP1nsQcB8FTWGm1wV241YcQeNpCWCsaNRasEsVTryKtkeiMGhqqzD8JA6hUFX7HVFjBzLyIpvGcEpFdlIeaQ2h2s40Fm6l9RdOQIO48UZV8EuczjJy7cLBNcIdYlQ2ug/dPMCOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785692e59a4so435622137.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164030; x=1790768830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j73mt4KTqGgT1ctt3j5CbTFsrU2/qf0J6FeV5JjO/3s=;
        b=14KL6nL9IP65g/g2G+XV3C9RC+51QpF3UaipL4F6gsmhwkRZsL41qBkSr6o15axRQi
         1mLqr4q2cgtQJKTIDqd5GJAKcnTvJU/gJuQ95R4E1JuzqlMzC+e6c0lW31VJGTTOhNHH
         ucHj2zdbJHeYlPDbUQok2v8srODWBiuLwL/nxMFvcM9xDLeRVaoYJKWtrAZ6YalsIIVD
         xml5W7KBAF7knqk+EU0zAYtldv4kUgRy86NuHdTGehsb5dwdu+kK8fCvV92OsmXxTBns
         qboIdre+xsoshzSQo7gwsaX0ppWsYgduyDp3K1yD4OpTx3eQitXW/Uq5cxljQqcE16uc
         HDkA==
X-Forwarded-Encrypted: i=1; AKwUvBycP7bHFECS9Awn0tXtVf61PGJIbnViySydTKcg73kyDyvRT8neiIeSp9CXc8aByzvbd2YNSPwTEaJ4jXo=@vger.kernel.org
X-Gm-Message-State: AFuF++myZ7vJhKq7r0p5XC+an+I8VIRlhxbrdPjF6pAkTwVVefxj9mtx
	fE4Ptnw+eV+abSgBSmtjpqwzF8fy9TOZ4yll9enfj6xZEEwymRcjAo51ZbnaMonL2AI=
X-Gm-Gg: AYBFou3RmVqHYR3rkpDxb7POZAjprSo4eOsPmhuGKOO8IpEcqdlyE1skYBkbP1jt86M
	JLm/eXBL1AoRIXXPohZaKkP+/DHYedhblULiuBM92xa1SjreF6R2V5uG5IokpaBkEex8hbgmLNC
	0/fcbygfNqvCEeyilGwNPy6JOlh+P0zIuravf9+J7pu2NBlYnwGv2kf2WIO/y6pXh2Qo4QDQXgL
	qHdcQg2RoS2v2qikYn3HOEO5ZnmIXmh5lPxWgZMdxhkdZKVKeNxMvDoVCa2ZanA82Z8Vmg0CS2i
	D/jOHUYB1cgbkzgDZtQXAAU7XeaAf1U1rKI3wLgKusvW9IvUc/btvlRRoUaeM5bAH+kYFTzr9uO
	CVTCSr+QrU2l61CVFBi7Q7CM1qGazHKL6XvXlSPifS/ah3k9GobutO1jQS/rygxB3h5zuOzznU1
	gbpVF/MQVnOMI36yBNPMEo6cZ6AYwvWq2sGHuCJZCpL92V0IRFdL410SwjgfCHc9vr5sif8YvT0
	7E7omRsZix/aNIkSoZOtJfGOE/7LRM9cQktqw==
X-Received: by 2002:a05:6102:5124:b0:7aa:a6e5:fc76 with SMTP id ada2fe7eead31-7ac1ade8468mr2164404137.9.1790164029970;
        Wed, 23 Sep 2026 04:47:09 -0700 (PDT)
Received: from mail-ua2-f34.google.com (mail-ua2-f34.google.com. [74.125.226.226])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04f02bfsm2708495e0c.7.2026.09.23.04.47.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:47:08 -0700 (PDT)
Received: by mail-ua2-f34.google.com with SMTP id a1e0cc1a2514c-982db8d3ab8so413644241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:47:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzW+GNX2/ZcVq+ZUoyRkJlZLcXnV4g4X21Om74bGdwyH5U/Q0bAWvn7peNq+S4SY6lyEK3BkvF3DyrZN2g=@vger.kernel.org
X-Received: by 2002:a05:6102:808e:b0:7a0:eb9c:dcf5 with SMTP id
 ada2fe7eead31-7ac1adf33c9mr2261613137.10.1790164028588; Wed, 23 Sep 2026
 04:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-8-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-8-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:46:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMbponbT-u+b9YHUmvtssqxy0SybLF8BK4X+HXo8UcLw@mail.gmail.com>
X-Gm-Features: AclHuK_gLjg0SwxB_0NLKlTjLc_iXKtb2rGaVrXiIGYcW3acp--qIo4xNm9u0MA
Message-ID: <CAMuHMdXMbponbT-u+b9YHUmvtssqxy0SybLF8BK4X+HXo8UcLw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated include path to CPG, SYSC dt-bindings
> - Replaced underscores of node names with hyphens
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"
> - Added soc: label to soc node
> - Updated register sizes for clock-controller and reset-controller nodes
>   to not use odd sizes
> - Updated register size for system-controller node to not have a leading
>   0 in the register size
> - Added Reviewed-by tag

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree Source for the r8a774a3 SoC
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h>
> +#include <dt-bindings/power/renesas,r8a774a3-sysc.h>

Will sort these while queuing in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
