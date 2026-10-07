Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABF833A6F2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337055; cv=none; b=dr9kV/Iy/FWTOG6y/u+bG1dhB4IdhVgggehV3wDFAsaUsGYwyxSumX9LW43hetzgt016U/rnq/GBwPNIZaDrF2LXG8mfyZI7qGlsHq5lEAEYT+QuJJmuCLWNzAiI4Cx5cGNYRkTe4vkG4vp3sodB8w7kAoBZ5PSj6GfXXalgNOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337055; c=relaxed/simple;
	bh=SOLkzMjcd8t7bYXDVU1/DE9RyYqx6GQwsbfS6Psv/UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p6Tz3fjI12zpynKYMcI8pimvhlDCCMt3T1eVl0iPqzbbQ9DPKAZB342/f7odKBgy+0XypUMYKmIgv+1m2oSmZWxQthmnC+ThtGH2hfq8mHO+/z5BZJ/9b2/FtVHhKLXtYrc9mN+NSzkwA4Htxzc7iz2lESNboqOxfzjK45TzW/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0svI2F4; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0svI2F4"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6de1fd5f572so571590eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337053; x=1791941853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ct4rXXs0PtnWbJOqaUvpbRv2cVJCpPMHV6AEHhPMwjs=;
        b=B0svI2F4csfr/dtu9RLHW1bZd56a8tC0sV4/VoTPhX91RqhcVjeuzQCG+oW9M1NGGz
         0lkscmvycd01ctsPt1se3rY1wTV8J3mge/YV9/hyjuycw5oREDZcgtR7LJruRyFlKfCn
         BM5416NqyemuKyVanLOVlD2b0EmsOSH4wL6bmSdrI5Dl/TsHx+/Wn/3Hr15w6LuymcLN
         jPmi5qf1rwX0XuGJCq4YbOk0QxTW2Q/mlB6ZsZhH6/0P4YqrdY0c8NreWBAbv9WwtAXF
         2x9kuPGODdQrgFQ7EsC5cvfBLe01E1+zVW3FYKvAh59DVNvnKwOwGxuwz2H0bAqOD9sQ
         elQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337053; x=1791941853;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ct4rXXs0PtnWbJOqaUvpbRv2cVJCpPMHV6AEHhPMwjs=;
        b=EuIqt54veb0IrTC53pcQS5yAQwtbprQGBbSv+ReAEQDpophhvUqjlLlSX9sYyFUqw0
         V3fhiPVlNCpaEysVuaQAwoh4/qtvvW7whBO3+zMfRVrvEkOote7tMgzMlXhoAQ1X0VdL
         zLsRPOrPppXmnq449WqJ6Cr8EquzYYDf4bSxcm4stngxupyqE14lPTQt/g2zzwGMPvip
         VJr8Zvxad4X0KpmAFI6fELyRQISzZw2mCgBnhqCSfw/emkJNDC+X5stN4LEpaZRksXnz
         C2sfE0DWgO8Z/8Hfcc1efO3IFP6VOYdkbNaEvyjRTUzxaGvn9098HNlDMyWHNG2SnVe2
         fOyw==
X-Forwarded-Encrypted: i=1; AKwUvByRmR5XKm1PqWIKLVTc668MlG4mvCIWNiGT69V6Zvw80YRtEOg0qPAzMfgyuZRVD2Oss9EMH4fPSt29qRE=@vger.kernel.org
X-Gm-Message-State: AFuF++lgnmE7xj0LY1svc+k6G5aOYHe0fa4h7RBr8vgsGD3e4wDEzmUr
	sbykVegZSJKCilObTogYe9zNE78VJgUnL9cZC8n0V8/cwAvQ9pyuSs4o
X-Gm-Gg: AYBFou0arDF96CuLcYA1SLYzXbUWnD1LFegLnH2vjuAAIbLm8gxlZTvg6xTpMUwuWS0
	j+57bCQ9aFoD95soI8pDHR16DVTspU9rajetHfDv3o963KQoe9zaxHC0KEw8EXURasOavaBosZv
	/ORHVjgkG56RdC6Fk2bUCRQFAwGGjI4jebRnIHF+B+OnuLHT9g+ZVYtgYn5i9Yq9sCJBpikgChq
	hvhcrrcBJtcy8QZOefB4FyZP3SUDLQsVocbepGSrIHH5fNScmSnRr86y7/DU06w6+xulSVSgEJO
	8OEQ7r5Klzxrbh1obBtI9jLQIdS7vJyWOTJWWwbhas3fn6loVRCiZSCls6mAiOKg7cBdrRnZ8uz
	faGpSgKmQk+2HQQot6EOTgBUYMK6rLR0NIDJ6JS7CvxHKIEPIOdAoh/HGIlpFpKefi9PW1JBaoL
	SNI0P1swbGAI3thPUN++ukf5hmpx6BqW/IMWfFPoHw2jeHzcDG/NdciqzH9ysfk0n0o+NL5iCh+
	hhcPowQmAjwThQnJk261NLXFrdcHZTpxg==
X-Received: by 2002:a05:6820:200e:b0:6c1:dc9f:ab2e with SMTP id 006d021491bc7-6e7a889e3b1mr944001eaf.27.1791337052909;
        Tue, 06 Oct 2026 18:37:32 -0700 (PDT)
Received: from Arch ([201.110.174.1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25728fad1sm966520fac.18.2026.10.06.18.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:37:32 -0700 (PDT)
From: =?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused EEPROM definitions
Date: Tue,  6 Oct 2026 19:35:21 -0600
Message-ID: <0c4bc57c3034233f330f620eeb03fd7d8f8de457.1791312824.git.inakisobera8@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RTL8712_EEPROM_ID, HWSET_MAX_SIZE_128, HWSET_MAX_SIZE_256, CLOCK_RATE
and the EEPROM_*_OPCODE macros are leftovers from the original vendor
driver. None of them is referenced anywhere in the tree, so drop them.

HWSET_MAX_SIZE_512 is left in place because EEPROM_MAX_SIZE expands to
it.

No functional change intended.

Signed-off-by: Iñaki Sobera Sotomayor <inakisobera8@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_eeprom.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_eeprom.h b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
index 4294b021f1b..92eea3e2e70 100644
--- a/drivers/staging/rtl8723bs/include/rtw_eeprom.h
+++ b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
@@ -8,24 +8,12 @@
 #define __RTW_EEPROM_H__
 
 
-#define	RTL8712_EEPROM_ID			0x8712
 /* define	EEPROM_MAX_SIZE			256 */
 
-#define	HWSET_MAX_SIZE_128		128
-#define	HWSET_MAX_SIZE_256		256
 #define	HWSET_MAX_SIZE_512		512
 
 #define	EEPROM_MAX_SIZE			HWSET_MAX_SIZE_512
 
-#define	CLOCK_RATE					50			/* 100us */
-
-/*  EEPROM opcodes */
-#define EEPROM_READ_OPCODE		06
-#define EEPROM_WRITE_OPCODE		05
-#define EEPROM_ERASE_OPCODE		07
-#define EEPROM_EWEN_OPCODE		19      /*  Erase/write enable */
-#define EEPROM_EWDS_OPCODE		16      /*  Erase/write disable */
-
 /* Country codes */
 #define USA							0x555320
 #define EUROPE						0x1 /* temp, should be provided later */
-- 
2.56.0

