Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409346;
	b=YzD3bVLzWdrukDn+KptUMrGarT1TMkisasr4B1mI+/35/iN7ZRWQX/UZMKxFDCJwlg8N
	 erlt/ZRd9hmnz/+Pn8RdbDfK9f6Z9gFjUXQhai/R9mrJL2ZJSfFKmLtbZtE7Hfx08EwLW
	 ffFqWIKLPJC8xkLqN5J1R4loasUXjwx46g75CSMzP4E9X1YEoxxcQHJQaKPAmbLHgqycR
	 RZAghJjQK25/O4a3y2bLVoRsaCHgGQZd8F3CFhYFhuJ+TB8k1g1aTCpf/iYvqf51n984q
	 vCqZsZn0p0C9+p9IcH59mw0uFTMWgNu/2GAaMMGw8mrBOuITAC8ZPjlZ/qHHVue+IDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=meWNXvMASPE39vwE27i8e5aNRxxg/xlneQl/BaplwNw=;
	b=TbP/zmCohnf6poWi8FboFdT0cWjoKCJq2ea5qpDTfxy1ISK9zyj3Fy00iPi3oQ7e98PM
	 ZehDpdOXe0Vc2ochEDYq1ETD1L0ocI74en74352gyQh3l/lbtGZTwE5WPGoQUXll9oC+9
	 cboDg0pEvcZ9+OtWyOJ2PZrzWsFTRDSlUK7XZ+ySclVZi72mhF38ZyP5BwlRgjLA/JW7n
	 t8XUPO0JrOOwL/7Rscsc8HUKNh0mnT4Xz+MiVHC8goXCpCT7/AoQxMfSg/QAnDu/NUNjX
	 lYL5swL5k7TwA722KP8o/eG0S+SE+ofCwqN6xjhSTL/jDeLAsItMMB1+8/YmXExtuog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ5VFpay;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3558E606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3558E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ5VFpay
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-497614c95f0so1796960f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409344; x=1795014144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=meWNXvMASPE39vwE27i8e5aNRxxg/xlneQl/BaplwNw=;
        b=UQ5VFpayE9CxUcVJjLg9m8k3212rMrE3w2g8bTETRaeTZGmJwXdK/iPr6idLYFo5lF
         fIVqcP5zR+wj6RG1R726OpDUDz2py52q1cKoTj2a0Sr7EbFzHZUs6xfArCzJjf6pn+Ip
         /mFujscxx4Nxo3a3LfKIGdEsEZ5rFc3l72gFAMxauhLiZoKPl+jILGzYojynnifJU2qa
         rELSdlHKFkyEh1sOk7MZo8oARRRaKEIdLQJ5yj5zWbmmwuYTQaT6jwq4/HVyfjBWaK+L
         Eb55SxwSHYC3x8LdvJ/FPQOxS3nV6QdwlXKxo5x7WFlAtNhYYrGRzAEwRkaCrn0tXU9w
         TwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409344; x=1795014144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meWNXvMASPE39vwE27i8e5aNRxxg/xlneQl/BaplwNw=;
        b=k4+eNlPPbAGXsFZXGwOTofomoivVXSlPqd64irKaQ0UG0BSJVoCRDmVYO0dTNybTXf
         81IULUwCBBYHgfzEV52t11hN8lC2eXz16zhPhVDNRGHAqKOxLMsvs1rFTQunZjw6odGs
         HrWQoKml1N24ydAILaUTDn0v8HdUxBxdlvmUN9dhcaiZSeocWH+clWjcY8dq09ZrghPU
         VDqbleoIrOw/h7eA60ZvA5ceev7FLC+3irYuikwyo9ltwm1Kcap3bVMhxB++eYHps1JX
         F2Uw3XF3FKEPs0EAP/EVYmQzn0tD2sIaHvUxMOiXhA3RG61AF76fuZYbqZf0usjXBFPP
         St/A==
X-Forwarded-Encrypted: i=1; AL+hErFS+0nafXRgp5nti1/OJP/gEkwT1e+Lpx9csO4T1NLuNEvTuIeHNipJjtTnFSALW8ZcYKgkb4gVYF0y5jI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZAX0TQFSc+ZEUC19sfZHCstHE8RdX3WyIOVc3fnuCto7pAhmk
	kq34yc91s8ytGRnL2rsulgJY400yw8mJ/YkRGSe2OrV4CnMpLlH4fpNu
X-Gm-Gg: AYBFou3ZBeqh/G5GmDNylDU9fssXXu8sIlB4y9WpZEr4fGNcdsk61YIr2Zr2FHV20bW
	W3gOCAcSJoW7M0rTrFv/RUktUfBN1kFkAo2X7OyVvSHUJ3KfFT3jZpymZvOECy4hvITpQF4H2Mx
	EjT0/XXFtVNHZLIYgawuasivbdNzJZuqNuq62agdslzurp1LD66F8KZRO3gM9qZE/jIYvKUXWSJ
	0mRUgFd8fa4+zYEVNj2DwpCRh5GGTI9heQ/mnSKEmgcKV22BhOjLRtT5yQMdUks/Vhp/0ymm+WR
	ID4CxREu6pNVYJm9Ug/AaDOp8TR85dtdpnzMfkQWy9Eu9tQeVxs/RTjCrVAtjSE+hueE0F5PMIh
	TyyIC+0ie+jjLk9broo0IKSerJz6LeZx/JnOw8juAt6gMn2jkVUjG6C7OFqQbmkRkEp56Q4x2i+
	GP5Tzo5LADuL2D5vhMN0apt8OBUO0rEUkqeCD95CTuW8RT1rAPjyOgr8ui/i2AP0E3pi4va8zzP
	mVNpUkDWDFExsnv4NYJgBVtxS5xKOuAn3Ndz6kkTbV2E9aD3FeLXLT6jl03wcT3wBfTVXkTz49q
	jDmOjHGDnbwvNqORW39YZlHzLeeqEe+XlZ55W8xrlHDs0zsa6V/UWx4=
X-Received: by 2002:a05:6000:40c8:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-499c425746dmr5287776f8f.3.1794409344157;
        Wed, 11 Nov 2026 07:02:24 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20327sm12054259f8f.26.2026.11.11.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:02:23 -0800 (PST)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Jaya Kumar <jayalk@intworks.biz>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Daniel Matyas <matyasdaniel006@gmail.com>
Subject: [PATCH] video: fbdev: Request IO ports
Date: Wed, 11 Nov 2026 17:02:17 +0200
Message-ID: <20261111150219.239706-1-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Some fbdev drivers do not request their memory correctly. Request the IO
ports' memory so no other driver may access them. Only request 1 byte,
because the inb() and out() are used for reading and writing.

Did not test on hardware.

Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
---
 drivers/video/fbdev/arcfb.c | 8 ++++++++
 drivers/video/fbdev/n411.c  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index b807cf07522d..6771a7409cde 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -481,6 +481,14 @@ static int arcfb_probe(struct platform_device *dev)
 		printk(KERN_WARNING "no IO addresses supplied\n");
 		goto err_addr;
 	}
+
+	if (!devm_request_region(&dev->dev, dio_addr, 1, "arcfb") ||
+		!devm_request_region(&dev->dev, cio_addr, 1, "arcfb") ||
+		!devm_request_region(&dev->dev, c2io_addr, 1, "arcfb")) {
+		retval = -EBUSY;
+		goto err_addr;
+	}
+
 	par->dio_addr = dio_addr;
 	par->cio_addr = cio_addr;
 	par->c2io_addr = c2io_addr;
diff --git a/drivers/video/fbdev/n411.c b/drivers/video/fbdev/n411.c
index a3677313396e..ed0281939d37 100644
--- a/drivers/video/fbdev/n411.c
+++ b/drivers/video/fbdev/n411.c
@@ -165,6 +165,11 @@ static int __init n411_init(void)
 	if (!n411_device)
 		return -ENOMEM;
 
+	if (!devm_request_region(&n411_device->dev, dio_addr, 1, "n411") ||
+		!devm_request_region(&n411_device->dev, cio_addr, 1, "n411") ||
+		!devm_request_region(&n411_device->dev, c2io_addr, 1, "n411"))
+		return -EBUSY;
+
 	ret = platform_device_add_data(n411_device, &n411_board,
 				       sizeof(n411_board));
 	if (ret)
-- 
2.55.0

