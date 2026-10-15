Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F652758B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079900; cv=none; b=jpFUWqVh30nzJ/o3m3y1ga9uzq4vt1zeKnT996RESkojWBKY0eGkRbdUBxszJQpTek7OSZIDWDRPvXiDuf7+SpTtGnJtS1vmSI2WgyOpICL/SeqSYRMz9+pCplT1ZtY8Zf4e+4RIokKjgYOEuDSa3drVzwohyH8OLedSNF5nXFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079900; c=relaxed/simple;
	bh=sLWl2JQyqeVAhWGermIWldFQTk+p5V7tPme605FCGQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I4oR2pI8WA0wC9OW3Z1/vRrB07Kjsyz5AuoQWiS0X7EpRnmsFxVEp8bv09P6F0JyUBoFsBSob/1qgvyunjP2o3dEaTYsIoLoA8EehtPwc3lfIaj3DNGHZc2ZESq1fo9Vq8PAodgmWdbQ8TF2AW2x8ZDazgUdnUEsWN8FQSdBwjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DytEZA3Q; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DytEZA3Q"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4649b35bso599549f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079871; x=1792684671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPi1pScmOBdXgs8foC5HPXZ0T/2VagZrymR7BUhJAbs=;
        b=DytEZA3QcNhJ5Smqn6mkSHuHblk3pgOFPEBPKAmL1+Gs8k4O8miWjjc63HXeNM8xvE
         eaFyAYfeZ0V52FeopEph6UvEskE59AgtvoFJ4shhfB3vXpKky8Qija1yJMScyd5dv53+
         vbuHyxgKi+9NlXpr87IKaL8BV7LpP5YDQLvEu5e7q+HaaLWdD+AoN754IF4tu9vtnXb8
         Yh9eyVclAuBA8mjy2aePvY6+2BOqj+RwQuuU80mpLmMzzWgA0F7GhxtshDCSDdGDUy2t
         mod6KW7PWW1XRIE8SMn/C1eeAxaeg/r3OqAWDi3lgNK4Wd3BD57zLdVOwbd/IYQW/wXI
         yTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079871; x=1792684671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPi1pScmOBdXgs8foC5HPXZ0T/2VagZrymR7BUhJAbs=;
        b=V5wR3XMD2I70Gb3e8J5vcSYEMav6UzHTOoGD/Av59DLVp/mmA9ynRpUuQqldhAuqFo
         mFrIRDMsn9Io79luhNRW+LWEAGOc/TEIjJjJTvkn6BdgvBAUF9UHzlKHdYKkRyghIwJ+
         woCmikELdkrZZRHk/eYtqRPG9VWK+BrWVdk0Iw66mqjqOkXbB5U5w6rZ7GxgUqeMorYJ
         BKv2eFtUCpsew7+XJe0MNneBUryhdVGqUYyt4HUOJ+Pde+D5mOJczvILHB/dm0SW+RrI
         ESLlWoyvkhO6e6sa/q2qP86/kv1J+Tlcpd4U0FHXeCiIV6+COJ7FByCA56gAsyaHmWdj
         mSgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg8yC+7Fx/UXL6V9IBu6LBeWVdcsyWUO26ghd/R74nHrqhmBSMGZQNDYN7yv6M3qPFcpd5uIrlcjlIbxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFp7S1h77VMHt3gYKXF5+pWgnGckC4HaZFeO4hnKx678jjudsA
	mKprW18cKqfU2nwgwLogWA5IUGDt+fxG+xYQv5tk3xF/s90IKRpEMp4C2UAqOPY1xP0=
X-Gm-Gg: AYBFou0M1qkId+jQcnmmqnWW61tAGoUS9T6pKQiFFSm7nA+iAQrGRT72NFBz/gtH33d
	VO9CcS2grvA6Bjca4h0va7LjIUw4BPH5/0W9Ku2EBsZpF9g05imoOQHYjtayGXXAfefLnJmDfEh
	dysm9D0YfOMeQFT+/jhrs53drbRqrNBNKYmkhyMLVhNqZzJhkkLVmF/dpmCEuRyCF+vIsFLcPqK
	op9BLdl+BPpiNScG5Lbt7rjCApbLqGfMNh3SwHKtpcXz15w37pFJeA2z2I2mppmH8Nq0KbZSNp0
	UbQpjEwquZyRBupZeV6bMxZ8XCmvdLfGw3KlJW87E06mZRrVpuAReuVMJk5u8qRWbYju23HPsNM
	2q1lfvnMn9ZyCSK5PqcTSqRy7jRQR+/Zh52UyH4Kdjo1TOJtHYzuy+UYp7BbA8FxHF8A4Id4LZI
	zG0yEawmHNbMx/c6spW7a6BL3SMStw5KOJDJ5QliLlEz8g20ZGbHVi+/g+YNMo0lldfrLSrdyu6
	DljtlelXwMQzQp1hMHoHvxODLsbFAECIAfqBCfoDEhYYhOKWA==
X-Received: by 2002:a05:6000:298f:20b0:489:bc38:9438 with SMTP id ffacd0b85a97d-48dbaae70a1mr31060964f8f.29.1792079870916;
        Thu, 15 Oct 2026 08:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:40 +0100
Subject: [PATCH v4 14/16] media: sony-starvis2: Only update bits for window
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-14-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 1dec5d923077..8585f5c93dc2 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -88,6 +88,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1458,7 +1459,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

