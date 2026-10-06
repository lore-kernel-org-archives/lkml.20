Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07526ED3C;
	Tue,  6 Oct 2026 08:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275508; cv=none; b=Jd1Sr3kSEoD11AFc9MJd7kXYEfY8gnXL3VsUVSDqhPyea9MULy8qgkLNFypdAHYZBtvKe+ErtM2B3CE60m20YNVWp5+DxSvCLN6yaB0d1HE1P1V5dBnqefjS2wu/tFf+FL67orJKrPZONJ29yQsNMLSOXP9IARrPg/Vzp04tCSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275508; c=relaxed/simple;
	bh=wDERCfJntI9j3PD8hKA5bdfPpigdxuPtJRIxblvJZaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JVVIvY+OViA6sANU6aSiJPT3yVj53rHyWyb9UaYULOL5x0EjYeuhhTcC0mJsErzeBskb5tBYuRoODRdtCc7tZY5KSCpFMf6Awfvk5A5URQHWnfX7NGWdwFdwvyadCFraxmoIhTHYvg6xylZsLrkP/rahhFAjt/v/Lan/WZ/ruP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyoIRWYK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyoIRWYK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A97CC4AF13;
	Tue,  6 Oct 2026 08:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791275508;
	bh=wDERCfJntI9j3PD8hKA5bdfPpigdxuPtJRIxblvJZaw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=UyoIRWYKgo9x7kI7EjTlcWnm1tcvrSyR0DUhD94XRiBAZf/eKitBToIswIF9GOu+L
	 Oasf9w0nk6YPhrvf1hnS6S1lj2uzwnw39OYGSXN+oDhIvJdc0pvfz6a0GuFR/7fVtj
	 UOVESYBUO+dsFoiqJnHqAiAk+RQepKBsEpeDytLTv3FPAVsZjahKZO6S84yXnfJULs
	 5yaohmnvexmQ21IPEq2fSqCSBpYU+TEexKd4J4OmlrFP+gn4TS41wB50R4ISAqvNbV
	 mZ3Zf3GLQBQs/JPvChNplRvV8GQxFi4KFFA4lVVTchIwpXqIZou26sETzrrau8ThyA
	 wKj3IOUoVCAlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466ABCA5FED;
	Tue,  6 Oct 2026 08:31:48 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 06 Oct 2026 16:31:31 +0800
Subject: [PATCH] media: i2c: it6625: wait at least 700 ms after reset
 release
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-upstream-it6625-reset-delay-v1-1-e4cb3c74e6d3@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAOKxxGoC/x3MwQqCQBAG4FeROTcwruyGvUp0WPS3BspkZotCf
 HcXj9/lW8lhCqdLs5Lhq67vuaI9NTQ88nwH61hNQUJqRRJ/Fi+G/GItKYXIBkfhEc/85y50fZT
 zECfpqQ6LYdLfsV9v27YDs2vltW0AAAA=
X-Change-ID: 20261006-upstream-it6625-reset-delay-3239507c5f09
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791275507; l=1335;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=ajDymvLtZd4mqViSriJEAC5U7NEZYEy4dRLuuNrLaX0=;
 b=GSQIayG0IULUFI9TdFynbzFRV7IK3fWOrjkVZnnqflNa5KpkfXWBp7iczOKhgxAvBx74AekFd
 uCeHfClM2lmD4bxFG26EW/XmcrVcN8NDXvboJ9ihL69KXQp9m2A2tM0
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

From: Hermes Wu <Hermes.wu@ite.com.tw>

The IT6625/IT6626 are controlled through an on-chip MCU, which needs at
least 700 ms after the reset line is released before it boots and
answers on the I2C interface. The probe path only waits 10 ms before
reading the chip ID, so the read can happen before the MCU is up and
probe then fails.

Wait at least 700 ms after releasing reset.

Fixes: 142e5f00bd57 ("media: i2c: add driver for ITE IT6625/IT6626")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/media/i2c/it6625.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index b74df9dbf8c2cab7461c69bc0f926141ed7a506c..585c8835e218c568709a057d4afc3c5cbd1dccff 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -2260,7 +2260,8 @@ static int it6625_probe(struct i2c_client *client)
 	if (it6625->reset_gpio) {
 		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(it6625->reset_gpio, 0);
-		usleep_range(10000, 11000);
+		/* the MCU needs at least 700 ms to boot after reset release */
+		msleep(700);
 	}
 
 	err = it6625_regmap_i2c_init(client, it6625);

---
base-commit: 89a3d2a2237e017cdbefcb036db71ce74e67faf5
change-id: 20261006-upstream-it6625-reset-delay-3239507c5f09

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


