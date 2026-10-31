Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431498;
	b=F89eU9R1XmJkIDwQL+obh0GmpFYGvkB0wipNRH2XkLaxYOzxA0PH6QBtsXRlegg3146X
	 zYW5OgK4VEmsG3KeyYI3afc9PScwLOeNBWgtj5jINJ/eKhYB+HqhE8rQ+R+vQpFdTTI60
	 g4DlIi3LSd78hR3U7IM25VQ+fHPxZEEntSOtEI/NUTkahIgPUJMcrPRq+Zg1AjhMX0lQL
	 iTw8yqDFJIlgPki2zTktLAYIuwL14G6urhvaehlKoizBqmSCwiSVRkwCWzYjZIAGnBv86
	 bokGAq8rxocALGWjUFmfoDr2bqOtEQkV2iuEJSmcP9B0WRPCknqtyfwCkOtsG9g1iEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431498;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Am0XCqJdknwv+Tg0Bg5zcmie7KYc5tRx+M/gUdathM4=;
	b=W2qYMyQAa5jxsqP50cINyQtHoOlh0v9Agw+EJiNPDFgTe9YWHviukA/QkN6JfZoimtYO
	 FlsWSSsgCfJ1ct/sFWQj8ciW+EQar4fUT1JqoeT0PgvYbf+sB4IGw0AewZzou04CEesOs
	 AHDiBBywPey3XPgDU6fDMepKzuEjNuLrYCw9KQA2wR2MhHHbtHlxixYNMs7RfRrag31aD
	 ltQxMqWoNjorcQVt2ZZgTQnMDlAqvycx+5/Q8qJsbPZ8O/zgIjuaWVEp3ZhKBAbkiBVNE
	 1JCCVEPPdCIJxh+095/WlvOniL4h7qEGNg9KY8pGEBlBJ0Bk6YY74e6WgrCr9waPi+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kqGgkzax;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE38D606A33A;
	Sat, 31 Oct 2026 07:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE38D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kqGgkzax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=Am0XCqJdknwv+Tg0Bg5zcmie7KYc5tRx+M/gUdathM4=;
	b=kqGgkzax5VHLw7skDo/ZE2FUCQBN91ZnRnm9J4arskjIFVAlsT+0daLoRqx08R
	BRX2saYQnwrmT0gB6whCXzFwaY3R7/JpDMja+moBDNOz4mTkA0+gyinJl9nbPCbF
	BM9MBdJ7AnOpPvwdNPbDUo7TE3UAJBDd6p8fVgZy2gb9U=
Received: from 4F-GAME.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHuqGjl+Vq5JN6DA--.11355S4;
	Sat, 31 Oct 2026 15:24:21 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Sat, 31 Oct 2026 15:24:15 +0800
Subject: [PATCH v2 2/2] ASoC: es8328: set SLRCK for the ES8388
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
Message-Id: <20261031-es8328-vol-init-v2-2-d15b04c22f4f@163.com>
References: <20261031-es8328-vol-init-v2-0-d15b04c22f4f@163.com>
In-Reply-To: <20261031-es8328-vol-init-v2-0-d15b04c22f4f@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:QCgvCgAHuqGjl+Vq5JN6DA--.11355S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8AF1UZryUArW5ur13CFg_yoW8KF1kpF
	s5JFZ8t3WxJayfArs5AayFqFZIkrW7ZFW7Ca17K39xJr1UJw1kZ3ZxAa4YvF9YvryS9a9x
	GF17t348WF1rGrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pKYLyiUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gUjkGrll6UbYAAA3u

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
index f04e310262e7..3d9a1fe1b9a0 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -861,8 +861,25 @@ static int es8328_component_probe(struct snd_soc_component *component)
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
index e98328b29aef..4ac49825c355 100644
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

