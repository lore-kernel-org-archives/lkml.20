Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD99D4A49A1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360856; cv=none; b=WymxN5J+J7SCrEPTYuw7BJ+k9ObjHR4UtQgUz1eeb6DGySptCvaFmR71OKGeobC3CrpiXh+Hpa6AKP9UvSaw/9cISrdK+3bumYZrn+MsCwNKxrVnKTIzsSgi/eMxsEWPanHpz6PVDJFkPBs/Y138IK5hUa3dBKP3Vc/nfOP/eis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360856; c=relaxed/simple;
	bh=oSQRJqNxqEh6/B1/z4WZhyY4jL7gQ546XKgY1JR+lhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxFAQicP5WKnJw0zMn9PSy+bGMg2y96A/MMwmzQ4uo8pAV2oaAe7MYIQ0FdXrvUxpRv+NCUSjd9xb6yNl03HOcNqmGrnLEKCuQgfV6ONasoZklVclnH7LeT0GXPFvwbg59jf+mZ0uymnRKOwJrd7+hdnT/aC4sGj+oF+/V0VGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q++xMmdF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q++xMmdF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so786680f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360852; x=1788965652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=q++xMmdFALF3nZuD/m6gSa1/2igIaPshzRVFmQi9cdzdB5cX+Jo5gFkVMaRVjkyEzW
         87SB/PK2LHJvXM9PSWMmX3k0JhURpNctQWejIO12b0yZDwTqf2jz9vzW1Ydt7NEAXwUZ
         cb3jZ69I4udjjKd7muxE1J5BWPPaCU43c1zQhzxpp9ANp1ESX/Gjiid5P9LiX6jCU8wT
         TQpciQAKYqJEf4YtYT954e4Gr28ZFdMpLO730N5rev/aZGImf4xBFtXuJwWIOdA8h9U8
         wJLzUWZdFpRdH4ReKRWXmWdG8FuNj6HO1Yly+ZEsmYy1t3TGgB25zINiZu0Iv1A+A22N
         6esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360852; x=1788965652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=Y/08/g1Xmj0SgDA21oEcTyXsz6fxHp8w81CjEBU9bWJQUbufvG2qfAQo2BhCCwXADH
         A9TLpPguwtQQTFAuGZDU5dbpAtmkYJFVjz4mpV9ryCAu3pN+A1jumJ6nypwKzz77ihvs
         DZ8dd0oZnNkE16s3wMRpU5B4KoJjJR83ZHMjsezfZDf9KLbrXz1QpFLLPs1U3m+sl2oG
         LF0sAx8oLvwKjsS8BNzKW+wbXzhG2sgobswAlVJuyrmO3DBXV7CT3BqNW1TvMBaiMIo3
         P6XQaL7/pMs83O6EnPZdZNojcVGUU8PqL6zNFjSrJSO6zvnQ+xD51k3hW5Bz1lYsqk6N
         F70g==
X-Forwarded-Encrypted: i=1; AKwUvBxSn3e8F10aiKluAE/Ki6WhLes5vmrBECyZS65dgFWDLqrZJBs4h+NG4dHhvQoqx/PU931dui7EZ92M74Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nYDw38JPRC6rGNlU4FYYWnCc6NC7EzoDgThwGpcZAoZpmaXpTo
	YMZ/MDWYMCiZVMc1dfH9HEMAV/cnAo5nguPVkk9PPRrqcl5M7U/okGhJL5MKKmVlO1zMtQ==
X-Gm-Gg: AYBFou3+k64+/8qn9Tj6K23pwoVMUcHW+QRuDRaOeXIE4hNUtIQW/Mi808pya0wx+BK
	HEA6mdqmhK8XxhHhrTE5dgVzEOCTWssmEAoIdnWvfh3CmGu8gOZXzRTNMV+qn15wIhO2G3sEceW
	PFphBPrT2tJVPlBucgfJ2iukqCAFu8OR6QukqiDfkBGGBNMsi0O7tyV+gRyFSYzseeqD3/mC4im
	Yp0LAX5s1g5VEMG9aSYj/r4ORsu0BahxzM36VJgUvMMQyxX8JEQ7b2xQDOsRkcZRqXK6EsCtY2w
	PZz5Jxm0iDxOUiE0HeT5XIs2mSlO+9GXBgJfxsExe9HCSHp6SRXfXoqLMK20zEgzYlsWpGy2Tvc
	H2W14lm4PHrk9h1HSu96gvXM67c1EBDVsIu4luisNnLxnSrCUbNf3I7p9WJNGOze0UDLZ7apdOr
	Lgt9mY6nE8I2jynWIFiiJGeGrnWBVBVVyZeMi2ly5mrWX8VbGzTJPmdw/VUdwmb0r6oArTf8hb2
	c7YSKMQVrHE36DxJSYyKAPEpOCf8Si+0ekiV50bWgzA
X-Received: by 2002:a5d:5850:0:b0:484:3f03:82b3 with SMTP id ffacd0b85a97d-48488f0dfcamr4124411f8f.11.1788360851696;
        Wed, 02 Sep 2026 07:54:11 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:11 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/16] media: ov2740: release group hold after gain write errors
Date: Wed,  2 Sep 2026 16:53:41 +0200
Message-ID: <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0

