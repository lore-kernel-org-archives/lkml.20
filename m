Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF32BD00C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532132; cv=none; b=Kfn1af0imTZZNucN3AyxhbJcBpRm0lGGIEYeE1oC1HES0138mhTuM1oVVpaO7MTr5+NG69en0oAKaQOx2ns8O11Z4ZI6ZqkYezlmL3edF7DTLYJk+OA32H4hf6cGfHrJPvNZPgbvunNZiOhvM+kY9IZptIyrILu2dHqwbmyvepA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532132; c=relaxed/simple;
	bh=1ZhvOrKcGislD+WC+8Q4vWu5z8pTpCo7Q/Gsjhr1d1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nRBt2nldpDUX68f/WttPU6Z3WRU+LbMF/eD5p5HFqVlqwB9nx8bCxmvL8PWk+IdxVJfLumlLTQesk4N0hrnrWGB7aqvjNqJBYDXCoxfcLkGnEP3gQsa8DhTgo66nF91iD/qhaWo+ax0MJU2VJme0doaeKSk2aFndO8AmnJDpZCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWkYaUE+; arc=none smtp.client-ip=74.125.231.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWkYaUE+"
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-7f9cc0e524aso1743491a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532129; x=1790136929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=NWkYaUE+2OCiMVIeTvtNWB8v1/a0gGFdFcELxEbDWMEShVrQHwYgVw7ecixMB9ZyFn
         +3jJ3zI3x+DNmHN6gVAI5i1/5ecMoaXtN7hzobrKZjBtkH52TzWTyri1Dg/dwOLP0c48
         oIEm/b1DqB+xs7DbwTyqTCk4nKHFlelTuMUC+h+WcweSQ8rUsEp8NhVP9A0qAjNQ5OAM
         dz/lUOfFPY7Aafdk54I0JqSdLfUi+LlEISEFZDXZB5o2gHEYuNARfNDHjiWGy/piFXl0
         7EjdiULJQKEok9Ei4R1677UoXQGCmWxWXlEZovvc9iMjW44Z/icOaj/e6jd2oLtn/XkD
         W92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532129; x=1790136929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=geQe/Nt94sgACddk5UkhJlOoq3dCQ3FTfciRXuFH+10=;
        b=1yP4lUbDsm26GUNir/YS24okMp/8mHDPbmn/gs6ABUbEORTuvYuW+6kIgZvNbLUrVm
         S60RuELc0K23fuYUkSTZLlfPZovSEDMyAFxVIZXMmEjB8FDCPALvb9uw3ZneU8GmplLT
         Lh+q2SKaVZQTuJMshzhFvXH3cTDAORIDMFzKL+LU8TCQMOG0zbzD8ifi/bhIJM2B0e9x
         RsYp+JiKqBkVmDeZtZQKEZOB8pM6BNH3cGB9M3C1N0Rv8EOI3/A1GSeUApBqrG4eh/2t
         pC5ZISY9Q/OChOW9R+RLlDErJKWEF4dtEsPRO/Qz6InEg6zKau0YGFUVUe8gw5CaHZj1
         R2Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwiLz5BbwAaLorXsBt9HS1Jfq7oqvFJNnJMkLUfsWlsFHaMqlWHeuk5B3UGrzEc2V+2bjuR1pUkEN+eykE=@vger.kernel.org
X-Gm-Message-State: AFuF++lKloki6SGQwiXpcdy0W3yJdtBKg27BRY/8YbLku18azE9CixRN
	OTqft2L2Y7+VFFsgoDoz12/IeAZmSVtcxO07bUNLhnfKm58llvyd0Pat
X-Gm-Gg: AYBFou3Gx+xtB0Yv2w6yJc7xRVgOlV1YWWAOiDCSX/Qyn/hVEJ1mJNmGgdYa32NpH31
	JYDjdTWA/rItRID43YgcFdFRmWCgRf1qaGul0LDz7kjb/Dry1Y54c14klDOdVwTNRS0iAwxoAQr
	fXUct1gfzwn177pViydznFDOCVTCgbX3BMmjsxJRuMBXeiE1mrzd/eRtLxsyotT2wArKE6kn+Zv
	I01Yrhw9zCfXCm2Z3AedMWZOthZBl6nbmjLpbdKuTBDUwZj4LfnjV8Kx9rYiTcDZT8CeJcfmsjQ
	/HgvQti4KdEvusmWt/S9GLpbuSR43+Jdw5saWvy2sJzXw938hoQg3/2BJVZgUpMUv1u994ux8JG
	bN02T+vlY56ec5SCCILQD/pDYsOXBvs4q++VM3f6I6c5/vaBTLp6VYz/beiTLduhx6AvvRb6s5R
	bXi7bJcjQyEx4dMVGatlwCq4Bg6j/nG6mLKRYD2QeUhPDzHEea3pXktfQs1KlHxUpVKVaP7QoTt
	g1L4Q==
X-Received: by 2002:a05:6830:6af7:b0:7f4:eb7e:c8f7 with SMTP id 46e09a7af769-80b2c18158cmr1482766a34.5.1789532129476;
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0373sm1440484a34.26.2026.09.15.21.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:15:29 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
Date: Tue, 15 Sep 2026 23:15:25 -0500
Message-Id: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQ6CMAyA4VchPdtkqw7FVzEe5ijYA5O0zBAJ7
 +7C8bv8/wbGKmxwbzZQ/orJJ1f4UwPpHfPIKH01kKPWdf6C+tLCaIV/WGZblOMkecRpac/dFWN
 ZY58wsCe6OQopOKipWXmQ9dg8nvv+B56DRSV2AAAA
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789532127; l=3814;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1ZhvOrKcGislD+WC+8Q4vWu5z8pTpCo7Q/Gsjhr1d1M=;
 b=hy8S44J3Kt9/i++nBCcDmWUBualfD1ZRDUrk1YbiwxToPcudFRBPrKHFN4YfXcOFs/wkiAGTH
 L6vgwManOMMAClIr8hluO7RIvzaIEMuHuNUzkqJgQwQVkFxih5p6Zjj
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
reach. On boards built around it that ADC is the only path to the battery:
the SoC's AUXADC is wired to board thermistors, and the charger ICs these
boards use have no ADC at all, so without it there is no pack voltage and
no state of charge.

Patch 1 adds the compatible to the existing MediaTek PMIC AUXADC schema and
the header naming the channels, patch 2 the driver, patch 3 the MFD cell
that instantiates it. The cell comes last so that no commit in between
registers a child no driver can claim.

The mt6397 is not given mediatek,mt6359-auxadc as a fallback because the
two are not register compatible; patch 1 has the detail.

Only the two channels a board needs for its pack are described, so patch 1
ships a header naming them: a channel ID is an index into the driver's array
and not the PMIC's channel number, as in mt6323-auxadc. The register
sequences are the ones the vendor kernel's pmic_auxadc.c programs.

One note on patch 3: it adds a cell to mt6397_devs[], which Luca Leonardo
Scorcia's MT6392 series converts to the MFD_CELL_* macros in its patch
4/9 [1]. Whichever of the two lands second needs a respin. Mine would
become a single MFD_CELL_OF(), and I can do a respin if that patch arrives
first.
Cc'd Luca.

[1] https://lore.kernel.org/all/20260902193351.185771-5-l.scorcia@gmail.com/

Tested on an Amazon Fire HD 10 (2017), an mt8173 with an mt6397. Both
channels are exercised: the battery channel by a fuel gauge, which reads 817
counts, 3830 mV with the pack at rest, and the thermistor channel by an
ntc-thermistor consuming it.

I have two things in the driver different from the vendor (Amazon
Fire OS based on a 3.18 kernel). Verified with over 150 interleaved reads
per setting:

 - Leaving the ISENSE input enabled between reads, as the vendor does,
   makes no difference to the value, so the driver switches it off again
   and leaves both ADC input enables clear when idle.

 - The chip's sample accumulator makes no difference at 4, 8, 16 or 31
   samples and costs no measurable time, so it is left at one. Software
   averaging helps, but only by about a quarter: 0.92 LSB standard
   deviation for one conversion against 0.67 for sixteen, where independent
   samples would have given 0.23. Conversions in a burst are correlated.

The reading was checked against the charger, which regulates the pack to
a programmed voltage in constant-voltage mode. Over twelve such voltages
from 3904 to 4080 mV, and charge currents from 111 to 778 mA, the driver's
reading is a mean of 0.9 mV from the regulated value, well inside
the charger's regulation tolerance. That also settles reading the chip's
trimmed result register rather than the raw one - the raw register is
20.7 mV low at every one of the twelve points.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (3):
      dt-bindings: iio: adc: mediatek,mt6359-auxadc: add mt6397 PMIC AUXADC
      iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver
      mfd: mt6397-core: Add mt6397 AUXADC support

 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/mt6397-auxadc.c                    | 340 +++++++++++++++++++++
 drivers/mfd/mt6397-core.c                          |   3 +
 .../dt-bindings/iio/adc/mediatek,mt6397-auxadc.h   |   9 +
 7 files changed, 372 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt6397-auxadc-5e1228025c50

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

