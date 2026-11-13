Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794614200;
	b=d//CXlE24HlkJlpIlnlTnrA8TM6ME3/PorWu/ckQiRLFOX+DBmySkCHKqfmqisAQa2P9
	 9F9lbd2fvdK70CPD2UPhIeRPjXG2TUVss8NHlchWGCqs+oR+TcUoRYgwULVU2FSXBTAxM
	 Ijf5pqwKNoAJ1yW6DHjehubNAenEIGdtUw+ERMwN+AqpR9sDnXjbnLLSw2TgKNGioVX+S
	 tJhjyOGTs3nTFD7X+vunhrX8yR+nGjlVVHkabX5+XUYkK/y6SI3Er0awts3ekLV8piiAT
	 Qj2hbYxbfBgPQR/UBGfFNT+6qZKJqTIPX5R9xYSXo+UhDCsscSxWiSAvjN+7hZCGk1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794614200;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=P8bycvkfomLRXVOkfK0FCOArvKSEUbSzJVACNANUyoU=;
	b=IV9s6/xFhOclAHc8poiqoWNTzX6zaEAOhpV3KwMCsDEqKlbkDzdQUTG/rxqVE3HHuI5q
	 JnkYz/L66o0BuClu49GNnALfOde+LupMr8w7DzTlt5+GAEUwC4wkrRWUC+TwsXV08b+gS
	 nURmy5Orloowc9Psu0z+YCTVw3s1Y1gw23x7RnPez6zs/5tkdFZhiffjvb4qiCBumfvyq
	 tcDSzrjduO+1yoIZZz+toJkUoD8Fm3CH26cnprOdVEeRNV7u9OGPJ9jG+w0j2HjdS1/JO
	 fFCXwZ5m3ks6sfcRSFm9H/STQTD6/RepDYRnwqg8rw6g46Cq7ctMGyPo2YFc64eKkAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=A0UX+xuk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD20606A882;
	Fri, 13 Nov 2026 23:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBD20606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=A0UX+xuk
ARC-Seal: i=1; a=rsa-sha256; t=1794613958; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ms+gpiJzRw8eygDKoB3tHJXIvvTm0khP4KPX+HSBdw9YrV16av5dH1tF0meblyKS1Pzr6e24YOsHgJ0E2hMvVnhj2Jv9X/rc4YMTy5ZJSrw/FO0ksjq2T/dbANOf29M9lq6KHwPnJR834pU7l/6L9NE1gN0emvI4G+IYzMphSjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794613958; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P8bycvkfomLRXVOkfK0FCOArvKSEUbSzJVACNANUyoU=; 
	b=Zra0NTwMqzyX0tbsYSJBSPHq3t6gBZ/fZ3QH08DtEbalJRPvtEfjv9WpXBTBQ7Q+hoFhWBKt6KdWYWZamDL77fy6ma2pV22b/3Os+7FFaLjB5f8WqHzNx0UqRAlBjJaAmwFtJuKSqB5GA3gvquZ/894DsXs5csrP4HlP2+CzdVg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=A0UX+xukaQEnDC6pRDbgJBjOOHYLQTXpCN17ogQsuLNf7Ip+qbdnoGK/9S2LiFWN4+v+s4SpbSm7Kdfj0ckQqFUAflkx7ZJnlwwSrb5hALi55/xX6qSvoO3je1OZPAVq6LpJEQqZiQzcpCJQdl5/yKntTt7XmLfZYGU1bqAmZp0cLM78h2fteczjVy16GjXQpc+sgBvCai6oAegxpXROy8cPv0ID6HBCL81JPG+SPwJtI8NgYtjGirPFO5DNRH954EDeykog4EtTk8Ef2cfB8nayArM+s6zayboFTMgM2ef1uFR+qrl4qFeLZOvMh0FU9CCMKGqQJLAe2+k53m6MjQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=P8bycvkfomLRXVOkfK0FCOArvKSEUbSzJVACNANUyoU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17946139568231023.2104679801466;
	Fri, 13 Nov 2026 15:52:36 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Enver Ikromov <owner@ph4ntom-rev.uz>
Subject: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Sat, 14 Nov 2026 04:52:11 +0500
Message-ID: <20261113235211.1911-11-owner@ph4ntom-rev.uz>
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

rtw89_alloc_ieee80211_hw() disables native chanctx callbacks
(ops->assign_vif_chanctx = NULL) and relies on mac80211 chanctx
emulation via hw->conf.chandef and rtw89_ops_config() whenever
chip->support_chanctx_num == 0 or the loaded firmware lacks
SCAN_OFFLOAD or BEACON_FILTER (for example on RTL8852AE with firmware
0.13.36.2, where support_chanctx_num == 1 but BEACON_FILTER is absent).

When the last monitor interface is brought down or deleted (or all
interfaces become idle), rtw89_ops_stop() / rtw89_enter_ips() powers
down the MAC/BB/RF and clears the RTW89_PHY_0 entity state while
mac80211 retains local->hw.conf.chandef. When a monitor interface
(including a concurrent MONITOR_FLAG_ACTIVE interface alongside an
unassociated STA, where __ieee80211_recalc_idle() clears
IEEE80211_CONF_IDLE without setting IEEE80211_CONF_MONITOR) is brought
up on the same channel, rtw89_ops_start() sets RTW89_FLAG_POWERON
without programming the channel (so rtw89_leave_ips() returns early),
and ieee80211_hw_conf_chan() omits IEEE80211_CONF_CHANGE_CHANNEL
because chandef is unchanged, leaving RX/TX silent until a manual
channel change.

In rtw89_ops_config(), when IEEE80211_CONF_CHANGE_IDLE or
IEEE80211_CONF_CHANGE_MONITOR leaves the device non-idle on hardware
without assign_vif_chanctx and RTW89_PHY_0 is not yet active, apply
hw->conf.chandef and call rtw89_set_channel(). When
IEEE80211_CONF_CHANGE_CHANNEL has already configured RTW89_PHY_0, the
entity state check avoids redundant RF calibration.

Signed-off-by: Enver Ikromov <owner@ph4ntom-rev.uz>
---
 drivers/net/wireless/realtek/rtw89/mac80211.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/mac80211.c b/drivers/net/wireless/realtek/rtw89/mac80211.c
index c8a6003..3649a7a 100644
--- a/drivers/net/wireless/realtek/rtw89/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw89/mac80211.c
@@ -152,6 +152,17 @@ static int rtw89_ops_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 	if (changed & IEEE80211_CONF_CHANGE_MONITOR)
 		rtw89_physts_parsing_init(rtwdev);
 
+	if ((changed & (IEEE80211_CONF_CHANGE_IDLE |
+			IEEE80211_CONF_CHANGE_MONITOR)) &&
+	    !(hw->conf.flags & IEEE80211_CONF_IDLE) &&
+	    !rtwdev->ops->assign_vif_chanctx &&
+	    !rtw89_get_entity_state(rtwdev, RTW89_PHY_0) &&
+	    cfg80211_chandef_valid(&hw->conf.chandef)) {
+		rtw89_config_entity_chandef(rtwdev, RTW89_CHANCTX_0,
+					    &hw->conf.chandef);
+		rtw89_set_channel(rtwdev);
+	}
+
 	return 0;
 }
 
-- 
2.56.0.windows.4

