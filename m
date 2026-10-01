Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB44FDA67
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864039; cv=none; b=oBD/XgG4S1blFidmtxUeIphrA0MYaxQ26/uwuNsiu84bBu2LiOtVmF3MM4qeiFKff5vquBwdhFIRiBBWmE5XqrHvssttT39BRUJxEvZOW/7xu0JwNwnDMQK/oeDuSGuOyT9/SgsKIhdP6sLHPsTmUUS9hqZrAHWL4ZALiw1wq6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864039; c=relaxed/simple;
	bh=IEXUskiaguTB4Otopyr6gaLDiGGpDYbBgosBuNngyxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUSHps/0V95sIGpn44aBfmLQHxEEQlqe795Pk4vQcVVL3eQZnBD8tmlax9/IyQTqniKDn0TnFJKiDR0BembX2wneWw1LrBa1emS1hm9QNDRaN5H73njMwhC8BaF54zCcrvxtSVIolDdTgJEiuT9tZZ4APGzvHncXmWQoW4UydQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qN0oa8rh; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qN0oa8rh"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so340664066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790864036; x=1791468836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCWRto5ZbEKJLVpd5fclw/bB6bh5Fpi2NNDb+Pnb0AI=;
        b=qN0oa8rhjBr6MQv0oUJI3kQ+hpIO6h0deVt0HqrXZRtpWKmr3qABYQuiwzX3j39QOj
         /G8Cf3jGA2j9SwPjfYwBH5q0Vq1AQ++kPothYClG23U/aJcWZGdhj/E4880SM7PzvtwI
         tE7CvdoYKRs/jch7LFi58q6j99vlWReaXL01b++YsrbxjD3S+5IyzW9p/Ay59u/PO4KJ
         2uGlXjEtWzadrY00yYokImjNBeBHdBQVCuh/XFu0o7eaDnlOHNXKIZSDe4GKxxLS7A9F
         GVJ+uju/h3XCG1TzzmxOOuy+6PNGJsM9pOdvRlO9L+Y1EAXnwU0tGz8/7Nc12rJTHWnq
         EWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864036; x=1791468836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCWRto5ZbEKJLVpd5fclw/bB6bh5Fpi2NNDb+Pnb0AI=;
        b=D+XgMgPBdhrqZq5T+gLyuC0WLH/5e0vHgRO8+9ef8LPpiD7EQoPnxb0P6rQWCJFd4U
         Wl7rFB7oKlusC+YnvS5ViWmVE5cWkxV8nT+xXvSTCE5plAKPJR8jPM/jTs22GfQmO/7b
         5vvE0dJqa3S5ujaM6Ab+FAZXJ4N+EOhA26EtfaQs9FgxLnmXVKYMI1BLQ+A3Y0AHMtAK
         j+ldvYPIHhrCrPL7Ur5Ai/RD+I9FUyNr2ZVd5Ahv5jTIeUIHilFzjTbzlSjgoW4ee9VV
         H5Hu9t0u+b7nZSu6iSdoh/qmV2DGcJ9ISWPJg5MgPWutyy1O2i+0umX2at3XLRau5Tn0
         NvPA==
X-Forwarded-Encrypted: i=1; AKwUvBz0fOd+6a08aLV1iTw/CV16JwwiNaCdeYtujh/n9DP3+h6so6z/BX2mHQA7v8gbWmCxaNx89s8LfvWaff0=@vger.kernel.org
X-Gm-Message-State: AFuF++lKh4EbOGReo/4PFuECV82LaLLWwbSwjDNQ53CBhA60L6qnADXl
	YjFd/Ef9QfEWN29Wjj9ZKVT6lUhpddQXZKeFJb1Op5W0pcnI+6YS93Ty
X-Gm-Gg: AYBFou3k5UjXJ9RuxcQ0AN51AeDdHbDkCeO8EQEWwhWqkDU8EWSow33Kfn7h76WZJWD
	i3oG4ZXL8LJ2cDMf2xJiO2U2jiJh19jh9B26JBdtQhJlpNoJ2kLEjin5WC/drZJ1RjDgJKcc4fc
	R1bO9jQkDDZnCEUh0r1YryLtBxwGyjeUUzf6dZZD+RbAvztfDPWIEOHQpsnq6RFiPWNw4r2u1K9
	XCFhl9bx4llYmLvVHOo1v6h50Vwf1v8wM6Fl/sMqp4BW7WCMnmWRCzLLu54PtiMeM3qxngjq7nq
	HOz4yWGVzdNEpCtRc5yASFrkqxjmhzAQOROGLcoaiP4YwBNkArR9qmvwyXWGRHVHg+3dKxIjmmM
	hIaaCFn/wzByCYvboI7Wq3Sgh0ZK2J6LsO+st/14bbi48aOtwYjouHgS9lHhfpVHTCv2JBOhqzB
	0pDLz2/4PfhdkQ9Z4vVePmcP4Na8M6UDp2oTz1aZKTFFjc7PqdqLYjZJ23FOKIDakrqYHSRT/Cy
	tXDKwpTK97hBvCL
X-Received: by 2002:a17:907:7284:b0:c2e:a9:57f4 with SMTP id a640c23a62f3a-c2e23d2e342mr391143966b.22.1790864035909;
        Thu, 01 Oct 2026 07:13:55 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d96628sm167372766b.62.2026.10.01.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:13:54 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	error27@gmail.com,
	guojy.bj@gmail.com,
	dvdh12707@gmail.com,
	enelsonmoore@gmail.com,
	khomenkov@mailbox.org,
	fliegbert2@gmail.com,
	m.steinmoetzger@gmail.com,
	knavaneeth786@gmail.com,
	nikolayof23@gmail.com,
	serhatkumral1@gmail.com,
	samasth.norway.ananda@oracle.com,
	dennylin0707@gmail.com,
	adrishbora@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v6] staging: rtl8723bs: Remove manual ifname allocation
Date: Thu,  1 Oct 2026 17:12:41 +0300
Message-ID: <20261001141242.2763-1-nsvatoslav515@gmail.com>
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
Changes in v6:
- Rebased one more time. Should be working now. I'm so sorry for it.

Changes in v5:
- Rebased onto latest staging-testing to resolve merge conflicts caused by recent tree updates.

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
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 26 +++----------------
 3 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 0db276d46b1c..7f7d4fbad4bd 100644
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
index ab291792459b..d220df325fa9 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -106,10 +106,6 @@ static int rtw_80211d;
 static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
 module_param(rtw_qos_opt_enable, int, 0644);
 
-static char *ifname = "wlan%d";
-module_param(ifname, charp, 0644);
-MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
-
 char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
@@ -249,8 +245,6 @@ static void loadparam(struct adapter *padapter)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	snprintf(registry_par->ifname, 16, "%s", ifname);
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -394,17 +388,6 @@ static const struct net_device_ops rtw_netdev_ops = {
 	.ndo_get_stats = rtw_net_get_stats,
 };
 
-int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
-{
-	if (dev_alloc_name(pnetdev, ifname) < 0) {
-		pr_err("dev_alloc_name, fail for %s\n", ifname);
-		return 1;
-	}
-	netif_carrier_off(pnetdev);
-
-	return 0;
-}
-
 struct net_device *rtw_init_netdev(struct adapter *old_padapter)
 {
 	struct adapter *padapter;
@@ -726,14 +709,12 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
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
 
@@ -758,9 +739,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
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

