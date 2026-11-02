Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633680;
	b=Ml1bX9fVogTLE6OEF2ulNuF3jgJPDnzih7JIuBc7Pf4w/r+tkcu3gcJuN8rhbzUOcdUr
	 ZgDWImVf2gpH7Zo0P5Mw8puOPNWbeP4Re+MC/NDsTH0Imo+pqEvPi9mZq9iYVUgEMeRW3
	 oWdhldnL+Te8JJYIKfNS++Vy5m7PnVKWtFhE2vc4bwag4X4G023wvbeWKBAsMcXgwme7j
	 oeUvlUkrT+LLQVKyRMI9entRMtLIlXor+8LMREFN8u3Pt0Vlp7LqVmjzHHrRgtZlBQ+pK
	 YHPsQwxueaKc+pLiNG2Ayf2GBDhiqcBujvGYxCOreqwU0HxC4kGEwSIYGqWgjfNr+yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633680;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
	b=NxD0lJn4D3r93nD3Vhzik4XSn+P8hIS7zBhvh+mL6tv6AvfGXaCa5dwJH8KrcorcITWU
	 vYUcGEjzHUkPDOTFSc1a6miWBUnuYuWlzJmxGq6UDosNGrvuOmbsT691xatEyhFFgoA7C
	 iKFuVmjYTDGSdZSQrw2Y9IdRXn61Yj75ELBztbWn4OxB3MDNJ+YsQykwTAeIW4VG/2OQJ
	 wGVkaP8zc2eQZThWEFawPd9AAoqQopvUM/AXH42v+TXoQZeMPIoRNRWZJD7p3Sl78upNZ
	 QI0ZJhFkQrp2sdzOWP93mQhX0DIoLrltAKLZU2FtNnN/l8gqI48e9RsQiAHjLx3wb0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540960A0C8E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E540960A0C8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so3297015a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633678; x=1794238478;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DPzzjXN6693zqek1Hiy4e6/v6L1e3dbPSTYAvN3gY8k=;
        b=TG0FBysEXs8jAnBl7aF3b9fl53sZUtnm2/16bbLN5oFvkNLbCw+Vc1ot15626yEJro
         2+i+fN/1y77D3euGk7XW2MdH/2iM7XarwoOKygbIsWOdR3kc+gSSE4/cB0LDtAiXCUAx
         CGyTyPv77oENiF9LPzyENMTI6v56sZ0Wc5W5TPOm9O0TpIYFuaOlK6qaRV+1dJaLcFBO
         W09Zph2jGiUCBGR/13N0WDDk4ZNGn4Z0gVgYkZ39V57592YTgKxuKXwwO70Ay31szYw+
         As3kPl6OZESbD1Bj8PNL6IOd1R0rkiVnPlub9vh3AldhbjxxeQ6pm5o2Rp9SE7GNaO5V
         UdTg==
X-Forwarded-Encrypted: i=1; AKwUvBxnMMDV+7V4x6hzVGPcT8CtdoZIETXm0wjE81ojEk3CBRNrb7c96efbzsfpnNd7oN94LFJGrT8whunlMUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+qBbBr8LsoJILjnFf/ru0FLJct7YuFE6DLFCnAWTVnZiCf3kt
	J15EDtzRhrAsi6ygl1Dm1TDulsMOQAgNBlV9DX2j/2HZC106bQhD5XAwsHt19yXAVwA=
X-Gm-Gg: AYBFou0WFD49SFt8v/wcs1bzRiFuM/EEeEauYdetCf2op4C5Y7oARJWLcEbybqWWtnD
	O1+d8igE3TrMnTyL5kbqZLGw84Qvz16aGLVJZhZzNaeee78ksycybLY7uP5isLaXpCyl2jX/rT1
	p1ZviWppld1DxzHkwHgtdJjPzzwb6ay+fZLF2glEarS7yrOHugXiWw5DvpA33iDllOkt7RQzN6K
	CTYJSu+6QEXZlr1MsrA8wB8iMBxrpP59tXpkrAKVC+O8OKZmZALJNK3n9d3Q/+SRazvCkzDFcW1
	G5uL3QDiuxj/V32RENryAx2xgXhGyA56fRAallIUnucCrflR03HFI8gPyi7oSvlw8dCQROKePBh
	4D4jF1qFgK3cO0sG9hYQoNP1dEGYx/W2uJqfZp9JeR8dd1gk26PA/zaT9kYEqxTMdhKGi/hwgeG
	tc71jgOSPIsQvinjtZzY5hN/wOY5AosJMWjxNFWKcC+XMvSGrcj3x2Qp5m9QqrPyzED/jTC7z3c
	j2XPlEegKlw5u1xwCMQFocC0zvzOtMzy9YOV2h0uGjq29mfHmTEPcU6REKfCVyuKkxWjPj/MbTS
	eiXEWzPjPsBcg5X5e+XEyOqtTIVtlYCLOirWESLDoBaciBLa4oxMXkI2guZc9x//Gb8=
X-Received: by 2002:aa7:d413:0:b0:6b1:d822:7c72 with SMTP id 4fb4d7f45d1cf-6b4d4a821e1mr5303175a12.24.1793633678248;
        Mon, 02 Nov 2026 07:34:38 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eeb18sm3358616a12.6.2026.11.02.07.34.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:34:38 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso4193094a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwP4ctucK9n7b/rCJtWh6I6QIFx1eCbQmmybSgUuBVq7lzGYHALTFP8hbM3LuzvGvXiYFD16Mg6QYFip0U=@vger.kernel.org
X-Received: by 2002:a05:6402:c4e2:20b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b4d468b065mr5425290a12.21.1793633677911; Mon, 02 Nov 2026
 07:34:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com> <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-4-2e76b87209bb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 16:34:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
X-Gm-Features: AclHuK-3oq7-ogrLm01J4yJ4YAWbiD82Sz0qQlli6C8IYRXs43BlMTULNtsTBro
Message-ID: <CAMuHMdXqKB9Uci115CtDuiUZbpR=K7TM+Y+doQTBf1hK+LnA+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] clk: renesas: r9a08g046: Add I3C clocks and resets
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 12:36, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> Add the P5 fixed clock, the module clocks for the I3C Bus Interface
> (pclk, tclk), along with the corresponding module resets (presetn,
> tresetn) on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
