Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054A64D09EC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062156; cv=none; b=uYyNTq7LF+xXyBUQi5VSHTCLBEgJBmHU5c8gaWscfwTiIzrXfw2w5Bjl5DKX0s3Xu64+pi92PNXUJUHe371YKSTkYr7VyTiD13dqxDq5virggNP4vkLqLKxivh+FqHFCs0qDwP9X5lGKbu6gUOtlt6HFp/ok0fRaZEDYiKu8HJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062156; c=relaxed/simple;
	bh=4ap0qTWGOZgih1AXnNRPW+rFGzJn+i0/7ped25p36lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fq6gUiPdojpVCLbnGwBEY8HynbyVXaFWg8P9gPfUQa8YxXnCFZWgIC3Of8NX1g+aAh98+yx1NrII4cOWp/+1fUFpi1mmYl+aMzyq2l85Fhy99OQnkgqVmqVwV7IiD7AjRDPr2m4mJF6pprufbyKRGnOONKRm3YyM8Q9uQhqAiSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0NtDqAZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0NtDqAZ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso4626229e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062153; x=1792666953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8a9BS5o5MDEOlFKxjri8LZd6JmLpT8LmYs8UVHNz++8=;
        b=T0NtDqAZ7j+1Z1BdofJ0ePTn70I29jhHQoUfjox7996xLFLJfu6Ea4qB316fFZCl9G
         55blCyuMwVtYVdB2NKjjB8buGaEONYJLSs9v/9OFVzj2TrZIFyiN3CJO+wpKxsIoReaA
         C1FaOvEu+VLSxqcTzvQA879tU0jGe2oHHxyuckPq3KP3H1hVAdjGPwqk/k0sDE7zZIGZ
         zsHoSOtMkKeGWLwnlGIWr7axSbf89Qav8/KCK+mkIJHjX4CtqcnEt/sA4iDZtaRO4Hx7
         DN/5lGFPNoEY4GJ7+YBm84RPFezojjA0ZYvD/QJHg/GqIFkApuOqTLzrM2XWqpIm0UR4
         whQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062153; x=1792666953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8a9BS5o5MDEOlFKxjri8LZd6JmLpT8LmYs8UVHNz++8=;
        b=yqSjzrE5rjHjkuAkMPrVfLv0n9+oisX0J34B6P/XBltC+wEPwlTXimG0PkJDbBUOEy
         6no1srUFXTmg8s3laZTgsrGJaHqawwx8UhLy9eL/Dv+z4arTWMFEP8dsUceKtVxqhO+2
         wc4odLKbG74LUv23cTOPFwChJVex09AHw2J3jmTbrGPELYiW+A4eGj7G3hWyWaMtpy0M
         YHpXg144ucpPp0TMI3v6foOLFX6ZlzxoeNGqRiZ6hnXRQMGMuNNRuJV839v0mp5ZBcot
         0rTR30oFqTcVYWBw+eN2yRZpr9iBseAqjCdXEdOCxoIKBlVnLG2lYDewVxes9iGil/Ig
         BN7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmq9EmuExi+yC9AgVyTNpbeoQzQG6ep4Xmvmm6Ta9iXit8OOOyNiVuq0OzYsX6IryhLlzUEMyHoHKbfBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYfO2G0DW95aQYcvTuTAu3d92eqOwnFyhZx6ykNkqHR77PZGc9
	mBrG8sD55rcecqMffFcQsfvARpLXSn7rN2YG9lsCMJlVG49yK80hAJW/
X-Gm-Gg: AYBFou1D4twDPfrbkl5/8b+es4EYpCkWGmsa5hrEl8kvjqLrEairMlHLwx06Q0wf302
	PaJ9r2JRPfqXWjeoFM6wU/RdGe7rEJ53w65psKAlSSj0x9Bc3GTAFRmWc4tPV/G8O9/XbwyZr5e
	4tM5qDyr0xkLfsaW+rpfu0W6jPFftlvQQshDUJOgg/jszUjT+q9sS6SH4oUcwCozeIRoa5WjirW
	MJsIDwU37eQOoXT7pFbwnrsjwXzkKqXa6UDkbAGzhH9tYb0eNwWjyt21FdILAOgxbOMa/hjFY4j
	xph2anrum2WCvuhDw0SmDrMdgbkSKneOziGBIpdbOkVPFimPSvmNZXGceFQA0cwA7qtElfyUNBf
	MtUWUJ6FJgorcwEFCdTTdYOVNm6rKaEb5fVEguLSnR12tRSvqeV1XXiCm7sVRi4zKBKDj3DoFt6
	Cxj0XTM7+QWN991qNcr7WxAWMbj9n/8xjNRyo/5rEJbrIk4uLgAZR1CIEF3kvYcbH1S9rd6l5he
	tZK8OQJUAV3PcpWoJD8RqhvuTedWAKQmNkPoMuLOv7xkbl2sVU=
X-Received: by 2002:a05:6512:3d16:b0:5be:42c0:6cf6 with SMTP id 2adb3069b0e04-5be42c06e61mr234143e87.6.1792062152686;
        Thu, 15 Oct 2026 04:02:32 -0700 (PDT)
Received: from [192.168.1.135] (81-229-40-193-no2450.tbcn.telia.com. [81.229.40.193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3739b5d1sm905465e87.22.2026.10.15.04.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:02:31 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 15 Oct 2026 13:01:48 +0200
Subject: [PATCH v13 1/8] i2c: core: add callback to change bus frequency
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-i2c-mux-v13-1-778a12cfe93b@gmail.com>
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
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=4ap0qTWGOZgih1AXnNRPW+rFGzJn+i0/7ped25p36lA=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBq0LKjS9gv8htmWbUa+mRSHXHg39xhgl4v/q/0M
 8UiIGiLUjiJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCatCyowAKCRCIgE5vWV1S
 MqpzEACqhNkDj9R2p7VsN81RLy6iRqiMQLVV5o24tYcSG8zybFha/ATDIVbTcYl3idD09jzDear
 lkj5qmtmYxSPEnSNW/FudyAeFhkGbrktpeb+iom6uuDX7ECW3sS0Zg9bQExVzmkp0IU70w8/AIK
 f3e3FEyYsRKfRzWZXf8t4lW3Jr4jmGVeAel+W0uUvxIsbcpBw7iyeXgk7xOHeXwcExUQ4LpoEUU
 LSH2YX/e6yGzwXVmLFifXRHB/yi/0TjCifRgLb52G9x4kI0DGI4LHcKKd9pA2k3fWm8QXH/8273
 bVqOTxGmH8WBDnzNIyTO9hu5nDWrFIwoJ/ddschP5XCQtsEzzs02P/EnDFrtnAd2Ebycwca9yxr
 ztF0tw0VdPIeYmMiWQ81QBZDgRaL8sPbMuy0cKZGb9NT+T1YoqDoD4MiL2D+ZwsFP5uCvuCi28Y
 lcmWcDBGZrCVTftSG5HKDI2GUMzNPaVBJF3ssEDjx7enens4Qa5fKXAwndrE0Ky9bAxfSbxRKpR
 M8YIHo4qVgCWtY59zJ9yo9HlUltQqHpjXP3UXU3do85r+YsMiZRjzmJH2hx86NhXbIuvuf8pHON
 RP/8iRNIYmqDJ7Ggi++UXj/eQ2WLZtQfdBPntA4iottyJSQ+nfCdGQFslr+sHQl9ZW3YrFhh4Jd
 9bVLSlQBiNIAtiQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

All devices on the same I2C bus share the same clock line and the bus
frequency must therefore be chosen so that all attached devices are able
to tolerate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that run with different speeds.

Prepare for such a feature by providing an optional callback function to
change bus frequency.

As a side effect, several bus drivers keep the bus speed in a
private structure and can now have this value stored in a uniform way
instead.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 6a847fc88d25..d2d60e937244 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -635,6 +635,15 @@ struct i2c_timings {
 	u32 analog_filter_cutoff_freq_hz;
 };
 
+/**
+ * struct i2c_bus_ops - I2C bus control operations
+ * @set_clk_freq: Set clock frequency for the adapter.
+ *	Returns negative errno, or 0 on success.
+ */
+struct i2c_bus_ops {
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_Hz);
+};
+
 /**
  * struct i2c_bus_recovery_info - I2C bus recovery information
  * @recover_bus: Recover routine. Either pass driver's recover_bus() routine, or
@@ -744,6 +753,7 @@ struct i2c_adapter_quirks {
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along
  * with the access algorithms necessary to access it.
+ *
  */
 struct i2c_adapter {
 	struct module *owner;
@@ -760,6 +770,7 @@ struct i2c_adapter {
 #ifdef CONFIG_I2C_DYNAMIC_TIMEOUT
 	int user_timeout;		/* I2C_TIMEOUT ioctl value in jiffies */
 #endif
+	u32 clock_Hz;			/* bus clock speed */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */
@@ -774,6 +785,7 @@ struct i2c_adapter {
 	struct list_head userspace_clients;
 
 	struct i2c_bus_recovery_info *bus_recovery_info;
+	const struct i2c_bus_ops *bus_ops;
 	const struct i2c_adapter_quirks *quirks;
 
 	struct irq_domain *host_notify_domain;

-- 
2.55.0

