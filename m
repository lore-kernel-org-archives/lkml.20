Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447173;
	b=1f17mGbRy6v0M3Mw8L/NdB/uSRH927aI3Infjl7t1YqELPeIEj3LSGVkJIiV1UQzclXU
	 1Zh1B28OAmie/1Ef4ooh6Jp1kJMNisYbQNwrmI6yqvlAMaOsiUNWwE7j6n5xZQAy6Geqg
	 AUbSggeZBa4b+t9U1I2+9dKkoxakvTTY9wH0NKXMufTZvGhIZ5QNf6g69KfSdJBLgYZzn
	 zZpKcJYXIh0h2ej8ZfzlT2L8qy4OnHuFBROM5wY70LkhfEjK5+VCpapIJZBdEnDDf7XaT
	 AcH7TSITdgwKJNJOlsiUWtazCCvNt9jmBp/Kf6nwHaz5pIbvq/uLjH+fiF2aDbnALmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447173;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=xvPe0hae6om5WK2Trd0+qZd3tfsCQzQ/kfhX0XqX+DA=;
	b=neVKOMCCT9O7sFOcubpstZDQfXoT/PruF40j7gDX6Cwun2vUdFmkaDM2sgsCWe9rNXUR
	 xnSt7J7/piqQpU6H7KlIAqqZOFyoTh8WnFsQq+6P9jw7EhsRiHb5u4h7zH5jAvdbG9876
	 crwRZYXMDZizpYI1uh22ucszBaBFWrHMvgHBvmIFH+lrylVGS8F3EjkfFjdlXHMM9hXdv
	 8wCGo3koo8H5mrkGrHb2iKSNI4Dc4xU/7RNxwzQ7arEXMZO9rzYZY5pj3H7n35o1w6Dmn
	 jAUk02OTGVMdIuMw9ZmCKOUZOR8l+F0noygs/walI8mgRgXuKiNI7uiRy20YMNaHZsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Yu/IdwqW";
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4F4606A31D;
	Sat, 31 Oct 2026 11:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF4F4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Yu/IdwqW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=xvPe0hae6om5WK2Trd0+qZd3tfsCQzQ/kfhX0XqX+DA=;
	b=Yu/IdwqW6OyIshEjYMnugeRTLWMVo4fQCB3EqTPBmF1482sEjbY4RjCRxizTTJ
	3oVLK9KUKhkLNkEnSKoX633zS/roOee6LFWXA7xwLjHaKCx6Az8oCl/J1ueP6kmX
	F4D05q2nRe1AHo982Uu+Yyc2ClB8zrRVOLm+drzwvYdP8=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3n9Pj1OVqq0aEDw--.53552S4;
	Sat, 31 Oct 2026 19:45:43 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Sat, 31 Oct 2026 19:45:37 +0800
Subject: [PATCH v4 2/2] ASoC: es8328: set SLRCK for the ES8388
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
Message-Id: <20261031-es8328-vol-init-v4-2-5bdc00b25948@163.com>
References: <20261031-es8328-vol-init-v4-0-5bdc00b25948@163.com>
In-Reply-To: <20261031-es8328-vol-init-v4-0-5bdc00b25948@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD3n9Pj1OVqq0aEDw--.53552S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8AF1UZryUArW5ur13CFg_yoW8KF1kpF
	s5JFZ5t3WxJayfZrs5A3yFqFsakrW7ZFW7Ca17K39xJr1UAw1kZ3ZxAa4jvFZYvryfua9x
	Grnrt348GF1rGrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pKYLyiUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+geC72rl1OdfGAAA3r

The ES8388 has a single LRCK pin, so the DAC and the ADC have to take
their frame clock from that one pin.  With SLRCK clear, which is the
power-on default, the capture path never gets a frame clock and records
digital silence while playback keeps working, so boards look like they
have a dead microphone.

Bit 7 of DAC Control 21 is SLRCK on the ES8388 but LD2MO, left DAC to the
mono mixer, on the ES8328, so only set it for the ES8388, using the
variant looked up from the match data.

Tested on a QuarkPi-CA2 (RK3588S, ES8388): capture goes from digital
silence to working audio.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 sound/soc/codecs/es8328.c | 17 +++++++++++++++++
 sound/soc/codecs/es8328.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 716a1ec4714b..ae85770ae682 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -878,8 +878,25 @@ static int es8328_component_probe(struct snd_soc_component *component)
 		goto clk_fail;
 	}
 
+	/*
+	 * The ES8388 has a single LRCK pin, so the DAC and the ADC must
+	 * share it: without SLRCK the capture path never gets a frame
+	 * clock and records digital silence while playback still works.
+	 * Bit 7 of DAC Control 21 is SLRCK on the ES8388 and LD2MO (left
+	 * DAC to the mono mixer) on the ES8328.
+	 */
+	if (es8328->type == ES8328_TYPE_ES8388) {
+		ret = snd_soc_component_write(component, ES8328_DACCONTROL21,
+					      ES8328_DACCONTROL21_SLRCK);
+		if (ret)
+			goto err_slrck;
+	}
+
 	return 0;
 
+err_slrck:
+	clk_disable_unprepare(es8328->clk);
+
 clk_fail:
 	regulator_bulk_disable(ARRAY_SIZE(es8328->supplies),
 			       es8328->supplies);
diff --git a/sound/soc/codecs/es8328.h b/sound/soc/codecs/es8328.h
index 3e2cfca050e2..6c175b3ee23e 100644
--- a/sound/soc/codecs/es8328.h
+++ b/sound/soc/codecs/es8328.h
@@ -232,6 +232,8 @@ int es8328_probe(struct device *dev, struct regmap *regmap,
 #define ES8328_DACCONTROL21_LI2MOVOL (7 << 3)
 #define ES8328_DACCONTROL21_LI2MO (1 << 6)
 #define ES8328_DACCONTROL21_LD2MO (1 << 7)
+/* Bit 7 is SLRCK on the ES8388 and LD2MO on the ES8328 */
+#define ES8328_DACCONTROL21_SLRCK (1 << 7)
 
 #define ES8328_DACCONTROL22	0x2c
 #define ES8328_DACCONTROL22_RI2MOVOL (7 << 3)

-- 
2.34.1

