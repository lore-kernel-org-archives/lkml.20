Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447170;
	b=mQH9owjprrWdaPwfrdp+v12uWV0BK5ES59LjOyxGsU27ZpLSkKquFGVB8MK3lmAWdjyq
	 bBedgBrwbIB8H8o+mg+pVphx17WXEySlA/+i9fdGNMd3oMr0/7JHL4CXcfqedZpMENYdg
	 DisZ6n/jHj4ByNr3UqpnpEfhhvxg2f98ywYXt1aI66bzruWDYWLe5qp20I2bt0qIb91mW
	 /9rk6khD5AmcJauhqdJRe0h9cfJMpiw+pPMfFGfhoTehLk2M/zAd3wnx6VI1rOJx+plpU
	 sYMBOhn1UqkVZRpAoITbbXEnR28F3Z3uX0oijKbvhPg98U9XIYiyTL27Cg+PHxsFdWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447170;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xO0cCGhtJJTKE9KA2w/8Ef+xGwT5LXqnYvAXTWcz20U=;
	b=q/3t8Ig8kylaE41kMN3ntJBFMLeafEV8lU06k/19y2DcJpHN8jf8OAnYZUr1HZ85NVuT
	 7VfEEVD+ZhUYrs//YdCYY1E8GODX0n6nwdhPs84+D91R37s//41TpcVdWIAK5hExdVRTW
	 jeJPVIl6ARZyv1KlWWl3BzC2DSUtb/0nleCkGxSMzmxt5lcWknhLslx1qfulGdOTotwp0
	 NnoOY8v2INO42D7NNarqdVSoiKdFerUASlxg1gYdYnp42iIpY7x/oIaLHcUROgyJTi7K1
	 UgaFZRi8e4i7KU1NUY6V6keF2SksTvQxWqRnbM+aSiszSYJqYV6/QQ1r4U+kXk+b1QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TVCAsYTB;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DB606A329;
	Sat, 31 Oct 2026 11:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4DB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TVCAsYTB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=xO0cCGhtJJTKE9KA2w/8Ef+xGwT5LXqnYvAXTWcz20U=;
	b=TVCAsYTBEq3VaZBq4MAB8E/nkGDcT/u8fcDFUTyx3CD4EAQS+MbMqtrLsySalM
	kMJJsGveDR6dadcKXLlTDBcSPX2BX1f0BEEYyvc7ngBeshagaGs+7iU40rVkfusM
	y+15KDwhL6i5WmgRz9e63y9IieyPMx3bB8drjrGUSDuk8=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3n9Pj1OVqq0aEDw--.53552S2;
	Sat, 31 Oct 2026 19:45:39 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v4 0/2] ASoC: es8328: enable capture on the ES8388
Date: Sat, 31 Oct 2026 19:45:35 +0800
Message-Id: <20261031-es8328-vol-init-v4-0-5bdc00b25948@163.com>
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
X-B4-Tracking: v=1; b=H4sIAN/U5WoC/4XNQQ6CMBCF4auQrq2h09KCK+9hXNB2kBqlhmKjI
 dzdghuMMS5fMt8/IwnYOwxkl42kx+iC810aYpMR09bdCamzaRPIQbIcBMVQcihp9BfqOjdQWRd
 gmCorZSxJ6tZj4x5L8XB873DXZzTDnJkvWhcG3z+Xl5HNd7/rkdGcYqMtCIuV5NWeSb41/krmd
 oSV5uxbQ9KWFToXBqARzafmfzRPWtnKCK1qLdVKT9P0AvjBj506AQAA
X-Change-ID: 20261024-es8328-vol-init-6a52c17897cd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD3n9Pj1OVqq0aEDw--.53552S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur45CFWUuF43Jw17uw17ZFb_yoWrtF13pF
	Z8WFy5Kr1DXr4Iyrsavw47AF95C3yfJF45Za4xKa4jvw45Ww1IyrWfKFy5XF1Uur9Yga42
	93W2q34UWFWDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_GQ6DUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+QWC72rl1OXmSAAA3B

This series fixes capture on boards built around the ES8388.  That part
shares the driver with the ES8328, and the two differ in eleven power-on
register values and in the meaning of bit 7 of DAC Control 21, so the
driver has to know which part it is talking to before it can set either
of them up.

Changes in v4, addressing the Sashiko bot's suggestions on v3:

- Rebuild the register cache after the reset with regmap_reinit_cache()
  instead of dropping it.  A drop discarded the defaults this series
  installs and sent every later read-modify-write to the bus, which this
  part cannot support: it does not read back reliably.
- Link to v3: https://patch.msgid.link/20261031-es8328-vol-init-v3-0-7d9c4b7ab67f@163.com

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
capture working as well, which exercises the cache rebuild above; writing
0x14 through the I2C bus then leaves the cached value alone while the part
reports the new one, so the cache is not derived from bus reads.

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
 sound/soc/codecs/es8328-spi.c |  20 +++-
 sound/soc/codecs/es8328.c     | 209 ++++++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/es8328.h     |  11 ++-
 4 files changed, 241 insertions(+), 17 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261024-es8328-vol-init-6a52c17897cd

Best regards,
--  
Bob Hui <bg9oxa@163.com>

