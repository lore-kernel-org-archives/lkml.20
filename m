Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097401;
	b=Q6EVlcUL2cqv0Bwe2mdsiB0QVqpRjAqrn07Wc1MzCAEQVFqhWrYVdy0zbMPTLl2yNh79
	 1mLnrOrIE3VVmWKl5GWmcx92gLfuiy82DLofgXtRg4PvoDA54+h62SNZLUsbr/lUhm2Ke
	 iai6LR7znTFi4BTvxCu7S6JPrHBqaOeMFU0k2x9Dyi+jF4jr/DKooKGiBLfC81nLb46Rd
	 kXEWIercrLAXXOIGeQa00kvkkJsz0FCtPVcLziJpuKvebVXwV3THZUz9vQXx/BXZnd4KC
	 UcWqQ4MOweaW3nhEpLpucX0foUyCTYZU82t/MxSIRq54i3rtmLoSUIm+AWVWK8r+eXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097401;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2ui3EKnv9a1jjzXC0mHa+737oalhDe7nkxscAeMHHtU=;
	b=P6jhjToYimP5lXiX1hPmNezL6Y1DEN1IC9rz4w3mdV5FrBijQb2L4dM76ROpV3YK7QkF
	 QDwVpd3IJnjtxPhTDzC529f0EXn0p+0k5+nHW6lrFOWIaMslDw7BgIkzv5tQuxZPezXva
	 B9MnEBe1KdH0U+uc4aABPad2fPe0GgeohlknMnwIaKhu7tAEZQnXgjoUwXgqlTPmSeIdt
	 AUnW8PftQ6mdohF1bA6pCzPV+ydGmC2R/lFxs86JAmVQDxex3r48uM/lNRmNgb3iL+ZLf
	 vmYgKH+C+xTBKgaThUJkq+uTdEgFcjirczNMQyLwTf8mbbC7e/YcwVoYSD0f2o8YWLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nt6J0XE8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB4606A31B;
	Tue, 27 Oct 2026 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nt6J0XE8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455A91F01828;
	Tue, 27 Oct 2026 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097401;
	bh=2ui3EKnv9a1jjzXC0mHa+737oalhDe7nkxscAeMHHtU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Nt6J0XE84L5OF0Wve8X2If+68JaBdZHCj99dRJ6KGR+NHqG0RVGOyDUYAe82e33Ko
	 5xTcqfw3u/XkADXLOtCgfJujdmwxBZf98a8ZHZbHlNWwWOAI6u3584JjNgbvYcAsxa
	 n1VDQIYvQy39gFEdpBVL9rzCAOiWQNQAodZxuIFmkGsYLmGrcPF56xvQaF+lnYH4g9
	 VirXX6lfvfgEuALsKoftS86HADKpG4tapwqC6ay2eXDws+bks6Eyf4xZAmR2m5Ze46
	 pL1nuQjJ2xxLXJnzVwba+G+o0jIDguEEBL8J/Jj3/s94pceF3xAJU74RCpBcesC1UB
	 65F9f0rOV60MA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	cover.1712920132.git.mazziesaccount@gmail.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/27] mfd: bd96801: Allocate watchdog IRQ resource on the heap
Date: Tue, 27 Oct 2026 09:30:34 +0000
Message-ID: <20261027093306.2812695-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
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

bd96801_i2c_probe() declares struct resource wdg_irq on the stack and
assigns its address to ddata->cells[WDG_CELL].resources.  Although
mfd_add_device() deep-copies the resource table via
platform_device_add_resources() before bd96801_i2c_probe() returns, the
shared cell template and the shallow MFD cell copy attached to the child
platform device retain a stale pointer to the expired stack frame.

Allocate wdg_irq on the heap via devm_kzalloc() alongside regulator_res
so the stored pointer remains valid for the lifetime of the device.

Fixes: 894d915d23b9 ("mfd: bd96801: Add ERRB IRQ")
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/rohm-bd96801.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/rohm-bd96801.c b/drivers/mfd/rohm-bd96801.c
index 66fa017ad568..eb7a7376ea89 100644
--- a/drivers/mfd/rohm-bd96801.c
+++ b/drivers/mfd/rohm-bd96801.c
@@ -642,8 +642,7 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	struct irq_domain *intb_domain, *errb_domain;
 	const struct bd968xx *ddata;
 	const struct fwnode_handle *fwnode;
-	struct resource *regulator_res;
-	struct resource wdg_irq;
+	struct resource *regulator_res, *wdg_irq;
 	struct regmap *regmap;
 	int intb_irq, errb_irq, num_errb = 0;
 	int num_regu_irqs, wdg_irq_no;
@@ -692,6 +691,10 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	if (!regulator_res)
 		return -ENOMEM;
 
+	wdg_irq = devm_kzalloc(&i2c->dev, sizeof(*wdg_irq), GFP_KERNEL);
+	if (!wdg_irq)
+		return -ENOMEM;
+
 	regmap = devm_regmap_init_i2c(i2c, ddata->regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
@@ -723,9 +726,9 @@ static int bd96801_i2c_probe(struct i2c_client *i2c)
 	}
 
 	wdg_irq_no = irq_create_mapping(intb_domain, BD96801_WDT_ERR_STAT);
-	wdg_irq = DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
+	*wdg_irq = DEFINE_RES_IRQ_NAMED(wdg_irq_no, "bd96801-wdg");
 
-	ddata->cells[WDG_CELL].resources = &wdg_irq;
+	ddata->cells[WDG_CELL].resources = wdg_irq;
 	ddata->cells[WDG_CELL].num_resources = 1;
 
 	if (!num_errb)
-- 
2.56.0.307.g5fe7bd680c-goog

