Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614198;
	b=LTl+FW7uP93cth5qe0eNJUN30jboe7BmNAPJZfnqy3M4N6Sm2UWbxJQ9wpBnWnvo87XK
	 BSG0pnXdVHTWk0J4qCZ6wHTO6ly/l3avUu6ZcLdycSuL6f7N5YqBiCf2BK+xF7HIWpcIz
	 0Pi1V/C8JJIxYKjNGU9Peq1xBRUC7Jf5L61r7ffY9xWnBI0hlUcAlnrQFesgexviNGgtr
	 qeYSbNtOHEDnEaIGwUh2b7CG2ji+oWmAHeat9S6Oo8ABGAUrmVqD3PJFHAKC4h2u9U71e
	 FyzXgeTPCveP+FMtLVHDrIleySHo8x8X0VwS03kG1rZ1Cu9t06X6MH528lx7jfvWHBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614198;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=ngFKEAsF899oSEFyF8SO7bMi7/1RzoZH+Fq2aKROz/M=;
	b=Oy4Zpk2lucnAXvd7PuhsgD5ukgM3ZU42+3V05u35UVtZvhb/JLWMv6t0FsIDkBWZ3o7K
	 JyVmxug29BJuYu5gfMH8L6ymZwY4Lu+J39h7aRb8uyLbWVomySASP5FwWxIt2WSsxIRqQ
	 GzUaxfD34c5OeY41gLwQVE6h5cbB4xbx9dbOkT6sC63dZ4tYCUW32RQZU0VgyP8Jsvfmr
	 FGXxqrKdrxIDGL7VothwOGtDAw+P0cWIadQUsh5jS/Xs4zDeZwXhjr25QshBQi+hbM6CT
	 t+uzmkbhCa8zQ5NHlbHejoWew7j6RlNGvAmOzCMv4P1q93R8gH6N2HIDl2NVtov/KKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=IIV3zWYe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9817606A33B;
	Fri, 13 Nov 2026 23:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9817606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=IIV3zWYe
ARC-Seal: i=1; a=rsa-sha256; t=1794613954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Duf/aAjqeuUcPjoMprCvXk96NhVh/KARWmQ/ZwsjYpbfC0iLKLEv4raKEgDopCJ7m76YsW+yi3lZmAfCYe7Tvs8w7QYJfqcrLf+4QBj2BwFyd9sa0fN0htvCCtxUArPXjKfKf9OxEL48JQqu/nG5Rtj2Zh6GFSd/CLG4ZPKxw3g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613954; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ngFKEAsF899oSEFyF8SO7bMi7/1RzoZH+Fq2aKROz/M=; 
	b=EAm8jRqqH5U5VwiabdLKx2wSWPJXTJRd5nLCqEw/GfeXSZ7ERFFLCec6bDmgBOVekmkcikCp3nLb9zWvIhbs3UzZvDLDzsE2lx1EJ8EKJATvAG7Vea88ektP1yGBeeOXB9irpYjB6Z8Q68XpejLTK+KmG9AHghRRP13cm/ju0gg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=IIV3zWYec+d5E29Z5FnAA4WdT6BVQ5l1Ex9GDWUANMtENlTvioHPuoHEOv/Wrp0OrNB//3lAXv1uVg7u+kKK8Wa406hoRXqN+yiJbxacIhN+bBQGAxw1ABtWvP0nsadazWAZsh60XnQ5Qz4ALZidydPa0qFTgrsUlvGSddFnbgBdTz34YJMI3m1XN5ZOg3wWLjl+coTa2wPZo+YUP1jYQMlJLsLXO0RI57P0/mzQJNbH6m6vyRm+kfLckltI/sqjASoypiW/tr/vW8vJ7rMQZnPAYkI3nGDp0f8Rz0n4NofAXXNKobh7c3zWuas6vP+gBxyE3FkIdoW2mJL2IrxVEA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=ngFKEAsF899oSEFyF8SO7bMi7/1RzoZH+Fq2aKROz/M=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794613952617362.89424395523304;
	Fri, 13 Nov 2026 15:52:32 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 08/10] wifi: rtw89: skip host-side TX hooks for injected frames
Date: Sat, 14 Nov 2026 04:52:09 +0500
Message-ID: <20261113235211.1911-9-owner@ph4ntom-rev.uz>
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

Several TX hooks assume frames that were built by the local network
stack for an associated link:

- rtw89_traffic_stats_accu() and rtw89_core_tx_btc_spec_pkt_notify()
  inspect ip_hdr()/udp_hdr(). For frames injected on a monitor
  interface the network header points into the 802.11 header, so
  traffic statistics and BT-coexistence notifications are derived
  from unrelated bytes.
- rtw89_wow_parse_akm() records the AKM from (Re)Association Request
  frames for WoWLAN, which an injected frame must not change.
- rtw89_core_tx_update_he_qos_htc(), rtw89_core_tx_update_ampdu_info(),
  and rtw89_core_txq_check_agg() mutate QoS/HTC headers, enable A-MPDU
  aggregation, or start/stop BA sessions based on link state, while
  injected frames are expected to be sent as supplied.

Skip these hooks when IEEE80211_TX_CTL_INJECTED is set.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/core.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 7003c24..84c12c6 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -1351,9 +1351,11 @@ rtw89_core_tx_update_desc_info(struct rtw89_dev *rtwdev,
 		break;
 	case RTW89_CORE_TX_TYPE_DATA:
 		rtw89_core_tx_update_data_info(rtwdev, tx_req);
-		pkt_type = rtw89_core_tx_btc_spec_pkt_notify(rtwdev, tx_req);
-		rtw89_core_tx_update_he_qos_htc(rtwdev, tx_req, pkt_type);
-		rtw89_core_tx_update_ampdu_info(rtwdev, tx_req, pkt_type);
+		if (likely(!(info->flags & IEEE80211_TX_CTL_INJECTED))) {
+			pkt_type = rtw89_core_tx_btc_spec_pkt_notify(rtwdev, tx_req);
+			rtw89_core_tx_update_he_qos_htc(rtwdev, tx_req, pkt_type);
+			rtw89_core_tx_update_ampdu_info(rtwdev, tx_req, pkt_type);
+		}
 		rtw89_core_tx_update_llc_hdr(rtwdev, desc_info, skb);
 		break;
 	default:
@@ -1477,8 +1479,10 @@ static int rtw89_core_tx_write_link(struct rtw89_dev *rtwdev,
 	tx_req.rtwsta_link = rtwsta_link;
 	tx_req.with_wait = !!wait;
 
-	rtw89_traffic_stats_accu(rtwdev, rtwvif, skb, true, true);
-	rtw89_wow_parse_akm(rtwdev, skb);
+	if (likely(!(IEEE80211_SKB_CB(skb)->flags & IEEE80211_TX_CTL_INJECTED))) {
+		rtw89_traffic_stats_accu(rtwdev, rtwvif, skb, true, true);
+		rtw89_wow_parse_akm(rtwdev, skb);
+	}
 	rtw89_core_tx_update_desc_info(rtwdev, &tx_req);
 	rtw89_core_tx_wake(rtwdev, &tx_req);
 
@@ -4740,6 +4744,9 @@ static void rtw89_core_txq_check_agg(struct rtw89_dev *rtwdev,
 	struct ieee80211_sta *sta = txq->sta;
 	struct rtw89_sta *rtwsta = sta_to_rtwsta_safe(sta);
 
+	if (unlikely(IEEE80211_SKB_CB(skb)->flags & IEEE80211_TX_CTL_INJECTED))
+		return;
+
 	if (test_bit(RTW89_TXQ_F_FORBID_BA, rtwtxq->flags))
 		return;
 
-- 
2.56.0.windows.4

