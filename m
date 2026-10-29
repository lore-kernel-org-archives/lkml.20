Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253614;
	b=LE14zYv3zka+iie0CWXi87mtr1nHTu3zPqvEJKfjumo2xWIpoOG8Q48l4IcxaTu44wxj
	 e4iY5n2kzrMMWzmlfcZsianWKi1f5pnS/orkIuiRQtPf/Q3sIFKUofC8YXlaMNcZ8sBlW
	 hn73QYzrVp5X2uY0vBSl6A06R+bwuVbnddyy4jvMj5HYhdut7NfyRXaFQefxGO9M5nbk4
	 +eybMcU4gGX3PcFWty4/WLefTZSNtvz1uAUQfjX6dF0+vvqWQYgBBLjNaZZDZGJaeo0tT
	 S5yfXH9+YV4Buh1UFt87+JflJfjaaG3aigW0xF1V2KAxioOfcJr3W6UoQm2O6DLKDAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253614;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9jsZV6tJxvBfZHrRRHfJr4z1Bdmp0wbXP7PaAyZg2DQ=;
	b=T5gusDtghlL7UOI4/wRZ9efE/Sr+etDEeNJ2jlCJYmt0qQ2/+6W9HRiImZyrIkbS714Z
	 0Algkaj9Jc/DZUuVyGQyG6j/xaGjDBcLYfenp/hy+FmqeNhHtWecxIwU3zfXYio7a9oBu
	 qPYjS1rjaMX6IrbIkbLeOo04YXC7NUab1AwQmahjtCOk+MtcZIRotzLe8rwN7s5Qbv1o2
	 b06++QQCHo8pSBDELaubJ3635AC/aFfr4uMm4eCPD3yck5/t0GeasDKUVWC+DA7olxYLh
	 CSxqSKWaP6akIaqpH5KiNBr/8Y54nGnCiO3h2EbmMGRH6rtBbnZWhE/aC1t6xX85x+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92187606A31E;
	Thu, 29 Oct 2026 06:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92187606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f8ed46c2d35d11f19a56ed5b684f684d-20261029
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:94fa15f2-9933-4612-8501-663724b1ac59,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:503cd10159724e47f562d8a7ecf15e67,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8ed46c2d35d11f19a56ed5b684f684d-20261029
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1239124262; Thu, 29 Oct 2026 13:59:58 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	John Doe <coolcrew45@disroot.org>
Subject: [PATCH 1/2] ALSA: hda/realtek: Add speaker depop sequence to alc225_shutup
Date: Thu, 29 Oct 2026 13:59:44 +0800
Message-Id: <20261029055945.188723-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mute speaker pins and disable their pin widgets, with a 75 ms delay
after each step, before cutting EAPD in alc225_shutup().  This
prevents the pop noise that occurs on suspend when the amplifier
loses its input signal while still powered.

Reported-by: John Doe <coolcrew45@disroot.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221616
Tested-by: John Doe <coolcrew45@disroot.org>
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23329d5887a5..67ce5b130f81 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -665,6 +665,7 @@ static void alc225_shutup(struct hda_codec *codec)
 	struct alc_spec *spec = codec->spec;
 	hda_nid_t hp_pin = alc_get_hp_pin(spec);
 	bool hp1_pin_sense, hp2_pin_sense;
+	int i;
 
 	if (!hp_pin)
 		hp_pin = 0x21;
@@ -698,6 +699,16 @@ static void alc225_shutup(struct hda_codec *codec)
 		alc_update_coef_idx(codec, 0x4a, 3 << 10, 0);
 		alc_enable_headset_jack_key(codec);
 	}
+
+	for (i = 0; i < spec->gen.autocfg.speaker_outs; i++)
+		snd_hda_codec_write(codec, spec->gen.autocfg.speaker_pins[i], 0,
+				    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
+	msleep(75);
+	for (i = 0; i < spec->gen.autocfg.speaker_outs; i++)
+		snd_hda_codec_write(codec, spec->gen.autocfg.speaker_pins[i], 0,
+				    AC_VERB_SET_PIN_WIDGET_CONTROL, 0x0);
+	msleep(75);
+
 	alc_auto_setup_eapd(codec, false);
 	alc_shutup_pins(codec);
 	if (spec->ultra_low_power) {
-- 
2.25.1

