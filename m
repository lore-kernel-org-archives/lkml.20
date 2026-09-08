Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CD454B1D4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872710; cv=none; b=tvCaIm1jGuM3FNj9Oc3TaJAerKcZoNhvR/ckmtGIuwObp5TVuYOmzg9385Kv/WzLe3dvK5V/zshiGs7yChdTjCuhLQ7q7QdBuH7bJjExmRdO8xAXS7IgZjNFkZgmA0A6uGyrwONDT3GVGrfVtos46QEbL0r21AlCR7sIFjclJ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872710; c=relaxed/simple;
	bh=eGwYIsCScQ1MoY5AdqzWz6Y6GCZJqDlAiO/vY66STK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTPI/8LNHkD9slXz2TE4athqRW4UScjg9QjZ+QnwB4WIQajorc0gszv6xUKVXqN093SHRJTCazq/gVnHhYaoYY8w2B1HSxidfOPFrUC6C2ePLP0XusZrGG8UK12y80Ia9tFhMPk8OWnOlRprLrAPv+eYFreZjjnVAlWpLxpm2wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so3069239241.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872708; x=1789477508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OUHgNmhkRIilkfVPL7PZ1sjvxPEaa5xqUS0CzXrrac=;
        b=Ro/jhmk+QVEoplDdpcF0ynHMSyfaSynaDdvF7eqZO5YLO4/3Wv46Sxj9sR7yThT3d/
         vGObka/XWuGPjun8hDG1+aFXBjMtEsyC9F+NS8rU8siqV9oKuXxKQkhcIEmK4FiSFnS+
         yRteeN1dyzgacZtSjNFvH1/SAJdk2JGcUE97AuzjO+tSETt9bj3kzgO7uGJlQ++LU1d2
         smcDqZd00m26p7IkYgXOTgq2oQqNTkGp5KOYit7nAUTZn0asIYGHTlN5QuNFOf9GZ2jr
         qpgpJ5Gvp6PwcLkaccZF8RyHHgnqeJomfjavyvSrcm2i/pi7BUY0HZikq0Aw2G8wVhVg
         CwxA==
X-Forwarded-Encrypted: i=1; AKwUvBwrYhZYSEX+cJmavgD6jeB03HBFRzCy6tM7E7wa3V6Apl5NG5hkwBgMCyJx/MOvBi6sq2i98TZsLsPGSPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nITMm+oy87ZVAVzeLJb3ExCzllri4LdErgDwMjTX7MfoIS2wFT
	2VHo7hY6BlVeO7+mMHtbMLY6PtH8Q1TNH53ggRbW9HuMVicTasaLfG7HDZ933Ea6
X-Gm-Gg: AYBFou3SlP2tUi5xpTddkCiItR0nhxdnY5qTlDci66rwJ7PrfEjxOWMzEufQjBSoiYX
	uqfEBiyMjHRIKRW16o0qawCAk/rO/jMr4EPoDtUVv2J5r0B0ZsNiYuskjBpFlHCke5L7DEEi/SX
	Fv0LbD9Dvcl1hhDyFVyd4QecVZEyckM14X7n86Qau55UrCV3ORctrWiRUxu0kQ3ffZJ+ZZOS1zs
	wIRjLQbn1v2rdPPAmDW+CtaNgYe6D8ltTOMSVzWNz0iWGPABmqrsJDNA0jnyp9Z8z5cInbh0+BI
	sFBi6hQtLTdd9jFfmTuai0EtOGTMfFqrEHHQL8u9P+Xyrh3BleFQXlt0oI4XU8kFd15hsAnIUsX
	P/9OzZA7qEcJJI/zrbtq4GQDc030dh9kXpNpQaXAC0SZg9/+t7FN9+ElYpl5CF8x1nFC74Q/aGy
	t4pwvonkqA8NRTcyvaIHmeij+gPr0LLvQU41RfT5Hw86h+dXif+XzY9ffP4tHO9zyZAOUHbDtaG
	hAb+l/WSbYK3BpMMG6Ifi2Uww==
X-Received: by 2002:a05:6102:5093:b0:783:79ac:9db2 with SMTP id ada2fe7eead31-78a4a64b7c6mr10992068137.3.1788872707947;
        Tue, 08 Sep 2026 06:05:07 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm9344913241.13.2026.09.08.06.05.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:05:07 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97e96666dd6so2673758241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:05:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzSXC/0KfLphjFX5IEJ259EDmgT6u+QQz9kr0JysO3OFGF/jso5y86Jwiq8jJCcWFzYDVK65NRovJBA5eg=@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a4a91b269mr11781521137.9.1788872706596; Tue, 08 Sep 2026
 06:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-11-biju.das.jz@bp.renesas.com> <apA0d2tBBJJ9FMnJ@tom-desktop>
In-Reply-To: <apA0d2tBBJJ9FMnJ@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzDhSQ3Mor6ANhUPoghGNtVQPRbvc+F2iz9Mx5cm_YSA@mail.gmail.com>
X-Gm-Features: AcwNN1XSNu81MBsTxUenVVeLwj2EDvtMps-yBFlHKAFoTCMXmjHGUl9yLsJu0Gk
Message-ID: <CAMuHMdXzDhSQ3Mor6ANhUPoghGNtVQPRbvc+F2iz9Mx5cm_YSA@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 14:58, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:44PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add DU and DSI nodes to RZ/G3L SoC DTSI.
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with DSI resets moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
