Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401815;
	b=16PaNDuXmVXuXgYqUFFcTN69VpxiOnC8J5Gzl6g0H7GQXI/aZAZtM0R8sG4G7d34DjcX
	 gXLXLygrTZyBXReJEDPEfdrBQypy2igahxPmrtq/2mo0CRLGRZmFEKW5IiRz8XeVKK2Dx
	 fehQOfPp8Lok+H+c4ZP1kznMGN+T9pqqb4/wUbKH1i8cd+DxXLtMhp+iFv1dQzyfhUm0H
	 DlpWxOtMHYLY6Uq4Z9vSL7+cv9Mifh9caezra1NcghrOCVOIINey8b76t1zD8oS5/qYTU
	 4g20L16dUZ6zo6CHfWQVlngL4e1FpZl8tu9u/Ecm4G5IOXq3/SW2olhXJmIELF+Gi8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401815;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QghenWRe8YoikTpF5WJJMLeOFUPLribk22unSiYgJVc=;
	b=AenmKeL4lszmfdkOpctURzrieLTW37UBQYuuA2PBe9b8+CRyG1EHe6grq4g3EmQl5byv
	 BYatp1hBeGPUtKvBIiYb+lYZvVVQBv1512fsDVQLNeJZh5nsgYrW6svYd4RZEShvmp0Zf
	 tHSlPQXkl/8I6wTdf07PSes5NJ+I651aBODfY7Q3rcztJMy7C5QXST/t+6+77nWy0gFal
	 Nq+Vyf2t5enxjMCUHrkyYGBNjxUlyekCaJHF8P0Z0EQDG5oUlzFUYZGfzD3skov5fUmlD
	 vCo7kEnxgku+lohe5RcLArSSdc303tk1klvegZ4k4Bvg4LbZKnEWjCHxWDpKYIXHwmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56208606A889;
	Wed, 11 Nov 2026 12:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56208606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5a070b20ddcf11f19a56ed5b684f684d-20261111
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:763a5130-f5ad-402d-9c45-0ed5040085a8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:aee35f457fa98b7502e35177da88dc1c,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5a070b20ddcf11f19a56ed5b684f684d-20261111
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1431694655; Wed, 11 Nov 2026 20:56:46 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	jmoises <moises_gc97@hotmail.com>
Subject: [PATCH 3/4] ALSA: hda/realtek: Add quirk for HP Pavilion 15-cw1xxx
Date: Wed, 11 Nov 2026 20:56:36 +0800
Message-Id: <20261111125637.1046581-3-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261111125637.1046581-1-zhangheng@kylinos.cn>
References: <20261111125637.1046581-1-zhangheng@kylinos.cn>
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

HP Pavilion 15-cw1034la (ALC295, SSID 103c:8615) has silent internal
speakers with the generic fixup.  Add ALC295_FIXUP_HP_CW1XXX to set
COEF 0x0d=0xa023 and chain to ALC295_FIXUP_HP_X360.

Reported-by: jmoises <moises_gc97@hotmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221534
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6d7bc33bd0d5..84b145fa4e4d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4334,6 +4334,7 @@ enum {
 	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
 	ALC295_FIXUP_HP_PAVILION_X360,
+	ALC295_FIXUP_HP_CW1XXX,
 	ALC221_FIXUP_HP_HEADSET_MIC,
 	ALC285_FIXUP_LENOVO_HEADPHONE_NOISE,
 	ALC295_FIXUP_HP_AUTO_MUTE,
@@ -5835,6 +5836,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC295_FIXUP_HP_X360
 	},
+	[ALC295_FIXUP_HP_CW1XXX] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0d },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xa023 },
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC295_FIXUP_HP_X360
+	},
 	[ALC221_FIXUP_HP_HEADSET_MIC] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7724,6 +7735,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8077, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x103c, 0x8158, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x103c, 0x820d, "HP Pavilion 15", ALC295_FIXUP_HP_X360),
+	SND_PCI_QUIRK(0x103c, 0x8615, "HP Pavilion 15-cw1xxx", ALC295_FIXUP_HP_CW1XXX),
 	SND_PCI_QUIRK(0x103c, 0x8256, "HP", ALC221_FIXUP_HP_FRONT_MIC),
 	SND_PCI_QUIRK(0x103c, 0x8259, "HP OMEN 15-ax202nf", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x827e, "HP x360", ALC295_FIXUP_HP_X360),
-- 
2.25.1

