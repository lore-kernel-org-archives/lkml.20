Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7444B1464;
	Mon, 28 Sep 2026 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595647; cv=none; b=lIGo05P5aC+yzn4pIPj53+g500oQXKig1JOGXJJ5F4lgm20urt6cFKAqfXZgSuO2eS1UrUR+P2svk+18lDUUWj9+4mTAkD96Ggrw6mbjY5Iv7jKxIhI5QLny0KX3ajwww4eScHIWzVxYP8r0hrbNu62z1LCbBhDmyyo+nBJ1wLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595647; c=relaxed/simple;
	bh=8ajXFaw4eyT8EQ/1gLGMUcCl6f+TZyuhS55oSOxZtZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gz8YG3UZ/PqFxBcQWOC0HJfXnbzjqXwUGqzEMNr+dcvFmfg3xDwr6FqR/dS+6yl9JOPpe0wsnZ97o2RvQmdGadCXwaWNr9Kjyyo2hMomRsCifd0V6Ims4rNE3gBJKOVW9Fes3Y7xoiRsIhYqAQMOUr8qbJFUnRmqgcR5MtvZ6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=bPooZGY1; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="bPooZGY1"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4htfWV2GqpzMlV2;
	Mon, 28 Sep 2026 13:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790595638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=liTwmEJb8XCBJE5Cf9Q+AVlR7kHLYNSyB/hh3L71nzw=;
	b=bPooZGY1UgHSnSvHUoQ1uwSuL+twzO73fIYwnRiXLI4RRbiwoeyjMPFrlyjsX+LXznbBEA
	vntSyg2kH3S8s1nKpm7U1pEF0fIxYby97h5oJ898yK5GLVePaZiO+QAbRSnGF4bdqv/ZPU
	tuCaxvLtRXTXi8dumoBV/OEt1g+fLu1nOIzJgO6IhWvt86tl0+Jrp3Oi52zoUEUdrh8WlJ
	/MPz4t31Cnbfk4K0GsD+KbUSddU1Mb/fIIFExzuhs5oPRGr+FdWSNSYBnycQ654FRVINov
	SWStqly2gyUOIEtZp3oR2f57NG3YIEUw/FpAhDiux/U/+phrCd2oJOKYGotD4A==
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
Subject: [PATCH 0/2] ASoC: codecs: ak4619: Add PDN pin handling
Date: Mon, 28 Sep 2026 13:40:17 +0200
Message-ID: <20260928114019.1441752-1-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AK4619 datasheet describes the functionality of the power down (PDN)
pin as follows:

  The AK4619 should be powered up when the PDN pin = "L". The PDN pin
  should be set "H" after all power supplies have ramped up.
  At that point, the reference voltage generator block (REFBLK) and LDO
  (AVDRV) circuit are powered up and the control registers are
  initialized. Control register settings should be no less than 10ms
  after PDN pin = "H". [1]

The current implementation of the driver does not operate the PDN pin
in any way, it seems to rely on external control of the pin.

Improve this by adding a device tree binding to enable the driver to
set the pin 'high' during probe. Make it optional to keep the behaviour
for existing device trees unchanged.

Tested on an i.MX8MM board with the AK4619 connected to GPIO1 and SSI3.


[1] AK4619 datasheet, section 2 'Power-up/down Sequence', page 39


Alexander Koch (2):
  ASoC: codecs: ak4619: Add optional PDN GPIO support
  SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO support

 .../devicetree/bindings/sound/asahi-kasei,ak4619.yaml     | 8 ++++++++
 sound/soc/codecs/ak4619.c                                 | 7 +++++++
 2 files changed, 15 insertions(+)

-- 
2.55.0

