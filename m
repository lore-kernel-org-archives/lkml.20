Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960017;
	b=w3KirB94QH4lBii0nZJcClTsosUCGf3MfQmdg2cbsa0FTvM9YIry7JwMg8hAPqhBXVq4
	 YQ50FnZHwSxQL0w1kZWx+l51epDBbSsATdUl1BO9u8Vsp62wT0+ANhqVfsOew05hfE6Jv
	 iXDKc7hhHr4rWBLKI8wJSD4uGnXP4Ia4s5yzshdyLGle+6DIme1RGU2mZ/eAz33nrUvmH
	 EnarZCp7PTcnxc7djJxv6vQ5SDU41TCcWtK6psJ7RzLHn6BvZAYJocBl3jqv+wGTQePfn
	 CjBT2myxErZVs+VmNjjfmooRntCsuqDa3tSyAJ1P8dqQTP4sXF7ccH6ET8+jaxrc1GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960017;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=jR4adbanq9pxBfm8SpO73RRgp4cW1UGRfUjC77+fqhg=;
	b=hwOrp26FFiWdEKnKUwg3gO2iI6UCQ2vfASdPNB3ndYTyLYmTPsmBHjNfSqvgM4n1PDU4
	 5PZD1ugajd4DSXu3fWJ/aCBQdqG17y/6fndwnZpjT9k0aRA898rmhl6/AtllNw/WatWDp
	 yzxG0qTvMwzBxft6fRGGwIrIJGy2A8qhHWVsjx/LP5tIMUgmZj/lK5Ib+eYPNuObxtE/T
	 iCRjwtxMrkcfKl/ikfywj6x9N1vhVhEM5/PagBgcVNEbZelXfCqapnxf6Y2H+uMklOxMx
	 Ge2u/K3XZ2ibwxJWnfvYU3xIZyUbh9N993FoSNexyb49LQtnC1MbM/N1MHvbDY7Lwvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lMyIIOwk;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D351606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D351606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lMyIIOwk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 286F7C69166;
	Fri,  6 Nov 2026 10:13:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F0F75FFBC;
	Fri,  6 Nov 2026 10:13:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AECD110329280;
	Fri,  6 Nov 2026 11:13:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793960013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jR4adbanq9pxBfm8SpO73RRgp4cW1UGRfUjC77+fqhg=;
	b=lMyIIOwkOdpK7pcLvbipb84AkQnMBSKrJ1KCxDphEt9i5oFWNWH4C/mMoWqnR7hHP4GVn/
	P/ohyOkZGg3L+46aT8SOJztWWjnpp9wDPVcoBMSTbsOW17hw8PH9JQoRrQw7+QAQgAPRTO
	yklJowfsDWt74Dz5C4btorAcxn40kRnfm8SXraRUSYUNPh/SEI4Ffl3hCN9NMh8IguQc9/
	D5+qD4TWvQycpuKQ1AQy8T5Fw/o7gRhvZCxKcTpKPSBeW8McJqazehxr/5BNyMOFwP2aIn
	hBsdUNlZocMXF6uM1GB9VJK7Otl1JOBhncs+S507sg8QF0b6RY/z8p2R6mOjQg==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH v5 0/3] Add TI LM51772 buck-boost voltage regulator
Date: Fri, 06 Nov 2026 11:12:19 +0100
Message-Id: <20261106-paul-lm51772-v5-0-0e83ac9711d9@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNwY7CIBDG8VcxnMXAQAE9+R5mD0AHxdRiSm12Y
 /ruS/WgVj1+yfz+cyUZu4iZbBZX0uEQc0xtGdVyQfzBtnuksS6bAAPFGXB6tpeGNqeKaw3Ur5V
 zHrUCa0gh5w5D/L3ldj/3nS/uiL6fGtPFIeY+dX+3fwOf7r6kB04ZhSqwEFwI1tRbl1LfxHbl0
 4lM8QGeuZ5xKNyB1UqjkBrgnYsnLtiMi8JZjQo8QBDyA5cPzpmccVm4XEu0zjBTGf7Kx3H8Bws
 ydzB5AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793960009; l=5058;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=Rt7/G+ZERiW4j9o8uf8XpxXIr5kaH+GWwTlxYpLdbcE=;
 b=TsRiV3O3TYQd5zQE9AqGEPqEfLUgzpVnVWmtKbpXGmMVTNG0vyXrN0BUTiHVjk76jTrKiPBQn
 0TBHYvL/YDzDZv6jzoWUE6bMZA4IFuPg4NInaU1VRHl+Jwj6AwhSDp+
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
Changes in v5:
- Perform the checks for vsel_reg_oversize when rdev->regmap is resolved
  in regulator_register().
- Also check if the second register of the voltage selector does not
  overlap with the voltage range selector.
  Do this check only if the voltage range selector register is used (i.e when
  vsel_range_mask != 0).
- Add to the documentation the vsel_reg_oversize should be used with
  8-bits registers.
- Link to v4: https://patch.msgid.link/20261104-paul-lm51772-v4-0-494eab808581@bootlin.com

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
 drivers/regulator/core.c                           |  14 +
 drivers/regulator/helpers.c                        |  67 +-
 drivers/regulator/lm51772-regulator.c              | 913 +++++++++++++++++++++
 include/linux/regulator/driver.h                   |   2 +
 8 files changed, 1234 insertions(+), 10 deletions(-)
---
base-commit: 0785f7172040512cba759838b27286646773c735
change-id: 20261021-paul-lm51772-c96bbce762a8

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

