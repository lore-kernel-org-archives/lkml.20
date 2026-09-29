Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1C4EB858;
	Tue, 29 Sep 2026 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672929; cv=none; b=XzAOhCocQiDpplwxEstOAlBzDkpQmrHcolxneVqppTbXIhJ21m6qLYJqSRYjIeBR3j4jZ49bEYHEw9mAC3UVo/EUpofy2J+WrLLqvCJtSzbwckiz0/UWzb6/evZ7WlzSY2U52jWwjGdEjyFTEYRDzAr2T1sgUYs72tDyJAxkZZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672929; c=relaxed/simple;
	bh=01V/KEDsIkNum6euKLugEphIxa6FSwSG+QVEKSFUp9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVhOX/7TzJ674PUtekcVfHo5pSz+wNVjKoKhwsOxtkDbHxI7D1CokrlxCyYkMTCp1zf1UMI6dWhx+ycZlHihuw+ATCXPr8qJHUmEctiWF+oATPHv3q+evc4IMi80OtB2tyqPXKm+KAPFxUFKEAbg3R+wpT305bW+xseIYUjPON4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=N4VKjGPz; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="N4VKjGPz"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hvC5W4KgkzKp2R;
	Tue, 29 Sep 2026 11:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790672911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t/XvN0wTuT+m8uL1NARzEIBlbAsOhBjp9jhNUMF4RvY=;
	b=N4VKjGPz/Aq5QaXUsqy7kR6LBE5M9Y4Zc6iQHy+Q8YoAHkdU3X9I/9NJEGsxxm6DTy4rgE
	yYMmA6HGVE4IdBvDmP904PobyuXmNKbexsLM9RCSX7fKOdvJFFT4DNFB1F+B29fipKa3HO
	Co34f+nUHCsN0X2Sarc7WIGa8irWPhkOyCut1BGEVNvyk/naydXbj7VJGAfqlsfXalqXhP
	UjrbXnkm2G9K/fDIyxen+ZbsaDXpUuZPNk8guuiAnIn3qCoFpGGPyBRkl4eakH5JGhJK7u
	WWHr/g3q2bXGYViZJxKB+tMIeGcjcgu1MLgepFh1bUZ8tESnBQZrxD5amSCmrA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@alexanderkoch.net designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=mail@alexanderkoch.net
From: Alexander Koch <mail@alexanderkoch.net>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [PATCH v2 0/2] ASoC: codecs: ak4619: Add PDN pin handling
Date: Tue, 29 Sep 2026 11:08:19 +0200
Message-ID: <20260929090821.1476257-1-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4hvC5W4KgkzKp2R

The AK4619 datasheet describes the functionality of the power down (PDN)
pin as follows (p. 39, 'Power-up/down Sequence'):

  The AK4619 should be powered up when the PDN pin = "L". The PDN pin
  should be set "H" after all power supplies have ramped up.
  At that point, the reference voltage generator block (REFBLK) and LDO
  (AVDRV) circuit are powered up and the control registers are
  initialized. Control register settings should be no less than 10ms
  after PDN pin = "H".

The current implementation of the driver does not operate the PDN pin
in any way, it seems to rely on external control of the pin.

Improve this by adding a device tree binding to enable the driver to
set the pin 'high' during probe. Make it optional to keep the behaviour
for existing device trees unchanged.

Tested on an i.MX8MM board with the AK4619 connected to GPIO1 and SSI3.


Changed in v2:
 - Fix typo in bindings update subject
 - Fix missing #include in example block for dt binding YAML
 - Improve property description in binding YAML
 - Switch property name to commonly used 'powerdown-gpios'
 - Invert GPIO logic to avoid confusion (the pin is called 'power down'
   but when driven high the chip is powered _up_)
 - Fix power leak on error after GPIO is acquired by turning the codec
   off again


Alexander Koch (2):
  ASoC: codecs: ak4619: Add optional powerdown GPIO
  ASoC: dt-bindings: asahi-kasei,ak4619: Add powerdown GPIO

 .../bindings/sound/asahi-kasei,ak4619.yaml          | 10 ++++++++++
 sound/soc/codecs/ak4619.c                           | 13 +++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.55.0

