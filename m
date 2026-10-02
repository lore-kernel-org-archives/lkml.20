Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD20515989
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972070; cv=none; b=hj4xJjckaZxr/MCJfX4avDu0VqRcGvKuwVKQ1NAhRBeoIYKP+EP48wd3hfXgnQeLtW+VbhmpmrMTkkYBpVzQbLMP7NBUnNoTA3kRKZSy0zUn9oRO8VxBSomYvxBegJujak8HwzKDs+gsk5i8wBDnuv2txxbXHxN0zu3oraVjyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972070; c=relaxed/simple;
	bh=CN5nGBmrsvbOonrtdw1ScMbVb9sP4MzWc/1Z2ye22lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJjaQgDCFZ1V6gMmExuECoIwHWw6Abkm0KQft/giiwUMiRWPunppfuOx2BdKD+5UTfyn3ChIJNxzhTlzzY/8/T+VcjkO2xZf3IDZULc26S3ouuz4ZCrH4XcfZZrMA3vETFGli0dZJLffS7oYo5a/kZtFCsMcO4vyWX4h2H7KTLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3fwHGq7; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3fwHGq7"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-469fdb78b1cso193189fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972065; x=1791576865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2aR2xZgN+s8FYRaQnu77ab8mjfDTzj3thxudFsAn2s=;
        b=M3fwHGq72Wd7rBc+kSr5aBZvpeUTPAwPyiO/+xGWAHGiQ5Sfbj6sOMJV7xvGk4pYsH
         vXUAtgNgnK+0clVTP4mshF2LkH1nEX8mjk1gvf3VxyUaSZOy5r0KGISLJbWcQFhsqrhC
         3936rGBkLalZj1VbmeYo5/1kdHX9keDUmHKmXxTa/+yl9Y81RDoEf+UaXoGoAWxGZdi+
         Re3eAxaJ/eycT0tMEbPMtwN6UQF/jq5Bg+XrI1YAXb9ib/5IfumexbAj2kvzrmWpf9Q0
         E43pNvPDg4DefSWnmD6Y+FDQJ33ejotg009qrf781P8twYK1020y9s/OZ29Fx8ZQXRr7
         IfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972065; x=1791576865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2aR2xZgN+s8FYRaQnu77ab8mjfDTzj3thxudFsAn2s=;
        b=pWQVAsVtWxSQ1fLkgx8SASGiGKZQ/2PgD3JXD5pbc7qgeO4UDRTgt1+DoTjveHm3gO
         JGyhKzlxEnbVvrp+raNrCgVa9bHRsZHzn7dxFK2iNuG9P2JC8I2O9Z5um0VOhZxQkUR3
         VheqNEFmjWTa076mpKMPTRdzEQUvVyvgUQr4M7c8qp7fA/MfUrUFhSqEGWmvfR1JZYkr
         9khWToIIQZyi0DwkZ5P7gZn24MXOKu9+9uB8UMF6Ni13bYSDJLVcWRgsJ0qyiCdbOls0
         ddLSrh+buXLn6UPRGw5DEEZyCXipVlYtfoTBTPxt7B03CIm//akpNk1kQGUAgxvhj1uV
         A9FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH37wk2P+owy88xL0E26R4qveJ4iWNSLHA8QgqMGUy98gxw+3Uy5CM7/SYWTU9rolXs+c+nGrdjA4KWlU=@vger.kernel.org
X-Gm-Message-State: AFuF++nFbnf99ogV5ZuIAITADbVK+RXEB1H/A8IjGZaz6YZBcIrR2naK
	QZUcEECHHadHN1W91K8g1DL3jM2D+0hM7Pb6mIHA59dgXdTYx1udtcQC
X-Gm-Gg: AYBFou2gZa5odC/XQiv/zSN3N1Be15G/Ss/X8tq1tt1qYYbsgGGH9UiQ7cjtJ2Iz7an
	XPeephKeP1upL2B8/Y+yUO5qcVpyqP5hb2gOPoSfye8ugAocT67CE+L+BMNeyXBAbMrSTWC0pze
	jk+GaNzI+mhsRiz4IOvilD4GD3U9RifphJbEsrlNMVfW1soFk+a8R4dlWz34QD/VmcYxXZTXChE
	/QE5OW/sfId5EcxiYuYyQWRjQfIJe7qoPfkSdhnkYwX+KfdFH4gEJacMSBgnlbeBiYv1hgoKBIA
	dJodqx5SJId2H+9wAPjyxBGOircG0GExrHj1k8G+bS5YgtITt2b/lOB/7AD3S2WT1rO6e5nmBpr
	fQeOhWp+ihKxTszi3kZ1ZxS8Q7Ag6o7z4/p+vJft6IVx/V5jAAP6Tknbqr7mIUeJbQ6qTc1ph5u
	dB0Y+nSSr9n5SBcj3wHWDMrBZozlFkltauxIH/zL1mKtzRAgC2VEdVT6ptPa5f48/irWbkQMkuC
	D8=
X-Received: by 2002:a05:6870:41c2:b0:48f:e25e:e204 with SMTP id 586e51a60fabf-49e15fbcf0emr3300276fac.61.1790972065491;
        Fri, 02 Oct 2026 13:14:25 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16f00b5asm3117969fac.14.2026.10.02.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:14:24 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <rishik.yechuri.code@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Gabriel Windlin <gawindlin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused BoardType field and its parser
Date: Fri,  2 Oct 2026 15:13:53 -0500
Message-ID: <20261002201354.156065-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hal_EfuseParseBoardType_8723BS() reads the board option byte from the
efuse and stores bits 5 through 7 in pHalData->BoardType. Nothing in
the driver ever reads pHalData->BoardType, so the value isn't used.

The function also tries to fall back to a default when the efuse byte
is unprogrammed, but the check can never be true:

      BoardType = (hwinfo[...] & 0xE0) >> 5;  /* at most 7 */
      if (BoardType == 0xFF)                  /* never true */

Remove the function, the one place it's called, and the unused
BoardType member of struct hal_com_data. This doesn't change how the
driver behaves.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---

Notes:
    Compile-tested only. I don't have the rtl8723bs hardware.

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 16 ----------------
 drivers/staging/rtl8723bs/include/hal_data.h |  1 -
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 4a2f5c3bb..26e0ea465 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -933,21 +933,6 @@ static void Hal_EfuseParseMACAddr_8723BS(
 	}
 }
 
-static void Hal_EfuseParseBoardType_8723BS(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-
-	if (!AutoLoadFail) {
-		pHalData->BoardType = (hwinfo[EEPROM_RF_BOARD_OPTION_8723B] & 0xE0) >> 5;
-		if (pHalData->BoardType == 0xFF)
-			pHalData->BoardType = (EEPROM_DEFAULT_BOARD_OPTION & 0xE0) >> 5;
-	} else {
-		pHalData->BoardType = 0;
-	}
-}
-
 static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -963,7 +948,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	Hal_EfuseParseMACAddr_8723BS(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	Hal_EfuseParseTxPowerInfo_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
-	Hal_EfuseParseBoardType_8723BS(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	/*  Read Bluetooth co-exist and initialize */
 	Hal_EfuseParsePackageType_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index c345b632b..588dada52 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -186,7 +186,6 @@ struct hal_com_data {
 	u8 TypeALNA;
 	u8 TypeAPA;
 	u8 RFEType;
-	u8 BoardType;
 	bool		bLCKInProgress;
 
 	bool		bSwChnl;
-- 
2.43.0

