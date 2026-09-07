Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5887E483BC2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780534; cv=none; b=J+A9sBX+a2f2NsSxf7BVUfAl23qR0Llvw50lDYJMLiWIEGJyWQQkKzN6WvsaxJX2XbalWr84TbJIEWy0RflyvqD2xVeM5wZVUeVqSqb/cRGUla6cH7gEvzg174+EU85HdwauQqPQj3qMVuGocfNbDB2nORoTEAAQsRoNXVN2Eb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780534; c=relaxed/simple;
	bh=1eqC2i4togV8W9xfLTxPecQVpEV5uPN6kbS9WnYiVQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewizdsgpvKLQ1KwKnm8RfLnVx9etSMYfGkFb7lUj1UyWanJJF+TtznHC1T7JB70vGSxl1oZb3REfRDM63S9+w4RiXiEeIk9QMnwP+RH0yL26jDOrNKd7CpmgnA1FOd64OOQUaJ0+EwoNSXpLG2yT/1qVoOSQVVKjiilimSXe02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lmqVy8f6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lmqVy8f6"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 747CF13BA;
	Mon,  7 Sep 2026 13:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780421;
	bh=1eqC2i4togV8W9xfLTxPecQVpEV5uPN6kbS9WnYiVQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lmqVy8f6kWVfDpYAUHdOivcui1aMexQSbDxXzVMRDFSMGocqO51t6FDB5GW8NWqqF
	 yVbehRlzzVuND4YRYLCCNSz7IQ4h+lC0ukZweyBJ0UfE/HvN79HQ1oKZWI22pzGHnG
	 CkWXUZExc0UgF3StYYhIk5I8YL6zUf8e9g+1Mcyk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:28:08 +0300
Subject: [PATCH v4 13/13] drm/panel-simple: Fix powertip,ph800480t013-idf02
 timings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-13-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1eqC2i4togV8W9xfLTxPecQVpEV5uPN6kbS9WnYiVQg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/VAvtAUC9bLCIKig9BnCwaACtHytogplUT2
 YfDDQMYUZqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f1QAKCRD6PaqMvJYe
 9ctfD/9OkMXAwAib/AW1UYodG5XXXY97NCJVxl4hfsEIVyGwRVwo/rhxznR2iefU3rMXCNb6Q7T
 ghLVGzBZ3iSED1MnGfAvTm8kc2jhxaq1aAZBXmNkUmi50dzxpAPZbrk8NB+SBxEqml2mb443n5I
 47hZPWLakXe7RwSaH9MQ2T6i1YvprB6Xq3DOXd6qrJudXvHK3WKr1eityGOESvrIdLEd2AKDXJA
 T8CLZZfGAzfHai6v28pB4M5NM55T6+lZRPlbzc4c1Zvkkz6GObqzA5fos0FCFpbSH5cGdT2+8vt
 HnuCVokJhABx2KOaLqo8ZRKiEvpzbM+MBR8qCQY5LS+uOna2hOnNcKZTgZ/92T0MCGed1B0qu8W
 8lN01dCwQ6KmsOfi0mM0klyLrm5y+8qDC8QqRG1jtR4g1I6poZBvqY6Obb3L1KOZ11cMghYqMDQ
 pTqEREoJDlUtbQcHw0m+agmDnaCybtSWT8pMwFEDxUZLmBBo8rtO1SSq5ERKKCjlzPQVXn8hq3y
 UETafYZmarv8gMWBw/do4XfaFsAbvpgmhP7BOfK6p5kYD16WnSkkiaBzNLdTpGCNu8RvPsHN67Z
 E3hhwd6Ny0gBS9GIb9pwabvNFYHg+GZdM6RyL4W2b65lmTKCgfSRtiYNY2B4VjLr6mPRAr6qgJB
 76FlFtiw/dLuBaQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The powertip,ph800480t013-idf02 panel was added to panel-simple, and
with the tc358762 driver, enabled the use of RaspberryPi 7" DSI display.

I have been testing the RaspberryPi 7" DSI display module with TI's
BeagleY-AI, and I can't get a good image with the current panel timings.

It's been quite difficult to figure out exactly what are the issues.
Possibly RPi DSI TX and TI DSI TX have their own quirks which affect
this also. However, now that the tc358762 driver has been fixed wrt. the
signal timings it sends, this patch makes the panel work fine on
BeagleY-AI.

Fix the timings according to the datasheet:

- hsw + hbp must equal to 46. This was correct in the timings, but the
  hsw was very tight, and at least Cadence DSI has trouble with such
  short hsync. Increase hsw to the middle of the hsw range from the
  datasheet, and decrease hbp accordingly.
- vsw + vbp must equal to 23. This was 24, resulting in slight shift in
  the image.
- The upstream timings seemed to aim for 50 fps, but this is a normal 60
  fps panel, so adjust the timings to get 60 fps. As there's no strict
  rule what numbers to pick here, I used the "typical" values from panel
  datasheet for pclk, hfp and vfp. However, vfp of 23 instead of the
  datasheet's 22 give us a closer match to 60 fps, so I used that.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c09bf3db5e78..02be5e78e253 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4161,15 +4161,15 @@ static const struct panel_desc powertip_ph128800t006_zhc01 = {
 };
 
 static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
-	.clock = 24750,
+	.clock = 33333,
 	.hdisplay = 800,
-	.hsync_start = 800 + 54,
-	.hsync_end = 800 + 54 + 2,
-	.htotal = 800 + 54 + 2 + 44,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 20,
+	.htotal = 800 + 210 + 20 + 26,
 	.vdisplay = 480,
-	.vsync_start = 480 + 49,
-	.vsync_end = 480 + 49 + 2,
-	.vtotal = 480 + 49 + 2 + 22,
+	.vsync_start = 480 + 23,
+	.vsync_end = 480 + 23 + 2,
+	.vtotal = 480 + 23 + 2 + 21,
 	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 

-- 
2.43.0

