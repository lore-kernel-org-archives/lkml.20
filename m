Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650395;
	b=dRPmnrSeWTeSKFNN7agbfb35GTYxN1PeU+laG8oCZnfYL1cybLJEYvefob3BjxySoW6S
	 v1Qd9dnqXOPTAKkEZzTJ1Yx0qxSTnbKqeZfXjqVh7Np4sMJXCrjcvgqFHEG+qfw4KjgYG
	 iHNYfxMC4OhQ4JUoWoynS3TpAjcf+Lc6gNzhLhI56d5Eyn7SsLsGFP7NjQVsZ0L9WNlcm
	 y1oQz8ZDye8XPAwQiTRaH6cGqf5TDyZQBaoOClF3h1o2XbI+H0nysFQ9Y4dw/dQEzsHvT
	 R7UeRobOhdZwd2FltdUVabNXYnb/KzXg9MG8B2ApAo6njvvy14BCBTGJfvz+iG7oKIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
	b=g8JEtSWN9Mu5kx7w6OetmGkEwrW+cdL2H7ism0T+e9AbHZ8zZ/KhQZntsM5lIpsUETvK
	 /csp4/ZSr8l2VfD5E6VnKh7dju2R3B90vRrDfldF3/f5/pcSffrt8pPKgTlijxlhRemnn
	 EzOwI93ZPuniamsoJIOO9Wvp3OFs1sXPYlZBqoi6f0Eyy+LfpzYSGgeszCHadb3y5uvCA
	 RLKhaR9vP20zy07flYiMem669BIGI+LytnPNUlvLeq7+eTFSxP5dA6m8lOrJ0gAUeMzl8
	 JEzqcGM/Mpkbbde7u/p/JiuCYk7qcBvOF8o7VcyY0WkULrrbSpKU3pMvRG3WNs8VM6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XsRgzODd;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA59606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA59606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XsRgzODd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so25978605e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793650392; x=1794255192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
        b=XsRgzODdBUT4XXjpIUPRjkJblHJube1dhFufvnWW8HeEn8qJcmxkZkk0w1uK0fhN8z
         9dbQSp1dM546uDhKZOHSl0Zm23FuoC6QRi4Ob603V/sF7oVbAadbLNyViF/0ugfhKeEX
         iKIuqUzLcP+o1oa7J65p3rfwAJ6fxWhvUeclO/ZN+anA4SbR8KcCXTnClK6DcdnULRJ3
         XuNcg3MP0neOjUw2Di4n/gW4ZtY4i7FY85TFhj6rRD8/LvxSnrWZR0CSmR6V6EGW1qWC
         ol+YLt1tYcYhIHCw7t5RazdexhSQGt5KYfcKUKqEZe4dmy7hy9kwCIO4TXxCDYjYuf3g
         towQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650392; x=1794255192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrzQ/241oZp/Tq58QWudEA2sJDuknSCKqwtJBY2LTNg=;
        b=q2JzzdDLlvIC5YUKV4uMe/IznA992HHrbifFjdFu8RA7SL+vYBac8yRjCKjHhPqreO
         dSgwmwjkYv2QgzDIlE6vfxueJh9/Zbo63xXX9hlIHRTknpaDfsw2vXv6eM7ByG4meKDM
         YYlLtwjyt4XlHOMzifNB8gOgqRLcBE/fveND58RSYsAXPi5WRCJsY2T84E/yP9D5KVhS
         +NkOTOh7Xs7BViPuiP2EIQxpIyru+ohibP9qS0judPKFR8lNxaRkidSASJ5tuMICv7m0
         2MBYFuGNy0C7fRwA3OmTUiYM2WCrZN8qc+L12eR60D1wqBxTK9eBGNjA6gz5Z3deQiIb
         7fuw==
X-Forwarded-Encrypted: i=1; AKwUvByGYlZaKEclL+GcuOpTM7ORrfvT9PXB/zFYwMaLKYussLQQZEseE80GygcRSSwndF7Xokfjkf5uC0DdAP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIcqO0BFPTK2t34R/KogO/azE0nN5aoRFW5UpM3TGyvIrkgvaQ
	5cwQISTzzNZNzYoHTh0pd3z4hl9MbrMVUcw4yv6LnbDYfhl+ez5BhWkCk9k/GxxrUUg=
X-Gm-Gg: AYBFou2N3KE07efT23F+FTnOePH+8BJxozEaO7Wta9XSltUDX8OX5FM2KU3LRjeVi8v
	yi4DFzwWJMkQNykPhEVX/EYD7Yp2zXrqCAI0fH8HL5ettELcJUVHw5toa5trNj2cynS5fS5a2hO
	yClQe0dIUpByecYjVzbA6DhK4r0E4YtDSDUaA6O8KKD4XLFb/cxfTpzdhkzL7NfbQDS3qSYkQlC
	G179vC1PNKGRZh4nHizycHsyEohHmTTtCg/e2T3O7KE2djuWIbsRZZQ2SpGrVk/k8TnGqMWbESv
	Cc4lyQzslPouGdAiO0ObFUCcEETFOCZGKEjIS+6awvaE8IdYRV00Wq+b0OaE3ucGYkcZzn/qlCy
	8YHhT8foq55NwHDwLkkc5iHH7/W13QnPnrTLGPQKJlvw7wKuyxhlXTzFeR5DKDFZ+h+Yts7IHoK
	s1fKciFNHdhYHGm173qQztRGmUeOT5UXv33PUuZxYVMMhUeArJz7gTyRvW1qoN5NlmCbFIEU26Q
	1v/CEXLLCxRvx2L3MTyFTmrP7dQjwoyUsTjHtPlxvldqybNQ97ZJ/o+RxHjE4EiB8zVS/XEbRgo
	iElokJQTQep4Lak59gHVpbi5fu47x4+jlcl8fhxXNHSiob51dxkRmtpWTMSo
X-Received: by 2002:a05:600c:46d2:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4ac1980118cmr242926285e9.33.1793650392480;
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6412:7406:ded:3229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm13969155e9.2.2026.11.02.12.13.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:13:12 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Mon,  2 Nov 2026 21:11:53 +0100
Message-ID: <20261102201155.10948-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

A driver for the SAR ADC of the Ingenic X1600: four auxiliary channels,
12 bits, one interrupt per channel. Tested on a HiBy R1, whose keys are on
channel 0 behind adc-keys.

As in v3, this version is X1600-only. The X1830 and the X2000 have the
same register layout by their programming manuals, and a chip_info with
the channel count and the resolution can add them later, with a test on
either.

Changes in v4:
- The Kconfig prompt, the header comment and MODULE_DESCRIPTION() are
  the same text (Andy).
- The read computes the data register's bank and half next to each
  other, and the two macros take them (Andy).
- X1600_ADC_CLK_RATE_HZ (Andy).
- Read and write helpers that add the base (Andy). Plain MMIO rather
  than regmap: nothing is cached or shared, and the only
  read-modify-writes are under the conversion mutex or in probe.
- The device clock rate is clamped before dividing (Andy); the divider
  comes out the same for every rate.
- Binding: the description's last sentence and clock-names dropped; the
  driver takes its one clock unnamed (Krzysztof on v2 and Conor on v1:
  their reviews and v3 crossed).
- Joshua's Reviewed-by on patch 2: the changes to it are the points
  above, with no change in behaviour.

Changes in v3:
- Cover letter (Andy, Joshua).
- MAINTAINERS: no list line; the binding's path in patch 1, the driver's
  in patch 2 (Joshua).
- Includes for what the driver uses, copyright line, MODULE_AUTHOR(),
  reverse xmas tree, open-coded return, no message after
  devm_request_irq(), a blank line (Joshua; Andy on the return).
- fsleep(2 * USEC_PER_MSEC) (Andy).
- The ADC clock divider is now even, as the X1600 programming manual
  has it; v2 wrote the divider minus one, as the vendor kernel does. The
  divider fields are named as in the manual, and the two clocks only
  repeated sampling uses stay at their reset values.
- The probe comment on staying powered up no longer names the keys
  (Jonathan).

Changes in v2 (Jonathan):
- The comparison with the JZ47xx ADCs dropped from the file header.
- No mod_devicetable.h include.
- X1600_ADC_VREF_mV.
- The status declaration split from its readl() in the interrupt
  handler.
- field_get() for the channel's result.
- fsleep(2000) instead of usleep_range().

v3: https://lore.kernel.org/all/20261026083631.48406-1-olivier@mgcrea.io/
v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261023204209.48556-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  53 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 257 ++++++++++++++++++
 5 files changed, 327 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.54.0

