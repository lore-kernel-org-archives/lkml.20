Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABD2248BE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131117; cv=none; b=rMCrySal3cnKO5yNbcWLZ+qHisC5y+OtpY5+7vIBeXt6nsiIKIWnSUoL/R2P48YT1+n0tGcN0eLS9MblJem6fQBfcxDMsTm9YVkeQG1T1Lee/tV94Org+2jYetWr3gW5L8myQcQ+oX8WknYASnGrhWhbVs6yEZHyllj9p+N+Res=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131117; c=relaxed/simple;
	bh=Z4ApbuOXeZFJ2fusE4nluHa9lroahiFieVjdHR5r3b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aW9mggK5i7Zi7OZd6t1P3C7DckU82pBwC4HISdtr5f7PPVbHlnfGQI/lGjVp+JSLH49SzY2E71cPfQGDi9vmXT95CMb22/A39UdM2KU2WQv6Alj/UAY+esyEcDZToIRlFZgoBFter+hWfouixCSrbxDSj+tjLLYb/K/hpWtNmEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdD00T7e; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdD00T7e"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1419d3416ceso4984032c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131116; x=1792735916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2FM7jcIWlJ4PIwiCNBi2mvobRhODT2uuOupycVzBlw=;
        b=WdD00T7eTXdQ8s2w47F2v4DDeG+Gg47XVcHOwQWpNYhOMG292i8l7ZdEG1lEoDQEEL
         r6RMLdAaDaF50cf9vGxEwHR76xabpOnB9ZVXLECmgkJzyQForDkKTb0StXl8c9hGAGlX
         acj/ctzJSWTTmrQwoSAU46gcwUpHkYVmWKKIb19Ekf1Ykahs8mjXbztJfoH10hPCdvBS
         0dy6JKKn46DAQBV8DinG8/bxUsvukMPjBhx5tXUxzhsGHhckxO9vwqPd9PP61sNsFxMa
         moBCGyx/XwgKzuZ1camU7iaG/rWNhNFbZzqSH5aChYmCWzfJReP0b0aXu70GVJOk6Icf
         oIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131116; x=1792735916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2FM7jcIWlJ4PIwiCNBi2mvobRhODT2uuOupycVzBlw=;
        b=fc89LDv9lpt8uIKLLEEUxXB4lnH42LH/1CQxguUtPwcZvrqGaH/cTud7MkEcP3rSe6
         l0IMkeR4gAEJ2jVH/iNikN7NY3htZF7F6zINuuEwPKTaDFo2de3B+Gqs/+2xe7TaAgUd
         lr2UWYPCzQdNOjRB2uZwmuqZLeScepRxgeumu5/GEq+FWXrAZ1vz6xsN+BQD8D/mompt
         WFmLsHdKYhHcGD5kq/eWXMsquGIBlWLT7XrRo1PosL+xxbwRKsDtJodloYnu10ARlZX3
         SrwG98SW3W2cLVy2oCflnOVZTkOxfu4RzQdibywYJYN6AcE4cmQxAKxZzLZTYdlt0XpJ
         GmxA==
X-Forwarded-Encrypted: i=1; AKwUvBy4YlawJHJCQs6qN60VTNTauC6P03NBxTqhCA4J42JOLbz6ZkKDatXfz/1HWbz+iCM+Z2SuIVNHkAoVVH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjl+Q3BOU+YlD2Zv9aWRp0BQquRb15FdcwoNMUuRT0CVNt0n9f
	dbK4/rzDWCXLbZON+IrlskpfxOeXIitIKY0xDAmDiTWWBz2FMdOvYS5V
X-Gm-Gg: AYBFou0tULFRX4eKTkvkA+QVHyIZnTEdOCmyKokJfm76zzywNwWdBugAPfeakHBTQPy
	Yn3LR2nLfg8BLryE5gpT9jlW9OjWXZkEdwVVBZJRrgleMeZgfi1A7x0FYkIZjzYUpyhb1MS8ruu
	9MYLX3TJlwf9kAv2CPVR8ywYLslLxnfMtLGVzUgoEVM10VzpjCKfLP5vsVEqTKQMH3PDV3IEV35
	3une5wB5WsEv+GMLvB3csoeRTiTzmCy4xZ+S15cFsf3Ik6ugVXZ+4W1wPJAuaa6SC+8+B1ig5fm
	oTodHs8rfKEPTfwYEdYgOZ2t017Kasn1evRdO5tinKdgF+anYLx/UDpr7phMgiNa+teTfXjfMt8
	+0Z5HAYrKJQ5TDbw/koSRyviVtjwMjUwBiWLKxncl2gqqO4YC1EM2UTdYMGPri4pGtEiIzzY0DR
	5RaFGHn7vYqKJD+voUhsfCa+b1f6phoXiMFpkq1dbbiABT70RoG9X3UtInjnYgfVEjMnakerymj
	QjlKjro9WgECvn+krGw9ziVPbx3QsMhVEd6ojNjWxaDvUU=
X-Received: by 2002:a05:7022:f512:b0:16e:4723:5f86 with SMTP id a92af1059eb24-16e472365c0mr21571004c88.29.1792131115688;
        Thu, 15 Oct 2026 23:11:55 -0700 (PDT)
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm3755480c88.13.2026.10.15.23.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:11:55 -0700 (PDT)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/4] can: sun4i_can: don't discard the IRQ lookup error in probe
Date: Fri, 16 Oct 2026 14:11:36 +0800
Message-ID: <2a7cb6e4e1b494efd4da512abbf307c19d9d1467.1792118040.git.chaosheng.qu.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
References: <cover.1792118040.git.chaosheng.qu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4ican_probe() collapses every failure of platform_get_irq() into
-ENODEV:

	irq = platform_get_irq(pdev, 0);
	if (irq < 0) {
		err = -ENODEV;
		goto exit_put_clk;
	}

The driver matches through an of_match_table, so of_irq_get() returns
-EPROBE_DEFER while the interrupt controller has not been probed. The
probe overwrites it and the driver core stops retrying, leaving the
device unbound even though the interrupt controller appears later.

Return the lookup error unchanged, which is what the neighbouring CAN
platform drivers do, e.g. commit 057bd6168d98 ("can: cc770: don't
discard the IRQ lookup error in probe").

A device tree without an interrupt now reports -ENXIO rather than
-ENODEV; the driver core treats both as a failed probe.

Build tested on x86_64.

Assisted-by: LLM
Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
 drivers/net/can/sun4i_can.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 76db6d09d1e6..a6c761506244 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -856,7 +856,7 @@ static int sun4ican_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		err = -ENODEV;
+		err = irq;
 		goto exit_put_clk;
 	}
 
-- 
2.43.0

