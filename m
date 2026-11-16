Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813620;
	b=Lo2C7lNZ80WQqSABT2N0DzDaW25mC8RYwMeZHC/01arHfHj0LmvZ8LYcfEl3PRb2lS5f
	 Dg8PQw23ewjuWOAPoqBT7nkEDgBzFGOYxXc5Fzf/20w9zpjaYsCKgvKwfXKl7PJYO77RT
	 DpZ52CzCsYpYK0h//0qXn8BfuIEGDM6/FGlVmzaRPm3I0rphDiUhR/7wVRsf5aW8yFO/S
	 jkurwxLjF7R56WRDfXx5vitfJUGKp6ayUFuq1W7IdCRdJLvuriCvXNI5Av+aONDrEn4Le
	 0xLEq45YNLeaGpPaRzH47Sh0dlc6h1u02E96QnzSd9LzFCUuggeTQPEnW+MP90fZnVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CIz7ndvsyCbyZH1g3tFJ/ivm98WOfmiEiM1uFEhXtY4=;
	b=IyPXEMmHgjQwg4zz1CsZ4Fqfcb3/qt1BhjMFy5Sz3nvyv+BqO1vywhLmYVc0vmyjZ8eG
	 SHqEqeo7F9ietyHWaPOsoaq6/IT9aB3zXM77H/3C3e6EB3ibx1J2F8R9bfpxpejtmgd9x
	 BSBgy23zO8CH++20s8xldlDv5zZVQJ7pe181sFHP68jUdRbalV1J/4y4Ee2H+Wc0ML3N8
	 dS9Eh1sPmwSZm6SthlVVg/QHbj9iReI5ukeRP2nInxTH2y3FX8xX3LFCoci5L3CaCpSfv
	 fC5JtuL5kgV/CpLY37MuY1G4MSdBS4fRB6Lf41ckJuVJNYyNNKeRyBmkPlSucKKZntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L/oWxr9t";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1F606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E1F606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L/oWxr9t
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18020575e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813619; x=1795418419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIz7ndvsyCbyZH1g3tFJ/ivm98WOfmiEiM1uFEhXtY4=;
        b=L/oWxr9tjvuL2Yp32Shj9PCOiIar/2DY8yCtKcTm7hA96hMDTMNSt6gaUfEfVN7k2A
         cHOsDrz4l45bl/dRM91b9rkgKJXHAcyUjssKdxetIF7A/DCuQ+ww9JtM4LIoOGP5uFmf
         K5JVVr6YInoqn+6S2HZfykI1lu+1/+EURakGvTu1mc5dSVmjxWpA4D7KoFj4vqS98WIK
         mudIDDQLs8G/sZBIMCR6f5pMOmQICsahmQvXJv1o8K46RUTvBEnAYCKZoZE3+01J1DQf
         hxgKCJBc6rP5y3j7nlUkwg0qbIXVvd+zsLSQ4ijn/zmI6U9raCuzGhfNNkbB280zm8yO
         yMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813619; x=1795418419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIz7ndvsyCbyZH1g3tFJ/ivm98WOfmiEiM1uFEhXtY4=;
        b=RsQq119uecoDDF3lmAznkdJIVXkzZ+0ZcaFaAQDHI6CoA5syve9zU0g7dLh3dgY4cL
         S30YxIQUKEKlacBcG9UgVP9F3FFNAD0FcsD6WKRIc1rMtuexSMD/hG2op0ZHRwe62K17
         xKzo69pvUYaR1XvWemDTM82Xbx066Ev8WHsSra9V4eBD/Sp7XgiluJVwXYUlLG9snZFw
         xvjUVR0a4aEsIc1L6L/NQfc4Ic3fDITXmWNlTvGq7EFOZpUmVdztl7AVarlBB1CMTAxj
         cOD++S2P3QGqX9bVSsfu0gmsywxHMD/XLmZmomKLcsrJr3gaJd3WiNpxKUVKuUATjf2I
         q8fQ==
X-Forwarded-Encrypted: i=1; AL+hErEUMvFtiiKTrihHz0uaFS62sXz3nLcMxrQPM5wbSwRLy6ljKyNh1bl5OWuBFghn//MOlTtuFZZp27esRKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VJdteRD559GAjFmJXBBSBWUn57xfVhqJDwZR3TZ06LOckF4Pu
	60MZntV3GWOvQif1+BqKC9AC7tjvwJfU1IgO/IIfTtEUXPGUbyq9yfKY
X-Gm-Gg: AYBFou2cxWjipQEeosT31BHTdUKOaJBGgIorqDB2NzjvW3A/Saqv75lT+0usmHNbTYg
	mpN0fSu/9gITfOoCxpbKrkKvgOkSFQmCPCU4TlW5zGA4bckhIe6oe/Y1kZL8QUe5kubHPstHdXE
	LLqggLNX//ud8KEMtjmcGMSiySTJh006DviR5eM6/mbBhOQVWiyo7Oj09WoDBTczDwSRUrWOLH1
	TTv5imG0aKYZr01fpsQWfAoMZPUHk/fvHZ0+S4gF1JhqFnFrpkZSfYUe5AJzLCrv9ko+0AQ9dPW
	+4G3pKmNkJaI6OizwYaEfwnr9jnDvMlYk7/fC0AOJmZMeZJwJrK5Xd4GlY2Vjbab3TaJRLf9AK+
	dPVQDWLRQuMjyX0ohJOBx4FegFA5ypjWPTHU8EUv/AoHXGKAUyxgCIB8KXLdDEeYIYlfZpi0iAL
	HZ4i61AhZAf0rcpc0wct+yfRkggSfxCLkq3j+4ER4/xbmasuriyVeHbrzr1qj0fYUuFqi5p/Bbe
	ZDIbcyC62cI5UOkSDE7e/FEUVcUWdXSJjp2EjW5fLugyZdw1Sp+N8iio4F7/rZ/cQHHtaSpH6Lp
	SGDPjru55oM9s8CoA23uqsSPBGJ7z3rQn8U=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr228474695e9.0.1794813618803;
        Sun, 15 Nov 2026 23:20:18 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:18 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 2/3] wifi: rtw88: report the frames purged from the TX report queue
Date: Mon, 16 Nov 2026 08:20:13 +0100
Message-ID: <20261116072014.1142494-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116072014.1142494-1-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A frame whose sender asked for its TX status waits in the TX report
queue for the report of the firmware. When no report comes, the purge
timer frees the frames with skb_queue_purge(), and rtw_core_deinit()
does the same. mac80211 is not told: the sender gets no status, and the
copy mac80211 keeps for the status of a frame from user space stays in
its list until ieee80211_free_hw() warns about it. On an RTL8822CE with
hostapd, after a firmware crash and an unbind of the driver:

rtw88_8822ce 0000:01:00.0: failed to get tx report from firmware
[...]
Have pending ack frames!
WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211], CPU#1: sh/24725
Call trace:
 ieee80211_free_ack_frame+0x4c/0x70 [mac80211] (P)
 idr_for_each+0x6c/0xf4
 ieee80211_free_hw+0x30/0x8c [mac80211]
 rtw_pci_remove+0xd8/0xf0 [rtw88_pci]
 pci_device_remove+0x44/0xd4

Take the frames off the queue under its lock and hand them to
ieee80211_purge_tx_queue(), which reports each one as not sent.

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
---

Notes:
    v2: Reviewed-by Luka Gejak, no change

 drivers/net/wireless/realtek/rtw88/main.c |  5 +----
 drivers/net/wireless/realtek/rtw88/tx.c   | 20 ++++++++++++++++----
 drivers/net/wireless/realtek/rtw88/tx.h   |  1 +
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index adc54b063382..ce65a1a80840 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2225,7 +2225,6 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 	struct rtw_fw_state *fw = &rtwdev->fw;
 	struct rtw_fw_state *wow_fw = &rtwdev->wow_fw;
 	struct rtw_rsvd_page *rsvd_pkt, *tmp;
-	unsigned long flags;
 
 	rtw_wait_firmware_completion(rtwdev);
 
@@ -2237,9 +2236,7 @@ void rtw_core_deinit(struct rtw_dev *rtwdev)
 
 	destroy_workqueue(rtwdev->tx_wq);
 	timer_delete_sync(&rtwdev->tx_report.purge_timer);
-	spin_lock_irqsave(&rtwdev->tx_report.q_lock, flags);
-	skb_queue_purge(&rtwdev->tx_report.queue);
-	spin_unlock_irqrestore(&rtwdev->tx_report.q_lock, flags);
+	rtw_tx_report_purge(rtwdev);
 	skb_queue_purge(&rtwdev->coex.queue);
 	skb_queue_purge(&rtwdev->c2h_queue);
 
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index 701ed7c4f3f7..87d993282b1c 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -176,21 +176,33 @@ static void rtw_tx_report_enable(struct rtw_dev *rtwdev,
 	pkt_info->report = true;
 }
 
+void rtw_tx_report_purge(struct rtw_dev *rtwdev)
+{
+	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
+	struct sk_buff_head purge;
+	unsigned long flags;
+
+	__skb_queue_head_init(&purge);
+
+	spin_lock_irqsave(&tx_report->q_lock, flags);
+	skb_queue_splice_init(&tx_report->queue, &purge);
+	spin_unlock_irqrestore(&tx_report->q_lock, flags);
+
+	ieee80211_purge_tx_queue(rtwdev->hw, &purge);
+}
+
 void rtw_tx_report_purge_timer(struct timer_list *t)
 {
 	struct rtw_dev *rtwdev = timer_container_of(rtwdev, t,
 						    tx_report.purge_timer);
 	struct rtw_tx_report *tx_report = &rtwdev->tx_report;
-	unsigned long flags;
 
 	if (skb_queue_len(&tx_report->queue) == 0)
 		return;
 
 	rtw_warn(rtwdev, "failed to get tx report from firmware\n");
 
-	spin_lock_irqsave(&tx_report->q_lock, flags);
-	skb_queue_purge(&tx_report->queue);
-	spin_unlock_irqrestore(&tx_report->q_lock, flags);
+	rtw_tx_report_purge(rtwdev);
 }
 
 void rtw_tx_report_enqueue(struct rtw_dev *rtwdev, struct sk_buff *skb, u8 sn)
diff --git a/drivers/net/wireless/realtek/rtw88/tx.h b/drivers/net/wireless/realtek/rtw88/tx.h
index 168f48e87853..363f63525965 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.h
+++ b/drivers/net/wireless/realtek/rtw88/tx.h
@@ -98,6 +98,7 @@ void rtw_tx_pkt_info_update(struct rtw_dev *rtwdev,
 			    struct sk_buff *skb);
 void rtw_tx_fill_tx_desc(struct rtw_dev *rtwdev,
 			 struct rtw_tx_pkt_info *pkt_info, struct sk_buff *skb);
+void rtw_tx_report_purge(struct rtw_dev *rtwdev);
 void rtw_tx_report_enqueue(struct rtw_dev *rtwdev, struct sk_buff *skb, u8 sn);
 void rtw_tx_report_handle(struct rtw_dev *rtwdev, struct sk_buff *skb, int src);
 void rtw_tx_rsvd_page_pkt_info_update(struct rtw_dev *rtwdev,
-- 
2.56.0

