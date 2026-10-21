Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615613;
	b=dmUUQIs/GmTlAKYyq1XL1sj7evhTOiApfH161K4k7JrqLWLhBbo3EcMZfxylaHEmVIP1
	 N0H8SkGXsgWPPfoQRDVwFWK6dX928OapkVWfUcB6KaOI+0fvuFpx78H9sX1c0k4WRPjS1
	 /pFrHmUilaG8Fr52IRV6jfPSy9tjrfeQJbq76b6VgYkbbnDweoIB2ZEnEOs4rJrmwyyb4
	 Aa2SmswF4q1pZ42wi3Z23vKu1MloWrjCJ9QCwPkUFQcV3ilejIvsz8+nXpk2x3ef7eAB5
	 Rs3FD09FJIAK+fCR+6LdHqJkCh7P3nUBfW9wmYzhBRaWuP8Wv0jxex5XGstumymbsfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rbjtzs9OvRd9HXNbE5Zvedk5qsEPAbwIpjYzhOy+A7c=;
	b=uifw4UHfjJq4jq90yZEFPVTqt1/aMKlwDOegPW9oCCiPetrYFDYEuwyWkIceSyUuG2Jk
	 j34NFCTK0+1haT2Fx2YG1C9Q1MOP/p71TsBu5X6x589XoF33KNs2IBKbiU33NiN3MgEiB
	 t4us5oKOI+XHhX1Sb28yq7IxYTZY4NONTTEQg0ZWzfVW43cl7iQd84oha5CyznTEIh+uq
	 nT/tIvlDxoQ8han6zh3fehwAtczyuz8z1i4ZsMmgP84wYAf5k++6YDpwUu8ccrER7//gt
	 lzaC73yTZRNW3i21snfG12Q2yV/Mz7zMulQV9x0FkOTeGRgLz/qo3fXtQEoHsibBTGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c862u6w6;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F255E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c862u6w6
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso838154f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792615611; x=1793220411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rbjtzs9OvRd9HXNbE5Zvedk5qsEPAbwIpjYzhOy+A7c=;
        b=c862u6w6LPhU86T3l8S/yC3IEl/eV5Sg0f31citnKIX3yD9z6rsvWj16L7JV+HBm5p
         rYReanI/KXt6sxVvuK8N4jUj/9AtgVD6W0KHUu5ojJCav4FJJPm7Nq/kXCY/s8dkTr2H
         Ew01mJksjhGbg8IKJWUyQCkawgYNEYl6TK/c8KWhCy8QZTzI+JzQtN2lrajIZR4SW399
         R/5meW/P9dmx9KLpsqOhbeqQWG+N1e+0QfPTht/yY9KLLGB9e1pPFpPWPA0ivFkSG0DU
         W37uxv22DihAShp6Y4KGXUOdtWlGPRJ/4XGBjJ5NvCipUNQQb+H+jMxL9ZD2O/sDmqhL
         UbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615611; x=1793220411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rbjtzs9OvRd9HXNbE5Zvedk5qsEPAbwIpjYzhOy+A7c=;
        b=zW1HoAX8CNPeEAZjZLXBKwzOEeSUAt7Z8iHTyrTjhjod5CElJIaHG5gtIafH3MGYx4
         B24LQZ6jU4Zf0LFi1gk4IDcalnhBxjeNrxObFPK8BWRq8l/izHSM3Wq6S/PilPcISzDt
         /Qs7Ge4KoCGR/RBLA4fvcEgQ4gNjp/vIissnCxd+q5YzNqJO40pVmiqn1c0F02hbBgeY
         O31Z5FPFXPFTWZ/Xc9gd7IibIXUJ9Bk5oyiYpCTbTeRU+gNv+0mjJgq1bQ2d7PdoNTA6
         eIJf/POgBttA05uut1i5x3ZHa2ZyrsrIWTHDSJC/zZmdvLt/q9G86EtlJjkRA05b6Itn
         YZ3w==
X-Forwarded-Encrypted: i=1; AKwUvByMsb/MTXQ9CzDRlWay3yHbCvam5x4e0HfkZjd6K97MgzDn+rkk3wwtXoFZUDAro2zKfuwKV57Cv3N4dJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJK/UEfI9ma1sylnzjJg7KgaP8Yln/TVR97mVY691khYcs28Z9
	xgLBLe2jI4rnQJNGU1ojpG1go+DYTbymqoU/cedeKl5hXJAXwlHG4C6Wgs4Y2Wad8bo=
X-Gm-Gg: AYBFou1QJ9rTiiBAuaxSVFgAZTshOiLqv8KqUVG/lDHysxzHZM880ckBzkTnpDFrmG/
	hfxL9J1vJro2fupWslnWvuEn4E1Cf3Dut7OPrji70GO++DVlN1xrTyR+JJ6BeyOTuB5K0ONkMfl
	FeE+h6ygFU2+XdC5cBlPOoTQ5tafIqsU+D7LBkfw/VOGBkpoCvDEUAZVRvg1dPUcGHfLeS6RP4b
	M5q/Nvb4eR6dTvBlJ3V5t9vgchirh04gae26o92Y/6jqDI0hCgjHB0xc/3b/u+WlanG6cQBOxuX
	uT/H1VOinK+Tc3+tAe+tm/7lSUgDPHflB/xzBMRYzxXYwOeIkZjGmwjG9hl8r3WT/RtltCRMLTW
	bp08sQu/q+bqT2MGmDT7hlSsnLWDG4Zll//L1gozAtjDdsjwpTd649GZPkxwHHlCEZUibx0qjfd
	a2PfGu0FqclC7Mfwwl5Q0zK/UJ1R1h585/r8SjOeNj9ZV/HdAEDszIUid3Snv+lZcdoaNsx9f3d
	KRo5u6eBQ6wUf9HQ9QOZhHFvIFvtleP5bqTwTLz9eU6p315EfBePEUcBrgYZaKTV/albAw7S9m8
	wgBxpUNs0CWKxWRqHrGuf5ZCHvIUMoU7OiSv0nzLquA9TA==
X-Received: by 2002:a05:6000:2d06:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e264e1407mr4953487f8f.47.1792615611105;
        Wed, 21 Oct 2026 13:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:4bc9:b029:b141:6192:5529:fb1b:7124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835b1dsm8623779f8f.40.2026.10.21.13.46.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 13:46:50 -0700 (PDT)
From: Yaroslav Shevchenko <yros22776@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused macros from wifi.h
Date: Wed, 21 Oct 2026 22:46:33 +0200
Message-Id: <20261021204633.33067-1-yros22776@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SetFrameType(), SetFragNum(), GetOrderBit(), ACT_CAT_VENDOR,
_IEEE8021X_MGT_ and _IEEE8021X_PSK_ are defined in wifi.h but have no
users anywhere in the tree.

Three of them are also broken. GetOrderBit() duplicates GetOrder(),
which is used by rtw_recv.c, but casts the frame header to
"unsigned short" instead of __le16 while masking it against a
cpu_to_le16() value. SetFrameType() has the same type confusion,
whereas the SetFrameSubType() macro next to it casts to __le16 as it
should. SetFragNum() passes a constant mask through le16_to_cpu()
where cpu_to_le16() is needed.

Since these macros are never expanded, neither the compiler nor sparse
flags any of this, so the first user of them would inherit the bugs.
Drop them rather than fix dead code.

No functional change intended. Built for arm64 with W=1, no new
warnings.

Signed-off-by: Yaroslav Shevchenko <yros22776@gmail.com>
Assisted-by: LLM
---
 drivers/staging/rtl8723bs/include/wifi.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 93cb83488..719a1ea34 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -123,12 +123,6 @@ enum {
 #define GetFrameType(pbuf)				\
 	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(3) | BIT(2)))
 
-#define SetFrameType(pbuf, type)	\
-	do {	\
-		*(unsigned short *)(pbuf) &= cpu_to_le16(~(BIT(3) | BIT(2))); \
-		*(unsigned short *)(pbuf) |= cpu_to_le16(type); \
-	} while (0)
-
 #define GetFrameSubType(pbuf)	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(7) |\
 	 BIT(6) | BIT(5) | BIT(4) | BIT(3) | BIT(2)))
 
@@ -145,14 +139,6 @@ enum {
 #define GetFragNum(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) & 0x0f)
 
-#define SetFragNum(pbuf, num) \
-	do {    \
-		*(unsigned short *)((size_t)(pbuf) + 22) = \
-			((*(unsigned short *)((size_t)(pbuf) + 22)) &	\
-			le16_to_cpu(~(0x000f))) | \
-			cpu_to_le16(0x0f & (num));     \
-	} while (0)
-
 #define SetSeqNum(pbuf, num) \
 	do {    \
 		*(__le16 *)((size_t)(pbuf) + 22) = \
@@ -306,9 +292,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
 /*-----------------------------------------------------------------------------
 				Below is the definition for 802.11i / 802.1x
 ------------------------------------------------------------------------------*/
-#define _IEEE8021X_MGT_			1		/*  WPA */
-#define _IEEE8021X_PSK_			2		/*  WPA with pre-shared key */
-
 #define _MME_IE_LENGTH_  18
 /*-----------------------------------------------------------------------------
 				Below is the definition for WMM
@@ -318,9 +301,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
 /*-----------------------------------------------------------------------------
 				Below is the definition for 802.11n
 ------------------------------------------------------------------------------*/
-#define GetOrderBit(pbuf)	(((*(unsigned short *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
-
-#define ACT_CAT_VENDOR				0x7F/* 127 */
 
 /**
  * struct rtw_ieee80211_ht_cap - HT additional information
-- 
2.47.3

