Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B590409273
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360710; cv=none; b=URyW1QMXfiGZe3GOjb0Lj4LHix6ms01/w+UOyl4/+QmZWl8sUsiT9cRUTitUqzpKE5/3eUOzfn0JZYK6VhM2+Bg1Oh7mBCubQ7pzsWGkYIdGQWkZFLA3c5pO4C6ZpbwFa/DNA9rmnWTtaZSKtNAx4ofriHcGnDItbz6r8Uzxs+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360710; c=relaxed/simple;
	bh=5+xAhSNTy2MZHQVy/np/VjUsf51lDMQ2lB/7hMy0IF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TR1IE79GYHT8cwJi44GNiAaLrGXeEICUB3wzdXzNQUsQEHjKFHyP4By4L7gYB2mYfp6o2xi2UqcxofVRbXtYAoCBMA41TkSfVhUNSEuOn+t/LA1Tz/uoZawT/DBoHjoJLWhwGs7owmj+e8l5Lv+AmoWBOKVwoepDA/nWVKdSgQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mp7RkX+G; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mp7RkX+G"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so770710a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360707; x=1790965507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWLCx0r8AlMgp4yLMAlnbb/AEeR6IQzmFOzYO3/wf50=;
        b=Mp7RkX+GcBeZn8URFmAjzRDA3ziK5gPpmgn1cKiBuGfrlaj72XTM+U/fqeY/iUQgf1
         dd9mi0ybaZyMnG1S7V1Zk8bxTiRJBHpEnRb1FOT1gioj0F0j+XhyWvuoweczw1rG56w0
         GOfqZNsp7dvS5tc6BzhdR4Jw29S+7GqYje3L3VqIXVp4r8LSHBFhdmOalobYBT9eANqW
         p4WytE+QHxYETVqW6cn3k/4IFeVp+Y+QnE2tuElDmTLHR0XTZu/OM/xiSHl2m719q2vz
         Rem6tDnAkNLT0NnHhss3QMFvbvIBm3vcZhvDeUijmTmjQ8bBBOiPbszFKOkhfCycsHth
         PhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360707; x=1790965507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWLCx0r8AlMgp4yLMAlnbb/AEeR6IQzmFOzYO3/wf50=;
        b=HfWpOCojJgKV0nPHpwUO7nJq6OvyVfOO9zEMyucwQbNf5E/wbKXiaUFHds6g/n1EoL
         YXft346qhsINmE/jkZXGSW5BT3ESQh7YxbUbpNeDgdkG74FyYjRAPzL7Uzslvjph12ks
         g1eIGoxZ7xizE82lH3vMJL/3lllY226BHzwQ+lRrvuhfZ8dxcAt0gEtfo2Z2Z3YxvR+n
         L2TE6gzvnPFz11oWOqCJ/CrHYBlOrWZHgA+UzHFKChGjgwIJYOa27MTNWsJ3lGKEk+rv
         vuab7Mq9+QEeZu5yzJbgsPmeCEfYI4LoILAsv5/5icP0PynLfXQzVoXwQitGJwYGAodl
         nhsg==
X-Forwarded-Encrypted: i=1; AKwUvBxfU0rusgDIRc5G6Fg9ZVmz6vmEtUIfyCufSbAk4HluyJ1XBvoR3SSqiufHwt/TuvxzUvekoUWj/PjHgcI=@vger.kernel.org
X-Gm-Message-State: AFuF++kPqgSFlSOWYUJvFy8nvFYAal6CoeJvWEv8cKlcEsP3UhQT2Z60
	Xf38vDmOlN9Y4Mn7Vc7uOF12+DO29y8vhdeFdpo4J1iE2CLBlAsMlMNW
X-Gm-Gg: AYBFou3gyr9jG2zYHgxhQ1J8SFdKkdhMWroxJmQvGFYJO1cQq2IkY2McHzaF9GzFnXr
	K6C2hfjDrance5xKOP9T+e6IIAd3ebZMfuUVLUSUa+dItRMMrTFtKCKzNclWTuTCyt90czuXmE7
	rhX2kpk7E13RY9Ak941CHy9ScLMqGfp51DHOekyo2879esH3QY32r/+3F1OMBKBhaQbGrCmZaNN
	x3M+dSeNve+/c8+TOelwUuaB6k/ngcdSFxbQUsdWPCRKt80dIHHyFDS1RR0npuPr2OLF1Az+pAf
	kxfFBrUtr/6yCF9WFrHW0XCV1U8bl4DQHke4nx1BzsxYFXx9mnS22VHOh80WPW0YUWv8Z+0VfQI
	FfvKu8Cq0OJImOdI4/8DwZoVwEspgHyHX4b1ZkgTvSwgX0NxT2qY2K+we5Mvtl5PnNaet6RqRLD
	yKpLSp/+dIJRHmsjPABvL6uEP/XZo71WqZpQl60FyxZlQIEOBsYahU7mwto3MwxvcgGwV/N1a6r
	vwohMNmXZEeuvvpnXqr9KxBRVki80S1bEOxaV3DFMNN6xsyPcpB/jbP78/fpRDEPPZPBLhYNk77
	5olHRkzEwd2feu/ePlm5Xm6V/nSFe8geul9d+LE/B+MCALWG
X-Received: by 2002:a17:90b:384c:b0:3a0:c8e6:ab23 with SMTP id 98e67ed59e1d1-3a0c8e6b96bmr1504783a91.54.1790360706898;
        Fri, 25 Sep 2026 11:25:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm5693240a91.2.2026.09.25.11.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:25:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Timur Tabi <timur@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE QUICC ENGINE UCC UART DRIVER),
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] serial: ucc_uart: Use platform IRQ helper
Date: Fri, 25 Sep 2026 11:25:04 -0700
Message-ID: <20260925182504.54976-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid calling irq_dispose_mapping() by letting the platform_device
machinery handle it. Also enable possibility of handling -EPROBE_DEFER
and other errors. Handle before any allocation or anything to avoid
dealing with gotos.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/ucc_uart.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 6b7dcbbacd13..c3c83a59dcce 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1238,6 +1238,7 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 	struct uart_qe_port *qe_port = NULL;
 	struct resource res;
 	u32 val;
+	int irq;
 	int ret;
 
 	/*
@@ -1247,6 +1248,10 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq(ofdev, 0);
+	if (irq < 0)
+		return irq;
+
 	qe_port = kzalloc_obj(struct uart_qe_port);
 	if (!qe_port) {
 		dev_err(&ofdev->dev, "can't allocate QE port structure\n");
@@ -1338,13 +1343,7 @@ static int ucc_uart_probe(struct platform_device *ofdev)
 		goto out_free;
 	}
 
-	qe_port->port.irq = irq_of_parse_and_map(np, 0);
-	if (qe_port->port.irq == 0) {
-		dev_err(&ofdev->dev, "could not map IRQ for UCC%u\n",
-		       qe_port->ucc_num + 1);
-		ret = -EINVAL;
-		goto out_free;
-	}
+	qe_port->port.irq = irq;
 
 	/*
 	 * Newer device trees have an "fsl,qe" compatible property for the QE
-- 
2.55.0

