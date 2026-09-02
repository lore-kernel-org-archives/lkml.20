Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604684A499C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361708; cv=none; b=mUjlTEj+cU+7h8h54w+ecwCSGeZbhMkXUqVFfAe26QRY3HYqbXfYfEl9rNHLX6JCj0BB8dR8Nh59JAiZRgFvSW/9wpiDW1wE+sFsh4W3qUV4N+v1VH86bU1ifbcDyhrbaDts8mJjhqEMhkWa8+yjG7geF2ZMIOB0EnOnTVw6c/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361708; c=relaxed/simple;
	bh=/HKgCiJN5fApcjoYOWUqya6eaxeq86J2EHBdERMhcXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZrbtvIyb6lN8NJjSGX6G+8e86S/b/HHqsid+MbIviLVLGeTP7fLRKczjX7jmo2kXaJJnI5rVLRFMp9U5clmsHv2lLKLAFHuGY2lkAOGlwbg6fRqyTH7U/EfiLDH+IKkepiu+PmWmGke8Y0GiYq39OJyiBJb6TdYofNnUHZyJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNndLlrm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNndLlrm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so11711195e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361702; x=1788966502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dIdHMopzum3T1T5pILtPCf6cLbfxy4UO4dLC+zmw/HI=;
        b=qNndLlrmec+vA6tER8RzdOtOKTbmOoe8GuvyzDu5xPPYMJZFAdwqlugr2QCwpbuC19
         fXhjd1jEOfH0Qip4C6TScjHC4nxcIluVRPlXacanVsH1KPXPwvd/MGr80sAPNePNz6xP
         M8LMltnLZNKLn+ERHXT6yf/T1v9iLmZuWQdv3vhF1jEUg/IoNm9Fzdr2qzQx7mHrQwnc
         jmOfgYcyLmN21MciPYyXawI5oiiePi+/1dLiTTzNLrg0Xp9NaGJc6QQD/Zl1Lg+zWZQu
         m2VzU1VR/Ns3MR2i/F6/Rv07txckt2mri0LwZNDmWMaHIHvpe4JzH/aOC2p6Nrnda/r6
         QpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361702; x=1788966502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dIdHMopzum3T1T5pILtPCf6cLbfxy4UO4dLC+zmw/HI=;
        b=L8067AToi7tCjZ3yF8KlIpuvXV9LkUaLeA30ZXGWahYQm4gsF4IF6bShv96gbcgfRo
         xvor/lZlpxXUPB+gqOQ+Jih4YB9EiKuwwoFBWtprhWDco7DcI5b5KrMcjcGWWVxtruk0
         komm0WaQalpwBKnH36dbUN6ZxYlErJQ4xwVdr2bOBLeSvGQGJFafII7X0Ben9oGkm51e
         pktyqsMn1zN3eXm5/gytxSTkJ3+16vwE1l2pp3ZO3pRTtG3byP+tb4IwI0nJFDpVUeaO
         oTdIPMQE/lYYYOO4uYuICMepAhGs3C36re61/p5BdKLYhTbkt77dePgabD3EJcqnfdMb
         aJag==
X-Gm-Message-State: AFuF++lH/Fzz48dkDS1ZgnKKrbNl+cM2orKGHXn24KF+RK11ycd7OcNA
	PPbUxxw+Tx+Q/0K8FJGrlN/8YAtKqqiaJyyeCd70g+4Owd1UaID4hCbGFH8VIw==
X-Gm-Gg: AR+sD10MI/tlp9ElUtiJcUX3gO5Xwc44u2Co+R/ca+WKSfiEQCg8+ZvhtZTgdKSYbit
	zJVK7/sVH2xDWGK7F57eJILd//9o5sfiAgCwepUNM1PUC8LDY+JR/Sn8kzN+Qym+UkIJuea47sJ
	y89gq2dboh3DeKGSsrjrRSrzA/J5m5bO/+Bb3XmO0wI7rXMXPkTEZltQpMxMSlc2V+JeSRlHNlS
	A3YgYiH9XTqreMFWkiSklW9AS4XCTq82OfIyQEZ4FrujbysuXwbNIn8UwyJ054HkDauYOykArXM
	S89PHAajjIX4Z7nv0SOezVvawKW9gHoqncnA0WFhD4mYU2LZq7VHEhfYmzy2vbio0Kb2v8dSdsC
	OF3CRKlSD/ByxZ7xDNxB4EvbTqOJUFtdDtBcVgsL1DgS81hshrYHSH1fbFMn6bBGp23Ovw/zi2k
	Bfx7DMhr50USxMX2FEtcQM/4XjpU1OZb7v+vHgHuq5JXxhqN2lqk+VdU9XC+HOc4gO+ymMqvpCn
	xaxnobfzkgsxPaUAohSt6TTJpmYl4WMt6OPBuiOZDme2D3i7J6NpeUWgiSwaeaTOXaJ6u8eXy2O
	jlFitBikx/nJPJyuA7Q=
X-Received: by 2002:a05:600d:19:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cedd8ba5emr22944955e9.6.1788361702006;
        Wed, 02 Sep 2026 08:08:22 -0700 (PDT)
Received: from koolguy.fritz.box (dynamic-2a02-3100-1a72-6e00-ef52-6b66-008c-4439.310.pool.telefonica.de. [2a02:3100:1a72:6e00:ef52:6b66:8c:4439])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e0desm167404405e9.11.2026.09.02.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:08:21 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8723bs: change struct member bSurpriseRemoved
Date: Wed,  2 Sep 2026 15:05:41 +0000
Message-ID: <20260902150542.2746-2-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902150542.2746-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260902150542.2746-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Member name does not adhere to linux coding style.
Changed type as well since b indicates a boolean type and in every
instance of setting the variable the values true and false are used.
bSurpriseRemoved -> surprise_removed

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 20 ++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 12 +++----
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 +++---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +++----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  8 ++---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +--
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 ++---
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  8 ++---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 10 +++---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  4 +--
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 +++++++++----------
 15 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 9e00424d00bd..24b6742509d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -23,7 +23,7 @@ void rtw_btcoex_halt_notify(struct adapter *padapter)
 	if (!padapter->bup)
 		return;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	hal_btcoex_HaltNotify(padapter);
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 59f13f6b85ad..9672367c1f5a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -396,11 +396,11 @@ int rtw_cmd_thread(void *context)
 			break;
 		}
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->driver_stopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   padapter->surprise_removed, __LINE__);
 			break;
 		}
 
@@ -419,11 +419,11 @@ int rtw_cmd_thread(void *context)
 			continue;
 
 _next:
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved) {
+		if (padapter->driver_stopped || padapter->surprise_removed) {
 			netdev_dbg(padapter->pnetdev,
 				   "%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
 				   __func__, padapter->driver_stopped,
-				   padapter->bSurpriseRemoved, __LINE__);
+				   padapter->surprise_removed, __LINE__);
 			break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 179061239a6f..a6e7b57697a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -264,7 +264,7 @@ void rtw_free_network_queue(struct adapter *adapter, u8 isfreeall)
 
 bool rtw_if_up(struct adapter *adapter)
 {
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved ||
+	if (adapter->driver_stopped || adapter->surprise_removed ||
 	    !check_fwstate(&adapter->mlmepriv, _FW_LINKED))
 		return false;
 
@@ -934,7 +934,7 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = true;
 	while (check_fwstate(mlme_priv, _FW_UNDER_SURVEY)
 	       && jiffies_to_msecs(start) <= 200) {
-		if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+		if (adapter->driver_stopped || adapter->surprise_removed)
 			break;
 
 		msleep(20);
@@ -1506,7 +1506,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 						     mlmepriv.assoc_timer);
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->surprise_removed)
 		return;
 
 	spin_lock_bh(&mlme_priv->lock);
@@ -1608,7 +1608,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (!adapter->hw_init_completed)
 		return;
 
-	if (adapter->driver_stopped || adapter->bSurpriseRemoved)
+	if (adapter->driver_stopped || adapter->surprise_removed)
 		return;
 
 	if (adapter->net_closed)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0c00be09fbf3..fa8a83f5d3cb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1961,7 +1961,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -1978,7 +1978,7 @@ void dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntf
 	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct submit_ctx sctx;
 
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -2003,7 +2003,7 @@ s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmg
 	u32 timeout_ms = 500;/*   500ms */
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-	if (padapter->bSurpriseRemoved ||
+	if (padapter->surprise_removed ||
 		padapter->driver_stopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
@@ -2511,7 +2511,7 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3059,7 +3059,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3191,7 +3191,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3284,7 +3284,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 
 		i++;
 
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+		if (padapter->driver_stopped || padapter->surprise_removed)
 			break;
 
 		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
@@ -3712,13 +3712,13 @@ unsigned int send_beacon(struct adapter *padapter)
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
 		} while ((poll % 10) != 0 && !bxmitok &&
-			 !padapter->bSurpriseRemoved &&
+			 !padapter->surprise_removed &&
 			 !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
+	} while (false == bxmitok && issue < 100 && !padapter->surprise_removed &&
 		 !padapter->driver_stopped);
 
-	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
+	if (padapter->surprise_removed || padapter->driver_stopped)
 		return _FAIL;
 
 	if (!bxmitok)
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..fa47c6dd7988 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -237,7 +237,7 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 			return;
 	}
 
-	if ((padapter->bSurpriseRemoved) || !(padapter->hw_init_completed)) {
+	if ((padapter->surprise_removed) || !(padapter->hw_init_completed)) {
 		pwrpriv->cpwm = PS_STATE_S4;
 		return;
 	}
@@ -404,7 +404,7 @@ int LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 		if (bAwake)
 			return 0;
 
-		if (padapter->bSurpriseRemoved)
+		if (padapter->surprise_removed)
 			return -ENODEV;
 
 		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
@@ -480,7 +480,7 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(Adapter);
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->surprise_removed)
 		return;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED)) { /* connect */
@@ -514,7 +514,7 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 	if (!Adapter->bup)
 		return;
 
-	if (Adapter->bSurpriseRemoved)
+	if (Adapter->surprise_removed)
 		return;
 
 	if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
@@ -548,7 +548,7 @@ void LPS_Leave_check(struct adapter *padapter)
 	while (1) {
 		mutex_lock(&pwrpriv->lock);
 
-		if (padapter->bSurpriseRemoved ||
+		if (padapter->surprise_removed ||
 		    !(padapter->hw_init_completed) ||
 		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
 			bReady = true;
@@ -1089,7 +1089,7 @@ int rtw_pm_set_ips(struct adapter *padapter, u8 mode)
 		return 0;
 	} else if (mode == IPS_NONE) {
 		rtw_ips_mode_req(pwrctrlpriv, mode);
-		if ((padapter->bSurpriseRemoved == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
+		if ((padapter->surprise_removed == 0) && (rtw_pwr_wakeup(padapter) == _FAIL))
 			return -EFAULT;
 	} else {
 		return -EINVAL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fdc6c..8086a0602c0d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1894,7 +1894,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
 				if (!padapter->driver_stopped &&
-				    !padapter->bSurpriseRemoved)
+				    !padapter->surprise_removed)
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1933,7 +1933,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 		if (pattrib->qos != 1) {
 			if (!padapter->driver_stopped &&
-			    !padapter->bSurpriseRemoved) {
+			    !padapter->surprise_removed) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 			}
@@ -2010,7 +2010,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 	struct adapter *padapter = preorder_ctrl->padapter;
 	struct __queue *ppending_recvframe_queue = &preorder_ctrl->pending_recvframe_queue;
 
-	if (padapter->driver_stopped || padapter->bSurpriseRemoved)
+	if (padapter->driver_stopped || padapter->surprise_removed)
 		return;
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
@@ -2035,7 +2035,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
 			if (!padapter->driver_stopped &&
-			    !padapter->bSurpriseRemoved) {
+			    !padapter->surprise_removed) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2045,7 +2045,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if (!padapter->driver_stopped && !padapter->bSurpriseRemoved) {
+		if (!padapter->driver_stopped && !padapter->surprise_removed) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index d2b44ad60a4c..858471b8d65a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -59,7 +59,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 	if (CmdLen > RTL8723B_MAX_CMD_LEN)
 		goto exit;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		goto exit;
 
 	/* pay attention to if  race condition happened in  H2C cmd setting. */
@@ -639,13 +639,13 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->surprise_removed &&
 				 !padapter->driver_stopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved &&
+		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->surprise_removed &&
 			 !padapter->driver_stopped);
 
-		if (padapter->bSurpriseRemoved || padapter->driver_stopped) {
+		if (padapter->surprise_removed || padapter->driver_stopped) {
 		} else {
 			struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
 
@@ -899,9 +899,9 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->surprise_removed &&
 			 !padapter->driver_stopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved &&
+	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->surprise_removed &&
 		 !padapter->driver_stopped);
 
 	if (bcn_valid) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6a4a13544ca1..e7721a77039b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -189,7 +189,7 @@ static s32 polling_fwdl_chksum(
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved ||
+		if (value32 & FWDL_ChkSum_rpt || adapter->surprise_removed ||
 		    adapter->driver_stopped)
 			break;
 		yield();
@@ -230,7 +230,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & WINTINI_RDY || adapter->bSurpriseRemoved || adapter->driver_stopped)
+		if (value32 & WINTINI_RDY || adapter->surprise_removed || adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
@@ -386,7 +386,7 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	fwdl_start_time = jiffies;
 	while (
 		!padapter->driver_stopped &&
-		!padapter->bSurpriseRemoved &&
+		!padapter->surprise_removed &&
 		(write_fw++ < 3 || jiffies_to_msecs(jiffies - fwdl_start_time) < 500)
 	) {
 		/* reset FWDL chksum */
@@ -2697,7 +2697,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			u32 valRCR;
 
 			if (
-				padapter->bSurpriseRemoved  ||
+				padapter->surprise_removed ||
 				(adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off)
 			) {
 				/*  If it is in HW/SW Radio OFF or IPS state, we do not check Fw LPS Leave, */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 737e2a818c18..2120d8c3e8ab 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -658,7 +658,7 @@ static void phy_SwChnlAndSetBwMode8723B(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	if (Adapter->driver_stopped || Adapter->bSurpriseRemoved)
+	if (Adapter->driver_stopped || Adapter->surprise_removed)
 		return;
 
 	if (pHalData->bSwChnl) {
@@ -724,7 +724,7 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	}
 
 	/* Switch workitem or set timer to do switch channel or setbandwidth operation */
-	if ((!Adapter->driver_stopped) && (!Adapter->bSurpriseRemoved)) {
+	if ((!Adapter->driver_stopped) && (!Adapter->surprise_removed)) {
 		phy_SwChnlAndSetBwMode8723B(Adapter);
 	} else {
 		if (pHalData->bSwChnl) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..f611442eaca5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -15,7 +15,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 
 	while (pHalData->SdioTxOQTFreeSpace < agg_num) {
 		if (
-			(padapter->bSurpriseRemoved) ||
+			(padapter->surprise_removed) ||
 			(padapter->driver_stopped)
 		)
 			return false;
@@ -88,7 +88,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	}
 
 	if (
-		(padapter->bSurpriseRemoved) ||
+		(padapter->surprise_removed) ||
 		(padapter->driver_stopped)
 	)
 		goto free_xmitbuf;
@@ -130,7 +130,7 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _FAIL;
 	}
 
-	ret = (padapter->driver_stopped) || (padapter->bSurpriseRemoved);
+	ret = (padapter->driver_stopped) || (padapter->surprise_removed);
 	if (ret)
 		return _FAIL;
 
@@ -363,7 +363,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 next:
 	if (
 		(padapter->driver_stopped) ||
-		(padapter->bSurpriseRemoved)
+		(padapter->surprise_removed)
 	)
 		return _FAIL;
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index da2d9088ab5a..ca50f8a5c32e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -803,7 +803,7 @@ void sd_int_hdl(struct adapter *adapter)
 	struct hal_com_data *hal;
 
 	if (
-		(adapter->driver_stopped) || (adapter->bSurpriseRemoved)
+		(adapter->driver_stopped) || (adapter->surprise_removed)
 	)
 		return;
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 20265770ed77..502da503c99b 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -295,7 +295,7 @@ struct adapter {
 	u32 hal_data_sz;
 
 	bool driver_stopped;
-	s32	bSurpriseRemoved;
+	bool surprise_removed;
 	s32  bCardDisableWOHSM;
 
 	u32 IsrContent;
@@ -397,17 +397,17 @@ static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 #define RTW_IS_FUNC_DISABLED(padapter, func_bit) (atomic_read(&adapter_to_dvobj(padapter)->disable_func) & (func_bit))
 
 #define RTW_CANNOT_IO(padapter) \
-			((padapter)->bSurpriseRemoved || \
+			((padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_IO_BIT))
 
 #define RTW_CANNOT_RX(padapter) \
 			((padapter)->driver_stopped || \
-			 (padapter)->bSurpriseRemoved || \
+			 (padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_RX_BIT))
 
 #define RTW_CANNOT_TX(padapter) \
 			((padapter)->driver_stopped || \
-			 (padapter)->bSurpriseRemoved || \
+			 (padapter)->surprise_removed || \
 			 RTW_IS_FUNC_DISABLED((padapter), DF_TX_BIT))
 
 static inline u8 *myid(struct eeprom_priv *peepriv)
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..52db657e1aa1 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -799,7 +799,7 @@ static int _netdev_open(struct net_device *pnetdev)
 
 	if (!padapter->bup) {
 		padapter->driver_stopped = false;
-		padapter->bSurpriseRemoved = false;
+		padapter->surprise_removed = false;
 		padapter->bCardDisableWOHSM = false;
 
 		status = rtw_hal_init(padapter);
@@ -902,7 +902,7 @@ void rtw_ips_pwr_down(struct adapter *padapter)
 
 void rtw_ips_dev_unload(struct adapter *padapter)
 {
-	if (!padapter->bSurpriseRemoved)
+	if (!padapter->surprise_removed)
 		rtw_hal_deinit(padapter);
 }
 
@@ -1000,13 +1000,13 @@ void rtw_dev_unload(struct adapter *padapter)
 				   "%s: driver not in IPS\n", __func__);
 		}
 
-		if (!padapter->bSurpriseRemoved) {
+		if (!padapter->surprise_removed) {
 			hal_btcoex_IpsNotify(padapter, pwrctl->ips_mode_req);
 
 			/* amy modify 20120221 for power seq is different between driver open and ips */
 			rtw_hal_deinit(padapter);
 
-			padapter->bSurpriseRemoved = true;
+			padapter->surprise_removed = true;
 		}
 
 		padapter->bup = false;
@@ -1088,7 +1088,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->bSurpriseRemoved))
+	if ((!padapter->bup) || (padapter->driver_stopped) || (padapter->surprise_removed))
 		return;
 
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 6ef3a7198533..8d917e69ca0c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -385,7 +385,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 
 	rtw_unregister_netdevs(dvobj);
 
-	if (!padapter->bSurpriseRemoved) {
+	if (!padapter->surprise_removed) {
 		int err;
 
 		/* test surprise remove */
@@ -393,7 +393,7 @@ static void rtw_dev_remove(struct sdio_func *func)
 		sdio_readb(func, 0, &err);
 		sdio_release_host(func);
 		if (err == -ENOMEDIUM)
-			padapter->bSurpriseRemoved = true;
+			padapter->surprise_removed = true;
 	}
 
 	rtw_ps_deny(padapter, PS_DENY_DRV_REMOVE);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index e9a2f3f7ec74..71d3e4babd31 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -42,7 +42,7 @@ s32 _sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -74,7 +74,7 @@ s32 sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -106,7 +106,7 @@ s32 _sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -138,7 +138,7 @@ s32 sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -166,7 +166,7 @@ u8 sd_read8(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -193,7 +193,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return v;
 
 	func = psdio->func;
@@ -222,10 +222,10 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 				break;
 			}
 		}
@@ -245,7 +245,7 @@ void sd_write8(struct intf_hdl *pintfhdl, u32 addr, u8 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -270,7 +270,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return;
 
 	func = psdio->func;
@@ -298,10 +298,10 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			}
 
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 
 			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
-				padapter->bSurpriseRemoved = true;
+				padapter->surprise_removed = true;
 				break;
 			}
 		}
@@ -336,7 +336,7 @@ s32 _sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -386,7 +386,7 @@ s32 sd_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -429,7 +429,7 @@ s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
@@ -480,7 +480,7 @@ s32 sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata)
 	psdiodev = pintfhdl->pintf_dev;
 	psdio = &psdiodev->intf_data;
 
-	if (padapter->bSurpriseRemoved)
+	if (padapter->surprise_removed)
 		return err;
 
 	func = psdio->func;
-- 
2.55.0

