Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2947472F94;
	Wed, 16 Sep 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547759; cv=none; b=dfOLnlFauqkC71h6pO7L5WUZvAIYPPc+GlMDp8eouyyQ2upq6+H0kmZmGSjGFc9OPuRP6DYOO4t/UGQVWT1DSPV+crr5RV7/tQB8qUvGx1AW7ESRvJIDvsLbAau9jj0mOnMADmFsoVAkKfp7mntIzjH43636FrpB0IbeAi4yh30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547759; c=relaxed/simple;
	bh=1jMUBEC0jB0yhHHKFee+CRQKEWKrjIWM4cQsZF9nnTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Op2FIhJ7Y5qWKgch7BIfHoTLfAIHhf5E2yqxPBoxzsXAacLDJFcuIA8N3ijpU8zISfqm25BCjWcZ6Ww4tdwTBCEhRW0WxL6Q+bfVhvUqxCP8I6RpLLlUQmYzIVzdEqZxcq6kLWA/8hItxNKxXZ7MYRdNfywwHuvF8lrwOe6HU0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8UmC/yT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8UmC/yT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2354B1F00893;
	Wed, 16 Sep 2026 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547757;
	bh=7y9hRu5WhkSsoWNaVlctVRrwMTgH5FYURhaWgNlscdw=;
	h=From:To:Cc:Subject:Date;
	b=O8UmC/yT4mAfCdbDOgVVQPiymOXkQ0YQB/qDb/Ia9nLhIV0yqTqBIGhWT9Zj2OU7v
	 oZRDjRCzATIpveXF5UehmmWAavNZ6QouuISSFK0NdF8NeIoL80F7j+x7uM0QIGA3hj
	 NOjpTJan5m174zEoTAiU20kxyTmixwREYwzCDKUS/eXNkg8jgM/NnN17iQMiY61XqW
	 O6x2lWDg1sgiwF7pYNFYKINPfYcz9CLrvx3MG8J7spRdTAWHrWQ1qHto3lb8Qt4tg/
	 0u6mWTYr5KlqbxbWFdMFXSGeCWpmC2NFUe/Lk0NIYY5v3cSneqyRIGem6IDCc18HEr
	 gdXnVoGNdrHOQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hermes Wu <Hermes.wu@ite.com.tw>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Kate Hsuan <hpa@redhat.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: it6625: select CONFIG_HDMI
Date: Wed, 16 Sep 2026 10:35:20 +0200
Message-ID: <20260916083551.4178568-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Without HDMI support, the driver fails to link:

arm-linux-gnueabi-ld: drivers/media/i2c/it6625.o: in function `it6625_show_avi_infoframe':
it6625.c:(.text.it6625_show_avi_infoframe+0x94): undefined reference to `hdmi_infoframe_unpack'

Select the option like the other similar drivers do.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 3370b66ab4ee..4d9946479160 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1327,6 +1327,7 @@ config VIDEO_IT6625
 	depends on VIDEO_DEV && I2C
 	depends on OF
 	select CEC_CORE
+	select HDMI
 	select MEDIA_CONTROLLER
 	select REGMAP_I2C
 	select V4L2_FWNODE
-- 
2.53.0

