Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373744A0148
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549331; cv=none; b=cQkDnyKPT3l5Wf+LzTUDO/2KGlO5NDuCb5NVOxVH20AMOx1p/i7l2JVC39AyaqGMeSF602Gm9uJcXNGVxDHteTi3nHhNX1g5QDqCj8wHHMAuLwJvoFIDTUIq4j4iASKazTKb5kv5KGXlaRIGZxCsI3M8pwzZnovzHFS5u6bCXac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549331; c=relaxed/simple;
	bh=j5sbj2aiiq+G7EZlSbj67WaGpilF88mvU2dc4Sb1Ous=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HvN3TJQfhjj10w4dKSPaXeLqG0iCtofDOxK5NHs+S+wFHszn+lEG09Wi6g/BPtElfoUL2XmAM4V/b4FyaV2wITTjj9ndcbuVtsSq7icJ7RSbuLYwYEryTEDHCIBMCgTpcOSqCQpczEr4cuHCeplc14kWl+wYP8DF+AvW2ezhcEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgianMGT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgianMGT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so385414f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789549323; x=1790154123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLpJwVn/HuZGfr8ir4XRFNtWV419k47czEV7zvOmQAU=;
        b=WgianMGTSKKfNGAx7NvwWaXyUWZjEYY2LP6oAv1z3V85xpqsdECDvoEwBnRSEdmBBU
         qPZeqacwlLNGEXoMwpme2PiYCYU9S/UxgEFfZ+cYMQMPx9S6RaFCf5XsAvO4eitIpG8i
         70oDS8Z8ZBeCuJSE5FyO3z7+lhjpWEO2myH1X2Zdg6AxgFddELaw8smGZAgUl0CwsWkE
         VwaQoZ/qDN8bBhppPR9D4Qp9xa0uim1ZDECy6gFxOSk0BRixGFRB41NVyEDLexKP7K8/
         Ij/S/qsfbbRsf6eM7MfId+ErhQOulxgTJUghbASlIpg6QKjFlrf4hZAkllM9p6ojHeav
         P8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549323; x=1790154123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLpJwVn/HuZGfr8ir4XRFNtWV419k47czEV7zvOmQAU=;
        b=edkrZfi85aaJlg6V8XXv6PtowAuqoCPKmB/Rra5JS0LX5Rt/AhiRcMRRw4QOWotQDq
         jauk5DL8QhcS7TwUTARUb34J7MGpNzS6Ds9JpfDyBGQYO+Zc3ONThOz0A4OIPikMK5/M
         Np4RkEZC0d/7hulBkTOG9kNF8o7vvbRR2iVawZ0p2sM7C2R3+tCs9LiNdK1zuPpgHqAl
         MXtu/rVeotstifQEcAkJvAlg0RUCFigOImPTopXI2j3dUbDU6ZrXyPh4NZgEDdGY2ON0
         9RnWrlByOUlha/pCoRJ0r37JhcPQgoxAW/TvcJwa6D/QOfFgVTrrpzcnYf7pW44zPUfT
         u+2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkkfcj4Pr/BoXBkKMGpFy+DOEopkn7lybcPOmCLlS7gzCPE6RLqXxAcZ9vWxKCjHG8ylSVwRHTsxeQSTI=@vger.kernel.org
X-Gm-Message-State: AFuF++l4tKFEOiEVXLJodQTABLogHtFEBOfmVoOohqWSna29xwtOaeCm
	WLxgPnnzn47BxRoREbJ2LosLxXvDO+FHGppiW4eV4J1dPGrY/VvKSB1X
X-Gm-Gg: AYBFou0AIK8PbB2P1OMclhB6qGRpHHoqU2cCxEur8mJu7XJU1caobWeIcH3x9asvBAb
	voQB7vX9+NVUZ8PZ5VsIh7egvb96q3y/Zij5YmesfZGv6Rn83+7zII24F7tvoJ1uI4IH23S1Loy
	Qz7L9QKan+d1NcBwg0SZumP0+t6pXCeFVNGWzVMlwZUGgQrGT50eJlSrjQc49zyhZiYpYRwFtNI
	kqYeTGdZ698+hUjQIPahbayOt3/ISeK+LAVcrsVZinL3W1aWMBvd637ePOqkCM5Aa064X+n9sHg
	kcNFNfT4Pkjmjq9i9Nobw4GUSs1mSjFmrTFC0B1ATNfiPwxrckbRQPqb9mfSUDs8RrZsEnN+y8+
	TwgJrTVRlzPh8q+RP/eFslWc32e7KoItgBHn1WEGHVdIndEttfJlbYVg16103WCdgmGE3IBxkLZ
	dBBE/OheabjeUkzsba45jSIPVjUTfgSX1DQ6tfT3FooWiIEZtQThKUgT4FEbFaqPsf
X-Received: by 2002:a05:6000:1845:b0:487:370:d03b with SMTP id ffacd0b85a97d-4870cf201dbmr2386458f8f.19.1789549322496;
        Wed, 16 Sep 2026 02:02:02 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf4161fsm5229696f8f.34.2026.09.16.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:02:02 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: remove unnecessary parentheses
Date: Wed, 16 Sep 2026 12:01:45 +0300
Message-ID: <20260916090145.34881-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around equality checks in sm750_accel.c

and ddk750_swi2c.c to clear checkpatch.pl checks and improve code

readability.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 drivers/staging/sm750fb/sm750_accel.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00e..24ad58207 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -393,7 +393,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * Return 0 if the GPIO pins to be used is out of range. The
 	 * range is only from [0..63]
 	 */
-	if ((clk_gpio > 31) || (data_gpio > 31))
+	if (clk_gpio > 31 || data_gpio > 31)
 		return -1;
 
 	if (sm750_get_chip_type() == SM750LE)
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index bac9a2098..21aed73d8 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -202,7 +202,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		}
 	}
 
-	if ((direction == BOTTOM_TO_TOP) || (direction == RIGHT_TO_LEFT)) {
+	if (direction == BOTTOM_TO_TOP || direction == RIGHT_TO_LEFT) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
-- 
2.55.0

