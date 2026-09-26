Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A31E7660
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386410; cv=none; b=FUIL9mmGjB+mlX2J3IoDTHLGgJxvLQSxlIOHvvsmGOsfUFGMAzu2F8WnH2aESZrjXtabhRcR93C+IkVK6kzfE+5HkVmGAUiWS4Ob2eBV16NMv74clUY7D2JNOjxeZkMuLM1JJZASLI8HK+zFNEdKFVjuw02G7jsaMPn47B00JvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386410; c=relaxed/simple;
	bh=1f1mz/u1DXLFELJxB0lWigtpTDzng/wOa0yeqTZVdUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Srj80L3r1F9k4zS4ozbJ5GCNWK0lvgl8x/gBatB5PRf/tVloA0m5SNxXb1eyNxK9xgeqJ4djXPtaWTxjrB3Y1oqcyfAOf1zu3S+WRtbDWGWeWJaYsVqCyk/E8+uRgs3ZjjfRDc2xOiybUYUnwYMfjvW4la9BLn1NixlAEvMqxto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULdY1+xs; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULdY1+xs"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso9223075ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386408; x=1790991208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO5IQrDqXhCVEXobXwqmnVmb7P8gC0TesjStAXIcO2g=;
        b=ULdY1+xsnz/tq00tmvNx6qoyew18D1cJcNxiL4bmI7C4hbENDIwiiGFq/bdTGk0abV
         hHLWEWiNQ0wd/wm85I1Y3sPfiMk0K0K1Q8IlN80TvxpERd8+PutKTTbU1w1q4G0yNJdj
         CuMv2fNGxwo4ZBWniUqKGVrLaRX9yUvBKW2EIQqUxzL66aBGmy7glZQqStFDk1d5ea16
         a4DqnpivnP9JhhRe1d6OHMDyCToviItvixla+LzPAR6iUPXmWleyNJaLb2FU1noFiit5
         wpn5C3vziWs9dFTOY3i8BVZIfLbLMeosiZw6FKYlO4c4kD40skl5z0/v/2mFKQ/j6HGb
         EEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386408; x=1790991208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO5IQrDqXhCVEXobXwqmnVmb7P8gC0TesjStAXIcO2g=;
        b=GS3HMY+TiUJlvuF1fMrhjAhURbYNodQ/XKQysh1G3B/Sd183qqjloBW+HuCanUdCIO
         xipqoTOKciWGMqVYgFiZzHB7AcmUhvKXTDGLQ4qEJODgg343xPgvzfj5hMIg2+BWIqhO
         eZpuc+8VLDPb/6LJ/0qznCO1ByGdG71fMrfU96SGHQScL/4ZsORDxYzvQXfD2dsaFivy
         RoKH9ckNiHLxJdBR+BCpGYVJoTDoOmlYW6ndbJNJ5iP7UfC+KFJCr5TSMrHHmALTnYLK
         JlDbD7n00duaAqGBXaQEhkS0CzNWdAIx0BRAJmfMw7XB3+tUCtbiTk1u3fXsrf3oXQEL
         eqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/MLCxe1i7lULH2/5ccJjDhgGXfPisnhHT99wrXiPRq8dFjcA+yY8fGnMAKTYS/fQxvhRuJv879uxc9mE=@vger.kernel.org
X-Gm-Message-State: AFuF++nPVycKxVLa6g09LXyXeXAOeHV3fGHwfVwMD2VsQI4KZ4F0pAzx
	/SUH6h3ZbFAzMbpGacBylPPmX531JfOoqlEniIn9y2li/svCc3WL8UCI
X-Gm-Gg: AYBFou37a1klj3qkq0kyw1KvUi3psazvDO8d/zv+k9cp3/9JEpo/EhL+zNIF5Fq3lfJ
	BnH3jAm3oLNghhYtzsNeNKTyVVz5lMTqi24GIgS6TBV/9YT2xuAu8vYeXgOPLSICBK/T4WgTi+y
	8YJyqqxdeoQJ0AHadRJyh/4pOn4xq9hkJ54y2QoberXH02bUVeNF7pjz+zIyK7dDWcXUAzn7HvA
	mKXY25aMtuL7FK+v0FycdIcwP58khzbPY4SVy3bQEcS/mkEVNnp9XryzSDzHRHKXBmFUq8ODk+0
	49hHLsC0C0E89xdkuicK+KQvEemmx2txQkTbAMR5gYh91KQM0pWVag8wQVMimCdbGUqlPn8aV0U
	snu5xeOydBNIbWQEI4MMZjuevQiCzcKPX0aMfF5ZMfdEO/Fox3MPVp29B9hZ5A4OZ/edD+nkmOX
	6n/bBCIkS7y9qhlEmJIR2Ed0UJhlG5jk4M45CwtpbClfIJ34cgWE2806qOXDVhvK59mPck9Nh5C
	nX5ERU0JvuiHlGnYRX24CTopq9padVgqgYn3Br2JyeZdSNpbOq6bR4KPVcHbu/baTtZnJgsXGQ+
	nz9Vw0rHj3kmNlYCfyewOCGArcNNmsOwiUcy2ABGlk6jC8U0Jymy9QSWBYM=
X-Received: by 2002:a17:902:cf0f:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2df7e251f3bmr42954915ad.23.1790386407959;
        Fri, 25 Sep 2026 18:33:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc39ddsm17396165ad.7.2026.09.25.18.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:33:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: mfd@lists.linux.dev
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org (open list:OMAP2+ SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] mfd: twl-core: Allocate modules with twl_private
Date: Fri, 25 Sep 2026 18:33:25 -0700
Message-ID: <20260926013325.75073-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to allocate the twl_client array together
with struct twl_private. This removes a separate devm_kcalloc() and
keeps the module data tied to the main private structure.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: Capitalize Allocate.
 v2: don't use twl_get_num_slaves().
 drivers/mfd/twl-core.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index f86df356d658..0b78fe30e047 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -159,7 +159,7 @@ struct twl_private {
 	unsigned int twl_id;
 
 	struct twl_mapping *twl_map;
-	struct twl_client *twl_modules;
+	struct twl_client twl_modules[];
 };
 
 static struct twl_private *twl_priv;
@@ -770,7 +770,9 @@ twl_probe(struct i2c_client *client)
 		goto out;
 	}
 
-	twl_priv = devm_kzalloc(&client->dev, sizeof(struct twl_private),
+	num_slaves = (id->driver_data & TWL6030_CLASS) ? 3 : 4;
+	twl_priv = devm_kzalloc(&client->dev,
+				struct_size(twl_priv, twl_modules, num_slaves),
 				GFP_KERNEL);
 	if (!twl_priv) {
 		status = -ENOMEM;
@@ -787,16 +789,6 @@ twl_probe(struct i2c_client *client)
 		twl_regmap_config = twl4030_regmap_config;
 	}
 
-	num_slaves = twl_get_num_slaves();
-	twl_priv->twl_modules = devm_kcalloc(&client->dev,
-					 num_slaves,
-					 sizeof(struct twl_client),
-					 GFP_KERNEL);
-	if (!twl_priv->twl_modules) {
-		status = -ENOMEM;
-		goto out;
-	}
-
 	for (i = 0; i < num_slaves; i++) {
 		struct twl_client *twl = &twl_priv->twl_modules[i];
 
-- 
2.55.0

