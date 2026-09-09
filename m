Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C67D3976A4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990987; cv=none; b=rII9W84Z783oBLpLa0C5hZCQRcNnbbIjwEJ/3ZSGaxVtREanx9FBHSe2OiPXTkuHTNOpcpoVv/BJzHfXV+BT4Q1u2juHqoDUaZqzSn7z9oQyHQAr/rubmlYDcc7ZXbmUOoddcz0LPQuOPlpQ39d2kdzfNmbhTgREUty+rSremrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990987; c=relaxed/simple;
	bh=S9xRZ/7yngBdBHR/K/t6g824mEWNRk2libWaXsTUnrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUEzOY6TCTgpuu7TbSqnLoWXXofVA1H96rpmpCc08rMb+1rLjauQZ7RM/Fg4CY7ArNZTSDDEJtvgeKs38M/ft+4UzTWBfCx+sxLJYcBYdr816lA7MNhx+XOR9M6aKxGvXdy4prM1bu4NcFnIJ+h3bYGmA+fq2xjTmjEbKWEUKJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVtV5j8U; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVtV5j8U"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db18e5cb56so63832385ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788990981; x=1789595781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=20cqJYQWVs9k9eXVphEma8zLTYH1lgYyH7XvrGtAYAg=;
        b=hVtV5j8UkSu4r4QldODu8etCGaW+3vcM2BWAr6tX8NqtbeNt3+i3w+RwJh6ArT8KDh
         GTlIB8lEG6DGXWIFDh4o9w+zLn9MRE13qPb0yAfJ6JuC/VUEJRpfIgnCICgtpTNH7y+b
         XMfFZo6Ae4q22AhTxaFHzLruZ7j1nlljPb1Kg2CMDDuA6ngNTJg+rFxzLrwNbHjxt5ht
         pR281V2GMZyKqSOicv1Ppd7v057rLZYBZp6jx2a5l4aKfzqXq+w1IQQ0tYfYduMnAWMn
         m6gFkNlVcDckKqfDyr2li0mMWbpsvPu1cXK7Z4FMHcXhSSD+SwrS3XZ+Iqzb9eA8rmUE
         vM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990981; x=1789595781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20cqJYQWVs9k9eXVphEma8zLTYH1lgYyH7XvrGtAYAg=;
        b=j0H2TSR0dGe0+B0qZSxP//if4c5yCvAweKWPFcffiosdG3KYiatJzEfj2CXPi+DQQs
         /MfaaGMXI6H+//pgGMH7UO2DBbp84mfNNt0gM7z13UQbaEQzczH7FMUKnN5KU2a9+hUg
         mNfRuwNbk4nyK3U5xka9YaGOWswP5QgaCrWqR4i0jTLuFWUu7o8dNdKCFkEe81aGXKLG
         pabFPrd6zdjhfJ7fIgd9f7RZSJ0+QgWI9ZKmR8K/W5f74kuoitJAWPA1iLfroKPddDJN
         U0NBusjrVz+pCOq4c/sS4NrpRrUJ7f58/0YKL7aJVkxdULTTzLX6Cl2+l0NUlQgcLXLp
         tFbw==
X-Forwarded-Encrypted: i=1; AKwUvBzvNMcNmmxqWcasTcZHDik4vQL33zNPh1hEfuaJyyHmNC3w+KKk5WIV/qVvbordSQ/UesB16B5LToGjyjg=@vger.kernel.org
X-Gm-Message-State: AFuF++nk7gApzbMvVcKcLByt9tr2BcMgesRBTyIc0vb6t0qp5SZV17KQ
	xTHv7d7CE2YiTCD6B3zSaAHtACK+RFKGJhjhfCxQ4HN7Rc3P4mT4G1IP
X-Gm-Gg: AYBFou0b6kehMl6NIXI4dUOHwurEDM/j7FJXoLBQO2piSFZJ+0P7vtX8R5rf9d3q/4j
	mv/wEN6tX9hsLZIHSLhvyTNnPa7dg+R3xWSqhAP6Y0v3PiSrcRJiSaGhrTzwvUVFFgnpW8W2BPt
	ZsI302XvjhT/LX/FxKv0kyJy4b9y32M2ADE8A9S7XpW03+jMA0AXRPDk9ZtrQwY8amJRsgCwuII
	AvT5tc/dTD/scvv89arBBrRSNpj8T4iKNR+P6jOpodt0wabTWVOV591LT2Uyqpna4ijvSdbuGDk
	1DSkhhffUvB7hZsRs+yZsmSHaqUfNEXtX7ZdmWj1j+KDnwa94nfR/4W0wd9jyFNUfkkGQ/HTANf
	tOer5e4Q7b6wBAMhbsrJO94goeqln9Sj2vxeHllJQqIi6FF+0BCf+k1G24sUnZh6JuKGnL4Q0mR
	96Xlkl0f3zUY/szFM30y2X04s6g1ACq7JXm9JfFwU9+nVlUC3UIFJoiEgBxFoL7nMG
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr57003505a91.10.1788990980635;
        Wed, 09 Sep 2026 14:56:20 -0700 (PDT)
Received: from frese.. ([189.60.169.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm15478156eec.29.2026.09.09.14.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:56:20 -0700 (PDT)
From: Enzo Frese <freseenzo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: m.steinmoetzger@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Frese <freseenzo@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix checkpatch style issues in odm_DynamicBBPowerSaving.c
Date: Wed,  9 Sep 2026 18:56:08 -0300
Message-ID: <20260909215608.117443-1-freseenzo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several checkpatch.pl style warnings in
odm_DynamicBBPowerSaving.c:

- remove unnecessary blank line after opening brace
- add missing spaces around '&' and '>>' operators
- add braces on all arms of if/else statements
- remove trailing whitespace

CamelCase naming issues are left untouched, as renaming
these identifiers would require wider refactoring across
the driver, as already noted in the driver's TODO file.

Signed-off-by: Enzo Frese <freseenzo@gmail.com>
---
 .../rtl8723bs/hal/odm_DynamicBBPowerSaving.c  | 36 +++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index ba6357c6a7ed..ed743f6678dc 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -33,11 +33,10 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 	}
 
 	if (pDM_PSTable->initialize == 0) {
-
-		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord)&0x1CC000)>>14;
-		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord)&BIT(3))>>3;
-		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord)&0xFF000000)>>24;
-		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord)&0xF000)>>12;
+		pDM_PSTable->Reg874 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x874, bMaskDWord) & 0x1CC000) >> 14;
+		pDM_PSTable->RegC70 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xc70, bMaskDWord) & BIT(3)) >> 3;
+		pDM_PSTable->Reg85C = (PHY_QueryBBReg(pDM_Odm->Adapter, 0x85c, bMaskDWord) & 0xFF000000) >> 24;
+		pDM_PSTable->RegA74 = (PHY_QueryBBReg(pDM_Odm->Adapter, 0xa74, bMaskDWord) & 0xF000) >> 12;
 		/* Reg818 = PHY_QueryBBReg(padapter, 0x818, bMaskDWord); */
 		pDM_PSTable->initialize = 1;
 	}
@@ -55,20 +54,29 @@ void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 				else
 					pDM_PSTable->CurRFState = RF_Save;
 			}
-		} else
+		} else {
 			pDM_PSTable->CurRFState = RF_MAX;
-	} else
+		}
+	} else {
 		pDM_PSTable->CurRFState = RF_Normal;
+	}
 
 	if (pDM_PSTable->PreRFState != pDM_PSTable->CurRFState) {
 		if (pDM_PSTable->CurRFState == RF_Save) {
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1C0000, 0x2); /* Reg874[20:18]=3'b010 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), 0); /* RegC70[3]= 1'b0 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, 0x63); /* Reg85C[31:24]= 0x63 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0xC000, 0x2); /* Reg874[15:14]=2'b10 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, 0x3); /* RegA75[7:4]= 0x3 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0); /* Reg818[28]= 1'b0 */
-			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x1); /* Reg818[28]= 1'b1 */
+			/* Reg874[20:18]=3'b010 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1C0000, 0x2);
+			/* RegC70[3]= 1'b0 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), 0);
+			/* Reg85C[31:24]= 0x63 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x85c, 0xFF000000, 0x63);
+			/* Reg874[15:14]=2'b10 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0xC000, 0x2);
+			/* RegA75[7:4]= 0x3 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0xa74, 0xF000, 0x3);
+			/* Reg818[28]= 1'b0 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x0);
+			/* Reg818[28]= 1'b1 */
+			PHY_SetBBReg(pDM_Odm->Adapter, 0x818, BIT(28), 0x1);
 		} else {
 			PHY_SetBBReg(pDM_Odm->Adapter, 0x874, 0x1CC000, pDM_PSTable->Reg874);
 			PHY_SetBBReg(pDM_Odm->Adapter, 0xc70, BIT(3), pDM_PSTable->RegC70);
-- 
2.43.0

