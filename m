Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726359;
	b=yLdmgE9kRP9tKH1W4b3cqvQam2+6Yey0sOlORqRnRWYRv7Fv8cZcJhSOUWmzqzW/8zle
	 HOyuia8+pvw2xpSrn/ORmO8iKXfkFko8A+nakluQC3WE0YcgGFt7JlAuZK5VCr4GLuS3q
	 IKz2zwdRYkGFxxqlvwRfAinUrqNTcujR/46QL54H6ss87mrYSO6haNIRJITCz8uI7IhlJ
	 C5oAFyoL5AVa2ozn3OlMsX/EvynZM+PPtWdamguQhql/HxAY99T2dl/xGFj/7U+V7ZVbq
	 fsCqt6ze8/3mVrABC+E3PAVm0SYbbZkliHQHyE4rZYg2pCm1MJbdztcob+PoHzZ/okA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
	b=MwecpxNWgpeTmIg6HTjmBOmEwqfquzkVfCWcREZmKW6v8a+M6EZ5UaPHYBKlCSSKsGKF
	 aLoaupwIIkqgTBV3qCJjTAIyuzebXf50f5dCQ5px9J2V9RctOCdghUM2mOww1F6+6cEnt
	 RXSxKC0cYAlpn32Gx1DCxMW8GWUYjkHhRYfceqLcvbyBpAyvTUH/FDUUwEiuxNjE24LHn
	 diMjVTA85SbGei8aqyRDpV/B4+HfZeRkhjHHhGNdldOZIE30g9a6btRvnYK27lsdy1aav
	 6cdc7TtpWeAmojZLVAS76wkQJ/iF67u6hZ4vwtN859OsW3rulasURJWASGlc2eytr/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="R/YhAD4c";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F3E606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F3E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=R/YhAD4c
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2704094f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793726356; x=1794331156; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
        b=R/YhAD4cjF5HWZDS12Mmaz+AKtQwFDm5TTdP7WOfrT+BN86ErsKgMJuuD0p6wMvdgb
         uqWg9OIBWW/0jQlOjEM0nHsDOEJKBU8o+MrsPV8Vz862UFKNSEW/xRNOO8aCGJroh5fA
         KuX0NmF0thJd1pgxQzW3+xWBCAPflB3KiPmww8fLaPznA8ilgAyad4tCLgjsfN+etHaX
         HhvCLHebKXO5C2YdHrvuPZ/20HTlx6rRE1RcliE+Uyy3yrjmdv+ESzBlTiU4kGZbNpa2
         X8QEbssT0s+tVG+09Si8g+Ae5Jqrd8c4s9zoCAdw6JW1YaDGxc00om1YhvkHkUbMj0AK
         BG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726356; x=1794331156;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
        b=izGmPoYVtHWgPsiSbGkqtmAgbvIDb8KQggnN3QFmgVyJJnvCa7WjqNltYwBOjzJeYM
         WnpsSJXKaiUPr1d1afm9ubZfV2Jn9MGtuq9JKl1jXzMlOxbon7WXk+xvC4aukK3Xi1ED
         TcLK/C7zcRm86Hkw8R+G9Xv3uigWVLBNQn8xwmEsQuz1O9fbnpbaStc2ncP4y/6d7n4Y
         yubZw2JAwGZnTNBKKmS4Kx7TW+1z4eHHLQKXQ+KBeJ9HaaGatGl6ee6lVs/a/KG4xvKm
         kP3u8ETiwIk9uHG/QsUTuuG1hzsxciHaXpttY4xku0nEUCyMqqvOsqXrDNR3Uhp3eDhM
         Knuw==
X-Forwarded-Encrypted: i=1; AKwUvBy2qz33PWzZix4c4/oVjmM6zjt7lqHyRghzmQBesAX+h+VOgTKSq3JxNqlUo+bd3R9Lkx++zRMAS/3CbEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xdB0xrv2iFbtn6i3XkfiGqUipf2tm/fX2e2g8XxthoV7RrMwb
	d+wcRu1womWshKUQPOuiKd0TkfvhPLbdxmKeCw4av/jfvHXO+YRHFeEcGvTemT9PIJ5iM6NWjPm
	lC0oy
X-Gm-Gg: AYBFou3ebs3iyuWsMhfiTkSwYIOLMFuspBwOPXRceVCFOkGYMdnTRwWbeHi9hiZ3D9k
	KDSmxTVQyr2F+kIKds0KWAVTKU048wgYVFrLbzdp924u4na/4EGmq3NRVN7e9bi92JjqTaFMyZ2
	/VvLqg2I0L+rxqSIIY1jw8nhMJcHj7K4xlfXV2eiCuA2XH+71Hz1g0pg2d4fepEC0g8/vM8sd3a
	fPc9Wj22gr+INrJHoBXvEV2HF7xMAkCZUcRwS7hj/iLAAn3HBpB+EUu8zKc9xcyiPZzbXB+D9Kg
	bxUEXxHyGk/bk7uS9hF5eSKrJaeTOMZU8HIS7b1ZxgoEj1VDkaEgOSdAigUxbdyAIiJPuCZgikX
	J/HwWmMUVYa01v1PAo/hEnN4JACCZ4e8zUucP2iyrnzVbI+4AdHbdVoRHC1yvhw6iBF7fMDWgVm
	GYzVbrZr7QbkTupeXr3AyQghhl5sz7fA2qjv9Af6Ttc3F+DwQLNISC+Q0T52FEe5DSR07HeLFsZ
	ZwZbUo+lX10RyPrmumWNfSOMxh+30tSdkZ7Di3yiz4LY0TU9XlY1+lQURFFws7iDjeT/YU81xlM
	EYk5OStOWAeMA7Sh7rSsI/ttQpl0kuootsYaSphbSUYW3VIz
X-Received: by 2002:a05:6000:4711:b0:48e:2371:3835 with SMTP id ffacd0b85a97d-48e6e309f7amr31462901f8f.51.1793726356301;
        Tue, 03 Nov 2026 09:19:16 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm27856601f8f.34.2026.11.03.09.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:19:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/9] clk: google: Add CPM clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
 linux-arm-kernel@lists.infradead.org, 
 Mariano Marciello <mmarciello@google.com>, 
 Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
 =?utf-8?q?Jakub_G=C5=82owacki?= <jglow@google.com>
In-Reply-To: <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
Date: Tue, 03 Nov 2026 18:19:04 +0100
Message-Id: <179372634472.2573818.17532943286609086157.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fqTcKnieuf7JekGsRwrFzLg18sNZNXRDB3ktfvrRuF8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmvxLvWxKwtTKye09bOcqL677Xz98LyWeKzJO0s975wd
 7Ja9XReRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbSsICR4VV9nuzFk3pBi2Zr
 S330mea5O3JtmtSmJXnzDHZHnFB9YMPIcPdp827jZbrejwUizdSOlxd4HP60etnkLR9Dtthb55w
 N4wMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Google Tensor SoCs (used on Pixel phones) manage many resources
> (including most clocks) using a Central Power Manager (CPM)
> co-processor. We communicate with CPM using mailboxes, abstracted in the
> cpm_request_client(), etc., API.
> 
> The clock tree is largely not represented fully by this driver, because
> CPM hides most of the divider, mux, and parent details, instead
> maintaining its own internal table of mappings for divider and mux
> values. The one exception is for some of the DPU clocks, where several
> clocks and dividers are exposed directly, and the firmware API works on
> divider values instead of clock rates. I attempt to represent this
> properly with dividers and parents, although I don't have the full
> display stack running to verify everything yet.
>

As you say, the clock tree is not fully represented here. Beyond that, CPM
owns the clocks themselves, as the driver acknowledges by setting
CLK_GET_RATE_NOCACHE.

The driver keeps a partial copy of CPM's state in the kernel:

- Rate tables below hard-code what the FW has (or should have) instead
  of rounding the rate, even though there seems to be a ROUND_RATE_OP_ID.

- kernel handles PLL parenting and divider math for the DP clocks, while the
  firmware can also switch them to what looks like the oscillator, out of
  the kernel's view. So the math is likely duplicated as well

This middle ground cannot be kept consistent. CCF assumes it knows the
topology and computes rates from it, but the firmware makes the actual
decisions. The DP clocks already show it: the tree can report a parent the
hardware does not use, and .recalc_rate()/.determine_rate() can disagree
with what CPM programmed.

I would advise to follow a model closer SCMI. What you are doing here looks
a lot like it.
(see drivers/firmware/arm_scmi/clock.c and drivers/clk/clk-scmi.c)

 - Put the LPCM service protocol (request word layout, dst_id, timeout,
   error translation) in the CPM firmware/soc driver, behind a small API
   shared by clk and reset. Philipp asked for the error helper on 6/9; the
   whole request encoding is common, not just the errors.

 - Make the clock driver a thin CCF adapter: each CPM clock is an opaque
   endpoint, and gate/rate requests go to the firmware. Get rates from the
   firmware (round-rate op) instead of local tables. Model no topology the
   kernel does not own. If parents must be exposed, the firmware should
   describe them, as SCMI does, rather than the kernel hard-coding them.

-- 
Jerome

