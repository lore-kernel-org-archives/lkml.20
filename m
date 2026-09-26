Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0640BCAD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790421264; cv=none; b=VowSX9P+XDSkHcoaCcQjvOezkLSdZcp01AXWDCQGsWWqeUy4H6dp3/bP5dvjYGxz9cUC2W4H65IZ8b4w7dttv4sZ61+S0dEZjnlMlAth7VQGOtvI/sT8YsXb7Y9sItQOaNmBPHpl3+F5ZnRfTryEy3zwniaVW6TWeVFjMX3y8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790421264; c=relaxed/simple;
	bh=C5rGdOL88GwpoqL/WkLQBcwq5Sk60a555stIbwUZWMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fTvGsmSqsnwWiaJEGtMFquj4PvPzy3clOtEUw5IzCgAwGMxUh0e8d6gISDRr4Wb5yOZzxBfNqD4goHMxiSp9KQryyjEeYW24Il5yYTod6rNvNtluIEdrd24OOUcgnLZDmOqV2l+/UmlDWkTeIEpFkkEFUo9vF5f7py5SlmhaI5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccNczrtC; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccNczrtC"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df8bb777e4so6003085ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421263; x=1791026063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQIwLtwiv2GNar8YmdrUtxZP0jcj02NoHt6505OGaXA=;
        b=ccNczrtCgmPPSX3XXUWWBBmK+W3WLko1l1fmbu2zXAoQsC67eKIS7NQAIP3RAa5hm1
         0+jdhEGpLZ+96P3qNJojV3m/5w654rFBgJf9QdGgF4zT3kDC8TnLbFIN7tpxtyqNulVw
         kw3kFw9/e/CtngzbsO1m+djVZC9dTWNA/JDKwo4rAfsMdCWtpdM2A78OVa7Xh39QO19V
         f9sZy4o0MRN4vSDhDqWDCHUYq1yhM5MlA31Xg4GFrb4G6iIh2tfZkjuEgtE612fdcCEc
         ZjXig5oOU+tb7uDUImR19M8mb+1tC+bgH0zryDISOyjNdFjASrKJ1YDBPcy7vxe5V6DV
         D7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421263; x=1791026063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQIwLtwiv2GNar8YmdrUtxZP0jcj02NoHt6505OGaXA=;
        b=P1EnMyM8mfc4NoLHm+yAuyBzHGOOkVZwp2QFTa9kBG9uLzoD0bPCoYfX0L8HwUy9Bw
         igJCvccLYGdiUUobTqCgRv9C2+gxABRfLgDS/1cUqxbZZQp1mpqbe+eL5Yo+mtTqUIlr
         eo8iFZc39R5r2Iy7dDCRA5AxRkO2rzqkep7C/F3eybbkRpjrPGjRWLvAne7Z7ifaFEWe
         pGqt/RTX2AWMuvh4UDCO0pU4U9S6w02Rgw9XETTtbiA12izRlK7KvU8ZjbaPwr2RYE/k
         bvYjPkmHNp2nTw74qGGRXVoYU6L7vqWnTCrwCJm4+BWdxyCSc07cUPyUTg8mmZcVj/p0
         rV9A==
X-Forwarded-Encrypted: i=1; AKwUvByNOPeRP1jNZWXCB/6jpLQjbEi3XeVDvX1cDxKQ3W30Ad8t3KnPZ9pvq+6EtmUci0dSliH/9CdPB9rx0cA=@vger.kernel.org
X-Gm-Message-State: AFuF++lN9o/XeOSc2DxRBeJOTC6NH0sWR4rMp77g6zBBKki3xU0N8MOO
	IpUdjGxbbMw7bxDUwz+XS/qnrTOjSgoEzMXISWuDKmhQgWc4VwsizeNad7mEVkag
X-Gm-Gg: AYBFou3kY1YdyytXiq7NbxNYVnWBbUl2H3gS980FLnE+plLLzHmL9mS+l0qq7bVhWSk
	Ulx4i0UrwHJZpsDhIjnF4aV0lCFo8W/DYmG52LpaS9UzP5iiKUx5ODQ49lv6UlawyZS6kQOScaq
	bz7g1edGU+NWOg8C6/xqztYE+B76f/QTKmcJrSCa6gdtT7A3dbTwiKRFGyAjhfK2T5hjZZmKsDG
	WcRcPKnZWbuJww9MsAaCOm0gB2oJHAKvSGFAnGGsnyAZuOWJqXIsvAAafushe5hfKau4cV9CnU2
	mRYfu2rb1YPbK8Na3e7hilwQKP1PZihHTuP5c71hr5NuIxzck09Ete80mqeJEgYEDZdVjKVDdnE
	Abrbc3i1F47GijShXUitkKufNB+Mxz3VBIZe2epLOTE2c8V+2R54NnjsoMGDYWii3aHtCeYjsbv
	t0GYsxmc6f775eb3YQwfSdK6Xq4sh0qWU9tnVzPuvDuvRRhaO+lRWJMVzxN+PHHqvgK1q14E2Tj
	CY6A/zoyere6eDVhcqL
X-Received: by 2002:a17:903:906:b0:2df:8382:9181 with SMTP id d9443c01a7336-2df838294f7mr66998555ad.14.1790421262728;
        Sat, 26 Sep 2026 04:14:22 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:22 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:14:00 +0800
Subject: [PATCH 2/3] watchdog: mediatek: add MT7629 reset controller
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-2-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

MT7629 currently matches the MT6589 fallback, which exposes reset IDs
0 through 11. The MT7629 CONN_MCU reset is at bit 12 of the SWSYSRST
register and cannot be requested through this fallback.

Add MT7629 match data with 13 reset IDs to cover the CONN_MCU reset.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1b95392c0f78..ad5f8fee0abc 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -69,6 +69,7 @@
 #define DRV_VERSION		"1.0"
 
 #define MT6589_TOPRGU_SW_RST_NUM	12
+#define MT7629_TOPRGU_SW_RST_NUM	13
 #define MT7988_TOPRGU_SW_RST_NUM	24
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -108,6 +109,10 @@ static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt7629_data = {
+	.toprgu_sw_rst_num = MT7629_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt7986_data = {
 	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
 };
@@ -590,6 +595,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt7629-wdt", .data = &mt7629_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
 	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },

-- 
2.55.0

