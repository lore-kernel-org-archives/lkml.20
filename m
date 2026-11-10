Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296113;
	b=rMyHaGyJ6KLVjtncf2KEAmZMYQr8eabzjcTvKFKFvuROyqzlckxMGAPNqIN7JhXQ7iRw
	 wu+LU2ve7vA3/QYj2b6D0AmTthNFdChwH4HH8oDuyip2x/0/KaADJAIp15gcQlj2nRdWd
	 +rPa9h4PvHULL5tjBDYxS7jCt2UQxAKjzj/KJNt+moYLIEfKyYwVQ14jvD2RXwfYUXOCh
	 CaYfld0keMQOIYCw25OXD3MMVyEzBVhtrj7QNSiol7RhTElSTgKuTBAvbl828lku9dIKX
	 bkjOOv7QOQbxVGYq6fc6bVPjM4uTZZyCgXsVT2pPrehW8iEuaLHF6Q9b18VxEKYMlaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296113;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=GWxb5M47FUHbNZgaCk7nl7LYD4f5UQwoaQh7lgRpLkc=;
	b=TeMP4hi5z8o6WRDiHV0VALRFxBG7Ssbrme2S5uJ+FUC8UrN0JU+8JQLMm48uf23VV8YW
	 If8HikSGLAOII8YaAlahBDhNJo6nPwvhieXYpFonVsyTSi02wV5Y0r2RfFEge3NxTgr+t
	 Xt+blXU5AjVUZ/udN9dUE/RA8oTeuTLmKzRv0UVQX/I27JGLWAtLJjAxC97zIqJM+2gdg
	 cXWwEKrzmPOOMzvTez6i7igyW1w2QKQJfIhWDHjVrYpyROq5QzxfC8nwXrSa1L4ZIDy0z
	 8SaNdIPzebh7bBbDw8De1LCDe+Y9RkXzpY6SzrMBpg6gtHzDflZgJVda8mUB+2J76Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="Z0/V1+WM";
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BCD606A31C;
	Tue, 10 Nov 2026 07:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BCD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Z0/V1+WM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=GW
	xb5M47FUHbNZgaCk7nl7LYD4f5UQwoaQh7lgRpLkc=; b=Z0/V1+WMCKWwqfLFg7
	myFYupHrzaMUMQhvd3C9q5JGlCyN4XP/+L9m23O9WfmFWcOXnQft2fChhq5mxGN+
	fF2kL1GMSwA+8u+MC5Nxz+meheG6pydxaAlmjygr4z4Pt1VIW/xLoHwOvZF/IFR9
	4J0fxLMDuaHxK05JgyZeN2qL0=
Received: from Spiking.lan (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnj4MayfJqZGpyGg--.65503S2;
	Tue, 10 Nov 2026 15:34:51 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org,
	junan76@163.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: Remove duplicate VIDEO_DEV dependency
Date: Tue, 10 Nov 2026 15:34:43 +0800
Message-ID: <20261110073442.79443-2-junan76@163.com>
X-Mailer: git-send-email 2.43.0
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
X-CM-TRANSID:_____wDnj4MayfJqZGpyGg--.65503S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1rKw1ktF15Jw1UJF43Wrg_yoWxZrX_Ga
	1q9r4xGrW5Aasagr1UXayFvry7K3WkWrn29FZ8tw13XrW2gr4fX3WxXFZrX3W3Ga47Gr9I
	v3yrZFWqkrn5XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiAwI5UUUUU==
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1BvPgWryyRtVMgAA3s

USB_CONFIGFS_F_UVC lists "depends on VIDEO_DEV" twice. Remove the
duplicate dependency without changing the configuration behavior.

Signed-off-by: Ju Nan <junan76@163.com>
---
 drivers/usb/gadget/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 76521555e3c1..c85efae6f3e9 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -469,7 +469,6 @@ config USB_CONFIGFS_F_UVC
 	bool "USB Webcam function"
 	depends on USB_CONFIGFS
 	depends on VIDEO_DEV
-	depends on VIDEO_DEV
 	select VIDEOBUF2_DMA_SG
 	select VIDEOBUF2_VMALLOC
 	select USB_F_UVC
-- 
2.43.0

