Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E8325726
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345716; cv=none; b=h6kjlMRV8a+f12GoFXNTn3FZqbs9WMCF0YJifoBee+ud08jT8RnpiOQXH3e6BjyiF78nzKf67muHSIMD1ale6rhK9pehcwilztu/6sYUXhF44VH+WNO9qYPhkz0QMItKY6yorG8011TFluu7+XwhjHzCX0MlFxiyYnkrHBD/qfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345716; c=relaxed/simple;
	bh=BM4UT3u7PBt1754sfAEsrFjRExntkck5ge2S0m6jB7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nmcs30sXMf3s0IAF+slhKdFQhiSwKV2TOQFA7t9761FYaQrpySWl4cX+NEFPvnqgpFwDj4DdMR9HzQi9flHH1JPkxa8j5BC3RVnKmlvPqGcx2awlcQ1Isv/QudMoGYW3Y73zs1PuYhOFeCNtlg/QCTe2o7riyqDhL+JCUDSm2AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPBdRGKf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPBdRGKf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48436216a98so579513f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788345710; x=1788950510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umCfMh2mdI5/NHdu5isq5L/FcWDog22dq3L2ilcBjkQ=;
        b=qPBdRGKfkegEP0VSFNC+ZTi9COFZffAyd8k6jbvJAJKRm2xLlHsE6DFtxCM4eZJkxD
         mq7U7DZa46kgvNJgLXkOPqaaS9SUlG8Jrc7CTeWee9PZ4yG8/Rq4tcJg3YlRRFw7B1HJ
         piu/dryhDSo7HEU7k7Dxkj605yjkJ4nnGKXI4LPDZ2nbveWBSh8zzr1hgctVeeLnMfqO
         Idtmk/nkyVCz9DmEWyFI6yib5HmMaDJC86jXYWR/XuiSzSRK6eOJudwF0q8a0pRo8SBo
         P6EcO3eblchVdVKpbnb89lkHorfB16US7ukCy/sI+9uKarqYswifE2Os9YRJdB+dqez1
         dL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345710; x=1788950510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=umCfMh2mdI5/NHdu5isq5L/FcWDog22dq3L2ilcBjkQ=;
        b=SQQ22yUp6sbJC2feiAullhs580FvdfzuWfbcdFwJ7ZpbnMDI+cIrKE8qqZX8/xCmLO
         djX7IRRbggsOV1QP1iMZ6pto43G/MSANy4vovRydOu2wqyiTz6BRSgoaYISn2VwyuZuf
         EyMyrK7COHyvnE6/2aIipWaXzcep3wpwYccZKCnyHIudAK826slrkcfsRUNjZUnLRX51
         3jIfcz+MS+zIkqWZgEhdQNOtZ58sosyCsavFeqFHmB/S8FFkZEqiG34BzK1GxF2ZoLW+
         7ddtm/GFegvNlbn/Tebm//OiFEV9ghqeav4fUon+97SH+rxoMyk8A6Nr4UtZJbYQkXai
         qYfw==
X-Forwarded-Encrypted: i=1; AKwUvBzNhEOU336pGhcdGB5n/WTmR3QCGqHWGkR+jgU8krya+K0nEa7TDHgGQB/vVyQ5TH0HqpNPOQmb+q/4eY0=@vger.kernel.org
X-Gm-Message-State: AFuF++lMUzdnmfSMSG8bTYksEPkhA9wac4gPNxUuVi8KwGaFeR3v73yZ
	nczCljQx5TskK3fLQJVcwfP9eFmt8Gpq3DBxeNYPGra3/Q/smgUKnMi5
X-Gm-Gg: AYBFou0Nb8qtklQLtQYY1yty15QhYQoEl59qKGxgNyI3jmC0ZAZjA83pp+yhuDA+CEP
	Vc2O676A7uXjT/y104FmFJQ99F2nZA6IwyevLW4gBfdNsvw+jSVgOvhdPiwkwUlKNtEAUhkh+n3
	v7OumYwVFOfUnT6vl8J9x3oCfbfecpCmPI9vlgRLr2MRHX4EhzAfpc4ZFXIhZLhHkgEt7nRn1qt
	Y0e2cRyYjbXO3nogYgTWfUZ2GHjipiIpcTu1TCMpL7K6qX3gliKoDQG+J+ie489kA5BbhjmDaGm
	J7pBfxqcMNcbnYD20rggETegnC1S1KqsC2DmEDg1bCqWhUf++uwFHwuoPnL5G9VTATcWISwwtbo
	sSNBxrSCcjKKF/DYwbE/tbvTw3vRHE3F38BKblItcf1bYEM7ZH8PRp+9ONO1XdMKY4VQKwtUp3J
	fNVfRIucFKYKF9YGQRy4EFxnRP6pU+4CfWq2k5F4mwYAcJty9wgtB4kNtvEDl1O2fyK1mf7imRn
	GgTyQ==
X-Received: by 2002:a5d:5d88:0:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-48488efe615mr7477305f8f.1.1788345709797;
        Wed, 02 Sep 2026 03:41:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm5998947f8f.1.2026.09.02.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:41:49 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH rtw-next 2/2] wifi: rtw88: usb: only let the frames a dozing station needs use the after-DTIM queue
Date: Wed,  2 Sep 2026 12:41:46 +0200
Message-ID: <20260902104146.3853102-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902104146.3853102-1-mehmet.fide@gmail.com>
References: <20260902104146.3853102-1-mehmet.fide@gmail.com>
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
else goes out on its access category queue at line rate. Encrypted
group frames carry the IV between the header and the SNAP header, so
the parser accounts for hw_key->iv_len. With the filter in place the
page pool stays at 1803 through the same 180 second storm, a DHCP
flood still takes the after-DTIM path (and is then held by the budget),
and join/ping cycling without power save is unchanged (10/10).

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/realtek/rtw88/usb.c | 42 +++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 80965e5ea778..dd65b304b2c7 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -5,6 +5,9 @@
 #include <linux/module.h>
 #include <linux/usb.h>
 #include <linux/mutex.h>
+#include <linux/ip.h>
+#include <linux/udp.h>
+#include <linux/unaligned.h>
 #include "main.h"
 #include "debug.h"
 #include "mac.h"
@@ -562,6 +565,43 @@ static int rtw_usb_write_data_h2c(struct rtw_dev *rtwdev, u8 *buf, u32 size)
 	return rtw_usb_write_data(rtwdev, &pkt_info, buf);
 }
 
+static bool rtw_usb_bmc_needs_dtim(struct sk_buff *skb)
+{
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	unsigned int hdrlen = ieee80211_hdrlen(hdr->frame_control);
+	unsigned int paylen = sizeof(rfc1042_header) + sizeof(__be16);
+	const struct udphdr *udp;
+	const struct iphdr *ip;
+	const u8 *snap;
+	__be16 proto;
+
+	if (info->control.hw_key)
+		hdrlen += info->control.hw_key->iv_len;
+
+	if (skb->len < hdrlen + paylen)
+		return false;
+
+	snap = skb->data + hdrlen;
+	proto = get_unaligned((__be16 *)(snap + sizeof(rfc1042_header)));
+
+	if (proto == htons(ETH_P_ARP) || proto == htons(ETH_P_PAE))
+		return true;
+
+	if (proto != htons(ETH_P_IP) || skb->len < hdrlen + paylen + sizeof(*ip))
+		return false;
+
+	ip = (const struct iphdr *)(snap + paylen);
+	if (ip->protocol != IPPROTO_UDP)
+		return false;
+
+	udp = (const struct udphdr *)((const u8 *)ip + ip->ihl * 4);
+	if (skb->len < (unsigned int)((const u8 *)udp - skb->data) + sizeof(*udp))
+		return false;
+
+	return udp->dest == htons(67) || udp->dest == htons(68);
+}
+
 #define RTW_USB_HIQ_RATE	10
 #define RTW_USB_HIQ_BURST	16
 
@@ -605,7 +645,7 @@ static u8 rtw_usb_tx_queue_mapping_to_qsel(struct rtw_usb *rtwusb,
 	else if (is_broadcast_ether_addr(hdr->addr1) ||
 		 is_multicast_ether_addr(hdr->addr1))
 		qsel = (info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM) &&
-		       rtw_usb_hiq_take(rtwusb) ?
+		       rtw_usb_bmc_needs_dtim(skb) && rtw_usb_hiq_take(rtwusb) ?
 		       TX_DESC_QSEL_HIGH : skb->priority;
 	else if (skb_get_queue_mapping(skb) <= IEEE80211_AC_BK)
 		qsel = skb->priority;
-- 
2.54.0

