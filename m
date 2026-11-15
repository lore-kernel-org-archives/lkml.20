Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733122;
	b=ZCvBwJgsAl28rYMf3mQf3xFKan0hC3kCnJf55fqPalcyKFmLOUbJtz7eUoU4brZfW9yX
	 NVFA3Y6DVbGwp/aqSIVlY3HxwhRPjICHtZyyjK3lJ9P+LC2i/JxY9WO8ZtJVONCDTISoG
	 uTJnwEUvqg6R7NKfeY0xk+xRGHd/2L4iWAQpobXLNQL69mmjXPOIQtVcqaDTtvIA36bAm
	 RgEa8sewvMYsYgVBZFxC6QU7QOm3e1ZK31ln0oJAJdN5/VjKh4i5sc5OEeBVKtaKXG5xF
	 wrJS+JzNbiQBpZ/tyGIarFOS33EwNpMeQd18cW1zIm1tkLoH3FvzSAwpl1kr0Kvkbqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
	b=BS0x6l6L99qPDnRZYlWQJ7oQ08738gNm8Ie+uvloRFoyFLDNqjxyE+kvkZc4lCXLW8Zl
	 g6Xsx26x2F+edACfKr52I6JzAd5nsY33O5v/3CcK0IqRuVC2BmJuVnn5a5p0tHeBQ8sT4
	 WG69P8t1eK1uOY7rFoBq4NZQSmGmlweouw+LsFrQOaXzumsQDsxFYeczM9qXp6LH69+vo
	 mil2VDVc/cvwu4ceI2+qkwTuZp+V4t7fXKp7GsCjMOl55BrLUL3axMZh7zVFtpkgmsyND
	 jHx6TiW85IlZPkL4Zv99vMQwfaGEss3RVnjKYKLL8e/+/qdwzJkxV8eK3m9glp6CX8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOSgHpl9;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9457606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9457606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOSgHpl9
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so188968166b.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733120; x=1795337920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=fOSgHpl9GXgR3wKFs6GCGj4bkABY634J8kNAEkL6MydV2DQjJfhj0F3Vl3JV650N3z
         lZ8G0Dkaa5BFPtwTQ3WoUUitg1e85iLEsRZYs/euJV0jjhpzuIYy3b+dpyUd7lVG3Mlj
         q1KVFt6adpKceoZXRyIpVZQBxCXpMF0NIlvlkzHKz+eppMiTAWQLngLgH1fC1nq5B5bP
         B6h6xiVbNo7lQJG2wbY/2sIFL7Ari28PKJMRGflte1ebNW2BFwj3sP92AErsDIEQX53P
         PFBpoC5S1HJj0loHecPjmj3pKrVvgeQ+aouHRMAOM/BsSlpv7Wq1ZAOMm9sTCp+Msc9R
         dCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733120; x=1795337920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lX4a0Ka8ixKkPEy+ySSNBY0xRQ2Dwb5GC2sClh81gUM=;
        b=p+2XBUa8MBG1d8j1Olz/JAB/M8XXj75WoSz+FIUZ6y05sAh+qgw1JXLMRS0P4XnZ1P
         KHpdNHPFReNqT8ObZwGHu+hiOGIc45TTmjutojWQo6AIxeQebFkernL627YV/G1MuwF+
         tpQjqpJt6/jaljpB7Q9AevB21mQzDNLrh4pzmg88TFAqhNqz7oV5lJvsnXmPNWHnS+/i
         ZOQk2cNUptIoinrMAFzVV7j+ZqF6WxhlPXgOHhMpKXuhjeovaxVyU022RwEM90FfsWow
         qAruaEB6ZHu5UoQCjMIeWVDllVEEvOl7Kg6MDbaVE9X0ibCLMFEiC1kxq9t86Agq6d1s
         3C/A==
X-Forwarded-Encrypted: i=1; AL+hErGgEivyGp9MgCud7ENqAPAJh6A6ugfLcFo5+2WJuvLjBiNrwCHyM3Ko6Lu4by0hILSeSBjKPLKubw6A/Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pLb5d3gT8GA6d4hqv1zPLnOP0W3fpOEQ5RSxreQHrWqOxYrPK
	W+y5GikYZ6w/mjz6cM8zXaPSYsAAnk8L1l97y1XnrKCQs7LDaD4hzF7i
X-Gm-Gg: AYBFou1Hy2F60llQxoH22XTOwfWkxDNGI+GDBBFBQJzJW1EMjhKmAo5AtDFhjOEoYi6
	fdrbEVWvVlmc8tzmnaLB9VzPxa6j09Uoz8EkZIh+sRcVG0k+e0psBWu71JWMbCfR/FcILxZVkB+
	aAnLgnFxWuN3nqtBoUmFzE6a1frv3dwTqls4srac28vGSa0CL/gXQHUJq+NnJ6SUrwgoTVnc/0h
	cvnl+fv2LNRFJ9AvwH5JlI0C3rAXlaBcfioAqIprGDQIZIsUoIukBPtdf3eM5A9lXsPmtIJ9YV7
	4QQlCtCFYwgrlKKpOYNA61AkgOPJyBcOTd1c3dUe8EIns4nY+jChsXDKl/6ufRL/aQDarJze2q+
	7E/hYyPyNiplCaSBnqYNgOZNIpWw9Rp+qkClDzF1VDM/vr22etKaINSi/yH4PRp64by2+U0B2Al
	/Rjlnc4d4442sWUB1+wTKEPRqeemzEh8B7Tu8IaDeJGZEPpiSTdZJRMhV28XHE0fdGKop4+yOb4
	nj81D87LpumgivLHaaudDgCg/Vx0dUFpPL8/Z9TjPLlb6DYT4D+tsrnKIwWoJbYSmhn8RKsemom
	MumkJUTRWYjC5/y8AxpFsiXYVNJHOPaXgw+TnghqxZBxWgj2f4Saae7/vwIKMIgWsI1+qkMzWsQ
	rgRDWVHLCuV2G7Ey07fKSYkaA23Q3NLg=
X-Received: by 2002:a17:907:3f20:b0:c41:4d5:e97c with SMTP id a640c23a62f3a-c509640f665mr613525366b.37.1794733120092;
        Sun, 15 Nov 2026 00:58:40 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:39 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Sun, 15 Nov 2026 10:58:23 +0200
Message-ID: <20261115085826.89641-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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
Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/aat2870_bl.c | 35 +++++++++-------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 5af36d3784f11..ea955b55bca18 100644
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
@@ -143,15 +131,14 @@ static int aat2870_bl_probe(struct platform_device *pdev)
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

