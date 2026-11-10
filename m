Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297724;
	b=RriZjrNClHwkd+ZN+XGPD2N7bOnx+DKZMNul95OXUiT28cehbEjAj9lQDoCwGSp1WIKu
	 r6J1itNid6KCJGp5qmdOOZahIPpp/cpMySkpiqwmAE07mMidGB496fIfDWHbSkyDLF5sM
	 zYDUW8Jpf8WuAEAfEspBrNcsc5w1Lmq69zbvAVftu0nP8OT6xvzRYyk4OiuyuR/LaB7zr
	 GIiSiNu0WO9L90Li2dsVJHRe9da+wiq6/3Bu1N5qhqBQaux0G3aiUKaYUSTRey1gMx13Z
	 9iIfETku3HzrseienrBW92Hn8yIGBTfV+CRXjRdSLjoMLcXUq8ojvsC77OP161MqyXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
	b=rzBFvXcgQcTYHON2LrDP4tPA/T6vxsaH7bVxUp8SMmFbOQ3h1zij5aqaPPrtK/b9QfMe
	 W317B2AB0+oPK/V6im7NvZcpGhYR/RzesA60iWg6m+yTr0KSZ/hGi29KD2ZPvkrLp5tKN
	 eUJ3CKfpiGbhTrZwYt/cn59J5OTn4d5yawKK1Fhcx17z4XElnqazHv3NsSfH0kgtqWPDt
	 PmaFv510dGZADURsl8wASQBscTOEzrcblZNQ45mpZwOMRce7wvKnFLRNuAgvy2ChExyNj
	 mL4REQ/9Uv7YpN5OYp52NDZ2MK5FKhNfetOGQJDcFy/ORVQA8dYo3aJ9fIeMvMSqRew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wO067gq3;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685F46077D64
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685F46077D64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wO067gq3
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1063066a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297724; x=1794902524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=wO067gq3LmKNCVoIiRw245+TGcAlx95qB1NCJayKlIUjALgoFa/dptHUIgfK2AlARV
         /oE3CkEkZ0ih7qQ20Fy4w8W1UwMYqeV55WJGrVZK57Ui1eMCVkRIdxGdJZUOzvD3y53u
         9vh/bFKI9dELJi+kFSfXRjTlqaX5C68+hzomh5yX7Yn2+PcqYobrKGbEK9VaW9BIj0Mw
         TbG/l4CCX4rY8D8GxPUU/AnxH4zjQS48ZA3T9HiHofBO3uwWEnMzNr6MfQW4kVNJbkKb
         X2sFinV8Bl/PkJ4AlExAwHYWH0kkynaJr0m3KtChRC5X/qgi9lQdIwweJyyuJuH5NDbw
         lk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297724; x=1794902524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cig+jScI/TQIlFINEQ7/KEmc9aqF9xYIoI0bZxnjsQU=;
        b=SnE2aTi98w5t2kmne3WmN+mq5QojBHhbZbT6TaabaR5TiAlh1o9bhguuElcrSujrTf
         LA08BQhknSYbO08r9RIGbRQwXal35Nu3uqORgUbBSP/RowwsLCbDZ4KIAN4ZsfZBsvbh
         xb67W0NsF7pqci5XGupp0xBeXEBz+lwmnecig4QUsjmgnaYLQ/Fvd5mrz0JX/zwoF7Qd
         rUaxhlj3J1Ks0cPYn/0eViFSIhaa1URiZvJWL2XL9RqGyrfrvjqBacv/U2ASDHIbmjOr
         wBzuNWJMyDpEOBxEf3W5uwC1nF9l0LjmKrTWrjSNt7SfvsBplqKuTfhAlbzFc5rhQMfy
         P1jQ==
X-Forwarded-Encrypted: i=1; AL+hErFa0Gy89ADIiQKNk1DMYk7u19ABNsBJOwcmIrVbOnBRxC9tUHrXJl0X3ndzdF+5oe8748PiyqtLxJcyiwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XKsXZB6RArew11Ed4W2VKaBzYa7Vg6fE2NfEAExrQQUiAzccR
	lqUm3OW6bldkWd6TaHDfH35z3LdgzQIVWCGJMV83+erBxhgjl5bSSbpK
X-Gm-Gg: AYBFou1BOu8EjJwXO3C3CucZd3oBKyG3Yl9Hd4IKvu5bsr0l+4DiZFYXizpn9FLcvfr
	G/eF+S8NgG44nKuc7+00xts0MIfbWvrB4Gufn2kaso0SZkbsXCcIYAFalV3PkdT2EkLCrDGGCPU
	ycykiHAmqSp7LNOxR8PpEcqi9pYuDf/dDnfdPr0W2JgSBCHubsK7zw9gEOCzKJ3JMwFmaubZdsj
	0OinmIvvtHUPDACoZcONCyisDNrOhD+XEr5t4jjiGr5LRUlC+JwydsdLbm55XVGEBpjqJEp5YIU
	lAoiFCHg43j2dbQgPhWyjCaGINOsBuZC2lel8/bf1KJumd2MZBLCNF/qj++dxsabaIkGSNQ6R4H
	a70JuWSN5D2lLgj3Hcp49IZA3b5HInuYrERjVpVgogXi2+vPpqNEHj3Df0HmqOyEGUwKBuDYKwh
	xBUNH6nFqVqQ7j4NHUX8wGFa66klZBQGR0oMCGDYV6zdcxyg7sf8tMHnakVgjInGcH5jq8X0UsP
	psrP5qh+j6PtFncWGbjjctU3iG1p5aQKWSixXrEqQTeXEzi4S2QGjO2un8cbFd0C6ME5ChTi3pD
	hxEmRuOTksMpV5e3SwmUnDrVFjjPmwJ/tJszWBM+a8hdDtlBGjjJ9SHyO9DqIdKsPiSg++NHbmU
	wz9twy+owLQ9O9B1bQYUfArQaNebMKA==
X-Received: by 2002:a17:90b:2885:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3b166cc15d1mr1750001a91.23.1794297723479;
        Tue, 10 Nov 2026 00:02:03 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:b87c:eff1:b55f:23de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm2906627a91.5.2026.11.10.00.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:02:02 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v2 3/5] wifi: rtlwifi: usb: unify the RX code path
Date: Tue, 10 Nov 2026 16:01:39 +0800
Message-ID: <20261110080143.1362021-4-hjf3108@gmail.com>
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

_rtl_usb_rx_process_agg is a copy of _rtl_usb_rx_process_noagg
except without the tail end. The noagg function can be used for
aggregated frames, so drop it and rename _rtl_usb_rx_process_noagg
to _rtl_usb_rx_process to unify the code path.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 52 ++--------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d013e59869..d7b3192262 100644
--- a/drivers/net/wireless/realtek/rtlwifi/usb.c
+++ b/drivers/net/wireless/realtek/rtlwifi/usb.c
@@ -366,50 +366,7 @@ static int _rtl_prep_rx_urb(struct ieee80211_hw *hw, struct rtl_usb *rtlusb,
 	return 0;
 }
 
-static void _rtl_usb_rx_process_agg(struct ieee80211_hw *hw,
-				    struct sk_buff *skb)
-{
-	struct rtl_priv *rtlpriv = rtl_priv(hw);
-	u8 *rxdesc = skb->data;
-	struct ieee80211_hdr *hdr;
-	bool unicast = false;
-	__le16 fc;
-	struct ieee80211_rx_status rx_status = {0};
-	struct rtl_stats stats = {
-		.signal = 0,
-		.rate = 0,
-	};
-
-	skb_pull(skb, RTL_RX_DESC_SIZE);
-	rtlpriv->cfg->ops->query_rx_desc(hw, &stats, &rx_status, rxdesc, skb);
-	skb_pull(skb, (stats.rx_drvinfo_size + stats.rx_bufshift));
-	hdr = rtl_get_hdr(skb);
-	fc = hdr->frame_control;
-	if (!stats.crc) {
-		memcpy(IEEE80211_SKB_RXCB(skb), &rx_status, sizeof(rx_status));
-
-		if (is_broadcast_ether_addr(hdr->addr1)) {
-			/*TODO*/;
-		} else if (is_multicast_ether_addr(hdr->addr1)) {
-			/*TODO*/
-		} else {
-			unicast = true;
-			rtlpriv->stats.rxbytesunicast +=  skb->len;
-		}
-
-		if (ieee80211_is_data(fc)) {
-			rtlpriv->cfg->ops->led_control(hw, LED_CTL_RX);
-
-			if (unicast)
-				rtlpriv->link_info.num_rx_inperiod++;
-		}
-		/* static bcn for roaming */
-		rtl_beacon_statistic(hw, skb);
-	}
-}
-
-static void _rtl_usb_rx_process_noagg(struct ieee80211_hw *hw,
-				      struct sk_buff *skb)
+static void _rtl_usb_rx_process(struct ieee80211_hw *hw, struct sk_buff *skb)
 {
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
 	u8 *rxdesc = skb->data;
@@ -470,8 +427,7 @@ static void _rtl_rx_pre_process(struct ieee80211_hw *hw, struct sk_buff *skb)
 	WARN_ON(skb_queue_empty(&rx_queue));
 	while (!skb_queue_empty(&rx_queue)) {
 		_skb = skb_dequeue(&rx_queue);
-		_rtl_usb_rx_process_agg(hw, _skb);
-		ieee80211_rx(hw, _skb);
+		_rtl_usb_rx_process(hw, _skb);
 	}
 }
 
@@ -490,11 +446,9 @@ static void _rtl_rx_work(struct tasklet_struct *t)
 		}
 
 		if (likely(!rtlusb->usb_rx_segregate_hdl)) {
-			_rtl_usb_rx_process_noagg(hw, skb);
+			_rtl_usb_rx_process(hw, skb);
 		} else {
-			/* TO DO */
 			_rtl_rx_pre_process(hw, skb);
-			pr_err("rx agg not supported\n");
 		}
 	}
 }
-- 
2.53.0

