Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089C73264CF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868660; cv=none; b=l6LR0WBeRnW2YM56JCGGvYtCx/TLS32ZC52MyHMf7DBLZU/9GIAg4fELR+U9IV6x0+24sIpcM5e1oxvqrgazWh8WZDwlVZprJPkJefMLAx3KaZ06HgeGBA4v4lt5DXpR7jysVMbDvMii5wbaqbgoExmcStaIGzt1Uru+bH4eu00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868660; c=relaxed/simple;
	bh=OcFbgctUt+cshWsEOD0Ig053akmnkCLSYsV7LMioBeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T627xC47YweanZFTQnthe4eBJ2zWH1Zbmw1Tlf5FcIOPVxnPr9aw6Y04jPXI3ceWb7YHEISGe3A6RfkXpvrvROZrnb2cA/6/jIg04J6sEhfGy8XhOpPnbC32ANFya+Dw1N/8zjjkkITE61vnhvFrdVXHX6G//lyoc/U1ZzeaO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQjhaiNS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQjhaiNS"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c28fde3bbd2so247673366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788868656; x=1789473456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCjawlCXDNgjFZefRZzRLsSz/pwg4uCa9eWCb+1mx+U=;
        b=QQjhaiNSWwRd+mTHV8yrgjeuAwS7QffuMw0chkreUGLFCdigXiZR85K6vekWm4PFkh
         H+m6B8ehHdLRlvL91A+zt0C+y29Kv90JXEvHI+YWKsOlvHw1jFKZCfr8Dz634Vy3/k5i
         PgaZRrOSA9SINVKPZt73ev3HP+Iq2XjoY8q941o+byxm5ojWsmFfpcN7Fso8k5hFlE2w
         2126QV7LUZqj6W+Maf2OvWYyDn1BOMmVqh/ZlrScV+wcM+YqtYlkrDKO0zSbuPgUlz9s
         Pu26OpPlB7NwIkwVeFZUejsJHi8u58RJf5K6LrfHf/ssHWD8q65MpIdVuj7+jLgcgjod
         b7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868656; x=1789473456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCjawlCXDNgjFZefRZzRLsSz/pwg4uCa9eWCb+1mx+U=;
        b=H87yWLRX7+8nqtf2neZvYeYzdujsf62jOtssQXrqf9LTM3yJIBd8Jo9OjbxMleGnFx
         /ViSc2nRUzC7hhpZpqX3qBdol0yJHPXtV5pozfr6t0tvSKJWz1ZCxYk8bzBDu0W6zt0R
         sNjaXPu3riuoF7RpE/OwLxJXfp4arZmxlS86BLdQ26mVNBqFNAdOs1T1STXj4OdBOteM
         QWozpx9nsuaGzi2Pz4gFLv9hpKtP4zsN5w5J4Uf7p9BSBZwmBLXEc/h5cPpSU9HmLCbY
         jGO+79zw1T+bm/29QC3VRNly0/88+pDh+JAO2m7ZMeygwjp+fXNVJuEdrw4WUSFoccLz
         M3OA==
X-Forwarded-Encrypted: i=1; AKwUvBx9pV8v7fNYlzAWwLfqPMZ+jpY7ugFWbgmsSHqYfpUHKnn9XikE2DhMAAqaU9engcaePesVY+gCau2T1xc=@vger.kernel.org
X-Gm-Message-State: AFuF++nOk0mimg1dYeAwgE/oDD/j8QvRxNYrXiHFYpWsXq5TlQF5XNsa
	pRZXJZvslT/1u9XfyHW7mzbGwKcsiUndbNToD0iZvJWUz6zFH9866EjC
X-Gm-Gg: AYBFou15pfGY0VQn/gf0/LEY5sLN5eo8178m/pw87nklc8DUt3XisweGexPhRXPzIVh
	JG0vuKX8wv2o4NwTVglMJeMWWPgUhhEjehDH0bHrcYCEtIvK+nknDIdVgSzKgzexA1bdJxVsZyE
	Nib2rHfKY5qGuQqmSAMOEJKShLNxtjgg1DBZf/Vb01+DLC6sqXj2uj3yjXRibyD7nFfVgfKHUfK
	9jpDnuiVV1/yaHdnt6U3f8VAuUujIB7Hy4ZY/7vnUMOlvrRcPdTzpgs2oyGuz5+od4vMwIbJlbN
	HHqXTEBpV38kxyWtw66CdP9yNsM7ncEQ/KzOl2wV21BQa7eH9Yf8kS22wc88CktWvNSJxNsgKQh
	wTYkX9t/zkqx4F3anwiovRZA2flyidR2hO27QtgYb6GS15//H8yLXTatHWMtyNQGcAxGT4T15gm
	Ybv/CPLn0ILDkW/K85tCno8n10a3ucGTwDf2lp5bnVN8TyfMEyGhthYctUGcK1rwjghlm6iAwgl
	SuhJQ==
X-Received: by 2002:a17:907:3d56:b0:c25:192:99ee with SMTP id a640c23a62f3a-c260ca22e7dmr1069337866b.19.1788868655931;
        Tue, 08 Sep 2026 04:57:35 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2621d3f5b6sm492763566b.45.2026.09.08.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:57:35 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Remove manual ifname allocation
Date: Tue,  8 Sep 2026 14:56:54 +0300
Message-ID: <20260908115654.3406-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The manual ifname allocation via dev_alloc_name() is redundant because
the networking core handles interface naming automatically during
register_netdev().

Remove the ifname module parameter, the corresponding field from
struct registry_priv, and the rtw_init_netdev_name() callpath.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
Changes in v4:
- Rebased onto latest staging-testing branch.

Changes in v3:
- Added missing changelog.

Changes in v2:
- Removed rtw_init_netdev_name() and the entire manual naming callpath
  instead of hardcoding "wlan%d", as suggested by Greg KH.
---
 drivers/staging/rtl8723bs/include/drv_types.h |  2 --
 .../staging/rtl8723bs/include/osdep_intf.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 27 +++----------------
 3 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 20265770ed77..213051a283d6 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -151,8 +151,6 @@ struct registry_priv {
 
 	u8 enable80211d;
 
-	u8 ifname[16];
-
 	u8 notch_filter;
 
 	/* define for tx power adjust */
diff --git a/drivers/staging/rtl8723bs/include/osdep_intf.h b/drivers/staging/rtl8723bs/include/osdep_intf.h
index 83a25598e962..f1e7a303a286 100644
--- a/drivers/staging/rtl8723bs/include/osdep_intf.h
+++ b/drivers/staging/rtl8723bs/include/osdep_intf.h
@@ -20,7 +20,6 @@ u32 rtw_start_drv_threads(struct adapter *padapter);
 void rtw_stop_drv_threads(struct adapter *padapter);
 void rtw_cancel_all_timer(struct adapter *padapter);
 
-int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname);
 struct net_device *rtw_init_netdev(struct adapter *padapter);
 void rtw_unregister_netdevs(struct dvobj_priv *dvobj);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 361be281593b..7eceded5efca 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -109,10 +109,6 @@ static int rtw_80211d;
 static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
 module_param(rtw_qos_opt_enable, int, 0644);
 
-static char *ifname = "wlan%d";
-module_param(ifname, charp, 0644);
-MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
-
 char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
@@ -254,8 +250,6 @@ static void loadparam(struct adapter *padapter)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -402,18 +396,6 @@ static const struct net_device_ops rtw_netdev_ops = {
 	.ndo_get_stats = rtw_net_get_stats,
 };
 
-int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
-{
-	if (dev_alloc_name(pnetdev, ifname) < 0) {
-		pr_err("dev_alloc_name, fail for %s\n", ifname);
-		return 1;
-	}
-	netif_carrier_off(pnetdev);
-	/* rtw_netif_stop_queue(pnetdev); */
-
-	return 0;
-}
-
 struct net_device *rtw_init_netdev(struct adapter *old_padapter)
 {
 	struct adapter *padapter;
@@ -747,14 +729,12 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-static int _rtw_drv_register_netdev(struct adapter *padapter, char *name)
+static int _rtw_drv_register_netdev(struct adapter *padapter)
 {
 	int ret = _SUCCESS;
 	struct net_device *pnetdev = padapter->pnetdev;
 
-	/* alloc netdev name */
-	if (rtw_init_netdev_name(pnetdev, name))
-		return _FAIL;
+	netif_carrier_off(pnetdev);
 
 	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
 
@@ -779,9 +759,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
 {
 	struct dvobj_priv *dvobj = if1->dvobj;
 	struct adapter *padapter = dvobj->padapters;
-	char *name = if1->registrypriv.ifname;
 
-	return _rtw_drv_register_netdev(padapter, name);
+	return _rtw_drv_register_netdev(padapter);
 }
 
 static int _netdev_open(struct net_device *pnetdev)
-- 
2.47.3

