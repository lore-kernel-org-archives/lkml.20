Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9E94C6F04
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791390096; cv=none; b=j+8D+tdahraQukgyOWACJHoPxWiGJTY9LHnhM8ZrBnSqncvykddv9OVG1fFC27W8PxheKsVidfgkdVNKwMawlKjDGNtHDGBR5oUE9KtXRukR3M9hv5uqR8SE5wi3AMch+7hSInrLGsF9pu/xFNpqNeM1lSkZ2CjoUKpviS6dUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791390096; c=relaxed/simple;
	bh=7mBQ+M21pg/s7FUBUJABkwqMBXpUBGxS76YpBsfUmTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0yjJh/SaUdWwDA+0Ow8kSFuiaq3HayJrDkBIiqWNBi8XcdMEEm8Py6REFGMG7Z+9EIfPTDDImx2O0u8ZAdaZEcvKFMxzcEQ0/L2SnRJni9UvspqdMDgm9Ag42twfa4hd6SFm0xPJ/z41+RJiRFr8hnUcvkGJ72VMr2NlazRzRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/N8zQ+6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/N8zQ+6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso1557127b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791390088; x=1791994888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MhTcO+HadmDwh+8PVqnj5w9psrS4b4QuUSACQe5q+Y4=;
        b=T/N8zQ+6duM7MqzDxQkoQJiozoFtnHgyCSAPiCJb/oEfORBHoLQ/IlgYlVGex490hm
         EvhrVDSou4WlFG8ehlIUnbKgv42FF5hz3zU4nr4JEIiMtAik1hC/45EIwAPW/Q3MT6Np
         J0ulbZ4u3d1BO2lWwr/S5947lJf+rh/aKOrM1IZlCoE2APKl0kZ21ouNO0/jC8ZxtAmC
         jkqBfAbZ5VDfKClnTrd6YT7ijoQOCypyYBYWkJbibidcZYwyT+4BXkwNBztbUGtWJkBT
         ozBVrRLLmclfB6B/Oaxi7nZ0HocqRZOZc7/GGRzqSOJQA972Nq1mNFCx3o/jvh9wHAMj
         N+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791390088; x=1791994888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MhTcO+HadmDwh+8PVqnj5w9psrS4b4QuUSACQe5q+Y4=;
        b=WLDgOegNgYjkrt1M6SVyV8P3992LXWKrAbcS/zTvgsctql42iQpr3MSwom3X1jMMsz
         R/V348dbpRbMlHeyDpt9WDC2povqRUgycLhWFNAPBwhCj5riso40aAKgYTwcW+ncUg79
         L1D41efQMDGyOtk+gXWaGkvjRvK4dclveK0qd8Ba2x0vGNp1cIPMg2XV0DOi0DGsghMi
         moNjvGOG2F3fGS+QGzAAxzq1NEQ9/OyLDB3uIml9jE+364tVUaiYuxErKDCuV70W/2ki
         KyzdEdaLBaz7CAtShQFoYmS6WHuhtTbqifGLKfy8jcNKWpBXV82nvPtupmHod5nDCuS9
         er7g==
X-Forwarded-Encrypted: i=1; AKwUvBzFmbh5NZgW4BpecK1bDtpjpCx5kfAQ/z+l6ueRoPmfKekBGp45AcmHo2cx8A3zqMgxR05WWhnORJo/xP0=@vger.kernel.org
X-Gm-Message-State: AFuF++lKOzU41bhTevkcRqPzxlbGwUnVwlqHLX+Gzk+jW9mhJlaPUG6d
	mroB5ACpo+NCJJ29aqeMc7DLZK8R9jo5MV/Pa5PfNHZN8I2iytPMYDiQ3cIrx04MlSA=
X-Gm-Gg: AYBFou32SxvkcbBUKPqvhWhtmDrC6R5rDsVyeMM+fkPpGO+kTNW6fnZsKIQRqcoKeUJ
	2NQPEM1j9IqEq0mOfm7lx+xK11WTuLeI34Go2hN5h4/ZwaIn7xfAEepVTYrDunxM6YqQW2QJusf
	aonqTNJGvpm4oXbXRUj+RWqQffpHh5mEDIBSNbdu9vMz2Wm6W4x5MH5ReWGAdJddAA0+g2pOm9k
	w7QL3byb4xMQAurkxyC327JI461476mwfRt2PhuVmkCbkgnu+ymVMditUApFl97bU278BysvWPe
	62//3eWXnSG2HPCoPUCmXEcVL4DI51DXfyxxHENawDNFhET+RE9QaKEY7lUNM632uPFLJyAq6Je
	l3AR6rim9TrcocUuGtoGltqkWHVaOQMKSiwQdr5eaglP5qOLPQgZ5e4sHZTXN4wxp6Lk9duYa1E
	WhA8UpOCu5BS3xS8fQEINgGQq0gmQ6ivv0jhlNVbgMjfEH1FYCOE4wXcsICeDXvsdoDZV8cCiid
	+T/IJ8y34iNQcsEyWs6RU9uuCm5pZYFhRTcCY5FtfkWgUykNq1WIMToMMc=
X-Received: by 2002:a05:6a00:3305:b0:880:78ca:8400 with SMTP id d2e1a72fcca58-891b422319emr2578114b3a.12.1791390088090;
        Wed, 07 Oct 2026 09:21:28 -0700 (PDT)
Received: from sohail.tailed9083.ts.net ([2401:4900:88f5:ab57:554a:e32:de11:5b00])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bba97a22sm592690b3a.49.2026.10.07.09.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:21:27 -0700 (PDT)
From: Mohammed Sohail <mohd.sohail.biz@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Sohail <mohd.sohail.biz@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove comparisons to true/false in rtw_mlme_ext.c
Date: Wed,  7 Oct 2026 21:51:14 +0530
Message-ID: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch reports "Using comparison to true/false is error prone"
in rtw_mlme_ext.c. Replace "x == true" with "x" and "x == false"
with "!x".

bwmode_updated and bxmitok are u8, but they are only ever assigned
true or false, so this does not change behavior.

Signed-off-by: Mohammed Sohail <mohd.sohail.biz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 80194796a9f7..511eccf5b5a3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3457,7 +3457,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	if ((pmlmepriv->num_FortyMHzIntolerant == 0) || (pmlmepriv->num_sta_no_ht == 0))
 		return;
 
-	if (true == pmlmeinfo->bwmode_updated)
+	if (pmlmeinfo->bwmode_updated)
 		return;
 
 	category = RTW_WLAN_CATEGORY_PUBLIC;
@@ -3625,7 +3625,7 @@ unsigned int send_beacon(struct adapter *padapter)
 			 !padapter->bSurpriseRemoved &&
 			 !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
+	} while (!bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
 		 !padapter->driver_stopped);
 
 	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
@@ -3868,7 +3868,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	bssid->configuration.atim_window = 0;
 
 	/* 20/40 BSS Coexistence check */
-	if ((pregistrypriv->wifi_spec == 1) && (false == pmlmeinfo->bwmode_updated)) {
+	if ((pregistrypriv->wifi_spec == 1) && (!pmlmeinfo->bwmode_updated)) {
 		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - ie_offset);
-- 
2.55.0

