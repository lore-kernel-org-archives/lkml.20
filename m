Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0D648094E;
	Tue, 13 Oct 2026 06:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872751; cv=none; b=B89jbZY8dwR5Yn6a29+Dk9LURqd0si2uwRZuwVHtav9gN6JLpvl28HCzW17/d8AQlVQoBZozL6tdUbJZjFQO2tJNT7MFWVFsp3PX9gjdqW2aESlQGS46K1ZfpstFWU1LuazFhEXCcuUJ13al8rlmzDZFiMITCHIY9Vh0CmfHEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872751; c=relaxed/simple;
	bh=4nrT+xor9k4eRZJrZ9Ha0t3WRat2Sw8ulbMMX2qTWmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YCjzp3eDY9TPKloFnpkZhvw1uYzhv0ivzaN3KnK9QAvOnxX6z3DaMDFMBa5HFli9Ccx+QV2yzmI1rwkg0siKrPSlEUxQF9QnVi+K255F+zJ7cFllBIgfFrcDCpoVb3LAaSxgMy6tpNKVNGVy+ldQ5AUXMyZ3tZxsCQegv39jHbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e6dd2c9ac6ce11f19a56ed5b684f684d-20261013
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d3cda99f-74d9-4ee0-b6bb-d5e3e623dd82,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:fb9ed92c2aa6fcd7a936912daed7cb70,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e6dd2c9ac6ce11f19a56ed5b684f684d-20261013
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 126780716; Tue, 13 Oct 2026 14:25:36 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Johan den Hollander <johan.den.hollander@finalist.nl>
Subject: [PATCH] ALSA: hda/realtek: Add GPIO2 low quirk for ASUS E5402WHA
Date: Tue, 13 Oct 2026 14:25:32 +0800
Message-Id: <20261013062532.216712-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal speaker amplifier on the ASUS ExpertCenter AIO E5402WHA
(ALC256, SSID 1043:3500) is enabled via GPIO2 and is active-low.
Driving GPIO2 high, as ALC256_FIXUP_ASUS_AIO_GPIO2 does on the ZN270IE,
keeps the speakers muted. Add a dedicated fixup that drives GPIO2 low
so the internal speakers work.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221938
Tested-by: Johan den Hollander <johan.den.hollander@finalist.nl>
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 9eeb3a66b2b9..7021a573bd49 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2809,6 +2809,19 @@ static void alc275_fixup_gpio4_off(struct hda_codec *codec,
 	}
 }
 
+static void alc256_fixup_asus_aio_gpio2_low(struct hda_codec *codec,
+					    const struct hda_fixup *fix,
+					    int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->gpio_mask |= 0x04;
+		spec->gpio_dir |= 0x04;
+		spec->gpio_data &= ~0x04;
+	}
+}
+
 /* Quirk for Thinkpad X1 7th and 8th Gen
  * The following fixed routing needed
  * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
@@ -4250,6 +4263,7 @@ enum {
 	ALC256_FIXUP_ASUS_HEADSET_MODE,
 	ALC256_FIXUP_ASUS_MIC,
 	ALC256_FIXUP_ASUS_AIO_GPIO2,
+	ALC256_FIXUP_ASUS_AIO_GPIO2_LOW,
 	ALC233_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE,
 	ALC233_FIXUP_LENOVO_MULTI_CODECS,
@@ -5584,6 +5598,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		/* Set up GPIO2 for the speaker amp */
 		.v.func = alc_fixup_gpio4,
 	},
+	[ALC256_FIXUP_ASUS_AIO_GPIO2_LOW] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_asus_aio_gpio2_low,
+	},
 	[ALC233_FIXUP_ASUS_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -8124,6 +8142,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x31e1, "ASUS B5605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x31f1, "ASUS B3605CCA", ALC294_FIXUP_ASUS_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x3391, "ASUS PM3606CKA", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x3500, "ASUS E5402WHA", ALC256_FIXUP_ASUS_AIO_GPIO2_LOW),
 	SND_PCI_QUIRK(0x1043, 0x3501, "ASUS PM3606CHA", ALC256_FIXUP_ASUS_SPEAKER_COEFS),
 	SND_PCI_QUIRK(0x1043, 0x3601, "ASUS PM5406CGA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x3611, "ASUS PM5606CGA", ALC287_FIXUP_CS35L41_I2C_2),
@@ -8786,6 +8805,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC256_FIXUP_ASUS_HEADSET_MODE, .name = "alc256-asus-headset"},
 	{.id = ALC256_FIXUP_ASUS_MIC, .name = "alc256-asus-mic"},
 	{.id = ALC256_FIXUP_ASUS_AIO_GPIO2, .name = "alc256-asus-aio"},
+	{.id = ALC256_FIXUP_ASUS_AIO_GPIO2_LOW, .name = "alc256-asus-aio-low"},
 	{.id = ALC233_FIXUP_ASUS_MIC_NO_PRESENCE, .name = "alc233-asus"},
 	{.id = ALC233_FIXUP_EAPD_COEF_AND_MIC_NO_PRESENCE, .name = "alc233-eapd"},
 	{.id = ALC294_FIXUP_LENOVO_MIC_LOCATION, .name = "alc294-lenovo-mic"},
-- 
2.25.1

