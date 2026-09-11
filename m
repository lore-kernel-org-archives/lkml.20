Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6E344F55A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125482; cv=none; b=gSyz65xILmdYcGkE20kyCpebkISDpslQ4R4vuyAdCU0Q519f/l48SDov8wEG0nK3nIQ15p7DPD5od9KyraE1Z9XuF795KPpLo0QeMQxz43l/mK6bBSdRCufwCDPDBCSJ/ZoVXrzDTqHZ+2zxl08OkqtyzylOUC5R5KxC6Wud/hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125482; c=relaxed/simple;
	bh=fDZDTRI+aWu5LN17RJSF5MWiMpzqvK3NEpOcipYYhvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVTQjKy4m1oLvPo8qH0C221XWp6jzsEV4GV36EUI5hLm4W/2NAsDBWT3lEajbBUgKzGLeqF0saBfyeZGsI3/n0DlohAyBpPqj0Wr3NEE3cGnaosr2++uX5XWKdnMRu4VSRCNrdvlKvc051xPNbe62+mYrZzxwG2H8LuEfs11jn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/tazKqH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/tazKqH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de0093c42so734131f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125466; x=1789730266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZ6D51q/BQlK7MtFm054nWG9+DWDS+0mGNHkgeO5IsQ=;
        b=r/tazKqHQZjNLTW/Un2DkbLqNpel8YAooFL77376x5Z70WVE+bmc5f1fHER86XCRD5
         NFfx9KaQu7Umg6mf8Nd+0xxGGClz7PbAIOkPSZ9GAD6dnJ28au9jixEMJw9YEBja3q9Z
         V5ptaG1XUpjKaNlH94BNqrY6u+wyuTTJDIz8OB2n040hb91aNnvix+ayb+60PeTAiGjw
         tScOrnN216Abizhx/oCAeClpuBEONmvnM2gJVDUbz5sIrAo5we5DW1cBj9xtyhDtYElc
         y7XRViZlC1ZO/tCEW84hxkbQzISNYGfvsowKyIWaIkP048rdQ4V7yYjX/VlyZpUb1i58
         gFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125466; x=1789730266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZ6D51q/BQlK7MtFm054nWG9+DWDS+0mGNHkgeO5IsQ=;
        b=Ry4ZFNC7ROI9xYGy3s3Si1+N4O52tPgYzYAF8/OEU050mkGYAMlYt/YdgU3jjPKDVl
         4G5DvpWsQ3RpvXh9Qg6TpguU77/kjo/nHMO65Qha/+8uEAxck6M8+rv/vEqvpIWV67z6
         STerbexf/6nZ/Gzy6xS0j8ryaqM/t4s5iSNCEsH/mi4Dhn9Im+7a+dAJqJCtpS7dMfQX
         H4R2baNN2fTTvYGOCg6MP2aT6ydVXFiY74hc8wsT1brAvCoW9BthiMecr2f5ZxzMCKBA
         6zv5YDsnn0WYWE6l5ltpyHNVVPJfw269x0b+4r5vqCVClv8hD3IFQaRMpnnHtxvrKaSt
         Xd1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWc+FYEemJzRRsMD1Yt2yZ6cl6z6Hk1/BzlcHY8MCxmhvUcLSkwgan6SVufFobBfNysOhuIUW/TqViXjA=@vger.kernel.org
X-Gm-Message-State: AFuF++ldeEeO3i5hrrLRiI6A9C6mR7x8YQnyIh8cHq7AbVP9OHEySEr5
	qP7mtuvaued9R7iQ1iz573VUbebUB/tv34nGicr0bjl3c3whKW2Ha+VZ
X-Gm-Gg: AYBFou16Mn7gGbPN8WSS3lAq5zPxw9V3F00mCxYJZsfocaT+do7I2c7oD8WBgxaurZv
	WIzQsNH12BUgIz/iUs6ZZCx9EZ4L5fCKhefqhmMLLsU+MKRi1KghjRRfrFuDuNr2cWp4U6lePvY
	DOTtxkrTMH7/bf/lrvkhh+FPSmLhECCRixDSe5gQpdbZJfpjjO1Z1hj5sl7pDdvu1kGFkrmn5ns
	s9gieZuQhRjVDgwlgiEj/qdxsxU+e0UC9UlKqxI9g/XJmXQIIRV2c3HKEV0YSCxg8Ms8REVJ/Du
	Ky2lgXJe/S1SGPHFFkmzJAhzGOGEnYEPz6tZmuPidxmHHt5k2Xu08slxVuP6NVq48/qbT5ZPcmj
	U4f9zt+Q4Q1uU/m5JU/xd93ubqxqFL6pAKZIFgf3bPBsrGJun6cmRcDRXpNcKeviC7o7N4lNqT8
	k4cWwMctdSLWPHFl469r51l/SyczXfnBvvm9wnpUQh328UC4FoNOnQXFWiN1DXKugyB+14ckmxc
	CC2trXZ2GL7g6FeT3kc6lj7gDEge2Wot8BN9lIuPF+xYltClFtt0WMgq3Ggvu8UAUwso8vUfG6e
	tbCYcK/83mV7EQHThYu0
X-Received: by 2002:a05:6000:18a7:b0:482:de48:c445 with SMTP id ffacd0b85a97d-486eace4fa9mr4203841f8f.11.1789125465635;
        Fri, 11 Sep 2026 04:17:45 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Fri, 11 Sep 2026 12:17:25 +0100
Message-ID: <20260911111731.3404308-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index bd86da71b0eb..7c6a4855bd8a 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -39,8 +39,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

