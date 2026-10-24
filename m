Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852661;
	b=zE43NmWotxIpO80dcvtrez/EHfeLtOOR11uaPoQzoJ36UWk/jS/4tUbw5SMRSPatwnri
	 XlM6lNcBeA+dPZryV5ninQXSWNeJQ7OKahDdtk8sPfHkGQBHgiArhAcV1hdhUweaGoEiW
	 j9EfZPYxXHd+aq7bXnL1zPmCR9EOCLCbu6OLXcnOyIurnNpMqdp1R7HhtRA2l7WFYjghR
	 2oiPwwTMyWr12LDBQ0alLFO7VKY4LJ7onZiocTUeXovg91QF9J+KTHcKXFxqvlqlw0o9y
	 g6rIh79WY9ma2A77IYIL1Wu3uZ/tJqzB0r9CXJi+W8oqjWwK1aq+LuNaOh4njUFSgPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Br+k3szN4T7l7zclmTsyy5p2SegZ8c7nAltwFplTDA0=;
	b=2R2u3i4NkATGO6zLqfHijf0+YcssEeTDdUiteMPEJxdR7TRcMHLai0b5eY1LVmui/dIB
	 t66uXA8roV+kjdr+LZIZhyh821mJThEYOBC6M4GldRBdAkZHetJfDkgfDfmzAvsxy9k4W
	 uhl8/XdG0eTxIJHy79LFK6KzcT4W5h0ucBgO1tl8OXnTA+Z1j8WX/2sxHOBPrBjJV7cof
	 K24NtYRnKsQ9GUSvYK9TQssDefO1L55ndTKPCZ54318aTyj65X8STmoYmesCYNxlhkTiU
	 dkDs1kJmWTc4gUoeNYGhV6eUUOKrM/eJWtCqJReJA3twwL8eobQt4n4z7P9zJN6z1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kdnUXHUM;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B2606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F4B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kdnUXHUM
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3adfd217146so67482a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792852659; x=1793457459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Br+k3szN4T7l7zclmTsyy5p2SegZ8c7nAltwFplTDA0=;
        b=kdnUXHUMjQNqwTAfC8D+o+noPP1OajkLkPDFSIejQW1n0I0zcT5U2f1pok3/J1Svgz
         03g99HQMsUapeqMjLmfEvqMsRmCjk1aLcjGWfQe02u8/Xy2KZEkOxVZfA0b7jHB3ds2M
         Qm+/7IBm9MHctlnJW3peZiabCK8vX1XEZkyM6AKKksNAwsfFYESYEnMhDsZpIcsRvv7v
         D8c4PqhKjFDcMcsnA/3Bnmp78A3pWjKu+3Fn5mvp3WiJwgORWMNDxfC+YbkyEfyjXVKL
         G/5SmoGvvXBPAsZF3kCAWZeGgjeSZEIhETAwpQcBaCZTyuUhIXydg5UEVSAX7uAXR4F1
         JchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792852659; x=1793457459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Br+k3szN4T7l7zclmTsyy5p2SegZ8c7nAltwFplTDA0=;
        b=g66K4UPwbHU7o9DtN8t3PmEBcwQQWzzeGmUTSxbPRHnAvS7nxQTFRCQKmgzLAi0woZ
         1IzmeflpDVF++EFXYlXMHl+nQscw4CBkdH8NioK0kHRicz1Hrcoo+w7xuRRHgFCNy0Wd
         JOK5jtx7DSA7AUipKW4T8DkhXaDym8Yql2WYhu4zgt/bJNXB+UoMzScWpOxcCoAAttRH
         xW+0XpqCmZrHhGSWURpAbjjUqDDEaHWLUZLseLN2lja+IuuQREYTtLAfTZE7LTGcnqET
         xTSKtLVouRdERGxUHUz+JQ9qrSMWJRJfQekyoS8N+2HxF5k/XR8oYKO3Al9n4OFH1fny
         JbHA==
X-Forwarded-Encrypted: i=1; AKwUvBxqaR/Z/5Kgjh5RTRAyuYaZinmcQKtV60d+SJ2TMrEnI/vYQJ49EQaqRUuqh1xDZrmSQ95OAY658efL1yU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJopQMVLEG2wwhFILIEsSYdA36BXrDUmqb3ePIeoFMdNvCZ5I5N
	nVS0mdKXdVS2isw9L+4tLMxTqBLC+eazRwV7t8MSWp73aCXkWBgjy4Li
X-Gm-Gg: AYBFou2JvsP7ihXRjb5vecAOmD2Ncv0ur124CgPanOCWkG9raiSBD/WuwcxEKXnM39R
	oYVV4E1dUI8wUec9DNstBNi27WUmoWKalhcLVPuJcKNgSDuRhuHZ7qHZXeZgAM/pA+z8EpfogPo
	8DJ9qD7kNU9mt/Jki5gkt62QU2u+KXghoWqQhzbdC7cD/CdLnXzGxvGC8/nUNrlA1WEpl5yDxgR
	XZxKhf+c10L5nzIWGWKr72u6B9TYLfS3DUPZ25ucKHkARE3PFkfOIvz50sKiRNc+kOUeJAs25EM
	nuLUjfYbQGPP4Vdqqa7dj0pTU+3v6+SUs4O1PEL4Fk/YjhJ4jOnTXa8ah4ukC9aBHhQcDhKvfKR
	hYf9cj0OJBBMfK5mTkWHRCxf5ZOQ9LDh0h0xVWx/zZ7MqxEKVBoahQujFGtyKrYaklnS+I1vW1S
	Xjk/GEwsNzazeHcktV6k7hAwZMyt77CHsHurEYqj9z0d9EDJHOLzA9N956BMBJHq+8o1YGLPC/A
	6xyXVd4uxgF18AQ7kPGIQqgChx4iDJFQdnnEI3KiQ8DvLCs
X-Received: by 2002:a17:90b:4a4f:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3adeabe537cmr1858955a91.34.1792852658398;
        Sat, 24 Oct 2026 07:37:38 -0700 (PDT)
Received: from kali ([42.89.83.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af24sm3029717a91.6.2026.10.24.07.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:37:38 -0700 (PDT)
From: Anthony Lian <1198715581lxf@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anthony Lian <1198715581lxf@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase identifiers
Date: Sat, 24 Oct 2026 10:37:28 -0400
Message-ID: <20261024143728.106296-1-1198715581lxf@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl CHECK warnings about CamelCase naming by converting
the remaining identifiers to lowercase with underscores, as required
by the kernel coding style.

Rename bInSuspend, bSurpriseRemoved, hal_btcoex_InitHwConfig,
hal_btcoex_Initialize, and LeaveAllPowerSaveMode to their snake_case
equivalents.

This covers the variable, field, and function names touched by this
patch; all call sites and declarations are updated accordingly.

Signed-off-by: Anthony Lian <1198715581lxf@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 10 +++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 30 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 +++---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  4 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +++----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  8 ++---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +--
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 ++---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  4 +--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  8 ++---
 .../staging/rtl8723bs/include/hal_btcoex.h    |  4 +--
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  4 +--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 +--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 20 ++++++------
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  | 12 +++----
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 +++++++++----------
 20 files changed, 102 insertions(+), 102 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 9e00424d00bd..8cb62364e6c2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -23,7 +23,7 @@ void rtw_btcoex_halt_notify(struct adapter *padapter)
 	if (!padapter->bup)
 		return;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return;
 
 	hal_btcoex_HaltNotify(padapter);
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 9fc62cb1ae01..0d7e097dd97c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -392,11 +392,11 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->b_surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->driver_stopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   padapter->b_surprise_removed, __LINE__);
 			break;
 		}
 
@@ -415,11 +415,11 @@ int rtw_cmd_thread(void *context)
 			continue;
 
 _next:
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->b_surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->driver_stopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   padapter->b_surprise_removed, __LINE__);
 			break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 6dcc99253039..bf5dbd08fb03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -264,7 +264,7 @@ void rtw_free_network_queue(struct adapter *adapter, u8 isfreeall)
 
 bool rtw_if_up(struct adapter *adapter)
 {
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved ||
+	if (adapter->driver_stopped || adapter->b_surprise_removed ||
 	    !check_fwstate(&adapter->mlmepriv, _FW_LINKED))
 		return false;
 
@@ -916,7 +916,7 @@ inline void rtw_indicate_scan_done(struct adapter *adapter, bool aborted)
 {
 	rtw_cfg80211_indicate_scan_done(adapter, aborted);
 
-	if ((!adapter_to_pwrctl(adapter)->bInSuspend) &&
+	if ((!adapter_to_pwrctl(adapter)->b_in_suspend) &&
 	    (!check_fwstate(&adapter->mlmepriv,
 			    WIFI_ASOC_STATE | WIFI_UNDER_LINKING))) {
 		rtw_set_ips_deny(adapter, 0);
@@ -934,7 +934,7 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = true;
 	while (check_fwstate(mlme_priv, _FW_UNDER_SURVEY)
 	       && jiffies_to_msecs(start) <= 200) {
-		if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+		if (adapter->driver_stopped || adapter->b_surprise_removed)
 			break;
 
 		msleep(20);
@@ -1502,7 +1502,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 						     mlmepriv.assoc_timer);
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->b_surprise_removed)
 		return;
 
 	spin_lock_bh(&mlme_priv->lock);
@@ -1604,7 +1604,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (!adapter->hw_init_completed)
 		return;
 
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->b_surprise_removed)
 		return;
 
 	if (adapter->net_closed)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 511eccf5b5a3..0deab4a17d94 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1935,7 +1935,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->b_surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -1952,7 +1952,7 @@ void dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntf
 	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct submit_ctx sctx;
 
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->b_surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -1977,7 +1977,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	u32 timeout_ms = 500;/*   500ms */
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->b_surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -2976,7 +2976,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->b_surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3108,7 +3108,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->b_surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3201,7 +3201,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->b_surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3622,13 +3622,13 @@ unsigned int send_beacon(struct adapter *padapter)
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
 		} while ((poll % 10) != 0 && !bxmitok &&
-			 !padapter->bSurpriseRemoved &&
+			 !padapter->b_surprise_removed &&
 			 !padapter->driver_stopped);
 
-	} while (!bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
+	} while (!bxmitok && issue < 100 && !padapter->b_surprise_removed &&
 		 !padapter->driver_stopped);
 
-	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
+	if (padapter->b_surprise_removed || padapter->driver_stopped)
 		return _FAIL;
 
 	if (!bxmitok)
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c7c77b1df1f4..7d222149f015 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -144,7 +144,7 @@ void rtw_ps_processor(struct adapter *padapter)
 	if (ps_deny != 0)
 		goto exit;
 
-	if (pwrpriv->bInSuspend) /* system suspend or autosuspend */
+	if (pwrpriv->b_in_suspend) /* system suspend or autosuspend */
 		return;
 
 	pwrpriv->ps_processing = true;
@@ -236,7 +236,7 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 			return;
 	}
 
-	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
+	if ((padapter->b_surprise_removed) || !(padapter->hw_init_completed)) {
 		pwrpriv->cpwm = PS_STATE_S4;
 		return;
 	}
@@ -296,7 +296,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	if (pwrpriv->bInSuspend)
+	if (pwrpriv->b_in_suspend)
 		return false;
 
 	curr_time = jiffies;
@@ -403,7 +403,7 @@ int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 		if (bAwake)
 			return 0;
 
-		if (padapter->bSurpriseRemoved)
+		if (padapter->b_surprise_removed)
 			return -ENODEV;
 
 		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
@@ -479,7 +479,7 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(Adapter);
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->b_surprise_removed)
 		return;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) { /* connect */
@@ -502,7 +502,7 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 
 /*  Description: Leave all power save mode: LPS, FwLPS, IPS if needed. */
 /*  Move code to function by tynli. 2010.03.26. */
-void LeaveAllPowerSaveMode(struct adapter *Adapter)
+void leave_all_power_save_mode(struct adapter *Adapter)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(Adapter);
 	u8 enqueue = 0;
@@ -511,7 +511,7 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 	if (!Adapter->bup)
 		return;
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->b_surprise_removed)
 		return;
 
 	if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
@@ -545,7 +545,7 @@ void LPS_Leave_check(struct adapter *padapter)
 	while (1) {
 		mutex_lock(&pwrpriv->lock);
 
-		if (padapter->bSurpriseRemoved ||
+		if (padapter->b_surprise_removed ||
 		    !(padapter->hw_init_completed) ||
 		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
 			bReady = true;
@@ -933,7 +933,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->pwr_state_check_interval = RTW_PWR_STATE_CHK_INTERVAL;
 	pwrctrlpriv->pwr_state_check_cnts = 0;
 	pwrctrlpriv->bInternalAutoSuspend = false;
-	pwrctrlpriv->bInSuspend = false;
+	pwrctrlpriv->b_in_suspend = false;
 	pwrctrlpriv->bkeepfwalive = false;
 
 	pwrctrlpriv->LpsIdleCount = 0;
@@ -995,7 +995,7 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
 
 	/* for LPS */
-	LeaveAllPowerSaveMode(padapter);
+	leave_all_power_save_mode(padapter);
 
 	/* IPS still bound with primary adapter */
 	padapter = GET_PRIMARY_ADAPTER(padapter);
@@ -1008,13 +1008,13 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *cal
 		while (pwrpriv->ps_processing && jiffies_to_msecs(jiffies - start) <= 3000)
 			mdelay(10);
 
-	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend)
-		while (pwrpriv->bInSuspend && jiffies_to_msecs(jiffies - start) <= 3000
+	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->b_in_suspend)
+		while (pwrpriv->b_in_suspend && jiffies_to_msecs(jiffies - start) <= 3000
 		)
 			mdelay(10);
 
 	/* System suspend is not allowed to wakeup */
-	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->bInSuspend) {
+	if (!(pwrpriv->bInternalAutoSuspend) && pwrpriv->b_in_suspend) {
 		ret = _FAIL;
 		goto exit;
 	}
@@ -1061,7 +1061,7 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
 	if (mode < PS_MODE_NUM) {
 		if (pwrctrlpriv->power_mgnt != mode) {
 			if (mode == PS_MODE_ACTIVE)
-				LeaveAllPowerSaveMode(padapter);
+				leave_all_power_save_mode(padapter);
 			else
 				pwrctrlpriv->LpsIdleCount = 2;
 
@@ -1085,7 +1085,7 @@ int rtw_pm_set_ips(struct adapter *padapter, u8 mode)
 		return 0;
 	} else if (mode == IPS_NONE) {
 		rtw_ips_mode_req(pwrctrlpriv, mode);
-		if ((padapter->bSurpriseRemoved == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
+		if ((padapter->b_surprise_removed == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
 			return -EFAULT;
 	} else {
 		return -EINVAL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 6f4bdad00f60..9167f6e45e4f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1847,7 +1847,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
 				if (!padapter->driver_stopped &&
-				    !padapter->bSurpriseRemoved)
+				    !padapter->b_surprise_removed)
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1883,7 +1883,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 		if (pattrib->qos != 1) {
 			if (!padapter->driver_stopped &&
-			    !padapter->bSurpriseRemoved) {
+			    !padapter->b_surprise_removed) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 			}
@@ -1955,7 +1955,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 	struct adapter *padapter = preorder_ctrl->padapter;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
-	if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+	if (padapter->driver_stopped || padapter->b_surprise_removed)
 		return;
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
@@ -1976,7 +1976,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
 			if (!padapter->driver_stopped &&
-			    !padapter->bSurpriseRemoved) {
+			    !padapter->b_surprise_removed) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -1986,7 +1986,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if (!padapter->driver_stopped && !padapter->bSurpriseRemoved) {
+		if (!padapter->driver_stopped && !padapter->b_surprise_removed) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index d231b0277b76..be59dae5ef69 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -769,7 +769,7 @@ static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 	return true;
 }
 
-void hal_btcoex_Initialize(void *padapter)
+void hal_btcoex_initialize(void *padapter)
 {
 	struct btc_coexist *pBtCoexist;
 
@@ -1119,7 +1119,7 @@ void hal_btcoex_PowerOnSetting(struct adapter *padapter)
 	EXhalbtcoutsrc_PowerOnSetting(&GLBtCoexist);
 }
 
-void hal_btcoex_InitHwConfig(struct adapter *padapter, u8 bWifiOnly)
+void hal_btcoex_init_hw_config(struct adapter *padapter, u8 bWifiOnly)
 {
 	if (!hal_btcoex_IsBtExist(padapter))
 		return;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 734fb9bb1867..d5ebb845c6e7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -59,7 +59,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 	if (CmdLen > RTL8723B_MAX_CMD_LEN)
 		goto exit;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		goto exit;
 
 	/* pay attention to if  race condition happened in  H2C cmd setting. */
@@ -638,13 +638,13 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->b_surprise_removed &&
 				 !padapter->driver_stopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved &&
+		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->b_surprise_removed &&
 			 !padapter->driver_stopped);
 
-		if (padapter->bSurpriseRemoved || padapter->driver_stopped) {
+		if (padapter->b_surprise_removed || padapter->driver_stopped) {
 		} else {
 			struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
 
@@ -897,9 +897,9 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->b_surprise_removed &&
 			 !padapter->driver_stopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved &&
+	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->b_surprise_removed &&
 		 !padapter->driver_stopped);
 
 	if (bcn_valid) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 26c196b7f580..b7102f8e92e3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -189,7 +189,7 @@ static s32 polling_fwdl_chksum(
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved ||
+		if (value32 & FWDL_ChkSum_rpt || adapter->b_surprise_removed ||
 		    adapter->driver_stopped)
 			break;
 		yield();
@@ -230,7 +230,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved || adapter->driver_stopped)
+		if (value32 & WINTINI_RDY || adapter->b_surprise_removed || adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
@@ -383,7 +383,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	fwdl_start_time = jiffies;
 	while (
 		!padapter->driver_stopped &&
-		!padapter->bSurpriseRemoved &&
+		!padapter->b_surprise_removed &&
 		(write_fw++ < 3 || jiffies_to_msecs(jiffies - fwdl_start_time) < 500)
 	) {
 		/* reset FWDL chksum */
@@ -2627,7 +2627,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			u32 valRCR;
 
 			if (
-				padapter->bSurpriseRemoved  ||
+				padapter->b_surprise_removed  ||
 				(adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off)
 			) {
 				/*  If it is in HW/SW Radio OFF or IPS state, we do not check Fw LPS Leave, */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 18fb3fe4ecfd..0c41b2e1c3fc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -639,7 +639,7 @@ static void phy_SwChnlAndSetBwMode8723B(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	if (Adapter->driver_stopped || Adapter->bSurpriseRemoved)
+	if (Adapter->driver_stopped || Adapter->b_surprise_removed)
 		return;
 
 	if (pHalData->bSwChnl) {
@@ -704,7 +704,7 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	}
 
 	/* Switch workitem or set timer to do switch channel or setbandwidth operation */
-	if ((!Adapter->driver_stopped) && (!Adapter->bSurpriseRemoved)) {
+	if ((!Adapter->driver_stopped) && (!Adapter->b_surprise_removed)) {
 		phy_SwChnlAndSetBwMode8723B(Adapter);
 	} else {
 		if (pHalData->bSwChnl) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 6ba004aa8112..d0cb00012e35 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -15,7 +15,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 
 	while (pHalData->SdioTxOQTFreeSpace < agg_num) {
 		if (
-			(padapter->bSurpriseRemoved) ||
+			(padapter->b_surprise_removed) ||
 			(padapter->driver_stopped)
 		)
 			return false;
@@ -87,7 +87,7 @@ static bool rtl8723_dequeue_writeport(struct adapter *padapter)
 	}
 
 	if (
-		(padapter->bSurpriseRemoved) ||
+		(padapter->b_surprise_removed) ||
 		(padapter->driver_stopped)
 	)
 		goto free_xmitbuf;
@@ -127,7 +127,7 @@ bool rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _FAIL;
 	}
 
-	ret = (padapter->driver_stopped) || (padapter->bSurpriseRemoved);
+	ret = (padapter->driver_stopped) || (padapter->b_surprise_removed);
 	if (ret)
 		return _FAIL;
 
@@ -363,7 +363,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 next:
 	if (
 		(padapter->driver_stopped) ||
-		(padapter->bSurpriseRemoved)
+		(padapter->b_surprise_removed)
 	)
 		return _FAIL;
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 26e0ea46551a..7bcea0be5540 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -581,7 +581,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 
-		hal_btcoex_InitHwConfig(padapter, false);
+		hal_btcoex_init_hw_config(padapter, false);
 
 		return _SUCCESS;
 	}
@@ -753,7 +753,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	}
 
 	/*  Init BT hw config. */
-	hal_btcoex_InitHwConfig(padapter, false);
+	hal_btcoex_init_hw_config(padapter, false);
 
 	return _SUCCESS;
 }
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c12f670922d5..aae4f536b156 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -797,7 +797,7 @@ void sd_int_hdl(struct adapter *adapter)
 	struct hal_com_data *hal;
 
 	if (
-		(adapter->driver_stopped) || (adapter->bSurpriseRemoved)
+		(adapter->driver_stopped) || (adapter->b_surprise_removed)
 	)
 		return;
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 7f7d4fbad4bd..90717fd008de 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -291,7 +291,7 @@ struct adapter {
 	u32 hal_data_sz;
 
 	bool driver_stopped;
-	s32	bSurpriseRemoved;
+	s32  b_surprise_removed;
 	s32  bCardDisableWOHSM;
 
 	u32 IsrContent;
@@ -391,17 +391,17 @@ static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 #define RTW_IS_FUNC_DISABLED(padapter, func_bit) (atomic_read(&adapter_to_dvobj(padapter)->disable_func) & (func_bit))
 
 #define RTW_CANNOT_IO(padapter) \
-			((padapter)->bSurpriseRemoved || \
+			((padapter)->b_surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_IO_BIT))
 
 #define RTW_CANNOT_RX(padapter) \
 			((padapter)->driver_stopped || \
-			 (padapter)->bSurpriseRemoved || \
+			 (padapter)->b_surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_RX_BIT))
 
 #define RTW_CANNOT_TX(padapter) \
 			((padapter)->driver_stopped || \
-			 (padapter)->bSurpriseRemoved || \
+			 (padapter)->b_surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_TX_BIT))
 
 static inline u8 *myid(struct eeprom_priv *peepriv)
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 525cce3574fe..c3db053de7f9 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -26,9 +26,9 @@ bool hal_btcoex_IsBtDisabled(struct adapter *);
 void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum);
 void hal_btcoex_SetSingleAntPath(struct adapter *padapter, u8 singleAntPath);
 
-void hal_btcoex_Initialize(void *padapter);
+void hal_btcoex_initialize(void *padapter);
 void hal_btcoex_PowerOnSetting(struct adapter *padapter);
-void hal_btcoex_InitHwConfig(struct adapter *padapter, u8 bWifiOnly);
+void hal_btcoex_init_hw_config(struct adapter *padapter, u8 bWifiOnly);
 
 void hal_btcoex_IpsNotify(struct adapter *padapter, u8 type);
 void hal_btcoex_LpsNotify(struct adapter *padapter, u8 type);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 3beb9c07d0b6..f7f6b878ed59 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -170,7 +170,7 @@ struct pwrctrl_priv {
 
 
 	u8 bInternalAutoSuspend;
-	u8 bInSuspend;
+	u8 b_in_suspend;
 
 	u8 bAutoResume;
 	u8 autopm_cnt;
@@ -218,7 +218,7 @@ void rtw_unregister_cmd_alive(struct adapter *padapter);
 void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate);
 void LPS_Leave_check(struct adapter *padapter);
 
-void LeaveAllPowerSaveMode(struct adapter *Adapter);
+void leave_all_power_save_mode(struct adapter *Adapter);
 void LeaveAllPowerSaveModeDirect(struct adapter *Adapter);
 void _ips_enter(struct adapter *padapter);
 void ips_enter(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 91d98418c0c1..cc2af312c990 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1590,7 +1590,7 @@ static int cfg80211_rtw_leave_ibss(struct wiphy *wiphy, struct net_device *ndev)
 
 	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
 		rtw_scan_abort(padapter);
-		LeaveAllPowerSaveMode(padapter);
+		leave_all_power_save_mode(padapter);
 
 		rtw_wdev->iftype = NL80211_IFTYPE_STATION;
 
@@ -1765,7 +1765,7 @@ static int cfg80211_rtw_disconnect(struct wiphy *wiphy, struct net_device *ndev,
 	rtw_set_to_roam(padapter, 0);
 
 	rtw_scan_abort(padapter);
-	LeaveAllPowerSaveMode(padapter);
+	leave_all_power_save_mode(padapter);
 	rtw_disassoc_cmd(padapter, 500, false);
 
 	rtw_indicate_disconnect(padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index a4bc4ff58c56..928b0a799e35 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -758,7 +758,7 @@ static int _netdev_open(struct net_device *pnetdev)
 
 	if (!padapter->bup) {
 		padapter->driver_stopped = false;
-		padapter->bSurpriseRemoved = false;
+		padapter->b_surprise_removed = false;
 		padapter->bCardDisableWOHSM = false;
 
 		status = rtw_hal_init(padapter);
@@ -806,7 +806,7 @@ int netdev_open(struct net_device *pnetdev)
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
 
-	if (pwrctrlpriv->bInSuspend)
+	if (pwrctrlpriv->b_in_suspend)
 		return 0;
 
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->hw_init_mutex)))
@@ -859,7 +859,7 @@ void rtw_ips_pwr_down(struct adapter *padapter)
 
 void rtw_ips_dev_unload(struct adapter *padapter)
 {
-	if (!padapter->bSurpriseRemoved)
+	if (!padapter->b_surprise_removed)
 		rtw_hal_deinit(padapter);
 }
 
@@ -901,7 +901,7 @@ static int netdev_close(struct net_device *pnetdev)
 		}
 
 		/* s2. */
-		LeaveAllPowerSaveMode(padapter);
+		leave_all_power_save_mode(padapter);
 		rtw_disassoc_cmd(padapter, 500, false);
 		/* s2-2.  indicate disconnect to os */
 		rtw_indicate_disconnect(padapter);
@@ -950,19 +950,19 @@ void rtw_dev_unload(struct adapter *padapter)
 			/* check HW status and SW state */
 			netdev_dbg(padapter->pnetdev,
 				   "%s: driver in IPS-FWLPS\n", __func__);
-			LeaveAllPowerSaveMode(padapter);
+			leave_all_power_save_mode(padapter);
 		} else {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: driver not in IPS\n", __func__);
 		}
 
-		if (!padapter->bSurpriseRemoved) {
+		if (!padapter->b_surprise_removed) {
 			hal_btcoex_IpsNotify(padapter, pwrctl->ips_mode_req);
 
 			/* amy modify 20120221 for power seq is different between driver open and ips */
 			rtw_hal_deinit(padapter);
 
-			padapter->bSurpriseRemoved = true;
+			padapter->b_surprise_removed = true;
 		}
 
 		padapter->bup = false;
@@ -1038,12 +1038,12 @@ void rtw_suspend_common(struct adapter *padapter)
 
 	netdev_dbg(padapter->pnetdev, " suspend start\n");
 
-	pwrpriv->bInSuspend = true;
+	pwrpriv->b_in_suspend = true;
 
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->bSurpriseRemoved))
+	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->b_surprise_removed))
 		return;
 
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
@@ -1135,7 +1135,7 @@ int rtw_resume_common(struct adapter *padapter)
 	hal_btcoex_SuspendNotify(padapter, 0);
 
 	if (pwrpriv)
-		pwrpriv->bInSuspend = false;
+		pwrpriv->b_in_suspend = false;
 
 	netdev_dbg(padapter->pnetdev, "%s:%d in %d ms\n", __func__, ret,
 		   jiffies_to_msecs(jiffies - start_time));
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index e18cb7fc93da..91f1c39b9c7e 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -264,7 +264,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 
 	rtl8723bs_interface_configure(padapter);
 
-	hal_btcoex_Initialize((void *)padapter);
+	hal_btcoex_initialize((void *)padapter);
 
 	/* 3 6. read efuse/eeprom data */
 	rtw_read_adapter_info(padapter);
@@ -382,7 +382,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 
 	rtw_unregister_netdevs(dvobj);
 
-	if (!padapter->bSurpriseRemoved) {
+	if (!padapter->b_surprise_removed) {
 		int err;
 
 		/* test surprise remove */
@@ -390,7 +390,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 		sdio_readb(func, 0, &err);
 		sdio_release_host(func);
 		if (err == -ENOMEDIUM)
-			padapter->bSurpriseRemoved = true;
+			padapter->b_surprise_removed = true;
 	}
 
 	rtw_ps_deny(padapter, PS_DENY_DRV_REMOVE);
@@ -398,7 +398,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 	rtw_pm_set_ips(padapter, IPS_NONE);
 	rtw_pm_set_lps(padapter, PS_MODE_ACTIVE);
 
-	LeaveAllPowerSaveMode(padapter);
+	leave_all_power_save_mode(padapter);
 
 	rtw_btcoex_halt_notify(padapter);
 
@@ -417,7 +417,7 @@ static int rtw_sdio_suspend(struct device *dev)
 	if (padapter->driver_stopped)
 		return 0;
 
-	if (pwrpriv->bInSuspend)
+	if (pwrpriv->b_in_suspend)
 		return 0;
 
 	rtw_suspend_common(padapter);
@@ -429,7 +429,7 @@ static int rtw_resume_process(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
-	if (!pwrpriv->bInSuspend)
+	if (!pwrpriv->b_in_suspend)
 		return -1;
 
 	return rtw_resume_common(padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 15a55c05bdb4..97d3ab8fc80c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -42,7 +42,7 @@ s32 _sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -74,7 +74,7 @@ s32 sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -106,7 +106,7 @@ s32 _sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -138,7 +138,7 @@ s32 sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -166,7 +166,7 @@ u8 sd_read8(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -193,7 +193,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -222,10 +222,10 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->b_surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
-				padapter->bSurpriseRemoved = true;
+				padapter->b_surprise_removed = true;
 				break;
 			}
 		}
@@ -245,7 +245,7 @@ void sd_write8(struct intf_hdl *pintfhdl, u32 addr, u8 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -270,7 +270,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -298,10 +298,10 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->b_surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
-				padapter->bSurpriseRemoved = true;
+				padapter->b_surprise_removed = true;
 				break;
 			}
 		}
@@ -336,7 +336,7 @@ s32 _sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -386,7 +386,7 @@ s32 sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -429,7 +429,7 @@ s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -479,7 +479,7 @@ s32 sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->b_surprise_removed)
 		return err;
 
 	func = psdio->func;
-- 
2.53.0

