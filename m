Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E006353CA68
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870709; cv=none; b=jBKhW7/fIy5mNDv8ZT0O+xMrvBh/h2RAD+/zuTAC67ehAURPzrb1F+z9EsxVDAOcb0/2ubNvsD1CCoDxI6pflqW/W8EfIz5HVrmmm48Uf9UCs0ojyi4Iko3j/vKJ/qG5+GADm97Ui0mBTOOKSSMwv4lZvGTEYpk8lDG64mzOTgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870709; c=relaxed/simple;
	bh=xjqICCjmH0ghryW8dOBfRncjaOxBbTFkSNvlzCO9/PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alVhFgYP2mAZXAfqNgqqxCwzUNcoj9Bn285oATSUm/tYw3vpm560wpmNs3USGU58hmE0A5yH5mql0skJFU9kzH1IHp5/evY+AreshLvqj7iho2JybCKJVsGi6ydGbzwgPGB6XpJQ/Xl16+lBRtCfnblAZE0Yd63QL6P/ySIeyD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso3983513e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870706; x=1789475506;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvhvPfE1o8U9V0xY+ZBtjmprcW5MUShi55REbbGvMBg=;
        b=NawpfHxYnzfNme5cIG5gXuvc/radW5iSb3AbmpZgTmvrKweI2h3AB9fIcQGFVR3JLD
         XWAPUaVBEGEvDkCk0zKDJ5TrCSk+hk80jvcZ/TUnmIol4DdIW3OlKVAApgsDUrWG3l+y
         zRkywwwr+tDfkVZxzPfUeE2PF6JTDagjN1ksPQyHolJWyhrXpyu1qPh/0ybgI/719U1R
         nAhrixNCrvR81ZoEvQaHkIp5O6grr+yp4ItG0ZHeHDvXodoOe4krZgtIOo8I3RbkNaou
         bEGR44s6Pn6MOQRNHG4EHbWPfDdvQEBXWETTEw8jU8xgKw+8S+8Fe/vG9XnIF8uVBo5r
         N7iQ==
X-Forwarded-Encrypted: i=1; AKwUvByiup/ccqH1i2sw7xJm2ZzU5W7mWZMyQWBZ3rh8eIX9rX6ZdGuZsu7WRam7D0/LlvmtMJ0x5LzmiXK9p8s=@vger.kernel.org
X-Gm-Message-State: AFuF++lIuGpidGMu5oq86oXihFNgdCi7REZDkmpXqMD7u+3U3Cy0ucJC
	He+UbRjNR6FKpaaYuY4JFtzNkE/b+GH6qAUwxYUg+wmoraGn7L4f8iMMfOiuYpKD
X-Gm-Gg: AYBFou05E6qbm1gUYJlbKzBe3WHbQXrZrSSeaPqwaN0mht9C5YteOOap4jp0qeEoQMd
	LSbB07Q5Id/w4oXWbmta2m0YTXSRk/KdNTuJnksHoyJ/rTRsh0RNA3kHegJiDP5A4+iKlUFzDab
	3UMoSKjBId4mF1DBhvguEDzXJiD6gGSxCg2zzDLgsFsnP8kYrMwOmEB9Tl/uyW8RrLG0daP4NOj
	BlhgwADzvNxZEOOJqy8ZFd2/j3kO4k+dPEUry39K3lj0uXy7VrCxe5tFoqurwkbqv17FqO4mN7r
	C3q1bpCQol+7U2IVE48wMvQYw83SfQEAeqt92yM2bJi0Oa//S92arnpvjvy1Z0gh9R4d2lxNuwQ
	b/83U2XDnLnq/cBPD4lihwUyVmenFbksqoX4BFieoAoTnK1ly7LI9LRclN0/4S07LS8LPNEfLnT
	IWvEcK2njDFT6OiwiTtnvIKAwXWEliiRwIWwrGc31HnICIGF5tdHhB12MoVebOLsn7qhxm5nwJ9
	PO+kNfgCWhlu6F4he+YSEk6KQ==
X-Received: by 2002:a05:6122:2205:b0:5c7:ebed:1018 with SMTP id 71dfb90a1353d-5c7ed7f9e30mr14072267e0c.8.1788870706461;
        Tue, 08 Sep 2026 05:31:46 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm9265862241.13.2026.09.08.05.31.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:31:45 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so3046910241.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:31:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzV2v4FRI9Dd9KLCAdIwxTPEQCzZFc3/6UTPdAb0cEoynB0srSIZw2OmugLJEHuIEazE+5qvb6XmYe8hIU=@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:784:b9ec:913d with SMTP id
 ada2fe7eead31-78a4a91b281mr10556868137.8.1788870699731; Tue, 08 Sep 2026
 05:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:31:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
X-Gm-Features: AcwNN1VHwQtBXkE1g5B-tKWZHl1EPxPwrUnATnMeQZH1DQxtt1IMi9pdue90c-g
Message-ID: <CAMuHMdXBFu=W1MnEA+Eu_zzUy3qMyFRbbeLgYn0waxMdr5cAnA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add syscon support for Renesas RZ/T2H & RZ/N2H in
 CPG/MSSR driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 17 Aug 2026 at 21:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This series adds syscon support for the Renesas RZ/T2H and RZ/N2H SoCs
> in the CPG/MSSR driver. The CPG/MSSR block on these SoCs is a
> multi-function block that integrates several system-level features beyond
> clock and reset control, including clock monitoring, write protection,
> and peripheral configuration registers.
>
> For the other IP blocks to be configured a syscon support is provided in
> the CPG/MSSR driver. This allows other drivers to access the CPG/MSSR
> registers via a regmap interface.

> Lad Prabhakar (7):
>   clk: renesas: r9a09g077: Register SYSC regmap

Thanks, will queue in renesas-clk for v7.4.

>   arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
>   arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes

Thanks, will queue both in renesas-devel for v7.4.

>   dt-bindings: watchdog: renesas,r9a09g057-wdt: Add CPG/MSSR syscon
>     support

This is now in watchdog-next.

>   watchdog: rzv2h: Add syscon support for WDTDCR
>   arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
>   arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

These two have a hard dependency on the first five patches, so they
are postponed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
