Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084B65237A1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812681; cv=none; b=SE2PM5dWRv/9DIbtqSEF3z0UO3zaBfzzDLkS8Y6jdfxbh1T4NSbM1BsJbENRHluNzMOLQjWT06OatX1pEPHQXqZb8vfO+5/sJldi5oQCmYa0dpiNjf5a00kQoqdluy6omHG2FNznbLPv2IpkN61d1iEgLV6yL8H7Fg3X8Xs3Qzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812681; c=relaxed/simple;
	bh=X7JWu3hTwfda0G3LTzUQurk3pgnp/SDAW7/OksBAMEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGk3Q4FTWI/9RQIgOX0ehwtXumtBva2ay80PDqU5sqcNMIRJ6ivP9007RYETi9Cm621Pud2xiIYGywNVkAzH5P6NXtY4zYlSFWaKuZ/Wd0kZnbhDBzzHSaDkuRe+TZ2XPzjQW83tXDdOm6JN8jic0qqBrqy/gjBakLoV0GFVY68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGxaOH1M; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGxaOH1M"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso4818651a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788812679; x=1789417479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46QVQzG8H4ax30pO+Grvw+jZNC8ZuaIYSYVcUb0/Mh0=;
        b=KGxaOH1MKR625PM09u9t97+zYt1YeA16FSSUVoN/otUoZwCNfVw8rGN4tlurmSPwog
         p8GEwYA6/m//0zRpEzoH6KR5KFlQ0CBhFldodwR3lhPJ3IEa2WbxnV4UTXMDDmGlBgci
         v6TOsNOB3r2VYBUkuBY2Lb7hejcGWWhrgclbcA6W8odrGaGHPlJcekGvjWunSb3370WX
         hiUW1NkIyl2obCGAFmQhk1gQFJqnugg7SetNbfsGTX1QA6E1PHIon4pvTuSZwqbfbQJe
         djEeF9iVJHkTYpGSCAlGo3PCthb4qCCdamFhxpC3QrcfiFxmoFxmUKXkeGYXt6jQQuCc
         JuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812679; x=1789417479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46QVQzG8H4ax30pO+Grvw+jZNC8ZuaIYSYVcUb0/Mh0=;
        b=MH42d36CMF03jA2AEwJiWiAI0+dOdI+vV1HN1QKtt+UQTlJVXvzard9gbmMSm07v+S
         dAEniaLLXa809gpkYgIDEPrz+frMh4Krv0hik8iybT9p19DMhz43h68aCZ3va9AUcyCp
         l+JZLvWJqT4HFbDzg0Yrkcu2ybUb9Tx0mYmR5wmRDhdJ8dmWedNT3I5JZJCXufv4dJl/
         p4wJivmPjB/ydEuNQZLXuh2ph09ebnKj3M+4HBYvMbN0e1qTx9sVYaAarDYimamt+h53
         PvoEHPPdggr02y7YlO5d8AoQ5Y6b362e6sZh9l8ktzaulaHKWPDHFCnKoUyPDGWEC/Pn
         sqKw==
X-Forwarded-Encrypted: i=1; AKwUvBymJpIQfpIibj3P0t2imEvWzqZerebl9Mv+ZVpUfyqSV610Ax3327Gmi8zg9R5FuWVbvz3391gVZS8uSYc=@vger.kernel.org
X-Gm-Message-State: AFuF++n0OEitdlKNFLEcYMSVGEks4+V3l1Qg4J+bc6Pht9PiElUggMWU
	XGYjXYHgp7GZgK9JLWgksV2QDDyPvIdLVlQdT+u6olnJNM47R6QQSxZd
X-Gm-Gg: AYBFou2/q6IXiGhl4fKPAxqYY66Xwf0SNfV2W0rtur05OIzLfP7A+8PP0Fi86tmFK9E
	KKhO0m7xrewcnfDognvPloy/chltBRuQdgQbmI1q/4iMLUagsJWXaLMSjDetr0+pyZwzSNxn3Hn
	0EnvvYY8BQKMr3yZ2L6HKeK7aEPS9lHxhfRBldhhf/k6rvsPKZZumpNaBEm5saaD+dXQ/1fXUPU
	CIC5Vlz62SM60lmNn2kzLmoCz72IAzV04C9UKnbOsZCW0HIK96cm4noxqp7+PduwFb/pfEFzre8
	7+nrtx+E/x1mjjZbYlPgkAaM13vTuRNseG1HQrOa2iv5qbJzEn6e8y4kqWhhW1kWxwSQ0Xb5sw8
	G5SnmLlMyIVKh6jgoks9jgfS7ny9jJ6n2lHCbxaG7ma9zulIUyyc5aNvmufKeqSyki8ZtwymujB
	/LI9IlXfJid0ws3SyMVXHE3+JuMz80Sg/vD3p3Va0lbjcjEfBgAX0llbPDWRqSU4kg6YbjnM41v
	jRVp3MLCaTpPz0VYcv+Oymf00qILkawi3EH+mWNxQwrAtP4tARIXq7Jc2tFgeJYyUpP2TBuxTUV
	Omac/pDflEUDTo/4ogpmaKHpLcgQAbnLzpeYFg==
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr39079278a91.13.1788812678990;
        Mon, 07 Sep 2026 13:24:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm33702487a91.14.2026.09.07.13.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: syscon: Use device property API
Date: Mon,  7 Sep 2026 13:24:36 -0700
Message-ID: <20260907202436.42304-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the DT-specific of_property_read_u32() calls and the
dev_of_node()/of_fwnode_handle() roundtrip with their
device/fwnode equivalents. Behaviour is unchanged for device
tree: device_property_read_u32() and dev_fwnode() operate on the
same node, and the fallback from "reg" to "offset" is preserved.

Use dev_fwnode() for init_data.fwnode; unlike a child node from
a scoped iterator, the platform device's own node is held by the
driver core for the device lifetime.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/leds-syscon.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index d633ad519d0c..741850f35f19 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -56,7 +56,6 @@ static int syscon_led_probe(struct platform_device *pdev)
 {
 	struct led_init_data init_data = {};
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev_of_node(dev);
 	struct device *parent;
 	struct regmap *map;
 	struct syscon_led *sled;
@@ -81,13 +80,13 @@ static int syscon_led_probe(struct platform_device *pdev)
 
 	sled->map = map;
 
-	if (of_property_read_u32(np, "reg", &sled->offset) &&
-	    of_property_read_u32(np, "offset", &sled->offset))
+	if (device_property_read_u32(dev, "reg", &sled->offset) &&
+	    device_property_read_u32(dev, "offset", &sled->offset))
 		return -EINVAL;
-	if (of_property_read_u32(np, "mask", &sled->mask))
+	if (device_property_read_u32(dev, "mask", &sled->mask))
 		return -EINVAL;
 
-	init_data.fwnode = of_fwnode_handle(np);
+	init_data.fwnode = dev_fwnode(dev);
 
 	state = led_init_default_state_get(init_data.fwnode);
 	switch (state) {
-- 
2.55.0

