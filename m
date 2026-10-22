Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690495;
	b=S1yP8vOCosnsiFYzZ8ECpaLbB+gLLNcGMj8xHnFGBhf8603LWEmFlxP5cDCmLjsPYJ19
	 9BsxIex6cFuSIagsUdyykLMW9QwsRLa7QlKgwgKTTCloCZ8rdYXZ+SL2mRqQv5voOV27x
	 gZqE8wUSul8a58zHeIdA2mQtLizsKLStGyhbmcwCYeDNzNYtRRy71zxmESX2cXJ+ySPCI
	 Fs4iDLHj+3y18vGZwvBWi+Y5AbRNyjSgFBB/SKYPY78ApHcrvYFjr5XEfA8QJX9ddvrCH
	 mFyufWvBkoSSOO8gSi1pSP8DKE/dTBva92VQYxHrv58fZ1V5kjfN/c4ZaLt0NQAohZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
	b=OfEpNIKo4oq7XMQLfTziqL8lYIhHGNdTyuL48iCNK3z/8VvAaNFQf9zic7WExtZmtBEa
	 ZyhzC9KrIb1WIe0p9m1I2/vkBfw/RWTXpGXSju5tH7zKdFKXol2UnNCEBJ49UdwAimh+n
	 3zzeED0s94P5/kFI5wW7G4QSjSb4yw6B5yUuZP1h26Q5HhTemSQO7VIuOLvf6cBbhe+vB
	 8hgTJRwgY8z1g+oo1/WJRBXt+0ThSvd4mO93KGm+Y5OsoKlqCCuojS2gihJiAXUOEZYZe
	 78dGPRxdwHWkC66SEy8bS/Xcgofu6NTDX9eYOgxuZUdJHgjXMg4WLaq4CLsaJ1CC1Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mGUd1+4c;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082BC60A380E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082BC60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=mGUd1+4c
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so546155e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690477; x=1793295277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=mGUd1+4cfXktWsyBYNjeYK+/XNNw5ptG4mkEeyVNHplldJVcnfS7V1k7FwPVTelFtS
         NfdmKEquC3VhjCJ2XsyWQOYIxgam7Z6MeSbLuWn5T4yJptEdxmE/RM7owSIg1ynA1FcY
         DPxaX81GlTdZ8GF9IWL/MQ18HQoolQoOv+OeHiNvV8aWaO9Kj4W+IfIH5kgAQHH5uaVf
         vagzqS7tHTLRTIc0Xkeh1qOiWEmLkG9FM8UQdlIEEf/X0jEzWlpxIqVRITZEKhAtO8SW
         nsSLmYtbaCOeEMVUIrhlsq8d+Hr37oFaXfXGmwrt1Aq3KdMBanGQgJuv746K94x5jX3/
         fmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690477; x=1793295277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=g3eleu89G69aeLpbxQ5+ZWIC8HR6sAbsfZBA0qoQIpYKyI24KZo9+LAoO5StIbYA4+
         UJCa5IVlgbsov9hUGOL657HwhfZg2WZ92Q54CnFhZMlo7F0MArXoq87eMXZU7VjQwTzi
         xMvEMVvmpJScN8IhhNFZwhoymar27AB9AXrjFVKLo/adHDkyBlOUz4gTNvVcTPX2VTfO
         1LfUfKaM/orPtzA1KDi2FAgcBwjfFipHs/RrMKJN6fj9ztIUqhg2TA0i5NGfiFAgp2SX
         2NeGUhBSWYcrkhv9LcWSQexbzC9zPNHOI2SDPNri3XetXeljQviH5H3xQfJC0FATc7jC
         HrDA==
X-Forwarded-Encrypted: i=1; AKwUvBzrTMD4x2Wt2jg9d2Pc2yC/YgIaL/yrCFV9EoJk5DtSwsGxW2owC0itXLoRYNjIp4c+zXh+VZTVu0Iq4Jo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2UtxGqzkakKlixjK7AtRAcOUstRzXJCxbTtQNV/hp/3MszANu
	9wRZg9Sdv4eV+mlXqLKfTgXEmHqOSKzLEaau4cw0IgORjOE8H5ObNSQciqOpU0n9JUg=
X-Gm-Gg: AYBFou3z17DHyNdL1F6rzo0Ik/60dHdY3sfqXoyitlqK0pvUnnhH0KwsGkoRmu1GRuJ
	/E7PhbYlthDYX4Y7tNKQihBJtnmCVu2ZYsGnneoz9QQLEyNIjNJ7W9ZiXSLZ4yue0ZzS8v1itmY
	H1gYavdcDCrX/pVBpuxQI0Beyxm9pS8/fH+K9OLzdb+Epu3z2MJQKSVZHb1ggMLBsg5zjI1sBMv
	azLk7JuJzxN/kQruahvQs1fmM1Px6QLb+3MU/qt2oQjaKeAKXFH3cMKOr8aXVKB/OUuDKP1dErc
	gWzJU2CxP2vA9OPymFoK5N/NhvbMhwYBzWcbQgBgmFfw0IGZuUDpKYznNTU/CRys2ieXTgHaKCb
	LYJ0ZGl13XFVnZXOQcS/DjYvE09TD6E35sbmTofPlziyrcndhBaDI8U3ZvOa57AlythFQGWM4cL
	Yg7pWmRc7izIZYk7lHVNamJDJlqWm+Hp6hQsq0odbuQUG8cRuK+ZAnpX7Y8nPHGbS2J7ic1VS36
	uD7/vwEjnQlDK6k4n6rya0TrVqf1IUj2N9NvxFfFIiLegzbpCgK9FKu2gtpshQZTQVJC3hvsqVH
	9yAplgd77BuiudvIAlvxYQfShhXpXb8=
X-Received: by 2002:a05:600c:4fc8:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1fd8a7d9dmr129819385e9.4.1792690477435;
        Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:02 +0100
Subject: [PATCH v6 09/18] media: sony-starvis2: Use pm_runtime_autosuspend
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
Message-Id: <20261022-media-starvis2-v6-9-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

In order to reduce the time in stopping and restarting
streaming, use pm_runtime_autosuspend so the sensor
isn't powered down.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 95da8a9e671e..27357cc293be 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1049,7 +1049,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1072,7 +1072,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1447,7 +1447,10 @@ static int starvis2_probe(struct i2c_client *client)
 				 NULL);
 
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1479,7 +1482,7 @@ static int starvis2_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_idle(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
@@ -1494,7 +1497,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1520,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

