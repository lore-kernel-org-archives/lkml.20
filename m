Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398B6357CF3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141972; cv=none; b=HubSxtCzJGzD8jIO3v8G1ES7j3Bx/z3FMUUc/+ZC3caByPj3hHkatO5zC+K5jgBwy8CpP/zHMKq1EoxbD1MAax8l1fhWL96AUXSf9oaEA0M1eF9Yx4VQ3EQx8Fm8fNxM8N1O278bUljFNORp+kaZY/CuPBLxoqaj3xyW8oFER/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141972; c=relaxed/simple;
	bh=VpXWm5ulIHFlOpRF0JdshgXcoSIZ3g3Xr07omjN/dro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLcjmN2ix2aKv+q7F9qnYGBE78iDbV5QBH7u2m7WwoD9IjzreAaw6KaHn29okKFTHNGDRhbUCdpMwtKMsGXjS/XM0qlIIj6NPRsoQoHCyy9VL5KYX1YqoKnzAI2Pkhm6nnapgxgPSVgIeEFXS2tcz+KaDPmbWTPINO9C0A6ZJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObBHAYXx; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObBHAYXx"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1561739241.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788141970; x=1788746770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ez4tXk3+nHtH64QDv7vPUDcEC3LRkEzDgfB6M+1BVNI=;
        b=ObBHAYXx1hy5LA5mfxlLRlLGfAgduWs1vRU8yPdhK9H4G2o1Z4CKGpaVH7TOa0elRd
         304gjXxYWlRojRmV7z765crVXaCZOI/x4xpL5OUp61xNqOeDCgAKi6I+dkuc1xO7x5vJ
         03Wr09YrmaEMDIAiElfmkqxJ9IEvWBkZUvtBMSq0go/QlXwB3rUOLuqK+pn9sKRS03j5
         EkRfdjaZlXYWixA4HcGJ7HcdnKYU5mbzbR1dh+gRtnP2XYiN9Q7aBGy2hLiAC159Opsv
         q7xL6X2bSGGSefaEhbcvYbOEUjwVwPCafqrNHNFJXx2NaZ+Eo2e3c6xlVEpzODu94vzc
         Z3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141970; x=1788746770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ez4tXk3+nHtH64QDv7vPUDcEC3LRkEzDgfB6M+1BVNI=;
        b=kstC9Mlwaa4zY7fj+2pe/QAE1SjHXjxTQLDYF89hTpmu18bFF5Dyk4j1MCSm9gU1Y6
         s2UksDFBFgVreO9E0oWfS+Tjm9lgoEgpE8kjAkkixXxTaorEISE5aPOgDU/sB2Ck269T
         d4cHiJe5b+xJO7U7DgCCL2vzgU4fsWUt9DwxgDNlHp5M5cmcPWNgRoq1FFtwJnRdUEwJ
         rjuP3pjRGMryY0pohRexg/IvPoeKo6RR87VqecFemtMzrkddClTOL+SDiXxJwQkoPaYo
         JSvbexJprYadS3wKk3C0WJyYhoF2V4r3mh1Xdx8zhGvpz+wxKO5NeVRtoq5n4UQBj9kc
         zIhw==
X-Forwarded-Encrypted: i=1; AHgh+RpvdSjWHSyFQAQMtZMSrQqw2PS41EgGrx7dpohkBNklowXdquEeyC/7UUsvZ0ozNR5OzXL3koTMzYRblJI=@vger.kernel.org
X-Gm-Message-State: AFuF++mKkhjxQzXawnd8en59dQcM6FQrr9VYmYue1ChdFaKlx4xXMtRf
	OSEspWPwWdt6YOBHVzZFlajbYD+8613PkxHNVPxrw8UT2b/7V4I22pOT
X-Gm-Gg: AR+sD10U0Ew0Wp2PkNiG5JW75Kb+jhyMLk2/j2xsHt7gs8bxUrjNapiPHelb+dviVMo
	LMuu+10H56Nc+f3ODZoPfCJ9kW3gS56tgHnnK/3vw1RDH++URmUh4P1s/lwgp+PwdZMrPAGSNtH
	tDD2UqbUITC1wzpaevt0qTdZuRAxTtEGq3uoPyWZdjb8MtnOPeyFWP7YEJWN+2jUzJNQqqb0ZKv
	Kn1+4vdhKyveNDtcYIwQ2oTrrHv15/4+y3w9Bs+wUm2jp+3FUJG+syvmwYMDBQ5Bmsc1lpYaIEt
	rAr8lxn82C26ja4p1llwz/42XggdnT1HY4e+7B9QfNRqXY4oFYpNegkcGOPkf7c7s4xHb7Z1796
	OwExKKw8SWRllvAndc37tWM0AANKvihZ/0y6NfqOR4M6qtAmynvrfjEbWDSY4sY94Ad0hZTKD5H
	6YEYdD0WZJF1lfj42sP2/RLIkwTbCvYpNWkeieM1ds022cbyb21uL2
X-Received: by 2002:a05:6102:374a:b0:786:fb19:d5d6 with SMTP id ada2fe7eead31-789ef5a42a0mr311983137.1.1788141969977;
        Sun, 30 Aug 2026 19:06:09 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aafcsm5875214137.1.2026.08.30.19.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:06:09 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove dead beamforming code
Date: Sun, 30 Aug 2026 22:05:56 -0400
Message-ID: <20260831020557.1235504-2-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260831020557.1235504-1-adrianox@gmail.com>
References: <20260831020557.1235504-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The beamforming declarations are guarded by

        #if (BEAMFORMING_SUPPORT == 1)

but BEAMFORMING_SUPPORT is defined to 0, so they are never compiled.
The types they use (RT_BEAMFORMING_INFO, BEAMFORMING_CAP, PMGNT_INFO)
are not defined anywhere either. Remove the dead declarations and the
now unused macro.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h         | 8 --------
 drivers/staging/rtl8723bs/hal/odm_precomp.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index a20b48660e..d29eaba41d 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -936,10 +936,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	struct timer_list FastAntTrainingTimer;
 
 	/*  ODM relative workitem. */
-
-	#if (BEAMFORMING_SUPPORT == 1)
-	RT_BEAMFORMING_INFO BeamformingInfo;
-	#endif
 };
 
 enum ODM_BB_Config_Type {
@@ -1068,10 +1064,6 @@ u32 ODM_Get_Rate_Bitmap(
 	u8 rssi_level
 );
 
-#if (BEAMFORMING_SUPPORT == 1)
-BEAMFORMING_CAP Beamforming_GetEntryBeamCapByMacId(PMGNT_INFO pMgntInfo, u8 MacId);
-#endif
-
 void odm_TXPowerTrackingInit(struct dm_odm_t *pDM_Odm);
 
 void ODM_DMInit(struct dm_odm_t *pDM_Odm);
diff --git a/drivers/staging/rtl8723bs/hal/odm_precomp.h b/drivers/staging/rtl8723bs/hal/odm_precomp.h
index 2987857a87..d4390fd203 100644
--- a/drivers/staging/rtl8723bs/hal/odm_precomp.h
+++ b/drivers/staging/rtl8723bs/hal/odm_precomp.h
@@ -19,7 +19,6 @@
 	/* include <drv_types.h> */
 	/* include <rtw_byteorder.h> */
 	/* include <hal_intf.h> */
-#define BEAMFORMING_SUPPORT 0
 
 /* 2 Hardware Parameter Files */
 
-- 
2.51.0

