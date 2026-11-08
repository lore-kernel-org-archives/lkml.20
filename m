Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174758;
	b=Z0lfTsYzw0YnM5dcBkH4C2YwoLNwC0F08WQJu/lTlKuWdXECerI9Bws2FDrkZDwWh9Mk
	 NUc9DqaFnVX0OOXICMQ7ejuef5znHRq2j8VVsFXpOIQ1VtOlVIcv1a6BAlP2MUcy9Ef2K
	 BYXGu51u38d41I7zZcaM7DVixiCDjftNFqOvla4znHNRjMz2I8d3SY+Z8or+J3e1mOIAl
	 UaiPGpwVCMXV60epyf7ovPTnUj/LKnabwtA86FE+2U4GbXIfNviZ4d1bYlja9TWBuOSVg
	 I3l6dvLAyDYjBd1SBJdhXqcIC4tkLki+MdmbgehFJ6U1srd2XqoA7lax43kc0G2SzvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174758;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ldyjCjRZaJMZqLlHkHwwP3pNt4BYTwknpDL4CbSPepU=;
	b=qpZ/C0G7EvNq3lgR/F0dcdyLTcX5as6RElc1j7nwoDmOFvBWoOJW5LK/0X0FPsEuNYJT
	 hS71jsG44voqXrQPqJlJ7T3hGSh5EoRWPzE2ECRr33mkp6UXYxzAlbraH+Q4FvTaD7jAB
	 h2NIpyAWihUkKUdXlSsbx5qbZ/akP/DqfXXt5wenkNFECv3Ibu5bL+tjRPewWgzooGTLu
	 t5x8k0HT6TX+rbtuFDHSpkSOXF/CvuDtWLqXU4nKP+W4TnjYLnO2ztbv/ceBIi7j//Jy/
	 kr9p7hKlRWiXvA34lT3+0ReToSPk1D0XAdmAxn+PD1ExRvCIokp9J7dAQJgS6VcWWSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=KBSlOmhZ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=l2uqiUZ6;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4BB606A31C;
	Sun,  8 Nov 2026 21:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=KBSlOmhZ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=l2uqiUZ6
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794174751; bh=ldyjCjRZaJMZqLlHkHwwP3p
	Nt4BYTwknpDL4CbSPepU=; b=KBSlOmhZHO4IvV7zDJh+7TdaZEPp4ktdEGhBUARU3KYOR8W/xA
	08TdHoO/CZuB+T08vxVRrMvNVvma010MxZyrprz/tyOe2COTiXieoIqT5rj/xpI04StZMu2RQ2q
	s2SZbiPj0PK9TSDncuJOj0KG1taxXYCu+H+sLHV24PJa5h7LWweOVOddT4IVihegqd6RyJtYwXs
	+N9pTr56uwpknq+GLDWgUChydUz/SoOU1b1/t4AnfWsmBDv0srWJUvUyHnimKb3cn6Qi9JF6iTA
	2YhjO38yj7iXnu7S7QoRyHj91zcNvlDi1SD+8oDAJ0BPf3HMTSGdLHnq2KgE4PlKltg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794174751; bh=ldyjCjRZaJMZqLlHkHwwP3p
	Nt4BYTwknpDL4CbSPepU=; b=l2uqiUZ6oD79zJPSbLciQtrJ2sDyB11/MUlsDS6Sp+lboOkAhg
	hNdTVGU5Ti5HlZ6qDCy0Ga69ILkeLeSZgZBQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Mon, 09 Nov 2026 04:51:43 +0700
Subject: [PATCH v2] drm/panel: boe-bf060y8m-aj0: Correct display pixel
 clock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-pro1x-display-pixelclock-v2-1-670b1eeed6a9@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NzRKCIBRGX8VhHQ2QlrbqPRoXiBe9RcCAOTqO7
 x7UC7Q88/2cjUQICJFci40EmDGiswnEoSBqlHYAin1iIpg4c84a6oPjC+0xeiNX6nEBo4xTT1p
 3jGnWNBehe5LmPoBOab6+tz+O7+4Basp/uTFinFxYv+6Z594fmplTTlXNy+qkZVdBeXtJtAYt2
 uHowkDafd8/t4pjFtcAAAA=
X-Change-ID: 20261109-pro1x-display-pixelclock-8b00f09972fd
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174749; l=1747;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=RDBzpND+UCztKO9+6AcOViXnFNhPPCIUlyoaVDr0S1w=;
 b=t3QoydIZm6OYXACMv2ygYsTQW2VAWKOKDNoWBLYGy9VcJr2OQ8WXng1pNUAm5E1eKlKuUbDcR
 KSUlDAIe6ddDRUilo9ZZDSA5X1nVYxoeh43iUcE4Rwx9iJB8tmW7OUI
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=

The driver has been using the wrong pixel clock ever since it's
submission.

The panel is 60Hz, but the mainline driver ran at 165268 Hz
which is 61Hz and the following formula can confirm this:
(1080 + 36 + 24 + 96) * (2160 + 16 + 1 + 15) * 61 / 1000

This causes the touchscreen on the F(x)tec Pro1x to show heavy
signs of ghost touches, making the touchscreen unusable for
anything practical.

After the pixel clock is corrected, the touchscreen no longer show
any sign of ghost touches.

Fixes: a19125a28112 ("drm/panel: Add BOE BF060Y8M-AJ0 5.99" AMOLED panel driver")
Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
Changes in v2:
- The mentioned "panel" and "ghost touch" is the display unit on the F(x)tec Pro1x. Whoops!
- Link to v1: https://patch.msgid.link/20261109-pro1x-display-pixelclock-v1-1-c81453fab5e4@mainlining.org
---
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index 84c21c62a43e..b1f428e0808d 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -168,7 +168,7 @@ static int boe_bf060y8m_aj0_unprepare(struct drm_panel *panel)
 }
 
 static const struct drm_display_mode boe_bf060y8m_aj0_mode = {
-	.clock = 165268,
+	.clock = (1080 + 36 + 24 + 96) * (2160 + 16 + 1 + 15) * 60 / 1000,
 	.hdisplay = 1080,
 	.hsync_start = 1080 + 36,
 	.hsync_end = 1080 + 36 + 24,

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-pro1x-display-pixelclock-8b00f09972fd

Best regards,
--  
Dang Huynh <dang.huynh@mainlining.org>
