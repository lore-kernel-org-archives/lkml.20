Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811661;
	b=tasVeIDet0AtoQ5POjqD8scJAhhyAuHwyH1JioxZh6P0S/PgK5OEHORjw+0i6t+OShru
	 2pqNSycdfhENrUx/YB+LQMOo6QWL7lNRAux4z5x4qgyU2hYNaess9MdN5FUKO0EAKKWAm
	 lqiRcL0jVZzfWcje/iay+L6+adEMANFcUGy6Ab3urHyn8Ljj0WCvwcfaLPQklO6B13X6I
	 bCjuXhlJ2CcsZCp1U5oxrPYX3CILPFZG3DU/wXHQN/nTBqb7bjIp4KdKHPnAljO2xCC/D
	 lqbR7HZNHCU9+Xjk8u7tSPqLfd7n1iMP4fxR8qICmykoC9V0y73xhalMeBZGhSgsrMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811661;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=dj3v6PGR4CYxS3sTtclppkSA23sMBuJFXpAdYEpjL3Q=;
	b=ePq2Xqb6qpc+J+H54CtsvZbXKhK9aYz5smH16/RXjWBqSBlqc9FSEzJBwGhLztyf5qJ0
	 7ee36j84c6a4TqXqYeIz3qHg80GjVUEjy7E7abVV5jNhUmb5cEd7weomtI44/z8gXBxI7
	 cD4W6g3sKo2nfrl2crqkN/N8uFJw4nYhrW+dzEPQl0Vld+CoEEi92MCTmWjrF6gxNjYYl
	 A1xcOr6Q43JVL2Yhtw0esHw8GFTk0cDXUBvje9Xa9ApoEGk+Dou73GnNHgYQ5iZM41QTc
	 oxloHDxBGsiEplpLQUPYu07HNApiMfCEK5+CBWeC+qOhVsHSZCptkqUYVd5GGErWBBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z6XZ3Ffn;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2528B606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2528B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z6XZ3Ffn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B39CC8F46B;
	Wed,  4 Nov 2026 17:02:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 200BF60770;
	Wed,  4 Nov 2026 17:00:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B693C10329205;
	Wed,  4 Nov 2026 18:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793811651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=dj3v6PGR4CYxS3sTtclppkSA23sMBuJFXpAdYEpjL3Q=;
	b=Z6XZ3FfnL6c+D7drCD+0HKikY+mzclOleQQezkUHgs6B/TD6a+Pnb4Kbcr2N8R2DxTSY3h
	ZwcziQvBa1z9qM6oAs1GV9ARQiJSKHXN1ChVi2qUgBZhFUnKCSDbWsSETUFr5VGUJLc65n
	1CkLjNKTNJxAxF+MLCFCzGD2Za4IgcoHt7cmGjNZfuTRm3cHeQViDgCroClLvvmsH8qMLA
	kWUFi3arKLt9yQBqNsCpw9VXROQHzVxoQ+HgSeJvgbfltNEaPShxSBywaDqJiMjSi4cU9k
	ovlgiLOsmzfd1AopRTTegLBA/qvxKs85OpMgWGAHmlmjeh4FQYJj4ekh20xPng==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v4 0/3] Add TI LM51772 buck-boost voltage regulator
Date: Wed, 04 Nov 2026 18:00:32 +0100
Message-Id: <20261104-paul-lm51772-v4-0-494eab808581@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNQQ7CIBCF4as0rMXAUKG68h7GBdBBMbU00Daap
 neX6sbUuHzJfP9MJGH0mMihmEjE0Scf2jzKTUHsVbcXpL7OmwADyRlw2umhoc19x5UCavfSGIt
 Kgq5IJl1E5x/v3On82WkwN7T90lgurj71IT7f/0a+3P1Jj5wyCjvHnDPO6ao+mhD6xrdbG+5ki
 Y/wzdWKQ+YGtJIKRakAfrn44oKtuMic1SjBAjhRrvg8zy+PwYYQOgEAAA==
X-Change-ID: 20261021-paul-lm51772-c96bbce762a8
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793811647; l=4536;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=FxMh/tnJHv3bqpeOnH9+cXdQUV6vjwr8pCO5bWd6IBg=;
 b=3DB+3mrHerocEqY/E0WMvf0bvtp36ASv8uIfQGM35aloPTmH55OZUJHFB7sqaP+E0Sg5a98pc
 Q78F60zKQl8DvHuDnU7d2LmMWSaHJsy3r8ikFsaCP7vVJuZqkVlQ9eu
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

Thanks,

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
Changes in v4:
- Add STATUS_CLEAR_FAULTS to precious register to avoid debugfs
  interfering.
- Instead of checking vsel_reg_oversize configuration coherency at each
  read/write, do it once when registering the regulator.
- Use DISCHARGE_CONFIG{0,1} instead of FORCE_DISCH, to avoid extra power
  drain for no reason when Vout regulator is enabled/disabled.
- Nit fixes.
- Remove dev_dbg() calls as they where only useful during testing.
- Set EN_ACTIVE_DVS bit.
- Link to v3: https://patch.msgid.link/20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com

Changes in v3:
- Dropped the fixed OVP core patch. The driver now sets the OVP threshold
  before ramping up and after ramping down, so the core change is no
  longer needed.
- Fall back to the lowest OVP selector when the requested limit is below
  the supported range, instead of failing the voltage change.
- Reworked the current limit to use the standard regmap helpers and a
  table computed from the shunt resistor value, avoiding custom helpers.
- Moved ti,iset-pin and shunt-resistor-micro-ohms to the chip level in
  the binding, and replaced ti,ivp and ti,ivr with ti,input-voltage-mode.
- If the iset pin is used, do not provide .{set/get}_current_limit()
  callback.
- Fixed the regulator subnode schemas and removed the current limit
  range from the binding description.
- Write the nINT configuration before requesting the IRQ.
- Enabled the IMON limiter, dropped the register defaults.
- Link to v2: https://patch.msgid.link/20261027-paul-lm51772-v2-0-b2a767e34722@bootlin.com

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
Paul Louvel (3):
      regulator: dt-bindings: Add TI LM51772 support
      regulator: core: Support regulators where the voltage selector spans two registers
      regulator: Add TI LM51772 support

 .../devicetree/bindings/regulator/ti,lm51772.yaml  | 230 ++++++
 MAINTAINERS                                        |   6 +
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/core.c                           |   8 +
 drivers/regulator/helpers.c                        |  67 +-
 drivers/regulator/lm51772-regulator.c              | 913 +++++++++++++++++++++
 include/linux/regulator/driver.h                   |   2 +
 8 files changed, 1228 insertions(+), 10 deletions(-)
---
base-commit: 0785f7172040512cba759838b27286646773c735
change-id: 20261021-paul-lm51772-c96bbce762a8

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

