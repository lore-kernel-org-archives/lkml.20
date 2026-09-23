Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352794A68A8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164543; cv=none; b=cRtuVFdX1wRM1MkfA+ZHCOEbmswYYm78T7HaOS0xa4+XIM/571h2cqLWqSbYbppNIcUtPo/j38H3vl4QjVhOptstMehNCNgU1qPPuHQs0UywM/yZKSheENKH4TJFOKjAeD6JWsIBL9+Bt3G58qRDLkxgK1MFCZgc0lChmfN1qoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164543; c=relaxed/simple;
	bh=cdUu+2P+AtFzsdIyFUxyBK0BNNipSTAuWCzqPtH9ZDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXdYW02qhwXK36hpMBHWBgZMFqRSTJuCI6pSuuUq1aUKbp5KloQPEtjp1Tunhi5fWKSjQASI0bgmhRRlr7kH8j9DwKqx0/9w1KBGcWQJaCKmzM2knQjEtnxlzBhSh6A0IO2gPuoObxvVmtcREW9ytgGulTne24Dv3FLl/cjI7/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aab5dae09fso777799a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164537; x=1790769337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u/j7x66zXOrBYdEe6fVcwfenLhVDHg3t8DyPsU453Nk=;
        b=MFFIVC8DfEMWvf9cdxAp3mlwXLtRACYslNY0OpjXiXCDcoyhHjjr8sWCP+V7krkV1v
         jWg0OII7JQiUKXZeVRBM8AQyYzyvdbppVETibnZGnPqKVXvLrpxLYxkXlGPUqh3N7IvI
         T6tlfENXb+k/qoFiNvJ7vzo4fuj3iPyOzOCcERsSKNhMcsqv+XWpqfxz7OCMSxB3muU/
         KXv8O4g7yP/v4nGw3MpGNvxk0Pr3LqHm+tQL8gir/DaNd4UpPJXn8foCNHK7lYd7cZn0
         m0/aPqwQtCudzedL4x0ffjOQt1MjnujUkWQsmEw1HIN1ktASJaNHO0jegJeMNMZ2k/T9
         M2iQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtELR+JQsP/iojejuipikurT1m/Y91bDnoyulhHA0KBjyoonxa8MEpKtiN1VralLYGWSIAP76TCxRWMno=@vger.kernel.org
X-Gm-Message-State: AFuF++kgZrktHwYqttfX+3XpP+H8jiCQ1llTNZYRdOLiZUsD7+a5BKqR
	sRZGpK14VhHubr2cjbg3/EsxlI5zBM9LTuNLb9G58kFq3SpFx/ow4DHUlkaxy9DMORM=
X-Gm-Gg: AYBFou04GGp3A1iUCPh1SDMbMPrZ2NEAchUAM0LWJexc0t4S/vs53OqpS0P+FhGHsWP
	Vdjd1cOTVum8zt6/zs4U1MSRYhQhi/gZveyrUFnrKyZbrr7ELuG7gH9e7Xrq9YGHWVzvyxLqyfK
	nsbQ8B4cGAcR1NA7Y6cnEe9yCoMhSifbByKrBdmOaX9DxKolnWk+eFCjngKW2FoVBW2t+xWgjeD
	/5S/8DTzhDL087tYW4XZ6Gc7KVEunyIwFWBeMDgfGXpAoUwO35g7mqDZwzf7/wkGykYn0Kb2ZaR
	8c6lQ3tgfUJ2IlmPHU6haF8q/vJ0EHQrZSwncamM+MDzL2pEazAY5QjkFRGHWLIv9yzDmBRjYPJ
	VU7wrKTAY1tZyLg8eKpsWsAwyJqXv2T0lFmTYM7/pd9UURUuvCD1rYRaiDUsHvNYJ5iD101GFsy
	WFIk1nFOZeenxUUw6FiytuKkAc8bUbLJoF91jqjYRRb/pYXgsvmabytgNJBJHXmKxyqWAewP56u
	cmHjCelBhXNr4klCmmHryddztDYI5Wv61ah
X-Received: by 2002:a05:6402:5407:b0:6aa:734a:a084 with SMTP id 4fb4d7f45d1cf-6aab3b9ba15mr2142295a12.27.1790164535189;
        Wed, 23 Sep 2026 04:55:35 -0700 (PDT)
Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com. [74.125.228.98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37ead71sm1526308a12.3.2026.09.23.04.55.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:55:34 -0700 (PDT)
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aab5dae09fso777706a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybJ9dy71PTrxXXqqZogTiMkmyghQEi/kPGtZT6Lx3wQvyJxk708Fg/gyxHonLRukLHGvyb2MsJtDqPhEE=@vger.kernel.org
X-Received: by 2002:a05:6402:23c7:b0:6aa:9fd4:987a with SMTP id
 4fb4d7f45d1cf-6aab3b985dcmr1953506a12.20.1790164534610; Wed, 23 Sep 2026
 04:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:55:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuY2esH4hTQPQ2dvTu759ehPuJ2uOimX53y9We2-PS1A@mail.gmail.com>
X-Gm-Features: AclHuK9-osA0MxsPMPyeNE-WDoQrmvKbRa3ko9lUZaESlIsKhQY66FTC8uoGLsg
Message-ID: <CAMuHMdVuY2esH4hTQPQ2dvTu759ehPuJ2uOimX53y9We2-PS1A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC
 main board support
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
> Add support for the HiHope RZ/G2M v3.0 (a.k.a. R8A774A3) SoC main
> board.
>
> The RZ/G2M v3.0 SoC main board is similar to the RZ/G2M v1.3 SoC main
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. I2C, GPIO
> and sound) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> ---
> v1->v2:
> - Dropped bootargs from chosen.
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC main board
> + *
> + *Copyright (C) 2026 Renesas Electronics Corp.

Missing space, as pointed out by Sashiko.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
