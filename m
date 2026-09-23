Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321B49E5C5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163568; cv=none; b=Dx9XUYerYQH4RTQAUgHtv4454iyAS4eopSGXCbg1zdySoilSD7VIGqnslrdb9JZaLqcWa8GpiaDaC9JHN/tH9DPoi4JDgyajrDZDeVgm3v4odzRyHsu/uXTgAWzuXTxL5c5wwdic2Hkv4vmqt7JkTM6yPFWtefpAE8sM4nGQqvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163568; c=relaxed/simple;
	bh=sT3f5CSowAx+WsW39V1WrOSwBm0jKQKK9E8vUOutaIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJU/w55Lv28EEnv2/M5+/nLpg8PA39oU+CbMbODRzEx4BQqVwTdYpSbF2Nt+3Rpcl5oj6FM1tZFYfEfQRLnyKlb2Ihsx/ccCqCZ3elYe2cPDUBLoA0/pGak73hDfqom6gVNvB41ZNuDXGOTfpMck+fbaL0zfBxVxEry9Y97dTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXsP0EcI; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXsP0EcI"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so469369a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790163556; x=1790768356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=VXsP0EcIvPX6Ohak492BRMOOwHr0V014dlP7EAorXBMKbap3T56K6b7BrsEppw7ptJ
         zi5KLqVviALNFyDKDUvEkgMtb7/ecm+Qz/QlnnWB7j0q+V31wZBvqPKPvB/+NiZtq1QG
         IY8rngadv29QuiZqWKrPaQ97cSyMO6bMgeiJWDDqNKWZE3PSr4TxTFu+8if7m0kHd4TN
         QbkoRr0Ivhke5xguUTmBeJuBg0l5N3tKkrLOAlALNbSqV2S0sSNUgzQpUv1ZaLG19b5M
         ik1/NVm9e9Uot+wnHA4Qyi89r3Zj7rNSrF7nHLNrQPrV5IzgSWgoGRmOTCfTotRPHovk
         nPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163556; x=1790768356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byz42tnH1aP31XpuO9qZLa1U10ksdFNPyaGh5na7j6c=;
        b=Be0UDWDu3Nxu7iV7X5E4Bbo0oFAZtlpF6bF+3wEDCcfc/no7hlJdt3AhRuLQzSh5qG
         3dK/jDFn6AaU9qL5zbAqsLRFMA2od3MIjfmxyyA+l3Iu3jnsDqKkaSJMuOZx2OaNOr4Z
         vuR7ibueVvvpcoUz5wrs5FyMYQ2VRXupLWGis20Uw+EP+QMdFakOqQbK+ZO//+1Op/MC
         3C/nDlZSZXC48b9ofmLDZcpXtaOeXm4cA/aLfE1G9UXvkstKmvXcYEM7mE/e/R1dpsF1
         aRsp6ZdP52rKCiRRoTxgZZeB1mSqrnam6nKbRZONp2M8cFvdW492GiqLQbkSnwjS06PP
         nrdg==
X-Forwarded-Encrypted: i=1; AKwUvBwKEuVFk0ohKEXXZJYsWgvgAKht0XppMVGOMzq1BYeZIMYuwMgT1bIJt0ub1bdMQWJL1zUPmeFKGzEd/Mk=@vger.kernel.org
X-Gm-Message-State: AFuF++lFLiCPtUnt+o2dand7vVtIZMlw7OR3O3P95MaTBgd5mxFQj922
	uteSkfFSkH49oxVD96nDKFFN/n8QMVpbX8HaPb8RQW9HzNQYMeUpIhXg
X-Gm-Gg: AYBFou1itxKzmRPcfFSDRXHZU/MiZARCI+ict8JY20VOR0M6ZVOLvZ5oaTyk22dOchq
	FhAC6bqLDfnvI45gzIkdZHpsNn4Bp5pN74sgB3YCKEMiMmqfECJDhkGUuDrNOO+sBM2OOvCSYKC
	EUwOvQpFy5Wi++ECiYjUFJOTIg8CPmcfH29Q0vQ9UmQKmXk1EGB4xuK9Zimq2mus4G7GdpCl2g7
	T4pcReRgLAqPvXQGEth3+wYee+wWluhQuuhBVimFaAWXZrCdy/aVo5jL46R+cOgVuU08gB3Uk3p
	kyQj94g7/r3F/HJCEdPEQQOR9gNwJ+PDjrDkFXo1LA+sCDeTYJKdURUafWRl0Hsc4KJxAZCyQGl
	Q17XML3NXZtcXpvD8b3DdzZYSHDq+Itrs2hJNBMnNHHRbWIpUaMSacrG9tQcO8mz1MVhZS0cbA0
	sCyOLlgFiyOLxYolr7r96n8NaCtrLWa6/o9Bz/WX4e7+iDsWpb98OERDjCe1spsdQ09xdO7VPnd
	xXY89NbKEmJhwHwViKV
X-Received: by 2002:a17:90a:c886:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a07e5373camr2045004a91.9.1790163553103;
        Wed, 23 Sep 2026 04:39:13 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4easm4654288a91.6.2026.09.23.04.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:39:12 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: xilinx: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 11:39:02 +0000
Message-ID: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_get_sync() leaves the usage counter incremented even when it
fails, and xgpio_request() returns the error without dropping it.

gpiolib does not call ->free() when ->request() fails, so xgpio_free(),
which holds the only matching pm_runtime_put(), never runs. The reference
is leaked and the controller can no longer runtime-suspend, so its clock
stays enabled.

Switch to pm_runtime_resume_and_get(), which only increments the usage
counter on success.

Fixes: 26b04774621e ("gpio: gpio-xilinx: Add support for suspend and resume")
Cc: stable@vger.kernel.org
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Build-tested on arm64 with CONFIG_GPIO_XILINX=m. Not tested on hardware.
 drivers/gpio/gpio-xilinx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 532205175827..9406ce85f933 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -271,14 +271,7 @@ static void xgpio_save_regs(struct xgpio_instance *chip)
 
 static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(chip->parent);
-	/*
-	 * If the device is already active pm_runtime_get() will return 1 on
-	 * success, but gpio_request still needs to return 0.
-	 */
-	return ret < 0 ? ret : 0;
+	return pm_runtime_resume_and_get(chip->parent);
 }
 
 static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
-- 
2.47.3

