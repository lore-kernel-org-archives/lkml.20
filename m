Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77973EDE6E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812385; cv=none; b=qonRhIuiJv7ly6Z0WhED+inAvnOZmXV5xecIg3x9gr/Nzxz9Vlif3wCK2NbBpClsBcbhmGqlHh8Qa33tsiwG37FvKlhY5DLOFvBjJOqzMiZ0GKoFFp8Nw0Tzb9X1pqQ5Qo74IMiqyUPAKnvZDQgYKTt5b0nh2U/51B4C59w8IDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812385; c=relaxed/simple;
	bh=ibfSzuvEqAX4vqhVzf0MhyB9RVT64f5Zvs5HA/q3DxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCJG7LuEFyaXEo3svxdFRRYzMdk/9fTHU+wzUnwxUIv/hkVnJ/kxI+p1VRQv6PY6vcL6xQAWSLx9d+5xeIWtaTnq1LNk5k0YFI+LNiJhswqlXZieUa6c2gMWVVN3fA4lTLg/iHlREzO8jT5jt/dM3Ql5wUtWwa5IrH0rm2e+Tr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEdGhvpw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEdGhvpw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db3305f94fso26070595ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788812383; x=1789417183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqM7CNcQIe0bZF2r0IXx9E1bi6r31mjO2/QDFutoPOg=;
        b=OEdGhvpwwtWyTvG4DRd2e/4cuMe1a5sMjOVqLLGRJWDe4Y6/ERT7ooEWpNRBeH43r2
         +DsaQSj6ZyZ5vrIxFkOTsZa1QF9hQdVdfGgX5/NtUE/eOfKnaHl2tDAM1SUVF8xnI9TN
         nDBxYEoDXg38ldHXROAz4ZdRiUkIg5Y9/0XcKw8BYF5lI5MCYT+c89F+rIV4l5i9zh/7
         kcF7dttrfS/2cYuqoClbSCDo+4PtOSQrs1liijwugSThQpz0gZ704HqTcl2oJr3o7L17
         m8pLVX9oCXIsPjx5G1LLnGY9Xuj26K3b9Yp4sZWVzFTpFRABlmYkfdrJW7HYMxAx8S62
         LaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812383; x=1789417183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqM7CNcQIe0bZF2r0IXx9E1bi6r31mjO2/QDFutoPOg=;
        b=tIUFB5Fj6PNqTK0Y4Q8p91xOhPvvOlDySzJq5HBcrrtpQPE8BubQgw9rEghvkEaUZB
         st9Y0a0tjLc2YE7FuRrmWzwA8j90UxmkLT7gCR3bgkpAaSTnP0tkPTGn3dDTd37tuMbS
         u1rGvD0IBCX0fXiMqnhRBC9pnAUBBWedo5dchx798vD075F8LU24AsQWBXYa/eYBhMzd
         T9KrPmtFg/Uha+13+mxNPUHPt9CNsK0Vs0NKGwPpbxvmEcJB6IwSdfbLB1mFuBGJdite
         2dn33T3cwiCi5Hse9gy+sF89oXPKdSu6KLVUjUqJ4EA5Yb2wqizkhsBlgzoaIRRUr8GY
         VXLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlRjE5ynOUpnbxsMzxy9JQ0ffDUVCc7/HqY97jXzhCN4bldSt4nHpW5V9GOA6lx65B419TzPe1zzEQq4I=@vger.kernel.org
X-Gm-Message-State: AFuF++kHzxIPSoAPYlu2E5/t8OLEYdAofcoiHEg/EZO7WdgHPh3VyTBK
	2Q0Eck6BYFtD5lCsXnrHNPCiNw6F+nxxIQmgOtYvH2ROdrRdd5gtuvrAmjDIFw==
X-Gm-Gg: AYBFou2YsLQyfw7A5m1ijk1hh0K1dBlR14b3dH2g662BS+aEAEkikL/ry2s6N8aFH5y
	/ApKbeslfFtmysSIeetA2jYK7kOzNNLw4XSwNyBPd3+6lK7BAgQNr2iFgYxx85nKbPVhYtE/XFJ
	qzyD7zSGRX6ILA55Rmto9lCXjKIle3y1ZdqlyGvRUq7ek7kRGtwUTOJTvbb+Zk7m8idZTrvMYNn
	la6zvFFahnYRiXTCSU7VECHK4+MuMTGjzkxlj6eXpjQWyQwBEiUGFmdyVPHXlMNavVXfZluTZj7
	C6o/iBFXb2jiZYaeTsJNhA+pzlEL/ifDPuEf9oAt1lBFaNRJRqbSYqPRItq50nvhMv/Mj5HpZCA
	G3cGMIOpCs66lDSR3PVGeuJVUOjBC2IlMQ961EHdu+g+72C3y18cC6FVwch7EyAGbeS+LCqwtVu
	cxZOFkuBRn2KTo1IhSGmqs+nOeaRT8zjKsUcYksKrmmcqHYefJK2F+AAOPhqDc+cBl2mhS8rxjU
	rrTZxDOzG/U7lgaWKJjoG4hn5ORTCjgeZfJ+N+ex8uSl3srHbf5EmlrwLb7fg+cQ/eSje3uRWfz
	iQraPK+wV2cDSXDXzMertdOWdS+aE7cAD7JEgA==
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr36621766a91.18.1788812383036;
        Mon, 07 Sep 2026 13:19:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm22082690a91.11.2026.09.07.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:19:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: is31fl32xx: Use fwnode/device property APIs
Date: Mon,  7 Sep 2026 13:19:40 -0700
Message-ID: <20260907201940.40524-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DT-specific helpers in is31fl32xx_parse_dt() and
is31fl32xx_parse_child_dt() to their fwnode/device equivalents.
Behaviour is unchanged for device tree: device_property_read_bool(),
device_for_each_child_node_scoped() and device_get_child_node_count()
operate on the same nodes and keep the skip of unavailable children.

Use the %pfwP format specifier in error messages, as child is now a
struct fwnode_handle and %pOF would misread it as a device_node.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 6c8d6b833260..285085d27453 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -378,23 +378,23 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 }
 
 static int is31fl32xx_parse_child_dt(const struct device *dev,
-				     const struct device_node *child,
+				     const struct fwnode_handle *child,
 				     struct is31fl32xx_led_data *led_data)
 {
 	struct led_classdev *cdev = &led_data->cdev;
 	int ret = 0;
 	u32 reg;
 
-	ret = of_property_read_u32(child, "reg", &reg);
+	ret = fwnode_property_read_u32(child, "reg", &reg);
 	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
 		dev_err(dev,
-			"Child node %pOF does not have a valid reg property\n",
+			"Child node %pfwP does not have a valid reg property\n",
 			child);
 		return -EINVAL;
 	}
 	led_data->channel = reg;
 
-	of_property_read_u32(child, "led-max-microamp", &led_data->max_microamp);
+	fwnode_property_read_u32(child, "led-max-microamp", &led_data->max_microamp);
 
 	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
 
@@ -422,7 +422,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	int ret = 0;
 
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
-	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
+	    device_property_read_bool(dev, "issi,22khz-pwm")) {
 
 		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
 				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
@@ -433,7 +433,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		}
 	}
 
-	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
@@ -451,17 +451,17 @@ static int is31fl32xx_parse_dt(struct device *dev,
 							  led_data->channel);
 		if (other_led_data) {
 			dev_err(dev,
-				"Node %pOF 'reg' conflicts with another LED\n",
+				"Node %pfwP 'reg' conflicts with another LED\n",
 				child);
 			return -EINVAL;
 		}
 
-		init_data.fwnode = of_fwnode_handle(child);
+		init_data.fwnode = child;
 
 		ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
 						     &init_data);
 		if (ret) {
-			dev_err(dev, "Failed to register LED for %pOF: %d\n",
+			dev_err(dev, "Failed to register LED for %pfwP: %d\n",
 				child, ret);
 			return ret;
 		}
@@ -576,7 +576,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
 
 	cdef = device_get_match_data(dev);
 
-	count = of_get_available_child_count(dev_of_node(dev));
+	count = device_get_child_node_count(dev);
 	if (!count)
 		return -EINVAL;
 
-- 
2.55.0

