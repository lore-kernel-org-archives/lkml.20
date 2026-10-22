Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699971;
	b=DnXa4FMcdq0r1HFLm9/pv5HMRx47Z9foNUQ2cZzsYzYZCCO3J0XPJr1ycJYmO/5IO2gK
	 CIYqD9Szl2pKN4NEu49oSh59PGi0MC8ztt/016/QgNeWao1YrBGLYj5JEpKwc5NHNUszj
	 HYKaU2pS/jDlZYn81IPTy4sor3b8jq5fF4DwkKawHR7Amm7h3mGC56GlJy2fETR++S4q1
	 Q62nBIlHRs+4nlmNGNwNOUHyr0H0w6+iguvImKZZ/ZLdWd21xj03GXay0WxkqTT73tDOn
	 4DCQm/LyAWptOmysQdAvrrZBxdKMdqk6aMiPcuAQ3G+K0oGbVjvlzSvD2hFgU1YsZhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
	b=Fn3hN4iUQ6wsKRASu4gVCTMKR97Bq5g9C7k3JJZ9Wp8MykohGacFymkeU3tal1FFSGVb
	 lQya9WDvxVRw5E8KW3TuVNp1MzGB+h5uWxqnpD+ZKwxUVF4Gdiv49Bn8VS8JzNk0ZkP2c
	 h8KAxhH7A9i/YpYfq2EW6qlm1yeRh2Ro3R4eY68YGvaxeF5+74fnWkrRBgye67U6FaEvS
	 moEUVQKM1jb5xtNjRj7pGqy4owEaNqoumcgn2s2YR5qlXPMTUyf8Y7kAIFN5fNnWow5cN
	 vsJkAEOu4fEka7UVtEWksEyyhNAP+TuoGcTsjAlOUTzaican7CrxdSj5sQ1gxjoRUBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oY1rofo8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917B606A326
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D917B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=oY1rofo8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so1673885e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699969; x=1793304769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=oY1rofo8bPhZgD1egCQmzaRGjpNus05pVJK0Mz4J1ev9AuX5fAfX6pdO9ZeULkrkSn
         BYVRqswmd52nQ0YSK6dOQfnO6mPYSZQyMFdc+zTYAivlztPB50+xj30yqgXKsW3pxuwb
         1bdkobyeQz/rOY7WkV2ZLOxYyWkeIASZ6aMneO1sAn1N5Ubh+Oc2ntZMGB5wA5WHaCsh
         rAe2Vzxht/Omq7qOruePCur59VlMCiAJvqlKOvbT+98ezFzrYuUj0kVUkJ9EF2CRTbAt
         78+2gQ0n7S4OrSWczGQsUXqh+I4aJsHnYqgR++63wuB+gNfJc8bw24rZ67DohS30gXjy
         yXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699969; x=1793304769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=lrtsVxLYq4vGTH5quoZ4nj6tjASMmN+ePKB5Q/bZ5fDsdtTSvxqAQ1lhZe2XnaRDbU
         6pMc1WlVUx7zS+zvQR7UXHH5mSSOk0ngBxJc7P1zdnSh/USfd9SJ46KsIZ+JVr36XADJ
         UIQpcMmQxlGrljEoW4qF4iIH/aJk7uyat1H0bqirLLWH/iApCY5BExE2DaxIod1sNHYz
         af6IJkG5ZOozux3+vigMhvAg5pa2LYLXfYQFr3LkdqPX9/znhzbmZM7S9IhlSZJ+EopB
         IlT8MSLl1lCsElglnpou7sJgG2zTMChQIs4j6rFcL0UJj6+Hh4AM2yXHVw1Oa0nPx2aV
         9Dng==
X-Forwarded-Encrypted: i=1; AKwUvByJJ2gdAycqpSFzT++RKyc02apvcf0xd5hGlfJJBk9AZ8YY6Qj0Omhku1kNgrohfWTuT8nXZb1dCZOiHwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCNh1cyO7RDX8dZZG00GeDBYsUXwwzHcb5fCnQ5QpaThpfs/wj
	iMjpdjDVjwHzZQMgw5OX9+FDIgATaDqGXErgEfvbWF5xicMtKLE+QIFrsAieURI90lM=
X-Gm-Gg: AYBFou1YGI4Jy6DCv6SToubRswJo57op3NtX1ECZvUww5wmWxHGVopEXslc6yF1UeWs
	fwyExv4+SB7F+4Zu2pUEH6cLEdgL9vWFOlDwLBWD7u0bownAYdcMJkPDXiHY6wb/cOMUc/eIdTN
	NxvN1GmgzYgdjp/uLGysJbkpWUEiUJeFyhTiEvYCER523g1A2HgyNZZm3WMX0QIYy6YaIX8u1bU
	rRL/5ZIaYXQam6P1ZKGfB0E3NA0s8Zca8Uo5j2Qp2WigoJZqQBXJZM/8g7KRdUyPb6ewulF551V
	gRgMTmfAs7+M7AnEr33ZQ+otIeX2+g6y0HL2yDNmSD54iIkaSUeDIrSl3FyygWnCaGPCpj7gYYe
	sIajN4UYjSMlNLQBKCoxl/yCMPwAkU289zJAR4BHqlsulvZpCpzW2VTJ2Z7ePwHpUykkiK2wb/n
	+SD+ToHbif4DBXlPP9u265vXgYmYpbL8jg11ksBN/1I5eszbQEGKZgAcV40zgKEA82yQi+f22IP
	KfQauofghjWCsQV2aKUfWv1xkIicRlryOUApVSFdekIKhiMJk7hc+ovY1CMv7NkdE/C1/+TF2tT
	QL2ykJb8r+vfrRetgPQ0mo680O8gC+njs0ROMdVej5t4q8xHkQcEGF3fIrZZdn0=
X-Received: by 2002:a05:600c:1c1b:b0:4a1:e11f:b2d5 with SMTP id 5b1f17b1804b1-4a211c7870cmr2773875e9.2.1792699969349;
        Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:34 +0200
Subject: [PATCH 3/3] clk: meson: s4: fix ENCP clock selection
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
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-3-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0

