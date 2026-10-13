Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DC5304AF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914991; cv=none; b=KUMsu6e9Lu8dmSifo4LP9HFsC+W31W7TLcwEi8luqzVaEUNU3FikwjeModQqzF3LOzXzOngRWMWboAoEkoROGAZgXxQ/4Z0KM44YqHGvQqfNWgKUiqpvZw3cj0RRq73awW058Du04qyn52p7TwdqTB3NoWQ8wL6mSp2C7+SandA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914991; c=relaxed/simple;
	bh=8u6UgmlMcnxZT0MDTxqLLP61U4irzqcwFndOVAUV0ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bor58OfnNIhqLFN0QqGHm9NWjj3XF9Uv3hX5/LPjJs9nYjqd4fJJQChKbhCyjkZrCEi1PP+lA6ILagwQhNQWskqqXaUgyhGYy0VEOl3KsLm60Z4yxFIMvCgxuS/K4RA9r0zvchCmYJcbynGuOMqiiwkttEloX6IzR7Q4iqRsa6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehTjJOfO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehTjJOfO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2360768f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914988; x=1792519788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZwqTFwjGa56BYbboUIBQ+4BPXdstI8K16QSmTD6KIFk=;
        b=ehTjJOfOrss17auJzVtlsVV/Hm19M0vOi0Y9Sp/KAA5Hsqyv/U4ds+FBz5dUnD+EjS
         SNxc/UME5dlMFuyZJtdhubruE2JTxufmHpqlGbaTOtK/BAVYgZN03cknfrPZ7mHYL/OQ
         aL0YRQBZONP54gsmMbPlwnSNeIsv6L+N30XYu3adMejoqo5pMgchz/frxST9urEq1hSZ
         kJBNPBFqIE9IIlP1mcncUVuA/cQ0nzgsqqEGijR6nish841rH1ZzNWkuvFtB+PWbdC5/
         0AfHzQQ6E6KHSk5h1+PIOL3AHcjoQEaS8WM5UFRVPfuQxClZUA4J2fz/8OZMX+IfOQXZ
         Ha2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914988; x=1792519788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZwqTFwjGa56BYbboUIBQ+4BPXdstI8K16QSmTD6KIFk=;
        b=Ov9dCqzgIZ+SajXA68dd74xrAlCE+qaIa4KZe/4KCbtGEXBJns20PpawoajvwyFP5Y
         xeNATdHWairnHvxRqb9r76ci/n1S7kLzQLGwWq3XV+LSOjhN40+f0nmo6XvxHdO76ccf
         HL50jpUHu5qPYNjtPyJMmRFKBxBQH20vKELxHO07gC+10A9NXTfF+Khd3uFn5+UoGR+O
         JFZV2x0fIyJ0/VBZmn8BaGX/t9gy/XqjokwIxyA2L2OWvsA1KSdJxw1fybMuJMjaVHzj
         MxuHGmAgyfK4n/4tqSLGgpBbw/pbrmNfMkzFrc4KsoqgFuRYFAHOgtzVjC81BdDBEv4N
         7vSw==
X-Forwarded-Encrypted: i=1; AKwUvBxP1fC8PrU0i2NcdWvOxdYbY5216BnGaaiGSAtRnMDiMZR4w5Wmzl62x8WEoEEUbULjezmLUmO+xwx7ag8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8NBUR9GKHPdQ8X+yF8fpvjVQIkHBd5UMjSYCRFrAQONH0nZmE
	PvfA4XlenxAyBK99ZhOpwXPOxZ54hn3caRMljtJ99rZ8IYmL5n1Ndr09
X-Gm-Gg: AYBFou3hhb9ajRKbwat30Nfsj8Xthtrru1urJttvSuclK089pzSYITv8Sz9t1uE0xFk
	MUAp7wZp+5b/Lj6XB/E+KkJbiU91y+HDwF11dckzO94CuS54FGKXDul4C3KXNobkYiwoiVgPxmm
	2jCIkseV2fYo8SjB1+KN9fnctVaTWeRSderuDIsp5B1stmp/vChdvk/mxzcPwZpz2MN8MhY/4FK
	C4GtviZTyIl6YhWCMq+RURbIJLP5rTA5PG1mN+ixhh5ef5zcfeqvMGkB2IfHmVpT1/CoZBgz5Ch
	PjlHOvtBz0qS0W8YH9npb5Hs5DnujV9KGbfk2mNEmCsaPfWyq6Ylolywd39B0YqzXLmg6rQWlNY
	+fmPJNns+OMFbWj4zzniPTDEZTlse3Ix8BKfcZFgN5XLrn8SkgdKhaHkkj66yyTVsOKYoG01RFp
	+UpCJkr5cnKPDwfTC82PLuLEwnfSeyI4sBCF6GHIjnIpQfhVBYppqncdj7S93SBE1XJCUiIfpq3
	huaHm3xzSyXFlkgHo4=
X-Received: by 2002:a05:6000:481b:b0:48b:11ee:de66 with SMTP id ffacd0b85a97d-48dbad1217fmr23545543f8f.34.1791914988401;
        Tue, 13 Oct 2026 11:09:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
Date: Tue, 13 Oct 2026 21:09:31 +0300
Message-ID: <20261013180933.487013-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 30 ++++++++++------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..eb686e315921d 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -24,18 +24,6 @@ struct aat2870_bl_driver_data {
 	int brightness; /* current brightness */
 };
 
-static inline int aat2870_brightness(struct aat2870_bl_driver_data *aat2870_bl,
-				     int brightness)
-{
-	struct backlight_device *bd = aat2870_bl->bd;
-	int val;
-
-	val = brightness * (aat2870_bl->max_current - 1);
-	val /= bd->props.max_brightness;
-
-	return val;
-}
-
 static inline int aat2870_bl_enable(struct aat2870_bl_driver_data *aat2870_bl)
 {
 	struct aat2870_data *aat2870
@@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
 	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
 		 bd->props.brightness, bd->props.power, bd->props.state);
 
-	ret = aat2870->write(aat2870, AAT2870_BLM,
-			     (u8)aat2870_brightness(aat2870_bl, brightness));
-	if (ret < 0)
-		return ret;
+	if (brightness) {
+		ret = aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
+		if (ret < 0)
+			return ret;
+	}
 
 	if (brightness == 0) {
 		ret = aat2870_bl_disable(aat2870_bl);
@@ -150,10 +139,11 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	else
 		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
 
-	if (pdata->max_brightness > 0)
-		bd->props.max_brightness = pdata->max_brightness;
-	else
-		bd->props.max_brightness = 255;
+	/*
+	 * The maximum number of brightness steps is determined by the max current.
+	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 */
+	bd->props.max_brightness = pdata->max_current;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

