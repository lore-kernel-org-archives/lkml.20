Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694467;
	b=xEypWX+/qjiBwrN/GI/a6rN8qmg0gz0KEJJavRRygupGB0visox1oMrgqJVKiNwRwQcf
	 gTOaD9VCAhOZzzNPhgGdzzNL8LgYoSiohn73v2d6NdX573+kqec0b919pOoYcgkS1lEEA
	 uDPwBtYppsVWhJAiQSlidkZH1aD0n7tCfaNwwsocmUmsr9yg2ifsa3zYNkWBMQ47AcL3f
	 4WHSMJb0Bn4kZ2R9Uewv4GhnyLTlwDJBJey5TYgUBqdeIJopof4CcIam4+Tdy0h7y3C43
	 cx4cgpsuQDfGNntMQGVVu4bjBTEBbsNOOJUaifuGDUvdf3kKFyU4cmNkeWdSYEA30Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
	b=5goWsYNkd6+1YRT/FHkBrI0xRGbbLuPdTI0m6LRFICpBaD53xQ/F4g9SI4p2KlDyEtTt
	 y80Kk864Q54AoXUrqA9hBYyE0wHuWvX5WOnJXbb95TALgYs3QKc3sutxNvQticumdmzid
	 5plRXPwRF75Djwt4wMAtJYOfgaRsiQRyPUVEZTxAhOkAyOSKeDToKIpPCLN8qUEvu3FV0
	 Lnp7q7T1NnbUqW531QTbJLT6nh1VdKL+nzi/usy4C37VqhuQWleDtCt1F9pgV51YlpCl+
	 vFRvkTgHE4igAMRhpZ/oqiWSVrnCKE7eiV/ZalF1ZovkUeULN8z/B27OCABzyU7AHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y9BrtkBa;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802E606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7802E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Y9BrtkBa
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so2392512f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793694460; x=1794299260; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=Y9BrtkBaP+bm4/LU+6qfRuvD653GVyhcZQpqSTn5q9ZshvGXKKFU57Lt+9493dEEG8
         2tZpPGFIaRPef/sWCz7O5O4HbkvsE0xDiiMyHTnG2XUn7wEv9J4PncagAzSLPjcnafQb
         0mG2UYIDzBdloFkfOHSAiXPb1gCAmaHgeIxNLEH6jIvaBwaQpxwJHcb0h0rvlWmP1WXG
         ZVY8BE1fCDt3QK3qKSXKxJJIoHoW/G1E2Xlbhl6tnzNVInpAOEZLHPemel6r4iMeNfIU
         keKQsTVs520f04nyLQgTzi7zyIBYDhFLApAjcz/tQQA1KcvsNwZ1yCwDG4hWXsXiDXea
         abpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694460; x=1794299260;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=LXRpVTcvaUM7SzFAuNyW77TsMypN+M5aagrSL8sbUQ0vd/kcl925dBVPNzvvoRgE9d
         FD2xk78dNe4L2IYKIzzhQKbxZli97T1eGHipbp8no2n1aphNgsBoXdIokMqFTE3rEPRS
         BIxnMc8zrwZqrUEQtCDcQE5anJ+wHqYPYMV7w3T0sv2BrLPjSouVwp5ZO48mHtFkXvgd
         4jbLXayQDLZwIgxNLIFICuPrQE9W9GxG/s+aCRlORdNlcH40GSoeHwIj3SXeHXkBwigC
         yDHVQ4OMJu0WzO0FaB1xGK4RaEYdJI359tiTNo+9bbg3Cr3kfxJ4OgFhnJ0WD6LwDn45
         HUlA==
X-Forwarded-Encrypted: i=1; AKwUvBwNN6sn/rNPiVULpG3rTDKVmS2va7ORXEPhOePRa5aZVWApR0Xt/R7pZTmkGLgH+qj4705gWjGFZPlpOjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H2zo2BdksK8hi9iGyE6tmg2GQt8HNueKzxGrSLrI36eRoUL5J
	ZjhuqRm1RY0raHU4mVY4gRuxhRlKbIPXXoRuyc9EwHr9tx28SMEuS4U9gNfHTXT9Wbg=
X-Gm-Gg: AYBFou1HMpGZ3EErSWictLlCsLM95RZCOn93EO/+h+B7mpijZF+xRM2d+fubF3bCB6S
	YghCpIb2cYtZe+Nse7LLVU4wIwEy+HeQo6hfQ5+DqUchUBkfPwsgemwoDFUU0/OQF291J2EBj+c
	ERrDsxYhMfKcz/BW0+GI2uowTepwjCIiw6eiWZ4mVU2JhAKiR18REwOHU9y165xXlZ6RsNH4fLP
	NCVzIELLHCiD5O3rivVEWJ4fJE3+lNJmYKBupXjmrPfCxOQzG386emEfvzVL1USODZJUOpcKfAm
	FhKoC6CBkHWv6uV697rxUEs9gaZunSTIP+QEoZoP+dEMneh/VtrGiGkhCccEJdpUwdJMac/4KaY
	AqCgopl3cf3p86X+KhsbwBcl8RebwkB0/MP345CVug6PIvHqIRre126Q9s4hG+GbQ9zKLj1RAUE
	nwJwlxZnfruaFe6wzwchJGUgYBGsqfNxoyZM+IjkPqoeldqL8mZtwz3/8mU4sr5bsvMD/ucDgfM
	ua0W91g9DXWHguYkLiY40ojsu4GmjaV1U+AC9o/ZLQ1FP5VlntAc+gKPbJCjwfsGYwFbEUgdCXL
	ulOtTmbzGer3WSMYczZYcSNdpFY=
X-Received: by 2002:a5d:6f0b:0:b0:48d:ed30:f863 with SMTP id ffacd0b85a97d-48e6e304aaemr28242503f8f.30.1793694459888;
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm7666552f8f.54.2026.11.03.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
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
Subject: Re: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
References: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
Date: Tue, 03 Nov 2026 09:27:33 +0100
Message-Id: <179369445362.97387.1853118570427796429.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=w36hV1IUYMxpRRFJ0VIcI3DKJb88rpzFhmqT04FnZko=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkvZ303F1f/kVIiF3xAbXN2+m1Do7+9s9VvKp1ZdKF+1
 e4U/gusHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIhDaG/wGCL4X0gr64XVnW
 4nnGLO0fd4zAeeE/ikezsz4f/fVOVIfhv5uquuzhF+1N62ce/CKqYaxpXFAh8qIu6No+Nr+z96+
 HcQIA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

> The fifo irq handler accesses registers which need pclk, but the irq is
> requested before pclk is enabled on open and freed after it is disabled
> on close.
> 
> Request the irq after enabling pclk and masking the fifo irqs.
> Free it before disabling pclk.

Looks good to me.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
