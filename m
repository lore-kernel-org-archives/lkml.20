Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831723;
	b=Lg0rcOvugd68DGT0uv+4pPqVlYuDxxig6bKU7Ox3ugR8uRrCnKP86MFZ3tu6QMCqB/f2
	 JtKtIo/cdn+PfZr7MbUn9/LsL+4n8c0oMj/q+kWM5bdBtsgunA+/r+edbcKVt9jpMqIlc
	 yjFe+I1iBQ6NudwbXjU1oFArueQY48uWvsDKB+WxqxoZbhsuhfusGkvnlO0mpS/T9ivMr
	 ORe2fmJmckuHx+bbpxNKICiObP8Zn0sVGv0ltKVTZYdyVKGgdX54tFWRtbG87VIsp6MiQ
	 BkvGQLcCNPFJ9oeI+Wh7OoAf8THxO9leDIhUL/6EbFE9e31ijh+gXGAYEMxfllK39jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831723;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=X9Aa137z+AAf2XbAYhAVY69KPq7PYdip0yyaFaFs8XQ=;
	b=aAYHdtgqSHJRaiBHt7scoiD7Cr5vdpvnQUenh0W409BUqK81LU5XCotDMM/KSNwC2nmC
	 1pO342Ys8sbhvfU8pCKbWus6iAgK5D+SjmZxddsuZFCI5mjnbHyVX/+eqxelMS/puzpob
	 mbgRT9PxSNb5bBAJkDuLFTa0OC5m+GwFbK55OQzJ5Kh1rtE8NDekZBFnvt614xmK38/OW
	 9xLoAoB7YJycp4pWOn8QFIJPBtEAsvcOWqiOU2sKh1Zre90qI5OSeu7xNeGJlp5aBKOQk
	 C0SgGtY8cuxTptHfuiAGBb7CVe94+a1YN8LCtIWzGkVaDGljDBstttWwpWWyRe2KWaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=O7cbhNFh;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D4606A328;
	Sat, 24 Oct 2026 08:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5D4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=O7cbhNFh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=X9Aa137z+AAf2XbAYhAVY69KPq7PYdip0yyaFaFs8XQ=;
	b=O7cbhNFhCFYZfcMiMRE2SiTQsADuCn5OBLJo1kbUsbzhux/kVEwarN94p487Ni
	aSnxuESRRIXlnNqAMO4bi5CxjfC/8ALf37fMWs+SVrL+lx2Q5xEgrR9Wt4WczKzq
	CWqiMQilNzeP8n41teV0gXY/8XodcEpZ4byhgT1MJMfys=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_XDcNxqoEbyCA--.11666S2;
	Sat, 24 Oct 2026 16:48:04 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Subject: [PATCH 0/2] ASoC: es8328: enable capture on the ES8388
Date: Sat, 24 Oct 2026 16:47:22 +0800
Message-Id: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
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
X-B4-Tracking: v=1; b=H4sIAJpw3GoC/yXMTQqDQAxA4atI1gac1J+pV5EudIw2RcYysVIQ7
 +6oy2/x3gbKQVihTjYIvIrK7CNMmoB7t35klD4aKKPSZJQjq32QxXWeULwsWLYFOVPZZ+V6iNU
 38CD/69i8buuv+7Bbzg3s+wHR4PHlcwAAAA==
X-Change-ID: 20261024-es8328-vol-init-6a52c17897cd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD31_XDcNxqoEbyCA--.11666S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1UAFW5Cw1fGw4DGrW3Wrg_yoW8ZF18pF
	Zxt3W3Kw4DJrWfArn3Aw4jyF4Sya93Jr4j9rnrKrWjyan0kw18AFsIk3W5XFW5Crn2v3Wj
	qrsIq34xGFWUZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_JPErUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3QQfjGrccMRqTgAA3s

The es8328 driver never touches a register at probe time: it enables the
supplies and the clock and leaves the codec in whatever state it is in.
On a board where this driver is the only thing that configures the codec,
userspace ends up dealing with the reset values, and one of them makes the
capture path unusable.

Patch 1 describes the documented power-on values in the regmap, so the
cache matches the chip instead of being filled in lazily on first access.

Patch 2 sets SLRCK on the ES8388.  The chip has a single LRCK pin, and
without SLRCK the ADC never gets a frame clock: capture records digital
silence while playback works, which makes it look like a hardware fault.

Both were found while bringing up a QuarkPi-CA2 (RK3588S, ES8388) on v7.3.
Playback was fine from the start; capture delivered digital silence with no
noise floor at all, which turned out to be the missing frame clock.  The
same board records normally on the vendor 5.10 stack.

The ADC digital volumes still power up at -96 dB.  That is deliberately
left to userspace (UCM or an alsactl state file) rather than baked into the
driver, since the level is a system policy decision.

One documented value does not match the silicon: registers 0x1a/0x1b (DAC
digital volume) are documented to reset to 0xc0, but the ES8388 on this
board reads back 0x28 after a cold boot, and the driver never writes them.
Patch 1 keeps the documented values; if the measured ones are preferred,
those two entries can simply be dropped.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
Bob Hui (2):
      ASoC: es8328: describe the power-on register values in the regmap
      ASoC: es8328: set SLRCK for the ES8388

 sound/soc/codecs/es8328.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261024-es8328-vol-init-6a52c17897cd

Best regards,
--  
Bob Hui <bg9oxa@163.com>

