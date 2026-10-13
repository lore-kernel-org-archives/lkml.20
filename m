Received: from mta1.migadu.com (out-225.mta1.migadu.com [95.215.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6D3CC7CC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870071; cv=none; b=GGZCtOCUzvc52m2gWR472n/6sDFKAMmbxa+SZkthC7HpfMnRGk9aCodfibMbBlCxNpL6Q3GOPWRaScA73a4JODs5dded6NJsHmQRf5nBL3CwDqCAp2Fn0naQgrr86tATlkXSBSsncXSQgtnUqqHwu9anJtSYQvtQySFB60x2FJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870071; c=relaxed/simple;
	bh=AQYy5adRQSBsdS46Ukf6IvKTS3q91ZQEPucs6nARbIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikTV/qikCIqgOCZL6b17UHTHZ4VWgawb1RHHd/usXnKWIMmSuyVeQTdve0yr2c5/gn3Bli/YQfmvA6rN25sPNv+UDeYXDhE55kVBohO/eRkJxxJNKVPfe3aboS9py5KqjFhVAPD97PSsAZAvbno4x+zE8kP6RVO3a7J/ebNCJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=iLuAIO5k; arc=none smtp.client-ip=95.215.58.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="iLuAIO5k"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AQYy5adRQSBsdS46Ukf6IvKTS3q91ZQEPucs6nARbIY=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870067; v=1; x=1792474867;
 b=iLuAIO5kUdKtSPoX6Ixx4/CtlYBKazAmBid+rkCbZFLR44fhqZ49hVoFkyh4aVaTWm63qxZs
 2RXyDfcUlCoef6LakskE0adsyY7Cp6S2jRCQ/fo7UamMaXM+dCY14ARFCzc5dWEpHTDWWqwa1lK
 uo3owC2PqluLC20afyXHU/mKHm8eqxmfMEC6BIuuhimc6H5Evavcu3woXJSe+jv3WweDHhTouG8
 XP8QwfITorWfKnQgq383tNFQCdFzMb333ElT/8QS4LR+M2bJbi94raVcw4jbHL5wyt6k6NUnucX
 8OiFw6E8AIDky48MtcadFi6kcz/G3WAFy6M5la6c1qIqA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b0bded94188a6614;
	Tue, 13 Oct 2026 05:41:06 +0000
X-Mizu-Trace-ID: b0bded94188a6614
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 12 Oct 2026 22:40:00 -0700
Subject: [PATCH v3 6/6] leds: aw2013: Move reset register write
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-aw2013-aw20xx-rename-v3-6-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=1454;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=AQYy5adRQSBsdS46Ukf6IvKTS3q91ZQEPucs6nARbIY=;
 b=HuHbSltWPJYIjH2DTge2woF8QOo8m81zjkjD4YxO1GhHfeodFCt1HdTw2d0KGA1iZvHr9Tfjj
 e4Y9R1yScKNCNZsH/wFibBGIKGUCYoEwjYI+7yMuiiGpmnmXfiPkzKp
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

It has no reason to be in probe_dt, and putting it there complicates
the mutex requirements.

probe_dt calls devm_led_classdev_register_ext, which may trigger a
callback to aw2013_brightness_set, which would result in deadlock.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 6e661afd7775..8d1d649064c7 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -383,8 +383,6 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	if (!count || count > AW2013_MAX_LEDS)
 		return -EINVAL;
 
-	regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
-
 	for_each_available_child_of_node_scoped(np, child) {
 		struct led_init_data init_data = {};
 		u32 source;
@@ -504,6 +502,14 @@ static int aw2013_probe(struct i2c_client *client)
 	if (ret)
 		goto error_reg;
 
+	ret = regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
+	if (ret) {
+		dev_err(&chip->client->dev, "Failed to reset the chip: %d\n", ret);
+		goto error_reg;
+	}
+
+	mutex_unlock(&chip->mutex);
+
 	ret = aw2013_probe_dt(chip);
 	if (ret < 0)
 		goto error_reg;
@@ -516,8 +522,6 @@ static int aw2013_probe(struct i2c_client *client)
 		goto error;
 	}
 
-	mutex_unlock(&chip->mutex);
-
 	return 0;
 
 error_reg:

-- 
2.55.0

