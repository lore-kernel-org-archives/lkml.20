Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174586;
	b=2DQtsilMTPsaJ5/M1+GKrpY6jwtFL3TevRKrnctsKKjEPT78lX5rDBFt/t68XQjvVpGF
	 O8eezoAz7tRXlDDpIdyEjiQpNjT5N8WnMdSORrieqAw5u5jKFIe81KbcFvJEtUCEFUSsz
	 iFHuNBLjRoMAtcP+9YLnezls009iSBCoQM3YfPRWX1Q9z5dDSOiIVUDLKjzSXn561zRmt
	 u4O/0YO5K+Xrgy7Va+16ComjKOva4TWvMGM8LLpsBO876pAFW6n7SNP5F47zv/4vj89g8
	 bxj+GuG9XqFQ1gHNWzs/VpQGaqigNe8HfQ1NbTtf2nPGuScsL1MZDwDqPvRtsVoS7Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174586;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=S8Pm/n09QeJ9mrcsdqqS5p/lHipZEoXnNYS0XuM2wRA=;
	b=3Z3g1BQZt94SWS4V4mGJBsiHqgZTqGQgcYaq14b1lKA5PJ6RG6b1ayrH9JXhRxa/hp4g
	 JvzT53TXYbnQHfaOcr4q8ji2WBtren4OCjbGN8l+4tUo39aCZo3Emznk+duH3jmTeT4BT
	 C/BBeYzEm8zRXG/LOX34Sxk13XksMKSyqxctjpyPBdSm+JEEFEbsWkqFz1ZHPS0iPMWbz
	 UjsepymRrax6ze5ejStchvK2cpvvXhJSmLHs6KNc8OJTEgKqq4hDvgWl0mMZfJZZL0kLb
	 7cIxTRP7q41QH5gqcbDkp10YDZCYWrnYo2rKyXaNDiigsgR6jmodNgoSNmBL6k5Acaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=oi2FSJ2D;
	arc=none smtp.remote-ip=95.215.58.173
Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC04606D822
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC04606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=oi2FSJ2D
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/o6wOm30wKWAccJPIaNGqqcoA4cZTpqG6mOHk1GcwkM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174584; v=1; x=1794779384;
 b=oi2FSJ2DqC/PpsEnsFCD7/4R95msF1h8tFCyxC9SJDl+WZyyGWYZAoW304c0+xMvWTzO35yK
 hjZ+Rb4MPyRDVTqw3WJBUy4MWjQbObUH38kILcNTjnr7bd+TILJYwXdbWy4rKKLWp2ZCnJR9az+
 enNoBGspqbbFyWO5h0SLuHu5nKFvjTFwydHrjzsrKE6Wmho1noSUQA64na/b6KUjnX20wL8xkI/
 4uq8bvFJaGvWJsFz4L27gwpIqArDHrqloY4V7yDjvLhqeIWf1wIXF6bJzvikjnSXxKLUz5TezOz
 P1GlDLzFs6P4ccSVzAerC6SjAlkd7iDfAogw0GFhVNsqA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6b83b700a7331a96;
	Sun, 08 Nov 2026 21:49:43 +0000
X-Mizu-Trace-ID: 6b83b700a7331a96
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:14 -0700
Subject: [PATCH v4 3/4] leds: aw2013: Use dev_err_probe
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
Message-Id: <20261108-aw2013-aw20xx-rename-v4-3-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=2778;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=/o6wOm30wKWAccJPIaNGqqcoA4cZTpqG6mOHk1GcwkM=;
 b=JqdK4qC1RkNkP5oe5jg8GR5Z0CTl7id0IxtRdasoGJiUERpFRDytia+GYhOoN+GIdCGolyZuo
 afLayZ16xpMB5v9gczUT359Ki9XXum3pVJJ+fzE7P9FTbB29XNbtDbC
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Failure to use dev_err_probe() for regulator requests violates
LED subsystem guidelines. (At least according to sashiko [1])

The original driver didn't use it, but it's worth cleaning up
while I'm here.

[1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L71

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Reviewed-by: David Heidelberg <david@ixit.cz>

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index a51b72de21ac..cf8e4b0a4572 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -459,9 +459,8 @@ static int aw2013_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -471,30 +470,29 @@ static int aw2013_probe(struct i2c_client *client)
 				      ARRAY_SIZE(chip->regulators),
 				      chip->regulators);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to request regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to request regulators\n");
 		goto error;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
 				    chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to enable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to enable regulators\n");
 		goto error;
 	}
 
 	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
 	if (ret) {
-		dev_err(&client->dev, "Failed to read chip ID: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to read chip ID\n");
 		goto error_reg;
 	}
 	if (chipid != chip->cdef->chip_id) {
-		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
-			chipid);
-		ret = -ENODEV;
+		ret = dev_err_probe(&client->dev, -ENODEV,
+				    "Chip reported wrong ID: %x\n",
+				     chipid);
 		goto error_reg;
 	}
 
@@ -509,8 +507,8 @@ static int aw2013_probe(struct i2c_client *client)
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to disable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to disable regulators\n");
 		goto error;
 	}
 

-- 
2.56.0

