Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB148C3E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525408; cv=none; b=l9D4OYMUnee6nIQkGSbRI2uOD81i+RWPYpz1twLoybV6rM21B2jkN3qODSTQktEn8ywnl/uEIwI2PqZccwJ2N1muAlqapnak9ZS5DfLh8kfdO4RjxVRTocw3o2d2FTGb/g3FgO8Aelb2r2NMQeO2H924P1wTyGU2OIFL16g1cl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525408; c=relaxed/simple;
	bh=QNNRVumQq4JEXJvTCZbkFGKfH9cZY/K5oi5R01sEvPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYFQJ1QG82hYQxVTZan851Y8VkGzgRN4UY3uL9koNUlQmPF1DuXD7F9nNStu87TeveLgNSNqfvZDZ05Ilr3v/2YX8jzjEMX1L4cOeFZYJFKkiRqkL9TfWwfaTzAGGAUneBtmjICNPBrINO6s8br54G7raRG88q7I0aUq5cl4t18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lai3/zqP; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lai3/zqP"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso391318e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525406; x=1789130206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqgbPxH8oR+AVK0pC69qx0+ihlzFG8XVWwWZQ32tFQk=;
        b=lai3/zqPZ4aBp2rkslo/VuShWPnKh2QTQBAan8C5WA0EUifZgwCXGO6ua20jFZ5hPd
         kE+dN72uW+8RS4SZVzeHTLmKdjh4c1SClmxWGszCKpm5RkQYp/Q7hOnhiYpNlLRiRnJn
         nQU5P/c5rT1y8uxUsr2DfywLGNcu+EjYMT880a0brgCeNAKdZ3DcLnypYeXB5rW/qfRU
         aG5VZhDSpIDaXDHFRhCV/PnudCaDTK0t6VLk45cHf/29y/6+sjkWCdJxu7Hx0UP3I+NP
         OCb0opfIT+fHUzzwzflUoLbmL30nKP1QikiGZDd4Bc4CxplS7e6AcwGJL9uFDCekOnge
         OoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525406; x=1789130206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqgbPxH8oR+AVK0pC69qx0+ihlzFG8XVWwWZQ32tFQk=;
        b=aMXGHD43hm75d+BhaMjCUgP1p1G6KFc1BOq0qXCvlWyL1ZEFBDQ/e5h+hJNx9PbXy7
         Fyt2BLHQGKjalvBWsgU4EX5LhaaBSVYUAvsj9TYgVs4EnbuoGKa0gcTrDAMgJ1iO4UIY
         s80uDpVV50VqfsGJ8B8uEwokC3xH2O/rxdJk50Yb8tDniuZGlTP+hndoxZSaflxTimuN
         OBDLLKGEUF9csWRxeqkVHXjsEyx8g777OE1rjxf1z5C6ffmqiiAgbUG9Qfi/E9iq0EbB
         EVq3s7T0RABeg2CJkEovLuIDOJJiuMp2GDg3ZAepr0GzErDY21Ho6eUoKJ8mey8I8vTH
         IzrA==
X-Forwarded-Encrypted: i=1; AKwUvBw+ObULOdnjQUiGl/HzFPXNcsGOAVC6u0i/ajrX1pGuMGko3Ky5/pUL2c0/EnYF6cxCs9gcCDYkknROZ6A=@vger.kernel.org
X-Gm-Message-State: AFuF++kqfUS9aeRkosrvnfsZcEf99baE1EfgUiN7Sw9WvSvtZpnJ6K+0
	a2pnqkxGjhfJHYdzqOMY3B3OVF81RtxH5XFIniiBXMKJXGtBBbSSOi9n
X-Gm-Gg: AYBFou0EO84IaRIg4sNoMIcV1+PYr6vbqe5X0Xw+JtR5EFqfUpslswzMEZMX3z16V0/
	Fd8uOsHH30GKR5LSdR8P5J0iPf0ci7L4j3lX4n41ptXADt1pKRnxv0Bb8Mt5Keuf2vRBgDhA1hl
	iVYqeCBsPkSbpq6BVU6RiLh8O6xt72Bte/SMQUsTbTKX1fgM/xWFeery3Hd9pb4lTIrAug+f7eT
	tyhaaHg9U7Esw5xCGLUet28DwwslW9jUAv+O1ZoyqW/P8vJyhvq2F2HC6SLr53ZTUdKkDkc2SS+
	8qRbIPW2E3+veaC1z6Edgt/sTfOD0vq27blt1Tiu3nmk3J4fJ2CfnwQCc+mxnaHD0iXX3QLyBQD
	OoanHLG3ITwMoJQQodZvLtIy3Rcru/3uHuHUI77E50ZKDC5/TWWaiM02VeqkEataQRsN1Ki7/pR
	QX6NQ/02BnXRU8vlBv9FG+BB7k/4BX+SGm3ttTStYtrcsRRAmV3tCt
X-Received: by 2002:a05:6122:3128:b0:5bd:71b1:d5c6 with SMTP id 71dfb90a1353d-5c7ed3c7515mr2219527e0c.4.1788525405797;
        Fri, 04 Sep 2026 05:36:45 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b36cbsm1924498e0c.17.2026.09.04.05.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:36:45 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused AMPDU burst mode
Date: Fri,  4 Sep 2026 08:36:22 -0400
Message-ID: <20260904123623.175042-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AMPDUBurstMode is never written anywhere in the driver. HalData is
vzalloc'd, so the field is always 0, and the sole read in
_InitBurstPktLen_8723BS() is therefore always false. The only use of
REG_AMPDU_BURST_MODE_8723B is the guarded rtw_write8() that this
branch protects, so that register write never executes. Remove the
field, its enum and the dead branch.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 --
 drivers/staging/rtl8723bs/include/hal_data.h      | 13 -------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6a4a13544c..1389e5598d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -868,8 +868,6 @@ void _InitBurstPktLen_8723BS(struct adapter *Adapter)
 	rtw_write8(Adapter, REG_MAX_AGGR_NUM_8723B, 0x1F);
 	rtw_write8(Adapter, REG_PIFS_8723B, 0x00);
 	rtw_write8(Adapter, REG_FWHW_TXQ_CTRL_8723B, rtw_read8(Adapter, REG_FWHW_TXQ_CTRL)&(~BIT(7)));
-	if (pHalData->AMPDUBurstMode)
-		rtw_write8(Adapter, REG_AMPDU_BURST_MODE_8723B,  0x5F);
 	rtw_write8(Adapter, REG_AMPDU_MAX_TIME_8723B, 0x70);
 
 	/*  ARFB table 9 for 11ac 5G 2SS */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 57a18da67f..614fd88545 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -12,17 +12,6 @@
 
 #include <hal_sdio.h>
 
-enum rt_ampdu_burst {
-	RT_AMPDU_BURST_NONE	= 0,
-	RT_AMPDU_BURST_92D	= 1,
-	RT_AMPDU_BURST_88E	= 2,
-	RT_AMPDU_BURST_8812_4	= 3,
-	RT_AMPDU_BURST_8812_8	= 4,
-	RT_AMPDU_BURST_8812_12	= 5,
-	RT_AMPDU_BURST_8812_15	= 6,
-	RT_AMPDU_BURST_8723B	= 7,
-};
-
 #define CHANNEL_MAX_NUMBER		(14)	/*  14 is the max channel number */
 #define CHANNEL_MAX_NUMBER_2G		14
 #define MAX_PG_GROUP			13
@@ -240,8 +229,6 @@ struct hal_com_data {
 	/*  Auto FSM to Turn On, include clock, isolation, power control for MAC only */
 	u8 bMacPwrCtrlOn;
 
-	enum rt_ampdu_burst	AMPDUBurstMode; /* 92C maybe not use, but for compile successfully */
-
 	u32 		sdio_himr;
 	u32 		sdio_hisr;
 
-- 
2.51.0

