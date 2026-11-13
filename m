Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614085;
	b=XGqGAxz1D4x1UTwHKNSMWqQtf130/jK1pUqEJ4w+UcSndsieOpcsmf9GCd4MJUZQEOvJ
	 YbBt/R2inwByT5zGHijYFor5v9fCOIPcvQx5hj/Y7TMJZ6aWbVLL7l4F5rfINwxM7pAOR
	 YaptYpNybAA5s/Ym9OB7IPtHSOZ84sen0nXfAAlESG1JIUqqWmIu0gqdqSmisvzT+Bhyn
	 9yl7VjKwvV/LijBBhoyLPA1ZMGpwsjBAkomzxJuOvzNGMuiKx3YEtr1RKWZwepp8MtkPE
	 5CYbS9/8B6tJ1zgVTf+8frcgyrEdoGvgRnipNEySeF6XLwMwpTwQV+hHzUBM7ru/tKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614085;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=KNLg8txxkvrcw7rLqrtPaCWVFCfBLsiWfiU3aPh7BCI=;
	b=c6Il9ZGBPX4xLc+LKPCmYF6ZiJDEqpt2c4A+OAVGeKUlF2kPaP4a30Pc4jNQ1SWQ2dEQ
	 P2TZS/6/eACLpZ+/7NDGiq7S6D7AkUnrnQSOsGWjhgAa9Gw3HU7UcUj9HTXbnrdkvnrmF
	 ICC1pducC/fES6yIL28p5r3a0UtnP3eqTI5Biaa0QFns99wt+vdGSb1OJcN32mOD+uSVy
	 2qj59gKuc31Zz5qiaPed4cqXO+J3fFGzjKXAVzBO2eTdMekid1tiow3uVYmQObUQcLuj1
	 RoRQ/OysI3+tHJERncJWhl2EsGw3JfpmAemocrh1n9jTmfQ67pcz8Qd9EF3W30FjIRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=5Vs8lnSC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAC8606A334;
	Fri, 13 Nov 2026 23:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FAC8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=5Vs8lnSC
ARC-Seal: i=1; a=rsa-sha256; t=1794613944; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z8aCM1K7s7aLRXlZE9CSfLh0+lI+nvtueInE7R2Ge3IH2zFuDlM0BOozqkKXAcj1boVkociq/+7Xk5tYoOsFvzhtDqcg2uokPhUjELEnEvVrkiExWCZoC1JEJlhrJ38E3ipqIUwUXO2sk+Iu6SIekYJ2SgAc211K6Ae6nTsG+lU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613944; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KNLg8txxkvrcw7rLqrtPaCWVFCfBLsiWfiU3aPh7BCI=; 
	b=SgtMnqYOu7E0+gyAjFtQORhbA+ovUi7ka1Bgk4HrwOfZh9Xr88pQsFXAAYlcgA2qygoTNjORyBd0URxd+V2+Rtnk0Y2t///wkU1mxsv+RGIIatKehCMFOdeEge9VwVAuYSvrl4UPXnxyKDpF6U46jc/p44UwPblQf2G9aCiaJJU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=5Vs8lnSChc/AgND0//A4ly/rbGdHi0PGLk3op5EF+/L60xiA9JoSjtNRs1mr4ps4e0WYPUvX2J0fyBw/5mnsYVMEfLhFtP7C43aFCDeFkKmqtxNpjoJro93M/JaUcXyKUIL8RQ1lVt35T3maa4S4nc5We/z55ZJ8aW/1eecXaCIaEd8GgZh841CtGg5mjOAPDoXd2JlGzCShFCCgdZuF8/GA8tsqGEJExJPVTRT2wQ5SeizkzVgGtnNLvs0oDhc8dMDiZUJrE3OvmFMfnXKVBq42QK5h3nvrZWkqytBJHcl2isw5ipikO5jlh6mfknC9HQ7o4y1kaUrPVir8v4VtGg==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=KNLg8txxkvrcw7rLqrtPaCWVFCfBLsiWfiU3aPh7BCI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613944418262.38615933871984;
	Fri, 13 Nov 2026 15:52:24 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 04/10] wifi: rtw89: protect pure_monitor_mode_vif with RCU
Date: Sat, 14 Nov 2026 04:52:05 +0500
Message-ID: <20261113235211.1911-5-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz>
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
X-ZohoMailClient: External

A following patch reads rtwdev->pure_monitor_mode_vif from
rtw89_ops_tx(), which runs without the wiphy lock, while interface
add/remove updates the pointer under the wiphy lock.

Annotate pure_monitor_mode_vif with __rcu, convert existing readers to
rcu_access_pointer() and rcu_dereference_protected(), and recompute
the pointer via rtw89_recalc_pure_monitor_vif() and
rtw89_set_pure_monitor_vif().

Whereas mac80211 only creates local->monitor_sdata while no other
interface is open, a monitor interface opened with MONITOR_FLAG_ACTIVE
is passed directly to drv_add_interface() even alongside an active
station or AP interface. Walking rtwdev->rtwvifs_list ensures
pure_monitor_mode_vif is published if and only if a single monitor
interface is the sole active driver vif, and unpublishes it with
synchronize_rcu() before its link, port, and MAC ID are released.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c     |  9 +++-
 drivers/net/wireless/realtek/rtw89/core.h     |  2 +-
 drivers/net/wireless/realtek/rtw89/mac80211.c | 49 +++++++++++++++++--
 3 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 527593e..3447f0e 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -530,7 +530,7 @@ void rtw89_chip_rfk_channel(struct rtw89_dev *rtwdev,
 			    struct rtw89_vif_link *rtwvif_link)
 {
 	const struct rtw89_chip_info *chip = rtwdev->chip;
-	bool mon = !!rtwdev->pure_monitor_mode_vif;
+	bool mon = !!rcu_access_pointer(rtwdev->pure_monitor_mode_vif);
 	bool prehdl_link = false;
 
 	if (chip->chip_gen != RTW89_CHIP_AX &&
@@ -560,8 +560,13 @@ void rtw89_chip_rfk_channel(struct rtw89_dev *rtwdev,
 static void rtw89_chip_rfk_channel_for_pure_mon_vif(struct rtw89_dev *rtwdev,
 						    enum rtw89_phy_idx phy_idx)
 {
-	struct rtw89_vif *rtwvif = rtwdev->pure_monitor_mode_vif;
+	struct wiphy *wiphy = rtwdev->hw->wiphy;
 	struct rtw89_vif_link *rtwvif_link;
+	struct rtw89_vif *rtwvif;
+
+	lockdep_assert_wiphy(wiphy);
+	rtwvif = rcu_dereference_protected(rtwdev->pure_monitor_mode_vif,
+					   lockdep_is_held(&wiphy->mtx));
 
 	if (!rtwvif)
 		return;
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 7be8810..78f6ef0 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -7832,7 +7832,7 @@ struct rtw89_dev {
 	int napi_budget_countdown;
 
 	struct rtw89_debugfs *debugfs;
-	struct rtw89_vif *pure_monitor_mode_vif;
+	struct rtw89_vif __rcu *pure_monitor_mode_vif;
 	struct rtw89_led led;
 
 	/* HCI related data, keep last */
diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index 2a3adf0..b38e04f 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -183,6 +183,47 @@ static void __rtw89_ops_remove_iface_link(struct rtw89_dev *rtwdev,
 	rtw89_mac_remove_vif(rtwdev, rtwvif_link);
 }
 
+static bool rtw89_set_pure_monitor_vif(struct rtw89_dev *rtwdev,
+				       struct rtw89_vif *rtwvif, bool sync)
+{
+	struct wiphy *wiphy = rtwdev->hw->wiphy;
+	struct rtw89_vif *old;
+
+	lockdep_assert_wiphy(wiphy);
+
+	old = rcu_dereference_protected(rtwdev->pure_monitor_mode_vif,
+					lockdep_is_held(&wiphy->mtx));
+	if (old == rtwvif)
+		return false;
+
+	rcu_assign_pointer(rtwdev->pure_monitor_mode_vif, rtwvif);
+
+	/* wait for lockless readers still using the previous vif */
+	if (old && sync)
+		synchronize_rcu();
+
+	return !!old;
+}
+
+static bool rtw89_recalc_pure_monitor_vif(struct rtw89_dev *rtwdev,
+					  struct rtw89_vif *exclude, bool sync)
+{
+	struct rtw89_vif *sole = NULL;
+	struct rtw89_vif *iter;
+
+	rtw89_for_each_rtwvif(rtwdev, iter) {
+		if (iter == exclude)
+			continue;
+		if (sole || rtwvif_to_vif(iter)->type != NL80211_IFTYPE_MONITOR) {
+			sole = NULL;
+			break;
+		}
+		sole = iter;
+	}
+
+	return rtw89_set_pure_monitor_vif(rtwdev, sole, sync);
+}
+
 static int rtw89_ops_add_interface(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif)
 {
@@ -241,8 +282,7 @@ static int rtw89_ops_add_interface(struct ieee80211_hw *hw,
 	if (ret)
 		goto unset_link;
 
-	rtwdev->pure_monitor_mode_vif = vif->type == NL80211_IFTYPE_MONITOR ?
-					rtwvif : NULL;
+	rtw89_recalc_pure_monitor_vif(rtwdev, NULL, true);
 	rtw89_recalc_lps(rtwdev);
 	return 0;
 
@@ -271,6 +311,9 @@ static void rtw89_ops_remove_interface(struct ieee80211_hw *hw,
 	rtw89_debug(rtwdev, RTW89_DBG_STATE, "remove vif %pM type %d p2p %d\n",
 		    vif->addr, vif->type, vif->p2p);
 
+	/* unpublish before tearing down the link, port and MAC ID */
+	rtw89_recalc_pure_monitor_vif(rtwdev, rtwvif, true);
+
 	wiphy_delayed_work_cancel(hw->wiphy, &rtwvif->roc.roc_work);
 
 	rtwvif_link = rtwvif->links[RTW89_VIF_IDLE_LINK_ID];
@@ -290,8 +333,6 @@ static void rtw89_ops_remove_interface(struct ieee80211_hw *hw,
 	rtw89_core_release_bit_map(rtwdev->hw_port, port);
 	rtw89_release_mac_id(rtwdev, macid);
 
-	rtwdev->pure_monitor_mode_vif = NULL;
-
 	rtw89_recalc_lps(rtwdev);
 	rtw89_enter_ips_by_hwflags(rtwdev);
 }
-- 
2.56.0.windows.4

