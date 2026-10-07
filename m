Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33CD490BF1;
	Wed,  7 Oct 2026 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369113; cv=none; b=JJfLVhvGOV5xE58m7QpNNBMbka3jVu0CEwsNuozfmazWP+WgiDARZem14cy1H8IJiCdr3/oa2KHKjt4j+kKhQriMNZf1RVYUNGhZ+Qw3+2VxouVMQ4WnwSrURXb43QnT80Y3kD/+iknM7ThtjcVIWC4h8aU0HSyb/fX+EYYzLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369113; c=relaxed/simple;
	bh=NpCrprTsrxYLEmB8wPczqcPiafyy3EwShNmqZqIsWQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyLuPRXh92BwOQzvLfTKgZOYS0XpQEyQRQyXkzAO5S4+nKh5iA/ycrmAUR5B8h/pZlpVgZVFru/tUv7g3/QWbHZLcKurMcI1DIAIxGaS9/yWC48EgWUbJOtRV5Wf60Aask6qn+MjHt9R7T+rmCV9hY5WZ+m/PBWKJYqiMpX3yN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6QrkOb5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6QrkOb5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EF45C2BCC7;
	Wed,  7 Oct 2026 10:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791369113;
	bh=NpCrprTsrxYLEmB8wPczqcPiafyy3EwShNmqZqIsWQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u6QrkOb5Y0FEdXrXj3IE0/sk4ksOK6nSYORsd7lL67Em5gHrIRkRFqW7GVYmqYgPX
	 OnlRQkvHAC6O+Dp5ycF8l6VWqJAuXhYSAWjkQP98YXJuAf6VVMLkyzYo0o1bOF/l2i
	 vY5u9QCNTudlNydMiK7WMKDPT1k4EWLKhKHVtLziyKGJeIz8igdAruvUC5XCqx6Bne
	 8BGVroodI7YlLrZlXd1dx+DZUel88xpZJjb2BwiCg2+qrjLNPpa+kCIjzg/aQO4ozT
	 hW3wxe31xweQzmMYWOCfxB8BjtkuKGp6NES2RouO2PWoeDUBn1tg7MeAQRXCCdj54u
	 uHfg0eIBRl+VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E921CA5FF1;
	Wed,  7 Oct 2026 10:31:53 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 07 Oct 2026 18:31:52 +0800
Subject: [PATCH v2 1/2] media: i2c: it6625: wait 1s after reset release
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-upstream-it6625-reset-delay-v2-1-c5d6b2522bbe@ite.com.tw>
References: <20261007-upstream-it6625-reset-delay-v2-0-c5d6b2522bbe@ite.com.tw>
In-Reply-To: <20261007-upstream-it6625-reset-delay-v2-0-c5d6b2522bbe@ite.com.tw>
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791369112; l=1144;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=qKkiXypnT97wqDUJbzCy8zgS8RDNiH0mVRFKOrveAOo=;
 b=T6D6cCBMy9lDR4m2CTvQUFEWVNTcqYs7Jm42uGk/iTjGhOJg2AmV5eLw5EigwaB0zY26PEcxT
 L/ifhPjfA0CAYxKDk51BvzuWPEz3Yfmr7tz2tr7vfV0YlqT+txAgniq
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

The IT6625/IT6626 are controlled through an on-chip MCU, which needs up
to 1s after the reset line is released before it boots and answers on
the I2C interface. The probe path only waits 10 ms before reading the
chip ID, so the read can happen before the MCU is up and probe then
fails.

Wait 1s after releasing reset.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index b74df9dbf8c2cab7461c69bc0f926141ed7a506c..fc8b22cc1c9ba3612f9c55bea1de61fa9a9c0e84 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -2260,7 +2260,8 @@ static int it6625_probe(struct i2c_client *client)
 	if (it6625->reset_gpio) {
 		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(it6625->reset_gpio, 0);
-		usleep_range(10000, 11000);
+		/* the MCU needs up to 1s to boot after reset release */
+		msleep(1000);
 	}
 
 	err = it6625_regmap_i2c_init(client, it6625);

-- 
2.34.1


