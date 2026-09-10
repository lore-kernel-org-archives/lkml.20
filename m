Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C91F91E3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789079900; cv=none; b=O4k6Wy1N3cYk5p9N40wsRuBlr2i0EvuzyW2UdsMixT3hyxsk0w33n6jCyHnzoT5yCVSQti/R3B2/GDcj7+tadhT8WufXYm7HQKHgMCxm1J4G54NLYAEurzW7eBJFnz2yWxrH/PH0RUKA1NNyWHGulc8UL99lnTFmF9oJrDEAVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789079900; c=relaxed/simple;
	bh=SWt2X1DGCJzAIa/CTdS0MH7oV7EwnCVO57QQ71qYkXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TT97yCOtQ2uwEziWJUUgWTajoT/C5CoEAvsN3AXl4VwHuEVC8/ebyFsJzLeUKDnrWu5S7tWBffIZNDXMe6W7w78+5nJuyp5cIy8i/eGnGi0rVTL16byXTPQ/s2uhfEtJck9oyRHBiG34juY9pRclwkWzauNfc919gSNDA1cluTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pakIpUqg; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pakIpUqg"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910ca5aa7so28026085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789079898; x=1789684698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lw0J18o8NMgLkUQr/yomujhpoAzqRd78S+D2/pgaPdk=;
        b=pakIpUqgp5sUVapkWLUxvP8D0dO2dwyymArN7yTqravdZ5UTSC3s+MV/wMFmqwpYw7
         W2EWmYQw70ki00QQFC5qJsKkk2PAoA8v+TdJQaz5e7PDLWthYL/CZUL8Z8Rn/0aVZNJh
         uekLFBZzjmXWm5BQVq9Z6TF9lZvzwDvM59CxXp6VZzHoXSh0K0i+pB/P9SMt0zKmyloc
         S11acJIImcYBwR7hLjmcbVcaeovQk5iqMKVbOU48UenajoliOBcGmkUOhmc29qoZEf0I
         GSnXzlFYfhhH6gEzU7wJQLe7m2FQpePVCwLg0K0ZBg6q1NKE+gguKWDqNFs0pAb3lkwB
         bmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789079898; x=1789684698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lw0J18o8NMgLkUQr/yomujhpoAzqRd78S+D2/pgaPdk=;
        b=BRFwoNDUCXmLEWE8v6JF1RQzCzRH4d44Jb5FPk/oT2KldGDUsyykDukzEtACv9KQtj
         jyPToORgvMHFNLAzkZIXwsAHjHosnaHwBxQ1WhMXK2kMKxAQeXlz/Iu/eyAf6bYAqgj6
         OcyJearUdLJLiKfhkqf31jOgfksDREnJmMD8isOanuc7AqiUioBfaYChvJ9B7XQ7r3cv
         Y0JQ/set2ol8afzvJkuDKdsAWK7/Wp88i7Ka9dQ59SQ1lRyxatluKp4mfuawohGsYjc5
         aaIJbpjD1fGvZO6Y9imWs9xofSNCMkQfHk8uEZ1ruQTlWj4a1vatqLDntk1gYcpO/2z0
         qROA==
X-Forwarded-Encrypted: i=1; AKwUvBzynUMyMASev9SAGHqABIA2tndv11GcnbG6nz3g0xJ/eHkUA2YwYwe+MmEFUFcYn266pDbicoVtEh4szDI=@vger.kernel.org
X-Gm-Message-State: AFuF++kacgwi8jLRt5k44WORkN95gCDyLlQLWdXv/FORjBvSWzdM6Wp0
	E4+a3/emHeUkL3SwCJGtnJfLKhPjU3tDVY+9nPwQx1JHY3dLR1lPO9g=
X-Gm-Gg: AYBFou3h5GmxbUAMsbnaIaInm0Plw4i3oe8eZ04sude2W8F3svzHmfSxFKg5vcFDz3K
	VD54a31m12GSB7Qk+cWbi8QGwTljXGFEErV+DTI87BIiI/l+JyiD7uhQrMPeD8R5lP1KmLBHk5R
	+U2g6yuhZ6tWaQRm/ttTHC4S/ev9onUMYfGC9FtjAet6ixgndMac2C7TxiJr6Dz0YAscOwdAiCr
	jNZhDONtfMh1aAzcGKNttCZacZxPCYgDv43zjvPape1RS2tVuV6wcO8A9W+6yXLYo/8lNfhvIAX
	oNJkheTnAKnDjEDkzfZ+5kzxCt++ecEONAJGc8ASquiiSovDptyPim7KZ8eO48XqXGQjbt7sdcJ
	+9bRAP/LszgUyQHXAxWlUhfe9fxtigU3LDDbUDRbweFRHUfrpuq7z/KkxuAHbXhi5L3U5IGzeZO
	JoRYufaTAnwRq3gm245r+Z2nA+W4IpRG1ISGLaqCcgAwmrvQbhtUwJZ/GHAcUw5zALJIUL2sc/W
	yxVMVaElmX7bL7N2AIHZ+chzAJz531BAHf84YJVhpkay9SNMLbZmBFUWscsGaLw4p12Rpl4V40+
	2NQ3pviFE5SGH41LsYIF9CXV0cJ6E7M0mw==
X-Received: by 2002:a05:620a:28c4:b0:939:518d:7f6e with SMTP id af79cd13be357-939ea137501mr198587685a.22.1789079893180;
        Thu, 10 Sep 2026 15:38:13 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e803dc90sm90487685a.17.2026.09.10.15.38.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 15:38:12 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/panel: simple: Clean up resources on DSI attach failure
Date: Thu, 10 Sep 2026 18:38:03 -0400
Message-ID: <20260910223803.8552-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If mipi_dsi_attach() fails after panel_simple_probe() succeeds, only the
panel registration is undone, leaving runtime PM enabled and an optional
DDC adapter reference unreleased.

Call panel_simple_remove() to unwind the common probe resources as well.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 210fcd9d9cf1 ("drm/panel: Add support for Panasonic VVX10F004B0")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c95964ba25a9..767068de6816 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -6552,11 +6552,8 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = desc->lanes;
 
 	err = mipi_dsi_attach(dsi);
-	if (err) {
-		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
-
-		drm_panel_remove(&panel->base);
-	}
+	if (err)
+		panel_simple_remove(&dsi->dev);
 
 	return err;
 }
-- 
2.50.1
