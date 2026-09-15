Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0663BBFA0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482292; cv=none; b=pLZ+Q4GGjnjZebxophcLnnzlr0L0Gvbjz5jm8yXSI+9gj9JVIqXwqi7J+xR9blQZCjseRg1wPMihCL4ky3sGzGt1tK5n72yraYzsShUh7asuUmTLH4wzO+zeqAJENYCQ6U97xr84FtCtvnFUd5wtah5dcdzRUHnGXwcDfc8pw1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482292; c=relaxed/simple;
	bh=2HZbCyaAvqbokY/BOOc/70K6krlluqOOSO0k1/nacus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqMYMdMeLSmO9Eh9UBQDC11/7IXIuEuiSdPcwoSqmTjPipxuPPiBmXkBLUDJFYrWR9tCYBy6aHaG7savpy5KKUVU3/3mikQg2X8baqcuUEDOG7D33/Ejgiig8Ga8qHzvxN0ssAyp/Be5mGS/5fwpdLM9AZBPVro0IKLhj+whOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GshXuRFH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GshXuRFH"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so280325a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789482290; x=1790087090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghbBZ9hREMOL1TKz7qCR2XRWwuSisruDUockpfq4d7c=;
        b=GshXuRFHqm4zLwrV3zR8zX5F8UoIj4xSEgUSn/7dIxDhosCKeANT/IxaS5imnnONrN
         IV70YsDVAzWCI0IEmKDKxtJVzqKefytv/5yUKWvy9r/m8NcOEPR1+hgaJHFTBATeP1RH
         k9Xq4iNsKFOVY0Yr01HCV/XZbf1EgavCn8RkbO/x/C5Y1QXxFO3ffu6WxiyUK1B0mAXc
         hUTgYVE7/aKqJz3qLNVt3T/RIU6jEf60jNywW3GmrZQAuu9WYYK06Iko5HzclPc7eyjv
         MUxwoI9ZqAWGjkACp27EDLG+IcHgLowS0LpqvPQbXEAx6PfSD74ISGcVrxtRhDuX4c0P
         Z5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482290; x=1790087090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghbBZ9hREMOL1TKz7qCR2XRWwuSisruDUockpfq4d7c=;
        b=0OwiKuptvWP4cfNXfTJktAUGTy4j3iHa1oUjrJ2xenkZQLDAn3FSEiGDiJxCGWPyjg
         qTXfCGgmQUAIH9j8lUhAa3zuUEXkp6zYcdC5XlfOjHg73t2ZSmg43pOuAuP197sTJt0f
         Sx7vbb54UXC4TevZFw9VH13fcccrSGMu1GTjxg2Rn6PfEi2Cls11p+/1ZV7wTQT431at
         zQP2q7AvRZ0GnZQjOlSca4BVxgs5qDZG4ASeUopFdInky5uMC1sA42gWcIZk3F31jWBz
         lqEi/q+IaTfr1qSKBdZZ0rxfwHthQLj/aVyOu0N5LYzSUnfskxVvZaAkS2v0E+LI3O9p
         Uoow==
X-Forwarded-Encrypted: i=1; AKwUvBwSwYqGa47E+QYUOwLJOUzIsvL9LCuv7cqoNxtEAHUPOw1LES2JS9kGntXpPiQggR0haPfvVjiOm9KGg0A=@vger.kernel.org
X-Gm-Message-State: AFuF++msCeK33LZml6fhZyP2jwanfR6OVYCjvNalfEYlZL/4/9yjVyUv
	m8iL1tQdEIOz6cBsHQdmSMiVFWfW4xAKQ2AVuay/gcD2uDMRlxnw4XK5
X-Gm-Gg: AYBFou0FsxCcSoH4/bGGgTsg2FixNAVhK/J9VT4NK5fplLaOIB/aiWzVDEvNAZKF2qW
	YbKbU6uPFPV2ycABh2ziIhdqRLQl3vOLDoNG6HcS9MfV+hkbXHrqbmC+vQ1B5q5uzIvklP8EDSm
	989aNb9sBCYlgnE8ZREEXa5i2iZLuR35NS8U9/LLoddYLXzoTkiM4L5CwLt8hketKtYX+Op3/Lf
	TRowUbwaAuymzUQQX3K8Q5O1uD1TWuJFrJbivgw9Izzb/IOWoPdkKp6Yz9UNtuvu6EmAsOzf0Cu
	heqi+SI5lh52rXiu3O3yxVMHaicYYm2j5V/MsR9MSjkQCHBC+dPz8xQNE8sUysIu/9Cv42v1HOg
	ZsXMPpZz6BHMFMznmnFndms6hlFkTcEpvwEqt5sR0D7mmITAFnXWWMWIOVq7gHsVZgKFjnPswfw
	hKEcWjfM4DJ2r1G8rn06UEA1uJajvEkmLo7v8NJSDNQRNqOelt9B/yvw==
X-Received: by 2002:a17:902:e74b:b0:2db:210f:c111 with SMTP id d9443c01a7336-2dd837b0f5amr21821025ad.2.1789482290368;
        Tue, 15 Sep 2026 07:24:50 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfdc15esm68401415ad.66.2026.09.15.07.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:24:49 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: ti: omap: release DSS compatibility layer on remove
Date: Tue, 15 Sep 2026 22:24:40 +0800
Message-ID: <20260915142440.2442011-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

omap_vout_probe() calls omapdss_compat_init(), while omap_vout_remove()
does not call the corresponding omapdss_compat_uninit().

The probe failure paths release the DSS compatibility layer, but the
normal remove path leaves it initialized after the video output device
has been removed.

Call omapdss_compat_uninit() during remove after releasing the video
device resources, matching the cleanup performed by the probe failure
paths.

This issue was found by manual code inspection.

Fixes: a9ee9f08b615 ("OMAPDSS: use omapdss_compat_init() in other drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/ti/omap/omap_vout.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/platform/ti/omap/omap_vout.c
index 8d0319a37ba8..0efaff4d343d 100644
--- a/drivers/media/platform/ti/omap/omap_vout.c
+++ b/drivers/media/platform/ti/omap/omap_vout.c
@@ -1586,6 +1586,7 @@ static void omap_vout_remove(struct platform_device *pdev)
 		omap_dss_put_device(vid_dev->displays[k]);
 	}
 	kfree(vid_dev);
+	omapdss_compat_uninit();
 }
 
 static int __init omap_vout_probe(struct platform_device *pdev)
-- 
2.43.0

