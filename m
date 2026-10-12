Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D0C48F84C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815739; cv=none; b=UGuDVPU5V9NH5+KTADuDNBDFvMO46UWZiDcecRcD0D8yhrURRGkPlQj8r5S8iy6U6j3by6Ie2+EqeOljC1965Q5MA1jVrYZBbFy2+x6fd8jVeXXa537xJcg8QJ4Hn87WcrbSVvrvDzpoqwL95X0lrDlZWMsWHMP/Iy7KHBOriGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815739; c=relaxed/simple;
	bh=pEjrpwMljWshFQvCBQ2MWFInTxBXJHuVzR4O0M9J5vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUM5Ni8PcsHR7F66ajBSjddCg85SDQ9eBPgJPaR9Zmujf5ZwopbGaSOjqKM0Z6tNC+UsaGwFDRY64QSAmEGGVCqiPvqyJ0UOd5NRzfNSxiLIxT0Oq8e2psffrtF2yzHuvNAmC2LbJbYZ9XfRIzFMYqtzteiN/ZDs/E5JkgGr44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vz8aKkKZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vz8aKkKZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1905227f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815734; x=1792420534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHdXvGpVSfSzHWfexlYOc5k2ZW4zeZDNZII3r1hS0E8=;
        b=Vz8aKkKZe+F+eGrhHuo6JLMq6D/TpE6KMpg7HYT8oxsdsiDOH+8gea60XZR0wU+Cbw
         M5H3lrGS+2afemJwyw4pk5BveZWUrB0x4wtNh01hZocj7Orlp0F4CZdjBn/tmPoHRhI4
         32/1bwMJyNOXNOCSYL62vgFtRa3fVPqnyGF5JcQNBm5F2TxmpcL46vkpUw75hK/DJiff
         RW0R4717h3ZZZUDMQh3rSOYorrunZ0KyBkN4e5sg98Dk8B8uqqTg6B5K4JEF50WN+s4g
         Iu7+7DLoq6lEdEkY2ZfUE6KNpXGmDL+15WA3vAvDd7UoNYG7DCDB6xx4MzOhu+/wukS2
         y3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815734; x=1792420534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHdXvGpVSfSzHWfexlYOc5k2ZW4zeZDNZII3r1hS0E8=;
        b=MuHWqw7VD9oKFyPTPqR/KVx7+LqwlMEg8e/XY+KzE902r/INGduxe7AXq5hLjUUEVe
         FIKTI+YUa1kCAZnl57l6TsEj8E+WRvf0EBViIy3j3fQVyY1jWd0eOsazq2n0cuU44ETA
         0HG58v7xSvI67ORGW1RIkPTzD2Ik/BV2KkACUxXx5sVH22pKoR8eAgNVted2c+dZE5ea
         0A9IYa3cwlWwkswqaL6SvcRIffwxafh/niZmbFcBaQZB6GgHxfUxDoAiu8KHXPJFwJSl
         FArfQO5BTcijXoFn9FCgJnmE/+zAXg+E9NL7UZSZiroA7s7AYDZ2Mgyxzkjj52rA5359
         90Cg==
X-Forwarded-Encrypted: i=1; AKwUvByxjmUQK42xBcm76TvlfOFeekRv/7FYiVxxPpHz31HNebtn5JTAYDyQcZUx9RqsIkiDaKKI5SLoXTsMdX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA3YbISYXIBzQtsTom1/lpppkbo1gkTvNl7v57UcvXbswIBB0H
	UTwJRswVL3fQpTq2lGPbdyK7mNRk2ezfcv2IUv26FeQvTbWIgeQotZfn
X-Gm-Gg: AYBFou060rJ7nKhLTF9rBnfhKF5D4CfnFye5V7DRu1GHxXa6Lqdb0WDTmw3RN7fMDCi
	B2vvk1fXW951bB4R7/He1qFGiEoN6PYEY6cixvv7DYBBUDBqlNJ2br5+DJhOk+pP3oDqSg8iFfy
	YWgmhRF4LIQ/cvYI9TBwA1dkHpEJb7Sf+ZQRzZ3Yvf6+xS+AW8edWFaDFEbMD3w7wOZCIE0YlO/
	MC45WI2C7CBAi+B0rkTO4m8b1zxsMOZPxwl5VYs7IMMAvcEjINuBqOr5vgiMDgJaJxhOfB+mu5S
	KXWe+2hG1fHexiwSwy/0vKkLZbPDNzLDDDatvZ7CoF6vbzvMuDbafuAyN7d5vq1bDM8ZO5KN/QO
	Kpgw7VAiqtjyWVrTNZNL3wdbs+jDLlcAbQWzBzwwyNFzAEghn0HftOVewGUXbnR8bDqnmhi8PLB
	nyS9SXhEyqNyLXpnlaG5EMm0M2qAI2Hp8/JaYQ3P188hq5Jg3kS9G5KTC96kQkx7FQHGgobwL9X
	jQ9yDkALh1hucrn4DvBUW4ZgUMk/OSLoetl09TQwig2OotSQ4raD9jz8EE6F/h/Ln3IMUDUjdfK
	VHKbIywVCzu94PEZ7rEwUH0mvqcuNNnhaZk2wmI7Tg5qsmXDcfd1qa/ljZayYcb121cHLXstRR2
	KMttaHkTmbKN9E0foFvJD1eh8QXzQ1mC1iGFGGZghShh2DmCKCayzNA==
X-Received: by 2002:a5d:6385:0:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-48dba9e62a2mr13975042f8f.21.1791815733842;
        Mon, 12 Oct 2026 07:35:33 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:32 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] media: ipu-bridge: Add GalaxyCore GC5035 and GC8034
Date: Mon, 12 Oct 2026 16:34:39 +0200
Message-ID: <20261012143443.34897-4-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012143443.34897-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261012143443.34897-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the GC5035 and GC8034 ACPI HIDs, with the link frequencies the two
sensors use with a 19.2 MHz external clock. Both are found on the CHUWI
Hi10 X1.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Assisted-by: claude-opus-5-5
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..851096d7d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -59,6 +59,10 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 };
 
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* GalaxyCore GC5035 */
+	IPU_SENSOR_CONFIG("GCTI5035", 1, 422400000),
+	/* GalaxyCore GC8034 */
+	IPU_SENSOR_CONFIG("GCTI8034", 1, 268800000),
 	/* Himax HM1092 */
 	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
 	/* Himax HM11B1 */
-- 
2.47.3

