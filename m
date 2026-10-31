Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431492;
	b=VzaSVC7cyhZk4P7X0ood8C+99d1uor3sqdPuzavIGh/Af4GR7r7uaBwz0FMBUDCiwH+y
	 bA6mcP7Z+po1dSDEPakSEztcYWV19HUPHfBdumQoCBl3g0dLGm00BNbbktYqgEo4j/eYN
	 e6OfKYNLA+9kkbCJS05OQGMIRWbM3EvvhhWlQIdi1VzkoktpeyCMZW6pllPw08E9Ix1Xh
	 TtCr2zsdKAbWG/Ua6Xqzw2Q78yzMeHqwjaHAdMlYOMZW61DhYRsXX8C3XnO+sf6+P3m0S
	 Y4YK1uaZeNf+YZDQUX/jPvu9RwLtB0XMPeYUw3OT9Jvldx9GzWaIuiHE0am481qixJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431492;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=pDYqqEopyt8zcxeBTCH6ZfPoZpWfEJKYIF2XXnrJihM=;
	b=drSYQ8bEfIZvwlORlBpkTUrCawc1Oh3R4hsDAjUjG+XwDIHeDwbYbIILIOZT1YzqA2+a
	 Cqqsqzhus09JBM5Ix4/g0uJTimsC+Ge+lEzlM7Nq35Lqv7+Hmbi5k8KW5MEHOOiAm++60
	 NUSWSsKH7qARnwvoXOYKuvRNioFstr+UThcj5vr3QsCNYV3vhw7gkoaATY9UDrmT2qMfa
	 gsVtBekCM5xM5co58YvxzKtm31e76YLtXY4b73/ILcecU2YtdSgBR4khmTyrN/G4xa3WU
	 3tZyy7vAG4ST3+9iEbWKifkPyuk2b+V37pRrZ0qSnMk0VmbBa+SafOnGNd6G655tyIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PGzsnuOv;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECD606A31F;
	Sat, 31 Oct 2026 07:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52ECD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PGzsnuOv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=pDYqqEopyt8zcxeBTCH6ZfPoZpWfEJKYIF2XXnrJihM=;
	b=PGzsnuOvsGFmg/fxlZyS4gDZJs6fYY9k8vX/nmC0slHpdF3ri28lIX0MYEmVoS
	TlgYuw38O3MsZZKmkgbI8iY1OEiGMiSj/icaJwgVsm1MB/YlKjJJRGv7atHo7/qK
	Tj261xwrpRqhdeCf11G4nsiz5EEedLlbaAElzegxtP43w=
Received: from 4F-GAME.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHuqGjl+Vq5JN6DA--.11355S2;
	Sat, 31 Oct 2026 15:24:20 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH v2 0/2] ASoC: es8328: enable capture on the ES8388
Date: Sat, 31 Oct 2026 15:24:13 +0800
Message-Id: <20261031-es8328-vol-init-v2-0-d15b04c22f4f@163.com>
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
X-B4-Tracking: v=1; b=H4sIAJ2X5WoC/3WNyw6CMBBFf4XM2jF0wPJY+R+GBbSDjFFqWmw0h
 H8XcO3yJOeeO0NgLxygTmbwHCWIG1egQwJmaMcro9iVgVLSKqUcOZQZlRjdHWWUCXV7IqOKsiq
 MhXX19NzLey9emh+HV3djM22ZzRgkTM5/9suoNu9/PSpMkfvOUm650ll1Vjo7GveAZlmWL5XnA
 /C+AAAA
X-Change-ID: 20261024-es8328-vol-init-6a52c17897cd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:QCgvCgAHuqGjl+Vq5JN6DA--.11355S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur48AF45Wr1Duw18KF4fGrg_yoW5Ww4rpF
	ZYgFy5KF1kX3y7ArsxAr4jvF9Yk3yfXr43Zryxt34jvw45W34rtFW7KFZ8XF4j9ryFg342
	9r12q34UuFWDZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_JPErUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gQjkGrll6QbWgAA3U

This series fixes capture on boards built around the ES8388.  That part
shares the driver with the ES8328, and the two differ in eleven power-on
register values and in the meaning of bit 7 of DAC Control 21, so the
driver has to know which part it is talking to before it can set either
of them up.

Changes in v2, from the review of v1:

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

Testing: on a QuarkPi-CA2 (RK3588S, ES8388) running v7.3, playback works
and capture goes from digital silence to working audio.  A register the
driver never writes was modified before a warm reboot and comes back at
its reset value once the driver probes, which shows that the reset and not
a power cycle restores the state.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
Bob Hui (2):
      ASoC: es8328: reset the codec at probe time
      ASoC: es8328: set SLRCK for the ES8388

 sound/soc/codecs/es8328-i2c.c |  18 ++--
 sound/soc/codecs/es8328-spi.c |  11 ++-
 sound/soc/codecs/es8328.c     | 192 ++++++++++++++++++++++++++++++++++++++++--
 sound/soc/codecs/es8328.h     |  11 ++-
 4 files changed, 215 insertions(+), 17 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261024-es8328-vol-init-6a52c17897cd

Best regards,
--  
Bob Hui <bg9oxa@163.com>

