Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4280E4DD3C9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079891; cv=none; b=sdsHtzrRf6Xp0/RBVk/YYb5MXcGMSCmVzQbNBrvTjtG3IEH54AzyPxyAfZyLZczWaxoSBuTyt36KBCeyeQSrg1GVE1JgMBJnz+eEEP3bZsa++pFEa0oQVTk57vM8jsQ0FEyhjs0RD4XsfKSM2XyvVqZpES0S/RPLnvEaTEJH9g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079891; c=relaxed/simple;
	bh=ccbmzk1mDLjJkMCMqTVZiJIs8myJOiM9s67m0/K4pLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJd5nKP2uK3BP4NlKHGgp04OR+7uCvXxNIGh/HswOGCVtS0nKj2uiuG+VWpGH3sSrHrMw0/ueVLBSb/r+7ZLYNwJG0Cb1PyJo7l2NXaTTFJRjQkACS7PiBYhvdcXhCC1amS2z+LorjPyKZtWMVrcwZR0J69GdBq0YYf8sno1Gxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=KC11xP51; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="KC11xP51"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4649b35bso599454f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079865; x=1792684665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6xE9wzYHAMIeHjvm7ZwNBfCozBSihzOwHk4H3NMT9w=;
        b=KC11xP513BQi1GEkAlcKnH8ImfL5SR7z/WOJJK4S6tJCKTLlkS79/1VXKDrci/tWFg
         7eUcwYdGROL3PqBthAwUxhmghxtjq4MUgdiwataxXQLrICBxL1+Ig+TWGCpIpw7+yZfP
         ypOrJVXxdvt+lDYR6VJRFsuOSA2S7N2E7F5m9gVsofgamT/Cj+gp/C+SSZeowllRJvxR
         m91S/YZY8VzRC4q2kH5TpxCzSWBPCzTA3IBkgxJEcRjB4V9krFXZeEDl4bssrm24uzV6
         Q3xYYqERCPYRcC7R0Fm5iVVnwCjk21Egv9OolLw93euIloiLt8OEp0BHQytwcRcLxsk9
         pUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079865; x=1792684665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6xE9wzYHAMIeHjvm7ZwNBfCozBSihzOwHk4H3NMT9w=;
        b=U8nzlTK5g4sFrZrhcYtALZ+eUGF0kdj2BGq6DCWlqzpZDFpuI4NXL4n5XagnguEgG2
         GvM9zFj47Jq90s3I/M2JVzRBOTJ2TWKagsVYWRlrQOLY8Rb5+TnGnn4uQmEZ7KTm3hyr
         N393I19L1w+F+hPvSV6QbgRiD2opNeazI3gQwVdbV5W0MvLLXGOeZU33Pc3KYzPenp6i
         4MgopSBR6XRSy8iyORxkIJynATOd+SlDEitBIdj1/xlSXVJPt6Xsq52BzBTzOw3Y+dS3
         KRmW+X0PSH0wDHrSpCILkU72tlDbNPHPDOTaGbcOYX/aEz71xFLtHz/r4kfweQ5cWaRh
         1oaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNjYEDiKu+nBWgrXD2QyTWGqkE1LJ5HMbG2c0cPAbGkKp3FTcp8YROTF6XnNJ3prcI0uC7/cmU6KB2vA4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUCm1DmEzq8m1k5J4QB5DHUUJj+usP9npdCLbqh7HstpNsG+Sx
	fjdtrEuV2sFmlPc7ADe3/hcx1Ij3b4y5FYkuuFSHrr5asVY0QIZeuQawcliA5CtSLsM=
X-Gm-Gg: AYBFou183nM6ptOS8s/0/X/2T8wKocpjhuIKTtKsASxpiL6GTHQnt4q1KeNZ/UyYx+B
	cz6kAIzjAauASiihXYNc1wUlKf7X7NHH0KkDhwlcZedTDG39KjoZqD5bdtYJ2l8TEUSIV5ddbqg
	84cmAWKrlqKEAL7vQv0QZgPLhFrdBechTbvv4TGd3Ic4nA8TNBqYrLUIwRZf1qzgvv/SU0ccSO3
	ZFhuHHMIZD4QtvFEucZBsENz281IWuOOaPVK/c/Viwus2A0gGIGiy/nh9RlzopEhp0c6hrna8aZ
	t02V3nek8MkyuC17n8q9+nB5l10zzL40mSYBttj8b9gF2aAf4LHNsfIPvH/vKGlCt+QhKOdqU0K
	RbxZ4loyqj1T0falux2bqmcamLV7eOzHjR6r/F01zAK+y2B79N8WKIT2nCcd2M1YrWgnvmQefoX
	AUD4HhST6zztEiGSGdkwbBRJnVt2NgXflMgeRZGkWvjmdxjad5ina9NGOU9NJ5znLKEhDWW3i8J
	k/ed2EGeXpGJQBQe4Ev17/LGanZ7jalX5qGEkKe7QRsYqPKNQ==
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr387159205e9.33.1792079865401;
        Thu, 15 Oct 2026 08:57:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:34 +0100
Subject: [PATCH v4 08/16] media: sony-starvis2: Put module into standby
 after identify
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-8-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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
index 10f91c4b6db3..49dcbda9ecdd 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1159,7 +1159,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1167,14 +1168,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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
@@ -1182,7 +1184,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1204,7 +1206,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
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

