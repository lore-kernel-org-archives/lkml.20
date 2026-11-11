Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401817;
	b=YQ2qSVpBXN82jeJ+xf/RBK+Vfk5tqskvJVvQqxocFjf1tKld9dJxNXg5rQ/mTHoiutOS
	 sSXY5LPVI7Qf+wD6mMgN2wP6/hPacm+di3WdfAZcHnVyV8BYXvcXwFf5Z0jnhitTqx0qA
	 z0yjv4+LNOlwRJ8UkOeNU52EXsCL1+rfA15uqURe8uDJepeNvzDzwv8fLkC0cjwAaT7JY
	 tz/sUEv5EmhjLldBPDAsXM733P+1ExUSFdDGwG9vtPio0Wd+5CXR/2Our/DfReINC2af3
	 /y3UXwiBZo6nilMDh2PUWqikGrauTbCvxFSBKpWrEvUr4EsRzBo6Rg+xHis6jhk5mxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401817;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XyDFcsnLR34RA4cS28Nwkdgh1xBYvPbwLupe1p5matM=;
	b=PRadmcC8Dd1kU9ApiHktQAAWMyG1gEr2DtNV4y21+j0WCyFQSjypfZarLUzRJVfK1iat
	 iGLlMxoP7LRNXWMS2k3bDlKDcpxq3zqIh9ZnnkbIzpReN3nfrXUL1gMgGXteXndpwRL3T
	 pTHkEt77eKUFOhZAR2F6P1rV7b1AaRLrqAUCRzmx5AyDPJB09c8ldJ/CrTUrUpi8eshh+
	 ZrKcD79yDQIt4cyL3YkavmNg9H1jmJBoK0NDyxLMQjri8KOJ++XLDfTMnvgoCsJxeB6CL
	 4Et8Dr+snDHsittQHR2641gqP6N1cmXFl9I1MZFK5KFw4NPKhExrga9E8S/yofdUvVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3C606A8A0;
	Wed, 11 Nov 2026 12:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C3C606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5b45e5e2ddcf11f19a56ed5b684f684d-20261111
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:791f4f14-93b3-4dda-8df7-68014c5635d9,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:22bc4adc11a4e375b3409425ed8a9a17,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5b45e5e2ddcf11f19a56ed5b684f684d-20261111
X-User: zhangheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 328171626; Wed, 11 Nov 2026 20:56:48 +0800
From: Zhang Heng <zhangheng@kylinos.cn>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>,
	Brett <brettwstevens69@gmail.com>
Subject: [PATCH 4/4] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP9
Date: Wed, 11 Nov 2026 20:56:37 +0800
Message-Id: <20261111125637.1046581-4-zhangheng@kylinos.cn>
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

Lenovo Yoga Pro 7 14ASP9 (ALC287, codec SSID 17aa:3903) has a silent
bass speaker.  Its PCI SSID 17aa:38a7 is shared with Y780P AMD YG dual,
so it matches ALC287_FIXUP_TAS2781_I2C instead of the bass-speaker
fixup. Match on codec SSID to apply
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN.

Reported-by: Brett <brettwstevens69@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222007
Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 84b145fa4e4d..e7a49801d05e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8611,6 +8611,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3891, "Lenovo Yoga Pro 7 14AHP9", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38a5, "Y580P AMD dual", ALC287_FIXUP_TAS2781_I2C),
+	/* Yoga Pro 7 14ASP9 shares PCI SSID 17aa:38a7 with Y780P; match on codec SSID */
+	HDA_CODEC_QUIRK(0x17aa, 0x3903, "Lenovo Yoga Pro 7 14ASP9", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
-- 
2.25.1

