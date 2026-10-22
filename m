Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792638003;
	b=H1IO5UEsI/9yTdK2oTK7lkSEFdGFwFiqsAsNOl76aswu7Z28uyaSoFpRc00YklNtRJlw
	 t9vz8N56nr3KVKZOgvmxtMgtxN0WSeH0Zu3q40XYVPUOL9AmnZtrSKeREAbVnknjhpEef
	 wRY6nW7cIkPcIvdLIwXcbMe6jROok+bmBAP+scO8Buy66+GnfJHuh7agh/2oetd2knEZN
	 VYSIFWbqQIF2DTTgYf3G+gv3d2EvfE7hq1GWAus8nTQfMpRBEagcIwklb/uan8b6zgpdz
	 I9hM3usWrBYO8gbCUW6rI0BUJgHV3if0hF2q5m2gUbhl0joXVFFho1TSnpOyU9VpvDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638003;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sYTQ0B2kZ+u6n9Xr8z61crihLC6vx4wlR9gGGIaPq3g=;
	b=TbJmaTEOblBj8pOrnj6ctXzUoziAJSnXhg13G7vie+zPxsZer47v+URkQQOsUXNQfeTD
	 Cu0ZfNhnUPKdtv1f4jXkt7gviayx3/SFJZU9It/6uLBKN9JJCQDjcQxsZcgQZK9E1EhgO
	 bmVUtpNX4FlvUaKbC1BLM4PIfPB+tvJpG2ugABZabDdE0wtBvBn6TWr9bV/U2DSOnnroz
	 r2NcUyJVypGNy/rPFVwZaxLI3ntukeGZ9hBxOjpaE40TzueBUIaa0FngYeJGTrnXlLQSo
	 b7rq0EIjlUtbwdrYcPsFOjPdf/p/20MyVM663Sj8PGoITrdVboGXpq9Yom+abTCTsQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E9606A326;
	Thu, 22 Oct 2026 03:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a83a57d6cdc411f19a56ed5b684f684d-20261022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ce0084d7-81e0-4d16-a686-17a405275625,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:343b493e42618b17b55a8e5bf160cecc,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a83a57d6cdc411f19a56ed5b684f684d-20261022
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1794643430; Thu, 22 Oct 2026 10:59:54 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: hda/realtek: Fix internal mic on ASUS VivoBook X509JB
Date: Thu, 22 Oct 2026 10:59:49 +0800
Message-Id: <20261022025950.150390-1-zhangheng@kylinos.cn>
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

On the ASUS VivoBook X509JB (SSID 1043:1ec1) with ALC256, the BIOS
marks pin 0x13 as not connected and pin 0x1b as the internal mic, but
the generic parser still defaults Capture Source to 0x13, which
records only white noise. Manually selecting 0x1b works, but
PipeWire/WirePlumber resets it on every stream open.

Reuse ALC2XX_FIXUP_HEADSET_MIC for this SSID. It limits capture
sources to 0x19 and 0x1b, removing the bogus 0x13 source so the
internal mic records normally without manual mixer changes.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222152
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f2ef2b265489..8e9462c892e4 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8211,6 +8211,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1e93, "ASUS ExpertBook B9403CVAR", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1eb3, "ASUS Ally RC72LA", ALC287_FIXUP_ASUS_ALLY_X),
+	SND_PCI_QUIRK(0x1043, 0x1ec1, "ASUS X509JB", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1ed3, "ASUS HN7306W", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC285_FIXUP_ASUS_I2C_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1c52, "ASUS Zephyrus G15 2022", ALC289_FIXUP_ASUS_GA401),
-- 
2.25.1

