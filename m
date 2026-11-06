Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962466;
	b=3Fvj+L03SZPojJwfHUmyDggGNbvoqp45x3Fv0i9IXHL6oyFUZ/KoBlYA0KWLvcM5O286
	 TOqzoH80sgkFmZBtIvO+LaF1LuGiuTuPAlGSdMmhyXMf14Ko+tbjFfwpSgaVKNxIaKmin
	 zAVPshZ/4JvMV38MEe8E3sVyq24GRVnggzmqmvM0NbBO9y+wrenO3NihUkHEsvV8xN6oE
	 l2LKmpJnI8QqmUiuidsvnHXJePCTGr7lE7D1aB23l87oghNh3Wa1IetSoFXSq/8SuVd8I
	 2LITTGOcLXupaT0x1uc31/uGmcNmkQF11k1PpPO8YgeTY38tOPscsQDpyZSQIxKqPrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hoxUd3hRuW/M/zzqlfuVkM9AynBQyThAepuKiPfwlVg=;
	b=OJ+7aL86X2pXu1979I87SP9J5Sl+H2wmJ2SBg30h4RUoqhDXkNNXLyr4zkWqyuSNDbzV
	 ASH/1heSfo1OuwM9nTBhec/xVCyvEBT7ntWBH5aiqrtxs988bShnZN30zHZ/nbVjLdgwh
	 0Ag7Oyf4IC+dvHA7vHtJsIPKmLpJaQUJ4tfDLY51TCCU2GdMdIhoKY2jplbQju8egT15S
	 JeTR13uWU1dzHx7MnZbw4qCcLGBYVeEHizyDZ8Q7PpYWGqMRhSWriX8uqW6cR3zeMZ3dM
	 A69cgHt4LhNOfk74nkk3uYv2Twtq11jP4XZS9I0vcey1MIQmhAn29W/7Mwas4z3Y4Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rwiGNy97;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78222606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78222606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rwiGNy97
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4390665e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793962464; x=1794567264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hoxUd3hRuW/M/zzqlfuVkM9AynBQyThAepuKiPfwlVg=;
        b=rwiGNy97lrK0RWhAzbBeqmO6XNHzjmv2DUJoYpzvALL5U33ZujML5HisePUOeMqwG0
         E2rha/jAdn6t3PnLV4tYgHgn57aOBfx6RBLAmxeVEpXz7scXB9RpeafoT1YyTpZ6wuSs
         gl08dVkhTIIr7cuVLzDG8RT5iD2ZLmMFeXZokdtUgIh0thwHeBOD3qEIT4sBEiOpT9Zx
         9TEgCWOYg9gF5XKeb/JaU68mPBHMrDM+V16gQq5apCgVAlcFjiQ97w7cgr/rLCKv3vDw
         DhA90gmVhEBVco54MsrobJ4k2Ilvfde/LLu7PKGghW406y7Lk0hONV5KDwBpzxLMlBb3
         dj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962464; x=1794567264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoxUd3hRuW/M/zzqlfuVkM9AynBQyThAepuKiPfwlVg=;
        b=Iiw/coUgp/YIOx/6WG6iUSw9GAjGVmTyCxKNLe34AxkxNHsuBlQQtrRBsHwaP7pMOc
         pXe1vB8YO/chgQ1kGgznPRwxSL1ctwl4pjplCSNuXpU0hRIbkRILgRl9PbGCvCOwJI+e
         9lGBvEgHzyc8BH0TFSR6tn9kJMGQ7EevAT6uEP3bIwLnguJEgQYbTPatgC/FNGmlP+pA
         wl8w7BC6pOW5QRTrHUgWLEuI9fFr5BMZWXHeoswyYqIKjjFaTiSnE+DTcLXYbHUKrmdN
         Ydd5CAQJBfqalvxFWI3UgLuY+Ar2/hoLdGWz/McV3spH6VorhSiwJV1l/Ey1i414yiYn
         lmEg==
X-Forwarded-Encrypted: i=1; AKwUvByc3zfS3vpc5T7l5zAsx1jMAZQLRCsa20iq3Tc1wGlFl7UmjbPFPLopucIEMooKw4PZ7FZYegKPJnLGirE=@vger.kernel.org
X-Gm-Message-State: APuU4Z++LHg8rtTrcNlSZomwRb16lWDhiWCYm1YUFfpLeZIpKmuB214n
	8ZZDHOAoB2jSFoFdHxGeAKky9Er8svc31+sklmguMBxVb8pD4Y+u0BtDxQfHqV9/ziA=
X-Gm-Gg: AYBFou2oLJk3DLXjugFR5KFwRF9uYWJJuh2CIklWC4tiicx/bjfGtcwb1vH5nuOhb/g
	eSVKp9pnV7+hvpxbRp6oJT7DX2MLLxl14vL9uvz8TPtSUbo/j+16Y6pKyW4LcQ7kajxu6ajfOwD
	1P2cIeijQhKup2Yz6QWD9eBLAkxK51ycgWyGqBjWNl7ufbkFWatE5PaTKmplHaL8+sO4NX1nCtF
	IRDsw2EjiQ066exOGmrrprKo3qgQ+Wg1DHQ7SprbOprl0VT3CSyIUXt7eU6wOmRrZgJH2ZDbbJ2
	rGQw/XXWw/aoeTMS8nnTlbRGQbcZZQ7+Td/u/TxL7mHMn40W5rsznA9gvdz9Wy8ycRvIYnwZvMg
	Zd9K1gFWHUKk3tYjNONjEGS3Du5iC3jUFjupIj3Uz6cWRLgVMUFxavHh5OZ08Z1Zn+HxDZ6A25e
	06+iiteD6PJ5kqbTUXkt98+CY45LWizafCbb6m24Y8yCw039aeSsjdLS3KQLebjf7Va53EgJGIG
	MR7aemizsTLFkk9txJKq7e1b8ghBmADB0sm84FsFJeGDHxCK/61bYMZDIkji5MU/E+Sg71xe+Ac
	kBef+jSbdvJdgxSRZxNG8aI4kTy0SRCzkkhe2927AAA5ilAjzHfcA9jsPj8dCOI=
X-Received: by 2002:a05:600c:630c:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4b6d82b1267mr31993405e9.0.1793962463806;
        Fri, 06 Nov 2026 02:54:23 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm125584065e9.5.2026.11.06.02.54.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:54:23 -0800 (PST)
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
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v6 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 11:53:56 +0100
Message-ID: <20261106105358.59616-1-olivier@mgcrea.io>
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

As in v3 and v4, this version is X1600-only. The X1830 and the X2000 have
the same register layout by their programming manuals, and a chip_info
with the channel count and the resolution can add them later, with a test
on either.

Changes in v6:
- Nikolaus's Tested-by dropped from patch 1: a binding can't be tested on
  a device (Krzysztof). It stays on patch 2, the driver he ran on the LX16.
- Krzysztof's Reviewed-by on patch 1.
- No other change; the tree is the same as v5's.

Changes in v5:
- Binding: the reference is the SADC_VREFP pin (X1600 datasheet: ball
  P12, 3.3 V typical, at most the ADC's own supply), so an optional
  vref-supply, and the description says so in Nikolaus's words. The
  driver takes the supply's voltage, and 3.3 V without one. The ADC's
  analog supply (SADC_AVDD) is left out, like the SoC's other supply
  pins (Conor's question; Nikolaus answered it).
- Binding example: reg covers the 4 KiB the programming manual's memory
  map gives the SADC (Conor; Nikolaus on the map).
- The driver's declarations in reverse xmas tree, the timeout macro in
  jiffies with an if/else on the wait, a blank line, and clamp()'s
  bounds on one line (Andy).
- The clock stays unnamed: Krzysztof (on v2) and Conor (on v1) asked for
  clock-names to go, as the block has one clock. A variant with more
  would come with a compatible of its own and could name them there
  (Andy asked for a name).
- The name stays "adc" rather than the vendor's "sadc" (Nikolaus): the
  JZ4740 datasheet calls its block the SADC too, and mainline binds it
  as ingenic,jz4740-adc.
- Andy's Reviewed-by on patch 2, and Nikolaus's Tested-by (LX16, driver
  only, given on v4) on both.
- Rebased on togreg after -rc1.

Tested on the HiBy R1 with v5: without a vref-supply, as the R1 is
described, the scale falls back to 3.3 V and the three buttons on
channel 0 work through adc-keys; with a vref-supply pointed, for the
test only, at the board's 3.3 V PMIC rail, the driver waits for the
regulator and takes its voltage. v5 is also built with W=1 with and
without CONFIG_REGULATOR.

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

v5: https://lore.kernel.org/all/20261105213210.87457-1-olivier@mgcrea.io/
v4: https://lore.kernel.org/all/20261102201155.10948-1-olivier@mgcrea.io/
v3: https://lore.kernel.org/all/20261026083631.48406-1-olivier@mgcrea.io/
v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/
v1: https://lore.kernel.org/all/20261023204209.48556-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  59 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 269 ++++++++++++++++++
 5 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
-- 
2.39.5

