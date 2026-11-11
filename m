Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391598;
	b=Rq+YxGpLAjZRSXrQUZTnDhXcsKn8h70Z1C/QqWRKxfkeZDA3anNQ09ETgBAx6qrWJ/6V
	 C1ZLYS4PKO5z5TC+9r/0VZKO//0dltRJomkpOrV5fBgU85i1nIWkjdIoX6gTB1ruk1GsA
	 fyuiEufZs7MNzZsiUJRCYw0N6BqaiQduIsd6z3eQZHS4TaONVTQAVKub5sIh4rO/gZDgQ
	 FJr5jwdFNaRF3iaMvECjOJgbSCmwS/DWJflYdeVGlQKl42TdQN4gpMELlTNTNwq9UYJWS
	 JaEfkWP8tP3CEFtUbKUXINDUi6S/oKgxdDFsBU3FUpxR8UzQiCe0NFRFmNQovLmfdrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
	b=i3PAp8Pxu1asNujpXev3R0VGFkizFaxIO3wuudiz+HdE5DabBNnAXBy4VOSTmrbcq0bC
	 ZWFlxHea8hPnRsFh57qY4utPqfrE+wXNKLrpA1644oX2f1e65/caaxs1d5b8NZgHN44O5
	 Br8aFzd1O/jNtuU7UY91yNNSJiXarSMW4wOc8QR6eK6bWqvDUo7HGdddEPIAObEP/mBhn
	 s190DsW/O5+2R9Es9JfLPXbVc2xMHB57qKCMRNAcmD/T9Osu1mykk/ixymkDsN7PQeb7o
	 qroNxpMQYF3RaMcZpt4naEaatQ2nl3VaIBFr+7o7xM2/7oaBD1VWzoAg2G/gwxlYhOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXlp5xsN;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F70D606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F70D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXlp5xsN
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2457337c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391597; x=1794996397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
        b=vXlp5xsNRdR8tPKdKKNdWuHv2jGGCRjKuH6kH1nBvg2JP6WTYOt3s7fxGTSxDzXiAQ
         JuEEHggsmdujIxcw6gAmWAV6lZfarMgEyTcZ97I6XtlPvAcU7E6IlO+vx44zdzrpLQqT
         Zsguo3GgrKZeKoj3/ZpybO29gKYHhApF6EgjT3ftwURpjRtVF4RLdNfkGjeGsLbE013L
         7Wxe1/CHkSckY21xf530W++WFItUaPng6k+/efueB+8iAHYLPX0geS1jSlY3+sUmqcm5
         E+TD9rmt3fIfQb40MRVJ/S2txEtZjjNkjWhuc4HrcxhISPxLOn28Nj0Vleuz9JZmLzrw
         rwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391597; x=1794996397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDTNKmKcvG/TVcEJQQhWa3Cr1cP+VoAZc+pn91JcdUM=;
        b=uiJn8Pl7mBuk9R2agB38qf6W8MKuqMA2a6cKNO+ai1ocmWbpwLD52bhjcMHwbA3Jy5
         QlpT7+EJmEMVqh+agADuza7vsbq1eQWzK0MnHWFVNIF7cj8mnATfTGLnF8a9qiWmVcOJ
         miJr+JAlY0zvNyqRAx8OxxiHr0OP7MVITxaIh7ZRfxw4I7i/k2HIUPbJmXXf+idckp9p
         o7qsz8tW2V1+qLbqKaXVwijvKtwCOuQtMKx1i6CcF6Cr1u+BlE2XGczAX8xFldPwnLUs
         rLACW4wom/9QagRozDVIXYrZNuckfjDgUXWNHOm5Tkuf4Ill2gmBfCNJ00F0LIfhmxuG
         Z0sQ==
X-Forwarded-Encrypted: i=1; AL+hErF8zpLPzcJsKRPGCtszRdl0kN/tPFMJkdncmzGhMVWTcaZjzqfaErn858iHy6nHIDyu9VFiSkPHmjF+/UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+brWUX5fFbZcV29X723EsnC8+S+3tHJMNk5KjQwxdFAOKpcYV+
	+IYa/HtacG7bUCdr3u3uycNndjhksZ5dqIqn63wMOE0o2zI9a3Tq9Pe5
X-Gm-Gg: AYBFou1TqrGxO02rxoMg+KdJu2Gxdu+9monx05JpeobfkohI5EZFaGU35jgHj2bpQVA
	KJDMxkd+73Bf0tYVpN+bMceAP42vb4c7xdTW3I9Zrb6/mO9lif2KiE3pYI8Vwdklv/aIWpK4Hrn
	ZbM0uScTM+OQvwBJZYtA3m3HvUi/ikAu/zPZkbelTqoaEORZ3kibww4Ldw5eLNcPQad64e4nyIv
	ETgmgG7AaD+pkJ6LcHx8yVaoyKObU3mxXzmiJ0ft/Tm5t+xqGuyA62CDaUkEgg78YB8S4mXHU3e
	Ywgv2pEPnXxQz/TbZ0KcfFRXN9XgZ4If3+44stRWbALXdAUxVKa8hvLhLSA7OsnN6p4V/PfgD8z
	pmg4Z0TWio8FD8znGfY/2J+yKM7peescu2rNOfvpvcBa4AgB4eSbAnDA8rfon9ncoMgVv01FXvi
	dvfhcTkM3RPZQ6nIuU5UHb7L3dzkGfOXipfCgxGu58na/LbK5fGWBLPRsTjN6+Nhfoz6ruyHpIV
	Ygf/5U/NNT8jCCZNZvyIXp+YeXj4fPxOhN6G5ynlzeRGM/RBd/2FAqz+qOhSi6y8JxBzztXb0/2
	nHDhvPFByVCKrOjfCqUzycsG92FoM6Q41h3e9L9bgQzsocQp8IqVgjUWFwe/9IViNtFtBQ6ckkQ
	4Ma+LA2cKpkMcCXMArby7aCtxigDCPwMs40S6/wswUhCH
X-Received: by 2002:a05:7022:107:b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b3c024be7cmr2489625c88.3.1794391596498;
        Wed, 11 Nov 2026 02:06:36 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:36 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/2] ASoC: atmel-i2s: Fix clock and slot width handling
Date: Wed, 11 Nov 2026 17:06:14 +0700
Message-ID: <20261111100616.31211-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series simplifies peripheral clock handling and fixes the
I2SC_WS slot width configuration in the Atmel I2S driver.

Link v1: 
https://lore.kernel.org/all/20261111042746.14714-1-phucduc.bui@gmail.com/

Changes in v2:
 - Move the devm_request_irq() call below clock initialization and
   dev->regmap setup, as suggested by Sashiko.
 - Add a patch to fix I2SC_WS slot width configuration, based on
   the SAMA5D2 Series datasheet (Inter-IC Sound Controller).
https://ww1.microchip.com/downloads/en/DeviceDoc/DS60001476B.pdf

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel-i2s: Use devm_clk_get_enabled() for pclk
  ASoC: atmel-i2s: Fix I2SC_WS slot width configuration

 sound/soc/atmel/atmel-i2s.c | 45 +++++++++++++------------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

-- 
2.43.0

