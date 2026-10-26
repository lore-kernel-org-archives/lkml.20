Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015555;
	b=F3lVrVlgfxJXhRPYiTZJNGrqu+WCQqmsICb6O1/F78S8X501+y4nzLd3YUopkigI4vYe
	 3UAv/K27UR4p1fj1AJMKE1Y1PXC+uNptgVqz8UIpJJkKpYXyO5rHiq20pms5+8gxxMx5k
	 uVKmlVwclt4SRN0Fo71LkuE0SgkcudCyRz5CPjSQWmPGp4MOfPTuccVJRldhoUNMRgm2w
	 qRgkRqYyP5U4cKybwbnwHwz3TA9BDOtQZyRdImdgx9xmpJragF8f13Rq1/emHe22Royze
	 vxLZIYpDLqxn916omnNfOkC4aHCyqaTt/iDBEEBA6OIN640j27+IcRz5gqlPvqeT19Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
	b=4rQ7xVu3o5ezYtAkpHMIXL/P9bYibgRy+ab1YXzSHxsfSkssmwgh3I1v0bnw/xvZI22S
	 OCqb1IHjmcEkZ3JrRpqrRGJUobWiT23l5RSOkYv2GXGYfP+9cJQ/EkgclTGvpfph9IaQv
	 HQDixsyBu72oogGzQvUl2xSI2hnUUUMckXKhrSL2Trvew5Rb5uFZZbcSm3wRfQpbvrUZF
	 wYKSE+CtcBHtXhNT2S3lKY2rX0Kktdfk5sNNINXDqe/cNIxRX6Ap91vnNz2+D29zewjSs
	 aFvTcWgDod+kl54mfq1pFYVq166Z3rWPChmKiiYZZhiMtZu4NjjH91xxfO9ZwOtINcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IsWxLjyv;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64081606A337
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64081606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IsWxLjyv
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06b436dffso1374745b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015555; x=1793620355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
        b=IsWxLjyvSS+yJR2TrqdixNFLlM5rTDb7uGtRIyBFo7Hkb3usvDA6pa/LO7PUAFYFm0
         jL38qgPpgv7tHi8v89bgFJqnUY1Cb5oudLNTw9Z9i/L1MOPyrevjKh5uO/m5w5OWIKZD
         yVSwWSrA3VEE/eKsrUv45Aw7PuG+L+0XAuCtpt9Ppm9VjKRaHh6dca1MFxfhriz9SHXT
         NKWMp/2+cHiGiYxdlCoJCmwdkzPp7cbleL9PvimiNxdhLHildiwD6tJL+vKrgom4h/Mz
         lFjOiTkcr/W71Re3NYhieMIM1wukkhA1IjrlnCWOYkGqheQSYffVJOohK4+bTpdYtWDn
         3lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015555; x=1793620355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt/79XA/yWxO2ogj1KSk8egFEeSfwKKUg9yTYHPXecQ=;
        b=hlJNdmSHrqcDLw80mLmJSwkXtgp2YXVHbjE1jD60/P08Eyh7cdd/sEImlh8C9plF6b
         +/lIomhQrwZbyVqe7yNLf7X8TwFIN2EupC5uJyEg2c8vuxEgTRLMulxC3kpOhW+je+pc
         7zZtc9iaJq4ygitf1uCDDMWIjdJc9NPohuzbuoaeT5dmTXB0DB/5jk5kSwHFYU57s5pP
         lFcTxWR6a7WJeLkEzrsAvY9R/nw2ceMSp6gO83yck1nWxISbJkvb8rR/l+DsNVtvnuxC
         AVvPO2wPhuvSS+HmTJ8q/KefVGi4P7ZKrDRtbWXKzSMvzB4xVt/jXd5Sge6h9+X3Wi4a
         BXLw==
X-Forwarded-Encrypted: i=1; AKwUvBxVEpdN9KAfYn4IEEZewuLD9TkAOkMvAph4MRx5qGjzO/jPfboLoy6I6UleJ0cZcF2Jt0P9JiwFqdoS9hY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgSDKzjEoXt5b6cqWoIWD81XYXVmrH72RYBfu97Okg8jbdD/Er
	waZgW1AgsNBOKp5yO5cIe6P+vpW1nY/wHD2I6xxmFNSm5//NDf10QvLT
X-Gm-Gg: AYBFou2YNkSJDyUI3ST+DywzdkESIT6SVdF/bl6cCxgn8Nd4PjCKD8ieWAUMG0zoWBU
	h/Mij6d8iKuFVrajsmBwY03tn+EMnD0MfeVsYWsFssjfWncOajpzAcL7t1cBYnHeMwQtnpy3q+P
	PMcly8Zw8D5hJSw9XpsEwkxEJtOW72xwfb2F32DGCc16FNwP0CKZrDR3wU2GYj44ut7Yo8oAy61
	59EfnnsGfDorKpOpHMvnPFcCw8pC+sjlX67cj8YrDQplfuDXfYQynE/LMd1VX9xMmPYV5vRZ22b
	eOEquI1tvWa1aoDPhBXIex6zUCZhtPRoJJrH2E+6tNOAK5GvxJMA4b4mpCZxsntM0Chp6ncQlFy
	BXfZ1IM96y+/Y5Lludi83FA/Akz9/nDETH96l+Zpr5qR7cwTe5/QpVGzt4xzhPzt4N9B4/MHZy2
	zyn3YHrCqFwD6T0nwziTUfv88xFGjy7t8Fgh4C4eBSmb654fh9csXfVaA+Vs51Dfaq0KG/HwZ3F
	u2Wcs/ushSRu3SQY73hG27Fh1aITqHdB/fSadr7cYDNeDgQTiXU5g==
X-Received: by 2002:a05:6a00:1808:b0:87d:ee98:606 with SMTP id d2e1a72fcca58-8a367f0eb74mr4959061b3a.23.1793015554801;
        Mon, 26 Oct 2026 04:52:34 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36ada2805sm1233497b3a.12.2026.10.26.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:52:34 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Gregory Fong <gregory.0xf0@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: brcmstb: fix UAF after IRQ domain setup failure
Date: Mon, 26 Oct 2026 19:52:26 +0800
Message-ID: <20261026115227.41779-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When devm_request_irq() fails in brcmstb_gpio_irq_setup(), the error
path removes the IRQ domain but leaves priv->irq_domain non-NULL.

The probe error path subsequently calls brcmstb_gpio_remove(), which
checks priv->irq_domain and attempts to access the already-freed
domain through irq_find_mapping(). It also attempts to remove the
domain again, resulting in a use-after-free and potentially further
memory corruption.

Set priv->irq_domain to NULL after removing it so that the common
cleanup path skips the already-freed IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: 0ba31dc201de ("gpio: brcmstb: consolidate interrupt domains")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpio/gpio-brcmstb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 44ca798cf832..3b1aaea63951 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -513,6 +513,7 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 
 out_free_domain:
 	irq_domain_remove(priv->irq_domain);
+	priv->irq_domain = NULL;
 
 	return err;
 }
-- 
2.43.0

