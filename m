Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208A459AD9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346248; cv=none; b=UszSpIBtTGPEOUdAjXhet54WaAxu/8+s0E26Q53Aht1XfOChEnaRBpfrfboYBGz4BNBZGmzbDzgS2vaJ/9U82+tEp5jDzPY38qtE3b5/VxXz7vOKcysPnj9jCH4crVODR1r+Dqjeetucu2G/ioJurhEHv0Dg1l8YRqWKzGWZxFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346248; c=relaxed/simple;
	bh=ZxEquSdvMJ5TmfPHIN8OB0dU1KBTdTDdQ7zJgo/dhQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PLJzIIn8+uLnxdxVGAfhK23bxTJ1akJFUGJL31BiNFo9fJQFtQXnp2OMl+9Rq4bsEuXer7l9TN3Tj4Ag5YrzmO/RQ92KvOmHPjuzzhkgDLz65KbUbl4BJvBCDA7djDsaufLUAbtjx+yQ0USpenGS25Ef8JDVdqZkiG7MGs00XVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSJhhSfJ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSJhhSfJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e18f0439so797577e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788346239; x=1788951039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+g1NrKRhGje+cs82CHJjhNsBsnUMQa7j9gBCYll4968=;
        b=nSJhhSfJB3YHxXps4g7xvEvOy6y3j2YY9G3HC2JbikF2yuzxY19AJMW5NbNfr8YZB5
         MPiqLgxjFygd0CU8E8QcLctj3vlNmkMbViVtVdXXBxY2EKDMSuIsh9mHhUC+fiUww+gH
         iUbS0E2R0YzazNSGsoWfkCd+dCn5j6R06QUkB0PRmFzdIlKa6F+6hCDdYYigmXZ9h3TA
         cU2Vsu/lWJjfdrBo7qChldb/zXnTsgLwL7tCy4fB60eKNizVfDj+3QqN4yP+9Mw9pvpc
         Q7vOWSEOYfsPUocD7JyU5AnH551QqP0wbnooeWKg2V0F5oGeJmXoE8GhA/hq8PDYx8qR
         q0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346239; x=1788951039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+g1NrKRhGje+cs82CHJjhNsBsnUMQa7j9gBCYll4968=;
        b=XtaLC0F4MuvqiEf7Kd65AVXMUwWIyaJTyDXioU4t4JtoY+P5q0/XLzRhbwLcOo3btO
         LYKGe03fBY4IFfgPYg2hJ8onyTZDfFRrawb9Y7FqRro8E4g5ms7g7mNI+FA2ccBnF7xX
         GO2R7UA2y2zYIal5Ff//w70423oWhDRD5k/OXuq+QN74WRFWHrh2gYSjUAjpgCguZCoO
         qPVtZBXbAsCdcOg8rJIkkYeOsYJhGEPBxta37iOfGcO8l/N48+7BrwJFM34GCpK/VMBG
         JZPriAKEY3IewQ1hVyu+SB0kEDZcKlXFuydobr0AWZHjfhuQlxTJHLvJtm7cbXlhAs9L
         H0tg==
X-Forwarded-Encrypted: i=1; AKwUvBwnI2aiIeiNvc+MRZL09jLqmFjxtZdfMlabhEzxOnUp3EsVCGjV/BIkhGUkPR43wCtdMn9H69LIYc0WC+A=@vger.kernel.org
X-Gm-Message-State: AFuF++ka+FrJ/oVaxVxiH2wdMfuZ4i424tVJvYyz0NXJpV6/R6cHUkFa
	C781s+1Dw6kz+paqHW2oSfLz2yWa5UxFEVlXZPfpF6vlI2JCHjfunb7a+paorN/U
X-Gm-Gg: AYBFou1eizqDNZZZpEBk80ycu/3iCPwNG6aS0e/Jf89MOGeRmGVZR063DRvo1oMfeO/
	6k6eKGpBQh7KJ2XYALefi92j56jM+Vaozr6kdSUqBNj2prMWHlxdGoa/mJg/gYGIZYhjQ47U9yn
	3IGMpdqqaDKNXmhGqrfjYVH2Klxra7P3zpXxP8JAhOeaQrF0DEVTO7zEXMWTOiAymsxrF5FTPcY
	PFn+7WgOUaqBZN1AMgfKIAC6tWRbYHgBWRKB64n6ztJoeSbQMMFbLNRldRoTq0ZLPIQNd+WL5uG
	DgUPx0Nsa0H7Cb6nguxRBnuVyjP5RYrrxGYSifF60hSdAd2Gq3+XjRx3tukcshRnClTIaLGClAK
	RkVwyZhG4/Xq0pQhwxv6gjTkJrpFkpopL6LoZgaTkn8U8sB9v7k+FZxs4oLnA+eWBTwogeSG0cH
	D/TcJOxkroIONVv/hLZQzlNFuQEj/X7sdvyHj+idoi5Gg6tJrSyQwdWBnUJUpQpts6nu+Bp3GW1
	OIlmaYDIBG++Ozs
X-Received: by 2002:a05:6512:39cd:b0:5b5:e29b:a1df with SMTP id 2adb3069b0e04-5b608340136mr1130811e87.8.1788346239266;
        Wed, 02 Sep 2026 03:50:39 -0700 (PDT)
Received: from localhost.localdomain ([195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b94450sm485003e87.50.2026.09.02.03.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:50:37 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Remove manual ifname allocation
Date: Wed,  2 Sep 2026 13:50:03 +0300
Message-ID: <20260902105004.1935-1-nsvatoslav515@gmail.com>
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
Changes in v3:
- Added missing changelog.

Changes in v2:
- Removed rtw_init_netdev_name() and the entire manual naming callpath 
  instead of hardcoding "wlan%d", as suggested by Greg KH.

 drivers/staging/rtl8723bs/include/drv_types.h |  2 --
 .../staging/rtl8723bs/include/osdep_intf.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 27 +++----------------
 3 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..5837c51ac2f5 100644
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
index dd0c5fc813c8..5659d67a32f4 100644
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
@@ -256,8 +252,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -405,18 +399,6 @@ static const struct net_device_ops rtw_netdev_ops = {
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
@@ -752,14 +734,12 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
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
 
@@ -784,9 +764,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
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

