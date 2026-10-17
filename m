Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B037E5FD;
	Sat, 17 Oct 2026 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230862; cv=none; b=aw2KyeFLuhEkbanvaXpzkzPFAxqMYyXsvvmIreHX+2Dr/Ze7mX0NKIOkNv7SURAi22GzfyvRWfIywpc2E34AzdqQHRwXWRD/HkRgeyLoDPHZl94P6PtXN2dd9N6xZnTJ7u5AComzmNTlLGqelNTXMCFgsNEiPtrfePMRow8SPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230862; c=relaxed/simple;
	bh=76QeqOoMAAd0s9XHiYjJMhSGtbQe8gXlJfjVPD9XCyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u6re66sUFyB2Us+RHveKnrD/khA3NI3yijX+bw/f00J/a+HZqyiA+J7ian0UlJ1n/9Cyd8E5CKH0ORyFknctGE9LZ8UmUQMehFckjdwsIl3MSAAuq05TRq/1UWM5zEia55sc5XQD8wqu8j3X0pdrMnjiq1b1bXKac7VSD0Bxmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: afb0932aca1011f19a56ed5b684f684d-20261017
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:202466e4-2437-4de4-b95d-530c7b0c2af7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:4f22bca85d393a1bc88c3da7ecbedee2,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: afb0932aca1011f19a56ed5b684f684d-20261017
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 370596; Sat, 17 Oct 2026 17:54:04 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel.flying902@passmail.net,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Add fixup for Huawei MateBook X Pro 2019 (MACHR-WX9)
Date: Sat, 17 Oct 2026 17:54:00 +0800
Message-Id: <20261017095400.350164-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MACHR-WX9 (ALC256, PCI SSID 19e5:3e13) the BIOS pin table
disables the main speaker pair (pin 0x14), so only the tweeters on
0x1b play.  Reusing the MACH_WX9 (19e5:3204) pin table restores all
four speakers.

Pin 0x19 (headset mic) has broken presence detect on this board: it
reports "plugged" even with the jack empty, so auto-mic routes capture
to the empty jack and the internal mic goes silent.  Setting NO_PRESENCE
on 0x19 (0x04a11140) suppresses the false reading.  Chaining to
ALC269_FIXUP_HEADSET_MODE then infers headset-mic presence from the
headphone jack (pin 0x21), whose detection works correctly.

Add ALC256_FIXUP_HUAWEI_MACHR_WX9_PINS with the MACH_WX9 pin table,
chained to ALC269_FIXUP_HEADSET_MODE, registered for PCI SSID 19e5:3e13.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222126
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 799a5a7a8ed0..2c8288b9024e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4280,6 +4280,7 @@ enum {
 	ALC255_FIXUP_DUMMY_LINEOUT_VERB,
 	ALC255_FIXUP_DELL_HEADSET_MIC,
 	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
+	ALC256_FIXUP_HUAWEI_MACHR_WX9_PINS,
 	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
 	ALC295_FIXUP_HP_PAVILION_X360,
@@ -4991,6 +4992,24 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC255_FIXUP_MIC_MUTE_LED
 	},
+	[ALC256_FIXUP_HUAWEI_MACHR_WX9_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{0x12, 0x90a60130},
+			{0x13, 0x40000000},
+			{0x14, 0x90170110},
+			{0x18, 0x411111f0},
+			{0x19, 0x04a11140}, /* use as headset mic, without its own jack detect */
+			{0x1a, 0x411111f0},
+			{0x1b, 0x90170112},
+			{0x1d, 0x40759a05},
+			{0x1e, 0x411111f0},
+			{0x21, 0x04211020},
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE
+	},
 	[ALC298_FIXUP_HUAWEI_MBX_STEREO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_huawei_mbx_stereo,
@@ -8580,6 +8599,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x19e5, 0x3212, "Huawei KLV-WX9 ", ALC256_FIXUP_ACER_HEADSET_MIC),
+	SND_PCI_QUIRK(0x19e5, 0x3e13, "Huawei MACHR-WX9", ALC256_FIXUP_HUAWEI_MACHR_WX9_PINS),
 	SND_PCI_QUIRK(0x1a58, 0x2023, "Razer Blade 16 (2025)",
 		      ALC298_FIXUP_RAZER_BLADE16_2025_PINS),
 	SND_PCI_QUIRK(0x1a58, 0x300e, "Razer Blade 16 (2025)",
-- 
2.25.1

