Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CB316199
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215892; cv=none; b=RoMqkwChvqHxV3/SBGHCDWXPQxWbhqmVE/dRBMU8og7bkMH6LniMM1Zn9/k+eQwOIKLpAr7emAYZlFnXoXaXPy7x0zW8L+sdGqkxGxmnTmW5ca+10Tn8PJ2M0YRDv7uGkOSSt51wnzHyOTRuHzXSii+ZL4Ga/lONStvMDJbZ9fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215892; c=relaxed/simple;
	bh=yOOOkANV1Q7dtjfwhXBE2Q+/IDsN7MRrDrHGTEPKcao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FsmQjrXJpTv08nZtiNpIW0ySVUphAsFwABfiPiF3N343hU5LkySVrefLNZ44l8oh7zmjXLZse6w3jRBTY+c/CxUhRsQv4xMSYThecJkqYlyjFzUHUcyRUOHvN31bHEIJOAzYYRxNjSNBBXIUuUO8WTfbPnyUmYL1ukQQA1G3wS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHLuvLq9; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHLuvLq9"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86212a185dcso1161791b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790215891; x=1790820691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iq8037MNQEQGwbzxGy2NAvx+AO2Lmw1qhX8esmrAE00=;
        b=MHLuvLq9/rBCSLJVbIrZP5t/XsQQvNi1TA5V585OA1QR7wUrHwmMy3qy+D/po+A8ST
         /5a8fPFBb72SwyuVrQmGxapu1I/ERPNBk8+skc62LyF5xC2dP6C+sFs4qc2x6Bc6000u
         MX9qDPH6fNxB5Pr2LidkkEA741QGDZfapUmbfpDwoUs3B5S9DGAWUyiIoXYv1N8fY0jF
         jWw5y8M7D9x9A0IePefEphuibiSaQzdW0c0w/HUstBQ0GdOSABjsigKjQ+us4tRG16eM
         4Y7/pxb0ksuQ/inEHmmiFTx/r4PJ3OUbgjU9E7vSgQmZFramxkobmyHy7KnVgTn53ApS
         dsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790215891; x=1790820691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq8037MNQEQGwbzxGy2NAvx+AO2Lmw1qhX8esmrAE00=;
        b=R6tXyhuCRY6QJzmXa0g/szDCiodp3i+Ozug82eLw7L9rP7h5U9wAq2GqYN8N+bmeIo
         Avs1Ctj4dxPAwRQ76mMjqqCblAOkfCZtjNFd0Vg8FhmJgt/YpdACoCx6JmtN+5pjZHC/
         gZRuT6z2GTtyGhKrw94i31/xSkNLi8S14QXVHKlXC2DKItFnKdafTmeDyMO3+sxsQswg
         OgTypsKYfzdJrZyov2eNuXX7unb0OdcKT8ZixoBoV0aID2/GOMrJ0ZyHQh9RiAmi86F+
         IPiClSNN7M2rf620/3QTTn7nHE5Jfsx8W/q4yYEcLRSZzgZXQKTGGM7dHVs0Zx7i5ukT
         5a5w==
X-Gm-Message-State: AFuF++n+hBMun3vGYRD/1PZVY+3WcXDhxiFpMeidkHeqMox2O0yPGb7C
	zXFAZUuuFjvwwqOCFziOSD3S2UvTxwgRq6P5cXdXOj4QgyiwyhnedYOtNrqr3w==
X-Gm-Gg: AYBFou3Mps8aUToXibN6zBgm8m3oR6SoFK87+K/fZfHd3ELbeB51pACCY9jO6T+Ho65
	I2yNX9TOlOiKjTRjawona98NRc8XbaGF4SNnv8a8GwiSbkZpPxh3BbqXLp6TyO5oiteg5hXKj/7
	gYUt0QqDkdoJhQP1JxQiWv7K8DkId9VsuJ4rP8l3RsH7F0U0YWbQZ9AylNhEPoJ/lSPDouMkQ5z
	DCtGFn4b9OP+y6eTkYSAQBFLa+YfZwmyXqDrA6k5hzuSgTd8iljMKwoF8+ljKnHlGUD71pZ09RY
	MJk2T6qFGoH4k0cbQd8H+pG3B0YALiVZBlIaDCZITO7Q1IJEo+toYJeeQqmbZBeH1q3C+Fn4GmF
	KdSuHiH+1Niia0G5uEyGYOXWGEsRiOwio2Z4kJweR4RqSp8GK5yhjvIfRJOKU1qT7phjLb8SmWz
	3ogrijmMgoxOfBrCYcv4NZ/iZSUwsWqYqkNWd2gZSqnreqIct8qPyPVvHcLNof8T1KxZDnG1yYx
	xGBICEuvFlpMUMCOKjmt4he7sDDq6NQvSjL4L2DaF2457lJBGkCyiba+s0yIqBlnUDQgfqc/lSr
	r5YQ3QrO1fCAI41tK9s0bGP7
X-Received: by 2002:a05:6a20:9392:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3de0e6f57d1mr981300637.9.1790215890872;
        Wed, 23 Sep 2026 19:11:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d6954sm1790647a12.16.2026.09.23.19.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:11:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] gnss: serial: Use pm_runtime_resume_and_get()
Date: Thu, 24 Sep 2026 09:11:16 +0700
Message-ID: <20260924021117.6534-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gnss/serial.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gnss/serial.c b/drivers/gnss/serial.c
index 0e43bf6294f8..ae26b3915621 100644
--- a/drivers/gnss/serial.c
+++ b/drivers/gnss/serial.c
@@ -32,11 +32,9 @@ static int gnss_serial_open(struct gnss_device *gdev)
 	serdev_device_set_baudrate(serdev, gserial->speed);
 	serdev_device_set_flow_control(serdev, false);
 
-	ret = pm_runtime_get_sync(&serdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&serdev->dev);
+	ret = pm_runtime_resume_and_get(&serdev->dev);
+	if (ret < 0)
 		goto err_close;
-	}
 
 	return 0;
 
-- 
2.43.0

