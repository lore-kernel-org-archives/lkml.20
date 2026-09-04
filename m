Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44C33BBB9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534066; cv=none; b=tmNu7R+TsUYbDNKKSi9fFic9mLxQr7jvQDLEnht3pLxlilaicN2D0a/44qNAtxbuObJHi/sITyr5B/AHEQgAAmj+qgzQajbAplEye3wA/mPnA3IR5y8bZPp6/wQy/J6Wp3E9vQq1d0drIsxEHs2N/B/GqjReSTa0JVTQ+OHCpok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534066; c=relaxed/simple;
	bh=dxuiJN3F+W/TTKG8/DBhxTqg4U9X29/XkWqF1QF1YkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r32heZnBd3MNcCKXNtBOUnwAClcnKSaQWSgT+gQi4EhRC3v+idxCvfI51lWv1CiwBwfBGsBFJ/5yxwSpVN0zeAFJHYGeMJa1DB88E5xuMoK84P3o5CewRFviqcmO7HR64omFBnjwkvL2+2zaUnQHQ42mDR1cBvq9yFEO0JXYJWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so398640241.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534063; x=1789138863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIoiHSllQkJNgmmben61gMxsX8BWtDH0S9evEzpoUUA=;
        b=aYgIdWvGuTcrrBECFqYmNqgeJRL6uTBYeIjvvYWIqI3SKRQxdwZnJ85cURePFAECyU
         VUdMyhivKCsQCoFn6Rnh7v7/52JWTzRYgtsxZPttuGzgKg1uNfLgVpeaC+1IbmaOZRhp
         v8oIhXpv/WbnsunfgqP7Z2fQ2y8FC5J4msLQUt+VRNgzk062Uw1hHrOag8DPApe59ZA1
         dp9ZnAD56EDcVfOrC7HAaGaMJTqdcxbCwDnbERvs2g7RMkxd1LD0MZZqdkq9S498DxPH
         jPeabRMaS6zCsseQVv/nz098EZLeSAZaOuDqJ8IRK/DFjSQpyw4ZL6mONpIOhuYxayvc
         wLEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFY5LFHUkX3dW0pE5owc693C5BUNeFdh9QU9n4Z0+FI64EB7cwezHIK6XG3tIAdX3cUejXx+PLJG0KGbw=@vger.kernel.org
X-Gm-Message-State: AFuF++mW+mkVzy0VG547qmRpYqys3bNh7rLCsm0mvyw+OWr0QNG3tEjP
	3gkwrlNsFc5VWymZJFnTeejVot5YllgjgKr+TSPfENd5cY6jBkqmufY7o/eZjghM
X-Gm-Gg: AYBFou2g86eVrRox1hIBqqwdNZzeISRkLMBiMFI23QNxv0N8XvLlNfq7ckvRqkVfrog
	2RujM4QN3dhyOgYijDLD31kOKeEEqB+h5GOxhHGzVSi0IGeNOuJ6XI4Mk9Ijb3RSDgwkyPo+VGL
	fgjwPeQgKnntEUM6K9tQoYpy0ZbuCAVdhpVc7nQlhZPZW5ffMeGXYe9qkv6g18JKpRJGdJxFyTh
	rw4MHAYl5+88TjBiTkt935H9ksKHEhl+/efs/FOg9BLRvhl1eVmmHd5HSVG4RueWGu3IuvrmUBp
	kuk3pXiIrQxmwGwgnaHa+ApAJ6h1TDYb0IqTHRTNu6edzbU9+bv4LYUTMWxlKXbjuuguxlpM5A7
	kGam7p0JRgP3G5esheE6dYZqZiLaQtrxNFRZQ9iQ6NNYN1/SOHn6iTCPZfF18+4kd0dgHu242oJ
	mbyh6gp1kKZdtdB+SfiSIMxc/Hty9MSlsrhbHNgmuZ1tkqG0zxajiFIg98yFb209qmEb0ftZGQ5
	mORvx25U2zswCbtuakmdWOzvoh0MuJTCMX71Ubz
X-Received: by 2002:a05:6102:4409:b0:789:56eb:39a5 with SMTP id ada2fe7eead31-78a4a836e1amr1672044137.5.1788534057933;
        Fri, 04 Sep 2026 08:00:57 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ebb37fdsm1793350241.1.2026.09.04.08.00.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:00:56 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso506782e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHJu0iRHuwvG1kONsSS4cssnlkO1F+ZfD5jA+xnkGF+AcXub18ZvJFSooyQ+sWvTVVd6v/MMRgI+SfuEU=@vger.kernel.org
X-Received: by 2002:a05:6122:8f8d:b0:5c3:61c2:9ec6 with SMTP id
 71dfb90a1353d-5c7ed456d8bmr2814332e0c.7.1788534054755; Fri, 04 Sep 2026
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
X-Gm-Features: AcwNN1XGMcfTKgzVCocL_OQ77Hbdu56w54bgvUPYdeBOHMixmFG2F9qVHqoWoGg
Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
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
> This patch adds power domain indices for the Renesas RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/power/r8a774a3-sysc.h

renesas,r8a774a3-sysc.h

> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A774A3_SYSC_H__

[...]

> +#endif /* __DT_BINDINGS_POWER_R8A774A3_SYSC_H__ */

__DT_BINDINGS_POWER_RENESAS_R8A774A3_SYSC_H__

With the vendor prefixes added:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
