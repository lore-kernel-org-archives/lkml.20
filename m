Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699967;
	b=ih+x840Pc0NImlzyyMQADGcS0x0ppP3d30I4e0wFW6pBl5dJp7SApe1eRmzN+WfiZVnu
	 hcLLO/OkBfpT3G9Jfwv6b9V9fIJZO+o2zw9zQ4jtYkZyVm4mqFhOev65X9E7M1mX4gqob
	 7KzQwrOrEPwRyK5oP1zV9e9LM7lttCYy56OkeGI24dYZtZMg78TKoGX5YtRZ7sUYXaufd
	 d++XK5x4JwycPatAbujxLaVqq73UWQqqLisGv/yd7DmYwghpMxQ2b/JVu5RAutOAR7tdW
	 zXhxlUmiWY6A2sh6BRwdeUFM5m1FRSMxhfFgdr2GnFk103YUbE7qp80scQmAqaPCpmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
	b=Q29eEJedS6GKQQUFLg1MjmKqQ87rr9ilWtHfj9G5aKZ3fx1qwpsbQISLPR26p82rrr3P
	 8D0HiO/4rNcOz9tRRMhTp/cmaq8p5IxESifXHXSWBknxETA2m6PkE5+iQKKN0pC0Mu0Zd
	 dPN0C7Nkkwv5J5Uhw4XM33r/4OgAumfTrdHcVGLUSrdytR8APrunkTVwtTDIBBWHDswn6
	 /dPhCSLhSzdxgGF+j+EiF7FkzJJR9QJsUPnUkJFBKE2+jPup1tIonrVvohEBfrU/RJEnG
	 4D71vzCs7J3kDz7Ka2RRTN8IoPVb8sFqxJyPw0YDz6ch2juXBiDCq6C0xSp4wfhfA6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VRdAk0MA;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF35606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VRdAk0MA
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afbd2c386so91377f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699965; x=1793304765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=VRdAk0MANZPq8ltcZ5YX7+7Qyg1eGhnM2ItCJw/JVKqn4TkKzH8VmQcIEI4Wdw/de6
         rPKRHQZ0Ee78+LV6PNtRndOf0sIyhuTEB9h1LMUyiN8BgUWIC6Uxtp+tRUv/hnMRLnr3
         fRqe6OnzSs4bVBwTHkwcrU7cck1QE2fF+UPXFqpbS2egzVMpKOgTYCEhZ69drXTt8Wpl
         8r51lgg+dxaaLKFF1zph6wEzbmHXUMLaBrKgfrBFc4qcGSc/3wwlgqMgmYUOKMvm+0BV
         AQ1aFQ0vqY87Czn9DXRSCvIVIVBxBboDpzUsJf/jyIYi3MH68UZ0tBwj8+JSqug3a+X8
         pBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699965; x=1793304765;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=OTEDTu7Ykl9jBnvFHZq8UYO3WNhsgm/D0LIeGD0FZDQTtN64y7lauEHrBJc2x2TYMW
         qNb0LZmGY+DlAe4CmxVo2pGBUYRTl6Ewr57LdpoXVIvRAHvaFrt72Vocf0wDhGCPosA4
         RxYs1HQ8gbQHsxfIPVvaBZxCe5Au2Yn6sVhjehyysSnnBZGTsf7+bRxYSfHPX8U1S0Vn
         wRpn5sfJWhESAkz0X/GX6dZQwkIeanOy6QR9Zdswektuss+Bz0KaPINwFYUUyQb9xJtk
         KgN+IYDEf7gzT5E7hSeTjDZF0YitTYMN1Ez1+tj8nLS0AMupUKGdw9h/wav/4uy8sxxz
         mAvA==
X-Forwarded-Encrypted: i=1; AKwUvBxmvjyXBJ8gqvtc7Odf9mFT6iRRw1sJvuXO5LDToW/vRo78eGzTXZUyxxRbRpmNOKn4OS5TsUsa/gbsh6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrBpsZy8GpYyQLTj8uX35V0IzbNK80kBzlwC4kp932rQLE2eQ3
	87Vqj+BwkLHQp1DXoGtd/nQhGhkdIFPID+HVY28vrWdIyY5SNtQ3TJQNZs2WOZ2oERo=
X-Gm-Gg: AYBFou1jbhg+yA/L08EIqqXC2CumYQapK9HtFN0To+yTZNSqF9BX3Mt9903CQwoAnAS
	KdMCpDPGX6a8b8aO+KJY+IdP5h/RfGrEDo2tRyyXPqQLJYlR+cg9e7g10PAVhOXCYsj650N83Yo
	P557VtKC00BoyincY4alHEAh8i1U+aiQX2G4uigdSowIg9xhxHyWcNYf4cpiv0F56jDN0O+BVRA
	CNSuGcd0z82njCMgaz6aDCsBOHPi26828fn5WuSmxnWaDT2Mub+AYOZpgCB3GJ83b+woxb2yrYB
	htb71xTxSpzYPaz/iJ4J34WIuLODeO9M8uYwQYsMsh60lGG5/+mHwAEWnHbQ32plgZv0UMK/1Uk
	f+8eUSGMkIjQk9NMB3s9wXWPhb3xYHqmr+AUtzVTYFHtSV1Ujs+ib+DVczUQNEj/QxgTmdEZfGC
	W5EDodnWxHvxoBkfoKDgtaCtTHvw3jYVr81q3PcRkRvxtJTuiWAaTZBjFXixvESyNGtxKzODe4A
	whVcPNVEYB9ahNepCtWdiwN5Hya+M36P6xhSEj3opFApIuNN/Xiie9G7OXcMluX9XJBW73fWRUG
	XpTeHVMeYKImcCJnk1M9bh6wsvGjnsVb6xllgaeQ/g==
X-Received: by 2002:a05:6000:4007:b0:48e:870:778f with SMTP id ffacd0b85a97d-48e2649d848mr12345891f8f.16.1792699964688;
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and S4
Date: Thu, 22 Oct 2026 22:10:31 +0200
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTvQRrDiVcRFOv2xozWGTCpC6
 d2Nunybt5IhK4xOzUoZLzV9xopu15BMPl7BOlaTa92ha53jJVnJ8A+W+c6Iktgws00aCocRvZf
 9cBT0VIeUEfT928+Xv20ZbpDyLWnbPqBM2Q5/AAAA
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

