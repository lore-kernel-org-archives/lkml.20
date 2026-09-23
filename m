Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A642BE051
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164301; cv=none; b=Vma0D33yVkDrSGGVRqIm0jtg8G4fLyOrEpRdMOjjPKrptlMdAukvpD3BdUMxeAoczeZsKn34Cq0PKA7L+cYMniz6IIypRke39l6LkggJnSpBGr4Fyzp9gxFkIyNildaoTW2tLp89Lgpyik3MG8nTS/rXU32NAJyEubOhGddQEFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164301; c=relaxed/simple;
	bh=toH4Nu8X0VoWmbcPFRUFtTal982WrI4JYNV+CT82Ubg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+nRk81Ucy2NU9u/lWlRi5YAtfWgg9N7yTVJABkYRu/0wBzwpX1jGTOQFLJ39RGOK5pm4jgeWnxANSg36/RCGQD9CUkIFBNRgc+c1MoVFgmPbEaUNWyFtPHeUvrE9zl/WBhTn31YWChCbak7H92PNUy8Z0IL2rxBqSdizUV2930=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9852048ab3dso79235241.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164295; x=1790769095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AQBDufdUkXkchzPiebMikSu5M3FlCOhF16/kg+goO2I=;
        b=hjz5FImijE4CK98+JWmnMW4msxNWRf3fN9MP9jrxLTpfa13DQYMsxo8J3Ro0MjCfxV
         9vLSQnpikBPCLOEDCAGRI3jo9nQDrDDjfL4V+cicscM+CKqKgjeGl7oBb3xehWHsM+DE
         Oqj4sZzSix5656GbQlgb4PENg64XLxRX0UUyL0LvadR90Xf8dV3SIFXyKvYgfhhjc1tl
         P/7Gfyk2klqNNJfQrQfC/Hyc2U1BN/MlqtQYYrCxKg21zvWijhKiav6nnPV8YgDNN02W
         NmOYJKxuS/80hT4Qb1Wl3xs5hWoOn7dUk9JAYlYdGJhEHjr7QET2gdGIQvciUMZi+Yk/
         zV7g==
X-Forwarded-Encrypted: i=1; AKwUvBxBHG0EGyUJMRMvadqo9hFzFgDrMPmsnZBnIFbQs39+nwO0FbShyrjK+vru9xlu8h7XQigLeD+oFi7Scx8=@vger.kernel.org
X-Gm-Message-State: AFuF++k/yhpDLFL2Zka8QTbB8KNJASmJG9Nsaq4XJ4hW83mEPbDjTuun
	agQ/cK3wRq3ONNRyVW7wXr1lJ1RuAIx1zykF5FH2dePXElAbImOebMqr/Qryz1Dj/qg=
X-Gm-Gg: AYBFou01JzzOv/bk4shOji2n1KulH9QzagDWbLd5e+Dw4mYEQn91ig+waVhCuzfcuvP
	jh/6oyIoPCekfln2nCn57OhkRZ532ZQUpZz5c1qSwnwbgOC1epydJktLHyin7FvC0qrjfiLYGIx
	LzzW2eGNn/RS04wZfr9/5w6+OhrJ/I1omK3AzQDDYs8IP/yAMPKTSDP9T/ubwiGynReY+tJ7wsF
	k2IJvt5JRJqQtQ9i/6s2wK/kW8r8ioEw9wJkvFnub/z54HcGIGCmTYh1K7np26YzMDG4HibMOBt
	YHq8YinJDTbRAhE+rlESKXBO/NIKeUMRbRC/LgEgls1Negrt87X6YYWGxGGYrAv/T8S3b/6R7EO
	YbhyB9SDlGYqbQ6pTH6EyN0WRKRir/yQ2RdwuY819SnjVJdoSKVT15DKdGFsmAGRwWm666ve4Ge
	4GjkSI0eMqWW63glClbVuvCQ7urqMz7cohOGji/BxlVBwlybOAGHxJZyO9N6qDwx+wb7fON4PPw
	Ft0NapzqtHfeJRXpo2Ymjls7YnMJBWVvkNDHw==
X-Received: by 2002:a05:6102:5e93:b0:7a1:f7d2:e827 with SMTP id ada2fe7eead31-7ac1e25c9a0mr1949304137.32.1790164294968;
        Wed, 23 Sep 2026 04:51:34 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5674f44sm3079809137.3.2026.09.23.04.51.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:51:34 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78569cf871bso490241137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSEPtxpDXJdZhs77BPuYk3+fnnEs3dxwMjjQ327lAds2LOkHynsKAOZGhqrmx19L/KS6eMBQnqyaFJGNg=@vger.kernel.org
X-Received: by 2002:a05:6102:5813:b0:7a8:2a34:433a with SMTP id
 ada2fe7eead31-7ac1b824983mr2135063137.9.1790163794193; Wed, 23 Sep 2026
 04:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-6-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:43:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
X-Gm-Features: AclHuK9nw9pQ2eMsnoclR1kgUt8L_8mX7NzQtyl53d74B8AUYdOVbDcik9Ofq-4
Message-ID: <CAMuHMdW9V4jd6j-Lcma5Nr-sgqJjBbbdwcnO3s+YFmvUz5qQLg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Renamed file to include vendor prefix
> - Added vendor prefix to include macros
> - Added Reviewed-by tag

Thanks, will queue in a branch shared by driver and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
