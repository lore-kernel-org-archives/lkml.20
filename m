Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092167;
	b=WEDn1Huj3455mSa096LDSkvGDJ8WrVL/EpDSoyTm7Yc5LMUrVBx+SZTblcAk4DZnpcRw
	 Wf34sgQsB0R1JvDwAEXlPwbcWWGQkJuWEz+GGKpTv2SQEoQFz+OAELKmvIi+20pGEY7fT
	 h0KQ85+dDZ77TZd47uCtJ7uN1WF2FU6apknzcLdnmATHafbHM6aIv8Y9hUJHJwbxmlELQ
	 T91c89HnQWqe5n97LhQzYTFMx4ne8vT+71EmTMB+u7wQt68tnbvh6+6V8qnG7rAxClzh5
	 +fq5QUKLDRfE/TbMw8AfmUe6EfVmE1JoWL4kzFob3Ce+6SsbnE+ABBYccJRvEHunZSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092167;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AIk2sBpIae5R/cCZtioGN9RUgpuSqYR7dSVIP8rFOP8=;
	b=VBgglhqWjjwJbKWhtFKGvaMPdcInJHTFSiQgGUxwippbxKMCq007C3xwAzdOmYxqtuFo
	 xs2pcTs3Pnpyto5QSHYKA7vZ0VJgOTwLJMYhasloOVdPjymQ7iGOO7rmvviLUg7nX1kiC
	 cytNupxNYsBlK3VfvfgOnHQUO4QicihZuIuDhpXy7MqKYLOZax/erR35lcRt+HsC5basa
	 w76HcWe6d/I2liaPo/ICngl4/Nh1tYQiKucA2nLUIHOxQrkXi0iZFzXXPz77vA4AKoAZn
	 gvdbOZDgD58QiAZRczApoM5JNZrkhije77LgR67f1z4CvDbAcV1H6relx03JoNenBPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A29606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A29606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1746a65ad1e611f19a56ed5b684f684d-20261027
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7f273f4d-e636-4915-a29d-7fa3e3422569,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:2fd54f3372cae43b81d98d84bea134ee,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1746a65ad1e611f19a56ed5b684f684d-20261027
X-User: renpanpan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <renpanpan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 370526470; Tue, 27 Oct 2026 17:09:18 +0800
From: Panpan Ren <renpanpan@kylinos.cn>
To: takashi.iwai@suse.de,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	renpanpan <renpanpan@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Fix card name for CVT Touch Device (1ff7:0f33)
Date: Tue, 27 Oct 2026 17:09:13 +0800
Message-Id: <20261027090913.37647-1-renpanpan@kylinos.cn>
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

From: renpanpan <renpanpan@kylinos.cn>

The CVT Touch Device (1ff7:0f33) is a USB composite device (HID + UAC
audio). Its iProduct string "Touch Device" is generic and does not
identify the audio function. Windows names the audio function
"MAXHUB Speaker" from the UAC OUTPUT_TERMINAL iTerminal descriptor.

Add a quirk entry to override the card shortname to "MAXHUB Speaker"
with QUIRK_NO_INTERFACE to preserve normal stream and mixer creation.

Signed-off-by: renpanpan <renpanpan@kylinos.cn>
---
 sound/usb/quirks-table.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index dd02c6294edf..9a1dbbb1d1f2 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -4133,6 +4133,27 @@ QUIRK_RME_DIGIFACE(0x3fa0),
 	}
 },
 
+/*
+ * CVT Touch Device (1ff7:0f33) is a USB composite device with HID + UAC
+ * audio interfaces. The device iProduct is "Touch Device" but Windows
+ * displays the audio function as "MAXHUB Speaker" (from iTerminal).
+ * Override the card shortname to match the Windows display name, while
+ * keeping normal stream/mixer creation (ifnum = QUIRK_NO_INTERFACE).
+ */
+{
+	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
+		       USB_DEVICE_ID_MATCH_INT_CLASS |
+		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
+	.idVendor = 0x1ff7,
+	.idProduct = 0x0f33,
+	.bInterfaceClass = USB_CLASS_AUDIO,
+	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.product_name = "MAXHUB Speaker",
+		.ifnum = QUIRK_NO_INTERFACE,
+	}
+},
+
 #undef QUIRK_AF16RIG_CLOCK
 #undef QUIRK_AF16RIG
 
-- 
2.43.0

