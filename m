Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283528;
	b=eeRfzMhL/IefSeXqkmLkeHyYSeaHLA1uECSywb8wlXQXDo/6d7Bh2Yt++B3fwEJK0l1z
	 GXeS1kGIbbHq36FmkX4R3M4phv02jq2Is754ioR62mAzAEsh5Woy261KJ487syaGl4140
	 5807w15mDoHV5Ph8AHAT5yRBzGpbF6bLKPPtQu2rr4senNbcgj6KDKRn3UY68MLLBqu/o
	 esn5EN5p1lCgHhmrvIXNAowD12kAzNfa99r4JO19AQstnkTXY9b7rd2/Tskq3ad3lU92P
	 MXwq3killlkvU5FJXp5xw1YyT1zFE+6gNMb31O9/XrM/g1UG1AKReGd9xK9GTftLS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
	b=TM2sX3N1M+k6A6aWTYHBtXQGSDb2SeYwWv3oepcHieOvlVzDzKz50JoKeWsle+8x3t/K
	 kLcuawlCfgNGbJj08tPFmS8ishNKX1D1AXD6XrP685tsoDC5ElY1b2UT6H3CFsV05Pfhk
	 JFsDltCyp7gtz8rdTGJ5IFqXVjOJuVBr6rhRWJZeqrN39VtC2xHDbXswE8WUJyV4oyYOZ
	 lZsdDMjNSeHfqM8QzgPqPB+YzhH73Dq9gAPl6X4iCr3f/9b/j9mEpkSny0+omMvGNovU6
	 WcCT/PUjjQbYxBZpnwcqyDzvYjqzAcb4B8RYC68FJfHeuinxRzJL3nQBoMGNaCG4qSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=erYCAd+Y;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393C60A3825
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C393C60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=erYCAd+Y
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so19670425e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283526; x=1793888326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=erYCAd+YzEWa9UGAOz3SXnve57b/PfEiNXFDorTVJd9u/DmTRd0cbA6tqR2bF4MOSU
         9NT9ZYVcOv8Xhuh/STL1V5VcOTlpe7yWe0hZov3//bPJIBIFgqmTz7UoJWlanqMLg8vG
         gc9lVwOMxCzCl2/igOCi9oUHT0G8ViVIarprTVY88OPPlCnolpWVspD9SUTz+hhrLdHE
         LNXY6kP7jDv4hJaFbpIYdzwccd2sbGi/JW/NLqTAbodSxlxIV5WoIsxdOICh5qqviXw5
         wx/YLRkUEVushHX3GHwz0wrk8qlDeLgTvA5J9v0fnEf9P4Kpm6TK26/VRRx4oAFT7Uee
         A2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283526; x=1793888326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=m7vA4nvMxXPQAYSMGJtCLZfQ0t1rBuGe/1kOuHuH7WNbvGweh0OhCMo/P98ucP7iv9
         yfiB7bnAp/OAcYBAa1249fwnSipkvlDKpgicQY3r3LmLhjtv00wByvOCSx3fBJzpxHLK
         b4I5I41P1IyRg7QPq3G/fRItNt3xEXp7LaJJDdVj+nc2+gkfIDh40DWf8CqZendpibCO
         ooTWxngeavuPndy7V6eI/5ejiBotmdnT+shXUohsJ/uK4SyZEs0OUuT+OCHJUOrgvMCq
         cvOuG69oj79NKWtRuQ9STWJvdo44TDVy9ZoROrnNuyEFhAmyR+AXetZOkJFsKvJX9Xxf
         2RRw==
X-Forwarded-Encrypted: i=1; AKwUvBwIMUoFXAOWpeqxLRWA6dkIsRWeUgomOONQH142r9KxQE2gaPg4r0GLoAe4H13fnyArPGPenS5oNIYFPXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYItH6VuZnbEjtx/KuETbOMZ8WZ2J5eDwSArcJVPTM34aLsRqIYG
	RyamLn3xHSoG8NU4xk01DtYftfhgl1xkJDkTG8UKrhTUdSEIsI7urtWjrL9GfTw++E4=
X-Gm-Gg: AYBFou3F8cjuRmOja4bMnF6IITWMAfY0/HdcC8VcvuA1kXsTmrotpNqKlbqPqnzZ3CP
	NRz9TG0p49Tm0UKzwI5IxFHPaOzviPH162HPaELvJsMeo9uRwX7baAQWIr4RaVjxde6G8ev5wBg
	YEXBR5PD0e5rAE8hyCZ5atreI5upmDvLai+STNXdPFCDS0wXkAfGtvwEZyYxCqX8wn/YW9oq0n2
	xC7O7PtmZRM5Lh9zYfdAAFpeSGjlCrsAq/376NioxCXS3xaqzzpt/AzXyigXmqD0/Szg8X1XzS3
	Mz4jZdwtOlhaVy1/FMh+NrEG+iSDUpy562RPUVVz83iOclecY/280BCgP/2ZA/7jyUlhjgeLwCC
	SGo1P4OS4w5t24dXG33gOBM56so4F8Tgy3KmWxVJPmcx2fJHjs48COt0oOBTvlOs/MxtSX8kCGV
	gbtyf1hQw9NcDaoxsrMjV1SER19YWALC1qUimzvfN6A+fRvfTEyEQ+4BJHuPxLDHpSC3w9FlmrA
	i/aqmeDsL/an7xGeydFboYYXV3BzXmO1vrg4/HVLYg94gnAZzimUVk63cT9zqmirdAgZY8lBQwZ
	d2ULo74v4IRGKGVUrV5mRWicJVv20iHPAXy7HHTFbby2PZTsTfDrOxq/tGL5fWpiwSyrc/+4wKe
	WPDwZ
X-Received: by 2002:a05:600c:37c3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a96701830cmr125321535e9.25.1793283526321;
        Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:29 +0000
Subject: [PATCH v7 08/18] media: sony-starvis2: Put module into standby
 after identify
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
Message-Id: <20261029-media-starvis2-v7-8-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

The module has to be brought out of standby in order to read
some of the identification registers. Whilst it would be
powered down via pm_runtime, should that be disabled it would
be left in streaming mode.

Restore standby mode after identify.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 84f3978e1eda..95da8a9e671e 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1162,7 +1162,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1170,14 +1171,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	val &= variant->id_mask;
 	if (val != variant->id_value) {
 		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
 			variant->id_value, val);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_standby;
 	}
 
 	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
@@ -1185,7 +1187,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1207,7 +1209,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	}
 	starvis2->variant = starvis2->info->variant;
 
-	return 0;
+err_standby:
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, NULL);
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops starvis2_video_ops = {

-- 
2.34.1

