Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A63CB2D0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487113; cv=none; b=svYjSEpRuJ0000BVlQsTv4p4xwLrtOUpdRE9yyNHKunhVNB77OjPJAOOruvwlR+Z+Q37xR+0L2M0E2fPpyMudmMz9gCaNgwxhp7ABc86lDTnb/WSG+P9IhgEDX7OUi1q27aFudu2j3Fd6H5D5Am9UPT2L5TuH1tS5o+d8iGJ7FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487113; c=relaxed/simple;
	bh=amUxH7dplBRK8duZIHd9DmmDP5zoeolOwFlBY/V0V8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQz02mWo5j1abd8KZsHpublYlB7kGo0yO2fU/vQ5x+9grNkO0h+0vsnLcpmVWhiHAQeJKEWrFca1mFZKPzbTgQZckeCL0McuZHxKm271UUveVlp1fLO7nb9tuuegRqEW5DF3hyI3xUlzIYvlf/V1wJO7jvyayuP33lNguK6el/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=f9mWUSqb; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="f9mWUSqb"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34ceab2900eso5948933eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487111; x=1792091911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a14qc72yQKkzCAZ2CAoTwipNnd9qGKItgjyfXX9xZAw=;
        b=f9mWUSqb52oh3obWJMTzMC2BwQ9ntA9XP47r2WWOgd2AeA0VJ8eXTXF+9eJ+uuJSb0
         kwugLf3+baQmYAkaRt7jwanwuKUsASHEND8zEc+IlkS+AZqLMZnHVPB3SKlDyTT6tPot
         zcQS+x/ByxXRpfcLh7FXVo6XKkRa38ztJvic9GfwHsWIUZnxCA/iwh8tgOlE4VSBI5ME
         C3urKvTwYr8xlz8+W6yMS2znwP2sy3mRQD526D1r2xetfYoxenhQ3gL+6S3UkQKdXInh
         wCw/YNFQq/8A5dmVzlKJ9SB4OJFmx3GLFt28iwVKt88kHNOvc0w58Ed4uWBgGMQhO9fn
         i0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487111; x=1792091911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a14qc72yQKkzCAZ2CAoTwipNnd9qGKItgjyfXX9xZAw=;
        b=C/6jSo7zfkc3V6X0X2HJp4SN89P84hMGnenwglcbpUH2Z5oWyaLU234S8xzX7mN1gA
         m7CmNGerK4W7Vu/tzn/QkBhdJ2sPkQyfHMvGlFVGuRCYJNdw7v7sm+kqpN2g7ECrwOpp
         GGoH/0uoF0jtzhAOC49F/iwmPfxBwIx2/VfI9OzPcF8ujnlpPBJbnlikqu0l+1pgpIV1
         AfVnIlwhJHC88WXg76gY96ICgUKaDc0tnLOg0aLi2XnJiy9/07HKU+Di03reXG/ck2lY
         8jVF3ZYRAFbWjP6zvV3IZ59x5vsH5BwG8E8R27a+eQo6UX0GD6KoNXgoLxsQ4gSdNRAv
         PO8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7MJjspRs7D40HaOpxFxQ8EcBlbNpl9TJ50XX4U/3YGdY85okrJk5xO4ws7uBHa8R2LNHdAxFaZ4ybJgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUvjSICFO05ayvvnLYxR2acfAsDrVNperApjFsAAHsHu0uy06a
	KOix977H6wevIKj4EhPdXcEMbqMB8WRQmH++4jvDf7Ok1BeTtQYQcPjLvSDuUEN9q0U=
X-Gm-Gg: AYBFou3ThmX+WC2jrS1JQwm718BDee5j1vR49I7pRfM38yeaZrifJaUu3hTJxZjhTKA
	di3oVqOduZKPXM1gZCE1ATBTgDtDRMzPe3PpZSpd/Ja/hsrYgfPYc3wdVFga7odoc0OMaOkzGZC
	cWlaFoYM1CLHIiZipad9jMiX99s944VhfhD3DPsyLZ57Hpu5zF3DB4eeABf0PWatm+twSGT6zIB
	q7rojfBojsyI4YPzrU+Spw17RxzivMvQZ40Qz7AMc2opvaYvkOo4HmCurosAN3nFmpcuW3i831m
	z6AQdd12KhQQAHyM4UZmfTCoFUBrp/4KdZNeY5JsI+vTcGfOaQ8ISYVbZeozgujs+Ui3Bn4yEvU
	eHvJ6QGE5ykkOKvzeaPdhgSKrvqcdyTiayTEnLGBo6mPc6HIEFwQSZXU7Niyg3LuQTao1dzS+dO
	lBxAqVaTS6F/Bz9jYgxVyfW+mh+6LMLXD9ALoRMpvNeRArUf7RImPXGZoNP0if0/NJCQ0oGdnMC
	Sif3LkQPWfaJx3gnywNsy33xxAV9r+UX/V7hTHrusYPWrd1fKDwx8rfNvTkkCVQyaZ8gLI=
X-Received: by 2002:a05:7300:8819:b0:33c:e72:5b3b with SMTP id 5a478bee46e88-3535f3cbcd4mr464739eec.25.1791487109863;
        Thu, 08 Oct 2026 12:18:29 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm117933eec.4.2026.10.08.12.18.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:18:29 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: [PATCH 6.6.y 1/2] gpio: rockchip: teardown bugs and resource leaks
Date: Thu,  8 Oct 2026 15:18:20 -0400
Message-ID: <20261008191824.98662-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191824.98662-1-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Scardovi <scardracs@disroot.org>

[ Upstream commit 9500077678230e36d22bf16d2b9539c13e59a801 ]

Address several teardown issues and resource leaks in the driver's remove
path and error handling:

1. Debounce clock reference leak: The debounce clock (bank->db_clk) is
   obtained using of_clk_get() which increments the clock's reference
   count, but clk_put() is never called. Register a devm action to
   cleanly release it on unbind. Note that of_clk_get(..., 1) remains
   necessary over devm_clk_get() because the DT binding does not define
   clock-names, precluding name-based lookup.

2. Unregistered chained IRQ handler: The chained IRQ handler is not
   disconnected in remove(). If a stray interrupt fires after the driver
   is removed, the kernel attempts to execute a stale handler, leading
   to a panic. Fix this by clearing the handler in remove().

3. IRQ domain leak: The linear IRQ domain and its generic chips are
   allocated manually during probe but never removed. Remove the IRQ
   domain during driver teardown to free the associated generic chips
   and mappings.

[ Backport to 6.6.y: For 6.6.y, send with 1c1e0fc88d6e (CVE-2026-53226)
  so generic chips are explicitly removed before irq_domain_remove().
  6.1.y lacks irq_domain_remove_generic_chips(), so it needs a
  separately reviewed older generic-chip teardown backport. ]

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
Link: https://patch.msgid.link/20260526171050.12785-3-scardracs@disroot.org
[Bartosz: don't emit an error message on devres allocation failure]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-64241. Releases the debounce-clock
reference, disconnects the chained IRQ handler, and removes the IRQ domain
during driver teardown.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/gpio/gpio-rockchip.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index ff9a4b8611d7..e0e4f3ed5fdd 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -629,10 +629,17 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	return ret;
 }
 
+static void rockchip_clk_put(void *data)
+{
+	struct clk *clk = data;
+
+	clk_put(clk);
+}
+
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
 	struct resource res;
-	int id = 0;
+	int id = 0, ret;
 
 	if (of_address_to_resource(bank->of_node, 0, &res)) {
 		dev_err(bank->dev, "cannot find IO resource for bank\n");
@@ -662,6 +669,11 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			dev_err(bank->dev, "cannot find debounce clk\n");
 			return -EINVAL;
 		}
+
+		ret = devm_add_action_or_reset(bank->dev, rockchip_clk_put,
+					       bank->db_clk);
+		if (ret)
+			return ret;
 	} else {
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
@@ -773,6 +785,9 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
 {
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
+	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
+	if (bank->domain)
+		irq_domain_remove(bank->domain);
 	gpiochip_remove(&bank->gpio_chip);
 
 	return 0;
-- 
2.39.5
