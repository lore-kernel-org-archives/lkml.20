Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614199;
	b=ufgsVYjbuLSVPJH4k7P1TDcnGwxNP/Uc7+dUDnnlJkn/Zo0CR9X+eS8S41m9M9hlenLM
	 +TeC2GijH/Qvcm61MULDZtiEx5FnwgpX7TFridHbKPyLtUMJeOuUlkMytBRDdN873VlFl
	 Ur/a/kdMdT85mYr3kp4xoYjDG5LhW97YXqifULaCRppAk0O7nfwZ3kOKhj4nvQZ3/b22m
	 0ZzUCeCbYgeTPwoN2nyWe0NLdxlsOnH4HYTuk+vgUqmlrYMlGPu+cFFrN6jw2itmggfPr
	 niVU2qUePO6Eyilc++GyFpBXOLyhY0lBscPVcqxHYwm+OJ4L1Emmz4MHDBleoSMJ/yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614199;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=92a2tC3TpmmAWwfEnaoGAvhxJC15yBXAkgD8kaFnzAg=;
	b=MOMHaH2/ZFu5lO0rRW0pLR/V/Hx0QXXB03Bg6Qw9+PrhEQwTqzJoPadOD36cSUd5dRkY
	 ixIKNsnYl+9aUsREQy9EovgmNiCSwt8A40E26A8iQM8+a0rLXvBH5zcKWIjgN/XAbNwHm
	 MMqrn0Dv5UB2Itb2ezo9CLTwfj9Wu9JpDdrtpinRGko+f4wBXxFF9k9Y5iuO9tqquzBxK
	 Z7mbVcapMrynxOhgCWgPqC8/UMqYaTaI0HAIZV56IIEhdQXiwI+NjaqsaptmAMI4S0wI/
	 eb4oklDkZRTOKiPFqnZf9noKJIxbSLMDV8Ys33TyKQIb0nrKwCJMBaMM100/cTfDyLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Wq4IlGkJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5A2606A327;
	Fri, 13 Nov 2026 23:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE5A2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=Wq4IlGkJ
ARC-Seal: i=1; a=rsa-sha256; t=1794613956; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a2nhDa57ixzwihVvSE9xTjFynmF3fcHFNHmwogoaiZCFz9lH4SFLw+G7HoL5tOHiE8xF18dvwr4Oh868Jq+VOF+taAboJuasHIc0vj6D3KmGPLfdFgvZOu+zOqXKzMA58bm/wq2nLbqxklkKGzq17BFaQSnd7rj85tQVBd1EKfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613956; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=92a2tC3TpmmAWwfEnaoGAvhxJC15yBXAkgD8kaFnzAg=; 
	b=B1yJLxz2tVnDPN0nIWql7abF18uPD8W2O+a52p//HM6mSRfQSiWcpI8nf0v6hh3jdResHktYsJj1PZlMrLBBHcZ9lZAWD2MJ8lxnFduiKdiM2WZuY40B4PHAFAIoZqpi0Q+pbgfB/MsITjnIHw/hKZGlZ+v9ZRSJ1Dqxp7OBpw8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=Wq4IlGkJuLei5LE+SLf5vrOZnlSzv4H+/BjSOP/DI/1ZhUfcUTmHR3uS3AU+wDGuKafbGG8ytkjpA427ZfbVUQ7gdr954pzPckOa3p+EGbgV8UhcM2eVYwJL/TQXJQ/vuhUExP7rIFVM/Z/MzHotGPDR15CBnNGZXnAv8xa7njTj73cZ3tKhHcYK7++AUJzmWeBxnWAM1f+10WmcDDNZuqZhvmNggridEOZipFCsAbqVq9SWgWXCLzR7IsXVIkrJUI8K14FwCQtrNLmevkRqUvNZj2Xnx5ngLzTtO6h6mAJiewjhSvez05APDQ/9FZLkUFnD2vHfBluVyuIio569mA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=92a2tC3TpmmAWwfEnaoGAvhxJC15yBXAkgD8kaFnzAg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613954728579.3878014500978;
	Fri, 13 Nov 2026 15:52:34 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 09/10] wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames
Date: Sat, 14 Nov 2026 04:52:10 +0500
Message-ID: <20261113235211.1911-10-owner@ph4ntom-rev.uz>
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

For injected frames, rtw89_core_tx_update_injection() only applies
the radiotap rate and leaves several TX descriptor and completion
settings mismatched with the radiotap flags:

- The management path sets hw_ssn_sel/hw_seq_mode (and MLO links set
  upd_wlan_hdr), overwriting user-supplied sequence numbers when
  IEEE80211_TX_CTL_ASSIGN_SEQ is not set, and leaving hw_seq_mode
  enabled even on injected control frames that have no seq_ctrl field.
  Conversely, injected data frames leave hw_seq_mode unset when
  ASSIGN_SEQ is requested on a monitor interface.
- Unicast frames unconditionally set RTS_EN = 1 and HW_RTS_EN = 1 in
  txwd_info4. On normal traffic HW_RTS_EN = 1 gates RTS on the MAC
  length/duration threshold (4080B / 2816us), whereas for injected
  frames RTS_EN must follow IEEE80211_TX_RC_USE_RTS_CTS with
  HW_RTS_EN = 0 so short frames requesting RTS/CTS actually emit RTS.
- IEEE80211_TX_CTL_NO_ACK (e.g. IEEE80211_RADIOTAP_F_TX_NOACK) neither
  sets BE_TXD_BODY6_NO_ACK on Wi-Fi 7 descriptors nor bounds retries,
  causing unacknowledged frames to be retransmitted up to the retry
  limit. Note that Wi-Fi 6 TXWD v0 chips (RTL8852A/B, RTL8851B) have
  no dedicated per-packet NO_ACK descriptor bit and rely on
  tx_cnt_lmt = 1 to suppress retransmissions; when that single attempt
  completes with RTW89_TX_RETRY_LIMIT, suppress false tx_retry_lmt
  accounting in rtw89_pci_tx_status() and set
  IEEE80211_TX_STAT_NOACK_TRANSMITTED in rtw89_tx_rpt_tx_status() too.
- hw->max_rate_tries is left at the mac80211 default (4), truncating
  IEEE80211_RADIOTAP_DATA_RETRIES, and info->control.rates[0].count is
  ignored when a radiotap rate is specified.
- Positive radiotap HT/VHT/legacy rate indices are added to the table
  base without clamping to the chip's valid MCS or legacy rate bounds.

Configure hardware sequence assignment according to
IEEE80211_TX_CTL_ASSIGN_SEQ (and never on control frames), drive
rts_en and hw_rts_en for radiotap RTS/CTS, advertise
RTW89_TX_DATA_CNT_LMT_MAX (63) in hw->max_rate_tries, honor
rates[0].count and NO_ACK descriptor/status semantics, and clamp
positive radiotap rate indices to valid hardware ranges.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 63 ++++++++++++++++++-----
 drivers/net/wireless/realtek/rtw89/core.h |  4 ++
 drivers/net/wireless/realtek/rtw89/mac.h  |  2 +
 drivers/net/wireless/realtek/rtw89/pci.c  |  3 +-
 4 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 84c12c6..7d174d2 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1252,12 +1252,43 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 	const struct rtw89_hw_rate_def *hw_rate = &rtw89_hw_rate[rtwdev->chip->chip_gen];
 	enum mac80211_rate_control_flags flags = info->control.rates[0].flags;
 	struct rtw89_tx_desc_info *desc_info = &tx_req->desc_info;
+	struct ieee80211_hdr *hdr = (void *)tx_req->skb->data;
 	const struct rtw89_chan *chan;
 	s8 idx = info->control.rates[0].idx;
-	u8 nss, mcs;
+	u8 nss, mcs, max_mcs;
 
 	desc_info->use_rate = true;
 	desc_info->dis_data_fb = true;
+	desc_info->hw_rts_en = false;
+	desc_info->rts_en = (flags & IEEE80211_TX_RC_USE_RTS_CTS) &&
+			    !desc_info->is_bmc &&
+			    !(info->flags & IEEE80211_TX_CTL_NO_ACK);
+
+	/* Control frames have no seq_ctrl field; otherwise keep the
+	 * sequence number supplied by user space unless ASSIGN_SEQ is set.
+	 */
+	if (!(info->flags & IEEE80211_TX_CTL_ASSIGN_SEQ) ||
+	    ieee80211_is_ctl(hdr->frame_control)) {
+		desc_info->upd_wlan_hdr = false;
+		desc_info->hw_ssn_sel = 0;
+		desc_info->hw_seq_mode = 0;
+	} else {
+		desc_info->hw_ssn_sel = RTW89_MGMT_HW_SSN_SEL;
+		desc_info->hw_seq_mode = RTW89_MGMT_HW_SEQ_MODE;
+	}
+
+	/* Suppress hardware retransmissions (and ACK waiting on BE) for NO_ACK;
+	 * otherwise honor explicit radiotap retry limits when a rate is set.
+	 */
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
+		desc_info->no_ack = true;
+		desc_info->tx_cnt_lmt_en = true;
+		desc_info->tx_cnt_lmt = 1;
+	} else if (info->control.rates[0].count) {
+		desc_info->tx_cnt_lmt_en = true;
+		desc_info->tx_cnt_lmt = umin(info->control.rates[0].count,
+					     RTW89_TX_DATA_CNT_LMT_MAX);
+	}
 
 	/* No rate was given in the radiotap header. Management frames
 	 * already carry the rate from rtw89_core_tx_update_mgmt_info(), so
@@ -1283,16 +1314,20 @@ static void rtw89_core_tx_update_injection(struct rtw89_dev *rtwdev,
 		desc_info->gi_ltf = 1;
 
 	if (flags & IEEE80211_TX_RC_VHT_MCS) {
+		max_mcs = rtwdev->chip->chip_gen == RTW89_CHIP_BE ? 11 : 9;
 		nss = umin(idx >> 4, ARRAY_SIZE(hw_rate->vht) - 1);
-		mcs = idx & 0xf;
+		mcs = umin(idx & 0xf, max_mcs);
 		desc_info->data_rate = hw_rate->vht[nss] + mcs;
 	} else if (flags & IEEE80211_TX_RC_MCS) {
-		desc_info->data_rate = hw_rate->ht + idx;
+		desc_info->data_rate = hw_rate->ht + umin(idx, 31);
 	} else {
 		chan = rtw89_chan_get(rtwdev, tx_req->rtwvif_link->chanctx_idx);
-
-		desc_info->data_rate = idx + (chan->band_type == RTW89_BAND_2G ?
-					      RTW89_HW_RATE_CCK1 : RTW89_HW_RATE_OFDM6);
+		if (chan->band_type == RTW89_BAND_2G)
+			desc_info->data_rate = RTW89_HW_RATE_CCK1 +
+					       umin(idx, 11);
+		else
+			desc_info->data_rate = RTW89_HW_RATE_OFDM6 +
+					       umin(idx, 7);
 	}
 }
 
@@ -1341,6 +1376,8 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rtwdev,
 
 	desc_info->seq = seq;
 	desc_info->is_bmc = is_bmc;
+	desc_info->rts_en = !is_bmc;
+	desc_info->hw_rts_en = true;
 	desc_info->wd_page = true;
 	desc_info->hiq = info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM;
 	desc_info->upd_wlan_hdr = upd_wlan_hdr;
@@ -1676,9 +1713,8 @@ static __le32 rtw89_build_txwd_info3(struct rtw89_tx_desc_info *desc_info)
 
 static __le32 rtw89_build_txwd_info4(struct rtw89_tx_desc_info *desc_info)
 {
-	bool rts_en = !desc_info->is_bmc;
-	u32 dword = FIELD_PREP(RTW89_TXWD_INFO4_RTS_EN, rts_en) |
-		    FIELD_PREP(RTW89_TXWD_INFO4_HW_RTS_EN, 1) |
+	u32 dword = FIELD_PREP(RTW89_TXWD_INFO4_RTS_EN, desc_info->rts_en) |
+		    FIELD_PREP(RTW89_TXWD_INFO4_HW_RTS_EN, desc_info->hw_rts_en) |
 		    FIELD_PREP(RTW89_TXWD_INFO4_SW_DEFINE, desc_info->sn);
 
 	return cpu_to_le32(dword);
@@ -1819,7 +1855,8 @@ static __le32 rtw89_build_txwd_body5_v2(struct rtw89_tx_desc_info *desc_info)
 
 static __le32 rtw89_build_txwd_body6_v2(struct rtw89_tx_desc_info *desc_info)
 {
-	u32 dword = FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->upd_wlan_hdr);
+	u32 dword = FIELD_PREP(BE_TXD_BODY6_NO_ACK, desc_info->no_ack) |
+		    FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->upd_wlan_hdr);
 
 	return cpu_to_le32(dword);
 }
@@ -1881,9 +1918,8 @@ static __le32 rtw89_build_txwd_info2_v3(struct rtw89_tx_desc_info *desc_info)
 
 static __le32 rtw89_build_txwd_info4_v2(struct rtw89_tx_desc_info *desc_info)
 {
-	bool rts_en = !desc_info->is_bmc;
-	u32 dword = FIELD_PREP(BE_TXD_INFO4_RTS_EN, rts_en) |
-		    FIELD_PREP(BE_TXD_INFO4_HW_RTS_EN, 1);
+	u32 dword = FIELD_PREP(BE_TXD_INFO4_RTS_EN, desc_info->rts_en) |
+		    FIELD_PREP(BE_TXD_INFO4_HW_RTS_EN, desc_info->hw_rts_en);
 
 	return cpu_to_le32(dword);
 }
@@ -7542,6 +7578,7 @@ static int rtw89_core_register_hw(struct rtw89_dev *rtwdev)
 	hw->queues = IEEE80211_NUM_ACS;
 	hw->max_rx_aggregation_subframes = chip->max_rx_agg_num;
 	hw->max_tx_aggregation_subframes = chip->max_tx_agg_num;
+	hw->max_rate_tries = RTW89_TX_DATA_CNT_LMT_MAX;
 	hw->uapsd_max_sp_len = IEEE80211_WMM_IE_STA_QOSINFO_SP_ALL;
 
 	hw->radiotap_mcs_details |= IEEE80211_RADIOTAP_MCS_HAVE_FEC |
diff --git a/drivers/net/wireless/realtek/rtw89/core.h b/drivers/net/wireless/realtek/rtw89/core.h
index 7b03154..3754ab6 100644
--- a/drivers/net/wireless/realtek/rtw89/core.h
+++ b/drivers/net/wireless/realtek/rtw89/core.h
@@ -1278,6 +1278,7 @@ struct rtw89_tx_desc_info {
 	bool tx_cnt_lmt_en;
 	u8 sn: 4;
 	u8 tx_cnt_lmt: 6;
+#define RTW89_TX_DATA_CNT_LMT_MAX	0x3f
 	u8 addr_info_nr;
 	u8 sec_keyid;
 	u8 sec_type;
@@ -1300,6 +1301,9 @@ struct rtw89_tx_desc_info {
 	bool stbc;
 	bool ldpc;
 	bool upd_wlan_hdr;
+	bool no_ack;
+	bool rts_en;
+	bool hw_rts_en;
 	bool mlo;
 	bool sw_mld;
 };
diff --git a/drivers/net/wireless/realtek/rtw89/mac.h b/drivers/net/wireless/realtek/rtw89/mac.h
index b4a7cb7..6870cc2 100644
--- a/drivers/net/wireless/realtek/rtw89/mac.h
+++ b/drivers/net/wireless/realtek/rtw89/mac.h
@@ -1888,6 +1888,8 @@ void rtw89_tx_rpt_tx_status(struct rtw89_dev *rtwdev, struct sk_buff *skb,
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
 
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
+		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 	if (tx_status == RTW89_TX_DONE)
 		info->flags |= IEEE80211_TX_STAT_ACK;
 	else
diff --git a/drivers/net/wireless/realtek/rtw89/pci.c b/drivers/net/wireless/realtek/rtw89/pci.c
index 6d19e75..6c4d6c0 100644
--- a/drivers/net/wireless/realtek/rtw89/pci.c
+++ b/drivers/net/wireless/realtek/rtw89/pci.c
@@ -475,7 +475,8 @@ static void rtw89_pci_tx_status(struct rtw89_dev *rtwdev,
 	if (tx_status == RTW89_TX_DONE) {
 		info->flags |= IEEE80211_TX_STAT_ACK;
 		tx_ring->tx_acked++;
-	} else {
+	} else if (!(info->flags & IEEE80211_TX_CTL_NO_ACK) ||
+		   tx_status != RTW89_TX_RETRY_LIMIT) {
 		if (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS)
 			rtw89_debug(rtwdev, RTW89_DBG_FW,
 				    "failed to TX of status %x\n", tx_status);
-- 
2.56.0.windows.4

