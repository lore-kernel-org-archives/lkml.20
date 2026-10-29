Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253615;
	b=k1mlnJlB7OBfiI8REPYmj1kkdY0LRXOi78YE4EYMDWGqoFCADoxg0JSe326zphxumnyo
	 m/rlcD/8lpNK1hkPeTw459MUAkCJlkdCskuApBxT4tKWjwIwe9TME2Eh6fM+iNf5iINhc
	 h7F8ZeU0X+EIR8zLEX55xfBpCNywAlQbje8uPZphhtkss0xFr942E6NB3KsiXIj6uuqrd
	 gzdiko5NXf2uGr6rtSJjHAK7dwU8AsgzpW11IMMdZkUZ2/ujxgJGS7WcjEMYCP5/sot4R
	 zRaFI0Y/17xvmXhMXMr2NhDV/75EaH8djfrSH78LNGI43D0QiNHCtrnSynkT3Aqw0dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253615;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=sWVF7rYCEhz0Ry5qBHpVVjFwJ4bZ/8r5OtxGRQ9JARw=;
	b=i1c6X+3Aj4VUz+175/xDdjOBZWG6RbTgpq8JY5c9+tRyOPV84lWoWBSxo7gv0uSZuiRQ
	 5M7CCc8ieJF8JV4/T5eVlLbBI6MX9P1LNJCcq7CVvhhe8oAD4mkdVZUpJNIf2ec5CS2IJ
	 pYXOnndjSqYsZ0Qmn28ebsGHy/4HrYYFnulX/X6BeZSs4bZW3153Y7n+djKTqXYYrsHJU
	 L1B5yiGvQ7BSO2Rkg8YQiNuHrK8M2U0KKz+SHSPSUeCmmf7EYnvKwof60DAgwkJKR4rfP
	 Xs+Jfc3/1i7423XjVjo3WLkYOgmAgEPOVbL1BZMO+/U33ZMi9qhBJ9PFW726ww31UKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A1606A31F;
	Thu, 29 Oct 2026 06:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921A1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f9e71620d35d11f19a56ed5b684f684d-20261029
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1eec36b7-8308-432e-aba8-a750ef63a55e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:751e04b5da58cdf5c88130d28e8706f4,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f9e71620d35d11f19a56ed5b684f684d-20261029
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 655998292; Thu, 29 Oct 2026 14:00:00 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: perex@perex.cz,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	John Doe <coolcrew45@disroot.org>
Subject: [PATCH 2/2] ALSA: hda/realtek: Convert HP AIO SPK fixup to INIT-stage depop
Date: Thu, 29 Oct 2026 13:59:45 +0800
Message-Id: <20261029055945.188723-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029055945.188723-1-zhangheng@kylinos.cn>
References: <20261029055945.188723-1-zhangheng@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the static coef-0x10 verb table with a function that mutes
pin 0x1b, writes coef 0x10, waits 75 ms, then unmutes — eliminating
the pop when the internal amplifier enables at init time.  Add
SSID 103c:84ee to the quirk table.

Reported-by: John Doe <coolcrew45@disroot.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221616
Tested-by: John Doe <coolcrew45@disroot.org>
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 67ce5b130f81..3a1b664fca0e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2902,6 +2902,20 @@ static void alc225_fixup_s3_pop_noise(struct hda_codec *codec,
 	codec->power_save_node = 1;
 }
 
+static void alc225_fixup_hp_aio_spk(struct hda_codec *codec,
+				    const struct hda_fixup *fix, int action)
+{
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	snd_hda_codec_write(codec, 0x1b, 0,
+			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
+	alc_write_coef_idx(codec, 0x10, 0x0220);
+	msleep(75);
+	snd_hda_codec_write(codec, 0x1b, 0,
+			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_UNMUTE);
+}
+
 /* Forcibly assign NID 0x03 to HP/LO while NID 0x02 to SPK for EQ */
 static void alc274_fixup_bind_dacs(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
@@ -5987,12 +6001,8 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
 	[ALC225_FIXUP_HP_AIO_SPK] = {
-		.type = HDA_FIXUP_VERBS,
-		.v.verbs = (const struct hda_verb[]) {
-			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x10 },
-			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0220 },
-			{ }
-		},
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc225_fixup_hp_aio_spk,
 	},
 	[ALC286_FIXUP_ACER_AIO_HEADSET_MIC] = {
 		.type = HDA_FIXUP_VERBS,
@@ -7737,6 +7747,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x854d, "HP EliteBook 840 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B),
+	HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion AiO 24", ALC225_FIXUP_HP_AIO_SPK),
 	HDA_CODEC_QUIRK(0x103c, 0x85ba, "HP Pavilion AiO 24", ALC225_FIXUP_HP_AIO_SPK),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
-- 
2.25.1

