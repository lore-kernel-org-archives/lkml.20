Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9C43A48F7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370246; cv=none; b=TrCJ9Asl+KgCVkZIcvOdIdVFsObvddtB+kzYRkKpLY/JyXfNHVuRCkQyoQrhVwAtJgVxUVg1ade1TJoDXyFbNEsgJXkd1KIIPuiCQb1j2OwAKqiuY8AKUKvtPJzFvBZmz6Zibk5BPfwNAEb1Otb4hUipx/wAfNgNXlmkYpQYFwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370246; c=relaxed/simple;
	bh=aJAuZ8/cLPUuDdXeNPpgaYi+5GfMNhlNqBppELZEyis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iqz1SOKOyGFlSWfS42Py2Hfz2F9b3OqAP/rpP4PNHFcOyzvM75DETHqv5wnj4SAwowQdQVrMKFTOBs/sDODjmu3mYWPdehKI/WDs1KJ7BOIpRddNCCAGu6bg0gMwgxfb+EDbyyWSedhQ+Plu4cqbf2ccpppiXvzHMF8/mW8ruzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtJPZT1g; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtJPZT1g"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4b5bdd578so816974a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370210; x=1791975010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bY3PtO90YQWbhyDzZwKKu688GlFafEco/HvNZsyT0NY=;
        b=ZtJPZT1glcOckSJTepJMpfZoyIizfOBg6WTbDYyQIBjCa+XbY8VvU0DOkQEasn8hzQ
         ZBKG+/CXHYFIWcYf2EvnXMcpOeW6TYOG7osZDxUOdVRuokiO0dCcvhvvnY1t0NpQBEEQ
         KJXpSyROpzMsPV21Jf04AWtQjbLX0vEoOIo1EAW2+hGYW9vTZym5eIAVgB4i6d10AjLq
         2Jkc5C+XDhHePLJrJ6WRJ6s2jcmwbn+1dK21nv5jYBd1RGFufIt5xpFPF1D2y6Wig4PG
         6xW/aaHWDE7IzDYUYLZ4xr+vpNtexKqmQWOdnAWIXE/YROYDLKw4BMmSERfmY6Kul55e
         nOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370210; x=1791975010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bY3PtO90YQWbhyDzZwKKu688GlFafEco/HvNZsyT0NY=;
        b=v8fNEtSLUDu9y7GyheZBrI2ZAY6kfdyIFer6j87l7P1hpIfiNEaF2EsL0gR5GG1PD9
         DTJQayU5H0NLu/abmV1fNpM6hvpGngwGV2t1aH64NHexNFI0934s+yVSFEb4eTJur12A
         Ha3dTnQjib0Bovpx1ANMoHW+4aElH8BVzHcS0C7tY+MoltVXE3Jdr5+C8Sj1jjCyq7bi
         yDkDoWHbl6ZmSgKzc1fr+ThOvgbWwI+8QFqXm3MXI4Wz1PA8bhPb0nIuv2Na+VaHOWlR
         eFU/76Dyheu3qL5WZKQOEeeEmCzwGEbX2Nu4MQ+HB7ExFsOgryzWbTESIiQ4PcgJWJQZ
         9OVA==
X-Forwarded-Encrypted: i=1; AKwUvByB9KimAZY+OVrrIL2MpmGoFhPPQvcckvEwM0G/1LD2IOJ5dheZ/lctSrhlNilocaY9VzGnrp3N0OiyGF8=@vger.kernel.org
X-Gm-Message-State: AFuF++lfrxB9JLWUNlzNVM/Vuuk8SjHGluZIZTvq6YOetxXN09nCkjkG
	QxEBSuRxM83Iy4Cxc9qUtWYnPsVCxM3IvlhwLDmQKqV0wRSnIHLZrfKq
X-Gm-Gg: AYBFou01adK/Cb+d/atXt5IF2WdlmjgVwNES2bV7e3ge1OdTRS9MeWGscC6W0IdIVAA
	XSUMn4YTPIv4+FsGTJp3on6exKiDU0SZisFsziOIoGPkF7V3SfFfgV6rnV6sLfgrEnczASjLX7W
	/wv62ymBhR9jCwB6mAZ5TArm2DWoSPG+ehstulNyazr2BXUcGs8UT7AYfaFcfZgBvKmL1JTUx/K
	l4K7j2BOIC6U91cTRFSQ7ZLEDha2NbVqaUwF2lroaqLTmi2zvSaIoTVImMK6dAnhFi/TBfGZsWL
	AYLIlzre+nLqj7MOtdojE2TxBe5yJoV9LwjgVKSf8ca0/DCJqVQ8Iq6cZoJ5Hgcu3S/4MsWeloz
	6G2NV1iFSNa1Mpa+19QDVASh71WcBzLCGfGIn4YijjI8WsSbeioeJSaIgpkMYfw5obPbfwirMxf
	nLaje4UERhE+WaLuIcODbYkeFGztn57mfTOGOJYOWwPa2YEBaczbhBj/pkvI4WCpDoYPP81BCqO
	l37jPHRxSewnqosOjnehgZhQMpd47xpa0fv27Lvg0AZZjqCgA69fjwLAyDSkzFaLpDaSMbqDxGV
	XqrIA1Bv6jx8wg==
X-Received: by 2002:a05:6a21:6b18:b0:3e0:bbb8:bbd1 with SMTP id adf61e73a8af0-3e13409c0efmr1301692637.45.1791370210287;
        Wed, 07 Oct 2026 03:50:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8918891808bsm1197898b3a.10.2026.10.07.03.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:50:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Hans Verkuil <hverkuil@kernel.org>,
	Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] media: i2c: ov5647: propagate pwdn GPIO errors
Date: Wed,  7 Oct 2026 17:49:39 +0700
Message-ID: <20261007104940.507820-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007104940.507820-1-phucduc.bui@gmail.com>
References: <20261007104940.507820-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but ov5647_probe() currently converts them to -EINVAL.

Use dev_err_probe() to propagate the original error from the pwdn GPIO
lookup.

Fixes: b050791d287a ("media: ov5647: Add support for PWDN GPIO.")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/media/i2c/ov5647.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3facf92b3841..b3049761a5fb 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1186,10 +1186,9 @@ static int ov5647_probe(struct i2c_client *client)
 
 	/* Request the power down GPIO asserted. */
 	sensor->pwdn = devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_HIGH);
-	if (IS_ERR(sensor->pwdn)) {
-		dev_err(dev, "Failed to get 'pwdn' gpio\n");
-		return -EINVAL;
-	}
+	if (IS_ERR(sensor->pwdn))
+		return dev_err_probe(dev, PTR_ERR(sensor->pwdn),
+				     "Failed to get 'pwdn' gpio\n");
 
 	ret = ov5647_configure_regulators(dev, sensor);
 	if (ret)
-- 
2.43.0

