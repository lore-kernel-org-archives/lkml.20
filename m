Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282AC348C56
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257790; cv=none; b=m0YU8rVPRg03Xfmy3oD4ePxmxaGl6O43u01kFLpD1tyHQI1x2cZ37DFU2Tt48fO6sQWA/WCC4jsTKIBOZMJcdfbIyTWbugGyxMOSY5vuXIrO0G1xU1GFTSrhZ48mKaQcutytVPHR5qofd9KH/AUDHghXPP2cjDqfnotJ3nSpOqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257790; c=relaxed/simple;
	bh=hAuI01ZNzs3bcAsTVo4rMq6QkEKmjrM4iV0nBmO1HJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YwWhnTjOJ+jr2BZF4BcnMuvTTzzbiuXRAMOi2NIRoxq8q6h7oyoJ16kT/hF/ZmA5XUD/FLC3ML/Qy5FjgnAcERk+VcnAT5veBGAuTxUvXGgXQeY0z89trE/FagYrr9kJvkoXb1h2mfVpYOmpY/7j/t9tDKuRmOlavVZxnTw+ryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQtoNJNV; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQtoNJNV"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66fabb1a601so1979796d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257786; x=1790862586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ODulsNJQEQrmXFTBmzYpqMkh67UznQ9RJqzfmJQegM=;
        b=kQtoNJNVLiqIQcimQOZdT8J7lJB3ewv4J7SDWydTNC0PI7tmNAHgjVkTA4s5YlSpki
         sDiyDFJJ9KkUioOSf4J6eZTfi/cq7VfLGrTYn/AKXJjJdNzGZ9y+gcDQio4wZIAhupxC
         uzYcmam4UZ075r1JieYksVmqTfzF0f47tuEX9qh1YIPDZDuaO7O/wh/kN2z31YkWkNCk
         uIuu0CKwjgClIAKpz3QOgZOHsCGCZeXiWfYlnrSqIUWbl6TQ44BoggDRbxfbsT9KLpLk
         xuEwUqqgnzFJIf7/EblDVCv3WQP2Ac5N3G1eqxhCUxXd9YH7R5mhVqvD+WxuDuhfe6uY
         1mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257786; x=1790862586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ODulsNJQEQrmXFTBmzYpqMkh67UznQ9RJqzfmJQegM=;
        b=vkF+tOPMflc2Sx+YPhulhsxh6lUbsRsLoUrcr9n5XsIePaMi1TDqrKEt7Mf0eGZHUT
         FpKM7GD5zW2C0LIje1TNbRUpfhong8aosybbsFcUH01eohryuCn6ilpLvWlSRQJj1u0b
         LuMxQtgXNV3kpHLMasviMlicHpJmpevc4O/yGedB2Nn4v1RFojAL6vAow1ZcUfARkgum
         +/LR45L3h/DBb2o6PLWWVan3DHrrK4IFRDg0K9iaCJPa+8xcOXBdmTVWDSpA8XYyh/3d
         O8yBqWTywnxvkj+hb/HjUEAbMa+WsQlc+rWaFmRAf0OZYvHITZmBQp0Z3fZqbbBcEsjh
         L3dQ==
X-Forwarded-Encrypted: i=1; AKwUvByp+FrOg1smgP5q407rnjp3CH3ra+lGyF9hTnrLpgtkiyPT+JmL3os4GCE4zckgDFPdhUxaMqFtKtfdLDM=@vger.kernel.org
X-Gm-Message-State: AFuF++mzFapr2BApzgKfaAQ5VLYI8d1EyXtO8gGjspbqi3aN+LpLutEM
	FA3giDTFPRcFwEvZYKq5+bC7GnxeT/OlAfReJGVoQP8evjylLaK5EMlX
X-Gm-Gg: AYBFou1DpKXDiDPoi61ovx03gyhIL8hHUc2RWa1iOpEu/1AS5J3K4RNU54Cl/NvfBaL
	F3wGPjh3R8/C+FVMHZjObjuqWBbAW4XpTUMPuqTdKPgb4E7HD9ANwT1Js4xjslVLWf6jwHg2rQ2
	M49NsPmGpESdJFNea9nNyNom4WSS8mk6UOdRkss8jy+JYga4942mjttYdk6EUPuijADJHczG529
	WWSNf9pQ+A9NC7UIGyKQJtFLX6FIEWqnMTGOiw/4GVrGmz2Iz7D8sdxL5FuwGzHPnsTF39Pyxvo
	0YE9LQu4ut4aq0xBinfe+1n5KxnMmNM+cNwAGtLQoy9S7YkXjLSIpybGgDTMCm0BTRs98ScYtA6
	M0waAQXOIwKyHrmbPKbrEpoQShcdYLOQWfJDeLjVidlKu6EhVfi6QIqfblOxKYhiNEKoORMU2DZ
	taJIbJa+hRhOddMc1dcS1Pqd+36yES2U86OOGpLaaVzMtkSB3YPTMNMg==
X-Received: by 2002:a05:690c:660d:b0:89a:63bc:8d5 with SMTP id 00721157ae682-8a64e6e750amr12215887b3.95.1790257785812;
        Thu, 24 Sep 2026 06:49:45 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a6524d5d9asm7809227b3.29.2026.09.24.06.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:49:45 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] ASoC: Intel: atom: Fix platform device leak on probe failure
Date: Thu, 24 Sep 2026 21:49:32 +0800
Message-ID: <20260924134932.1590967-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sst_acpi_probe() registers platform devices for the SST platform and
machine board using platform_device_register_data(), but does not
unregister them when later probe steps fail.

Fixes: caf94ed8629a ("ASoC: Intel: bytcr_rt5640: fixup DAI codec_name with HID")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use devm_add_action_or_reset() to clean up the platform devices on
    probe failure and driver removal, as suggested by Cezary Rojewski.
  - Update the subsystem prefix and shorten the commit message.

 sound/soc/intel/atom/sst/sst_acpi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index 73624e1b138a..de1ad168008b 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -254,6 +254,11 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	return 0;
 }
 
+static void sst_unregister_platform_device(void *data)
+{
+	platform_device_unregister(data);
+}
+
 static int sst_acpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -342,7 +347,10 @@ static int sst_acpi_probe(struct platform_device *pdev)
 			pdata->platform);
 		return PTR_ERR(plat_dev);
 	}
-
+	ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
+				       plat_dev);
+	if (ret)
+		return ret;
 	/*
 	 * Create platform device for sst machine driver,
 	 * pass machine info as pdata
@@ -355,6 +363,10 @@ static int sst_acpi_probe(struct platform_device *pdev)
 		return PTR_ERR(mdev);
 	}
 
+	ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
+				       mdev);
+	if (ret)
+		return ret;
 	/* Fill sst platform data */
 	ctx->pdata = pdata;
 	strscpy(ctx->firmware_name, mach->fw_filename);
-- 
2.43.0

