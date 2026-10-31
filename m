Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443388;
	b=40TPUpL1MGUCG+YOuVYBaHqeb5VDXHqhIs+waDwUMdECSVq56W0h8IGPcuMBk6vmhn9Q
	 RpuLdaEiCzOZZZ+/KhvGLAFAqlsYxbSXhK6FGNhVGAArC5LV1BGHJnD6M6JaMCP0Lt4OY
	 36a2CaRkltj4A/KJtgSCLFaTb3Wx4zh6M/tugWqp1E2e6/LzifTi5VtrHYt4yiyUmAp1b
	 4omXvlny1Cmz/VJXStMG7doZQTaTOtcsnOCSjfckCxvyFpRQ4Mvo6yBJPmPDitmwTRk39
	 QcglJZ9Yr8ndyUppPqSF3c9EZb9hxg4aXB2CFFWxJMATRfx+MDuacVHzfjvNVZbNRtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443388;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ftfBy0RSzJpeQ5/Atx8b9/grpDyxwzrPWd12SgN+DJ0=;
	b=dIZO3AmQdxRKFFywCDinx1Ji0I/fWT7U/5PGhG5XsDlVqsr/IYCLdft3kQ/+D8ev2A2e
	 ir3AvpEbeKF9NVZ+YWnU5FMInuJlE86QZsjgC9EVcWmervmFI/3Gj66lg7tcZ1G8LVRqu
	 mYplwoTARCuiOZXo0Z49xjeOcimNZVlCN2gNDN5G/VWt9pSZKH1fu7IDFX086KdDAPixA
	 +dYnbk3EThCa9tBXyr/+XA4/2f4Rf16pHut6RoTIunQh4F2/dXrpCVLgE1mRvxxMHcr+5
	 BZRizNHuvwNes/xb4udu04y20My68WffRlmz3yI0Itu1HcmVcbvDtjwI/nVzvZCc9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="I/Mcvnkr";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A93606A31F;
	Sat, 31 Oct 2026 10:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A93606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=I/Mcvnkr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=ftfBy0RSzJpeQ5/Atx8b9/grpDyxwzrPWd12SgN+DJ0=;
	b=I/Mcvnkrt5+iogWxMUO+g6hmE0PHHVKFms5zaUMyLlZzRgAamEhpCV9NKAo+IV
	iMMo1+bW5tx4JvIrnEj62zsHApCszeg2TazJoLJ2/EemQeQSC65rQxWG4OhPJ+U3
	hVNi/fXlFC5UmO3eIjr9bt2+BtEF+oHXyFUc7TdK9oWx0=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnbwoTxuVqQyp9EA--.12272S2;
	Sat, 31 Oct 2026 18:42:28 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v3 0/2] ASoC: es8328: enable capture on the ES8388
Date: Sat, 31 Oct 2026 18:42:24 +0800
Message-Id: <20261031-es8328-vol-init-v3-0-7d9c4b7ab67f@163.com>
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
X-B4-Tracking: v=1; b=H4sIABDG5WoC/3WNyw7CIBQFf6VhLQYu9OXK/zAuWrhYjBYDlWia/
 rtQF5oYl5OcmTOTgN5iILtiJh6jDdaNCcSmIGroxhNSqxMTYFBxBpJiaAQ0NLoLtaOdaNWVoHj
 dtLXSJFk3j8Y+1uLh+OZw78+oppzJi8GGyfnnehl53v2vR04ZRdNrkBrbSrR7XomtcleS2xG+b
 MF/bUi25mXPpAIw0nzsZVlemYrXhfwAAAA=
X-Change-ID: 20261024-es8328-vol-init-6a52c17897cd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wDnbwoTxuVqQyp9EA--.12272S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur48WrykAFyxtryxGry3Arb_yoWrWFWrpF
	Z8WFy5KrykXr4Iyrsavw4UAF95u3yfJF45ZFyxt34jvw45Ww10yrW3Ka45XF1Dur9Yga42
	9w12q34UWFWDZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_GQ6DUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3hXKOGrlxhXEawAA3K

This series fixes capture on boards built around the ES8388.  That part
shares the driver with the ES8328, and the two differ in eleven power-on
register values and in the meaning of bit 7 of DAC Control 21, so the
driver has to know which part it is talking to before it can set either
of them up.

Changes in v3, addressing the Sashiko bot's suggestions on v2:

- Give the variant enum non-zero values, and add an SPI device id table
  plus the ES8388 entry to the SPI match table.  A zero match-data entry
  cannot be told apart from "no match data", and with no id table the
  fallback lookup walked a NULL table, which would fault on an
  SPI-attached ES8328; an ES8388 behind SPI also resolved to the wrong
  variant and skipped SLRCK.
- Drop the register cache after the control port reset.  The cache
  outlives a component rebind, so it would otherwise describe the values
  the previous bind left behind instead of the ones the reset restored.
- Link to v2: https://patch.msgid.link/20261031-es8328-vol-init-v2-0-d15b04c22f4f@163.com

Changes in v2, addressing Mark Brown's review of v1:

- Reset the codec at probe time through SCP_RESET, so that the register
  cache describes a state the hardware is actually in.  SCP_RESET is not
  self-clearing, so the reference and the VMID settings are written back
  afterwards.
- Provide one set of power-on defaults per supported part, taken from the
  ES8328 datasheet Revision 1.0 and the ES8388 datasheet Revision 5.0,
  sections 6.1.1 to 6.3.30 in both cases.
- Look the variant up from the match data in the I2C and SPI glue instead
  of testing the compatible string, so the lookup also works on ACPI
  systems.  Both i2c_get_match_data() and spi_get_device_match_data()
  fall back to the legacy id table, and the I2C id table carries the
  variant as well.  The driver still has no ACPI HID table, as it never
  had one.
- Use a define for the SLRCK bit, and drop the of.h include which is no
  longer needed.
- Keep the regmap configuration indentation consistent.
- Link to v1: https://patch.msgid.link/20261024-es8328-vol-init-v1-0-efbd24de9639@163.com

The variant plumbing lives in patch 1 because the defaults have to be
chosen when the regmap is created, which happens in the bus glue before
the component is probed; patch 2 uses the same variant to decide whether
SLRCK applies.  Boards with an ES8328 keep the same register values as
before; the only change for them is the reset at probe time.

One observation from bringing this up: this silicon is not fully
readable.  Registers 0x28 and 0x29 read back as their power-on value
regardless of what is written, and bit 7 of register 0x01 is not
implemented, so writing 0xc0 reads back as 0x40.  That is one more reason
to treat the register cache as the record of what the driver programmed
rather than reading the state back.

Testing: on a QuarkPi-CA2 (RK3588S, ES8388) running v7.3, where the codec
sits on I2C, playback works and capture goes from digital silence to
working audio.  A register the driver never writes was modified before a
warm reboot and comes back at its reset value once the driver probes,
which shows that the reset and not a power cycle restores the state.
Unbinding and rebinding the sound card while the codec stays bound leaves
capture working as well, which exercises the cache invalidation above.

The SPI glue changes are compile-tested only: this board has no SPI
wiring for the codec, and the SPI side of the fix came from the Sashiko
review bot.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
Bob Hui (2):
      ASoC: es8328: reset the codec at probe time
      ASoC: es8328: set SLRCK for the ES8388

 sound/soc/codecs/es8328-i2c.c |  18 ++--
 sound/soc/codecs/es8328-spi.c |  20 ++++-
 sound/soc/codecs/es8328.c     | 199 ++++++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/es8328.h     |  11 ++-
 4 files changed, 231 insertions(+), 17 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261024-es8328-vol-init-6a52c17897cd

Best regards,
--  
Bob Hui <bg9oxa@163.com>

