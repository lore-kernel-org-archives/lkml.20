Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53285418A46;
	Thu,  1 Oct 2026 03:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825986; cv=none; b=TNFgS+cTA3328QnDXpo02foEiRdVg3fvdehMB6Y76qeMcnHQbzVvUP9+oeh/yHniL7/GAw2sHr4zcrq7A3Cnv5ttbUO+AqmDtq4UG3bHGlDS0F1pYCs7B+cJRvt4/A6bvO2gfIVnWtaF+MIL4Tbt/3UOtW27dIyFMDF3TpB+R2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825986; c=relaxed/simple;
	bh=alMqR61WSySSHU0R9tOXMDjXKPh/00Egxs2DhJQDTXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ALIf99t18cKTXvb0NTO2tRr5J6zHEAQPiNc2jDbd7sGzJvftbukJD8NzE52R/3oWQL9FoTzqL0BtMXFJkrw+Nt+Y+EhuxHTDlNAVxTZhrvlLLnltGTb6B0xmW+KmT3yVDX89b9n3G5+yUHjpPwMXo2WumUnEPnPBU3lMRMLOCGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b59f2860bd4911f19a56ed5b684f684d-20261001
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1307d609-ff47-421e-bd4b-67ba0fdce688,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:e687056b9bd124ac6dec0af3955273ce,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b59f2860bd4911f19a56ed5b684f684d-20261001
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1514044689; Thu, 01 Oct 2026 11:39:30 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Zhang Heng <zhangheng@kylinos.cn>,
	Harry Nixon <harryanixon@yahoo.com>
Subject: [PATCH] ALSA: hda: Fix speakers on ThinkBook Plus G3 IAP
Date: Thu,  1 Oct 2026 11:39:20 +0800
Message-Id: <20261001033920.111061-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo ThinkBook Plus G3 IAP shares PCI SSID 17aa:3891 with Yoga Pro
7 14AHP9, but has a different codec SSID (0x17aa3875). Use
HDA_CODEC_QUIRK to select ALC287_FIXUP_CS35L41_I2C_2 and add ACPI
_SUB values 17AA3845/17AA3846 to the CS35L41 property table, since
the BIOS provides no _DSD.

Reported-by: Harry Nixon <harryanixon@yahoo.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222053
Tested-by: Harry Nixon <harryanixon@yahoo.com>
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c                   | 4 ++++
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c6ef4fa4ee68..b31d326e5120 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8354,6 +8354,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3871, "Lenovo ThinkBook 16p Gen 3 ARH", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3874, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
+	/* Lenovo ThinkBook Plus G3 IAP shares PCI SSID 17aa:3891 with Lenovo Yoga
+	 * Pro 7 14AHP9; use codec SSID to distinguish them.
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x3875, "ThinkBook Plus G3 IAP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3877, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3878, "Lenovo Legion 7 Slim 16ARHA7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC", ALC287_FIXUP_TAS2781_I2C),
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index 416d7bf3e289..bb30bf786818 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -126,6 +126,8 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10433A60", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "17AA3865", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA3866", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "17AA3845", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "17AA3846", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA386E", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 2, -1, 0, 0, 0 },
 	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "17AA3874", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
@@ -551,6 +553,8 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10433A40", generic_dsd_config },
 	{ "CSC3551", "10433A50", generic_dsd_config },
 	{ "CSC3551", "10433A60", generic_dsd_config },
+	{ "CSC3551", "17AA3845", generic_dsd_config },
+	{ "CSC3551", "17AA3846", generic_dsd_config },
 	{ "CSC3551", "17AA3865", generic_dsd_config },
 	{ "CSC3551", "17AA3866", generic_dsd_config },
 	{ "CSC3551", "17AA386E", generic_dsd_config },
-- 
2.25.1

