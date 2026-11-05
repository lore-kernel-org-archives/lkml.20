Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840953;
	b=cNfNgOFecBqJR7S2YNXXyD0ifHVsapm16JZZ4FZezU0a8RniXll04OhlZXVf9WmjjbIA
	 QxDRD9oe+RSfn1n2UJWduyYzKMdaWdD12mH9mEVTjKf9czIzCkBHyHbefSlZLbmWxPreg
	 3z7x4B6ZyzYKkn6qJrM+9EoFqs7nBBOJ3u/PU3YEt0i/o1KyZjszpuK6zH15GqWYmmAJZ
	 3KUNP9qT/B+P8S05ONimgbljSXkjml6FnMUnX68pDtqcrEfk4ajrDndFATlkDvxElVv3p
	 ifrYyF58cgEYAS0t6GSrVKG/WThOIwkAS5Z4CjihHL4fAYtXsRegRQaxw+3UmYAWWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840953;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
	b=fW8raHetoArSb2jVn2ph7OhnciPraQH7Vm1dtQOwk99b2XAwpkvIPdQsPq3wlro36OHx
	 Y+ueKFp9yGV9YqA5n7CE5CEH71NUipnQ2vyHyeAhiXQlbgDJDX0WQ4gzcYuQfPcNAYWVd
	 QT5BfJwV+sYSON0+rQ/7Vw0SD8S5bzM6tzW9sCRowI47mw+wWhKl5bFpB8fq5iFK9f9Uo
	 Ob0x8uP3L36cZUmumNLwfjYaVRxNuTl/NOa09YMv7p5ly0N95wPkAw0H8VAzBMGa1o9Q1
	 LnmF9Hwxzwo7TFah1FB6ogsNgb9/8zj0lvUp7BWdt7hmvfTYX5wF1GD+1joGGiFcmyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CFF606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9CFF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso7968665ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793840952; x=1794445752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQurrROuzFaL/bzIbqErWOb2Vd+DZtt8rcZK18O3FYQ=;
        b=PwpxAxX1BDjPyqyHeJ+q63fsKKO9tTu6s+xKczSP6ZJpqN4FSZhxZd2C4uHPghSNcw
         x7goutdUTTy+wXAIxabHvW1aIG54H4ZiRbwkarq3ci8Z9sqqN+aQ5nQPKaXoz8J178+E
         l/N92s7M/Ls3PeqzK8yIuO6RORPHd2JVvexxYu7NI+915WCAdgPRIy40+OQiHIAcTvDz
         HoAPwvLEl8BoAX3OCBgt1qFahZ5cn1p2eRmlQQT40QG664bvGb8qV+XUyilBkWuHlRL0
         7bdIShklb1EnuzthBVebJYK86MuztcfN1emaKlAUwtXN6eiUMUyhZrq4DGMh/MZ9GqMO
         cJkw==
X-Forwarded-Encrypted: i=1; AKwUvBx7h9qxV4xY3F0UgowkGI+HmRrRA/e9Xv9YfXm1wf0eHExmskU/cMp7Cuz+THpwT9INVkYob1lP24FtQ6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H4UdYf97/AA3NElhpKF6un0RtO+vYDTa5sfBg0T+521HYP7qy
	ndKGgqCQMfqbhNL9GvfGOWO9JYdouJ1V7afmAYy4ahoZ/8ETDsOz22bIQYsFwux3
X-Gm-Gg: AYBFou05gC9KSqFeZoNk5dTCmIvMZfJ41kkW/TNsWEoTldUylLVzAQrUR1VflaYuwDX
	xYyBRomctMszGMZ14e0NvXZcPDWSmlIhojGyEKtSEqyVMqAs2cGGFM0UzpBIyUDMow7AT52MjZ/
	mlgYS6OqTWc7FqKBYHKidzojZqEIioKjCqw+tbHWtByJBOuhfnOH0853GIjRpeTJRqyrYlSbSYI
	2I3Zem3fUGJ5t6ogZ6+U7QyqtGrz4sf4AWjzCZs5yvOQDoCd3ap+NZIu8xmlmBhuMcQF2SAZaXy
	rwgws7Pq+57XuEQ1qn0VkjiIyIF3RDBHoB7yTuW2PmKhVN1OjLo63KxBH85GGZ3sLm7D+J3csEW
	9t4mMeZt96GyCUV0fg88Cb1CaJ/WeAJoFbwCWzFfALrXZXemO/EAl8KshxlQpLJrfBXXti2tztq
	B1p3pWIoCdE15TEUHmp8Z0zFMZyHVcanvBLrRgPhVvOeI+o42E9PYTI2QDOZyoINyKsvudYmgzH
	xRWfqsEOqYA+KW/Mtj2VY8M0KtnQRj2Am6Ts5Z9Pjidv2d4d1XOwNU7dwV1EoXSMF17nB/CHwN2
	l/RUY1TnvGEFfLgKGdzN7xLSAH0rH0S9xy8/uiFHtMM94jjURxpMF0ahzFjFnyiRGA4W/xyXovW
	i9gl9jYwE/h7p0k4SACHAtDf7P+wGCtCPKRBhz+5gRBk=
X-Received: by 2002:a17:903:37c7:b0:2e9:2a0e:aaaf with SMTP id d9443c01a7336-2eb3648844emr173222505ad.57.1793840952187;
        Wed, 04 Nov 2026 17:09:12 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091f3473sm12067775ad.70.2026.11.04.17.09.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:09:11 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36d6e342f98so1534128eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxiqNiokBx/D30hC87+13Ueg+1P0sNxXsAQXH57Rz6vkTB1ZSwz7t73JQViNF60ph6aX/FInW78nZs+toU=@vger.kernel.org
X-Received: by 2002:a05:693c:6211:b0:36a:1cbc:1093 with SMTP id
 5a478bee46e88-36a42417707mr24317606eec.30.1793840950169; Wed, 04 Nov 2026
 17:09:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev> <20261104-remote-festive-1e6d807ef014@spud>
In-Reply-To: <20261104-remote-festive-1e6d807ef014@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 20:08:57 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
X-Gm-Features: AclHuK_2FUPcxo1PWKolFGMOegNvDHrx-kpQJpfPG4duyjujJtN05LYWI2fgwq8
Message-ID: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890 peripheral
 clock/reset managers
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This binding looks like things that we often see that are actually
> incorrect models of the devices in question - things that should be a
> syscon but not implemented as one. I'd like to see what the actual dts
> for this device looks like before signing off (or really even reviewing
> this at all). Given how the clocks look, it is probably accurate but I
> wanna be sure.

The dts is a separate series I'm holding until the bindings settle. In
it, each manager is a node like this one:

uart_crm: clock-controller@19e24c00 {
compatible = "siflower,sf19a2890-uart-crm";
reg = <0x19e24c00 0x10>;
clocks = <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_PBUS>,
<&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_UART>,
<&clk CLK_MUXDIV_UART>, <&clk CLK_MUXDIV_UART>;
#clock-cells = <1>;
#reset-cells = <1>;
};

with twelve of them, at 0x19e04400 (gmac), 0x19e08000 (wlan24),
0x19e08800 (rf), 0x19e0c000 (usb), 0x19e0c400 (wlan5), 0x19e24400 (i2c),
0x19e24800 (spi), 0x19e24c00 (uart), 0x19e25400 (pwm), 0x19e25800
(timer), 0x19e25c00 (wdt) and 0x19e2b400 (gpio).

You may well be right. I dumped the first 256 bytes of each block from
U-Boot: all twelve have the same four registers at 0x0-0xc (reset, clock
gate, one I have no documentation for, and bus output enable), and five
have more past that: the GMAC's interface and RGMII delay registers at
0x40-0x4c, the USB PHY's at 0x40-0x8c, one register at 0x50 in each WLAN
block, and two at 0x48 in the SPI block. So each block looks like a
small system controller for its peripheral, with the clock and reset
manager at its start.

If that should be one syscon node per block, providing the clocks and
resets and holding the peripheral's control registers, I'll restructure
the binding, the GMAC glue and the USB PHY that way. I can also post the
dts series now if that helps.
