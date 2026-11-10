Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297730;
	b=IspYdO+UkuJMbMeibV8/pb4nARBNi3FcdbXT4bteB6RmxUgfcmsjfcCDspJuthBKsMts
	 UgGXR8GZbX1+FDf5XlCroslaI1JjBoaAfVQNED8kHsdW51Tjru3OsIbEDtLHCeCJNHeTJ
	 I/TJnHDgoEibQwDwNLlkiLPUduLiPOUAM1Yaiy56+qwFJFqZkOU7HphoL/2RncCC/cJJz
	 S/d+gWN4YmKpd9+ilVBbmmbRkLRtIsFW+MSLWUbgha+4vDZKyl/mvJBYIW9YkmmF3C8tA
	 6N2qJw7LMMoc4dTBKnQIDOBy0Xr3maXsA8IUzTCdRkxEghlRRMIRgEEg+8gZ86F9UWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
	b=bC/CDnyNFsgyIvnoPZtLtYmEtuyVq+9e+d0oIt06upqB4+FJKOrspXuZlqOUhh9zmZ2u
	 h1bRJoQn+Vbk+lfbDI/h1/xCW5nXKcW27pti47HA8VZQNXS7bOTpDK4j7PzkWXP9XdNcu
	 vvg+cNBXjupB+qkmh6sRE0NKhZW5cCQOFhw/T4lQ2jT/pm1SkoonD8j80jGK/5hk82jXe
	 QIj9M8ZDGJLgbUxAEAVI6/jVuguypmCaTtyyg+GK3XMqUl9X3b0zbslt4genqAdSRxrLH
	 Ox3EYDcRuQ9tuwtzCUVtbgHkQETOvVIp3RAJaQhg5IqxaxcL250ry2ePXcAPBgMyKUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkmUX8fS;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C1B60A260F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C1B60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XkmUX8fS
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso819246a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297729; x=1794902529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=XkmUX8fS3amNZJIYM2vhvIltjBGKUy3zMAGUEvjuatbZZYo9txfUM0C57kUAXY+rJC
         w5clIc84LOencQfONzujEGlRaIcwlRO4Wuadds1Kgzh0Mv8Eh4ud+oHNW3llvyf4Bpf3
         Dby1UxuwY2foOM4CwYBYg6QnDu1u89IfA+mm0vO/84sZtD7qqwZrWhC5KyE1MKd0ok9X
         USAwZoPgxti77zQ2dvK+tjuZ3WnK9XqpfTnepFns8sSo7SE/6JjWGVPyzP8V8/eu9LdF
         wipBZsWkXc8xst6MVOAdWgJ12BLtLdk1iykqQhebtLXC2lAEIXLi+OoO5SUDKFUyvE8r
         UC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297729; x=1794902529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/Zl64b5uRZMFqhO7EABjxKJLKRPSycq38m/Nb5ViAw=;
        b=b6pkULBFzfh0+Eyi6kkdkzsO40lK+Pl1adgm1C757tXyNAT0fBAIWKSzznYmsUMGII
         RF2lniftrPpBbLEwvnCw7EeK0qEX9GCFvQRLQ/0qP/+uBIV3Chxx6ECtEB7hKTMnlcMH
         cRkXgbHPReZWPPLVWbZyv9vKtJluFfVYm4S/oT82zsS9hETtJ31a7BjuKWHZxNYA3c/d
         atURhS/UK/Z9r7q0jeWHDYgRpxkV0P/1D1cQtU68y1R6aBdrVgHzoUBGCz4WbsRhBc+b
         xINgV7VeDy0j8RnOW7sFtJaureGPiYYDWmg8Hg0jJN14RczzViiZXmQP+BbUQEhFH6dj
         kv9A==
X-Forwarded-Encrypted: i=1; AL+hErFdyO4OVUBHxKUes46XMX6u3OeosZUbSajo9ndtQvySDmz2rNEjyxIVaKU7maZrXXa+nw6yWA54IEFru6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FelBbGU2fWvCVa2fSOONB1g5RI1+U2/0ObILrBb4jHggjnIL0
	N3paEBhZHyGwV/ld+rxrhsaiVSLf7/x4nblbiO/IJDbwKhYMrTtetYDu
X-Gm-Gg: AYBFou3E8U2M6VlQH8kfE6DSw61Bbj01oB4X4tQdbCfxYkPxDnXRsi0U4VL/5EoWQVH
	zCEo17IaHBbyd4OrD+4s6pJE3ikFx7UmrTG3fQcDMhlc2tDPOI1h6INT/gKjZ9rMisZULjqkxE9
	DcSe8/qpABbmup21fF1bRI/fn1KHZ3Ig5dZAd283rXH4tMOtrvbGfT5k80RFnYGYkdl9sTcfO0U
	1dqQVogv+J40mmkQNJNw1YemZPlEn40qArRvARZsKWkyqaDcfnDbEhhAEST1AlRUUdo4A7KywlH
	4J8oSZew2fGAqeSaR1Mjb693D4dhEeY7eELsUAx30/kri5gpkafd7Nn0gDUSBKQeM76jMlQzm/P
	SHXyGkcuyvJMPTw7vQp5v0Z/W56SHfmk9dylhrw9/+oVEtvIvnuFkYu9sgg8f1o1BRdtT4Ouidv
	QFR79okN8Nlo6IWvv2JqNYb+mlws1dQ9m9Zo3eooRqi7qWEHsWdab5/NUd7GGiFLapRlFNCgnOA
	PstkBHh8J2/pXCHrec1lxy4JY5fmeb/31oubOB4MDu0ejT+62YomRrRWHNNq8pg/6EwJsM1oWvK
	1BMQ60AelQG+nRxQkhGiZmQjKHGgeZhLXt3gP/JvGlk/xtlrZ16JsUq2V67fow3yyDHcXMDGuKc
	8/1P7xkzb
X-Received: by 2002:a17:90b:2790:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b166cef551mr2011651a91.24.1794297729263;
        Tue, 10 Nov 2026 00:02:09 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 5/5] wifi: rtlwifi: rtl8192du: enable USB RX aggregation
Date: Tue, 10 Nov 2026 16:01:41 +0800
Message-ID: <20261110080143.1362021-6-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110080143.1362021-1-hjf3108@gmail.com>
References: <20261110080143.1362021-1-hjf3108@gmail.com>
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

In an aggregated transfer, rtl92du_rx_segregate_hdl() copies each
frame into a new skb with room for the radiotap header like in usb.c.
The last frame reuses the original skb by pulling it to the frame's start
and trimmed to its length.

Test results (2.4 GHz):
   before after
TX 5.2    6.4
RX 27.1   32.0

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 .../wireless/realtek/rtlwifi/rtl8192d/reg.h   |  4 ++
 .../wireless/realtek/rtlwifi/rtl8192du/hw.c   | 18 +++++++-
 .../wireless/realtek/rtlwifi/rtl8192du/sw.c   |  2 +-
 .../wireless/realtek/rtlwifi/rtl8192du/trx.c  | 45 +++++++++++++++++++
 .../wireless/realtek/rtlwifi/rtl8192du/trx.h  |  4 ++
 5 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192d/reg.h
index 639aa0d92e..7cc46f411a 100644
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
index ff458fb851..3edd5bc432 100644
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
index 88e8cc590c..6b90002b69 100644
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
index c608c51f1b..1641099368 100644
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
+		new_skb = dev_alloc_skb(pkt_size + RTL_RADIO_TAP_SIZE_RSV);
+		if (!new_skb)
+			break;
+		skb_reserve(new_skb, RTL_RADIO_TAP_SIZE_RSV);
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
index 8c3d24622f..47d7d6ad8c 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192du/trx.h
@@ -18,6 +18,8 @@
 
 #define WMM_NORMAL_TX_TOTAL_PAGE_NUMBER			0xF5
 
+#define RTL92DU_RX_AGG_ALIGN				128
+
 #define WMM_NORMAL_PAGE_NUM_PUBQ_92D			0x65
 #define WMM_NORMAL_PAGE_NUM_HPQ_92D			0x30
 #define WMM_NORMAL_PAGE_NUM_LPQ_92D			0x30
@@ -56,5 +58,7 @@ struct sk_buff *rtl92du_tx_aggregate_hdl(struct ieee80211_hw *hw,
 void rtl92du_tx_cleanup(struct ieee80211_hw *hw, struct sk_buff  *skb);
 int rtl92du_tx_post_hdl(struct ieee80211_hw *hw, struct urb *urb,
 			struct sk_buff *skb);
+void rtl92du_rx_segregate_hdl(struct ieee80211_hw *hw, struct sk_buff *skb,
+			      struct sk_buff_head *queue);
 
 #endif
-- 
2.53.0

