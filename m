Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795853;
	b=LA+v/C+EXrjmwh2qBIGK7cNrxkkzL19mEOk5LM1GfKOK4veo+YEKnMOW7D9+5J0r2Fdb
	 e2tLNu67h0T2v/JbIpO13wXAoGD7oCW34HN3VmRGkZI+khHt1vOJcvZh9hH9r9wLokzvj
	 CUpUJ0cJLKQrkKXyBcAQdVu3cLh05Y2sWKNRqZ4xUU6nU4h9/3IvjhNq10KWLjrvG4FkZ
	 Tp5YSFtV8AXLizb+y1KiGTr+P9pW6EcMM2tAnJKFxr57gxXBlk8MjkfKOLbhTIwK3gR+R
	 Aj36691sSnUoFIKRn1kUlkD2aPKjXgY/mhZQikueCzhlnowFADacjQS5CmT/w521wKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
	b=v6F5ate5Kh5Fff4OnJc+nTug3WY3Z42RqwiMGICU9/KjLax+3CqVuiYNEmiFFDoprNLe
	 E41e2JR/rMLFQP/PajCq6rVghbFMBcqQ9JbH2z+YRXNRCuWCnZz3i22yRP7zcBLVpgxg/
	 ruKIS2KUGRh9SvygGbcgRpqc9jP+PeGjnRT4LfACJN/fEcWFHFn4VxGfNSVkZi42by+SZ
	 XlpSkHY3ljhjqO/aGsHLCp3ZMleOm3HZNlS7LWvnRraR52m6IZB9F9B2HJl5N3RI3pcc3
	 JSxvBVKIbK8GY2dSmBiOjy7CCZ5/nVeu2NvhevGnvsmmJ46oJGd7d9Nr34dZXu5NU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5Y1OxfR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2597F606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2597F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y5Y1OxfR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so4730595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795852; x=1794400652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=Y5Y1OxfR3iKK0ypVDOdWcQvNfthHypgwkGVNzqCHG2plZTtuULAlXt3pqae1J2hJxB
         hyM6SbdNzXrIDnEVDU2s4Mc9TN1SnHmMkXeiLTEqQ8psc7UrRXxUd+AiXCVVObAwyDHH
         dTyVeyrh4gBUQSpyuTzZzWJLW0ZNlW3xLETnR0SqouXCNNN2KH9e5otVd8dRL+TTxoGm
         viI+HNNP1ODZ0PxpihCigS6B4QFgTNxUyAs67tr7AdhrZTycCcYfhHvksjgmfsGqaa3I
         2hvjhbpWq3zOpLXIMzLCi2nFsehfjOWhW+/8NkETtgtaU3SQKNLE3Z//HkMULMxy8Msz
         mnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795852; x=1794400652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0X4rUoAWbYYwWIlyCXzN+FfLPErCmWPcGeI3w9a2qVs=;
        b=TDYv5sK2NNzBFJE3jX0G2PiWAP8z/PEX7zO8r4uXvknBYdlB7GWbxFj9sBKJYflt+B
         oZUB8ndhbEEMcgkF4AtT9Oy3sVWT9PjMj6MWR18bXJlJ317RvzjS/Q7cMPEDJgqZQ1+j
         T81MvnpRtc45ikk5FBiRdyGXQD1sp2ehsQ469t+Z1uenMmtSOh11On6jdz+XuDM4ljK3
         DOI13fcDpFI+koDbX2xzxtJMRl4vf9ZW4yKltsHxR7SFeEYzvWzajVOlT1k6Y2DfHh3A
         AG/CtjloFj0MiksFTZav7MWiu0n/Cs+cyp8Xf9Fx+rougM0m8obg8OyKEkepxSM4kXp2
         rXeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgww7f0B8Gq5hA28MxFVWq6Iq3Gf3Hi9BEkyoiCaVckmZ1OpbtlyhdqiBMyaD95C6YmHW2qH0+ShSHyj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nQxjv48aenSrrEM4ddfqSV1+0Sz3rpjTE4IFFQ9F3GAwdjV02
	bpI5hM5/RYI1pHA8THclzphgGVJXG7yP0RzErN2g35i65XNvixcXTBS7Hedcuw==
X-Gm-Gg: AYBFou1djDiH84ev7m1LK8DojTxyJBh8DTT5u2w3g16WVFBZIAUvRe19lHPPpe7ROWO
	4u8OdPLghZwytJm3hhXpK54tj/sxOuTeV7jglLXJwdNSjachGnzr0ZZE9B66DEUuXedw2voZ51E
	zZjsG1n7GOl2+tgDCeHwfg8/hYo2GHWtxWnt3AU0W2EQ1+sSsdpBLdFa/PTgf865Rv90df6yw1g
	HDSUKuNRTOQv2/AT+UBBOW4mCo8g9b3vPAcFqhWE5QSLjQs825v1A0EoymasZMfVO2RvCnjaIvX
	RqyAtOTeUQQNsS4ijIdHyomffP0nHzPgF66YOm4ety/MhgvqYMXRreQAzXziACQ8ofEqMW/QPfB
	7Hs279Dep3cbcrKjZfujQ3kN3lAPdecYIA4XEjhfoGY3tUSApvEz4nQsOTVYXj8Fmu0lR5/DJvd
	MOBih5f1aGgloqgbPUHT/Rur3nn3X91W/ReKE7565B+SVEM06snrde3WKxjFHOkzDth8oXqqbXt
	s1xkhNVzh8bKuII47FR5sip8ixRoL+rpXCf7zAsgyuxduXRgkMdnTEA1ms2h1QbJRP9R/YFBd2s
	5QiCQrjZpGaL/JTfAgwHAOsUDAR2DbIStuUFy1qdXRfehVz/YA==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr367279085e9.27.1793795851589;
        Wed, 04 Nov 2026 04:37:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:27 -0800 (PST)
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
Subject: [PATCH v6 2/4] backlight: aat2870: Derive brightness steps from max current
Date: Wed,  4 Nov 2026 14:37:12 +0200
Message-ID: <20261104123714.234634-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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

