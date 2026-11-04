Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786680;
	b=iZsGRnfCa6D+j5G2Yrs6w0YIVfIy8FEJhTyzARGgKRL90WeErnlzugLxIc4UEeQ5YYuz
	 NNvG0EEqZ9BcDdPrIalZJ4JqpjKc+7FInv3+AeWv5ojXf1qdlUBa0vIyEplqFCsjuA0Bb
	 f7/uWbEgnUO0+dgDgcOEhd5fDu+JM0JebDyIVy51JrgxDILIyQttttEuhemjqspgg2YG4
	 10IAI1CRywYM+PO3+x8DzH8JPj5D+BIrIVirJkmUFfqLyX3fHeLYhHxv60oprg7zxc1Wy
	 WOfs3KDhyTSCLX8nUbyKJDWpIF5JvxP9UHjNa372UK59JCFlZ6vpxg4JqK5PNjB8TfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786680;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b1kJbjugtCI2tdDX+PeAHGUJgkL7Hpgvlc17xsgxm/0=;
	b=wIRS60cnWcnEqUrSavtv7gSrwrX7BRquObXm4/lQ1KN22sYwEt1OqFoJGdfvAAWHpskQ
	 FSBYHBhlSe9vVIRcFWDZds9qmhairXmvwGyklO6Yusu+y7UGIWBHUB7DuTsUaVWbs1L/z
	 wma1iNspO4Fcy8IXuP1Jf2qNIoJtdfArx5jgqMhAr569+P7zgSoFqAxMdJKzAzddWDL1n
	 1eblcFe/6KefTHkbQrvusbU2NvycKI7t7P+fH1vawzQyD9/EuYTrHfEF+FVQlLVd3Rq+R
	 81gQcHJxb8DsZycxWRjuZyUOf03laHGdXz516VS3V2XUhjWVu/fzJGLt3VMniNdocHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D34606A33A;
	Wed,  4 Nov 2026 10:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D34606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 22166474d83711f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:6eb34be4-5c63-4660-99f5-b20e70ec61d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:051f01420265957e148ccc015961859e,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 22166474d83711f19a56ed5b684f684d-20261104
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1850861909; Wed, 04 Nov 2026 18:04:33 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/3] ALSA: hda/realtek: Fix DAC binding for Legion Pro 7 16ARX8H variant
Date: Wed,  4 Nov 2026 18:04:26 +0800
Message-Id: <20261104100427.474270-2-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261104100427.474270-1-zhangheng@kylinos.cn>
References: <20261104100427.474270-1-zhangheng@kylinos.cn>
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

Similar to SSID 17aa:38a7, the Lenovo Legion Pro 7 16ARX8H variant
(SSID 17aa:38a8) also lacks the 0x14 speaker node. The generic
ALC287_FIXUP_TAS2781_I2C quirk assumes the presence of 0x14 and
will result in incorrect DAC bindings on this machine.

Link: https://lore.kernel.org/all/CAGPQRHYXcbWTiKpCANEQ1mq9aUHM=v82T231fw7Ld=C-NM4+Bw@mail.gmail.com/
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f9dc1e1f3b38..62760d98e050 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8576,7 +8576,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1),
 	HDA_CODEC_QUIRK(0x17aa, 0x38a7, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C_DAC), /* this must match before PCI SSID 17aa:386f below */
-	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
+	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C_DAC), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3871, "Lenovo ThinkBook 16p Gen 3 ARH", ALC287_FIXUP_YOGA7_14ARB7_I2C),
-- 
2.25.1

