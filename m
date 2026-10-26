Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010123;
	b=4yM/VKI8SCulrSVgfdqMddQ6U2euXCFoyWIO+8oGcvUQQ7cYMzH/BhbYm0Kp3XlaOE0k
	 oqnWD5z/pWdEMdKAvy17c15IBVyaGRj55rcVCTTaqWKURj9t+N14bu7EEd3mZbm+lS9zj
	 ytDdXOJV5eZK8yGBreLdFQtaPmcfHOZgk3jA2qxDhYMUqZjSSdwcSMtbekukEoDCKb6vy
	 /upnsDXad3/VOMTlPMSGCQzTR+9g645fKaAgdHbnFKFW+r18dULdMJFpJQdsjsYMjBhAs
	 g2FeXY+kflQ5O2CsQJlyQlBYQ8VDwso40fV1cdh0Vx4wA8lOi+HNiqg/aP8MX1uMmjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
	b=pqmZIWAOFQIUaEKw6XueFmOi0/+4t9AcC7gBBCp+UlLkNgBSN3c7eiEr0Eo71xz3HIjO
	 tGGER44lSMhkui8FYZ0nKt/c+x+UFa0NSH347/P1WmKpQj2RNLViEBO2tuo4Bmw1oo9xC
	 HbwL+kNzgmmA//cKcyLvhPEH84f+WHcJ3JjjNH3RpW5o1lCM5NMgoVHD6PvwczaW5HqMs
	 8K1B4d42dsc6Rc9Vp5IiVnydztpbg/h8r6eTa7hXxLNbBOjB6/KV4lt/wWvBuMhYwC6Cl
	 MS9tdcGuJWKPFk/1LYO8FBCkSgIOw68IlE6w+iGbRDibTT4yMGMS7e+Eviur9XoG4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=epHsHRrR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA972606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA972606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=epHsHRrR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso28531905e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010121; x=1793614921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=epHsHRrR8/hmeF2wr+cmt9qhWoqEkZ1CMgUbwk/MnyKYJqP8qKurKP+o/4atOs4UW1
         EJmH1OcLpSRd5duXo7dazvYHTfmd8gwuy36g73vqfA67vMnAOq0+k1zc7gFFKx1ODIlz
         KaXWjZErAXtxuqgLGMcO5BF6nx6b31J7+EUl4giMzY9wJE8fr4WDoV0yIQzhR2Ngw2Ki
         E53reSsyOafeBU+dXft9Ymbi0OOI3wcnQ9B44AQFUEjY5VEdsWwYGXqpmpBebnjHI688
         qUvm7gOP0XfX73+PPKy2hSJO7Z+1cTOw20+kqkauYMWAUcDszabSzDkfbBIJgxE+K1i0
         F8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010121; x=1793614921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=Wrig42SNUAhrO+4Si7cw9zh8p72UMDB9csWIrAr9G0BCrfxqXtWPw9QhJzPgIMuFqZ
         lq8mXnMnDViuEt9rVCrYKlPImiaFBAq3P5xvFt2AFc5UlkZEWZy8+MVa0Uv7LlilaCzw
         nWHliyI/RaO3q271TZUcdLUz8J/u/2d/5AxpTXbgO2EGKtQnQoiFnWjGf2xQr1i+3pJL
         29Y4CXJUdmEWRYH+SBnNtEGqrhQfOA051BI9TJBVwrXlLGDLd0ui6ysHrKLwpb5o6d7e
         PbqDSebM6qj4IkDUqYLkppog6EnaWGw7njTx6Hmr5GLcadXQSTr8vjNiDspa5bzWcakl
         n5vg==
X-Forwarded-Encrypted: i=1; AKwUvBwharva6Rr5Hh0Mxu5tdfudiUBmx77GOWlgOwTQJCmil69+H4JzQcyj9+GrNm9qK1+R/1yG/GI6aMa9HKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJo+2yvlTu2Q8NIA5aRV6wMY3L0sh+ZliGbLCmhyhIc7L5OhigN
	gOu1r979K/aM7sri8PsTuEFIHI7UfCfFiiyOxftwBeQmERYJZX1RC/KI
X-Gm-Gg: AYBFou3Pa3z9laX1aKU1s0JBmuMOf5WNa27N+5fEUeC/lDcVTqQOSZE9UZ2u136NMOP
	pQd8cuCIxpEELaeb/JzxfmjqlgZNvZaTudciL8NbjJsOAMupWBd+/nbvRTCSk/Uq6RrvaAwq3JM
	7NF4ZNIbVJAo/ds6i5MrzhUq+6T1aFvManZvdZQAlECFOt92GNBptrNaHGPDvHrl54DeV4gWVA7
	AKA0VqkcCD861tHIazAFKHjc2X9pN2lYXd7A+AVPCmdsGpPkX0ttxFEgrjGqIzJQ49JVgTfvZHu
	9p6e9V80uVvzXp3v8C3MQDCiLdQsDXpZbNYPilE4bVHMi4ThkNcXapxikEh7H/9CGlAXnnbbAIJ
	6aphOEHk3suvHVAGwgF2UfjpJf8NSGkzV+m5x+arnz5G50J4Zm7ribHtjW2XBlLohqEcrqw8C9E
	QQOci9I0qn6nrL0SmTLSFNbsDmqqbS+TfLQ2FMSrK9wEwz6Ner7sE9so5CI0/kSG4TlfO3DCJ++
	8xGIXb6wJnLcnOR3F57pL5ZOxoqurk2DBQC/lU3dZ4FMRaVaolS9Prwly4SV+hXpLmVFtneRb4d
	TWF0QjEJOcXjb7l4lSTjhJ8O1gDT8iLRHMLsE6EU47QmYqwYjkaFMIL9ANaN
X-Received: by 2002:a05:600c:a106:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4a35aea23edmr84243625e9.9.1793010121069;
        Mon, 26 Oct 2026 03:22:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm16762876f8f.18.2026.10.26.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:22:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Mon, 26 Oct 2026 11:21:37 +0100
Message-ID: <20261026102138.36786-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026102138.36786-1-ansuelsmth@gmail.com>
References: <20261026102138.36786-1-ansuelsmth@gmail.com>
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

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0

