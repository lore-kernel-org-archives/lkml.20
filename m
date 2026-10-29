Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254179;
	b=Yfaq0EEZBcg6FwPO6Km2sUa1Lby507qU9dliZoDyYnnHQrm85mxI46asfxYvvDVIAfsr
	 BPwkc4nyBm8rrW25yRumqlnXiHc+KY/4DgC/EZTQphmRAM8v/Jpop8+mlJ8ZtsjcZd7Cq
	 vSbiVPaXqPFnTewGPlcoBP2Y+PnscfJJr7yfKylu/3IiqN6uX5unhPjfrLZedd4weQ+Jm
	 Eyf0EgWiyLQlJxcUsIt0QEBEDHuaKOcx6a/HAjmsZ/urMq1R57puhIS7BA6dJg0TdQPQv
	 yTnE4gefmaKvHh99AzB3f1iTE4WZtSKs7a01LjtRsLzLkfXgA//6ArJBxAkDWjUvfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T6/N8Sdo415avv22xbVSdAnDJryYd8Tk8nbP0Dlim1M=;
	b=q+P42n23QGWXnb+3tLA6SHMACqFkuy/rByuuhYMjhzsBWb7l0sKKTW3MqjBn1WfBPRx3
	 65YTeh7ai8/NSmvfkMDzWIO1iN6BwASbnBQmbpiVqm9kXmr5jLcpynXHeDiG7AVPDEHHV
	 9PUmcSOSeSc9rNlIMveCegxe6puvWU8W0I2xuns28BoePq9cGPneIGnsyYtTT3BeOJbkz
	 fW5OPR2Q3FO/RV7s62agHHDa4iqXQ0MecdTfKftSA53vvoiflZpJighxAOk7Iu/6wHdMr
	 jbZfiXkfTQNm5uiBtZzSVa8jSXB7EdbzWWagC23t7Ue30tOxUMCsW8AVrV1cN4B+Ctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkawrUEV;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01162606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01162606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkawrUEV
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso854629a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793254177; x=1793858977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T6/N8Sdo415avv22xbVSdAnDJryYd8Tk8nbP0Dlim1M=;
        b=AkawrUEV4fnKBbg7X0/iyZreUp2uxkbyYheAYid/ZVeFDG7BNHBlCbVEh+nFRECJuX
         CFyA+vDKLRr1F7xGR0J/1Qc94druxWe8POaeqUctnGKelaGL0Ax+PCZsq381XjNBFTLo
         3gUgRinQh9GrBcyf6QxACh5fjlm5/CJ/CGV081JNwuYKTUvyK6T3j1IxA2mcJJuVOLE7
         OCnJ2EgiEazE8QvelotJvj9h5MeFumDq7b8HXZ7dU2SbYL1grSEc3MRwH54UxJNEdHpH
         CKs29fnQDeVevjgEi8MMtV5U0WBIRCxgsTV13gqHyuBorvLEaMNYFYcezEhdrOFu3TbU
         i14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254177; x=1793858977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T6/N8Sdo415avv22xbVSdAnDJryYd8Tk8nbP0Dlim1M=;
        b=UElLnhkw4URkK2RCNq7IMSAezntd3ShLkmAoj9qpDryEvybQD8uShpBmCo6OK0Ygga
         8phiHIAELvAO9B1CiUzfBOb+f/Zr5QoFac2DK0l3mQhxYt7uGYhNoDvuAMigjqlT0cKW
         XriDBBQaI8h8UGE6PcOEntvgsHeQd1G8Kb0QvvkbTT5fS7UEu0zTAeyjdxxRencDmAsY
         rvBtcqzZqJUosWm+7tB19wK6BzYRfw+IcVe882qT9ipfpy7rLKGy9vIZm5GoPLQdrMsM
         VXCR+tVO5KTwG8ChUdmQwDSC1ZabZwxtiaiKPWgDBV4Zf4Vi9vYNvyi2ob+W7F9ZnYA5
         0L0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmIvmjkY35R44GpfBVwcudc0461o99O6HybrRnYp3ZAWEkURep1lIHFrdRuotSQ95SRLf0Yzr3DEKOc2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0B8omm3yKoWorkP5Ul2R6JPYSiWasJj8Z5DRUVeqQtlZBmONM
	RPuD9BE1YHcczB/gR0hYv2aAQgpqO94EfK/LrsQrbDb4vHHe3+0+UH+veQVT6zcw
X-Gm-Gg: AYBFou27PfMMyVVSLMaSOa821q7O6oeTab3ZIDCEe0uHzU5ONGwN18xjLZjlAVWGPsG
	DGaHHFBeV5XXytCGGOW/qMDGIjwp4sQDtqRGDKzpYEl3t/VDmKHdMJxDrXnd3APh1IEt8BvS6mo
	MHuczQvBlzirHe+XutoXRX6SI79B/OvnYgx+yWvsTXovjMNtx+8vDtsW/FuNGjrZ2CF5w9h4C3q
	5vduDSaqWMC9OzPlcSMbdI+M6di1a9E7GXr2abef9jnzXuwo2stmMR4pCJC2LvrgdivJkyb2Pxw
	ecfcQwru8WnFF8eWb2DC4nMIG1MVOaD4Keamu/bJH3JGpHlQkSbZTx/x7gCoouZz7U4iF+p2eUL
	9wcl9baJRTqIVIR335JOxnUdVK0dSSFf6AfEC6POZAzfig5Wo1BZhX9jNaF1gvX+myw6N+Ie1YG
	xgBLST8gW8x7aQhf8yZGv4A3TRnawL7OMNTM6tLDKT8+7zLOXEiLuofE5zt7xPWW5IrGEt26kDh
	YkPgc/a7oxb5DUokVp/jrQ5WLm2uDkovCc/lq1avQzgflz2E4k7VIR3TSLammkhghnOxqQzNFAj
	G1tAGvyN7joZ97pIV5gkDYOAqcmSKKffg0kWTPnki5xIM6hQ2+7QbjYxLySTwGOD8GlvkOgsHqK
	WaDGs
X-Received: by 2002:a17:90b:510f:b0:3ac:7378:be04 with SMTP id 98e67ed59e1d1-3ae57ba6c8emr3359982a91.0.1793254177241;
        Wed, 28 Oct 2026 23:09:37 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83a4f1sm2697459a91.12.2026.10.28.23.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:09:36 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] wifi: rtw88: allow driver-owned TX buffers to bypass mac80211 TX status
Date: Thu, 29 Oct 2026 14:08:56 +0800
Message-ID: <20261029060859.90002-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029060859.90002-1-hjf3108@gmail.com>
References: <20261029060859.90002-1-hjf3108@gmail.com>
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

Add a flag so that the driver can flag certain frames that
skip reporting back to mac80211. This is used for driver
generated frames that aren't a TX from mac80211.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.h | 1 +
 drivers/net/wireless/realtek/rtw88/pci.c  | 6 ++++++
 drivers/net/wireless/realtek/rtw88/pci.h  | 1 +
 drivers/net/wireless/realtek/rtw88/sdio.c | 6 ++++++
 drivers/net/wireless/realtek/rtw88/sdio.h | 1 +
 drivers/net/wireless/realtek/rtw88/usb.c  | 6 ++++++
 drivers/net/wireless/realtek/rtw88/usb.h  | 1 +
 7 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index d59f6e323adf0..7bd2e224e845b 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -637,6 +637,7 @@ struct rtw_tx_pkt_info {
 	u8 hw_ssn_sel;
 	bool nav_use_hdr;
 	bool bt_null;
+	bool drv_frame;
 };
 
 struct rtw_rx_pkt_stat {
diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f514447..5f6df521e9c16 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -848,6 +848,7 @@ static int rtw_pci_tx_write_data(struct rtw_dev *rtwdev,
 	tx_data = rtw_pci_get_tx_data(skb);
 	tx_data->dma = dma;
 	tx_data->sn = pkt_info->sn;
+	tx_data->drv_frame = pkt_info->drv_frame;
 
 	spin_lock_bh(&rtwpci->irq_lock);
 
@@ -992,6 +993,11 @@ static void rtw_pci_tx_isr(struct rtw_dev *rtwdev, struct rtw_pci *rtwpci,
 
 		skb_pull(skb, rtwdev->chip->tx_pkt_desc_sz);
 
+		if (tx_data->drv_frame) {
+			dev_kfree_skb_irq(skb);
+			continue;
+		}
+
 		info = IEEE80211_SKB_CB(skb);
 
 		/* enqueue to wait for tx report */
diff --git a/drivers/net/wireless/realtek/rtw88/pci.h b/drivers/net/wireless/realtek/rtw88/pci.h
index 8ffdea11378f0..37d90caf8269c 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.h
+++ b/drivers/net/wireless/realtek/rtw88/pci.h
@@ -171,6 +171,7 @@ struct rtw_pci_tx_buffer_desc {
 struct rtw_pci_tx_data {
 	dma_addr_t dma;
 	u8 sn;
+	bool drv_frame;
 };
 
 struct rtw_pci_ring {
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.c b/drivers/net/wireless/realtek/rtw88/sdio.c
index dc2fd0f8f9fff..6666aa5245d70 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.c
+++ b/drivers/net/wireless/realtek/rtw88/sdio.c
@@ -1312,6 +1312,7 @@ static int rtw_sdio_tx_write(struct rtw_dev *rtwdev,
 
 	tx_data = rtw_sdio_get_tx_data(skb);
 	tx_data->sn = pkt_info->sn;
+	tx_data->drv_frame = pkt_info->drv_frame;
 
 	/* The TX worker may already have freed the skb, so do not touch it. */
 	skb_queue_tail(&rtwsdio->tx_queue[queue], skb);
@@ -1604,6 +1605,11 @@ static void rtw_sdio_indicate_tx_status(struct rtw_dev *rtwdev,
 
 	skb_pull(skb, rtwdev->chip->tx_pkt_desc_sz);
 
+	if (tx_data->drv_frame) {
+		dev_kfree_skb_any(skb);
+		return;
+	}
+
 	/* enqueue to wait for tx report */
 	if (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS) {
 		rtw_tx_report_enqueue(rtwdev, skb, tx_data->sn);
diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
index 6e7e6009744b0..19852077326a4 100644
--- a/drivers/net/wireless/realtek/rtw88/sdio.h
+++ b/drivers/net/wireless/realtek/rtw88/sdio.h
@@ -153,6 +153,7 @@ struct sdio_device_id;
 
 struct rtw_sdio_tx_data {
 	u8 sn;
+	bool drv_frame;
 };
 
 struct rtw_sdio_work_data {
diff --git a/drivers/net/wireless/realtek/rtw88/usb.c b/drivers/net/wireless/realtek/rtw88/usb.c
index 715a2ce342d92..f03b00e517576 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.c
+++ b/drivers/net/wireless/realtek/rtw88/usb.c
@@ -342,6 +342,11 @@ static void rtw_usb_write_port_tx_complete(struct urb *urb)
 
 		skb_pull(skb, rtwdev->chip->tx_pkt_desc_sz);
 
+		if (tx_data->drv_frame) {
+			dev_kfree_skb_any(skb);
+			continue;
+		}
+
 		/* enqueue to wait for tx report */
 		if (info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS) {
 			rtw_tx_report_enqueue(rtwdev, skb, tx_data->sn);
@@ -655,6 +660,7 @@ static int rtw_usb_tx_write(struct rtw_dev *rtwdev,
 	rtw_tx_fill_txdesc_checksum(rtwdev, pkt_info, skb->data);
 	tx_data = rtw_usb_get_tx_data(skb);
 	tx_data->sn = pkt_info->sn;
+	tx_data->drv_frame = pkt_info->drv_frame;
 
 	skb_queue_tail(&rtwusb->tx_queue[ep], skb);
 
diff --git a/drivers/net/wireless/realtek/rtw88/usb.h b/drivers/net/wireless/realtek/rtw88/usb.h
index 94ff21dd08463..e861e9a66ab22 100644
--- a/drivers/net/wireless/realtek/rtw88/usb.h
+++ b/drivers/net/wireless/realtek/rtw88/usb.h
@@ -59,6 +59,7 @@ struct rx_usb_ctrl_block {
 
 struct rtw_usb_tx_data {
 	u8 sn;
+	bool drv_frame;
 };
 
 struct rtw_usb {
-- 
2.55.0

