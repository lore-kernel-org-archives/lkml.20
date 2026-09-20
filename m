Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DF46EF8F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789926001; cv=none; b=OyPqG/BfGRezFTVteKBwvlksXh7Foh11m+L4g3748G4QzOgPMxfsU9H3VrP940r7df3l9CyTuZsIOveFkO7AFrx6tB0AOjCEdRrgtHB5dNQ3An7XEHqGS1A5o/X7/LAOOgFsURe+zygHsE8ALtBBGAIQ35qpbVkWgOMmdlZOr7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789926001; c=relaxed/simple;
	bh=PuPjUAhVCvIyLt+F8HbC8M3l3dqN94RplXe2tL04gsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bdgZxBFelA78AR61sL+6NgSlZKUjFNP8VTO8vbBnnANEm2WU3d11v/Rhhz72iAqxc3iRueg+07YOXbeOc/XBflMDMeZIjKnxWTYfHIaDgTJ/lFCn2iZ+b+Yy5acIkFegpeWcXwVeF9hEMUjp5zoM297pcZnq4PqGVTXa+yHbW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRtJe/FP; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRtJe/FP"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso1325382e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789925998; x=1790530798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfkoR1nBKmYEzeoAan0z3MBTr6L2D2UKk4WaZHViN3Y=;
        b=bRtJe/FPg0NQwEZ7u4CbOmh+qhfF7gws0hM/L1ByxSDxFLXmnJMwYy2PLUh2D+LchN
         1KIVKY7TMVphCVqaCXc4urW+uIc0Nvcy1ucC6GOgOV1TtBdPwyheAcDLbUsdx903n9fx
         yAHqXle/FWkeqPjfo3de6jLm2qcSqLvxtVs9vU2zjvLnPU3H/7nkqe2hGCcN1/lDsm99
         y4pHPNOFBRJsXWeNKjHloR2UMvwCa1u0BX76WPJdY/S07j1LolqKtLZh1wqMS38Hr9BO
         OC+Ap2sSmc6adV7eGCvfx67Fbgqu0+9o8KQ8ZbXShg4LnoDpS7r4+EjiQZ0vXFEblvOY
         i4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789925998; x=1790530798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfkoR1nBKmYEzeoAan0z3MBTr6L2D2UKk4WaZHViN3Y=;
        b=zXHPBNxbDiOdk+/rjAi8soKcex7nNC8BAW3biYbNoprJQ7wFsjf5VYEa6ngF5HSwMr
         5sxsD0aLE8bAGDeqtrFPQSErmd4+FFtZ8+6EkXkgkhUV2C8iT2ah138oRapvCS9e/sJE
         qdxEHR7ChOgL0f8pE8k3J5uYuzKdTyBn5DBbeXYkpdFzh+8Px3xocW9tF2P96OJipkvo
         gdGVLYZi7CHea1sdm2Et8kW4bFZHkGr0nJ3I3Tp5MGfTauLyG+vt8Yfh6f4mKkDW/z23
         pWvFjw6D0EFHangq4u8LQQWc6YPVH5XYfXOLiKwuSW4aK6OBXAivYo6PZrRQSTbgTelJ
         CgZw==
X-Forwarded-Encrypted: i=1; AKwUvBzDLeHQvxdid3etsx1AHmVeBC0HkXeTErcC9UG2kVj2tcjYdn+vBIuuJSz8Ztz7TxguaO859eqVeEcg3O0=@vger.kernel.org
X-Gm-Message-State: AFuF++kjfyFnfVmJnqEXo3KaZ0cZMUEK+qe1hurTrk8G3C1rccL0HqC5
	o6LC1DwEiovdD7nz818XQg40ipIX9TpL4GtqCPtM7X0DC5mdBy8R1/uQ
X-Gm-Gg: AYBFou3wiWBOFnHEFGO1rye0QaXEPjyWOxDVbHuPZniN7qqhaD8NHwNESmx4bZ9OlqJ
	AJRk1bzuKZmyEE0cB8lMz46L6jCWj86I5n4wST7m37ckzaaeQyZ1Ak6FolT8EZWPW+ihI7gBCzb
	MfRMKtcMfkpqldZn3CEEwUj8uuDtZPvx41u6XIPFCYeRFRbUY3pBYl8/G9b+Y5S6odb91pYBKLf
	RERYgXQYZaQ+HSJabjQT+ftueJaBpd9t/GtE1VKRKXjNArNIxtIoecLWYoqlsXzvNhfFRpaj9Oq
	gX7MTuzEEv+fDM2z1pNC7vb2JL1KxRPXb7JzGZ3BpzfILQHXHJ+W/jz/U5KIdkn8907ofoyvc5R
	OQE1oWkpJv5xl4GyisPC30LNuXR3jlLLg6blVv8g1JeETLK6Q9p24iRwOOQBjNGC+eqC/1GYIes
	5edF33/+PDEz7Efgsv6675xSRbZaxv3Nix7nqPp3WYStfPxag+B1fycZ3lrATNP1ndjuWDfnJ4M
	b8SQ4RQDw==
X-Received: by 2002:a05:6102:441b:b0:7a7:19aa:8a87 with SMTP id ada2fe7eead31-7a719aa9106mr1590422137.34.1789925998477;
        Sun, 20 Sep 2026 10:39:58 -0700 (PDT)
Received: from cachyos-x8664.lan ([2803:9810:39e5:6c08:c254:b3de:1d81:c052])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a6accecc7esm5578973137.10.2026.09.20.10.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 10:39:57 -0700 (PDT)
From: Mateo Borda <mateob226@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mateo Borda <mateob226@gmail.com>
Subject: [PATCH] gpiolib: acpi: Add quirk for Lenovo IdeaPad Slim 3 15ABR8
Date: Sun, 20 Sep 2026 14:39:04 -0300
Message-ID: <20260920173904.6221-1-mateob226@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Lenovo IdeaPad Slim 3 15ABR8 (82XM), the touchscreen
(GTCH7503:00) GPIO interrupt on pin 10 is armed as a wake source. As
soon as the system enters s2idle suspend the interrupt fires, causing
an immediate spurious resume, so suspend is unusable.

Disabling wakeup for the device via sysfs or booting with
gpiolib_acpi.ignore_wake=GTCH7503:00@10 avoids the problem, so add
a DMI quirk that ignores wakeup on that pin.

Signed-off-by: Mateo Borda <mateob226@gmail.com>
---
 drivers/gpio/gpiolib-acpi-quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index a0116f004..22c5fb149 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,6 +392,19 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
+	{
+		/*
+		 * Lenovo IdeaPad Slim 3 15ABR8: the touchscreen wake IRQ fires as soon
+		 * as the system enters suspend, causing an immediate spurious resume.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82XM"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "GTCH7503:00@10",
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.55.0

