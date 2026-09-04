Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FCE347529
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485129; cv=none; b=sTULSW2OxEr50Zex2A6ow6BzT6+fLAP/+tAQUtwRHRmSyZknPBFRsL6EB8lbtLkNMciXoDGHTklhPbvmYKMtwVRsVE0PkA+vHEZYOahRaI23ZlWeTI5pPDpOENhy/NmrhM7Sy4/FW0WOcjIvzZdXup80UiagPyorJ+OvbQ8XL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485129; c=relaxed/simple;
	bh=sNfirfIqNrT8whcliGYobgkY7UUaxK0r00OeZS569kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O323SMoPEeHnC24KMPBnkZpyp6TRMWU3JLQAHXezFFiVsjpTdPjM3Idm7fCGdVYNOkPrWf4W0Zhnq+2Mr20Pia7WRdyr/MpjQkUdUy9Yx8/9+6o+dHsNhm3SjBtN58biHJmZGnFH0fVXLErRRTqTGdfx/T9dpL+PsbnpbQufVFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekHHrS/v; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekHHrS/v"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4ab70b882c5so365108b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485127; x=1789089927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejryEK131qYRi5ya6nGJJVTstyu895uk0XBF3JQ7hB8=;
        b=ekHHrS/vIkiC42zX/KKwe5h3Gyio53JQO24edu1R31YVlRdbnbm6MqHSjIzckT6q1A
         poU42rNClTDQktCbHIVmpxLdr7ZPwndycUj16SgOUZ1oVCcN89o39tFtK6GMrbx3ICNh
         1GSg32wEhApBkbb3F/uTdJ8MbUFOersgG5rtw0eO+k8jEXXfot0FCL90ipfvSdTlsnh7
         EmI5ucpeF/+Z2lMIvTyDzmzjJIHT/LGkdOWoFJLHSU/+T8JXxAclcpNRIKm5v/DI1vQZ
         iP+TiZG3Cb9hW3v7f4ZulIF4IxR4SnbHCpUYZ0VGyPd+l3UJQeon8JB+8LR3cB9bFGuy
         T9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485127; x=1789089927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejryEK131qYRi5ya6nGJJVTstyu895uk0XBF3JQ7hB8=;
        b=DZkosZipEfSBy/cvZHVWw67t7zqpHLlepKKtNOJHA0IzgqVSb41HhxavL9y+EjGY6D
         v3SbGVOIzSPFTmyW+DiPB8uHjTAA5GcvECQFo95yQorpIWQtIYyjESDGFrwvarXCSEh2
         Ps2ukriBZkjmdNPGeDCBm5NgXZd8hJb5PWUMzwHo+qfdWVJiDtM1Lt0VtkPNX4oxTSX8
         uRppnBbA7J/59Q8m0NaKoxps+DVRI8HkXnonUorIv+f3jk069SkcvzlgOoG/FsY01+vm
         aVxYR2Rzrz1XZawFUTnLDU++DmrtidEeUKjgB2FMuXto0gWOSYLD82RAILN4ayVsw1l/
         WMZQ==
X-Gm-Message-State: AFuF++mWHHtjmUTkJ3+HpHNYR9I2m5KkB5oADNkAnTBzcdUpKJm0af/i
	ZzKAvbhWCsatrbIo+TA9euHDsSWVMAb8Hk8mP1zkRmBaeKS2KdKpL9Qo
X-Gm-Gg: AYBFou33Jzj1CndFhNLJA/ZnFOZufU1DrEoDvpLsen7Q+ZlcWNCIXMMJzuy/9fXtP3g
	ZcP+2ZvyrLwM79YYUjfMHm3lIWT6sgGR4x1jnWTbpi1RFqd6g449vMGxAm63OIn4K/FmGucz0j+
	IGVxGOdirqXkWbRzdxRwNJrRFkPWa1LXWd/vdvTARP8ikQHYXVIEx5Qx0j5l6jlTywDZOoOgUXY
	6+YPgVCjdYBfosaylYz2rJNwXPOq8mdrtFaZQSJL/yFbrHkIxKr61/NA8IkAKG9tL5UQIg64inM
	TLwwwF/OR6XXbAwhuxaP4vHJZq8hfRt40O0Puzi+kycqfdds1bawDQCWxaxkbEzC3gviokgZn1G
	NLOPpItevDHL0DbyDniZbKlNrm75akwgK5DEUn2oc+TwEstcV9IfsvBjJ5D8moGfz9d7vW3F2uF
	2ciD3qMlyoTPWQcR4IBtidJNcP4dS+LwblznFG/aSiRxmDVFkj0V2VOCHYtK3/76+PS8Q3QzGvT
	ts5tPoXtDudj0eYx+Pjv8KP4TO5m0NNwOY=
X-Received: by 2002:a05:6808:6804:b0:4b9:a8ac:483 with SMTP id 5614622812f47-4b9a8bb6affmr558377b6e.33.1788485127085;
        Thu, 03 Sep 2026 18:25:27 -0700 (PDT)
Received: from cachyos-x8664 (fixed-186-96-23-179.totalplay.net. [186.96.23.179])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971675a96sm1054289b6e.11.2026.09.03.18.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:25:26 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: [PATCH] uio: fsl_elbc_gpcm: preserve platform_get_irq() errors
Date: Thu,  3 Sep 2026 19:25:11 -0600
Message-ID: <20260904012511.191397-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In uio_fsl_elbc_gpcm_probe(), platform_get_irq() returns a negative errno
on failure. Because irq is declared as unsigned int, the error check
if (irq < 0) is never satisfied and negative error codes (such as
-EPROBE_DEFER) bypass the error handling.

Change the local irq declaration from unsigned int to int so negative
errors from platform_get_irq() reach the error check and are properly
returned.

Fixes: c8295feb756f ("uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202608011915.yZ4ITuSe-lkp@intel.com/
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 drivers/uio/uio_fsl_elbc_gpcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
index 08cb150fb12f..e6394dd14e43 100644
--- a/drivers/uio/uio_fsl_elbc_gpcm.c
+++ b/drivers/uio/uio_fsl_elbc_gpcm.c
@@ -303,7 +303,7 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 	char *uio_name = NULL;
 	struct resource *res;
 	void __iomem *base;
-	unsigned int irq;
+	int irq;
 	u32 reg_br_cur;
 	u32 reg_or_cur;
 	u32 reg_br_new;
-- 
2.55.0

