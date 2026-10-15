Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6417B4D90CE
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062161; cv=none; b=URPfxKq53WqHkNXXf51wDv+hlpGT/kqYniT4iCVLOdj8wfeVfK0i3scIpY08M+eT4rdKtKhRrcoODXvCXqqAcPATXFpIomQEkfXyynsH+r2MKvcXHvkuPDnmB2bx8qP2zaWpInM7hd702wHcy5gqQtR1Qgh3/YWA/QneMDhuibo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062161; c=relaxed/simple;
	bh=CNWJl5EX3MJMdXQfW83XU/Cuf4vxP6WKM1nBj2uURcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/yd9sFGcUGYSEjVwmEKBG/gm0Bb0B9yMpBw3lWGC9K7OKraCKhn3gGH2Tn3bFpxw6ynNEf1lxPfkYe/2/4wzKfaGVPkGIV4PLhfCIZKdQyAM68HoWXwWhJRA5GXKW0F0ConL1zwZbyLbelgBhEBXWGejz4/v39z0twZ2CE/jPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezp67V9o; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezp67V9o"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba357a1929so5066995e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062157; x=1792666957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdHsOUWdQleiQ3bqPDEase/uBeWKF7GnXYiyr391KAk=;
        b=ezp67V9oWsfrzAa0MnRZEjiLs35JC0Wbz1efmlKaQ3V5bGZ9UYWNy0c7H3JF/m2FZH
         Cp9zxYKf4aiYU7tOKhVOHi0fMm0KicIF1hcirG/I/O/ZVv7n3JKn5aDN8+KboptV8z0E
         wl+HhLK+4OE5LGP2zEc6D32lSF7OS/Gmd4sbO5c+wHO1tvyaGTQ2/0TaoqcB6Ff1w7++
         ttbODzWzxuLQ4XKrEDTxJAWKW+M6eiLh1Nq5paUflaE79VQ7r3oT/urKffhl6u+4fzJt
         jSwpKoWBRg3trS4C+tLrM8gVwgfYFxQP9s5qQu5pcmsYk0GTFHobbArmrZdC/QtKsf0J
         wsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062157; x=1792666957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdHsOUWdQleiQ3bqPDEase/uBeWKF7GnXYiyr391KAk=;
        b=nDfOlNOxV1UcahZAAfHC6HjEWwF+YvoK2zmHUPgbc7jHxqthEpeoDXLoajlyvDfJ5l
         aH3I49ulXAvJ/O1ZvJvbFtAQhXmcwcg/lBZTRvmumlKkYk1nPEFL3/eKL1X+sL6u4nN2
         ytAbv/r+XLLU3eTiV1SJgrbPBl8+dswh+7rDd5N8d07h7P2IVd5w7fa5Rw/k6EwzuAM8
         ramgZjxUMwfPkdzrioHf0RLKVuSY63LM59ikQoZsu3sLfW7NfJJqypZJD9NkLOfXjRaE
         5NhQ2SiYnCyHdRl5bJmFOY4FVKKQusAEuX/b/dl1qcGozcPUk3q32dFP659P4hDs5Rtv
         Nmcg==
X-Forwarded-Encrypted: i=1; AKwUvBwFgY+SzSGjAj3W93QbQZsJ1y4QlWiy96Ov11dY05cpRY30QwY0gcnwjX/EfNUzN5V1bvG79ncF26xuYCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX6a0UYsmDDnULBEk8tSQqIazZ6PGnu9cjbjzUyRbS7B7DP+Av
	yDwppc5VV/gLjxo25uHMCU0c5g7SyFRBv/fFA/a12PZSX/PD1VjdUwQ/
X-Gm-Gg: AYBFou3OLQ8K55Fa0IhdSSLUPvyPwMEQOOKcOOu9vYkl7i2v57r4nZxLn3Hg6dpt98l
	3jJ6FlV6FPXq310C6IibI038kMWhXwhYIqW6jgP0byB/dNcrxXOj4chHEbib6Ze9RwSy7NJmRC7
	GqMb8D+XiqI/hQ69bkBr8OPZdXR5l51B9fKRVCKBYdxGPXsYhKJqRJFUd3cd/g3WzVwBD1deBnj
	mZmzvJTLneVqLAPQBVW2UZ4/uTNp1OSgdVcopnIKiajoF199J1FMl2mqf4JsQg0RAxJJX0S9maL
	jk0XpkHItyuUot5zJI9+9kF3GWvj09toJU1RoeBeJQG0iChoAwAykm1ZX1ornL6t1kf+N+ey6aC
	aoThjy7XdT5NeDjg3+DSEzxE3woJSH/4d1M2tGzJeeBrYi2lw4vvxQvYyxc1MZyw4jNvWYPqnBc
	QlsKFhsxm9MWoTQiqsHxAC5Qyl/C+Oa7byouAb9VPSGcnY7PLJQkUyykxCeSnyqREBRtKv+hwwQ
	AejB5x9/r8+KzkXDlfmRcXR2yaoG1qd05ds8/8+8/t41GBGtF4=
X-Received: by 2002:a05:6512:1289:b0:5bb:7ac7:80e with SMTP id 2adb3069b0e04-5bcde6c271bmr6857078e87.28.1792062156967;
        Thu, 15 Oct 2026 04:02:36 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:36 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:51 +0200
Subject: [PATCH v13 4/8] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-4-778a12cfe93b@gmail.com>
References: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
In-Reply-To: <20261015-i2c-mux-v13-0-778a12cfe93b@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=CNWJl5EX3MJMdXQfW83XU/Cuf4vxP6WKM1nBj2uURcI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKyZcoMyB4F8eYwVWTNKj2bL3bo1uzqyDM+Y
 H+6r/V+N6eJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCysgAKCRCIgE5vWV1S
 MpNuEACVpIMVYWflxdy/fiYLBASa6kBYSW3zb6an5/MxedA0EV8rVPNc/OzYJK3ydywqNbGahN1
 Hzhc5OVGJuOb49EqVZOhaWyCTqt3dtZChRINBxhW60LYnBlywlzQWxqs72AZRYDjR5vfjsA3GNe
 8WPAXrcgQIxvsXuPIGSJYsZmV5i5iQvCXgGjkxTK9sNOY6A4McaF5YpPSeNN0XaGBN6Zdh6SYxa
 opvpRK3Przntr7rHxX0r+LFTZ98gibPrHx7ov/U1Cp/nu9l2dz/eKgqYf5z9kTqqGJS24waZPa7
 9Bc6w7iuYGrhOWJ+Mqx2sGI7Uzw9fPedEIDbp/7V5NdTdeuEJy+jf6efF5qSE3XCKxB6paqUMow
 qHhB8aomtJAlM/BS/zeQ4Mc5rBhOzGdCbrRAOQeojNsRVzwjxqdbTHTJHMQh3+q/wOjdDSGUGuV
 0jHpa40VbUKI1q74QNaqdydoD6ENpNLXr7wq66F5HsdwHyON+QwFYIWYfyqrdOQsbLvUFIaXpL0
 DT/u9ctNaQwyegO0rUHJMPCwlhkqE5Hr+4YUfXhP3Bykt8jJ9KFS7/yH3opTXq2MVtMyKrJrN8a
 Da2QYlYcWiSfulbTaW4ivSDKdM+7Dch/9CKTrHCPhO6aKc7MN0BlbXqryiVaMkdLosN/391uJ8a
 zgR8hjI01nEq7hQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index e15eef163a8f..f543997c31e9 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -132,8 +132,8 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency (kHz) */
-	unsigned int		bus_freq;
+	/* standard bus frequency */
+	unsigned int		bus_freq_Hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -207,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = (input_clock / (psc + 1)) / (dev->bus_freq_Hz);
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq_Hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (dev->bus_freq_Hz > I2C_MAX_STANDARD_MODE_FREQ)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -240,7 +240,7 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKH_REG, clkh);
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_CLKL_REG, clkl);
 
-	dev_dbg(dev->dev, "input_clock = %d, CLK = %d\n", input_clock, clk);
+	dev_dbg(dev->dev, "input_clock = %u, CLK = %u\n", input_clock, clk);
 }
 
 /*
@@ -267,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_Hz = %dHz\n", dev->bus_freq_Hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -760,7 +760,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	if (r)
 		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_Hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.55.0

