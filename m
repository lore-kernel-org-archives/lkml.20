Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5C13F412D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184112; cv=none; b=My6lIPxvPsv32JldqJ60LeAj48xh+ruQ1RHMyu4y1kzIOw/S8jof3c+KGwUmBi3i2/Giyc+hHppR1MCPiDRXLjcVBSx3O/CQOuJMyBB+UyALvekRwT4NO+a1Xe9e1U8YA26KUqDbE/z4evliqQkGvP78+7MB5NIBJEHlnn+DMfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184112; c=relaxed/simple;
	bh=TqkNICbwN1x9KaXxiUdyguV19IIY322QyRf1K7BAAlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RXN5zGgcrhVaVWfU/UZx1gO1Thwn6hrIBnh2DIa91op7B5lBOe+HTeK/RLYns7SD+AEST3stdBrY03HLbD+ZIueulU939399ugkGux/5fGvImkxMkIaqaw8pU9kXTOE6ajAxKn4K5o3Ro2s4oe3VtvDRmMOtuPyCDR9Lyh2Cmwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJBlHbe3; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJBlHbe3"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1307441a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790184108; x=1790788908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/02lLjzL2fnwF7OUXeqY5NnoVSsm4L1xbooI6lvkXrQ=;
        b=NJBlHbe3ingbGjGAHyyrcP4+gf2aqyXOg7fRE46zoiEJnbuNoSzPkQqBzt4SV2Z5lz
         Uq4FLSOiGpryQkBkAHwfmV5m0lRNsT+Z8h2hvBVraE+WHj9AaivZP/mcA8EJDnqmfsR5
         UylpjrOxhj08ByV0lXkrnePytutec9uh2DTp685HzxuxNx5xVPB1kHeSZPP9ymRUtZwr
         ue9hQc8icEQXDgjc3Z4EvYOx2KUM1QTQQVs/n0uwrhg1WqaQT8dCmPiT955YSqpT8a4Y
         tIclf02NqIk+jAMgbFSpJSQ+iAH/g+CIePTdTe6BxhtcVk2sjzdpjLu0Zuy5M8bcPLIy
         rM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184108; x=1790788908;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/02lLjzL2fnwF7OUXeqY5NnoVSsm4L1xbooI6lvkXrQ=;
        b=jOB+aUteDrwFp0tZj95RUG+QxQIzTOKeZYGLn1B+RXqgaIdjXbHBy/+HioVx7gQ7s8
         i7ZBZYrQr0B/yCr/USh8tPIV276LHEPbPzGp5c8FXKfzGtyKKYVRikaRmlDanof8QANO
         CfqBocUvE0u2VYevrMhawqlKj6GO92h0MCmwaIIWdm9deyN/kYWw4DRzcqOYT5miJ98P
         JxiHuQPUkTH3wP8h3JJ1acyPGtwbSQkNHDoGDJo+luBLpY2z9ycZtMO3CWAmoyTboJSD
         iM/zmmkwbgtfJhtVST0Zs58JWWsPUef0h3uGCLmEmuzyoSqIqwkdKyq0odfap8guHtFq
         RBHQ==
X-Forwarded-Encrypted: i=1; AKwUvByOSdbPi79yLXZpydWatRkkSzPHUFc5tVwRadUMTDKkPhd32A3Ua1naIo+tNeGIi4ybRq3mjSTbiUTKQz0=@vger.kernel.org
X-Gm-Message-State: AFuF++n6nGQdhdPlWUsrukp/AgJv06ej6kBCNjbIW92g+TeA6yJkBdAt
	wb9tkJkqSzi34jdfvVJvQzIXc7sK/EtYybSd/aWGI82LsMweY9LbwfifrIK25HkB
X-Gm-Gg: AYBFou3yLqSodUIgKv+FJiQudeESy7Xar+6zK+3BM9f4qeDnYrufPLsk1+4tisKeiRL
	ry0oggNGppMpDnTVSF/TnKK6zS5aiSmUaQBsm8JQLTzi2SaLOpSOrRyEcuyoTl8y7fCRZAvGh/A
	Dr/VYUEVgHYaaTeQLxLgtl9ozNYd+3wA1qqxqon/vPISRFXKXLC9nhLupCI+6VhNuhZ4PRSANMM
	ACY3TVObgf4lZTKbdZe5Byd9uXlHSUUIAjqQ/2QNqpgh2BgO8T+mcc3JjwKnnCbtw4PMFlRjQOn
	Vne8wi+TxeCypoOndk0wzuTzkA31BVLyx0xwQbIVbyQNhypYgNV956YRMdHibyNq0uzkGSSW03Y
	wG2rEp0Xw5A5oKwj7iCTmP1FtVaWaQrCw2ZB+GDSiKrQWSusfe+gHdIXP/uVi58aWWoYS/Oh+bI
	NyZIaFuo92qeY4vmJm2/1rDUo+U5k/XtPEOPyyi+23FgD4TEaReq1AnyzPpVr74zEBLWwAYxjfo
	EQYDtRD/15d6RHHQFFRGEaj8XwVm5juXpM=
X-Received: by 2002:a05:6808:1a17:b0:4d6:9412:45c6 with SMTP id 5614622812f47-4d694125b11mr1336790b6e.66.1790184108608;
        Wed, 23 Sep 2026 10:21:48 -0700 (PDT)
Received: from Arch ([201.110.78.131])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c49e720esm2867839b6e.11.2026.09.23.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:21:48 -0700 (PDT)
From: =?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused NDIS association and auth defines
Date: Wed, 23 Sep 2026 11:20:49 -0600
Message-ID: <20260923172049.1644917-1-inakisobera8@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NDIS_802_11_AI_REQFI_*, NDIS_802_11_AI_RESFI_* and
NDIS_802_11_AUTH_REQUEST_* macros are leftovers from the original
NDIS-based vendor driver. None of them is referenced anywhere in the
driver, so drop them.

No functional change intended.

Signed-off-by: Iñaki Sobera Sotomayor <inakisobera8@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 9137057726e..d318c80c3be 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -78,14 +78,6 @@ enum {
 	Ndis802_11_EncrypteionWAPI
 };
 
-#define NDIS_802_11_AI_REQFI_CAPABILITIES      1
-#define NDIS_802_11_AI_REQFI_LISTENINTERVAL    2
-#define NDIS_802_11_AI_REQFI_CURRENTAPADDRESS  4
-
-#define NDIS_802_11_AI_RESFI_CAPABILITIES      1
-#define NDIS_802_11_AI_RESFI_STATUSCODE        2
-#define NDIS_802_11_AI_RESFI_ASSOCIATIONID     4
-
 /*  Key mapping keys require a BSSID */
 
 struct ndis_802_11_wep {
@@ -95,13 +87,6 @@ struct ndis_802_11_wep {
 	u8 key_material[16];/*  variable length depending on above field */
 };
 
-/*  mask for authentication/integrity fields */
-#define NDIS_802_11_AUTH_REQUEST_AUTH_FIELDS        0x0f
-#define NDIS_802_11_AUTH_REQUEST_REAUTH			0x01
-#define NDIS_802_11_AUTH_REQUEST_KEYUPDATE		0x02
-#define NDIS_802_11_AUTH_REQUEST_PAIRWISE_ERROR		0x06
-#define NDIS_802_11_AUTH_REQUEST_GROUP_ERROR		0x0E
-
 /*  MIC check time, 60 seconds. */
 #define MIC_CHECK_TIME	60000000
 
-- 
2.55.0

