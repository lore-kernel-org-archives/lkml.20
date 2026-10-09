Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D835C6B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 23:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791589851; cv=none; b=Q6tzCJNPtr31uN0ApGzjGoEpJ2PhySAfaZ/Y7WMJRQeIhyRRCXay8cnikLQ5sHNJLY5JmlpBw7csq91Pgv/UfYYCbDzE4pjKoLYO8+6lfB4PLPS0DNcnb5hZtLDbR1J3/E2v1GbsVrASMh7m32aaH9H2DwUpzGWekdkaEPVmyvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791589851; c=relaxed/simple;
	bh=GjMR54TbZ/8WfIWnmhyEvLan6Mhw1zse8sqJW7ewiDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oi75U6RxC1CRDYePd6XzJVtcPT4zQ3ko2uPbfZ7+PyKBud3kqg4eKIC4xsab3UB92xXlxljzMgooZd7PCOwww9A11uiKldtsF8YTlYUTnTQwXs2wDO3ZLK/Dt8H1M1nPpZKtlFQCU7FVvbQo7PB4OjmWzy45ayH9oCc10GEhMC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2iZiHsl; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2iZiHsl"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso56851a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 16:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791589849; x=1792194649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o03daM7+t5eI5rI8Xu7b7WsUdFV31fx6hSpjs/Fu/WY=;
        b=Q2iZiHslu1ktsbad7uXoMXrn6xtj452Ncc388wnLwTGoB0AVhnXQmVAjIEJhM0lI3t
         AfoMGbQTbGY37sOJXQfJGI+tWoidiPATovayXim1KrK5ZMUKQEaG6GAauVXrxZbRkykK
         tDLPvUJTXHd1VEwXvh6roOmtEhod2j7EGwiRY/qgbHTXZ0ZxC6jBioXcXykcf5xIGeg5
         l0gk8jscAwPwNCOxfw7dGHsSw9etyuu45MX1Wsr1CZ4bM9S8c2P1Juof3n8169dwh9MW
         PRd6rWHKRtETVPHKvlgJwJVhfVTILQrFm0o0F/n3Cw58YTV8zuzLxgTiBcYO1Jq8UBd+
         v3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791589849; x=1792194649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o03daM7+t5eI5rI8Xu7b7WsUdFV31fx6hSpjs/Fu/WY=;
        b=Z1w3UT1SLOcfyRcRnFpxNzoWeLVpjtQuuOT12wvCNxlSZaEtoR1QJOaa3tZuMUNI4i
         OtObF8fl2H1SHI/USp8D3WGvIZSkCnjHs9+7OwM8NpGyIZ0ypd8X9Qi59pogwzl5esvE
         BGUA8Tf75GxmMsWSf3bb7n1cBZiUWia/+j/vFKajvOiMi4W++spfFBYSBgkwO/QLvWbn
         LSiGJVWhA5qQLnl5JOHGDOeUFuL+Z9wesizEedMavo9RX32TEG07XLXpxIoYL5DhaKDc
         q8Kq2+/Rs1eBiC8FvXmAiAw6/NTeZI0hrIgFHbUYzHcRzZ6eYUrN1NQVA4xyJXWDYBJs
         cOyA==
X-Forwarded-Encrypted: i=1; AKwUvBxfGIVz4yocC1KMixdZ/OFd9wFhxS6LFqtvCYcsU9LC3k/hRmwzlyvMhvHjmT2ggUXNLJFsxY4IKStnQIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ05Rn4/TqsO/xNiMq2WdTM4IgE9BOMcg9YxL4Cr/Ww61z8X2V5
	H3WfaWUInx6zO5doWQpip36u55jXLjxdEjtuX52ASaWVhSvEir5yDZ8U
X-Gm-Gg: AYBFou2F9rtBeHHgumQDJ7eht1a7gZVTg2MgKA+I3kF8x540T3S5ifkg5CMenf987+5
	6DIlCVa1BmgBKbEDKfhHrSXjnn4nxgRj2egeJ1h8KJjJv2juPBwSZ30Qh5QoqRpYXv0Jsv1DVL4
	okv4Jidw4W+yzB7Sybx/vRayORRe+rzPQ7uya5PRBeqBcx0QcbIIi2ebGcx1LyuVh+vhe46RJhD
	ahxngN8EkpqEaTNWRUYTOo5xqtKaHQdv9Mlh0oVr0/0oz/bDu5WQ6O88SA7Gbbhs0Wo69nRg7DK
	urcwc/dUp86WM4z3yNigtC01K5nM2VW0w+etGh/SZBKjxZWL3U4wlMuf69NAQgPb+1MYuMbsbO1
	9Upu7WqB8GPikKsTSiB3AMihPWMJiY9Oab3Oude2Cfs1G5XSu2yhnI33XwuulWJ5CEpgRnM+vPd
	KQ15pA7AI0IVeC+ucMwPygXdiaB+DVafj9+qws2wUlGMQReVbiVBdzMnJXoZ1Wv/y8JH8bzQS/z
	R3eJe7u9QR9aEwioBga8f91cNQ=
X-Received: by 2002:a17:90a:e09:b0:3ab:3d8e:f29 with SMTP id 98e67ed59e1d1-3ab3d8e36e0mr1785522a91.46.1791589849536;
        Fri, 09 Oct 2026 16:50:49 -0700 (PDT)
Received: from liu-logos (KD106129078135.au-net.ne.jp. [106.129.78.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d58bd0sm3363186a91.0.2026.10.09.16.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:50:48 -0700 (PDT)
From: takanashi-tetsuya <isenasakujp@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel: quirks: Fix minimum backlight on MECHREVO GM5HG7A
Date: Sat, 10 Oct 2026 08:50:40 +0900
Message-ID: <20261009235040.8059-1-isenasakujp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MECHREVO Yilong15Pro Series GM5HG7A with a BOE NE153QDM-NZ1
panel has an excessively high minimum screen brightness under Linux.
The lowest brightness setting remains visibly brighter than it does
under Windows.

Add a panel backlight quirk to override the minimum brightness to zero,
scoped to the specific DMI product name and BOE EDID identity.

Tested on a GM5HG7A running Ubuntu kernel 7.3.0-9-generic. With the
quirk applied, the backlight can be dimmed further while the image
remains visible. The AMDGPU driver confirms the override with:

    Applying panel backlight quirk, min_brightness: 0

The quirk and commit description were prepared with ChatGPT assistance.
The submitter reviewed the change and tested the module on hardware.

Assisted-by: LLM
Signed-off-by: takanashi-tetsuya <isenasakujp@gmail.com>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index e417c75..96d85d7 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -29,6 +29,16 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x08df),
 		.quirk = { .force_pwm = true, },
 	},
+	/* MECHREVO Yilong15Pro GM5HG7A with BOE NE153QDM-NZ1 panel */
+	{
+		.dmi_match.field = DMI_SYS_VENDOR,
+		.dmi_match.value = "MECHREVO",
+		.dmi_match_other.field = DMI_PRODUCT_NAME,
+		.dmi_match_other.value = "Yilong15Pro Series GM5HG7A",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0c8e),
+		.ident.name = "NE153QDM-NZ1",
+		.quirk = { .min_brightness = 1, },
+	},
 	/* 13 inch matte panel */
 	{
 		.dmi_match.field = DMI_BOARD_VENDOR,
-- 
2.55.0

