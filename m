Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722274;
	b=jf38ES0Cfnp8nhFeV+oS7fpIOcWnaIRYGdI+FsyavC01AZfk2E/hY2kXApabbeAnmaHs
	 Z7+BST0kkj1vdoWOhm8J0DgJKh6V4sxe+21ZTczdnNQnXrDvQlSKOkfF/4aGiD/ycPee4
	 uMiVzXQLf2f7L6bZ32qgCJ3GLlnH3CAWHZvBRKjNmYciquYs2LiSx5wUz1/r7/5h8Av19
	 p4EF/YCLcndH1d3SiRk4CA4PhBxbEX5gIRFdYAabeVRpz+KeRQVpeH56Kb2yIjTkRjIvd
	 wqvP17vROPz3pPUPzWljW9/E6jYg0QOX0DwVZXuseil/8smw/j9W1iB35JVWL89KV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=sxluvJJ8K2kHYtziht60FEsSUn+f33YfPU6W2M14kWrLIARS+dWKwGksvyHDbCYEQLA0
	 l34pPbNeAAGOk5lsU8+OVCjtXxyY0g3AOTT0N7tTaCIGszgwrMvVtQ1h0GKxZh3KhzTwM
	 pVUqYyFFrqL+OT1JWvJrjWvv9gsBouSNlRoM2U7iayQS76+l9NaZJnlif87YCgiebj5CK
	 w2+DPTgd4x47/1/Ht1P+mXPc03EHKKw3hzmLzdMxaTxLl3o7FyotxZ6qVJD8Ew6z9Fitc
	 ySlHynYLYdsFq9j9BAxbDiUf1JTlL9X/MuSD3tN3DIvDSuGfQDKHoyQKnNaSeQIDRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Md7w44rP;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD23F606A33F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD23F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Md7w44rP
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b190cdc9feso2979898b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722271; x=1794327071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=Md7w44rPOwSTNItGi+uTSGtO2nFLpUbbT9xVBdDZTMPeyCFmcPfrHwOcIhuf/mB1s9
         M8Kw0PvthUNf2TwGyfKZuDOtKv4LCpYvi7XR9K3NumIrC5TlXCdRgf8ifuFxWnDcTRkH
         UARmf51JS/SQOeYUJUJ4s0APvw5gdpnKbfSKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722271; x=1794327071;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=y1aXs7Jxd3YVqNApwzuGG1q8kUlqkOJ5+IoCH1Qtg+a33M4p6r3iCnjqoR7/gFjPCe
         jywP2xJexGCoW97cp9rLzshTJphBf6Oi+/xbHeJJ0IIPxc381YnoxwqyEZle6ky+bE+d
         m1APIfZgrg8E85XwXIwAmxdYDLoia017xOajgE2n4G9h+Oq0KTWw1Mhn7fUkSFCjh51P
         wx33MhAMRQY9uSFR6MAUL16zlAGix5NTrIu5JTxTH/30uQh9+tx9GqoCRqrJINkH2BLr
         8SbkGddePtoZjdx/hXXLgiiNQBO8LduX+FnFHOmLT9HloAM5bCuviMFvogVKDQrxpcFA
         EBpw==
X-Forwarded-Encrypted: i=1; AKwUvByXIo8OZS+9uhgmcXPCKCmK+AOvWmu6jWAVuyIuuKHhMHO9fiGpsfGEEYeKKvg/joTpuVX9GB56PAXrixQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bBP86nbjdvCOUeMehTlEyf17RMr1MVlMzQjc03Yusv1hsM1FQ
	D4YYrhOGJtcj1Wf9HlSrdeJMEsBsA0EGisOQeS1ohnsfE+FZTQcElf4UCodfdL+kZQ==
X-Gm-Gg: AYBFou38GCcZEdh5rhFxv4Wg7d9NIXeddZW2arzlAoyOeF4N62zs/2lGGar42otJ8DU
	xuBGvc41cm8ca3vjBZ3N4RpO6L+Xs6WT+e3z8F0RzwrnJmPimxWgE5B5WwBtP+rMqULxSmG6wmv
	VR/v0TnFmBGJMxuozb/OQBF/ufVv3pouJf0mTOeKiEhGrmHiWbeoezDVFpYKzfy8ENPepivgSmP
	Y8bwpL0wm6zXZVlVM9OMX5ssRLA0IwWZWtsOTFeYHngDl/SOEJKJBnGS71P2MqBfnQlEw4WCxBg
	X2CNpr17w3ytQxrB1i9gntyKg7U8e0JiRUBRcyJG864gXOmMK9BtKajbBi//OzzQMjQIhP/GEO7
	VC76hxHaEyq4T8m26x/w43BcHOIcO9yZW3HvPKGOi4cTut2ZOvxEO4n/sd7W6XGT9lvh+WlugH3
	aYJOBGbAS/c5dvgAfQ3L/HyZGHkglPb0ZV7hHO7GVsYpfebiss+RKt8cXTwn+CSh4Q1Cvl13Aao
	qjp/20WGYl7Gb5L0zv4k7YR6RrXBswJ1Di8b0C9Wql/QGBIU4inxUKu9LHPc9Cd5MlE04l0uKeg
	/6aHEtkeO3Gw/Kz6deQ6aOI8nAAqaIA6VCTF7LCKcpz1ne5DNGx2Rg0znH4/k4P1TQIQ9cnTyp4
	u1w+zeoOFbjWiXidHwl7kJ4lm9lFFjPSzhWLA
X-Received: by 2002:a05:6808:3a0e:b0:4cb:f21b:6f8b with SMTP id 5614622812f47-5640dd9d763mr8688402b6e.30.1793722270713;
        Tue, 03 Nov 2026 08:11:10 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:08 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 1/8] serial: 8250_omap: separate locked TX DMA completion processing
Date: Tue,  3 Nov 2026 09:10:57 -0700
Message-ID: <20261103161104.2449407-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
