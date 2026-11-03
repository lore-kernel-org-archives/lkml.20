Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699657;
	b=rvIhNAlRZIGNFKEGXuLrS4VH5rDB3VDqqrj6xP6eCV2Tp4bJdkzwHPCjkyHCDKUnyxSs
	 IEemXfrqSSe3Bj/4i7XaR9axqN5P2XC1jMmfmUvUoSz4VLFfO6aZEY5IH8cdZ82mGqet9
	 G+zxB8XB8bFDrcR2vY5Ej71RvkcXeyugf9V9wjIrOKyXFKr4tLKajk3IULHLY5FvSipmk
	 hewx+UIMGV3xXr/SiFmPhkd4wrbGHSbYxAPj7z96aR/i+PZleQckIjEIDLFBNLHm7zZ5R
	 Hh5xIZeeE1w8wd6+/MarUGIJuJBoGkjE/gdS75Y7UL2CnVO1krBZe/KbnOx8ZC+2vHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cBNrZVHnb/IW5vTehwQYC43mSN9D38FsB90vjJdBW5I=;
	b=exxkeN8RltW7QmCFUeD8v1gEOZ04AI0FHPHCTqA0MMz3zcoSDMgoeshut2lc27uAyCX1
	 XuOaoK7/F1p4lDWPjToHEd39DeFakYZozX+acP3DpGDwGiulxcsoRxzSTlvc4tcuuwN1y
	 G8jcxhrrHBXZyUcXyltzOrAzcN8VLDXnmhPyT3VsDat66sEfQ6AkOQwOToP1i91qaNwGd
	 cJXBsue6Q27E4vqdHALV4/bvhwKG9eO9OBm/aB2M51fOYLKI9e5mG4frRhZJmsO9oFuBa
	 ssAK0YBvuKiRl7F4dq85DKxw1tnHJWT+gFTx6PLEbRjNMygLsLaFI8eQmCp2/UHDilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBUmCncp;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358D60A261F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D358D60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PBUmCncp
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fc585291cso3112214c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699656; x=1794304456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBNrZVHnb/IW5vTehwQYC43mSN9D38FsB90vjJdBW5I=;
        b=PBUmCncp+DEH/lBUImAnwsLJgc1GzpOVc6My7UxsoceTaVrwHWR9YIsTJcFn6RPm2U
         h/Ve3vdmzdBeD6eJ/3MxADVtmovz5WbzVof883//JCIk3mbjFAToTNkGEcAcAt6j78qv
         xA1Y1zMgFa4jycLcJncJd3UNW659JMf5iTixg+wvv8TWP/hP87IurLwy3Nqm9HLXw4ZW
         eGsEoXgdw0847x2u9rIMy2zeewnjGvAUJl26FZ+aFLPWA7xuS5PZaW6pgrxLREJqnjzF
         HMuuDxeeVCLlovhTUEbUvZWX5u4IOSINkKvQDPTmN9Zq9ovV2E3zT3N2NcQ05EaZ6ixv
         j2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699656; x=1794304456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBNrZVHnb/IW5vTehwQYC43mSN9D38FsB90vjJdBW5I=;
        b=RQoquOi6LK7829mbyRRrAufMXA8C0MvqN4QQDip+IZth298l6Djzvw26JOfNmya88D
         +sOYAHBvkE/HbfEVzzk7K0ZQuEFyBWqUThqE1xYdRt0zkoLz09pbtj2EyiJqPtPOXvVb
         B5JHmWpUFTUeL4U2DabcS0yRhZLaNcHN9tgwgsHVsHZR9S5VXbawaDtGu7FxV1lb3PiT
         eZlccSu38YLcxXkwVIKeisBuvICAnsBkOf4bUf/9/6D+ILyaCLfZ2+ddR1BiinCz+ZFS
         yp1DKUzpZ+O7DN/niTqf9/VE2KklKD3Zid68kZ/ZCMQSC7MENUoJghU0IQj3awY26c2C
         G5JA==
X-Forwarded-Encrypted: i=1; AKwUvBxEAAOGtRYGXRu7uFbJY9H0a4DU/4y/rLMJKWsFsUX5mUdm/dcqHHRf9kDHbASbS33zei4xdSMFrmyIs6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HBBJNuMBsIADiJHUWGdlEbiEaDvnkzTBPTxhOulaGNwzOtZ/O
	BHpKKCezjmAxJJuBWJLncXozmoN2r7zlnfa7gCKbCgmyb9ZV3O9QwHKp
X-Gm-Gg: AYBFou1OGhav81it8t8pJwwbsaLKCcaM65zFkSJx9mJJauOnPwg722pSNQhOLSxUvZp
	MOnfd4ZQogReYi+yLZRo4+FpSa0ER7wnAOe37Vn9kVHP7E2mjJBeD7wr8KyWXjZn3TffypGbUen
	luH2xZXsDv+qyT8NEkvtYkqXAXEqDqLHsfB4rpjoAhy65m/baVyFMQM+R/qRvC/OZzg76EjnzGY
	AZOgdFlk8XqdOtfwkzAK3AD21iWopHduGI9HsaGJKd/raO5REGSUawZShhYEr3TizbdQzLRHYvn
	/CE7UNS/3v6HpSg72fhq5dDMtTLSOj2dsxH9ORIf7GQh406y0HvMgxdJvs19cBvo6HrfKbSo/Ym
	MXGSLnYUMTtUpxjdncvvs9S4GoZd9uy3wVy18wivutle+6xdlKfL5jZru99MG0ODDaBDBe/iIbY
	p48k4LUU71YQVtIX+GtSlX3fehizx7wIno2H9021kE2FztJtaVFKmwCbvBIqEAwLv+3tIaN4QDo
	zPLM+Lcrt50NJYubP82f4qZxQXOC5FKxiFPjt/O/m4jpuKYjWbi+LjTXroYt0XvvEvhEIRVN+h8
	9GUaTksZxxz+rU+1aIS7X7ZwMmlKIvuBfLOqziBCjXSVCdAZmItRyKUpvW+qRVbm0ie8kRpPUKO
	37JJRIRO1
X-Received: by 2002:a05:7022:1706:b0:1ac:7044:2bad with SMTP id a92af1059eb24-1ac70442d69mr16257030c88.36.1793699655876;
        Tue, 03 Nov 2026 01:54:15 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:9e8b:5db3:accd:585c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm44178383c88.12.2026.11.03.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:15 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next 4/5] wifi: rtlwifi: rtl8192du: enable USB RX aggregation
Date: Tue,  3 Nov 2026 17:52:53 +0800
Message-ID: <20261103095256.949327-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103095256.949327-1-hjf3108@gmail.com>
References: <20261103095256.949327-1-hjf3108@gmail.com>
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

Allow RX aggregation of up to 48 pages of 128 bytes or 24 with two MACs.

Test results (2.4 GHz):
   before after
TX 5.2    6.4
RX 27.1   32.0

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../wireless/realtek/rtlwifi/rtl8192d/reg.h   |  4 ++
 .../wireless/realtek/rtlwifi/rtl8192du/hw.c   | 18 +++++++-
 .../wireless/realtek/rtlwifi/rtl8192du/sw.c   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8192du/trx.c  | 45 +++++++++++++++++++
 .../wireless/realtek/rtlwifi/rtl8192du/trx.h  |  5 +++
 5 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
index 639aa0d92e05ef..7cc46f411af88b 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
@@ -329,6 +329,7 @@
 
 #define REG_USB_Queue_Select_MAC0	0xFE44
 #define REG_USB_Queue_Select_MAC1	0xFE47
+#define REG_USB_DMA_AGG_TO		0xFE5B
 
 /* ----------------------------------------------------- */
 /*	Redifine 8192C register definition for compatibility */
@@ -940,6 +941,9 @@
 #define ENSWBCN					BIT(8)
 #define ENSEC					BIT(9)
 
+/* REG_TRXDMA_CTRL */
+#define RXDMA_AGG_EN				BIT(2)
+
 #define HQSEL_VOQ				BIT(0)
 #define HQSEL_VIQ				BIT(1)
 #define HQSEL_BEQ				BIT(2)
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
index ff458fb8514dae..3edd5bc432ff7c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/hw.c
@@ -489,6 +489,22 @@ static void _rtl92du_init_retry_function(struct ieee80211_hw *hw)
 	rtl_write_byte(rtlpriv, REG_ACKTO, 0x40);
 }
 
+static void _rtl92du_init_usb_aggregation(struct ieee80211_hw *hw)
+{
+	struct rtl_priv *rtlpriv = rtl_priv(hw);
+	u8 page_count = 48;
+
+	if (rtlpriv->rtlhal.macphymode != SINGLEMAC_SINGLEPHY)
+		page_count = 24;
+
+	rtl_write_byte(rtlpriv, REG_TRXDMA_CTRL,
+		       rtl_read_byte(rtlpriv, REG_TRXDMA_CTRL) | RXDMA_AGG_EN);
+	/* unit: 128 bytes */
+	rtl_write_byte(rtlpriv, REG_RXDMA_AGG_PG_TH, page_count);
+	/* A larger value is a shorter timeout. */
+	rtl_write_byte(rtlpriv, REG_USB_DMA_AGG_TO, 6);
+}
+
 static void _rtl92du_init_operation_mode(struct ieee80211_hw *hw)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
@@ -712,7 +728,7 @@ int rtl92du_hw_init(struct ieee80211_hw *hw)
 	rtl_write_dword(rtlpriv, REG_RARFRC + 4, 0x08070605);
 
 	_rtl92du_init_retry_function(hw);
-	/* _InitUsbAggregationSetting(padapter); no aggregation for now */
+	_rtl92du_init_usb_aggregation(hw);
 	_rtl92du_init_operation_mode(hw);
 	_rtl92du_init_beacon_parameters(hw);
 	_rtl92du_init_ampdu_aggregation(hw);
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
index 88e8cc590c544b..6b90002b69f41a 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/sw.c
@@ -238,7 +238,7 @@ static const struct rtl_hal_usbint_cfg rtl92du_interface_cfg = {
 	.rx_urb_num = 8,
 	.rx_max_size = 15360,
 	.usb_rx_hdl = NULL,
-	.usb_rx_segregate_hdl = NULL,
+	.usb_rx_segregate_hdl = rtl92du_rx_segregate_hdl,
 	/* tx */
 	.usb_tx_cleanup = rtl92du_tx_cleanup,
 	.usb_tx_post_hdl = rtl92du_tx_post_hdl,
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
index c608c51f1b785c..13364cdc7fa367 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.c
@@ -19,6 +19,51 @@ int rtl92du_tx_post_hdl(struct ieee80211_hw *hw, struct urb *urb,
 	return 0;
 }
 
+void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
+			      struct sk_buff_head *queue)
+{
+	struct rtl_priv *rtlpriv = rtl_priv(hw);
+	unsigned int offset = 0, pkt_size;
+	struct sk_buff *new_skb;
+	__le32 *rxdesc;
+
+	while (skb->len - offset >= RTL_RX_DESC_SIZE) {
+		rxdesc = (__le32 *)(skb->data + offset);
+		pkt_size = RTL_RX_DESC_SIZE +
+			   get_rx_desc_drv_info_size(rxdesc) *
+			   RX_DRV_INFO_SIZE_UNIT +
+			   get_rx_desc_shift(rxdesc) +
+			   get_rx_desc_pkt_len(rxdesc);
+
+		if (get_rx_desc_pkt_len(rxdesc) == 0 ||
+		    pkt_size > skb->len - offset) {
+			rtl_dbg(rtlpriv, COMP_RECV, DBG_WARNING,
+				"bad frame at %u of %u, size %u\n",
+				offset, skb->len, pkt_size);
+			break;
+		}
+
+		/* The last frame keeps the original skb. */
+		if (ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN) >= skb->len - offset) {
+			skb_pull(skb, offset);
+			skb_trim(skb, pkt_size);
+			__skb_queue_tail(queue, skb);
+			return;
+		}
+
+		new_skb = dev_alloc_skb(pkt_size + RTL92DU_RX_HEADROOM);
+		if (!new_skb)
+			break;
+		skb_reserve(new_skb, RTL92DU_RX_HEADROOM);
+		skb_put_data(new_skb, rxdesc, pkt_size);
+		__skb_queue_tail(queue, new_skb);
+
+		offset += ALIGN(pkt_size, RTL92DU_RX_AGG_ALIGN);
+	}
+
+	dev_kfree_skb_any(skb);
+}
+
 struct sk_buff *rtl92du_tx_aggregate_hdl(struct ieee80211_hw *hw,
 					 struct sk_buff_head *list)
 {
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
index 8c3d24622fa7ce..807245a91bbee3 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
@@ -18,6 +18,9 @@
 
 #define WMM_NORMAL_TX_TOTAL_PAGE_NUMBER			0xF5
 
+#define RTL92DU_RX_HEADROOM				32
+#define RTL92DU_RX_AGG_ALIGN				128
+
 #define WMM_NORMAL_PAGE_NUM_PUBQ_92D			0x65
 #define WMM_NORMAL_PAGE_NUM_HPQ_92D			0x30
 #define WMM_NORMAL_PAGE_NUM_LPQ_92D			0x30
@@ -56,5 +59,7 @@ struct sk_buff *rtl92du_tx_aggregate_hdl(struct ieee80211_hw *hw,
 void rtl92du_tx_cleanup(struct ieee80211_hw *hw, struct sk_buff  *skb);
 int rtl92du_tx_post_hdl(struct ieee80211_hw *hw, struct urb *urb,
 			struct sk_buff *skb);
+void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
+			      struct sk_buff_head *queue);
 
 #endif
-- 
2.53.0

