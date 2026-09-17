Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E6376BC2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617939; cv=none; b=CYXkhyoD0MSyK3+kcwN2sudI9pR606fUjyKgfLRGkh/uo0oMONe6ClnQfERg8ZCR5J1yNIoDjfH9Vu2ixUzYO9FxLG1bOpzhXA+wh+ATMTs4vXXnzFFjOGZuZXQ3WPqZsoYMlWM8fSpBcAb2r8ca0uyw2VKE0mAAzbhOmiJWMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617939; c=relaxed/simple;
	bh=JTbnAtARgUQ4AFZJU9OHPxz7uBUe6OrzJYGrchxPvP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OIOc8YZCf34RW7g+saApnkFe7p69OA0GoLHM7V+X5M4xkDQ26oRsZyLa+5x4/7VnV/ufG0nBdKHpRkkMQc6h29YXPg9aGZpl10hBwfcXTmWyGNBb+AQjaquoFndPnhdTtCwg8VIctZKhQqlA4nvboEVRWG81X0yq/YH+r4pXHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBYTwpVt; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBYTwpVt"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868cfc5c244so215637b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789617934; x=1790222734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtX/Qf6NK/20sK/bOaui84KkOiA6Sp6G7U7L/FiPWA0=;
        b=jBYTwpVt5Gk2BmxBp86oAxG+yLbCOEbJDABiddOhM+yxobsuSaDzazf90TaAZQWTFi
         tloJBuKMNcTgaEiJdxU1TVuUt+q7DQFO9WINLUbYK5yOFWZW0CzRrSYvXhIT+ah9pt+y
         NMabFUABPCyvQrdIb8nqNQ12pCiOO5rlQbazjaOu9ATKx/zYPKJQmySpk8K3K+ZQ3sfW
         2WsckDRlnckbFxcJ18lk0qGo6EI0ajJ26JKaMY7EiWJvEAqpUy8DoNOJtPjoHH+JssvW
         HULUbOBgAfFwkY2HweNg8ZXCh9eK1JljaNyxpw78uWfJl05zN0rigQROlPHqb6DvLaiC
         NKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617934; x=1790222734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtX/Qf6NK/20sK/bOaui84KkOiA6Sp6G7U7L/FiPWA0=;
        b=o8exF70Ur6GG3XLsVHe5CLG9UY6uhuui4CZrToGn7TNZ0E4VOgQ8QidfdYua7guOdj
         OKf2nAuIGW8A5csPgq1gMt8t2+kq8/kUViEvPE5ZQjWM6iuBsIIyI7Ith76YXrdwRMFE
         dJ/qZiZoLu6y0mu8OgjSLSUjGRDd/w2MqP4ZGI34b1hCThGvRH4w8YE4rr5H2+OSgow6
         Dpf8iRKxCxC9wgG+8PXirGbnEQNiQ9XIzJBJq2jEjdnQFz45JyHexyreZrSqcrl7Iw9+
         D3mjY5s4gzf/DQo/4hykiX6ar1GV5VCC+7ZX6CDbCfKEDI3DqlQPD6vQy6MAnMVYZK0E
         j6gQ==
X-Forwarded-Encrypted: i=1; AKwUvByOnIMeuXHP2AdNxA7xeH1ECPdvvBsM0OdW/oOWacPVWO1wuhe26k9pvkhjDLfIpvCsNeKCZVdNDap+zXA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+eVlgS6EWls6ait54lpIOF6ypIGX4ag6Co/6KsS1jE3ScpIKF
	P8tSgeFInfx9ysAkub/ZiN2oVvAld77hQjQJ4w43CV2AlEia7PDIacgm
X-Gm-Gg: AYBFou39QVMEoYjNQM1cp02wLC4d8Q2XV293mgdtGbkRZwcF2Zn0Tn4f7RNwjCreht9
	cpMlibdAUETp3A81AGakvVO5QnuIq0zoaV1rqCqrmeHu7eCqPy9aNEIy3ER+aW4LHtn5iPe6LLm
	fOZhvxV8yYoelPvNeDHgBlhpu3sY7m57MUBNsDsAJHM+dojx8aBidy1oKTKsuVfgjxTIhICj6TM
	NbzgL3ARxkCdnRLh2ecjTfheCRzAiBJOQR6Nrcq2YcTZhy1FLZfVOKrWfNT0DaaCl4Smw/TlSK/
	SE5X/DoT90ZauHqwQ8bdxe5nFuQkwBFDEnsqj/2QENXvqcLgLJ42DPGKDGpkUvmLW4uhSo/NPAw
	WoOP7kZJQp9TkK/Jki1//ff8MgHFbyzBirAPq4ABL+RUtaNNuUP0weBY5XAjYCTiom4a3DmW5jt
	jEcTFpmYw/masex2pDr2tpQmL303qwY6r9ST/W8FM8J6oKc4DdVRV/fTh4lio5Lz6/K+KFX8svt
	IBo7tQzZuBzsRqQIYoXGp2WEYTsix1GI1LUng==
X-Received: by 2002:a17:90b:4a51:b0:39d:ee20:1e28 with SMTP id 98e67ed59e1d1-39e1e510f73mr14802785a91.21.1789617934135;
        Wed, 16 Sep 2026 21:05:34 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cacce6sm10195833c88.1.2026.09.16.21.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:05:33 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()
Date: Thu, 17 Sep 2026 04:05:09 +0000
Message-ID: <20260917040511.103232-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uniphier_uart_probe() enables priv->clk by hand and is then responsible
for disabling it again on every error path. It misses one: when
uart_read_port_properties() fails the function returns directly, leaving
the clock prepared and enabled. The neighbouring path, taken when
serial8250_register_8250_port() fails, does call clk_disable_unprepare(),
which shows the leak is an oversight rather than intent.

Rather than adding another manual unwind, switch to
devm_clk_get_enabled() so the clock is released by devres. That removes
the error path entirely, along with the explicit disables in the
register failure path and in uniphier_uart_remove().

The clock is still disabled and re-enabled by hand across system sleep,
which stays balanced: only SET_SYSTEM_SLEEP_PM_OPS is used, so the
device cannot be unbound while suspended and devres always sees an
enabled clock at detach.

Found by smatch:

  drivers/tty/serial/8250/8250_uniphier.c:232 uniphier_uart_probe() warn: 'priv->clk' from clk_prepare_enable() not released on lines: 205.

Fixes: 26e8349c0d76 ("serial: 8250_uniphier: Switch to use uart_read_port_properties()")
Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
Changes in v2:
- Use devm_clk_get_enabled() instead of adding a clk_disable_unprepare()
  to the failing path, as suggested in review. This also lets the
  explicit disables in the serial8250_register_8250_port() error path and
  in uniphier_uart_remove() go away.
- Reworded the commit message accordingly.

 drivers/tty/serial/8250/8250_uniphier.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index e3db60bf50c9..6fffac12277a 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -180,16 +180,12 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 
 	memset(&up, 0, sizeof(up));
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get clock\n");
+		dev_err(dev, "failed to get and enable clock\n");
 		return PTR_ERR(priv->clk);
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
-
 	up.port.uartclk = clk_get_rate(priv->clk);
 
 	spin_lock_init(&priv->atomic_write_lock);
@@ -222,7 +218,6 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	ret = serial8250_register_8250_port(&up);
 	if (ret < 0) {
 		dev_err(dev, "failed to register 8250 port\n");
-		clk_disable_unprepare(priv->clk);
 		return ret;
 	}
 	priv->line = ret;
@@ -237,7 +232,6 @@ static void uniphier_uart_remove(struct platform_device *pdev)
 	struct uniphier8250_priv *priv = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(priv->line);
-	clk_disable_unprepare(priv->clk);
 }
 
 static int __maybe_unused uniphier_uart_suspend(struct device *dev)
-- 
2.43.0

