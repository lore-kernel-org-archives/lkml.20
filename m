Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3CD22A7F6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577498; cv=none; b=cU+sCC6M3YXl6ZKtWB6hHaw0TFVi0f3JO8wTM9o230qdR4vRm/CCQZu6qs24Ay8sTujTtcf8fFWTQkjH92EYQChAiGhn9ZgpL/jCFtctQlQkATwiWh2UDqj6xsSd6M1760TMqMI6Jg1Ub1cp+6cdXe4D/xawm65RLbSQYHu7uxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577498; c=relaxed/simple;
	bh=uJPPIj6KHCIR9rjchDUmz3N0qO2wD9Mw/wYTDNNQsj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJVGcTXsN0wj91kW3AI9QWJ38FwefEUiHRERGCFJXDBGQdCLK9QwaRF+heCqzPdT/FG7HRoTcr3vQQ1zHpt7hzPdmtALEyh6ran2VwMgsodzhn2Cga8GaGDKH44xpTDMmGzORpU+ETDbeM5uwefG1OQ+fVcKauJMiconDw7ZFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmcK4Sqj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmcK4Sqj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso1901733a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577497; x=1789182297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KFqS6bUL031SXJAVQUoeuKgNEuuJ/tZOFfd1PDcVQXk=;
        b=QmcK4Sqj4vHSjoMpmH96YJ/jDFvQXuWHDLBhqG/Ol1fQampZJ7FXcybap9y7ENE1Ap
         +08S1q6pamj3alEzB4+c690InNGuv65h/W2nJRXZej0Ek9loNJyB3Q/1MsSMIgLO9/wJ
         MkHF+9S63cb8A46MrCR1MRvGYrleit6gw91vjLnjzJbfvLGBYpTmC+AwdRZdskXgl01K
         PUq+0NCWYHwuKsMiCrycNSEjMOSOhClEjxJas7mJYMsmGmRv9FkDiPpF+GbBhD28nlDN
         UN8fCmVNzRbSEReXsREoHzg7ZaMcvv0HhtmwJkf2Nx2L2bBWx3P5HGx2WIqG0HIq6CiO
         nfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577497; x=1789182297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFqS6bUL031SXJAVQUoeuKgNEuuJ/tZOFfd1PDcVQXk=;
        b=B9UlnGhNMAI4bYcB0bKv3UIzZFJKj3WigTqgY5a4cgGXhiNUdy4sC2XfstNSyQYUl5
         ODXxX9MeMa1nziE8tDJQNu4i50vfe/KKNThdsJc5+vicD2I9kKkjhM7llxsUa84XTbsF
         npeAxY5rHJU/7idKgf8Qb98DlPYzrNMSedMlqhHFA7L9Bz2iiwMf3TGGguNzT7+rRVgG
         rwgsMX0IgFRh34QDCfFCz3FbJRMuKxjMzaCNqBMohiCnPSAA8v2yTZDvSz26WTzw6eBZ
         FLU0BUegtvlya7ojQ0RvbsRENHohCg9hcjLxOz2olG8bCh998zfa5zBzbuMcG0f8C6jH
         8mOA==
X-Forwarded-Encrypted: i=1; AKwUvBwvtzLQ5o53oHpi/KN1g4go7ogIAMqJZe8jTlnKEeXusAFF7fo7l+3XwpPM22FDJsX9OEEC3ds8OHwViH4=@vger.kernel.org
X-Gm-Message-State: AFuF++nO3tfHMkZ5TclHv2RtoAEmyDDSWRxxcMVcMpTaiAv+mkCRV7oK
	FU60fRgAfTwubtG8X8k0D40blG67hxLq0Z0ZtWq+OZHCaZHz0CTsdGxhvac8T7kF9es=
X-Gm-Gg: AYBFou3T72ba6VKV5sMlQvBN66erAGKfTp7Vp1bbZiicb21ZBGcMOgt+LRs6z5sWMNj
	w1LBnOkMGB6jO2+xJ3HusmxjvsN7qfcCmB0QyvFfXdhLprNrTwl+rFc70aUoOG8yMSTI7d+/0p/
	1GPKTmc97HOK9bDJcYvreD5MHru0f0o5+s2Wlw2PnJU1gmprFifIAoSImoYmQfpUQCWzGZOL1so
	PSvCg3S7MN3IMUMT8Wro06ff9D5M44UyyGhfdWBkbieoKgc0jTbg8fX4LHo7Zl2IVCE5arMWYfN
	5axnhJ1vaQ02slDNPeS8dqiTm1LihPFp+F6SppLtiQisCUu7GkbRQK1ftXjX8QEC9JnllFZ/uMm
	K5qJb2nFJCFqEOqfqmCWpXP0I2fFWy0MMknKMKqrx3PJmlR70kn3rWVDKqrRpBsMGaesoDVNSkU
	61q0BSHUU2A9rNdVM/92Od9DpIB7m791WTOjkGnnUtLbmT8QxOgcpznDDuTClZsUwE1Xywy77vs
	yo7xXCxmzHe2PVRSop0QVCrLGbJkzAiS9xK
X-Received: by 2002:a17:90b:3ccf:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39b26101277mr13184512a91.3.1788577496696;
        Fri, 04 Sep 2026 20:04:56 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm692182eec.8.2026.09.04.20.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:04:56 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galaxy Book3 Ultra
Date: Sat,  5 Sep 2026 00:04:35 -0300
Message-ID: <20260905030435.38105-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Samsung Galaxy Book3 Ultra (960XFH) the OV02C10 sensor is mounted
upside-down. The 180 degree rotation is not described in the sensor's
ACPI data: both the SSDB and the _PLD report a rotation of 0 degrees, so
ipu_bridge_parse_rotation() assigns a "rotation" property of 0 to the
sensor fwnode and the image is rendered upside-down in userspace.

Because the SSDB degree field holds the valid value 0, the flipped
mounting goes unnoticed: the driver logs no warning and userspace (e.g.
libcamera) has no way to correct the image.

Add a DMI quirk entry for this laptop so that the sensor fwnode gets a
"rotation" property of 180 and userspace (e.g. libcamera) can
compensate.

Tested on the Galaxy Book3 Ultra: with the sensor reporting
V4L2_CID_CAMERA_SENSOR_ROTATION = 180 (verified with an equivalent
local sensor-driver quirk), libcamera renders the image upright.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..165f3c612 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -192,6 +192,14 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02E1",
 	},
+	{
+		/* Samsung Galaxy Book3 Ultra */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "960XFH"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.55.0

