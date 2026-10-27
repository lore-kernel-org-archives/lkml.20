Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093995;
	b=Ys6eJqSa542Wy9HsP8mkJ9wFHyZF4h58cw6WJYexVx2uZz37jh1EZxb73ne+qnpeE7B7
	 eletiOLFatg8bYfMFVG8tB3E2DXyrz4U9QoynNgX6GIc/duJ22JiX7XZzYiUIkHdNN9Oy
	 0T4YC7OqMrolzaBx0KKqPZFzarJqqC7g+qyanVIab27fj+R9HyZzI71+YCNQEKrNnAsa/
	 /rWPVb4bn3ThRIHqo24ilA7FiDn1IaX+WFRkub5hT7oXTTcPG88QMLDHFoBsyromw1Tfs
	 TCu82yaNioJ1fD99JoI/NV9Cyh+ZnUIbGLJJLUUaG/+b8nFbaHiiZOx6ZJlYphfKstw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093995;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=+kIJG1jtMag8Hv5LMXXO7lilh2Unzlexp2kC7Tdga3s=;
	b=rOFHFMPb5wR4Kc31AYZAIIncnQWR9nxpU9VEsrFetE7fTC0ut3SSOB1Zc4OyXaE8F3+v
	 1rZA+EHUPkapmGEYGlRJCMckNjIpx6oDyUFyBNbZ8dwehnjqoJTX6rv/F06TTSQBVv93z
	 JsMYD4Z8OLVbp3eeBTvi8faUAmZnEfTOU0NkqS7N0C13CVmhC41mAJtcxQBelp9Lj7mdj
	 80LV5HHgVxjlAgBTk4o3arXDQZGDqT2hCIjRNE0R9aJbnFnFkcVL0aKEAwzmyrZ3fC8s5
	 LGGWETLUzOdnvyh7R2ySj4PU1A061fS2/ofXnJqXLh4GCNU+onCDjGzU5+VvdFx/SMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oowF8bqp;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FC2606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33FC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oowF8bqp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 204DDC5846F;
	Tue, 27 Oct 2026 09:40:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A868D603BD;
	Tue, 27 Oct 2026 09:39:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A29710329087;
	Tue, 27 Oct 2026 10:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793093990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+kIJG1jtMag8Hv5LMXXO7lilh2Unzlexp2kC7Tdga3s=;
	b=oowF8bqpPv8Qdim3z4qmjeOD661xWxvq5RHon/QPqYM7oVSE6ky5a4T+8G1XlAgwy0DDoa
	FSvSJJIgXTmv4Wiw9qjcNGI/NIyVMz1E/riU4QDaSeDg4o1L1Hs4OJ/I71zxYNTHig0j/l
	uEh+mKgSAen3leYEMK4qLdj7RihwRLh+CijVBfRCGER/ZSEE8Y/iCzv8RAT5pWxp1dluBn
	VUiiiRkvpo8WfOAVItXAyb6eZlsyqzuPqfRLOcZjpjY/WxYeL9EwiPIKy+NdZVpRkvkR5w
	1cN5zw8USRHPr8FHAy7Dh0l5GcqXQhKr8nT429VLu6vIBaGvrKDdL3z43Y4b+A==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v2 0/4] Add TI LM51772 buck-boost voltage regulator
Date: Tue, 27 Oct 2026 10:39:22 +0100
Message-Id: <20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4XM2pp2Eh668j8Ii7ZMZQxQ0haiI
 fy7gGuXJzn33BUiBaYI92yFQAtH9uMOeMnAdnp8kuB2Z0CJhZKoxKTnXvRDrsoShb0VxlgqC9Q
 V7JMpkOP3maubH8fZvMimo3EYHcfkw+f8W9Th/UkvSkiBuZPOGed01T6M96nn8Wr9AM22bV8vU
 D1cvAAAAA==
X-Change-ID: 20261021-paul-lm51772-c96bbce762a8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793093986; l=3394;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=NOdeL6//333TukDUxngjo6CPNLc/Rh03KgN5/AA8j0s=;
 b=EzOLF+1tstDGXY99KwhtHGjxiS73+5G2obGZAp9iny8XpiqdaLo4aFLOKhL8Jjhw5iYAjuoMJ
 HVHLqinuicDAjiRWwgoqmhICgDa6IbJuoxUhQ8Hm+Y3B4o57wiaALtH
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series provides support for the LM51772, a buck-boost controller
from TI with I2C control, designed for USB Power Delivery applications.
The output voltage is software-configurable from 1 V to 48 V, and the
peak current limit threshold is programmed through software. The
LM51772 also provides an auxiliary fixed 5 V regulator output (VCC1).

Core changes
------------

Patch #2:

The voltage selector helpers can now handle regulators that keep their
selector in two consecutive 8-bit registers. The implementation
preserves bits outside the selector field.
Rejects the unsupported case where an oversized selector shares a
register with the range selector.

Patch #3:

Some regulators have an absolute OVP threshold instead of an offset
that can be programmed once at registration.
The core now has a way for such drivers to have the protection limit
reprogrammed after a voltage change. The callback runs after the ramp
delay, so the new limit is applied once the output has settled.

Thanks,

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
Changes in v2:
- Dropped the regulator-boot-force-off binding and core patches.
  After discussion, this property should not be in the binding because
  it is Linux specific. Also, the situation described in the v1 cover
  letter can be resolved by the driver getting exclusive ownership of
  the regulator it uses.
- Added the fixed OVP core change. The custom .set_voltage_sel callback
  for the LM51772 is no longer needed since this case can be handled by
  the core now.
- Updated the LM51772 binding to the standard unit suffixes and
  property names, and fixed the schema and example issues found.
- Reworked the two-register selector helper so it preserves unrelated
  bits. Make it atomic by using a bulk read and write instead of two
  separate regmap_update_bits().
- Cleaned up the driver around units, current-limit validation,
  volatile fault status, IRQ fault reporting, voltage timing, and nINT
  handling.
  The .renable callback is not really needed when the nFLT/nINT pin is
  used as nINT, as the device drives the pin low only when a change to
  the status byte occurs.
- Link to v1: https://patch.msgid.link/20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com

---
Paul Louvel (4):
      regulator: dt-bindings: Add TI LM51772 support
      regulator: Support regulators where the voltage selector spans two registers
      regulator: core: Call set_over_voltage_protection() if OVP limit is fixed after setting new voltage
      regulator: Add TI LM51772 support

 .../devicetree/bindings/regulator/ti,lm51772.yaml  | 232 ++++++
 MAINTAINERS                                        |   6 +
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/core.c                           |  10 +
 drivers/regulator/helpers.c                        |  87 ++-
 drivers/regulator/lm51772-regulator.c              | 850 +++++++++++++++++++++
 include/linux/regulator/driver.h                   |   6 +
 8 files changed, 1188 insertions(+), 15 deletions(-)
---
base-commit: 0785f7172040512cba759838b27286646773c735
change-id: 20261021-paul-lm51772-c96bbce762a8

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

