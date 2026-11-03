Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715892;
	b=bOFCgwdjp++mYIbaithmkTvhGudAleGQTM3jbjDqb1lKxg2A5uDNckJt2PKD9aHPCS7r
	 ZNDxNjyIG2uGUJ+RlpOIsFOg7T+SoJMrKbj68mXT+KQ6xltOYfMwtoQDvePRFBaxWnfKB
	 AIjz8LWPNfSh9XXT825lbGkqKsnlp10njhjkAHoSvEwGFL98k3M9jSvX6FKtXIlh/2OOy
	 1TZrvOBPHcWVgT4iqHKBRyCbg557ufJHDgXr4e2zNIxwD9K/2Xls5xP+MxE2lMWEwoofj
	 49rPMr5WpvMgJ01XOC2fw7LR+Y7yVDFI/8tuXNE2kh+rxzC7saoxPwsHYoUIZG1vt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715892;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Vs6xdmLnn08Wo9wlQrEqB9KO7vBzEVtkGhXfkt7d6/8=;
	b=VCjLxBthhoLHvivTWRn2P3iqi/pYkrRqpUnB1GHIvrdd2KqsnZHJU+k9/hDerRyernIO
	 oFmG+ux0ogmH7cJcQnohxS+k2g8n2T/QNveEHgVMBUUrOFl1nDyBROHaDa2qpkp7jmKsp
	 GheWD1nMRSqcw5P1g5BaR7VVztIz5It1ELKyv3I3xR/OQ1A7xWl/acYt6u7HFeFO3LUL/
	 /1mVYtWKrDPS2HGKXIEjHaTptpo13If8X6/OEtNJpcS7/mW1k5libXnaHK1/IAJE5d0qe
	 ZZQXlUUpUtINGWdpb1TYXImHQ5ViZfFhcwTCbDYVxqrN3+CL0acRy+h9emw/ZCgQzRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ANZrsIf1;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C21606A326;
	Tue,  3 Nov 2026 14:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C21606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ANZrsIf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=Vs6xdmLnn08Wo9wlQrEqB9KO7vBzEVtkGhXfkt7d6/8=;
	b=ANZrsIf1IrQ6zR2wQ+Dd75jpPiiH3d0FQLy8370QHyhn6GLBIq/pTqp6pMiX+t
	j84Buqau+eJPYtIM42v0qSH/XiX1DfUf1zLPZ5WhMzl6LGsLpmxtX3NlBpsa6OMv
	6kXydzL0XYgmeKn6zad6lBZ3wRz710W433/oiTEkEsATg=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD31xKI7ulqFs2VEw--.7556S4;
	Tue, 03 Nov 2026 22:24:10 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Tue, 03 Nov 2026 22:24:04 +0800
Subject: [PATCH v5 2/2] ASoC: es8328: set SLRCK for the ES8388
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
Message-Id: <20261103-es8328-vol-init-v5-2-9c505c97a8e1@163.com>
References: <20261103-es8328-vol-init-v5-0-9c505c97a8e1@163.com>
In-Reply-To: <20261103-es8328-vol-init-v5-0-9c505c97a8e1@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD31xKI7ulqFs2VEw--.7556S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8AF1UZryUArW5ur13CFg_yoW8uw1DpF
	s5JFZ5t3Wfta1fCrsYy3yrXanayrWxuFW7Ca1UK398tr18ArykZ3ZxAa4jvFZavrWfua9x
	Ww17t348GF1rGrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pKYLyiUUUUU=
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC3gryYGrp7orQlQAA3k

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

Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 sound/soc/codecs/es8328.c | 14 ++++++++++++++
 sound/soc/codecs/es8328.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index fc33d9418449..db3c2677d019 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -875,6 +875,20 @@ static int es8328_component_probe(struct snd_soc_component *component)
 		goto err_clk;
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
+			goto err_clk;
+	}
+
 	return 0;
 
 err_clk:
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

