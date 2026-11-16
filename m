Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851536;
	b=BL6AdbwmVFZ/dUmXugGpGncfA05R70Sp2VN5T62GYCi24omXv1HekVgFZkEqU1tgFO+u
	 XtnFG4YnGWTggiBgUHeyP962erXGgRZjUDsdlriqTvmfICDO0udHAsfhkUFzrgKvccXv7
	 850b5Eji3RrJWqrrCFogOQr/EmM2Z/Jz837V2EKbwuYAPDHq9Qom2qx39cYtmOefVzlDV
	 p0HSLvYWKBjn10BBImMf8QwCHL3QGs762gXXkDRx4LVmJiZzxnRnwQGbmKKAqj4mirv33
	 j+wZQlw5bODg1mU/VKoT4JXLjeLaMn4PjBvVbSisMLctahxC9nZ8BdsJ5NG7HvW9Twg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
	b=VyZYnt62FsAjCmyYSRQUUaeMKQCPoWhGf7HhNqXqEquviiGFhH0HXHEXfEm6UqesRi31
	 DWroSRHASdyJST6r2WZdt+cZ9c1gz8OPUsDmvNk9HePpgJUnksHNyfrvdjuMTGRZQWEPo
	 RwL2D+cB+N09NlcuXDll0MUVkJzXYSHT3NLwagag9CHO7wmQna9oX7kzhu/a9h5hiaWop
	 qgBKm6d9QS2cmNwcNq8fqO0xS4hSWcA8of5Qej89x/LIjfI13SjVr4m14ZrQelzLkKv9A
	 nlBeQCWPH8/WxYBq9ofUYWJX/mzGUr/MYZC4xcjlxKmU45qZfFTQ2SRfV9B4qg0RMRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C/3qvP62";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D683606A339
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D683606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/3qvP62
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1995767f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851534; x=1795456334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
        b=C/3qvP62ZW3XwZhzlMvPSTq73p2kBWmBNzJvw4KxhVyG7smi3XI5JasK+bjtYj5v1k
         FnobMzeQHR5zJsncPlX+JcwGXg7tC5Cgc/U6XNKcQ8t/rsFlIMHbhfAyQLBZ6Wqob3Dd
         w1ekyIe3VaUQ6cV6yDpxU8Dnb8TtSJQdnVveHFR2PPeQ+6UENTrN0IxBAYRKMUJcC6sk
         gzgvzcAUtXhC/YOsf0k2f1gz1tF0h5/7J7KOu53XQCJMfPiOlvkgCObS2zohWNztxiPn
         yHw9mT1Y387wM5Lz1HGQ49YTVLN1f/8unWfxMmNhLLQB8ZjK5rH4mCYxVhJOOyuYfBdv
         uc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851534; x=1795456334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qY3Sg/JCmnJPeKpitC3p5SFp98fK3Xr+Qc3dOamC6F4=;
        b=pSbs5nr8/c8v+UfLRFzusYorzy/v5XaTfGXRd97ZRUhRPuF/vL0gOJFXf2L0IwQNrJ
         shjgZlsDPv3ZsaOvgoltTKqz9LngZ3cdM2DztZ3j34yohO1PFm1Beh/yfPo9s4i3TmpG
         T65SoSJm8jQvOWH+uKhjsM3Ikf+u6PX3J3heGRqDbkRD9tHUpTFS5Oa4Bvzt3P/Vt3PH
         XLvICmGKwtV9kF9WtqARSp1xcU2jfViHnNEBBaRcN5V/skBWow8oatmxCnZQBMY3/9Gm
         smDPlB7u1TI9DNCIAox635lAqvgv3if8DtD5r9GGNM1iFnxTDhthA3bqfmz0l863XP7S
         Ya1Q==
X-Forwarded-Encrypted: i=1; AL+hErFpPSxntr1mxfgsKwNu7q26WzOx1AkgVDzPLuqxL93k1azM4Y1GgdBhtLVMD7eIvWyYeN3o1iGRdMbJprA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cl7k5+xzHRMs+9iz7hcEmoOQ8WI4ssPxLo8jJMcWwlhKweQa6
	Eaw377MpHqeFf8INeWQHRcqF2FOmEu4JfzTdwJOff2YbEktoyQBG847D
X-Gm-Gg: AYBFou27DLtbfKCVjgS1kHTJ/WdJ4wzDcOaFDGkxC9NSahgv0BolucuqQDhBAJCTJiM
	G67tuIGCAJ0YxfBXf+fXpXS/zKvpPO0AXgKgAup7ZKE6P135CbgSxZoZGKUI5gC7zEjZT44Y2kG
	LzZtaZXhNxoRG3wAZUir82/nOatczBhWKO8A/PyM0BgmmNEMSfQeVe2d50ViTqULZajoaJB9U78
	vVJ/PApENhViE9Dn7BrQX/fLvkZQvE2JlwVuqTWXDHMPXDjFsTPX+Nj9NbsT1ppfkjlgdk8/9bM
	cKbCg5m9Xgl5rVL61RhXXvu+MV+oG7TtD/DGbQu6W4M4bKyvWAs8WfpncJJaPct6/ef1zhAmBSZ
	hGiJVs6qFq+LvFGO/HxzygLyXg1EONGhAd+FjMIYzP/oookpzHlMWAWtBwypInROgnpkR0J0aR+
	JTjo9DPzaNpJFwgaMKYddKPT1HKKbOpcEtHiFyZgvEcnXF2IXNdPAMjexfbHjIjOD9S7pTZGkls
	8s6nV7A0WxAm0N1nCUfRxlZ9u3mDGG7q93zUZSca2Iax9+1SwRsC7PTdP+tE+o/IG0UCr2NDKgh
	l8ZFl534yEMupzPQxBC6Fej/FUr9B5E6TRfZlYiB4l/2OQ==
X-Received: by 2002:a05:600c:b86:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb55a67c61mr252740735e9.26.1794851534022;
        Mon, 16 Nov 2026 09:52:14 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:13 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
Date: Mon, 16 Nov 2026 17:51:50 +0000
Message-ID: <20261116175151.20150-3-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175151.20150-1-volodymyrchapman@gmail.com>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
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

Add the ACPI HID which the Lenovo ThinkPad 10 (20C1/20C3) uses for its
Sony IMX175 rear camera, with the 320 MHz link frequency supported by the
imx175 driver, so that ipu-bridge creates the fwnode graph for it. On
this Bay Trail machine ipu-bridge is used through the atomisp
csi2-bridge.

Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
series: the IMX175 is found ("Found supported sensor INTCF1A:00") and
streams through atomisp.

This patch was drafted with the help of an AI coding assistant (Claude)
and tested on the hardware by the submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5e419c7b9..880b06d71 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -94,6 +94,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Lontium lt6911uxe */
 	IPU_SENSOR_CONFIG("INTC10C5", 0),
+	/* Sony IMX175 */
+	IPU_SENSOR_CONFIG("INTCF1A", 1, 320000000),
 	/* Omnivision OV01A10 / OV01A1B / OV01A1S */
 	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 	IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
-- 
2.43.0

