Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722279;
	b=35VzxuOSdiS5gW6JeAOXS3RSkHMP46pHu/kCbBfGt6XyiV3XVlPoMRsKuNvfjhaqrsU4
	 G47ekH6r4wINiKuCT66wqCOnWF+798bIbAq1DQhUJD8/jgLY6aWvelYgxOWcYfp597XXH
	 gVv1ImoK1XyIoUVXqyUQFnQL+Ylcu0v+8QobQUmmd8D9+SreelLIAUFtmnHiEbOHKajQr
	 lq14q1n5iPK5YNczzd+z/ZcrZ9tPA73kFabg3GaycIt9ivLzoXPqiBzSSmEVKMF/aRQv7
	 Sia5ycz585G3VLZ9MNwM3/EPDVUwhx9ViDYD/fnDt099kEeAy4fjZ4YqSCjPtQsI4gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=BqjSnn4A2RLrWc6sEsDvlPwCwYRFlKZM7dYZ3WwHgeXXgtYMyvYODwFty1C0uXepFbAB
	 S656Jp6tZMenKD/FRDhfvmjOxfIl9w198ayBf8hm27jox/FYmHwkWlf2l+uw3V1vC983Y
	 rYRG0ABsJySN0qxhGqCILB8oiVjdvc6VC5zFXYeVCLJNNTO+g7POtSIeVpRI1Eg2w51vq
	 K9orXdu2pA164LCepTprxCZo39+nkvskrrpsh7DtgrpQjmp8L95/YsJE/BYKQPUgOoFoE
	 ZVeyistu0MbK3aXzI3P6fxZhQb51o9P1nK1cgh8vodkAWkKVB6Q+482D2kF5YWHYTng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ExHrAVAw;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B44606EEA9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B44606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ExHrAVAw
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-84a248254f4so2931330a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722278; x=1794327078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=ExHrAVAwB7Dp5zUHBPNW1zuHYke8J7wH6CuoUZmTpvtgaFiRytAZNVD8L5YWdYWSgj
         r3wn5s26gzhyjTX8HiF7hwzC2+rPexv+aAiWCcucQnGBrxeswRA7fZsUcgoFxMR4HkTT
         EOXEATf8xSszlJ5OGB5SnCZiECHLNJcxCELzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722278; x=1794327078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=eyh7WuEqZ7SVt103f/+g7jxq9JSOBC82scES1VOCsyCEnzMasl0p76BH6OPO8489e/
         2ZaEAgEPDxlBjmEe7yKtbL7goWIXrRQ9O7pkeCC7R5/0Dh9vRUTFOYPf5UCq/5zWVnFD
         5D8ANfqg35OvJhrR9k3RMjAsNXDpdsh987sWpHaLjZrbZ0jAq52eMMRCQ+0NLlOgzuqz
         vWFoVDCz8M0OE+sb3Y81WW9EoT/YvjAB6uuEomskHrU+w4LF9BZcMWU4TMMW+WV1rWNX
         ANadYSgXMsU7whtu6ngf61y/sr+0ah1LbDefv/Z9kQI9nw7QLVBPETfhn3mXQMRIdRP2
         bN2g==
X-Forwarded-Encrypted: i=1; AKwUvBxbqxWeNEfDueOKw+qyeGXre9NDMSOTe/8OQu7BzfjfSgNESCg0dlagr1QkQYWeHV4cLoniF2SrH3DjOAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YLP5KB7oRaX7q4g53UM7lnieUxs8LCX1cqaXv0QEFV4LSvwAo
	gPE/kdAMAcEPtbdYaPdqJylNBvONs2BQ5Bd4J7yFUrQMnnMhOjRPGfHbLPmcgFQhyg==
X-Gm-Gg: AYBFou2lCypdAAmGTKB+shOw6JhblESRt+37jNkwNnwhnFttZDu91mHPJ/ileM4lgjr
	OICZ10qR3oeGKjA1+90tt2+h7zv+sjlUsIPZzwF3AIqtEyZ/Cwe8MfsISrfftS1lXAxZUhyzfh0
	pXvgHttRP7jIe95SiWdqr86x958o1FTURS7BTUiGXmYfjCsCYN4ij0UmxMR+5Zd0C5lNkkooRuE
	bnRO1xURonGOZQi3cS6hvgrcPwwKrOeP5wihA+N0C3tWB7Uvr+buDoRpCXDYfWN3L88fkXF/PXv
	nFF3jJJ2PBJOwO0Cq0D+Si/2FTiUeAf8etn9yEVijaNPfXn5d/E4d0LHhNvKHY4dBqaj8TPI1Ki
	dAB5RcB9JNQQTcgGt/bUZtlUav/6RyvNxxgrKc0yijo95nrSiM6j7g0Lmp5u5ZVCp10aodezuAM
	Hpb7oKc0fi3lTLKdSVdi5ETOCFxoQn+IcjgUUnXDcm+3D5yyUnJallU5p5I8/z/DomSHUsChPTH
	VZT8Zif+iVQ7hT0qMoByhZQ6zRZhV0zev2qhY0TQHnstvkGVJ452ZgOv/x25AHeyhB3wN+6DAHg
	AsGgN1zdEpJDDUQtn2Ru+IxsOHMCrK2yjOCyo5dSqZ5Xizp7s7xmKXoVYDxa3OmlgqUbBWS5XrM
	LZPU1/lSHWRZKRko=
X-Received: by 2002:a05:6808:1793:b0:540:5827:6d8c with SMTP id 5614622812f47-5640e032a52mr8860527b6e.57.1793722278097;
        Tue, 03 Nov 2026 08:11:18 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:17 -0800 (PST)
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
Subject: Re: [PATCH v9 5/8] serial: core: allow drivers to reserve flushed transmit storage
Date: Tue,  3 Nov 2026 09:11:01 -0700
Message-ID: <20261103161104.2449407-5-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
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
