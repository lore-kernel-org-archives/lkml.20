Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4120D2D9ECB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974777; cv=none; b=GD73XTBaRvHbLj3cEI1MnT+gxrJsUdLLr1g8LrZwh1/Qo+0P6ViGWLBNVxtyKEpf3AVy8qizUKuOQUkNNMwE+T9nzWQWPvAx6BGMMuQQVnI1H7lJRJcA3Dxw6cYO5OGcyOS5bZ69l9a/kaV5iE19Lo90A8OO9Vv84sa2s4POXOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974777; c=relaxed/simple;
	bh=IWy4s88MhDwNpHOdGe3jP1qXGMxg1e08ypz8dpiL9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bf15n80SYkVMH1tK4mBI5e5/4FLF/0bPg9FLxUW6tuGvwPyQ0aFd179SPpdLHkGVQUDY7juP8Lu36JBqXOxr3+ny8WpRnk2RKUq4Oifk0FOBfsO+RhOmw95lmOgquXHur64QVUftQ1B7sLLtjuCoulmVpK88GKPKogOAMvsE+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd3208so26240696d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974775; x=1790579575;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOgPfCklfblv+g6nVV8jDyWvhZtKrbscHFmS476/ss4=;
        b=lJiAfqyIZGp8k/Il4DF/YZf7obwbc1U3wVxWE8xQDnUHgu/jgHNILfQGIRA2SpNfW7
         kQzF3LCJdeIuUaU0oAeLAgA8KAePbbzc0ff0Mc3AQKXzgfGDuCgdqXhREgh9hJtNnyNj
         /E7W+BATJeALQQ4V60/4x/ewcrxzUe2y/FkqRLHXu7n9NxHidivCbWqRt1LV+F6EOmYS
         JP6o1ijdkS3/PGOCR18DGoFES+cgGJGah1rnwYkwLA4SSJtDYAollt2aSg0rRrpZygMq
         FWpugyC9Z4YuzcHsazyqTuX2PLr7ONwJ75IcpFdZ0DZMP2QAZOB7pQ1l/f0nMnDUYJ70
         jEPw==
X-Forwarded-Encrypted: i=1; AKwUvBzlSw3Wr17hKVALaFuza6YCIqoaEqVcHWR9lGZ0LUWGaOhO3rChqxmJB3bCECu0tocOITXXILyI2rRC6o8=@vger.kernel.org
X-Gm-Message-State: AFuF++m5HoQ+0EeO3xqv9dkAs0fH/BZOmYbT6oVjOPZCLFxCtu8Tuk7K
	rVy4zEHfm292l5WHTnzmg2jKlG52ibV6+KOIybwEoZu4mKq3vW1CS6MXO4xKekrj
X-Gm-Gg: AYBFou2qON4CjNxI6Md23ShlYbc1mYqZYlfH5tG+FkSq3iIXq5KtfaXPWOnLlOaeEoZ
	7Jao4x9qtTudjwb4ntI1qBxwRJybOTKGYlzzjW7v17F5qCFed8ar4BnvyqdTuVxRQgLeDo/yLyf
	5VBxiEPlTjWKe6mM8jqBZpYrd1mwN0450awabwD1avDmisS5R4a2aeGmdfUybQBmq13iTZG/VGb
	V2AbjrE3eGM8amwDygHWO4I/DB0FS63m9EqUYoCtC8UAHCeO874WOWFTW+sMdrq3isQEek98Fg3
	yFtjm1NQpmjwe/SyxgGrDZEcbOxnaUB5HS0k0uD5ZpemD7q969o98CgWpWvZTZe/USuc1QW1Q6e
	J95qz/oj7nMHs+yf7Z1uU040EpXOuo9drWTGvFbVRuJYmmMWD6PnxnBTLfOc8mpDw9/78qKozvH
	hzzMkcpeiulvOJc64QE9T6UDqsLYmHEKyStpQW4AQ3aL6fbgi3sAWASll66tlpPqVJChXXxTh1l
	b+r7GnCJPPQ0XI88eLcq7RpEdusPuy3l5mM0Q==
X-Received: by 2002:a05:6214:4013:b0:910:3453:66e with SMTP id 6a1803df08f44-912a7fec9d3mr86144746d6.32.1789974774989;
        Mon, 21 Sep 2026 00:12:54 -0700 (PDT)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com. [74.125.230.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa80d2sm62392896d6.45.2026.09.21.00.12.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:12:54 -0700 (PDT)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd3208so26240646d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:12:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8xRD81iiSlAxMxbsJY4w5Vjt88YLYxNlCAhFnNex3drz/FpzrXO9d8Tc8FtJ/nG1VdAlz4eRnx4jN2Ko=@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7a7:198b:674e with SMTP id
 ada2fe7eead31-7a7198b70eemr2080779137.35.1789974354429; Mon, 21 Sep 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
X-Gm-Features: AcwNN1WjYVMR8LtQc9Hk29H2mvcKQfYOy_09b_XHHWkw76vwCkEFuElZphsH01o
Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

Hi Kieran,

On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> initially supports the Orientation types and convert existing users
> throughout the code base.

Just noticed these are already in since commit 6ab5acfb8dd38729
("dt-bindings: media: Add macros for video interface devices") in
media/master (next-20260903 and later)?

> v3 collects tags, and fixes the typo, but drops all hunks that do not

[...]

> v2:

Interesting changelog order ;-)

[...]

> v3:

[...]

> -v4:

[...]


> -v5:
>  - Definitions now accepted in linux-media, rebased to get conversions in.

Oh, you say so here ;-)

>       arm64: dts: renesas: Convert to new media orientation definitions

So it's been safe for me to pick this up since v5?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
