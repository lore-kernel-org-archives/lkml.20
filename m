Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443387;
	b=UFERq55T8qq6hzVcI1p2ftD6R8aeq/PigQOp2m6bNOCJV3wyMEUMYiJ8vN9VzRQTZEEQ
	 CPt9wnL/BdXwZJJ33zA01UgY8bnAzEYWFawr0NNkpCDlCpd/TiHPCvphjkmj9IF6Ht1Yc
	 EucnVdYP0fLWTHdqQfPffTZBB9WihZVi9qCqVACNc5VtBkztHrL9W8tzC4grKUv3v3Dt7
	 7+7m0MppJBU8RE/E5020CWlEh7o/kQWh+NrhoEnHWALmiRj48DE8QCGqenQXbNB3JiB5T
	 Mg+LOWxQoKxVtiHNH9TfHS2Tm1E626bFbqVsFeXWa2QELwN/DP61cCURjHefEzf0H1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443387;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=I2ulY1wZIyyKIOde5fAyheaNfB92SUHboQTX2Co+Okc=;
	b=zeZY9DVXAbKvs2zBq3nlLPncfMfHuBSuE72MoSvdbjnCwbir/kWsR3FkRlnm9sAyDJPn
	 7HbD3xwDvYKE5U9vO1CloAJ4g9QNjTNEiT17Tke6txjrYB2bQPFSCMqMJizF1cIrgNLKN
	 Qdh4ZNj75xmzIzt1YLi8oWylwSUFF5ww88OzR66RXWTUAGgaYjOxFjvYN6s84jWwu8IzA
	 UbakaXNHeQBzCaPAp0zrjDuhLT5PhS0IgCcjHMHLzixDRulTKG8sbl6uhfb0HUP5vKorF
	 iWaJehHLJQojst626us4IHBzR2mFM+V+QmldoYaDRskKIOBysZ8E/MKLjDVw/wVipYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Hrflusab;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1BB606A31C;
	Sat, 31 Oct 2026 10:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E1BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Hrflusab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=I2ulY1wZIyyKIOde5fAyheaNfB92SUHboQTX2Co+Okc=;
	b=HrflusabaixeOnU31L+GPAyXkLL7cmnVMm2JCLDhaun7rGshkWEg0NlmuCgt+l
	LTMZQbOZ0X4vVpzXSCTE5dvgMJ4TYvDd25+ElurGVEBDb6xwtvQyuao/csyAlV/A
	IMwV+jqQLPgZXml1dq4OjI3Vi3kIaK2sQ/xp7oY14cMs0=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnbwoTxuVqQyp9EA--.12272S4;
	Sat, 31 Oct 2026 18:42:31 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Sat, 31 Oct 2026 18:42:26 +0800
Subject: [PATCH v3 2/2] ASoC: es8328: set SLRCK for the ES8388
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
Message-Id: <20261031-es8328-vol-init-v3-2-7d9c4b7ab67f@163.com>
References: <20261031-es8328-vol-init-v3-0-7d9c4b7ab67f@163.com>
In-Reply-To: <20261031-es8328-vol-init-v3-0-7d9c4b7ab67f@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wDnbwoTxuVqQyp9EA--.12272S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8AF1UZryUArW5ur13CFg_yoW8Kw48pF
	s8JFZ8t3Wxtw4fArs5AFWrXFsakrW7ZFW7Ca1UK39xJr1UAw1kZ3ZxAas0vF9Yvryfua9x
	Wwnrt348WF1rGrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pKYLyiUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3RfKOGrlxhc+zgAA3W

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
index 5618fd7e6eb6..c283e814177b 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -868,8 +868,25 @@ static int es8328_component_probe(struct snd_soc_component *component)
 	 */
 	regcache_drop_region(es8328->regmap, 0, ES8328_REG_MAX);
 
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

