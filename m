Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57F4D178E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603731; cv=none; b=idTCB0N4f5HrY7vZRUCklB3II7TJleJUwbW4nasjIaJK9bAALO2I0lrNf1QRnkbTyMCeYYfqnhmzjH015t1V0Pmoe48zEMT+Q6ZACfDefnrtlxVEKSty9qiSzh2n/XX3x77igWRD/o/iLIl6XtIrxsg4rB9sZWRh5nqpPjzcHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603731; c=relaxed/simple;
	bh=R6TIVlIs7hHpFrSPoteaIzgYpo36tAH3WZS4D0PrPZ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TqYaw5XWizLYeWbdU1dvBhNOgRSVOCBLGYNjPwj5FHpsMzLZXX5nMqZcvdBdrxxZkgQWKqMOUWCZvKtUQ7OjiHEb33s3NiWGG9FM/+7AFKruY+7/NpTC63iIKE5qrIQAy7NP1vpKz+x3/j3zQkKDe6ZF+xf0VAkYmS+kjbC3oQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SgZGewiv; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SgZGewiv"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dd363f57aso127100466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790603727; x=1791208527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYnbwqydTxC4isV4u5FZ/6TQfllzQH22GNqJnusLCoQ=;
        b=SgZGewivmRZiVwj9Sqwim+F2NO5vpV680vqGVk5YAYvvKqNjkD52OpnfyNlz+0UfH0
         fwUxnjQ+RUacyLkKG7A3is5WMTkGeqNGSVdkajhCzIdrQJujLlu0kmGSHb3PJHljY8LS
         zQhhH4WcNYiGgLpo92EaniHfx7WXJxZkw2CCfkbjymvwbneR2OGVYKmfU1umMK4q67WR
         S9UOQ5PYk80OSQJndpyIPb9aeTd1f9Rg04x5mOjKniAZ1oap8UcSrseBPrL0x8IffTTk
         PnTSjgvj8YSvUGeJCm7y2Qt5thZMTMiIxbX9VZpOm4/ot9LGyWwqDQx0ONI/OHa6Y2Y4
         qGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603727; x=1791208527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CYnbwqydTxC4isV4u5FZ/6TQfllzQH22GNqJnusLCoQ=;
        b=N4DDmoMdVqUZJlBmKYhO+4lUNUx1liwMGnx9/rEToaVOw0/sUnkjjelddnEzVCYyRN
         OcKDRk7JOLHeh2/P8IfNI0b1+jgYfbBJq8tEzjjWjVxpZE5IUFgyXdbpAJrKWPC3is3P
         b28XMAIwfHNWd+P6xa2tMFjzV5HcdVo6kbnh6gUgsxSzKKdsvKFZM1BprobAxHxhmOZM
         O8l7gozPpMpDvKFvzCKjOF0VJ8NwrqdpOHifK6oz9ramQ3c0E2tNahP6JRfQifbeVAg0
         cogLd4c2yFeyrMgAV3fRwEOqH+p+NfhneejvrJ8vLvO8siF8QHdep/yHk4VvCNVvNI1C
         3t5w==
X-Forwarded-Encrypted: i=1; AKwUvBwXTINe+qgsIIKX4jdnDs0jP2Gj4uiTGoDrMKe5Kwm0gSsgjha1bmCQNfllubc29OLhiYbqHI5ctO22KEk=@vger.kernel.org
X-Gm-Message-State: AFuF++n0IdOUah9QIMQtIMtEfKjZpZl/cXyngng1HucWTeEOmPcepbHt
	Nvg5ms6Zkrm2LSrKgArZuUUW5QTlOhzlYXVtKP2LG6nptncBlTH2Q1rOsOjW23n2GV8=
X-Gm-Gg: AYBFou3VYM3fg7oaY1ywguYnOvTF4ZJf0qAmSUgxh5GReu0NfJKXnANJidLxV2SoHl4
	sAhujQyh2frRsajNb542V0sja4VKRX5PBUps+k7appkuurpdMR0eCtWyfe7IUcfbvv8SQK1eti/
	p7cFb/+mEhM09wew2aOgiqhzxPiHWrg4bnJ5ter6zy30rrZTPZR2t2hUVwxupSAIpXgwY8XnGLB
	rEECrisNNLcbr5rU0duFm+phpEgOdimbJkZ/a6lPEuh59GfO9FYKv+kfWyjQGuX8lkjdsbzwZ71
	JvShohtRRqG2oL+GzGHjNenuieuUhTAql7JCs6KfecVUVailqqJC2kcpD09dLZ5BcCo1IbqwKb4
	eb4pbJkgCsU2E9hgq5A/l8M21+ZvuWxgU8BAOBa4HiPpSmgo497hiH7EjJK2Z/8sWJHG06HzcXo
	ZzI9RqlkUneBiMOUr0MuUSijezgXuwgA9LECpah6qABMbQP9kNO+m+Gd0o94N77fipcR3AMQ==
X-Received: by 2002:a17:907:9689:b0:c26:19de:9ae1 with SMTP id a640c23a62f3a-c2ac25ec42amr1055522866b.32.1790603727000;
        Mon, 28 Sep 2026 06:55:27 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2afe8dbcf5sm366494066b.53.2026.09.28.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:55:25 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v10 0/3] Add RP1 PWM controller support
Date: Mon, 28 Sep 2026 15:58:59 +0200
Message-ID: <cover.1790603500.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which will be exported by this driver via
a function. A subsequent patch will add the function to read the
speed to this driver and a new device and driver to read the RPM
and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V10:

- regmap reworked in favor of writel/readl, since no syscon is needed
  anymore.
- removed the read_tachometer function, it will be reintroduced again
  if a future patchset dealing also with the consumer driver. As a
  result, get rid of the common header file with the function prototype.
- dropped the mutex and locking mechanism since it's no longer needed.
- Makefile: removed dependency from REGMAP_MMIO

Link to V9:
https://lore.kernel.org/all/cover.1789724999.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 417 ++++++++++++++++++
 6 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3

