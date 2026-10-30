Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371513;
	b=3+fwLtK3SKVenQ6edjPCpx/5hUHFAz26VCJq/w16iWoKfqHxqD1T5p/q2WkYQc7FWdBo
	 ch10DfNr07aozEMbbImU/nZsxTFzFgM1rhwOXfuk3eI0FXtPbLVjng4JZm4ZjLk6tqZ9x
	 UExqoo7CvzGzzQst9c1YmZAhFRE+bh4vUUs+3JMqDkk8udJdNxBPAX6VnvysGAmSP+SA9
	 KGZ/PR4P++vFZ31IJSmuzCk6NB9kY57mfjFf46aBxfngwk0QYHbT6N2kWLAJLZCwGMmZJ
	 7zuR6O1xj4Bt3bMNqVPYA3KyJLn+BPTvqJhBCW7GLpRcWKDR3/WtYRUTVUG4RtbxrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371513;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=7U1N8TPT9zrScUnndBA5jCKidCm9fzkxRYeq+kkdGBU=;
	b=JVw9mFrzjfShHqM3BRMz+SvR2R319DGLXSYtdjNg7/6XDhE/RnYHV8E9EAOBP7y2VcDb
	 jHhRQsBohMtuwWQIFrgIg9u4Sp1Vzjti3hB/aNjfs3dgXzEUyDh7qtslTB11+So3ctoKD
	 OBosSxwcY2eX3Flwm17RFRoRzs6WCZ/EegJgY1mvrnYUgt5sOVPA6MpnM/cc9nBKoOC/V
	 dubu59boNPbG9SPZ6OVPsB5wOPynUDlZQ5x3XMnqTYCm2eouN24k3uZRmPKvqImGrMpUi
	 1Ast6TAoQDGKh73y3OKsWiDNxn5oIrt8HpTTX474AdzxR1WJL1l5wOV2Cz71MqxwNZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X9FDQ5w7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C6606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40C6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X9FDQ5w7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A0E601A13C5;
	Fri, 30 Oct 2026 14:45:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73111603C2;
	Fri, 30 Oct 2026 14:45:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 001A8103290EE;
	Fri, 30 Oct 2026 15:44:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793371499; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7U1N8TPT9zrScUnndBA5jCKidCm9fzkxRYeq+kkdGBU=;
	b=X9FDQ5w7GEILGoVvR3jR6igzCjlLK9eemCz5ZY4QRS+225XUChewUo4bDFinTC+RQNb/FQ
	RASgEumFnnvhy/KWpMyYcPh+g4Y/RbWbrMW3ANTCEsLY1KLH1Cb7LZlbbl+wn6Rd+PaauK
	nR6DqT5Ae0yuX2h29Yj3vSFg64v7ZUROhnzwNLoUkycYeTgagRmR0ATtjOnLDSxm3Lodcd
	oWI8eFBaMTVGsLRfaaiTwfCcBXDT9Cq4lu2mJdVqmw9hTrECG4g/JIJLtnoYxXAw7rDrbP
	4lxYg3l+yTkR3yLaL0DZmF9F85fq4sT5ZGCuHk2FaWITCQZeSHjlUxRGT9+nOQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v3 0/3] Add TI LM51772 buck-boost voltage regulator
Date: Fri, 30 Oct 2026 15:44:43 +0100
Message-Id: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WN0Q6CIBhGX8VxHQ1+E6yr3qN1AQhJU3GgrOZ89
 8Buqq3Ls33nfAsK2lsd0KlYkNfRBuuGBOWuQKoVw01j2yRGQIBRAhSPYu5w11eUc8DqyKRUmjM
 QNUrK6LWxjy13ub45zPKu1ZQbedHaMDn/3P4izbs/6UgxwVAZYow0RtTNWTo3dXbYK9ejHI/wq
 fMfHZIuQXDGdXngAN/6uq4vI6Bzk/sAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793371496; l=4237;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=CJxBrmN6FtEI7/6u4dwk11zfvZYl/TaGJVq5Jy9UqmY=;
 b=Du76uDZD88el9i0i6QSc1cFCjfZLXE4uKclJrd/PgLrTx0OLvOjhNHSXdC3ff1fK5WwPswYvG
 LkS9bJyjA2LBKCK5jJQXboOH1vMmQPJsZ+A5OXQAQrv5SdY1h8qTMN4
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
      regulator: Support regulators where the voltage selector spans two registers
      regulator: Add TI LM51772 support

 .../devicetree/bindings/regulator/ti,lm51772.yaml  | 230 ++++++
 MAINTAINERS                                        |   6 +
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/helpers.c                        |  87 +-
 drivers/regulator/lm51772-regulator.c              | 903 +++++++++++++++++++++
 include/linux/regulator/driver.h                   |   2 +
 7 files changed, 1225 insertions(+), 15 deletions(-)
---
base-commit: 0785f7172040512cba759838b27286646773c735
change-id: 20261021-paul-lm51772-c96bbce762a8

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

