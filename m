Received: from mta0.migadu.com (out-148.mta0.migadu.com [91.218.175.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322248BD57
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533272; cv=none; b=aqJMMqCmeLTd36rcdB5ZxVaVKALAsuklUThpZOZVx/n+X3JKXgAIt3sKiIJsju1OGmFEU3UvzKvTLrtteXd0w2bcTCorLYmo8zoSuAr/VwPi6+E9XQzYmqj1GptiSj8GAi/aSv6eqcMj9qYiHcf6GvcFYlxTamj8A5eUZ0RB9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533272; c=relaxed/simple;
	bh=2qjd3TpmOeGjaY4RGdVPRxQxmNjmgQXHJo7tx0jZ55o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dcOYuMICzCyME7yWnRJTc/a82rtDYZ6kjZNVlqmuhYzWY69QS75AizjmsoWo7Z1fTJSFtUCtdqyJ+ekNeuY6GEjd1sHdzFX+z1dnIjgiTXLY5N3RTk+vRktZ8yommHTKkXcje7poE+Stu35Tk+40HsrD1AJ/ySgqc8iXBY0Ozyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=R9iLwfOL; arc=none smtp.client-ip=91.218.175.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="R9iLwfOL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2qjd3TpmOeGjaY4RGdVPRxQxmNjmgQXHJo7tx0jZ55o=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788533266; v=1; x=1789138066;
 b=R9iLwfOLh1H1TCRG6cKCMNnU72x35HlvvkYUMLh9K/FGpF1M8MGVSiPvamiCb6x3m2aEUi1y
 0A3y1KWa9ZRfyiG+5tnOt2qzKUFP0RUoVsQ7BX41NXFiSNQiptgR6wgJibVOc5alL3+zxLQ/zYj
 JOBTSxxde3clGx4iQM9MzkUJ/F3q4unrxgyQRWC+VkCEcqcprsTZOpw8EyHPz6cNEfXxqvYmTBr
 DjcY2Hj2hjFUvS6dnp6srh2ufHl+yNLDUV1E6feu9LptvrWJOJ+1mOVscvHH4nLn7xGxFyyCyEH
 INQ0Tx28MzqQbJUiFUbNioc1KLtXatDiv/SxBP10Lb5DA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0447f76df38ae06a;
	Fri, 04 Sep 2026 14:47:36 +0000
X-Mizu-Trace-ID: 0447f76df38ae06a
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>,
	Yufan Chen <ericterminal@gmail.com>,
	Surendra Singh Chouhan <kr494167@gmail.com>,
	Mario Rugiero <mrugiero@gmail.com>,
	linux-rockchip@lists.infradead.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] regulator: tps65185: Remove redundant dev_err_probe()
Date: Fri,  4 Sep 2026 16:46:31 +0200
Message-ID: <20260904144728.1629471-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm_request_threaded_irq() function now automatically logs detailed
error messages on failure. This eliminates the need for driver-specific
dev_err_probe() calls that print generic messages.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/regulator/tps65185.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/tps65185.c b/drivers/regulator/tps65185.c
index 6a3130177e7a..4865227e444a 100644
--- a/drivers/regulator/tps65185.c
+++ b/drivers/regulator/tps65185.c
@@ -392,8 +392,7 @@ static int tps65185_probe(struct i2c_client *client)
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"PGOOD", data);
 	if (ret)
-		return dev_err_probe(&client->dev, ret,
-				     "failed to request power good irq\n");
+		return ret;
 
 	if (client->irq) {
 		ret = devm_request_threaded_irq(&client->dev, client->irq,
@@ -401,8 +400,7 @@ static int tps65185_probe(struct i2c_client *client)
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"tps65185", data);
 		if (ret)
-			return dev_err_probe(&client->dev, ret,
-					     "failed to request irq\n");
+			return ret;
 	}
 
 	ret = regmap_update_bits(data->regmap, TPS65185_REG_INT_EN2, BIT(0), BIT(0));
-- 
2.55.0

