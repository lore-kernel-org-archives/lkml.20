Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24548A2BC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174456; cv=none; b=NkIEGTJ3lvqT9tRhgRRpM3oBlRofPvF/HHCOzaSXEiJxdWq91ki22WfizcUr15OwhIsyabXMg3beY0l9rwdpMrGwwHheec7Ed4YEfR3R+3EoBycgnpSFEC17N/IX4XD/sdhJa17cknTQP/jEw4GmdiPzQ5KieiFCRTYKgTUvshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174456; c=relaxed/simple;
	bh=HAiG2uKeueum3NwR1fOOATsx3Nfb/2XuIB0lowPT5AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BL8it+b7eJy/xmp1spADpYLs0oZmyerkdIdIe3GMCQFRtwkrzk0skd3LuloVLf88pavmFSWrSpTVP0D2n8W9BWGx57DjBq4SxFlEVzVp60skEU25L11JX2SP2/Q88npK9RX/OxzQ7BqThbQPffZjCWD6R6gmmJBw4CjBug5ojCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea5bd53b4so365322241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174454; x=1790779254;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3QXVYin3gKtafVdGEnWDbswOTPSZ/Xq4fs9pj7jQGAU=;
        b=qT3Mji5/j3DkCFyB+SxJ3aCM88XQw8nwxReRC9c5mhT39PaC7pYW1Q9Tl0lj3ciM1r
         A868bVYaaPAIVJmLMFV4+0y75ibO/LeKUGSmv7bSMFQ8Eit6HvOwL85tn4XVqcffQvdy
         fsVbnrfzMY+gv4/2UUR9uoxfKFYNkEen9KhGVGS4TbFSJxPk3fEMug3EczsEk6s8HMOs
         PsEc6WYzqgwAjFi7iixJIBVWTsmZIvVEE2GQeG+jA7+svBL+WKBJLfXJE/ZwppGCAKqx
         4XE7l1wqT/rVFJv4bCxtOMGVoZFlAh2N8h/XOsA9pbnVUJ/5fe27K3gk8v0pz5Lq+xTG
         iW+A==
X-Forwarded-Encrypted: i=1; AKwUvBzWDJxpYyLqhv0m46IAgjjWWj6xLpoyh82FgVfN/uBIMCJ3EDhUGehrZLkrb3ihKNtIifPpEKQSnQmUveU=@vger.kernel.org
X-Gm-Message-State: AFuF++mVVAPjlT3vHGziavZ0K3FWLJhGXBT3fqcC54F9q1fLScryXqAb
	RCErWs8jsT5mWnz1DjWnybOT9d8B8wYrboC7yhYwOE1LJPdHHlJtgpt9DcdIMXo6P0Y=
X-Gm-Gg: AYBFou35koWBDX+lT1cJy9kqkrsVrg1gzYbsV84bDn6xb3vG5YUf0GULX5pTh6ZkU0T
	qdWthiMTv1CyggR5mr7CljBbeB+BR4h1XWYcKv4NpyTZqLVS2hW07dgXFRvDCxj26auV5PfZdNg
	nq4BQusnXZD1rWcfrE6cKd2KbSbld0ZVOW2nhinyF3TxAoMtSI/UzVtrCZJS50r1zwmlVN9cCdJ
	2LPsZDHmvKR+eAViDrJtBvgfxXiKzusnGCvSowWcN/cwaTjJjemOeAmvvSf995BTiOQNr7/mw+8
	2Oc5tR6PzS+uO76an9EsJIr4vS46vsEtHt3RejfCOXaImIZRHi2lsjjVqGE4BpNpsDhE703ZgWw
	+4KkgLwuyUnb+FbGMKJSS6ocej43Xzw89aqqINJcvPB0xJepFsPkvlYpwWEDlnSkJz8a/TERyd2
	+ZtDCAy5s7wy2qYs71BhU/4Cl/V3KLljcu9DuS+lzmW6kqHcujQc14/EdsDSun92SeivxIU+tle
	ixA53JPnbJ4Z7cueJht9jwnJ2QIC37ouBzX2LgYvxyx110=
X-Received: by 2002:a05:6102:6a83:b0:7a7:195a:1b25 with SMTP id ada2fe7eead31-7ac1dc35ba8mr2337156137.31.1790174453906;
        Wed, 23 Sep 2026 07:40:53 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm3178589e0c.13.2026.09.23.07.40.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:40:53 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a0477a4a01so301151137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHqQoiMQrXoDjgc8tcDvdtzV7/L8C7Lqt+0IcUSnyE/TQOh7VNbnryAzsYzD+vlbmrpf7eXxLQ47qN5y0=@vger.kernel.org
X-Received: by 2002:a05:6102:3711:b0:785:c643:a415 with SMTP id
 ada2fe7eead31-7ac1bb45468mr2431267137.12.1790174453060; Wed, 23 Sep 2026
 07:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907134037.1855408-1-gerg@linux-m68k.org> <20260907134037.1855408-2-gerg@linux-m68k.org>
 <42ad1525-fceb-43d6-aa03-d17e844a9ad9@linux-m68k.org> <eb987eb9-f368-4d28-bdd0-c289c3039c3b@lunn.ch>
 <46246a5b-3e95-4ecb-bc52-e374dc136514@linux-m68k.org> <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
In-Reply-To: <fe8a632a-80a8-45da-ba64-31158af7c987@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:40:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrRmvaEVjs4Whncybn-zVCKStC4gOpvwsnT+XRtm9Hbg@mail.gmail.com>
X-Gm-Features: AclHuK8JOpxbtBL9eo2JZ21xOlmZ2HJ-Q_I8grURwALj-s_IRRLbJXlaWaj0iq8
Message-ID: <CAMuHMdWrRmvaEVjs4Whncybn-zVCKStC4gOpvwsnT+XRtm9Hbg@mail.gmail.com>
Subject: Re: [PATCHv3 1/3] net: fec: do not use readl()/writel() for ColdFire
To: Andrew Lunn <andrew@lunn.ch>
Cc: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, arnd@kernel.org, wei.fang@nxp.com, 
	frank.li@nxp.com, shenwei.wang@nxp.com, imx@lists.linux.dev, 
	netdev@vger.kernel.org, nico@fluxnic.net, linux-can@vger.kernel.org, 
	linux-spi@vger.kernel.org, olteanv@gmail.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 23 Sept 2026 at 16:16, Andrew Lunn <andrew@lunn.ch> wrote:
> > The driver will always need to support big and little endian hardware, so I
> > am not sure how to avoid some abstraction like this.
>
> I was wondering if there is a linux standard set of macros which is
> supposed to handle this big/little difference, the macro knows the
> architecture and does the correct thing?

Unfortunately not.

Quoting Arnd:
   "fec is an exception to this because it happened to rely on the
    unusual macros: all the Arm SoCs using this hardware have little-endian
    registers (regardless of whether the CPU runs as BE or LE), while
    all the coldfire chips use big-endian registers (and don't support
    LE kernels). The powerpc variant of fec also uses big-endian registers
    but has a separate copy of the driver that hardcodes this. Other
    Freescale drivers already have a runtime endianess detection that
    is needed because they built both BE and LE variants of the hardware
    on Arm SoCs that could run the same kernel."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
