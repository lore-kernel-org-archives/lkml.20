Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069529;
	b=phvmOGZJWQ5AweRHZ4mY6oXykTqbZ8jX/TRbEtgzQ1gpcYr4foESXYNdced8L4NSEbg9
	 9sjTfy80dHDTFupWryDmb6bV5imJ4MYI14hIrmJQFzPorE89OmYd3atWcD4P0+Lrcyy8p
	 0vXYDJVny09U6XWucWH7VyQNW6H9Ads/8DheGqcYPuMLhb91egxG214JOPrQNmEBbaeUV
	 HBWzD2U6LW5diQOWpJ1Y2qfsGbUghz6EiNFlFoYaEmXsnTCmgQCKsnDkU4khd/igF6ygR
	 ofz41C12gUG9BFRJE7ojgyoFfswbCVO3yQ+KJN6JPijqNnRhENd6TpnKMJaORMs4f5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZCrkWQWMiaMa6JQ/PNwOBJBl6GAAixAIuZLzVajf/gk=;
	b=OQWiJV/gXev96URJhvhUV4dyRTHqo1WwFhhZgCHigqQnGSzAr6GN3a1rpfbrMYxJg2pQ
	 cd8YYXDMeEu2l6yZKzHPn82S8b6IJWBwwu05buDbS3OfQ0lO4KrjZCfFgFgkAfsQr0gBt
	 GqU1lZfUHVEvCp2j5GUBnoP/nFBXyGggfPFrfN7KMU+2P3A7NDMFNqYnsIiYKpqzMqBPC
	 G6mhTEZ4ehfKo10jR9cI52YhSE9hG5K/2/Ekz0phEY+0YZfLXygYQQ3n5EMiy5+9h1AeI
	 oPzEb4Zb8gtYEVTSMRazEr6r5OLadOh9Y5FOBVnM19j/miXfzDBnhhdpAM4apNSHZGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpSMGKYh;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB3606D83A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BB3606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpSMGKYh
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so18103885e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069527; x=1794674327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCrkWQWMiaMa6JQ/PNwOBJBl6GAAixAIuZLzVajf/gk=;
        b=XpSMGKYhUNRtsWGHCtu9aMgBgsc5jSEwVHgquRVzp1dni7Xl4IuVRM/Ws6QG3YJ4qb
         b2LGQpEcoDn8Y9ulsRqqP6io3OklrBHsJ6+p36EA+N/R6C+TbZkwaxtpbA6BwsPyy/w6
         4hfsOt4Yb+57JwrzW+DzqNGwlc/wjDOxCQbB1Gu2jt1+xjg9aGOiEZv/DcLZfdKTvDF4
         4qA5onYf3qHiz1ljS90BItT2BIoJQZqgrW83sVuF/yojqcpGrnQput+7+HFFlATmL9qR
         wtfNpTUF8mHPogtV8ty86QP0QE1xanesQc8kNtoBC4U/yp8t4sbBkquDJgldFTjyA23Y
         /vOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069527; x=1794674327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCrkWQWMiaMa6JQ/PNwOBJBl6GAAixAIuZLzVajf/gk=;
        b=OcpXdRxCa9V8ojnt+10kl8sZYkedVs6Ro3G5nFLxRG+R0XNovyoQp48V97m4yg6Vt/
         G8mEySv2uoKrBzGGIQCT+nS1iT1mm1wP0pyvI542rAJp9VB3lVVixO/y3c5yybN5SGLs
         taEqEh8S2RCbd6D4m5aJvXOHr4aRGHEDDf3oqze1B7bX9/9GM8rbYxFoneHkqLMv9Byc
         Csv/BK7/gW/yTOcgOyZJXHHQkIGqCs0TL540LFXgmC8Ow9TrTf8OQwbzaGu2y4XeOvuO
         dK5jSr6DUX+LqH87vl2HSAGMgRICDQvUTtRWI9f8MrpmOmdj0vhp8bo39f6Tnx3z5LeM
         JhfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8ZD6UanlDtO/34mcMfz9f6G7xvvXrhe2VyOL7PZIu2jll7UpwllUlwfvmDd3FzfEMYmjzmO/p5bMA1CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IKXP8cv897i9G2ea3Xtqr4CYw2WBIPn7KjbmDd/LNzvU8QYvG
	mVLauKdwcOEzLb0YUIMa4JmTdhIwxk8I+B6ad6+pkh9eJc+uZjxOS9Sp
X-Gm-Gg: AYBFou02Ig+CmYCpPV053RHp730wnE08Lf72H5Km6Er0VtNQsvjHKmq3DyTHRSWdPiS
	xP4W0vLkgYsQge9x52jwAU32FZT5ZMec/aerF8GPO3qb6+d3XR50AwW1xcwx0QcBvgYvBJzguFi
	U5nq/vTYHppO6OkDixJURRj90tdUGHNnsOcwsowQgMvCHs8gm/EhqGApW3Z9rS1zdXnO0j+VmX6
	oouP1EPHyOnMI+98teSebp+uAuvQ3aMzuxV8saBnJ9lZuh39p+2tcn6MSlRex1UMCdZyR2moebI
	By5fkL6YE+F6wqSj8t+D3iv+Eux4jpU3gvCdPt1ofTtji1Oqc5WLZqPJgO1yqAJmJ1DnVfSKrzr
	LKxZtoWNt8VZd+g0Nhw4QNI2Bgjl/bttzelVjsRwLpOzQhfGTy7WaeYWv6NpcJ/aswjoCChByG8
	h7aBwnvacXWkcbTHM8EVpsU+US3MhjPpq3dSC/iYWKkN8u0o2+ZPWiN9d3Y46Q3tCExM3v9QIzK
	lDnXG20fVeAQIsj9S9Gr81vRMoKGUNwM3wII7JFxwmsTFDzZGGnCfhiYrujT4sTZ8Egyxgf65yV
	Aroo5iON5VRkOWx8g4oM2gnTwsSAXJHSlDFfXGibUbzYHW8Xso7JOeoeC1+uGwvbijZcbiiLZQZ
	fozK51UQ0CN+lGWc=
X-Received: by 2002:a05:600c:818e:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4b6dff86e38mr97387655e9.28.1794069527274;
        Sat, 07 Nov 2026 08:38:47 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 17:38:10 +0100
Subject: [PATCH 6/6] firmware: raspberrypi: Handle device registration
 errors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v1-6-707362c710cd@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2344;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=AdC4vOzAbMdAuEcT4NFt9HUipWywj3HHnkSbR3/KwS8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRsEMYUoHGkbQFg7nXgZBTB7cS2hllxBjE8
 6P000bTNP6JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z7VOD/4/4tRYkecqnd0BdWVXBUD6/94azYng6hS2Qk9Kr65ChmM5nferUVW7+/OAN1IYZmgCxu1
 qFb6of/vYw9+suJnMkmsnxY2oACvIdRCTopmjDof1Y/hkW1n+vUbkfkSaDIaP85WE5h+S2ux2yZ
 3W69YR6rjaCLmtfVgPeDG3A+KPQX4MwZhWdJUQOLa74/b75hT1IvZiQS0ISkn709jo2XRg5GhtR
 l/dAzmc1SGdjifmFYya3elpnYppiyIC+h3mA6/9hHYUAw8drlVzBNkmmIriiTpR0vVShGElv0ya
 PxgBCEcVa2Khpmp6nQb22/9EVuaJ3M8JeB5RtHY+ivePPQfLa2GCoM4cThGHp2qtm+14VW60CbF
 W+QhoooX8X0Q8KXmXiIspD/jo6F8E7lpEtsfpw97yZ3Vbzj1UmA5hnh4Se7IqTgTz3U5DoFMvA5
 drTY8DbC/MYRnClwqw80KY0YDFtM+hWSDC/14PVBFoNE3K/KXsk2mkc4wCNZTBoce0x53BIrQge
 9u889A0DR92BhmHg/Sd+hO6ZfJWfE2xunfW7BHL19A0jJwvN2eFb/o2E5mTw771hnY7dOTDo034
 UyGplW5Pgqd+XSsB188ICHcTbs7vQUdUV0WskglfQRvufnHDyyjFc1Ch8i0Ami+BHyE/jHJi+YP
 ybiE7Eoct5mr/Wg==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Check the return value of platform_device_register_data() before assigning
it to the global rpi_hwmon / rpi_clk pointers.  Previously an ERR_PTR was
stored on failure, which could be used later without proper checking.

Do not propagate the error to the caller.  The hwmon and clock platform
devices are optional helpers; making the whole rpi_firmware_probe() fail
just because a child platform device could not be created would be worse,
as it would lose the firmware interface that many other drivers need.

Fixes: 70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
Fixes: 91f2cf4a6b21 ("firmware: raspberrypi: register clk device")
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 57f21e4e65d6..48cb8063ddb9 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -203,6 +203,7 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 static void
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
 	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
 					&packet, sizeof(packet));
@@ -210,13 +211,19 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 	if (ret)
 		return;
 
-	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
-						  -1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	rpi_hwmon = pdev;
 }
 
 static void rpi_register_clk_driver(struct device *dev)
 {
 	struct device_node *firmware;
+	struct platform_device *pdev;
 
 	/*
 	 * Earlier DTs don't have a node for the firmware clocks but
@@ -230,8 +237,13 @@ static void rpi_register_clk_driver(struct device *dev)
 		return;
 	}
 
-	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
-						-1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-clk",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	rpi_clk = pdev;
 }
 
 static void rpi_register_rtc_driver(struct device *dev)

-- 
2.56.0

