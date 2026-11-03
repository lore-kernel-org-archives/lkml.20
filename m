Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717780;
	b=S91GdiSQ+uIyuJ6h7XvIc+2uxqVZmYzPf0Qn4KzqIiOOxv7x3IKnjzF1Zt39q5rcx/JN
	 2Svw+oqVoRRoWSyPgFCiWj/oADavK0atpqvtKu4SCyaDzuzwr+gpCYfOBD1okrsCfcNWV
	 bPEdRT0qhd+RPTKn8Z07PEyuY/DhUCsmledU2WMaXgCAKaxDl1jl8sKScUA467YUEiP75
	 mZal198o1f4gKAHXBypGWuy+qhG3DAhF1xbXj4faD9hy6frt7DCXZLFIwZy3ZhbukarRw
	 qo1b0i4OGArCt0GyVdpu39SMvbpHLW8V9nvBflsY9S/nD2+XvxZodHjxSOqUrF6A+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2v3uSUkDZsGbXYa1FeQE/G1NHYkVlKYzZyMrp4apMXY=;
	b=2h3l+ikjaaqSBXT0++RkK4Fy8fj2ktieXsJf9Dx6+KQ8eYN2MweO7owHZNhQILProwSE
	 UHsmATg4rAkSchB0YZN8epg5SmKqwXXvAB9WpLMQNwP02Fky62F7oZP28pxoc+rhGl4SX
	 uQ1ZwZU0y02xIY59Qn9UwRaL4XHb4ONzfkz9iF5/p4QawJa0VjjBYtR4OknRsOO4ZwIgz
	 k/NGdHBKh8QvXgYxi8a3A8hl6otqt/b1Cl09aK6d66UEVEQ0l4BMFOMJQuAgikq/kh08w
	 QogLeQGW3OhvVRU8MnHsN+DbXT1XiMbLw2bJFvSJHlnE3wSgzBt8hlQ1nXT6yrvdpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D5xkD48S;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E40606A7B7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E40606A7B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D5xkD48S
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so4517109e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793717778; x=1794322578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v3uSUkDZsGbXYa1FeQE/G1NHYkVlKYzZyMrp4apMXY=;
        b=D5xkD48SOpZxbEX1IvYf3rfrxo9FrCzQk/cGvNMOycNy72ABVzm6/4cW+uxmco2Kdb
         uqWbGBSbhPOOhsCDSlCieuzfk946h2eoYjal0tV7VVpksJnt5jC/waf93eh37CEujhf8
         HujSRlIej/mAMH2M9H4PnsyyP6Xa+KJ2m5ry4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717778; x=1794322578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v3uSUkDZsGbXYa1FeQE/G1NHYkVlKYzZyMrp4apMXY=;
        b=JQcwxZ0yEhxMX7I04bIvEOTP8sQxUHbU3ISy9mjAZ7JvEeAP0Ic5UuitYluHLiCv5B
         aai8vqhUiwl6gA2+ZLtZZucD5PRamw2BsNo89/svMtuRZIKuzj+hm4oXSZjFY9Dzmc8m
         Ju3+IUdkxJJqxRAV5Ff0Lw+adHYH18imcfLfMIslbDhqrvVwH9JxEnWBLEH3GSogbbla
         /RQVNkbzVn0knEF0ENnB9Ifa8QioSGTSnCyYgoc4J1opPM3S8clOwTPmzdesF9p7Mt6G
         5nD6w+UX7Vz+t0SUR1IqyBmZT4zIn6GG6uE1szvDeSDzEOxDwZRBz7ezX5Wpy2AKtIx8
         misw==
X-Forwarded-Encrypted: i=1; AKwUvBw77F8MUh5m0iYc7G3N1LBbFNyS81Xn8UiF8uciOznxmz2f8PhxHGFnemRzcKqR2avYp+MOZKTsaI0u/9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6HYcDvN2/uG5Jq5yIDjahtP3Lj51YHmfbx5H+pMx4TuVYRmOb
	qgE1wzpHYmc/aglH3wnNjMFjfs5KazkKHbxVHZUFqFwr+zCxgqXADY0V1e+V7mxTAwTp/pCFHlC
	MTcNNEDWj
X-Gm-Gg: AYBFou2+d9y3OyS9DgOhbP/euIJq9Hg/nwuNzwOkSvzFYrelJPxJUy8yyaA7HeYVIYO
	LfBLWh/3KtKounarf49qspEectfblQYjMhcpVfHtxA6hNWXOevFEMVlhy+d9rjbxUuTXVZg3MTb
	YC6HUpLN022+qq8+ORUru+QrJBRgyLyRD+ZPEBtWxs9x4/oNrwd3yO5AQHVJwlz9G04abk2h+f3
	3PWhWPreWM/19eKLirb5gr/Gg6mszygXvFHbuqvp+vklApxrJhs7wHPMj8KlQ0naGq2plgWz5Mz
	1H1hotJTkuEHVklWkq+dzCveWWhSesn8Q1V+AfZfbAkJEDAGobw0oQnG5WwL4wR/sG5E9F+BKN7
	x+jCMjWGhI/yFo+FgQT/2iNMaZ0GiOD6qufx3S8o8fpB8x6ya+4BpkNY9/MORZlQmo7J+SNolZZ
	KFgq1qjdbh83T5wjiQZDkR7Z+vVbQDFj1RHeaWka0Fc6AaIR2eHFGXYwmmGfqLA38PTL1PFsRe4
	QiUuztvEkVFxGqlIJNQorK54uOi6IhQ0YDIldcpsjt2pR8dbmtYUjwTYjOcdECzE/d0/bY0PvOY
	y18bN4WKxvlJnfxER1qPZ/VkTBcbEVugtvrno7lOjH9THLu1U5wMAtSR6DqPzTtncmkUh5W/2Dl
	ChLJR7JvJ4g==
X-Received: by 2002:a05:6512:3e0e:b0:5bf:9fc1:3938 with SMTP id 2adb3069b0e04-5bfd957bcc7mr4445793e87.38.1793717778287;
        Tue, 03 Nov 2026 06:56:18 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1b1ddb3sm2037346e87.27.2026.11.03.06.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 03 Nov 2026 14:56:03 +0000
Subject: [PATCH v5 1/2] media: uvcvideo: Do not parse bmVideoStandards
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
Message-Id: <20261103-uvc-version-v5-1-f23b6d103c51@chromium.org>
References: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
In-Reply-To: <20261103-uvc-version-v5-0-f23b6d103c51@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

bmVideoStandards is write only, so there is no need to parse it.

Remove it.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 --
 drivers/media/usb/uvc/uvcvideo.h   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index cbc14569716b..7f9f829ca6c3 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1188,8 +1188,6 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 		unit->processing.bControlSize = buffer[7];
 		unit->processing.bmControls = (u8 *)unit + sizeof(*unit);
 		memcpy(unit->processing.bmControls, &buffer[8], n);
-		if (dev->uvc_version >= 0x0110)
-			unit->processing.bmVideoStandards = buffer[9+n];
 
 		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..7f4f11824dbe 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -228,7 +228,6 @@ struct uvc_entity {
 			u16 wMaxMultiplier;
 			u8  bControlSize;
 			u8  *bmControls;
-			u8  bmVideoStandards;
 		} processing;
 
 		struct {

-- 
2.56.0.385.gac671c819a-goog

