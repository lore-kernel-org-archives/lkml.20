Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1E403B0E;
	Fri, 28 Aug 2026 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912242; cv=none; b=HXvYWp2Cz0ShhdeTn/mQjNNCJbDoZ3DaYj56sRC5hIs0bXejnZk79n0mIeENp4zsYL825cqwaRG0h2BagynzOp255BpGlC88ADKfxPn7U8Il+tW+iq6sM3ne+NjI/D6rjNvnLkTA2Qf2oaDNiehHEz1PsD2njdJLKmNrcVl9LAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912242; c=relaxed/simple;
	bh=ZDIMnE+8H/Ri6P/8iy0bqOrYp/4upw9Xg7KTG6WsANk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TA4Ahqk4e1zhXCIToRPxWYEduJcnXW63NuSrddj7oP7mhIfQb+VbnxHrUpb48jUq6YNgweFDMtZFFzvnhkMyhks/w1cMZG5rxvgfXYsCZ/phCiUx2RUGs1YQtFm9gIOxnoBOaiB2fmYhnPzjHRy9J7KyXFMyWZ5JnC1jMQHIO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a2f66b0aa2c911f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:340299ea-cf36-4db4-8ca2-e9d9c975205e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:7944ef5dd98a6f3585f3dfdd08f4ae2b,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a2f66b0aa2c911f19a56ed5b684f684d-20260828
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 992202328; Fri, 28 Aug 2026 18:17:13 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: hda/realtek: Add quirk for Acer Predator PHN16-72
Date: Fri, 28 Aug 2026 18:17:04 +0800
Message-Id: <20260828101704.354406-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828101704.354406-1-zhangheng@kylinos.cn>
References: <20260828101704.354406-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Predator PHN16-72 (subsystem ID 1025:1731) uses a Realtek
ALC245 codec. The PCI SSID and HDA codec SSID are both 0x10251731,
as confirmed in the system's ALSA diagnostic report. Apply
ALC2XX_FIXUP_HEADSET_MIC to enable the headset microphone.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221811
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ae5464087625..039bb4d6f09a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7155,6 +7155,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
+	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1826, "Acer Helios ZPC", ALC287_FIXUP_PREDATOR_SPK_CS35L41_I2C_2),
-- 
2.25.1

