Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401813;
	b=lhYYPPfFLTePSwFfdFJGJ2Gleypq1nJ0GD1fDB9hLCeLhp6PimZBebay8+8YIAJyezdU
	 5DuiTcrUMFWoKCrsCE8lsDsi9VZhR/ZjsizYP8vgaUDrDrKGxWwUKLVjb9DIB1IPaPf0s
	 aqH8CnlaKl6EDWrDpwJ540QNN1Dli34YlBHiE0S6fEr9WWkozQlMqQvlqe+tJTMtbctYV
	 HqBhvGjlPQZDVrOYMSa/RUm64DVeJFf7O6OenSu0TsF1DIqDZI/1HH9CwZmCi6SxpU2A3
	 9NcPoqeaQTR8Nl4RYtmnIEVoLq3hG279HZrDMi8CDJjS9S19xXyu8Mbx5lLdDqovQkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401813;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GRqsW99z045zrNzeax8TqDqEq+YnJyvJPh8H3rmOg+E=;
	b=Fx8P8BM0emPrw6Dng3u95ke9F+VO0ehsXj5/Ghr9Jmv+nXpJ8sU92+2wW0Zphx91C5yS
	 mV24yqdR67gob2UUaF0q2ejBjx/6Yrm6uw2rKUtTI54g+U/cHF6hzL+NHTVuLoPpsDZiJ
	 sAQmfDksdYUiEgPdceJ02952r5iTczDfBJ6uuvmlsW0wKPOwCZABOfZLpMJWxpOebQ7y8
	 aZRmUQFMVgpwKa3ceVdX2ObARmmMQvPjLld/wP84yc5PxCDviCFdJFdecFuAESht1zTPA
	 Ki0uuJB0RxGj+6Ajgt4WaxdEcu+5PXQL14/7Qkuj79D8xkZ2AtxOXKCLnEZcZX+gkqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9AF606A327;
	Wed, 11 Nov 2026 12:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9AF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 58f566beddcf11f19a56ed5b684f684d-20261111
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d37deed2-367c-4297-b4d8-91c5653ff9e0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:285355e5227d1e34a2e6f7b01005e2fa,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 58f566beddcf11f19a56ed5b684f684d-20261111
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 798016759; Wed, 11 Nov 2026 20:56:44 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH 2/4] ALSA: hda/realtek: Add quirk for THUNDEROBOT Gravity16G2Pro
Date: Wed, 11 Nov 2026 20:56:35 +0800
Message-Id: <20261111125637.1046581-2-zhangheng@kylinos.cn>
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

After S3 resume the ALC256 on this model has COEF 0x10 bit 9 set
(0x0220 instead of 0x0020) and the internal speaker stays silent.
Reuse ALC256_FIXUP_XIAOMI_PRO15_RESUME, which clears that bit on
every init, including resume.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222028
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a756e0076021..6d7bc33bd0d5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8367,6 +8367,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x152d, 0x1262, "Huawei NBLB-WAX9N", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x152d, 0x1577, "THUNDEROBOT Gravity16G2Pro", ALC256_FIXUP_XIAOMI_PRO15_RESUME),
 	SND_PCI_QUIRK(0x1558, 0x0353, "Clevo V35[05]SN[CDE]Q", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1323, "Clevo N130ZU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x1325, "Clevo N15[01][CW]U", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.25.1

