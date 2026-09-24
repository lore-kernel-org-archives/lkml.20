Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2CF37EFE2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270344; cv=none; b=LHTKArVNmS3Oaf/yE7/P0lDzNM2/0X9hPujfG9hPCS9mfSD1ENKozAW/9GhYxugUHBRyMqnukXOpNBSUvq8fWTOrqW2jElgg7sQLE8rOW8vGMzzlAChCT+Q7Sjw0nlafXMbSm7n5PM2lxarOnpQukVo9EMhLaNmHQghRMsF+65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270344; c=relaxed/simple;
	bh=IzOSQ5PgShuwmISU178ZdszugMpsD5D2m5PTctJO2LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJrZNz1GswvG+p05+FFFULYZRxoBzppf4eL5yC62gFJTVXMPuA8tXxU8zzGq9xlOPecT/Pl6xJZOsxalqogZplrBwme6V5EXlSYOUV+SqpGkype2KCnn1muy69F53xuHCknrPeKc+Q7fDi3RT1viqCF9yKqipVRYSHC6rA5yL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsRpgt3Y; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsRpgt3Y"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5919af2eeso17708631fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270341; x=1790875141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=qsRpgt3YWee5mEfFoEQnNZFe4UJqFMFY1KyWlHPiG7YJZ9bni5KMSfHzx1QmI8aDL5
         rEa7zQwxZuUZZnqYCb8s2RzAwxHuKeULr+1BMMj92D/GhbLBEfcUazgoQdx0PLemZ+m2
         1152v5jUZvtckfwiJ/Gz0zttQZCKJkTWxGu4xHUVJuknX9uea8RRE4oKK/6cpnJlWct6
         tgdtgafhm+Ow2O6XnmN2Qj2DCPnn64Zu1wZS6DwT/sifvBfPsq586/2Ka4UyT6wfTGdS
         ZS8xRvt7TthvNbAYMxhD3Mq9qPHMzq0HYi3tf+FLG6dK+vaOrjyuTKT+1GtG3jyaBEA7
         aYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270341; x=1790875141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=f6f4AT8QyB4vEc7bXaDUfkPOF+qlesmVc2ZIfQc40XWV8rvW2qU944uNYqGLrQ50bF
         VY/XCKtrLKCXJhKqG4IrD2EC77t7bDknG8NB7xHzcNBTe1jGZMZOKn8SimEdePhIr4kp
         M587ygyums9zy6vRASlC5gwm1IrCMEJJmZpQVryOhqvzDm60RdlsKgUcsnZZLCFGuJwl
         KAQS5KE+pSVNvwNFQ2Jah743xZsvecDG61bwGV3DL1dzMoAVIHlcrSk0CEep3okeDFab
         M+LVJsi4rKb8adaZnYfaU5Hb0IDKT8kQZrmNbUgoTB2BAAfB6HUdnZDPFvlCPwpVaBK1
         JJFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8aMF2hcFUBrtfqRs+pCvgcmzVVOjgHArP9htOly35686cnrFe/2I+BwuV7J8yy5opUFcWnlE8S882z7c=@vger.kernel.org
X-Gm-Message-State: AFuF++nebpCwsVpo7rPvi3Q8HmxfS7HzghTmL7Yv1jr6fPRSfH1JHJ49
	Cqz6Jfs6lfHGqfw+kWChZd9WRmMdiXekPTdcLgQifadNWBkZUq/Zt9b0
X-Gm-Gg: AYBFou2/oYhiAW99H+rlQIi4htc282SmqgX9wU6/nPlzfc+FaACcLYbEG5RVfFCEf8l
	IsmdW2DL7JUWJh/XvAdLHNZ+UE5sKLew6NNAig4bVHtxU3aTforCy7nNBOh8VsGDkkC1UO1ycXy
	lxacr95nDi3y/+2KCeQ6ENkuCZ+cNrqtliCDmPnEsWjClJo37jMUoCkMD7FdsgE8wAE4AyrmlYs
	qkIaTaFeAriRFZchn9mnI52fTo/R1EQVya/Q288klXz3gU5mBuGNWkcaDwtFuf3ukh/dj9SBuxx
	cYLEB0dQk/vAyfF+Lf6U2JBIpuJeEw9N7voyMeErLCJnvlwiNfv8o6EaQuZydn19RazgdNNBEN6
	q8nZW9QPALcPvKt8M+EjOcSAo2wvZ/JN6AZMln71E1T+hg1fRH38miZ7Q478BP/LIOnRA7dNBbe
	W1HMgZl6dHbLBUG46d9M1ZwV2fd9y6W3hk0mgS9TupJBkKYv0eAM4YzqNzDkd9meOAfoOKhUygd
	DS2c9t1vPRuHfw=
X-Received: by 2002:a05:651c:b0f:b0:3a1:f4e7:a820 with SMTP id 38308e7fff4ca-3a63bf292bfmr8906191fa.4.1790270340690;
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 1/4] platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
Date: Thu, 24 Sep 2026 20:18:17 +0300
Message-ID: <20260924171820.1179823-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad X1 Carbon Gen 14 has an ST VD55G1 IR camera, ACPI
HID TBE20A1, behind an INT3472 discrete device that provides a power
enable GPIO, a reset GPIO and a privacy LED. The vd55g1 driver names its
analog supply "vana", so map the power enable regulator to that name, as
is already done for the imx471 on the same laptop.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6c729fcfc..d005595ba 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -130,6 +130,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 static const char * const power_enable_hids_vana[] = {
 	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
 	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
 	NULL
 };
 
-- 
2.55.0

