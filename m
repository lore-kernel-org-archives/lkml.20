Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A02C3914FA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230507; cv=pass; b=OJfkPq63wDqEZJtAip/vveljJYPheyqsPb8MHDL/BBKjl+Kg2JoSN0eAOU8oa6J9HzBTESc8HanPe8Y03riujV8P8pIuUQ4Twh+kOx+wCzY9/lmwAI6ewZbJP6CFnm31T/c2dbnl3b7Eufo7ioE9BsUA7gLloy3fPdf90KLKJ08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230507; c=relaxed/simple;
	bh=cPOKI0YwXXROnWh8Xa+QzrvdXvUSGF1yvdjlmF4zwH4=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=PRQjPHobh+kdfHtRrfRP5Okrl2InE7UnlBsWoodIaSTotJFmrCyDBgCax+FYOpBRB4YtDZFN/YiJUt164xQBtztn8LCeQN0DxuA1YAcE8m4jX1db8wFzn2fCfWMOn1SgMLvzXWgfaoV4Ow7Yo7Tl4dmYCdOdm6MKkU/wfJUtQ10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk0ciDlf; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk0ciDlf"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e94a057d9eso497420e0c.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792230505; cv=none;
        d=google.com; s=arc-20260327;
        b=YLw2pZx4ra2mm5B8DsWvrAGh9dJVpg/7da4/3Smr7jqBCbJb0UHXjDFma2Fwa9Ms1B
         RdCB3lvp0SC3Q+kD5wEz/9KKj8SViM7q8AAkM/JGwA7y+E3KYc2AFJ/BkLrG9ej23qZk
         hC/gWCaolP4CY6OH/1gIsnKpuzYXcc33u9zeBCkQUZYb2U+7Dk4gaAyeggitXh0Div+C
         aDgB8LpVv8BEd6BIT+pTPVg2A+5lNak6AYnJNvjAYr63Zu059YYmP5TZGZrfIhc64ey9
         s2/b4ejFJl1fj0Opjbbmymzq1q8DQciSrNdqItB4V/+y1AGM0B+5lGIMztpyLFbhvzkB
         XnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=ga6N3yF0QQLdNTmXfoZ07LNIVQ63wj19E69wKGJBb5E=;
        fh=zFEUC4COc2aPgMBabUcCPROKZIEQSxdLTpUWf/Thz48=;
        b=fHTup6Rou5La26zNSj3Yv/jb3Rodulp58bsK4bizth/rwMewcQ9biNYM0IxvhgML/5
         OGYAhzlu1TdY3xdps8IidvbQ96VIwR9Br24oV7lOZsUDUvndYbb/UumyV9LPaSSHVvcl
         kzqNWEYb9jWfYQLYVXOCSr5pqvJqXcB+hmA4jK6Bs+VtGUgW5Ci6jlde9V80USkVkKOl
         pgxkoOE2lKtilN7w3EZjoiXdcuXnigFALXEDn8EcnNYnqACoHfOCkdz0gZu15VgvooF0
         mp4tFIE8PkJQ/HaF6ea0JhjFrzmxHx1PxEGvTjJT0jxm5jIC7XztWHgFdWVFYbbdCITD
         qh6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792230505; x=1792835305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ga6N3yF0QQLdNTmXfoZ07LNIVQ63wj19E69wKGJBb5E=;
        b=fk0ciDlfpzpnsUmpV18rXCc1hWBS55UNHhOZyWwohcYSNTp4dOTYF1mDLVz0yMP8Wv
         fDIqrylvNFN/whjxCrneu6MKv8gHnxwiVm/3cLKPoDY7woWwoLniHAUUdAROEs1hhOqN
         TQDv9rcxd7iCbpbecRuPPcSPnegQPYisHCKPj7DbjwnmKSvi0JS67e0W0unoBk+rBJH9
         /cWrFfVog53SbO6H99geYK9U6C4Anr3CvJCnYJ3tZ1a54ss7AtH4TQNS0GcXKK/yTenP
         UVpbxlbgkTh71ddPkc3sZ5kwqeRiY/m4X/E+SG62qLyOy8DM2qsyqWKei2aYI+fBOq5V
         s9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230505; x=1792835305;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ga6N3yF0QQLdNTmXfoZ07LNIVQ63wj19E69wKGJBb5E=;
        b=rovRpvePx/ZekLWWuLQ/4gKr0+WmlPdrW7innGURZRdS2GgE1KBMCrSxk5GaOEbhTo
         Md8v+EikTz9zkDtHKJ0GJ+AyFt/DZRD/LTYjeac4G5iTUVqzx3aHCCVmLsD/GVImv/SZ
         cViP3gIxivkxCnqDH1L1MZQY+Ea7NkOVtwAu2eBI/GrmAESbl7stScnrClyxCadkEU7m
         wX54Ctvs/UnS2JHtBpIhm+uJHcMtwXOpbx2lGTNMUjD8edE16kV1fvJh7zrSXoveeTJq
         FNBHbXm9EwIMYqQeFyJeb10LkDqZTO8G83sTIbnRAmxE9PByhGe8G4exfDehe0zNcKvz
         zdsw==
X-Forwarded-Encrypted: i=1; AKwUvBxvY1OTudMSmCoqJqz9pPe3K5edEvh/a2mGlNb7Lhhl7IksnEPXkop62IzvsthdLKmNmXhD0wGJuMrNW4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcrETybzVErpDHooZWrGuP4Ice4ewD211Z/7vr4P6egD4K2t4b
	ShPsjje6ixUsJ/4HIpFvbEcvqZ6FGLkKdUxhiENqG/2OQ/aouyvZMyRBQKUDUY4u8luITbKDi8c
	GM6vfO5vn9hi61KOI/Ei8IfyaSGodK94=
X-Gm-Gg: AYBFou0EiGqpYaS/FC71IrFm3BUoDFmKl0IDgXlQpHnizwcdYI7+9StushGzLm/QiTO
	GWfDhBcLVRuTEeh4BH7H3CkQIYxJ6W1lG/6I2O+8T2tYeM9PvSksl6N7Sn/Q0V3utBDRlPxfmSf
	NohR5XCYEBWT51RXH1rljJFEXLToIzgfihzKj5PKyiG6b7Q4KVC2Te5AQolABkMqBarh/hRDWDo
	07nFTZzD/9fib9RE23Mb62Wu7V1+ZCqWV/eCQG7zAcpEyZIjaWXg/agVoeNNbLnPeVPFV3eDoXv
	jGj39kYC75HteTVAfmBxsdLPsWz1ux/jsZILbdont+7/afkHG5TNbA==
X-Received: by 2002:a05:6102:38ca:b0:7cc:3246:3095 with SMTP id
 ada2fe7eead31-7cc36b3d24emr711904137.34.1792230505414; Sat, 17 Oct 2026
 02:48:25 -0700 (PDT)
Received: from 219304801992 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 17 Oct 2026 04:48:25 -0500
Received: from 219304801992 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 17 Oct 2026 04:48:25 -0500
From: Wenqiang Zhao <berringtoni36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 17 Oct 2026 04:48:25 -0500
X-Gm-Features: AclHuK9FxGlMlcCjimXZeRb-7era7lK_0Sasn_TOvi8XgQL9o8qfQmHKnbm2rH0
Message-ID: <CAF2O-sN=PM1MUaWzv2r3zT0TozZZje+0eYPiJLQV_LHB3-Qj6g@mail.gmail.com>
Subject: [PATCH v2] iio: accel: adxl345: update period cache after successful write
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ADXL345 event-period read path returns st->inact_time_ms. The setters
for inactivity, free-fall and the ODR-derived default currently update
this cache before writing TIME_INACT or TIME_FF. If the regmap write
fails, the sysfs write reports an error but a subsequent read returns
the requested period even though it was not programmed.

Update the cached period only after the corresponding regmap write
succeeds.

Fixes: 8a1536cc4a1c ("iio: accel: adxl345: add inactivity feature")
Fixes: f6f22950d925 ("iio: accel: adxl345: extend inactivity time for
less than 1s")
Assisted-by: LLM
Signed-off-by: Wenqiang Zhao <berringtoni36@gmail.com>
---
v2:
- Keep Fixes: tags on a single line (Nuno)
- Use a Latin-script name in From: and Signed-off-by: (Nuno)
- Drop the long validation notes; build-tested only, not tested on hardware

The missing serialization between concurrent sysfs callers that Nuno
pointed out is a separate issue and will be addressed in a follow-up
patch.

 drivers/iio/accel/adxl345_core.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 6c9080d..cd58304 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -391,30 +391,47 @@ static int adxl345_set_default_time(struct
adxl345_state *st)
 	odr = FIELD_GET(ADXL345_BW_RATE_MSK, regval);
 	val = clamp(max_boundary - adxl345_odr_tbl[odr][0],
 		    min_boundary, max_boundary);
-	st->inact_time_ms = MILLI * val;

 	/* Inactivity time in s */
-	return regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val);
+	ret = regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val);
+	if (ret)
+		return ret;
+
+	st->inact_time_ms = MILLI * val;
+
+	return 0;
 }

 static int adxl345_set_inactivity_time(struct adxl345_state *st, u32 val_int)
 {
+	int ret;
+
+	ret = regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val_int);
+	if (ret)
+		return ret;
+
 	st->inact_time_ms = MILLI * val_int;

-	return regmap_write(st->regmap, ADXL345_REG_TIME_INACT, val_int);
+	return 0;
 }

 static int adxl345_set_freefall_time(struct adxl345_state *st, u32 val_fract)
 {
+	int ret;
+
 	/*
 	 * Datasheet max. value is 255 * 5000 us = 1.275000 seconds.
 	 *
 	 * Recommended values between 100ms and 350ms (0x14 to 0x46)
 	 */
+	ret = regmap_write(st->regmap, ADXL345_REG_TIME_FF,
+			   DIV_ROUND_CLOSEST(val_fract, 5));
+	if (ret)
+		return ret;
+
 	st->inact_time_ms = DIV_ROUND_UP(val_fract, MILLI);

-	return regmap_write(st->regmap, ADXL345_REG_TIME_FF,
-			    DIV_ROUND_CLOSEST(val_fract, 5));
+	return 0;
 }

 /**

base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83
