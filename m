Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494807;
	b=ETYxwoSwJapfoDgmWZs1pX6JILOsRmIcsIUAeG5U68LK3pvWiBK+lA6a0ClCd06o8fVP
	 KE5KvJvwACOfMxsU5oaZa0a3aTjnLDCRh5SWWuysYY73a3sok6p8ay910BAqQedzB85hL
	 itmzT1DZsyziAW/RHcDoxQzeN6tXwaCzmjY1SZ+LMiwqRt6gyvMXxgQ/KcYEGxyReFC5L
	 MSGGzU8wdMvo9MoZ3KRh+ZVlt/HkeHI5VaFeEjIQ/4oFS22IakLt3GyUFUcFvxvVfeVuL
	 W8HM3gUe7Kpz0R9XaXHNWYgEItKBvEmxQICHmCRTNYjjHO+HIqStHqWYUUhQpKaBjbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494807;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
	b=M6fy5/vwCa2lj57WVljaPamwM0JXGgEP7XCKyV0hpihnPSHyDrhKpZI3Vp88I0r4tWn2
	 F2ueYr2QQtscBhY+i4kXuWXw23XfvD4dVimK45xe24GUMnF7yNozpiF7tVEp4TD6dUqwa
	 uh7YKA/nXNUlihVlRH4+Z1avDYxrrU4sIf2vYdJ5tVsS1aFw3aQvKrl4kGgCxXSfk9ODu
	 6rAb5zmYPIcYl6xWIvukHDESiZXTib+WFpNX01dCmGO1ek0Oss8QHQzOHAW1sUqN9J4zI
	 gMEvasQdBequ1/HXiKz2Tsr2rXe5ng8UFxFhtbp5tk60OsJsj/ULIhLfv7W9z3HhAuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8793A606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8793A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ee1e4e3abcso559515e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494806; x=1795099606;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DeS1JutKTfuhS5q6pNbvmoX+jSrEwDPcQETf0SHwj/c=;
        b=b3YvZJBXiF4kpdc5/jG1J02sgJACEJaaFjK4QaGcOKbxml3OItOp/9vP2mfDODIf5A
         619HI7e3q9xdwre+FQVafN7PB9ieSZrVvtpxKa7ZQqp6TlW8XAv5fu3lFaLPRKcEBK32
         cv4ilQ9njDQr8mZRckm80KoGqqWJzDa/fca/Pm/q0NkrQ/iwuk2LndCCHZy/Y51EO9XU
         m32tasgPezA8yL7AO+sNESyqPX52lPmW0m0GPhITnUwq6lRaGG4LotCx/348HpARDQ9k
         h5ybfONs3t6r636I8y5BazOXk/bq0Tq1aFVTb7xoa65Vn6qttImx/wHxxXQWWjhqF6l9
         c/DA==
X-Forwarded-Encrypted: i=1; AL+hErFmeCaUqlKLLEOM19gFr0TDlS5+0/h5WN2tEg8ip8zllRcztmGG31q+SHird6yUsUUekMb1iIYYRBcIF48=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vQQVcgm1zQhziKhqICamz/SXXeLEutRJ9ajmiwwldMeTwCiUU
	ri5YDzf+yQRJf41e9xpmDzwqQFAXatfzEBfej5YTTzB9NNiKM4VDlG+eSnEmDELiI9o=
X-Gm-Gg: AYBFou2/HjKBV9IoCvifL+IYnwZTPkmMgfxFUw3w1GCks4ULQf4vgFcmECTSXxDpVf/
	vpYrWIUO49DGlCjmliu4yS059ZYPV3OhraYkUOsUdVcP/WWT+zJZCtSaQXfYq0zrTNGMKkqi/Tm
	CBFUoX+QF01POP43Wffu41Rqz/fkd6V5u1SNNIMQLQVUG6PXZNGyHQWPbRQ5TWAhezENd847Xnj
	Lxq//4tlCEHOFJ5cgmM/9pzraYgn8Luxk3F1oSBB6OSbfWujwteiXVIFWWy2z+WDR9I3XMkkaVI
	KqvBzujuF5q1HG5Tg+sio0kVL3bzZRU4TmKFtAbdLx844ct42vzXxh3Cg/M/HKqVT4vcb+Iqjex
	yc8EI4tG4qhD7ScUmJKq8Ak+ANjaCL2PCSQ1OLkvq7WttyPavYAM24OUJZXrHef+zJXGHdSdOub
	f2p3jiIy/eOIq3IKqpmEauikU+8yN+209LLkv7eOylfLqc/H50TIj9IKmjsOc2vu0SRvPHomeGT
	RM4E/054dHrXfk6HsmjBBJucAvyEkycqjNxs/RarsoK+4I3IdDzCTAtDnX6FAh/LRvkpkjujMdB
	pce0WIcvnsPGo450xARTetQDV0ZnYzUfS1RehHxG1pFcaivwJTqTBrtq6tp8/GkBl3xFN+Z+521
	6cjjUH8WNq4okWRV4
X-Received: by 2002:a05:6122:1797:b0:5ea:d32a:16de with SMTP id 71dfb90a1353d-5ee1c44ac5dmr2135167e0c.15.1794494806611;
        Thu, 12 Nov 2026 06:46:46 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3246f80asm60712e0c.13.2026.11.12.06.46.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:46:45 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso1398730e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGutFyJ/Pwks8d0V6754iPKhN43oTq/PyJ9gMP25uabInbhrWPqL7VCM+X6PvEtnv1owaISd7VKDgPvmro=@vger.kernel.org
X-Received: by 2002:a05:6122:398e:b0:5ce:d56f:efac with SMTP id
 71dfb90a1353d-5ee1c4995fdmr2096272e0c.21.1794494805148; Thu, 12 Nov 2026
 06:46:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-3-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:46:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
X-Gm-Features: AclHuK-vYdrIZUHe9zqdC5qY90reiPN1Oa4nwuum4GsEnnZB7I1s1LzmhCydy1o
Message-ID: <CAMuHMdVKr2fGN3k0LYHhoFp3Rp7_=KfTB6tQkGYDof0Em0HVtA@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] arm64: renesas: r8a78000: Add FCPV[BI] nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add DT nodes for the FCPVB and FCPVI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1574,6 +1574,78 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               fcpvi0: fcp@c5030000 {

Please preserve sort order:
  1. Sort by unit address,
  2. Keep similar nodes together.

> +               fcpvb0: fcp@c5038000 {

Do you want to sort the FCPs within the FCP group by unit address,
or by label?

For the contents of the nodes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
