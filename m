Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7B4BD7B4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615919; cv=none; b=oq3vmIPrt7S115e/gHrGFkvf6HckHcoZanpsN0Xtd5JOt8p/pZzQ1SXmRwql5UpfFozepvCYKf80TaAUkVJkhGlR5h5cUdpk7glCAGzglqna+CT8EFBBovwBTFTkIAyYrCP+qOzqNh6SwCcIaGBdavTbzwgB3DixmnXCBWYqVSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615919; c=relaxed/simple;
	bh=YoPcT+r0NPwyBnJxWK4PIEC9nGCY4cC6HMWtxjxy0e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmlDMSw4ttfIVOleo1V4POG4i2WqA/hxpTEUOVjk6JmnioqfFyMhF1pqKz929aP6UB3/qJI8KoWTQkPV9fGdELXhDES9odxKpARNjtC3ACJZK4whx7pKe0GJq4Yu6sGqLSZsw1TFSu5qe1XY/Vajq+ERDnk/g5/aSzmOmS+JUds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=kvIL62jk; arc=none smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="kvIL62jk"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1582149f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615913; x=1791220713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzUE7F0kx/Sy/yA3+E0ssA+mT7Axk9cKYyuMi26SVJU=;
        b=kvIL62jkgV0HFttA5w9JPu7NpdSqd2j+4Y05KOnMJ+25A9622UsF3S3T9+Hi04tmdx
         jbROz6g/gSl8XdCGGg6K1voi9ILluICGHKrOBGaF7/EN2+JAdqIJh1AtKHLC5BmkNbJT
         xfd8LUAYfcRTFvG0RenhPxxs9Eh04coiieWrwQB7TK3j64bsBL27yJ8bVE0zXCfA/sUn
         8tLZnV57jRUnZglkMRl+vHh3OTZZfQImlBD4gGICBG0kYPQ6kRnxiJtD7FucT41HS/C/
         +7/AtQeWhFuJw3w65Rzol/BFxqWJDuJ3+gwiOX6Djx5TBCYgjz7/IVTKtze6gp4naF1O
         ffmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615913; x=1791220713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzUE7F0kx/Sy/yA3+E0ssA+mT7Axk9cKYyuMi26SVJU=;
        b=wyMZRL4xk3yqUXQqwjg0+RWDc3xxkb4lQwcqLlNKcZf5NsIlOJdH3VmnzLPxHCSGmH
         8Vg0RZpUBngCS+IRa1ttcyu0zkPB32rlqWKgL4Shb/Tr/XIwzcIkVMEMQvDKDe24qr5+
         wJVY4GKS7dM0uzNYXtUKJqUZIMXOxMI8Qa2rRkwoRqRdZzkQEN/PtgaRtw4AsgZ1q2fJ
         xAOlt8D9AtVItpoSyZxNtXH8BQ+Te1R1Hw6BZfo7nKcYVi6siz4xxdx1LVqWgfDRJIdW
         DTpeH8zPff8E7kmZ3o5B9s5K0Nfz/7jyxuK0uXVB4FNhIkdbp/j66K27Zyvb2BI4i80t
         vbcA==
X-Forwarded-Encrypted: i=1; AKwUvBzdONQRWYEpjMzIbP4MKVH8/i8lYhjZqGuwYHI6QmmBvugs7VgMz6Idz3a8+SPpD6Mo66XMAbTb7tpVFwo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK11HJjhFbjSFAz0K82uWOGbLQ/BWaI4PlPacOivLTAgtzChBYQ
	vz5F8AqOqalhPB2fdV2h5aGJrMPFMXwc8tCwRfp5d6TQwfUhaGEUC2npTGRt0/Wvjp7c4G/7dff
	zuDLb
X-Gm-Gg: AYBFou3fR7SyfYHFinKCez/aMY69+Ji42XA/vo9rOIDHy76EAsDQHvuk5aJm4EGP1mX
	DXRlX+yo9lVmxnwd4au1Gh/bJqccMpHlgwcH5tOTw0xkTE3BZxKIDCXV7OkT8cJmjyf6MPVQa8v
	qtBPOylcOyXc24KmQeW2P5+s0YTMCdYHNL75OUHfjQG5d399KZ+yM3cY5ULQQFEVAgbm4Qf/TNF
	SE6yiA2HhDfbo5al7eHThust3Nne1yyhTJp4yseofzUbqMXPxGd28bc3/r91c9cxbal9yVpQq/b
	U3PmGcjrNFsfVZJcruf24JSkILOsADcPDaR98f0JZwDAF97iBYUaNTXXA9jP6eVvLs3AKlHisxO
	zligjVeU4VyjbjODuSNXDJ34KOERo2FfRLJf28ZYD+EHZAZL/E6WGxBi/9ZBMxmtlCY7aLUuC2O
	GlIJ8gDg5ujRm2P2EeL9TNmr2liAd3QEDOVTOw0X6c6VCWrY4XVd4GPxV5tYHZQE8l2h4Mt0Ufn
	ziLYwbums/jeldAvTy3fe20LO8=
X-Received: by 2002:a5d:5d10:0:b0:488:641b:2dfa with SMTP id ffacd0b85a97d-488716b28c5mr30171327f8f.2.1790615912742;
        Mon, 28 Sep 2026 10:18:32 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:32 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:18 +0400
Subject: [PATCH 3/5] power: reset: syscon-reboot-mode: enable supplies for
 the next stage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-3-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628; i=alchark@flipper.net;
 h=from:subject:message-id; bh=YoPcT+r0NPwyBnJxWK4PIEC9nGCY4cC6HMWtxjxy0e8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhgXXaSTtI/Hu03nsp35v1ky2hOMxY/63+Pgd2A+t
 eZtM8PVjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZaqIiRoXNpqZeOWp7gt8Wz/obaz1Q48eCojm67ouwvuYUNHLOX2TIyfCyaxO5
 9yPuJvSOjW6208LV7aXatE1/nnLD4wT5ntXQxLwA=
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

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/power/reset/syscon-reboot-mode.c | 39 ++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..3072922f1716 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reboot-mode.h>
 
@@ -18,6 +19,8 @@ struct syscon_reboot_mode {
 	struct reboot_mode_driver reboot;
 	u32 offset;
 	u32 mask;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 };
 
 static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -28,6 +31,20 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 
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
@@ -36,6 +53,13 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static void syscon_reboot_mode_put_supplies(void *data)
+{
+	struct syscon_reboot_mode *syscon_rbm = data;
+
+	regulator_bulk_free(syscon_rbm->num_supplies, syscon_rbm->supplies);
+}
+
 static int syscon_reboot_mode_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -59,6 +83,21 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 
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

