Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D363B38A2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368588; cv=none; b=owtcmHBuy0SkOmypX+fcD/YvFayHF8Trp9J+Xuj/8tx8W2xUqTe6Atc10iCrIhxX/+WCYLEKbdkP6AMMc8MGDLBVlcapqNM0LqMkcVE561FY2pUbgfjWzFzU7uyacWEWNZebrGp57WVFrIcNYF4PiGVwfH0tRF2JIbxKxuFR1hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368588; c=relaxed/simple;
	bh=F54xiCetdpvrz4vgiBtSpiFLIWtTb1I9iqKAJNfnnFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/FZAG+slr3Qug1gkc/NNxV0qFZ6aO3VBbPo2ZYV+hL0uVW/Mc98j5Mr/zTvI3rq7rmbvcyIJiQBR2nH12JQtdJsGwLUfQFHWLtpMx/rQVT34a/xUGI3if8gu9FWA5ZQfgth85EwPROeRm8DMcliyLqZf4nBelLgm5Ou8RzwOnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LLVtSrL4; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LLVtSrL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1T
	XlxLl74G0vZJit78lbEwFQKAorFZikf8iecNbpzco=; b=LLVtSrL4koqsyiK/9Z
	HYfK6bT/ixMJyPRvvsfiL68AZlIcIteQXW/BNi7PwlFR0KyPQLBvI9r0Cf5AToxX
	KFmVj37acbocRpN4WbfPlf2ppzpb2/RuFQCEPXhMwtT6jDggFJZ1LS5wGrcc7iCa
	Uu3BuYDWW4nk11cAbxLV2y82k=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBnjvRlHcZqLFSMCw--.58404S2;
	Wed, 07 Oct 2026 18:22:29 +0800 (CST)
From: Feiyu Wang <wangfeiyu_mc_code@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Feiyu Wang <wangfeiyu_mc_code@163.com>
Subject: [PATCH] staging: rtl8723bs: fix logical continuation style
Date: Wed,  7 Oct 2026 18:22:12 +0800
Message-ID: <20261007102212.112463-1-wangfeiyu_mc_code@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnjvRlHcZqLFSMCw--.58404S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFy7GF1xXrWDXF1DWr1fXrb_yoW5XF4Upr
	s5Ca4DKr1qgr13KFs3CF1kAFyfGw4rKryruFyrK3ZI9F92vF45Xrn0gF1avF4qqFyqqwsY
	yF1kGw15W3W3AwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRlks9UUUUU=
X-CM-SenderInfo: pzdqww5hl13s5pfbu0lgh6il2tof0z/xtbC7AWs62rGHWU80AAA3W

Move logical operators to the end of the previous line to follow
the kernel coding style, as reported by checkpatch.pl.

Signed-off-by: Feiyu Wang <wangfeiyu_mc_code@163.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a715ac6aa6b9..5dfbb8d9f6ed 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -393,8 +393,8 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 	struct wireless_dev *pwdev = padapter->rtw_wdev;
 
-	if (pwdev->iftype != NL80211_IFTYPE_STATION
-		&& pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
+	if (pwdev->iftype != NL80211_IFTYPE_STATION &&
+	    pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
 	) {
 		return;
 	}
@@ -462,8 +462,8 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wireless_dev *pwdev = padapter->rtw_wdev;
 
-	if (pwdev->iftype != NL80211_IFTYPE_STATION
-		&& pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
+	if (pwdev->iftype != NL80211_IFTYPE_STATION &&
+	    pwdev->iftype != NL80211_IFTYPE_P2P_CLIENT
 	) {
 		return;
 	}
@@ -971,8 +971,8 @@ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
 	}
 
 	/* for infra./P2PClient mode */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-		&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+	    check_fwstate(pmlmepriv, _FW_LINKED)) {
 		struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 
 		if (memcmp((u8 *)mac, cur_network->network.mac_address, ETH_ALEN)) {
@@ -1507,9 +1507,9 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	/* TKIP and AES disallow multicast packets until installing group key */
-	if (padapter->securitypriv.dot11_privacy_algrthm == _TKIP_
-		|| padapter->securitypriv.dot11_privacy_algrthm == _TKIP_WTMIC_
-		|| padapter->securitypriv.dot11_privacy_algrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _TKIP_ ||
+	    padapter->securitypriv.dot11_privacy_algrthm == _TKIP_WTMIC_ ||
+	    padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		/* WPS open need to enable multicast */
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
-- 
2.55.0

