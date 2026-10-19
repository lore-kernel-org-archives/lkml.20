Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0706A572EB6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420116; cv=none; b=XttDtYpnTE5Xp+JBxyHQo3+7i+uQlnOAfdLaoJTbS/MMKLQM5P15k/EINl9FapI3L4vWNBqcBaywQu/hSdF4JjETEDpkstdXp7YFEUjzoEZgw4QK3SbRC7txKKlQWeQJ47hP0t1dvVsb3486+ep4idCpsvNybxKc1pQDPnzjmuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420116; c=relaxed/simple;
	bh=FnajhbKE6uIgk2tXwZaCDaumFhbm5Q7VnLpjSW4gkug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZHueXvUsavKSSwMd5wF3NBXTfgks9Xb6G6sxJgMDeCOcBgPmELANyL0Cqz0iqiUvBWhkvRxJdGGMPT+x3bJ0XqqVGZmVJ4tzCdglbAlKf6DaeUAoYBa9rOvbmDmODbgXLI4ojlNpq/du1Jx3bDVNgWwY5d5CBAZwnBmxKY3KcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=A3U7Eu+4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="A3U7Eu+4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1505835f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420112; x=1793024912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=83lhQTeMzqlLq3XpFtcjV4guibaKsArXiKHi9ZNUpeo=;
        b=A3U7Eu+4RqY9dE3Gt4S3GrHueeBVuM4kcfI+cxCeahNNECMZ8E+FJs9xyhtpH5q/7+
         MG5WFzWIG1AD+pZvMZN9gYXX0JJj5v2o2/N+HCFQiYIS1w2iXuD37ifz4F11DAhSbJlC
         bNPtIwhPXY7KaruJaYdTxIJP4KKnzup4a6qFg0vdyNE91S7UIAddd4z2NlKcx7nTCuFe
         o7XHqv40PlEnrxzfVgBNNJVuVcjv3e9bkWn+23E4a0gQssA+0OFTLfnkN3NaJA/Wy6Vt
         7S75dGXag5CHr7BFxlj8HQK6uWtzNogeORMtwjieDg7xwE6HU4xp8keMTuhyA+LH3DCT
         JmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420112; x=1793024912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=83lhQTeMzqlLq3XpFtcjV4guibaKsArXiKHi9ZNUpeo=;
        b=nwd2PZx61I6VlL1c099EhNfLC50RDc/JMVaViOyuGQnEMx6Ced83JgkzEfDGTYohcS
         2kDDw0Wivb1KBKaFGkxlFPQm9RKK7f+mZRp1y1iT1lLVB0IZ4ECUMTaWr4q1GV0xLPHt
         2PVVsc/8eRbP38V4HTqyAUuXy8kfMNl6ttudiKN0TlA+nX01jkqyDvl45afd+rRBUK7C
         uZxdxzLZeD1Ak7/bFFAdHFF4intU87XwKjgiw7D5C0kbVlJIi1NgkwqXeURotXda67ZR
         De6fJ871xN5T5oW1D2bdyizkwT9CwtCiUE0bi7ORe2iY/NwK3dMSiQkKYODLI7E0neq5
         gURQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsQqy6bkOwapkrYfPxO+d10izGBKWgYUb6NDo9ITljNOq7TUsqKEus4Y3MNICrN5J9NdthzEo8g+9EgUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHNzz2BlMdUiKv5EzCtgwtwMHcp6hIfvRQ1XFhOlDDz7GTRNPo
	5qfmY/iiXojxchJ4PDhvmeWHjDeR9UGaPGTkNE99WyFu3n9o36eMhhb0VN0psARdSew=
X-Gm-Gg: AYBFou0Uwyc4vuAR5QC04G6w4MxEg+fyfgbqVH4MD30PueDx+BkoaevxLXw6SGhDbeD
	iqseKEJLexCBTzsCtbnUI+nbV3WmygG2Zb4KT6xsPMjO2X5/4mI/FTcra72m89OpuGY4YoPBT9e
	ay6Cr4Eq0vDSJPGt0CXn/437T1LTNJTEKVX0dh10QL5wAMtR48LlnQnHyirtyGPHZwoh7SLLdxC
	hEWHWaYslR7xgNmxkKoKhEbLE2CzsnmLsKEtoUdmOvIk3cDDWaYDQH9f7HQQfKqVP6x34WO1kra
	mz3IuJoqWHemTP8VYYeXMDLQU/CAJn6pPtnEFSVoeliwoJzVJg3SaOlYn6Eq2iWdhZOjv53Nv0e
	VLw+LXCzIDZiEykTkz9iGUIUkpf03QgO0tyjGM+qpcj47wKqbME7JHjNh0/Mwcw5ad22nGhSfbf
	vCUftMlBcvXXHIbwneluMYZBzXzhYWlZgJ/UWJ8mn2NBLFGgvTx+wDdzTcb4fkjAeV0atU5QW/Q
	c3q6p/8qeU9hxVpyY55SR/4E2CdjJo7sfIyD852tFT76ssc8A==
X-Received: by 2002:a05:6000:1865:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e07bb2cc8mr18998224f8f.9.1792420112284;
        Mon, 19 Oct 2026 07:28:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:15 +0100
Subject: [PATCH v5 08/16] media: sony-starvis2: Put module into standby
 after identify
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-8-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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
index 1c3dcae5e0a4..2388105b6a30 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1160,7 +1160,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1168,14 +1169,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
@@ -1183,7 +1185,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1205,7 +1207,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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

