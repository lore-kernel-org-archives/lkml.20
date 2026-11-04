Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786679;
	b=cMz07L4HLcDIaWL1LWNdHpPZGVqDVDI6G/u4dCmX+1JDnRubyrizzVwICfTZgjwVzngG
	 FocHhASfY3T32K5uiC9LCbmRU8T7HHRI18snLBPyQMoypF7TSFgWvXhqH+g00UdUa5m7/
	 kSijCJjDoebgNnKdwuIjEMjFU5UFP13gq2MvmoNu59dZOjja91IggOatHJO9PPTDky2rE
	 elRimtMQIgQexDI6RvFeKN8mfbXB6h/wt5zjIdP/ooWGzE9GX0HZ9SuICoS3cGRkw55y9
	 EvGCUxOOnDdvlVk2rkXy2kVzU4xOG/+zWjwDRtu2fUqJhCyM8fTfjVZoCfzdfX7bY5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786679;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=18obkIBGxRKQaDIlKwuM6XLr2ZHQeLl+8blcQByUT5Y=;
	b=vlFfFVErsBSOqP6MGPiS5dfBm15T6NSe7Oh9gLFZA8dOhJy408Obq/fHfMFbWbfvzEZ7
	 fCXDWt/2s7NAgRpSzScFqTq+BQb6QO2CXnrLg4x9P5TQE/j3ylMKWvJTJtuVe6M2am5kg
	 zT8w8B5bHg44Dw1A3/HgeNa60K10tRb0mFFqAK8VW75uVb7IPiRzjcjmRFO+0GLdxy3gj
	 rweVlmCQspPT/rjSZgHMkN5WPiD/cNU8eJcbHUHLmCl/lQ8HDZOfBYxIoQDR9fHRuiZOa
	 OhrZnv0jzdJvXT8EHi5ZiDQruV5RDUojjeHrpEQVwWXzqqHcjbsikaS7v0VwX0PykCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746EB606D805;
	Wed,  4 Nov 2026 10:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746EB606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 21334d42d83711f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d7a26fed-d8c0-43ca-8a6c-048ab403531b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:61b84d929123e1cc990de7105a4b89c0,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,I
	P:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 21334d42d83711f19a56ed5b684f684d-20261104
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1826338401; Wed, 04 Nov 2026 18:04:31 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Roman Maidanovych via B4 Relay <devnull+devuarpd.gmail.com@kernel.org>
Subject: [PATCH 1/3] ALSA: hda/realtek: Fix DAC binding for Lenovo Legion Pro 7 16ARX8H
Date: Wed,  4 Nov 2026 18:04:25 +0800
Message-Id: <20261104100427.474270-1-zhangheng@kylinos.cn>
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

The Lenovo Legion Pro 7 16ARX8H (SSID 17aa:38a7) uses the TAS2781
I2C DAC. The generic ALC287_FIXUP_TAS2781_I2C quirk assumes two
speakers (0x14 and 0x17). It forcibly binds 0x14 to DAC 0x02, and
binds 0x17 and 0x21 to DAC 0x03.

However, this machine only has 0x17 as the speaker and lacks 0x14,
which leads to incorrect DAC binding. To fix this, chain the
alc295_fixup_asus_dacs() fixup before the generic quirk to ensure
the correct DAC routing for this hardware layout.

Tested-by: Roman Maidanovych via B4 Relay <devnull+devuarpd.gmail.com@kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221735
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a75204d32865..f9dc1e1f3b38 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4553,6 +4553,7 @@ enum {
 	ALC256_FIXUP_IPASON_SMARTBOOK_S1,
 	ALC256_FIXUP_ASUS_SPEAKER_COEFS,
 	ALC245_FIXUP_MINISFORUM_V3_MIC_NO_PRESENCE,
+	ALC287_FIXUP_TAS2781_I2C_DAC,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7061,6 +7062,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC287_FIXUP_TAS2781_I2C_DAC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc295_fixup_asus_dacs,
+		.chained_before = true,
+		.chain_id = ALC287_FIXUP_TAS2781_I2C,
+	},
 	[ALC287_FIXUP_ASUS_ALLY_X] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -8568,7 +8575,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x386a, "Lenovo Yoga 7 16IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1),
-	HDA_CODEC_QUIRK(0x17aa, 0x38a7, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
+	HDA_CODEC_QUIRK(0x17aa, 0x38a7, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C_DAC), /* this must match before PCI SSID 17aa:386f below */
 	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
-- 
2.25.1

