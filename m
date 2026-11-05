Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869924;
	b=QzwHm+YAq0N0amojqE3lGfjgdMr9qxjfuWYifKDlIQQQj3N4FB7IEY0o878yxHDd6vDw
	 EGyuQk9ccbVRm0BZp5iXcNxoy4pR8AYRFLdEUyVnQZzD9o4ADZmbwMcADJV22YHIETbTm
	 DxfS5Ak9ya53UJGE6funl3fHKMyjNy5moHvbDf0uWtxE4ugUpy5dYmeGB5UusrhoVu+dv
	 p8wSinabJNuzp7V0CkeGa8x52ldc9PdYOltYDqD4ZLOTwQnsTwuV54kuZ5V6tzncNrZEn
	 DUjLDV7DLmSPloC3JMzXhIma3myqfLQA/7GU30m725QoQaSbaUy6AqqQOGFqIYW7CJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869924;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
	b=wZAEd/Aj+iK8doQjDRobBrhIgarTEFi0JKVfBzqUZr0q89cob+ZtCVvQH5DDleQMACjt
	 4ePilRX8/6iQ+NbysYqN3aA0pJ7ELLdMnrMITrqUjxroCFjK40AZAKIG78ZdvESMIFY0r
	 PRLJknLtSHFvSw7B/kFio+DOQLG4rTA0YxKEkzs82GjcZeot2F4o7oRE18qeeL5NdQgEy
	 SMtxCQ/AaXtAdTl4KWehln0YX/701b0B/wRDM6RxklzAUz08UKJGRAzW/p+TiejvVDJbx
	 1RZVMIEFQQNu0TxpYBzKwr1NIaUf/cuGZ5zxdpvn9Xki0GZG0xFep8YC0BfFNpac+hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E2B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso953770137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869923; x=1794474723;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
        b=Iw2x4hT8nkVL7uRZcUfjT/CJGdeEsbss/YiHpjGWlCdpFsu8HN6NmOU+mkm1XTrp4B
         b1ctBEII2GnjsQ12Gvz/55DLT0GisM+U4cj8upUobFZY1kvxGzn2/SlAviMRYLnj2LuS
         1yjwWRFpjBHgPdO0v0B9bAi8qqH+HwCiPwpoiZv4eJSc1lPI6oQGPP6YlOI4Uu3qIGxK
         jxL1WBc0I/t4b2O1h1kc5DhASkSi8EarUe4uZXuWmFO5lqgjKtqG8Sk1fhW/9jEv+QRy
         /EcgjozZg4mIT22zTJhiI9UB241DSYNgezC2m3t/N03AzEtTj4eI8W2vx5y4Yg6Pb89q
         zfnA==
X-Forwarded-Encrypted: i=1; AKwUvByHvBBblAfdf8WLyy2rovaD1oRJhWXh3RDLc9+jO7KHUVj9QGq0PjScRTZR7roekw50ovI21R0bl/nDK+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aq1Gb4fbDZlCZ4QwZojdbYE4APuHAXRfjnc0eDDTmgp32/jfw
	XcxOsFih8UjuFHMOg6/S/wl9Gh3xksxFlIY6tuL7S+zmhh07JHE2lA+HnoqDucFCNaw=
X-Gm-Gg: AYBFou1vWyLnl+dnjrKBUqtsBDn7BGzar7o7i4pVWPep2Ft9gM8LOlS65z0kuXPYE0U
	knj86YZhXbLy2ZOGMn1V3VoJ7J4PyWSl8B4MihXTFDtDYP8j5/Dle8ezhoIEH3e2mq6spywO1U3
	2KJGCG3AcWUqvY3D83vRkYBPw9FoCjxSJ0g9bTAqzqB0N1dPwWth8b3ERV/PEDPh2hfs2Z3WvYh
	BBjVniu16CKkQ85Cf/UA7s4uyAxLm8fm8ugt9DCBpK8EZm1QM4c6cVK1wfUXE2YRg+h9/tCNW5R
	Nljlqf3vCmm60YQbsfR73+KmSVK2RCXcBN4mgw/JvM+lCKSeWMCjE6O7zaEWDhou7BLMsW3Cuk0
	KhvJCc8aYcCgl5bv/3Q/a+akscv82nF0FoYLZv20nxZRC6i8BoSgVp0EGAK28izo7dKUbiWAac2
	MrBOl+log/ZpkoJboCNcCpFGCh8N7cgEj4aCAKEMn17KF6efQnWnUNJts2Sxy4uzf8q8OmbiPhz
	2iC/cdiU/a6peC/gDrLnK6Q9ngcbGHM/Hzigzvhas37REn16RdFz3GRZz6+K0Moa58BfOUghF/n
	3xE/zWCcyqqJWlHIBMT7hCXWwqNkRxuS1wKVzQ1c+4wr56+vjevBWAhCMZVUXiplMg==
X-Received: by 2002:a05:6102:290c:b0:7a8:10eb:96ce with SMTP id ada2fe7eead31-7d07277c1d1mr8248406137.4.1793869923127;
        Thu, 05 Nov 2026 01:12:03 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d2693sm3974339241.7.2026.11.05.01.12.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:12:02 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-998749fe872so910760241.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:12:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw9oGj4L0CqWXKcXfh4Qws5V/G6kyYoiFsLpGuANMFDde8QOfbSvxohTkpaYipm3/5xBqogkae7D8hYY58=@vger.kernel.org
X-Received: by 2002:a05:6102:a206:10b0:7d2:8610:3223 with SMTP id
 ada2fe7eead31-7d286103264mr1300643137.34.1793869578105; Thu, 05 Nov 2026
 01:06:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com> <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
In-Reply-To: <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:06:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
X-Gm-Features: AclHuK_EWQ4VeHP65pJfIPjcWj5wVVyn8PWm9OHeuqD-F_-a-ZgbZgStzpLwqQc
Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>, 
	Yenchia Chen <yenchia.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, 
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong <yibin.gong@nxp.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kezysztof,

On Wed, 4 Nov 2026 at 18:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 02/11/2026 18:54, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Replace open-coded assignments to callback and callback_param fields
> > of struct dma_async_tx_descriptor with calls to the
> > dmaengine_desc_set_callback() helper across serial drivers.
> >
> > No functional change intended. Prepare to make struct
> > dma_async_tx_descriptor private to the DMA engine.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >  drivers/tty/serial/imx.c            | 6 ++----
> >  drivers/tty/serial/msm_serial.c     | 6 ++----
> >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >  drivers/tty/serial/pch_uart.c       | 6 ++----
> >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >  drivers/tty/serial/sh-sci.c         | 9 +++------
> >  drivers/tty/serial/sprd_serial.c    | 3 +--
> >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >  15 files changed, 29 insertions(+), 58 deletions(-)
>
> ...
> I did not look at this code at all...

[...]

> Therefore:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Then please add "# samsung", to make it clear and obvious.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
