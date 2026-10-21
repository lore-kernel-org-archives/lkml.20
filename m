Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578526;
	b=hoKla/5E++Bz4DzDBNAs9LJkahtDUudZmu0KjjXOUDC9NwdkDLnO33PZjs2k97W85AhR
	 VwJxEfp6968eUxOkgpItQ9IkVgNMKp+tnWh7z9rEfJCv3BNMATYskQcXw2IIvKpqyYaRo
	 WPTYn7WoSqz8OVmAjlfyg0xEilC7NMet64mXlmR2qlJ+5phRDq4PFcIgmR4uEcfMmlhgh
	 kCay79fJDXCrqxw4fZ5BUIykSJK9UpU2K+1aE5ObR3FW+1BCKaGaykOh/xow2jwnO209Y
	 /aUtxH3B2+1Qnikls/vk4ykaGsCEdC6t2fX2ceZXtIg4nCpqGikrKDfE59ZWWAOuX6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578526;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=KB9KbjEP0kjxl8dTmqFWPvDRN5qc7kVaZtSFNlJ62os=;
	b=sCmNQgz6I8VaIvigAApr8g8UABNSD0+iH7jaK/LYQLtqy2sbTd2AWs6LIOB80uTRMBeA
	 AxiuvI5JndLB3hmA9AB2l95dy4Dw+ONdRsnIsK5KH1WcSuIMiDzAUnwaF7/mSfIC1f/jS
	 B+A/gX2FuZ6vkI67MptJAkWxIpBbh/Kp30uK5WT+jp4ID99Pwn+/56uYr5+E8aHK6J33Z
	 q7mT+nNnyUcYCe0En+XweeON3FcKUacC7LMFe+fpC6KE2I8AAgsD6h0i74Mg7+DVp4ar4
	 6Hpjxn1R7wSIuO+JCWkQqkm+LfD6a3JR1GT6A/OTBNAlEgFI0uOwOpmSGkAAjqKNPRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zXISLQap;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A60A606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A60A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zXISLQap
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E76A1A12AF
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:28:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 614D2606E3;
	Wed, 21 Oct 2026 10:28:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69574103288F4;
	Wed, 21 Oct 2026 12:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792578521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KB9KbjEP0kjxl8dTmqFWPvDRN5qc7kVaZtSFNlJ62os=;
	b=zXISLQapSe/KM+FJJscADNlXVIAW26Ap3WVlaLXyNwB+mCakXwxhV/FQ3JlgnuUeGJmjWJ
	d/NqtbIgFE5m6uoIspfZVvxu5p5whFOBJzP4k/uiAiYyG98Ny2INQH66hL96SzY57x1mpX
	YFaHjyi6n8AuawGrbCxMTTT43I7pDm9BUL3K95ytWrei4Pj1BGdTKg5UbFHf65/UZy/2N0
	sjXNXx3zN06fadJ92Ivg5D+xUwQwI2gwCA0GsewINPgcqHIIHOOUfhzavon8/CkkjZ55SR
	6bibUysTGcNjlcFHG+o2WE7nC7yVX+NRIa/qCUOy5j8/g5xW8sFz7S6sKQnukw==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH 0/5] Add TI LM51772 buck-boost voltage regulator
Date: Wed, 21 Oct 2026 12:27:41 +0200
Message-Id: <20261021-paul-lm51772-v1-0-25f0ffbffa8d@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyND3YLE0hzdnFxTQ3NzI91kS7OkpORUczOjRAsloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA3wCg4HAAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792578518; l=4236;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=YsroYaZAoKZ1TiSGT/VmgLGvUW1KuUFEvQGkbaKkC3c=;
 b=ajopoURUVeNYCGY+aeCExjSIi6lBTOLl6yUtW9GQYhwBHJ0AlrBXkPz40wO82L+OOYHMvCh+a
 TJiKieMTLTTDvFF+TchZ0xV1rbNCLqGVLYygDYdgjUdr7/YNQorhCsY
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

Patch #3:

Some context for this patch: I am working on a board featuring the
PTN5110. This chip implements a Type-C Port Controller along with
other vendor-defined features. It can support up to two source power
rails for the source-only role in Power Delivery. One power rail is
used for vSafe5V, and the other is the so-called
"SourceVbusHighVoltage", providing voltages > 5 V. On my board, the
LM51772 provides this power path.

The PTN5110 driver is currently supported by the generic tcpci.c
implementation, but it had to be split out into a standalone module to
implement a custom set_vbus() callback. If a "HighVoltage" has been
negotiated between the source and the sink, this callback is
responsible for enabling the regulator supplying such voltages.

In short, the callback looks like this (my kernel changes related to
the functionality above are not upstream yet):

static int ptn5110_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data, bool source,
				 bool sink)
{
	struct ptn5110_priv *priv = container_of(data, struct ptn5110_priv, data);
	int ret;

	ret = regulator_is_enabled(priv->vbus_high);
	if (ret < 0)
		return ret;

	if (ret && !source)
		return regulator_disable(priv->vbus_high);

	if (!ret && source)
		return regulator_enable(priv->vbus_high);

	return 0;
}

set_vbus() is called when the port is registered, at boot time, with
source=false and sink=false. Call trace:

    ptn5110_tcpc_set_vbus
    tcpci_set_vbus
    tcpm_reset_port
    tcpm_init
    tcpm_register_port
    tcpci_register_port
    ptn5110_tcpc_probe
    i2c_device_probe
    really_probe
    __driver_probe_device
    driver_probe_device
    __device_attach_driver
    bus_for_each_drv
    ...

The LM51772 output stage is enabled by default because the CONV_EN2
bit is set. Thus, regulator_is_enabled() returns true, and
regulator_disable() is then called, leading to an unbalanced disable.

My idea is to add a new device tree property,
"regulator-boot-force-off", to disable the regulator immediately when
it is registered with the regulator core, regardless of its previous
state.

Patch #4:

To avoid code duplication when setting and getting the voltage
selector, introduces a new vsel_reg_oversize member in
struct regulator_desc. The LM51772 stores the voltage selector across
two 8-bit registers: one for the least significant bits and one for
the most significant bits.

Thanks,

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
Paul Louvel (5):
      regulator: dt-bindings: Add regulator-boot-force-off property
      regulator: dt-bindings: Add TI LM51772 support
      regulator: core: Add mechanism to force disable a regulator at boot
      regulator: Support regulators where the voltage selector spans two registers
      regulator: Add TI LM51772 support

 .../devicetree/bindings/regulator/regulator.yaml   |   8 +
 .../devicetree/bindings/regulator/ti,lm51772.yaml  | 239 ++++++
 MAINTAINERS                                        |   6 +
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/core.c                           | 154 ++--
 drivers/regulator/helpers.c                        |  71 +-
 drivers/regulator/lm51772-regulator.c              | 826 +++++++++++++++++++++
 drivers/regulator/of_regulator.c                   |   1 +
 include/linux/regulator/driver.h                   |   2 +
 include/linux/regulator/machine.h                  |   3 +-
 11 files changed, 1235 insertions(+), 87 deletions(-)
---
base-commit: 0785f7172040512cba759838b27286646773c735
change-id: 20261021-paul-lm51772-c96bbce762a8

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

