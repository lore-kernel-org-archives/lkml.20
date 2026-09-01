Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBE948C8A5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284419; cv=none; b=fmlwIl0kADpxRdu2B+fTyxSYvwRLNcDcmmsdfnBbUfhQLh5liyVH0otxzch4fa2JgCjnIfOO+2TNBHXvNnP54+9Np7T99RH07wQINLV0nNcmGOW7niYIVErSIsebzqPMfHr0lqVJf83x94gNS3EXNatMiBRxKLJA53rGxas8vYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284419; c=relaxed/simple;
	bh=gzfgO2xtv31hW5lK2wNpf1w8pKkDlPNagKjv1v5sCsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TixOCDCtr9b3w4bTjBrf+R8PLpKJql2rq6OVy5Vwl/u7MZ082FAjgifEMyXFHcpQ7aOFQx89ZJ/xJyeBaLotR0UcC1pP6gyr2WuHdbIuCq3z6JhHb2ErVSyW0Lz6IptNx51towVKyqcNttGbUiUbfMvUWGjCG/IbDDiMyb0VF68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9TbxaWZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9TbxaWZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48442ea8f59so866174f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788284416; x=1788889216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBqsdCv0PKAGwqJspHCwLqZLgeNbrWJRtBR7BmnZ5Z0=;
        b=o9TbxaWZmTsqKkWXZheKlmkWPVYuRsgMLY6HhKsGPhF0R8qO+68FDKfWSg9efz1kzN
         E8nuHZhzYMUYFLn7O+Ql0dtpyxrNy8G14p5wBRHmrPSXCcjm8MqMgyiOAKFIPzpPXuep
         XK0u58rWfpF2f9z1w3Swx6I5LKviuQhBT81CUiFvLy5FMfWBdRRfu7gh9AP2pQlipV56
         wzxrdWn5gJQMQ5C/US8Ax6ejI+ahn5M5chqaedIuWymgz+IDl+WdkInYCKCNXN6FdRyv
         YCrWBGstcamqcxhvRoUL0nNvtWh9zaF/TDoO62BSdSdJQvEkZTO1JhJGOoQHQNB2/FYj
         Bopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284416; x=1788889216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBqsdCv0PKAGwqJspHCwLqZLgeNbrWJRtBR7BmnZ5Z0=;
        b=HkKD6OGv/VW35yitq3trZF2xiJMIz+LFmsoPZ3w7dFNjFqvEq6yQYmKNoMGbU3+xL8
         A8wi3RC+oBSSK4axyS33ZFGdHJfoVJIfJeQuDUax9lrxzNiAMg1Sx11vk0+EllOA9uG0
         IYAo3g/J4wxg9yn64rjvo60HkZZBz074X9s2OWj0HP/EM+2NWLtjCTYPsPm0Ol1/Ee8v
         GK+yGVUsHuXFi0zq9tDoH7lx4IAEzPz39CFiCuO2bsmGbifcWOm0IKU7z7tx2KvkY9Lc
         j27orpSVMTrcm+PhxrmBEO/6JpD8nOSx/NbczHZlYsE3ffZrZpYVdkXluIIAJkex1W7q
         JbnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWz6elvXc8GOGXxPXzxq9r3A0SCg9JxbCZ+ckZw4Wyj7zL5Z+ZyJdYpz6tOuKdANWOnVtEbBDmMyIHCGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mEuLP3UWGJdr1hKZQLAS6sAuy4LI8bQZxjLA0c2YIVzg3psLC1
	A/5u8GnlaElGJOhcNMUjZ3U/MvwKgcHScyF7fteUq65nshEzopVUeELF
X-Gm-Gg: AR+sD12b6AgMwyAN8SllhnqiXb0VZRv1iXukEiZPZ19ugdSHFxdSqvgmAAKlOkst81o
	5g1fmz5qdrojXczOWUyeYl6u4uV3GDh9fmooUu8Xlj3Z2fPh7hOWFW4+mOG4ywNzPjZjCY5XaxQ
	6XLvWapwrW0aI9NoIQ+teJ+XJ5H4Nkxwp0EdDRfAWXujaQzQPvTbADiZ84FP864IZ0XyBlHT7Jy
	GrBTAZK/NmT3NLfJnkB4+nKHvVbfzc+qH3h9q1tHp2CC1WijKTQnX8I44xC095ouQRzpCWB9zj3
	nx5KS7Ex7SUqiXy40Xfne+KThA6gZwYSdUfYFMTguF7dc9QhnQzeVm5QV4/MGpoH8jl74yH5Nkz
	Vp4j0+Dx5p7jYlHUFyUGxOcS/y53xKvTS9vRjtJ4ajuFGc9uvQe7BxWskrchhbZ6WDa+LKz1VD3
	QHSzB/Gk1q6nmoVuXzPoM4mIwetoUPjqOJL00YWNJLvRwxzOc8roDjnLQ3zsNG/l7rtSBjobtG1
	BzHtMJb0E3jVn+XZHsE4xyNvxZwkbaDrvE=
X-Received: by 2002:a05:600c:6819:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cdd41ca5amr131704235e9.6.1788284415719;
        Tue, 01 Sep 2026 10:40:15 -0700 (PDT)
Received: from localhost.localdomain (s052.imperial.net.ua. [195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce3c86a0asm12959855e9.9.2026.09.01.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:40:15 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Remove manual ifname allocation
Date: Tue,  1 Sep 2026 20:39:22 +0300
Message-ID: <20260901173923.4810-1-nsvatoslav515@gmail.com>
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

