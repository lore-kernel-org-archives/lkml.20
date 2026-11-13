Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614050;
	b=rtEA3JaHQxk2pRxX0Y0llXvXa8c/UfC/19kRArZdww3ybVZ6STjKlJkgF831sgnMafmd
	 DkTZEGMO4uHTy05aiDqG3ugJqo094eDD7ur3nt86vJhAJo3ygD2AOCvuScRVCWGSIt22t
	 ZCawAJ137t/V61y0LBbwv8bfoZv3pRQlIFcu7zn6mJLW9vmn/oB4xmewHRK2QCB/O/yIb
	 ARPmN7Rbhq0qPKqZ+KeyGjOOrIjmEy9t3FQyebjX2YB5A2HAPQcluKqAZK5r2ogj/p3JN
	 zKHqEDWg+ehycMDRuw4HsnQV+3A7iqcm9jDKqAwxouh1t/SUgPjlw/ks6j2V/9Af/tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614050;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=KgQeXIz6k9fpJEP5kbrWI+d7kQkJAxnhZ2Bez4C+9AI=;
	b=yG7s2tvsEP9KMpr5CdHcRpXtnixEDgbU7eNQmLW/oK8gda8g9GejSmHuiNGrC0f+M+bT
	 ABZY1JAmIOgQMfs6hnW4PHxxIEC/Rda465++SgwkfTEd+0Zg65x7xTCOumr/AQCkwURpv
	 f6QAxrV9kmea5OljqMsKMoqOCIyWi5lfbJ2DIgSPH4J04ToTyiwGmNZY8nG55+Rq3BmFO
	 NMPw/32bAwuR1uydFrySsdAhxOVgWNY2fEfG6G6varIyTLVdrcrWU9mT1QyZAYlks1fub
	 CwPCWUJcHEKZMtkXTlUrVdKh8NUYnUXKgrVpJW9l/rqYCaDiL+RyMKwWzvPv6AD/Djw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=V2k3TqvB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD6606A88A;
	Fri, 13 Nov 2026 23:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0DD6606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=V2k3TqvB
ARC-Seal: i=1; a=rsa-sha256; t=1794613942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SfAvAPkuuLjQy2JuX7Y7Ix+jD6X7P5iWRX/8mP92HiZsXiD2dmnEpjAhygfj6RO+VRgPDui7zs7E0rB2cpZ8MrploT+aRmp+lveZYOw07XLr6/GX7PGdsxf2s8DPVk2kXL2XxnFsCyaKiEV+ZKdIbqX4lprFnE2OILhbPvsb5Bw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613942; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KgQeXIz6k9fpJEP5kbrWI+d7kQkJAxnhZ2Bez4C+9AI=; 
	b=RuonEUnTX2vfVmj+MR/fuOjvnhU8h5FfRhC2oWiNubmaauobwBLybayTIiDiGYJspW3CApoxjza3lOlD7kAMKChbLDGQQZBCN1NNlUEF28bIziG7UWtOxwWKGx6ZjFc+1LH5bkGsr8iDB3JuwjQqhx4RBmsHN93lX4oqUWA362w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=V2k3TqvBAINpxS9FzJD2nAX+85NL7hau7BbgFHC8eENKlQeZcXqbwSYb0GFxXQ1MVL7gyHNOf1tJZZf5NTRZm3XYnr57xBGFxYvVK14FGobBrQGMtBRFim1ebMK3SHvEaHqlyDFT8xfSAcRba83dCqm9SNkSlwQaLwFwPMTJ3ZMoMkfaHO/KglDlDQdgnOndnYAcdQidsnl8v6Ky2iHJlYwUezzC1q1U0vZ0Bi8/WBi6AzuHa9gsGtVQmSEsMFFxhbECMpA9rTrwSgBuQg3rGS/rLRkYGyKfzR39TGzK7L0K4NLLLQwa4PHifEpXQP14cUMvnTaq6HqsHcHVzzaHvg==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=KgQeXIz6k9fpJEP5kbrWI+d7kQkJAxnhZ2Bez4C+9AI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613942324445.7571596332093;
	Fri, 13 Nov 2026 15:52:22 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 03/10] wifi: rtw89: fix RX filter configuration for monitor mode
Date: Sat, 14 Nov 2026 04:52:04 +0500
Message-ID: <20261113235211.1911-4-owner@ph4ntom-rev.uz>
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

When entering monitor mode or enabling FIF_OTHER_BSS,
rtw89_ops_configure_filter() updates B_AX_SNIFFER_MODE or clears
B_AX_A_A1_MATCH in hal.rx_fltr, but leaves hardware target-address,
multicast, address CAM, beacon check, and UID drop masks active unless
specific FIF_* flags happen to toggle:

- B_AX_A_UC_CAM_MATCH and B_AX_A_BC_CAM_MATCH are only cleared when
  FIF_PROBE_REQ changes, dropping unicast and broadcast frames from
  arbitrary BSSs without a CAM entry in hardware.
- B_AX_A_MC is only cleared when FIF_ALLMULTI is set, and
  B_AX_A_MC_LIST_CAM_MATCH is never cleared, dropping multicast frames
  when a monitor socket is opened without IFF_PROMISC.
- B_AX_UID_FILTER_MASK is initialized in DEFAULT_AX_RX_FLTR and
  DEFAULT_BE_RX_FLTR via mac->default_rx_fltr and is never cleared by
  any FIF_* flag.
- B_AX_A_A1_MATCH, B_AX_A_BC, and B_AX_A_BCN_CHK_EN must stay cleared
  whenever B_AX_SNIFFER_MODE or FIF_OTHER_BSS is active, including
  after rtw89_hw_scan_complete_cb(), rtw89_roc_end(), or MAC reinit
  writes rtwdev->hal.rx_fltr back to R_AX_RX_FLTR_OPT /
  R_BE_RX_FLTR_OPT.
- FIF_CONTROL and FIF_PSPOLL are masked out of *new_flags even though
  rx_fltr_init_ax() and rx_fltr_init_be() already forward control
  frames to the host via R_AX_CTRL_FLTR / R_BE_CTRL_FLTR.

Retain FIF_CONTROL and FIF_PSPOLL in *new_flags, record FIF_OTHER_BSS
in hal.rx_fltr_other_bss so active monitor interfaces with
MONITOR_FLAG_OTHER_BSS (and concurrent passive monitors) receive
arbitrary-BSS frames without setting B_AX_SNIFFER_MODE, and add
rtw89_mac_refine_rx_fltr() to clear the drop masks without mutating
baseline rtwdev->hal.rx_fltr across mode transitions. The bit positions
in R_AX_RX_FLTR_OPT and R_BE_RX_FLTR_OPT are identical.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.h     |  1 +
 drivers/net/wireless/realtek/rtw89/mac.c      |  3 ++-
 drivers/net/wireless/realtek/rtw89/mac.h      | 16 ++++++++++++++++
 drivers/net/wireless/realtek/rtw89/mac80211.c |  5 ++++-
 drivers/net/wireless/realtek/rtw89/mac_be.c   |  3 ++-
 5 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 7f84ee5..7be8810 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -6499,6 +6499,7 @@ struct rtw89_hal {
 	u8 cv;
 	u8 cid; /* enum rtw89_core_chip_cid */
 	u8 acv;
+	bool rx_fltr_other_bss;
 	u16 aid; /* enum rtw89_core_chip_aid */
 	u32 antenna_tx;
 	u32 antenna_rx;
diff --git a/drivers/net/wireless/realtek/rtw89/mac.c b/drivers/net/wireless/realtek/rtw89/mac.c
index 41796bf..06fb263 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.c
+++ b/drivers/net/wireless/realtek/rtw89/mac.c
@@ -2681,6 +2681,7 @@ void rtw89_mac_set_rx_fltr(struct rtw89_dev *rtwdev, u8 mac_idx, u32 rx_fltr)
 	u32 reg;
 	u32 val;
 
+	rx_fltr = rtw89_mac_refine_rx_fltr(rtwdev, rx_fltr);
 	reg = rtw89_mac_reg_by_idx(rtwdev, mac->rx_fltr, mac_idx);
 
 	val = rtw89_read32(rtwdev, reg);
@@ -2706,7 +2707,7 @@ static int rx_fltr_init_ax(struct rtw89_dev *rtwdev, u8 mac_idx)
 		if (ret)
 			return ret;
 	}
-	mac_ftlr = rtwdev->hal.rx_fltr;
+	mac_ftlr = rtw89_mac_refine_rx_fltr(rtwdev, rtwdev->hal.rx_fltr);
 	plcp_ftlr = B_AX_CCK_CRC_CHK | B_AX_CCK_SIG_CHK |
 		    B_AX_LSIG_PARITY_CHK_EN | B_AX_SIGA_CRC_CHK |
 		    B_AX_VHT_SU_SIGB_CRC_CHK | B_AX_VHT_MU_SIGB_CRC_CHK |
diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wireless/realtek/rtw89/mac.h
index db42e33..b4a7cb7 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.h
+++ b/drivers/net/wireless/realtek/rtw89/mac.h
@@ -1494,6 +1494,22 @@ void rtw89_mac_set_edcca_mode_bands(struct rtw89_dev *rtwdev, bool normal)
 	rtw89_mac_set_edcca_mode(rtwdev, RTW89_MAC_1, normal);
 }
 
+static inline u32 rtw89_mac_refine_rx_fltr(struct rtw89_dev *rtwdev,
+					   u32 rx_fltr)
+{
+	if ((rx_fltr & B_AX_SNIFFER_MODE) || rtwdev->hal.rx_fltr_other_bss)
+		rx_fltr &= ~(B_AX_A_A1_MATCH |
+			     B_AX_A_BC |
+			     B_AX_A_MC |
+			     B_AX_A_UC_CAM_MATCH |
+			     B_AX_A_BC_CAM_MATCH |
+			     B_AX_A_MC_LIST_CAM_MATCH |
+			     B_AX_A_BCN_CHK_EN |
+			     B_AX_UID_FILTER_MASK);
+
+	return rx_fltr;
+}
+
 void rtw89_mac_set_rx_fltr(struct rtw89_dev *rtwdev, u8 mac_idx, u32 rx_fltr);
 void rtw89_mac_update_rts_threshold(struct rtw89_dev *rtwdev);
 void rtw89_mac_flush_txq(struct rtw89_dev *rtwdev, u32 queues, bool drop);
diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index 5a12639..2a3adf0 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -335,7 +335,10 @@ static void rtw89_ops_configure_filter(struct ieee80211_hw *hw,
 	rtw89_leave_ps_mode(rtwdev);
 
 	*new_flags &= FIF_ALLMULTI | FIF_OTHER_BSS | FIF_FCSFAIL |
-		      FIF_BCN_PRBRESP_PROMISC | FIF_PROBE_REQ;
+		      FIF_BCN_PRBRESP_PROMISC | FIF_PROBE_REQ |
+		      FIF_CONTROL | FIF_PSPOLL;
+
+	rtwdev->hal.rx_fltr_other_bss = !!(*new_flags & FIF_OTHER_BSS);
 
 	if (changed_flags & FIF_ALLMULTI) {
 		if (*new_flags & FIF_ALLMULTI)
diff --git a/drivers/net/wireless/realtek/rtw89/mac_be.c b/drivers/net/wireless/realtek/rtw89/mac_be.c
index fa35caf..7147679 100644
--- a/drivers/net/wireless/realtek/rtw89/mac_be.c
+++ b/drivers/net/wireless/realtek/rtw89/mac_be.c
@@ -1328,7 +1328,8 @@ static int rx_fltr_init_be(struct rtw89_dev *rtwdev, u8 mac_idx)
 	rtw89_mac_typ_fltr_opt_be(rtwdev, RTW89_DATA, RTW89_FWD_TO_HOST, mac_idx);
 
 	reg = rtw89_mac_reg_by_idx(rtwdev, R_BE_RX_FLTR_OPT, mac_idx);
-	rtw89_write32(rtwdev, reg, rtwdev->hal.rx_fltr);
+	rtw89_write32(rtwdev, reg,
+		      rtw89_mac_refine_rx_fltr(rtwdev, rtwdev->hal.rx_fltr));
 
 	reg = rtw89_mac_reg_by_idx(rtwdev, R_BE_PLCP_HDR_FLTR, mac_idx);
 	val = B_BE_HE_SIGB_CRC_CHK | B_BE_VHT_MU_SIGB_CRC_CHK |
-- 
2.56.0.windows.4

