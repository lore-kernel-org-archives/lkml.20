Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375925;
	b=Zi/Ttw+M4gYod9/P2vF3zgbL+n6DBzKi7f09xv2BQOdIaumDXfBp+JKImT5ZAqVUdpHI
	 rJcf6eV5PRzngCNy0SCiQcRblXvF5joCMAYCWWsc7JPuX6TI4zE0Ia2j+tZrG+GLBFoar
	 aHxUzpP4GHxMF5lXlsG4GexP+Xbg9Mhi2kyvUjGvoH0MwZC3+x8jhrmPzOO10woeV4SdX
	 2NLpfibCsCqiaKiTME/AX7ZTFV+ceL/yF1L8BhxBdT4Hlz9Y44iBUTtQYY6DhZcHWu397
	 cVJFVVkyQaGjNRnaUevq//xm3pNl7P7G1S0As+XgEXzd9ALzj3V3yyMGiTyW5DZa1FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
	b=cfFFfHD35EqaHU3aYlOQIXIihUZ0XChCrk9oX1GGPhoUgEIVBAnMZ37rP7rVpXJsUu00
	 LrXbKu9oHxzLxccI5/ViTAhcvzWg2alQulq6a6sRKSVD/OvwQwEgbzyqo040edEAywYg9
	 h3XoJrM+R2YD2egcNdbn4tiVSD/Lpu02UkvIIIrLC63bIzxz6z1+s7z58188PeOE+McXO
	 BN/EKoba2rmO2BRR9FIc1xNZpzf8XsqJzSYAfXG15sa0Gw/gMGZCADficJPPoaIS4pd7w
	 WXrF/2XZJYjoBRLWSgqanLLOdOyo86y+BdbY99Id7LlX5+VCo3KTQIdvORbbiUaQtOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mOqzz12U;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7635606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7635606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mOqzz12U
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7354835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375923; x=1793980723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=mOqzz12U/LFejC9+hW3SXq2Xej3agCQm8atGTBh16WSKclb7U72U8hodJfoBqBGdFo
         9t+prirfP8gXE7eqlpgNzjZ1lAbH7EKzgyO8BcV8m6x4gi7fd+FN6qBdE6iQvi+wbmZj
         G+/UZIjskHILp08+se9pzO3urcTa+IRRYsiYAy9s0KFimuC7X2VvqkAbjqy00Yx8lcPH
         Icwdd9Ih152ah6l1NoDDx/zPl4JuFjwWfnHOjDtcUUZtVY2LahVxN97BdW+4TxzSOgsJ
         moHb08oLZSPklqUdIWrpBKz/fak6/y1M6Y+0AQXd0baWCglAweH9y45zOzfXlppg7I/O
         ullg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375923; x=1793980723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIe/8YDKLEO9EseYJZxm8uj28aQkdc5JjmQoelCGsvE=;
        b=N2q6Nt6jextlQQAgf5TJSryWvBb1LJ5PeZbZYFyHhJ7WYm+m4ruN6/3GBbw5xmWqnN
         pLaNZj+yo42jUA3rA8AZMUwL09CCAtJSceAK9EGUL05Vc6BgfgRehC52o+RU1Q0zsjnS
         8iekeUQr7WsHCPdP1IDzFJBomvyZ9YXLVonin1y7XFOeI1ogSBiK54lSjzgETxVidK7b
         DpKKr468qjV8H5CgQkeKZTrXoZU7duvyS79lY9Y7aH06TvnY6ttsG2h4ksYBfDxTcvyL
         BMGaLBJ4WDu2hewectxjTG9hfsvE1FL39sr1Gddd6HEXJGwhRSafH3nEDqUet9fAaR0J
         UhNA==
X-Forwarded-Encrypted: i=1; AKwUvBzGCqPXRPSM73Ptg6Uu+z/zM7bGPHoz69GBFHAh2tChF0yOFtKQWPXYd5D5ZpNVVWmZzDG30QnAXhUWdR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy2ps9ciJ4z3/azugtmFmZtGk6YxwS5E006YSdufRvpqi/fViH
	Skmd6IiEoGexikiu1vrlG3STn+eIkCJ/n8daWM2pVe0I12j/K9phfU/XwR5o2tDHCZ0=
X-Gm-Gg: AYBFou3F3DrPtpIoVIYROse0o+fSNNp4Ij88/2ikYnazR7bfiMs+rlceVRiPUnyBvb9
	yuYh9qoXFs9oLnccsIV6QUSY/4HfheSQfE65Ntgxwu0PzHnIACG24+ZgfL6L/gLMbzOdmeEKQmM
	I9J8pldOXlqkD3DQhIvNJNn6KtDBF8qJ5J7XIJ6ZonrRs5/vjdxH5icpxvuAFpsSZIqekTldoBo
	N8TFnspqe9lW+Dn2I8Mfntl5U5bMDOV7RFW2L0SpslZE20xKjuT1HesPJ+6gnC7S4YjHSdurXkG
	oQtKSe4kqRLKj071r5nfuHpTLuu3XvrmtBCK7AMv7Rdjo8QswS256dgAO5ro66D3w4ersmuKl8q
	KjcGxPpcQu13nezboWdPUVXbxbyKLx4CQEaA3csychRYrTZJcUsJGpyY2ZtA3tpJdkwCvt7Q0xD
	AhtW72vS4CsExesymmY3CpK2QzQ1rOg0GIfEfTjyag0piYBBsxjQUHFb8MI6rlGUXfoFDjwQ7dV
	z/lWv++d+RiaDB8brJXpSoezN2/D4s91aiDaN3kiVE/o9Rspgv9NENSMPufN7r4vS6gdNrcspWA
	7W7h/72Z4ff29qq6MvicYLfAT/wkJuk7zX5v3bfGhSFXYuk/nQE=
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr63299065e9.31.1793375923405;
        Fri, 30 Oct 2026 08:58:43 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm71893855e9.1.2026.10.30.08.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:40 +0100
Subject: [PATCH 09/11] pinctrl: scmi: report whether a function is GPIO
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 24e02de543ca..6f44e8c0fee6 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -80,6 +80,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.0

