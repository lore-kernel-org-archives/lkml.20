Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699654;
	b=clM6hGoYWgvxefc7ZIyKbZdtj7BfV9UKFNk+FEMmC9PwxgY8+rKCFyVOodXgugg9UlcJ
	 s2Ab390KcZLdT7xyhUglA3WPv9FL/tEwPpmuKZ2XORnaNZcb/5yo3qnrcDR7mil4/pP+p
	 DAumlBppGIe7tijH4qKceh71G3EgqsXnU5WVeK7/XqSya4DiBnT4pB05X+WNM9zWf5XX3
	 jDbpQ+Y7cRtQ5Q7lOtOqmHyUKcCKEdswlDJkCHFP3KapTL1vV0MMRcMS6d82ylvCKJ57P
	 oBg/sLcxuyFquYCiKI1JJNLCkNX+I/+C5BoJ8ye+xaz2NRh/dVsti81tVuK4ETXiRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VH9rnPZxjjFJRh7v5jB1tJ74r1hNDJAcatTrJyGbn28=;
	b=gN7T1xXCHHNnzrRs0ON/PjpEOd7gM9qLw5jQ9JLItfDu38alP4cPMEK7vfykeVt2n7kt
	 Xo2VmnC+dmnpqNoXsRmEJllv90/+ziZ7kErbg8bGsHmQZYCZVREhr6CvJ7xHEvOfF7Yuw
	 XKDoO6xBbNsCgMEnsDxn1zXcELrfBEcgr8sAtqdVQM9RsihF2uz5Eb2FsoYf0t3TuHpsH
	 AYtLYok5a0WeK428yQZw3DtHwpWd1XIKfQFAu9AAe7gI876/CRdkSBzpTV02qvwvn60vr
	 mxpCumL8tbYdAvoHh1/9roPIF1dwTIFdIwbviBj22AcsuljCfpdIjyOoRZdMrJwqUiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znowCaag;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970B60850A2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5970B60850A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znowCaag
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b1ce85287aso1896998c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699653; x=1794304453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VH9rnPZxjjFJRh7v5jB1tJ74r1hNDJAcatTrJyGbn28=;
        b=znowCaag/T/6wn73dbKGw8K3eAxraIpXmNquQaSzH20Kkg5njNJ+r/aEETTgLvYSUY
         zDCo5mPpeG/xFfp8vBdrq81Vz6kQwB2LyI3HI+LZ9rRQK3VWp1yEXEhha0fOfP/IT+Y1
         I9Ui59lEkDHfrwnG9FmRQIfM5fB/cGps+YrTVI/NRyL1n1ZVsB6n08A5M45SfjAkPgpm
         HdAqupqSO0zJa/zNHn1nQzWo8zcniFa8llMV1sD7EcOHagooZ+r/Zsbb7PfBFXMo0JWB
         aAV2CsvZiEUkonyLusGmKAxcvFUSJzINNcA8KqlSSTGXYyo1yRQMvrourGSqJOYIDp4+
         clJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699653; x=1794304453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VH9rnPZxjjFJRh7v5jB1tJ74r1hNDJAcatTrJyGbn28=;
        b=2HrLNsUt4gHz4I0gHaGvdIzc2k4eBNRbBS3eJkYiiedfDW1ooO4pWuyLSq7hUPW7Ya
         rDa85BQehkwEw3tXyD7oYLnVGuWjgzLk8cYQ/jNLNSORE5rcBWXD+Ysvs91PzgyuAbME
         s0FRHSVbQaqAN5XIkyciN5IPg9XCh6UGvxHJO2Cqq1uWzRPe06M3XGeJpZcPqjkTLD7M
         nAgID5zI+1xMypDtah0S0oBd9fDFI6uOVYTt6wc9LwILyWZmekCcGzd/KEwYprOWJlVx
         TboRSNhpeGzoKDF7NE0UM3Di+z1HGVBkALYi+gJNG1me5dgxX0RiVw7dwTWLUGfan69K
         jxxA==
X-Forwarded-Encrypted: i=1; AKwUvBwxSrEuuk28+4xOCpItYLeJDbjQVuY/HiwXq3CsFyqy7nUvr8YQMtbJ1Wt0/TrqSFLGMMPl/5NnCgjoJGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qMxmqyBhIVylPDbzjpkDyVQootJ3M6vUF2QqOMkQK4zfe/9/x
	fOoerYF4ihbE4YWpc0o+GkOKuhHJYuA47JpfIHc/S/u8WELIhgnl0kon53BlRA==
X-Gm-Gg: AYBFou1g6GpbUwicS3sFCUJxQAHfWiI9JDYDOOl6iwgP+yEJCEoea7iiNI4dlKSZLhy
	FTfTwO3atHawBfVvf0Y0F19RvoS3Q0xXteEvMt2Pm8ODI5injMPpokkS+bZF0nj59B0QnuVWQ5u
	z36zpPVCCHA9r+8PVrmaAZx7BR6c4otCVFT6l05boIF7Ess6mKhewtbrrBQVeKmOf22cPiukO76
	UDyifeedNMXnV2WQSRvtgceFfGYVA8BeyMxOElKIXJIvxxIEJMEgL+H/HwOv+Qh2uxr2iOeOPXU
	4tu37Yp15MKL5ol2/6yLlQa394jfQ9pgmAR7qIhlYZCrKl9funBSP8vQ6yi6i16JfYsqn5o8Ncl
	AF/F+Waj3Bd5S4ZL6BTy+NNUrPxiKR2px1rvOK5K5w/2Ba2yhj9sF/uH7f/rQIhAbv+Gw1vhat/
	7D7XpRn7nteWzBuWT5Wr2GjSh/+3X7W1Iw4Lvlq6vcwSVY23MytjROspnZdjsB9wJSsL15Ns0Ni
	7otnR05Uj4yAPj8aP7bXIrGDcS/LY2CIaY5PVdKA+qnvLNV4QSpUttZQ5ZMwRSD19ubgKlffEEQ
	wjlaNmGEyd5H+6XrjirTFR5RGlMptcAp/usS+gLBtCnMvqnxccL454DeDQmeRpScu2+23V1OaYa
	CAonrTEXX
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr31064985c88.29.1793699653343;
        Tue, 03 Nov 2026 01:54:13 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:9e8b:5db3:accd:585c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm44178383c88.12.2026.11.03.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:13 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next 3/5] wifi: rtlwifi: usb: unify the RX code path
Date: Tue,  3 Nov 2026 17:52:52 +0800
Message-ID: <20261103095256.949327-4-hjf3108@gmail.com>
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

_rtl_usb_rx_process_agg is a copy of _rtl_usb_rx_process_noagg
except without the tail end. The noagg function can be used for
aggregated frames, so drop it and rename _rtl_usb_rx_process_noagg
to _rtl_usb_rx_process to unify the code path.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtlwifi/usb.c | 52 ++--------------------
 1 file changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/usb.c b/drivers/net/wireless/realtek/rtlwifi/usb.c
index d013e5986948b5..d7b3192262c001 100644
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

