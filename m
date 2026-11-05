Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870129;
	b=IJaVpWGnm8fgT0d97TWf+LXo4BxSizJrDID8W3bXLmmLa0JXSWAAG701mJDs/hJ8FuyO
	 MQBOGGsu29Jfnxrj31FRM7qyxQnquv1gZMiu8Us2YDefk1qAozd/CefQvNy/q0WPXyMLt
	 VxHnwV7LtTZFyB9rclDartJUY9QDZ9H6cDQ36mR9g7saVbqEBouWF7P9QGWVzlsCbO77m
	 nsX9TvNHiJjZ5JNnJ//jYW8hgbWu1uNPxg2ROUw2mR7SOnnrqQDVMB9e6zGqMLpcx4oSZ
	 M55c0sij4qej0E/YbIC+OMaMuUGSYy0vuWqsHajhET/Z1hvTG1t0uBQfjC+snh/9ZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
	b=t0nLSVxQUHd8GR+2TvEO27J1rlPB+DoHOGlOBP9ojb+UcYUnsvJTrg3RdBvO9XD0hTVt
	 PodoXWjEwf2NXdvSztPvGVDvKOQgrso9vDLgsFypmZ2IAyfAE0RA+78NzZwdDNY5DEBSp
	 2oK2BdrHpR98b9yXirxqMtNw+TQgC/Q01h8ee9Os7o8H9nqFiQ5yqAxvUjsU1OxUUZF+Z
	 zbg5LudrtJ4BzZHROUlkwZphEaitqRIuj75qw45gMOjBToWFdhn9b0ucqaxFQSalVXaFo
	 yhQpimfyn9NwlAO5+2BYSh81DVU+oQCyzsgUvQJRGRflq/zmF6Xa5ezFgKi9BD0gJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61A3606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61A3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e7ad9f78dso196011285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870128; x=1794474928;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
        b=JRTyeXpTwDj7+fBK7y9j46KYB0U0W6lFlHdGC+O98z5ePgjCrLVC6r8TRx5O6PT9oy
         cT9hHXoWRqEDUx0LdWJ7XDOywmtNmtDKh1jp3lMDyZm9Onx77a+RAYk5elAtAY0z60Zj
         rFqWQQ/dDJuCBnhO6lpZR6AoH5mJO/HIretymCcpCMDI7x21vmDozbZGm0xYwosQw0I/
         TRf3SRkHJREJvusUc4RVTOnrsQPsQy8vOr7hHVPHCKW7lPE9W7aXEL9xed/exSgi+oh4
         p6FzRs4RaDIiGIDtuItSnObHnCA8UbbGWpCiyF7jbfaqvlIObIm/glRLfq4aE/JAE/ag
         IUNw==
X-Forwarded-Encrypted: i=1; AKwUvBwCEUhlS0Og3T8CiIfjPn/OYPk0+HX7Fodic5Wv1vgYXeHyvGHkAq9XM4cT1e08lfiQ8S4M5EnXKmxHqCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x+7eIB2OwYYIEDw/bN+pnY/k/A/mvx3Rj7R8eswBxibEW2+uB
	D3o1zZVeFbySGoj0kkVIjsYqsOTO+PqkAdSDxgq6Xf7IjF6zQX9kyDJbpOqmmW6eZDY=
X-Gm-Gg: AYBFou1xtiw41lkURIzX568iVXapaJGmy/D5HTv6LxKEp4Yw43h5HByxphJno/1Zms5
	e9E+ZIKWEWrsHhDwRfJxvgq/Zohod8g/HjlfR6l3hwBlq8QIbW5baSDGeiyEg1FQZGVYr78lfx4
	v5TDNmZGlIA64wzYLQ+A4vjDg85RDQ0vBauWLRuQb7Jz6zd6VOt16cfJ4jmhZGLVfEYdmGnWdDI
	ADT+Dr8tCrSdJE3FOphd2mVoq8KAkurfGEKv4W8NaoKGp9VT2JQVxOF+vuXGVKIV3dU8kDWoQPo
	YA4Y9E2beWUOXIBC4K+pt8x8SaYCW+Nc9ZYqNoE5myKCm1rpzS4dQ2CAzkFQCiCZn+Brz2LCeU+
	T31XraqLZSZDMeiMo40RfIRLIKavyBYtr/REhyvVaICKF5RbNszUkJZAh4y2BpgbIC9ymLOrCTQ
	6yxD9HH6SLMK8rTgs2tiKDqkqLQh0KVXO2Eip8StI+jU3sLYgmqywY1TcdWLrFgo/qZx0bnz3rv
	3p2vEDQ42gkY9mQJjWWDCPiaTHqskwUp4ZhWjMA78t+YEmTm6gweqAXNlJ2dFjfhcDHORwqN0Hc
	ABJgEzm8uPrJfWdNkTBn16/sKeB1LZvjvo7J+RXxL8f3NWZ7FwVVRlX7TSEy+8T4NIhbGw==
X-Received: by 2002:a05:620a:84c4:b0:93f:dea:3b7e with SMTP id af79cd13be357-9442171286amr2995797485a.24.1793870127742;
        Thu, 05 Nov 2026 01:15:27 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4814c0asm416090485a.20.2026.11.05.01.15.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:15:27 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93ece7a73b9so191016985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:15:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxZaY0gmsiY6vpWPn6M4tMQCmBikNpoVaGlVuZ84Dzbl+g6dgjgePQrPM0ZCbUD2rGPvwIpdP5ddKplte8=@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr9146730137.33.1793869733877; Thu, 05 Nov 2026
 01:08:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:08:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
X-Gm-Features: AclHuK-Joxo1A4dnmlO7hQLoxC6QCg3Be9nelvt7mgpbpsg01EIWZ9Dok6aJ4CQ
Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, 
	Raul E Rangel <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, 
	Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
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

On Mon, 2 Nov 2026 at 18:56, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across serial drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

>  drivers/tty/serial/sh-sci.c         | 9 +++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh-sci

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
