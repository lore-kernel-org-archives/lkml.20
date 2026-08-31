Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6864B2CCC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191735; cv=none; b=DJu2Pbdp0f1lcVwS4QhNcx0NBy678olH1SEeIoLTxfymUwFbrKirV9vinGzJB1JAt2jMr89JVqmLYO07LnLdULLnD0G7ZpRqnAfrgAqFg7bOCKp9xNUIICQ6ySdljfVQZ9GMQ12V8AssIkX8nPa5sk1AQI4LKV/Bq4s52/nIxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191735; c=relaxed/simple;
	bh=QKJUweDWl1eKJLRIxMGBTMDa4jR2KLLIxTXKyTzBC5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmLjtxf3srncA8tRUI1lKE+PGwvlFAXcJfB3NbEzoySErAUykL6AiOpunXuF0sYuMBM7Zu49aVDvoFIGpouZcPEReKJxhax/Eafiq0DkS0ywxQEdPihN8jZTAvsBd2YXzQ96adxIuNzk+/lVBI2yQ2AjDJQdBY/OCce0+pbFxPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFNqDfvm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFNqDfvm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48433fad54aso1097932f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191731; x=1788796531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2x78xUJ0YRw0EVGMKYL0iQj1+Dct+8QGumz4+LqlKTg=;
        b=KFNqDfvmnMNwQ7XPnqdFUcb94kFw9oISuOznRbF9qsF6INKGlsqXCnDSvadc0l7GA7
         UsRwi3FRW1NcTWM8jfhlbdQrTdII43E1YrAeQNTFhvtfXfmWiqZhCJp8U2ZaX8DTQhsZ
         j1wIdT8WxgiBrcz1V3kkcI4qWWArS3rb0IzxBIec0v6v327AJFzfz2XiQNp2vpP7tY7r
         LlwbqZX/2ZzbQofM44FHGWwKv/8aY2/YRwB3G2DunZp39HzFExSM76zSb9k1jEdCEQC2
         +IbbciEsFnYoDCB/5PkZTsegPtYXdJ4srpZQIFA/TILTWUTDcKt2uJcSooPl/sfb5Snm
         gBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191731; x=1788796531;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2x78xUJ0YRw0EVGMKYL0iQj1+Dct+8QGumz4+LqlKTg=;
        b=SHl1ikbE10s7WglUReOd8HY4b9grthMDr8bnhceLFYEXmRKv95BE2qxAQVpGxs7Oyw
         Kxi7EI03PbUuNvnR6WEhqM2tumGHJib2/lCgqONTWP805KgOTuDIFDFHbZAwzRVjN7sn
         tTnQwi9yJYKckj9eAIHbRvYMCsNf37LJFzemSnLDxXre6dyERr/0tGXki+rohgZaUOm7
         amf9ihCCeTRUhsYH0DehdxZ3mxZPySHoqR+YNe4j4rvD2zUXvpIvP0GPtA22XB2mFK6R
         6DpYSbkQww2Ew9IFhvQ+30OQHZ/l0SAb1jCGB/ym9k+7U1coDiVOQadCFBtOOeFYZUfQ
         YAng==
X-Forwarded-Encrypted: i=1; AKwUvBw7eQYGicoNB3AcG92VKUUUFwNLR2GQ8Jm/M2aFAH9qPnCNQ15KGwU/x/izXDkcteWeWIOJrwwbPcwnxXY=@vger.kernel.org
X-Gm-Message-State: AFuF++kZvZ9b1yoC6m/RWpvBrhGHgPcMY3c6L0Ubq6qLVZwrwuKtUZOG
	UiPEtrtgImBXXSxXs5eN6O7Oj55bPeglnZKcQDQAfOXeX9a5vVaLBXPFzgKnW7HFgGo=
X-Gm-Gg: AYBFou1uyMmbeNYCS2vY/RrIecvgYTaYRpK9TR9enzM6aFX645akKoFOsPNglC6xDIg
	N1G6AzvoEpj1bq4zcFoF2yoQ6J+MzoKywnIXaOsFav+oeu9KGmutmrrNOg4hBAHLEaSp/j2Mmrs
	ThEzSaOy+luMHTW4F+ZJ3WZuCYYR3skgnAwyEVdefnIk7urP2OTmex4copbrSGoU5zglMlUuvpy
	I3O3WCoXCqTrdILvo10tG6Ffg3PIxGPse1aKj4RgdIQfBSF+HF6eFK2seWentKwU1AndjO20TFj
	GGilpdyDJpUJ1QuP2352Q1kBKuywmv/c/deKqtUbZsfRWgdpbs1cn/fiEadj6xnT3YO0a+8WY2A
	tlcule2++piOnvG/+8LqaMF0amyVLDZOkeMgAVFwI80/oZM6RhWxo0J7QDVBfveyTQB9+xGVmbU
	Ys8O+J3INhD8u/hEUr5nLAH5TFfy/qJKIw0w4ODrnT8/I4ONy6sS6jRnUL8bsNclYUIh4l5fj2T
	C+j150WDF33YQzvvvGJKLQj
X-Received: by 2002:adf:ec8c:0:b0:484:4164:af7f with SMTP id ffacd0b85a97d-4844164afafmr1193686f8f.16.1788191731537;
        Mon, 31 Aug 2026 08:55:31 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af3asm12949099f8f.12.2026.08.31.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:55:28 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 5/5] power: use tabs in power_supply_get_property_direct
Date: Mon, 31 Aug 2026 12:53:39 -0300
Message-ID: <20260831155339.181487-6-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831155339.181487-1-ivanrwcm25@gmail.com>
References: <20260831155339.181487-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The return statement was indented with spaces; use tabs to match
kernel coding style and silence checkpatch.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/power/supply/power_supply_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index c041806f4f9e..8f464583c5b0 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -1442,7 +1442,7 @@ EXPORT_SYMBOL_GPL(power_supply_get_property);
 int power_supply_get_property_direct(struct power_supply *psy, enum power_supply_property psp,
 				     union power_supply_propval *val)
 {
-        return __power_supply_get_property(psy, psp, val, false);
+	return __power_supply_get_property(psy, psp, val, false);
 }
 EXPORT_SYMBOL_GPL(power_supply_get_property_direct);
 
-- 
2.43.0

