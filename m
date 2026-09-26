Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B739431E85B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442081; cv=none; b=pPjcVnhWcDOBROLcITjjGzq9GZYtnMjn9+MfykbP0E/CJkPrey/Xq/ZFy4YBQwAzi8tks7M4W7stTPRkYAG70ol3E8s2Zrz82kGdYmLl+PbkbbtMP9fCWm+PJQtzXRWnF9+Z5m6nHMxh0SeFIWdOZPYLJckYmWvH0RqEznlA+K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442081; c=relaxed/simple;
	bh=6Gqyybi5f1+/rOaFiBrAjuOWPKQM/C9FIcvNqzTZ//I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GuM9CAU4T9Utcawib/Utq6KcZoV9rDIv5PfuwLVL2ceNG9Xsn1JaZbpezpzQK5899JQrsPwYeubX0lgqUKrvyULQTBniN1trZdy/iPgw7cCch0QphdV1R8yhs9XkdbwOuZ1TRCEXDCvBs4M++gyEdopahNEIeagkr9Xc8OZwxGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhtLw7vn; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhtLw7vn"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4e0bso1419397e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442078; x=1791046878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2LtHAaylmzUwvtZGxdyjvEKCHez6qvwObhUlbLkE8c=;
        b=LhtLw7vnZ2npI/6Zvogg9urYDlWZIpdBbLt384YOZYGF85/0KBj5D3LRDL/D0Hm91A
         X5n7uyLTUhTIv5tEtNV/RLwcvPU2m1girxdJ3csRYOePq6fp7PHStr0GhrqS9EI6fd9t
         feRgabiJPczv5aAE9ItrT5yswFPz8IJUF3qog68iNMaMJqxSJPxz+c2ksgL6h2dHfTAU
         UP0r9RW+lAaLVdEECObHv33y7gNv7EMZD/ViTUGvytLcLMh+grLeL6/yHP7Elk38JaEk
         WkVZ9viTyrSnsammuH7EfQ7AHvv/2NzbrCjWhPz00O4OkNz4syr4uKFyAH/ke5Rr6mXv
         CQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442078; x=1791046878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2LtHAaylmzUwvtZGxdyjvEKCHez6qvwObhUlbLkE8c=;
        b=FxC3t/5qv/xm7JxsFBviRyDCM6L9IThff9HilEpviB2KvXsWqOUjQS904WIqJsDQb4
         ButabUDD8LJ8J/EZ34Gi3VBn/8LtMKHNXmNM1fCPo48VPzwvJftF5R11fGms/JTmBdDo
         JzKhsE1IAklAC6CHzis2MQzd5Wx8G0ayA/2kIbssSLAoI6ePmMnUXZuJpQL93Ue1+okF
         0zKFuAoRZ6pxsvYDBK6GSUq0Ei1Mzz5vU7JRZfaOke5J/wb5a55E/oojRP9/XkcJrQK1
         7ySFLNbTAgd745Sg5Fr1jI06wv930Bsig+cZPtItY2T2N1aaf/zuvp+4VBi5ecE4qxwH
         jj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwqososfStDtPCFzab2+2NorZXtYzlUxcC0ORZekdlOdY2GQR8G7Xjtw3s/5j0uAphuw/FPHr0t4Gdv3mg=@vger.kernel.org
X-Gm-Message-State: AFuF++nx1JDKzeok/PwKeYN/spdgU17e3Pbv1BwM19F/DAmI+QZ45Gdb
	bY7p6gyRndYilR2ffzAAq/tMYRBv+NWChJ41KrWi2hG39bsoUH+VzZ2m2uyBcc3VfLKbYQ==
X-Gm-Gg: AYBFou2v6Zwmarjeow8wauQymBiUD4jGUtzUVJEkWaoQ3MJLGifR3vg0zonB227WO5z
	/lU6rLVT7jaeC2SFCjAdYdPK1cpWUnCOWpw+cbD9MaxHwqGJwq3lDdsUXCnQaP2BzrnQ5hRn+b4
	Yn4c6tucKOvaQioElWxursN0QOJeYvES6kug+wQ7Omj9QhclYTf4x0yAiEYYzUjCu3nnCNXPTQI
	PFD7t1AWgaL9ulX3YcZyNovzLzyKDZaW9dtTkj+xu9ILLwuuFCpT3sWBLyHPYH6TUvMdBkrceiF
	9rSOQ7qBju4gm5TYnet6MSLmQaD6GbjbxfInjol1uy0I1RHjj3G194swI+7iSvEarZ/n/PlJ2g8
	foEeQFZ/fdpE4XNtqE0UnvmeELeUXHbLPm+OqtltRfF+DJq06IiqncD2bRubVow8qE9lC6l96it
	ubsCnmDm5jUBsUnV4IBSx3x7S14snasfHI5cmWO1oN5qu7J8YIzqfPT0rrCTzHLDfBXWisKOhIu
	EBiNNqE4piJNiH6tGr7m6wtKAIrF1k4FGjO/YGe5a+ffsCznhg=
X-Received: by 2002:a05:6512:3f22:b0:5b8:f4d4:7fe1 with SMTP id 2adb3069b0e04-5b8f4d480admr35233e87.35.1790442077440;
        Sat, 26 Sep 2026 10:01:17 -0700 (PDT)
Received: from Hedgehog.. (broadband-188-32-185-163.ip.moscow.rt.ru. [188.32.185.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e836df4bsm1235398e87.72.2026.09.26.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:01:15 -0700 (PDT)
From: Artem Shelenko <artem.shelenko@gmail.com>
X-Google-Original-From: Artem Shelenko <Artem.Shelenko@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: use standard error returns in HAL interface
Date: Sat, 26 Sep 2026 20:00:49 +0300
Message-ID: <20260926170049.315302-1-Artem.Shelenko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arfBy_n6FsDI39p-@stanley.mountain>
References: <arfBy_n6FsDI39p-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_hal_init() and rtw_hal_deinit() return vendor-style status values,
with one indicating success and zero indicating failure. Convert both
interfaces to return int with zero on success and -EIO on failure. The
lower HAL functions retain their legacy status contract and do not
provide a more specific error code at this boundary.

Update the init callers to check the new return convention. Propagate
HAL errors through _netdev_open(), while preserving its existing -1
return for failure of the unrelated rtw_start_drv_threads() API. Keep
the _SUCCESS/_FAIL contract of ips_netdrv_open() for its IPS callers.

Preserve the hw_init_completed transitions, including clearing the
flag only after a successful lower-layer deinitialization. The lower
deinit function currently always reports success; this change does
not add detection of hardware teardown failures.

Suggested-by: Dan Carpenter <error27@gmail.com>
Assisted-by: LLM
Signed-off-by: Artem Shelenko <Artem.Shelenko@gmail.com>
---

Notes:
    Changes in v2:
    - Replace the type-only cleanup with standard 0/-errno HAL return values as suggested by Dan Carpenter.
    - Update init callers for the new convention and propagate the HAL error through _netdev_open().
    - Preserve the existing IPS and rtw_start_drv_threads() return conventions.

 drivers/staging/rtl8723bs/hal/hal_intf.c     | 14 ++++++++------
 drivers/staging/rtl8723bs/include/hal_intf.h |  4 ++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 17 ++++++++---------
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1..870cfaf1d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -4,6 +4,8 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include <linux/errno.h>
+
 #include <drv_types.h>
 #include <hal_data.h>
 
@@ -27,9 +29,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+int rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -51,12 +53,12 @@ uint rtw_hal_init(struct adapter *padapter)
 		dvobj->padapters->hw_init_completed = false;
 	}
 
-	return status;
+	return status == _SUCCESS ? 0 : -EIO;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+int rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
@@ -66,7 +68,7 @@ uint rtw_hal_deinit(struct adapter *padapter)
 		padapter->hw_init_completed = false;
 	}
 
-	return status;
+	return status == _SUCCESS ? 0 : -EIO;
 }
 
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val)
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b6311652..77aed5939 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+int rtw_hal_init(struct adapter *padapter);
+int rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee2..691dc248a 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -786,7 +786,7 @@ int rtw_drv_register_netdev(struct adapter *if1)
 
 static int _netdev_open(struct net_device *pnetdev)
 {
-	unsigned int status;
+	int ret;
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
 
@@ -802,13 +802,14 @@ static int _netdev_open(struct net_device *pnetdev)
 		padapter->bSurpriseRemoved = false;
 		padapter->bCardDisableWOHSM = false;
 
-		status = rtw_hal_init(padapter);
-		if (status == _FAIL)
+		ret = rtw_hal_init(padapter);
+		if (ret)
 			goto netdev_open_error;
 
-		status = rtw_start_drv_threads(padapter);
-		if (status == _FAIL)
+		if (rtw_start_drv_threads(padapter) == _FAIL) {
+			ret = -1;
 			goto netdev_open_error;
+		}
 
 		if (padapter->intf_start)
 			padapter->intf_start(padapter);
@@ -838,7 +839,7 @@ static int _netdev_open(struct net_device *pnetdev)
 	netif_carrier_off(pnetdev);
 	rtw_netif_stop_queue(pnetdev);
 
-	return (-1);
+	return ret;
 }
 
 int netdev_open(struct net_device *pnetdev)
@@ -861,7 +862,6 @@ int netdev_open(struct net_device *pnetdev)
 
 static int  ips_netdrv_open(struct adapter *padapter)
 {
-	int status = _SUCCESS;
 	/* struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter); */
 
 	padapter->net_closed = false;
@@ -870,8 +870,7 @@ static int  ips_netdrv_open(struct adapter *padapter)
 	padapter->bCardDisableWOHSM = false;
 	/* padapter->bup = true; */
 
-	status = rtw_hal_init(padapter);
-	if (status == _FAIL)
+	if (rtw_hal_init(padapter))
 		goto netdev_open_error;
 
 	if (padapter->intf_start)

base-commit: 8444548bd905f22093729065408284a6b46f7eee
-- 
2.43.0

