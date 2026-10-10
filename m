Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735084AD4C2
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637254; cv=none; b=CR3eI4b27zsfOPuYh9fhVK5R0WAP6Nm0MEHbQx6i2MoF7+ZeVHO/yQi/W4I/wT6SAY/SxG+C8eZ/mCwETiuBu0Lm7bd98R3KFM/H9VBCb5PPVShDchMqd+gY2EL4yH9/ZsuhWgr9T1yudLXevT+ceKzZu5FYXyvYmlvOdr3yQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637254; c=relaxed/simple;
	bh=n4MOVXWt9K7Yi8srXBDxZvBAZQxMnbf2UfzQx6vMP3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXnRHpLm6XneqH8WQPqmCOZE2fTdTS3OP/HSj/wHpVHzim+EcDQYTPRiKt8q+hw4M/K0Ry4YmESOgkVUp/fRUnlATHtygfdA0/M3Za2gDUOy6MkyptQjS9h1WcXOwGTn4cOOiSf8piTLQgEjEkuWeXQfrvxptKXZPVf4OFil9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDCqUVe5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDCqUVe5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so7620435e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637250; x=1792242050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=;
        b=EDCqUVe5/zBt7coTrFcTYjfJSGvIyGC0oxRwritUTgY4F2Yz5ihkvl6Wocoi+cd2Vr
         LmNijsnUhEtXBJVXTQLbY2A7vnq1GYlBVmV8S6egnvJsD6zZOIxPnM/zex/rd7XsqWrD
         3sm7yIiSskiCxDUGkJgNEPY3QsaydCWpl54Svg3zCqpV3+BC0oNX+ypUEKn1DYQO1rDA
         xclwkuaDn9eZhx+iihjhGNGmLgO0+nyEB90Ya2ZkVsZcxE8iiPexZKbrTC280TNzt1Af
         xW+V6rLGG240MuDQaw4KqIPhNUVmTi30bOEzNDl8Q9Oje9x/SALwM/IPA9gDfFuoED8x
         scaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637250; x=1792242050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=;
        b=mtqveSNmcEvP5hrEe2c2uCHB2vlaIRjMgx/y4bv8PCtq2ce3wZFMuoo0KdTSmZSThr
         7hkarO5uxgmtSTOzxyC9sk3bKXsWm1eEDCww0tUP+jsYtKcWIANe7iSww3ZR71WpoKHi
         MB7V+rYDcLVx1d/ZvwWv3c56VHh6XDaxePdqofjjIrlArAHzs1icC52OJu8OFaJMZ7Qn
         crZzL4MgyP4dKQjNkXS4RkNQqm0fyvKIbvgdCDUg9FFhHjRNutwnaRnBld8Bf49Shv6X
         Zf3kh1Ce8w7EAVjSOr1I/8gmJyPZXYs8RVZke4DqTnUCAcw9YstgewTEgKhHfqHY/PZ7
         GPCg==
X-Forwarded-Encrypted: i=1; AKwUvBwX0sPHbILm+LjGFOuCBaFDVfRBqsbn/Zj+rPNGxs04s9ApN/4q4OjZrdrLXIT5j3BruFFFUSC0DapAVDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSaUSh83DorSjX9ipNWKSvjvzQy5XCDLh4RWQlAycOhxny40nZ
	mlaE7JUab1wKMHOrquijmzSu9JlOhByH6bnhDoaF++1yJ0y1BAUtvh51
X-Gm-Gg: AYBFou0gZJhE5THLynSUE47DlJKIdWTG08bYcjBZT/Ait7PKItSKFW/amESgaS2bYNv
	YDzb7J3fvXebibVK9m6gyeAF1Nr5u1yKXbPszhUpLCY4S6IrD29sIacO0jCBnjXa1SVuzkvAhp/
	asFWP230uUXQ4XCIKgojGQFWD+s/S1zPsuoSXp4m4hWqJi5bYWZJ71pggsnddkUxpFJPnbjOGXG
	/wbOuRQWoc3iAkOKNrHAELACLrtJJ5OkGr7fj8AhjTH47zePFFLjAd+BiGziSCKi/THv+L9bR0T
	Yg51NKT1k0GQEuZ/6a72wkUFXjM49+HcImI782wu7nE4gqzkbXMfrOl4lGsltzVhiBozVcAoK5I
	dt6azaBbPh8AZz9Olp40sL5wF6Rpoo/vH8Ld9DZJRsW9q9YJxuAZEKwHoOOTLD9LjMsq7pjUUTk
	fNg8orLVRPL0ZbXsZiYx3MYG8YvTzYktjS3os1oqG0t3UXWZvDD26CcpmeY6h8AYSb5RO1TzP1l
	o2yD2F61iGB4CN6S2LIatrCMNl/048N9TItB3hM41DaQMeCkH4Og1j21sKdp5se638dFcWRTWDW
	lAbzyep1OstAhl/67zYUPukUOfD1rR4uzO1lOGK1+akENks0QjRWiDPr5KEGxA==
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr108686395e9.10.1791637250411;
        Sat, 10 Oct 2026 06:00:50 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:49 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Sat, 10 Oct 2026 14:00:00 +0100
Message-ID: <20261010130024.177503-23-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the generic DWC3 platform integration to enable clocks and release
resets.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/usb/dwc3/Kconfig             | 2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a4..dd0f6d25dd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -207,7 +207,7 @@ config USB_DWC3_GENERIC_PLAT
 	default USB_DWC3
 	help
 	  Support USB3 functionality in simple SoC integrations.
-	  Currently supports SpacemiT DWC USB3. Platforms using
+	  Currently supports SpacemiT and ZTE zx279128s DWC USB3. Platforms using
 	  dwc3-of-simple can easily switch to dwc3-generic by flattening
 	  the dwc3 child node in the device tree.
 	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb0..aa838cf067 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "zte,zx279128s-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.55.0

