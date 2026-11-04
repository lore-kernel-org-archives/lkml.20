Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758919;
	b=iqBqnI0LWYALEWieMAbnkErdtTcXuktK2pI++pz7lQexZeFTb+YsqlCXKwj41H0NkOG3
	 xqyhuwdWD89dW35/PoSrKowUXXWe833UnT5G0c0OPAYoDtOH/XJeIHZVnABcb9sGPQWa0
	 +UacMLoGAzhPJkSnG2bHiLFd6lZxtRl0twcs+NugaP7gCbG7jgbAkjVo7qPx7qgSuQQWX
	 BUetDEFV1CoCcReX5w4cv30R5mOlnzLZGPGCNC+DiH8SsuCzIrlNU53MRrLW4OJ/vkvuJ
	 2x7jBmcMrHNaMcyCD0U6biZfrmwedd2HVcxOMgo2t6lFjmtY/f+eMbKln9z6VrU1KJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758919;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u4yw3l82lo/qw9Xch78qs4CtwiYh979ZqWvUHiECqdA=;
	b=O806GRzwx9DeZ8L14CHsGpCbl2RAiekEu32PMKXKfHvT5RRgWarQ0INabzfL4aIuPHDV
	 r1HQEqcg4OyktLicLPlcHJsNlNMU3YuFbjm1bHhjJ3XoyEO4JsQ9yC/2iNNdbArEFX4xc
	 Wn/d1yBlmkM0liBwgk1sMhrgfYI5KHSud4uGN4jy3Czi36KOJZWQFHWwuNs7AakeneQ+y
	 /0YYDVsdjagJtDfqMpflFvJ8RFJvrUee74flSW1pYCs+6kKMOf4lWmYIEc2yZyIG9hlOI
	 Vl1hYeBvOZXx5FXgyXsKkWgQsOCFi+0ncvP28qTAKkMNACwHa/vI4eCSNMx9IiiryVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CD5606A326;
	Wed,  4 Nov 2026 02:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51CD5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7eb6f7e8d7f611f19a56ed5b684f684d-20261104
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e6526285-5a69-4b83-abb3-10aa8636b0be,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:d7bc93536e094912c4711bd5aaf8c940,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7eb6f7e8d7f611f19a56ed5b684f684d-20261104
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 103575154; Wed, 04 Nov 2026 10:21:51 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: uvcvideo: Fail probe when no video device is registered
Date: Wed,  4 Nov 2026 10:21:46 +0800
Message-Id: <20261104022146.42954-1-chenchangcheng@kylinos.cn>
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

When a UVC device is unbound while userspace still holds the video
device open, the VS interface claims are released only after the last
file descriptor is closed.  Rebinding before that fails to claim the VS
interfaces, leaving the VC interface bound without a usable video
device:

  [ 3229.189556] uvcvideo: Probing generic UVC device 1
  [ 3229.190496] uvcvideo: device 2 interface 1 is already claimed
  ...
  [ 3229.193758] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
  [ 3229.193766] uvcvideo: Found a valid video chain (1 -> 4).
  [ 3229.193771] usb 9-1: No streaming interface found for terminal 4.

Check after registering all video chains that at least one video device
was registered, and fail the probe with -ENODEV otherwise.

Devices with no usable streaming interface at all will now also stay
unbound instead of being bound without any video device.

Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..0943db4eae07 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2156,6 +2156,19 @@ static int uvc_register_terms(struct uvc_device *dev,
 	return 0;
 }
 
+static int uvc_has_video_node(struct uvc_device *dev)
+{
+	struct uvc_streaming *stream;
+
+	list_for_each_entry(stream, &dev->streams, list)
+		if (video_is_registered(&stream->queue.vdev))
+			return 0;
+
+	dev_info(&dev->intf->dev,
+		 "No usable streaming interface found\n");
+	return -ENODEV;
+}
+
 static int uvc_register_chains(struct uvc_device *dev)
 {
 	struct uvc_video_chain *chain;
@@ -2174,7 +2187,7 @@ static int uvc_register_chains(struct uvc_device *dev)
 #endif
 	}
 
-	return 0;
+	return uvc_has_video_node(dev);
 }
 
 /* ------------------------------------------------------------------------

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.25.1

