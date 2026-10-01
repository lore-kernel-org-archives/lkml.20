Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEC037F8DD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859722; cv=none; b=shB0PXSbGhsuvRhjx1Dr4FTBVs8y0c50MULctuW9X2LyCujwya1Br1BYCAN1cLKx2AZyHc648jPUEuK3pSIyqUxZIwM/MGZgproRbBFVbkQz5N1hLKzt1+7aCDOEo0U9MfvXU/zZEofC1hAoZJKS9m4TvaPZi77u3crs8vKoSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859722; c=relaxed/simple;
	bh=tWKv7GcRFD/s3pfJLGTWOhTIn+fwwkJlPNHPxThsAOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKRMgyzqiCTmQUr4WOITpY8C8lgLXmy5qC9p475r6IcPk5lpk5pjREQAlYf9pPT3U6QBaFK6HRwFpPXUz9rnf4RKFLrexCSp0pu6Ba7chnsMWFk2Af12jO43irWIQUGeSUtrseezLoXmnjktYHhEoURLoWZPyux+A2vhEAtfkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROqpiAjb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROqpiAjb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso34304045e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859719; x=1791464519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMnCn6r1hHPcW/YmSzswujXp3fojK9XsootPRYEtFKY=;
        b=ROqpiAjbwJnQDlOZjXMapGxgdwfjrsnLDs70axo+0yUWTHEjy4v0iAdUgUnwaPf6Np
         81hBzYLgtWa0Kc8xSE3VlrkEhOLpvjRZ+pg7/qxp8xBoSpP8nr173XejrN8xMGXvof9j
         L6N+I739BYQ7PsjcLhI3EDBCypA1RUaf5EtB0CEGxITYwtZVzXvHfL/990Nz3R6wAwJX
         2tiFn+fxBGa3ZrIxObwhoMciQSPcCYSUX3uuT/ZKUS4/AI/pSs7sZjmpeO8/6qLXWI/K
         rgdOacna/cEityaNO3ryKa7EnV1nOovS33qjQ5UT+kQ3HlKOkaYjbzvM8BhbrILD5nQT
         BsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859719; x=1791464519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMnCn6r1hHPcW/YmSzswujXp3fojK9XsootPRYEtFKY=;
        b=rmBTNZfY0GN8gwOigNZBjYKdLZFK9r5kzOR745f9VgxlPr+hBRjU8qAa7xU62dmRyZ
         BtCZs7SNk6+ZVpWfIGbwnPwWK+Rb90302fhTimjTjkq2vvfiVVnqVdtXPKSknwoD6aF4
         El8Pqrdeq3bFreeXq3jYs9jBZ6sWFY4BI1lUCveyCaQgI8X660sUg/3HN6gR2P7QpSEc
         iArud9We4Y9AH59mQksqbdQuEtwTMcrpqswp5kZ4bURr9OgF4o2/WddPKBAcCDUUDIdZ
         gVEH4l4/OM3riji/VIVhPz6f7p/Db+CQ1Q042ZkV9RnQT0Mhp8avvU3XfBYFEMf0wtHf
         pxeg==
X-Forwarded-Encrypted: i=1; AKwUvBw+EM1+mJn9Pe2jricJVY01uttwHVZcIVrmruIFrH2P6VQBWuZoaUXIM9oqSWpfHiwA6bpHd1DWW+G3Plc=@vger.kernel.org
X-Gm-Message-State: AFuF++mRVN+BNywJI9AdyjyF1g6cRg7BgU5WICgi63SkaDWj2Yz5IGk2
	XQEFA7ttJIafIPrWvGjkpcNQS8sqz4JeCRd+4R3gdxVXwuQ+Usnlqk04
X-Gm-Gg: AYBFou0U6CgAqOUYu8TI0uh3HM64hEGGsXizmZHiNC3HnxDjhnv2vj7ykkXQ3zYTpmA
	a3FlDOuCXruyjBLk36Z/2P0jZ6lwalXIAEeAVfUZxX8JKKwYjo8eL9QM3L6DQpQDg+vKmc1LbJd
	GnQIie+cfOAeh1NQp+/Z80+soteo0qvI/ZMjjHT84KbjVmK5yaR+GvtdNhjZSvkV8FWRmafhAqu
	cXLXH1Voz+8DLVSEYXUffn6FE2g+lzcIjC7tcyhYNsLlKcORpi39mgS1BqThe0qHuXrbCmAhD3H
	vkqHINDicF16WPVaABOFnYXjtnARQWXHX/2irypTlePZZrEoVrEqDxRxScGrw0hMRBfvrD+ADQQ
	KdqaSsNWvsvTB/LJfE3QgDfJm5W0t6Zz74AjmVvoxKjYqY20/XBD2YgpU/WGQ/EwkP/Mh13hx9d
	iRQ8nzaoDFeagZNcZGMqu1WYZoH/Hd4q0jayS2XiXKnJ05piG2eNRw2UCrn1+0KUwPrUr/Y0vJY
	UmmdrVZ5g2UDIhI
X-Received: by 2002:a05:600c:6206:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a01b11114dmr81828635e9.16.1790859718837;
        Thu, 01 Oct 2026 06:01:58 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01feb7198sm55311455e9.1.2026.10.01.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:01:58 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	guojy.bj@gmail.com,
	error27@gmail.com,
	knavaneeth786@gmail.com,
	dvdh12707@gmail.com,
	m.steinmoetzger@gmail.com,
	fliegbert2@gmail.com,
	enelsonmoore@gmail.com,
	nikolayof23@gmail.com,
	khushalchitturi@gmail.com,
	samasth.norway.ananda@oracle.com,
	dennylin0707@gmail.com,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: Remove manual ifname allocation
Date: Thu,  1 Oct 2026 16:01:27 +0300
Message-ID: <20261001130127.3655-1-nsvatoslav515@gmail.com>
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
index d11d0cdd023a..d220df325fa9 100644
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
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
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

