Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3486349F12B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302584; cv=none; b=bW2KQNTRfYwv5lxzDxhPZjaPzpDAJFiDssOaVTjGeBJExgML+HnlZ0Xe/Bx98P8e2IJZaMgtJQEtAzx4QpPAsLE/fqo8op9G11/80Eufl2tgXJsec/hwYFaCPmSj8L/6xMzKTkSAn2sVBiF3MtkJwt2VqWHbGJAXEjRFkyUsVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302584; c=relaxed/simple;
	bh=0e6tYFYX4RQShFvq6ANsw1VBCkVay04TpNqpD+jAhLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNIJ7JGfd0gRCaBSNGFaZGGfisT2hWyYOBsGB+b7/HUPszFJWALmF06SQmgoWGYD5fCrf2WNeaeFtk2YWR2qq3kZgkmzg+mfXbbT64fQSGhOd3xfkB/UGUIx41jEdQMwn3CQGQENyyJnmbNSrhFJ30+bWLwvZBNE78qFOtwlBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=lMY1PhzO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="lMY1PhzO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afbd2c386so811286f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302580; x=1791907380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=;
        b=lMY1PhzOh9Rjk//wb4nZO8TajTq7opBnGSiCNVCPfMu3Z+sjeAfWIDVMN6YYVTzFry
         0HiPdkAF1EPUqnuA/Col2t6oivQEYQ6QzkpdonL7AtKs4TLojf2KqEAKbpi4UJeUMf80
         5CrFVqYdyTc56+Dni2bike+ctxc1lIvWyZvWGjmdtIjlXR32KtTrjs0eSQ42q7+vx6Ys
         kMKswJ2p+wIkOO9AUkBk7Zk9V95Z5RD5+/WQwPzfgnU/MSP4opXnEQFIT7Mt7SkzF6kQ
         de9NhyAJLCEzBw2jUjgvj7ciZgD+Ckm3zd46Us//P9vZAf9EsiK9rZCizg5dxMwKd2l7
         AwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302580; x=1791907380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=;
        b=chO8H7Vf0N9dBYNz/JsB8zihvOnttJisBmcWGyz2VsxdXz1ecAkfNxJl7wIQbEW6mt
         XuPIJD+1ZaQd6luSDBpJ+UDNtp5AbPNclSM+TnBk/1hH52S8QKlYg5LT65+IJfeXDgkb
         myZ9X4KiUlg+WzOr0i1MCG6p6jeYaBOZvcmBJVxswzKqw5RkaJTxYxZ1EX1/uU4ETFgt
         gSBRElJvkJebxWY+OgHSwSCYrqnFh5hyhbJGJcIRnI0qrfMEb6OQIEo9fXp//m3IqmkI
         8SDBf67D0N8eBXZ8JEucWSWseScxlA7iScJwTHKsJzIhIscW67bHvIqN/K/2r2m6Ok6J
         4uJw==
X-Forwarded-Encrypted: i=1; AKwUvBzQmlEA2LiNrfzVmYIWdvi02MI/hhyMIUeSiVxO8AAkC5VVFbeJVx4IfZrw3rwNalb7+3UsGVtrat2DWtI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgfvX+AofVi6q/2dL0hD3+0pUPQqySujxYJFoa0EA9+k7DbbUB
	1quvFEaeRKKrbA37E7o8AcWPjiaBk21aqtYLQkAdFQSYhh1ViCM/yTfvIYRCSQmJds8=
X-Gm-Gg: AYBFou1827t2mHDUbycrGHs2KOc+C09qRhC81aUEx6BC4a7n2I9bW8RGztU2Uypb62e
	H/CczIyzRye9UzkMe/p2D1dz3P3t38HaMsqNFrFLVFRuC5Scj5oddJeE7ueMfRMlLbGarnfpXas
	mCPPR0LkGYx/PTR9UXijpwbH7xw5Y/HNBbsgaloizOqxamxh0j8R0rBEYs1KTjEgnNGF5QxgJqW
	XbhF5ghcY283pLurAitsuP3LLm9T/mGC9s7NOH004F4cChkXsI3sEOKw17oMD3hb+3qLjrcEpZ5
	pG0BjPp4ufqX95edW9c4YEy+TpVZWWJyij2jh+H0kkWvx9X3MvwYjTz8CasCGHF2VhtxQuxdLWl
	8Gf4dVameu53AjTE6R+D8nuwMGStNLDiNbWUDVIuk4YqQJoRJJ9KEwGnHzf5B+5ephospobSXCo
	+xSRpX7be9ZxTtpyxo4ErVf8nu/9uA5uwq4lE99ybTGB0k20WRhxOdozLrR8qIq0ZYzZS7X00B9
	Xf/TJHgM7QWQlKRlA==
X-Received: by 2002:a05:6000:1868:b0:48b:1b1:af12 with SMTP id ffacd0b85a97d-48c6d1b289cmr3246959f8f.56.1791302580197;
        Tue, 06 Oct 2026 09:03:00 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:41 +0400
Subject: [PATCH v3 3/5] power: reset: syscon-reboot-mode: enable supplies
 for the next stage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-3-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4150; i=alchark@flipper.net;
 h=from:subject:message-id; bh=0e6tYFYX4RQShFvq6ANsw1VBCkVay04TpNqpD+jAhLg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV6dmFi/P2DCg2L+uH3PrBfJ8925eMmo71bowYTPB
 +w1bVeu6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqH/5nZFiU9lPx6e+jf3wi1h681HXUY2HK4e8zbOJfqMVeMLj0rDaQkeFWWZR
 QnENJ8uWYz7/q9nPtv7y+ZfbpojXXJ/Qf/TBPyI8FAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Requesting a boot mode on some SoCs such as the Rockchip RK3576 hands the
request to the boot ROM in a register that a full reset would clear, so
any reset that carries it has to leave the PMIC untouched. This means that
the regulators stay in whichever power state the running OS left them,
which may be unsuitable for the early boot code. E.g. on RK3576 the DDR
initialization blob runs on the way back and accesses registers which
Linux normally leaves powered down, resulting in an unrecoverable abort.

Get every supply named in the reboot mode node and enable it when a mode
is written, which is when a mode is being requested. The supplies are
deliberately left enabled afterwards: the system is on its way down, and
what runs next cannot turn them on.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>

------

Current implementation of of_regulator_bulk_get_all() never writes the
supply names, instead leaving them uninitialized, while the regulator
core uses the field in error paths to provide meaningful error messages
to the user. This has been highlighted by Sashiko on v1, and is addressed
separately in [1]

[1] https://lore.kernel.org/all/20260929-regulator-get-all-v1-1-e887c66a47f1@flipper.net/
---
 drivers/power/reset/syscon-reboot-mode.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..5ef882d81816 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reboot-mode.h>
 
@@ -18,6 +20,8 @@ struct syscon_reboot_mode {
 	struct reboot_mode_driver reboot;
 	u32 offset;
 	u32 mask;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 };
 
 static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -28,6 +32,20 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
+	/*
+	 * Whatever acts on the mode (e.g. boot ROM) runs before the operating
+	 * system, and may need supplies that the running system had powered
+	 * down. Enable them here, and deliberately leave them enabled: the
+	 * system is on its way down, and what runs next may not know how to
+	 * turn them on.
+	 */
+	if (syscon_rbm->num_supplies) {
+		ret = regulator_bulk_enable(syscon_rbm->num_supplies,
+					    syscon_rbm->supplies);
+		if (ret < 0)
+			dev_err(reboot->dev, "enabling reboot mode supplies failed\n");
+	}
+
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
 				 syscon_rbm->mask, magic);
 	if (ret < 0)
@@ -36,6 +54,14 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static void syscon_reboot_mode_put_supplies(void *data)
+{
+	struct syscon_reboot_mode *syscon_rbm = data;
+
+	regulator_bulk_free(syscon_rbm->num_supplies, syscon_rbm->supplies);
+	kfree(syscon_rbm->supplies);
+}
+
 static int syscon_reboot_mode_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -59,6 +85,21 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 
 	of_property_read_u32(pdev->dev.of_node, "mask", &syscon_rbm->mask);
 
+	ret = of_regulator_bulk_get_all(&pdev->dev, pdev->dev.of_node,
+					&syscon_rbm->supplies);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't get reboot mode supplies\n");
+
+	syscon_rbm->num_supplies = ret;
+	if (syscon_rbm->num_supplies) {
+		ret = devm_add_action_or_reset(&pdev->dev,
+					       syscon_reboot_mode_put_supplies,
+					       syscon_rbm);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_reboot_mode_register(&pdev->dev, &syscon_rbm->reboot);
 	if (ret)
 		dev_err(&pdev->dev, "can't register reboot mode\n");

-- 
2.55.0

