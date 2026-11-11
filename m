Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432765;
	b=SNy2zfGGoCEec255XDUg74efVIrCN6Lluo5K5zTATN++gitvS0aUat1XnvIJvqiZrL0n
	 MOAkeMp0bwzsDuwC+8cJnY+FsY5RnAOj2KBKXJYkuZT332D1CcP9IfZvHRLCV71j+icKC
	 CGxLbsBzo4BrqU7A3GK0YwOAJX4/Rs9KoUdRIS9eqZTP7kBKmBkzfuJbUPuKHsOJrzisk
	 5kmPUVlOJG75rb4qG1U2QxV4OXkb1HlIQPtOLY12qg+u7uVZf+6AOkXHz1yW8IQ8b8ksc
	 z+BikQ/ajJQqLe0nXRQZ5qa8wmtaaSHkPeCaGZiSwSe/mofU26vA9Tk77IerfTt21fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=87NKZpw8mCYgvP8eMOLFpOmcZM1ld6VOImSFhCZ5SZQ=;
	b=mBT7Y+hsEZbP5pdf5Wg28w5opY+7qSvXoFR3Y6i685KlE2Xk8ekr7MNBLjQ/xYsqSTFh
	 Uhlmn9jp/EHn4TAnpoQQ8nn7H5spSMiQqK6dcmTTE/2IPn3PtK1Vh0fBuclUIoamyeU+I
	 Vw4Vr7/6RSgokytPTdN79Bp1wdZUX8/YfJzdS5x5ENezePa2bU1srZeoizDBtK668Z8U5
	 r5+s2rk2P/7D3ffax8p2XM/zjCrn87UM7oOJe10Evz23PfdscNt8TLUwws7O82zdpDblo
	 /CYCpMb0oDKud7NkiD+0Z7pYO8YmgN0tdqvxfhEXZEOOWV05QR00y0MllAwTOF9KPwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxiGn7m4;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9708F606A8A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9708F606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxiGn7m4
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so21462875e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432764; x=1795037564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87NKZpw8mCYgvP8eMOLFpOmcZM1ld6VOImSFhCZ5SZQ=;
        b=MxiGn7m4LINkt9RgVRCtFxPVxOWtAUL9LpRtenJCmXtkn16kx784mBx3jgLM6TmPEE
         Bn6g3ntusSeESK/Wvy+T2MQ+IT4iRb/TsY4hgqvAmwtv4GR1jygNa27gjk/xAkTw3E6F
         RNS6hssS7xomSJzjUDMJ4yMkac6CB9vPHdpXktMC1NyQFuWNCe0wAM8+TZLCXERIR8qK
         uRTzLSHG8oM0Sd8PP3tq5k6KR+2lTaatRG/0XIqyiNFEsAXTbHlj66Vd45kmUp/39Uqt
         lMPJuD8MxDHCa7RtfW4RurCGTKozjXjqBcvxdL9tvDI4Yq4L1oQ86Y99DiWXBlnrMq1H
         i+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432764; x=1795037564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=87NKZpw8mCYgvP8eMOLFpOmcZM1ld6VOImSFhCZ5SZQ=;
        b=O7aNmCZYrZ+uKVL0zWowf1v4gwepER7eKtivdOHREbsmzrP7XMNrUiWccp2A8kYsTc
         tnzRriCBeiQlrS85g9MEsJwdQ/y0Y4nf47ZljQmOfm1fCiCNzapZA4MIOM+JPu3byMEv
         ShGGsx+KsFnAofCwUjB+Dn8avjne4AUpwhrAmfwHKwJPOPdsAlwdb7l2DJyHJTnC7tYV
         9s3DZtPkVWECiptINR/owhptu2HfSkE8gDAEobqy0kOFiWzWfYPp774czJgEKSzQbFjW
         Lu45CWhT1UcD+wam5rMVvPihH1eg2M0I+3BEey7F38UKhs7JeJSvc65fBTpSQM1hrNSN
         /7eQ==
X-Forwarded-Encrypted: i=1; AL+hErE5wX3iuCoPdM8AGHAjciGUB0Rp40By3IUJtBZJrc0wvxLxjTjzA3rNdSWlUNtBsW+MnxCiBwwEUppS5TM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IawGMxtenFrLuHpdVkQbM8JcuOOh0pY9mcI24GqYccinNfm8L
	6ViP8WrV2Z7BlThE6OWobA/nwbfp+mR0YDmfAfDkqzICDQTODkE4ZtpN
X-Gm-Gg: AYBFou22FBADlGhDvzYI4rp8NTFyC7bWO81BsRuNdl7W9cGRoUM9NBvSllu++E1UsEk
	cG4c0QcPUlmSHHUvZM10iYfP2R1kkhBDcXwgrDFtdESQuDofzajA6SCevCW0TWRptiui/3pzxwi
	ljLWoAsJkb1iJptQN2PKD3fJGAgZSz0jiwGl4aYm7jmAV/ANMsXtGJFfOdFZNMwGCXjIAhQ8XeF
	MZC80IFpkvuyktz8dOvo5evsLaFZLGYV6JJfOD88/CMLJfR9ymZXtUtrwblw7Wuxa9/2pIxL+3e
	DO/JdiSvNgYHe9GhWZcaoupqrVPTvUL/MYr/Aw13/uHDoWaXYxjkgE1Tn/ma1g4isd2u2ltydHT
	ypLz1Mh4ipQvmsynErOcwmYfDVrs/enS5F0g6Qqinq3/USCN2gfGbQtM6uDX6EcHCNo9IvzpLIC
	mLy72u7Qxkn2sgLUnigOJa4szAfrK9Gpohcgobb6GmTxZ4yyHIIMrOuLVJHQRJ1VTjrf+8SV3N4
	zdGI1v3A4i+pyij7MCR5ORWgo4K47155jzft9AZzQO3R1M87Qasiz7BfH6llR+svM3OYzllTHVS
	lfCwasBYLDwwACqc3zomBRiKPtZZzUz7nuA=
X-Received: by 2002:a05:600c:620c:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ba093ab877mr61489955e9.27.1794432763829;
        Wed, 11 Nov 2026 13:32:43 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba095200c4sm36726845e9.2.2026.11.11.13.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:32:43 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next 2/3] wifi: rtw88: report the frames purged from the TX report queue
Date: Wed, 11 Nov 2026 22:32:38 +0100
Message-ID: <20261111213239.569224-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111213239.569224-1-mehmet.fide@gmail.com>
References: <20261111213239.569224-1-mehmet.fide@gmail.com>
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
---
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

