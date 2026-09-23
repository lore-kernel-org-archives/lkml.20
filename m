Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296635372C8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175173; cv=none; b=uj4esWPNTyYwgNIxXJhiJzS2mZjxyumfzmCh69vMIdm17AIPFB01bQfyoFSGLtcv8/er6TBac6dnZvY1o2ZPrbHzFCdHxMS/IknlRITL2ggwObrToyuzXCvdsTnbVG7HKZQVcBvX+9rHewqC+p2Br36MGGH1SvgK6S90A7MYQuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175173; c=relaxed/simple;
	bh=GCJCQzce5DiM5qYStXL0Q3uMZ491Exb+QH/XNbI6OUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tF9iUvnEgu8BaxzBms8oYOgiyZK9hDNux2CeTvOsFbM2bl42W6edeeo5gRPJqb7p09zi0tSO41D0ov3HjfwnLvbPBK7LUCXjIOpssYSx6pVCZA8BEgZdkMLE7x1eiUvZ1Sq9NOFkg96BdgFcHL3Twv8Dr8nlzsc1H4PzGj03bmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfpPCwOC; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfpPCwOC"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d43db0c29so13575327b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175168; x=1790779968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQxUkaSVOKcYNkgbiO5qE5fns00cj/jkq6VJz32ZsPk=;
        b=AfpPCwOCK069mzi1Hi8LCSjEFDHyCQkV1o39dsghzNRde/X/gmNePbTuXe0uBd5wG8
         3ZtqtKnAVcJ8Ffl7F3hHLoa1F/XQkHxgKUTNNqTWBqlXZW8jG+i0z0KAUPh7EsaGyrDC
         /JmlEPpH0y+97Rx3P/VrjOu8oMaZ1H3tdHyTuAIFOLecU5x2FZQTGEZojPOHbZpCop89
         JYcLQWxYx8vjV8UKWVNHPfUCXAm4MSCIwXDO7wbi6gVzKIeRirwuee43wRRIRyi5GbEw
         NOO1y51lIMNEkiio1uGDXAZW8vEmG2e/carhLh/uEd28EoN7yxtDVY8JglPrDbBGo7tu
         wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175168; x=1790779968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQxUkaSVOKcYNkgbiO5qE5fns00cj/jkq6VJz32ZsPk=;
        b=K7vBPd7Dfbx0kwRGMrXBZBK9gLAhts2UDh0WWpQoUJ6pmvQomcVl21+DXHEDkjECqG
         ll9SGbnEX9b99tLOKZmhUdQBDlf0qt0+LsieCDPUwsXy4F96yVEoLAH+MfAT92AeJvWf
         6ze9n0+GFC8ESGuzxg6XUhDvRcR1UKud11DpFuIXGp/dKAFMvhqjxbfx5+P9G1jn9KXO
         tcub2/wGOiI8gpsrPcJ+itV3I3mo9zAeePSvrJjBgUyzMDhECo8sCk9/sYC6GA+G5B5p
         qm3QYtQIrvVehpP2/OK2KFepe4/R/FTIoomCfzRmrqceVh8hjwYKhC77ob3OwdduIYDb
         feTQ==
X-Forwarded-Encrypted: i=1; AKwUvByPtX+iZe5Lde7u4/yQ6snTXQwMIo9XLSy8idkYJK2KP+XiqVw2TxLl4nye1cOsZkHMRJj6ZSepFuynXqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mcHrmyui+KBt9TE5qRHDTMxWJ0rwJ5WKjWc4OQ4vyVuQW5rfku
	lnVeSmISX68og+Gv80YGwPT40N0AGojUR45rMXeR9sDrnn16eKY5toKJ
X-Gm-Gg: AYBFou1aRNjQezkI8YQaBy0pJKuPmaOh7/cwkpYwJxTkdGxtDolc2CSStjEAvady6yF
	bSQU2j7f/xpaxs5x2b3y2ORwTOqsWjYx+IVpdsHZO6OXgjAoXvMFkeWE6DG6b07YtN0zgGSJqAW
	4OGsI3LvjpYfRnEd8QrEqmwaGKNwvNiY3mQQ3tHw+KyXfxs76b8nI5SyD16B3RGXAQaA0ldpydh
	38b25s8Ruh0eXhNQym3lD4ShjgOn107V6huRjDDgjbdyXSoUVj/y5BJ2g9dpsC7T50AZfIlxFBp
	ck2JWLIxEz7Z72a+d2Gq49o/ta01kqf/VeUN/2idQP/xsykHSgqyQjFxsjSP+HmoUm8gsGNzawv
	M0CYqKAUESaeLwLdFCXRDGCjAHPl8tqn+Mb/CNufaER2O2ypvg2LD11wSsL3P9AwhIYaYbcYaqe
	pRyfApV5ejpkmklsYTElVUQq7dDdYbCGbfkvghq2GU9S3fIX89it0+LE58Y79RR88sAYQmtF4=
X-Received: by 2002:a05:690c:e3cd:b0:81f:238a:1709 with SMTP id 00721157ae682-8a45afa5cfcmr14471707b3.34.1790175167674;
        Wed, 23 Sep 2026 07:52:47 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a466bc4ce0sm10314207b3.45.2026.09.23.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:52:47 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galaxy Book3 Pro
Date: Wed, 23 Sep 2026 11:52:19 -0300
Message-ID: <20260923145219.177368-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung Galaxy Book3 Pro (960XFG) has the same problem as the
Galaxy Book3 Ultra (960XFH): its OV02C10 sensor is mounted upside-down,
but neither the SSDB nor the _PLD reports the 180 degree rotation, so
ipu_bridge_parse_rotation() assigns a "rotation" property of 0 to the
sensor fwnode and the image is rendered upside-down in userspace.

Add a DMI quirk entry for this laptop so that the sensor fwnode gets a
"rotation" property of 180 and userspace (e.g. libcamera) can
compensate.

The DMI strings (sys_vendor "SAMSUNG ELECTRONICS CO., LTD.",
product_name "960XFG") and the upside-down image come from a report
against the ov02c10 26 MHz clock series.

Reported-by: Mars-Wave <tmorolias@gmail.com>
Closes: https://lore.kernel.org/linux-media/20260922063507.690-1-tmorolias@gmail.com/
Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 77257311d..8fab2f9d3 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -241,6 +241,14 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		/* Samsung Galaxy Book3 Pro */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "960XFG"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{} /* Terminating entry */
 };
 

base-commit: 0c795849fd70d6bdb99aea5dd08d9b43128612f6
-- 
2.55.0

