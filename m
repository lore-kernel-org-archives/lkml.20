Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A694306B1B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717574; cv=none; b=ou/Y0CpbBvQR+0+1YaMmyJOgEfjXTNWg5qP/bRJCJuKsvlHUG5mVtJqW1yB4W+gUPvR197FFlB4I8xSuXRIMQuRF7KY/dgzRX2AtnLNwUZzd+X79UCMikclSZjwmNqdKFjsu63upmyQNQNsmvCjJ65lXMBDUE/6DjDTTXdX8S58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717574; c=relaxed/simple;
	bh=2SXDsS5wy/DJY/6q1ZX3DVF2JgAhS3NkxwvT4ZIegO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKZfIl7eiClj1CPsPz6FYavEB+vCBy+nFGRMloHBhozaCtZR3DQ7UC+DvT+o8iAY30TWkfB3hJftmn8I2yxO4XTKSnVkXaI66WrxtqBsBLMjQeTjo2VkmPynQ3zKfWk+L3nfKs6JgZxAUsw13EHQXozzvhPd/DVY54qoV6ovV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJEJFrsU; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJEJFrsU"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86b90133ae8so320810b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789717565; x=1790322365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SInoAck4kPSdZMq0ZJdvww+HIYJKSPW+Gpf9er2XW6E=;
        b=NJEJFrsUPS3aqJV8hyejXZuzzXihYBGFuxNxOwjMrKa0IJG4P6S1kg1wwpmfCZwAn8
         Q6cI1KedYblPQ/ol5uMbIbNhKF040L7flBZXCsbwCA94D/pBw0cnzgLKtxlWxKBcMp05
         kiTvgEwNPfCS1tfrNweRYKiOMtplvkgg3P0+1PsGGJFk1LcqGp85VAIlkBIv6sPA8lM3
         qsb9OLuT284iQiJXzrVxhxg/077HBlpNt8Dzmq+sQv/UX1mV2HTGE0qJVVoW/rM+nhQ1
         JSnY5+T44IXSu8iqAg3cqpxkVK8eby8ZZX+gIuFs3cxvznJu1LcBnRQIQPab14sZpOmU
         T8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789717565; x=1790322365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SInoAck4kPSdZMq0ZJdvww+HIYJKSPW+Gpf9er2XW6E=;
        b=j+b3imC62vHjOXAUFtqaCCEjN3E91A1C8RHCG52q2qys27Znlu8SururBYw8ySBp8l
         dI8KjGKqgjrjmqe40iN0btVIke2uJYXy78jE2rLMka52HOYd2hnaeznBxBTL8wpB/S+l
         tAFhZNb0kfuo7S/Lv7BR4L9hv3GhmDS7Ot5GWtH6qzu5QOc4kzKNtSmjl0YZYChnFqRp
         TIcrsjYletecaMiPCdGmU/d3v5dhiBjyppW60Vm2hB7ZY0uy6+Vby6VsMCtRP6HuDl5G
         US2bKpS7NIrFGWEOM1rJVKfE6IIpA8dZLcBj9ht0kZhRwV7fUJdEvI2mAjhK6FSTVgY2
         MmfQ==
X-Forwarded-Encrypted: i=1; AKwUvByNr97ST8Atznnvi++Aqw0ensmKP/S8LToqoHZyzkHcfZWN2MuGT991giiyYyjnO/dimrDhh0qsQ6qKQvI=@vger.kernel.org
X-Gm-Message-State: AFuF++ncIWFwtM95ztxCsF/+zmJ9XFB+DWAiS24lku8JdZ5CLXTry7RF
	5FotryAnBzhE72raWn6ZHwZd6leSNjsYLqumUG6cxYjSoDfgIT63a+nJ6zuFHGZtm84=
X-Gm-Gg: AYBFou3JyW18VXs5LJzGYlrAmr6RqX7oiwlZUCA2jfcuOmdzaESMoY04Mm3fOc7NZIH
	/t/c5kSubD1kmQVdC0I/rfCZD95qsBsKasX06nIdm3PVEX/bNWy/T0CYnZBZAZcuCgxD61oOLL1
	DoCERpL0Sh4wwmbJrN+Z3NPpZyTGpged+99PknxriJK0oduvuMYkSz3r9kszPFMA4qt2Fz7HiYz
	x/DMeIxMf65uQh1jobqf2m038SjImrL1VJ1KgnyIpv8XGE6i336SAEovC1Go5V6c8ZUjiS8hEHU
	I4AbwOl7EJOT4Lgeu0xoOxMy+AmCUZctgzrKxcZnuByiPdzsw92oXB9D6W+RHlDH/tcaniE8qnA
	khxW4gojV4AvNj6BORUMQe49QDkFB8QknbsYCrWUmLBKLp1me/3Dl062GIRTf4sJrihyztOj97d
	CAn80EoBraHk7xJlaJg+BfZcCLJrloGWOZ/Bv3PqhEe1+OsSbLM9rRmJYBATkDncBGHiUWEKP82
	T2GISgZq712QSsaiDXSm8RKixQbb+ovHk/B6h4=
X-Received: by 2002:a05:6a20:6f9c:b0:3dd:85a8:cad2 with SMTP id adf61e73a8af0-3dd8c4b06b1mr3259004637.41.1789717564818;
        Fri, 18 Sep 2026 00:46:04 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2872052fsm2491833eec.11.2026.09.18.00.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:46:04 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH] serial: 8250_uniphier: Use dev_err_probe() in probe error paths
Date: Fri, 18 Sep 2026 07:45:46 +0000
Message-ID: <20260918074546.245342-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get_enabled() returns -EPROBE_DEFER while the clock provider is
not registered yet, and uniphier_uart_probe() reports that with
dev_err(). Every retry of an intermittently deferred probe therefore
prints "failed to get and enable clock" at error level, which is only
dmesg noise.

Use dev_err_probe() instead: it demotes -EPROBE_DEFER to dev_dbg() and
records the reason for /sys/kernel/debug/devices_deferred. Convert the
other two error messages in probe as well, so the whole function follows
the "return dev_err_probe()" pattern already used by other 8250 drivers
such as 8250_em.c. Those two codes are never -EPROBE_DEFER, so there the
conversion is a readability change only.

Errors other than a deferral are still logged at error level, now with
the error code added by the helper. No functional change otherwise.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
This is the follow-up cleanup suggested during review of

  [PATCH v2] serial: 8250_uniphier: Use devm_clk_get_enabled()

and it applies on top of that patch: the clock hunk relies on its
context. That fix is not in tty-next as of today, so this one should be
applied after it.

 drivers/tty/serial/8250/8250_uniphier.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index 6fffac12277a..7d558b750f83 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -165,10 +165,8 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	int ret;
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_err(dev, "failed to get memory resource\n");
-		return -EINVAL;
-	}
+	if (!regs)
+		return dev_err_probe(dev, -EINVAL, "failed to get memory resource\n");
 
 	membase = devm_ioremap(dev, regs->start, resource_size(regs));
 	if (!membase)
@@ -181,10 +179,9 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	memset(&up, 0, sizeof(up));
 
 	priv->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		dev_err(dev, "failed to get and enable clock\n");
-		return PTR_ERR(priv->clk);
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "failed to get and enable clock\n");
 
 	up.port.uartclk = clk_get_rate(priv->clk);
 
@@ -216,10 +213,9 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	up.dl_write = uniphier_serial_dl_write;
 
 	ret = serial8250_register_8250_port(&up);
-	if (ret < 0) {
-		dev_err(dev, "failed to register 8250 port\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to register 8250 port\n");
+
 	priv->line = ret;
 
 	platform_set_drvdata(pdev, priv);
-- 
2.43.0

