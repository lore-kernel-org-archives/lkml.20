Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003870;
	b=2RpD2gDZWgSwe3vBlUdBTzl0ix2+0pTkTmV0MV71tCKPMEx+vjV4VNpgSoHr9jm2vtah
	 XxCx1SVsUtVGapb0FoVmBp8JucWY7tkFhER3gsY87FmSkWBEArVJETWUq1mnrV1eM++y+
	 EBGnos6YEmxdCE2NBhD2Cn5T4lZS9tbM2uuTcRSdxMPaUUXRNs+nhlIllydDZevKEkvFq
	 HXlDf45nNVoW4X1F6HspTve/9C6aHqK2allkY+CbfX9/+hBFrZY7d4OoxENRuf/eoQVaL
	 Oren7RUE2gILQ4NwmHoNJGbvJgkUDvRaYymFdTOLNmvabrRNsDByPws9St8I1AqwdTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
	b=Pb3+B8i3Ez8+OYbB0zVH/iDsOs32O0IP2yuo6R4YUestexck2OgvDdj5IOsuLeFQBSoc
	 2IgtoDsxXBFsaVI84JVcttgj7GQKB6UUVJ+qyTuks1WjAofygSrpII5nl92ylx28kTqGU
	 65Tp6ybiEa+zWDNQWLuZy3wcp861eVBjpF1WeAjGmnWCvN2jsqN+73IzFyroq7caqwaZ8
	 YXPNMaO90AAIme7koXH5NnAcpCSrkkKCmzV+ny6Jozyf7vHGYBOM7IESXCCCcMl8fVc6/
	 Qz3znyb6ScVgo+5Py54qVpavzCYeKU4Jd9Wmkc3phHT+ZjaQaz01ZNDTp7+FXSo9oFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBsIi2dB;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB5606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61FB5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qBsIi2dB
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1516642f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003868; x=1793608668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
        b=qBsIi2dBdH7dA6rq5ePwsw1KhbbX7/GTANSCFjSkBKYprl0XlzFBnQ813b4EXpOedd
         jHjGq2ZKDpPxVtnmckN1HCLMAVW0lbzGAjU6C74A2CGBHcA0wlKckkUo+FuA3jQ5uQh7
         d0pf8I2mcBWArLgDtcf4wB66d6IQdntMYP5jEzquTSfY7FS9uh1MlN5nvY25hSczip5F
         pZ53jHutnqOFMpQJ9niydqUe0V8uM63NCXf4pxUqo2TpyYa0dReoj301BixIa+tNg7yC
         5bDIZtFeVIP9RJLhpL8FwqnMGa73Avd6xWvlNy3q5um49If4pY3KTri+EyHkDSZ/qhJg
         VxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003868; x=1793608668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXR60LDsYky2VqOqQue7mRL+b3w0NTwVzf5xVpsjh8Q=;
        b=cXtQ1YZ1XCHFwaxd0JW7dmj9y0af4rnSARQCBJyN6ukGRvcpKiuXZLvg3qZ4DOuQYY
         ovycMlCUlWo4niD0MDwxgolmRvqhPtR8OhzK3bmUi4BJSUClb+ajxSO0FSGpPUTuwIV6
         5+5xdVdBC/ElKC/j78HyoJAAFGuoiI2PpEWONSkOKI+EAbGjWYAQ+ZXl3WAOAT4bBXV6
         PIjvetPwxxbZ3PA2MZSMCLGEsB0f9gS1xx/lQ1Sa5hprS/Q5OuwOsnZQjAkjIFq+PcQY
         tb3ZYGirKg+0sJhSteF0RG/DzPa2HXscx/1EZXdhxWd/OryERYul7hBd+LVgBjZNRPSl
         qCZg==
X-Forwarded-Encrypted: i=1; AKwUvBx0bFVbvA3WrXi0lmYBgjc/XF6DAqojLrTcIvf4UUdvbv4bBaroBJQ3NzyZhoWfLQEkHioWyTi2rHHMjWk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLINf1nSsjKK/X6SNrFyZgMI52XAsK0n5aP2ZqhstAMokofyYLH
	THAHUtBEscDtKaEqFGtWGIaPAMZme0KVGclTDaeMC3RdknDK3dFf3dnrmrdZ33jfJe8=
X-Gm-Gg: AYBFou3cjq5dXBT0tsbKWZ6zM/HjtW3QhesDABwmZ2sTzDMuTGbU6NGoKl3Km9X+vfF
	XH6gwREYhaFIuzdC6Q3s2b8PwCGlX0/QcyWK1flYy3PNUz43USD7dgQwfUl2Z4JbnOHRrdt8CU8
	aJ3l4FP/ehYUlOcooAgqvW9tHOlZkS52mTVe3tunP4fgoOGaHtJGjiEJt1mJxeb4MWuLhHzNv2B
	A3yGnZe3IyOuBZwSUlsVI31dd6y8a9emlp4Ewol00ShhTjoKTWAkcPLaSxOsf8adiIZB4k+SnZE
	SOA4N8EZd6wpSd4tmQ19xiaoXOThvUqKtT+hGieycFZtdX44KS4/pzHei0l42MJgt/g6CSECaMI
	TGf+4A9KHZ46xXaG0C5+gF+8WA438++refHRYaAomgw6a76Np6UIVPFB2xqaCutq/pRaBUDiDrR
	mXZMEm0DJyqCSOM81BECky0WOM5DIiqWY7CHV7R5nHul8Wm2QOs+L4BpnDc/h23UMHTvU/82S/S
	+AdNpMcn9cnzBwiqGvwfS3i/DJWicuZh7LZFQcPuCSirRckAM+SQi2Eh3qpyyr8Mo8N6ou/hLWP
	pF09JmiutNVtAA==
X-Received: by 2002:a05:600c:4f10:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a35acaa4a8mr111672015e9.27.1793003867665;
        Mon, 26 Oct 2026 01:37:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm15091889f8f.50.2026.10.26.01.37.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:37:47 -0700 (PDT)
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
Subject: [PATCH v3 0/2] iio: adc: Add the Ingenic X1600 ADC
Date: Mon, 26 Oct 2026 09:36:29 +0100
Message-ID: <20261026083631.48406-1-olivier@mgcrea.io>
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

By their programming manuals, the X1830 (3 channels, 10 bits) and the
X2000 (5 channels, 10 bits, one more data register) have the same
register layout, two results to a data register. As Jonathan said on v2,
the X1600 name stays, and supporting them now is welcome but not
required: I have neither to test on, so this version is X1600-only, and
a chip_info with the channel count and the resolution can add them
later. Nikolaus, if Letux has either at hand, adding them on top with a
test would be welcome.

Changes since v2:
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

v2: https://lore.kernel.org/all/20261024041357.34346-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: iio: adc: Add the Ingenic X1600 ADC
  iio: adc: Add a driver for the Ingenic X1600 ADC

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   |  60 +++++
 MAINTAINERS                                   |   6 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ingenic-x1600-adc.c           | 242 ++++++++++++++++++
 5 files changed, 319 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
 create mode 100644 drivers/iio/adc/ingenic-x1600-adc.c


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

