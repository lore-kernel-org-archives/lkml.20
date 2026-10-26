Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008424;
	b=2+RjvBL5P7eV0eA2rJezaVkgA06l10oHdck37kGOLplnhFerDBfnhc7vuW2Ra5n1qgLl
	 d/p0VJpSoLpUYl92ikWznR2Qojoej5hkWa0+kAi8/VqqXrdGjJJY1P/unAeKMHbakclZu
	 kbokMBqjq0T2Ztk/mkoCzwakKx3CL16yRSwpdAgpSEV8x9pGgjRP1Kr0IZhdr2tRxF2MH
	 +TBBBQgrC2ygOXpZofel/OS9+CFB1+BIXCaUPIvx1E0oUgYLwQO8ruL/z4w7YWaEt6F1o
	 N0t5zXJqFOlNg1bwBU9kEbdfIHF41K18hyCXyYLHNHPaigQXM6WABprAHVzovmyYIzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008424;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-META:X-MBO-RS-ID;
	bh=p+QAo1D0G+UmBfY1i8AV+5f+O+yGbAMBM59vMGJ8zkA=;
	b=qTt4espYqFqwn9T5j36zugja+032mGPxl+4D3Bwm9wX0gQLOQIKL/RmD5JnS6F/qWHIt
	 ynGl/ezediRZYbJfTyVqxQUnSTDdOHegENBculDfVL0TSHvA9YW94vSFUtZzvGJYVSe3l
	 QLVgJbNFEFxrdGxTTrV1fR/ur5MTM4KFrOfJnHZ7q9qdo6QhvcvJX3ZgzVdHkB8pvWP9k
	 kBIedyPd/JpcoaMrRSEOAiH1fyh3MtXJSv1td99i9xFi0mgcvuwEhFow3Fs5B+ljZDVtn
	 3uE1JYh0G7npT5lblPZv4anxzOYJnnImPb2QxR9aNr1O6WXWXvrW8e9iX9f4gmscMXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=AxUNjZpp;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70FF606A31B;
	Mon, 26 Oct 2026 09:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=AxUNjZpp
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jCpq64XtczKp5r;
	Mon, 26 Oct 2026 10:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793008418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p+QAo1D0G+UmBfY1i8AV+5f+O+yGbAMBM59vMGJ8zkA=;
	b=AxUNjZppP7Rtwmc8WVHMdn1/7kSQOx8WM9OZeerOy94jIkmZcOgdgmio4ULdegmOst7BDA
	mLNe668AlP7zVQXSf2hsgFxOx+yRmYcdN297qO4D4vfDsO1KB+RvGa3IRfjoHsbRoD3XEQ
	qSriLLDUlUnAaGG+nczqBsuYTM5rOyL1sT9iyA7fShtxp9C6Yrlvtl+KZTl+hhm30LkD+U
	6ZURAuz3udZB/crx9jT0Jc1hwPv8wGtja0T97M9lEMJYoFPoVBIgdPBeXhxlyiwS5+HGs6
	VAPcPLcy0kewUKLKaFN30wKlPQ/kv+8qmCtAVzGMuWoKQ7G77rUV2/rjZGw0Zw==
From: Gabriele Gamba <gabriele.gamba@mailbox.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gabriele Gamba <gabriele.gamba@mailbox.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: Add DMI quirk for Dell 16 Premium DA16250
Date: Mon, 26 Oct 2026 10:53:26 +0100
Message-ID: <20261026095326.21615-1-gabriele.gamba@mailbox.org>
X-Mailer: git-send-email 2.56.0
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
X-MBO-RS-META: 6jsp6g4y7wtbfigkm9ffsendwu5hdb6w
X-MBO-RS-ID: dc3f7d1378c2089ac80

The Dell 16 Premium ships with at least two different DMI product names.
"XPS 16 (Dell 16 Premium) DA16250" is already handled, but some units
report "Dell 16 Premium DA16250" instead. On those the OV02C10 image is
upside down, as neither SSDB nor _PLD describes the 180 degree sensor
rotation.

Add the second spelling, mirroring what is already done for the 14 inch
model, which is listed both as "XPS 14 (Dell 14 Premium) DA14250" and as
"Dell 14 Premium DA14250".

Tested on a Dell 16 Premium DA16250 (Core Ultra 9 285H, OV02C10 behind an
Intel CVS controller on USBIO).

Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138991
Signed-off-by: Gabriele Gamba <gabriele.gamba@mailbox.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..c7b66cccc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -191,6 +191,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 16 Premium DA16250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
 	 * machine type/model. For example, a DMI_BOARD_NAME starting with
-- 
2.56.0

