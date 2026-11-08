Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173591;
	b=3Uva0ZHumuhgcyhuq132cG9CpI6JyGeELEurYKBTuRSl6OXg29Or3uuecQZqPoItyzZ1
	 sUOFYl6lgPmhutji5yArW4SCAirgXDqjuVBgB3TAqIGxrB2PS6CXgwWTBCPlgKLG32+ad
	 yJ22YTwTS/LttC/QpbMprubBIZctWMy9X3H1UFvTIoiIOO8MubI1cqy7dRjwZkB0ZOMVV
	 yKpfWGaX0s2MBgvxFMQUDs+duAZ4fmUoll+RYUf/1aKbCw9sVDLOtj85DYd0ueWy8vHK1
	 wwpS03mH66d+IocCf0YI7BaT/JHhgpstlRtN+ME6P299D0QEQiorfDkFzLQDQ0Q4yVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173591;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mld1YjQVRW7XQTMott+990ZWzRSiS3g1hcDI5GmZvEs=;
	b=RLTfKqIYRqpYmjo94cMnJawMC2P9EJkcTH+bCcpCGFH9QzExDLoK7SVU6cCcO0BF7YyD
	 KykxMocHEG7Pr+DUSg3+xFmS88SIDPh/T5Iouj4wMKe6GdYgMQWhpRgpqbTPa9M+MWF23
	 dmqwW/tWZD5jpTPb/wpEdgSUgxW14Mqt2hr8eTmobu+sbLFJn/vU/6mv5NQOn546OPEPI
	 068ZANYj+I2PVRnInvANt6Tf0P/7pXCJPzqZv/UbNbg/b1pbEv8YiL80m16p8yR7nfSpt
	 uL4SGCV1c66NCvq0lQ7LB0buea0QxumaFzm8Ft5G2h0kkDPkdr3ythpgsnk3sMQS7Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=ewY2GHnQ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=O2ZuP0Vm;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62EA606A31C;
	Sun,  8 Nov 2026 21:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=ewY2GHnQ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=O2ZuP0Vm
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794173578; bh=mld1YjQVRW7XQTMott+990Z
	WzRSiS3g1hcDI5GmZvEs=; b=ewY2GHnQ/pmFHOwOVOu3RQ+UT4GGCl9LSvnX7r6y6RjbYnG1Kb
	3lUc88gD42HzocT/TH7KTBy7HvT5urPZKrksCYz+ezN8cu12wMN3eX8Yt6FQ3x4TrBIrjTlty74
	rTWUutVa58JbukKJ8W46reWp/MqZceQ+cK8OXmnfclgEeX8wAJqb5XKR1JmwPBUU+7RUrqPWvm0
	7m81mNQKgt8+w53ZApnPqHZ1OlkU0843w6AWW4ZwkPiPmoKNvK8UgNBSjK5DyBicJpuNU7C3me7
	AAlL9LuzQtBg+UWIWdDGOhT4pjPZE/VkODP08yWwH6YZfV/8zupFiIi3lacikWb8ArQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794173578; bh=mld1YjQVRW7XQTMott+990Z
	WzRSiS3g1hcDI5GmZvEs=; b=O2ZuP0VmVFDWbNwvY1yDWjbb/aiRSnhIza9WfiVOOeVPxGrv45
	R0X8DLxWpNUZ04OdvQgn1Agd/uUjVYKtrzBA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Mon, 09 Nov 2026 04:32:50 +0700
Subject: [PATCH] drm/panel: boe-bf060y8m-aj0: Correct display pixel clock
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
Message-Id: <20261109-pro1x-display-pixelclock-v1-1-c81453fab5e4@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWTswycIaryIu2mSio6EJmSqV0
 rs3xeXH4/0rKFdhhWu3QuWvqOSpwZw68M9hejBKaAZL9mwMOSw1mwWDaEnDD4ssnHzK/o2XkSi
 Sc72NAdq9VI5tPdK3+9/6GV/s56MH27YDZUoId3wAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794173575; l=1490;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=Z1BQM/pf1WR+1Kl4QTU3Y+a6rdxjZnhPHpwNe7Jhyhw=;
 b=UK5ym6da1N3ikhvb16kUg2wQh779tDMoZuYealnE4vJzo9cep5u99nj6kD0nmPkqIkZfQ6S9A
 lvhg64ghIC3AVxgBlSfQbweDUVeaJIGGBrnN8mGyUMu4lr1GnAO31Lr
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=

The driver has been using the wrong pixel clock ever since it's
submission.

The panel is 60Hz, but the mainline driver ran at 165268 Hz
which is 61Hz and the following formula can confirm this:
(1080 + 36 + 24 + 96) * (2160 + 16 + 1 + 15) * 61 / 1000

This causes the panel to show heavy signs of ghost touches, making
the display unusable for anything practical.

After the pixel clock is corrected, the display no longer show any
sign of ghost touches.

Fixes: a19125a28112 ("drm/panel: Add BOE BF060Y8M-AJ0 5.99" AMOLED panel driver")
Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
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
