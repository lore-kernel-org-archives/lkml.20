Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A07F1EFFA1;
	Fri, 28 Aug 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912240; cv=none; b=g6Ec2SWSaoK5NNzFcZgrzewdNTPO+R1brRYmNW3X8jr2nZGNzQz3bX5j25MTH1ibhxLGHZ+UnBm6gB0XaKAxBgPcHmQXm4Fx4w4nsAUUOloHkjRiwiNMIVKfBQyob2gTuUblDXYhf40NeyDFmdS2MSGB//9TOjAAY8eLgvw8lNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912240; c=relaxed/simple;
	bh=R4DBvfbDbQdUPpXHKYXHcJ9Eyik3Pcly/qxoQGVywnI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pjwHyPk/Cwd1pIkDFo1xSOe9Hoizetu5qdD5yp0C5vVP6pp4jMpOEI84qBefat6NytKKP3YWCer/jlx2WiN8+6g/Pc3StSF6vBmwysDefLmzPrZoXOwFQTzLry+nnRIsHt8IIUnR+0m+HftIBQvvZpX0Q23jjJZBUvleR958mfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a11ed056a2c911f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a70495cb-b4e3-4b2a-a0e2-07bd3a10a830,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:3fb2368d1cd4f6b0058718db5338656a,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a11ed056a2c911f19a56ed5b684f684d-20260828
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1409501854; Fri, 28 Aug 2026 18:17:10 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Slim 9 14ILL10
Date: Fri, 28 Aug 2026 18:17:03 +0800
Message-Id: <20260828101704.354406-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 9 14ILL10 (83CX) uses ALC287 with CS35L56
amplifiers. Without a matching SSID entry the bass speakers stay silent.
Add PCI SSID 17aa:380b (codec SSID 17aa:3905) to apply
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221902
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e4349743a251..ae5464087625 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8100,6 +8100,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x380b, "Lenovo Yoga Slim 9 14ILL10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	/* Yoga Pro 9 16IMH9 and Legion 7 16ITHG6 share PCI SSID 17aa:3811
 	 * with Legion S7 15IMH05; use codec SSID to distinguish them
 	 */
-- 
2.25.1

