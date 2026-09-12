Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DDD17B418
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171649; cv=none; b=libKBWJXnl/LZLOsQmFfiH3IBJ6/mpLfRutBLG7JZKrZci2GxsjUrgemvGqfDUjC0tkNMynw0Ckk6Fl/fLXLFLgB7bgiwqQ1AxOSamJCFQZTH3Orak0iqPFCZ0vbEP3qgRFCNHeJdUVZaxgOd5OfWJxzB55RU4u8Pfbw6xYfflw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171649; c=relaxed/simple;
	bh=8m1R80XfDZbh5zUhLZAcOUU72JG3PqinZPRM3tOCJuc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=miCvhCi+jrBciL3TJT/eIntPMSTq6kRxMnqngkY8bI9V14whtSeIS1wKDhwnXSkKBGN8ri4NFOSUyofzM7v6sBdtoCigpQG30K88pUnZbsDMoVtvw/A4+el9Qx+zWnTakSN8jnq0sLUYnKiLPUdlkX6e2R4n/xN8AyjPNgjQmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSjBh8ik; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSjBh8ik"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so603585e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789171645; x=1789776445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Txatduw7g2Rcis/bJMKV9l341+MbMhD8Kyx8qAkEHH0=;
        b=pSjBh8ikIX0hcVexn4ZqdE8qq6PaYd1s0cPLovSEgnI/qaqWBbrLaFXax9Ho/ncWge
         0YF1wXq39lMIOrgXL5N+hQt7kftHDV7wPdFxFmIyfxqOJpgE+eeIVQFIOshH0FdC+t4B
         uXbgmPMCNfOJUeVMg2tKI1xIy7XLMT2KdPlEEQl0odDyrx/F8qyvjd5/Cgs4Bg8HjrKi
         4U/GqHX+TeWv5pVSt3SUhMQ3e1CzgwVBkhYngE7V0DJ+3Yxsjkj3jxbQzA+2kHz4dcqc
         k5/HPb6QK4AU9Tu0fe03VmDiSL6NWk64PxgX50GSbshvkNKTJYXpqQ1DNH79th6I6PH5
         a1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171645; x=1789776445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Txatduw7g2Rcis/bJMKV9l341+MbMhD8Kyx8qAkEHH0=;
        b=nD043jvXyRTQUDgUfrwfu4HWtKbF5srehuK2AvYSJtxDH1oznCwI4cYuyB4d4rHKdI
         Y2Bx8WqfvCu0URsYkd417bEbyjA2NuHuTD7brl2GPki4S/kQNZ2bQPKaPPwTkzmdO6rQ
         xqQODEAuPCZukR0RcCTlTFQXmivV/AV1cx80EJJlemuZiznld+wvzHP2LW98UPN5XGhY
         SqCBi3nlWQYP439geK3vGBZqGdd7gKVhpeD1/13NsaVxmfCHavkGMkrugIN5/lU+QoMJ
         zLgSMn2h9NREw+DvG2uvbpkxtKvdOULsTxNf7eUsjUMffx6MC4cBSiNk/pPnK83Zn539
         ktDw==
X-Forwarded-Encrypted: i=1; AKwUvBz0Hz/+h5/VhrTJE+SIejxsScypPNcm8U+9X/zMoQGH7mAqbEb1VbUAxmJ/fanDyHVm0DYJOIVDQtAbIno=@vger.kernel.org
X-Gm-Message-State: AFuF++lXdcf7bQBe9WK1311/kmpzTyPvVW8itWW30RK+0f7qhAfe97dU
	BXJZtiTQzqjlpBKblTGhQ2sSdLwW0VaExS10Da9Fd/BKQTBPD1uFbn/W
X-Gm-Gg: AYBFou37RvSa4X64RQqFkS8I8m96k5++IDxxynd0vzMl00kl2TZxwrMDrWzrXdYMLoK
	B792HdrWgRKVbQ1GdBHxiOXA12zFJv8lUxek5xazqXXoPJEfdX+pTH0wM4muKgtMfx3CW1C6PUY
	N9WWIo6zx/eSNJ0zAZQgMuvvMAknr0/zI2RJcT6uQpHE4fYZalhSVj8WChtJHlRLr0ElDQXwvTi
	KIKZVt+78fPNaei8IG6AII5XKoJbQb78ZwTqO1cP5dWzJjbdgUulv3fMlk10gaihsY6yFLmXboB
	B5sZeOX70DUDC3vQfcNi4P2YtLlhFpcGfr8erRGlsspl2d5HQ6osE/cOGqMDhISDpUY66iex1iR
	LnnDq8rcGk1dvQ1o80mY82G4rR6YMDTR0tidCKyWp04KXqNsg7mdSiP4HNrvEChUvmv0lj1Rk58
	Z03mbrBQiUwayJ95Rrd6lbz0vavYV4C3pB25BNcR0cpuYsWSqwwaQvSNbUHjdwkFXYtxKFjS/cj
	HTAtwa/LFxjS/nHSrQPmgmJE1PyQSzWMUE6tn6xHGs0nobZot1esxBAT4c18yABcHWVaYgiHWz+
	idSF9HniFyi+qMF4T1SezLgwZflNWzRYeIRjKQ==
X-Received: by 2002:a05:600c:358d:b0:49c:fc6c:bdfa with SMTP id 5b1f17b1804b1-49e6cbec302mr4417405e9.17.1789171645506;
        Fri, 11 Sep 2026 17:07:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60a8a89esm108823005e9.1.2026.09.11.17.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 17:07:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh: Fix the return value in rpmh_regulator_vrm_get_optimum_mode() kernel-doc
Date: Sat, 12 Sep 2026 02:06:06 +0200
Message-Id: <20260912000606.34614-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpmh_regulator_vrm_get_optimum_mode() returns REGULATOR_MODE_NORMAL or
REGULATOR_MODE_IDLE and cannot fail, but its kernel-doc says "0 on
success, or a negative error number on failure", which was never true.
Describe the mode.

Fixes: efb0cb50c427 ("regulator: qcom-rpmh: Implement get_optimum_mode(), not set_load()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 25c14de3cd8b5e77b48f168d1afa0f3ad7ab9d5e..7db5730240e257c056e5e83e36e9b7816b44db7e 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -400,7 +400,7 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
  * This function is used in the regulator_ops for VRM type RPMh regulator
  * devices.
  *
- * Return: 0 on success, or a negative error number on failure
+ * Return: the regulator mode to use for the load
  */
 static unsigned int rpmh_regulator_vrm_get_optimum_mode(
 	struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
-- 
2.39.5 (Apple Git-154)

