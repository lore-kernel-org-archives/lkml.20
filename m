Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77076343889
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209276; cv=none; b=MAsTLSSdiHpuYjMIjPDB8CXD8ADicpo7j/Oj70a4V8ZKEIIZm0OCGljEUxJbwsPQ4Y+5LfwYGIy3aBHTzV/giTH6AeVN8vaFoeaXvSsHV1K5JS5YrVe/9lAz/aJ6JNSGAxFXdMHlnGHnOi9ivFXUWo+ytlm6vCfwsqJfokt1Qns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209276; c=relaxed/simple;
	bh=AkHj1D4uvAnTsmY9xvMRqq1u98CJm1B/o0kzjYgyjxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNJNmBNIF3lyiRV/JIjeZ+N/jXwUukQfcdVtusBAlk7BXgP9DZiqEzxMIPPD+l1Wm23kJnjDC17zkj86YpNYmBMT/HelxSXP5qT7Q0pc8Gz7ghcXcKdNgbO3skmBk4tXEowbPLWEjIqwJGug/syssfqIwBl/C3ZjX0Y1hfDqI6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCl+RJe8; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCl+RJe8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so241482f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789209273; x=1789814073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lT1aNi2yWSuhDHg5i67jYaSBLUSPiuVZ7hWziwrLgCQ=;
        b=bCl+RJe8/3SbHbUIgnKkxuh+PzDGeswNM0rNqN0QOEMgzFUYow+oj1Sy9WcIp5k1Fd
         XLRZ4WdzgC25QpEzObEL+O/84i0VRxDX5HuRFTQYyXJERK0qgJ0IlLqATceNZce5yQCJ
         injDVfyi8oCWydJCv9YrFsS/9XKgejz8cNE910f/ESogKOBTy9Ue1TIT/umikgmhhCts
         Y7U0HA7OoLcGCrWwDBGccTK8yKw8IFeFzunDSwHF6Q9nhLeiV5fGJkhO8HRq4zPk3FL6
         M2ngDoy40sB4HbBJ5SHP3dAMB9dFYffWsteCcgwUO4cVFHot2EzyS29qMDhY9/KjA0a7
         sccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209273; x=1789814073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lT1aNi2yWSuhDHg5i67jYaSBLUSPiuVZ7hWziwrLgCQ=;
        b=JarMs/q+hkFWUqNHO7HTqV4GaEnlDO2jIZNqDoX4A5771zuk98GyDm/onp3GCqKOvQ
         0ilAMIYM5fFpQo+zKasdJxhtgr7+ZRHGRVDA5LwBnm1dN6R9PGEZMkucH0bHLojft1cZ
         DbNia4e/v10/qzgUq46R9Bf+1u4qvhWvetF3GS+qJy6pxh78R+SZkZ2zsBSHGsrsLxci
         SA++DXs1T72gMIbzfYIDgBXFY+U5bg46FseLmWxHD6yNVM5Ldi8W8IVfDTsdm9n4Ue+R
         3fplHjAknFAXly1hxI4afRtp77wEDbwDKanBG/lPXyixwEXLYtN0r/2JQ6zH2nzlQ+7R
         uppg==
X-Forwarded-Encrypted: i=1; AKwUvByrx6U9FHm7S+Vu6k9jk6h+6CNkT3JJpCDE591IjqXH9W4B79Mxg/e0e60k5i3bNUffWQgRD1PtaYnqePU=@vger.kernel.org
X-Gm-Message-State: AFuF++l8ji/wgiYLa1aWzwl4CU4bhFbQ4zrbNaL74G5ysCMqhKKo8k8l
	+c1TYC/QtFxWL+8ExdsD8VUtR43YRYsl6gYalKger7HT5rIlAg5U+lHu
X-Gm-Gg: AYBFou0S6sCTgA3sTrDujrib0uuKaNq68AhJGe5Z/5JbgLYf9lvayxzMg2j2cZP263Y
	BoWahAPRU0FcHFCKBV7B5PGqWs+sXP10ds7k3EHHQ8ylbyZIr0nVnpRnUwqXlab+w4J1JiFHOCt
	BwEHKs4EH0LSIwXFe8nUEjNJ5ycGzoR9h0yRs5hVOy9zdqNJUbOSJGXLaUX2nWknoJB6JJIhWRO
	TSVdZm7fJAUIAdm8nGFiPF0hqF5G6uINSZPYtl+H0cxiCSX7MkKImhkxtNGkf+pqAwdn5EZjaGP
	Oufmq3CsDz3LLkYIzlI0E/Wlvzq0hMwrF7HVInRghB0aFaFTZYa31BOVlY6xzF6VE+vYMETs9u7
	meV2oT8/OEB1IgEEWAiT4DE97PtoYqdBTERgY8gpgFaohdWZ2Sx08Ebhzf6geK3za4o2ghck9oD
	XgymAvWc0F12D33zToF7S7u14u8DTdpvrlP+PdX/XSlZ+FDtW/stMImpIc2lqJUp+V0yqM4XkAC
	Yl2CdIxeJsgSwXjeqVbgt836n68ft4+70/jduMNZJgTmisBND02NJ8=
X-Received: by 2002:a05:6000:2501:b0:486:e5f7:89ca with SMTP id ffacd0b85a97d-486eb1d99c5mr9475191f8f.8.1789209273438;
        Sat, 12 Sep 2026 03:34:33 -0700 (PDT)
Received: from DA14250.lan (tonb-05-b2-v4wan-173165-cust581.vm24.cable.virginm.net. [80.194.6.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm11641445f8f.4.2026.09.12.03.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:34:32 -0700 (PDT)
From: Keith Harvey <kthhrv@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: Add DMI quirk for Dell 14 Premium DA14250
Date: Sat, 12 Sep 2026 11:34:31 +0100
Message-ID: <20260912103431.15388-1-kthhrv@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell 14 Premium DA14250 has its OV02C10 front sensor mounted upside
down, like the Dell 16 Premium DA16250 and the other Dell models already
present in upside_down_sensor_dmi_ids[]. The rotation is reported as 0 in
both the SSDB and the _PLD, so without a DMI quirk the image is presented
upside down.

Add a DMI quirk entry for this model so that a rotation of 180 degrees is
reported for its OVTI02C1 sensor.

Signed-off-by: Keith Harvey <kthhrv@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -145,6 +145,13 @@
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 14 Premium DA14250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
 	 * machine type/model. For example, a DMI_BOARD_NAME starting with
-- 
2.43.0

