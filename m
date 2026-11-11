Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389050;
	b=mX9oufB3tKAHeX4BDxO7lR7sd1BLGKZeNzKZepqC9SFaHgL+o8YWi0IW4SUOaySeZRss
	 I4dOl/H+2DnntSFdO2HUcvkEnkwE1NGMLLtpk2EUU6kfLFKbecNn8QC16sd4BdmCz0W/L
	 Fa8OCvfMmaqPW2Gale8YmuKgj+d422Nc0tCMvElYCNERqPoKLJGbPBarNVXQ25kgxjpb7
	 SWpbVZTeEbzOuaYHfKJmBIVNZ9kXS0KSYvnpAqzbPXIHTPueYookh9ZMPrUiw3fUFhf9L
	 AOiCcPP0bB4Gy32KBlQ2nHvjten6gw04ufQi+hj/G6zrtwzs/TMV63jqOhI6DeZXaXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389050;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H9ORWqChu847hMTKZYKtisE5M6zIwsKpi893O/wOGF0=;
	b=wb1lbco6CI+VzGTXaxNR+7wKC6zLm/PS6EyfxvFm2W/X4tl3/9WFHL9/dcPEVmMZo3bD
	 SfsnuGBvlUDQbUQYyvPrL3mW1FmmombkF9TY/Q0/rrsj91N/+Vr5fKtJ6tbcSM0ysTX0m
	 KRwE5VFEUeyFGEuThgVS1sIS2ZkPYRVwMm3KNlNKrpYgwq8G9dG/ySw/qMyugcU9tu/Yo
	 cAMaVb0vXzJTw8/kbVoKNLcd/gFZjFw70Ag8FpHp5UYkhFGues/O2srZBvj6Qla74BLye
	 k+ydiYdwJAhuDnFVU2jSsHRzB6ibS/ZoA+2i6CogAO7myVvSTCwPGcAnwrP1OJ+Vgjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWYv072k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC05606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GWYv072k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AB11F00A06;
	Wed, 11 Nov 2026 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389050;
	bh=H9ORWqChu847hMTKZYKtisE5M6zIwsKpi893O/wOGF0=;
	h=From:To:Cc:Subject:Date;
	b=GWYv072kWSeO94N+0F1DYHCdfPTBykHvIOlMfR2mKe9/+84YKbkQhFT8sVBZc6e+0
	 waO/4tfwoyuUNshGv2XaEj+7qgTCga3jRuMdjfk3aYkKlavZyRr78WoYleB7FvCVha
	 JjV9fv118S1LisXVtE9+fvt7FrXgVvd0+vA6RF4K8r/p1V43m+SL1r+Qhat1CBesjk
	 850FyAQQSBUkycveDyIJP7Tp2ro+HOpW5LVLpKja2Ut8N5nC0mlb/fX0DxHCUVxu1s
	 +v/QYysKMaNCi21c+PjcXWQdYujIjZ2gwLEPvLEQ9w+98jW8mDq3FZ/zSfsx2u3ORY
	 OmXv2f8l1lB/Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	David Lechner <david@lechnology.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mipi-dbi: hide unused mipi_dbi_dcs_read_commands array
Date: Wed, 11 Nov 2026 10:23:55 +0100
Message-ID: <20261111092404.2117072-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: Arnd Bergmann <arnd@arndb.de>

When -Wunused-const-variable is enabled and SPI is turned off, gcc
warns about this array being unused but defined locally:

drivers/gpu/drm/drm_mipi_dbi.c:79:17: error: 'mipi_dbi_dcs_read_commands' defined but not used [-Werror=unused-const-variable=]
   79 | static const u8 mipi_dbi_dcs_read_commands[] = {
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

Move it into the block that actually uses it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 48 +++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 25cf04d029f7..1583f7248573 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -76,30 +76,6 @@
 		DRM_DEBUG_DRIVER("cmd=%02x, len=%zu\n", cmd, len); \
 })
 
-static const u8 mipi_dbi_dcs_read_commands[] = {
-	MIPI_DCS_GET_DISPLAY_ID,
-	MIPI_DCS_GET_RED_CHANNEL,
-	MIPI_DCS_GET_GREEN_CHANNEL,
-	MIPI_DCS_GET_BLUE_CHANNEL,
-	MIPI_DCS_GET_DISPLAY_STATUS,
-	MIPI_DCS_GET_POWER_MODE,
-	MIPI_DCS_GET_ADDRESS_MODE,
-	MIPI_DCS_GET_PIXEL_FORMAT,
-	MIPI_DCS_GET_DISPLAY_MODE,
-	MIPI_DCS_GET_SIGNAL_MODE,
-	MIPI_DCS_GET_DIAGNOSTIC_RESULT,
-	MIPI_DCS_READ_MEMORY_START,
-	MIPI_DCS_READ_MEMORY_CONTINUE,
-	MIPI_DCS_GET_SCANLINE,
-	MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
-	MIPI_DCS_GET_CONTROL_DISPLAY,
-	MIPI_DCS_GET_POWER_SAVE,
-	MIPI_DCS_GET_CABC_MIN_BRIGHTNESS,
-	MIPI_DCS_READ_DDB_START,
-	MIPI_DCS_READ_DDB_CONTINUE,
-	0, /* sentinel */
-};
-
 static bool mipi_dbi_command_is_read(struct mipi_dbi *dbi, u8 cmd)
 {
 	unsigned int i;
@@ -1096,6 +1072,30 @@ static int mipi_dbi_typec3_command(struct mipi_dbi *dbi, u8 *cmd,
 	return ret;
 }
 
+static const u8 mipi_dbi_dcs_read_commands[] = {
+	MIPI_DCS_GET_DISPLAY_ID,
+	MIPI_DCS_GET_RED_CHANNEL,
+	MIPI_DCS_GET_GREEN_CHANNEL,
+	MIPI_DCS_GET_BLUE_CHANNEL,
+	MIPI_DCS_GET_DISPLAY_STATUS,
+	MIPI_DCS_GET_POWER_MODE,
+	MIPI_DCS_GET_ADDRESS_MODE,
+	MIPI_DCS_GET_PIXEL_FORMAT,
+	MIPI_DCS_GET_DISPLAY_MODE,
+	MIPI_DCS_GET_SIGNAL_MODE,
+	MIPI_DCS_GET_DIAGNOSTIC_RESULT,
+	MIPI_DCS_READ_MEMORY_START,
+	MIPI_DCS_READ_MEMORY_CONTINUE,
+	MIPI_DCS_GET_SCANLINE,
+	MIPI_DCS_GET_DISPLAY_BRIGHTNESS,
+	MIPI_DCS_GET_CONTROL_DISPLAY,
+	MIPI_DCS_GET_POWER_SAVE,
+	MIPI_DCS_GET_CABC_MIN_BRIGHTNESS,
+	MIPI_DCS_READ_DDB_START,
+	MIPI_DCS_READ_DDB_CONTINUE,
+	0, /* sentinel */
+};
+
 /**
  * mipi_dbi_spi_init - Initialize MIPI DBI SPI interface
  * @spi: SPI device
-- 
2.53.0

