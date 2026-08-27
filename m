Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A5386C1B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872607; cv=none; b=qEJOzgTyrMTzUtzXi+zdmiUHfCMz59jm3Q9EbBmpCoCXbLTTXJ9Zu0fWdjWF22IjizH3k/7PGY464miwdrnsnCMJIPSGVyiO+h8T4M5Ja/o2XL37YGD89z5rVB54JVjH05Ni+L6zUVW+9VaAdNqUqKLJVZTI1bbZj/jB+Qctnp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872607; c=relaxed/simple;
	bh=oCddYuoTsYPPcLkUBXWxx1kKdBtdMsF20eD0FytAAIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWI59rezbIMQxDeoS8FXgPfA/Go71RBv15MZ2GYHWy0Zme98uVng67LhNX8OgEfnu/50IuL5C0IBPnX0cT2BLrTt2bOhyzVaCWNjmtIKREXs35huZ9z/kbHNUSiW1vomD2pwkrzyl8Sd2CSVjut3QkBFNViGRBFbsBYY/tKGHHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cp3ISGIo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cp3ISGIo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so3762805e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872604; x=1788477404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgM2YmzxkKBqGF8ip3+p7pPQCfGLs74Br2HySqIdTbo=;
        b=Cp3ISGIowMc3mS8puCjdTXWG1dO+PDppSzQwUnallrrEOmu8i0LA68W0NV7KY6Shib
         2pyIYyGnSseTHGpA+MoAahKsslNEeTtkJZzF1qJZOfh1Mvb5JndrgHJu3Gw0m09DtNci
         GcCaXDhaVKgFaUOuqHHpObOKVPthlIjOEgjJAPq4VRTheQCwHYFb9WzXnnUwkVYUmSZb
         n/892VV7S5FtqHZPHMW0JyPXcH54YlLehQI3qw2z3kifEsXYZDIc3TiSZNyi/LG1ED+E
         V2Z5GGWrcEYCNjBX4ZckL/Nkit9drK/etY7dX9TKLN+PmVMEuD7t+rs1OVpZlfnXu8R9
         WqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872604; x=1788477404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgM2YmzxkKBqGF8ip3+p7pPQCfGLs74Br2HySqIdTbo=;
        b=MYxWHWppT8hpmNEYtIeywvY2edcMkmVF62lUeU8uSYYY++KlTJ3l9rLkN6T5VPwami
         TqH+SJNaMiJy95cE7hnexB/O6oqDqiLMxpyRLUMIcm7AAhh8ilWjTBJaTVYa98OOuAa/
         FALQtRIS7FYxH7NUwPe5wM6+dFBVa5Y0jeuxBaIrecK8FRT7rlF4v5rNCQ6gDxkINDzg
         wtdB4ay0J5j+1Huc6V4TrAV6H1UnWWtdUo8MWgq6sJtMpat0004eNNS6jYZAAGHRKSFw
         1hn2OFkPRUE7Gv9P5AqZSUE830CH5N8vfA7rhXZ0Or4TDI5MlqgWnFC6fLyIFyfkMBDG
         LXhg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8vbgCgdgz6vAEhHJibbU1CiGu2ahZeZoa6mlb7T/TGhWRFouo2CQi16ajrlEgnK9mEYHmoEMSkmlrz9U=@vger.kernel.org
X-Gm-Message-State: AFuF++k8EYbaz5+y2J6kfdxPCzWb3bETL8UwjUeOQwkILcqtoh8tTz1X
	+Hy4/joPWiRVbU4USEXlKFt9L+tVj0jzfMIEvFbA/H55KRCNHVC7VBTg
X-Gm-Gg: AR+sD11WLXUt/Zu+mVtEtDUQabsZBHkKsFCPYj6xbMBKQl8UEODCR4Tsl0AaCaMOMPS
	oi1TrJrKeBylGNuV/dHq7Nu/HO+LTFAfnU0lzv+dY7uAg4JB6UJuTa2rFbZlsLxlJqcL9XrTy7S
	C1j1kb7F9+hMmVdvQZ+oiqJl6/Bdl4UVHHfAQxu3YpwC2IpmJGstqQPKrjd1Xosg8LVMBYYi11A
	zH+K4dSNz0yphB0VNJveg2QxOBdyLgF2otppDE04+JX6sl9uU1ORmizUhhynKm0mxFGW5sjuWJF
	hwePRd3sYEtCfKosRkyzTLsgbu9hGzbA18h81Yd4FJsPbRWHgpbkf4q5H4pjbKqaWvusOcOFh/j
	fLV9hOl8BS3tY/3UUY2Sz9eXcRtzTJRgpnPYvb8nCFprhcSrNAxJfnnrUwqssd5hmKhr/vykL4D
	1eJiH866az5kptrEOhh6UR8sWXxqh0Ovo5LXQoz7OopC5gzpS7VIixrKHEXfpYMtj7LaXQWzkJS
	+d/U4Syyu4Gaf9c6tbpsGajWVQXFq9Y4zZLjL1gnveZ7dCiYj+kbFo=
X-Received: by 2002:a05:600c:4f86:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-49b91c4faa6mr27292105e9.12.1787872603783;
        Thu, 27 Aug 2026 16:16:43 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9269f1b6sm9835725e9.4.2026.08.27.16.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:16:42 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sashiko AI review <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/2] Input: drv260x: Restore configuration after device close
Date: Fri, 28 Aug 2026 01:16:36 +0200
Message-ID: <684969b0f53a9e5f83636b219c139e904e74e14f.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.input-v2.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.input-v2.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enable GPIO resets volatile device registers when it is lowered. The
input close callback lowers that GPIO, but the next open currently starts
playback without restoring the actuator configuration.

Raise the enable GPIO, observe the startup delay and reinitialize the
controller when the input device is opened. Keep the configured actuator
mode unchanged during playback so later initialization follows the mode
selected by firmware.

Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-input/20260827182855.DE8E91F000E9@smtp.kernel.org/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/input/misc/drv260x.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 6c5c4c53753b..f26a9052edd2 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -243,8 +243,6 @@ static int drv260x_haptics_play(struct input_dev *input, void *data,
 {
 	struct drv260x_data *haptics = input_get_drvdata(input);
 
-	haptics->mode = DRV260X_LRA_NO_CAL_MODE;
-
 	/* Scale u16 magnitude into u8 register value */
 	if (effect->u.rumble.strong_magnitude > 0)
 		haptics->magnitude = effect->u.rumble.strong_magnitude >> 8;
@@ -426,6 +424,21 @@ static int drv260x_init(struct drv260x_data *haptics)
 	return 0;
 }
 
+static int drv260x_open(struct input_dev *input)
+{
+	struct drv260x_data *haptics = input_get_drvdata(input);
+	int error;
+
+	gpiod_set_value(haptics->enable_gpio, 1);
+	usleep_range(250, 500);
+
+	error = drv260x_init(haptics);
+	if (error)
+		gpiod_set_value(haptics->enable_gpio, 0);
+
+	return error;
+}
+
 static const struct regmap_config drv260x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -528,6 +541,7 @@ static int drv260x_probe(struct i2c_client *client)
 	}
 
 	haptics->input_dev->name = "drv260x:haptics";
+	haptics->input_dev->open = drv260x_open;
 	haptics->input_dev->close = drv260x_close;
 	input_set_drvdata(haptics->input_dev, haptics);
 	input_set_capability(haptics->input_dev, EV_FF, FF_RUMBLE);
-- 
2.53.0

