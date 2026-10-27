Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100778;
	b=mafVhMfZngGGQjjgWgJPTGiXQMC+Qy6kzjghyWJUrwE/3pzpZ28ap1ynRcfpcuUiIoKK
	 tcI3slfzM/goIOlOHuFJ4Dfc4KDZIFYPOAnFD5Bo0jNCPGtN56Eo06Vfs4JF3g78CA8vH
	 kEmSLWRoU31O9aM57hYcEsiQG4jwOGpBsCV8hAyg6Y2qP3ZrRX/Dd1ziFlpomJTb5Agkn
	 CmecuFJ7DJ2IbL0iSGE4zK7yoFIccfXFfj15DVujAqw3yzaTGmY2jzXgCiSBHP3YMocm0
	 zVecmuIfW35cVcMKTlDF8KuSyPW8aOzQpab4t+7WiQdRiHnn1jWMnue/xFrUtfXKH4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
	b=rf46I1ndUkfx77yzj2vDAPjv4tl6gVuhiQj/BiPrO9eOtoNEi4wu6Zxe26s8eO8F7E/g
	 WnEbqpQxskKDj0UQD31M1qKsz+Xxp0vDux6wXvnCXs+i4KvPNRh8QabI89Vk5ar+bIEaS
	 8T09kpwZmB1mDTXe2TzsSLXnbtePV1S/uL0wbrGpiNoUatBJibSuHVsLKN7mYZaQmC/tV
	 w3mUQ0PEnbr1QE+6kAgKCD6c99uNqTFZdsDSwzbHfD97dyEfv0sVaJYaGnLhZQXSYE9Xi
	 oS2be0ivntaU71tfAlmEiJQCNFS5FTXG2PhCpXI1XHewoTjhL/eVhGe7mP9HtN2Mtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McUPc2ZN;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B5560A3810
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B5560A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=McUPc2ZN
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c498e2d623bso247274866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100776; x=1793705576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=McUPc2ZN2aivcQ4l5tOOBGiPLL+Gr9rSzpYH80ieeVbvD4G4q/IbNcWuqBjIz42m/6
         80b8xn/DgVTwcYdsvPzshoVOoLegZeY1+2peDLDUoBGFP4AAz7I2HZ1rifvwj9uv9ZdW
         sgZrA/xDqxMiUHIhYs1SlCGA9QsQJVOm8CtTjFUl5u+OXqISoH694nMDxXibSaoqwlW9
         t9q2MFlrcQC0iR+CaYEJ3QDfetJfz2sf4wqP1fBeGmFtBzuiqMGiQUMi89VvLEKkf1FM
         gfmVMW39WZxDrAES66K6HlarB86IgQr50FXRThVp8I9q4EKz2xivJvjKsEDenPGlMHgu
         eE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100776; x=1793705576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+1ypqBjQvXyuz22Lalxe1uAPyrX+1OBJd94rnYYxRo=;
        b=pl1Lvy45DsX/NlMCZnUgcnO6K09Wpgw8MYRs0FpcM0uarvN8AGOcDesTV5iKLsgBVD
         Hth098LTWr6Yt8bUH1RupiyCktVDktyJuwRvfyKypddjUFrfHXXWfDXbVytJ2x1evWM1
         VToVfcNTY0SZx5jgSFNHnQv/h9bwK2X0aLBLaFF6oj7gTo7hO9cQpGrO5TXxQoV+xy4K
         WnslOyLII2sdH+isrqxpQDvloDnw2DTEXPnqBHQJ6rZ10wdHqyCX0bYhC6fBC+pNKSn2
         /dSNSq+dZivgljkxwgpotHjWRUrcQXSj1Uj60HnVCgX9fupCOEHu9M7YI7c8Xn3/SBzp
         QFEg==
X-Forwarded-Encrypted: i=1; AKwUvByg1oQolO6meILndcKACVI6Y2o1YK2tYTqX9f+UniJKr6PWTyq9vS+RaL4vvDXore3Cz1mfS4yyFoAaP+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkGzdGPO+/cb6ylczT1Tr8HLYC01conAOWh2qQ5Cwyx9x0CVvs
	QNO271fvbmvTDdIooE1oYlXj4Sa0BWx83R0fvvEyY2kRI86sfslPXh2K
X-Gm-Gg: AYBFou08xZXbLbXPpQayqs76CmNsBGSz4a09Y7WPAkva4a2r0uu4bG4byHXPxbSV4AT
	jo7IuzYUk3LEOm0THEYSh76aHmU84KU71yCVUy2m0z7/gzaHCIzYwpSW1hOOVqJ2I0UDh1/J8yQ
	YZ8CHNutK4vLRLUHxAWLZZWd7u/flPKWPTJp2qCqZ6zI3PtQD85c0k+iwev2W/1JIUV5fUUQGL+
	Lb+opQCLbC2G/MMJgbBBrYhdAqHVCzRRFqv31CZH03wVZiRAZhtrk+u7K81Ca5xjj9Ez9TasMbu
	963SZ7U2OQOBa67OATJ+s2ze3PO7w+IS/K2VpWWer2Gwmom8Km93XBGrXtJxoZNiiL0EHpgYRBX
	hnpx3DUlJ0YzNSGN8C1owz/tbHXzP0dUrK9v7S+SZX/WrBx9qZ5DunjcCATeNB3GNXbpobe++7Y
	iXpwHHDlZckhEuE6aGPc31vbS7E/9EwnbVkrLieW6haPdFq0XTj5wAuboiRe077N4ymgBKkfbxT
	BQlMMDY9qcLE9ZJa8nEiPPXSBnhkoA+kalsTGsdD9b2whHT6R7W/lVNvpy+jiqJLjEd2bHMzbQf
X-Received: by 2002:a17:907:720f:b0:c46:7fa4:922c with SMTP id a640c23a62f3a-c46bde3211bmr1016964866b.24.1793100775923;
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
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
Subject: [PATCH v5 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Tue, 27 Oct 2026 13:32:28 +0200
Message-ID: <20261027113230.47538-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT2870 allows only 32 steps of brightness, with this amount defined
by the maximum supported current. Remove the need for max_brightness by
calculating the allowed number of steps from the maximum current.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 8b790df1e842b..e85f2b4d81068 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -20,22 +20,9 @@ struct aat2870_bl_driver_data {
 	struct backlight_device *bd;
 
 	int channels;
-	int max_current;
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
@@ -69,10 +56,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
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
@@ -145,15 +133,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
 	else
 		aat2870_bl->channels = AAT2870_BL_CH_ALL;
 
+	/*
+	 * The maximum number of brightness steps is determined by the max current.
+	 * The aat2870_current enum maps directly to the allowed brightness steps.
+	 */
 	if (pdata->max_current > 0)
-		aat2870_bl->max_current = pdata->max_current;
-	else
-		aat2870_bl->max_current = AAT2870_CURRENT_27_9;
-
-	if (pdata->max_brightness > 0)
-		bd->props.max_brightness = pdata->max_brightness;
+		bd->props.max_brightness = pdata->max_current;
 	else
-		bd->props.max_brightness = 255;
+		bd->props.max_brightness = AAT2870_CURRENT_27_9;
 
 	aat2870_bl->brightness = 0;
 	bd->props.power = BACKLIGHT_POWER_ON;
-- 
2.53.0

