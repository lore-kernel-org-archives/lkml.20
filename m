Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792638684;
	b=lasUbSP2hjR8D7KqnhAfTdK7gpQYvn2uiICzNnAOCZi0XPb464JBR+xoxCi/xFtYQWfh
	 dXqOIzm+CfhDM3/tcTuq690swS8NLLHza/cY3Ntjx/PgMej5LiDfU4uvyL9fGwqvULJlZ
	 fobfpifryPxZukotHB/QmVRvdNuKjdAoY8V2rcmFwHHOJ5fvydWjr9km8qeFNN5svR1E9
	 vpWSAkbTJv91W3zphzA2Ph8376yQ+5NRoqOjgP3x7U1IRIGayawkIgO3VGSnSVeSqkr1b
	 Ec0hw3EiCzx0rnZZdfQHWP8b1IxVtWMC/a10uJUJY1d5foGsnuLerclIA5iqRgsSaCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638684;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L2KEXWf9dTxf3v6sRnOACxd6X53PE7u9I13KYykCahI=;
	b=bqvvHmmN76CoLYZn/9uysQyPv9cFpI1+DVnN5xUtLyw1VmyK8Rcq3TUIIog6+TDbgcYD
	 pj6WAHKXPiZSGpB6qm8YlBm18wK9df4dQukPFfKoPffB/zkPSgxX1iiTk2m1sDPC87bYk
	 UWMxVpMJKIym3Prza/WGzrObEronrlLJtYJslbghbhszaOGZl3IqRjfiFTnUvcm2BdgqD
	 HxJCwJlKXZp6CYuGzNnjTj2HTNuWsSptbc/53z6TpEvGaYczcKLB6rTvWNk0MsoTazQnK
	 gbHUvOWnUF9YB+3J+ZleO9ScrWwWnOfKRrpqZm3tBWeR884vHV94CTYZfdhm9ojTxuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2B1606A31B;
	Thu, 22 Oct 2026 03:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3fee604ecdc611f19a56ed5b684f684d-20261022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:72359a5d-ff3d-4d74-8a5a-831fe4f38778,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:0867394508c846900496e6ed592c2a31,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3fee604ecdc611f19a56ed5b684f684d-20261022
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1950156099; Thu, 22 Oct 2026 11:11:18 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: hda/realtek: Add quirk for HP Pavilion AiO 24 (ALC225)
Date: Thu, 22 Oct 2026 11:11:13 +0800
Message-Id: <20261022031113.163632-1-zhangheng@kylinos.cn>
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

The HP Pavilion AIO 24-xa0xxx (codec SSID 103c:84ee) uses the ALC225
codec. The internal speakers produce no sound without a
machine-specific fixup.

Add a HDA_CODEC_QUIRK for this codec SSID using
ALC225_FIXUP_HP_AIO_SPK so the speaker output works correctly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221616
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8e9462c892e4..95f77f3ce0c1 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8045,6 +8045,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e43, "HP Laptop 15-fd2xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion AiO 24", ALC225_FIXUP_HP_AIO_SPK),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP OmniBook 7 Laptop 16-bh0xxx", ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.25.1

