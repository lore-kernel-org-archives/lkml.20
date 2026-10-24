Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831719;
	b=EhmnHy3GOP+0xQQBPERSwwy+DXN5/OGhQ3WQTI0Se8CBHS5QBp5BE7kQEg4yEhynyaKj
	 AV3019fL6kOvhPClAfXUwD+ad0zxdL4kDKF8/WpTS1La7Un7ytL1fKGLtCCYe/Cu+N5P3
	 NOFfWmGYWIzDsoVsJhek4M1PDqLgpgpoor5g+ipPVIUhItv3v4dasGUe9fMWnzBqCFcez
	 zFtGuhVCaoSNa2miDN3/4F/mQlStTcIwPCHCVdQKebitNDshtrNqaAyg/ERujM4/0CFHu
	 YkiKWKpkYTsArfxXmh9u/OLDhI7pWRJLxAWFR8lgmKFMVzmBNVHWqlmHCEAewrNDGcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831719;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9AgtTST0Z1+lZzItDh6NHPXLbM/PZEmotJfB+llmyrU=;
	b=zuAf5Qag8vp7OmT3QDJr0yGOw9Olln42FbDCzVF3YYMeE17/pc8g8p0Ta0/dn2WVn1Yp
	 bFqSu/DIIpDAcot6dzV5528urrq23x+hFD7OE3zsEZ114I0Ym/IfVtU/LzwDC0Bezv2cA
	 ymgZdTx3FT1Pd20ZZTxZEvNSuOYPet32L0/IAxCglJGj7/nuknX2j19pYj6cFeSy9+e5v
	 Y4f+0gGgINOBcG/bqblp0uGcSisFAU32s2dIMqHMyTgRZ9u8l+ISRHPn1q6jZ29ElGM25
	 x0q2oASAZP1BxvXD49sRwryEqBwvK8X6sCiF1CDFrFnzO+XscP+UUUGhW1WQXuuf7lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TaHMi9pO;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B61E606A31A;
	Sat, 24 Oct 2026 08:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B61E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TaHMi9pO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=9AgtTST0Z1+lZzItDh6NHPXLbM/PZEmotJfB+llmyrU=;
	b=TaHMi9pO37EKQ+3z2f+xaCd6Np7e2YIPiaPETy17/9ELx/P7Km0nKgC+O+H5J2
	eEEdjxEZAy3JrYdwCFAeADiPkuyUYQQnIboPYAm1xjd0PYwEh8WgAHI6wnKW+c3U
	Riav4wJ/uFu9Wo69uN2TnhItT/R0W3jKrE/UX5sdHeHz4=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD31_XDcNxqoEbyCA--.11666S3;
	Sat, 24 Oct 2026 16:48:04 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Sat, 24 Oct 2026 16:47:23 +0800
Subject: [PATCH 1/2] ASoC: es8328: describe the power-on register values in
 the regmap
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
Message-Id: <20261024-es8328-vol-init-v1-1-efbd24de9639@163.com>
References: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
In-Reply-To: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD31_XDcNxqoEbyCA--.11666S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr18GF4rGrW3CrWUWry8Krg_yoW5ZFyUpr
	n0qFySkF1rtw47Zr93GFyrAF1rArWaqFyDCa1xKr13tayUZrykKws0kryqqrySqwnxWr43
	tw15Aa17WF48ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zKQ6JbUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+gUfjGrccMU5vAAA3q

The driver uses REGCACHE_MAPLE but does not provide reg_defaults, so the
cache starts out empty: a register that has not been written yet is read
back from the hardware and cached at that point. The two then drift
apart whenever something else, such as the bootloader or a previous
kernel, has left the codec in a non-default state, and the control
values reported to userspace no longer describe the chip.

Fill in the reset values from the ES8328 datasheet (Revision 1.0, the
per-register sections 6.1.1 to 6.3.30) so the cache matches what the
codec comes up with on power-up.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 sound/soc/codecs/es8328.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index aaa6646ad4c5e..d7f93de82f69a 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -856,11 +856,69 @@ static void es8328_remove(struct snd_soc_component *component)
 			       es8328->supplies);
 }
 
+static const struct reg_default es8328_reg_defaults[] = {
+	{ ES8328_CONTROL1,	0x06 },
+	{ ES8328_CONTROL2,	0x1c },
+	{ ES8328_CHIPPOWER,	0xc3 },
+	{ ES8328_ADCPOWER,	0xfc },
+	{ ES8328_DACPOWER,	0xc0 },
+	{ ES8328_CHIPLOPOW1,	0x00 },
+	{ ES8328_CHIPLOPOW2,	0x00 },
+	{ ES8328_ANAVOLMANAG,	0x7c },
+	{ ES8328_MASTERMODE,	0x80 },
+	{ ES8328_ADCCONTROL1,	0x00 },
+	{ ES8328_ADCCONTROL2,	0x00 },
+	{ ES8328_ADCCONTROL3,	0x06 },
+	{ ES8328_ADCCONTROL4,	0x00 },
+	{ ES8328_ADCCONTROL5,	0x06 },
+	{ ES8328_ADCCONTROL6,	0x30 },
+	{ ES8328_ADCCONTROL7,	0x30 },
+	{ ES8328_ADCCONTROL8,	0xc0 },
+	{ ES8328_ADCCONTROL9,	0xc0 },
+	{ ES8328_ADCCONTROL10,	0x38 },
+	{ ES8328_ADCCONTROL11,	0xb0 },
+	{ ES8328_ADCCONTROL12,	0x32 },
+	{ ES8328_ADCCONTROL13,	0x06 },
+	{ ES8328_ADCCONTROL14,	0x00 },
+	{ ES8328_DACCONTROL1,	0x00 },
+	{ ES8328_DACCONTROL2,	0x06 },
+	{ ES8328_DACCONTROL3,	0x32 },
+	{ ES8328_DACCONTROL4,	0xc0 },
+	{ ES8328_DACCONTROL5,	0xc0 },
+	{ ES8328_DACCONTROL6,	0x08 },
+	{ ES8328_DACCONTROL7,	0x06 },
+	{ ES8328_DACCONTROL8,	0x1f },
+	{ ES8328_DACCONTROL9,	0xf7 },
+	{ ES8328_DACCONTROL10,	0xfd },
+	{ ES8328_DACCONTROL11,	0xff },
+	{ ES8328_DACCONTROL12,	0x1f },
+	{ ES8328_DACCONTROL13,	0xf7 },
+	{ ES8328_DACCONTROL14,	0xfd },
+	{ ES8328_DACCONTROL15,	0xff },
+	{ ES8328_DACCONTROL16,	0x00 },
+	{ ES8328_DACCONTROL17,	0x38 },
+	{ ES8328_DACCONTROL18,	0x38 },
+	{ ES8328_DACCONTROL19,	0x38 },
+	{ ES8328_DACCONTROL20,	0x38 },
+	{ ES8328_DACCONTROL21,	0x38 },
+	{ ES8328_DACCONTROL22,	0x38 },
+	{ ES8328_DACCONTROL23,	0x00 },
+	{ ES8328_LOUT1VOL,	0x00 },
+	{ ES8328_ROUT1VOL,	0x00 },
+	{ ES8328_LOUT2VOL,	0x00 },
+	{ ES8328_ROUT2VOL,	0x00 },
+	{ ES8328_MONOOUTVOL,	0x00 },
+	{ ES8328_DACCONTROL29,	0x00 },
+	{ ES8328_DACCONTROL30,	0x00 },
+};
+
 const struct regmap_config es8328_regmap_config = {
 	.reg_bits	= 8,
 	.val_bits	= 8,
 	.max_register	= ES8328_REG_MAX,
 	.cache_type	= REGCACHE_MAPLE,
+	.reg_defaults		= es8328_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(es8328_reg_defaults),
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.34.1

