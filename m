Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26707379C26
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808149; cv=none; b=HSxF+qXiCDgKhTMWNyDeVGN3EEFfbbkcqyD5Z7JsFUsseOk4lj3Slh1JtBV3irtU4hFsOtd9hI7BPYAEH3Y7nagP4TggCtrIJXLHxSuZWERJxXOmSaFwoOnvjc6Jl8XNMmkJOvJRk+8nadcI2Sy+g9o8NNHDJTKbbiT1EWMeT2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808149; c=relaxed/simple;
	bh=wwfOcqXAp5nTl+6NtE1fOP+Og6Nf8pBGaeI3tD3iD6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+JT1R7sqs4AQxUzd9SkegWWDeFCNmcA+QIqfmvyJ5QoQ2YGAfPpyBL1bLL1mAb8SckMlxjWpV+GCrnzIgz9RxipCmoKqYu7/dtpYs1HBUnB7tDsCvbJzqc3bV2Dv2satn3pHjnEmNqHmMB4s5iyLHYXqqn2m7mVuAmOSyWi1OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JG7lhmFY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG7lhmFY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so2860848f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808145; x=1789412945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyjryOFgl3/IWpjbrekzZYkUOz/Xg+LWqq/iX1jm4B4=;
        b=JG7lhmFYjy3mu0k1ZvMSH6+Jj67PGlvP2KHV+Mn/h7QJyGX1T5nkq/gnf+0qD1qOdO
         +ZMS7rqsndXKOJQplpDas05iMTgRDW5pJfpEikeFzP2R/oLHqCADNbSlO/EWFXxtx2Gd
         Ac0mJ/QGIDc0tfOw7cmzDXyweBzLH0Uobbnc72u6oLTzHyNSHme/1CYwtJrLp4A0ZFI2
         7GoDOk+3P9wz7BV/DUUcD8q8Wp85CTQXOlezjXBn4jr2QU27S65MQqPlbGWz/006lhYJ
         rQSvIfW0DdqDkeBqu7JYodjGmJn1qm7J+rHxjoVCB4KkWezc0fVmUvJlXRdGSZM8gkKg
         DceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808145; x=1789412945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vyjryOFgl3/IWpjbrekzZYkUOz/Xg+LWqq/iX1jm4B4=;
        b=sjxOgWmqgT56w4DYGIHb37/ElkZ0jWRdSAFfiS5itu+W/4EekECotQ4iko7C861zaP
         WSJqkv8hIsivgX97q1XJwXQc9k6wLO/8OuaaSrelilNrhyY3UL5eXudzVQgRu5yJneLn
         2hI1mmMQpST+psCz4IXmEaFEY7NI5iHiphU3yTaAGseU83+pRQEaJGfijL+ZmaS2KBj3
         mNgx0/HLMfiWIkyu7iHCrup59XeImFDT8P8guGfTBu/vNrCQHGyUiBqv1+d5wEb/eX8a
         8Xfr8POi/fp4XAqSpjWayV5IaAZFqm26OQxZly32bNmzjg4ebmd/aedi9gEBOHPaHJsO
         nRqg==
X-Forwarded-Encrypted: i=1; AKwUvBwOAEnReIqJ272dxWexgjVmzhS71Uivslmvu3mXFIcWivWXFkd+RjWzH518ceqmQYKvQXOpElNICu9DAHs=@vger.kernel.org
X-Gm-Message-State: AFuF++mc7xKEuD++NviEHE82S+ARxgiUorUWM+jX9c/FPpwMEHfD/Ry2
	eWwaTxQhfO7bkA7YNj1PaBk4ErKla3MNHSKdeZqxO3yGdFEYem+WBznuJfNaYA==
X-Gm-Gg: AYBFou1r50flJ30m0mnowOg0Y/A/XolIxe2vvyrIYVzcHgvpOfxasCJON7ZaIVs/7ey
	VV/NzBZh3+rz13RR0axR4xOfwUB0K7OK5y/GoPbTZ64rn1rDg/liscj9FrqlhpPdJLJsWJ81mIl
	mVRrh/l9izQVL2H2Rn7aY11kJW9t7APTl1VCRV5U9NVuUKilVbI9otyZ51jbaGoe+DjM8JuXk7x
	nCdHA+1IsIGwHr4QTnAl2VhSpJzFTEAOyK6kYzjiOX//VsAKQxDYkQwmoE0jemkrrM5XIB2juz8
	ErZw7MC1YdnSEzUpMwcwOPZc9u2GOkUP36ICy5Bj7FTTZM4T+pVdqZoqP1qKn+Jjyb3ct+LyGUc
	WlanKFt6k09Kmp0aIq11CkEZQwzJh8g7gwv36yRqXg5KR+5CN1OwePp1EB4lzON/xX9bj4YJVcb
	NzX9a1EV1aL8Wup/YlHIJXqu1AgQUg522prmGKicSDm97+zS4/TQAQueRmU2iooGARL8fMjFnaL
	fzI
X-Received: by 2002:a05:6000:1882:b0:485:8313:9f43 with SMTP id ffacd0b85a97d-485872b86b9mr27640631f8f.25.1788808145100;
        Mon, 07 Sep 2026 12:09:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm33365544f8f.33.2026.09.07.12.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:09:04 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 2/3] wifi: rtw88: usb: only let the frames a dozing station needs use the after-DTIM queue
Date: Mon,  7 Sep 2026 21:09:00 +0200
Message-ID: <20260907190901.1056945-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907190901.1056945-1-mehmet.fide@gmail.com>
References: <20260907190901.1056945-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

With the budget in place the high queue can no longer take the chip
down, but ordinary chatter still competes with the frames a sleeping
station actually needs. mac80211 marks every broadcast and multicast
frame with IEEE80211_TX_CTL_SEND_AFTER_DTIM while a station dozes,
mDNS and SSDP included, so under normal traffic the budget is spent on
frames nobody waits for.

Do what the vendor driver does with its default "allow special" high
queue filter: admit only ARP, EAPOL and DHCP to the after-DTIM path,
the frames a station coming out of power save has to see; everything
else goes out on its access category queue at line rate. The frames
are classified the way rtw89_core_tx_btc_spec_pkt_notify() does it,
from skb->protocol and the network and transport header offsets that
mac80211 keeps from the netdev path; EAPOL is the control port flag.
Frames the AP relays between its own stations arrive as ETH_P_802_3
and are not inspected, they leave on the access category queue.

With the filter in place the page pool stays at 1803 through the same
180 second storm, a DHCP flood still takes the after-DTIM path (and is
then held by the budget), and join/ping cycling without power save is
unchanged (10/10).

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
- classify from skb->protocol, ip_hdr() and udp_hdr() like
  rtw89_core_tx_btc_spec_pkt_notify(), EAPOL from the control port flag;
  the SNAP/IV parser and linux/unaligned.h are gone (Ping-Ke)
- <linux/*> includes in alphabetical order (Ping-Ke)
- relayed (ETH_P_802_3) frames documented as not inspected

 drivers/net/wireless/realtek/rtw88/usb.c | 26 ++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 5482e44f4a88..473b63d16658 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -2,9 +2,11 @@
 /* Copyright(c) 2018-2019  Realtek Corporation
  */
 
+#include <linux/ip.h>
 #include <linux/module.h>
-#include <linux/usb.h>
 #include <linux/mutex.h>
+#include <linux/udp.h>
+#include <linux/usb.h>
 #include "main.h"
 #include "debug.h"
 #include "mac.h"
@@ -562,6 +564,26 @@ static int rtw_usb_write_data_h2c(struct rtw_dev *rtwdev, u8 *buf, u32 size)
 	return rtw_usb_write_data(rtwdev, &pkt_info, buf);
 }
 
+static bool rtw_usb_bmc_needs_dtim(struct sk_buff *skb)
+{
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct udphdr *udphdr;
+
+	if (info->control.flags & IEEE80211_TX_CTRL_PORT_CTRL_PROTO)
+		return true;
+
+	if (skb->protocol == htons(ETH_P_ARP))
+		return true;
+
+	if (skb->protocol != htons(ETH_P_IP) ||
+	    ip_hdr(skb)->protocol != IPPROTO_UDP)
+		return false;
+
+	udphdr = udp_hdr(skb);
+
+	return udphdr->dest == htons(67) || udphdr->dest == htons(68);
+}
+
 #define RTW_USB_HIQ_REFILL_INTERVAL	(HZ / 10)	/* jiffies per unit of budget */
 #define RTW_USB_HIQ_BUDGET_MAX		16
 
@@ -604,7 +626,7 @@ static u8 rtw_usb_tx_queue_mapping_to_qsel(struct rtw_usb *rtwusb,
 	else if (is_broadcast_ether_addr(hdr->addr1) ||
 		 is_multicast_ether_addr(hdr->addr1))
 		qsel = (info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM) &&
-		       rtw_usb_hiq_take_budget(rtwusb) ?
+		       rtw_usb_bmc_needs_dtim(skb) && rtw_usb_hiq_take_budget(rtwusb) ?
 		       TX_DESC_QSEL_HIGH : skb->priority;
 	else if (skb_get_queue_mapping(skb) <= IEEE80211_AC_BK)
 		qsel = skb->priority;
-- 
2.55.0

